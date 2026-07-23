'use client';

import React, { useEffect, useState } from 'react';
import toast from 'react-hot-toast';
import { customFetch } from '@/lib/fetch';
import { API } from '@/lib/api';

const DOCU_MIND_URL = process.env.NEXT_PUBLIC_DOCU_MIND_URL || 'http://localhost:3001';
const LAWFIRM_APP_URL = process.env.NEXT_PUBLIC_LAWFIRM_APP_URL || '';

function getOrigin(value: string) {
  try {
    return new URL(value).origin;
  } catch {
    return '';
  }
}

interface DocuMindIntegrationProps {
  caseId: string;
  initialDraftUrl?: string | null;
}

export function DocuMindIntegration({ caseId, initialDraftUrl }: DocuMindIntegrationProps) {
  const [isSaving, setIsSaving] = useState(false);
  const [isLoading, setIsLoading] = useState(false);
  const iframeRef = React.useRef<HTMLIFrameElement>(null);
  const docuMindOrigin = getOrigin(DOCU_MIND_URL);
  const lawfirmOrigin = typeof window !== 'undefined' ? window.location.origin : getOrigin(LAWFIRM_APP_URL);
  const iframeSrc = `${DOCU_MIND_URL}?caseId=${encodeURIComponent(caseId)}${
    lawfirmOrigin ? `&parentOrigin=${encodeURIComponent(lawfirmOrigin)}` : ''
  }`;

  const handleIframeLoad = async () => {
    if (iframeRef.current) {
      try {
        let fetchUrl = initialDraftUrl;

        // Auto-fetch latest if no specific URL was provided
        if (!fetchUrl) {
          const caseDocsRes = await customFetch(API.DOCUMENTS.BY_CASE(caseId));
          if (caseDocsRes.ok) {
            const data = await caseDocsRes.json();
            const docs = Array.isArray(data) ? data : (data.results || []);
            const latestDraft = docs
              .filter((d: any) => d.document_type === 'Drafting' && d.document?.endsWith('.json'))
              .sort((a: any, b: any) => new Date(b.created_at || 0).getTime() - new Date(a.created_at || 0).getTime())[0];
            
            if (latestDraft && latestDraft.document) {
              fetchUrl = latestDraft.document;
            }
          }
        }

        if (fetchUrl) {
          setIsLoading(true);
          toast.loading('Loading draft into editor...', { id: 'documind-load' });
          
          const response = await fetch(fetchUrl);
          const blob = await response.blob();
          
          iframeRef.current.contentWindow?.postMessage({
            type: 'DOCU_MIND_LOAD',
            blob,
            format: 'json'
          }, docuMindOrigin || '*');
          
          toast.success('Draft loaded!', { id: 'documind-load' });
        }
      } catch (error) {
        toast.error('Failed to load draft.', { id: 'documind-load' });
        console.error(error);
      } finally {
        setIsLoading(false);
      }
    }
  };

  useEffect(() => {
    const handleMessage = async (event: MessageEvent) => {
      if (docuMindOrigin && event.origin !== docuMindOrigin) return;

      const { type, format, blob, filename } = event.data || {};
      
      if (type === 'DOCU_MIND_EXPORT' && blob) {
        try {
          setIsSaving(true);
          toast.loading(`Saving ${filename || 'document'} to case...`, { id: 'documind-save' });

          const formData = new FormData();
          formData.append('case', caseId);
          formData.append('document', blob, filename || `draft.${format || 'pdf'}`);
          formData.append('title', filename ? filename.replace(/\.[^/.]+$/, "") : 'Docu Mind Draft');
          formData.append('document_type', 'drafting');

          const response = await customFetch(API.DOCUMENTS.LIST, {
            method: 'POST',
            body: formData,
          });

          if (response.ok) {
            toast.success(`Successfully saved ${filename || 'document'}!`, { id: 'documind-save' });
          } else {
            const error = await response.json();
            toast.error(`Failed to save: ${error.detail || 'Unknown error'}`, { id: 'documind-save' });
          }
        } catch (error) {
          toast.error('An error occurred while saving the document.', { id: 'documind-save' });
          console.error(error);
        } finally {
          setIsSaving(false);
        }
      }
    };

    window.addEventListener('message', handleMessage);
    return () => window.removeEventListener('message', handleMessage);
  }, [caseId, docuMindOrigin]);

  return (
    <div className="w-full relative overflow-hidden rounded-xl border border-gray-200 shadow-sm bg-white" style={{ height: '800px' }}>
      {(isSaving || isLoading) && (
        <div className="absolute inset-0 bg-white/70 backdrop-blur-sm z-50 flex items-center justify-center">
          <div className="flex flex-col items-center gap-3">
            <div className="w-8 h-8 border-4 border-purple-600 border-t-transparent rounded-full animate-spin"></div>
            <p className="text-sm font-medium text-gray-700">
              {isSaving ? 'Syncing to Lawfirm Database...' : 'Loading your draft...'}
            </p>
          </div>
        </div>
      )}
      <iframe
        key={caseId}
        ref={iframeRef}
        onLoad={handleIframeLoad}
        src={iframeSrc}
        className="w-full h-full border-0"
        title="Docu Mind Editor"
        sandbox="allow-scripts allow-same-origin allow-downloads allow-forms allow-popups"
      />
    </div>
  );
}
