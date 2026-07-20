'use client';

import { useState, useEffect } from 'react';
import { customFetch } from '@/lib/fetch';

type SubscriptionStatus = {
  status: 'active' | 'expired' | 'suspended' | 'unknown';
  message: string;
  expired_date?: string;
  days_expired?: number;
  can_access: boolean;
};

type FirmData = {
  firm_name?: string;
  is_suspended?: boolean;
  subscription_status?: SubscriptionStatus;
  days_until_expiry?: number;
};

export function useSubscriptionStatus() {
  const [subscriptionStatus, setSubscriptionStatus] = useState<SubscriptionStatus | null>(null);
  const [firmData, setFirmData] = useState<FirmData | null>(null);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const checkSubscription = async () => {
      try {
        // Get current user details
        const userDetails = localStorage.getItem('user_details');
        if (!userDetails) {
          setLoading(false);
          return;
        }

        const user = JSON.parse(userDetails);
        
        // Skip check for platform owners and partner managers
        if (['platform_owner', 'partner_manager'].includes(user.user_type)) {
          setLoading(false);
          return;
        }

        // If user has a firm, fetch firm details
        if (user.firm) {
          const response = await customFetch(`/api/firms/${user.firm}/`);
          if (response.ok) {
            const data = await response.json();
            setFirmData(data);
            setSubscriptionStatus(data.subscription_status);
          }
        }
      } catch (error) {
        console.error('Error checking subscription:', error);
      } finally {
        setLoading(false);
      }
    };

    checkSubscription();
  }, []);

  return {
    subscriptionStatus,
    firmData,
    loading,
    isExpired: subscriptionStatus?.status === 'expired',
    isSuspended: subscriptionStatus?.status === 'suspended',
    canAccess: subscriptionStatus?.can_access !== false
  };
}
