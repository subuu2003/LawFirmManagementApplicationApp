'use client';

import { useState, useEffect } from 'react';
import {
  Briefcase,
  Users,
  Calendar,
  CheckSquare,
  FileText,
  Plus,
  ArrowRight,
  Loader2,
  AlertCircle,
  UserPlus,
} from 'lucide-react';
import Link from 'next/link';
import { customFetch } from '@/lib/fetch';
import { API } from '@/lib/api';

interface RecentCase {
  id: string;
  case_title: string;
  case_number: string;
  status: string;
  next_hearing_date: string | null;
  updated_at: string;
}

interface RecentClient {
  id: string;
  first_name: string;
  last_name: string;
  email: string;
  phone_number: string;
  created_at: string;
}

interface DashboardData {
  role: string;
  role_display: string;
  user_name: string;
  cards: {
    my_cases?: number;
    open_cases?: number;
    in_progress_cases?: number;
    my_clients?: number;
    my_documents?: number;
    pending_tasks?: number;
    overdue_tasks?: number;
    upcoming_hearings?: number;
    assigned_cases?: number;
  };
  firm_info?: {
    id: string | null;
    name: string;
  };
  recent_cases?: RecentCase[];
  recent_clients?: RecentClient[];
}

export default function AdvocateDashboard() {
  const [data, setData] = useState<DashboardData | null>(null);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState('');

  useEffect(() => {
    const fetchDashboard = async () => {
      try {
        setLoading(true);
        const response = await customFetch(API.DASHBOARD.GET);
        const json = await response.json();
        if (!response.ok) {
          throw new Error(json.detail || json.message || 'Failed to load dashboard');
        }
        setData(json);
      } catch (err: any) {
        setError(err.message || 'Failed to load dashboard');
        console.error('Dashboard fetch error:', err);
      } finally {
        setLoading(false);
      }
    };
    fetchDashboard();
  }, []);

  if (loading) {
    return (
      <div className="min-h-[60vh] flex items-center justify-center">
        <div className="flex flex-col items-center gap-3">
          <Loader2 className="w-8 h-8 animate-spin text-[#4a1c40]" />
          <p className="text-sm text-gray-400 font-medium">Loading dashboard…</p>
        </div>
      </div>
    );
  }

  if (error || !data) {
    return (
      <div className="min-h-[60vh] flex items-center justify-center p-6">
        <div className="bg-white rounded-2xl border border-red-100 shadow-sm p-12 text-center max-w-md">
          <AlertCircle className="w-10 h-10 text-red-400 mx-auto mb-3" />
          <p className="text-sm text-red-500 font-medium">{error || 'Failed to load dashboard'}</p>
        </div>
      </div>
    );
  }

  const { cards, firm_info, recent_cases = [], recent_clients = [] } = data;

  const quickLinks = [
    { label: 'My Cases', href: '/advocate/cases', icon: Briefcase, desc: 'Manage your active legal matters' },
    { label: 'My Clients', href: '/advocate/clients', icon: Users, desc: 'View client records & contacts' },
    { label: 'Documents', href: '/advocate/documents', icon: FileText, desc: 'Access case files & drafts' },
    { label: 'Calendar', href: '/advocate/calendar', icon: Calendar, desc: 'Upcoming court hearings & tasks' },
  ];

  return (
    <div className="space-y-8">
      {/* Firm Name & Greeting Header */}
      {firm_info && (
        <div className="bg-gradient-to-r from-[#4a1c40] to-[#6b2456] rounded-2xl p-6 text-white shadow-lg">
          <p className="text-xs font-semibold uppercase tracking-wider text-white/80">{firm_info.name}</p>
          <h1 className="text-2xl md:text-3xl font-bold mt-1">Welcome back, {data.user_name}</h1>
        </div>
      )}

      {/* Stats Overview Cards */}
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-6">
        {[
          {
            label: 'Assigned Cases',
            val: cards?.my_cases ?? cards?.assigned_cases ?? 0,
            icon: Briefcase,
            color: 'bg-[#4a1c40]',
            href: '/advocate/cases',
          },
          {
            label: 'My Clients',
            val: cards?.my_clients ?? 0,
            icon: Users,
            color: 'bg-purple-600',
            href: '/advocate/clients',
          },
          {
            label: 'Upcoming Hearings',
            val: cards?.upcoming_hearings ?? 0,
            icon: Calendar,
            color: 'bg-blue-600',
            href: '/advocate/calendar',
          },
          {
            label: 'Pending Tasks',
            val: cards?.pending_tasks ?? 0,
            icon: CheckSquare,
            color: 'bg-emerald-500',
            href: '/advocate/calendar',
          },
        ].map((stat, i) => (
          <Link key={i} href={stat.href} className="group block">
            <div className="bg-white rounded-2xl border border-gray-100 shadow-sm p-6 relative overflow-hidden transition-all hover:shadow-md hover:border-gray-200">
              <div
                className={`w-12 h-12 ${stat.color} rounded-xl flex items-center justify-center mb-4 text-white shadow-sm transition-transform group-hover:scale-105`}
              >
                <stat.icon className="w-6 h-6" />
              </div>
              <p className="text-3xl font-bold text-gray-900">{stat.val}</p>
              <p className="text-sm font-medium text-gray-500 mt-1">{stat.label}</p>
            </div>
          </Link>
        ))}
      </div>

      {/* Dynamic Data Grid */}
      <div className="grid lg:grid-cols-3 gap-6">
        {/* Recent Cases */}
        <div className="lg:col-span-2 bg-white rounded-2xl border border-gray-100 shadow-sm overflow-hidden">
          <div className="px-6 py-5 border-b border-gray-100 flex items-center justify-between">
            <h2 className="text-sm font-bold text-[#4a1c40]">Recent Cases</h2>
            <Link
              href="/advocate/cases"
              className="text-xs font-bold text-[#4a1c40] bg-[#4a1c40]/10 px-3 py-1.5 rounded-lg hover:bg-[#4a1c40]/20 transition-colors"
            >
              View All
            </Link>
          </div>
          <div className="p-6">
            {recent_cases.length > 0 ? (
              <div className="space-y-4">
                {recent_cases.map((item, itemIdx) => (
                  <Link
                    key={item.id ? `case-${item.id}` : `case-${itemIdx}`}
                    href="/advocate/cases"
                    className="group flex items-center justify-between p-4 rounded-xl border border-gray-100 hover:border-[#4a1c40]/30 hover:bg-[#4a1c40]/5 transition-all"
                  >
                    <div>
                      <h4 className="text-sm font-bold text-gray-900 group-hover:text-[#4a1c40] transition-colors">
                        {item.case_title}
                      </h4>
                      <div className="flex items-center gap-2 mt-1">
                        <span className="text-xs text-gray-500 font-medium">No: {item.case_number}</span>
                        <span className="w-1 h-1 rounded-full bg-gray-300" />
                        <span
                          className={`text-[10px] font-bold uppercase tracking-wider ${
                            item.status === 'open' || item.status === 'in_progress'
                              ? 'text-emerald-600 bg-emerald-50 px-2 py-0.5 rounded-full'
                              : 'text-gray-600 bg-gray-100 px-2 py-0.5 rounded-full'
                          }`}
                        >
                          {item.status}
                        </span>
                      </div>
                    </div>
                    <ArrowRight className="w-4 h-4 text-gray-300 group-hover:text-[#4a1c40] group-hover:translate-x-1 transition-all" />
                  </Link>
                ))}
              </div>
            ) : (
              <div className="text-center py-12 bg-gray-50/50 rounded-xl border border-dashed border-gray-200 p-6">
                <div className="w-12 h-12 rounded-full bg-[#4a1c40]/10 flex items-center justify-center mx-auto mb-3 text-[#4a1c40]">
                  <Briefcase className="w-6 h-6" />
                </div>
                <p className="text-base font-bold text-gray-900">File Your First Case</p>
                <p className="text-xs text-gray-500 max-w-sm mx-auto mt-1 mb-5">
                  You don't have any active legal matters yet. Start managing cases, hearing schedules, and court filings.
                </p>
                <Link
                  href="/advocate/cases/new"
                  className="inline-flex items-center gap-2 text-xs font-bold text-white bg-[#4a1c40] px-4 py-2.5 rounded-xl hover:bg-[#381530] transition-colors shadow-sm"
                >
                  <Plus className="w-4 h-4" /> Create Your First Case
                </Link>
              </div>
            )}
          </div>
        </div>

        {/* Recent Clients */}
        <div className="bg-white rounded-2xl border border-gray-100 shadow-sm overflow-hidden">
          <div className="px-6 py-5 border-b border-gray-100 flex items-center justify-between">
            <h2 className="text-sm font-bold text-[#4a1c40]">Recent Clients</h2>
            <Link
              href="/advocate/clients"
              className="text-xs font-bold text-[#4a1c40] bg-[#4a1c40]/10 px-3 py-1.5 rounded-lg hover:bg-[#4a1c40]/20 transition-colors"
            >
              View All
            </Link>
          </div>
          <div className="p-6">
            {recent_clients.length > 0 ? (
              <div className="space-y-4">
                {recent_clients.map((client, clientIdx) => (
                  <div
                    key={client.id ? `client-${client.id}` : `client-${clientIdx}`}
                    className="flex items-center justify-between p-3 rounded-xl border border-gray-100"
                  >
                    <div>
                      <p className="text-sm font-bold text-gray-900">
                        {client.first_name} {client.last_name}
                      </p>
                      <p className="text-xs text-gray-400">{client.email || client.phone_number || 'No contact info'}</p>
                    </div>
                  </div>
                ))}
              </div>
            ) : (
              <div className="text-center py-12 bg-gray-50/50 rounded-xl border border-dashed border-gray-200 p-6">
                <div className="w-12 h-12 rounded-full bg-purple-100 flex items-center justify-center mx-auto mb-3 text-purple-700">
                  <Users className="w-6 h-6" />
                </div>
                <p className="text-base font-bold text-gray-900">Add Your First Client</p>
                <p className="text-xs text-gray-500 max-w-xs mx-auto mt-1 mb-5">
                  No clients onboarded yet. Register a client to link matters, share documents, and streamline updates.
                </p>
                <Link
                  href="/advocate/add-client"
                  className="inline-flex items-center gap-2 text-xs font-bold text-white bg-purple-700 px-4 py-2.5 rounded-xl hover:bg-purple-800 transition-colors shadow-sm"
                >
                  <UserPlus className="w-4 h-4" /> Add Your 1st Client
                </Link>
              </div>
            )}
          </div>
        </div>
      </div>

      {/* Quick Access */}
      <div className="bg-white rounded-2xl border border-gray-100 shadow-sm overflow-hidden">
        <div className="px-6 py-4 border-b border-gray-50">
          <h2 className="text-sm font-bold text-gray-900">Quick Access</h2>
          <p className="text-xs text-gray-400 mt-0.5">Jump quickly to your key workspace tools</p>
        </div>
        <div className="grid sm:grid-cols-2 lg:grid-cols-4 divide-x divide-y sm:divide-y-0 divide-gray-100">
          {quickLinks.map((item) => (
            <Link
              key={item.href}
              href={item.href}
              className="group flex flex-col gap-3 p-5 hover:bg-gray-50/80 transition-colors"
            >
              <div className="w-10 h-10 rounded-xl bg-[#4a1c40]/10 flex items-center justify-center group-hover:bg-[#4a1c40]/20 transition-colors">
                <item.icon className="w-5 h-5 text-[#4a1c40]" />
              </div>
              <div>
                <p className="text-sm font-bold text-gray-900 group-hover:text-[#4a1c40] transition-colors">
                  {item.label}
                </p>
                <p className="text-xs text-gray-400 mt-0.5">{item.desc}</p>
              </div>
              <ArrowRight className="w-4 h-4 text-gray-300 group-hover:text-[#4a1c40] group-hover:translate-x-1 transition-all mt-auto" />
            </Link>
          ))}

        </div>
      </div>
    </div>
  );
}

