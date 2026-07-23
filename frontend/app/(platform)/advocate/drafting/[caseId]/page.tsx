import { DocuMindIntegration } from '@/components/platform/DocuMindIntegration';

export default function AdvocateDraftDetailPage({ params }: { params: { caseId: string } }) {
  return (
    <div className="space-y-6">
      <DocuMindIntegration caseId={params.caseId} />
    </div>
  );
}
