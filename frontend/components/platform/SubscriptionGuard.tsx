'use client';

import { useEffect, useState } from 'react';
import { useRouter } from 'next/navigation';
import SubscriptionExpiredBanner from './SubscriptionExpiredBanner';
import { useSubscriptionStatus } from '@/hooks/useSubscriptionStatus';

type SubscriptionGuardProps = {
  children: React.ReactNode;
  showBanner?: boolean;
  redirectOnExpired?: boolean;
};

export default function SubscriptionGuard({
  children,
  showBanner = true,
  redirectOnExpired = false
}: SubscriptionGuardProps) {
  const router = useRouter();
  const { subscriptionStatus, firmData, loading, isExpired, isSuspended } = useSubscriptionStatus();
  const [subscriptionError, setSubscriptionError] = useState<string | null>(null);

  // Listen for subscription errors from API calls
  useEffect(() => {
    const handleSubscriptionError = (event: any) => {
      setSubscriptionError(event.detail?.message || 'Subscription issue detected');
    };

    window.addEventListener('subscription-error', handleSubscriptionError);
    
    // Check localStorage for any stored subscription errors
    const storedError = localStorage.getItem('subscription_error');
    if (storedError) {
      try {
        const errorData = JSON.parse(storedError);
        // Only show if less than 5 minutes old
        if (Date.now() - errorData.timestamp < 5 * 60 * 1000) {
          setSubscriptionError(errorData.message);
        } else {
          localStorage.removeItem('subscription_error');
        }
      } catch (e) {
        // Ignore parsing errors
      }
    }

    return () => {
      window.removeEventListener('subscription-error', handleSubscriptionError);
    };
  }, []);

  // Redirect logic
  useEffect(() => {
    if (!loading && redirectOnExpired && (isExpired || isSuspended)) {
      router.push('/subscription-expired');
    }
  }, [loading, isExpired, isSuspended, redirectOnExpired, router]);

  if (loading) {
    return <>{children}</>;
  }

  const shouldShowBanner = showBanner && (isExpired || isSuspended || subscriptionError);

  return (
    <>
      {shouldShowBanner && (
        <SubscriptionExpiredBanner
          firmName={firmData?.firm_name}
          expiredDate={subscriptionStatus?.expired_date}
          daysExpired={subscriptionStatus?.days_expired}
          message={subscriptionError || subscriptionStatus?.message}
        />
      )}
      {children}
    </>
  );
}
