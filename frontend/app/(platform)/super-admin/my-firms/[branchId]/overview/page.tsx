'use client';

import { use, useEffect, useState, useRef } from 'react';
import {
  UserPlus, Shield, MapPin, Phone, Mail, Hash,
  Loader2, X, Search, Check, Building2, ChevronDown,
  CheckCircle2, AlertCircle, AlertTriangle, Pencil
} from 'lucide-react';
import { customFetch } from '@/lib/fetch';
import { API } from '@/lib/api';
import { toast } from 'react-hot-toast';

// --- Types ---
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

// --- Helpers ---
function getAdminBranch(admin: AdminUser): string | null {
  if (admin.available_firms && admin.available_firms.length > 0) {
    const assigned = admin.available_firms.find(f => f.branch !== null);
    if (assigned) return assigned.branch_name || assigned.branch || null;
  }
  if (admin.branch) return admin.branch_name || admin.branch;
  return null;
}

// --- Smart Admin Dropdown ---
function AdminPickerDropdown({
  value,
  onChange,
  admins,
  loading,
  currentBranchId,
}: {
  value: string;
  onChange: (id: string) => void;
  admins: AdminUser[];
  loading: boolean;
  currentBranchId: string;
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
        className="w-full flex items-center justify-between px-4 py-3 border border-gray-200 rounded-xl bg-white text-sm font-semibold text-gray-700 hover:border-[#311042] transition-all focus:outline-none focus:ring-2 focus:ring-purple-100"
      >
        {selected ? (
          <div className="flex items-center gap-2">
            <div className="w-7 h-7 rounded-full bg-purple-100 text-purple-800 flex items-center justify-center text-xs font-bold shrink-0">
              {selected.first_name[0]}{selected.last_name[0]}
            </div>
            <span className="text-gray-900 font-semibold">{selected.first_name} {selected.last_name}</span>
            <span className="text-xs text-gray-400 truncate hidden sm:block">{selected.email}</span>
          </div>
        ) : (
          <span className="text-gray-400 font-medium">Search and select an admin...</span>
        )}
        <ChevronDown className={`w-4 h-4 text-gray-400 ml-2 shrink-0 transition-transform ${open ? 'rotate-180' : ''}`} />
      </button>

      {open && (
        <div className="absolute z-50 w-full mt-2 bg-white rounded-xl border border-gray-200 shadow-2xl overflow-hidden">
          {/* Search */}
          <div className="p-3 border-b border-gray-100 sticky top-0 bg-white">
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

          {/* Clear option */}
          {value && (
            <button
              type="button"
              onClick={() => { onChange(''); setOpen(false); }}
              className="w-full flex items-center gap-2 px-4 py-2.5 text-sm text-gray-500 hover:bg-gray-50 border-b border-gray-100"
            >
              <X className="w-4 h-4" /> Clear selection
            </button>
          )}

          {/* List */}
          <div className="max-h-64 overflow-y-auto">
            {loading ? (
              <div className="flex items-center justify-center py-8 gap-2 text-gray-400">
                <Loader2 className="w-4 h-4 animate-spin" />
                <span className="text-sm">Loading admins...</span>
              </div>
            ) : filtered.length === 0 ? (
              <div className="py-8 text-center text-sm text-gray-400">
                {search ? `No admins found for "${search}"` : 'No admin users available'}
              </div>
            ) : (
              filtered.map(admin => {
                const branchAssigned = getAdminBranch(admin);
                // Check if admin is already assigned to THIS branch
                const isAssignedToThisBranch = admin.available_firms?.some(f => f.branch === currentBranchId)
                  || admin.branch === currentBranchId;
                const isAssignedElsewhere = !isAssignedToThisBranch && !!branchAssigned;
                const isDisabled = isAssignedElsewhere;
                const isSelected = admin.id === value;

                return (
                  <button
                    key={admin.id}
                    type="button"
                    disabled={isDisabled}
                    onClick={() => {
                      if (!isDisabled) { onChange(admin.id); setOpen(false); }
                    }}
                    title={isAssignedElsewhere ? `Already assigned to: ${branchAssigned}` : undefined}
                    className={`w-full flex items-center gap-3 px-4 py-3 text-left transition-all ${
                      isDisabled
                        ? 'opacity-50 cursor-not-allowed bg-gray-50/50'
                        : isSelected
                        ? 'bg-purple-50'
                        : 'hover:bg-gray-50 cursor-pointer'
                    }`}
                  >
                    {/* Avatar */}
                    <div className={`w-9 h-9 rounded-full flex items-center justify-center text-xs font-bold shrink-0 ${
                      isAssignedToThisBranch ? 'bg-purple-100 text-purple-800'
                      : isSelected ? 'bg-purple-50 text-purple-700'
                      : 'bg-gray-100 text-gray-600'
                    }`}>
                      {admin.first_name[0]}{admin.last_name[0]}
                    </div>

                    {/* Info */}
                    <div className="flex-1 min-w-0">
                      <div className="flex items-center gap-1.5 flex-wrap">
                        <span className="text-sm font-semibold text-gray-900">
                          {admin.first_name} {admin.last_name}
                        </span>
                        {isAssignedToThisBranch && (
                          <span className="text-[10px] font-bold text-purple-700 bg-purple-50 border border-purple-100 px-1.5 py-0.5 rounded-full">
                            Current Branch
                          </span>
                        )}
                        {isSelected && !isAssignedToThisBranch && (
                          <CheckCircle2 className="w-3.5 h-3.5 text-purple-600" />
                        )}
                      </div>
                      <span className="text-xs text-gray-400 truncate block">{admin.email}</span>
                    </div>

                    {/* Branch Status Badge */}
                    <div className="shrink-0">
                      {isAssignedToThisBranch ? (
                        <div className="flex items-center gap-1 px-2 py-1 bg-purple-50 border border-purple-200 rounded-full">
                          <CheckCircle2 className="w-3 h-3 text-purple-600" />
                          <span className="text-[10px] font-bold text-purple-700">Assigned</span>
                        </div>
                      ) : isAssignedElsewhere ? (
                        <div className="flex items-center gap-1 px-2 py-1 bg-amber-50 border border-amber-200 rounded-full" title={`In: ${branchAssigned}`}>
                          <Building2 className="w-3 h-3 text-amber-600" />
                          <span className="text-[10px] font-bold text-amber-700 max-w-[70px] truncate">
                            {typeof branchAssigned === 'string' && branchAssigned.length > 7
                              ? `${branchAssigned.slice(0, 7)}...`
                              : branchAssigned}
                          </span>
                        </div>
                      ) : (
                        <div className="flex items-center gap-1 px-2 py-1 bg-emerald-50 border border-emerald-200 rounded-full">
                          <span className="text-[10px] font-bold text-emerald-700">Free</span>
                        </div>
                      )}
                    </div>
                  </button>
                );
              })
            )}
          </div>

          {/* Legend */}
          <div className="px-4 py-2.5 bg-gray-50 border-t border-gray-100 flex flex-wrap items-center gap-3 text-[10px] text-gray-500 font-medium">
            <span className="flex items-center gap-1"><CheckCircle2 className="w-3 h-3 text-purple-500" /> Assigned here</span>
            <span className="flex items-center gap-1"><Building2 className="w-3 h-3 text-amber-500" /> Another branch (cannot assign)</span>
            <span className="flex items-center gap-1 text-emerald-600">Free — available</span>
          </div>
        </div>
      )}
    </div>
  );
}


// --- Branch Overview Page ---
export default function BranchOverviewPage({ params }: { params: Promise<{ branchId: string }> }) {
  const { branchId } = use(params);
  const [branch, setBranch] = useState<any>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  const [admins, setAdmins] = useState<AdminUser[]>([]);
  const [branchAdmins, setBranchAdmins] = useState<AdminUser[]>([]);
  const [loadingAdmins, setLoadingAdmins] = useState(true);
  const [selectedAdminId, setSelectedAdminId] = useState('');
  const [assigning, setAssigning] = useState(false);
  const [assignError, setAssignError] = useState('');
  const [assignSuccess, setAssignSuccess] = useState('');
  const [showAssignPanel, setShowAssignPanel] = useState(false);

  // Fetch branch details
  useEffect(() => {
    const fetchBranch = async () => {
      try {
        setLoading(true);
        const response = await customFetch(API.FIRMS.BRANCHES.DETAIL(branchId));
        if (response.ok) setBranch(await response.json());
        else setError('Failed to load branch details.');
      } catch { setError('A network error occurred.'); }
      finally { setLoading(false); }
    };
    fetchBranch();
  }, [branchId]);

  // Fetch all firm admins + current branch admins
  const refreshAdmins = async () => {
    try {
      setLoadingAdmins(true);
      const [allRes, branchRes] = await Promise.all([
        customFetch(`${API.USERS.LIST}?user_type=admin&page_size=200`),
        customFetch(API.FIRMS.BRANCHES.ADMINS(branchId)),
      ]);
      if (allRes.ok) {
        const data = await allRes.json();
        setAdmins(data.results || data);
      }
      if (branchRes.ok) {
        const data = await branchRes.json();
        setBranchAdmins(data.admins || []);
      }
    } catch { console.error('Failed to load admins'); }
    finally { setLoadingAdmins(false); }
  };

  useEffect(() => { refreshAdmins(); }, [branchId]);

  const handleAssignAdmin = async () => {
    if (!selectedAdminId) return;
    const admin = admins.find(a => a.id === selectedAdminId);
    if (!admin) return;

    try {
      setAssigning(true);
      setAssignError('');
      setAssignSuccess('');

      // Use the dedicated branch assign_admin endpoint
      const response = await customFetch(API.FIRMS.BRANCHES.ASSIGN_ADMIN(branchId), {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ admin_id: selectedAdminId }),
      });

      const data = await response.json();

      if (response.ok) {
        setAssignSuccess(`${admin.first_name} ${admin.last_name} has been assigned as branch admin.`);
        toast.success(`${admin.first_name} assigned as branch admin!`);
        // Refresh everything
        await refreshAdmins();
        const branchRes = await customFetch(API.FIRMS.BRANCHES.DETAIL(branchId));
        if (branchRes.ok) setBranch(await branchRes.json());
        setSelectedAdminId('');
        setShowAssignPanel(false);
      } else {
        setAssignError(data.error || data.detail || 'Failed to assign admin.');
      }
    } catch { setAssignError('Network error occurred.'); }
    finally { setAssigning(false); }
  };

  // branchAdmins is now driven directly from the dedicated admins API

  if (loading) return (
    <div className="flex flex-col items-center justify-center p-20 bg-white rounded-xl border border-gray-200 shadow-sm">
      <Loader2 className="h-8 w-8 animate-spin text-[#311042]" />
      <p className="mt-4 text-sm text-gray-400 font-medium tracking-wide">Loading branch details...</p>
    </div>
  );

  if (error) return (
    <div className="p-12 text-center text-red-500 bg-red-50 rounded-2xl border border-red-100 shadow-sm">
      <p className="text-sm font-medium">{error}</p>
    </div>
  );

  return (
    <div className="space-y-6">
      {/* Top banner */}
      <div className="flex flex-col sm:flex-row justify-between sm:items-center bg-white p-6 rounded-2xl border border-gray-100 shadow-sm gap-4">
        <div>
          <h2 className="text-xl font-extrabold text-gray-900 tracking-tight">{branch?.branch_name || 'Branch Overview'}</h2>
          <p className="text-xs text-gray-500 mt-1 font-medium">Manage core details and administrative access for this location.</p>
        </div>
      </div>

      <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
        {/* Left: Branch Registry */}
        <div className="bg-white p-8 rounded-2xl border border-gray-100 shadow-sm col-span-1 md:col-span-2">
          <h3 className="text-sm font-bold text-[#984c1f] uppercase tracking-[0.1em] mb-6 flex items-center gap-2">
            <span className="w-1.5 h-4 bg-[#984c1f] rounded-full" />
            Branch Registry Details
          </h3>
          <div className="grid grid-cols-1 sm:grid-cols-2 gap-y-8 gap-x-12">
            <div className="col-span-full">
              <label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2 flex items-center gap-1.5">
                <MapPin className="w-3.5 h-3.5" /> Official Address
              </label>
              <div className="text-base text-gray-900 font-semibold leading-relaxed">
                {branch?.address || 'No street address provided'}<br />
                <span className="text-sm text-[#984c1f]/80">{branch?.city}, {branch?.state}</span>
              </div>
            </div>
            <div>
              <label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2 flex items-center gap-1.5">
                <Mail className="w-3.5 h-3.5" /> Professional Email
              </label>
              <span className="block text-base text-gray-900 font-semibold truncate bg-gray-50 p-2.5 rounded-lg border border-gray-100">
                {branch?.email || 'Not configured'}
              </span>
            </div>
            <div>
              <label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2 flex items-center gap-1.5">
                <Phone className="w-3.5 h-3.5" /> Direct Contact
              </label>
              <span className="block text-base text-gray-900 font-semibold bg-gray-50 p-2.5 rounded-lg border border-gray-100">
                {branch?.phone_number || 'Not provided'}
              </span>
            </div>
            <div>
              <label className="block text-[10px] font-bold text-gray-400 uppercase tracking-widest mb-2 flex items-center gap-1.5">
                <Hash className="w-3.5 h-3.5" /> Unique Identifier
              </label>
              <span className="block text-base font-mono text-[#984c1f] font-bold bg-[#984c1f]/5 p-2.5 rounded-lg border border-[#984c1f]/10">
                {branch?.branch_code || '---'}
              </span>
            </div>
          </div>
        </div>

        {/* Right: Status + Admin Panel */}
        <div className="space-y-6">
          {/* Operational Status */}
          <div className="bg-white p-6 rounded-2xl border border-gray-100 shadow-sm">
            <h3 className="text-sm font-bold text-gray-900 mb-4">Operational Status</h3>
            <div className={`flex items-center gap-4 p-4 rounded-xl border transition-all ${branch?.is_active
              ? 'bg-emerald-50/50 border-emerald-100 text-emerald-700'
              : 'bg-red-50/50 border-red-100 text-red-600'
            }`}>
              <div className={`w-3.5 h-3.5 rounded-full shrink-0 ${branch?.is_active ? 'bg-emerald-500 animate-pulse shadow-[0_0_8px_rgba(16,185,129,0.5)]' : 'bg-red-500'}`} />
              <div>
                <span className="block text-sm font-extrabold uppercase tracking-wide">{branch?.is_active ? 'Active' : 'Inactive'}</span>
                <span className="block text-[10px] opacity-70 font-bold mt-0.5">Firm Connectivity: Normal</span>
              </div>
            </div>
          </div>

          {/* Admin Management Card */}
          <div className="bg-white p-6 rounded-2xl border border-gray-100 shadow-sm">
            <div className="flex items-center justify-between mb-4">
              <h3 className="text-sm font-bold text-gray-900">Local Administration</h3>
              <button
                onClick={() => { setShowAssignPanel(p => !p); setAssignError(''); setAssignSuccess(''); }}
                className="flex items-center gap-1.5 text-xs font-bold text-[#311042] hover:bg-purple-50 px-2 py-1.5 rounded-lg transition-colors"
              >
                <Pencil className="w-3.5 h-3.5" />
                {showAssignPanel ? 'Cancel' : 'Manage'}
              </button>
            </div>

            {/* Current admins list */}
            <div className="space-y-2 mb-4">
              {branchAdmins.length > 0 ? (
                branchAdmins.map(admin => (
                  <div key={admin.id} className="flex items-center gap-3 p-3 bg-purple-50/50 rounded-lg border border-purple-100">
                    <div className="w-9 h-9 rounded-full bg-purple-100 text-purple-800 flex items-center justify-center text-xs font-bold shrink-0">
                      {admin.first_name[0]}{admin.last_name[0]}
                    </div>
                    <div className="min-w-0">
                      <span className="block text-xs font-bold text-gray-900 truncate">{admin.first_name} {admin.last_name}</span>
                      <span className="block text-[10px] text-gray-400 font-medium truncate">{admin.email}</span>
                    </div>
                    <CheckCircle2 className="w-4 h-4 text-purple-500 shrink-0 ml-auto" />
                  </div>
                ))
              ) : (
                <div className="flex items-center gap-3 p-3 bg-gray-50/50 rounded-lg border border-dashed border-gray-200">
                  <div className="w-9 h-9 rounded-full bg-white flex items-center justify-center border border-gray-200 shadow-sm shrink-0">
                    <Shield className="w-5 h-5 text-gray-300" />
                  </div>
                  <div>
                    <span className="block text-xs font-bold text-gray-400 italic">No assigned admins</span>
                    <span className="block text-[10px] text-gray-400 mt-0.5">Inheriting firm-level permissions</span>
                  </div>
                </div>
              )}
            </div>

            {/* Assign Panel */}
            {showAssignPanel && (
              <div className="border-t border-gray-100 pt-4 space-y-3">
                <p className="text-xs font-semibold text-gray-600">
                  Select an admin to assign to this branch. Admins already in another branch cannot be selected.
                </p>

                <AdminPickerDropdown
                  value={selectedAdminId}
                  onChange={setSelectedAdminId}
                  admins={admins}
                  loading={loadingAdmins}
                  currentBranchId={branchId}
                />

                {assignError && (
                  <div className="flex items-start gap-2 p-3 bg-red-50 border border-red-100 rounded-lg text-xs text-red-600 font-semibold">
                    <AlertTriangle className="w-4 h-4 shrink-0 mt-0.5" />
                    {assignError}
                  </div>
                )}

                {assignSuccess && (
                  <div className="flex items-center gap-2 p-3 bg-emerald-50 border border-emerald-100 rounded-lg text-xs text-emerald-700 font-semibold">
                    <CheckCircle2 className="w-4 h-4 shrink-0" />
                    {assignSuccess}
                  </div>
                )}

                <button
                  onClick={handleAssignAdmin}
                  disabled={!selectedAdminId || assigning}
                  className="w-full py-2.5 text-xs font-bold text-white bg-[#311042] rounded-xl hover:bg-[#461a5e] transition-colors flex items-center justify-center gap-2 disabled:opacity-50 disabled:cursor-not-allowed"
                >
                  {assigning ? <><Loader2 className="w-3.5 h-3.5 animate-spin" /> Assigning...</> : <><UserPlus className="w-3.5 h-3.5" /> Assign Selected Admin</>}
                </button>
              </div>
            )}
          </div>
        </div>
      </div>
    </div>
  );
}
