# AntLegal Law Firm Management System - Technical & Role Report

## 1. Project Architecture Overview
The project is built as a modern, high-fidelity Law Firm Management System (SaaS) designed to handle complex legal operations, multi-firm management, and financial tracking.

*   **Frontend Framework:** Next.js 16.2.1 (App Router) with Turbopack.
*   **Language:** TypeScript (Strict type safety).
*   **Styling:** Tailwind CSS 4.0 with a custom premium design system (Glassmorphism, Dark Modes).
*   **API Layer:** Centralized API reference in `frontend/lib/api.ts` using a custom `customFetch` wrapper.

---

## 2. Role-Based Access Control (RBAC) & Capabilities

### A. Platform Owner (Global Administrator)
The **Platform Owner** is the highest-level account, responsible for the entire infrastructure and system-wide configurations.
*   **Firm Management:** Can create, deactivate, and monitor all Law Firms across the platform (`/api/firms/`).
*   **Partner Management:** Manages relationship managers and partners who onboard new firms.
*   **System Configuration:** Controls global settings, public configurations, and platform-wide security policies.
*   **Audit Logs:** Full visibility into every action taken across the entire platform.

### B. Super Admin (Regional/Group Manager)
The **Super Admin** typically manages a group of firms or a large legal conglomerate.
*   **Multi-Firm Oversight:** Can list and view details of all firms assigned to their group.
*   **User Provisioning:** Has the authority to `ADD_USER` to any firm within their jurisdiction.
*   **Managed Accounts:** Under the Super Admin come **Firm Admins**, **Partner Managers**, and **Regional Staff**.

### C. Admin / Firm Admin (Office Manager)
The **Admin** has full control over a **specific law firm**.
*   **Staff Management:** Add/Remove Advocates, Paralegals, and Clients to the firm.
*   **Financial Control:** Generate Client Invoices, review/approve Advocate Payouts, and monitor firm-wide financial stats.
*   **Case Oversight:** Can view all cases within the firm.
*   **Firm Config:** Update logos, bank accounts, and practice areas.

### D. Advocate (Legal Professional / Lawyer)
The **Advocate** is focused on legal casework and billable activity.
*   **Case Management:** Create and manage assigned legal cases, update stages (Kanban), and log activities.
*   **Financial Tracking:** Log billable hours (`Time Entries`), log case `Expenses`, and submit invoices to the firm for payout.
*   **Documents & Calendar:** Manage evidence, drafts, hearing schedules, and tasks.

### E. Paralegal (Legal Assistant)
The **Paralegal** provides administrative support to Advocates and Admins.
*   **Case Support:** View case details, update activity logs, and manage document libraries.
*   **Scheduling:** Assist in scheduling hearings and meetings for Advocates.
*   **Drafting:** Create and edit document drafts.

### F. Client (End User)
*   **Case Tracking:** View the status and timeline of their own cases.
*   **Document Access:** Download documents shared with them.
*   **Payments:** View and pay invoices sent by the firm.

---

## 3. Feature Implementation Status Matrix

| Feature | Platform Owner | Super Admin | Firm Admin | Advocate | Paralegal |
| :--- | :---: | :---: | :---: | :---: | :---: |
| **Create Law Firms** | ✅ | ❌ | ❌ | ❌ | ❌ |
| **Add/Remove Staff** | ✅ | ✅ | ✅ | ❌ | ❌ |
| **Manage All Cases** | ✅ | ✅ | ✅ | ❌ | ❌ |
| **Manage Assigned Cases**| ✅ | ✅ | ✅ | ✅ | ✅ |
| **Generate Client Invoices**| ❌ | ❌ | ✅ | ❌ | ❌ |
| **Log Billable Time** | ❌ | ❌ | ❌ | ✅ | ✅ |
| **Approve Payouts** | ❌ | ❌ | ✅ | ❌ | ❌ |
| **Global Audit Logs** | ✅ | ❌ | ❌ | ❌ | ❌ |

---

## 4. Integrated API Modules Summary
*   **AUTH:** JWT/Token login, OTP (Email/Phone), Switch Firm context.
*   **BILLING:** Finance Dashboards, Client Invoicing, Advocate Payouts (Submit/Review/Pay), Time Entries, and Expenses.
*   **CASES & DOCUMENTS:** Full CRUD for cases and specialized document storage (by client/case).
*   **CALENDAR:** Hearing schedules with Month/Week/Day views and high-priority alerts.
*   **JOIN LINKS:** Secure, link-based onboarding for external advocates and clients.
