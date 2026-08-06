'use client';

import { useState, useEffect, useMemo, useCallback } from 'react';
import {
  Users, Phone, Mail, FileText, Download, Eye, Search, Loader2,
  AlertCircle, ChevronLeft, ChevronRight, MapPin, UserCheck, Plus, ArrowRight
} from 'lucide-react';
import Link from 'next/link';
import { customFetch } from '@/lib/fetch';
import { API, API_BASE_URL } from '@/lib/api';
import { toast } from 'react-hot-toast';

interface Client {
  id: string;
  firm?: string;
  first_name: string;
  last_name: string;
  full_name: string;
  email: string;
  phone_number: string;
  address: string;
  profile_image?: string | null;
  brief_summary?: string;
  assigned_advocate?: string;
  advocate_name?: string;
  user_account?: string;
  created_at: string;
  updated_at?: string;
}

interface Document {
  id: string;
  document_title: string;
  document_type: string;
  document_type_display: string;
  document_category: string;
  uploaded_by_name: string;
  verification_status: string;
  uploaded_at: string;
  is_deleted: boolean;
}

interface ClientDocuments {
  client: Client;
  documents: Document[];
  total_documents: number;
}

export default function AdvocateClientsPage() {
  const [clients, setClients] = useState<Client[]>([]);
  const [selectedClient, setSelectedClient] = useState<Client | null>(null);
  const [clientDocuments, setClientDocuments] = useState<ClientDocuments | null>(null);
  const [loading, setLoading] = useState(true);
  const [documentsLoading, setDocumentsLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  // Search & Pagination States (Backend driven)
  const [searchQuery, setSearchQuery] = useState('');
  const [page, setPage] = useState(1);
  const [totalCount, setTotalCount] = useState(0);
  const pageSize = 10;

  const fetchMyClients = useCallback(async (query: string, pageNum: number) => {
    try {
      setLoading(true);
      setError(null);

      const params = new URLSearchParams();
      if (query.trim()) params.set('search', query.trim());
      params.set('page', String(pageNum));
      params.set('page_size', String(pageSize));

      const response = await customFetch(`${API.CLIENTS.MY_CLIENTS}?${params.toString()}`);
      const data = await response.json();

      if (data && Array.isArray(data.results)) {
        setClients(data.results);
        setTotalCount(data.count || 0);
      } else if (Array.isArray(data)) {
        setClients(data);
        setTotalCount(data.length);
      } else {
        setClients([]);
        setTotalCount(0);
      }
    } catch (err: any) {
      setError(err.message || 'Failed to load clients');
      console.error('Error fetching clients:', err);
    } finally {
      setLoading(false);
    }
  }, [pageSize]);

  useEffect(() => {
    const timer = setTimeout(() => {
      fetchMyClients(searchQuery, page);
    }, 300);
    return () => clearTimeout(timer);
  }, [searchQuery, page, fetchMyClients]);

  const fetchClientDocuments = async (clientId: string) => {
    try {
      setDocumentsLoading(true);
      const response = await customFetch(API.CLIENTS.CLIENT_DOCUMENTS(clientId));
      const data = await response.json();
      setClientDocuments(data);
    } catch (err: any) {
      console.error('Error fetching documents:', err);
      toast.error('Failed to load client documents');
    } finally {
      setDocumentsLoading(false);
    }
  };

  const handleClientClick = (client: Client) => {
    setSelectedClient(client);
    fetchClientDocuments(client.id);
  };

  const handleBackToList = () => {
    setSelectedClient(null);
    setClientDocuments(null);
  };

  const pageCount = Math.max(1, Math.ceil(totalCount / pageSize));
  const safePage = Math.min(page, pageCount);

  const getVerificationBadge = (status: string) => {
    const badges = {
      pending: 'bg-amber-50 text-amber-700 border-amber-200/60',
      verified: 'bg-emerald-50 text-emerald-700 border-emerald-200/60',
      rejected: 'bg-red-50 text-red-700 border-red-200/60'
    };
    return badges[status as keyof typeof badges] || 'bg-slate-100 text-slate-700 border-slate-200';
  };

  const formatDate = (dateStr?: string) => {
    if (!dateStr) return 'N/A';
    const d = new Date(dateStr);
    return isNaN(d.getTime())
      ? 'N/A'
      : d.toLocaleDateString('en-GB', { day: '2-digit', month: 'short', year: 'numeric' });
  };

  if (error && clients.length === 0) {
    return (
      <div className="bg-white rounded-2xl border border-red-200 p-12 text-center shadow-sm">
        <AlertCircle className="w-12 h-12 text-red-500 mx-auto mb-3" />
        <p className="text-red-600 font-bold mb-1">Error Loading Clients</p>
        <p className="text-slate-500 text-xs mb-4">{error}</p>
        <button
          onClick={() => fetchMyClients(searchQuery, page)}
          className="px-4 py-2 bg-[#4a1c40] text-white text-xs font-bold rounded-xl hover:bg-[#3a1530] transition-colors shadow-sm"
        >
          Try Again
        </button>
      </div>
    );
  }

  // Client Details & Documents View
  if (selectedClient && clientDocuments) {
    return (
      <div className="space-y-6">
        <button
          onClick={handleBackToList}
          className="inline-flex items-center gap-2 text-xs font-bold text-[#4a1c40] hover:underline"
        >
          <ChevronLeft className="w-4 h-4" /> Back to Client List
        </button>

        {/* Client Header Info */}
        {(() => {
          const detailClient = clientDocuments?.client || selectedClient;
          const rawImg = detailClient.profile_image || selectedClient.profile_image;
          const detailAvatarUrl = rawImg
            ? (rawImg.startsWith('http') ? rawImg : `${API_BASE_URL}${rawImg}`)
            : null;

          return (
            <div className="bg-white rounded-2xl border border-slate-200 shadow-sm p-6 space-y-6">
              <div className="flex items-center justify-between border-b border-slate-100 pb-5">
                <div className="flex items-center gap-4">
                  {detailAvatarUrl ? (
                    <img
                      src={detailAvatarUrl}
                      alt={detailClient.full_name}
                      className="w-14 h-14 rounded-2xl object-cover border border-slate-200 shadow-xs shrink-0"
                    />
                  ) : (
                    <div className="w-14 h-14 bg-[#4a1c40]/10 text-[#4a1c40] rounded-2xl flex items-center justify-center font-black text-xl shrink-0">
                      {(detailClient.first_name?.[0] || detailClient.full_name?.[0] || 'C').toUpperCase()}
                      {(detailClient.last_name?.[0] || '').toUpperCase()}
                    </div>
                  )}
                  <div>
                    <h1 className="text-xl font-bold text-slate-900">{detailClient.full_name}</h1>
                    <p className="text-xs text-slate-400 mt-0.5">
                      Assigned Advocate: <span className="font-bold text-slate-700">{detailClient.advocate_name || 'N/A'}</span>
                    </p>
                  </div>
                </div>
                <span className="text-xs font-bold text-slate-400">Onboarded: {formatDate(detailClient.created_at)}</span>
              </div>

              <div className="grid grid-cols-1 md:grid-cols-3 gap-4">
                <div className="flex items-center gap-3 p-3.5 bg-slate-50 border border-slate-100 rounded-xl">
                  <Mail className="w-4 h-4 text-slate-400 shrink-0" />
                  <div className="min-w-0">
                    <p className="text-[10px] font-bold uppercase tracking-wider text-slate-400">Email</p>
                    <p className="text-xs font-bold text-slate-800 truncate">{detailClient.email || 'N/A'}</p>
                  </div>
                </div>
                <div className="flex items-center gap-3 p-3.5 bg-slate-50 border border-slate-100 rounded-xl">
                  <Phone className="w-4 h-4 text-slate-400 shrink-0" />
                  <div className="min-w-0">
                    <p className="text-[10px] font-bold uppercase tracking-wider text-slate-400">Phone</p>
                    <p className="text-xs font-bold text-slate-800 truncate">{detailClient.phone_number || 'N/A'}</p>
                  </div>
                </div>
                <div className="flex items-center gap-3 p-3.5 bg-slate-50 border border-slate-100 rounded-xl">
                  <MapPin className="w-4 h-4 text-slate-400 shrink-0" />
                  <div className="min-w-0">
                    <p className="text-[10px] font-bold uppercase tracking-wider text-slate-400">Address</p>
                    <p className="text-xs font-bold text-slate-800 truncate" title={detailClient.address}>{detailClient.address || 'N/A'}</p>
                  </div>
                </div>
              </div>

              {detailClient.brief_summary && (
                <div className="p-4 bg-purple-50/60 border border-purple-100 rounded-xl">
                  <p className="text-xs font-bold text-[#4a1c40] mb-1">Brief Summary</p>
                  <p className="text-xs text-slate-700 leading-relaxed">{detailClient.brief_summary}</p>
                </div>
              )}
            </div>
          );
        })()}

        {/* Client Documents Table */}
        <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden">
          <div className="p-4 border-b border-slate-100 flex items-center justify-between bg-slate-50/50">
            <h2 className="text-sm font-bold text-[#4a1c40]">Client Documents</h2>
            <span className="text-xs font-bold text-slate-400">Total: {clientDocuments.total_documents}</span>
          </div>

          {documentsLoading ? (
            <div className="p-12 text-center">
              <Loader2 className="w-6 h-6 animate-spin text-[#4a1c40] mx-auto mb-2" />
              <p className="text-xs text-slate-500 font-semibold">Loading documents...</p>
            </div>
          ) : clientDocuments.documents.length === 0 ? (
            <div className="p-12 text-center">
              <FileText className="w-10 h-10 text-slate-300 mx-auto mb-2" />
              <p className="text-xs font-bold text-slate-400">No documents uploaded yet</p>
            </div>
          ) : (
            <div className="overflow-x-auto">
              <table className="w-full text-left border-collapse">
                <thead>
                  <tr className="bg-slate-50 border-b border-slate-200 text-[11px] font-bold text-slate-500 uppercase tracking-wider">
                    <th className="py-3 px-6">Document Title</th>
                    <th className="py-3 px-6">Type</th>
                    <th className="py-3 px-6">Uploaded By</th>
                    <th className="py-3 px-6">Status</th>
                    <th className="py-3 px-6">Date</th>
                    <th className="py-3 px-6 text-right">Actions</th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-slate-100">
                  {clientDocuments.documents.map((doc) => (
                    <tr key={doc.id} className="hover:bg-slate-50/80 transition-colors">
                      <td className="py-3.5 px-6">
                        <div className="flex items-center gap-2.5">
                          <FileText className="w-4 h-4 text-[#4a1c40] shrink-0" />
                          <span className="text-xs font-bold text-slate-900">{doc.document_title}</span>
                        </div>
                      </td>
                      <td className="py-3.5 px-6 text-xs text-slate-600">{doc.document_type_display}</td>
                      <td className="py-3.5 px-6 text-xs text-slate-600">{doc.uploaded_by_name}</td>
                      <td className="py-3.5 px-6">
                        <span className={`px-2.5 py-0.5 text-[10px] font-bold border rounded-full uppercase tracking-wider ${getVerificationBadge(doc.verification_status)}`}>
                          {doc.verification_status}
                        </span>
                      </td>
                      <td className="py-3.5 px-6 text-xs text-slate-500">{formatDate(doc.uploaded_at)}</td>
                      <td className="py-3.5 px-6 text-right">
                        <div className="flex items-center justify-end gap-1">
                          <button className="p-1.5 hover:bg-slate-100 rounded-lg text-slate-600 transition-all" title="View">
                            <Eye className="w-4 h-4" />
                          </button>
                          <button className="p-1.5 hover:bg-slate-100 rounded-lg text-slate-600 transition-all" title="Download">
                            <Download className="w-4 h-4" />
                          </button>
                        </div>
                      </td>
                    </tr>
                  ))}
                </tbody>
              </table>
            </div>
          )}
        </div>
      </div>
    );
  }

  // Clients List View (Matching /advocate/cases DataTable)
  return (
    <div className="space-y-6">
      {/* Header Bar */}
      <div className="flex flex-wrap items-center justify-between gap-4">
        <div>
          <h1 className="text-2xl font-bold text-slate-900">My Clients</h1>
          <p className="text-xs font-medium text-slate-500 mt-0.5">
            View and manage your assigned clients and their associated legal records.
          </p>
        </div>
        <Link href="/advocate/add-client">
          <button className="flex items-center gap-2 bg-[#4a1c40] hover:bg-[#371530] text-white px-4 py-2.5 rounded-xl font-bold text-xs transition-all shadow-sm active:scale-95">
            <Plus className="w-4 h-4" />
            <span>Add Client</span>
          </button>
        </Link>
      </div>

      {/* Main DataTable Container (Matching /advocate/cases DataTable) */}
      <div className="bg-white rounded-2xl border border-slate-200 shadow-sm overflow-hidden flex flex-col w-full">
        {/* Search Bar & Pagination Controls */}
        <div className="p-4 border-b border-slate-100 flex flex-wrap justify-between items-center gap-3 bg-slate-50/50">
          <div className="relative w-full sm:w-72">
            <Search className="w-4 h-4 absolute left-3 top-1/2 -translate-y-1/2 text-slate-400" />
            <input
              type="text"
              placeholder="Search clients by name, email, phone, address..."
              value={searchQuery}
              onChange={(e) => {
                setSearchQuery(e.target.value);
                setPage(1);
              }}
              className="w-full pl-9 pr-4 py-2 bg-white border border-slate-200 rounded-xl text-xs text-slate-900 font-medium focus:outline-none focus:border-[#4a1c40] shadow-sm placeholder:text-slate-400"
            />
          </div>

          <div className="flex items-center gap-3 flex-wrap">
            <div className="flex items-center gap-1">
              <button
                disabled={safePage === 1}
                onClick={() => setPage((current) => Math.max(1, current - 1))}
                className="p-1.5 border border-slate-200 rounded-lg hover:bg-slate-100 disabled:opacity-40 transition-all bg-white shadow-sm"
              >
                <ChevronLeft className="w-4 h-4 text-slate-600" />
              </button>
              <span className="px-2 text-xs font-bold text-slate-600">
                Page {safePage} of {pageCount}
              </span>
              <button
                disabled={safePage >= pageCount}
                onClick={() => setPage((current) => Math.min(pageCount, current + 1))}
                className="p-1.5 border border-slate-200 rounded-lg hover:bg-slate-100 disabled:opacity-40 transition-all bg-white shadow-sm"
              >
                <ChevronRight className="w-4 h-4 text-slate-600" />
              </button>
            </div>

            <span className="text-xs font-bold text-slate-400">
              {totalCount} total
            </span>
          </div>
        </div>

        {/* Clients Table */}
        <div className="overflow-x-auto">
          <table className="w-full text-left border-collapse min-w-[850px]">
            <thead className="sticky top-0 z-10">
              <tr className="bg-slate-50 border-b border-slate-200">
                <th className="py-3.5 px-5 text-[11px] font-bold text-slate-500 uppercase tracking-wider">SL. NO</th>
                <th className="py-3.5 px-5 text-[11px] font-bold text-slate-500 uppercase tracking-wider">Client Name</th>
                <th className="py-3.5 px-5 text-[11px] font-bold text-slate-500 uppercase tracking-wider">Contact Details</th>
                <th className="py-3.5 px-5 text-[11px] font-bold text-slate-500 uppercase tracking-wider">Address</th>
                <th className="py-3.5 px-5 text-[11px] font-bold text-slate-500 uppercase tracking-wider">Date Added</th>
                <th className="py-3.5 px-5 text-[11px] font-bold text-slate-500 uppercase tracking-wider text-right">Action</th>
              </tr>
            </thead>
            <tbody className="divide-y divide-slate-100">
              {loading ? (
                [...Array(3)].map((_, i) => (
                  <tr key={`skeleton-${i}`} className="animate-pulse">
                    <td className="py-4 px-5"><div className="h-4 bg-slate-100 rounded w-6" /></td>
                    <td className="py-4 px-5"><div className="h-4 bg-slate-100 rounded w-36" /></td>
                    <td className="py-4 px-5"><div className="h-4 bg-slate-100 rounded w-28" /></td>
                    <td className="py-4 px-5"><div className="h-4 bg-slate-100 rounded w-44" /></td>
                    <td className="py-4 px-5"><div className="h-4 bg-slate-100 rounded w-20" /></td>
                    <td className="py-4 px-5 text-right"><div className="h-6 bg-slate-100 rounded w-28 ml-auto" /></td>
                  </tr>
                ))
              ) : clients.length === 0 ? (
                <tr>
                  <td colSpan={6} className="py-16 text-center text-slate-400 font-semibold text-xs">
                    {searchQuery ? 'No clients match your search' : 'No clients assigned to you yet'}
                  </td>
                </tr>
              ) : (
                clients.map((client, index) => {
                  const clientName = client.full_name || `${client.first_name || ''} ${client.last_name || ''}`.trim() || 'N/A';
                  const avatarUrl = client.profile_image
                    ? (client.profile_image.startsWith('http') ? client.profile_image : `${API_BASE_URL}${client.profile_image}`)
                    : null;

                  return (
                    <tr
                      key={client.id ? `client-${client.id}` : `client-${index}`}
                      onClick={() => handleClientClick(client)}
                      className="hover:bg-slate-50/80 transition-colors group cursor-pointer"
                    >
                      <td className="py-4 px-5 text-xs font-semibold text-slate-500">
                        {(safePage - 1) * pageSize + index + 1}
                      </td>
                      <td className="py-4 px-5">
                        <div className="flex items-center gap-3">
                          {avatarUrl ? (
                            <img
                              src={avatarUrl}
                              alt={clientName}
                              className="w-8 h-8 rounded-full object-cover shrink-0 border border-slate-200"
                            />
                          ) : (
                            <div className="w-8 h-8 bg-[#4a1c40]/10 text-[#4a1c40] rounded-full flex items-center justify-center font-bold text-xs shrink-0">
                              {(client.first_name?.[0] || clientName[0] || 'C').toUpperCase()}
                            </div>
                          )}
                          <p className="text-xs font-bold text-slate-900 group-hover:text-[#4a1c40] transition-colors">
                            {clientName}
                          </p>
                        </div>
                      </td>
                      <td className="py-4 px-5">
                        <div>
                          <p className="text-xs font-bold text-slate-800">{client.phone_number || 'N/A'}</p>
                          <p className="text-[11px] font-medium text-slate-500 truncate">{client.email || 'No email'}</p>
                        </div>
                      </td>
                      <td className="py-4 px-5 text-xs font-medium text-slate-600 max-w-[240px] truncate" title={client.address}>
                        {client.address || 'N/A'}
                      </td>
                      <td className="py-4 px-5 text-xs font-medium text-slate-500">
                        {formatDate(client.created_at)}
                      </td>
                      <td className="py-4 px-5 text-right">
                        <button
                          onClick={(e) => {
                            e.stopPropagation();
                            handleClientClick(client);
                          }}
                          className="inline-flex items-center gap-1 px-3 py-1.5 rounded-lg text-xs font-bold bg-[#4a1c40]/10 text-[#4a1c40] hover:bg-[#4a1c40] hover:text-white transition-all shadow-2xs"
                        >
                          <span>View Details & Documents</span>
                          <ArrowRight className="w-3.5 h-3.5" />
                        </button>
                      </td>
                    </tr>
                  );
                })
              )}
            </tbody>
          </table>
        </div>
      </div>
    </div>
  );
}

