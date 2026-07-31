'use client';

import React, { useEffect, useState, useRef, useCallback } from 'react';
import toast from 'react-hot-toast';
import { Maximize2, Minimize2 } from 'lucide-react';
import { customFetch } from '@/lib/fetch';
import { API } from '@/lib/api';

function resolveDocuMindUrl() {
  if (process.env.NEXT_PUBLIC_DOCU_MIND_URL) {
    return process.env.NEXT_PUBLIC_DOCU_MIND_URL;
  }

  if (typeof window !== 'undefined') {
    const hostname = window.location.hostname;
    if (hostname === 'localhost' || hostname === '127.0.0.1') {
      return 'http://localhost:3001';
    }
  }

  return 'https://mindmap.diracai.com';
}

function resolveLawfirmAppUrl() {
  if (process.env.NEXT_PUBLIC_LAWFIRM_APP_URL) {
    return process.env.NEXT_PUBLIC_LAWFIRM_APP_URL;
  }

  if (typeof window !== 'undefined') {
    return window.location.origin;
  }

  return 'https://antlegal.anthemgt.com';
}

const DOCU_MIND_URL = resolveDocuMindUrl();
const LAWFIRM_APP_URL = resolveLawfirmAppUrl();

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
  const [isFullscreen, setIsFullscreen] = useState(false);
  const containerRef = useRef<HTMLDivElement>(null);
  const iframeRef = useRef<HTMLIFrameElement>(null);
  const docuMindOrigin = getOrigin(DOCU_MIND_URL);
  const lawfirmOrigin = typeof window !== 'undefined' ? window.location.origin : getOrigin(LAWFIRM_APP_URL);
  const iframeSrc = `${DOCU_MIND_URL}?caseId=${encodeURIComponent(caseId)}${
    lawfirmOrigin ? `&parentOrigin=${encodeURIComponent(lawfirmOrigin)}` : ''
  }`;

  const toggleFullscreen = useCallback(() => {
    setIsFullscreen((prev) => {
      const next = !prev;
      if (next) {
        if (containerRef.current?.requestFullscreen) {
          containerRef.current.requestFullscreen().catch(() => {});
        }
      } else {
        if (document.fullscreenElement && document.exitFullscreen) {
          document.exitFullscreen().catch(() => {});
        }
      }
      return next;
    });
  }, []);

  useEffect(() => {
    const handleFsChange = () => {
      setIsFullscreen(Boolean(document.fullscreenElement));
    };
    document.addEventListener('fullscreenchange', handleFsChange);
    return () => document.removeEventListener('fullscreenchange', handleFsChange);
  }, []);

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
              .filter((d: any) => d.document_type === 'drafting' && d.file_url?.endsWith('.json'))
              .sort((a: any, b: any) => new Date(b.uploaded_at || b.updated_at || 0).getTime() - new Date(a.uploaded_at || a.updated_at || 0).getTime())[0];
            
            if (latestDraft && latestDraft.file_url) {
              fetchUrl = latestDraft.file_url;
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
      
      if (type === 'DOCU_MIND_TOGGLE_FULLSCREEN') {
        toggleFullscreen();
      }

      if (type === 'DOCU_MIND_EXPORT' && blob) {
        try {
          setIsSaving(true);
          toast.loading(`Saving ${filename || 'document'} to case...`, { id: 'documind-save' });

          const formData = new FormData();
          formData.append('case', caseId);
          formData.append('document_file', blob, filename || `draft.${format || 'pdf'}`);
          formData.append('document_title', filename ? filename.replace(/\.[^/.]+$/, "") : 'Docu Mind Draft');
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
  }, [caseId, docuMindOrigin, toggleFullscreen]);

  return (
    <div
      ref={containerRef}
      className={
        isFullscreen
          ? 'fixed inset-0 z-[99999] w-screen h-screen bg-white overflow-hidden shadow-2xl flex flex-col'
          : 'w-full relative overflow-hidden rounded-xl border border-gray-200 shadow-sm bg-white'
      }
      style={isFullscreen ? { height: '100vh', width: '100vw' } : { height: '800px' }}
    >
      {/* Full Screen Toggle Control Button */}
      <div className="absolute top-3 right-4 z-[60] flex items-center gap-2">
        <button
          type="button"
          onClick={toggleFullscreen}
          className="flex items-center gap-1.5 px-3 py-1.5 rounded-lg bg-[#0e2340] hover:bg-[#1a3a60] text-white text-xs font-semibold backdrop-blur-md shadow-md transition-all border border-white/20 active:scale-95 cursor-pointer"
          title={isFullscreen ? 'Exit Full Screen (Esc)' : 'Expand to Full Screen'}
        >
          {isFullscreen ? (
            <>
              <Minimize2 className="w-3.5 h-3.5" />
              <span>Exit Full Screen</span>
            </>
          ) : (
            <>
              <Maximize2 className="w-3.5 h-3.5" />
              <span>Full Screen</span>
            </>
          )}
        </button>
      </div>

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
