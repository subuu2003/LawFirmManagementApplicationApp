'use client';

import CaseAddForm from '@/components/platform/CaseAddForm';

export default function FirmAdminCaseNewPage() {
  return (
    <div className="space-y-6">
      <CaseAddForm redirectBase="/firm-admin/cases" />
    </div>
  );
}
