'use client';

import { useEffect, useState } from 'react';
import { X, AlertCircle } from 'lucide-react';
import { useRouter } from 'next/navigation';

export default function GlobalErrorHandler() {
  const [error, setError] = useState<string | null>(null);
  const [showError, setShowError] = useState(false);
  const router = useRouter();

  useEffect(() => {
    const handleSubscriptionError = (event: any) => {
      const message = event.detail?.message;
      if (message) {
        setError(message);
        setShowError(true);
      }
    };

    window.addEventListener('subscription-error', handleSubscriptionError);

    return () => {
      window.removeEventListener('subscription-error', handleSubscriptionError);
    };
  }, []);

  const handleClose = () => {
    setShowError(false);
    localStorage.removeItem('subscription_error');
  };

  const handleGoToSubscription = () => {
    handleClose();
    router.push('/subscription-expired');
  };

  if (!showError || !error) return null;

  return (
    <div className="fixed top-4 right-4 z-50 max-w-md animate-slide-in-right">
      <div className="bg-white rounded-lg shadow-2xl border-l-4 border-red-500 overflow-hidden">
        <div className="p-4">
          <div className="flex items-start">
            <div className="flex-shrink-0">
              <AlertCircle className="h-6 w-6 text-red-500" />
            </div>
            <div className="ml-3 flex-1">
              <h3 className="text-sm font-semibold text-gray-900">
                Subscription Issue
              </h3>
              <p className="mt-1 text-sm text-gray-600 leading-relaxed">
                {error}
              </p>
              <div className="mt-3 flex gap-2">
                <button
                  onClick={handleGoToSubscription}
                  className="text-sm font-medium text-red-600 hover:text-red-700 underline"
                >
                  View Details
                </button>
                <button
                  onClick={handleClose}
                  className="text-sm font-medium text-gray-600 hover:text-gray-700"
                >
                  Dismiss
                </button>
              </div>
            </div>
            <button
              onClick={handleClose}
              className="ml-3 flex-shrink-0 text-gray-400 hover:text-gray-600"
            >
              <X className="h-5 w-5" />
            </button>
          </div>
        </div>
      </div>
    </div>
  );
}
