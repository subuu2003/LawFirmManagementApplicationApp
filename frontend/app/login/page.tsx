"use client";

import { useState } from 'react';
import { useRouter } from 'next/navigation';
import Link from 'next/link';
import { motion, AnimatePresence } from 'framer-motion';
import {
  User, // Added User icon
  Lock,
  Scale,
  AlertCircle,
  Star,
  Phone,
  ArrowRight, // Added ArrowRight
  Fingerprint,
  ShieldCheck,
  Clock, // Added Clock
  UserCheck // Added UserCheck for data protection
} from 'lucide-react';

import { customFetch } from '@/lib/fetch';
import { API } from '@/lib/api';
import { PasswordInput } from '@/components/platform/ui';

export default function LoginPage() {
  const router = useRouter();
  const [formData, setFormData] = useState({
    email: '',
    password: '',
  });
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const [focusedField, setFocusedField] = useState<string | null>(null);
  const [rememberMe, setRememberMe] = useState(false);
  const [loginMode, setLoginMode] = useState<'password' | 'code'>('password');
  const [otpSent, setOtpSent] = useState(false);
  const [otpValue, setOtpValue] = useState('');

  const isEmailInput = formData.email.includes('@');

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
      default: return '/platform-owner/dashboard';
    }
  };

  const handleInputChange = (e: React.ChangeEvent<HTMLInputElement>) => {
    const { name, value } = e.target;
    setFormData((prev) => ({ ...prev, [name]: value }));
    setError('');
  };

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setLoading(true);
    setError('');

    try {
      if (loginMode === 'password') {
        const payload = {
          username: formData.email,
          password: formData.password
        };

        const response = await customFetch(API.AUTH.LOGIN_USERNAME_PASSWORD, {
          method: 'POST',
          body: JSON.stringify(payload)
        });

        const data = await response.json();

        if (!response.ok) {
          let errorMsg = data.detail || data.message;
          if (data.non_field_errors && Array.isArray(data.non_field_errors)) {
            errorMsg = data.non_field_errors.includes("User account is inactive")
              ? "Your account is inactive please contact your admin for details"
              : data.non_field_errors[0];
          }
          throw new Error(errorMsg || 'Login failed. Please check your credentials.');
        }

        if (data.token) localStorage.setItem("auth_token", data.token);
        if (data.user) localStorage.setItem("user_details", JSON.stringify(data.user));

        const targetRoute = getDashboardRoute(data.user?.user_type);
        router.push(targetRoute);

      } else if (loginMode === 'code') {
        if (!otpSent) {
          if (isEmailInput) {
            const response = await customFetch(API.AUTH.REQUEST_EMAIL_OTP, {
              method: 'POST',
              body: JSON.stringify({ email: formData.email })
            });
            const data = await response.json();
            if (!response.ok) throw new Error(data.detail || data.message || 'Failed to send OTP to email.');
          } else {
            const response = await customFetch(API.AUTH.REQUEST_PHONE_OTP, {
              method: 'POST',
              body: JSON.stringify({ phone_number: formData.email })
            });
            const data = await response.json();
            if (!response.ok) throw new Error(data.detail || data.message || 'Failed to send OTP to phone.');
          }
          setOtpSent(true);
        } else {
          const payload = isEmailInput
            ? { email: formData.email, otp_code: otpValue }
            : { phone_number: formData.email, otp_code: otpValue };

          const response = await customFetch(API.AUTH.VERIFY_OTP, {
            method: 'POST',
            body: JSON.stringify(payload)
          });
          const data = await response.json();

          if (!response.ok) {
            let errorMsg = data.detail || data.message || data.error;
            if (data.non_field_errors && Array.isArray(data.non_field_errors)) {
              errorMsg = data.non_field_errors.includes("User account is inactive")
                ? "Your account is inactive please contact your admin for details"
                : data.non_field_errors[0];
            }
            throw new Error(errorMsg || 'Invalid OTP. Please try again.');
          }

          const token = data.token || data.data?.access;
          const user = data.user || data.data?.user;

          if (token) localStorage.setItem("auth_token", token);
          if (user) localStorage.setItem("user_details", JSON.stringify(user));

          const targetRoute = getDashboardRoute(user?.user_type);
          router.push(targetRoute);
        }
      }
    } catch (err: any) {
      setError(err.message || 'Process failed. Please verify credentials.');
    } finally {
      setLoading(false);
    }
  };

  return (
    <div className="h-screen w-full overflow-hidden flex bg-white font-['DM_Sans',sans-serif]">
      <style jsx global>{`
        @import url('https://fonts.googleapis.com/css2?family=DM+Serif+Display:ital@0;1&family=DM+Sans:wght@400;500;600;700&display=swap');
        .font-serif { font-family: 'DM Serif Display', serif; }
      `}</style>

      {/* LEFT SIDE: Brand & Testimonial */}
      <div
        className="hidden lg:flex lg:w-1/2 relative flex-col justify-between p-12 xl:p-16 text-white overflow-hidden"
        style={{
          /* Adjusted gradient to let the pillars show through exactly like Image 2 */
          background: "url('/courtlogin.png')",
          backgroundSize: 'cover',
          backgroundPosition: 'center',
        }}
      >
        {/* Logo Area */}
        <motion.div
          initial={{ opacity: 0, y: -20 }}
          animate={{ opacity: 1, y: 0 }}
          className="relative z-10"
        >
          <Link href="/" className="flex items-center gap-3 group">
            <div className="w-10 h-10 bg-[#c9a96e] rounded-lg flex items-center justify-center shadow-lg transition-transform group-hover:scale-105">
              <Scale className="w-5 h-5 text-[#0e2340]" />
            </div>
            <div>
              <span className="font-bold text-2xl tracking-tight block text-white">
                Ant<span className="text-[#c9a96e]">Legal</span>
              </span>
            </div>
          </Link>
        </motion.div>

        {/* Content Area */}
        <div className="relative z-10 mt-12 flex-1 flex flex-col justify-center">
          {/* Gold Bar Line above heading */}
          <div className="w-10 h-[2px] bg-[#c9a96e] mb-8" />

          <motion.h1
            initial={{ opacity: 0, x: -20 }}
            animate={{ opacity: 1, x: 0 }}
            transition={{ delay: 0.2 }}
            className="font-serif text-[64px] xl:text-[72px] leading-[1.05] tracking-tight mb-6"
          >
            Empowering the <br />
            <span className="italic text-[#c9a96e]">Modern</span> Advocate
          </motion.h1>
          <motion.p
            initial={{ opacity: 0, x: -20 }}
            animate={{ opacity: 1, x: 0 }}
            transition={{ delay: 0.3 }}
            className="text-[17px] text-white/80 max-w-md leading-relaxed"
          >
            The comprehensive operating system designed specifically for high-performance law firms.
          </motion.p>

          {/* Testimonial Section */}
          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.8, delay: 0.4 }}
            className="mt-14 max-w-[440px]"
          >
            <div className="bg-[#12243d]/80 backdrop-blur-md border border-white/5 p-8 rounded-[24px] relative group">
              <div className="flex gap-4 items-center mb-4">
                <span className="text-[54px] font-serif text-[#c9a96e] leading-[0] mt-6">“</span>
                <div className="flex gap-1">
                  {[...Array(5)].map((_, i) => (
                    <Star key={i} className="w-4 h-4 text-[#c9a96e] fill-[#c9a96e]" />
                  ))}
                </div>
              </div>

              <blockquote className="text-base font-light leading-relaxed mb-8 italic text-white/90">
                AntLegal has completely transformed how we manage our case lifecycle. The efficiency gains are remarkable.
              </blockquote>

              <div className="border-t border-white/10 pt-6 flex items-center gap-4">
                <div className="w-11 h-11 rounded-full border border-[#c9a96e] overflow-hidden bg-transparent flex items-center justify-center font-semibold text-sm text-[#c9a96e]">
                  RS
                </div>
                <div>
                  <p className="font-semibold text-[15px]">Ritik Saxena</p>
                  <p className="text-[13px] text-white/60">
                    CEO, Saxena & Associates
                  </p>
                </div>
              </div>
            </div>
          </motion.div>
        </div>

        {/* Bottom Stats (3 columns) */}
        <div className="relative z-10 flex items-center gap-8 xl:gap-12 mt-12 pt-8">
          <div className="flex items-center gap-3">
            <ShieldCheck className="w-6 h-6 text-[#c9a96e]" strokeWidth={1.5} />
            <div>
              <p className="text-[13px] font-semibold text-white">Secure Access</p>
              <p className="text-[12px] text-white/60">256-bit encryption</p>
            </div>
          </div>
          <div className="flex items-center gap-3">
            <Clock className="w-6 h-6 text-[#c9a96e]" strokeWidth={1.5} />
            <div>
              <p className="text-[13px] font-semibold text-white">Always Available</p>
              <p className="text-[12px] text-white/60">99.9% uptime</p>
            </div>
          </div>
          <div className="flex items-center gap-3">
            <UserCheck className="w-6 h-6 text-[#c9a96e]" strokeWidth={1.5} />
            <div>
              <p className="text-[13px] font-semibold text-white">Your Data, Protected</p>
              <p className="text-[12px] text-white/60">Industry-standard security</p>
            </div>
          </div>
        </div>
      </div>

      {/* RIGHT SIDE: Login Form Container */}
      <div className="w-full lg:w-1/2 bg-[#f8f9fa] flex flex-col items-center justify-center relative p-6 overflow-y-auto h-full py-12 lg:py-6">

        {/* Curved background pattern (simulated with radial gradient for clean look) */}
        <div className="absolute inset-0 opacity-[0.4]"
          style={{ background: 'radial-gradient(circle at top right, #f2ece1 0%, transparent 40%)' }}></div>
        <div className="absolute inset-0 opacity-[0.4]"
          style={{ background: 'radial-gradient(circle at bottom left, #f2ece1 0%, transparent 40%)' }}></div>

        {/* FLOATING CARD */}
        <div className="relative z-10 w-full max-w-[620px] bg-white rounded-[28px] p-8 md:p-12 shadow-[0_8px_30px_rgb(0,0,0,0.04)] border border-gray-100">

          <motion.div
            initial={{ opacity: 0, y: 20 }}
            animate={{ opacity: 1, y: 0 }}
            transition={{ duration: 0.6 }}
            className="w-full"
          >
            {/* Header section with icon */}
            <div className="flex flex-col items-center text-center mb-8">
              <div className="w-12 h-12 bg-[#faf7f2] border border-[#f2e8d5] rounded-full flex items-center justify-center mb-5">
                <ShieldCheck className="w-8 h-8 text-[#c9a96e]" strokeWidth={2} />
              </div>
              <h2 className="font-serif text-[38px] text-[#0e2340] mb-0">
                Welcome back
              </h2>
              <p className="text-[17px] text-gray-800">Sign in to access your AntLegal portal</p>
            </div>

            <AnimatePresence mode="wait">
              {error && (
                <motion.div
                  initial={{ opacity: 0, y: -10 }}
                  animate={{ opacity: 1, y: 0 }}
                  exit={{ opacity: 0, y: -10 }}
                  className="bg-red-50 border border-red-100 rounded-xl p-4 mb-6 flex items-center gap-3 text-red-700"
                >
                  <AlertCircle className="w-5 h-5 text-red-600 flex-shrink-0" />
                  <div className="text-sm font-medium">{error}</div>
                </motion.div>
              )}
            </AnimatePresence>

            <form className="space-y-5" onSubmit={handleSubmit}>

              {/* Email / Username Input */}
              <div className="space-y-1.5">
                <label htmlFor="email" className="block text-[14px] font-semibold text-[#0e2340]">
                  {loginMode === 'password' ? 'Email or Username' : 'Email or Phone'}
                </label>
                <div className="relative">
                  <div className="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                    {isEmailInput ? (
                      <User className={`w-5 h-5 transition-colors duration-300 ${focusedField === 'email' ? 'text-[#c9a96e]' : 'text-gray-400'}`} strokeWidth={1.5} />
                    ) : (
                      <Phone className={`w-5 h-5 transition-colors duration-300 ${focusedField === 'email' ? 'text-[#c9a96e]' : 'text-gray-400'}`} strokeWidth={1.5} />
                    )}
                  </div>
                  <input
                    id="email"
                    name="email"
                    type="text"
                    autoComplete="username"
                    required
                    value={formData.email}
                    disabled={otpSent && loginMode === 'code'}
                    onChange={handleInputChange}
                    onFocus={() => setFocusedField('email')}
                    onBlur={() => setFocusedField(null)}
                    className={`block w-full pl-12 pr-4 h-[52px] bg-white border rounded-xl text-[#0e2340] font-medium placeholder-gray-400 transition-all focus:outline-none focus:ring-1 focus:ring-[#0e2340] ${focusedField === 'email' ? 'border-[#0e2340]' : 'border-gray-200'} ${otpSent && loginMode === 'code' ? 'opacity-50 bg-gray-50' : ''}`}
                    placeholder="name@lawfirm.com"
                  />
                </div>
              </div>

              {/* Dynamic Second Field (Password or OTP) */}
              <AnimatePresence mode="wait">
                {loginMode === 'password' ? (
                  <motion.div
                    key="password-field"
                    initial={{ opacity: 0, x: 10 }}
                    animate={{ opacity: 1, x: 0 }}
                    exit={{ opacity: 0, x: -10 }}
                    transition={{ duration: 0.3 }}
                    className="space-y-1.5"
                  >
                    <div className="flex items-center justify-between">
                      <label htmlFor="password" className="block text-[14px] font-semibold text-[#0e2340]">
                        Password
                      </label>
                      <Link
                        href="/forgot-password"
                        className="text-[13px] font-medium text-[#c9a96e] hover:text-[#0e2340] transition-colors"
                      >
                        Forgot password?
                      </Link>
                    </div>
                    <div className="relative">
                      <PasswordInput
                        value={formData.password}
                        onChange={v => setFormData(p => ({ ...p, password: v }))}
                        required={loginMode === 'password'}
                        autoComplete="current-password"
                        className="!pl-12 !h-[52px] !bg-white !border !border-gray-200 !rounded-xl focus:!border-[#0e2340] focus:!ring-1 focus:!ring-[#0e2340] transition-all !font-medium"
                      />
                      <div className="absolute inset-y-0 left-0 pl-4 flex items-center pointer-events-none">
                        <Lock className="w-5 h-5 text-gray-400" strokeWidth={1.5} />
                      </div>
                    </div>
                  </motion.div>
                ) : otpSent ? (
                  <motion.div
                    key="otp-field"
                    initial={{ opacity: 0, x: 10 }}
                    animate={{ opacity: 1, x: 0 }}
                    exit={{ opacity: 0, x: -10 }}
                    className="space-y-1.5"
                  >
                    <div className="flex items-center justify-between">
                      <label htmlFor="otp" className="block text-[14px] font-semibold text-[#0e2340]">
                        Verification Code
                      </label>
                      <button
                        type="button"
                        onClick={() => { setOtpSent(false); setOtpValue(''); setError(''); }}
                        className="text-[13px] font-medium text-[#c9a96e] hover:text-[#0e2340] transition-colors"
                      >
                        Change Account
                      </button>
                    </div>
                    <input
                      id="otp"
                      name="otp"
                      type="text"
                      required
                      value={otpValue}
                      onChange={(e) => { setOtpValue(e.target.value); setError(''); }}
                      className="block w-full px-4 h-[52px] bg-white border border-gray-200 rounded-xl text-center tracking-[0.5em] text-xl font-bold text-[#0e2340] placeholder-gray-300 focus:outline-none focus:border-[#0e2340] focus:ring-1 focus:ring-[#0e2340] transition-all uppercase"
                      placeholder="••••••"
                      maxLength={6}
                    />
                  </motion.div>
                ) : null}
              </AnimatePresence>

              {/* Main Submit Button */}
              <motion.button
                whileHover={{ scale: 1.01 }}
                whileTap={{ scale: 0.99 }}
                type="submit"
                disabled={loading}
                className="w-full mt-2 h-[52px] bg-[#0A1629] text-white rounded-xl font-semibold text-[15px] transition-all hover:bg-[#122543] disabled:opacity-70 disabled:cursor-not-allowed flex items-center justify-center px-6 relative"
              >
                {loading ? (
                  <div className="w-5 h-5 border-2 border-white/30 border-t-white rounded-full animate-spin" />
                ) : (
                  <>
                    <span>
                      {loginMode === 'password' ? 'Sign In to Portal' :
                        otpSent ? 'Verify Code' : 'Send Code'}
                    </span>
                    <ArrowRight className="w-5 h-5 absolute right-6" />
                  </>
                )}
              </motion.button>
            </form>

            {/* Divider */}
            <div className="relative flex items-center py-6">
              <div className="flex-grow border-t border-gray-200"></div>
              <span className="flex-shrink-0 mx-4 text-gray-400 text-xs font-semibold uppercase">OR</span>
              <div className="flex-grow border-t border-gray-200"></div>
            </div>

            {/* OTP / Password Toggle Button */}
            <button
              type="button"
              className="w-full h-[52px] bg-white border border-gray-200 rounded-xl text-[14px] font-semibold text-[#0e2340] transition-all hover:bg-gray-50 flex items-center justify-center gap-2 mb-6"
              onClick={() => { setLoginMode(loginMode === 'password' ? 'code' : 'password'); setOtpSent(false); setOtpValue(''); setError(''); }}
            >
              {loginMode === 'password' ? (
                <><Fingerprint className="w-5 h-5 text-[#c9a96e]" /> Sign in with OTP</>
              ) : (
                <><Lock className="w-5 h-5 text-[#c9a96e]" /> Sign in with Password</>
              )}
            </button>

            {/* Remember Me & Create Account Row */}
            <div className="flex items-center justify-between mb-8">
              <div className="flex items-center gap-2">
                <input
                  id="remember-me"
                  type="checkbox"
                  checked={rememberMe}
                  onChange={(e) => setRememberMe(e.target.checked)}
                  className="w-4 h-4 text-[#0e2340] border-gray-300 rounded focus:ring-[#0e2340] cursor-pointer"
                />
                <label htmlFor="remember-me" className="text-[14px] text-gray-600 font-medium cursor-pointer">
                  Remember me
                </label>
              </div>
              <p className="text-[14px] font-medium text-gray-500">
                New here? {' '}
                <Link href="/register" className="text-[#c9a96e] hover:text-[#0e2340] font-semibold transition-colors">Create Account</Link>
              </p>
            </div>

            {/* Trust Badge */}
            <div className="bg-[#f8f9fa] rounded-xl p-4 flex gap-3 items-start border border-gray-100">
              <ShieldCheck className="w-5 h-5 text-gray-400 mt-0.5 flex-shrink-0" strokeWidth={1.5} />
              <p className="text-[12px] text-gray-500 leading-relaxed">
                Protected by industry-standard encryption.<br />
                By signing in, you agree to our <Link href="/terms" className="text-[#c9a96e] hover:underline">Terms</Link> and <Link href="/privacy" className="text-[#c9a96e] hover:underline">Privacy Policy</Link>.
              </p>
            </div>

          </motion.div>
        </div> {/* END FLOATING CARD */}

        {/* Copyright Text at Bottom */}
        <div className="absolute bottom-8 text-[13px] font-medium text-gray-500">
          © 2026 AntLegal. All rights reserved.
        </div>
      </div>
    </div>
  );
}