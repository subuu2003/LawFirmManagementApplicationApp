'use client';

import { useState, useEffect, useRef } from 'react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import {
  ArrowLeft, Save, Loader2, AlertCircle, Search,
  ChevronDown, X, Shield, CheckCircle2, Building2, User
} from 'lucide-react';
import { customFetch } from '@/lib/fetch';
import { API } from '@/lib/api';

// --- Admin Picker Dropdown ---
interface AdminUser {
  id: string;
  first_name: string;
  last_name: string;
  email: string;
  user_type: string;
  available_firms?: { branch: string | null; branch_name?: string }[];
  branch?: string | null;
  branch_name?: string | null;
}

function AdminPickerDropdown({
  value,
  onChange,
  admins,
  loading,
}: {
  value: string;
  onChange: (id: string) => void;
  admins: AdminUser[];
  loading: boolean;
}) {
  const [open, setOpen] = useState(false);
  const [search, setSearch] = useState('');
  const ref = useRef<HTMLDivElement>(null);

  useEffect(() => {
    const handler = (e: MouseEvent) => {
      if (ref.current && !ref.current.contains(e.target as Node)) setOpen(false);
    };
    document.addEventListener('mousedown', handler);
    return () => document.removeEventListener('mousedown', handler);
  }, []);

  const getAdminBranch = (admin: AdminUser): string | null => {
    // Check available_firms array first
    if (admin.available_firms && admin.available_firms.length > 0) {
      const assigned = admin.available_firms.find(f => f.branch !== null);
      if (assigned) return assigned.branch_name || assigned.branch || null;
    }
    // Fallback: direct branch field
    if (admin.branch) return admin.branch_name || admin.branch;
    return null;
  };

  const filtered = admins.filter(a => {
    const name = `${a.first_name} ${a.last_name}`.toLowerCase();
    const email = a.email.toLowerCase();
    const q = search.toLowerCase();
    return name.includes(q) || email.includes(q);
  });

  const selected = admins.find(a => a.id === value);

  return (
    <div ref={ref} className="relative">
      <button
        type="button"
        onClick={() => setOpen(o => !o)}
        className="w-full flex items-center justify-between px-4 py-2.5 border border-gray-200 rounded-lg bg-white text-sm font-semibold text-gray-700 hover:border-[#311042] transition-all focus:outline-none focus:ring-2 focus:ring-purple-100"
      >
        {selected ? (
          <div className="flex items-center gap-2">
            <div className="w-7 h-7 rounded-full bg-purple-100 text-purple-800 flex items-center justify-center text-xs font-bold">
              {selected.first_name[0]}{selected.last_name[0]}
            </div>
            <span className="text-gray-900">{selected.first_name} {selected.last_name}</span>
            <span className="text-xs text-gray-400 truncate max-w-[180px]">{selected.email}</span>
          </div>
        ) : (
          <span className="text-gray-400 font-medium">Select an admin (optional)</span>
        )}
        <ChevronDown className={`w-4 h-4 text-gray-400 transition-transform ${open ? 'rotate-180' : ''}`} />
      </button>

      {open && (
        <div className="absolute z-50 w-full mt-2 bg-white rounded-xl border border-gray-200 shadow-2xl overflow-hidden">
          {/* Search Bar */}
          <div className="p-3 border-b border-gray-100">
            <div className="flex items-center gap-2 px-3 py-2 bg-gray-50 rounded-lg border border-gray-200">
              <Search className="w-4 h-4 text-gray-400 shrink-0" />
              <input
                autoFocus
                type="text"
                placeholder="Search by name or email..."
                value={search}
                onChange={e => setSearch(e.target.value)}
                className="flex-1 text-sm bg-transparent outline-none text-gray-700 placeholder:text-gray-400"
              />
              {search && (
                <button type="button" onClick={() => setSearch('')}>
                  <X className="w-3.5 h-3.5 text-gray-400 hover:text-gray-600" />
                </button>
              )}
            </div>
          </div>

          {/* Option to clear selection */}
          {value && (
            <button
              type="button"
              onClick={() => { onChange(''); setOpen(false); }}
              className="w-full flex items-center gap-2 px-4 py-2.5 text-sm text-gray-500 hover:bg-gray-50 border-b border-gray-100"
            >
              <X className="w-4 h-4" /> Clear selection
            </button>
          )}

          {/* Admin List */}
          <div className="max-h-60 overflow-y-auto">
            {loading ? (
              <div className="flex items-center justify-center py-8 gap-2 text-gray-400">
                <Loader2 className="w-4 h-4 animate-spin" />
                <span className="text-sm">Loading admins...</span>
              </div>
            ) : filtered.length === 0 ? (
              <div className="py-8 text-center text-sm text-gray-400">
                No admins found matching "{search}"
              </div>
            ) : (
              filtered.map(admin => {
                const branchAssigned = getAdminBranch(admin);
                const isAlreadyAssigned = !!branchAssigned;
                const isSelected = admin.id === value;

                return (
                  <button
                    key={admin.id}
                    type="button"
                    disabled={isAlreadyAssigned}
                    onClick={() => {
                      if (!isAlreadyAssigned) {
                        onChange(admin.id);
                        setOpen(false);
                      }
                    }}
                    className={`w-full flex items-center gap-3 px-4 py-3 text-left transition-all group ${
                      isAlreadyAssigned
                        ? 'opacity-60 cursor-not-allowed bg-gray-50'
                        : isSelected
                        ? 'bg-purple-50 hover:bg-purple-50'
                        : 'hover:bg-gray-50 cursor-pointer'
                    }`}
                  >
                    {/* Avatar */}
                    <div className={`w-9 h-9 rounded-full flex items-center justify-center text-xs font-bold shrink-0 ${
                      isSelected ? 'bg-purple-100 text-purple-800' : 'bg-gray-100 text-gray-600'
                    }`}>
                      {admin.first_name[0]}{admin.last_name[0]}
                    </div>

                    {/* Info */}
                    <div className="flex-1 min-w-0">
                      <div className="flex items-center gap-1.5">
                        <span className="text-sm font-semibold text-gray-900 truncate">
                          {admin.first_name} {admin.last_name}
                        </span>
                        {isSelected && <CheckCircle2 className="w-4 h-4 text-purple-600 shrink-0" />}
                      </div>
                      <span className="text-xs text-gray-400 truncate block">{admin.email}</span>
                    </div>

                    {/* Branch badge */}
                    <div className="shrink-0">
                      {isAlreadyAssigned ? (
                        <div className="flex items-center gap-1 px-2 py-1 bg-amber-50 border border-amber-200 rounded-full">
                          <Building2 className="w-3 h-3 text-amber-600" />
                          <span className="text-[10px] font-bold text-amber-700 max-w-[100px] truncate">
                            {typeof branchAssigned === 'string' && branchAssigned.length > 8
                              ? `${branchAssigned.slice(0, 8)}...`
                              : branchAssigned}
                          </span>
                        </div>
                      ) : (
                        <div className="flex items-center gap-1 px-2 py-1 bg-emerald-50 border border-emerald-200 rounded-full">
                          <span className="text-[10px] font-bold text-emerald-700">Unassigned</span>
                        </div>
                      )}
                    </div>
                  </button>
                );
              })
            )}
          </div>

          {/* Legend */}
          <div className="px-4 py-2.5 bg-gray-50 border-t border-gray-100 flex items-center gap-4 text-[10px] text-gray-400 font-medium">
            <span className="flex items-center gap-1"><Building2 className="w-3 h-3 text-amber-500" /> Already assigned to a branch</span>
            <span className="flex items-center gap-1"><CheckCircle2 className="w-3 h-3 text-emerald-500" /> Available to assign</span>
          </div>
        </div>
      )}
    </div>
  );
}


// --- Main Page ---
export default function AddNewFirmPage() {
  const router = useRouter();
  const [loading, setLoading] = useState(false);
  const [fetchingFirm, setFetchingFirm] = useState(true);
  const [fetchingAdmins, setFetchingAdmins] = useState(true);
  const [firmId, setFirmId] = useState<string | null>(null);
  const [error, setError] = useState('');
  const [limitError, setLimitError] = useState<any>(null);
  const [admins, setAdmins] = useState<AdminUser[]>([]);
  const [selectedAdminId, setSelectedAdminId] = useState('');

  const [formData, setFormData] = useState({
    branch_name: '',
    branch_code: '',
    phone_number: '',
    email: '',
    address: '',
    city: '',
    state: '',
  });

  // Fetch firm + admins in parallel
  useEffect(() => {
    const fetchMyFirm = async () => {
      try {
        const response = await customFetch(API.FIRMS.LIST);
        if (response.ok) {
          const data = await response.json();
          const firms = data.results || data;
          if (Array.isArray(firms) && firms.length > 0) setFirmId(firms[0].id);
          else setError('Could not identify your firm. Please contact support.');
        } else {
          setError('Failed to load firm context.');
        }
      } catch {
        setError('An error occurred while loading your firm details.');
      } finally {
        setFetchingFirm(false);
      }
    };

    const fetchAdmins = async () => {
      try {
        const response = await customFetch(`${API.USERS.LIST}?user_type=admin&page_size=200`);
        if (response.ok) {
          const data = await response.json();
          setAdmins(data.results || data);
        }
      } catch {
        console.error('Failed to load admins');
      } finally {
        setFetchingAdmins(false);
      }
    };

    fetchMyFirm();
    fetchAdmins();
  }, []);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    if (!firmId) { setError('Firm association missing. Cannot create branch.'); return; }

    setLoading(true);
    setError('');
    setLimitError(null);

    try {
      // Step 1: Create the branch
      const response = await customFetch(API.FIRMS.BRANCHES.CREATE, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ ...formData, firm: firmId }),
      });

      if (!response.ok) {
        const data = await response.json();
        if (data.error && data.upgrade_message) setLimitError(data);
        else setError(data.error || data.detail || data.message || 'Failed to create branch.');
        return;
      }

      const branchData = await response.json();
      const newBranchId = branchData.id || branchData.uuid;

      // Step 2: If admin was selected, assign them via the dedicated endpoint
      if (selectedAdminId && newBranchId) {
        const assignRes = await customFetch(API.FIRMS.BRANCHES.ASSIGN_ADMIN(newBranchId), {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify({ admin_id: selectedAdminId }),
        });
        if (!assignRes.ok) {
          const assignData = await assignRes.json();
          // Branch was created but admin assignment failed — warn and still navigate
          console.warn('Admin assignment failed:', assignData.error || assignData.detail);
        }
      }

      router.push('/super-admin/my-firms');
    } catch {
      setError('A network error occurred.');
    } finally {
      setLoading(false);
    }
  };

  const updateField = (field: string, value: string) => {
    let finalValue = value;
    if (field === 'phone_number') finalValue = value.replace(/\D/g, '').slice(0, 10);
    setFormData(prev => ({ ...prev, [field]: finalValue }));
  };

  if (fetchingFirm) {
    return (
      <div className="p-16 flex flex-col items-center justify-center gap-3">
        <Loader2 className="w-8 h-8 text-[#311042] animate-spin" />
        <p className="text-sm text-gray-400 font-medium">Loading firm context...</p>
      </div>
    );
  }

  const inputClass = "w-full px-4 py-2.5 border border-gray-200 rounded-lg focus:outline-none focus:ring-2 focus:ring-purple-100 focus:border-[#311042] transition-all text-gray-900 font-medium placeholder:text-gray-400 text-sm";
  const labelClass = "block text-sm font-semibold text-gray-700 mb-2";

  return (
    <div className="p-6 max-w-3xl mx-auto">
      {/* Header */}
      <div className="mb-6 flex items-center gap-3">
        <Link href="/super-admin/my-firms" className="p-2 text-gray-400 hover:text-gray-600 hover:bg-gray-100 rounded-lg transition-colors">
          <ArrowLeft className="w-5 h-5" />
        </Link>
        <div>
          <h1 className="text-2xl font-bold text-gray-900">Add New Firm Branch</h1>
          <p className="text-gray-500 mt-1 text-sm">Fill in the details to create a new branch for your firm.</p>
        </div>
      </div>

      <div className="bg-white rounded-2xl border border-gray-200 shadow-sm p-8">
        <form onSubmit={handleSubmit} className="space-y-8">

          {/* Errors */}
          {error && (
            <div className="p-4 bg-red-50 border border-red-100 rounded-lg text-sm font-semibold text-red-600 flex items-center gap-2">
              <AlertCircle className="w-5 h-5 shrink-0" /> {error}
            </div>
          )}
          {limitError && (
            <div className="p-5 bg-amber-50 border border-amber-200 rounded-xl">
              <div className="flex items-start gap-3">
                <div className="p-2 bg-amber-100 text-amber-600 rounded-lg shrink-0 mt-0.5">
                  <AlertCircle className="w-5 h-5" />
                </div>
                <div>
                  <h3 className="text-base font-bold text-amber-900 mb-1">Subscription Limit Reached</h3>
                  <p className="text-sm font-medium text-amber-800 mb-4 leading-relaxed">{limitError.error}</p>
                  <div className="flex items-center flex-wrap gap-4 text-xs font-semibold text-amber-700 bg-amber-100/50 px-4 py-3 rounded-lg mb-4">
                    <div>Plan: <span className="uppercase font-bold text-amber-900">{limitError.subscription_type}</span></div>
                    <div className="w-1 h-1 bg-amber-300 rounded-full" />
                    <div>Limit: <span className="font-bold text-amber-900">{limitError.branch_limit}</span></div>
                    <div className="w-1 h-1 bg-amber-300 rounded-full" />
                    <div>Active: <span className="font-bold text-amber-900">{limitError.current_branches}</span></div>
                  </div>
                  <p className="text-sm font-medium text-amber-800 mb-4">{limitError.upgrade_message}</p>
                  <Link href="/super-admin/finance/subscriptions" className="inline-flex items-center gap-2 px-4 py-2.5 bg-amber-600 text-white text-sm font-bold rounded-lg hover:bg-amber-700 transition-colors shadow-sm">
                    Upgrade Subscription
                  </Link>
                </div>
              </div>
            </div>
          )}

          {/* Section: Branch Details */}
          <div>
            <h2 className="text-sm font-bold text-gray-900 uppercase tracking-widest mb-5 flex items-center gap-2">
              <Building2 className="w-4 h-4 text-[#311042]" /> Branch Details
            </h2>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
              <div>
                <label className={labelClass}>Branch Name <span className="text-red-500">*</span></label>
                <input type="text" required value={formData.branch_name} onChange={e => updateField('branch_name', e.target.value)} placeholder="e.g. Downtown Branch" className={inputClass} />
              </div>
              <div>
                <label className={labelClass}>Branch Code</label>
                <input type="text" value={formData.branch_code} onChange={e => updateField('branch_code', e.target.value)} placeholder="BR-001" className={inputClass} />
              </div>
              <div>
                <label className={labelClass}>City <span className="text-red-500">*</span></label>
                <input type="text" required value={formData.city} onChange={e => updateField('city', e.target.value)} placeholder="Bhubaneswar" className={inputClass} />
              </div>
              <div>
                <label className={labelClass}>State <span className="text-red-500">*</span></label>
                <input type="text" required value={formData.state} onChange={e => updateField('state', e.target.value)} placeholder="Odisha" className={inputClass} />
              </div>
              <div className="col-span-2">
                <label className={labelClass}>Address</label>
                <textarea value={formData.address} onChange={e => updateField('address', e.target.value)} placeholder="Full address of the new branch" rows={3} className={inputClass + ' resize-none'} />
              </div>
              <div>
                <label className={labelClass}>Branch Email</label>
                <input type="email" value={formData.email} onChange={e => updateField('email', e.target.value)} placeholder="branch@example.com" className={inputClass} />
              </div>
              <div>
                <label className={labelClass}>Contact Number</label>
                <input type="text" value={formData.phone_number} onChange={e => updateField('phone_number', e.target.value)} maxLength={10} placeholder="9876543210" className={inputClass} />
              </div>
            </div>
          </div>

          {/* Section: Branch Admin Assignment */}
          <div className="border-t border-gray-100 pt-6">
            <h2 className="text-sm font-bold text-gray-900 uppercase tracking-widest mb-1 flex items-center gap-2">
              <User className="w-4 h-4 text-[#311042]" /> Assign Branch Admin
            </h2>
            <p className="text-xs text-gray-500 mb-5">Optionally assign an existing admin user to manage this branch. Only unassigned admins can be selected.</p>

            <AdminPickerDropdown
              value={selectedAdminId}
              onChange={setSelectedAdminId}
              admins={admins}
              loading={fetchingAdmins}
            />

            {selectedAdminId && (
              <div className="mt-3 flex items-center gap-2 p-3 bg-emerald-50 border border-emerald-200 rounded-lg text-sm text-emerald-700 font-medium">
                <CheckCircle2 className="w-4 h-4 shrink-0" />
                This admin will be assigned to the new branch upon creation.
              </div>
            )}
          </div>

          {/* Actions */}
          <div className="pt-4 border-t border-gray-100 flex justify-end gap-3">
            <button type="button" onClick={() => router.back()} className="px-5 py-2.5 text-sm font-semibold text-gray-700 bg-white border border-gray-200 rounded-lg hover:bg-gray-50 transition-colors">
              Cancel
            </button>
            <button type="submit" disabled={loading} className="px-6 py-2.5 text-sm font-semibold text-white bg-[#311042] rounded-lg hover:bg-[#461a5e] transition-colors flex items-center gap-2 disabled:opacity-50 shadow-lg shadow-purple-900/10">
              {loading ? <Loader2 className="w-4 h-4 animate-spin" /> : <Save className="w-4 h-4" />}
              {loading ? 'Creating Branch...' : 'Save Branch'}
            </button>
          </div>
        </form>
      </div>
    </div>
  );
}
