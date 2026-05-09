'use client';

import { useState, useEffect } from 'react';
import Link from 'next/link';
import { useRouter } from 'next/navigation';
import { motion, AnimatePresence } from 'framer-motion';
import {
  Building2, Plus, Search, Filter, ChevronLeft, ChevronRight,
  Eye, X, MapPin, Phone, Mail, Hash, User, Loader2, Shield,
  CheckCircle2, AlertCircle
} from 'lucide-react';
import { customFetch } from '@/lib/fetch';
import { API } from '@/lib/api';
import { useTopbarTitle } from '@/components/platform/TopbarContext';

interface Branch {
  id: string;
  branch_name: string;
  branch_code?: string;
  address?: string;
  city?: string;
  state?: string;
  phone_number?: string;
  email?: string;
  is_active?: boolean;
  firm?: string;
  created_at?: string;
  admin_details?: { id: string; first_name: string; last_name: string; email: string } | null;
}

export default function MyFirmsPage() {
  useTopbarTitle('My Firm – Branches', 'Manage and configure your firm branches.');

  const router = useRouter();
  const [branches, setBranches] = useState<Branch[]>([]);
  const [loading, setLoading] = useState(true);
  const [count, setCount] = useState(0);
  const [currentPage, setCurrentPage] = useState(1);
  const [searchQuery, setSearchQuery] = useState('');
  const [activeFilter, setActiveFilter] = useState<'all' | 'active' | 'inactive'>('all');
  const [filterOpen, setFilterOpen] = useState(false);

  // Split-panel state
  const [viewMode, setViewMode] = useState<'full' | 'split'>('full');
  const [selectedBranch, setSelectedBranch] = useState<Branch | null>(null);
  const [branchAdmins, setBranchAdmins] = useState<any[]>([]);
  const [loadingDetail, setLoadingDetail] = useState(false);

  const fetchBranches = async (page = 1) => {
    setLoading(true);
    try {
      const res = await customFetch(`${API.FIRMS.BRANCHES.LIST}?page=${page}`);
      if (res.ok) {
        const data = await res.json();
        const list = Array.isArray(data) ? data : (data.results || []);
        setBranches(list);
        setCount(Array.isArray(data) ? list.length : (data.count || list.length));
      }
    } catch (e) {
      console.error(e);
    } finally {
      setLoading(false);
    }
  };

  const fetchBranchDetail = async (branch: Branch) => {
    setSelectedBranch(branch);
    setViewMode('split');
    setLoadingDetail(true);
    try {
      const res = await customFetch(API.FIRMS.BRANCHES.ADMINS(branch.id));
      if (res.ok) {
        const data = await res.json();
        setBranchAdmins(data.admins || []);
      }
    } catch (e) {
      console.error(e);
    } finally {
      setLoadingDetail(false);
    }
  };

  useEffect(() => { fetchBranches(currentPage); }, [currentPage]);

  const displayed = branches.filter(b => {
    const q = searchQuery.toLowerCase();
    const matchSearch = !q ||
      b.branch_name?.toLowerCase().includes(q) ||
      b.branch_code?.toLowerCase().includes(q) ||
      b.city?.toLowerCase().includes(q) ||
      b.email?.toLowerCase().includes(q);
    const matchFilter =
      activeFilter === 'all' ||
      (activeFilter === 'active' && b.is_active) ||
      (activeFilter === 'inactive' && !b.is_active);
    return matchSearch && matchFilter;
  });

  const applyFilter = (f: 'all' | 'active' | 'inactive') => {
    setActiveFilter(f);
    setFilterOpen(false);
    setSearchQuery('');
    setCurrentPage(1);
  };

  const StatusBadge = ({ active }: { active?: boolean }) => (
    <span className={`inline-flex items-center gap-1 text-[10px] font-bold px-2.5 py-1 rounded-lg uppercase tracking-wider ${active ? 'bg-emerald-100 text-emerald-700' : 'bg-red-100 text-red-600'
      }`}>
      {active ? 'Active' : 'Inactive'}
    </span>
  );

  return (
    <div className={`font-sans ${viewMode === 'split' ? 'h-[calc(100vh-64px)] overflow-hidden flex' : 'min-h-[calc(100vh-64px)] bg-[#fafafa] p-2 md:p-4 lg:p-1'}`}>

      {/* ── FULL MODE ── */}
      {viewMode === 'full' && (
        <div className="w-full max-w-[1600px] mx-auto h-[calc(100vh-120px)] flex flex-col">

          {/* Header */}
          <div className="shrink-0 flex flex-col md:flex-row justify-between items-start md:items-center gap-4 mb-3 px-2 pt-4">
            <div>
              <h2 className="text-2xl font-black text-slate-900 tracking-tight">Branch Directory</h2>
              <p className="text-sm font-semibold text-slate-400">Manage all branches of your firm</p>
            </div>
            <Link
              href="/super-admin/my-firms/new"
              className="flex items-center gap-2 px-6 py-3 bg-[#311042] text-white rounded-2xl font-black shadow-lg shadow-purple-900/20 hover:bg-[#461a5e] transition-all text-sm"
            >
              <Plus className="w-5 h-5" /> Add New Branch
            </Link>
          </div>

          {/* Card */}
          <div className="flex-1 min-h-0">
            <motion.div
              initial={{ opacity: 0, y: 20 }} animate={{ opacity: 1, y: 0 }}
              className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden flex flex-col h-full"
            >
              {/* Filter bar */}
              <div className="shrink-0 p-4 border-b border-slate-100 flex flex-wrap justify-between items-center gap-3 bg-slate-50/50">
                {/* Search */}
                <div className="relative w-full sm:w-64">
                  <Search className="w-4 h-4 absolute left-3 top-1/2 -translate-y-1/2 text-slate-400" />
                  <input
                    type="text"
                    placeholder="Search branches..."
                    value={searchQuery}
                    onChange={e => setSearchQuery(e.target.value)}
                    className="w-full pl-9 pr-4 py-2 bg-white border border-slate-200 rounded-xl text-sm text-slate-900 font-medium focus:outline-none focus:border-[#311042] shadow-sm placeholder:text-slate-400"
                  />
                </div>

                <div className="flex items-center gap-2 flex-wrap">
                  {activeFilter !== 'all' && (
                    <span className={`flex items-center gap-1.5 text-xs font-bold px-2.5 py-1.5 rounded-lg ${activeFilter === 'active' ? 'bg-emerald-100 text-emerald-700' : 'bg-red-100 text-red-700'}`}>
                      {activeFilter === 'active' ? 'Active' : 'Inactive'}
                      <button onClick={() => applyFilter('all')}><X className="w-3 h-3" /></button>
                    </span>
                  )}

                  {/* Filter dropdown */}
                  <div className="relative">
                    <button
                      onClick={() => setFilterOpen(p => !p)}
                      className={`flex items-center gap-1.5 px-3 py-2 border rounded-xl text-xs font-bold shadow-sm transition-all ${activeFilter !== 'all' ? 'bg-[#311042] text-white border-[#311042]' : 'bg-white border-slate-200 text-slate-700 hover:bg-slate-50'
                        }`}
                    >
                      <Filter className="w-3.5 h-3.5" /> Filter
                    </button>
                    <AnimatePresence>
                      {filterOpen && (
                        <motion.div
                          initial={{ opacity: 0, y: 6 }} animate={{ opacity: 1, y: 0 }} exit={{ opacity: 0, y: 6 }}
                          className="absolute right-0 top-full mt-2 w-44 bg-white border border-slate-200 rounded-xl shadow-xl z-50 overflow-hidden"
                        >
                          {([
                            { key: 'all', label: 'All Branches', dot: 'bg-slate-400' },
                            { key: 'active', label: 'Active', dot: 'bg-emerald-500' },
                            { key: 'inactive', label: 'Inactive', dot: 'bg-red-500' },
                          ] as const).map(opt => (
                            <button key={opt.key} onClick={() => applyFilter(opt.key)}
                              className={`w-full flex items-center gap-3 px-4 py-3 text-sm font-semibold text-left transition-colors ${activeFilter === opt.key ? 'bg-purple-50 text-[#311042]' : 'text-slate-700 hover:bg-slate-50'
                                }`}>
                              <span className={`w-2 h-2 rounded-full ${opt.dot}`} />{opt.label}
                            </button>
                          ))}
                        </motion.div>
                      )}
                    </AnimatePresence>
                  </div>

                  <div className="w-px h-5 bg-slate-200" />

                  {/* Pagination */}
                  <div className="flex items-center gap-1">
                    <button disabled={currentPage === 1 || loading} onClick={() => setCurrentPage(p => p - 1)}
                      className="p-1.5 border border-slate-200 rounded-lg hover:bg-slate-100 disabled:opacity-40 transition-all">
                      <ChevronLeft className="w-4 h-4 text-slate-600" />
                    </button>
                    <span className="px-2 text-xs font-bold text-slate-600">Page {currentPage}</span>
                    <button disabled={branches.length < 10 || loading} onClick={() => setCurrentPage(p => p + 1)}
                      className="p-1.5 border border-slate-200 rounded-lg hover:bg-slate-100 disabled:opacity-40 transition-all">
                      <ChevronRight className="w-4 h-4 text-slate-600" />
                    </button>
                  </div>
                  <span className="text-xs font-medium text-slate-400">{count} total</span>
                </div>
              </div>

              {/* Table */}
              <div className="flex-1 overflow-y-auto overflow-x-auto">
                <table className="w-full text-left border-collapse">
                  <thead className="sticky top-0 z-10">
                    <tr className="bg-slate-50 border-b border-slate-200">
                      <th className="py-4 px-6 text-xs font-bold text-slate-500 uppercase tracking-wider">Branch</th>
                      <th className="py-4 px-6 text-xs font-bold text-slate-500 uppercase tracking-wider">Code</th>
                      <th className="py-4 px-6 text-xs font-bold text-slate-500 uppercase tracking-wider">Location</th>
                      <th className="py-4 px-6 text-xs font-bold text-slate-500 uppercase tracking-wider">Contact</th>
                      <th className="py-4 px-6 text-xs font-bold text-slate-500 uppercase tracking-wider">Admin</th>
                      <th className="py-4 px-6 text-xs font-bold text-slate-500 uppercase tracking-wider text-center">Status</th>
                      <th className="py-4 px-6 text-xs font-bold text-slate-500 uppercase tracking-wider text-right">Actions</th>
                    </tr>
                  </thead>
                  <tbody className="divide-y divide-slate-100">
                    {loading ? (
                      [...Array(5)].map((_, i) => (
                        <tr key={i} className="animate-pulse">
                          {[...Array(7)].map((_, j) => (
                            <td key={j} className="p-6"><div className="h-4 bg-slate-100 rounded w-full" /></td>
                          ))}
                        </tr>
                      ))
                    ) : displayed.length === 0 ? (
                      <tr>
                        <td colSpan={7} className="py-20 text-center">
                          <Building2 className="w-12 h-12 text-slate-300 mx-auto mb-4" />
                          <p className="text-slate-500 font-bold">{searchQuery ? 'No branches match your search' : 'No branches found'}</p>
                          {!searchQuery && (
                            <Link href="/super-admin/my-firms/new"
                              className="mt-4 inline-flex items-center gap-2 px-4 py-2 bg-[#311042] text-white text-sm font-bold rounded-xl hover:bg-[#461a5e] transition-colors">
                              <Plus className="w-4 h-4" /> Add First Branch
                            </Link>
                          )}
                        </td>
                      </tr>
                    ) : displayed.map(branch => (
                      <tr key={branch.id} className="hover:bg-slate-50/50 transition-colors group">
                        <td className="py-4 px-6">
                          <div className="flex items-center gap-3">
                            <div className="w-9 h-9 rounded-xl bg-purple-50 flex items-center justify-center shrink-0">
                              <Building2 className="w-4 h-4 text-[#311042]" />
                            </div>
                            <span className="text-sm font-bold text-slate-900 group-hover:text-[#311042] transition-colors">
                              {branch.branch_name}
                            </span>
                          </div>
                        </td>
                        <td className="py-4 px-6">
                          <span className="text-xs font-mono font-bold text-[#311042] bg-purple-50 px-2 py-1 rounded-lg">
                            {branch.branch_code || '—'}
                          </span>
                        </td>
                        <td className="py-4 px-6">
                          <div className="flex items-center gap-1 text-sm text-slate-600 font-medium">
                            <MapPin className="w-3.5 h-3.5 text-slate-400 shrink-0" />
                            {[branch.city, branch.state].filter(Boolean).join(', ') || '—'}
                          </div>
                        </td>
                        <td className="py-4 px-6">
                          <div className="space-y-0.5">
                            {branch.email && (
                              <div className="flex items-center gap-1 text-xs text-slate-500 font-medium">
                                <Mail className="w-3 h-3" />{branch.email}
                              </div>
                            )}
                            {branch.phone_number && (
                              <div className="flex items-center gap-1 text-xs text-slate-500 font-medium">
                                <Phone className="w-3 h-3" />{branch.phone_number}
                              </div>
                            )}
                            {!branch.email && !branch.phone_number && <span className="text-xs text-slate-400">—</span>}
                          </div>
                        </td>
                        <td className="py-4 px-6">
                          {branch.admin_details ? (
                            <div className="flex items-center gap-2">
                              <div className="w-7 h-7 rounded-full bg-purple-100 text-purple-800 flex items-center justify-center text-[10px] font-bold shrink-0">
                                {branch.admin_details.first_name?.[0]}{branch.admin_details.last_name?.[0]}
                              </div>
                              <div>
                                <p className="text-xs font-bold text-slate-700">{branch.admin_details.first_name} {branch.admin_details.last_name}</p>
                                <p className="text-[10px] text-slate-400 truncate max-w-[120px]">{branch.admin_details.email}</p>
                              </div>
                            </div>
                          ) : (
                            <span className="flex items-center gap-1 text-xs text-slate-400 italic">
                              <Shield className="w-3.5 h-3.5" /> Unassigned
                            </span>
                          )}
                        </td>
                        <td className="py-4 px-6 text-center">
                          <StatusBadge active={branch.is_active} />
                        </td>
                        <td className="py-4 px-6 text-right">
                          <div className="flex items-center justify-end gap-2">
                            <button
                              onClick={() => fetchBranchDetail(branch)}
                              className="p-1.5 text-slate-400 hover:text-[#311042] hover:bg-purple-50 rounded-lg transition-colors"
                              title="Quick View"
                            >
                            </button>
                            <Link href={`/super-admin/my-firms/${branch.id}/overview`}>
                              <button className="flex items-center gap-1.5 px-3 py-1.5 text-xs font-bold text-[#311042] bg-purple-50 rounded-lg hover:bg-purple-100 transition-colors">
                                View
                              </button>
                            </Link>
                          </div>
                        </td>
                      </tr>
                    ))}
                  </tbody>
                </table>
              </div>
            </motion.div>
          </div>
        </div>
      )}

      {/* ── SPLIT MODE ── */}
      {viewMode === 'split' && selectedBranch && (
        <>
          {/* Left: Mini list */}
          <div className="w-[340px] shrink-0 border-r border-slate-200 flex flex-col bg-[#fdfdfd] shadow-xl">
            <div className="p-4 border-b border-slate-100 bg-white">
              <button onClick={() => { setViewMode('full'); setSelectedBranch(null); }}
                className="flex items-center gap-1.5 text-xs font-bold text-slate-500 hover:text-[#311042] mb-3">
                <ChevronLeft className="w-4 h-4" /> Back to List
              </button>
              <h2 className="text-xl font-black text-slate-900">Branches</h2>
              <p className="text-xs text-slate-500 font-semibold mt-0.5">{count} total</p>
            </div>
            <div className="overflow-y-auto flex-1 p-2 space-y-1.5">
              {branches.map(b => {
                const isSel = selectedBranch?.id === b.id;
                return (
                  <div key={b.id} onClick={() => fetchBranchDetail(b)}
                    className={`p-4 rounded-xl border cursor-pointer transition-all ${isSel ? 'bg-purple-50 border-purple-200' : 'bg-white border-transparent hover:border-slate-200 hover:bg-slate-50'
                      }`}>
                    <div className="flex justify-between items-start mb-1">
                      <h3 className="text-sm font-black text-slate-900">{b.branch_name}</h3>
                      <StatusBadge active={b.is_active} />
                    </div>
                    <p className="text-xs text-slate-500 font-medium flex items-center gap-1">
                      <MapPin className="w-3 h-3" />{[b.city, b.state].filter(Boolean).join(', ') || 'No location'}
                    </p>
                    {b.branch_code && (
                      <p className="text-[10px] font-mono text-purple-600 mt-1">{b.branch_code}</p>
                    )}
                  </div>
                );
              })}
            </div>
          </div>

          {/* Right: Detail panel */}
          <div className="flex-1 flex flex-col bg-[#f0f2f5] overflow-hidden">
            <AnimatePresence mode="wait">
              <motion.div key={selectedBranch.id}
                initial={{ opacity: 0, x: 20 }} animate={{ opacity: 1, x: 0 }} exit={{ opacity: 0, x: 20 }}
                className="flex-1 flex flex-col h-full absolute inset-0 font-sans"
              >
                {/* Top bar */}
                <div className="bg-white border-b border-slate-200 shadow-sm shrink-0">
                  <div className="px-6 py-4 flex justify-between items-center">
                    <div className="flex items-center gap-4">
                      <button onClick={() => { setViewMode('full'); setSelectedBranch(null); }}
                        className="p-1.5 hover:bg-slate-100 rounded-lg text-slate-400 transition-colors">
                        <X className="w-5 h-5" />
                      </button>
                      <div className="flex items-center gap-3">
                        <div className="w-10 h-10 rounded-xl bg-purple-50 flex items-center justify-center">
                          <Building2 className="w-5 h-5 text-[#311042]" />
                        </div>
                        <div>
                          <h2 className="text-xl font-black text-slate-900">{selectedBranch.branch_name}</h2>
                          {selectedBranch.branch_code && (
                            <span className="text-xs font-mono text-purple-600 font-bold">{selectedBranch.branch_code}</span>
                          )}
                        </div>
                        <StatusBadge active={selectedBranch.is_active} />
                      </div>
                    </div>
                    <Link href={`/super-admin/my-firms/${selectedBranch.id}/overview`}>
                      <button className="flex items-center gap-2 px-4 py-2 bg-[#311042] text-white text-sm font-bold rounded-xl hover:bg-[#461a5e] transition-colors shadow-md shadow-purple-900/10">
                        Open Branch Workspace
                      </button>
                    </Link>
                  </div>

                  {/* Meta row */}
                  <div className="px-6 py-3 bg-slate-50 border-t border-slate-100 flex flex-wrap gap-6 text-xs font-bold text-slate-500 uppercase tracking-widest">
                    {selectedBranch.city && (
                      <span className="flex items-center gap-1.5 normal-case tracking-normal">
                        <MapPin className="w-3.5 h-3.5" />{[selectedBranch.city, selectedBranch.state].filter(Boolean).join(', ')}
                      </span>
                    )}
                    {selectedBranch.email && (
                      <span className="flex items-center gap-1.5 normal-case tracking-normal">
                        <Mail className="w-3.5 h-3.5" />{selectedBranch.email}
                      </span>
                    )}
                    {selectedBranch.phone_number && (
                      <span className="flex items-center gap-1.5 normal-case tracking-normal">
                        <Phone className="w-3.5 h-3.5" />{selectedBranch.phone_number}
                      </span>
                    )}
                  </div>
                </div>

                {/* Content */}
                <div className="flex-1 overflow-y-auto p-6 space-y-6">

                  {/* Admin section */}
                  <div className="bg-white rounded-2xl border border-slate-200 p-6">
                    <h3 className="text-sm font-black text-slate-900 uppercase tracking-widest mb-4 flex items-center gap-2">
                      <User className="w-4 h-4 text-[#311042]" /> Branch Administration
                    </h3>
                    {loadingDetail ? (
                      <div className="flex items-center gap-2 text-slate-400 py-4">
                        <Loader2 className="w-4 h-4 animate-spin" />
                        <span className="text-sm">Loading admin info...</span>
                      </div>
                    ) : branchAdmins.length > 0 ? (
                      <div className="space-y-3">
                        {branchAdmins.map((admin: any) => (
                          <div key={admin.id} className="flex items-center gap-3 p-4 bg-purple-50 border border-purple-100 rounded-xl">
                            <div className="w-10 h-10 rounded-full bg-purple-100 text-purple-800 flex items-center justify-center text-sm font-black shrink-0">
                              {admin.first_name?.[0]}{admin.last_name?.[0]}
                            </div>
                            <div className="flex-1 min-w-0">
                              <p className="text-sm font-bold text-slate-900">{admin.first_name} {admin.last_name}</p>
                              <p className="text-xs text-slate-500 truncate">{admin.email}</p>
                            </div>
                            <CheckCircle2 className="w-5 h-5 text-purple-500 shrink-0" />
                          </div>
                        ))}
                      </div>
                    ) : (
                      <div className="flex items-center gap-3 p-4 bg-slate-50 border border-dashed border-slate-200 rounded-xl">
                        <Shield className="w-8 h-8 text-slate-300" />
                        <div>
                          <p className="text-sm font-bold text-slate-400">No admin assigned</p>
                          <p className="text-xs text-slate-400">Open the branch workspace to assign an admin.</p>
                        </div>
                      </div>
                    )}
                  </div>

                  {/* Address / Info */}
                  <div className="bg-white rounded-2xl border border-slate-200 p-6">
                    <h3 className="text-sm font-black text-slate-900 uppercase tracking-widest mb-4 flex items-center gap-2">
                      <MapPin className="w-4 h-4 text-[#311042]" /> Branch Details
                    </h3>
                    <div className="grid grid-cols-2 gap-4">
                      {[
                        { label: 'Branch Name', value: selectedBranch.branch_name },
                        { label: 'Branch Code', value: selectedBranch.branch_code || '—' },
                        { label: 'City', value: selectedBranch.city || '—' },
                        { label: 'State', value: selectedBranch.state || '—' },
                        { label: 'Email', value: selectedBranch.email || '—' },
                        { label: 'Phone', value: selectedBranch.phone_number || '—' },
                      ].map(({ label, value }) => (
                        <div key={label}>
                          <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-1">{label}</p>
                          <p className="text-sm font-semibold text-slate-800 truncate">{value}</p>
                        </div>
                      ))}
                      {selectedBranch.address && (
                        <div className="col-span-2">
                          <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest mb-1">Address</p>
                          <p className="text-sm font-semibold text-slate-800">{selectedBranch.address}</p>
                        </div>
                      )}
                    </div>
                  </div>
                </div>
              </motion.div>
            </AnimatePresence>
          </div>
        </>
      )}
    </div>
  );
}
