'use client';

import CaseAddForm from '@/components/platform/CaseAddForm';

export default function AdvocateCaseNewPage() {
  return (
    <div className="space-y-6">
      <CaseAddForm redirectBase="/advocate/cases" />
    </div>
  );
}
