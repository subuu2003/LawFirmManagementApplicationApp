'use client';

import Link from 'next/link';
import { usePathname, useRouter } from 'next/navigation';

import {
  Scale, LayoutDashboard, Building2, LogOut,
  Settings, ChevronRight, Users, X, PanelLeftClose, PanelLeftOpen
} from 'lucide-react';
import { motion, AnimatePresence } from 'framer-motion';
import { useTopbar } from '@/components/platform/TopbarContext';
import { customFetch } from '@/lib/fetch';
import { API } from '@/lib/api';

const navItems = [
  { label: 'Dashboard', path: '/partner-manager/dashboard', icon: LayoutDashboard },
  { label: 'Firms',     path: '/partner-manager/firms',     icon: Building2       },
  { label: 'Settings',  path: '/partner-manager/settings',  icon: Settings        },
];

export default function PartnerManagerSidebar() {
  const router = useRouter();
  const { isSidebarOpen, closeSidebar, isCollapsed, toggleCollapse } = useTopbar();

  const handleLogout = async () => {
    try {
      await customFetch(API.AUTH.LOGOUT, { method: 'POST' });
    } catch (e) {
      console.error('Logout failed on backend:', e);
    } finally {
      localStorage.removeItem('auth_token');
      localStorage.removeItem('user_details');
      router.push('/login');
    }
  };

  const pathname = usePathname();
  const isActive = (path: string) => pathname.startsWith(path);

  const navRow = (active: boolean) =>
    `group relative flex items-center ${isCollapsed ? 'justify-center px-0' : 'justify-between px-3'} py-2.5 rounded-xl transition-all duration-200 cursor-pointer ${
      active ? 'bg-[#0d3826]/10 text-[#0d3826]' : 'text-gray-900 hover:bg-gray-50 hover:text-black'
    }`;
  const iconBox = (active: boolean) =>
    `w-8 h-8 rounded-lg flex items-center justify-center transition-colors ${
      active ? 'bg-[#0d3826]/15' : 'bg-gray-100 group-hover:bg-gray-200'
    }`;
  const iconColor = (active: boolean) =>
    `w-4 h-4 ${active ? 'text-[#0d3826]' : 'text-gray-700 group-hover:text-gray-900'}`;

  const sidebarContent = (
    <aside className={`${isCollapsed ? 'w-20' : 'w-64'} h-full bg-white border-r border-gray-100 flex flex-col overflow-hidden transition-all duration-300`}>
      <div className={`px-4 py-5 border-b border-gray-100 flex items-center ${isCollapsed ? 'justify-center' : 'justify-between'}`}>
        {!isCollapsed && (
          <div className="flex items-center gap-2.5 min-w-0">
            <div className="w-8 h-8 bg-[#0d3826] rounded-lg flex items-center justify-center shadow-md shrink-0">
              <Scale className="w-4 h-4 text-white" />
            </div>
            <span className="font-bold text-lg text-gray-950 tracking-tight truncate">
              Ant<span className="text-[#0d3826]">Legal</span>
            </span>
          </div>
        )}

        <button
          onClick={toggleCollapse}
          title={isCollapsed ? "Expand Sidebar" : "Collapse Sidebar"}
          className="hidden lg:flex p-2 rounded-xl text-gray-700 hover:text-gray-950 hover:bg-gray-100 transition-colors"
        >
          {isCollapsed ? <PanelLeftOpen className="w-5 h-5" /> : <PanelLeftClose className="w-5 h-5" />}
        </button>

        <button onClick={closeSidebar} className="lg:hidden p-2 text-gray-700 hover:text-gray-950">
          <X className="w-5 h-5" />
        </button>
      </div>

      <nav className="flex-1 px-3 py-5 space-y-0.5 overflow-y-auto">
        {!isCollapsed && (
          <div className="px-3 mb-3 lg:hidden">
            <span className="text-[10px] font-bold uppercase tracking-[0.15em] text-gray-800">
              Partner Manager
            </span>
          </div>
        )}

        {navItems.map(({ label, path, icon: Icon }) => {
          const active = isActive(path);
          return (
            <Link key={path} href={path} onClick={closeSidebar} title={isCollapsed ? label : undefined}>
              <div className={navRow(active)}>
                {active && <span className="absolute left-0 top-1/2 -translate-y-1/2 w-[3px] h-[22px] rounded-r-full bg-[#0d3826]" />}
                <div className={`flex items-center ${isCollapsed ? 'justify-center' : 'gap-3'}`}>
                  <div className={iconBox(active)}><Icon className={iconColor(active)} /></div>
                  {!isCollapsed && <span className="text-sm font-semibold">{label}</span>}
                </div>
                {active && !isCollapsed && <ChevronRight className="w-3.5 h-3.5 text-[#0d3826]/40" />}
              </div>
            </Link>
          );
        })}
      </nav>

      <div className="border-t border-gray-100">
        {!isCollapsed && (
          <div className="px-4 py-3.5 flex items-center gap-3">
            <div className="w-8 h-8 rounded-full bg-[#0d3826] flex items-center justify-center text-white text-xs font-bold shrink-0">
              PM
            </div>
            <div className="min-w-0 flex-1">
              <p className="text-xs font-bold text-gray-900 truncate">Partner Manager</p>
              <p className="text-[10px] text-gray-400 truncate">partner@antlegal.com</p>
            </div>
          </div>
        )}
        <div className="border-t border-gray-100 px-3 py-3 flex justify-center">
          <button onClick={handleLogout} title={isCollapsed ? "Sign Out" : undefined} className={`flex items-center ${isCollapsed ? 'justify-center w-full' : 'gap-2 px-2'} text-[#0d3826] hover:opacity-75 transition-opacity`}>
            <LogOut className="w-4 h-4 shrink-0" />
            {!isCollapsed && <span className="text-[13px] font-semibold">Sign Out</span>}
          </button>
        </div>
      </div>
    </aside>
  );

  return (
    <>
      <div className={`hidden lg:flex ${isCollapsed ? 'w-20' : 'w-64'} h-screen shrink-0 sticky top-0 transition-all duration-300`}>
        {sidebarContent}
      </div>

      <AnimatePresence>
        {isSidebarOpen && (
          <div className="fixed inset-0 z-50 lg:hidden">
            <motion.div
              initial={{ opacity: 0 }}
              animate={{ opacity: 1 }}
              exit={{ opacity: 0 }}
              onClick={closeSidebar}
              className="absolute inset-0 bg-black/40 backdrop-blur-sm"
            />
            <motion.div
              initial={{ x: '-100%' }}
              animate={{ x: 0 }}
              exit={{ x: '-100%' }}
              transition={{ type: 'spring', damping: 25, stiffness: 200 }}
              className="absolute inset-y-0 left-0 w-64 shadow-2xl"
            >
              {sidebarContent}
            </motion.div>
          </div>
        )}
      </AnimatePresence>
    </>
  );
}
