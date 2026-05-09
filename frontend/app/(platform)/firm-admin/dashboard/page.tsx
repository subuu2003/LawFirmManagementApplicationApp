'use client';

import { useState, useEffect } from 'react';
import Link from 'next/link';
import {
  Briefcase, Users, FileText, ArrowRight,
  Calendar, Building2, UserCheck, Clock,
  Loader2, AlertCircle, Bell, ChevronDown,
  History, ShieldCheck, LogOut, ReceiptText, UserPlus, LogIn
} from 'lucide-react';
import {
  PieChart, Pie, Cell, ResponsiveContainer, Tooltip,
} from 'recharts';
import { customFetch } from '@/lib/fetch';
import { API } from '@/lib/api';

// ─── STYLING CONSTANTS ──────────────────────────────────────────────────────
const BLUE_GRADIENT = 'linear-gradient(135deg, #3B82F6 0%, #2563EB 100%)';
const ICON_COLORS = {
  clients: '#22C55E',
  documents: '#8B5CF6',
  team: '#F97316',
  pending: '#EAB308',
  upcoming: '#3B82F6',
};

// ─── TYPES ──────────────────────────────────────────────────────────────────
interface Activity {
  action: string;
  description: string;
  created_at: string;
  user__email: string;
}

interface DashboardData {
  role: string;
  role_display: string;
  user_name: string;
  user_id: string;
  cards: {
    total_cases: { total: number; running: number; disposed: number; closed: number };
    total_clients: number;
    total_documents: number;
    team_members: number;
    todos: { pending: number; upcoming: number };
  };
  firm_info: { name: string; code: string; subscription: string };
  branch_info: { name: string; code: string; city: string; state: string; phone_number: string; email: string };
  recent_activity: Activity[];
}

// ─── HELPERS ────────────────────────────────────────────────────────────────
const getActionIcon = (action: string) => {
  switch (action) {
    case 'login': return { icon: LogIn, color: '#3B82F6', bg: '#EFF6FF' };
    case 'logout': return { icon: LogOut, color: '#EF4444', bg: '#FEF2F2' };
    case 'create_invoice': return { icon: ReceiptText, color: '#8B5CF6', bg: '#F5F3FF' };
    case 'create_user': return { icon: UserPlus, color: '#10B981', bg: '#ECFDF5' };
    default: return { icon: History, color: '#64748B', bg: '#F1F5F9' };
  }
};

const formatDate = (dateStr: string) => {
  return new Date(dateStr).toLocaleDateString('en-US', {
    month: 'short', day: 'numeric', year: 'numeric', hour: '2-digit', minute: '2-digit'
  });
};

// ─── COMPONENT ──────────────────────────────────────────────────────────────
export default function FirmAdminDashboard() {
  const [data, setData] = useState<DashboardData | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    const fetchDashboard = async () => {
      try {
        setLoading(true);
        const response = await customFetch(API.DASHBOARD.GET);
        const json = await response.json();
        if (!response.ok) throw new Error(json.detail || 'Failed to load');
        setData(json);
      } catch (err: any) {
        setError(err.message);
      } finally {
        setLoading(false);
      }
    };
    fetchDashboard();
  }, []);

  if (loading) return (
    <div className="min-h-screen bg-[#F8FAFC] flex items-center justify-center">
      <Loader2 className="w-8 h-8 animate-spin text-blue-600" />
    </div>
  );

  if (error || !data) return (
    <div className="min-h-screen flex items-center justify-center p-6 text-red-500">
      <AlertCircle className="mr-2" /> {error || 'Data unavailable'}
    </div>
  );

  const { cards, firm_info, branch_info, user_name, recent_activity, user_id, role_display } = data;

  const caseStatusData = [
    { name: 'Running', value: cards.total_cases.running, color: '#3B82F6' },
    { name: 'Disposed', value: cards.total_cases.disposed, color: '#22C55E' },
    { name: 'Closed', value: cards.total_cases.closed, color: '#94A3B8' },
  ];

  return (
    <div className="min-h-screen bg-[#F8FAFC] p-4 font-sans text-slate-800">
      <div className="max-w-[1600px] mx-auto space-y-5">

        {/* ── TOP HEADER ── */}
        <header className="flex justify-between items-center bg-white rounded-2xl border border-slate-100 shadow-sm px-6 py-4">
          <div>
            <p className="text-[10px] font-bold text-slate-400 uppercase tracking-widest">Dashboard Overview</p>
            <h1 className="text-xl font-black text-slate-900 mt-0.5">Welcome, {user_name}</h1>
          </div>
          <div className="flex items-center gap-4">
            <div className="text-right hidden md:block">
              <p className="text-[10px] font-bold text-slate-400 uppercase">Current Session</p>
              <p className="text-sm font-bold text-slate-700">{role_display}</p>
            </div>
            <div className="flex items-center gap-3 pl-4 border-l border-slate-100">


            </div>
          </div>
        </header>

        <div className="grid lg:grid-cols-12 gap-5">

          {/* ── LEFT COLUMN (Main Content) ── */}
          <div className="lg:col-span-9 space-y-5">

            {/* Firm & Branch Info Card */}
            <div className="bg-white rounded-2xl border border-slate-100 shadow-sm p-5 flex flex-col md:flex-row items-center gap-6">
              <div className="w-16 h-16 rounded-2xl bg-slate-900 flex items-center justify-center text-white text-xl font-bold shrink-0">
                {firm_info.name.substring(0, 2).toUpperCase()}
              </div>
              <div className="flex-1 text-center md:text-left">
                <h2 className="text-lg font-bold text-slate-900">{firm_info.name}</h2>
                <p className="text-xs text-slate-400 font-medium mt-0.5">Firm Code: {firm_info.code}</p>
              </div>
              <div className="grid grid-cols-2 md:grid-cols-3 gap-x-8 gap-y-3 w-full md:w-auto pt-4 md:pt-0 border-t md:border-t-0 md:border-l md:pl-8 border-slate-100">
                <div>
                  <p className="text-[10px] font-bold text-slate-400 uppercase mb-0.5">Branch</p>
                  <p className="text-xs font-bold text-slate-800">{branch_info.name}</p>
                  <p className="text-[10px] text-slate-500 font-medium">{branch_info.city}, {branch_info.state}</p>
                </div>
                <div>
                  <p className="text-[10px] font-bold text-slate-400 uppercase mb-0.5">Contact</p>
                  <p className="text-xs font-bold text-slate-800">{branch_info.phone_number}</p>
                  <p className="text-[10px] text-slate-500 font-medium">{branch_info.email}</p>
                </div>
                <div className="col-span-2 md:col-span-1">
                  <p className="text-[10px] font-bold text-slate-400 uppercase mb-1">Status</p>
                  <span className="px-3 py-1 bg-blue-50 text-blue-600 rounded-lg text-[10px] font-bold uppercase tracking-wide border border-blue-100">
                    {firm_info.subscription}
                  </span>
                </div>
              </div>
            </div>

            {/* Stats Grid */}
            <div className="grid md:grid-cols-3 gap-4">
              {/* Total Cases Big Card */}
              <div className="md:col-span-1 rounded-2xl p-6 text-white relative overflow-hidden shadow-lg shadow-blue-500/10" style={{ background: BLUE_GRADIENT }}>
                <div className="relative z-10 flex flex-col h-full justify-between">
                  <div>
                    <div className="flex justify-between items-start">
                      <p className="text-xs font-bold opacity-80 uppercase tracking-widest">Total Cases</p>
                      <Briefcase size={18} className="opacity-40" />
                    </div>
                    <p className="text-5xl font-black mt-2 tracking-tighter">{cards.total_cases.total}</p>
                  </div>
                  <div className="mt-8 grid grid-cols-3 gap-2">
                    {caseStatusData.map(s => (
                      <div key={s.name} className="bg-white/10 backdrop-blur-md rounded-xl p-2 border border-white/5">
                        <p className="text-[8px] font-bold opacity-60 uppercase mb-0.5">{s.name}</p>
                        <p className="text-xs font-bold">{s.value}</p>
                      </div>
                    ))}
                  </div>
                </div>
              </div>

              {/* Smaller Cards Grid */}
              <div className="md:col-span-2 grid grid-cols-2 md:grid-cols-3 gap-4">
                {[
                  { label: 'Total Clients', val: cards.total_clients, icon: Users, color: ICON_COLORS.clients, bg: '#F0FDF4' },
                  { label: 'Cloud Vault', val: cards.total_documents, icon: FileText, color: ICON_COLORS.documents, bg: '#F5F3FF' },
                  { label: 'Team Members', val: cards.team_members, icon: UserCheck, color: ICON_COLORS.team, bg: '#FFF7ED' },
                  { label: 'Pending Tasks', val: cards.todos.pending, icon: Clock, color: ICON_COLORS.pending, bg: '#FEFCE8' },
                  { label: 'Upcoming', val: cards.todos.upcoming, icon: Calendar, color: ICON_COLORS.upcoming, bg: '#EFF6FF' },
                ].map((s, idx) => (
                  <div key={idx} className="bg-white p-4 rounded-2xl border border-slate-100 shadow-sm flex flex-col justify-between hover:border-blue-200 transition-all">
                    <div className="w-10 h-10 rounded-xl flex items-center justify-center shrink-0 mb-3" style={{ background: s.bg }}>
                      <s.icon size={18} style={{ color: s.color }} />
                    </div>
                    <div>
                      <p className="text-[10px] font-bold text-slate-400 uppercase mb-0.5">{s.label}</p>
                      <p className="text-xl font-black text-slate-900">{s.val}</p>
                    </div>
                  </div>
                ))}
                <Link href="/firm-admin/cases/new" className="group">
                  <div className="bg-slate-900 h-full p-4 rounded-2xl border border-slate-800 shadow-sm flex flex-col justify-center items-center text-center hover:bg-slate-800 transition-all">
                    <div className="w-8 h-8 rounded-full bg-white/10 flex items-center justify-center mb-2 group-hover:scale-110 transition-transform">
                      <ArrowRight size={16} className="text-white" />
                    </div>
                    <p className="text-[10px] font-bold text-white uppercase tracking-widest">New Case</p>
                  </div>
                </Link>
              </div>
            </div>

            {/* Analytics & Distribution */}
            <div className="bg-white rounded-2xl border border-slate-100 shadow-sm p-6">
              <div className="flex justify-between items-center mb-6">
                <h3 className="font-bold text-slate-900 text-sm uppercase tracking-widest">Matter Statistics</h3>
                <div className="flex items-center gap-2">
                  <span className="w-2 h-2 rounded-full bg-emerald-500 animate-pulse" />
                  <span className="text-[10px] font-bold text-slate-400 uppercase tracking-widest">Live Sync</span>
                </div>
              </div>
              <div className="grid md:grid-cols-5 gap-8 items-center">
                <div className="md:col-span-2 h-[180px]">
                  <ResponsiveContainer width="100%" height="100%">
                    <PieChart>
                      <Pie data={caseStatusData} innerRadius={55} outerRadius={75} paddingAngle={5} dataKey="value" stroke="none">
                        {caseStatusData.map((entry, index) => <Cell key={`cell-${index}`} fill={entry.color} />)}
                      </Pie>
                      <Tooltip
                        contentStyle={{ borderRadius: '12px', border: 'none', boxShadow: '0 4px 12px rgba(0,0,0,0.1)', fontSize: '12px', fontWeight: 'bold' }}
                      />
                    </PieChart>
                  </ResponsiveContainer>
                </div>
                <div className="md:col-span-3 grid grid-cols-1 sm:grid-cols-2 gap-3">
                  {caseStatusData.map(d => (
                    <div key={d.name} className="flex items-center justify-between p-3 rounded-xl border border-slate-50 bg-slate-50/50">
                      <div className="flex items-center gap-2">
                        <span className="w-2 h-2 rounded-full" style={{ background: d.color }} />
                        <span className="text-xs font-bold text-slate-500">{d.name}</span>
                      </div>
                      <div className="flex items-center gap-3">
                        <span className="text-sm font-black text-slate-800">{d.value}</span>
                        <span className="text-[10px] font-bold text-slate-300 italic">{cards.total_cases.total > 0 ? Math.round((d.value / cards.total_cases.total) * 100) : 0}%</span>
                      </div>
                    </div>
                  ))}
                </div>
              </div>
            </div>
          </div>

          {/* ── RIGHT COLUMN (Activity) ── */}
          <div className="lg:col-span-3">
            <div className="bg-white rounded-2xl border border-slate-100 shadow-sm h-full flex flex-col">
              <div className="p-5 border-b border-slate-50 flex justify-between items-center">
                <h3 className="font-bold text-slate-900 text-xs uppercase tracking-widest">Recent Activity</h3>
                <Link href="#" className="text-[10px] font-bold text-blue-600 bg-blue-50 px-2 py-1 rounded-md border border-blue-100">View All</Link>
              </div>
              <div className="flex-1 overflow-y-auto p-5 space-y-6 relative max-h-[500px] lg:max-h-none">
                <div className="absolute left-8 top-8 bottom-8 w-px bg-slate-50" />
                {recent_activity.map((act, i) => {
                  const style = getActionIcon(act.action);
                  return (
                    <div key={i} className="flex gap-4 relative z-10">
                      <div className="w-8 h-8 rounded-xl flex items-center justify-center shrink-0 shadow-sm border border-white" style={{ background: style.bg }}>
                        <style.icon size={14} style={{ color: style.color }} />
                      </div>
                      <div className="space-y-0.5">
                        <p className="text-[11px] font-bold text-slate-800 leading-tight">{act.description}</p>
                        <p className="text-[9px] font-medium text-slate-400 italic truncate max-w-[140px]">{act.user__email}</p>
                        <p className="text-[9px] font-black text-slate-300 uppercase mt-1 flex items-center gap-1">
                          <Clock size={8} /> {formatDate(act.created_at)}
                        </p>
                      </div>
                    </div>
                  );
                })}
              </div>
              <div className="p-5 border-t border-slate-50">
                <button className="w-full py-2.5 bg-slate-50 text-slate-600 text-[10px] font-bold rounded-xl flex items-center justify-center gap-2 hover:bg-slate-100 transition-all uppercase tracking-widest">
                  System Audit Log <ArrowRight size={12} />
                </button>
              </div>
            </div>
          </div>
        </div>

        {/* ── FOOTER AT A GLANCE ── */}
        <div className="bg-white rounded-2xl border border-slate-100 shadow-sm p-4 flex flex-wrap items-center justify-between gap-6">
          <div className="flex items-center gap-10">
            {[
              { label: 'User ID', val: user_id.substring(0, 8), icon: ShieldCheck },
              { label: 'Firm Code', val: firm_info.code, icon: Building2 },
              { label: 'Branch Code', val: branch_info.code, icon: Briefcase },
            ].map((item, i) => (
              <div key={i} className="flex items-center gap-3">
                <item.icon size={14} className="text-slate-300" />
                <div>
                  <p className="text-[9px] font-black text-slate-400 uppercase tracking-widest leading-none mb-1">{item.label}</p>
                  <p className="text-[10px] font-black text-slate-700 leading-none">{item.val}</p>
                </div>
              </div>
            ))}
          </div>
          <div className="flex items-center gap-2">
            <span className="text-[9px] font-bold text-slate-400 uppercase tracking-widest">Status:</span>
            <span className="flex items-center gap-1.5 px-3 py-1 bg-emerald-50 text-emerald-600 rounded-full text-[9px] font-bold uppercase border border-emerald-100">
              <span className="w-1 h-1 rounded-full bg-emerald-500 animate-pulse" />
              Connected
            </span>
          </div>
        </div>
      </div>
    </div>
  );
}