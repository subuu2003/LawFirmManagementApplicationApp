'use client';

import { use, useState, useEffect } from 'react';
import Link from 'next/link';
import {
  Building2, Users, Briefcase, FileSignature, Shield, ArrowLeft,
  Edit, Save, X, Calendar, DollarSign, Download, Clock, Loader2,
  Mail, Phone, MapPin, Globe, Hash, Upload, Trash2,
  CreditCard, RefreshCw, CheckCircle2, AlertTriangle, ChevronRight, Zap
} from 'lucide-react';
import {
  BarChart, Bar, AreaChart, Area,
  XAxis, YAxis, CartesianGrid, Tooltip, ResponsiveContainer, Cell
} from 'recharts';
import { customFetch } from '@/lib/fetch';
import { API, API_BASE_URL, SUBSCRIPTION_PLANS } from '@/lib/api';
import { useTopbarTitle } from '@/components/platform/TopbarContext';
import { toast } from 'react-hot-toast';

const BRAND = '#0e2340';

interface FirmDetail {
  id: string;
  firm_name: string;
  firm_code: string;
  city: string;
  state: string;
  logo: string | null;
  country: string;
  address: string;
  postal_code: string;
  phone_number: string;
  email: string;
  website: string;
  subscription_type: string;
  subscription_end_date: string | null;
  trial_end_date: string | null;
  subscription_status: string;
  days_until_expiry: number | null;
  is_active: boolean;
  is_suspended: boolean;
  branch_limit: number;
  current_branch_count: number;
  remaining_branches: number;
  branches: any[];
  created_at: string;
  updated_at: string;
}

const CustomTooltip = ({ active, payload, label }: any) => {
  if (!active || !payload?.length) return null;
  return (
    <div style={{ background: '#fff', border: '1px solid #e2e8f0', borderRadius: 10, padding: '10px 14px', boxShadow: '0 4px 16px rgba(0,0,0,0.08)', fontFamily: 'inherit' }}>
      <p style={{ fontSize: 12, fontWeight: 600, color: '#334155', marginBottom: 6 }}>{label}</p>
      {payload.map((p: any, i: number) => (
        <p key={i} style={{ fontSize: 12, color: p.color || BRAND, margin: '2px 0' }}>
          <span style={{ color: '#64748b' }}>{p.name}: </span>
          <span style={{ fontWeight: 600 }}>{p.value}</span>
        </p>
      ))}
    </div>
  );
};

export default function PlatformOwnerFirmOverviewPage({
  params,
}: {
  params: Promise<{ firmId: string }>;
}) {
  const { firmId } = use(params);

  const [activeTab, setActiveTab] = useState<'Overview' | 'Billing'>('Overview');
  const [firm, setFirm] = useState<FirmDetail | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  // Billing / Subscription state
  const [billingEdit, setBillingEdit] = useState(false);
  const [billingForm, setBillingForm] = useState({
    subscription_type: '',
    subscription_end_date: '',
    trial_end_date: '',
    is_suspended: false,
  });
  const [billingSaving, setBillingSaving] = useState(false);
  const [billingMsg, setBillingMsg] = useState<{ type: 'success' | 'error'; text: string } | null>(null);

  // Renew modal state
  const [renewOpen, setRenewOpen] = useState(false);
  const [renewForm, setRenewForm] = useState({
    plan_id: '',
    duration_months: 1,
  });
  const [renewing, setRenewing] = useState(false);
  const [renewMsg, setRenewMsg] = useState<{ type: 'success' | 'error'; text: string } | null>(null);

  // Push firm name into the topbar dynamically once loaded
  useTopbarTitle(
    firm?.firm_name ?? '',
    firm ? `Law Firm · ${firm.is_active ? 'Active' : 'Inactive'}` : '',
  );

  // Editable state for Settings tab
  const [editedDetails, setEditedDetails] = useState({
    firm_name: '',
    email: '',
    phone_number: '',
    subscription_type: '',
    is_active: true,
    website: '',
    address: '',
    city: '',
    state: '',
    country: '',
    postal_code: '',
  });

  const [logoFile, setLogoFile] = useState<File | null | 'REMOVE'>(null);
  const [logoPreview, setLogoPreview] = useState<string | null>(null);

  useEffect(() => {
    const fetchFirm = async () => {
      try {
        setLoading(true);
        const response = await customFetch(API.FIRMS.DETAIL(firmId));
        const data = await response.json();
        if (!response.ok) {
          throw new Error(data.detail || data.message || 'Failed to load firm details');
        }
        setFirm(data);
        setEditedDetails({
          firm_name: data.firm_name,
          email: data.email,
          phone_number: data.phone_number,
          subscription_type: data.subscription_type,
          is_active: data.is_active,
          website: data.website || '',
          address: data.address || '',
          city: data.city || '',
          state: data.state || '',
          country: data.country || 'India',
          postal_code: data.postal_code || '',
        });
        setBillingForm({
          subscription_type: data.subscription_type,
          subscription_end_date: data.subscription_end_date ? data.subscription_end_date.slice(0, 16) : '',
          trial_end_date: data.trial_end_date ? data.trial_end_date.slice(0, 16) : '',
          is_suspended: data.is_suspended ?? false,
        });
        setLogoPreview(data.logo ? (data.logo.startsWith('http') ? data.logo : `${API_BASE_URL}${data.logo}`) : null);
      } catch (err: any) {
        setError(err.message || 'Failed to load firm details');
        console.error(err);
      } finally {
        setLoading(false);
      }
    };
    fetchFirm();
  }, [firmId]);

  const handleSave = async () => {
    try {
      setLoading(true);

      let response;
      if (logoFile instanceof File) {
        const formData = new FormData();
        Object.entries(editedDetails).forEach(([key, val]) => {
          formData.append(key, String(val));
        });
        formData.append('logo', logoFile);
        response = await customFetch(API.FIRMS.DETAIL(firmId), {
          method: 'PATCH',
          body: formData,
        });
      } else {
        const payload = logoFile === 'REMOVE' ? { ...editedDetails, logo: null } : editedDetails;
        response = await customFetch(API.FIRMS.DETAIL(firmId), {
          method: 'PATCH',
          headers: { 'Content-Type': 'application/json' },
          body: JSON.stringify(payload),
        });
      }

      const data = await response.json();
      if (!response.ok) {
        throw new Error(data.detail || data.message || 'Failed to update firm details');
      }
      setFirm(data);
      setEditedDetails({
        firm_name: data.firm_name,
        email: data.email,
        phone_number: data.phone_number,
        subscription_type: data.subscription_type,
        is_active: data.is_active,
        website: data.website || '',
        address: data.address || '',
        city: data.city || '',
        state: data.state || '',
        country: data.country || 'India',
        postal_code: data.postal_code || '',
      });
      setLogoFile(null);
      setLogoPreview(data.logo ? (data.logo.startsWith('http') ? data.logo : `${API_BASE_URL}${data.logo}`) : null);

      toast.success('Firm details updated successfully');
    } catch (err: any) {
      setError(err.message || 'Failed to update firm details');
      console.error(err);
    } finally {
      setLoading(false);
    }
  };

  const formatDate = (dateStr: string) => {
    const d = new Date(dateStr);
    return d.toLocaleDateString('en-IN', { day: '2-digit', month: 'short', year: 'numeric' });
  };

  const formatDateFull = (dateStr: string | null) => {
    if (!dateStr) return '—';
    const d = new Date(dateStr);
    return d.toLocaleString('en-IN', { day: '2-digit', month: 'short', year: 'numeric', hour: '2-digit', minute: '2-digit' });
  };

  const handleBillingSave = async () => {
    try {
      setBillingSaving(true);
      setBillingMsg(null);
      const payload = {
        subscription_type: billingForm.subscription_type,
        subscription_end_date: billingForm.subscription_end_date ? new Date(billingForm.subscription_end_date).toISOString() : null,
        trial_end_date: billingForm.trial_end_date ? new Date(billingForm.trial_end_date).toISOString() : null,
        is_suspended: billingForm.is_suspended,
      };
      const res = await customFetch(API.FIRMS.DETAIL(firmId), {
        method: 'PATCH',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify(payload),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data.detail || data.message || 'Failed to update subscription');
      setFirm(data);
      setBillingForm({
        subscription_type: data.subscription_type,
        subscription_end_date: data.subscription_end_date ? data.subscription_end_date.slice(0, 16) : '',
        trial_end_date: data.trial_end_date ? data.trial_end_date.slice(0, 16) : '',
        is_suspended: data.is_suspended ?? false,
      });
      setBillingEdit(false);
      setBillingMsg({ type: 'success', text: 'Subscription updated successfully.' });
    } catch (err: any) {
      setBillingMsg({ type: 'error', text: err.message || 'Update failed.' });
    } finally {
      setBillingSaving(false);
    }
  };

  const handleRenew = async () => {
    try {
      setRenewing(true);
      setRenewMsg(null);
      const res = await customFetch(API.SUBSCRIPTIONS.ACTIVATE, {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          firm_id: firmId,
          plan_id: renewForm.plan_id,
          duration_months: renewForm.duration_months,
        }),
      });
      const data = await res.json();
      if (!res.ok) throw new Error(data.detail || data.message || 'Activation failed');
      setRenewMsg({ type: 'success', text: 'Subscription activated successfully!' });
      // Refresh firm data
      const firmRes = await customFetch(API.FIRMS.DETAIL(firmId));
      const firmData = await firmRes.json();
      if (firmRes.ok) {
        setFirm(firmData);
        setBillingForm({
          subscription_type: firmData.subscription_type,
          subscription_end_date: firmData.subscription_end_date ? firmData.subscription_end_date.slice(0, 16) : '',
          trial_end_date: firmData.trial_end_date ? firmData.trial_end_date.slice(0, 16) : '',
          is_suspended: firmData.is_suspended ?? false,
        });
      }
      setTimeout(() => { setRenewOpen(false); setRenewMsg(null); }, 2000);
    } catch (err: any) {
      setRenewMsg({ type: 'error', text: err.message || 'Activation failed.' });
    } finally {
      setRenewing(false);
    }
  };

  if (loading) {
    return (
      <div className="p-6 max-w-6xl mx-auto flex flex-col items-center justify-center gap-3 min-h-[400px]">
        <Loader2 className="w-8 h-8 text-[#0e2340] animate-spin" />
        <p className="text-sm text-gray-400 font-medium">Loading firm details…</p>
      </div>
    );
  }

  if (error || !firm) {
    return (
      <div className="p-6 max-w-6xl mx-auto">
        <Link href="/platform-owner/firms" className="inline-flex items-center gap-2 text-sm text-gray-500 hover:text-gray-700 mb-6">
          <ArrowLeft className="w-4 h-4" /> Back to Firms
        </Link>
        <div className="bg-white rounded-2xl border border-red-100 shadow-sm p-16 text-center">
          <p className="text-sm text-red-500 font-medium">{error || 'Firm not found'}</p>
        </div>
      </div>
    );
  }

  return (
    <div className="p-6 max-w-6xl mx-auto space-y-6">
      {/* ── HEADER SECTION ── */}
      <div className="flex flex-col md:flex-row md:items-start justify-between gap-6">
        <div className="flex items-start gap-4">
          <Link href="/platform-owner/firms" className="p-2 mt-1 border border-gray-200 bg-white hover:bg-gray-50 rounded-lg transition-colors">
            <ArrowLeft className="w-5 h-5 text-gray-700" />
          </Link>

          <div className="bg-white border border-gray-200 rounded-xl p-6 shadow-sm min-w-[320px] flex gap-5">
            {firm.logo ? (
              <div className="w-16 h-16 rounded-2xl overflow-hidden bg-gray-50 border border-gray-100 shrink-0 hidden sm:block">
                <img
                  src={firm.logo.startsWith('http') ? firm.logo : `${API_BASE_URL}${firm.logo}`}
                  alt={firm.firm_name}
                  className="w-full h-full object-cover"
                  onError={(e) => {
                    (e.target as HTMLImageElement).src = `https://ui-avatars.com/api/?name=${encodeURIComponent(firm.firm_name)}&background=0e2340&color=fff`;
                  }}
                />
              </div>
            ) : (
              <div className="w-16 h-16 rounded-2xl bg-[#0e2340] items-center justify-center text-white text-2xl font-bold shrink-0 shadow-sm shadow-[#0e2340]/10 hidden sm:flex">
                {firm.firm_name.charAt(0)}
              </div>
            )}
            <div className="flex-1 min-w-0">
              <div className="flex justify-between items-start">
                <h1 className="text-2xl font-bold text-gray-900 tracking-tight truncate">{firm.firm_name}</h1>
              </div>
              <p className="text-gray-500 text-sm mt-1 mb-4 border-b border-gray-100 pb-3 flex items-center gap-2">
                <span className={`w-2 h-2 rounded-full ${firm.is_active ? 'bg-emerald-500 animate-pulse' : 'bg-red-400'}`} />
                {firm.is_active ? 'Active' : 'Inactive'} Firm · <span className="font-mono text-xs">{firm.firm_code}</span>
              </p>
              <div className="space-y-2 text-sm">
                <div className="flex items-center gap-2">
                  <Mail className="w-3.5 h-3.5 text-gray-400" />
                  <span className="font-semibold text-gray-500">Email:</span>
                  <span className="text-gray-900">{firm.email}</span>
                </div>
                <div className="flex items-center gap-2">
                  <Phone className="w-3.5 h-3.5 text-gray-400" />
                  <span className="font-semibold text-gray-500">Phone:</span>
                  <span className="text-gray-900">{firm.phone_number}</span>
                </div>
                <div className="flex items-center gap-2">
                  <MapPin className="w-3.5 h-3.5 text-gray-400" />
                  <span className="font-semibold text-gray-500">Location:</span>
                  <span className="text-gray-900">{firm.city}, {firm.state}, {firm.country}</span>
                </div>
                <div className="flex items-center gap-2">
                  <Hash className="w-3.5 h-3.5 text-gray-400" />
                  <span className="font-semibold text-gray-500">Postal:</span>
                  <span className="text-gray-900">{firm.postal_code}</span>
                </div>
              </div>
            </div>
          </div>
        </div>

        {/* ── TABS ── */}
        <div className="flex bg-white border border-gray-200 rounded-xl p-1 shadow-sm h-fit">
          <button
            onClick={() => setActiveTab('Overview')}
            className={`px-5 py-2 text-sm font-semibold rounded-lg transition-all ${activeTab === 'Overview' ? 'bg-[#0e2340] text-white shadow' : 'text-gray-500 hover:text-gray-800 hover:bg-gray-50'}`}
          >
            Overview
          </button>
          <button
            onClick={() => setActiveTab('Billing')}
            className={`px-5 py-2 text-sm font-semibold rounded-lg transition-all ${activeTab === 'Billing' ? 'bg-[#0e2340] text-white shadow' : 'text-gray-500 hover:text-gray-800 hover:bg-gray-50'}`}
          >
            Billing
          </button>
        </div>
      </div>

      <hr className="border-gray-200 my-4" />

      {/* ── CONTENT RENDERING ── */}
      {activeTab === 'Overview' ? (
        <div className="space-y-6">
          {/* Info Cards */}
          <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
            {[
              { label: 'Subscription', value: firm.subscription_type, icon: DollarSign, color: 'text-purple-600', bg: 'bg-purple-100', capitalize: true },
              { label: 'Branches', value: firm.branches.length, icon: Building2, color: 'text-indigo-600', bg: 'bg-indigo-100' },
              { label: 'Created', value: formatDate(firm.created_at), icon: Calendar, color: 'text-blue-600', bg: 'bg-blue-100' },
              { label: 'Status', value: firm.is_active ? 'Active' : 'Inactive', icon: Shield, color: firm.is_active ? 'text-emerald-600' : 'text-red-600', bg: firm.is_active ? 'bg-emerald-100' : 'bg-red-100' },
            ].map((stat, idx) => {
              const Icon = stat.icon;
              return (
                <div key={idx} className="bg-white p-5 rounded-2xl border border-gray-100 shadow-sm flex items-center gap-4 hover:border-gray-200 transition-all">
                  <div className={`w-12 h-12 rounded-xl flex items-center justify-center shrink-0 ${stat.bg}`}>
                    <Icon className={`w-6 h-6 ${stat.color}`} />
                  </div>
                  <div>
                    <h3 className={`text-lg font-bold text-gray-900 ${stat.capitalize ? 'capitalize' : ''}`}>
                      {typeof stat.value === 'string' ? stat.value : stat.value.toLocaleString()}
                    </h3>
                    <p className="text-xs font-semibold text-gray-400 mt-0.5">{stat.label}</p>
                  </div>
                </div>
              );
            })}
          </div>

          {/* Full Details Card */}
          <div className="bg-white rounded-2xl border border-gray-100 shadow-sm p-6">
            <h2 className="text-sm font-bold text-gray-900 mb-4">Firm Details</h2>
            <div className="grid grid-cols-1 md:grid-cols-2 gap-x-10 gap-y-4">
              {[
                { label: 'Firm Name', value: firm.firm_name },
                { label: 'Firm Code', value: firm.firm_code },
                { label: 'Email', value: firm.email },
                { label: 'Phone', value: firm.phone_number },
                { label: 'Address', value: firm.address },
                { label: 'City', value: firm.city },
                { label: 'State', value: firm.state },
                { label: 'Country', value: firm.country },
                { label: 'Postal Code', value: firm.postal_code },
                { label: 'Website', value: firm.website || '—' },
                { label: 'Subscription', value: firm.subscription_type },
                { label: 'Last Updated', value: formatDate(firm.updated_at) },
              ].map((item, i) => (
                <div key={i} className="flex justify-between py-2 border-b border-gray-50">
                  <span className="text-sm font-semibold text-gray-400">{item.label}</span>
                  <span className="text-sm text-gray-800 capitalize">{item.value}</span>
                </div>
              ))}
            </div>
          </div>

          {/* Branches */}
          {firm.branches.length > 0 && (
            <div className="bg-white rounded-2xl border border-gray-100 shadow-sm p-6">
              <h2 className="text-sm font-bold text-gray-900 mb-4">Branches ({firm.branches.length})</h2>
              <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-4">
                {firm.branches.map((branch: any, idx: number) => (
                  <div key={idx} className="border border-gray-100 rounded-xl p-4 hover:border-gray-200 transition-colors">
                    <p className="font-semibold text-sm text-[#0e2340]">{branch.branch_name || `Branch ${idx + 1}`}</p>
                    <p className="text-xs text-gray-400 mt-1">{branch.city || 'N/A'}</p>
                  </div>
                ))}
              </div>
            </div>
          )}
        </div>
      ) : activeTab === 'Billing' ? (
        <div className="space-y-6">

          {/* ── Status Alert Banner ── */}
          {billingMsg && (
            <div className={`flex items-center gap-3 px-5 py-3.5 rounded-xl text-sm font-semibold ${billingMsg.type === 'success' ? 'bg-emerald-50 text-emerald-700 border border-emerald-200' : 'bg-red-50 text-red-700 border border-red-200'}`}>
              {billingMsg.type === 'success' ? <CheckCircle2 className="w-4 h-4 shrink-0" /> : <AlertTriangle className="w-4 h-4 shrink-0" />}
              {billingMsg.text}
              <button onClick={() => setBillingMsg(null)} className="ml-auto"><X className="w-4 h-4" /></button>
            </div>
          )}

          {/* ── Subscription Summary Cards ── */}
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
            {[
              {
                label: 'Plan', icon: Zap,
                value: <span className="capitalize">{firm.subscription_type}</span>,
                bg: 'bg-violet-50', color: 'text-violet-600',
              },
              {
                label: 'Status', icon: CheckCircle2,
                value: (
                  <span className={`inline-flex items-center gap-1 px-2 py-0.5 rounded-full text-xs font-bold ${
                    firm.subscription_status === 'active' ? 'bg-emerald-100 text-emerald-700'
                    : firm.subscription_status === 'trial' ? 'bg-blue-100 text-blue-700'
                    : 'bg-red-100 text-red-700'
                  }`}>
                    {firm.subscription_status ?? '—'}
                  </span>
                ),
                bg: 'bg-emerald-50', color: 'text-emerald-600',
              },
              {
                label: 'Days Until Expiry', icon: Clock,
                value: firm.days_until_expiry != null
                  ? <span className={firm.days_until_expiry <= 7 ? 'text-red-600 font-extrabold' : ''}>{firm.days_until_expiry}d</span>
                  : '—',
                bg: 'bg-amber-50', color: 'text-amber-600',
              },
              {
                label: 'Account', icon: Shield,
                value: firm.is_suspended
                  ? <span className="text-red-600 font-bold">Suspended</span>
                  : <span className="text-emerald-600 font-bold">Active</span>,
                bg: firm.is_suspended ? 'bg-red-50' : 'bg-emerald-50',
                color: firm.is_suspended ? 'text-red-600' : 'text-emerald-600',
              },
            ].map((card, i) => {
              const Icon = card.icon;
              return (
                <div key={i} className="bg-white rounded-2xl border border-gray-100 shadow-sm p-5 flex items-center gap-4 hover:border-gray-200 transition-all">
                  <div className={`w-11 h-11 rounded-xl flex items-center justify-center shrink-0 ${card.bg}`}>
                    <Icon className={`w-5 h-5 ${card.color}`} />
                  </div>
                  <div>
                    <p className="text-xs font-semibold text-gray-400 mb-1">{card.label}</p>
                    <div className="text-base font-bold text-gray-900">{card.value}</div>
                  </div>
                </div>
              );
            })}
          </div>

          {/* ── Subscription Details & Edit ── */}
          <div className="bg-white rounded-2xl border border-gray-100 shadow-sm p-6">
            <div className="flex items-center justify-between mb-5">
              <div>
                <h2 className="text-base font-bold text-gray-900 flex items-center gap-2">
                  <CreditCard className="w-4 h-4 text-gray-400" /> Subscription Details
                </h2>
                <p className="text-xs text-gray-400 mt-0.5">Manage plan type, expiry dates and account suspension.</p>
              </div>
              <div className="flex gap-2">
                {!billingEdit ? (
                  <button
                    onClick={() => { setBillingEdit(true); setBillingMsg(null); }}
                    className="flex items-center gap-1.5 px-4 py-2 text-sm font-semibold text-[#0e2340] border border-[#0e2340]/20 bg-[#0e2340]/5 rounded-xl hover:bg-[#0e2340]/10 transition-colors"
                  >
                    <Edit className="w-3.5 h-3.5" /> Edit
                  </button>
                ) : (
                  <>
                    <button
                      onClick={() => { setBillingEdit(false); setBillingMsg(null); setBillingForm({ subscription_type: firm.subscription_type, subscription_end_date: firm.subscription_end_date ? firm.subscription_end_date.slice(0,16) : '', trial_end_date: firm.trial_end_date ? firm.trial_end_date.slice(0,16) : '', is_suspended: firm.is_suspended ?? false }); }}
                      className="flex items-center gap-1.5 px-4 py-2 text-sm font-semibold text-gray-600 border border-gray-200 bg-white rounded-xl hover:bg-gray-50 transition-colors"
                    >
                      <X className="w-3.5 h-3.5" /> Discard
                    </button>
                    <button
                      onClick={handleBillingSave}
                      disabled={billingSaving}
                      className="flex items-center gap-1.5 px-4 py-2 text-sm font-semibold text-white bg-[#0e2340] rounded-xl hover:opacity-90 transition-opacity disabled:opacity-60"
                    >
                      {billingSaving ? <Loader2 className="w-3.5 h-3.5 animate-spin" /> : <Save className="w-3.5 h-3.5" />}
                      {billingSaving ? 'Saving…' : 'Save Changes'}
                    </button>
                  </>
                )}
              </div>
            </div>

            {billingEdit ? (
              <div className="space-y-5">
                <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                  <div>
                    <label className="block text-sm font-semibold text-gray-700 mb-1.5">Subscription Plan</label>
                    <select
                      value={billingForm.subscription_type}
                      onChange={e => setBillingForm({ ...billingForm, subscription_type: e.target.value })}
                      className="w-full h-11 px-4 bg-gray-50 border border-gray-200 rounded-xl text-sm text-gray-900 focus:outline-none focus:ring-2 focus:ring-[#0e2340]/20 focus:border-[#0e2340] focus:bg-white"
                    >
                      <option value="trial">Trial</option>
                      <option value="basic">Basic</option>
                      <option value="professional">Professional</option>
                      <option value="enterprise">Enterprise</option>
                    </select>
                  </div>
                  <div className="flex flex-col">
                    <label className="block text-sm font-semibold text-gray-700 mb-2">Account Suspension</label>
                    <div className="flex items-center gap-3 mt-1.5">
                      <button
                        type="button"
                        onClick={() => setBillingForm({ ...billingForm, is_suspended: !billingForm.is_suspended })}
                        className={`relative inline-flex h-6 w-11 shrink-0 cursor-pointer rounded-full border-2 border-transparent transition-colors duration-200 ${billingForm.is_suspended ? 'bg-red-500' : 'bg-gray-200'}`}
                      >
                        <span className={`pointer-events-none inline-block h-5 w-5 transform rounded-full bg-white shadow ring-0 transition duration-200 ${billingForm.is_suspended ? 'translate-x-5' : 'translate-x-0'}`} />
                      </button>
                      <span className={`text-sm font-semibold ${billingForm.is_suspended ? 'text-red-600' : 'text-gray-400'}`}>
                        {billingForm.is_suspended ? 'Suspended' : 'Not Suspended'}
                      </span>
                    </div>
                  </div>
                </div>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
                  <div>
                    <label className="block text-sm font-semibold text-gray-700 mb-1.5">Subscription End Date</label>
                    <input
                      type="datetime-local"
                      value={billingForm.subscription_end_date}
                      onChange={e => setBillingForm({ ...billingForm, subscription_end_date: e.target.value })}
                      className="w-full h-11 px-4 bg-gray-50 border border-gray-200 rounded-xl text-sm text-gray-900 focus:outline-none focus:ring-2 focus:ring-[#0e2340]/20 focus:border-[#0e2340] focus:bg-white"
                    />
                  </div>
                  <div>
                    <label className="block text-sm font-semibold text-gray-700 mb-1.5">Trial End Date</label>
                    <input
                      type="datetime-local"
                      value={billingForm.trial_end_date}
                      onChange={e => setBillingForm({ ...billingForm, trial_end_date: e.target.value })}
                      className="w-full h-11 px-4 bg-gray-50 border border-gray-200 rounded-xl text-sm text-gray-900 focus:outline-none focus:ring-2 focus:ring-[#0e2340]/20 focus:border-[#0e2340] focus:bg-white"
                    />
                  </div>
                </div>
              </div>
            ) : (
              <div className="grid grid-cols-1 md:grid-cols-2 gap-x-10 gap-y-4">
                {[
                  { label: 'Subscription Type', value: <span className="capitalize">{firm.subscription_type}</span> },
                  { label: 'Subscription Status', value: firm.subscription_status ?? '—' },
                  { label: 'Subscription End Date', value: formatDateFull(firm.subscription_end_date) },
                  { label: 'Trial End Date', value: formatDateFull(firm.trial_end_date) },
                  { label: 'Days Until Expiry', value: firm.days_until_expiry != null ? `${firm.days_until_expiry} days` : '—' },
                  { label: 'Account Suspended', value: firm.is_suspended ? <span className="text-red-600 font-bold">Yes</span> : <span className="text-emerald-600 font-bold">No</span> },
                ].map((row, i) => (
                  <div key={i} className="flex justify-between items-center py-2.5 border-b border-gray-50">
                    <span className="text-sm font-semibold text-gray-400">{row.label}</span>
                    <span className="text-sm text-gray-900">{row.value}</span>
                  </div>
                ))}
              </div>
            )}
          </div>

          {/* ── Renew Subscription ── */}
          <div className="bg-gradient-to-br from-[#0e2340] to-[#1a3a5c] rounded-2xl p-6 text-white relative overflow-hidden">
            <div className="absolute top-0 right-0 p-6 opacity-5 pointer-events-none">
              <RefreshCw className="w-40 h-40" />
            </div>
            <div className="relative z-10 flex flex-col md:flex-row items-start md:items-center justify-between gap-5">
              <div>
                <div className="flex items-center gap-2 mb-1">
                  <RefreshCw className="w-4 h-4 text-blue-300" />
                  <span className="text-xs font-bold uppercase tracking-wider text-blue-300">Renew Subscription</span>
                </div>
                <h3 className="text-lg font-bold">Extend this firm's access</h3>
                <p className="text-sm text-blue-200 mt-1">Manually process a payment and renew the subscription for a defined period.</p>
              </div>
              <button
                onClick={() => { setRenewOpen(true); setRenewMsg(null); }}
                className="shrink-0 px-5 py-2.5 bg-white text-[#0e2340] text-sm font-bold rounded-xl hover:bg-blue-50 transition-colors shadow-md flex items-center gap-2"
              >
                <RefreshCw className="w-4 h-4" /> Renew Now
              </button>
            </div>
          </div>

          {/* ── Branch Limits Info ── */}
          <div className="bg-white rounded-2xl border border-gray-100 shadow-sm p-6">
            <h2 className="text-sm font-bold text-gray-900 mb-4 flex items-center gap-2">
              <Building2 className="w-4 h-4 text-gray-400" /> Branch Allocation
            </h2>
            <div className="grid grid-cols-3 gap-4 text-center">
              {[
                { label: 'Branch Limit', value: firm.branch_limit ?? '—' },
                { label: 'Used', value: firm.current_branch_count ?? 0 },
                { label: 'Remaining', value: firm.remaining_branches ?? '—' },
              ].map((item, i) => (
                <div key={i} className="bg-gray-50 rounded-xl p-4 border border-gray-100">
                  <p className="text-2xl font-extrabold text-gray-900">{item.value}</p>
                  <p className="text-xs font-semibold text-gray-400 mt-1">{item.label}</p>
                </div>
              ))}
            </div>
            <div className="mt-4">
              <div className="flex justify-between text-xs text-gray-400 font-medium mb-1.5">
                <span>Branch usage</span>
                <span>{firm.current_branch_count ?? 0} / {firm.branch_limit ?? '?'}</span>
              </div>
              <div className="w-full bg-gray-100 rounded-full h-2">
                <div
                  className="bg-[#0e2340] h-2 rounded-full transition-all"
                  style={{ width: firm.branch_limit ? `${Math.min(100, ((firm.current_branch_count ?? 0) / firm.branch_limit) * 100)}%` : '0%' }}
                />
              </div>
            </div>
          </div>

          {/* ── Renew Modal ── */}
          {renewOpen && (
            <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/40 backdrop-blur-sm px-4">
              <div className="bg-white rounded-2xl shadow-2xl w-full max-w-md p-7">
                <div className="flex items-start justify-between mb-6">
                  <div>
                    <h2 className="text-lg font-bold text-gray-900 flex items-center gap-2">
                      <RefreshCw className="w-5 h-5 text-[#0e2340]" /> Renew Subscription
                    </h2>
                    <p className="text-sm text-gray-400 mt-1">Process a manual payment to extend access.</p>
                  </div>
                  <button onClick={() => setRenewOpen(false)} className="p-1.5 rounded-lg hover:bg-gray-100 transition-colors">
                    <X className="w-5 h-5 text-gray-400" />
                  </button>
                </div>

                {renewMsg && (
                  <div className={`flex items-center gap-2 px-4 py-3 rounded-xl text-sm font-semibold mb-4 ${renewMsg.type === 'success' ? 'bg-emerald-50 text-emerald-700 border border-emerald-200' : 'bg-red-50 text-red-700 border border-red-200'}`}>
                    {renewMsg.type === 'success' ? <CheckCircle2 className="w-4 h-4 shrink-0" /> : <AlertTriangle className="w-4 h-4 shrink-0" />}
                    {renewMsg.text}
                  </div>
                )}

                <div className="space-y-4">
                  <div>
                    <label className="block text-sm font-semibold text-gray-700 mb-2">Select Plan</label>
                    <div className="grid grid-cols-2 gap-2.5">
                      {SUBSCRIPTION_PLANS.map(plan => (
                        <button
                          key={plan.id}
                          type="button"
                          onClick={() => setRenewForm({ ...renewForm, plan_id: plan.id })}
                          className={`flex flex-col items-start p-3.5 rounded-xl border-2 text-left transition-all ${
                            renewForm.plan_id === plan.id
                              ? 'border-[#0e2340] bg-[#0e2340]/5'
                              : 'border-gray-100 bg-gray-50 hover:border-gray-300'
                          }`}
                        >
                          <div className="flex items-center justify-between w-full mb-1">
                            <span className={`text-sm font-bold ${ renewForm.plan_id === plan.id ? 'text-[#0e2340]' : 'text-gray-800' }`}>
                              {plan.name}
                            </span>
                            {renewForm.plan_id === plan.id && (
                              <span className="w-4 h-4 rounded-full bg-[#0e2340] flex items-center justify-center shrink-0">
                                <CheckCircle2 className="w-3 h-3 text-white" />
                              </span>
                            )}
                          </div>
                          <span className="text-xs font-semibold text-gray-500">
                            {plan.price}{plan.period ? ` / ${plan.period}` : ''}
                          </span>
                        </button>
                      ))}
                    </div>
                  </div>
                  <div>
                    <label className="block text-sm font-semibold text-gray-700 mb-1.5">Duration (Months)</label>
                    <input
                      type="number"
                      min={1} max={36}
                      value={renewForm.duration_months}
                      onChange={e => setRenewForm({ ...renewForm, duration_months: Math.max(1, parseInt(e.target.value) || 1) })}
                      className="w-full h-11 px-4 bg-gray-50 border border-gray-200 rounded-xl text-sm text-gray-900 focus:outline-none focus:ring-2 focus:ring-[#0e2340]/20 focus:border-[#0e2340] focus:bg-white"
                    />
                  </div>
                </div>

                <div className="flex gap-3 mt-6 pt-5 border-t border-gray-100">
                  <button
                    onClick={() => setRenewOpen(false)}
                    className="flex-1 py-2.5 text-sm font-semibold text-gray-600 border border-gray-200 rounded-xl hover:bg-gray-50 transition-colors"
                  >
                    Cancel
                  </button>
                  <button
                    onClick={handleRenew}
                    disabled={renewing || !renewForm.plan_id.trim()}
                    className="flex-1 py-2.5 text-sm font-semibold text-white bg-[#0e2340] rounded-xl hover:opacity-90 transition-opacity disabled:opacity-50 flex items-center justify-center gap-2"
                  >
                    {renewing ? <Loader2 className="w-4 h-4 animate-spin" /> : <RefreshCw className="w-4 h-4" />}
                    {renewing ? 'Processing…' : 'Confirm Renewal'}
                  </button>
                </div>
              </div>
            </div>
          )}
        </div>

      ) : activeTab === 'Settings' ? (
        <div className="bg-white rounded-2xl border border-gray-100 shadow-sm p-8 max-w-2xl">
          <div className="mb-6 border-b border-gray-100 pb-4">
            <h2 className="text-lg font-bold text-gray-900 flex items-center gap-2"><Edit className="w-5 h-5 text-gray-400" /> Edit Firm Profile</h2>
            <p className="text-sm text-gray-500 mt-1">Update the core contact identity and metadata for this law firm.</p>
          </div>

          <div className="flex items-center gap-6 mb-6">
            <div className="relative group w-24 h-24 rounded-2xl border-2 border-dashed border-gray-200 bg-gray-50 flex items-center justify-center overflow-hidden shrink-0">
              <input type="file" accept="image/*" onChange={(e) => {
                const file = e.target.files?.[0];
                if (file) {
                  setLogoFile(file);
                  setLogoPreview(URL.createObjectURL(file));
                }
              }} className="absolute inset-0 w-full h-full opacity-0 cursor-pointer z-10" />
              {logoPreview ? (
                <>
                  <img src={logoPreview} alt="Logo" className="w-full h-full object-cover" />
                  <div className="absolute inset-0 bg-black/40 flex items-center justify-center opacity-0 group-hover:opacity-100 transition-opacity">
                    <Upload className="w-6 h-6 text-white" />
                  </div>
                </>
              ) : (
                <Upload className="w-8 h-8 text-gray-300 group-hover:text-gray-400 transition-colors" />
              )}
            </div>
            <div>
              <h3 className="text-sm font-semibold text-gray-900">Firm Logo</h3>
              <p className="text-xs text-gray-500 mt-1 mb-3">Upload a square image (max 5MB).</p>
              {logoPreview && (
                <button
                  type="button"
                  onClick={() => {
                    setLogoFile('REMOVE');
                    setLogoPreview(null);
                  }}
                  className="text-xs font-semibold text-red-500 hover:text-red-600 flex items-center gap-1 bg-red-50 px-2 py-1 rounded"
                >
                  <Trash2 className="w-3.5 h-3.5" /> Remove Logo
                </button>
              )}
            </div>
          </div>

          <div className="space-y-5">
            <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
              <div>
                <label className="block text-sm font-semibold text-gray-700 mb-1.5">Firm Name</label>
                <input
                  type="text"
                  value={editedDetails.firm_name}
                  onChange={(e) => setEditedDetails({ ...editedDetails, firm_name: e.target.value })}
                  className="w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg text-sm text-gray-900 focus:outline-none focus:ring-2 focus:ring-[#0e2340]/20 focus:border-[#0e2340] focus:bg-white"
                />
              </div>
              <div>
                <label className="block text-sm font-semibold text-gray-700 mb-1.5">Website</label>
                <input
                  type="text"
                  value={editedDetails.website}
                  onChange={(e) => setEditedDetails({ ...editedDetails, website: e.target.value })}
                  placeholder="https://example.com"
                  className="w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg text-sm text-gray-900 focus:outline-none focus:ring-2 focus:ring-[#0e2340]/20 focus:border-[#0e2340] focus:bg-white"
                />
              </div>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
              <div>
                <label className="block text-sm font-semibold text-gray-700 mb-1.5">Email Address</label>
                <input
                  type="email"
                  value={editedDetails.email}
                  onChange={(e) => setEditedDetails({ ...editedDetails, email: e.target.value })}
                  className="w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg text-sm text-gray-900 focus:outline-none focus:ring-2 focus:ring-[#0e2340]/20 focus:border-[#0e2340] focus:bg-white"
                />
              </div>
              <div>
                <label className="block text-sm font-semibold text-gray-700 mb-1.5">Phone Number</label>
                <input
                  type="text"
                  value={editedDetails.phone_number}
                  onChange={(e) => setEditedDetails({ ...editedDetails, phone_number: e.target.value.replace(/\D/g, '').slice(0, 10) })}
                  maxLength={10}
                  placeholder="9876543210"
                  className="w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg text-sm text-gray-900 focus:outline-none focus:ring-2 focus:ring-[#0e2340]/20 focus:border-[#0e2340] focus:bg-white"
                />
              </div>
            </div>

            <div>
              <label className="block text-sm font-semibold text-gray-700 mb-1.5">Full Office Address</label>
              <textarea
                rows={2}
                value={editedDetails.address}
                onChange={(e) => setEditedDetails({ ...editedDetails, address: e.target.value })}
                className="w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg text-sm text-gray-900 focus:outline-none focus:ring-2 focus:ring-[#0e2340]/20 focus:border-[#0e2340] focus:bg-white resize-none"
              />
            </div>

            <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
              <div>
                <label className="block text-sm font-semibold text-gray-700 mb-1.5">City</label>
                <input
                  type="text"
                  value={editedDetails.city}
                  onChange={(e) => setEditedDetails({ ...editedDetails, city: e.target.value })}
                  className="w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg text-sm text-gray-900 focus:outline-none focus:ring-2 focus:ring-[#0e2340]/20 focus:border-[#0e2340] focus:bg-white"
                />
              </div>
              <div>
                <label className="block text-sm font-semibold text-gray-700 mb-1.5">State</label>
                <input
                  type="text"
                  value={editedDetails.state}
                  onChange={(e) => setEditedDetails({ ...editedDetails, state: e.target.value })}
                  className="w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg text-sm text-gray-900 focus:outline-none focus:ring-2 focus:ring-[#0e2340]/20 focus:border-[#0e2340] focus:bg-white"
                />
              </div>
              <div>
                <label className="block text-sm font-semibold text-gray-700 mb-1.5">Country</label>
                <input
                  type="text"
                  value={editedDetails.country}
                  onChange={(e) => setEditedDetails({ ...editedDetails, country: e.target.value })}
                  className="w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg text-sm text-gray-900 focus:outline-none focus:ring-2 focus:ring-[#0e2340]/20 focus:border-[#0e2340] focus:bg-white"
                />
              </div>
              <div>
                <label className="block text-sm font-semibold text-gray-700 mb-1.5">Postal Code</label>
                <input
                  type="text"
                  value={editedDetails.postal_code}
                  onChange={(e) => setEditedDetails({ ...editedDetails, postal_code: e.target.value.replace(/\D/g, '') })}
                  placeholder="400001"
                  className="w-full px-4 py-2.5 bg-gray-50 border border-gray-200 rounded-lg text-sm text-gray-900 focus:outline-none focus:ring-2 focus:ring-[#0e2340]/20 focus:border-[#0e2340] focus:bg-white"
                />
              </div>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-5">
              <div>
                <label className="block text-sm font-semibold text-gray-700 mb-1.5">Subscription Plan</label>
                <select
                  value={editedDetails.subscription_type}
                  onChange={(e) => setEditedDetails({ ...editedDetails, subscription_type: e.target.value })}
                  className="w-full h-11 px-4 bg-gray-50 border border-gray-200 rounded-lg text-sm text-gray-900 focus:outline-none focus:ring-2 focus:ring-[#0e2340]/20 focus:border-[#0e2340] focus:bg-white"
                >
                  <option value="trial">Trial</option>
                  <option value="basic">Basic</option>
                  <option value="professional">Professional</option>
                  <option value="enterprise">Enterprise</option>
                </select>
              </div>
              <div className="flex flex-col">
                <label className="block text-sm font-semibold text-gray-700 mb-2">Account Status</label>
                <div className="flex items-center gap-3 mt-1">
                  <button
                    onClick={() => setEditedDetails({ ...editedDetails, is_active: !editedDetails.is_active })}
                    className={`relative inline-flex h-6 w-11 shrink-0 cursor-pointer rounded-full border-2 border-transparent transition-colors duration-200 ease-in-out outline-none ${editedDetails.is_active ? 'bg-emerald-500' : 'bg-gray-200'}`}
                  >
                    <span className={`pointer-events-none inline-block h-5 w-5 transform rounded-full bg-white shadow ring-0 transition duration-200 ease-in-out ${editedDetails.is_active ? 'translate-x-5' : 'translate-x-0'}`} />
                  </button>
                  <span className={`text-sm font-semibold ${editedDetails.is_active ? 'text-emerald-600' : 'text-gray-400'}`}>
                    {editedDetails.is_active ? 'Active' : 'Inactive'}
                  </span>
                </div>
              </div>
            </div>

            <div className="pt-4 border-t border-gray-100 mt-6 flex gap-3 justify-end">
              <button
                onClick={() => {
                  setEditedDetails({
                    firm_name: firm.firm_name,
                    email: firm.email,
                    phone_number: firm.phone_number,
                    subscription_type: firm.subscription_type,
                    is_active: firm.is_active,
                    website: firm.website || '',
                    address: firm.address || '',
                    city: firm.city || '',
                    state: firm.state || '',
                    country: firm.country || 'India',
                    postal_code: firm.postal_code || '',
                  });
                  setLogoFile(null);
                  setLogoPreview(firm.logo ? (firm.logo.startsWith('http') ? firm.logo : `${API_BASE_URL}${firm.logo}`) : null);
                }}
                className="px-5 py-2.5 text-sm font-semibold text-gray-600 bg-white border border-gray-300 rounded-lg hover:bg-gray-50 transition-colors"
              >
                Discard Changes
              </button>
              <button
                onClick={handleSave}
                className="px-5 py-2.5 text-sm font-semibold text-white bg-[#0e2340] rounded-lg hover:opacity-90 transition-opacity flex items-center gap-2"
              >
                <Save className="w-4 h-4" /> Save Profile
              </button>
            </div>
          </div>
        </div>
      ) : null}
    </div>
  );
}
