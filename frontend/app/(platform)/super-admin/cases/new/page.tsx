'use client';

import CaseAddForm from '@/components/platform/CaseAddForm';
import { useTopbarTitle } from '@/components/platform/TopbarContext';

export default function AddCasePage() {
  useTopbarTitle('Create New Case', 'Register a new matter and assign it to your team');

  return (
    <div className="space-y-6">
      <CaseAddForm />
    </div>
  );
}
