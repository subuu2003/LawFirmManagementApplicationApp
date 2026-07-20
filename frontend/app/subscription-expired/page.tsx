'use client';

import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import { AlertTriangle, RefreshCw, Mail, Phone, Clock } from 'lucide-react';
import { useSubscriptionStatus } from '@/hooks/useSubscriptionStatus';

export default function SubscriptionExpiredPage() {
  const router = useRouter();
  const { subscriptionStatus, firmData, loading, canAccess } = useSubscriptionStatus();
  const [checking, setChecking] = useState(false);

  // If subscription is active, redirect to dashboard
  useEffect(() => {
    if (!loading && canAccess) {
      const userDetails = localStorage.getItem('user_details');
      if (userDetails) {
        const user = JSON.parse(userDetails);
        const dashboardRoute = getDashboardRoute(user.user_type);
        router.push(dashboardRoute);
      }
    }
  }, [loading, canAccess, router]);

  const getDashboardRoute = (role: string): string => {
    const normalizedRole = role?.toLowerCase();
    switch (normalizedRole) {
      case 'platform_owner': return '/platform-owner/dashboard';
      case 'partner_manager': return '/partner-manager/dashboard';
      case 'super_admin':
      case 'firm_owner': return '/super-admin/dashboard';
      case 'admin':
      case 'firm_admin': return '/firm-admin/dashboard';
      case 'advocate':
      case 'lawyer': return '/advocate/dashboard';
      case 'paralegal': return '/paralegal/dashboard';
      case 'client': return '/client/dashboard';
      default: return '/login';
    }
  };

  const handleCheckAgain = async () => {
    setChecking(true);
    // Force refresh the page to re-check subscription
    window.location.reload();
  };

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gray-50">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-purple-600"></div>
      </div>
    );
  }

  return (
    <div className="min-h-screen bg-gradient-to-br from-red-50 via-orange-50 to-yellow-50 flex items-center justify-center p-6">
      <div className="max-w-2xl w-full">
        {/* Main Card */}
        <div className="bg-white rounded-2xl shadow-xl overflow-hidden">
          {/* Header */}
          <div className="bg-gradient-to-r from-red-500 to-orange-500 p-8 text-white">
            <div className="flex items-center gap-4 mb-4">
              <div className="w-16 h-16 bg-white/20 rounded-full flex items-center justify-center backdrop-blur-sm">
                <AlertTriangle className="w-8 h-8" />
              </div>
              <div>
                <h1 className="text-3xl font-bold">Subscription Expired</h1>
                <p className="text-red-100 mt-1">
                  {firmData?.firm_name || 'Your firm'}'s subscription is no longer active
                </p>
              </div>
            </div>
          </div>

          {/* Content */}
          <div className="p-8">
            {/* Status Info */}
            <div className="bg-red-50 border border-red-200 rounded-xl p-6 mb-6">
              <h2 className="text-lg font-semibold text-red-900 mb-2">
                {subscriptionStatus?.message || 'Subscription Inactive'}
              </h2>
              {subscriptionStatus?.expired_date && (
                <div className="flex items-center gap-2 text-red-700 mb-2">
                  <Clock className="w-4 h-4" />
                  <p className="text-sm">
                    Expired on: <span className="font-medium">{subscriptionStatus.expired_date}</span>
                  </p>
                </div>
              )}
              {subscriptionStatus?.days_expired && (
                <p className="text-sm text-red-600">
                  Your subscription has been expired for {subscriptionStatus.days_expired} day
                  {subscriptionStatus.days_expired !== 1 ? 's' : ''}.
                </p>
              )}
            </div>

            {/* What This Means */}
            <div className="mb-6">
              <h3 className="text-lg font-semibold text-gray-900 mb-3">
                What this means:
              </h3>
              <ul className="space-y-2 text-gray-600">
                <li className="flex items-start gap-2">
                  <span className="text-red-500 mt-1">•</span>
                  <span>You cannot access most features of the platform</span>
                </li>
                <li className="flex items-start gap-2">
                  <span className="text-red-500 mt-1">•</span>
                  <span>Your data is safe and will be restored once subscription is renewed</span>
                </li>
                <li className="flex items-start gap-2">
                  <span className="text-red-500 mt-1">•</span>
                  <span>Contact your administrator or support to reactivate your account</span>
                </li>
              </ul>
            </div>

            {/* Actions */}
            <div className="space-y-3">
              <a
                href="mailto:support@antlegal.com?subject=Subscription Renewal Request&body=Firm: [Firm Name]%0D%0ARequest: Please renew our subscription"
                className="w-full flex items-center justify-center gap-2 px-6 py-3 bg-gradient-to-r from-red-600 to-orange-600 text-white font-semibold rounded-xl hover:from-red-700 hover:to-orange-700 transition-all shadow-lg hover:shadow-xl"
              >
                <Mail className="w-5 h-5" />
                Contact Support via Email
              </a>

              <a
                href="tel:+911234567890"
                className="w-full flex items-center justify-center gap-2 px-6 py-3 bg-white text-gray-700 font-semibold rounded-xl border-2 border-gray-300 hover:border-red-500 hover:text-red-600 transition-all"
              >
                <Phone className="w-5 h-5" />
                Call Support: +91 123 456 7890
              </a>

              <button
                onClick={handleCheckAgain}
                disabled={checking}
                className="w-full flex items-center justify-center gap-2 px-6 py-3 bg-gray-100 text-gray-700 font-semibold rounded-xl hover:bg-gray-200 transition-all disabled:opacity-50"
              >
                <RefreshCw className={`w-5 h-5 ${checking ? 'animate-spin' : ''}`} />
                {checking ? 'Checking...' : 'Check Subscription Status Again'}
              </button>
            </div>

            {/* Help Text */}
            <p className="text-sm text-gray-500 text-center mt-6">
              If you believe this is an error, please contact your system administrator.
            </p>
          </div>
        </div>

        {/* Logout Link */}
        <div className="text-center mt-6">
          <button
            onClick={() => {
              localStorage.removeItem('auth_token');
              localStorage.removeItem('user_details');
              router.push('/login');
            }}
            className="text-gray-600 hover:text-gray-800 underline"
          >
            Logout and return to login
          </button>
        </div>
      </div>
    </div>
  );
}
