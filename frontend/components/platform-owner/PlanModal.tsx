'use client';

import React, { useState, useEffect } from 'react';
import { motion, AnimatePresence } from 'framer-motion';
import { X, CheckCircle2, Loader2, Plus, Info, ShieldCheck, Zap, Briefcase, Building2, Crown, Users, Save, Trash2, Power } from 'lucide-react';
import { customFetch } from '@/lib/fetch';

interface PlanModalProps {
  isOpen: boolean;
  onClose: () => void;
  onSuccess: () => void;
  editPlan?: any | null;
}

const PLAN_TYPES = [
  { value: 'trial', label: 'Trial', icon: Zap, color: 'text-amber-600', bg: 'bg-amber-50' },
  { value: 'basic', label: 'Basic', icon: Briefcase, color: 'text-blue-600', bg: 'bg-blue-50' },
  { value: 'business', label: 'Business', icon: Building2, color: 'text-indigo-600', bg: 'bg-indigo-50' },
  { value: 'premium', label: 'Premium', icon: Crown, color: 'text-purple-600', bg: 'bg-purple-50' },
  { value: 'enterprise', label: 'Enterprise', icon: ShieldCheck, color: 'text-slate-600', bg: 'bg-slate-50' },
];

export default function PlanModal({ isOpen, onClose, onSuccess, editPlan }: PlanModalProps) {
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  
  const [formData, setFormData] = useState({
    name: '',
    plan_type: 'basic',
    price: '',
    billing_cycle: 'monthly',
    description: '',
    max_users: 10,
    max_advocates: 5,
    max_paralegals: 5,
    max_admins: 1,
    max_clients: 100,
    max_cases: 50,
    max_branches: 1,
    max_storage_gb: 10,
    enable_billing: true,
    enable_calendar: true,
    enable_documents: true,
    enable_reports: false,
    enable_api_access: false,
    is_active: true
  });

  useEffect(() => {
    if (editPlan) {
      setFormData({
        name: editPlan.name || '',
        plan_type: editPlan.plan_type || 'basic',
        price: editPlan.price || '',
        billing_cycle: editPlan.billing_cycle || 'monthly',
        description: editPlan.description || '',
        max_users: editPlan.max_users || 0,
        max_advocates: editPlan.max_advocates || 0,
        max_paralegals: editPlan.max_paralegals || 0,
        max_admins: editPlan.max_admins || 0,
        max_clients: editPlan.max_clients || 0,
        max_cases: editPlan.max_cases || 0,
        max_branches: editPlan.max_branches || 0,
        max_storage_gb: editPlan.max_storage_gb || 0,
        enable_billing: editPlan.enable_billing ?? true,
        enable_calendar: editPlan.enable_calendar ?? true,
        enable_documents: editPlan.enable_documents ?? true,
        enable_reports: editPlan.enable_reports ?? false,
        enable_api_access: editPlan.enable_api_access ?? false,
        is_active: editPlan.is_active ?? true
      });
    } else {
      setFormData({
        name: '',
        plan_type: 'basic',
        price: '',
        billing_cycle: 'monthly',
        description: '',
        max_users: 10,
        max_advocates: 5,
        max_paralegals: 5,
        max_admins: 1,
        max_clients: 100,
        max_cases: 50,
        max_branches: 1,
        max_storage_gb: 10,
        enable_billing: true,
        enable_calendar: true,
        enable_documents: true,
        enable_reports: false,
        enable_api_access: false,
        is_active: true
      });
    }
    setError('');
  }, [editPlan, isOpen]);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    setError('');

    const url = editPlan ? `/api/subscriptions/plans/${editPlan.id}/` : '/api/subscriptions/plans/';
    const method = editPlan ? 'PATCH' : 'POST';

    try {
      const response = await customFetch(url, {
        method: method,
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({
          ...formData,
          price: formData.price || "0.00"
        }),
      });

      if (response.ok) {
        onSuccess();
        onClose();
      } else {
        const data = await response.json();
        setError(data.detail || data.error || (typeof data === 'object' ? Object.values(data)[0] : 'Failed to save plan'));
      }
    } catch (err) {
      setError('A network error occurred');
    } finally {
      setLoading(false);
    }
  };

  const handleChange = (e: React.ChangeEvent<HTMLInputElement | HTMLTextAreaElement | HTMLSelectElement>) => {
    const { name, value, type } = e.target;
    const val = type === 'checkbox' ? (e.target as HTMLInputElement).checked : value;
    
    // Handle numeric fields
    if (name.startsWith('max_')) {
      setFormData(prev => ({ ...prev, [name]: parseInt(value) || 0 }));
    } else {
      setFormData(prev => ({ ...prev, [name]: val }));
    }
  };

  const handleToggle = (name: string) => {
    setFormData(prev => ({ ...prev, [name]: !prev[name as keyof typeof prev] }));
  };

  return (
    <AnimatePresence>
      {isOpen && (
        <div className="fixed inset-0 z-[100] flex items-center justify-center p-4 sm:p-6">
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
            onClick={onClose}
            className="absolute inset-0 bg-slate-900/60 backdrop-blur-sm"
          />
          
          <motion.div
            initial={{ opacity: 0, scale: 0.95, y: 20 }}
            animate={{ opacity: 1, scale: 1, y: 0 }}
            exit={{ opacity: 0, scale: 0.95, y: 20 }}
            className="relative w-full max-w-4xl bg-white rounded-3xl shadow-2xl overflow-hidden flex flex-col max-h-[90vh]"
          >
            {/* Header */}
            <div className="px-8 py-6 border-b border-slate-100 flex items-center justify-between bg-slate-50/50">
              <div className="flex items-center gap-4">
                <div className="p-3 bg-blue-600 text-white rounded-2xl shadow-lg shadow-blue-200">
                  {editPlan ? <Save className="w-6 h-6" /> : <Plus className="w-6 h-6" />}
                </div>
                <div>
                  <h2 className="text-xl font-black text-slate-900">{editPlan ? `Edit Plan: ${editPlan.name}` : 'Create New Subscription Plan'}</h2>
                  <p className="text-xs font-bold text-slate-400 uppercase tracking-widest mt-0.5">Configure platform tier limits and pricing</p>
                </div>
              </div>
              <button onClick={onClose} className="p-2 hover:bg-slate-200 rounded-xl transition-colors text-slate-400">
                <X className="w-6 h-6" />
              </button>
            </div>

            {/* Form */}
            <form onSubmit={handleSubmit} className="flex-1 overflow-y-auto p-8 custom-scrollbar">
              {error && (
                <div className="mb-8 p-4 bg-red-50 border border-red-100 rounded-2xl text-red-600 text-sm font-bold flex items-center gap-3">
                  <div className="w-2 h-2 rounded-full bg-red-600 animate-pulse" />
                  {typeof error === 'string' ? error : JSON.stringify(error)}
                </div>
              )}

              <div className="space-y-10">
                {/* Basic Info Section */}
                <section>
                  <div className="flex items-center gap-2 mb-6">
                    <Info className="w-4 h-4 text-blue-600" />
                    <h3 className="text-sm font-black text-slate-900 uppercase tracking-widest">Basic Information</h3>
                  </div>
                  
                  <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
                    <div className="md:col-span-1">
                      <label className="block text-xs font-black text-slate-400 uppercase tracking-wider mb-2">Plan Name</label>
                      <input
                        required name="name" value={formData.name} onChange={handleChange}
                        placeholder="e.g. Premium Plus"
                        className="w-full px-5 py-3.5 bg-slate-50 border border-slate-200 rounded-2xl text-sm font-bold text-slate-900 focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 transition-all shadow-sm"
                      />
                    </div>
                    
                    <div>
                      <label className="block text-xs font-black text-slate-400 uppercase tracking-wider mb-2">Plan Type</label>
                      <select
                        name="plan_type" value={formData.plan_type} onChange={handleChange}
                        className="w-full px-5 py-3.5 bg-slate-50 border border-slate-200 rounded-2xl text-sm font-bold text-slate-900 focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 transition-all shadow-sm appearance-none"
                      >
                        {PLAN_TYPES.map(t => <option key={t.value} value={t.value}>{t.label}</option>)}
                      </select>
                    </div>

                    <div>
                      <label className="block text-xs font-black text-slate-400 uppercase tracking-wider mb-2">Billing Cycle</label>
                      <select
                        name="billing_cycle" value={formData.billing_cycle} onChange={handleChange}
                        className="w-full px-5 py-3.5 bg-slate-50 border border-slate-200 rounded-2xl text-sm font-bold text-slate-900 focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 transition-all shadow-sm appearance-none"
                      >
                        <option value="monthly">Monthly</option>
                        <option value="yearly">Yearly</option>
                      </select>
                    </div>

                    <div>
                      <label className="block text-xs font-black text-slate-400 uppercase tracking-wider mb-2">Price (INR)</label>
                      <div className="relative">
                        <span className="absolute left-5 top-1/2 -translate-y-1/2 text-slate-400 font-bold text-sm">₹</span>
                        <input
                          type="number" step="0.01" name="price" value={formData.price || ''} onChange={handleChange}
                          onWheel={(e) => (e.target as HTMLInputElement).blur()}
                          placeholder="0.00"
                          className="w-full pl-10 pr-5 py-3.5 bg-slate-50 border border-slate-200 rounded-2xl text-sm font-bold text-slate-900 focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 transition-all shadow-sm [appearance:textfield] [&::-webkit-outer-spin-button]:appearance-none [&::-webkit-inner-spin-button]:appearance-none"
                        />
                      </div>
                    </div>

                    <div className="md:col-span-2">
                      <label className="block text-xs font-black text-slate-400 uppercase tracking-wider mb-2">Description</label>
                      <input
                        name="description" value={formData.description} onChange={handleChange}
                        placeholder="Short description of the plan features"
                        className="w-full px-5 py-3.5 bg-slate-50 border border-slate-200 rounded-2xl text-sm font-bold text-slate-900 focus:outline-none focus:ring-2 focus:ring-blue-500/20 focus:border-blue-500 transition-all shadow-sm"
                      />
                    </div>
                  </div>
                </section>

                {/* Limits Section */}
                <section>
                  <div className="flex items-center gap-2 mb-6">
                    <Users className="w-4 h-4 text-emerald-600" />
                    <h3 className="text-sm font-black text-slate-900 uppercase tracking-widest">Resource Limits</h3>
                  </div>
                  
                  <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
                    {[
                      { name: 'max_users', label: 'Max Total Users' },
                      { name: 'max_advocates', label: 'Max Advocates' },
                      { name: 'max_paralegals', label: 'Max Paralegals' },
                      { name: 'max_admins', label: 'Max Admins' },
                      { name: 'max_clients', label: 'Max Clients' },
                      { name: 'max_cases', label: 'Max Cases' },
                      { name: 'max_branches', label: 'Max Branches' },
                      { name: 'max_storage_gb', label: 'Storage (GB)' },
                    ].map(field => (
                      <div key={field.name}>
                        <label className="block text-[10px] font-black text-slate-400 uppercase tracking-wider mb-2">{field.label}</label>
                        <input
                          type="number" 
                          name={field.name} 
                          value={(formData[field.name as keyof typeof formData] as string | number) || ''} 
                          onChange={handleChange}
                          onWheel={(e) => (e.target as HTMLInputElement).blur()}
                          className="w-full px-4 py-3 bg-slate-50 border border-slate-200 rounded-xl text-sm font-bold text-slate-900 focus:outline-none focus:border-blue-500 transition-all [appearance:textfield] [&::-webkit-outer-spin-button]:appearance-none [&::-webkit-inner-spin-button]:appearance-none"
                        />
                      </div>
                    ))}
                  </div>
                </section>

                {/* Features Section */}
                <section>
                  <div className="flex items-center gap-2 mb-6">
                    <Zap className="w-4 h-4 text-amber-500" />
                    <h3 className="text-sm font-black text-slate-900 uppercase tracking-widest">Enabled Features</h3>
                  </div>
                  
                  <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
                    {[
                      { id: 'enable_billing', label: 'Billing Module' },
                      { id: 'enable_calendar', label: 'Calendar System' },
                      { id: 'enable_documents', label: 'Document Management' },
                      { id: 'enable_reports', label: 'Advanced Reports' },
                      { id: 'enable_api_access', label: 'External API Access' },
                      { id: 'is_active', label: 'Plan Status Active' },
                    ].map(feature => (
                      <button
                        key={feature.id}
                        type="button"
                        onClick={() => handleToggle(feature.id)}
                        className={`flex items-center justify-between p-4 rounded-2xl border transition-all ${
                          formData[feature.id as keyof typeof formData]
                            ? 'bg-emerald-50 border-emerald-200 text-emerald-900'
                            : 'bg-white border-slate-200 text-slate-400'
                        }`}
                      >
                        <span className="text-xs font-black uppercase tracking-wider">{feature.label}</span>
                        <div className={`w-6 h-6 rounded-lg flex items-center justify-center transition-colors ${
                          formData[feature.id as keyof typeof formData] ? 'bg-emerald-500 text-white' : 'bg-slate-100 text-slate-300'
                        }`}>
                          {formData[feature.id as keyof typeof formData] ? <CheckCircle2 className="w-4 h-4" /> : <X className="w-4 h-4" />}
                        </div>
                      </button>
                    ))}
                  </div>
                </section>
              </div>
            </form>

            {/* Footer */}
            <div className="px-8 py-6 border-t border-slate-100 bg-slate-50/50 flex items-center justify-end gap-4">
              <button
                type="button" onClick={onClose}
                className="px-6 py-3 text-sm font-bold text-slate-500 hover:text-slate-700 transition-colors"
              >
                Cancel
              </button>
              <button
                type="submit"
                onClick={handleSubmit}
                disabled={loading}
                className="px-8 py-3 bg-[#071526] text-white rounded-2xl text-sm font-black shadow-xl shadow-slate-200 hover:bg-slate-800 disabled:opacity-50 transition-all flex items-center gap-2"
              >
                {loading ? <Loader2 className="w-4 h-4 animate-spin" /> : (editPlan ? <Save className="w-4 h-4" /> : <Plus className="w-4 h-4" />)}
                {loading ? (editPlan ? 'Saving Changes...' : 'Creating Plan...') : (editPlan ? 'Save Changes' : 'Create Subscription Plan')}
              </button>
            </div>
          </motion.div>
        </div>
      )}
    </AnimatePresence>
  );
}
