import { API_BASE_URL } from './api';

export const customFetch = async (endPoint: string, config: RequestInit = {}, headerKey?: string) => {
  if (typeof endPoint !== 'string') {
    throw new Error(`API Error: Endpoint must be a string, but received ${typeof endPoint}. This usually means an object from the API reference was passed instead of a specific endpoint string.`);
  }
  const url = `${API_BASE_URL}${endPoint.startsWith("/") ? endPoint : `/${endPoint}`}`;

  const headers = new Headers(config.headers || {});

  // Ensure Content-Type is set only if not already present AND we aren't passing FormData (like document upload)
  if (!(config.body instanceof FormData) && !headers.has("Content-Type")) {
    headers.append("Content-Type", "application/json");
  }

  // Inject any external link keys if provided
  if (headerKey) {
    headers.append("x-ext-link-key", headerKey);
  }

  // Define pre-login endpoints that should not send saved Authorization token
  const isPreLoginEndpoint = endPoint.includes('login_username_password');

  // Inject Authorization Token from localStorage automatically if existing
  if (typeof window !== "undefined" && !isPreLoginEndpoint) {
    const authToken = localStorage.getItem("auth_token");
    if (authToken && !headers.has("Authorization")) {
      headers.append("Authorization", `Token ${authToken}`);
    }
  }

  const modifiedConfig = { ...config, headers };

  try {
    const response = await fetch(url, modifiedConfig);

    if (response.status === 404 && response.headers.get('content-type')?.includes('text/html')) {
      throw new Error("Not Found");
    }
    
    // Handle 403 Forbidden - could be subscription issue
    if (response.status === 403) {
      try {
        const errorData = await response.clone().json();
        
        // Check if it's a subscription error
        if (errorData.detail && 
            (errorData.detail.includes('subscription') || 
             errorData.detail.includes('expired') || 
             errorData.detail.includes('suspended'))) {
          
          // Store subscription error for display
          if (typeof window !== 'undefined') {
            localStorage.setItem('subscription_error', JSON.stringify({
              message: errorData.detail,
              timestamp: Date.now()
            }));
            
            // Dispatch custom event for components to listen to
            window.dispatchEvent(new CustomEvent('subscription-error', {
              detail: { message: errorData.detail }
            }));
          }
        }
      } catch (e) {
        // If JSON parsing fails, just continue
      }
    }
    
    // We intentionally let 401 and 403 fall through so that the invoking UI component can properly parse the response

    return response;
  } catch (error: any) {
    // Only log non-404 errors to avoid noise
    if (error.message !== "Not Found") {
      console.error("Fetch Error: ", error.message || error);
    }
    throw error;
  }
};
