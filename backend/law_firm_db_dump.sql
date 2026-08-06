--
-- PostgreSQL database dump
--

\restrict 6S2obV2wotU90p4bDoGp64oWA8wIlwMEE91CVmhRh4DUojyShnCWVuaFUmllS3q

-- Dumped from database version 18.4 (Ubuntu 18.4-1.pgdg22.04+1)
-- Dumped by pg_dump version 18.4 (Ubuntu 18.4-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.tasks_task DROP CONSTRAINT IF EXISTS tasks_task_firm_id_d4629d31_fk_firms_firm_id;
ALTER TABLE IF EXISTS ONLY public.tasks_task DROP CONSTRAINT IF EXISTS tasks_task_assigned_to_id_e8821f61_fk_accounts_customuser_id;
ALTER TABLE IF EXISTS ONLY public.subscriptions_platforminvoice DROP CONSTRAINT IF EXISTS subscriptions_platforminvoice_firm_id_84cc879b_fk_firms_firm_id;
ALTER TABLE IF EXISTS ONLY public.subscriptions_platforminvoice DROP CONSTRAINT IF EXISTS subscriptions_platfo_subscription_plan_id_fbb2d25c_fk_subscript;
ALTER TABLE IF EXISTS ONLY public.subscriptions_platforminvoice DROP CONSTRAINT IF EXISTS subscriptions_platfo_created_by_id_c4bb7851_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.subscriptions_firmsubscription DROP CONSTRAINT IF EXISTS subscriptions_firmsu_plan_id_a18eb6a8_fk_subscript;
ALTER TABLE IF EXISTS ONLY public.subscriptions_firmsubscription DROP CONSTRAINT IF EXISTS subscriptions_firmsu_firm_id_f1be20b6_fk_firms_fir;
ALTER TABLE IF EXISTS ONLY public.partners_partner DROP CONSTRAINT IF EXISTS partners_partner_user_id_c9159f29_fk_accounts_customuser_id;
ALTER TABLE IF EXISTS ONLY public.firms_firm DROP CONSTRAINT IF EXISTS firms_firm_partner_id_d7459ff9_fk_partners_partner_id;
ALTER TABLE IF EXISTS ONLY public.firms_branch DROP CONSTRAINT IF EXISTS firms_branch_firm_id_4766aa77_fk_firms_firm_id;
ALTER TABLE IF EXISTS ONLY public.documents_userdocument DROP CONSTRAINT IF EXISTS documents_userdocument_firm_id_cea33ead_fk_firms_firm_id;
ALTER TABLE IF EXISTS ONLY public.documents_userdocument DROP CONSTRAINT IF EXISTS documents_userdocument_client_id_c7c4b7f8_fk_clients_client_id;
ALTER TABLE IF EXISTS ONLY public.documents_userdocument DROP CONSTRAINT IF EXISTS documents_userdocument_case_id_1349fd44_fk_cases_case_id;
ALTER TABLE IF EXISTS ONLY public.documents_userdocument DROP CONSTRAINT IF EXISTS documents_userdocume_verified_by_id_82898597_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.documents_userdocument DROP CONSTRAINT IF EXISTS documents_userdocume_uploaded_by_id_3ca547c8_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.documents_userdocument DROP CONSTRAINT IF EXISTS documents_userdocume_parent_document_id_40d92964_fk_documents;
ALTER TABLE IF EXISTS ONLY public.documents_userdocument DROP CONSTRAINT IF EXISTS documents_userdocume_deleted_by_id_bcd8d9e5_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.documents_filledtemplate DROP CONSTRAINT IF EXISTS documents_filledtemplate_firm_id_75938c0f_fk_firms_firm_id;
ALTER TABLE IF EXISTS ONLY public.documents_filledtemplate DROP CONSTRAINT IF EXISTS documents_filledtemplate_case_id_e1094399_fk_cases_case_id;
ALTER TABLE IF EXISTS ONLY public.documents_filledtemplate DROP CONSTRAINT IF EXISTS documents_filledtemp_template_id_ac7fbc96_fk_documents;
ALTER TABLE IF EXISTS ONLY public.documents_filledtemplate DROP CONSTRAINT IF EXISTS documents_filledtemp_created_by_id_3db5a309_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.documents_filledtemplate DROP CONSTRAINT IF EXISTS documents_filledtemp_client_id_1272c712_fk_clients_c;
ALTER TABLE IF EXISTS ONLY public.documents_filledcourtform DROP CONSTRAINT IF EXISTS documents_filledcourtform_case_id_b2dd4546_fk_cases_case_id;
ALTER TABLE IF EXISTS ONLY public.documents_filledcourtform DROP CONSTRAINT IF EXISTS documents_filledcour_template_id_0e93b117_fk_documents;
ALTER TABLE IF EXISTS ONLY public.documents_filledcourtform DROP CONSTRAINT IF EXISTS documents_filledcour_created_by_id_44083e33_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.documents_filledcourtform DROP CONSTRAINT IF EXISTS documents_filledcour_client_id_33ff8886_fk_clients_c;
ALTER TABLE IF EXISTS ONLY public.documents_documenttemplate DROP CONSTRAINT IF EXISTS documents_documentte_created_by_id_fce09d26_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.documents_courtformtemplate DROP CONSTRAINT IF EXISTS documents_courtformt_created_by_id_6d62c788_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_user_id_c564eba6_fk_accounts_customuser_id;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_content_type_id_c4bce8eb_fk_django_co;
ALTER TABLE IF EXISTS ONLY public.clients_client DROP CONSTRAINT IF EXISTS clients_client_user_account_id_4eae210b_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.clients_client DROP CONSTRAINT IF EXISTS clients_client_firm_id_f01fe4b9_fk_firms_firm_id;
ALTER TABLE IF EXISTS ONLY public.clients_client DROP CONSTRAINT IF EXISTS clients_client_assigned_advocate_id_6166c336_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.cases_serviceattempt DROP CONSTRAINT IF EXISTS cases_serviceattempt_created_by_id_cc8b86f7_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.cases_serviceattempt DROP CONSTRAINT IF EXISTS cases_serviceattempt_case_id_9ca7e725_fk_cases_case_id;
ALTER TABLE IF EXISTS ONLY public.cases_legalnotice DROP CONSTRAINT IF EXISTS cases_legalnotice_last_status_updated__308c37f3_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.cases_legalnotice DROP CONSTRAINT IF EXISTS cases_legalnotice_created_by_id_fbb48ecc_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.cases_legalnotice DROP CONSTRAINT IF EXISTS cases_legalnotice_case_id_0e707d9b_fk_cases_case_id;
ALTER TABLE IF EXISTS ONLY public.cases_hearing DROP CONSTRAINT IF EXISTS cases_hearing_case_id_4e219f2e_fk_cases_case_id;
ALTER TABLE IF EXISTS ONLY public.cases_caseresearch DROP CONSTRAINT IF EXISTS cases_caseresearch_created_by_id_11caeb56_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.cases_caseresearch DROP CONSTRAINT IF EXISTS cases_caseresearch_case_id_f0390755_fk_cases_case_id;
ALTER TABLE IF EXISTS ONLY public.cases_casedraft DROP CONSTRAINT IF EXISTS cases_casedraft_created_by_id_5b2e9085_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.cases_casedraft DROP CONSTRAINT IF EXISTS cases_casedraft_case_id_751aca94_fk_cases_case_id;
ALTER TABLE IF EXISTS ONLY public.cases_casedocumentrequest DROP CONSTRAINT IF EXISTS cases_casedocumentrequest_case_id_a6555cc2_fk_cases_case_id;
ALTER TABLE IF EXISTS ONLY public.cases_casedocumentrequest DROP CONSTRAINT IF EXISTS cases_casedocumentre_uploaded_document_id_517ef377_fk_documents;
ALTER TABLE IF EXISTS ONLY public.cases_casedocumentrequest DROP CONSTRAINT IF EXISTS cases_casedocumentre_requested_by_id_bbf68e61_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.cases_casedocumentchecklistitem DROP CONSTRAINT IF EXISTS cases_casedocumentch_verified_by_id_28af225e_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.cases_casedocumentchecklistitem DROP CONSTRAINT IF EXISTS cases_casedocumentch_uploaded_document_id_3fb137a6_fk_documents;
ALTER TABLE IF EXISTS ONLY public.cases_casedocumentchecklistitem DROP CONSTRAINT IF EXISTS cases_casedocumentch_checklist_template_i_7a415373_fk_cases_doc;
ALTER TABLE IF EXISTS ONLY public.cases_casedocumentchecklistitem DROP CONSTRAINT IF EXISTS cases_casedocumentch_case_id_2d72b29f_fk_cases_cas;
ALTER TABLE IF EXISTS ONLY public.cases_caseactivity DROP CONSTRAINT IF EXISTS cases_caseactivity_performed_by_id_ce2b1aee_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.cases_caseactivity DROP CONSTRAINT IF EXISTS cases_caseactivity_case_id_31678709_fk_cases_case_id;
ALTER TABLE IF EXISTS ONLY public.cases_case DROP CONSTRAINT IF EXISTS cases_case_solo_advocate_id_d43ed8ef_fk_accounts_customuser_id;
ALTER TABLE IF EXISTS ONLY public.cases_case DROP CONSTRAINT IF EXISTS cases_case_firm_id_6f74c8be_fk_firms_firm_id;
ALTER TABLE IF EXISTS ONLY public.cases_case DROP CONSTRAINT IF EXISTS cases_case_client_id_d55d12dd_fk_clients_client_id;
ALTER TABLE IF EXISTS ONLY public.cases_case DROP CONSTRAINT IF EXISTS cases_case_branch_id_4071ae4c_fk_firms_branch_id;
ALTER TABLE IF EXISTS ONLY public.cases_case DROP CONSTRAINT IF EXISTS cases_case_assigned_paralegal_i_84162e09_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.cases_case DROP CONSTRAINT IF EXISTS cases_case_assigned_advocate_id_79ed6963_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.calendar_events_calendarevent DROP CONSTRAINT IF EXISTS calendar_events_calendarevent_firm_id_aa6f1ce4_fk_firms_firm_id;
ALTER TABLE IF EXISTS ONLY public.calendar_events_calendarevent DROP CONSTRAINT IF EXISTS calendar_events_calendarevent_case_id_50520432_fk_cases_case_id;
ALTER TABLE IF EXISTS ONLY public.calendar_events_calendarevent_assigned_to DROP CONSTRAINT IF EXISTS calendar_events_cale_customuser_id_306dbe1e_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.calendar_events_calendarevent DROP CONSTRAINT IF EXISTS calendar_events_cale_created_by_id_7543de9a_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.calendar_events_calendarevent DROP CONSTRAINT IF EXISTS calendar_events_cale_client_id_65d8ff62_fk_clients_c;
ALTER TABLE IF EXISTS ONLY public.calendar_events_calendarevent_assigned_to DROP CONSTRAINT IF EXISTS calendar_events_cale_calendarevent_id_794a58f6_fk_calendar_;
ALTER TABLE IF EXISTS ONLY public.billing_trustaccount DROP CONSTRAINT IF EXISTS billing_trustaccount_reference_invoice_id_0bdb2c5d_fk_billing_i;
ALTER TABLE IF EXISTS ONLY public.billing_trustaccount DROP CONSTRAINT IF EXISTS billing_trustaccount_recorded_by_id_8d95b5f3_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.billing_trustaccount DROP CONSTRAINT IF EXISTS billing_trustaccount_firm_id_89c33562_fk_firms_firm_id;
ALTER TABLE IF EXISTS ONLY public.billing_trustaccount DROP CONSTRAINT IF EXISTS billing_trustaccount_client_id_a796c45d_fk_clients_client_id;
ALTER TABLE IF EXISTS ONLY public.billing_trustaccount DROP CONSTRAINT IF EXISTS billing_trustaccount_case_id_da20b8d2_fk_cases_case_id;
ALTER TABLE IF EXISTS ONLY public.billing_timeentry DROP CONSTRAINT IF EXISTS billing_timeentry_user_id_273f1373_fk_accounts_customuser_id;
ALTER TABLE IF EXISTS ONLY public.billing_timeentry DROP CONSTRAINT IF EXISTS billing_timeentry_invoice_id_3782f65a_fk_billing_invoice_id;
ALTER TABLE IF EXISTS ONLY public.billing_timeentry DROP CONSTRAINT IF EXISTS billing_timeentry_firm_id_4cb84049_fk_firms_firm_id;
ALTER TABLE IF EXISTS ONLY public.billing_timeentry DROP CONSTRAINT IF EXISTS billing_timeentry_case_id_b3d21d0a_fk_cases_case_id;
ALTER TABLE IF EXISTS ONLY public.billing_timeentry DROP CONSTRAINT IF EXISTS billing_timeentry_advocate_invoice_id_2016defd_fk_billing_a;
ALTER TABLE IF EXISTS ONLY public.billing_payment DROP CONSTRAINT IF EXISTS billing_payment_recorded_by_id_ea29dd82_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.billing_payment DROP CONSTRAINT IF EXISTS billing_payment_invoice_id_998dd3c5_fk_billing_invoice_id;
ALTER TABLE IF EXISTS ONLY public.billing_payment DROP CONSTRAINT IF EXISTS billing_payment_firm_id_76f93827_fk_firms_firm_id;
ALTER TABLE IF EXISTS ONLY public.billing_payment DROP CONSTRAINT IF EXISTS billing_payment_client_id_a94724d9_fk_clients_client_id;
ALTER TABLE IF EXISTS ONLY public.billing_invoice DROP CONSTRAINT IF EXISTS billing_invoice_firm_id_043eeed3_fk_firms_firm_id;
ALTER TABLE IF EXISTS ONLY public.billing_invoice DROP CONSTRAINT IF EXISTS billing_invoice_created_by_id_c711181e_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.billing_invoice DROP CONSTRAINT IF EXISTS billing_invoice_client_id_01577a63_fk_clients_client_id;
ALTER TABLE IF EXISTS ONLY public.billing_invoice DROP CONSTRAINT IF EXISTS billing_invoice_case_id_32a17646_fk_cases_case_id;
ALTER TABLE IF EXISTS ONLY public.billing_invoice DROP CONSTRAINT IF EXISTS billing_invoice_branch_id_e5c80119_fk_firms_branch_id;
ALTER TABLE IF EXISTS ONLY public.billing_expense DROP CONSTRAINT IF EXISTS billing_expense_submitted_by_id_376e8cfe_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.billing_expense DROP CONSTRAINT IF EXISTS billing_expense_invoice_id_e5b417d7_fk_billing_invoice_id;
ALTER TABLE IF EXISTS ONLY public.billing_expense DROP CONSTRAINT IF EXISTS billing_expense_firm_id_c1bb23f9_fk_firms_firm_id;
ALTER TABLE IF EXISTS ONLY public.billing_expense DROP CONSTRAINT IF EXISTS billing_expense_case_id_168dfd91_fk_cases_case_id;
ALTER TABLE IF EXISTS ONLY public.billing_advocateinvoice DROP CONSTRAINT IF EXISTS billing_advocateinvoice_firm_id_ed0c3cfa_fk_firms_firm_id;
ALTER TABLE IF EXISTS ONLY public.billing_advocateinvoice DROP CONSTRAINT IF EXISTS billing_advocateinvo_approved_by_id_134d09f8_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.billing_advocateinvoice DROP CONSTRAINT IF EXISTS billing_advocateinvo_advocate_id_73e4b80e_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.authtoken_token DROP CONSTRAINT IF EXISTS authtoken_token_user_id_35299eff_fk_accounts_customuser_id;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_content_type_id_2f476e4b_fk_django_co;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_group_id_b120cbf9_fk_auth_group_id;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissio_permission_id_84c5c92e_fk_auth_perm;
ALTER TABLE IF EXISTS ONLY public.audit_auditlog DROP CONSTRAINT IF EXISTS audit_auditlog_user_id_c1cca96c_fk_accounts_customuser_id;
ALTER TABLE IF EXISTS ONLY public.audit_auditlog DROP CONSTRAINT IF EXISTS audit_auditlog_firm_id_bc80d4d1_fk_firms_firm_id;
ALTER TABLE IF EXISTS ONLY public.accounts_userinvitation DROP CONSTRAINT IF EXISTS accounts_userinvitation_firm_id_cc1d5b8a_fk_firms_firm_id;
ALTER TABLE IF EXISTS ONLY public.accounts_userinvitation DROP CONSTRAINT IF EXISTS accounts_userinvitat_invited_user_id_4d0c0858_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.accounts_userinvitation DROP CONSTRAINT IF EXISTS accounts_userinvitat_invited_by_id_2a04e843_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.accounts_userfirmrole DROP CONSTRAINT IF EXISTS accounts_userfirmrole_firm_id_471bed65_fk_firms_firm_id;
ALTER TABLE IF EXISTS ONLY public.accounts_userfirmrole DROP CONSTRAINT IF EXISTS accounts_userfirmrole_branch_id_f47545b5_fk_firms_branch_id;
ALTER TABLE IF EXISTS ONLY public.accounts_userfirmrole DROP CONSTRAINT IF EXISTS accounts_userfirmrol_user_id_2ba4e296_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.accounts_otpverification DROP CONSTRAINT IF EXISTS accounts_otpverifica_user_id_b036466a_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.accounts_logincredential DROP CONSTRAINT IF EXISTS accounts_logincreden_user_id_6feb3817_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.accounts_globalconfiguration DROP CONSTRAINT IF EXISTS accounts_globalconfi_updated_by_id_14a2b875_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.accounts_firmjoinlink DROP CONSTRAINT IF EXISTS accounts_firmjoinlink_firm_id_7a5b44ae_fk_firms_firm_id;
ALTER TABLE IF EXISTS ONLY public.accounts_firmjoinlink DROP CONSTRAINT IF EXISTS accounts_firmjoinlin_created_by_id_7a5ddece_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.accounts_customuser_groups DROP CONSTRAINT IF EXISTS accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id;
ALTER TABLE IF EXISTS ONLY public.accounts_customuser DROP CONSTRAINT IF EXISTS accounts_customuser_firm_id_55594c84_fk_firms_firm_id;
ALTER TABLE IF EXISTS ONLY public.accounts_customuser_user_permissions DROP CONSTRAINT IF EXISTS accounts_customuser__permission_id_aea3d0e5_fk_auth_perm;
ALTER TABLE IF EXISTS ONLY public.accounts_customuser_groups DROP CONSTRAINT IF EXISTS accounts_customuser__customuser_id_bc55088e_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.accounts_customuser_user_permissions DROP CONSTRAINT IF EXISTS accounts_customuser__customuser_id_0deaefae_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.accounts_advocateparalegalassignment DROP CONSTRAINT IF EXISTS accounts_advocatepar_paralegal_id_82bbed5e_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.accounts_advocateparalegalassignment DROP CONSTRAINT IF EXISTS accounts_advocatepar_firm_id_68a91971_fk_firms_fir;
ALTER TABLE IF EXISTS ONLY public.accounts_advocateparalegalassignment DROP CONSTRAINT IF EXISTS accounts_advocatepar_assigned_by_id_bb4f3d7f_fk_accounts_;
ALTER TABLE IF EXISTS ONLY public.accounts_advocateparalegalassignment DROP CONSTRAINT IF EXISTS accounts_advocatepar_advocate_id_4ff07a31_fk_accounts_;
DROP INDEX IF EXISTS public.tasks_task_firm_id_d4629d31;
DROP INDEX IF EXISTS public.tasks_task_assigned_to_id_e8821f61;
DROP INDEX IF EXISTS public.subscriptions_platforminvoice_subscription_plan_id_fbb2d25c;
DROP INDEX IF EXISTS public.subscriptions_platforminvoice_invoice_number_51bfa8b7_like;
DROP INDEX IF EXISTS public.subscriptions_platforminvoice_firm_id_84cc879b;
DROP INDEX IF EXISTS public.subscriptions_platforminvoice_created_by_id_c4bb7851;
DROP INDEX IF EXISTS public.subscriptions_firmsubscription_plan_id_a18eb6a8;
DROP INDEX IF EXISTS public.subscriptio_invoice_cebd76_idx;
DROP INDEX IF EXISTS public.subscriptio_invoice_bca470_idx;
DROP INDEX IF EXISTS public.subscriptio_firm_id_2b6573_idx;
DROP INDEX IF EXISTS public.firms_firm_partner_id_d7459ff9;
DROP INDEX IF EXISTS public.firms_firm_firm_name_28b886c1_like;
DROP INDEX IF EXISTS public.firms_firm_firm_code_887422af_like;
DROP INDEX IF EXISTS public.firms_branch_firm_id_4766aa77;
DROP INDEX IF EXISTS public.documents_userdocument_verified_by_id_82898597;
DROP INDEX IF EXISTS public.documents_userdocument_uploaded_by_id_3ca547c8;
DROP INDEX IF EXISTS public.documents_userdocument_parent_document_id_40d92964;
DROP INDEX IF EXISTS public.documents_userdocument_firm_id_cea33ead;
DROP INDEX IF EXISTS public.documents_userdocument_deleted_by_id_bcd8d9e5;
DROP INDEX IF EXISTS public.documents_userdocument_client_id_c7c4b7f8;
DROP INDEX IF EXISTS public.documents_userdocument_case_id_1349fd44;
DROP INDEX IF EXISTS public.documents_u_uploade_25d511_idx;
DROP INDEX IF EXISTS public.documents_u_firm_id_c3a9bd_idx;
DROP INDEX IF EXISTS public.documents_u_client__02596f_idx;
DROP INDEX IF EXISTS public.documents_u_case_id_8e3245_idx;
DROP INDEX IF EXISTS public.documents_filledtemplate_template_id_ac7fbc96;
DROP INDEX IF EXISTS public.documents_filledtemplate_firm_id_75938c0f;
DROP INDEX IF EXISTS public.documents_filledtemplate_created_by_id_3db5a309;
DROP INDEX IF EXISTS public.documents_filledtemplate_client_id_1272c712;
DROP INDEX IF EXISTS public.documents_filledtemplate_case_id_e1094399;
DROP INDEX IF EXISTS public.documents_filledcourtform_template_id_0e93b117;
DROP INDEX IF EXISTS public.documents_filledcourtform_created_by_id_44083e33;
DROP INDEX IF EXISTS public.documents_filledcourtform_client_id_33ff8886;
DROP INDEX IF EXISTS public.documents_filledcourtform_case_id_b2dd4546;
DROP INDEX IF EXISTS public.documents_f_client__00ebcc_idx;
DROP INDEX IF EXISTS public.documents_f_case_id_69f6ee_idx;
DROP INDEX IF EXISTS public.documents_documenttemplate_created_by_id_fce09d26;
DROP INDEX IF EXISTS public.documents_d_categor_ca6c30_idx;
DROP INDEX IF EXISTS public.documents_courtformtemplate_created_by_id_6d62c788;
DROP INDEX IF EXISTS public.django_session_session_key_c0390e0f_like;
DROP INDEX IF EXISTS public.django_session_expire_date_a5c62663;
DROP INDEX IF EXISTS public.django_admin_log_user_id_c564eba6;
DROP INDEX IF EXISTS public.django_admin_log_content_type_id_c4bce8eb;
DROP INDEX IF EXISTS public.clients_client_user_account_id_4eae210b;
DROP INDEX IF EXISTS public.clients_client_firm_id_f01fe4b9;
DROP INDEX IF EXISTS public.clients_client_assigned_advocate_id_6166c336;
DROP INDEX IF EXISTS public.cases_serviceattempt_created_by_id_cc8b86f7;
DROP INDEX IF EXISTS public.cases_serviceattempt_case_id_9ca7e725;
DROP INDEX IF EXISTS public.cases_legalnotice_last_status_updated_by_id_308c37f3;
DROP INDEX IF EXISTS public.cases_legalnotice_created_by_id_fbb48ecc;
DROP INDEX IF EXISTS public.cases_legalnotice_case_id_0e707d9b;
DROP INDEX IF EXISTS public.cases_hearing_case_id_4e219f2e;
DROP INDEX IF EXISTS public.cases_caseresearch_created_by_id_11caeb56;
DROP INDEX IF EXISTS public.cases_caseresearch_case_id_f0390755;
DROP INDEX IF EXISTS public.cases_casedraft_created_by_id_5b2e9085;
DROP INDEX IF EXISTS public.cases_casedraft_case_id_751aca94;
DROP INDEX IF EXISTS public.cases_casedocumentrequest_uploaded_document_id_517ef377;
DROP INDEX IF EXISTS public.cases_casedocumentrequest_requested_by_id_bbf68e61;
DROP INDEX IF EXISTS public.cases_casedocumentrequest_case_id_a6555cc2;
DROP INDEX IF EXISTS public.cases_casedocumentchecklistitem_verified_by_id_28af225e;
DROP INDEX IF EXISTS public.cases_casedocumentchecklistitem_uploaded_document_id_3fb137a6;
DROP INDEX IF EXISTS public.cases_casedocumentchecklistitem_checklist_template_id_7a415373;
DROP INDEX IF EXISTS public.cases_casedocumentchecklistitem_case_id_2d72b29f;
DROP INDEX IF EXISTS public.cases_cased_status_91adee_idx;
DROP INDEX IF EXISTS public.cases_cased_case_id_e562fe_idx;
DROP INDEX IF EXISTS public.cases_caseactivity_performed_by_id_ce2b1aee;
DROP INDEX IF EXISTS public.cases_caseactivity_case_id_31678709;
DROP INDEX IF EXISTS public.cases_case_solo_advocate_id_d43ed8ef;
DROP INDEX IF EXISTS public.cases_case_firm_id_6f74c8be;
DROP INDEX IF EXISTS public.cases_case_client_id_d55d12dd;
DROP INDEX IF EXISTS public.cases_case_branch_id_4071ae4c;
DROP INDEX IF EXISTS public.cases_case_assigned_paralegal_id_84162e09;
DROP INDEX IF EXISTS public.cases_case_assigned_advocate_id_79ed6963;
DROP INDEX IF EXISTS public.calendar_events_calendarevent_firm_id_aa6f1ce4;
DROP INDEX IF EXISTS public.calendar_events_calendarevent_created_by_id_7543de9a;
DROP INDEX IF EXISTS public.calendar_events_calendarevent_client_id_65d8ff62;
DROP INDEX IF EXISTS public.calendar_events_calendarevent_case_id_50520432;
DROP INDEX IF EXISTS public.calendar_events_calendarev_customuser_id_306dbe1e;
DROP INDEX IF EXISTS public.calendar_events_calendarev_calendarevent_id_794a58f6;
DROP INDEX IF EXISTS public.calendar_ev_start_d_ebf05b_idx;
DROP INDEX IF EXISTS public.calendar_ev_firm_id_40c20d_idx;
DROP INDEX IF EXISTS public.calendar_ev_event_t_a01d70_idx;
DROP INDEX IF EXISTS public.billing_trustaccount_reference_invoice_id_0bdb2c5d;
DROP INDEX IF EXISTS public.billing_trustaccount_recorded_by_id_8d95b5f3;
DROP INDEX IF EXISTS public.billing_trustaccount_firm_id_89c33562;
DROP INDEX IF EXISTS public.billing_trustaccount_client_id_a796c45d;
DROP INDEX IF EXISTS public.billing_trustaccount_case_id_da20b8d2;
DROP INDEX IF EXISTS public.billing_tru_transac_56b01e_idx;
DROP INDEX IF EXISTS public.billing_tru_firm_id_60f662_idx;
DROP INDEX IF EXISTS public.billing_timeentry_user_id_273f1373;
DROP INDEX IF EXISTS public.billing_timeentry_invoice_id_3782f65a;
DROP INDEX IF EXISTS public.billing_timeentry_firm_id_4cb84049;
DROP INDEX IF EXISTS public.billing_timeentry_case_id_b3d21d0a;
DROP INDEX IF EXISTS public.billing_timeentry_advocate_invoice_id_2016defd;
DROP INDEX IF EXISTS public.billing_tim_user_id_f4a8e3_idx;
DROP INDEX IF EXISTS public.billing_tim_firm_id_388ddf_idx;
DROP INDEX IF EXISTS public.billing_payment_recorded_by_id_ea29dd82;
DROP INDEX IF EXISTS public.billing_payment_invoice_id_998dd3c5;
DROP INDEX IF EXISTS public.billing_payment_firm_id_76f93827;
DROP INDEX IF EXISTS public.billing_payment_client_id_a94724d9;
DROP INDEX IF EXISTS public.billing_pay_invoice_a67165_idx;
DROP INDEX IF EXISTS public.billing_pay_firm_id_2a7f15_idx;
DROP INDEX IF EXISTS public.billing_invoice_invoice_number_c444ad03_like;
DROP INDEX IF EXISTS public.billing_invoice_firm_id_043eeed3;
DROP INDEX IF EXISTS public.billing_invoice_created_by_id_c711181e;
DROP INDEX IF EXISTS public.billing_invoice_client_id_01577a63;
DROP INDEX IF EXISTS public.billing_invoice_case_id_32a17646;
DROP INDEX IF EXISTS public.billing_invoice_branch_id_e5c80119;
DROP INDEX IF EXISTS public.billing_inv_invoice_70511c_idx;
DROP INDEX IF EXISTS public.billing_inv_firm_id_695ebc_idx;
DROP INDEX IF EXISTS public.billing_inv_client__85c90b_idx;
DROP INDEX IF EXISTS public.billing_expense_submitted_by_id_376e8cfe;
DROP INDEX IF EXISTS public.billing_expense_invoice_id_e5b417d7;
DROP INDEX IF EXISTS public.billing_expense_firm_id_c1bb23f9;
DROP INDEX IF EXISTS public.billing_expense_case_id_168dfd91;
DROP INDEX IF EXISTS public.billing_exp_status_ddbf2b_idx;
DROP INDEX IF EXISTS public.billing_exp_firm_id_8c02fb_idx;
DROP INDEX IF EXISTS public.billing_advocateinvoice_invoice_number_811c1161_like;
DROP INDEX IF EXISTS public.billing_advocateinvoice_firm_id_ed0c3cfa;
DROP INDEX IF EXISTS public.billing_advocateinvoice_approved_by_id_134d09f8;
DROP INDEX IF EXISTS public.billing_advocateinvoice_advocate_id_73e4b80e;
DROP INDEX IF EXISTS public.billing_adv_invoice_156c4b_idx;
DROP INDEX IF EXISTS public.billing_adv_invoice_083b77_idx;
DROP INDEX IF EXISTS public.billing_adv_firm_id_8ed630_idx;
DROP INDEX IF EXISTS public.authtoken_token_key_10f0b77e_like;
DROP INDEX IF EXISTS public.auth_permission_content_type_id_2f476e4b;
DROP INDEX IF EXISTS public.auth_group_permissions_permission_id_84c5c92e;
DROP INDEX IF EXISTS public.auth_group_permissions_group_id_b120cbf9;
DROP INDEX IF EXISTS public.auth_group_name_a6ea08ec_like;
DROP INDEX IF EXISTS public.audit_auditlog_user_id_c1cca96c;
DROP INDEX IF EXISTS public.audit_auditlog_firm_id_bc80d4d1;
DROP INDEX IF EXISTS public.audit_audit_user_id_429f6b_idx;
DROP INDEX IF EXISTS public.audit_audit_action_0c6a84_idx;
DROP INDEX IF EXISTS public.accounts_userinvitation_invited_user_id_4d0c0858;
DROP INDEX IF EXISTS public.accounts_userinvitation_invited_by_id_2a04e843;
DROP INDEX IF EXISTS public.accounts_userinvitation_firm_id_cc1d5b8a;
DROP INDEX IF EXISTS public.accounts_userfirmrole_user_id_2ba4e296;
DROP INDEX IF EXISTS public.accounts_userfirmrole_firm_id_471bed65;
DROP INDEX IF EXISTS public.accounts_userfirmrole_branch_id_f47545b5;
DROP INDEX IF EXISTS public.accounts_us_user_id_9a0cdf_idx;
DROP INDEX IF EXISTS public.accounts_us_is_acti_952e1c_idx;
DROP INDEX IF EXISTS public.accounts_otpverification_user_id_b036466a;
DROP INDEX IF EXISTS public.accounts_logincredential_username_dcb9e64f_like;
DROP INDEX IF EXISTS public.accounts_lo_usernam_9fec08_idx;
DROP INDEX IF EXISTS public.accounts_globalconfiguration_updated_by_id_14a2b875;
DROP INDEX IF EXISTS public.accounts_firmjoinlink_firm_id_7a5b44ae;
DROP INDEX IF EXISTS public.accounts_firmjoinlink_created_by_id_7a5ddece;
DROP INDEX IF EXISTS public.accounts_fi_firm_id_b4122c_idx;
DROP INDEX IF EXISTS public.accounts_customuser_username_722f3555_like;
DROP INDEX IF EXISTS public.accounts_customuser_user_permissions_permission_id_aea3d0e5;
DROP INDEX IF EXISTS public.accounts_customuser_user_permissions_customuser_id_0deaefae;
DROP INDEX IF EXISTS public.accounts_customuser_phone_number_32c4e511_like;
DROP INDEX IF EXISTS public.accounts_customuser_pan_number_403a0e57_like;
DROP INDEX IF EXISTS public.accounts_customuser_groups_group_id_86ba5f9e;
DROP INDEX IF EXISTS public.accounts_customuser_groups_customuser_id_bc55088e;
DROP INDEX IF EXISTS public.accounts_customuser_firm_id_55594c84;
DROP INDEX IF EXISTS public.accounts_customuser_aadhar_number_4850f478_like;
DROP INDEX IF EXISTS public.accounts_cu_user_ty_97b0bf_idx;
DROP INDEX IF EXISTS public.accounts_cu_phone_n_908ea4_idx;
DROP INDEX IF EXISTS public.accounts_cu_firm_id_136e62_idx;
DROP INDEX IF EXISTS public.accounts_cu_email_5ce40b_idx;
DROP INDEX IF EXISTS public.accounts_advocateparalegalassignment_paralegal_id_82bbed5e;
DROP INDEX IF EXISTS public.accounts_advocateparalegalassignment_firm_id_68a91971;
DROP INDEX IF EXISTS public.accounts_advocateparalegalassignment_assigned_by_id_bb4f3d7f;
DROP INDEX IF EXISTS public.accounts_advocateparalegalassignment_advocate_id_4ff07a31;
DROP INDEX IF EXISTS public.accounts_ad_paraleg_280fec_idx;
DROP INDEX IF EXISTS public.accounts_ad_is_acti_f20e9c_idx;
DROP INDEX IF EXISTS public.accounts_ad_advocat_709825_idx;
ALTER TABLE IF EXISTS ONLY public.tasks_task DROP CONSTRAINT IF EXISTS tasks_task_pkey;
ALTER TABLE IF EXISTS ONLY public.subscriptions_subscriptionplan DROP CONSTRAINT IF EXISTS subscriptions_subscriptionplan_pkey;
ALTER TABLE IF EXISTS ONLY public.subscriptions_platforminvoice DROP CONSTRAINT IF EXISTS subscriptions_platforminvoice_pkey;
ALTER TABLE IF EXISTS ONLY public.subscriptions_platforminvoice DROP CONSTRAINT IF EXISTS subscriptions_platforminvoice_invoice_number_key;
ALTER TABLE IF EXISTS ONLY public.subscriptions_firmsubscription DROP CONSTRAINT IF EXISTS subscriptions_firmsubscription_pkey;
ALTER TABLE IF EXISTS ONLY public.subscriptions_firmsubscription DROP CONSTRAINT IF EXISTS subscriptions_firmsubscription_firm_id_key;
ALTER TABLE IF EXISTS ONLY public.partners_partner DROP CONSTRAINT IF EXISTS partners_partner_user_id_key;
ALTER TABLE IF EXISTS ONLY public.partners_partner DROP CONSTRAINT IF EXISTS partners_partner_pkey;
ALTER TABLE IF EXISTS ONLY public.firms_firm DROP CONSTRAINT IF EXISTS firms_firm_pkey;
ALTER TABLE IF EXISTS ONLY public.firms_firm DROP CONSTRAINT IF EXISTS firms_firm_firm_name_key;
ALTER TABLE IF EXISTS ONLY public.firms_firm DROP CONSTRAINT IF EXISTS firms_firm_firm_code_key;
ALTER TABLE IF EXISTS ONLY public.firms_branch DROP CONSTRAINT IF EXISTS firms_branch_pkey;
ALTER TABLE IF EXISTS ONLY public.firms_branch DROP CONSTRAINT IF EXISTS firms_branch_firm_id_branch_name_f6cf533f_uniq;
ALTER TABLE IF EXISTS ONLY public.documents_userdocument DROP CONSTRAINT IF EXISTS documents_userdocument_pkey;
ALTER TABLE IF EXISTS ONLY public.documents_filledtemplate DROP CONSTRAINT IF EXISTS documents_filledtemplate_pkey;
ALTER TABLE IF EXISTS ONLY public.documents_filledcourtform DROP CONSTRAINT IF EXISTS documents_filledcourtform_pkey;
ALTER TABLE IF EXISTS ONLY public.documents_documenttemplate DROP CONSTRAINT IF EXISTS documents_documenttemplate_pkey;
ALTER TABLE IF EXISTS ONLY public.documents_courtformtemplate DROP CONSTRAINT IF EXISTS documents_courtformtemplate_pkey;
ALTER TABLE IF EXISTS ONLY public.django_session DROP CONSTRAINT IF EXISTS django_session_pkey;
ALTER TABLE IF EXISTS ONLY public.django_migrations DROP CONSTRAINT IF EXISTS django_migrations_pkey;
ALTER TABLE IF EXISTS ONLY public.django_content_type DROP CONSTRAINT IF EXISTS django_content_type_pkey;
ALTER TABLE IF EXISTS ONLY public.django_content_type DROP CONSTRAINT IF EXISTS django_content_type_app_label_model_76bd3d3b_uniq;
ALTER TABLE IF EXISTS ONLY public.django_admin_log DROP CONSTRAINT IF EXISTS django_admin_log_pkey;
ALTER TABLE IF EXISTS ONLY public.clients_client DROP CONSTRAINT IF EXISTS clients_client_user_account_id_firm_id_4368eede_uniq;
ALTER TABLE IF EXISTS ONLY public.clients_client DROP CONSTRAINT IF EXISTS clients_client_pkey;
ALTER TABLE IF EXISTS ONLY public.cases_serviceattempt DROP CONSTRAINT IF EXISTS cases_serviceattempt_pkey;
ALTER TABLE IF EXISTS ONLY public.cases_legalnotice DROP CONSTRAINT IF EXISTS cases_legalnotice_pkey;
ALTER TABLE IF EXISTS ONLY public.cases_hearing DROP CONSTRAINT IF EXISTS cases_hearing_pkey;
ALTER TABLE IF EXISTS ONLY public.cases_documentchecklist DROP CONSTRAINT IF EXISTS cases_documentchecklist_pkey;
ALTER TABLE IF EXISTS ONLY public.cases_caseresearch DROP CONSTRAINT IF EXISTS cases_caseresearch_pkey;
ALTER TABLE IF EXISTS ONLY public.cases_casedraft DROP CONSTRAINT IF EXISTS cases_casedraft_pkey;
ALTER TABLE IF EXISTS ONLY public.cases_casedocumentrequest DROP CONSTRAINT IF EXISTS cases_casedocumentrequest_pkey;
ALTER TABLE IF EXISTS ONLY public.cases_casedocumentchecklistitem DROP CONSTRAINT IF EXISTS cases_casedocumentchecklistitem_pkey;
ALTER TABLE IF EXISTS ONLY public.cases_caseactivity DROP CONSTRAINT IF EXISTS cases_caseactivity_pkey;
ALTER TABLE IF EXISTS ONLY public.cases_case DROP CONSTRAINT IF EXISTS cases_case_pkey;
ALTER TABLE IF EXISTS ONLY public.calendar_events_calendarevent DROP CONSTRAINT IF EXISTS calendar_events_calendarevent_pkey;
ALTER TABLE IF EXISTS ONLY public.calendar_events_calendarevent_assigned_to DROP CONSTRAINT IF EXISTS calendar_events_calendarevent_assigned_to_pkey;
ALTER TABLE IF EXISTS ONLY public.calendar_events_calendarevent_assigned_to DROP CONSTRAINT IF EXISTS calendar_events_calendar_calendarevent_id_customu_4d1d0cd2_uniq;
ALTER TABLE IF EXISTS ONLY public.billing_trustaccount DROP CONSTRAINT IF EXISTS billing_trustaccount_pkey;
ALTER TABLE IF EXISTS ONLY public.billing_timeentry DROP CONSTRAINT IF EXISTS billing_timeentry_pkey;
ALTER TABLE IF EXISTS ONLY public.billing_payment DROP CONSTRAINT IF EXISTS billing_payment_pkey;
ALTER TABLE IF EXISTS ONLY public.billing_invoice DROP CONSTRAINT IF EXISTS billing_invoice_pkey;
ALTER TABLE IF EXISTS ONLY public.billing_invoice DROP CONSTRAINT IF EXISTS billing_invoice_invoice_number_key;
ALTER TABLE IF EXISTS ONLY public.billing_expense DROP CONSTRAINT IF EXISTS billing_expense_pkey;
ALTER TABLE IF EXISTS ONLY public.billing_advocateinvoice DROP CONSTRAINT IF EXISTS billing_advocateinvoice_pkey;
ALTER TABLE IF EXISTS ONLY public.billing_advocateinvoice DROP CONSTRAINT IF EXISTS billing_advocateinvoice_invoice_number_key;
ALTER TABLE IF EXISTS ONLY public.authtoken_token DROP CONSTRAINT IF EXISTS authtoken_token_user_id_key;
ALTER TABLE IF EXISTS ONLY public.authtoken_token DROP CONSTRAINT IF EXISTS authtoken_token_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_permission DROP CONSTRAINT IF EXISTS auth_permission_content_type_id_codename_01ab375a_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_group DROP CONSTRAINT IF EXISTS auth_group_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.auth_group_permissions DROP CONSTRAINT IF EXISTS auth_group_permissions_group_id_permission_id_0cd325b0_uniq;
ALTER TABLE IF EXISTS ONLY public.auth_group DROP CONSTRAINT IF EXISTS auth_group_name_key;
ALTER TABLE IF EXISTS ONLY public.audit_auditlog DROP CONSTRAINT IF EXISTS audit_auditlog_pkey;
ALTER TABLE IF EXISTS ONLY public.accounts_userinvitation DROP CONSTRAINT IF EXISTS accounts_userinvitation_pkey;
ALTER TABLE IF EXISTS ONLY public.accounts_userfirmrole DROP CONSTRAINT IF EXISTS accounts_userfirmrole_user_id_firm_id_cd0c5ad8_uniq;
ALTER TABLE IF EXISTS ONLY public.accounts_userfirmrole DROP CONSTRAINT IF EXISTS accounts_userfirmrole_pkey;
ALTER TABLE IF EXISTS ONLY public.accounts_otpverification DROP CONSTRAINT IF EXISTS accounts_otpverification_pkey;
ALTER TABLE IF EXISTS ONLY public.accounts_logincredential DROP CONSTRAINT IF EXISTS accounts_logincredential_username_key;
ALTER TABLE IF EXISTS ONLY public.accounts_logincredential DROP CONSTRAINT IF EXISTS accounts_logincredential_user_id_key;
ALTER TABLE IF EXISTS ONLY public.accounts_logincredential DROP CONSTRAINT IF EXISTS accounts_logincredential_pkey;
ALTER TABLE IF EXISTS ONLY public.accounts_globalconfiguration DROP CONSTRAINT IF EXISTS accounts_globalconfiguration_pkey;
ALTER TABLE IF EXISTS ONLY public.accounts_firmjoinlink DROP CONSTRAINT IF EXISTS accounts_firmjoinlink_pkey;
ALTER TABLE IF EXISTS ONLY public.accounts_customuser DROP CONSTRAINT IF EXISTS accounts_customuser_username_key;
ALTER TABLE IF EXISTS ONLY public.accounts_customuser_user_permissions DROP CONSTRAINT IF EXISTS accounts_customuser_user_permissions_pkey;
ALTER TABLE IF EXISTS ONLY public.accounts_customuser_user_permissions DROP CONSTRAINT IF EXISTS accounts_customuser_user_customuser_id_permission_9632a709_uniq;
ALTER TABLE IF EXISTS ONLY public.accounts_customuser DROP CONSTRAINT IF EXISTS accounts_customuser_pkey;
ALTER TABLE IF EXISTS ONLY public.accounts_customuser DROP CONSTRAINT IF EXISTS accounts_customuser_phone_number_key;
ALTER TABLE IF EXISTS ONLY public.accounts_customuser DROP CONSTRAINT IF EXISTS accounts_customuser_pan_number_key;
ALTER TABLE IF EXISTS ONLY public.accounts_customuser_groups DROP CONSTRAINT IF EXISTS accounts_customuser_groups_pkey;
ALTER TABLE IF EXISTS ONLY public.accounts_customuser_groups DROP CONSTRAINT IF EXISTS accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq;
ALTER TABLE IF EXISTS ONLY public.accounts_customuser DROP CONSTRAINT IF EXISTS accounts_customuser_aadhar_number_key;
ALTER TABLE IF EXISTS ONLY public.accounts_advocateparalegalassignment DROP CONSTRAINT IF EXISTS accounts_advocateparalegalassignment_pkey;
ALTER TABLE IF EXISTS ONLY public.accounts_advocateparalegalassignment DROP CONSTRAINT IF EXISTS accounts_advocateparaleg_advocate_id_paralegal_id_6645d803_uniq;
DROP TABLE IF EXISTS public.tasks_task;
DROP TABLE IF EXISTS public.subscriptions_subscriptionplan;
DROP TABLE IF EXISTS public.subscriptions_platforminvoice;
DROP TABLE IF EXISTS public.subscriptions_firmsubscription;
DROP TABLE IF EXISTS public.partners_partner;
DROP TABLE IF EXISTS public.firms_firm;
DROP TABLE IF EXISTS public.firms_branch;
DROP TABLE IF EXISTS public.documents_userdocument;
DROP TABLE IF EXISTS public.documents_filledtemplate;
DROP TABLE IF EXISTS public.documents_filledcourtform;
DROP TABLE IF EXISTS public.documents_documenttemplate;
DROP TABLE IF EXISTS public.documents_courtformtemplate;
DROP TABLE IF EXISTS public.django_session;
DROP TABLE IF EXISTS public.django_migrations;
DROP TABLE IF EXISTS public.django_content_type;
DROP TABLE IF EXISTS public.django_admin_log;
DROP TABLE IF EXISTS public.clients_client;
DROP TABLE IF EXISTS public.cases_serviceattempt;
DROP TABLE IF EXISTS public.cases_legalnotice;
DROP TABLE IF EXISTS public.cases_hearing;
DROP TABLE IF EXISTS public.cases_documentchecklist;
DROP TABLE IF EXISTS public.cases_caseresearch;
DROP TABLE IF EXISTS public.cases_casedraft;
DROP TABLE IF EXISTS public.cases_casedocumentrequest;
DROP TABLE IF EXISTS public.cases_casedocumentchecklistitem;
DROP TABLE IF EXISTS public.cases_caseactivity;
DROP TABLE IF EXISTS public.cases_case;
DROP TABLE IF EXISTS public.calendar_events_calendarevent_assigned_to;
DROP TABLE IF EXISTS public.calendar_events_calendarevent;
DROP TABLE IF EXISTS public.billing_trustaccount;
DROP TABLE IF EXISTS public.billing_timeentry;
DROP TABLE IF EXISTS public.billing_payment;
DROP TABLE IF EXISTS public.billing_invoice;
DROP TABLE IF EXISTS public.billing_expense;
DROP TABLE IF EXISTS public.billing_advocateinvoice;
DROP TABLE IF EXISTS public.authtoken_token;
DROP TABLE IF EXISTS public.auth_permission;
DROP TABLE IF EXISTS public.auth_group_permissions;
DROP TABLE IF EXISTS public.auth_group;
DROP TABLE IF EXISTS public.audit_auditlog;
DROP TABLE IF EXISTS public.accounts_userinvitation;
DROP TABLE IF EXISTS public.accounts_userfirmrole;
DROP TABLE IF EXISTS public.accounts_otpverification;
DROP TABLE IF EXISTS public.accounts_logincredential;
DROP TABLE IF EXISTS public.accounts_globalconfiguration;
DROP TABLE IF EXISTS public.accounts_firmjoinlink;
DROP TABLE IF EXISTS public.accounts_customuser_user_permissions;
DROP TABLE IF EXISTS public.accounts_customuser_groups;
DROP TABLE IF EXISTS public.accounts_customuser;
DROP TABLE IF EXISTS public.accounts_advocateparalegalassignment;
-- *not* dropping schema, since initdb creates it
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accounts_advocateparalegalassignment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_advocateparalegalassignment (
    id uuid NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    advocate_id uuid NOT NULL,
    assigned_by_id uuid,
    firm_id uuid,
    paralegal_id uuid NOT NULL
);


ALTER TABLE public.accounts_advocateparalegalassignment OWNER TO postgres;

--
-- Name: accounts_customuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_customuser (
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    id uuid NOT NULL,
    user_type character varying(20) NOT NULL,
    phone_number character varying(17) NOT NULL,
    date_of_birth date,
    gender character varying(1) NOT NULL,
    address_line_1 character varying(255) NOT NULL,
    address_line_2 character varying(255) NOT NULL,
    city character varying(100) NOT NULL,
    state character varying(100) NOT NULL,
    country character varying(100) NOT NULL,
    postal_code character varying(20) NOT NULL,
    aadhar_number character varying(12),
    pan_number character varying(10),
    bar_council_registration character varying(100) NOT NULL,
    bar_council_state character varying(100) NOT NULL,
    is_phone_verified boolean NOT NULL,
    is_email_verified boolean NOT NULL,
    is_document_verified boolean NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    last_login_at timestamp with time zone,
    password_set boolean NOT NULL,
    firm_id uuid,
    profile_image character varying(100),
    case_fee numeric(10,2),
    consultation_fee numeric(10,2),
    fee_currency character varying(3) NOT NULL,
    hourly_rate numeric(10,2)
);


ALTER TABLE public.accounts_customuser OWNER TO postgres;

--
-- Name: accounts_customuser_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_customuser_groups (
    id bigint NOT NULL,
    customuser_id uuid NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.accounts_customuser_groups OWNER TO postgres;

--
-- Name: accounts_customuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.accounts_customuser_groups ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.accounts_customuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: accounts_customuser_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_customuser_user_permissions (
    id bigint NOT NULL,
    customuser_id uuid NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.accounts_customuser_user_permissions OWNER TO postgres;

--
-- Name: accounts_customuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.accounts_customuser_user_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.accounts_customuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: accounts_firmjoinlink; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_firmjoinlink (
    id uuid NOT NULL,
    user_type character varying(20) NOT NULL,
    is_active boolean NOT NULL,
    max_uses integer NOT NULL,
    usage_count integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    expires_at timestamp with time zone,
    created_by_id uuid,
    firm_id uuid
);


ALTER TABLE public.accounts_firmjoinlink OWNER TO postgres;

--
-- Name: accounts_globalconfiguration; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_globalconfiguration (
    id uuid NOT NULL,
    is_free_trial_enabled boolean NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    trial_period_days integer NOT NULL,
    updated_by_id uuid
);


ALTER TABLE public.accounts_globalconfiguration OWNER TO postgres;

--
-- Name: accounts_logincredential; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_logincredential (
    id uuid NOT NULL,
    username character varying(150),
    phone_otp character varying(6) NOT NULL,
    phone_otp_created_at timestamp with time zone,
    phone_otp_attempts integer NOT NULL,
    email_otp character varying(6) NOT NULL,
    email_otp_created_at timestamp with time zone,
    email_otp_attempts integer NOT NULL,
    is_phone_otp_verified boolean NOT NULL,
    is_email_otp_verified boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.accounts_logincredential OWNER TO postgres;

--
-- Name: accounts_otpverification; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_otpverification (
    id uuid NOT NULL,
    otp_type character varying(10) NOT NULL,
    otp_code character varying(6) NOT NULL,
    is_verified boolean NOT NULL,
    attempts integer NOT NULL,
    max_attempts integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    expires_at timestamp with time zone NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.accounts_otpverification OWNER TO postgres;

--
-- Name: accounts_userfirmrole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_userfirmrole (
    id uuid NOT NULL,
    user_type character varying(20) NOT NULL,
    is_active boolean NOT NULL,
    is_last_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    firm_id uuid,
    user_id uuid NOT NULL,
    branch_id uuid
);


ALTER TABLE public.accounts_userfirmrole OWNER TO postgres;

--
-- Name: accounts_userinvitation; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts_userinvitation (
    id uuid NOT NULL,
    email character varying(254) NOT NULL,
    phone_number character varying(17) NOT NULL,
    user_type character varying(20) NOT NULL,
    status character varying(20) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    expires_at timestamp with time zone,
    accepted_at timestamp with time zone,
    firm_id uuid,
    invited_by_id uuid,
    invited_user_id uuid
);


ALTER TABLE public.accounts_userinvitation OWNER TO postgres;

--
-- Name: audit_auditlog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.audit_auditlog (
    id uuid NOT NULL,
    action character varying(50) NOT NULL,
    description text NOT NULL,
    ip_address inet,
    user_agent text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id uuid NOT NULL,
    firm_id uuid,
    resource_id character varying(255),
    resource_type character varying(50)
);


ALTER TABLE public.audit_auditlog OWNER TO postgres;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_group_permissions ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.auth_permission ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO postgres;

--
-- Name: billing_advocateinvoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.billing_advocateinvoice (
    id uuid NOT NULL,
    invoice_number character varying(50) NOT NULL,
    invoice_date date NOT NULL,
    period_start date NOT NULL,
    period_end date NOT NULL,
    subtotal numeric(12,2) NOT NULL,
    tax_percentage numeric(5,2) NOT NULL,
    tax_amount numeric(12,2) NOT NULL,
    total_amount numeric(12,2) NOT NULL,
    status character varying(20) NOT NULL,
    approved_date timestamp with time zone,
    rejection_reason text NOT NULL,
    paid_date timestamp with time zone,
    payment_method character varying(50) NOT NULL,
    payment_reference character varying(100) NOT NULL,
    notes text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    advocate_id uuid NOT NULL,
    approved_by_id uuid,
    firm_id uuid
);


ALTER TABLE public.billing_advocateinvoice OWNER TO postgres;

--
-- Name: billing_expense; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.billing_expense (
    id uuid NOT NULL,
    date date NOT NULL,
    expense_type character varying(50) NOT NULL,
    description text NOT NULL,
    amount numeric(10,2) NOT NULL,
    billable boolean NOT NULL,
    markup_percentage numeric(5,2) NOT NULL,
    billable_amount numeric(10,2) NOT NULL,
    status character varying(20) NOT NULL,
    receipt character varying(100),
    notes text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    case_id uuid,
    firm_id uuid,
    invoice_id uuid,
    submitted_by_id uuid NOT NULL
);


ALTER TABLE public.billing_expense OWNER TO postgres;

--
-- Name: billing_invoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.billing_invoice (
    id uuid NOT NULL,
    invoice_number character varying(50) NOT NULL,
    invoice_date date NOT NULL,
    due_date date NOT NULL,
    subtotal numeric(12,2) NOT NULL,
    tax_percentage numeric(5,2) NOT NULL,
    tax_amount numeric(12,2) NOT NULL,
    discount_amount numeric(12,2) NOT NULL,
    total_amount numeric(12,2) NOT NULL,
    paid_amount numeric(12,2) NOT NULL,
    balance_due numeric(12,2) NOT NULL,
    status character varying(20) NOT NULL,
    notes text NOT NULL,
    internal_notes text NOT NULL,
    terms_and_conditions text NOT NULL,
    pdf_file character varying(100),
    sent_date timestamp with time zone,
    viewed_date timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    case_id uuid,
    client_id uuid NOT NULL,
    created_by_id uuid,
    firm_id uuid,
    branch_id uuid
);


ALTER TABLE public.billing_invoice OWNER TO postgres;

--
-- Name: billing_payment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.billing_payment (
    id uuid NOT NULL,
    payment_date date NOT NULL,
    amount numeric(12,2) NOT NULL,
    payment_method character varying(20) NOT NULL,
    transaction_id character varying(100) NOT NULL,
    cheque_number character varying(50) NOT NULL,
    bank_name character varying(100) NOT NULL,
    status character varying(20) NOT NULL,
    notes text NOT NULL,
    receipt character varying(100),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    client_id uuid NOT NULL,
    firm_id uuid NOT NULL,
    invoice_id uuid NOT NULL,
    recorded_by_id uuid
);


ALTER TABLE public.billing_payment OWNER TO postgres;

--
-- Name: billing_timeentry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.billing_timeentry (
    id uuid NOT NULL,
    date date NOT NULL,
    activity_type character varying(50) NOT NULL,
    description text NOT NULL,
    hours numeric(5,2) NOT NULL,
    hourly_rate numeric(10,2) NOT NULL,
    amount numeric(10,2) NOT NULL,
    billable boolean NOT NULL,
    status character varying(20) NOT NULL,
    notes text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    case_id uuid,
    firm_id uuid,
    invoice_id uuid,
    user_id uuid NOT NULL,
    advocate_invoice_id uuid
);


ALTER TABLE public.billing_timeentry OWNER TO postgres;

--
-- Name: billing_trustaccount; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.billing_trustaccount (
    id uuid NOT NULL,
    transaction_date date NOT NULL,
    transaction_type character varying(20) NOT NULL,
    amount numeric(12,2) NOT NULL,
    balance_after numeric(12,2) NOT NULL,
    description text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    case_id uuid,
    client_id uuid NOT NULL,
    firm_id uuid NOT NULL,
    recorded_by_id uuid,
    reference_invoice_id uuid
);


ALTER TABLE public.billing_trustaccount OWNER TO postgres;

--
-- Name: calendar_events_calendarevent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calendar_events_calendarevent (
    id uuid NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    event_type character varying(20) NOT NULL,
    priority character varying(10) NOT NULL,
    status character varying(20) NOT NULL,
    start_datetime timestamp with time zone NOT NULL,
    end_datetime timestamp with time zone NOT NULL,
    all_day boolean NOT NULL,
    location character varying(255) NOT NULL,
    court_name character varying(255) NOT NULL,
    reminder_sent boolean NOT NULL,
    reminder_time timestamp with time zone,
    notes text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    case_id uuid,
    client_id uuid,
    created_by_id uuid,
    firm_id uuid
);


ALTER TABLE public.calendar_events_calendarevent OWNER TO postgres;

--
-- Name: calendar_events_calendarevent_assigned_to; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calendar_events_calendarevent_assigned_to (
    id bigint NOT NULL,
    calendarevent_id uuid CONSTRAINT calendar_events_calendarevent_assigne_calendarevent_id_not_null NOT NULL,
    customuser_id uuid CONSTRAINT calendar_events_calendarevent_assigned_t_customuser_id_not_null NOT NULL
);


ALTER TABLE public.calendar_events_calendarevent_assigned_to OWNER TO postgres;

--
-- Name: calendar_events_calendarevent_assigned_to_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.calendar_events_calendarevent_assigned_to ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.calendar_events_calendarevent_assigned_to_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: cases_case; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cases_case (
    id uuid NOT NULL,
    case_title character varying(255) NOT NULL,
    case_number character varying(100) NOT NULL,
    case_type character varying(100) NOT NULL,
    description text NOT NULL,
    status character varying(20) NOT NULL,
    priority character varying(10) NOT NULL,
    court_name character varying(255),
    judge_name character varying(255),
    filing_date date,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    assigned_advocate_id uuid,
    assigned_paralegal_id uuid,
    client_id uuid NOT NULL,
    firm_id uuid,
    category character varying(20) NOT NULL,
    cnr_number character varying(50),
    court_no character varying(50),
    district character varying(100),
    next_hearing_date timestamp with time zone,
    petitioner_name character varying(255),
    representing character varying(50),
    respondent_name character varying(255),
    state character varying(100),
    additional_expenses character varying(255),
    case_summary text,
    hearing_fee numeric(10,2),
    loe_notes text,
    payment_terms text,
    stage character varying(50) NOT NULL,
    total_fee numeric(12,2),
    billing_type character varying(20) NOT NULL,
    estimated_value numeric(12,2),
    opposing_counsel character varying(255),
    branch_id uuid,
    solo_advocate_id uuid
);


ALTER TABLE public.cases_case OWNER TO postgres;

--
-- Name: cases_caseactivity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cases_caseactivity (
    id uuid NOT NULL,
    activity_type character varying(100) NOT NULL,
    description text NOT NULL,
    previous_status character varying(20),
    new_status character varying(20),
    created_at timestamp with time zone NOT NULL,
    case_id uuid NOT NULL,
    performed_by_id uuid
);


ALTER TABLE public.cases_caseactivity OWNER TO postgres;

--
-- Name: cases_casedocumentchecklistitem; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cases_casedocumentchecklistitem (
    id uuid NOT NULL,
    document_name character varying(255) NOT NULL,
    description text NOT NULL,
    is_mandatory boolean NOT NULL,
    status character varying(20) NOT NULL,
    requested_date date,
    received_date date,
    verified_date date,
    notes text NOT NULL,
    reminder_sent boolean NOT NULL,
    last_reminder_date date,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    case_id uuid NOT NULL,
    checklist_template_id uuid,
    uploaded_document_id uuid,
    verified_by_id uuid
);


ALTER TABLE public.cases_casedocumentchecklistitem OWNER TO postgres;

--
-- Name: cases_casedocumentrequest; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cases_casedocumentrequest (
    id uuid NOT NULL,
    document_type character varying(50) NOT NULL,
    document_title character varying(255) NOT NULL,
    description text NOT NULL,
    status character varying(20) NOT NULL,
    priority character varying(10) NOT NULL,
    due_date date,
    uploaded_at timestamp with time zone,
    advocate_notes text NOT NULL,
    client_notes text NOT NULL,
    rejection_reason text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    case_id uuid NOT NULL,
    requested_by_id uuid NOT NULL,
    uploaded_document_id uuid
);


ALTER TABLE public.cases_casedocumentrequest OWNER TO postgres;

--
-- Name: cases_casedraft; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cases_casedraft (
    id uuid NOT NULL,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    draft_type character varying(100) NOT NULL,
    status character varying(20) NOT NULL,
    version integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    case_id uuid NOT NULL,
    created_by_id uuid NOT NULL
);


ALTER TABLE public.cases_casedraft OWNER TO postgres;

--
-- Name: cases_caseresearch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cases_caseresearch (
    id uuid NOT NULL,
    research_type character varying(50) NOT NULL,
    title character varying(255) NOT NULL,
    content text NOT NULL,
    case_citation character varying(500) NOT NULL,
    court_name character varying(255) NOT NULL,
    judgment_date date,
    act_name character varying(255) NOT NULL,
    section_number character varying(100) NOT NULL,
    reference_document character varying(100),
    is_favorable boolean NOT NULL,
    relevance_score integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    case_id uuid NOT NULL,
    created_by_id uuid
);


ALTER TABLE public.cases_caseresearch OWNER TO postgres;

--
-- Name: cases_documentchecklist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cases_documentchecklist (
    id uuid NOT NULL,
    case_type character varying(50) NOT NULL,
    document_name character varying(255) NOT NULL,
    description text NOT NULL,
    is_mandatory boolean NOT NULL,
    display_order integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.cases_documentchecklist OWNER TO postgres;

--
-- Name: cases_hearing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cases_hearing (
    id uuid NOT NULL,
    hearing_date timestamp with time zone NOT NULL,
    purpose character varying(255) NOT NULL,
    judge_remarks text NOT NULL,
    status character varying(20) NOT NULL,
    order_passed text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    case_id uuid NOT NULL
);


ALTER TABLE public.cases_hearing OWNER TO postgres;

--
-- Name: cases_legalnotice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cases_legalnotice (
    id uuid NOT NULL,
    notice_type character varying(50) NOT NULL,
    subject character varying(500) NOT NULL,
    recipient_name character varying(255) NOT NULL,
    recipient_address text NOT NULL,
    recipient_email character varying(254) NOT NULL,
    recipient_phone character varying(20) NOT NULL,
    notice_content text NOT NULL,
    notice_document character varying(100),
    status character varying(20) NOT NULL,
    delivery_method character varying(30) NOT NULL,
    sent_date date,
    delivered_date date,
    tracking_number character varying(100) NOT NULL,
    proof_of_delivery character varying(100),
    response_deadline date,
    response_received_date date,
    response_document character varying(100),
    response_summary text NOT NULL,
    next_action text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    case_id uuid NOT NULL,
    created_by_id uuid,
    delivery_attempts jsonb NOT NULL,
    email_delivered boolean NOT NULL,
    email_opened boolean NOT NULL,
    email_opened_date timestamp with time zone,
    email_sent boolean NOT NULL,
    email_sent_date timestamp with time zone,
    last_status_update timestamp with time zone,
    last_status_updated_by_id uuid,
    physical_delivered boolean NOT NULL,
    physical_delivered_date date,
    physical_sent boolean NOT NULL,
    physical_sent_date date,
    read_date date,
    status_notes text NOT NULL,
    whatsapp_delivered boolean NOT NULL,
    whatsapp_read boolean NOT NULL,
    whatsapp_read_date timestamp with time zone,
    whatsapp_sent boolean NOT NULL,
    whatsapp_sent_date timestamp with time zone
);


ALTER TABLE public.cases_legalnotice OWNER TO postgres;

--
-- Name: cases_serviceattempt; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cases_serviceattempt (
    id uuid NOT NULL,
    service_type character varying(20) NOT NULL,
    service_date date NOT NULL,
    service_method character varying(30) NOT NULL,
    served_to character varying(255) NOT NULL,
    served_by character varying(255) NOT NULL,
    address text NOT NULL,
    status character varying(20) NOT NULL,
    proof_document character varying(100),
    remarks text NOT NULL,
    next_attempt_date date,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    case_id uuid NOT NULL,
    created_by_id uuid
);


ALTER TABLE public.cases_serviceattempt OWNER TO postgres;

--
-- Name: clients_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients_client (
    id uuid NOT NULL,
    first_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(254) NOT NULL,
    phone_number character varying(20) NOT NULL,
    address text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    firm_id uuid,
    assigned_advocate_id uuid,
    brief_summary text NOT NULL,
    user_account_id uuid,
    profile_image character varying(100)
);


ALTER TABLE public.clients_client OWNER TO postgres;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id uuid NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_admin_log ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_content_type ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.django_migrations ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: documents_courtformtemplate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents_courtformtemplate (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    category character varying(50) NOT NULL,
    content_structure jsonb NOT NULL,
    default_field_mappings jsonb NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    created_by_id uuid,
    sequence integer NOT NULL
);


ALTER TABLE public.documents_courtformtemplate OWNER TO postgres;

--
-- Name: documents_documenttemplate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents_documenttemplate (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    description text NOT NULL,
    category character varying(50) NOT NULL,
    template_file character varying(100) NOT NULL,
    file_size_kb integer NOT NULL,
    template_fields jsonb NOT NULL,
    is_active boolean NOT NULL,
    is_public boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    created_by_id uuid
);


ALTER TABLE public.documents_documenttemplate OWNER TO postgres;

--
-- Name: documents_filledcourtform; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents_filledcourtform (
    id uuid NOT NULL,
    filled_content jsonb NOT NULL,
    field_values jsonb NOT NULL,
    status character varying(20) NOT NULL,
    advocate_signed boolean NOT NULL,
    advocate_signature_date timestamp with time zone,
    client_signed boolean NOT NULL,
    client_signature_date timestamp with time zone,
    is_shared_with_client boolean NOT NULL,
    shared_at timestamp with time zone,
    generated_pdf character varying(100),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    case_id uuid NOT NULL,
    client_id uuid NOT NULL,
    created_by_id uuid,
    template_id uuid NOT NULL,
    advocate_signature_image character varying(100),
    client_signature_image character varying(100),
    digital_signature_details jsonb NOT NULL,
    is_digitally_signed boolean NOT NULL,
    custom_sequence integer NOT NULL
);


ALTER TABLE public.documents_filledcourtform OWNER TO postgres;

--
-- Name: documents_filledtemplate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents_filledtemplate (
    id uuid NOT NULL,
    filled_data jsonb NOT NULL,
    generated_file character varying(100),
    status character varying(20) NOT NULL,
    is_shared_with_client boolean NOT NULL,
    shared_at timestamp with time zone,
    client_signed boolean NOT NULL,
    client_signed_at timestamp with time zone,
    advocate_signed boolean NOT NULL,
    advocate_signed_at timestamp with time zone,
    notes text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    case_id uuid,
    client_id uuid NOT NULL,
    created_by_id uuid,
    firm_id uuid,
    template_id uuid NOT NULL,
    advocate_signature_image character varying(100),
    client_signature_image character varying(100)
);


ALTER TABLE public.documents_filledtemplate OWNER TO postgres;

--
-- Name: documents_userdocument; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.documents_userdocument (
    id uuid NOT NULL,
    document_type character varying(50) NOT NULL,
    document_number character varying(100),
    document_file character varying(100) NOT NULL,
    verification_status character varying(20) NOT NULL,
    verification_notes text NOT NULL,
    uploaded_at timestamp with time zone NOT NULL,
    verified_at timestamp with time zone,
    verified_by_id uuid,
    case_id uuid,
    document_category character varying(50),
    client_id uuid,
    deleted_at timestamp with time zone,
    deleted_by_id uuid,
    description text,
    document_title character varying(255),
    firm_id uuid,
    is_deleted boolean NOT NULL,
    parent_document_id uuid,
    updated_at timestamp with time zone NOT NULL,
    uploaded_by_id uuid,
    version integer NOT NULL
);


ALTER TABLE public.documents_userdocument OWNER TO postgres;

--
-- Name: firms_branch; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.firms_branch (
    id uuid NOT NULL,
    branch_name character varying(255) NOT NULL,
    branch_code character varying(50) NOT NULL,
    city character varying(100) NOT NULL,
    state character varying(100) NOT NULL,
    address text NOT NULL,
    phone_number character varying(20) NOT NULL,
    email character varying(254) NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    firm_id uuid NOT NULL
);


ALTER TABLE public.firms_branch OWNER TO postgres;

--
-- Name: firms_firm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.firms_firm (
    id uuid NOT NULL,
    firm_name character varying(255) NOT NULL,
    firm_code character varying(50) NOT NULL,
    city character varying(100) NOT NULL,
    state character varying(100) NOT NULL,
    country character varying(100) NOT NULL,
    address text NOT NULL,
    postal_code character varying(20) NOT NULL,
    phone_number character varying(20) NOT NULL,
    email character varying(254) NOT NULL,
    website character varying(200) NOT NULL,
    subscription_type character varying(20) NOT NULL,
    trial_end_date timestamp with time zone,
    subscription_start_date timestamp with time zone NOT NULL,
    subscription_end_date timestamp with time zone,
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    logo character varying(100),
    partner_id uuid,
    practice_areas jsonb NOT NULL,
    registration_number character varying(100) NOT NULL
);


ALTER TABLE public.firms_firm OWNER TO postgres;

--
-- Name: partners_partner; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.partners_partner (
    id uuid NOT NULL,
    company_name character varying(255) NOT NULL,
    registration_number character varying(100) NOT NULL,
    commission_percentage numeric(5,2) NOT NULL,
    status character varying(20) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id uuid NOT NULL
);


ALTER TABLE public.partners_partner OWNER TO postgres;

--
-- Name: subscriptions_firmsubscription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriptions_firmsubscription (
    id uuid NOT NULL,
    status character varying(20) NOT NULL,
    start_date timestamp with time zone NOT NULL,
    end_date timestamp with time zone NOT NULL,
    is_trial boolean NOT NULL,
    auto_renew boolean NOT NULL,
    external_subscription_id character varying(255),
    external_customer_id character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    firm_id uuid NOT NULL,
    plan_id uuid NOT NULL
);


ALTER TABLE public.subscriptions_firmsubscription OWNER TO postgres;

--
-- Name: subscriptions_platforminvoice; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriptions_platforminvoice (
    id uuid NOT NULL,
    invoice_number character varying(50) NOT NULL,
    invoice_date date NOT NULL,
    due_date date NOT NULL,
    period_start date NOT NULL,
    period_end date NOT NULL,
    plan_amount numeric(10,2) NOT NULL,
    tax_percentage numeric(5,2) NOT NULL,
    tax_amount numeric(10,2) NOT NULL,
    total_amount numeric(10,2) NOT NULL,
    paid_amount numeric(10,2) NOT NULL,
    balance_due numeric(10,2) NOT NULL,
    status character varying(20) NOT NULL,
    payment_date date,
    payment_method character varying(50) NOT NULL,
    transaction_id character varying(100) NOT NULL,
    payment_notes text NOT NULL,
    notes text NOT NULL,
    internal_notes text NOT NULL,
    sent_date timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    created_by_id uuid,
    firm_id uuid NOT NULL,
    subscription_plan_id uuid NOT NULL
);


ALTER TABLE public.subscriptions_platforminvoice OWNER TO postgres;

--
-- Name: subscriptions_subscriptionplan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subscriptions_subscriptionplan (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    plan_type character varying(20) NOT NULL,
    description text NOT NULL,
    price numeric(10,2) NOT NULL,
    billing_cycle character varying(20) NOT NULL,
    max_users integer NOT NULL,
    max_cases integer NOT NULL,
    max_storage_gb integer NOT NULL,
    features jsonb NOT NULL,
    is_active boolean NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    enable_api_access boolean NOT NULL,
    enable_billing boolean NOT NULL,
    enable_calendar boolean NOT NULL,
    enable_documents boolean NOT NULL,
    enable_reports boolean NOT NULL,
    max_admins integer NOT NULL,
    max_advocates integer NOT NULL,
    max_branches integer NOT NULL,
    max_clients integer NOT NULL,
    max_paralegals integer NOT NULL
);


ALTER TABLE public.subscriptions_subscriptionplan OWNER TO postgres;

--
-- Name: tasks_task; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tasks_task (
    id uuid NOT NULL,
    title character varying(255) NOT NULL,
    description text NOT NULL,
    status character varying(20) NOT NULL,
    due_date timestamp with time zone,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    assigned_to_id uuid,
    firm_id uuid NOT NULL
);


ALTER TABLE public.tasks_task OWNER TO postgres;

--
-- Data for Name: accounts_advocateparalegalassignment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_advocateparalegalassignment (id, is_active, created_at, updated_at, advocate_id, assigned_by_id, firm_id, paralegal_id) FROM stdin;
ed870312-2289-4cae-8de5-eebf9fbd5dd3	t	2026-05-04 17:07:53.118488+05:30	2026-05-04 17:07:53.118508+05:30	2594cfb1-8985-42d5-a068-13a6c277b5ee	2594cfb1-8985-42d5-a068-13a6c277b5ee	\N	f3b04f63-da8b-40ed-b7f5-12f1b29cde4f
6fe22497-451c-4229-9fc8-5753810e9eee	t	2026-05-06 10:05:13.144053+05:30	2026-05-06 10:05:13.144076+05:30	2594cfb1-8985-42d5-a068-13a6c277b5ee	2594cfb1-8985-42d5-a068-13a6c277b5ee	\N	2403e43f-02f7-46a2-ae48-253ca3dcb43d
8028a6f0-ec2f-4917-949d-75a802328237	t	2026-05-06 15:50:48.717706+05:30	2026-05-06 15:50:48.717726+05:30	115b1e64-92b3-452d-9279-99dbb7911593	115b1e64-92b3-452d-9279-99dbb7911593	\N	d99be6c0-1d66-430e-bed8-c9d3f86732ab
\.


--
-- Data for Name: accounts_customuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_customuser (password, last_login, is_superuser, username, first_name, last_name, email, is_staff, date_joined, id, user_type, phone_number, date_of_birth, gender, address_line_1, address_line_2, city, state, country, postal_code, aadhar_number, pan_number, bar_council_registration, bar_council_state, is_phone_verified, is_email_verified, is_document_verified, is_active, created_at, updated_at, last_login_at, password_set, firm_id, profile_image, case_fee, consultation_fee, fee_currency, hourly_rate) FROM stdin;
!5vnbt0099MEQbv99zQhRkyosqabj7ilMqCCddgCb	\N	f	partner1775649264@example.com	Updated Name	Partner	partner1775649264@example.com	f	2026-04-08 17:24:24.286246+05:30	ed3b65c9-84cc-46a7-b5fe-9b1275bd367d	partner_manager	+91765434116	\N								\N	\N			f	f	f	t	2026-04-08 17:24:24.286693+05:30	2026-04-08 17:24:24.745871+05:30	\N	f	89139faa-b451-4c26-96ba-1d34635edb4b	\N	\N	\N	INR	\N
pbkdf2_sha256$600000$tS63Znj0UPUP85RVbJQqIK$jMwbhM30TPILRH7OXz38Ta5FUn5V+I7bAI7yVzIZWtA=	\N	f	client@lawfirm.com	client	1	client@lawfirm.com	f	2026-04-09 11:17:23.43847+05:30	dcabe26c-3f75-4afe-b1f3-3bec679e557e	client	123456890	2026-04-09	M	Pl		Bhubaneshwar	Odisha	India	751003	\N	\N			f	f	f	t	2026-04-09 11:17:23.859244+05:30	2026-04-11 17:39:49.947249+05:30	2026-04-11 17:39:49.947064+05:30	f	\N	\N	\N	\N	INR	\N
pbkdf2_sha256$600000$g6oTRfRvHEVkhDsq8ibFbs$mqAmZs2DfD4m8GC22sCWMRdTtshc2/EitExhOWsn8/Q=	\N	f	firmowner@lawfirm.com	firmowner	1	firmowner@lawfirm.com	f	2026-04-09 11:20:56.531283+05:30	a527e3db-fe90-4397-a6cd-d5ae9cd1d1e9	super_admin	1234567890	2026-04-09	M	Pl		Bhubaneshwar	Odisha	India	751003	\N	\N			t	f	f	t	2026-04-09 11:20:57.011644+05:30	2026-05-08 12:25:38.493456+05:30	2026-05-08 12:25:38.493237+05:30	f	7014678b-9497-462c-af84-faa7d0f279d0		\N	\N	INR	\N
pbkdf2_sha256$600000$ohNPsbMwcucLnD7YFgO6u5$/oMBQhkPtM+CdFrnOAVlP35UIHf2EUFsnIuUQ9KKjPs=	\N	f	client1775648759@example.com	Test	Client	client1775648759@example.com	f	2026-04-08 17:16:00.184599+05:30	17265c17-ad13-4fb7-8b49-cda765078dbb	client	+91987651610	1990-01-15	M	123 Main St		Mumbai	Maharashtra	India	400001	\N	\N			f	f	f	t	2026-04-08 17:16:00.616018+05:30	2026-04-08 17:16:00.616029+05:30	\N	f	\N	\N	\N	\N	INR	\N
!31y8PObrWNq3wTyGNAkCDpolcctdCQDg8uICR87C	\N	f	superadmin1775648760@example.com	Test	SuperAdmin	superadmin1775648760@example.com	f	2026-04-08 17:16:01.158032+05:30	90547a1f-dc60-4528-b366-bc1e7fdb641e	super_admin	+91876549037	\N								\N	\N			f	f	f	t	2026-04-08 17:16:01.158795+05:30	2026-04-08 17:16:01.179068+05:30	\N	f	4dc8e120-5a0a-47d7-b5c9-5e5a1069e323	\N	\N	\N	INR	\N
pbkdf2_sha256$600000$6f2P9aAcDUMlDeR6sMIqJ1$GVJharcUnbnLKe7zjE1aJN9NsjZpFuOOBxL8R6HxwCQ=	\N	f	testadmin@lawfirm.com	test	admin	testadmin@lawfirm.com	f	2026-04-11 13:50:42.776808+05:30	e71918c8-b14b-4ea8-9608-1a2d9632b1c4	admin	1111111111	\N	M							\N	\N			f	f	f	t	2026-04-11 13:50:43.190795+05:30	2026-04-15 18:19:58.599522+05:30	2026-04-15 18:19:58.59923+05:30	t	6ae6b893-969f-432d-a7f4-62e5f14af2d9		\N	\N	INR	\N
!OCvo0UhH3zebi0iitGwjrC4UNowidxZF0rVKw4FM	\N	f	partner1775648761@example.com	Updated Name	Partner	partner1775648761@example.com	f	2026-04-08 17:16:01.762224+05:30	1b509e76-09fb-4ba5-8b33-076ffb82cec0	partner_manager	+91765434018	\N								\N	\N			f	f	f	t	2026-04-08 17:16:01.762959+05:30	2026-04-08 17:16:03.820955+05:30	\N	f	4dc8e120-5a0a-47d7-b5c9-5e5a1069e323	\N	\N	\N	INR	\N
pbkdf2_sha256$600000$b0GYSRENFqCei6wYQTlsr0$XZXaYcHfVGc0MxlHdZReWG4Eo0BV6UhEczISIX6xB1U=	\N	f	alokbehera407@gmail.com	alok	behera	alokbehera407@gmail.com	f	2026-04-10 12:42:31.320533+05:30	08124d12-0159-4399-ba52-90f2224ede00	super_admin	6372088453	2026-04-11	M	Pl		Bhubaneshwar	Odisha	India	751003	\N	\N			t	t	f	t	2026-04-10 12:42:32.031165+05:30	2026-04-10 18:19:22.36841+05:30	2026-04-10 18:19:22.368191+05:30	t	be1d8c7e-751e-4a30-83a9-2a9f684e3e42	\N	\N	\N	INR	\N
pbkdf2_sha256$600000$WufVlRXmoEJcglFfMJEF2Q$n65P63V21BjvaCCmlS5yfUdqIdkVgdz9L28ZVUpDj6I=	\N	f	subratbarik200003@gmail.com	Subrat	Barik	subratbarik200003@gmail.com	f	2026-04-09 09:55:03.578169+05:30	23bd6b99-07fb-4ff1-a754-1438cd148b50	client	+918847806818	2026-04-02	M	Pl		Bhuabnewwar	Odisha	India	751003	\N	\N			f	f	f	t	2026-04-09 09:55:04.320457+05:30	2026-04-09 10:05:21.019119+05:30	2026-04-09 10:05:21.018894+05:30	f	\N	\N	\N	\N	INR	\N
pbkdf2_sha256$600000$XraDV4HYVmsdJCVB5VyC6W$rrs45JwXa+atfA+ZBIBmxgT7I11Y+EEvBbwz1Z17qD8=	\N	f	abc@lawfirm.com	jihn	doe	abc@lawfirm.com	f	2026-04-10 11:15:24.314513+05:30	47e68f32-76c0-46b8-bfee-1748cee569f6	super_admin	1122334455	2026-04-10	M	Pl		Bhubaneshwar	Odisha	India	751003	\N	\N			t	f	f	t	2026-04-10 11:15:24.760127+05:30	2026-04-10 16:06:32.466417+05:30	2026-04-10 16:06:32.466243+05:30	t	58c11394-bdea-4826-837b-e5c3a85bb0e0	\N	\N	\N	INR	\N
pbkdf2_sha256$600000$Lwg9bqMAg3GRc30PlPq5CX$wXJQrS+tvrnHIcyUEt3Fmp0raXQUZsMl9YRavwCv5MU=	\N	f	client1775649262@example.com	Test	Client	client1775649262@example.com	f	2026-04-08 17:24:22.385198+05:30	e95a953e-f5cb-494b-a19d-2ae9c5a9cf0e	client	+91987653146	1990-01-15	M	123 Main St		Mumbai	Maharashtra	India	400001	\N	\N			f	f	f	t	2026-04-08 17:24:22.809638+05:30	2026-04-08 17:24:22.809649+05:30	\N	f	\N	\N	\N	\N	INR	\N
pbkdf2_sha256$600000$PFUCcYVIAhan34kvyf9qip$gN1+XH4pR4J7PeDDcoaBh+4qbKncF6G11uciJk5I6hg=	\N	f	firmowner1775649262@example.com	Test	FirmOwner	firmowner1775649262@example.com	f	2026-04-08 17:24:23.025652+05:30	dd72a3e8-c5ff-49f3-a3f0-a01fa656d9f7	super_admin	+91976546342	1985-05-20	F	456 Legal Street		Mumbai	Maharashtra	India	400002	\N	\N			f	f	f	t	2026-04-08 17:24:23.560747+05:30	2026-04-08 17:24:23.560765+05:30	\N	f	44b23374-ad48-4a79-be52-8daca9fb0a72	\N	\N	\N	INR	\N
!7ZCODs9otlHwdhK8smOOzboxgbDTFfhlfoqHOR0q	\N	f	superadmin1775649263@example.com	Test	SuperAdmin	superadmin1775649263@example.com	f	2026-04-08 17:24:24.034773+05:30	ac571d9e-2002-401c-9166-2a67254b0117	super_admin	+91876541618	\N								\N	\N			f	f	f	t	2026-04-08 17:24:24.035236+05:30	2026-04-08 17:24:24.04689+05:30	\N	f	89139faa-b451-4c26-96ba-1d34635edb4b	\N	\N	\N	INR	\N
pbkdf2_sha256$600000$CrIbkEsIOtUOmXv8PjwmmQ$9WZWCEZysYk9j6z7y7ixftvdiaOoBDQZZuwKKgQS5z4=	\N	f	testadmin@examflow.com	Test	Admin	testadmin@examflow.com	f	2026-04-09 12:19:17.801238+05:30	ccf81fd2-cb99-4d5e-943a-5fc6676f0f12	super_admin	9191919191	\N				Test City	Test State	India	123456	\N	\N			f	f	f	t	2026-04-09 12:19:18.468249+05:30	2026-04-09 12:19:18.468267+05:30	\N	t	163695ec-06e3-4bc9-abcc-c790adb731cc	\N	\N	\N	INR	\N
pbkdf2_sha256$600000$CyJYRGi5DFhhYgBSmqrhJi$zjSk/hMVZdJ4MxcaK6Ad0uvs76wzgkNUH43U23aWPhw=	\N	f	successtest1775717753@lawfirm.com	Success	Test	successtest1775717753@lawfirm.com	f	2026-04-09 12:25:54.214085+05:30	0761e14b-822b-4e25-b331-1ad7126784ea	super_admin	91775717753	\N				Bhubaneshwar	Odisha	India	751003	\N	\N			f	f	f	t	2026-04-09 12:25:54.622056+05:30	2026-04-09 12:25:54.622067+05:30	\N	t	a8c373ce-cd7c-4252-ae9e-32aa6d8e7d77	\N	\N	\N	INR	\N
pbkdf2_sha256$600000$1qtFB0Pe3kuMfu2UQX4y1C$KMml8+kzQRNUGdj6dn/phgVkXLp+RDbVj2V1BcVdHSI=	\N	f	bibhu.phy.m@gmail.com	Bibhu	Maha	bibhu.phy.m@gmail.com	f	2026-04-10 18:25:49.876841+05:30	5c4990c4-5ddb-4031-bc04-785bc086b824	super_admin	8790278025	2026-04-09	M	Kalinga Nagar , Bhubaneswar		Basudebpur	Odisha	India	751003	\N	\N			f	f	f	t	2026-04-10 18:25:50.344609+05:30	2026-04-10 18:25:50.344623+05:30	\N	t	619fda7b-cdce-4b9f-8cde-4fdade1006db	\N	\N	\N	INR	\N
	\N	f	advocate@firm.com	Advocate	User	advocate@firm.com	f	2026-04-11 10:50:04.286717+05:30	52a02cb1-3a17-44d5-a068-7edcd21c71f5		9876543210	1990-01-15	M			Kolkata	West Bengal	India	700001	\N	\N			f	f	f	f	2026-04-11 10:50:04.287905+05:30	2026-04-11 10:50:04.287924+05:30	\N	f	\N	\N	\N	\N	INR	\N
pbkdf2_sha256$600000$eztx2CmRGEnD2eetq6H7ex$Ip1GtBFMGia5UT6eIUQurV7XCdpKtuDccc8HePLF17o=	\N	f	bibhu.phy@gmail.com	Bibhuprasad	Mahakud	bibhu.phy@gmail.com	f	2026-04-10 18:23:17.070429+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43	client	7008639757	2026-04-07	M	Kalinga Nagar , Bhubaneswar		Baleshwar	Odisha	India	751003	\N	\N			t	t	f	t	2026-04-10 18:23:17.499214+05:30	2026-04-30 13:46:39.430185+05:30	2026-04-30 13:46:39.429855+05:30	t	\N	profile_images/anadrone.jpg	\N	\N	INR	\N
pbkdf2_sha256$600000$lfP8uPensXmsGbzYs333gF$XTEgYIj6dBfbN6YNJlJ5HWqyn/MaNBuidJTkCT4rx3Q=	\N	f	subratbarik203@gmail.com	Subrat	Barik	subratbarik203@gmail.com	f	2026-04-11 16:01:33.007879+05:30	95e76468-b0fd-4a8c-ab8e-2fd411bb7cc0	partner_manager	+8808847806814	\N								\N	\N			f	f	f	t	2026-04-11 16:01:33.408904+05:30	2026-04-11 16:01:33.408916+05:30	\N	t	\N	\N	\N	\N	INR	\N
pbkdf2_sha256$600000$PeZDz9qBTJdYo0jcHU6Tpe$LctsVPPwIX3Kr17AUwp8S2xSOeKvvN3tB286XFwdyEE=	\N	f	client@example.com	John	Doe	client@example.com	f	2026-04-11 11:39:06.09279+05:30	813f9eee-e9ae-43b7-967e-6768b7f6747f	client	+919876543210	1990-01-15	M	123 Main St		New York	NY	USA	10001	\N	\N			f	f	f	t	2026-04-11 11:39:06.499677+05:30	2026-04-11 11:39:06.499689+05:30	\N	t	\N	\N	\N	\N	INR	\N
pbkdf2_sha256$600000$aIQzN8rRus9OLYn3g1Qwfh$9Hf6AMQmv09vQFuTpw/fPNaIaMPw42ZR5XAi7et2Bwg=	\N	f	testparalegal@lawfirm.com	test	paralegal	testparalegal@lawfirm.com	f	2026-04-11 13:58:39.378707+05:30	4e1a7020-f5e3-46aa-910c-0892eb73f480	paralegal	33333333	\N								\N	\N			f	f	f	t	2026-04-11 13:58:39.906332+05:30	2026-06-29 10:59:43.531892+05:30	2026-06-29 10:59:43.531705+05:30	t	6ae6b893-969f-432d-a7f4-62e5f14af2d9		\N	\N	INR	\N
pbkdf2_sha256$600000$l0MRJfKVKUDtpJRLoouCuY$6FXRsXjBxvuk5KpWYQlaW71PR6sV5ni7oEqB3az6g9A=	\N	f	testclient@lawfirm.com	test	client	testclient@lawfirm.com	f	2026-04-11 13:59:42.724351+05:30	4966020c-6f87-46bc-9f85-5ed8adfcf4bb	client	5555555555	\N								\N	\N			f	f	f	t	2026-04-11 13:59:43.208111+05:30	2026-04-11 13:59:43.220419+05:30	\N	t	6ae6b893-969f-432d-a7f4-62e5f14af2d9	\N	\N	\N	INR	\N
pbkdf2_sha256$600000$PWZOR8ee91kbGcMc6ORw7b$7g4uLCDepkbooi0EVB0aMyVhpMwldad/8S+xqxRSDYM=	\N	f	testadvocate@lawfirm.com	test	advocate	testadvocate@lawfirm.com	f	2026-04-11 13:54:09.024947+05:30	ad82aa5b-ad99-4007-8b0f-56fedc7f174b	advocate	22222222	\N								\N	\N			f	f	f	t	2026-04-11 13:54:09.453791+05:30	2026-05-06 16:22:59.430583+05:30	2026-05-06 16:22:59.430252+05:30	t	6ae6b893-969f-432d-a7f4-62e5f14af2d9		\N	\N	INR	\N
pbkdf2_sha256$600000$a1RsgALiTgX1ZUPZgOsalH$ENptUX4qp+wFl+CrmZRamp0GehrqrUMLRCsaogTGjcY=	\N	f	subratbarik23@gmail.com	Subrat	Barik	subratbarik23@gmail.com	f	2026-04-11 16:02:26.698846+05:30	64e0fdd0-511e-42e9-9e78-990d847cc6d6	partner_manager	+880884780684	\N								\N	\N			f	f	f	t	2026-04-11 16:02:27.151183+05:30	2026-04-11 16:02:27.151195+05:30	\N	t	\N	\N	\N	\N	INR	\N
pbkdf2_sha256$600000$NwOLZXE6Iyg8T3z7z3R6Y4$OUO9BwZFpeAs1y5elZc86pwh5gXFtwKPz/3326+zJpQ=	\N	f	subratbarik3@gmail.com	Subrat	Barik	subratbarik3@gmail.com	f	2026-04-11 16:20:33.187002+05:30	f018d6c3-daf0-4493-805f-300704bb4175	super_admin	+8808847806823	\N								\N	\N			f	f	f	t	2026-04-11 16:20:33.671291+05:30	2026-04-11 16:20:33.686593+05:30	\N	t	7014678b-9497-462c-af84-faa7d0f279d0	\N	\N	\N	INR	\N
pbkdf2_sha256$600000$s3NplqhLrDoVCjXFC78ZHG$OoP2BkXQVPUh50wmodO2eXgrrNFRDwNSc7NOc4m/i2c=	\N	f	subratba03@gmail.com	Surya	Barik	subratba03@gmail.com	f	2026-04-11 16:23:53.739581+05:30	53fbe468-b315-48f8-bc07-99d8f6ca363e	partner_manager	+918847806814	\N								\N	\N			f	f	f	t	2026-04-11 16:23:54.154401+05:30	2026-04-11 16:23:54.166296+05:30	\N	t	619fda7b-cdce-4b9f-8cde-4fdade1006db	\N	\N	\N	INR	\N
pbkdf2_sha256$600000$XuSTMvSwOQLIOI1Vq00JA7$0KB2J8IcI9wGUzMlPzpItNgM0O3IeoxBclebsVOjUA4=	\N	f	suryapartner@gmail.com	surya	partner	suryapartner@gmail.com	f	2026-04-13 13:51:41.16027+05:30	2cc4a3c9-5762-4498-9e20-9a05f330c717	partner_manager	7418529630	2023-02-08	M	HIG -	bbsr	Bhubaneswar	Odisha	India	751003	123434566782	bjhdjh1223	123ert	Odisha	f	f	f	t	2026-04-13 13:51:41.571629+05:30	2026-04-20 15:36:02.913338+05:30	\N	t	81663d19-18cb-45ac-a1c9-6a0d0c0d9e9d	profile_images/download_VtAV9YD.jpeg	\N	\N	INR	\N
pbkdf2_sha256$600000$TSZlCzx1foG5YGBxThqeme$/PZH2dzFYzct1MCj5D5jBf904OoMdw7KjsXGENPOoJA=	\N	f	aloktest@gmail.com	alok 	behera	aloktest@gmail.com	f	2026-04-13 13:02:18.373775+05:30	43789810-4a0f-4d4c-9ccf-df7a17179191	partner_manager	1231231230	\N								\N	\N			f	f	f	t	2026-04-13 13:02:18.8143+05:30	2026-04-13 13:02:18.814319+05:30	\N	t	\N	\N	\N	\N	INR	\N
pbkdf2_sha256$600000$1hOUXUQKUPhPeYTpEhZpjD$Q8zXFhweZZ5Jj4+cVlEph1lKjmQcNRtz+5k64y0bM44=	\N	f	suryapartner@lawfirm.com	surya	partner	suryapartner@lawfirm.com	f	2026-04-13 13:25:32.546622+05:30	6af32917-1514-44a7-a14c-33067278b347	partner_manager	1478523690	\N								\N	\N			f	f	f	t	2026-04-13 13:25:33.00698+05:30	2026-04-13 13:25:33.006991+05:30	\N	t	\N	\N	\N	\N	INR	\N
pbkdf2_sha256$600000$OVpxz32BnTueAX8Oxuvcrt$oUgyZpMIDiEvk8GjCjLINwVq27Qtd3lKL16E/pArTbQ=	\N	f	new@g.com	ZD	DSD	new@g.com	f	2026-04-17 12:29:05.486204+05:30	285a9e83-e3ae-4680-a774-80d0e38ef773	client	1324321243	2026-04-10	M	ASDA		Ashkāsham	Badakhshan	Afghanistan	113	\N	\N			f	f	f	t	2026-04-17 12:29:06.038241+05:30	2026-04-17 12:29:06.038273+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$aQUq3hBmEipJ1J1WLBL9kU$RDN76NkAY8z8vbNgyIF5oDq/GZLFrryXLFqJIlT7r4w=	\N	f	testadmin2@g.com	test admin	2	testadmin2@g.com	f	2026-04-13 18:47:23.442945+05:30	4a38df05-8e96-4b50-b5ad-54598ecba542	admin	8808847801234	\N								898989898989	\N			f	f	f	t	2026-04-13 18:47:23.893433+05:30	2026-04-27 10:15:32.032386+05:30	2026-04-27 10:15:32.032191+05:30	t	6ae6b893-969f-432d-a7f4-62e5f14af2d9	profile_images/download_a5YUryV.jpeg	\N	\N	INR	\N
pbkdf2_sha256$600000$U78j8PMi2chK9rLFHT1lqT$jMXsA+vOdp5ikKPc5Pxj/7Fy5raleRVmQdGpzt0gFLA=	\N	f	subra@gmail.com	test	partner	subra@gmail.com	f	2026-04-11 18:28:16.647477+05:30	6f92770a-62ce-430d-b7d5-d5f6c27142d2	partner_manager	+918847805554	\N								\N	\N			f	f	f	f	2026-04-11 18:28:17.064772+05:30	2026-04-13 11:51:25.656134+05:30	\N	t	e484ef42-c53a-4d91-99c9-a5306d58c639	\N	\N	\N	INR	\N
pbkdf2_sha256$600000$enzt2Ghji6VxrSV8x8MoEm$9b3lxcnSVFwpAx9n2osAELJVZUYr5iQvdF5oYHQRZ1c=	\N	f	asda@gmail.com	gsdjsd	dsasd	asda@gmail.com	f	2026-04-17 15:35:22.09102+05:30	fcde59a6-01eb-46cf-9e40-344f8282b54a	client	234242423432	\N								\N	\N			f	f	f	t	2026-04-17 15:35:22.5421+05:30	2026-04-17 15:37:47.112605+05:30	2026-04-17 15:37:47.112408+05:30	t	9b2a3376-624e-4aff-8c05-746491e1c0fb		\N	\N	INR	\N
pbkdf2_sha256$600000$Wzkk6zooxE5dUlbOlZAl2d$UBBNOjwYLIvkMVNFHcwAZ/vis/viAtIi5VuZq3x0Fg0=	\N	f	subratbarikadmin@gmail.com	Subrat	admin	subratbarikadmin@gmail.com	f	2026-04-13 15:59:54.071331+05:30	89454769-3208-415f-a80f-6f863155e765	admin	+880884778945	\N								\N	\N			f	f	f	t	2026-04-13 15:59:54.56181+05:30	2026-04-13 17:12:42.992869+05:30	\N	t	6ae6b893-969f-432d-a7f4-62e5f14af2d9	\N	\N	\N	INR	\N
pbkdf2_sha256$600000$K63lGATRHUr8UaRBIPkA2y$FFkmkKFk90Dd9nopQWPrd8FpUqky4Bu41r2UMZOxkXw=	\N	f	subratbar@gmail.com	Subrat	Barik	subratbar@gmail.com	f	2026-04-11 18:21:36.741912+05:30	3f468d59-6421-43c8-9449-514c2cc42be6	super_admin	+91047806814	2020-06-10	M	Plot-84,lane-3,road-2	baramunda bhubaneswar	Cuttack	Odisha	India	751003	594622322646	gbppb0080p	12345	Odisha	f	f	f	t	2026-04-11 18:21:37.155162+05:30	2026-04-13 18:33:38.743599+05:30	\N	t	619fda7b-cdce-4b9f-8cde-4fdade1006db	\N	\N	\N	INR	\N
pbkdf2_sha256$600000$KY47VwTeEqW1l08SL3zO1D$jV1LZRPgREBhmsg4G/eh2ekxZPAYyBsKByeaH+hZZ0Q=	\N	f	shradhamilu160@gmail.com	SHRADHA	SAHOO	shradhamilu160@gmail.com	f	2026-04-17 12:54:28.787469+05:30	139b2b54-06b6-4e1b-9469-bbda62e773d3	admin	+917008566160	\N								\N	\N			f	f	f	t	2026-04-17 12:54:29.218223+05:30	2026-04-17 12:54:29.218234+05:30	\N	t	6ae6b893-969f-432d-a7f4-62e5f14af2d9		\N	\N	INR	\N
pbkdf2_sha256$600000$cZMdqngudY0x5H5mZjoHeN$qyjUfk9CudRjAFcHSSV0AIAA1yBIn5Ku3uePrd1WQ9E=	\N	f	shradhamilu@gmail.com	SHRADHA	SAHOO	shradhamilu@gmail.com	f	2026-04-17 13:32:08.762427+05:30	c972c8b6-00f9-43fa-80ef-45253e7ac6c3	advocate	999569999	\N								\N	\N			f	f	f	t	2026-04-17 13:32:09.214672+05:30	2026-04-17 13:32:09.214684+05:30	\N	t	6ae6b893-969f-432d-a7f4-62e5f14af2d9		\N	\N	INR	\N
pbkdf2_sha256$600000$8DOGOCrUU4I4oJOa8ZUVjR$1PZ+8DsfeX0YWVzsA0TcpRowyDkuh9L3T6E08j1CFSc=	\N	f	www.sushilkumar@gmail.com	sushil	kumar	www.sushilkumar@gmail.com	f	2026-05-05 15:02:37.875716+05:30	e53922f1-669e-4ac7-9d4d-ba4ccd282339	client	8700562783	1990-04-23	M	Begusarai		Patna	Bihar	India	0612	\N	\N			f	f	f	t	2026-05-05 15:02:38.310475+05:30	2026-05-05 15:02:38.310486+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$BrPtu2YgDYaY112JXaxSYe$XElvF5q8AL877W3wPLRoUGjXDThWAfrxsVQD51tzq0U=	\N	f	www@gmail.com	erwret	wewqe	www@gmail.com	f	2026-04-17 15:39:48.346667+05:30	744dd8b0-1403-4473-8d3a-2787f061c05a	advocate	4342432434	\N								\N	\N			f	f	f	t	2026-04-17 15:39:48.823531+05:30	2026-04-17 15:39:48.823543+05:30	\N	t	9b2a3376-624e-4aff-8c05-746491e1c0fb		\N	\N	INR	\N
pbkdf2_sha256$600000$IMJExsM7ZRVVFg41gDA3RB$aQ0l0fNdjGVGj8EcOOf0+822HscBkZMeC455DA2CdsU=	\N	f	s03@gmail.com	Subrat	Barik	s03@gmail.com	f	2026-04-17 17:10:42.172187+05:30	6136f201-bfb6-4e41-bf1e-cb9f231549a5	client	+99999999567	\N								\N	\N			f	f	f	t	2026-04-17 17:10:42.590176+05:30	2026-04-20 10:20:27.859282+05:30	2026-04-20 10:20:27.858934+05:30	t	6ae6b893-969f-432d-a7f4-62e5f14af2d9	profile_images/13494467-fff4-478f-be15-feaaa3dca2aa.jpeg	\N	\N	INR	\N
pbkdf2_sha256$600000$0VxBxPbBSi9kag8HAP9IN9$C4DicgcoRskIXxc6rhPMZsCgzVd/XDI/Niifrn5+554=	\N	f	sub@gmail.com	Subrat	Barik	sub@gmail.com	f	2026-04-17 17:05:00.425813+05:30	6fd29da0-7080-4382-aaa8-77caa8ef0482	advocate	32222222222	\N								\N	\N			f	f	f	t	2026-04-17 17:05:00.847442+05:30	2026-04-17 17:22:52.212392+05:30	2026-04-17 17:22:52.212188+05:30	t	6ae6b893-969f-432d-a7f4-62e5f14af2d9		\N	\N	INR	\N
pbkdf2_sha256$600000$JMTkmT4sXbIGAhW6arqYQB$FmhJDoJLlPZI+76u/y5eZyu+xmWTosXXXPpoN338dow=	\N	f	gfdfhd@gmail.com	SHRADHA	SAHOO	gfdfhd@gmail.com	f	2026-04-17 15:53:50.67995+05:30	ef266648-9837-4cbc-86b1-5af95046120b	admin	7008566160	\N								\N	\N			f	f	f	t	2026-04-17 15:53:51.257063+05:30	2026-05-11 12:58:05.79336+05:30	2026-05-11 12:58:05.793094+05:30	t	9b2a3376-624e-4aff-8c05-746491e1c0fb		\N	\N	INR	\N
pbkdf2_sha256$600000$KTTuWGMrz6YGhcU2aMnJJE$CMZBc9n7N/9JBMSy8CeR3EqhIb+dMYJst27ebj+XiYE=	\N	f	arya@gmail.com	test admin arya	2	arya@gmail.com	f	2026-04-17 13:27:15.973662+05:30	2263dc2c-c794-4dbc-b560-6d1708212eb6	super_admin	1212323233	\N								\N	\N			f	f	f	t	2026-04-17 13:27:16.750963+05:30	2026-04-20 15:23:14.962616+05:30	\N	t	6ae6b893-969f-432d-a7f4-62e5f14af2d9		\N	\N	INR	\N
pbkdf2_sha256$600000$6dkrSQhqMizKMCYx86UiiN$yQmwyni3SbfIRHhOKnetChfdSw9PS8FgAV8mf4kgy3M=	\N	f	alokadmin@g.com	alok	admin	alokadmin@g.com	f	2026-04-13 17:13:56.548638+05:30	1d914b5d-b935-4b96-b55e-38a2cd83f763	admin	918847778899	\N						India		\N	\N			f	f	f	t	2026-04-13 17:13:56.978604+05:30	2026-04-23 13:13:47.584694+05:30	2026-04-23 13:13:47.584477+05:30	t	6ae6b893-969f-432d-a7f4-62e5f14af2d9	profile_images/download_BQmY4FS.jpeg	\N	\N	INR	\N
pbkdf2_sha256$600000$xzSZBjddjtKMOFk1uXxPMO$cP45hr+lU6dOLdlKVN782XKjcDDu09kSCDzkmlDGexU=	\N	f	surya@h.com	surya client	1	surya@h.com	f	2026-04-15 13:06:37.830314+05:30	90790d0f-374c-4a08-b0d6-b74a171a7ca5	client	2345234567	\N						IN		\N	\N			f	f	f	t	2026-04-15 13:06:38.236355+05:30	2026-06-29 11:07:17.81689+05:30	2026-06-29 11:07:17.816695+05:30	t	6ae6b893-969f-432d-a7f4-62e5f14af2d9	profile_images/download_Zk0Gx3G.jpeg	\N	\N	INR	\N
pbkdf2_sha256$600000$oPXiMaptVcz3UFRRpE8FLG$AwgIyeOgMNToy04MQFkh7mzrRWgP/svqiRx71qlZWzI=	\N	f	ddd@gmail.com	Suman	Das	ddd@gmail.com	f	2026-04-18 12:21:09.433442+05:30	bee18ba6-be01-4c4b-82ff-3103e307fc95	advocate	654767673647	\N								\N	\N			f	f	f	t	2026-04-18 12:21:09.917523+05:30	2026-04-30 17:39:23.689883+05:30	2026-04-30 17:39:23.689666+05:30	t	9b2a3376-624e-4aff-8c05-746491e1c0fb		\N	\N	INR	\N
pbkdf2_sha256$600000$3GI3YhZpl2ptXBXObhX8FN$Yzee6Fqiu9yQXwGYekVQOSqXLAGRKcnDvs1zpzTSuts=	\N	f	zxcxzc@grgesdg	cszcdcd	czxc	zxcxzc@grgesdg	f	2026-04-20 16:03:13.016287+05:30	d2a3cc2e-3011-43ab-9d25-6026fc830f2d	partner_manager	2124554354	\N								\N	\N			f	f	f	t	2026-04-20 16:03:13.462188+05:30	2026-04-20 16:03:13.486061+05:30	\N	t	9b2a3376-624e-4aff-8c05-746491e1c0fb		\N	\N	INR	\N
pbkdf2_sha256$1200000$znsuWMaDQ7uBDpqH64NNxN$Cg+SIavwNWqLy06ZOPuEE6ZwDnTsk/UrD+RZzulHoL0=	\N	f	saxenalawfirm@gmail.com	Ritik	Saxena	saxenalawfirm@gmail.com	f	2026-04-15 18:43:19.258591+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	super_admin	7008639756	2026-04-02	M	Plot-84,lane-3,road-2		Bhubaneshwar	Odisha	India	751003	543213213213	\N	sdsad324234234	Odisha	t	f	f	t	2026-04-15 18:43:19.815382+05:30	2026-07-31 15:55:47.328193+05:30	2026-07-31 15:55:47.328088+05:30	t	9b2a3376-624e-4aff-8c05-746491e1c0fb	profile_images/download_cnvh4BJ.jpeg	\N	\N	INR	\N
pbkdf2_sha256$1200000$O8TkjjjgLFP2IoWwTibdCF$OPtRjiHxmi4gFJvbY1ZsGsWJ2ptV9t4jCwy6bUjXIMk=	\N	f	gfdfhdee@gmail.com	sdss	dsads	gfdfhdee@gmail.com	f	2026-04-17 18:30:40.454746+05:30	3b606ec3-0b52-4b70-a076-135e2185e64d	advocate	354345325353434	\N								\N	\N			f	f	f	t	2026-04-17 18:30:40.986165+05:30	2026-07-21 10:43:28.884268+05:30	2026-07-21 10:43:28.884174+05:30	t	9b2a3376-624e-4aff-8c05-746491e1c0fb		\N	\N	INR	\N
pbkdf2_sha256$600000$hUFr58pRCz9ikHVSbpzjQg$d71bIPaU0gOZa2ePXQwZtocqNzNHPWosFco++op7s/0=	\N	f	pooja@gmail.com	Pooja	Gupta	pooja@gmail.com	f	2026-04-21 10:01:04.161912+05:30	9b6e44a0-33b6-48b3-8d43-0f1de5234056	client	3462267473	2026-04-16						BH		656325436343	5343624532			f	f	f	t	2026-04-21 10:01:04.872541+05:30	2026-04-21 10:02:25.526647+05:30	\N	t	eb995188-6dfb-4eba-9425-930f18d36d7f	profile_images/Screenshot_from_2026-04-20_16-36-27.png	\N	\N	INR	\N
pbkdf2_sha256$600000$tgntsmQRQ5AUslUjo3Nktd$wg/WyE/coz2YV/AozPhdrped9l6A3Dt1xD+soBfAgp8=	\N	f	fsffa@fgsafa.vkj	super admijn	112	fsffa@fgsafa.vkj	f	2026-04-20 16:12:05.593374+05:30	2bbad9a4-501c-4d04-92c8-1f5b891f14da	super_admin	8776767676	\N								\N	\N			f	f	f	t	2026-04-20 16:12:06.112171+05:30	2026-04-20 16:12:06.13457+05:30	\N	t	81663d19-18cb-45ac-a1c9-6a0d0c0d9e9d		\N	\N	INR	\N
pbkdf2_sha256$600000$YV8IaRn7sqYQNHWQwMnFnc$Trrrs+uNOcxcFK3nvsZNDvl9JgCDGDIaDyyl/q+aU1U=	\N	f	new@k.com	new super admin	2	new@k.com	f	2026-04-20 16:26:03.330111+05:30	dde58a11-a18e-4984-bc67-1d8ccfd5346a	super_admin	5465665656	\N								\N	\N			f	f	f	t	2026-04-20 16:26:03.744691+05:30	2026-04-20 16:26:03.7662+05:30	\N	t	1e0ab2b3-f52e-4793-b9fd-cdceecd59e06		\N	\N	INR	\N
pbkdf2_sha256$600000$c3qWdievLM2Jzqzw1MrCZy$JNoU/xTaSxZQ7YisyQkClcVyMewh7bMLPJdDcBST/z4=	\N	f	bohidarakash@gmail.com	Manas Ranjan	Bohidar	bohidarakash@gmail.com	f	2026-04-24 14:30:57.349042+05:30	9ee6f64d-fe8a-4278-8811-b96a25556da5	client	9777570500	1972-04-24	M	Sagar pada		Balangir	Odisha	India	41056	\N	\N			f	f	f	t	2026-04-24 14:30:58.124703+05:30	2026-04-24 14:30:58.124722+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$5asFckaSyoUuZpZG0ki8Uq$qJ5PckwegqR4qf2jqzRIPvf2gI/vfmL+H04U6xALRHU=	\N	f	lipika@gmail.com	Lipika	Jena	lipika@gmail.com	f	2026-04-21 10:19:33.469944+05:30	08928500-f6fb-4fc2-9411-69d237eb44eb	admin	6453645343	\N								\N	\N			f	f	f	t	2026-04-21 10:19:33.906296+05:30	2026-04-21 10:19:33.932211+05:30	\N	t	eb995188-6dfb-4eba-9425-930f18d36d7f		\N	\N	INR	\N
pbkdf2_sha256$600000$n4Fu2qZbK0nYsZDJOD5f74$qUFaqBRN472tCJ06ZR9w4oVtyZFHUfK+e3Q5JvuLxLs=	\N	f	asim@gmail.com	Asim	Rath	asim@gmail.com	f	2026-04-21 11:07:07.801288+05:30	d0ebad81-eae4-446f-a89b-0bdb5d513b7f	client	764378426492	\N								\N	\N			f	f	f	t	2026-04-21 11:07:08.21936+05:30	2026-04-21 11:09:05.204546+05:30	2026-04-21 11:09:05.204175+05:30	t	eb995188-6dfb-4eba-9425-930f18d36d7f		\N	\N	INR	\N
pbkdf2_sha256$600000$22QZwhf3bhK0Iu1CRLuB4b$piUmMnXXluoU19EExDZZiXY2t/q6kVdP10RWuD/rc7g=	\N	f	bibhu@gmail.com	Bibhu Prasad	Mahakud	bibhu@gmail.com	f	2026-04-21 10:16:06.970909+05:30	c1270be1-13d5-476e-a2cb-01d93da3816c	advocate	12345665890	\N								\N	\N			f	f	f	t	2026-04-21 10:16:07.426368+05:30	2026-04-21 11:09:45.353093+05:30	2026-04-21 11:09:45.352874+05:30	t	eb995188-6dfb-4eba-9425-930f18d36d7f		\N	\N	INR	\N
pbkdf2_sha256$600000$jVyWCnOBJ3txpa077XeRlk$1ndiIYDgWk9j0IOaHgK1AVmG/wLcKVHJmNMMJJEw9b8=	\N	f	shradh@gmail.com	Shaswati	Sahoo	shradh@gmail.com	f	2026-04-21 09:58:16.131094+05:30	70dd5f3f-412e-4816-a258-6fc40c025bde	super_admin		\N								\N	\N			f	f	f	t	2026-04-21 09:58:16.571083+05:30	2026-07-15 11:11:51.271117+05:30	2026-07-15 11:11:51.270934+05:30	t	eb995188-6dfb-4eba-9425-930f18d36d7f		\N	\N	INR	\N
pbkdf2_sha256$600000$b40ENrTBS5k0jHboE73zly$YRhI3hVwdmVPL8nuye3fzXih1J7W1I+Ro2YQ/mLQY7M=	\N	f	sgfd@gmail.com	Shradha	Sahoo	sgfd@gmail.com	f	2026-04-21 11:46:02.528181+05:30	5c3c3793-5ad8-47c9-a31d-177ba7fc0081	client	21321321	\N								\N	\N			f	f	f	t	2026-04-21 11:46:03.199398+05:30	2026-04-21 11:53:20.181628+05:30	2026-04-21 11:53:20.181425+05:30	t	5c0747c8-99d2-4104-9fb4-97dd465fdaae		\N	\N	INR	\N
pbkdf2_sha256$600000$ZONrz4HuUD2jDk8gsmXDFa$vdxaDxC80ZNYuEEwrQKOC5FytNbd6LxXg7KTNlpf2Y4=	\N	f	ritik03@gmail.com	Ritik	Sharma	ritik03@gmail.com	f	2026-04-21 11:49:57.51011+05:30	cbc4ea0e-015e-4d4f-ae0c-c85c450691c9	advocate	233323233	\N								\N	\N			f	f	f	t	2026-04-21 11:49:57.932425+05:30	2026-04-21 11:54:38.408615+05:30	2026-04-21 11:54:38.408388+05:30	t	5c0747c8-99d2-4104-9fb4-97dd465fdaae		\N	\N	INR	\N
pbkdf2_sha256$600000$CVydb3ktpp1PJn4O69migW$RGCCT2vnkXjUz2bF7QuYNWUJ29VqVvOoD4TcAKnmzp8=	\N	f	jd@zoho.com	Jonn	Daker	jd@zoho.com	f	2026-04-23 12:26:11.970824+05:30	036cca57-42e0-4e9e-8571-e65e5e810d8e	partner_manager	6333395568	\N								\N	\N			f	f	f	t	2026-04-23 12:26:12.526534+05:30	2026-04-23 12:26:12.552834+05:30	\N	t	1362c7a1-e7b3-40cf-846a-bdd37a526b5a		\N	\N	INR	\N
pbkdf2_sha256$600000$tRQuY8U5U7N5jI094uoor8$gRwbZkMxeTQyDWuSbVp1/nV4u2AHnvUwyihwFyXAxww=	\N	f	manasbohidar@gmail.com	Manas Ranjan	Bohidar	manasbohidar@gmail.com	f	2026-04-24 14:37:23.247743+05:30	d9c20303-1390-4b8d-bf0b-9e59ab2ca389	client	9437209960	1973-04-24	M	Sagar para		Balangir	Odisha	India	767001	\N	\N			f	f	f	t	2026-04-24 14:37:23.661684+05:30	2026-04-24 14:37:23.661699+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$OGHz32uSk0M0KYbJ4B3NKS$LRC1pXYzBhHNr6TcbH5lIt2+KmJrsQX3zfArlPeqkJU=	\N	f	sameermaharana@gmail.com	sameer	Maharana	sameermaharana@gmail.com	f	2026-04-24 14:48:00.414087+05:30	f1c489fd-b120-484b-ad6c-871f23feacf9	super_admin	9567205948	1995-04-25	M	nayapali		Bhubaneshwar	Odisha	India	751024	\N	\N			f	f	f	t	2026-04-24 14:48:00.994446+05:30	2026-04-24 14:48:00.994463+05:30	\N	t	047493f0-4349-4661-9815-987701d41bf7		\N	\N	INR	\N
pbkdf2_sha256$600000$hKUMIs2G0DWwstMggM5Kvp$bPJPwPyqdsklN6c+fcJfYRNfDZ4W/7NpoV7qu843xu4=	\N	f	adityadas@gmail.com	Aditya	Das	adityadas@gmail.com	f	2026-04-24 15:46:27.844201+05:30	2090e49f-342e-4867-94d1-42cc12276a9e	client	4567203489	1994-05-24	M	Choudhury Bazar		Cuttack	Odisha	India	753001	\N	\N			f	f	f	t	2026-04-24 15:46:28.444524+05:30	2026-04-24 15:46:28.444545+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$Jv0PKMNSJC5nHevMrPm5gk$TwEHGrhmeOa/TVOjBQ2viuVTH7BIEtyaK9u5w6RW7i0=	\N	f	subham@ajamail.com	Subham	Panda	subham@ajamail.com	f	2026-04-23 12:23:35.023583+05:30	4df8ea5f-ddb8-47c5-9d59-34af552ff821	super_admin	9996636990	\N								\N	\N			f	f	f	t	2026-04-23 12:23:35.569205+05:30	2026-04-23 16:06:12.44483+05:30	2026-04-23 16:06:12.444489+05:30	t	1362c7a1-e7b3-40cf-846a-bdd37a526b5a		\N	\N	INR	\N
pbkdf2_sha256$600000$PTvjcWjab1JeOUqBO6gxjZ$pnXuTMjigjKtvuOHLSAqCKA1YUzOsO1LNB/4ziQDBzc=	\N	f	srikantdas@gmail.com	Srikant	Das	srikantdas@gmail.com	f	2026-04-27 12:51:59.779087+05:30	2132980d-ed53-4e38-b7b7-0e8435602058	client	9437520678	1991-04-28	M	Tanka Pani Road		Bhubaneshwar	Odisha	India	751024	\N	\N			f	f	f	t	2026-04-27 12:52:00.643863+05:30	2026-04-27 12:52:00.64388+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$IO5gGV2LyeW12KORslhGjT$5hP/hxnF6AXfwGYOEiEREZx2gva4Lh33C7YlltAyQ/w=	\N	f	saswatbohidar@gmail.com	Saswat	Bohidar	saswatbohidar@gmail.com	f	2026-04-28 11:23:32.22964+05:30	e26c57c8-aa19-4356-9bb5-9d1cac160d9b	client	9594916092	1984-05-20	M	Madhapur		Hyderabad	Telangana	India	040	\N	\N			f	f	f	t	2026-04-28 11:23:32.710651+05:30	2026-04-28 11:23:32.710663+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$x2B2wANZInyBiBWzt9ly95$pk7RVRTLW6flofdwzt2wQRGrY2eVQoMYcn5zNbdE9bw=	\N	f	sdg@gmail.com	fgdh	4354	sdg@gmail.com	f	2026-05-08 11:22:18.026612+05:30	e7b6f636-7aad-4655-a57d-a3d174fdf4d2	client	5444444	\N								\N	\N			f	f	f	t	2026-05-08 11:22:18.457813+05:30	2026-05-08 11:22:18.45783+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$wRsMRbReg5pjXo18Mafl2X$/L2OWebmNGp7soFZz6XPvANyU0Wv2Zp3ZxBaZExoDXE=	\N	f	admin5535@gmail.com	Pooja	Gupata	admin5535@gmail.com	f	2026-04-21 11:33:13.558469+05:30	67c30f67-0391-428c-afb9-97a597f515f8	partner_manager	3424243422	\N								\N	\N			f	f	f	t	2026-04-21 11:33:14.055197+05:30	2026-05-09 12:42:25.301598+05:30	2026-05-09 12:42:25.301033+05:30	t	3c389772-1fb8-4472-9165-cd2607ecd66c		\N	\N	INR	\N
pbkdf2_sha256$600000$Yvuv7iDynm857Jgb7WaEMC$GEpRPwbmgYZgkHADzRIawnEkJPebBCk/+JrxtuftuQ4=	\N	f	admin12@gmail	Sharadha	Sahoo	admin12@gmail	f	2026-04-21 11:29:06.327583+05:30	0dae6e2b-0eb2-4ccc-9261-e37b567bcdcc	super_admin	3265363463	\N								\N	\N			f	f	f	t	2026-04-21 11:29:06.741095+05:30	2026-07-15 11:11:31.287732+05:30	2026-07-15 11:11:31.287496+05:30	t	3c389772-1fb8-4472-9165-cd2607ecd66c		\N	\N	INR	\N
pbkdf2_sha256$600000$sQTq8a1EPFEJveXX6Qasut$U1pV97XglaFsFKmFQBaNLNOFJBMgjLtT9fDdm8B1r8Y=	\N	f	325347376237	rew	wetywue	cli@gmail.com	f	2026-04-20 10:19:32.220093+05:30	184ee2bb-6bf9-4dc6-8e05-3620562c827e	client	325347376237	\N								\N	\N			f	f	f	t	2026-04-20 10:19:32.626743+05:30	2026-05-15 15:38:07.915403+05:30	2026-05-15 15:38:07.915151+05:30	t	9b2a3376-624e-4aff-8c05-746491e1c0fb		\N	\N	INR	\N
pbkdf2_sha256$600000$rmX4jCPzdNqYG7QA8PjE8W$QeAplSaxwmJXpGKH4hlsN8xv+zWXglCf6q3K18qGSDA=	\N	f	bohidarranjanmanas80@gmail.com	Manas Ranjan	Bohidar	bohidarranjanmanas80@gmail.com	f	2026-05-02 15:04:08.920951+05:30	8b14eb83-f60f-43b7-860f-616947c11476	super_admin	9439100105	1980-04-27	M	Sagar Para		Balangir	Odisha	India	767001	\N	\N			f	f	f	t	2026-05-02 15:04:09.347589+05:30	2026-05-02 15:04:09.347601+05:30	\N	t	df8a95f7-2400-4747-8782-6a6e7642ce4c		\N	\N	INR	\N
pbkdf2_sha256$600000$7ZXDEaIpDyKFrHDClexU97$90FeSsz0tBpYj0UM9T3nlPPOgKAje3JZ4+Co5D8p9fo=	\N	f	www.satyanarayanmishra@gmail.com	Satya Narayan	Mishra	www.satyanarayanmishra@gmail.com	f	2026-05-02 15:17:11.883864+05:30	925f7869-8a14-41c9-a4cb-413c0d69109f	client	9845706000	1968-07-16	M	District Judge Cadre		Sonepur	Odisha	India	767017	\N	\N			f	f	f	t	2026-05-02 15:17:12.420533+05:30	2026-05-02 15:17:12.420546+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$ismL8Wea4urdCH8YUYUqjL$KpOpWbwziv0rF/EzF36aBzlNhjI7c1dPggPk+sPtHrY=	\N	f	sabitachoudhury@gmail.com	Sabita	Choudhury	sabitachoudhury@gmail.com	f	2026-04-30 12:19:57.101523+05:30	4f103703-ddbf-4f28-b312-c30c6f6d605c	client	8338075697	1997-10-02	F	tirtol	tirtol	Jagatsinghapur	OR	IN	754103					f	f	f	t	2026-04-30 12:19:57.505257+05:30	2026-04-30 12:24:10.62648+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$KEve62Hi7Sua8ibps8NEug$JPkQTuB8zeNu9Z9bJ4U38IEH8qVYnqmoFfW17EkIXh0=	\N	f	swagatpadhy@gmail.com	Swagat	Padhi	swagatpadhy@gmail.com	f	2026-04-30 12:43:35.836033+05:30	3f54f6c1-3e73-420a-8333-6ef1649b6187	client	8144844946	1996-08-25	M	CDA Trisulia		Cuttack	Odisha	India	753001	\N	\N			f	f	f	t	2026-04-30 12:43:36.330054+05:30	2026-04-30 12:43:36.33009+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$hrpmB0P4paKbKPSZeIIxAS$kJmZW8dkfXh1mNP34mJOetkouyAYULPUUefOsd/WgHc=	\N	f	narayanmishra@gmail.com	Satya Narayan	Mishra	narayanmishra@gmail.com	f	2026-05-02 15:20:39.67841+05:30	6b324d98-22f0-4936-897e-6633d3e8c556	client	8875006972	1968-07-16	M	District Judge Cadre		Sonepur	Odisha	India	767017	\N	\N			f	f	f	t	2026-05-02 15:20:40.111692+05:30	2026-05-02 15:20:40.111704+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$Qk9s9BhdVOhAk7zo0tXcuK$f8HWP9YxCRO5GvDTSbKaxkZ4AVcgNkueUlcPpVkO11U=	\N	f	www.jayadevmishra@gmail.com	Jayadev	Mishra	www.jayadevmishra@gmail.com	f	2026-05-05 11:52:13.31886+05:30	472c96b5-1c05-4b3c-8beb-fa6fba63b150	client	9435028453	1992-04-30	M	BJP College University		Bhubaneshwar	Odisha	India	751024	\N	\N			f	f	f	t	2026-05-05 11:52:13.860804+05:30	2026-05-05 11:52:13.860818+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$hZ0TG6esljl6SSSo5kBZ3s$DmZWwP33weFGL3BK7n6D2EmzZWTAssrLsUf65kFb7MA=	\N	f	sumitmishra@gmail.com	sumit	Mishra	sumitmishra@gmail.com	f	2026-05-02 11:55:28.27391+05:30	da6195bb-5878-401e-a879-38bd0463fa5c	client	9583635767	1993-05-22	M	Govind Pali		Bargarh	Odisha	India	768028	\N	\N			f	f	f	t	2026-05-02 11:55:28.947503+05:30	2026-05-02 11:55:28.947545+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$9GM2M64b9uKh1AniGtiG8l$P43LhDC24JH4Ckq/ceqoOIdf/Lg/rBhh6LQ8NGuC4aM=	\N	f	priyabohidar@gmail.com	Priya Ranjan	Bohidar	priyabohidar@gmail.com	f	2026-05-02 12:13:16.70363+05:30	a5c2a056-9be3-4241-9557-525cf7c369c7	client	9437241872	1970-04-21	M	A.B.S.S Road		Balangir	Odisha	India	752105	\N	\N			f	f	f	t	2026-05-02 12:13:17.214676+05:30	2026-05-02 12:13:17.214696+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$bdCjxsRaN0AOuD7xra7qnA$kf8bihBs9l4EsnH/TihAo+5X6kS71rWZS6R7qrElVfw=	\N	f	bohidarpriya@gmail.com	Priya Ranjan	Bohidar	bohidarpriya@gmail.com	f	2026-05-02 12:32:15.0704+05:30	3274b74d-4f13-4220-993b-7ec3e4020bfd	client	9437241871	1975-04-26	M	A.B.S.S Road		Balangir	Odisha	India	767001	\N	\N			f	f	f	t	2026-05-02 12:32:15.573849+05:30	2026-05-02 12:32:15.573862+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$JP4XIXre0MYa7Hm3OIgrBC$NU9cPMO5b7wKaWNaqz/MRN4ICWibQG8XjN1eiFtPPi4=	\N	f	bohidarranjanpriya@gmail.com	Priya Ranjan	Bohidar	bohidarranjanpriya@gmail.com	f	2026-05-02 12:38:03.028864+05:30	f331f893-75e1-4841-94f6-ac8a027a2439	super_admin	9437241873	1975-04-24	M	A.B.S.S Road		Balangir	Odisha	India	767001	\N	\N			f	f	f	t	2026-05-02 12:38:03.623517+05:30	2026-05-02 12:38:03.623532+05:30	\N	t	052bec83-a91a-418e-bd48-6ee1e0cd9dbf		\N	\N	INR	\N
pbkdf2_sha256$600000$CNW5piaszlH6A3KdHEPNhi$1Pd6VkKqtplkNeO1hovA2zzeZ0GgRG/Z8VEdk9ECtL4=	\N	f	www.achyutasamanta@gmail.com	Achyuta	Samanta	www.achyutasamanta@gmail.com	f	2026-05-02 14:50:41.950933+05:30	4d0159b7-ce1a-450a-87dd-830fa1780a84	client	6742740326	1964-01-20	M	Kalarabanka		Bhubaneshwar	Odisha	India	751024	\N	\N			f	f	f	t	2026-05-02 14:50:42.469824+05:30	2026-05-02 14:50:42.469836+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$yAx9AonF0XuYcBuvdAoAcd$Gg8mXkFBZhLsX2I5yuURHR8vmJwDZj/I3uCusbQINg0=	\N	f	bohidarmanas@gmail.com	Manas Ranjan	Bohidar	bohidarmanas@gmail.com	f	2026-05-02 14:55:45.682282+05:30	9f1e7cf7-e1f6-4154-9058-746a62b2aeea	client	9439100104	1980-04-27	M	Sagar para		Balangir	Odisha	India	767001	\N	\N			f	f	f	t	2026-05-02 14:55:46.155598+05:30	2026-05-02 14:55:46.155614+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$CoMoBsm6bVX3HpyjIid792$yrZ5o/n9s8RBmIj2z9FMoxat1sJF2Gki8Qbkz/cQ7G4=	\N	f	bohidarranjanmanas@gmail.com	Manas Ranjan	Bohidar	bohidarranjanmanas@gmail.com	f	2026-05-02 14:59:53.653888+05:30	df719cfb-f040-42ce-a588-84c83ab1163d	client	9439100103	1980-04-27	M	Sagar para		Balangir	Odisha	India	767001	\N	\N			f	f	f	t	2026-05-02 14:59:54.06124+05:30	2026-05-02 14:59:54.061252+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$32587w3I6Xbf2jlkUXGqkq$sp7MNCnHgbRc4WBaYeyYVLA0wM62P+qrPERr7fFpumU=	\N	f	www.satyanarayanmishra68@gmail.com	Satya Narayan	Mishra	www.satyanarayanmishra68@gmail.com	f	2026-05-02 15:23:53.202432+05:30	9cbb2fd8-6ae0-4277-972a-25bfaa0c523d	super_admin	887006928	1968-07-16	M	District Judge Cadre		Sonepur	Odisha	India	767017	\N	\N			f	f	f	t	2026-05-02 15:23:53.726717+05:30	2026-05-02 15:23:53.726728+05:30	\N	t	89cb5141-27cb-4e1a-9d85-89399b6032d4		\N	\N	INR	\N
pbkdf2_sha256$600000$8HRClpmvv82Oj7Hyvz5nkH$fAuPZFCTX1A3u+p/3m3kwmD3HiocGQmp8GRgE/dC5A0=	\N	f	jayadevmishra@gmail.com	Jayadev	Mishra	jayadevmishra@gmail.com	f	2026-05-05 11:55:47.901652+05:30	f78d0ea2-b390-40ff-b7e0-ada24480a36e	client	9435582079	1992-04-30	M	B.J.P College road		Bhubaneshwar	Odisha	India	751024	\N	\N			f	f	f	t	2026-05-05 11:55:48.341565+05:30	2026-05-05 11:55:48.341578+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$XLfPh44VpIrQzJVEAiOxxv$4jIvjikGARUxI87rR4AX+MYrLWg5as/jR3/dkUu33GI=	\N	f	ibndv@advocate.gmail.com	fdgdh	cbxn	ibndv@advocate.gmail.com	f	2026-05-04 13:39:31.512739+05:30	2594cfb1-8985-42d5-a068-13a6c277b5ee	advocate	544444465	2026-05-06	F							\N	\N	3562625	odisha	f	f	f	t	2026-05-04 13:39:31.933285+05:30	2026-05-06 16:17:59.182647+05:30	2026-05-06 16:17:59.18234+05:30	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$fEpSJhUFeguep4DjHtWSu6$ShxauDLBhYKTiUWGo5k+fLA79FJLpWSmn6A1kl5gslA=	\N	f	hsg@gmail.com	dsfdsf	dfsfdsf	hsg@gmail.com	f	2026-05-04 17:07:52.707477+05:30	f3b04f63-da8b-40ed-b7f5-12f1b29cde4f	paralegal	45435435	\N								\N	\N			f	f	f	t	2026-05-04 17:07:53.106022+05:30	2026-05-04 17:07:53.106033+05:30	\N	t	\N		\N	\N	INR	\N
	\N	f	sfs@gmail.com	sdfh	dfsf	sfs@gmail.com	f	2026-05-04 17:09:18.583288+05:30	4a7caecd-9157-4aef-97d5-b8a3af238927		999999945	\N								\N	\N			f	f	f	t	2026-05-04 17:09:18.584129+05:30	2026-05-04 17:09:18.584141+05:30	\N	f	\N		\N	\N	INR	\N
	\N	f	fddsf@gmail.com	erwrwr	tgff	fddsf@gmail.com	f	2026-05-04 17:23:24.723069+05:30	f7f9848a-1696-4dbb-b37d-d303b218b9de	client	9898989898	\N								\N	\N			f	f	f	t	2026-05-04 17:23:24.724126+05:30	2026-05-04 17:23:24.724138+05:30	\N	f	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$kfHGSDBWnLBHepCs1XYltu$VbKcPAriJvLlgkXSlMxMFnKl2Jdc/mPCiWcfoW6GJDc=	\N	f	nikhilbohidar@gmail.com	Nikhil	Bohidar	nikhilbohidar@gmail.com	f	2026-05-05 11:25:45.610815+05:30	1e40fae8-1c67-476a-aee1-50c16d953633	client	9040202943	1995-04-06	M	Sagar pada		Balangir	Odisha	India	767001	\N	\N			f	f	f	t	2026-05-05 11:25:46.226028+05:30	2026-05-05 11:25:46.226041+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$cESirOD6eONoaW7dMM93h8$UIF15DR9fMYdVjbIr+B2/6KMus1OtVaBTaPs4PBDgAs=	\N	f	www.nikhilbohidar@gmail.com	Nikhil	Bohidar	www.nikhilbohidar@gmail.com	f	2026-05-05 11:29:22.564188+05:30	55d2e024-98a6-4995-b500-b7b72ee32120	client	9040202944	1995-04-06	M	Sagar para		Balangir	Odisha	India	767001	\N	\N			f	f	f	t	2026-05-05 11:29:23.086884+05:30	2026-05-05 11:29:23.08691+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$KLXhwIbqsZ4EQhxs6Lr2cp$Cpme4ap1pvhWOeXMAEFdBCnmBdy37agfq2abv9WgnpY=	\N	f	bohidarnikhil@gmail.com	Nikhil	Bohidar	bohidarnikhil@gmail.com	f	2026-05-05 11:34:00.311072+05:30	022eaecb-2f3f-4c8d-b887-7b8e629d7f8b	super_admin	9040202941	1995-04-06	M	Sagar para		Balangir	Odisha	India	767001	\N	\N			f	f	f	t	2026-05-05 11:34:00.762252+05:30	2026-05-05 11:34:00.762269+05:30	\N	t	197702cb-a3f7-4d43-a7cf-5b4d02a83ec4		\N	\N	INR	\N
pbkdf2_sha256$600000$BiAVlXAjtkdUxiyzB1nmWE$vDnH5upSDNRoPVFvKFnNMe0a2kxJDA/qhYoiFzmFVXo=	\N	f	mishrajayadev@gmail.com	Jayadev	Mishra	mishrajayadev@gmail.com	f	2026-05-05 12:20:06.71006+05:30	fc46a32c-76f0-4c59-806d-f5d221d1af68	client	9570523080	1992-04-30	M	B.J.B College Road		Bhubaneshwar	Odisha	India	751024	\N	\N			f	f	f	t	2026-05-05 12:20:08.337977+05:30	2026-05-05 12:20:08.338+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$DCVqxCBZPyJpHqhHYsYCjH$jLeImHPPq18AfTRM6DUmQhfmfP566r7J6Y00qGiv8AE=	\N	f	mishrajayadev92@gmail.com	Jayadev	Mishra	mishrajayadev92@gmail.com	f	2026-05-05 12:23:34.314727+05:30	ac500223-29fe-42a1-ba68-b00039a4c545	super_admin	8978022140	1992-04-30	M	B.J.B College Road		Bhubaneshwar	Odisha	India	751024	\N	\N			f	f	f	t	2026-05-05 12:23:35.033074+05:30	2026-05-05 12:23:35.033096+05:30	\N	t	23d1cff5-9768-47d8-b341-0cd2cf8367f9		\N	\N	INR	\N
pbkdf2_sha256$600000$ymqjCWGzntoGaqG2NHOnIQ$R5PNr6ZLXg9Bv/re/RAjJ3fpIDgat0kBmkOHo4YGRNg=	\N	f	sushilkumar@gmail.com	sushil	kumar	sushilkumar@gmail.com	f	2026-05-05 15:05:54.214431+05:30	daa399bd-d338-4948-bb07-e0d11f6a1bba	client	8875002345	1990-04-23	M	Begusarai		Patna	Bihar	India	0612	\N	\N			f	f	f	t	2026-05-05 15:05:54.62472+05:30	2026-05-05 15:05:54.624732+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$WM0Y9JaZOOVbpxB2gxqPor$CNk9JdF07qsR42D36zEWL8zLju3TaDloh1ZGm1yZ+6I=	\N	f	kumarsushil@gmail.com	sushil	kumar	kumarsushil@gmail.com	f	2026-05-05 15:09:00.826349+05:30	49a1fd68-7dd7-4295-a85a-71e4797c6783	super_admin	8456007230	1990-04-24	M	Begusarai		Patna	Bihar	India	0612	\N	\N			f	f	f	t	2026-05-05 15:09:01.443611+05:30	2026-05-05 15:09:01.443626+05:30	\N	t	a039273e-ee03-4e3b-807d-0bacfae01ab6		\N	\N	INR	\N
pbkdf2_sha256$600000$CyxPmRTQYBpaCPegX6JbX1$K4Hn8W1TaWyk6XKm/K/gODDNJS+LRIKZRV9cMlifMpQ=	\N	f	erdfddfdewr@lawfirm.com	fvdfddffdf	fddfddfd	erdfddfdewr@lawfirm.com	f	2026-05-06 13:20:42.4266+05:30	820579bf-7d1b-4962-9eb3-426df0ab292a	advocate	4343432432	\N								\N	\N			f	f	f	t	2026-05-06 13:20:42.847393+05:30	2026-05-06 13:20:42.863293+05:30	\N	t	6ae6b893-969f-432d-a7f4-62e5f14af2d9		\N	\N	INR	\N
pbkdf2_sha256$600000$KE4CnLR0LJfDhzGXwqOODW$EOqSlFAQutrPODwWByjJqILumXk8DW8PxsLaRhMCXnc=	\N	f	gdfgd@fgcx.fj	fdggd	dgd	gdfgd@fgcx.fj	f	2026-05-06 13:47:38.237808+05:30	3c2bbe9e-2cb3-448f-b108-76376575b6af	advocate	3232355456	\N								\N	\N			f	f	f	t	2026-05-06 13:47:38.977797+05:30	2026-05-06 13:47:39.00491+05:30	\N	t	9b2a3376-624e-4aff-8c05-746491e1c0fb		\N	\N	INR	\N
pbkdf2_sha256$600000$QrHoOru9nCOX5e2W2A9wlr$BguIdIK9w8xdkrtodYlKel6F7rzma2JpUG7g/NPy08g=	\N	f	para@gmail.com	Shammy	Rao	para@gmail.com	f	2026-05-06 09:49:37.787875+05:30	66a74a9e-7334-49fb-bfb0-15d9bf2df9f0	paralegal	4343434343	\N								\N	\N			f	f	f	t	2026-05-06 09:49:38.439011+05:30	2026-05-06 10:00:13.215779+05:30	2026-05-06 10:00:13.215483+05:30	t	eb995188-6dfb-4eba-9425-930f18d36d7f		\N	\N	INR	\N
pbkdf2_sha256$600000$vlQK45EsgPcYgL8lMvlr77$LyU35ljzx+gDBxpSB+8dcTGHrx2PjrUvxnhk/usKI0I=	\N	f	shsh@gmail.com	fdhsadhg	bvcbnv	shsh@gmail.com	f	2026-05-06 10:05:12.71666+05:30	2403e43f-02f7-46a2-ae48-253ca3dcb43d	paralegal	43243243	\N								\N	\N			f	f	f	t	2026-05-06 10:05:13.136288+05:30	2026-05-06 10:05:13.1363+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$VNHoYTmKTrxgIsB8mUjvaV$5THX0AB2H6CAiP8WTbMVf9YeTli+IDqJCJRUarNsPb4=	\N	f	gshdfhsg@gmail.com	efdsdg	xcxzc	gshdfhsg@gmail.com	f	2026-05-06 14:03:04.447773+05:30	f0959cfe-9124-404a-8fb0-c89330cdd248	client	9876549876	2026-05-07	M	xcxzczc		Qobustan	Gobustan District	Azerbaijan	3322	\N	\N			t	f	f	t	2026-05-06 14:03:04.939765+05:30	2026-05-06 14:03:04.939777+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$t81csfTk0XiUtMdjpTfH80$ixcc6pWX5+XQ6YGpLeCDc5wYH3lb2PYdM1u4fwcmbd0=	\N	f	www.ramakantreddy@gmail.com	Ramakant	Reddy	www.ramakantreddy@gmail.com	f	2026-05-06 12:07:32.100561+05:30	e37adccf-9b47-46eb-be62-374d54dbd491	client	5647002388	1991-05-23	M	Gandhi Nagar street-13		Hyderabad	Telangana	India	040	\N	\N			f	f	f	t	2026-05-06 12:07:32.887937+05:30	2026-05-06 12:07:32.887953+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$6xEOupG4HpcfOtsWqFU8Jc$iUQGa2jOXAO5M/6Y5M6tbyOvnEZRMlUbinRM44zQ4OY=	\N	f	ramakantreddy90@gmail.com	Ramakant	Reddy	ramakantreddy90@gmail.com	f	2026-05-06 12:19:21.868678+05:30	e9a3cd06-bc4a-4a24-91c2-f254beef3f39	client	7645008239	1990-05-23	M	Gandhi Nagar street-4		Hyderabad	Telangana	India	040	\N	\N			f	f	f	t	2026-05-06 12:19:22.413956+05:30	2026-05-06 12:19:22.413975+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$LgOKfDZhumRqzbBo6xhKEI$RaQO9g/x2rAtRtYYkg9plwDgRsOS3yLEaovoKCx9OR0=	\N	f	reddyramakant@gmail.com	Ramakant	Reddy	reddyramakant@gmail.com	f	2026-05-06 12:23:17.822816+05:30	c551fe95-428c-4435-96ce-2a87f4b46064	super_admin	9750023459	1990-05-23	M	Gandhi Nagar street-4		Hyderabad	Telangana	India	040	\N	\N			f	f	f	t	2026-05-06 12:23:18.241575+05:30	2026-05-06 12:23:18.241586+05:30	\N	t	afd98f7d-dd3d-47b5-a534-e535db042557		\N	\N	INR	\N
pbkdf2_sha256$600000$QbO49eMlS8dZEGWA7P5oyi$OdHygrzfb7rNNtdh8jxfwq5u8lIEhUwTTG5FC0oWCo4=	\N	f	ADQEQ@EFF.FDSFDSF	ASDSADA	DASDAD	ADQEQ@eff.fdsfdsf	f	2026-05-06 15:41:31.629509+05:30	3fb6fabb-c535-4bda-a1f0-14a7d0685b17	advocate	3456785432	\N								\N	\N			f	f	f	t	2026-05-06 15:41:32.035346+05:30	2026-05-06 15:41:32.056154+05:30	\N	t	9b2a3376-624e-4aff-8c05-746491e1c0fb		\N	\N	INR	\N
pbkdf2_sha256$600000$tZJb8d7BbfxHVYSpCyVcsd$uj2c+gP+nV6Fla7MV6fkVFdcg6i/c+6lvH9x0a6qZhQ=	\N	f	gdfssdf@gmail.com	dsd	dsds	gdfssdf@gmail.com	f	2026-05-06 14:12:47.79988+05:30	4ae22c78-372f-436d-9f33-19480c3b3482	client	9898769899	2026-05-07	M	sdsadsad		Charnwood	Australian Capital Territory	Australia	32234	\N	\N			t	f	f	t	2026-05-06 14:12:48.24609+05:30	2026-05-06 14:44:50.9407+05:30	2026-05-06 14:44:50.940335+05:30	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$O35r1TlX7Kz51URyHLyUKH$6Cxp23xaAzH4h1F7t2diIZmxPzuxfwP18EPDJMR216I=	\N	f	tereyrer@gmail.com	sghdfs	xcxcx	tereyrer@gmail.com	f	2026-05-06 15:04:19.091999+05:30	98058847-547b-44d1-829f-abeeb12c57cb	client	4343434387	2026-05-06	M	dfdsfdfd		Fizuli	Fizuli District	Azerbaijan	43	\N	\N			t	f	f	t	2026-05-06 15:04:19.522581+05:30	2026-05-06 15:04:19.522594+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$pnO51h7ck3JPyektLHmYI3$iGbb7bd6X/Uh116owOedB31Lgfx+iFlg7pF9Fl9CluE=	\N	f	fdsafas@fgzfg.fdsfsa	fgvzv	xcvxczv	fdsafas@fgzfg.fdsfsa	f	2026-05-06 15:42:01.806211+05:30	1ba45842-9737-4c7b-83d9-4f957048b574	advocate	7654345678	\N								\N	\N			f	f	f	t	2026-05-06 15:42:02.240241+05:30	2026-05-06 15:42:02.255356+05:30	\N	t	9b2a3376-624e-4aff-8c05-746491e1c0fb		\N	\N	INR	\N
pbkdf2_sha256$600000$BtFLAYLU1ZHw6cislo4IT8$2uN7+4HWBi3bXw0qQT9WO0kKqrarQw+xbqbSqB0mSkA=	\N	f	gdf@gmail.com	4545	4545	gdf@gmail.com	f	2026-05-06 15:50:48.281125+05:30	d99be6c0-1d66-430e-bed8-c9d3f86732ab	paralegal	4545455	\N								\N	\N			f	f	f	t	2026-05-06 15:50:48.709473+05:30	2026-05-06 15:50:48.709484+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$Nzjg5GRjizi2XCP5fd4b3b$RWbPVe1XYSSnA0xfjOpZFeICeq08ScuOm7mn5rZBWBQ=	\N	f	65443@gmail.com	ewedw	cxc	65443@gmail.com	f	2026-05-06 15:19:37.815114+05:30	115b1e64-92b3-452d-9279-99dbb7911593	advocate	9898985675	2026-05-06	M	fgdjfdjfj		Edelstal	Burgenland	Austria	454346	\N	\N	4555365		t	f	f	t	2026-05-06 15:19:38.22609+05:30	2026-05-06 15:19:38.226105+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$4Fg1IKdtfEHfChnZU1Huyu$GRbS+SUsmTSg1aIz6Dnxx5Gnh6qQxN4vgfrGLbywIxw=	\N	f	dfsfdsf@gmail.com	sgdfghs	xcxcc	dfsfdsf@gmail.com	f	2026-05-06 15:32:00.551178+05:30	33c21527-b152-48ea-af18-1b73e0301e6c	super_admin	9988998899	2026-05-06	F	dfsdfsf		Qobustan	Gobustan District	Azerbaijan	3222	\N	\N			t	f	f	t	2026-05-06 15:32:00.961902+05:30	2026-07-15 11:11:15.545032+05:30	2026-07-15 11:11:15.544846+05:30	t	58826cf1-716f-4a46-9cd6-bbb0277022bc		\N	\N	INR	\N
	\N	f	cxcx@gmail.com	gfhhdf	xcx	cxcx@gmail.com	f	2026-05-06 15:20:58.654315+05:30	7087c792-34a2-4e9a-ae40-5b45f3e6c50a	client	5435435435	\N								\N	\N			f	f	f	t	2026-05-06 15:20:58.655096+05:30	2026-05-06 15:20:58.655109+05:30	\N	f	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$79FYWQQ0pAiuXF3aa4sTMM$JbnptX10ECxQP8GqpzrzzLjbrJDuS65wnH2e5khban8=	\N	f	sdsdsds@gmail.com	edsadas	sdsd	sdsdsds@gmail.com	f	2026-05-06 14:04:27.95033+05:30	dd4f0cba-8b3b-4d24-9601-0ef0eae3eda6	client	9876598789	2026-05-09	M	sdsd		Goranboy	Goranboy District	Azerbaijan	342432	\N	\N			t	f	f	t	2026-05-06 14:04:28.356207+05:30	2026-05-18 11:50:30.661941+05:30	2026-05-18 11:50:30.661729+05:30	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$AAuV5lbZNCRkhiVpfwzSGU$ZK1Yj1uxLtMfnxR/k0YNLG3xI6kQrF2LjNTKpTeSn5o=	\N	f	the@gmail.com	Shradha	gfdg	the@gmail.com	f	2026-05-06 16:05:45.121377+05:30	f3e8aca7-c948-4b11-bdb6-12b319bcc6b8	advocate	9898989876	2026-05-06	F	kalinga vihar		YanCheng	Jiangsu	China	4335	\N	\N	5623453		t	f	f	t	2026-05-06 16:05:45.7245+05:30	2026-05-08 09:40:26.455821+05:30	2026-05-08 09:40:26.455597+05:30	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$p5Buc0sJJTpuFVdaPfF0YX$5kSoZtmbyudAozIx0v7zh7XAU9WGnIGbm9pFTS2ZeYQ=	\N	f	746d@gmail.com	fdd	dfdd	746d@gmail.com	f	2026-05-08 09:42:04.050484+05:30	30629b8e-eaf6-4612-8e7c-d487fcb0ab11	advocate	8888888888	2026-05-08	M	teyfry			Green Turtle Cay	The Bahamas	433	\N	\N	6546		t	f	f	t	2026-05-08 09:42:04.576902+05:30	2026-05-08 09:48:52.549045+05:30	2026-05-08 09:48:52.54884+05:30	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$W6GsrU2xSb452vktawzHfT$o+w4rwJa05T/Vm+n43ufAYJIH2H9IesHfjXm4DZn94U=	\N	f	erewr@lawfirm.com	erer	rerer	erewr@lawfirm.com	f	2026-05-06 13:18:00.964674+05:30	e3c89f4a-264a-4d7f-9625-d7f57e7f2c4f	paralegal	3453535	\N								\N	\N			f	f	f	t	2026-05-06 13:18:01.611029+05:30	2026-07-15 11:11:38.958445+05:30	2026-07-15 11:11:38.958263+05:30	t	6ae6b893-969f-432d-a7f4-62e5f14af2d9		\N	\N	INR	\N
pbkdf2_sha256$600000$ExLIgO4XNnwdYPBWfLqUXX$NeSqxWFiIHLct5dyeSTS9/t+5OmRjw2bAmr/f9+0f2c=	\N	f	sds@gmail.com	sds	dsdsd	sds@gmail.com	f	2026-05-08 10:38:55.960986+05:30	905a0710-c0bc-4ff4-8540-f8fd24174a98	client	+917888566160	\N								\N	\N			f	f	f	t	2026-05-08 10:38:56.373284+05:30	2026-05-08 10:38:56.373297+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$v5ch5el9bhbYYbxNhEuDeV$wSx5ezaYe0sgTOKI5XD8BDzN08ahBIfWtv9TKQUvXVI=	\N	f	b12345@gmail.com	Bibhuprasad	Mahakud	b12345@gmail.com	f	2026-05-08 00:30:25.797977+05:30	d33932c9-8a33-4bb9-a5cb-38079d242d4e	advocate	1234567891	2011-05-07	M	HIG-306		Bhubaneshwar	Odisha	India	751003	\N	\N	BIBHU/123/342		t	f	f	t	2026-05-08 00:30:26.458851+05:30	2026-05-08 17:57:51.827358+05:30	2026-05-08 17:57:51.827109+05:30	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$WOFfPjkATcCdfUIV5FhaqP$MRsCKCrdZoIBEreCJ7zn2resGanq67jY6+qGmlGT2F8=	\N	f	aashutosh@gmail.com	Santosh	Biswal	aashutosh@gmail.com	f	2026-04-21 11:43:37.649517+05:30	d649f2d2-bccb-48a8-9db8-d851ff2aa037	super_admin	1232453645	2026-04-21	M	Kalinga Vihar		Khallikot	Odisha	India	751019	\N	\N			f	f	f	t	2026-04-21 11:43:38.073499+05:30	2026-07-15 11:10:24.436769+05:30	2026-07-15 11:10:24.436549+05:30	t	5c0747c8-99d2-4104-9fb4-97dd465fdaae		\N	\N	INR	\N
pbkdf2_sha256$600000$P4L5wxQyOF7ePB5tAsKR6a$//Mvrd5nNPvCoZDsC+R6cuT8ltPGqCJ0R3rZyMpM7BY=	\N	f	ganesh.panda@gmail.com	Ganesh	Panda	ganesh.panda@gmail.com	f	2026-05-08 17:50:10.985215+05:30	5185cd8b-45df-424d-9b65-e1473ab03301	client	1234567892	\N								\N	\N			f	f	f	t	2026-05-08 17:50:11.774573+05:30	2026-05-08 17:50:11.774592+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$JoX7A3Offz3qJ4V5GvSqgK$pdH5TS/sSAxOmqCwS9+3AzaIIfmzdYecKtSRWSlmbpo=	\N	f	subratadmin@saxena.com	subrat admin 	saxena lawfirm	subratadmin@saxena.com	f	2026-05-09 13:45:09.033213+05:30	cfea0561-f92d-4eb8-90ff-7574f812dc63	admin	8989565623	\N								\N	\N			f	f	f	t	2026-05-09 13:45:09.850798+05:30	2026-05-11 17:12:45.11148+05:30	2026-05-11 17:12:45.111246+05:30	t	9b2a3376-624e-4aff-8c05-746491e1c0fb		\N	\N	INR	\N
pbkdf2_sha256$600000$eVGdhTTmT4ZTlXrTQuKu2X$GNbOlii7hFkHOyz5hbGBVBeIjala2fbZUWPBHe65szA=	\N	f	raisina.cuttack@gmail.com	Sanjay	Mohaptra	raisina.cuttack@gmail.com	f	2026-05-11 13:03:56.624936+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	advocate	9861010656	1970-02-11	M	Sector- 9 Cuttack		Cuttack	Odisha	India	753014	\N	\N	65346		t	f	f	t	2026-05-11 13:03:57.038036+05:30	2026-07-15 11:10:32.304136+05:30	2026-07-15 11:10:32.303969+05:30	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$KhhxCfSekCPoYE4FxhbPTA$k2RXU3QtzpDAH/HtL3MH7+PGtsxL3J0EMD62F5Sqsxw=	\N	f	shr@gmail.com	etrb yhdi	sha hoo	shr@gmail.com	f	2026-05-11 10:17:03.053167+05:30	3411bfbd-d965-4897-a6ee-aa1a2fe06039	client	564636	\N								\N	\N			f	f	f	t	2026-05-11 10:17:03.648914+05:30	2026-05-11 10:17:03.648948+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$zfZ7au0CWTPXx6133twNtZ$mWChzVqej8g7PnNgrchpZ4+sauGyfTmH1ZeeqmMbdFc=	\N	f	www.kanhakrishna@gmail.com	Kanha	Krishna	www.kanhakrishna@gmail.com	f	2026-05-14 14:51:54.371506+05:30	425dedd8-23d0-4248-8327-8da324819df0	advocate	8897520003	1992-06-02	M	SCS College, Puri		Puri	Odisha	India	752001	\N	\N	24326KVR08		t	f	f	t	2026-05-14 14:51:54.774655+05:30	2026-05-14 14:51:54.774665+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$1200000$kryKvgp1KW1B6Kv592V2xE$QAvW2uK3LGpjYHiAfWAC8LetX4lUsoPEJjCGEPY7/BE=	\N	f	firmowner1@lawfirm.com	Main Super Admin	1	firmowner1@lawfirm.com	f	2026-04-09 12:39:42.785574+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	super_admin	0987654321	2026-04-09	F	Pl		Bhubaneshwar	OR	IN	751003	112233445565	\N		Odisha	f	f	f	t	2026-04-09 12:39:43.371759+05:30	2026-07-31 11:01:03.742183+05:30	2026-07-31 11:01:03.742035+05:30	t	6ae6b893-969f-432d-a7f4-62e5f14af2d9	profile_images/download.jpeg	\N	\N	INR	\N
pbkdf2_sha256$600000$PDYRcGVqGyeLfwai7ZDNEo$KRntksJd61qMGU9Uaf1xXKPWdCozkQDnbcc3feyYSmQ=	\N	f	chakradharpanda72@gmail.com	Chakradhar	Panda	chakradharpanda72@gmail.com	f	2026-05-11 13:23:57.935481+05:30	1932bab4-adc6-4085-8150-aaabf361e3e8	advocate	7873099889	1972-05-24	M	Kanan vihar sector-2 BBSR		Bhubaneshwar	Odisha	India	751024	\N	\N	25367500		t	f	f	t	2026-05-11 13:23:58.683291+05:30	2026-05-11 13:23:58.683308+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$BeeQbiNRfY5zsufZIJ4dpx$I1zYZ2tXZxv9v4Ju2s6604gaK9120G7n6z9w2q00hjw=	\N	f	akash@gmail.com	Akash	Das	akash@gmail.com	f	2026-05-11 13:07:48.504087+05:30	f55a587a-2465-41fc-aa12-3975a18b21fb	client	9898769898	\N								\N	\N			f	f	f	t	2026-05-11 13:07:48.941763+05:30	2026-05-12 16:50:24.032751+05:30	2026-05-12 16:50:24.032507+05:30	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$sSHqNAYNn8VPQclZ3Pgooq$oy7BAdV4hFr20Uz5VzbBcF0D0ACGJUCD+n2IMcvBnYM=	\N	f	sanjaymohapatra90@gmail.com	Sanjay	Mohapatra	sanjaymohapatra90@gmail.com	f	2026-05-13 11:45:53.766585+05:30	2264d078-daf3-456e-be50-112c6ca1a3f4	client	9458006789	1990-04-22	M	CDA sector-2 Cuttack		Cuttack	Odisha	India	753001	\N	\N			t	f	f	t	2026-05-13 11:45:54.343404+05:30	2026-05-13 11:45:54.343415+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$Suudjg51dRKjrCzVjmGVYf$4cnVH626IkGvDDchy2Egj4Erfe1vrhKsKqWG/3cNgng=	\N	f	chakradhar72@gmail.com	Chakradhar	Panda	chakradhar72@gmail.com	f	2026-05-11 13:19:48.779159+05:30	ead81aad-44c7-4780-9afe-3a8501fac43e	client	7873099888	1972-05-24	M	Kanan vihar sector-2 BBSR		Bhubaneshwar	Odisha	India	751024	\N	\N			t	f	f	t	2026-05-11 13:19:49.19491+05:30	2026-05-11 13:46:21.645351+05:30	2026-05-11 13:46:21.645083+05:30	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$7UWcDjbtvvesrn7tBLZLMo$+973G6eb+uQboE4MOqsfeV5rwQOK7dgRmY4gSyf5mMQ=	\N	f	www.chakradharpanda@gmail.com	Chakradhar	Panda	www.chakradharpanda@gmail.com	f	2026-05-11 15:08:37.455761+05:30	6b1a8158-aac2-45be-90c2-c21769f73f7b	super_admin	7873099999	1972-05-24	M	Kanan vihar sector-2 BBSR		Bhubaneshwar	Odisha	India	751024	\N	\N			t	f	f	t	2026-05-11 15:08:37.93257+05:30	2026-05-11 15:08:37.932581+05:30	\N	t	ff66fc5d-803a-4073-8300-96a29f497ce1		\N	\N	INR	\N
pbkdf2_sha256$600000$H4MzTfCYcn9eLAaQkzGisP$zFln6KgQsygeRKLYeVgY7+bwudZEY2UvRhAaO+JYkvQ=	\N	f	www.minakhrout@gmail.com	Minakhi	Rout	www.minakhrout@gmail.com	f	2026-05-18 14:25:14.719431+05:30	75b53f3e-46f8-45a7-ab94-437b13830279	client	9861108580	1983-06-03	M	Kalinga Nagar BBSR		Bhubaneshwar	Odisha	India	751024	\N	\N			t	f	f	t	2026-05-18 14:25:15.128625+05:30	2026-05-18 14:25:15.128635+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$DaC6xxgP4Kw7jMjg73t76m$DN+bpg8rO+9n7iz1+cI++Zquv1gNhAmHxSJfKbo8Grk=	\N	f	Minakhi83@gmail.com	Minakhi	Rout	Minakhi83@gmail.com	f	2026-05-18 16:01:17.284922+05:30	e720e85d-111b-49cc-b86a-1aec508dc7a1	advocate	9861208580	1983-06-03	M	Kalinga Nagar BBSR		Bhubaneshwar	Odisha	India	751024	\N	\N	24326KVR07		t	f	f	t	2026-05-18 16:01:17.70529+05:30	2026-05-18 16:01:17.705305+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$YaLIBliKvAnj9Ky3Rdywaz$jF9TJlI2qhmLh3DkwY+7RMG1RLv0rmebPKK3uD5/fbQ=	\N	f	routminakhi@gmail.com	Minakhi	Rout	routminakhi@gmail.com	f	2026-05-18 16:56:49.331038+05:30	6d3d81da-93ab-4617-a05b-72948bad95b1	super_admin	9861108590	1983-06-03	M	Kalinga Nagar BBSR		Bhubaneshwar	Odisha	India	751024	\N	\N			t	f	f	t	2026-05-18 16:56:49.736876+05:30	2026-05-18 16:56:49.736885+05:30	\N	t	8ac8fe12-9187-4ab5-a204-7801effe716b		\N	\N	INR	\N
pbkdf2_sha256$600000$bKBwoJFC2gSCZ9qzdZcq0t$uEw2MMMeqpZE9j1oTiU7vHMLFNlVCrSZCph0tvjHUQE=	\N	f	krishnakanha92@gmail.com	Kanha	Krishna	krishnakanha92@gmail.com	f	2026-05-14 12:41:42.15827+05:30	70af14e0-742c-47a3-a450-78fdecad1399	client	7321000589	1992-06-02	M	SCS College Puri		Puri	Odisha	India	752001	\N	\N			t	f	f	t	2026-05-14 12:41:42.594548+05:30	2026-05-14 12:41:42.594561+05:30	\N	t	\N		\N	\N	INR	\N
pbkdf2_sha256$600000$fV66yZWV2WTx3KAgYt482F$n8fuMJ6shk/AGniouoborXsbjblcT+3srXPR2CeN9a8=	\N	f	subratbarik2003@gmail.com	Subrat	Barik	subratbarik2003@gmail.com	f	2026-04-09 13:07:01.189589+05:30	c75be9a0-e6bc-49d8-b024-875db6cb4911	super_admin	6655443322	2026-04-11	M	Plot-84,lane-3,road-2		Bhubaneshwar	Odisha	India	751003	\N	\N			f	t	f	t	2026-04-09 13:07:01.712838+05:30	2026-08-05 13:23:56.315556+05:30	2026-08-05 13:23:56.315473+05:30	t	e484ef42-c53a-4d91-99c9-a5306d58c639		\N	\N	INR	\N
pbkdf2_sha256$1200000$0njjh9bLIs2vn2e3uiIi7x$1v40Ef6bsERzeNcTonCEs3OG+whcbum955nxGg2kDfI=	\N	t	admin_owner	Anthem	Technologies	admin@antlegal.com	t	2026-04-08 16:23:22.4994+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	platform_owner	7485965225	2026-04-01	M	Plot-84,lane-3,road-2		Bhubaneshwar	OR	IN	751003	254432132321	\N		Odisha	t	f	f	t	2026-04-08 16:23:22.969879+05:30	2026-07-20 18:22:38.872553+05:30	2026-07-20 18:22:38.872388+05:30	f	\N		\N	\N	INR	\N
pbkdf2_sha256$1200000$Ny8BNVM6Qkmy9x0kWHTtwF$aF2ks9wcHwTkJMUAp7IOKR3HFEnSeD7fx5d84je/W7Q=	\N	f	testadvocate2@gmail.com	test	advocate 2	testadvocate2@gmail.com	f	2026-04-13 16:11:34.087884+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	advocate	8744444444	2026-04-10	M				Odisha	India		594622322647	GBPPB0080P		Odisha	f	f	f	t	2026-04-13 16:11:34.534798+05:30	2026-07-21 10:40:45.220242+05:30	2026-07-21 10:40:45.220134+05:30	t	6ae6b893-969f-432d-a7f4-62e5f14af2d9	profile_images/download.png	\N	\N	INR	\N
	\N	f	testclient2@gmail.com	test	client 2	testclient2@gmail.com	f	2026-08-03 17:39:47.477501+05:30	d29c83c4-9330-4c97-a169-bff037ffbd36	client	7895588778	\N								\N	\N			f	f	f	t	2026-08-03 17:39:47.477755+05:30	2026-08-03 17:39:47.477759+05:30	\N	f	\N		\N	\N	INR	\N
pbkdf2_sha256$1200000$UsSlfzkegoFLTXr42S3GA2$ROBfYvD1ApLqnyBLUmHu0TaVWx2XV1LUFaPDPZlP1OU=	\N	f	testclient@gmail.com	test	client	testclient@gmail.com	f	2026-08-03 17:31:56.59478+05:30	09e41654-0c15-43f0-95a9-3d2f6a541ef4	client	+774411225588	2026-07-29	M							\N	\N			f	f	f	t	2026-08-03 17:31:56.869388+05:30	2026-08-03 18:13:29.406656+05:30	\N	t	\N	profile_images/DiracAI_Signature2_1.png	\N	\N	INR	\N
pbkdf2_sha256$1200000$ocKzg2HViOm5HAst3qz68W$ADXGuW+rnhOchPYD33UyRuGdZKvyQRovhRyUYaac9ik=	\N	f	unverified123@example.com	Test	Advo	unverified123@example.com	f	2026-08-03 13:11:14.416515+05:30	9eea803b-c301-41db-803d-6bdfb6278e89	advocate	8847806814	1989-07-06	M	Plot-84,lane-3,road-2		Bhubaneshwar	Odisha	India	751003	\N	\N	NEW12345		t	t	f	t	2026-08-03 13:11:14.696646+05:30	2026-08-05 16:56:34.869148+05:30	2026-08-05 15:26:07.619205+05:30	t	\N		\N	\N	INR	\N
pbkdf2_sha256$1200000$CxIJNeHG35rcDCGH6FoK3y$Dh5CNXJu/jmxkIpansPX5NeOcuD+tzqAxErhfVtDb3M=	\N	f	advo1123@gmail.com	john	Deo	advo1123@gmail.com	f	2026-04-20 09:42:02.154157+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	advocate	8847806811	2026-05-06	M					India		323235454621	BHDFHF3543	yur7567654	Odisha	t	t	f	t	2026-04-20 09:42:02.78083+05:30	2026-08-05 17:15:47.256554+05:30	2026-08-05 16:51:23.25222+05:30	t	9b2a3376-624e-4aff-8c05-746491e1c0fb	profile_images/pooja-removebg-preview.png	\N	\N	INR	\N
\.


--
-- Data for Name: accounts_customuser_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_customuser_groups (id, customuser_id, group_id) FROM stdin;
\.


--
-- Data for Name: accounts_customuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_customuser_user_permissions (id, customuser_id, permission_id) FROM stdin;
\.


--
-- Data for Name: accounts_firmjoinlink; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_firmjoinlink (id, user_type, is_active, max_uses, usage_count, created_at, expires_at, created_by_id, firm_id) FROM stdin;
c353b552-6c0d-4925-b4d0-d805b8afbbf5	admin	t	0	0	2026-04-17 12:14:54.501203+05:30	\N	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9
6b6f4ad8-ffa1-40d6-8168-8f85269df1d6	advocate	t	0	0	2026-04-17 12:15:13.480616+05:30	\N	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9
c6eca3c3-a0c3-47a9-a4e5-cc122195b9c6	paralegal	t	0	0	2026-04-17 12:15:20.990287+05:30	\N	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9
7b804155-a2cc-4495-9044-4c1cf9700be0	client	t	0	0	2026-04-17 12:21:04.196719+05:30	\N	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9
ba54ee03-e2bc-46ea-b927-64462d079926	client	t	0	0	2026-04-17 12:22:47.813939+05:30	\N	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9
d2346fa2-9637-4434-9bf0-6ee06b48efa0	advocate	t	0	0	2026-04-17 12:22:52.484297+05:30	\N	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9
823d0eda-0a27-4306-827e-b54f4712e724	advocate	t	0	0	2026-04-17 12:26:14.658602+05:30	\N	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9
57aece9d-d858-4537-b35a-d05583819530	admin	t	0	0	2026-04-17 12:53:10.687939+05:30	\N	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9
5dd8416a-75a0-4be2-91ea-a8c0e45771e3	admin	t	0	0	2026-04-17 12:53:19.265713+05:30	\N	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9
137b0707-8da0-4acc-a76e-717d21dd31d5	admin	t	0	1	2026-04-17 12:46:09.674584+05:30	\N	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9
57456feb-9ce9-45e0-a1a6-8d7e44932572	advocate	t	0	1	2026-04-17 13:30:39.999885+05:30	\N	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9
6d78f983-1d3b-4f16-b33a-d19d46f23fca	client	t	0	1	2026-04-17 15:34:36.475185+05:30	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb
7cd9a8ce-e81f-4b99-9ad6-9c0693c47ae3	advocate	t	0	1	2026-04-17 15:39:10.688954+05:30	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb
b420171b-c588-421e-8c12-339e0ad9649a	client	t	0	0	2026-04-17 17:03:39.323746+05:30	\N	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9
9e9ef733-940b-426a-8bda-101ddfd6faf6	advocate	t	0	1	2026-04-17 17:03:58.231985+05:30	\N	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9
d3ee0847-e530-46f5-84c4-58a1a4f4ec5a	advocate	t	0	0	2026-04-17 17:09:39.959953+05:30	\N	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9
7315af26-8095-49b8-b69e-90651003b604	client	t	0	1	2026-04-17 17:09:45.035845+05:30	\N	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9
46d5c2ff-a281-4196-8782-c25f77964b37	advocate	t	0	1	2026-04-17 18:29:40.328543+05:30	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb
5368cf07-72ea-4282-a151-c68bb5e698f0	client	t	0	0	2026-04-17 18:34:26.134889+05:30	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb
b347d024-1796-4fa1-8d28-478a0967cf52	advocate	t	0	1	2026-04-18 12:20:09.344683+05:30	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb
b834bd8c-0e68-4639-95a9-98d876165e3a	advocate	t	0	0	2026-04-20 07:59:32.362167+05:30	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb
8e0b0214-dd50-42cc-b5af-5cd038a125fe	advocate	t	0	1	2026-04-20 09:40:58.759017+05:30	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb
56db4424-3794-4790-8fb8-08ed48f16a44	client	t	0	0	2026-04-20 09:50:41.098424+05:30	\N	9a3b9470-80d4-444e-a370-55fd04bf185a	9b2a3376-624e-4aff-8c05-746491e1c0fb
170e10f7-9b27-4c0d-a60e-47e8292b4262	client	t	0	0	2026-04-20 09:55:56.271116+05:30	\N	9a3b9470-80d4-444e-a370-55fd04bf185a	9b2a3376-624e-4aff-8c05-746491e1c0fb
abebd256-ab39-4ea5-9fab-75623bde7114	client	t	0	0	2026-04-20 09:56:03.486029+05:30	\N	9a3b9470-80d4-444e-a370-55fd04bf185a	9b2a3376-624e-4aff-8c05-746491e1c0fb
6b84e569-e02f-4c96-90cc-176893502d34	client	t	0	0	2026-04-20 10:06:15.575405+05:30	\N	9a3b9470-80d4-444e-a370-55fd04bf185a	9b2a3376-624e-4aff-8c05-746491e1c0fb
3875fff8-e31a-4352-808c-d7ca228122e5	client	t	0	1	2026-04-20 10:18:19.83903+05:30	\N	9a3b9470-80d4-444e-a370-55fd04bf185a	9b2a3376-624e-4aff-8c05-746491e1c0fb
f0956898-6070-462c-ba0d-7595b54d3719	admin	t	0	0	2026-04-20 16:09:57.693635+05:30	\N	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9
ebc0c9cc-7787-4faa-8bc3-d453d38b615c	admin	t	0	0	2026-04-20 16:22:39.799077+05:30	\N	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9
057ad3d4-eb56-4d97-b26c-a9ca1c0d6ab3	client	t	0	1	2026-04-21 10:00:11.581764+05:30	\N	70dd5f3f-412e-4816-a258-6fc40c025bde	eb995188-6dfb-4eba-9425-930f18d36d7f
b558d017-5c33-4f2a-8ad4-08fdefa9eb75	advocate	t	0	1	2026-04-21 10:14:38.207928+05:30	\N	70dd5f3f-412e-4816-a258-6fc40c025bde	eb995188-6dfb-4eba-9425-930f18d36d7f
f8128f4d-d058-4698-8882-fb14a021a518	client	t	0	1	2026-04-21 11:06:08.833856+05:30	\N	c1270be1-13d5-476e-a2cb-01d93da3816c	eb995188-6dfb-4eba-9425-930f18d36d7f
aacbd8f1-3744-46aa-b7bb-7004bc2f3916	client	t	0	1	2026-04-21 11:44:35.528271+05:30	\N	d649f2d2-bccb-48a8-9db8-d851ff2aa037	5c0747c8-99d2-4104-9fb4-97dd465fdaae
7e3c2758-ef4c-4ef9-ad03-802c29273a76	advocate	t	0	0	2026-04-21 11:48:32.603237+05:30	\N	d649f2d2-bccb-48a8-9db8-d851ff2aa037	5c0747c8-99d2-4104-9fb4-97dd465fdaae
55c65c71-7b7a-4a66-b9c5-1a561c9ba997	advocate	t	0	1	2026-04-21 11:49:02.258246+05:30	\N	d649f2d2-bccb-48a8-9db8-d851ff2aa037	5c0747c8-99d2-4104-9fb4-97dd465fdaae
ce3753b4-bd2e-4c9f-b892-234375713201	advocate	t	0	0	2026-04-29 15:38:36.835655+05:30	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb
4bcba36c-01c6-46bb-b114-5ec8937a9eab	advocate	t	0	0	2026-04-29 15:38:39.914294+05:30	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb
c454c1fa-67e4-47ec-aaa2-0d32a81f5af8	client	t	0	0	2026-05-08 06:08:24.073821+05:30	\N	d33932c9-8a33-4bb9-a5cb-38079d242d4e	\N
992f85bd-66db-44c0-8c9e-050709aab0b3	client	t	0	0	2026-05-08 09:40:39.119915+05:30	\N	f3e8aca7-c948-4b11-bdb6-12b319bcc6b8	\N
6573ccf6-55d5-4909-8d9a-92fd81ca7434	client	t	0	0	2026-05-08 09:42:18.834826+05:30	\N	30629b8e-eaf6-4612-8e7c-d487fcb0ab11	\N
0174abe4-6582-4701-b0e7-ce820e1f1b95	client	t	0	2	2026-05-08 09:49:24.461032+05:30	\N	30629b8e-eaf6-4612-8e7c-d487fcb0ab11	\N
c2599cb2-feb7-43f2-90fe-2baf90190589	client	t	0	0	2026-05-08 13:17:03.105659+05:30	\N	d33932c9-8a33-4bb9-a5cb-38079d242d4e	\N
63896675-b713-431f-b90b-8c4e169b2370	client	t	0	2	2026-05-08 06:09:38.393917+05:30	\N	d33932c9-8a33-4bb9-a5cb-38079d242d4e	\N
1d24b32d-b334-4cc3-a612-c1995813b95e	client	t	0	1	2026-05-11 13:06:23.569063+05:30	\N	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N
1465274c-0ea6-49d6-9d52-63f0137d039c	client	t	0	0	2026-08-03 17:29:19.426734+05:30	\N	9a3b9470-80d4-444e-a370-55fd04bf185a	9b2a3376-624e-4aff-8c05-746491e1c0fb
f2d7cb44-6f73-4597-9f5e-90655663a70a	client	t	0	1	2026-08-03 17:30:49.888549+05:30	\N	9eea803b-c301-41db-803d-6bdfb6278e89	\N
6272a898-63d9-41db-85dc-3fe7d48eed11	client	t	0	0	2026-08-04 10:15:02.02206+05:30	\N	9a3b9470-80d4-444e-a370-55fd04bf185a	9b2a3376-624e-4aff-8c05-746491e1c0fb
8fef7f6b-93ba-46fe-8c23-f04c3b2c4f58	client	t	0	0	2026-08-04 10:15:10.557554+05:30	\N	9a3b9470-80d4-444e-a370-55fd04bf185a	9b2a3376-624e-4aff-8c05-746491e1c0fb
d836aca5-e4bb-4b90-9511-6963bbca3625	client	t	0	0	2026-08-04 10:15:12.485949+05:30	\N	9a3b9470-80d4-444e-a370-55fd04bf185a	9b2a3376-624e-4aff-8c05-746491e1c0fb
e61cfb7a-7044-45ba-b3db-f746381f9fa7	client	t	0	0	2026-08-04 10:15:17.76802+05:30	\N	9a3b9470-80d4-444e-a370-55fd04bf185a	9b2a3376-624e-4aff-8c05-746491e1c0fb
\.


--
-- Data for Name: accounts_globalconfiguration; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_globalconfiguration (id, is_free_trial_enabled, updated_at, trial_period_days, updated_by_id) FROM stdin;
67199a59-519f-44a0-8962-d86216011627	t	2026-04-24 12:49:06.63792+05:30	30	ce8ce90c-be9b-49de-a959-f8459663593a
\.


--
-- Data for Name: accounts_logincredential; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_logincredential (id, username, phone_otp, phone_otp_created_at, phone_otp_attempts, email_otp, email_otp_created_at, email_otp_attempts, is_phone_otp_verified, is_email_otp_verified, created_at, updated_at, user_id) FROM stdin;
0e84f59b-d291-4b56-9acf-d5d826104282	client1775648759@example.com		\N	0		\N	0	f	f	2026-04-08 17:16:00.618662+05:30	2026-04-08 17:16:00.618677+05:30	17265c17-ad13-4fb7-8b49-cda765078dbb
f6b72180-a1e3-4185-b636-14fd9bc69564	superadmin1775648760@example.com		\N	0		\N	0	f	f	2026-04-08 17:16:01.171402+05:30	2026-04-08 17:16:01.171423+05:30	90547a1f-dc60-4528-b366-bc1e7fdb641e
d3db0745-f16e-4b80-b139-9eb9635c91ab	partner1775648761@example.com		\N	0		\N	0	f	f	2026-04-08 17:16:01.772604+05:30	2026-04-08 17:16:01.77262+05:30	1b509e76-09fb-4ba5-8b33-076ffb82cec0
8754a20b-eb3c-4e60-b228-c7ce9760fd7f	client1775649262@example.com		\N	0		\N	0	f	f	2026-04-08 17:24:22.812025+05:30	2026-04-08 17:24:22.812041+05:30	e95a953e-f5cb-494b-a19d-2ae9c5a9cf0e
678ed8ca-f3c4-4af9-be83-0d08c8461177	firmowner1775649262@example.com		\N	0		\N	0	f	f	2026-04-08 17:24:23.5703+05:30	2026-04-08 17:24:23.570322+05:30	dd72a3e8-c5ff-49f3-a3f0-a01fa656d9f7
0b75ee5e-aedc-4643-b566-81cbb7ad870e	superadmin1775649263@example.com		\N	0		\N	0	f	f	2026-04-08 17:24:24.04057+05:30	2026-04-08 17:24:24.040583+05:30	ac571d9e-2002-401c-9166-2a67254b0117
5e9a30c4-046c-4e34-a4b2-bd26332550e8	partner1775649264@example.com		\N	0		\N	0	f	f	2026-04-08 17:24:24.292042+05:30	2026-04-08 17:24:24.292054+05:30	ed3b65c9-84cc-46a7-b5fe-9b1275bd367d
e36461a8-dbb4-4e7c-932f-1adf766b2dcd	subratbarik200003@gmail.com		\N	0		\N	0	f	f	2026-04-09 09:55:04.330176+05:30	2026-04-09 09:55:04.330196+05:30	23bd6b99-07fb-4ff1-a754-1438cd148b50
2610f1af-7701-486f-b9e2-936db9ec7157	client@lawfirm.com		\N	0		\N	0	f	f	2026-04-09 11:17:23.863403+05:30	2026-04-09 11:17:23.86342+05:30	dcabe26c-3f75-4afe-b1f3-3bec679e557e
1937620e-56ea-4c3b-9955-2d981c00326f	firmowner@lawfirm.com		\N	0		\N	0	f	f	2026-04-09 11:20:57.021656+05:30	2026-04-09 11:20:57.021678+05:30	a527e3db-fe90-4397-a6cd-d5ae9cd1d1e9
bfd75def-4169-4056-a074-42e040a122a3	testadmin@examflow.com		\N	0		\N	0	f	f	2026-04-09 12:19:18.479694+05:30	2026-04-09 12:19:18.479716+05:30	ccf81fd2-cb99-4d5e-943a-5fc6676f0f12
87cbd9cf-5061-4d57-beab-00ba08a10c04	successtest1775717753@lawfirm.com		\N	0		\N	0	f	f	2026-04-09 12:25:54.630858+05:30	2026-04-09 12:25:54.630873+05:30	0761e14b-822b-4e25-b331-1ad7126784ea
69da63e1-498d-4e52-b37e-47523fe63020	firmowner1@lawfirm.com		\N	0		\N	0	f	f	2026-04-09 12:39:43.380858+05:30	2026-04-09 12:39:43.380874+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5
8325597f-d62e-4cda-86e4-4b3dc9af94ed	subratbarik2003@gmail.com		\N	0		\N	0	f	f	2026-04-09 13:07:01.726678+05:30	2026-04-09 13:07:01.726701+05:30	c75be9a0-e6bc-49d8-b024-875db6cb4911
c1e1ddeb-ec0a-4481-9c25-afdcdbffa837	abc@lawfirm.com		\N	0		\N	0	f	f	2026-04-10 11:15:24.771888+05:30	2026-04-10 11:15:24.771902+05:30	47e68f32-76c0-46b8-bfee-1748cee569f6
a22fe379-e118-48f8-b379-bbdc9aef342a	alokbehera407@gmail.com		\N	0		\N	0	f	f	2026-04-10 12:42:32.044468+05:30	2026-04-10 12:42:32.044493+05:30	08124d12-0159-4399-ba52-90f2224ede00
351edf22-3c7d-4c0a-a57f-ef6c4f5ccb5f	bibhu.phy@gmail.com		\N	0		\N	0	f	f	2026-04-10 18:23:17.502925+05:30	2026-04-10 18:23:17.502942+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43
c3f7110d-17b6-48b9-b5ef-fff360017f65	bibhu.phy.m@gmail.com		\N	0		\N	0	f	f	2026-04-10 18:25:50.351697+05:30	2026-04-10 18:25:50.351709+05:30	5c4990c4-5ddb-4031-bc04-785bc086b824
e33c0b97-6871-49f8-bc8f-03070513e97f	client@example.com		\N	0		\N	0	f	f	2026-04-11 11:39:06.502526+05:30	2026-04-11 11:39:06.502542+05:30	813f9eee-e9ae-43b7-967e-6768b7f6747f
66361ab1-11b6-44a9-b947-1093ef63883b	testadmin@lawfirm.com		\N	0		\N	0	f	f	2026-04-11 13:50:43.199294+05:30	2026-04-11 13:50:43.199307+05:30	e71918c8-b14b-4ea8-9608-1a2d9632b1c4
4314b236-4a67-4a31-99da-bc510b93b9a0	testadvocate@lawfirm.com		\N	0		\N	0	f	f	2026-04-11 13:54:09.463916+05:30	2026-04-11 13:54:09.463938+05:30	ad82aa5b-ad99-4007-8b0f-56fedc7f174b
50aca433-9c3d-4813-b54f-29f842cd8779	testparalegal@lawfirm.com		\N	0		\N	0	f	f	2026-04-11 13:58:39.913467+05:30	2026-04-11 13:58:39.913479+05:30	4e1a7020-f5e3-46aa-910c-0892eb73f480
6a0193b6-a57c-4d4c-a3f2-551e46550e87	testclient@lawfirm.com		\N	0		\N	0	f	f	2026-04-11 13:59:43.214577+05:30	2026-04-11 13:59:43.214591+05:30	4966020c-6f87-46bc-9f85-5ed8adfcf4bb
7cebe372-ac50-4bcf-91cb-7a701a5ec2f5	subratbarik203@gmail.com		\N	0		\N	0	f	f	2026-04-11 16:01:33.411507+05:30	2026-04-11 16:01:33.411522+05:30	95e76468-b0fd-4a8c-ab8e-2fd411bb7cc0
015aa32e-f8f0-4e9e-a306-bc434694fe9d	subratbarik23@gmail.com		\N	0		\N	0	f	f	2026-04-11 16:02:27.155895+05:30	2026-04-11 16:02:27.155911+05:30	64e0fdd0-511e-42e9-9e78-990d847cc6d6
62c40963-e542-4e03-ac45-b3633bb9c1ba	subratbarik3@gmail.com		\N	0		\N	0	f	f	2026-04-11 16:20:33.680609+05:30	2026-04-11 16:20:33.680623+05:30	f018d6c3-daf0-4493-805f-300704bb4175
bb7b2b5c-4134-4486-a8dc-5bb1c22dd6b9	subratba03@gmail.com		\N	0		\N	0	f	f	2026-04-11 16:23:54.161217+05:30	2026-04-11 16:23:54.161231+05:30	53fbe468-b315-48f8-bc07-99d8f6ca363e
8d28b256-aad8-4d86-92e1-b9c699f38812	subratbar@gmail.com		\N	0		\N	0	f	f	2026-04-11 18:21:37.167678+05:30	2026-04-11 18:21:37.167693+05:30	3f468d59-6421-43c8-9449-514c2cc42be6
69e2e113-0150-459a-8640-2c27e9a25656	subra@gmail.com		\N	0		\N	0	f	f	2026-04-11 18:28:17.078202+05:30	2026-04-11 18:28:17.078221+05:30	6f92770a-62ce-430d-b7d5-d5f6c27142d2
a7b7a53b-3ef3-4a33-bec9-6a3bcaeb6091	aloktest@gmail.com		\N	0		\N	0	f	f	2026-04-13 13:02:18.818299+05:30	2026-04-13 13:02:18.818324+05:30	43789810-4a0f-4d4c-9ccf-df7a17179191
b06c653a-e2a8-4e0f-bb54-f5a5c90fc4a9	suryapartner@lawfirm.com		\N	0		\N	0	f	f	2026-04-13 13:25:33.011099+05:30	2026-04-13 13:25:33.011116+05:30	6af32917-1514-44a7-a14c-33067278b347
88c3bbb8-fb59-4c20-ad55-4695781c554f	suryapartner@gmail.com		\N	0		\N	0	f	f	2026-04-13 13:51:41.579055+05:30	2026-04-13 13:51:41.579069+05:30	2cc4a3c9-5762-4498-9e20-9a05f330c717
c2d45bb4-d60a-4132-842d-3c65a7bb0ef4	subratbarikadmin@gmail.com		\N	0		\N	0	f	f	2026-04-13 15:59:54.570415+05:30	2026-04-13 15:59:54.570436+05:30	89454769-3208-415f-a80f-6f863155e765
20f13bf1-97cc-46ba-9f03-1b4df8ded3e6	testadvocate2@gmail.com		\N	0		\N	0	f	f	2026-04-13 16:11:34.541789+05:30	2026-04-13 16:11:34.541804+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d
d5f4ed41-37a4-4473-8998-2784d23fae4d	alokadmin@g.com		\N	0		\N	0	f	f	2026-04-13 17:13:56.987118+05:30	2026-04-13 17:13:56.987133+05:30	1d914b5d-b935-4b96-b55e-38a2cd83f763
39f9891a-b61e-410a-8de0-929506854c21	testadmin2@g.com		\N	0		\N	0	f	f	2026-04-13 18:47:23.901288+05:30	2026-04-13 18:47:23.901304+05:30	4a38df05-8e96-4b50-b5ad-54598ecba542
4660f51c-8ef0-41e2-90bc-ffb7540662f6	surya@h.com		\N	0		\N	0	f	f	2026-04-15 13:06:38.250524+05:30	2026-04-15 13:06:38.25054+05:30	90790d0f-374c-4a08-b0d6-b74a171a7ca5
b6e4ec82-fb24-47ca-a433-e792d4fb152c	saxenalawfirm@gmail.com		\N	0		\N	0	f	f	2026-04-15 18:43:19.827617+05:30	2026-04-15 18:43:19.827633+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89
9c137519-e646-4957-b568-8a726b223067	new@g.com		\N	0		\N	0	f	f	2026-04-17 12:29:06.051113+05:30	2026-04-17 12:29:06.05114+05:30	285a9e83-e3ae-4680-a774-80d0e38ef773
879e6745-8ee4-4b7b-bc1d-d0908cc3a842	shradhamilu160@gmail.com		\N	0		\N	0	f	f	2026-04-17 12:54:29.228696+05:30	2026-04-17 12:54:29.228712+05:30	139b2b54-06b6-4e1b-9469-bbda62e773d3
93fd9063-a203-4658-8b21-5dbee3b8ed6f	arya@gmail.com		\N	0		\N	0	f	f	2026-04-17 13:27:16.764228+05:30	2026-04-17 13:27:16.76425+05:30	2263dc2c-c794-4dbc-b560-6d1708212eb6
9726e1fc-9f23-422b-a1c7-36553ae53a38	shradhamilu@gmail.com		\N	0		\N	0	f	f	2026-04-17 13:32:09.22703+05:30	2026-04-17 13:32:09.227051+05:30	c972c8b6-00f9-43fa-80ef-45253e7ac6c3
353fae6b-b98d-4315-9668-fd2ed7f38e52	asda@gmail.com		\N	0		\N	0	f	f	2026-04-17 15:35:22.553865+05:30	2026-04-17 15:35:22.553883+05:30	fcde59a6-01eb-46cf-9e40-344f8282b54a
68e51329-998b-4db7-8e5d-f0f95e860ce6	www@gmail.com		\N	0		\N	0	f	f	2026-04-17 15:39:48.831899+05:30	2026-04-17 15:39:48.831913+05:30	744dd8b0-1403-4473-8d3a-2787f061c05a
94d3b6be-d688-497d-bba6-63039ec2da12	gfdfhd@gmail.com		\N	0		\N	0	f	f	2026-04-17 15:53:51.267868+05:30	2026-04-17 15:53:51.267889+05:30	ef266648-9837-4cbc-86b1-5af95046120b
31ecfc93-8c92-4142-bdc2-c21673244391	sub@gmail.com		\N	0		\N	0	f	f	2026-04-17 17:05:00.854963+05:30	2026-04-17 17:05:00.854978+05:30	6fd29da0-7080-4382-aaa8-77caa8ef0482
991d0b5e-08bb-4c98-9c13-88ba42c5034f	s03@gmail.com		\N	0		\N	0	f	f	2026-04-17 17:10:42.598819+05:30	2026-04-17 17:10:42.598834+05:30	6136f201-bfb6-4e41-bf1e-cb9f231549a5
20f4a168-b3b4-4ed3-ae9a-33ef532f4804	gfdfhdee@gmail.com		\N	0		\N	0	f	f	2026-04-17 18:30:41.007535+05:30	2026-04-17 18:30:41.007557+05:30	3b606ec3-0b52-4b70-a076-135e2185e64d
4e706d03-0a0f-49d7-8778-21e4ef47b013	ddd@gmail.com		\N	0		\N	0	f	f	2026-04-18 12:21:09.928161+05:30	2026-04-18 12:21:09.928176+05:30	bee18ba6-be01-4c4b-82ff-3103e307fc95
7dfae0fe-6081-489a-9d6a-cb16eaca02cb	advo@gmail.com		\N	0		\N	0	f	f	2026-04-20 09:42:02.795221+05:30	2026-04-20 09:42:02.795239+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
037d6bc2-83c8-435d-87e2-37b59e72a23c	cli@gmail.com		\N	0		\N	0	f	f	2026-04-20 10:19:32.641324+05:30	2026-04-20 10:19:32.64134+05:30	184ee2bb-6bf9-4dc6-8e05-3620562c827e
5d09def0-4145-4ec3-9183-e69f377d7450	zxcxzc@grgesdg		\N	0		\N	0	f	f	2026-04-20 16:03:13.475469+05:30	2026-04-20 16:03:13.47549+05:30	d2a3cc2e-3011-43ab-9d25-6026fc830f2d
e855f212-c739-4d29-ba5b-e21dfdf0262b	fsffa@fgsafa.vkj		\N	0		\N	0	f	f	2026-04-20 16:12:06.124729+05:30	2026-04-20 16:12:06.12475+05:30	2bbad9a4-501c-4d04-92c8-1f5b891f14da
44a7af17-617d-4034-82ca-f18df7594d36	new@k.com		\N	0		\N	0	f	f	2026-04-20 16:26:03.754924+05:30	2026-04-20 16:26:03.755108+05:30	dde58a11-a18e-4984-bc67-1d8ccfd5346a
d2b33f73-76c8-426e-a9bd-d57a636ba805	shradh@gmail.com		\N	0		\N	0	f	f	2026-04-21 09:58:16.587712+05:30	2026-04-21 09:58:16.587728+05:30	70dd5f3f-412e-4816-a258-6fc40c025bde
59633d27-2596-4a83-99e2-054d36b84f57	pooja@gmail.com		\N	0		\N	0	f	f	2026-04-21 10:01:04.886435+05:30	2026-04-21 10:01:04.886459+05:30	9b6e44a0-33b6-48b3-8d43-0f1de5234056
1287817c-fc31-4952-a3f7-d4ca00b267a9	bibhu@gmail.com		\N	0		\N	0	f	f	2026-04-21 10:16:07.437619+05:30	2026-04-21 10:16:07.437636+05:30	c1270be1-13d5-476e-a2cb-01d93da3816c
8b5d6fb6-df46-4e32-b1fe-4cc5c3682d22	lipika@gmail.com		\N	0		\N	0	f	f	2026-04-21 10:19:33.919335+05:30	2026-04-21 10:19:33.919357+05:30	08928500-f6fb-4fc2-9411-69d237eb44eb
72fb9c91-0566-4972-a899-dba84fe4bece	asim@gmail.com		\N	0		\N	0	f	f	2026-04-21 11:07:08.228986+05:30	2026-04-21 11:07:08.229001+05:30	d0ebad81-eae4-446f-a89b-0bdb5d513b7f
7ac82440-001c-4739-a4a8-792284f97090	admin12@gmail		\N	0		\N	0	f	f	2026-04-21 11:29:06.751686+05:30	2026-04-21 11:29:06.751703+05:30	0dae6e2b-0eb2-4ccc-9261-e37b567bcdcc
59dd1310-56dd-4d01-9709-c1f6bf2e85e0	admin5535@gmail.com		\N	0		\N	0	f	f	2026-04-21 11:33:14.064893+05:30	2026-04-21 11:33:14.064908+05:30	67c30f67-0391-428c-afb9-97a597f515f8
e7ce4c36-6844-4a07-ae3a-f3fca00da814	aashutosh@gmail.com		\N	0		\N	0	f	f	2026-04-21 11:43:38.084051+05:30	2026-04-21 11:43:38.084066+05:30	d649f2d2-bccb-48a8-9db8-d851ff2aa037
f48c4859-d226-4bfe-a5d1-170453c7bec4	sgfd@gmail.com		\N	0		\N	0	f	f	2026-04-21 11:46:03.212846+05:30	2026-04-21 11:46:03.212867+05:30	5c3c3793-5ad8-47c9-a31d-177ba7fc0081
061d772e-0c80-47eb-b953-1a229f899b72	ritik03@gmail.com		\N	0		\N	0	f	f	2026-04-21 11:49:57.942878+05:30	2026-04-21 11:49:57.942894+05:30	cbc4ea0e-015e-4d4f-ae0c-c85c450691c9
0ec169d2-8067-4d49-8d56-c29793124c71	subham@ajamail.com		\N	0		\N	0	f	f	2026-04-23 12:23:35.584604+05:30	2026-04-23 12:23:35.584626+05:30	4df8ea5f-ddb8-47c5-9d59-34af552ff821
292ff661-5950-448a-be1e-4c53683cc2cd	jd@zoho.com		\N	0		\N	0	f	f	2026-04-23 12:26:12.541192+05:30	2026-04-23 12:26:12.541209+05:30	036cca57-42e0-4e9e-8571-e65e5e810d8e
9a3fb6c1-4b99-40aa-8202-68903f23f26b	bohidarakash@gmail.com		\N	0		\N	0	f	f	2026-04-24 14:30:58.133643+05:30	2026-04-24 14:30:58.133667+05:30	9ee6f64d-fe8a-4278-8811-b96a25556da5
c722c7b9-c0c8-4677-a451-cf7da3198be6	manasbohidar@gmail.com		\N	0		\N	0	f	f	2026-04-24 14:37:23.665392+05:30	2026-04-24 14:37:23.665415+05:30	d9c20303-1390-4b8d-bf0b-9e59ab2ca389
262071d9-09b3-4531-8acf-541d1334dfae	sameermaharana@gmail.com		\N	0		\N	0	f	f	2026-04-24 14:48:01.009487+05:30	2026-04-24 14:48:01.009508+05:30	f1c489fd-b120-484b-ad6c-871f23feacf9
59e58721-b559-4e7e-ba0c-e5bb2e2aa0fb	adityadas@gmail.com		\N	0		\N	0	f	f	2026-04-24 15:46:28.449836+05:30	2026-04-24 15:46:28.449859+05:30	2090e49f-342e-4867-94d1-42cc12276a9e
0480880d-6779-4fc0-a47b-32e7cf6f96cd	srikantdas@gmail.com		\N	0		\N	0	f	f	2026-04-27 12:52:00.651745+05:30	2026-04-27 12:52:00.651773+05:30	2132980d-ed53-4e38-b7b7-0e8435602058
3e4e02ad-0456-49e9-990d-69a9160b1f64	saswatbohidar@gmail.com		\N	0		\N	0	f	f	2026-04-28 11:23:32.721557+05:30	2026-04-28 11:23:32.72158+05:30	e26c57c8-aa19-4356-9bb5-9d1cac160d9b
3a59d4f5-e979-4599-bbc1-3cf8d880d432	sabitachoudhury@gmail.com		\N	0		\N	0	f	f	2026-04-30 12:19:57.510754+05:30	2026-04-30 12:19:57.510771+05:30	4f103703-ddbf-4f28-b312-c30c6f6d605c
1728164a-b865-4fe4-bcc2-f991a9447d9a	swagatpadhy@gmail.com		\N	0		\N	0	f	f	2026-04-30 12:43:36.335076+05:30	2026-04-30 12:43:36.335099+05:30	3f54f6c1-3e73-420a-8333-6ef1649b6187
41f69221-7076-4b97-b126-f59fc539bd93	sumitmishra@gmail.com		\N	0		\N	0	f	f	2026-05-02 11:55:28.961428+05:30	2026-05-02 11:55:28.961447+05:30	da6195bb-5878-401e-a879-38bd0463fa5c
7a6e24bb-7b22-444d-9c6f-20ee89378ce4	priyabohidar@gmail.com		\N	0		\N	0	f	f	2026-05-02 12:13:17.221509+05:30	2026-05-02 12:13:17.22153+05:30	a5c2a056-9be3-4241-9557-525cf7c369c7
d550db18-62cd-4fdd-9f1a-30397c382f1e	bohidarpriya@gmail.com		\N	0		\N	0	f	f	2026-05-02 12:32:15.578322+05:30	2026-05-02 12:32:15.578339+05:30	3274b74d-4f13-4220-993b-7ec3e4020bfd
00ff8931-7f39-4d19-920e-5d4621ea23c3	bohidarranjanpriya@gmail.com		\N	0		\N	0	f	f	2026-05-02 12:38:03.638476+05:30	2026-05-02 12:38:03.638499+05:30	f331f893-75e1-4841-94f6-ac8a027a2439
f6349574-9711-4b45-92e4-4d277227a00d	www.achyutasamanta@gmail.com		\N	0		\N	0	f	f	2026-05-02 14:50:42.475231+05:30	2026-05-02 14:50:42.475256+05:30	4d0159b7-ce1a-450a-87dd-830fa1780a84
a396a493-fded-4f92-8f2c-64864f455349	bohidarmanas@gmail.com		\N	0		\N	0	f	f	2026-05-02 14:55:46.159161+05:30	2026-05-02 14:55:46.159177+05:30	9f1e7cf7-e1f6-4154-9058-746a62b2aeea
77f3022f-5e8c-4e07-af1f-288b1c799425	bohidarranjanmanas@gmail.com		\N	0		\N	0	f	f	2026-05-02 14:59:54.067557+05:30	2026-05-02 14:59:54.067572+05:30	df719cfb-f040-42ce-a588-84c83ab1163d
20442774-d6e2-4508-aff6-04c05c16d360	bohidarranjanmanas80@gmail.com		\N	0		\N	0	f	f	2026-05-02 15:04:09.356391+05:30	2026-05-02 15:04:09.356407+05:30	8b14eb83-f60f-43b7-860f-616947c11476
2ac74aed-7f71-4632-8b6e-e0c1db7dc473	www.satyanarayanmishra@gmail.com		\N	0		\N	0	f	f	2026-05-02 15:17:12.425993+05:30	2026-05-02 15:17:12.426017+05:30	925f7869-8a14-41c9-a4cb-413c0d69109f
716682c3-1692-453e-84ef-d07c81172b52	narayanmishra@gmail.com		\N	0		\N	0	f	f	2026-05-02 15:20:40.115389+05:30	2026-05-02 15:20:40.115408+05:30	6b324d98-22f0-4936-897e-6633d3e8c556
161331fd-ab56-4942-8767-c795ee9bdbbe	www.satyanarayanmishra68@gmail.com		\N	0		\N	0	f	f	2026-05-02 15:23:53.737017+05:30	2026-05-02 15:23:53.737032+05:30	9cbb2fd8-6ae0-4277-972a-25bfaa0c523d
cf7145dc-28d0-41d0-8bf4-2199fbf4832f	ibndv@advocate.gmail.com		\N	0		\N	0	f	f	2026-05-04 13:39:31.937663+05:30	2026-05-04 13:39:31.937681+05:30	2594cfb1-8985-42d5-a068-13a6c277b5ee
9a2f52f7-027c-4ad3-82e3-c94795120ae0	hsg@gmail.com		\N	0		\N	0	f	f	2026-05-04 17:07:53.112559+05:30	2026-05-04 17:07:53.112573+05:30	f3b04f63-da8b-40ed-b7f5-12f1b29cde4f
e3f4c6e4-f5df-4b7a-9bf9-5f40075c7cbb	nikhilbohidar@gmail.com		\N	0		\N	0	f	f	2026-05-05 11:25:46.238827+05:30	2026-05-05 11:25:46.238849+05:30	1e40fae8-1c67-476a-aee1-50c16d953633
53b7aa61-88e4-4fc8-bce3-84fe737a78c0	www.nikhilbohidar@gmail.com		\N	0		\N	0	f	f	2026-05-05 11:29:23.092667+05:30	2026-05-05 11:29:23.092686+05:30	55d2e024-98a6-4995-b500-b7b72ee32120
c41a7fe7-4801-4032-8c72-7956b571d15e	bohidarnikhil@gmail.com		\N	0		\N	0	f	f	2026-05-05 11:34:00.776591+05:30	2026-05-05 11:34:00.776608+05:30	022eaecb-2f3f-4c8d-b887-7b8e629d7f8b
a3b594ac-7b58-422f-947e-a6acf89720c5	www.jayadevmishra@gmail.com		\N	0		\N	0	f	f	2026-05-05 11:52:13.865252+05:30	2026-05-05 11:52:13.865267+05:30	472c96b5-1c05-4b3c-8beb-fa6fba63b150
e7e1d6f1-c2b4-4f9f-b080-8112f16d9d1c	jayadevmishra@gmail.com		\N	0		\N	0	f	f	2026-05-05 11:55:48.345773+05:30	2026-05-05 11:55:48.34579+05:30	f78d0ea2-b390-40ff-b7e0-ada24480a36e
86627b95-b923-4cdd-b5ae-a4d4107e5124	mishrajayadev@gmail.com		\N	0		\N	0	f	f	2026-05-05 12:20:08.347353+05:30	2026-05-05 12:20:08.347377+05:30	fc46a32c-76f0-4c59-806d-f5d221d1af68
3025ad57-877a-4a29-81b3-a4a5bd742194	mishrajayadev92@gmail.com		\N	0		\N	0	f	f	2026-05-05 12:23:35.045298+05:30	2026-05-05 12:23:35.04532+05:30	ac500223-29fe-42a1-ba68-b00039a4c545
1e4c87db-8adf-4687-b423-7ffa7e8064de	www.sushilkumar@gmail.com		\N	0		\N	0	f	f	2026-05-05 15:02:38.316075+05:30	2026-05-05 15:02:38.316098+05:30	e53922f1-669e-4ac7-9d4d-ba4ccd282339
21c38d35-6caf-40e2-803c-9ca6f289c386	sushilkumar@gmail.com		\N	0		\N	0	f	f	2026-05-05 15:05:54.629428+05:30	2026-05-05 15:05:54.629443+05:30	daa399bd-d338-4948-bb07-e0d11f6a1bba
34d1057a-e166-4925-bf54-183f5644b64a	kumarsushil@gmail.com		\N	0		\N	0	f	f	2026-05-05 15:09:01.459885+05:30	2026-05-05 15:09:01.459913+05:30	49a1fd68-7dd7-4295-a85a-71e4797c6783
e18c9b54-6289-412c-bacf-97a2ea998008	para@gmail.com		\N	0		\N	0	f	f	2026-05-06 09:49:38.451884+05:30	2026-05-06 09:49:38.451899+05:30	66a74a9e-7334-49fb-bfb0-15d9bf2df9f0
d2d9d819-1d6a-4626-baa0-95ee4a1cd303	shsh@gmail.com		\N	0		\N	0	f	f	2026-05-06 10:05:13.140866+05:30	2026-05-06 10:05:13.140883+05:30	2403e43f-02f7-46a2-ae48-253ca3dcb43d
7a3cf820-7fa4-4092-8bf1-38eaeda9fa99	www.ramakantreddy@gmail.com		\N	0		\N	0	f	f	2026-05-06 12:07:32.894032+05:30	2026-05-06 12:07:32.894054+05:30	e37adccf-9b47-46eb-be62-374d54dbd491
d539fdba-7195-4450-affd-66f8e5bdae65	ramakantreddy90@gmail.com		\N	0		\N	0	f	f	2026-05-06 12:19:22.418801+05:30	2026-05-06 12:19:22.418823+05:30	e9a3cd06-bc4a-4a24-91c2-f254beef3f39
929d0f21-6aef-47a2-a9bb-83ca3eba0c9f	reddyramakant@gmail.com		\N	0		\N	0	f	f	2026-05-06 12:23:18.24948+05:30	2026-05-06 12:23:18.249495+05:30	c551fe95-428c-4435-96ce-2a87f4b46064
196c3d31-f6cb-4390-8820-06ade323799f	erewr@lawfirm.com		\N	0		\N	0	f	f	2026-05-06 13:18:01.631573+05:30	2026-05-06 13:18:01.631614+05:30	e3c89f4a-264a-4d7f-9625-d7f57e7f2c4f
646edac1-39a0-4876-9491-bbc27934b375	erdfddfdewr@lawfirm.com		\N	0		\N	0	f	f	2026-05-06 13:20:42.857299+05:30	2026-05-06 13:20:42.857315+05:30	820579bf-7d1b-4962-9eb3-426df0ab292a
65af0c42-06db-4d6c-8305-07b352ec52ed	gdfgd@fgcx.fj		\N	0		\N	0	f	f	2026-05-06 13:47:38.993769+05:30	2026-05-06 13:47:38.993792+05:30	3c2bbe9e-2cb3-448f-b108-76376575b6af
e2b1fe32-3780-4fdb-8376-44973f5e9bb3	gshdfhsg@gmail.com		\N	0		\N	0	f	f	2026-05-06 14:03:04.943855+05:30	2026-05-06 14:03:04.943871+05:30	f0959cfe-9124-404a-8fb0-c89330cdd248
c17f7cfa-555d-4581-b49f-7d12537a9a20	sdsdsds@gmail.com		\N	0		\N	0	f	f	2026-05-06 14:04:28.360951+05:30	2026-05-06 14:04:28.360968+05:30	dd4f0cba-8b3b-4d24-9601-0ef0eae3eda6
2c3bce20-6c8a-478f-94a7-975abac1cb11	gdfssdf@gmail.com		\N	0		\N	0	f	f	2026-05-06 14:12:48.255308+05:30	2026-05-06 14:12:48.255324+05:30	4ae22c78-372f-436d-9f33-19480c3b3482
4992a20e-d3f0-4d1a-b72e-f41912716771	tereyrer@gmail.com		\N	0		\N	0	f	f	2026-05-06 15:04:19.527304+05:30	2026-05-06 15:04:19.527322+05:30	98058847-547b-44d1-829f-abeeb12c57cb
5051855b-b71c-45f2-97e6-8c4159578bbb	65443@gmail.com		\N	0		\N	0	f	f	2026-05-06 15:19:38.230671+05:30	2026-05-06 15:19:38.230687+05:30	115b1e64-92b3-452d-9279-99dbb7911593
8d261621-c111-4507-a99f-588a6340aa24	dfsfdsf@gmail.com		\N	0		\N	0	f	f	2026-05-06 15:32:00.974203+05:30	2026-05-06 15:32:00.974218+05:30	33c21527-b152-48ea-af18-1b73e0301e6c
285a8479-7084-4a8b-a329-cad357fba107	ADQEQ@EFF.FDSFDSF		\N	0		\N	0	f	f	2026-05-06 15:41:32.046982+05:30	2026-05-06 15:41:32.047001+05:30	3fb6fabb-c535-4bda-a1f0-14a7d0685b17
16fe2177-bfb4-4a81-93de-5ae1a0d101f8	fdsafas@fgzfg.fdsfsa		\N	0		\N	0	f	f	2026-05-06 15:42:02.248761+05:30	2026-05-06 15:42:02.248777+05:30	1ba45842-9737-4c7b-83d9-4f957048b574
65f1d2b2-3b6a-4b4b-989b-fc3a9218fb87	gdf@gmail.com		\N	0		\N	0	f	f	2026-05-06 15:50:48.714549+05:30	2026-05-06 15:50:48.714573+05:30	d99be6c0-1d66-430e-bed8-c9d3f86732ab
318f18b1-be8f-4e18-93fc-b81a3239a488	the@gmail.com		\N	0		\N	0	f	f	2026-05-06 16:05:45.733728+05:30	2026-05-06 16:05:45.73375+05:30	f3e8aca7-c948-4b11-bdb6-12b319bcc6b8
829786da-698f-4bf2-b0ed-26ada925937c	b12345@gmail.com		\N	0		\N	0	f	f	2026-05-08 00:30:26.466491+05:30	2026-05-08 00:30:26.466516+05:30	d33932c9-8a33-4bb9-a5cb-38079d242d4e
33ea160c-9a61-4d6f-a62b-f8c94c77d986	746d@gmail.com		\N	0		\N	0	f	f	2026-05-08 09:42:04.581915+05:30	2026-05-08 09:42:04.581932+05:30	30629b8e-eaf6-4612-8e7c-d487fcb0ab11
0dc6b929-24ac-4637-92cf-21233c536e24	sds@gmail.com		\N	0		\N	0	f	f	2026-05-08 10:38:56.383177+05:30	2026-05-08 10:38:56.383194+05:30	905a0710-c0bc-4ff4-8540-f8fd24174a98
c8c07db8-72ef-4837-962d-13c1414d355a	sdg@gmail.com		\N	0		\N	0	f	f	2026-05-08 11:22:18.463241+05:30	2026-05-08 11:22:18.463255+05:30	e7b6f636-7aad-4655-a57d-a3d174fdf4d2
177d6ea9-e7ec-4a17-90e5-4680d92f1978	ganesh.panda@gmail.com		\N	0		\N	0	f	f	2026-05-08 17:50:11.781682+05:30	2026-05-08 17:50:11.78171+05:30	5185cd8b-45df-424d-9b65-e1473ab03301
3b3b8b3b-4fcf-4ba2-bf5c-262316831e20	subratadmin@saxena.com		\N	0		\N	0	f	f	2026-05-09 13:45:09.871482+05:30	2026-05-09 13:45:09.871504+05:30	cfea0561-f92d-4eb8-90ff-7574f812dc63
04456ba6-baea-4239-b0c8-dc726f8b7b3c	shr@gmail.com		\N	0		\N	0	f	f	2026-05-11 10:17:03.674298+05:30	2026-05-11 10:17:03.674326+05:30	3411bfbd-d965-4897-a6ee-aa1a2fe06039
d670066e-f21b-4fc5-9ea2-184aecec9b00	raisina.cuttack@gmail.com		\N	0		\N	0	f	f	2026-05-11 13:03:57.043283+05:30	2026-05-11 13:03:57.0433+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283
b2c635bf-3dce-42e5-b0ad-3c5407c3baa1	akash@gmail.com		\N	0		\N	0	f	f	2026-05-11 13:07:48.94565+05:30	2026-05-11 13:07:48.945667+05:30	f55a587a-2465-41fc-aa12-3975a18b21fb
d7eb1c2e-bcd0-4b1d-a912-5ded08a0426b	chakradhar72@gmail.com		\N	0		\N	0	f	f	2026-05-11 13:19:49.199779+05:30	2026-05-11 13:19:49.199795+05:30	ead81aad-44c7-4780-9afe-3a8501fac43e
ba18e163-8e7c-44c5-9890-b75ef8d9f6b3	chakradharpanda72@gmail.com		\N	0		\N	0	f	f	2026-05-11 13:23:58.690086+05:30	2026-05-11 13:23:58.690113+05:30	1932bab4-adc6-4085-8150-aaabf361e3e8
20b43812-cd38-4c81-8e43-a1378f7935e3	www.chakradharpanda@gmail.com		\N	0		\N	0	f	f	2026-05-11 15:08:37.942476+05:30	2026-05-11 15:08:37.942491+05:30	6b1a8158-aac2-45be-90c2-c21769f73f7b
929fd6cf-9a3f-48b6-9ca1-c29540a6347e	sanjaymohapatra90@gmail.com		\N	0		\N	0	f	f	2026-05-13 11:45:54.348398+05:30	2026-05-13 11:45:54.348411+05:30	2264d078-daf3-456e-be50-112c6ca1a3f4
8b140b6d-3b93-44c6-b690-d314389dfef7	krishnakanha92@gmail.com		\N	0		\N	0	f	f	2026-05-14 12:41:42.602918+05:30	2026-05-14 12:41:42.602932+05:30	70af14e0-742c-47a3-a450-78fdecad1399
230ceb50-132f-4cea-a13b-fe90d82ad2d3	www.kanhakrishna@gmail.com		\N	0		\N	0	f	f	2026-05-14 14:51:54.778337+05:30	2026-05-14 14:51:54.778351+05:30	425dedd8-23d0-4248-8327-8da324819df0
1db104c6-511b-4757-8ba3-00c9eb443653	www.minakhrout@gmail.com		\N	0		\N	0	f	f	2026-05-18 14:25:15.137033+05:30	2026-05-18 14:25:15.137047+05:30	75b53f3e-46f8-45a7-ab94-437b13830279
5e1bbd77-2a8e-40c8-8a23-835d3cc11084	Minakhi83@gmail.com		\N	0		\N	0	f	f	2026-05-18 16:01:17.709127+05:30	2026-05-18 16:01:17.709143+05:30	e720e85d-111b-49cc-b86a-1aec508dc7a1
4bf1bd0b-8b1e-4113-b494-89168b57fc56	routminakhi@gmail.com		\N	0		\N	0	f	f	2026-05-18 16:56:49.747474+05:30	2026-05-18 16:56:49.747486+05:30	6d3d81da-93ab-4617-a05b-72948bad95b1
2d179e7a-8a3b-44e6-920f-03bdb57d998f	testadvo@antlegal.com		\N	0		\N	0	f	f	2026-08-03 13:11:14.703184+05:30	2026-08-03 13:11:14.703192+05:30	9eea803b-c301-41db-803d-6bdfb6278e89
c6825827-ff37-44d2-9a59-39853b98ad70	testclient@gmail.com		\N	0		\N	0	f	f	2026-08-03 17:31:56.873965+05:30	2026-08-03 17:31:56.873971+05:30	09e41654-0c15-43f0-95a9-3d2f6a541ef4
\.


--
-- Data for Name: accounts_otpverification; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_otpverification (id, otp_type, otp_code, is_verified, attempts, max_attempts, created_at, expires_at, user_id) FROM stdin;
19f83bc9-7216-4cad-b972-a9e7f8f33575	email	473096	f	0	5	2026-04-09 15:54:35.372259+05:30	2026-04-09 16:04:35.371808+05:30	c75be9a0-e6bc-49d8-b024-875db6cb4911
57982619-ae60-40ed-bfb4-17f47bf7756e	email	399405	t	0	5	2026-04-09 15:55:53.585186+05:30	2026-04-09 16:05:53.58469+05:30	c75be9a0-e6bc-49d8-b024-875db6cb4911
b174ce9c-2546-4622-a855-4e51df6ae1b7	email	716684	f	0	5	2026-04-09 15:59:19.211317+05:30	2026-04-09 16:09:19.210926+05:30	c75be9a0-e6bc-49d8-b024-875db6cb4911
37dabae9-4c1e-4e80-ad9d-8d9b61bb75b5	email	244533	f	0	5	2026-04-09 15:59:31.338317+05:30	2026-04-09 16:09:31.337988+05:30	c75be9a0-e6bc-49d8-b024-875db6cb4911
bd42ab7f-1a82-4a91-83ab-2391597c4232	email	570887	t	0	5	2026-04-10 12:44:16.047149+05:30	2026-04-10 12:54:16.046222+05:30	08124d12-0159-4399-ba52-90f2224ede00
4337e3db-947b-4283-bcde-30ca6c5ca74f	email	299527	f	0	5	2026-04-10 13:24:21.759594+05:30	2026-04-10 13:34:21.75922+05:30	c75be9a0-e6bc-49d8-b024-875db6cb4911
af9abe4a-2acc-4ad7-825c-f0fcd6b01c38	phone	999999	t	0	5	2026-04-10 16:01:01.91974+05:30	2026-04-10 16:11:01.919264+05:30	08124d12-0159-4399-ba52-90f2224ede00
5b543d7a-c481-48f1-8311-e2f172939844	phone	999999	t	1	5	2026-04-10 16:01:34.620615+05:30	2026-04-10 16:11:34.619985+05:30	08124d12-0159-4399-ba52-90f2224ede00
82d7feb5-55de-4d53-b66c-8873524041b2	phone	999999	t	0	5	2026-04-10 15:58:06.999069+05:30	2026-04-10 16:08:06.998514+05:30	08124d12-0159-4399-ba52-90f2224ede00
645e8fd6-57a9-4dbd-b875-2ee704f32bb7	phone	999999	t	0	5	2026-04-10 16:03:53.559011+05:30	2026-04-10 16:13:53.558569+05:30	08124d12-0159-4399-ba52-90f2224ede00
249d0bd7-3f11-4fb8-a513-fdf52d420a68	phone	999999	t	0	5	2026-04-10 16:05:51.503383+05:30	2026-04-10 16:15:51.50303+05:30	a527e3db-fe90-4397-a6cd-d5ae9cd1d1e9
f9f7af42-7379-40db-b3e0-3aed55a4d90c	phone	999999	t	0	5	2026-04-10 16:06:26.1934+05:30	2026-04-10 16:16:26.193+05:30	47e68f32-76c0-46b8-bfee-1748cee569f6
19617ebe-6f4e-40dc-9d28-6dddb3b3aabc	phone	999999	f	0	5	2026-04-10 16:07:26.499985+05:30	2026-04-10 16:17:26.499479+05:30	08124d12-0159-4399-ba52-90f2224ede00
856ed172-3793-48aa-b8a9-2cf51ba4996a	phone	999999	f	0	5	2026-04-10 16:07:29.520988+05:30	2026-04-10 16:17:29.520638+05:30	08124d12-0159-4399-ba52-90f2224ede00
32f8f917-a717-4fa5-95f2-2b5577cf1a35	phone	999999	t	0	5	2026-04-10 18:06:42.509443+05:30	2026-04-10 18:16:42.508857+05:30	08124d12-0159-4399-ba52-90f2224ede00
ec2815f8-9f2f-45c8-bc6f-86005973fa5d	phone	999999	t	0	5	2026-04-10 18:19:13.888605+05:30	2026-04-10 18:29:13.888077+05:30	08124d12-0159-4399-ba52-90f2224ede00
4b982f33-4560-4e8c-8e61-ce34672c6435	phone	999999	f	0	5	2026-04-11 12:29:58.275867+05:30	2026-04-11 12:39:58.275555+05:30	813f9eee-e9ae-43b7-967e-6768b7f6747f
ee5728e4-1bae-4d61-a5c5-f0172841051e	phone	999999	t	0	5	2026-04-16 16:29:57.671218+05:30	2026-04-16 16:39:57.670664+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43
a2a0561f-ba7c-4959-acc5-e9b19d5a5f05	phone	999999	t	0	5	2026-04-16 16:46:58.042188+05:30	2026-04-16 16:56:58.041486+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43
053b1ea3-1468-48c9-89f4-0dfc6a1dce1c	phone	999999	t	0	5	2026-04-17 11:53:58.312345+05:30	2026-04-17 12:03:58.311379+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43
6abe5618-010c-4cde-b58a-9890d88f7557	phone	999999	t	0	5	2026-04-17 20:51:43.592773+05:30	2026-04-17 21:01:43.59213+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43
012cef1c-7bac-438c-9bce-ff36dc4e7a07	email	565124	t	1	5	2026-04-17 20:55:02.965021+05:30	2026-04-17 21:05:02.964505+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43
3d9ca268-0401-4425-a430-ff41e451bf6e	phone	999999	t	0	5	2026-04-17 22:44:24.364833+05:30	2026-04-17 22:54:24.364466+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89
871b0db4-c50c-4fe9-a53b-a1c96c9967ef	phone	999999	t	0	5	2026-04-30 13:46:33.107879+05:30	2026-04-30 13:56:33.107041+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43
b057f6c7-7346-4ede-be5f-d65b02e5e4dd	phone	999999	t	0	5	2026-05-07 10:45:18.801724+05:30	2026-05-07 10:55:18.799825+05:30	a527e3db-fe90-4397-a6cd-d5ae9cd1d1e9
74c7c493-4c18-481b-ad18-e7c2d85240ff	phone	999999	t	1	5	2026-05-08 12:25:29.596539+05:30	2026-05-08 12:35:29.595505+05:30	a527e3db-fe90-4397-a6cd-d5ae9cd1d1e9
9b25ddb6-33ac-4c2c-8259-c8ff84b69dd8	phone	999999	t	0	5	2026-05-08 13:16:37.266888+05:30	2026-05-08 13:26:37.266304+05:30	d33932c9-8a33-4bb9-a5cb-38079d242d4e
b1390956-41e0-4c1a-8bd5-687e1aea59fd	phone	999999	t	0	5	2026-05-08 17:57:47.486375+05:30	2026-05-08 18:07:47.485934+05:30	d33932c9-8a33-4bb9-a5cb-38079d242d4e
bb01b70b-4939-4b40-9d34-a0ed12367fd2	phone	999999	f	0	5	2026-08-05 12:57:27.885916+05:30	2026-08-05 13:07:27.885633+05:30	9eea803b-c301-41db-803d-6bdfb6278e89
2eeadb17-5514-4f4d-8364-a01a6ae0049a	email	999999	t	0	5	2026-08-05 12:57:54.218023+05:30	2026-08-05 13:07:54.217834+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
4e319ef1-72e8-43d0-945e-0d10a53c62eb	phone	999999	f	1	5	2026-08-05 13:12:23.191162+05:30	2026-08-05 13:22:23.190934+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
8f71d6f3-1674-46ff-b8ee-6a06cd352b9b	phone	999999	t	1	5	2026-08-05 16:50:36.608256+05:30	2026-08-05 17:00:36.607977+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
b4588428-a11a-4cbd-8719-b5d71bdc1ab8	phone	999999	t	1	5	2026-08-05 13:13:01.677375+05:30	2026-08-05 13:23:01.67717+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
5b0c9463-a9f7-4a9c-9ec5-3015fc4c38a6	email	999999	t	0	5	2026-08-05 13:23:28.500879+05:30	2026-08-05 13:33:28.500688+05:30	c75be9a0-e6bc-49d8-b024-875db6cb4911
b74b93fa-94b5-4a41-9d95-edc63d3f17a6	email	999999	f	0	5	2026-08-05 13:39:32.288261+05:30	2026-08-05 13:49:32.287834+05:30	9eea803b-c301-41db-803d-6bdfb6278e89
edede304-9472-4dfd-bad8-f773999b6485	phone	999999	t	1	5	2026-08-05 16:50:27.725365+05:30	2026-08-05 17:00:27.725168+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
4c647476-fd25-44f4-b6eb-60a9c124ff9c	email	999999	t	0	5	2026-08-05 13:41:11.38055+05:30	2026-08-05 13:51:11.380336+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
2a84d2e3-ab9e-4052-82d7-55ebc9fc4449	email	999999	f	0	5	2026-08-05 13:41:36.959335+05:30	2026-08-05 13:51:36.959179+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
dabc60fa-1217-4ec7-94e9-229ea41662bf	email	999999	f	0	5	2026-08-05 13:42:00.522961+05:30	2026-08-05 13:52:00.522766+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
ae936983-5080-49ab-ac00-a9364e91415a	email	999999	f	0	5	2026-08-05 13:42:01.326771+05:30	2026-08-05 13:52:01.326519+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
57b4b73a-22da-4d8a-8ef7-d4140e7a8e4e	email	999999	f	0	5	2026-08-05 13:42:02.177584+05:30	2026-08-05 13:52:02.177373+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
e3058bc2-28d2-4cec-9f8c-f02d41e9abf5	email	999999	f	0	5	2026-08-05 13:56:19.797456+05:30	2026-08-05 14:06:19.797289+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
c2f3751d-00a6-4b2e-8f24-d89ccd8e8ebb	email	999999	f	0	5	2026-08-05 13:57:06.77283+05:30	2026-08-05 14:07:06.772622+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
49184a28-4a01-46e3-a9ef-9d63f0da44a8	email	999999	f	0	5	2026-08-05 15:14:32.704558+05:30	2026-08-05 15:24:32.704382+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
dff9a958-ee3e-4182-9cf9-975b791e5946	email	999999	f	0	5	2026-08-05 15:14:34.407329+05:30	2026-08-05 15:24:34.407125+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
95de5a4e-0e8f-4596-8772-7ee7f3b4ab34	email	999999	t	1	5	2026-08-05 15:14:37.520186+05:30	2026-08-05 15:24:37.520036+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
c7454a4a-a8c0-47c8-9d85-7cc1184ef3a3	email	999999	t	0	5	2026-08-05 15:17:09.494579+05:30	2026-08-05 15:27:09.49426+05:30	9eea803b-c301-41db-803d-6bdfb6278e89
ba8ede20-bd7b-4f17-85c6-7d85e4c117e3	email	999999	t	0	5	2026-08-05 15:19:03.334075+05:30	2026-08-05 15:29:03.333836+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
bae88b8f-d6c9-45ad-8a06-269698edbc4c	email	999999	t	0	5	2026-08-05 15:19:19.991302+05:30	2026-08-05 15:29:19.991081+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
2b4ba3dc-55d7-410e-a1a5-ea07bcacc157	phone	999999	f	0	5	2026-08-05 15:22:55.145527+05:30	2026-08-05 15:32:55.145332+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
e02439ef-bbe3-45d1-ac88-18084ca4d195	email	999999	t	0	5	2026-08-05 15:26:02.820869+05:30	2026-08-05 15:36:02.820546+05:30	9eea803b-c301-41db-803d-6bdfb6278e89
47dd8f52-e1eb-428f-ae43-ca29c26d8e0c	phone	999999	t	1	5	2026-08-05 15:31:10.638128+05:30	2026-08-05 15:41:10.637817+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
c656f9a3-019d-4451-8e26-6814f93cc761	phone	999999	f	0	5	2026-08-05 15:31:30.493199+05:30	2026-08-05 15:41:30.49298+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
ab685cbf-a7ff-420b-81a9-da67096c37ac	email	999999	t	0	5	2026-08-05 16:08:28.998784+05:30	2026-08-05 16:18:28.998633+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
90a3fc0f-3763-49a1-9107-42c266264019	phone	999999	f	0	5	2026-08-05 16:08:59.15076+05:30	2026-08-05 16:18:59.150554+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
dc2c5eca-3c04-4740-850a-127d090e4333	email	999999	t	0	5	2026-08-05 16:38:29.80197+05:30	2026-08-05 16:48:29.801805+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
97d84c68-a4b6-427d-ab04-a3a863edb1ef	phone	999999	t	1	5	2026-08-05 16:50:42.02212+05:30	2026-08-05 17:00:42.021895+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
06c56cde-0e6a-4bc6-bf18-278082e76854	phone	999999	t	1	5	2026-08-05 16:50:54.96187+05:30	2026-08-05 17:00:54.961655+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
a2f8d4a7-0bdb-4a05-bf97-22ecae6e9304	email	999999	t	0	5	2026-08-05 16:51:13.671012+05:30	2026-08-05 17:01:13.670761+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
5a0ccc30-ab28-4242-bd76-b89f52b79e9f	phone	999999	t	1	5	2026-08-05 16:51:27.622882+05:30	2026-08-05 17:01:27.62268+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
b5e9b2a4-d592-4841-88c1-57fac35d0f61	phone	999999	t	1	5	2026-08-05 17:15:40.81149+05:30	2026-08-05 17:25:40.811251+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
8b34bebe-d1c5-40c8-982e-3160a8dd987e	phone	999999	t	1	5	2026-08-05 16:51:36.72565+05:30	2026-08-05 17:01:36.725442+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
d3eeb4a4-0717-496f-9d20-9f9e5d8c4cb9	phone	999999	t	1	5	2026-08-05 16:55:47.134147+05:30	2026-08-05 17:05:47.133874+05:30	9eea803b-c301-41db-803d-6bdfb6278e89
4038135c-b6b8-4fd0-80c2-de46eff5829a	phone	999999	t	1	5	2026-08-05 16:56:34.83448+05:30	2026-08-05 17:06:34.834195+05:30	9eea803b-c301-41db-803d-6bdfb6278e89
4e7f5eaa-5afd-4d65-9b8a-737a484e72d3	phone	999999	t	2	5	2026-08-05 16:52:49.920711+05:30	2026-08-05 17:02:49.920417+05:30	9eea803b-c301-41db-803d-6bdfb6278e89
847f69b3-1c6f-4185-9565-bc5fb69d31ef	phone	999999	t	2	5	2026-08-05 16:53:29.160311+05:30	2026-08-05 17:03:29.160051+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
\.


--
-- Data for Name: accounts_userfirmrole; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_userfirmrole (id, user_type, is_active, is_last_active, created_at, updated_at, firm_id, user_id, branch_id) FROM stdin;
341f4a87-bdae-42ef-a653-d153cfe9a005	super_admin	t	t	2026-04-08 17:16:01.167257+05:30	2026-04-08 17:16:01.177285+05:30	4dc8e120-5a0a-47d7-b5c9-5e5a1069e323	90547a1f-dc60-4528-b366-bc1e7fdb641e	\N
e1d20d48-c3f5-4405-99dc-d43bb5e4f297	partner_manager	t	t	2026-04-08 17:16:01.7695+05:30	2026-04-08 17:16:01.779388+05:30	4dc8e120-5a0a-47d7-b5c9-5e5a1069e323	1b509e76-09fb-4ba5-8b33-076ffb82cec0	\N
3dce1ac2-c2a3-46c2-a811-aaa711fd2447	super_admin	t	t	2026-04-08 17:24:23.567427+05:30	2026-04-08 17:24:23.567454+05:30	44b23374-ad48-4a79-be52-8daca9fb0a72	dd72a3e8-c5ff-49f3-a3f0-a01fa656d9f7	\N
f59c4fdb-7778-40e2-93ad-6b6711eeab16	super_admin	t	t	2026-04-08 17:24:24.038678+05:30	2026-04-08 17:24:24.045301+05:30	89139faa-b451-4c26-96ba-1d34635edb4b	ac571d9e-2002-401c-9166-2a67254b0117	\N
3197f3b1-33b7-4c4d-8e32-6e704d1a2960	partner_manager	t	t	2026-04-08 17:24:24.290241+05:30	2026-04-08 17:24:24.296099+05:30	89139faa-b451-4c26-96ba-1d34635edb4b	ed3b65c9-84cc-46a7-b5fe-9b1275bd367d	\N
12b6120f-7079-48af-bcab-7ce9d137f35d	super_admin	t	t	2026-04-09 11:20:57.017853+05:30	2026-04-09 11:20:57.01788+05:30	7014678b-9497-462c-af84-faa7d0f279d0	a527e3db-fe90-4397-a6cd-d5ae9cd1d1e9	\N
3c4dcc3d-b5f2-4dea-ae6a-8046b3b24441	super_admin	t	t	2026-04-09 12:19:18.475921+05:30	2026-04-09 12:19:18.475947+05:30	163695ec-06e3-4bc9-abcc-c790adb731cc	ccf81fd2-cb99-4d5e-943a-5fc6676f0f12	\N
039d98e5-3497-4581-8714-cd87cdcd28d7	super_admin	t	t	2026-04-09 12:25:54.628346+05:30	2026-04-09 12:25:54.635098+05:30	a8c373ce-cd7c-4252-ae9e-32aa6d8e7d77	0761e14b-822b-4e25-b331-1ad7126784ea	\N
09877916-aaf6-43b3-972b-86c949ba203c	super_admin	t	t	2026-04-09 12:39:43.377973+05:30	2026-04-09 12:39:43.384451+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N
425cb3bc-9f39-47b8-a041-d77a48fa7bd8	super_admin	t	t	2026-04-09 13:07:01.722541+05:30	2026-04-09 13:07:01.73283+05:30	e484ef42-c53a-4d91-99c9-a5306d58c639	c75be9a0-e6bc-49d8-b024-875db6cb4911	\N
7aed29fb-bd7a-4dc1-82e9-d0072059f5b6	super_admin	t	t	2026-04-10 11:15:24.768691+05:30	2026-04-10 11:15:24.775009+05:30	58c11394-bdea-4826-837b-e5c3a85bb0e0	47e68f32-76c0-46b8-bfee-1748cee569f6	\N
c36af399-c5d7-484a-9af7-155a66734a45	super_admin	t	t	2026-04-10 12:42:32.040297+05:30	2026-04-10 12:42:32.050451+05:30	be1d8c7e-751e-4a30-83a9-2a9f684e3e42	08124d12-0159-4399-ba52-90f2224ede00	\N
fc3b1acf-bb35-49e6-8f14-3851626d5a79	super_admin	t	t	2026-04-10 18:25:50.34981+05:30	2026-04-10 18:25:50.35436+05:30	619fda7b-cdce-4b9f-8cde-4fdade1006db	5c4990c4-5ddb-4031-bc04-785bc086b824	\N
f8f83986-93eb-4018-b2b2-7fe88a99c37f	admin	t	t	2026-04-11 13:50:43.196976+05:30	2026-04-11 13:50:43.203893+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9	e71918c8-b14b-4ea8-9608-1a2d9632b1c4	\N
b37f931f-2611-4bb6-b753-9c36f4ebefb4	advocate	t	t	2026-04-11 13:54:09.461059+05:30	2026-04-11 13:54:09.469546+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9	ad82aa5b-ad99-4007-8b0f-56fedc7f174b	\N
edbec067-ed5b-4bd2-a0a7-91784528f314	paralegal	t	t	2026-04-11 13:58:39.911697+05:30	2026-04-11 13:58:39.917352+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9	4e1a7020-f5e3-46aa-910c-0892eb73f480	\N
11fae537-05fb-40c1-8acf-bccd8fc3a4db	client	t	t	2026-04-11 13:59:43.21258+05:30	2026-04-11 13:59:43.218947+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9	4966020c-6f87-46bc-9f85-5ed8adfcf4bb	\N
b3e2bee5-5dbe-42d1-85b1-f350c4c0b6d8	super_admin	t	t	2026-04-11 16:20:33.677869+05:30	2026-04-11 16:20:33.685386+05:30	7014678b-9497-462c-af84-faa7d0f279d0	f018d6c3-daf0-4493-805f-300704bb4175	\N
1ca6c2a6-9e82-4264-8f2d-f0adfdb359af	partner_manager	t	t	2026-04-11 16:23:54.159123+05:30	2026-04-11 16:23:54.16517+05:30	619fda7b-cdce-4b9f-8cde-4fdade1006db	53fbe468-b315-48f8-bc07-99d8f6ca363e	\N
abc90388-1638-4912-b028-e53c13749bc3	super_admin	t	t	2026-04-11 18:21:37.164003+05:30	2026-04-11 18:21:37.172692+05:30	619fda7b-cdce-4b9f-8cde-4fdade1006db	3f468d59-6421-43c8-9449-514c2cc42be6	\N
92beb113-04cc-433e-a310-665072236b93	partner_manager	t	t	2026-04-11 18:28:17.075013+05:30	2026-04-11 18:28:17.082625+05:30	e484ef42-c53a-4d91-99c9-a5306d58c639	6f92770a-62ce-430d-b7d5-d5f6c27142d2	\N
9e789be4-c041-48ea-aa7f-a0baf3ca88c7	partner_manager	t	t	2026-04-13 13:51:41.576778+05:30	2026-04-13 13:51:41.583183+05:30	81663d19-18cb-45ac-a1c9-6a0d0c0d9e9d	2cc4a3c9-5762-4498-9e20-9a05f330c717	\N
d24199c3-4e9a-47bc-b181-09ef2a7c5e2d	admin	t	t	2026-04-17 12:54:29.224406+05:30	2026-05-09 16:19:32.24428+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9	139b2b54-06b6-4e1b-9469-bbda62e773d3	f34cb11d-ca27-4a22-b266-b5598363b02c
e225cc7e-4ae4-4e6e-a3b8-fcb6bff7bd03	advocate	t	t	2026-04-13 16:11:34.539847+05:30	2026-04-13 16:11:34.546216+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N
4e17460a-e6fa-48f4-8b66-bc662fd36cad	admin	t	t	2026-04-13 17:13:56.984783+05:30	2026-04-13 17:13:56.996901+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9	1d914b5d-b935-4b96-b55e-38a2cd83f763	c17e9b3b-1b1a-4560-b80e-3f0fb47116e6
d8e61258-a1bc-44e9-96d8-b01f7f46391e	admin	t	t	2026-04-13 18:47:23.898943+05:30	2026-04-13 18:47:23.909376+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9	4a38df05-8e96-4b50-b5ad-54598ecba542	7b6156a4-4804-4646-b647-4ffa21879455
ae2e727d-03c3-493c-8e56-141a603b6271	client	t	t	2026-04-15 13:06:38.246391+05:30	2026-04-15 13:06:38.257034+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9	90790d0f-374c-4a08-b0d6-b74a171a7ca5	\N
67f8dd1e-7a0e-4d0a-afa7-a62a8f5d2aff	super_admin	t	t	2026-04-15 18:43:19.823413+05:30	2026-04-15 18:43:19.832525+05:30	9b2a3376-624e-4aff-8c05-746491e1c0fb	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N
619af900-4594-4924-a6f1-10bfb9d5b3ae	super_admin	t	t	2026-04-17 13:27:16.760459+05:30	2026-04-17 13:27:16.770749+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9	2263dc2c-c794-4dbc-b560-6d1708212eb6	\N
f0a72651-8d76-4b79-bda7-e91dc301ffbf	advocate	t	t	2026-04-17 13:32:09.222393+05:30	2026-04-17 13:32:09.222421+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9	c972c8b6-00f9-43fa-80ef-45253e7ac6c3	\N
85e99fe3-a369-4edd-8fcc-df929ca9f836	client	t	t	2026-04-17 15:35:22.550192+05:30	2026-04-17 15:35:22.550212+05:30	9b2a3376-624e-4aff-8c05-746491e1c0fb	fcde59a6-01eb-46cf-9e40-344f8282b54a	\N
c921613a-30a8-44e8-83ed-e634d9abedcd	advocate	t	t	2026-04-17 15:39:48.829258+05:30	2026-04-17 15:39:48.829277+05:30	9b2a3376-624e-4aff-8c05-746491e1c0fb	744dd8b0-1403-4473-8d3a-2787f061c05a	\N
d1ba0fcb-496b-40f0-998f-a3a21c3082a0	admin	t	t	2026-04-17 15:53:51.264459+05:30	2026-04-17 15:53:51.280592+05:30	9b2a3376-624e-4aff-8c05-746491e1c0fb	ef266648-9837-4cbc-86b1-5af95046120b	8645b74b-51dc-4b14-b64c-71dbd4b77828
f0849ce3-202a-4f08-8eca-a652f56061cc	advocate	t	t	2026-04-17 17:05:00.852747+05:30	2026-04-17 17:05:00.852766+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9	6fd29da0-7080-4382-aaa8-77caa8ef0482	\N
9393591a-77ce-43f8-a35b-621e33f02cfc	client	t	t	2026-04-17 17:10:42.596271+05:30	2026-04-17 17:10:42.596291+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9	6136f201-bfb6-4e41-bf1e-cb9f231549a5	\N
889bae73-3497-40af-b149-100f37e52880	advocate	t	t	2026-04-17 18:30:40.996908+05:30	2026-04-17 18:30:40.99693+05:30	9b2a3376-624e-4aff-8c05-746491e1c0fb	3b606ec3-0b52-4b70-a076-135e2185e64d	\N
f5d9428e-776e-4adc-9383-b9342e0854d6	advocate	t	t	2026-04-18 12:21:09.924413+05:30	2026-04-18 12:21:09.924434+05:30	9b2a3376-624e-4aff-8c05-746491e1c0fb	bee18ba6-be01-4c4b-82ff-3103e307fc95	\N
1dd33e94-e729-4693-b768-7789412ca06c	advocate	t	t	2026-04-20 09:42:02.790607+05:30	2026-04-20 09:42:02.79063+05:30	9b2a3376-624e-4aff-8c05-746491e1c0fb	9a3b9470-80d4-444e-a370-55fd04bf185a	\N
9404986b-b8d5-4b0a-aa7b-8050e0c92749	client	t	t	2026-04-20 10:19:32.636878+05:30	2026-04-20 10:19:32.636898+05:30	9b2a3376-624e-4aff-8c05-746491e1c0fb	184ee2bb-6bf9-4dc6-8e05-3620562c827e	\N
37fa78f5-76f2-4e72-b29f-ba88ef59ceb4	partner_manager	t	t	2026-04-20 16:03:13.471027+05:30	2026-04-20 16:03:13.484207+05:30	9b2a3376-624e-4aff-8c05-746491e1c0fb	d2a3cc2e-3011-43ab-9d25-6026fc830f2d	\N
60d7365d-abe6-47d2-bf5b-031129fb92b7	super_admin	t	t	2026-04-20 16:12:06.120858+05:30	2026-04-20 16:12:06.132688+05:30	81663d19-18cb-45ac-a1c9-6a0d0c0d9e9d	2bbad9a4-501c-4d04-92c8-1f5b891f14da	\N
833f1757-a039-4ec9-afeb-951825b2ca1b	super_admin	t	t	2026-04-20 16:26:03.751735+05:30	2026-04-20 16:26:03.76389+05:30	1e0ab2b3-f52e-4793-b9fd-cdceecd59e06	dde58a11-a18e-4984-bc67-1d8ccfd5346a	\N
90a2bacc-a9c0-4727-b309-1ed888c4c077	super_admin	t	t	2026-04-21 09:58:16.582843+05:30	2026-04-21 09:58:16.596502+05:30	eb995188-6dfb-4eba-9425-930f18d36d7f	70dd5f3f-412e-4816-a258-6fc40c025bde	\N
c7a279e1-445f-456e-ac0a-c2a7a04bfb3b	client	t	t	2026-04-21 10:01:04.882094+05:30	2026-04-21 10:01:04.882124+05:30	eb995188-6dfb-4eba-9425-930f18d36d7f	9b6e44a0-33b6-48b3-8d43-0f1de5234056	\N
980f1e9b-18f0-41bb-b348-f73eb5a15e4b	advocate	t	t	2026-04-21 10:16:07.433853+05:30	2026-04-21 10:16:07.433886+05:30	eb995188-6dfb-4eba-9425-930f18d36d7f	c1270be1-13d5-476e-a2cb-01d93da3816c	\N
ce08abbc-4659-47f0-92fb-a6c34d6f9b2f	admin	t	t	2026-04-21 10:19:33.915205+05:30	2026-04-21 10:19:33.930569+05:30	eb995188-6dfb-4eba-9425-930f18d36d7f	08928500-f6fb-4fc2-9411-69d237eb44eb	921fb527-5772-4b5b-ad65-52cef47bca6b
21b2160d-e694-4a19-94e3-49ab5f261811	client	t	t	2026-04-21 11:07:08.225879+05:30	2026-04-21 11:07:08.2259+05:30	eb995188-6dfb-4eba-9425-930f18d36d7f	d0ebad81-eae4-446f-a89b-0bdb5d513b7f	\N
ff9d7a44-a98b-45ea-9cc6-125f4d7c96b8	super_admin	t	t	2026-04-21 11:29:06.748441+05:30	2026-04-21 11:29:06.756562+05:30	3c389772-1fb8-4472-9165-cd2607ecd66c	0dae6e2b-0eb2-4ccc-9261-e37b567bcdcc	\N
414c7542-ff4c-4166-b287-93a60ff78007	partner_manager	t	t	2026-04-21 11:33:14.062098+05:30	2026-04-21 11:33:14.070661+05:30	3c389772-1fb8-4472-9165-cd2607ecd66c	67c30f67-0391-428c-afb9-97a597f515f8	\N
31a9a1df-7c2b-48e1-b5bd-41805c01df39	super_admin	t	t	2026-04-21 11:43:38.080609+05:30	2026-04-21 11:43:38.087984+05:30	5c0747c8-99d2-4104-9fb4-97dd465fdaae	d649f2d2-bccb-48a8-9db8-d851ff2aa037	\N
a789d113-20ce-44d3-b6a5-2c69e04837b1	client	t	t	2026-04-21 11:46:03.208572+05:30	2026-04-21 11:46:03.208598+05:30	5c0747c8-99d2-4104-9fb4-97dd465fdaae	5c3c3793-5ad8-47c9-a31d-177ba7fc0081	\N
9039be68-6f76-4f97-bfe4-a2645adadc48	advocate	t	t	2026-04-21 11:49:57.939395+05:30	2026-04-21 11:49:57.939416+05:30	5c0747c8-99d2-4104-9fb4-97dd465fdaae	cbc4ea0e-015e-4d4f-ae0c-c85c450691c9	\N
a7de62e8-7bda-49f7-b602-940cc4a00b44	super_admin	t	t	2026-04-23 12:23:35.579763+05:30	2026-04-23 12:23:35.594506+05:30	1362c7a1-e7b3-40cf-846a-bdd37a526b5a	4df8ea5f-ddb8-47c5-9d59-34af552ff821	\N
2a0c701a-2e1c-4499-84a0-ea7eae6a582f	partner_manager	t	t	2026-04-23 12:26:12.537564+05:30	2026-04-23 12:26:12.550994+05:30	1362c7a1-e7b3-40cf-846a-bdd37a526b5a	036cca57-42e0-4e9e-8571-e65e5e810d8e	\N
40b6fa23-b0dd-4ee7-8850-28940d363f65	super_admin	t	t	2026-04-24 14:48:01.003848+05:30	2026-04-24 14:48:01.014428+05:30	047493f0-4349-4661-9815-987701d41bf7	f1c489fd-b120-484b-ad6c-871f23feacf9	\N
eef161ce-cd54-44db-bf16-fcee4bcd166a	super_admin	t	t	2026-05-02 12:38:03.632495+05:30	2026-05-02 12:38:03.644641+05:30	052bec83-a91a-418e-bd48-6ee1e0cd9dbf	f331f893-75e1-4841-94f6-ac8a027a2439	\N
83c30115-1d29-4008-a4b9-82902c196396	super_admin	t	t	2026-05-02 15:04:09.353516+05:30	2026-05-02 15:04:09.360013+05:30	df8a95f7-2400-4747-8782-6a6e7642ce4c	8b14eb83-f60f-43b7-860f-616947c11476	\N
cb3b25dc-6e39-476b-885b-5432612aca8e	super_admin	t	t	2026-05-02 15:23:53.733988+05:30	2026-05-02 15:23:53.740823+05:30	89cb5141-27cb-4e1a-9d85-89399b6032d4	9cbb2fd8-6ae0-4277-972a-25bfaa0c523d	\N
7570cbc2-64c3-4c8b-85d5-71c1ef9ed3d9	super_admin	t	t	2026-05-05 11:34:00.771121+05:30	2026-05-05 11:34:00.781878+05:30	197702cb-a3f7-4d43-a7cf-5b4d02a83ec4	022eaecb-2f3f-4c8d-b887-7b8e629d7f8b	\N
205fbdfb-3901-4b6e-8283-84b879137013	super_admin	t	t	2026-05-05 12:23:35.041334+05:30	2026-05-05 12:23:35.04971+05:30	23d1cff5-9768-47d8-b341-0cd2cf8367f9	ac500223-29fe-42a1-ba68-b00039a4c545	\N
27423c47-0d0d-4e71-b768-87695d611c97	super_admin	t	t	2026-05-05 15:09:01.453513+05:30	2026-05-05 15:09:01.468334+05:30	a039273e-ee03-4e3b-807d-0bacfae01ab6	49a1fd68-7dd7-4295-a85a-71e4797c6783	\N
74e71775-5cb9-49eb-adf6-581bddaf3a25	paralegal	t	t	2026-05-06 09:49:38.447609+05:30	2026-05-06 09:49:38.459809+05:30	eb995188-6dfb-4eba-9425-930f18d36d7f	66a74a9e-7334-49fb-bfb0-15d9bf2df9f0	\N
5d1f2c65-b23b-4297-b0cb-2668c6a44743	super_admin	t	t	2026-05-06 12:23:18.246948+05:30	2026-05-06 12:23:18.252163+05:30	afd98f7d-dd3d-47b5-a534-e535db042557	c551fe95-428c-4435-96ce-2a87f4b46064	\N
09e28986-33b7-4986-95a1-565c3ada7dde	paralegal	t	t	2026-05-06 13:18:01.624813+05:30	2026-05-06 13:18:01.642425+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9	e3c89f4a-264a-4d7f-9625-d7f57e7f2c4f	\N
30442612-f003-4b5d-9e95-4e96162e7771	advocate	t	t	2026-05-06 13:20:42.854332+05:30	2026-05-06 13:20:42.862019+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9	820579bf-7d1b-4962-9eb3-426df0ab292a	\N
5518a37b-e9a8-4082-8eba-e06b2c85d1b3	advocate	t	t	2026-05-06 13:47:38.988136+05:30	2026-05-06 13:47:39.003013+05:30	9b2a3376-624e-4aff-8c05-746491e1c0fb	3c2bbe9e-2cb3-448f-b108-76376575b6af	\N
4199b048-f141-4a7c-88c1-0d4966e80363	admin	t	t	2026-04-13 15:59:54.567892+05:30	2026-05-09 15:27:43.144318+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9	89454769-3208-415f-a80f-6f863155e765	8694fe53-ed8d-438a-a4ed-7ce4496d554d
f1b5fe1c-4665-40e5-bce8-bb0df2553df8	super_admin	t	t	2026-05-06 15:32:00.970855+05:30	2026-05-06 15:32:00.979269+05:30	58826cf1-716f-4a46-9cd6-bbb0277022bc	33c21527-b152-48ea-af18-1b73e0301e6c	\N
62f347c9-1a80-45c4-851a-bcc866c1a6c8	advocate	t	t	2026-05-06 15:41:32.043342+05:30	2026-05-06 15:41:32.053892+05:30	9b2a3376-624e-4aff-8c05-746491e1c0fb	3fb6fabb-c535-4bda-a1f0-14a7d0685b17	\N
17738779-2b0c-4d37-b413-abdf08d949e9	advocate	t	t	2026-05-06 15:42:02.246068+05:30	2026-05-06 15:42:02.25371+05:30	9b2a3376-624e-4aff-8c05-746491e1c0fb	1ba45842-9737-4c7b-83d9-4f957048b574	\N
cd74f595-bed4-493f-901b-baf19685c53c	client	t	t	2026-05-08 10:38:56.394532+05:30	2026-05-08 10:38:56.394552+05:30	\N	905a0710-c0bc-4ff4-8540-f8fd24174a98	\N
10de0a84-9faa-4012-9e37-71cd9b4b2bda	client	t	t	2026-05-08 11:22:18.469955+05:30	2026-05-08 11:22:18.469974+05:30	\N	e7b6f636-7aad-4655-a57d-a3d174fdf4d2	\N
bdb219ef-6d2a-4034-82f1-f9da553a82fa	client	t	t	2026-05-08 17:50:11.790811+05:30	2026-05-08 17:50:11.79084+05:30	\N	5185cd8b-45df-424d-9b65-e1473ab03301	\N
b9f3275c-f6ad-48dd-b70b-84865a32b388	admin	t	t	2026-05-09 13:45:09.86355+05:30	2026-05-09 13:45:09.890881+05:30	9b2a3376-624e-4aff-8c05-746491e1c0fb	cfea0561-f92d-4eb8-90ff-7574f812dc63	38ba1911-6378-4da5-b523-ab10e3dbc0ad
372ff35a-470d-49a1-ae91-0ec9dbad0b3a	client	t	t	2026-05-11 10:17:03.699658+05:30	2026-05-11 10:17:03.699689+05:30	\N	3411bfbd-d965-4897-a6ee-aa1a2fe06039	\N
6d690d82-5cc5-4aec-8c12-21510c71b5ac	client	t	t	2026-05-11 13:07:48.950839+05:30	2026-05-11 13:07:48.950859+05:30	\N	f55a587a-2465-41fc-aa12-3975a18b21fb	\N
6ae83945-8d5f-402c-ace9-cdfc975bf0a8	super_admin	t	t	2026-05-11 15:08:37.939381+05:30	2026-05-11 15:08:37.947094+05:30	ff66fc5d-803a-4073-8300-96a29f497ce1	6b1a8158-aac2-45be-90c2-c21769f73f7b	\N
bcadb841-5cec-4b57-9c25-05c86753a613	super_admin	t	t	2026-05-18 16:56:49.744283+05:30	2026-05-18 16:56:49.750363+05:30	8ac8fe12-9187-4ab5-a204-7801effe716b	6d3d81da-93ab-4617-a05b-72948bad95b1	\N
20a38b18-38c3-4d42-b94c-ea2ab1b46c21	advocate	t	t	2026-08-03 13:11:14.711464+05:30	2026-08-03 13:11:14.711471+05:30	\N	9eea803b-c301-41db-803d-6bdfb6278e89	\N
5e7b216f-8845-4b29-9961-284ff4363fb3	client	t	t	2026-08-03 17:31:56.878862+05:30	2026-08-03 17:31:56.878869+05:30	\N	09e41654-0c15-43f0-95a9-3d2f6a541ef4	\N
\.


--
-- Data for Name: accounts_userinvitation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts_userinvitation (id, email, phone_number, user_type, status, created_at, expires_at, accepted_at, firm_id, invited_by_id, invited_user_id) FROM stdin;
314b6cf8-6b30-483b-a730-0671bddfc42b	superadmin1775648760@example.com	+91876549037	super_admin	pending	2026-04-08 17:16:01.183506+05:30	2026-04-15 17:16:01.182991+05:30	\N	4dc8e120-5a0a-47d7-b5c9-5e5a1069e323	ce8ce90c-be9b-49de-a959-f8459663593a	90547a1f-dc60-4528-b366-bc1e7fdb641e
7e148ce7-97a4-469f-ab89-27f485a8049d	partner1775648761@example.com	+91765434018	partner_manager	pending	2026-04-08 17:16:01.786873+05:30	2026-04-15 17:16:01.786337+05:30	\N	4dc8e120-5a0a-47d7-b5c9-5e5a1069e323	ce8ce90c-be9b-49de-a959-f8459663593a	1b509e76-09fb-4ba5-8b33-076ffb82cec0
caca4ef8-804f-43ae-971d-0b0eed4f9771	superadmin1775649263@example.com	+91876541618	super_admin	pending	2026-04-08 17:24:24.050827+05:30	2026-04-15 17:24:24.050554+05:30	\N	89139faa-b451-4c26-96ba-1d34635edb4b	ce8ce90c-be9b-49de-a959-f8459663593a	ac571d9e-2002-401c-9166-2a67254b0117
8e2043ef-f4a3-49f2-94a8-9072e77c8785	partner1775649264@example.com	+91765434116	partner_manager	pending	2026-04-08 17:24:24.300783+05:30	2026-04-15 17:24:24.300466+05:30	\N	89139faa-b451-4c26-96ba-1d34635edb4b	ce8ce90c-be9b-49de-a959-f8459663593a	ed3b65c9-84cc-46a7-b5fe-9b1275bd367d
4bc52c10-355d-45d2-9433-a806bded9263	testadmin@lawfirm.com	1111111111	admin	pending	2026-04-11 13:50:43.20916+05:30	2026-04-18 13:50:43.208764+05:30	\N	6ae6b893-969f-432d-a7f4-62e5f14af2d9	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	e71918c8-b14b-4ea8-9608-1a2d9632b1c4
da76b16b-9682-4fc7-a8fc-f0fbe86113da	testadvocate@lawfirm.com	22222222	advocate	pending	2026-04-11 13:54:09.47511+05:30	2026-04-18 13:54:09.474544+05:30	\N	6ae6b893-969f-432d-a7f4-62e5f14af2d9	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	ad82aa5b-ad99-4007-8b0f-56fedc7f174b
6abcd5a8-fbfb-40c4-b711-76054773afeb	testparalegal@lawfirm.com	33333333	paralegal	pending	2026-04-11 13:58:39.92085+05:30	2026-04-18 13:58:39.920602+05:30	\N	6ae6b893-969f-432d-a7f4-62e5f14af2d9	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	4e1a7020-f5e3-46aa-910c-0892eb73f480
2a28f9e9-d4c5-49eb-99d9-60b1b4242073	testclient@lawfirm.com	5555555555	client	pending	2026-04-11 13:59:43.223483+05:30	2026-04-18 13:59:43.223161+05:30	\N	6ae6b893-969f-432d-a7f4-62e5f14af2d9	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	4966020c-6f87-46bc-9f85-5ed8adfcf4bb
4fbd1fb8-2aa6-4f75-9cc6-4e2d1fa8a42c	subratbarik3@gmail.com	+8808847806823	super_admin	pending	2026-04-11 16:20:33.689165+05:30	2026-04-18 16:20:33.688873+05:30	\N	7014678b-9497-462c-af84-faa7d0f279d0	ce8ce90c-be9b-49de-a959-f8459663593a	f018d6c3-daf0-4493-805f-300704bb4175
cf67c63a-16e2-49b2-9a8b-ed4725832667	subratba03@gmail.com	+918847806814	partner_manager	pending	2026-04-11 16:23:54.168947+05:30	2026-04-18 16:23:54.168563+05:30	\N	619fda7b-cdce-4b9f-8cde-4fdade1006db	ce8ce90c-be9b-49de-a959-f8459663593a	53fbe468-b315-48f8-bc07-99d8f6ca363e
bc7c0477-c451-4ef6-9df6-7e4273c73d3f	subratbar@gmail.com	+88047806814	super_admin	pending	2026-04-11 18:21:37.176333+05:30	2026-04-18 18:21:37.17596+05:30	\N	619fda7b-cdce-4b9f-8cde-4fdade1006db	ce8ce90c-be9b-49de-a959-f8459663593a	3f468d59-6421-43c8-9449-514c2cc42be6
22cd391a-7c99-478c-aae0-37d7a132f728	subra@gmail.com	+918847805554	partner_manager	pending	2026-04-11 18:28:17.08717+05:30	2026-04-18 18:28:17.086781+05:30	\N	e484ef42-c53a-4d91-99c9-a5306d58c639	ce8ce90c-be9b-49de-a959-f8459663593a	6f92770a-62ce-430d-b7d5-d5f6c27142d2
8455df70-6d30-4eb4-be77-7cf2522efcea	suryapartner@gmail.com	7418529630	partner_manager	pending	2026-04-13 13:51:41.587325+05:30	2026-04-20 13:51:41.586844+05:30	\N	81663d19-18cb-45ac-a1c9-6a0d0c0d9e9d	ce8ce90c-be9b-49de-a959-f8459663593a	2cc4a3c9-5762-4498-9e20-9a05f330c717
29833f5b-3985-4e3b-b2dc-a7d380d19f95	subratbarikadmin@gmail.com	+880884778945	admin	pending	2026-04-13 15:59:54.579986+05:30	2026-04-20 15:59:54.57951+05:30	\N	6ae6b893-969f-432d-a7f4-62e5f14af2d9	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	89454769-3208-415f-a80f-6f863155e765
55d7f5cf-c89c-4daf-a5cf-0a4e9a2c5f18	testadvocate2@gmail.com	+918848458678	advocate	pending	2026-04-13 16:11:34.550418+05:30	2026-04-20 16:11:34.550156+05:30	\N	6ae6b893-969f-432d-a7f4-62e5f14af2d9	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	f05b496d-7eb1-46c2-aa7d-f55269c0287d
04a9ea40-8832-48af-bade-3506715a8bf2	alokadmin@g.com	+918847778899	admin	pending	2026-04-13 17:13:57.00162+05:30	2026-04-20 17:13:57.00134+05:30	\N	6ae6b893-969f-432d-a7f4-62e5f14af2d9	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	1d914b5d-b935-4b96-b55e-38a2cd83f763
c1878a47-a251-47db-81e1-56f4353a9acb	testadmin2@g.com	+8808847801234	admin	pending	2026-04-13 18:47:23.91385+05:30	2026-04-20 18:47:23.913508+05:30	\N	6ae6b893-969f-432d-a7f4-62e5f14af2d9	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	4a38df05-8e96-4b50-b5ad-54598ecba542
83841e8f-7cd4-4a3a-89ed-9cb4293d765b	surya@h.com	2345234567	client	pending	2026-04-15 13:06:38.264279+05:30	2026-04-22 13:06:38.263778+05:30	\N	6ae6b893-969f-432d-a7f4-62e5f14af2d9	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	90790d0f-374c-4a08-b0d6-b74a171a7ca5
3b4566cc-accf-485e-9a85-29c1b84efac7	arya@gmail.com	1212323233	super_admin	pending	2026-04-17 13:27:16.77777+05:30	2026-04-24 13:27:16.776925+05:30	\N	6ae6b893-969f-432d-a7f4-62e5f14af2d9	ce8ce90c-be9b-49de-a959-f8459663593a	2263dc2c-c794-4dbc-b560-6d1708212eb6
d7c09611-6c7c-4840-ac4a-ac3421f3b06c	gfdfhd@gmail.com	7008566160	admin	pending	2026-04-17 15:53:51.2881+05:30	2026-04-24 15:53:51.287398+05:30	\N	9b2a3376-624e-4aff-8c05-746491e1c0fb	afabcd85-1495-4ad4-8799-9a82f15c2d89	ef266648-9837-4cbc-86b1-5af95046120b
941a3521-08a5-4f2e-98a4-79e951b8813f	zxcxzc@grgesdg	2124554354	partner_manager	pending	2026-04-20 16:03:13.490488+05:30	2026-04-27 16:03:13.489871+05:30	\N	9b2a3376-624e-4aff-8c05-746491e1c0fb	ce8ce90c-be9b-49de-a959-f8459663593a	d2a3cc2e-3011-43ab-9d25-6026fc830f2d
31a87457-2244-4299-9ae7-c4f814a185de	fsffa@fgsafa.vkj	8776767676	super_admin	pending	2026-04-20 16:12:06.139339+05:30	2026-04-27 16:12:06.13876+05:30	\N	81663d19-18cb-45ac-a1c9-6a0d0c0d9e9d	ce8ce90c-be9b-49de-a959-f8459663593a	2bbad9a4-501c-4d04-92c8-1f5b891f14da
8dfb6010-62eb-4d1d-9123-763d095d938b	new@k.com	5465665656	super_admin	pending	2026-04-20 16:26:03.771673+05:30	2026-04-27 16:26:03.771168+05:30	\N	1e0ab2b3-f52e-4793-b9fd-cdceecd59e06	ce8ce90c-be9b-49de-a959-f8459663593a	dde58a11-a18e-4984-bc67-1d8ccfd5346a
9491e718-1c53-44df-bac8-ee40e81f6054	shradh@gmail.com		super_admin	pending	2026-04-21 09:58:16.602859+05:30	2026-04-28 09:58:16.602092+05:30	\N	eb995188-6dfb-4eba-9425-930f18d36d7f	ce8ce90c-be9b-49de-a959-f8459663593a	70dd5f3f-412e-4816-a258-6fc40c025bde
9f28fc77-3436-42d1-87f9-6cd52b3430ee	lipika@gmail.com	6453645343	admin	pending	2026-04-21 10:19:33.936726+05:30	2026-04-28 10:19:33.936084+05:30	\N	eb995188-6dfb-4eba-9425-930f18d36d7f	70dd5f3f-412e-4816-a258-6fc40c025bde	08928500-f6fb-4fc2-9411-69d237eb44eb
8e3b6b47-110f-4842-8ca4-62788572ffc7	admin12@gmail	3265363463	super_admin	pending	2026-04-21 11:29:06.761078+05:30	2026-04-28 11:29:06.760671+05:30	\N	3c389772-1fb8-4472-9165-cd2607ecd66c	ce8ce90c-be9b-49de-a959-f8459663593a	0dae6e2b-0eb2-4ccc-9261-e37b567bcdcc
86e1de34-2fb1-4c14-8ef5-4f748c5362b1	admin5535@gmail.com	3424243422	partner_manager	pending	2026-04-21 11:33:14.076125+05:30	2026-04-28 11:33:14.075782+05:30	\N	3c389772-1fb8-4472-9165-cd2607ecd66c	ce8ce90c-be9b-49de-a959-f8459663593a	67c30f67-0391-428c-afb9-97a597f515f8
b98ef3bf-3d75-4e47-8316-a4976ca28beb	subham@ajamail.com	9996636990	super_admin	pending	2026-04-23 12:23:35.602664+05:30	2026-04-30 12:23:35.601927+05:30	\N	1362c7a1-e7b3-40cf-846a-bdd37a526b5a	ce8ce90c-be9b-49de-a959-f8459663593a	4df8ea5f-ddb8-47c5-9d59-34af552ff821
f65c12d3-f2a7-41af-9000-82440d38c80d	jd@zoho.com	6333395568	partner_manager	pending	2026-04-23 12:26:12.556607+05:30	2026-04-30 12:26:12.556183+05:30	\N	1362c7a1-e7b3-40cf-846a-bdd37a526b5a	ce8ce90c-be9b-49de-a959-f8459663593a	036cca57-42e0-4e9e-8571-e65e5e810d8e
5711dd76-1f7f-42d4-929c-dc71efd0dbcd	hsg@gmail.com	45435435	paralegal	pending	2026-05-04 17:07:53.121917+05:30	2026-05-11 17:07:53.121335+05:30	\N	\N	2594cfb1-8985-42d5-a068-13a6c277b5ee	f3b04f63-da8b-40ed-b7f5-12f1b29cde4f
77bb1245-5c76-40b1-aa4f-1e0735639385	para@gmail.com	4343434343	paralegal	pending	2026-05-06 09:49:38.464589+05:30	2026-05-13 09:49:38.464175+05:30	\N	eb995188-6dfb-4eba-9425-930f18d36d7f	70dd5f3f-412e-4816-a258-6fc40c025bde	66a74a9e-7334-49fb-bfb0-15d9bf2df9f0
f17f891d-6c54-421a-befe-a80a9c62001b	shsh@gmail.com	43243243	paralegal	pending	2026-05-06 10:05:13.146649+05:30	2026-05-13 10:05:13.146276+05:30	\N	\N	2594cfb1-8985-42d5-a068-13a6c277b5ee	2403e43f-02f7-46a2-ae48-253ca3dcb43d
2f3501fe-1fd6-4282-b9bc-005a21c0dfbb	erewr@lawfirm.com	3453535	paralegal	pending	2026-05-06 13:18:01.651014+05:30	2026-05-13 13:18:01.650255+05:30	\N	6ae6b893-969f-432d-a7f4-62e5f14af2d9	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	e3c89f4a-264a-4d7f-9625-d7f57e7f2c4f
9bafca39-ebe6-495e-a32f-07e4c07cc120	erdfddfdewr@lawfirm.com	4343432432	advocate	pending	2026-05-06 13:20:42.866259+05:30	2026-05-13 13:20:42.865873+05:30	\N	6ae6b893-969f-432d-a7f4-62e5f14af2d9	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	820579bf-7d1b-4962-9eb3-426df0ab292a
6f48d7d2-e43a-4758-8fc8-fee85f711be5	gdfgd@fgcx.fj	3232355456	advocate	pending	2026-05-06 13:47:39.00998+05:30	2026-05-13 13:47:39.0094+05:30	\N	9b2a3376-624e-4aff-8c05-746491e1c0fb	afabcd85-1495-4ad4-8799-9a82f15c2d89	3c2bbe9e-2cb3-448f-b108-76376575b6af
9e93703d-e2e1-47a4-ad6c-fba29a82f184	ADQEQ@eff.fdsfdsf	3456785432	advocate	pending	2026-05-06 15:41:32.061001+05:30	2026-05-13 15:41:32.060468+05:30	\N	9b2a3376-624e-4aff-8c05-746491e1c0fb	afabcd85-1495-4ad4-8799-9a82f15c2d89	3fb6fabb-c535-4bda-a1f0-14a7d0685b17
dcbc591d-3725-482b-a897-b72e25e462bb	fdsafas@fgzfg.fdsfsa	7654345678	advocate	pending	2026-05-06 15:42:02.259186+05:30	2026-05-13 15:42:02.258747+05:30	\N	9b2a3376-624e-4aff-8c05-746491e1c0fb	afabcd85-1495-4ad4-8799-9a82f15c2d89	1ba45842-9737-4c7b-83d9-4f957048b574
9a0b586e-7a5d-44bf-8492-a7466a82f9c5	gdf@gmail.com	4545455	paralegal	pending	2026-05-06 15:50:48.722744+05:30	2026-05-13 15:50:48.722172+05:30	\N	\N	115b1e64-92b3-452d-9279-99dbb7911593	d99be6c0-1d66-430e-bed8-c9d3f86732ab
0ae8c81a-b8b5-4f56-8ad0-8aeeff9a22d9	subratadmin@saxena.com	8989565623	admin	pending	2026-05-09 13:45:09.900107+05:30	2026-05-16 13:45:09.899377+05:30	\N	9b2a3376-624e-4aff-8c05-746491e1c0fb	afabcd85-1495-4ad4-8799-9a82f15c2d89	cfea0561-f92d-4eb8-90ff-7574f812dc63
\.


--
-- Data for Name: audit_auditlog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.audit_auditlog (id, action, description, ip_address, user_agent, created_at, user_id, firm_id, resource_id, resource_type) FROM stdin;
1d8d6c69-4aa0-43f8-9e94-82155d4eb19b	login	Login via username/password	\N		2026-04-08 16:32:35.231579+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
5e7e5f6f-e3b7-4914-b943-b86a979c64ef	login	Login via username/password	\N		2026-04-08 16:57:29.952531+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
4d884b71-9779-4554-ba39-2005b9cdb528	login	Login via username/password	\N		2026-04-08 16:59:39.1873+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
a8b35959-d16c-45fd-94c1-3dd021c98e0e	logout	User logged out	\N		2026-04-08 16:59:42.980015+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
8086b891-1445-4fab-aded-3642a17e8b82	login	Login via username/password	\N		2026-04-08 17:02:33.761273+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
3035c94c-53c7-4be0-8613-f6883156a0cd	login	Login via username/password	\N		2026-04-08 17:13:48.837884+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
2fa27cde-dece-404e-92c0-9b942cae3f52	logout	User logged out	\N		2026-04-08 17:14:30.790613+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
dad4f32c-39d9-4c41-b418-08d4b2242bba	login	Login via username/password	\N		2026-04-08 17:14:43.826197+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
9bfc5bd8-bfb6-4d18-8d7f-6b8da68aea85	login	Login via username/password	\N		2026-04-08 17:15:51.508318+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
2fc27f58-9393-43dd-bd6b-f16bf2dee83e	create_user	Client self-registered	\N		2026-04-08 17:16:00.625446+05:30	17265c17-ad13-4fb7-8b49-cda765078dbb	\N	\N	\N
7122d636-6233-4638-9349-6605f0ebc4e5	create_user	Added Super Admin (Firm Owner): Test SuperAdmin to Test Law Firm 1775648754	\N		2026-04-08 17:16:01.193385+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
9d111129-650e-4308-92d0-1b211d25c3f5	create_user	Added Partner Manager: Test Partner to Test Law Firm 1775648754	\N		2026-04-08 17:16:01.797039+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
25e82b95-eb1c-44aa-8bb3-35beae5d5b69	login	Login via username/password	\N		2026-04-08 17:16:09.244397+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
4a06a7a8-2983-4f75-8c37-e24f9b2b0610	logout	User logged out	\N		2026-04-08 17:16:27.373953+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
715035b9-a8d2-44dd-99f2-c35db4c17108	login	Login via username/password	\N		2026-04-08 17:21:24.612206+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
8c58f483-6900-48a7-8160-9c2b6f4abcf3	login	Login via username/password	\N		2026-04-08 17:21:44.855581+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
a15abdfc-ca5d-4d8a-9271-42b9ac936b15	login	Login via username/password	\N		2026-04-08 17:24:09.59468+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
aadedef9-988d-405d-a309-4adea84a7015	login	Login via username/password	\N		2026-04-08 17:24:20.447873+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
66d45cf3-fd8c-41bc-985d-5392d248ad7d	create_user	Client self-registered	\N		2026-04-08 17:24:22.818264+05:30	e95a953e-f5cb-494b-a19d-2ae9c5a9cf0e	\N	\N	\N
99b26344-e151-4d3f-99ff-875c89031a0a	create_user	Added Super Admin (Firm Owner): Test SuperAdmin to Test Law Firm 1775649261	\N		2026-04-08 17:24:24.05433+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
8e8624a5-af57-4136-acd3-74306751ec2e	create_user	Added Partner Manager: Test Partner to Test Law Firm 1775649261	\N		2026-04-08 17:24:24.304303+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
9f19c898-5962-4391-84d1-7e76400404f3	logout	User logged out	\N		2026-04-08 17:24:26.499733+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
4697ad1b-8239-4226-90a0-7c8454585735	login	Login via username/password	\N		2026-04-08 17:34:27.10734+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
de371001-11f0-4971-89ae-5c2bbb37cdf3	logout	User logged out	\N		2026-04-08 17:34:45.803695+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
019a63cf-2f29-4781-8c5a-fd5b54d8e9fe	login	Login via username/password	\N		2026-04-08 17:35:43.258523+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
2e6064c4-505f-43e0-9183-8e73efcc9bf2	logout	User logged out	\N		2026-04-08 17:36:08.562919+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
66f81600-a56d-496a-b314-2c1a66f8f49e	login	Login via username/password	\N		2026-04-08 17:46:31.146198+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
c76ac1e9-7652-49a7-8536-4984aed00a31	logout	User logged out	\N		2026-04-08 17:46:58.80617+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
2edda662-6359-4025-8e65-1aef496a0617	login	Login via username/password	\N		2026-04-08 18:29:06.609926+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
513c6e7f-55ae-4e84-b27c-053994a90e44	login	Login via username/password	\N		2026-04-09 09:51:27.118461+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
07de0476-1daa-495e-87ff-481d7e5e7a30	logout	User logged out	\N		2026-04-09 09:52:02.201291+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
167ddc37-e438-4fd8-8b51-46da0e88b3b6	create_user	Client self-registered	\N		2026-04-09 09:55:04.339681+05:30	23bd6b99-07fb-4ff1-a754-1438cd148b50	\N	\N	\N
9fe048c9-e494-4dd9-a294-f4af06c0a68e	login	Login via username/password	\N		2026-04-09 09:56:19.554959+05:30	23bd6b99-07fb-4ff1-a754-1438cd148b50	\N	\N	\N
a30764ad-f0a5-4e1c-b786-b7222f3aa428	logout	User logged out	\N		2026-04-09 09:56:37.899368+05:30	23bd6b99-07fb-4ff1-a754-1438cd148b50	\N	\N	\N
7f719781-b74c-4359-8d90-33ad35f2ad5a	login	Login via username/password	\N		2026-04-09 09:57:02.772027+05:30	23bd6b99-07fb-4ff1-a754-1438cd148b50	\N	\N	\N
dd6bc08d-41e6-4698-bc89-414f89468660	logout	User logged out	\N		2026-04-09 10:05:04.341411+05:30	23bd6b99-07fb-4ff1-a754-1438cd148b50	\N	\N	\N
b6bf7184-d17a-4162-9b51-158bfe390489	login	Login via username/password	\N		2026-04-09 10:05:21.021769+05:30	23bd6b99-07fb-4ff1-a754-1438cd148b50	\N	\N	\N
b3b194f1-2da8-4778-814e-8e136421b7a9	logout	User logged out	\N		2026-04-09 11:00:49.598836+05:30	23bd6b99-07fb-4ff1-a754-1438cd148b50	\N	\N	\N
4dcb6c42-4fc9-4ac6-bf04-9940716039c9	create_user	Client self-registered	\N		2026-04-09 11:17:23.869832+05:30	dcabe26c-3f75-4afe-b1f3-3bec679e557e	\N	\N	\N
b928e1aa-5b26-4422-ab55-ed1b61b63729	login	Login via username/password	\N		2026-04-09 12:11:12.911806+05:30	dcabe26c-3f75-4afe-b1f3-3bec679e557e	\N	\N	\N
2f8b3b43-9513-4489-bd74-0326adfcf722	create_user	Super Admin (Firm Owner) self-registered	\N		2026-04-09 12:25:58.573583+05:30	0761e14b-822b-4e25-b331-1ad7126784ea	\N	\N	\N
c3224995-3ce2-43f7-a3ee-af141fae9ca8	logout	User logged out	\N		2026-04-09 12:27:22.156795+05:30	dcabe26c-3f75-4afe-b1f3-3bec679e557e	\N	\N	\N
1d2926d8-5c57-4a53-a75c-4b98495950cc	login	Login via username/password	\N		2026-04-09 12:29:23.566409+05:30	dcabe26c-3f75-4afe-b1f3-3bec679e557e	\N	\N	\N
e0c2de18-43cb-47a8-90ee-a4d2027b7b96	logout	User logged out	\N		2026-04-09 12:30:27.300023+05:30	dcabe26c-3f75-4afe-b1f3-3bec679e557e	\N	\N	\N
e2e7d556-3f52-43c2-87b4-feecc3faebc9	login	Login via username/password	\N		2026-04-09 12:33:16.564701+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
7323c43a-1c59-407e-90ef-badc937f2047	logout	User logged out	\N		2026-04-09 12:35:45.875481+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
5a74028e-4579-45e8-83d3-d473df8173ad	create_user	Super Admin (Firm Owner) self-registered	\N		2026-04-09 12:39:46.977072+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
d02a043f-68f7-4bbc-91ae-1f7865ef2360	login	Login via username/password	\N		2026-04-09 12:48:18.055973+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
e5227b03-5611-4939-8d26-5e2e29ae7f14	logout	User logged out	\N		2026-04-09 12:48:27.281527+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
63488f46-9ae7-41c1-8cc2-0dba024f0b0f	create_user	Super Admin (Firm Owner) self-registered	\N		2026-04-09 13:07:05.418068+05:30	c75be9a0-e6bc-49d8-b024-875db6cb4911	\N	\N	\N
f16b2939-bb23-47bb-b2f8-e3ec63283a57	login	Login via username/password	\N		2026-04-09 15:19:18.451811+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
9f387127-e41e-49d9-b93a-ee94fc6e8116	logout	User logged out	\N		2026-04-09 15:23:33.425007+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
c3d85c50-3dc1-4d1c-896c-4e0889dc4cc5	login	Login via username/password	\N		2026-04-09 15:23:54.17862+05:30	dcabe26c-3f75-4afe-b1f3-3bec679e557e	\N	\N	\N
e3da3758-527e-45fc-8f56-69a0d2f10f01	logout	User logged out	\N		2026-04-09 15:23:58.110188+05:30	dcabe26c-3f75-4afe-b1f3-3bec679e557e	\N	\N	\N
00d9aa4b-a9cd-4a6f-9825-ace01ea75e1e	login	Login via username/password	\N		2026-04-09 15:24:27.103819+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
9e352edf-d8e9-4267-ab56-c4adf42ebba9	logout	User logged out	\N		2026-04-09 15:24:30.885768+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
ea4d1ed9-9b0f-420d-b663-1ce5bb1c88ff	otp_sent	OTP sent to email: subratbarik2003@gmail.com	\N		2026-04-09 15:54:39.579413+05:30	c75be9a0-e6bc-49d8-b024-875db6cb4911	\N	\N	\N
97e41e53-5996-43a1-8582-8c99c2c5890a	otp_sent	OTP sent to email: subratbarik2003@gmail.com	\N		2026-04-09 15:55:57.77907+05:30	c75be9a0-e6bc-49d8-b024-875db6cb4911	\N	\N	\N
cca28be3-0f67-4928-a113-e9613256a035	otp_verified	OTP verified via email	\N		2026-04-09 15:58:41.356268+05:30	c75be9a0-e6bc-49d8-b024-875db6cb4911	\N	\N	\N
44118aad-d4e1-4aab-b84f-7b31839bb1e5	logout	User logged out	\N		2026-04-09 15:59:11.72779+05:30	c75be9a0-e6bc-49d8-b024-875db6cb4911	\N	\N	\N
8a671b4d-299d-4ff6-8343-c6593f68932b	otp_sent	OTP sent to email: subratbarik2003@gmail.com	\N		2026-04-09 15:59:23.092258+05:30	c75be9a0-e6bc-49d8-b024-875db6cb4911	\N	\N	\N
a81358f8-ca0a-4557-968e-1b1aadc1654b	otp_sent	OTP sent to email: subratbarik2003@gmail.com	\N		2026-04-09 15:59:34.921503+05:30	c75be9a0-e6bc-49d8-b024-875db6cb4911	\N	\N	\N
e3cbafaf-02ac-4a31-a5f5-6f92788fa9ee	login	Login via username/password	\N		2026-04-09 16:06:06.250434+05:30	c75be9a0-e6bc-49d8-b024-875db6cb4911	\N	\N	\N
90dc42ee-84e3-4fe4-9a2a-43fe3a173c27	logout	User logged out	\N		2026-04-09 16:06:15.468922+05:30	c75be9a0-e6bc-49d8-b024-875db6cb4911	\N	\N	\N
f97668af-6666-496e-9903-dc6729dcdbb7	login	Login via username/password	\N		2026-04-09 16:16:59.242385+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
795577df-fd1b-4c10-9b43-989100a0bc76	login	Login via username/password	\N		2026-04-09 17:20:57.491609+05:30	c75be9a0-e6bc-49d8-b024-875db6cb4911	\N	\N	\N
51a39084-bacd-4589-b54b-b53213266836	logout	User logged out	\N		2026-04-10 11:10:53.970592+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
425fc594-e833-4988-b22b-e72819722ffa	create_user	Super Admin (Firm Owner) self-registered	\N		2026-04-10 11:15:28.680819+05:30	47e68f32-76c0-46b8-bfee-1748cee569f6	\N	\N	\N
f0665b69-0f78-48ee-b5e3-c61938a36e49	login	Login via username/password	\N		2026-04-10 11:20:39.003999+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
cedb3eb6-30cc-42f1-8a6e-6dfd741522fc	logout	User logged out	\N		2026-04-10 11:32:05.47784+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
81b7870f-87ab-4963-9ad9-875ceb8eb266	login	Login via username/password	\N		2026-04-10 11:37:09.658034+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
4c36f19f-adf9-4f1b-8fb9-68010b17d6da	logout	User logged out	\N		2026-04-10 12:22:58.672523+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
1330f9db-c850-41e3-9a3d-ccccc742e57c	create_user	Super Admin (Firm Owner) self-registered	\N		2026-04-10 12:42:35.883515+05:30	08124d12-0159-4399-ba52-90f2224ede00	\N	\N	\N
e35d69bf-0e23-4708-ae5c-483588dc5d95	logout	User logged out	\N		2026-04-10 12:43:08.526835+05:30	08124d12-0159-4399-ba52-90f2224ede00	\N	\N	\N
4a076e50-9208-4429-8b62-18b4e5d873d1	otp_sent	OTP sent to email: alokbehera407@gmail.com	\N		2026-04-10 12:44:19.648027+05:30	08124d12-0159-4399-ba52-90f2224ede00	\N	\N	\N
1702269a-5f1e-4260-961c-4084c742dfb4	otp_verified	OTP verified via email	\N		2026-04-10 12:45:02.664512+05:30	08124d12-0159-4399-ba52-90f2224ede00	\N	\N	\N
28148348-a25f-44d7-b897-60e7d6351499	otp_sent	OTP sent to email: subratbarik2003@gmail.com	\N		2026-04-10 13:24:25.758918+05:30	c75be9a0-e6bc-49d8-b024-875db6cb4911	\N	\N	\N
edd9ffef-1e92-4da1-b422-2f4366723faf	login	Login via username/password	\N		2026-04-10 13:33:21.963325+05:30	08124d12-0159-4399-ba52-90f2224ede00	\N	\N	\N
452885fe-0c3d-4386-98bf-d2d310baec7c	login	Login via username/password	\N		2026-04-10 15:25:36.164451+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
1be7674a-7640-43be-8e2f-48892d1e3246	login	Login via username/password	\N		2026-04-10 15:39:28.257535+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
140ac4e2-c2a9-435c-b376-86f4680cb7a5	login	Login via username/password	\N		2026-04-10 15:40:38.519095+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
7def0452-e4d9-4fc5-a015-9e8838a7c0ce	login	Login via username/password	\N		2026-04-10 15:40:42.411653+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
405fa4cc-f310-46ca-b3c3-1b3cb8ae9b73	login	Login via username/password	\N		2026-04-10 15:54:23.653431+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
e751979f-5b31-4886-8d39-20a3211b264f	login	Login via username/password	\N		2026-04-10 15:54:47.322044+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
28e23aa1-171b-4dcd-b9b5-2e4c6ca0c760	login	Login via username/password	\N		2026-04-10 15:56:39.633497+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
ec7c78ef-e443-4e1b-8810-9bd41f391a66	otp_sent	OTP sent to phone: 6372088453	\N		2026-04-10 15:58:07.001231+05:30	08124d12-0159-4399-ba52-90f2224ede00	\N	\N	\N
d5fd2cf9-1fab-4c5f-ab28-606a44002cc6	logout	User logged out	\N		2026-04-10 16:00:48.383591+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
49493936-16e4-40aa-82cf-fa220f1bd325	otp_sent	OTP sent to phone: 6372088453	\N		2026-04-10 16:01:01.922795+05:30	08124d12-0159-4399-ba52-90f2224ede00	\N	\N	\N
601edb8f-4231-4596-a3f3-ee95c57c3b02	otp_verified	OTP verified via phone	\N		2026-04-10 16:01:07.981321+05:30	08124d12-0159-4399-ba52-90f2224ede00	\N	\N	\N
4c47589f-50bd-4875-ae2e-a7e68e9526c1	otp_sent	OTP sent to phone: 6372088453	\N		2026-04-10 16:01:34.625015+05:30	08124d12-0159-4399-ba52-90f2224ede00	\N	\N	\N
2329e525-543f-4dd8-9c76-d9e1dde7885b	otp_verified	OTP verified via phone	\N		2026-04-10 16:01:46.851237+05:30	08124d12-0159-4399-ba52-90f2224ede00	\N	\N	\N
b47f7ca9-14ac-4bcf-b96d-110b5ff5c349	otp_verified	OTP verified via phone	\N		2026-04-10 16:03:07.624936+05:30	08124d12-0159-4399-ba52-90f2224ede00	\N	\N	\N
76d861a6-46e5-408e-b558-f1df8c7bf196	otp_sent	OTP sent to phone: 6372088453	\N		2026-04-10 16:03:53.5613+05:30	08124d12-0159-4399-ba52-90f2224ede00	\N	\N	\N
5e3e1c4f-67f3-4311-9cb3-404f41d4de7f	otp_verified	OTP verified via phone	\N		2026-04-10 16:03:58.84054+05:30	08124d12-0159-4399-ba52-90f2224ede00	\N	\N	\N
1887aa78-5418-4639-b533-4a0bec833cb9	logout	User logged out	\N		2026-04-10 16:05:16.604405+05:30	08124d12-0159-4399-ba52-90f2224ede00	\N	\N	\N
600418a1-0ffa-4552-a1ed-7de50e317ac4	otp_sent	OTP sent to phone: 1234567890	\N		2026-04-10 16:05:51.505325+05:30	a527e3db-fe90-4397-a6cd-d5ae9cd1d1e9	\N	\N	\N
e414e503-4ec2-4cbe-9846-9efe04864d82	otp_verified	OTP verified via phone	\N		2026-04-10 16:05:56.043399+05:30	a527e3db-fe90-4397-a6cd-d5ae9cd1d1e9	\N	\N	\N
73b9eca6-d83f-4544-a56e-4e57e403ef5c	logout	User logged out	\N		2026-04-10 16:05:59.823462+05:30	a527e3db-fe90-4397-a6cd-d5ae9cd1d1e9	\N	\N	\N
472bd11d-0948-4035-a22d-dfd0fe3c55c9	otp_sent	OTP sent to phone: 1122334455	\N		2026-04-10 16:06:26.195343+05:30	47e68f32-76c0-46b8-bfee-1748cee569f6	\N	\N	\N
5a707f54-8ed1-482b-8111-d7594a258aa3	otp_verified	OTP verified via phone	\N		2026-04-10 16:06:32.473544+05:30	47e68f32-76c0-46b8-bfee-1748cee569f6	\N	\N	\N
b7a4a266-1a7f-4dff-b1da-455f860c49f3	logout	User logged out	\N		2026-04-10 16:06:39.775046+05:30	47e68f32-76c0-46b8-bfee-1748cee569f6	\N	\N	\N
d9e31be2-9ac8-473f-8502-68e51c7a8280	otp_sent	OTP sent to phone: 6372088453	\N		2026-04-10 16:07:26.501915+05:30	08124d12-0159-4399-ba52-90f2224ede00	\N	\N	\N
2f58daaf-63f1-4378-8412-970f4efc9a89	otp_sent	OTP sent to phone: 6372088453	\N		2026-04-10 16:07:29.522739+05:30	08124d12-0159-4399-ba52-90f2224ede00	\N	\N	\N
db3168f9-d0f8-488f-ac86-06d70783bbcd	login	Login via username/password	\N		2026-04-10 16:08:05.661505+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
495ff68f-80d1-43d6-8cb8-ec5521917d13	login	Login via username/password	\N		2026-04-10 16:25:11.715085+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
7b757e8c-1650-4be9-8d7c-9c6666443ae2	login	Login via username/password	\N		2026-04-10 16:28:10.797622+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
a3d486a8-55eb-49bb-b042-030a02a1fde1	login	Login via username/password	\N		2026-04-10 16:35:18.224684+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
6edf7e43-7465-43fa-82cd-87c028dc670a	logout	User logged out	\N		2026-04-10 17:06:54.134775+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
efde16c5-50b6-4f01-8b40-88dc1fe01e68	login	Login via username/password	\N		2026-04-10 17:07:22.292609+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
b725348b-a802-404f-9d1a-4a5efa01a545	logout	User logged out	\N		2026-04-10 17:15:25.669803+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
3393ba15-4b88-4a38-9cc0-e636e2a56def	login	Login via username/password	\N		2026-04-10 17:15:45.757775+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
fde1d612-56a0-4cbe-9d07-eeeb5752c4ae	logout	User logged out	\N		2026-04-10 17:19:14.421389+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
fbf82644-981b-465f-b786-12646735d1b4	login	Login via username/password	\N		2026-04-10 17:21:54.419422+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
cf12ba4e-2405-4f56-902b-5e5fafbf19ce	logout	User logged out	\N		2026-04-10 17:23:04.179113+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
0bf6b7d5-a2df-4a5b-826b-d917d8eff736	login	Login via username/password	\N		2026-04-10 17:24:46.488322+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
06d35f66-6766-4d77-b454-c32898938efc	login	Login via username/password	\N		2026-04-10 17:32:05.0776+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
1f6e4917-dda9-41cc-970c-33111ac2f86b	otp_sent	OTP sent to phone: 6372088453	\N		2026-04-10 18:06:42.51704+05:30	08124d12-0159-4399-ba52-90f2224ede00	\N	\N	\N
65050bf1-84b0-489f-a938-a0d62d5ab92b	otp_verified	OTP verified via phone	\N		2026-04-10 18:06:46.769956+05:30	08124d12-0159-4399-ba52-90f2224ede00	\N	\N	\N
d0da4ff3-d47a-41df-87fb-e0f0be86fd46	login	Login via username/password	\N		2026-04-10 18:08:15.262438+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
c395522a-6b67-4994-820b-5534b883cf48	otp_sent	OTP sent to phone: 6372088453	\N		2026-04-10 18:19:13.891543+05:30	08124d12-0159-4399-ba52-90f2224ede00	\N	\N	\N
78a2bd1e-0765-4ca3-8803-94a6d32711ee	otp_verified	OTP verified via phone	\N		2026-04-10 18:19:22.374752+05:30	08124d12-0159-4399-ba52-90f2224ede00	\N	\N	\N
5e7d14f0-c484-4797-9300-2acb2588ce5f	logout	User logged out	\N		2026-04-10 18:21:56.218643+05:30	08124d12-0159-4399-ba52-90f2224ede00	\N	\N	\N
f59b2595-d226-40b4-96eb-1f996ca907a7	create_user	Client self-registered	\N		2026-04-10 18:23:21.286948+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43	\N	\N	\N
d0d9ba26-02d0-4da3-b614-565daef8236b	logout	User logged out	\N		2026-04-10 18:24:06.497546+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43	\N	\N	\N
795050f6-fb7f-4af2-b892-9b097967be11	create_user	Super Admin (Firm Owner) self-registered	\N		2026-04-10 18:25:53.900735+05:30	5c4990c4-5ddb-4031-bc04-785bc086b824	\N	\N	\N
78c3af4f-5a23-4a0a-a4eb-7f81124a5161	logout	User logged out	\N		2026-04-10 18:26:28.2476+05:30	5c4990c4-5ddb-4031-bc04-785bc086b824	\N	\N	\N
3c054118-eb29-46b4-9bde-30a738d92030	login	Login via username/password	\N		2026-04-10 18:27:22.409265+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
f1eb15c4-5c81-4d21-83c6-b3f5489148b6	create_user	Client self-registered	\N		2026-04-11 11:39:10.466741+05:30	813f9eee-e9ae-43b7-967e-6768b7f6747f	\N	\N	\N
7cd9518c-c440-421d-8348-7a108a2ae9d7	logout	User logged out	\N		2026-04-11 11:57:45.336097+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
c0ca75e2-93c4-46d0-8e5f-8ea47a7fdc20	login	Login via username/password	\N		2026-04-11 11:58:24.019222+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
adaaa574-ad0f-4236-990d-9f5927e819ed	login	Login via username/password	\N		2026-04-11 12:26:16.369691+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
8c5ad7ce-681c-4d2c-b1b9-c61216940fc2	login	Login via username/password	\N		2026-04-11 12:26:44.249458+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
4bea0afa-bc52-40d6-9da3-7da3581459d6	login	Login via username/password	\N		2026-04-11 12:29:45.862849+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
bb68694b-d421-4d83-a10f-c316bdbb630a	otp_sent	OTP sent to phone: +919876543210	\N		2026-04-11 12:29:58.277659+05:30	813f9eee-e9ae-43b7-967e-6768b7f6747f	\N	\N	\N
cfc15a1a-c98d-4374-8e1f-c7b107894314	login	Login via username/password	\N		2026-04-11 12:40:27.567756+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
b711514d-7586-4ae6-a710-dc1cbce7999c	logout	User logged out	\N		2026-04-11 13:34:10.621232+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
a54549be-2c7a-476a-928d-643f0a66def8	login	Login via username/password	\N		2026-04-11 13:34:25.627837+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
67dc48f1-0f00-455d-a52e-639083c1c0f5	create_user	Added Admin: test admin to XYZ Lawfirm	\N		2026-04-11 13:50:46.959551+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
da51b513-aabd-4bb6-90fe-e61953fd318b	logout	User logged out	\N		2026-04-11 13:51:18.096104+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
e74abf9a-4708-4795-bfaf-9403a6b69fd0	login	Login via username/password	\N		2026-04-11 13:51:23.175028+05:30	e71918c8-b14b-4ea8-9608-1a2d9632b1c4	\N	\N	\N
e86f3f11-7ffd-4be7-b69b-45f3f9d37018	logout	User logged out	\N		2026-04-11 13:51:34.044202+05:30	e71918c8-b14b-4ea8-9608-1a2d9632b1c4	\N	\N	\N
58edff14-dc9d-40e5-b3cf-cf7aae3ef297	login	Login via username/password	\N		2026-04-11 13:52:29.955816+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
b4dd5be7-4ce7-45e6-ae68-e3ff66381ced	create_user	Added Advocate: test advocate to XYZ Lawfirm	\N		2026-04-11 13:54:12.944453+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
ce976a68-2fc6-4842-b233-94fcb361dea6	login	Login via username/password	\N		2026-04-11 13:54:34.765542+05:30	ad82aa5b-ad99-4007-8b0f-56fedc7f174b	\N	\N	\N
b4cb9c9c-39f9-4dab-a768-6cbd3f3725b6	logout	User logged out	\N		2026-04-11 13:54:46.856821+05:30	ad82aa5b-ad99-4007-8b0f-56fedc7f174b	\N	\N	\N
b40fd6f8-2184-4c5a-8fe7-6ecbc438bae3	create_user	Added Paralegal: test paralegal to XYZ Lawfirm	\N		2026-04-11 13:58:43.426201+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
fc80349c-ec66-4a41-a41d-0b4e3ec455d4	create_user	Added Client: test client to XYZ Lawfirm	\N		2026-04-11 13:59:46.674206+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
90e69b09-dc96-494f-9d84-e73ca7bcf25d	login	Login via username/password	\N		2026-04-11 15:25:02.588493+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
a21ac793-59d6-4157-9cd9-79884df0ec44	logout	User logged out	\N		2026-04-11 15:34:42.798752+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
e208cf09-18a3-47d0-83b2-114f8f70b865	login	Login via username/password	\N		2026-04-11 15:35:05.079814+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
39b8f26a-b9cc-4540-b176-c7959bbc362e	create_user	Added Super Admin (Firm Owner): Subrat Barik to ABC Lawfirm	\N		2026-04-11 16:20:37.483717+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
e35e265d-a6fd-4452-bfa2-b88fbd77277b	create_user	Added Partner Manager: Surya Barik to ABC Law Firm Pvt Ltd	\N		2026-04-11 16:23:57.591197+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
57b7d41e-9e2e-418f-89d6-0065a1ce4326	logout	User logged out	\N		2026-04-11 16:49:33.969277+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
91e5dd0c-e3fc-40b9-80af-019e9c039e67	login	Login via username/password	\N		2026-04-11 16:49:54.342184+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
804dd490-5d57-4ee6-8ef2-2209305fa051	change_password	User changed password	\N		2026-04-11 16:50:12.005174+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
0365f7d1-1755-48a5-8f11-11e5434806df	logout	User logged out	\N		2026-04-11 17:14:41.979579+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
2e71b1a6-93d4-4ea7-85f8-3a30f2ac4dda	login	Login via username/password	\N		2026-04-11 17:15:00.182017+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
1998e441-a4b7-445f-ba69-a5715eca9c19	logout	User logged out	\N		2026-04-11 17:30:36.238128+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
426c6878-b9a3-4ef2-b2fc-c3686ef5be7d	login	Login via username/password	\N		2026-04-11 17:31:00.565662+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
fcb6cb2b-5eee-431f-b569-fe703935cf41	logout	User logged out	\N		2026-04-11 17:38:29.968252+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
2bf3ea68-3ae7-42b7-bf7f-85dc19888be8	login	Login via username/password	\N		2026-04-11 17:39:49.94928+05:30	dcabe26c-3f75-4afe-b1f3-3bec679e557e	\N	\N	\N
0a0bbb5a-9450-4d1a-8ef8-6330a3c0d966	login	Login via username/password	\N		2026-04-11 17:40:33.6022+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
57724a8e-1ba9-4ceb-903a-4702de5307cb	login	Login via username/password	\N		2026-04-11 17:41:50.239288+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
d2b24cd6-6b86-4401-8991-ab4a17f91d32	login	Login via username/password	\N		2026-04-11 18:03:29.276151+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
c5199a1c-3755-4718-bae5-5f547b24efdd	create_user	Added Super Admin (Firm Owner): Subrat Barik to ABC Law Firm Pvt Ltd	\N		2026-04-11 18:21:40.912386+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
1e146b5a-e893-4c70-b551-e6b22dceff25	create_user	Added Partner Manager: test partner to Subrat lawfirm	\N		2026-04-11 18:28:21.410767+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
14adf6be-4c32-43c7-ad51-031d3901b71d	logout	User logged out	\N		2026-04-11 18:29:05.107786+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
e4360b3f-e7f8-4542-acad-8c730bccd6aa	login	Login via username/password	\N		2026-04-11 18:29:18.406028+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
912b72f8-6010-4e81-836c-b4973fcef62f	login	Login via username/password	\N		2026-04-11 18:32:35.187323+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
893c240f-88f4-482e-9ffc-ac3a307bcd6f	logout	User logged out	\N		2026-04-13 10:53:05.896889+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
c9da8fe6-2bdf-4e06-8eee-8293ab3bcc10	login	Login via username/password	\N		2026-04-13 11:15:08.518104+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
2bc93604-3418-4065-b0b6-134c07bb95a1	login	Login via username/password	\N		2026-04-13 12:53:42.825158+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
6ce5dd12-f7ed-4994-9e7b-c3bc94747d72	create_user	Added Partner Manager: surya partner to testfirm2	\N		2026-04-13 13:51:46.085912+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
8e8f4603-1a4a-48bc-ab1f-b0a6c139ddcf	logout	User logged out	\N		2026-04-13 15:09:53.121708+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
ae3063b3-7462-47bf-8be1-a44753280eeb	login	Login via username/password	\N		2026-04-13 15:10:44.935686+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
c3c1b9c6-af1b-444a-9d95-d6b5d1fb628e	create_user	Added Admin: Subrat admin to XYZZ Lawfirm	\N		2026-04-13 15:59:59.369316+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
3d123d8d-8750-487d-9929-12027af41c78	create_user	Added Advocate: test  advocate 2 to XYZZ Lawfirm	\N		2026-04-13 16:11:38.890572+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
8f0ac77b-a471-49cf-b3cd-abd41eedca9b	create_user	Added Admin: alok admin to XYZZ Lawfirm	\N		2026-04-13 17:14:01.424798+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
b5f145a5-7c7e-48ca-b8af-2bbe57e0583f	login	Login via username/password	\N		2026-04-13 17:41:24.96021+05:30	1d914b5d-b935-4b96-b55e-38a2cd83f763	\N	\N	\N
44021161-4b8c-497d-85c3-07b690275bc6	logout	User logged out	\N		2026-04-13 17:46:58.38289+05:30	1d914b5d-b935-4b96-b55e-38a2cd83f763	\N	\N	\N
03c1b080-13c9-4011-a4e8-debd95c5ac0b	login	Login via username/password	\N		2026-04-13 17:47:13.001613+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
9ea0c750-6885-4cb3-b2fd-b5e4f6fd2cd5	change_password	User changed password	\N		2026-04-13 18:15:53.771553+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
f9f38cd4-63f2-4e66-ad14-d5cd69850abb	logout	User logged out	\N		2026-04-13 18:16:05.866775+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
4e09bbdc-0df0-45de-8fc7-e2943946898c	login	Login via username/password	\N		2026-04-13 18:16:24.422029+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
c01ca97d-2745-478d-bf1c-43d631c91f72	create_user	Added Admin: test admin 2 to XYZZ Lawfirm	\N		2026-04-13 18:47:28.265608+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
7fc28e6e-dde1-445e-9b68-d7c8e4757b7a	logout	User logged out	\N		2026-04-13 18:47:58.840581+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
f12844f0-f98d-422a-ad4b-c37eec78230d	login	Login via username/password	\N		2026-04-13 18:48:13.09467+05:30	4a38df05-8e96-4b50-b5ad-54598ecba542	\N	\N	\N
fc594951-df8e-4a33-a43b-2905a5326fb5	logout	User logged out	\N		2026-04-14 10:50:28.566696+05:30	4a38df05-8e96-4b50-b5ad-54598ecba542	\N	\N	\N
164cbe12-2c53-4eaa-87ed-c2c16da5948e	logout	User logged out	\N		2026-04-14 10:57:07.090228+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
2242ecde-93b1-4f80-a716-3742ef06a76c	login	Login via username/password	\N		2026-04-14 10:58:35.477816+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
425ba8a9-a009-41da-acd0-17bb32eb02e6	logout	User logged out	\N		2026-04-14 10:58:38.790043+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
607ef6f9-42b8-4c3d-b441-514010d39d9e	login	Login via username/password	\N		2026-04-14 11:04:35.132045+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
b6bceb2c-7e35-43e7-8117-40ea1eb0ccb7	login	Login via username/password	\N		2026-04-14 11:06:58.641941+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
2d006f5b-2932-4fb9-b72b-e7cb7a843e91	login	Login via username/password	\N		2026-04-14 11:15:16.942183+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
ccfc7ccd-2800-4b9b-b398-7675b256d1b1	logout	User logged out	\N		2026-04-14 13:52:06.784142+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
b85f6486-cc54-4e2d-aad5-103bcd877392	login	Login via username/password	\N		2026-04-14 13:52:19.348553+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
c2b8f752-5d0b-4ef0-b1f1-d65cb57aca52	login	Login via username/password	\N		2026-04-14 15:15:11.16539+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
1aef3998-c59b-4323-b1d7-66122d4c7d85	login	Login via username/password	\N		2026-04-14 16:19:53.075039+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
78a45767-447e-41c2-ad9f-9607d6d8e648	login	Login via username/password	\N		2026-04-15 12:27:34.589257+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
ff812719-65a1-4044-9759-381285a0fcd7	login	Login via username/password	\N		2026-04-15 12:27:39.343915+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
45edc97c-5d8f-4909-8638-eada130e77ca	login	Login via username/password	\N		2026-04-15 12:56:12.866691+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
2420d082-8117-4856-9186-07daa32ed22b	create_user	Added Client: surya client 1 to XYZZ Lawfirm	\N		2026-04-15 13:06:42.273724+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
42ab3a98-fe73-46f5-912f-bc44883b61ce	login	Login via username/password	\N		2026-04-15 13:33:39.187787+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
ac3fbc0f-5aa5-4174-81bd-76f12af3daf4	login	Login via username/password	\N		2026-04-15 17:33:04.170219+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
71379dea-3212-41a2-a269-e8fa93cb8dc0	logout	User logged out	\N		2026-04-15 17:53:19.150749+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
bf9533ff-0ca5-4733-aada-4fb5316bd459	login	Login via username/password	\N		2026-04-15 17:53:31.201953+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
7a358139-96b6-473f-98fb-c0defaa594e1	logout	User logged out	\N		2026-04-15 17:55:21.217868+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
795dc3f5-6596-4e4f-a7e6-9e95295bc8bf	login	Login via username/password	\N		2026-04-15 17:55:26.346472+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
1018a9d3-8c35-4851-ac1e-d23bbc2ee898	logout	User logged out	\N		2026-04-15 17:55:41.341736+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
1cacfa03-2a67-49ae-bfb7-6034c2bbbb0f	login	Login via username/password	\N		2026-04-15 17:55:46.400584+05:30	e71918c8-b14b-4ea8-9608-1a2d9632b1c4	\N	\N	\N
6f5b5c94-3be6-43ef-a344-a11c4f507e22	login	Login via username/password	\N		2026-04-15 17:59:07.699276+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
7464d319-05bb-45cb-a04a-cbee7a671aad	logout	User logged out	\N		2026-04-15 17:59:13.076543+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
6d0588ab-34fe-4d73-9bf5-3ac9cd7d2119	login	Login via username/password	\N		2026-04-15 17:59:24.877695+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
0de63972-b2ef-4814-b68d-da985300e494	logout	User logged out	\N		2026-04-15 17:59:30.244937+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
73a80109-eb6e-4980-9abe-c1b06b91585b	login	Login via username/password	\N		2026-04-15 17:59:38.695327+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
52dfa68d-6ce7-493c-9a7d-472d69b135f0	logout	User logged out	\N		2026-04-15 18:01:06.805635+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
eb1c9b9f-96d1-4c24-82dd-a67340d2ec9b	login	Login via username/password	\N		2026-04-15 18:01:14.602061+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
c125df31-9a16-4503-931c-1a74200ebae1	logout	User logged out	\N		2026-04-15 18:03:31.6732+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
fef2c5f1-49e1-4111-b176-7cd5892eb73b	login	Login via username/password	\N		2026-04-15 18:03:40.851907+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
9928e0fa-0453-4642-a5b4-373c3ffd95a5	logout	User logged out	\N		2026-04-15 18:05:16.584916+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
cdd340c1-1d96-461f-a058-427d0d68a4a7	login	Login via username/password	\N		2026-04-15 18:05:29.28085+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
09aea3b2-7b02-4c1d-a006-b11092a3ad3e	logout	User logged out	\N		2026-04-15 18:08:52.299437+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
ecc69f9b-92a5-4284-a436-b039da0150c6	login	Login via username/password	\N		2026-04-15 18:09:12.608792+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
3edb8a1e-bafe-448b-a1c8-03975cf1b56b	logout	User logged out	\N		2026-04-15 18:09:25.753694+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
bfc3dfc7-fbcc-42c6-bb0d-2afecd87547e	login	Login via username/password	\N		2026-04-15 18:09:33.462614+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
00bedd9d-4667-4dc7-ba4a-6169908393ae	logout	User logged out	\N		2026-04-15 18:10:39.358551+05:30	e71918c8-b14b-4ea8-9608-1a2d9632b1c4	\N	\N	\N
ce30fac7-9baf-4eb2-a800-75bae2168ef0	login	Login via username/password	\N		2026-04-15 18:10:51.071113+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
ffadc7ff-5edf-46ac-9e01-a6cc52a3faa0	login	Login via username/password	\N		2026-04-15 18:18:16.034216+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
7b48c105-de1e-4491-9bf6-72f3d0beedd3	logout	User logged out	\N		2026-04-15 18:19:12.281573+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
cb54f74c-2c91-4b62-9ef9-356a87ede483	login	Login via username/password	\N		2026-04-15 18:19:58.60601+05:30	e71918c8-b14b-4ea8-9608-1a2d9632b1c4	\N	\N	\N
671e80e5-8eae-4af3-9808-9c616923e826	logout	User logged out	\N		2026-04-15 18:22:45.822556+05:30	e71918c8-b14b-4ea8-9608-1a2d9632b1c4	\N	\N	\N
2f8d5319-6f12-41dc-85fe-ce011c077719	login	Login via username/password	\N		2026-04-15 18:23:03.082985+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
44e716c8-0257-4c22-86ff-8e2a7c293a92	logout	User logged out	\N		2026-04-15 18:39:31.043175+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
88490078-44a7-488e-8c8e-fd9f7e5c6524	create_user	Super Admin (Firm Owner) self-registered	\N		2026-04-15 18:43:23.764247+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
c70a527c-3100-4352-ab82-d0220e38d032	logout	User logged out	\N		2026-04-15 18:46:45.778228+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
37798889-c42e-4d27-82b9-c5e26db571d1	login	Login via username/password	\N		2026-04-16 11:18:36.982986+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
6bfeac53-8f95-4111-b283-9bdc5377a749	login	Login via username/password	\N		2026-04-16 11:46:08.765635+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
145f9546-dca1-461d-9000-981a25b4fa13	login	Login via username/password	\N		2026-04-16 11:54:32.270498+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
38e735ab-6f30-4770-ad26-c6e11297f032	login	Login via username/password	\N		2026-04-16 11:55:41.885536+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
a92a8399-eb89-4dfe-a452-b48a09728c40	login	Login via username/password	\N		2026-04-16 12:05:04.912454+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
ef8a0164-33dd-4370-a4c2-f34cbf6cb2bf	logout	User logged out	\N		2026-04-16 12:33:38.786764+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
70fddada-3676-4a37-8d5a-6c6cca1d5fca	login	Login via username/password	\N		2026-04-16 12:33:53.209029+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
0dd905b5-a4c7-445b-9f9e-2edc348345b1	logout	User logged out	\N		2026-04-16 13:38:30.701336+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
dec3838c-c424-4780-99f1-ce3752b5061a	login	Login via username/password	\N		2026-04-16 13:38:52.529397+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
3c8fdc66-dbd0-47fd-a306-3913e2f521a7	login	Login via username/password	\N		2026-04-16 13:39:39.211755+05:30	1d914b5d-b935-4b96-b55e-38a2cd83f763	\N	\N	\N
8c349b97-69af-4937-8180-97778686c53d	login	Login via username/password	\N		2026-04-16 16:28:56.710076+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
9a1debd3-9245-4be6-bdff-477d0f18f4c7	otp_sent	OTP sent to phone: 7008639757	\N		2026-04-16 16:29:57.675123+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43	\N	\N	\N
4323db7b-6cd3-440f-a500-5e349b94037a	otp_verified	OTP verified via phone	\N		2026-04-16 16:30:32.08117+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43	\N	\N	\N
233e56f1-0a36-4562-9ca8-f9afb1225dc1	login	Login via username/password	\N		2026-04-16 16:31:16.097787+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
3b35129e-ff92-4885-9731-70291c96b6e8	logout	User logged out	\N		2026-04-16 16:31:30.205618+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43	\N	\N	\N
2092c042-e49a-4746-82cd-f65808a30e6d	update_config	Updated global configuration	\N		2026-04-16 16:32:06.607616+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
7bf67c3f-21ac-4835-bfb8-548500ad134a	logout	User logged out	\N		2026-04-16 16:32:25.084356+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
d73fa0b5-b2bf-4a31-a68b-d3937390aa25	otp_sent	OTP sent to phone: 7008639757	\N		2026-04-16 16:46:58.04502+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43	\N	\N	\N
3e63743e-ac89-4c08-a202-e2363580ead9	otp_verified	OTP verified via phone	\N		2026-04-16 16:47:07.890928+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43	\N	\N	\N
3b07a089-88d3-488e-82b9-71a22249a478	login	Login via username/password	\N		2026-04-16 17:10:22.541526+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
0c84ccf6-2a2a-4cc2-a3fb-9bd1f1002700	logout	User logged out	\N		2026-04-16 17:10:49.96788+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
e1ff892e-d1cc-4826-aa95-1d73649b5afa	login	Login via username/password	\N		2026-04-16 17:11:03.795009+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
d082dba2-30d9-4024-a686-3804261f8082	logout	User logged out	\N		2026-04-16 17:13:09.413653+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
4de584cf-4b24-4c56-bb89-b332d3a9e3bc	login	Login via username/password	\N		2026-04-16 17:13:23.915471+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
bdc90919-7ca5-4791-a509-7d0dbdc5a9c5	login	Login via username/password	\N		2026-04-16 17:15:09.302349+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
1da179cb-699e-4067-9ba2-24b08bb0f99a	login	Login via username/password	\N		2026-04-16 17:42:35.178773+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
5b2708f3-2611-442d-9446-cd3db009bf46	logout	User logged out	\N		2026-04-16 18:26:04.14093+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
8df5da86-203a-4d13-aa16-05bf45fc36c7	login	Login via username/password	\N		2026-04-16 18:26:14.861301+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
2b4aa598-3e82-451a-847b-40a08d2eaa92	login	Login via username/password	\N		2026-04-16 18:28:37.587178+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
bf7c43fa-39dd-42f2-b35f-a593cb049ac6	login	Login via username/password	\N		2026-04-16 18:30:14.767435+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
29340bf5-6edb-421f-b940-7725f8895e6f	logout	User logged out	\N		2026-04-17 09:50:34.862298+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
3a8f0749-9e8a-46e9-9a7c-2763fa305867	login	Login via username/password	\N		2026-04-17 09:50:48.51339+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
e8a565cb-08e0-485c-b69c-f3dbece4c413	login	Login via username/password	\N		2026-04-17 10:15:25.411656+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
006382a5-df27-47de-82c1-25687b132acf	otp_sent	OTP sent to phone: 7008639757	\N		2026-04-17 11:53:58.315723+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43	\N	\N	\N
2b8c8998-dcf8-4b5d-9807-4866cb510d1a	otp_verified	OTP verified via phone	\N		2026-04-17 11:54:03.8713+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43	\N	\N	\N
dae47056-9080-45ee-abb6-a680f88a9353	login	Login via username/password	\N		2026-04-17 12:03:08.629987+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
1625472a-271d-41ab-a62a-cb645cd591e6	login	Login via username/password	\N		2026-04-17 12:04:16.828945+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
36877421-370c-411b-855c-89e8d4158ba3	change_password	User changed password	\N		2026-04-17 12:05:57.608777+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
b4433b39-a8a9-4e14-8a1d-129cec0ace28	change_password	User changed password	\N		2026-04-17 12:06:37.720879+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
f428ad02-dd53-4e36-8983-f94cccc24b3a	update_config	Updated global configuration	\N		2026-04-17 12:06:54.417851+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
73ed7b41-dd80-435f-b37f-a56b379d8ba4	update_config	Updated global configuration	\N		2026-04-17 12:13:25.629302+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
155be1fd-b1fa-4eee-86a5-5a0c32119a0c	update_config	Updated global configuration	\N		2026-04-17 12:13:31.114543+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
760da925-986f-4f05-ad8e-cb2a3569fa42	create_join_link	Created admin join link for XYZZ Lawfirm	\N		2026-04-17 12:14:54.507622+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
6dc05373-e2d3-4238-8414-cacf359b6a20	create_join_link	Created advocate join link for XYZZ Lawfirm	\N		2026-04-17 12:15:13.483921+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
b94ed965-da7c-41fa-8d64-a4bded01d89a	create_join_link	Created paralegal join link for XYZZ Lawfirm	\N		2026-04-17 12:15:20.992591+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
434b970f-a5f1-492e-9b15-8d11507356a2	create_join_link	Created client join link for XYZZ Lawfirm	\N		2026-04-17 12:21:04.200448+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
8711338c-46bb-4978-8cc2-706cfc44f4e9	create_join_link	Created client join link for XYZZ Lawfirm	\N		2026-04-17 12:22:47.816685+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
64027b8e-4fe4-4761-84ad-0dc9b75d7699	create_join_link	Created advocate join link for XYZZ Lawfirm	\N		2026-04-17 12:22:52.486632+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
ba9dde79-42ee-42e5-ab67-dcbee34dd303	create_join_link	Created advocate join link for XYZZ Lawfirm	\N		2026-04-17 12:26:14.662066+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
d3b11940-1b86-49fd-9663-03c46fb003a8	update_config	Updated global configuration	\N		2026-04-17 12:26:28.940367+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
4e55f265-08dc-4690-8880-782a25c1e4c8	logout	User logged out	\N		2026-04-17 12:26:42.083756+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
cca09c7d-2fa5-4e44-ac86-159fae1f9670	create_user	Client self-registered	\N		2026-04-17 12:29:10.280045+05:30	285a9e83-e3ae-4680-a774-80d0e38ef773	\N	\N	\N
ddd3b8df-ddeb-44ea-b78f-edf2bf9235ad	logout	User logged out	\N		2026-04-17 12:29:18.605039+05:30	285a9e83-e3ae-4680-a774-80d0e38ef773	\N	\N	\N
e4777c36-6f6b-468a-97cb-1c5cdb8d6283	update_config	Updated global configuration	\N		2026-04-17 12:35:34.625704+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
f3f5cbb3-da72-4f9f-9fa2-ec94dd04b2e5	login	Login via username/password	\N		2026-04-17 12:40:40.856+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
5993d9df-3ff7-4bcf-a0a2-83bf12be4ceb	update_config	Updated global configuration	\N		2026-04-17 12:40:41.883786+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
448c6539-047d-4393-a9dd-19e9f33f1c6c	update_config	Updated global configuration	\N		2026-04-17 12:41:25.477421+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
8dd27e1a-0081-4332-aa37-049d0702c667	login	Login via username/password	\N		2026-04-17 12:45:52.718966+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
8348461d-0f63-481c-85d5-398e1fd2b5e1	create_join_link	Created admin join link for XYZZ Lawfirm	\N		2026-04-17 12:46:09.67772+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
c1b09d7b-7adf-4b4e-9e8b-32a6cdd9a3bf	create_join_link	Created admin join link for XYZZ Lawfirm	\N		2026-04-17 12:53:10.69075+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
9f3b9b72-9bb4-4b23-9e0d-a140748dcd07	create_join_link	Created admin join link for XYZZ Lawfirm	\N		2026-04-17 12:53:19.268213+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
f0bdf914-7c2c-4adf-8596-960b43fac72a	join_via_link	Joined XYZZ Lawfirm via generic link as Admin	\N		2026-04-17 12:54:29.238744+05:30	139b2b54-06b6-4e1b-9469-bbda62e773d3	\N	\N	\N
82b6006f-4afe-46e3-9cdc-a64cc1ef4f97	update_config	Updated global configuration	\N		2026-04-17 12:55:08.24812+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
2fb8e13f-955f-47d7-8f29-7d59aa693171	update_config	Updated global configuration	\N		2026-04-17 12:55:37.739865+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
95d09c81-2fc4-435d-b517-6a0ddf4ea798	update_config	Updated global configuration	\N		2026-04-17 12:58:14.607653+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
7b78b062-1758-435e-a7aa-f58bfc155cb3	update_config	Updated global configuration	\N		2026-04-17 13:07:05.947524+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
9ec2f912-a313-49ab-ac42-1a6409a82cbf	create_user	Added Super Admin (Firm Owner): test admin arya  2 to XYZZ Lawfirm	\N		2026-04-17 13:27:20.546359+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
05975fd0-6029-49f2-9c18-868cacbbcff2	logout	User logged out	\N		2026-04-17 13:27:21.574149+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
b622089a-6938-4efc-9d15-386e13941bf8	create_join_link	Created advocate join link for XYZZ Lawfirm	\N		2026-04-17 13:30:40.004254+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
695eaf3b-66c1-4423-8ecd-f286081d4e19	join_via_link	Joined XYZZ Lawfirm via generic link as Advocate	\N		2026-04-17 13:32:09.241412+05:30	c972c8b6-00f9-43fa-80ef-45253e7ac6c3	\N	\N	\N
4f0468a8-66cb-4344-b49e-00d8033bc82b	login	Login via username/password	\N		2026-04-17 13:44:52.54362+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
1811a8d4-9268-4743-8f27-ee50473917af	suspend_firm	Suspended firm: Saxena & Saxena Lawfirms	\N		2026-04-17 13:50:59.667906+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
86b0e3e6-3a51-4c5c-a99a-8b86584f348e	unsuspend_firm	Unsuspended firm: Saxena & Saxena Lawfirms	\N		2026-04-17 13:51:01.95368+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
1f0762eb-c44e-4a82-b3c0-5c43d5db9395	unsuspend_firm	Unsuspended firm: testfirm2	\N		2026-04-17 13:51:04.033311+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
ec8b8e43-f590-40f4-b94d-6de24419a3d1	login	Login via username/password	\N		2026-04-17 13:52:19.413212+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
c752133d-14ab-468d-ad61-fb4f38fb183e	suspend_firm	Suspended firm: xyzz Lawfirm	\N		2026-04-17 13:58:41.492045+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
a17a43f9-4e19-4d06-af6b-c0296192fcb1	suspend_firm	Suspended firm: XYZZ Lawfirm	\N		2026-04-17 15:14:33.428018+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
cb95a563-498f-49a1-927b-4c8703e67236	unsuspend_firm	Unsuspended firm: XYZZ Lawfirm	\N		2026-04-17 15:14:35.375039+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
ba5a9901-2dbe-405b-9670-841c9097ab11	login	Login via username/password	\N		2026-04-17 15:30:56.572759+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
6fb4730b-fe88-4f66-80fc-b34b2bcc26e9	logout	User logged out	\N		2026-04-17 15:32:56.231775+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
4ec480bb-9ec1-4398-84ed-ffd545de4890	login	Login via username/password	\N		2026-04-17 15:33:25.229442+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
1b9e91ac-b1ae-4d55-be91-ba467339e5bd	create_join_link	Created client join link for Saxena & Saxena Lawfirms	\N		2026-04-17 15:34:36.479407+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
9682785d-5d03-4be6-a4c4-e7212e88bb99	join_via_link	Joined Saxena & Saxena Lawfirms via generic link as Client	\N		2026-04-17 15:35:22.566358+05:30	fcde59a6-01eb-46cf-9e40-344f8282b54a	\N	\N	\N
037001ff-294f-4577-b239-4038b0d34cdc	login	Login via username/password	\N		2026-04-17 15:37:47.12117+05:30	fcde59a6-01eb-46cf-9e40-344f8282b54a	\N	\N	\N
7185b0c8-f2ef-4956-bd1b-94a64559f4e3	create_join_link	Created advocate join link for Saxena & Saxena Lawfirms	\N		2026-04-17 15:39:10.69293+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
370ecf43-4d0e-4aef-893d-fefac83a632c	join_via_link	Joined Saxena & Saxena Lawfirms via generic link as Advocate	\N		2026-04-17 15:39:48.841275+05:30	744dd8b0-1403-4473-8d3a-2787f061c05a	\N	\N	\N
d72ca258-a5c4-4d5f-9a53-0a537a77f5b6	logout	User logged out	\N		2026-04-17 15:44:39.875366+05:30	744dd8b0-1403-4473-8d3a-2787f061c05a	\N	\N	\N
b1046475-7525-4254-82ce-fbcde309ed2b	create_user	Added Admin: SHRADHA SAHOO to Saxena & Saxena Lawfirms	\N		2026-04-17 15:53:55.185714+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
9895b027-0f50-4e95-b1ee-f056218adbf5	login	Login via username/password	\N		2026-04-17 16:59:16.546779+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
2f0ced0d-d94b-4d73-8497-cb6843879bd0	logout	User logged out	\N		2026-04-17 17:01:15.60964+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
661b067f-e1a1-4551-92a8-4e646612b813	logout	User logged out	\N		2026-04-17 17:02:33.933055+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
35af342f-6b8e-456f-a4de-567e1210dda5	login	Login via username/password	\N		2026-04-17 17:02:53.322464+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
370a66fd-f99f-46ca-81a8-cca21dcf8faa	create_join_link	Created client join link for XYZZ Lawfirm	\N		2026-04-17 17:03:39.32693+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
6c54876c-032b-4653-8e73-e72347a919d5	create_join_link	Created advocate join link for XYZZ Lawfirm	\N		2026-04-17 17:03:58.234409+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
0aa0421b-aaf7-4bf6-ba9d-a3cde87a5958	join_via_link	Joined XYZZ Lawfirm via generic link as Advocate	\N		2026-04-17 17:05:00.862842+05:30	6fd29da0-7080-4382-aaa8-77caa8ef0482	\N	\N	\N
5b48df29-0270-4433-8cc1-7d55cafb23dc	create_join_link	Created advocate join link for XYZZ Lawfirm	\N		2026-04-17 17:09:39.962529+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
27b844d9-beea-445c-85e8-4f8735a29495	create_join_link	Created client join link for XYZZ Lawfirm	\N		2026-04-17 17:09:45.038233+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
06205701-1707-4d80-9f24-b745e586c92c	join_via_link	Joined XYZZ Lawfirm via generic link as Client	\N		2026-04-17 17:10:42.607615+05:30	6136f201-bfb6-4e41-bf1e-cb9f231549a5	\N	\N	\N
9aa24fae-eb5a-4841-8c47-1b8066b64166	logout	User logged out	\N		2026-04-17 17:22:07.73483+05:30	6136f201-bfb6-4e41-bf1e-cb9f231549a5	\N	\N	\N
d0905a70-21ea-4320-9b95-751fff93d2f8	login	Login via username/password	\N		2026-04-17 17:22:52.219464+05:30	6fd29da0-7080-4382-aaa8-77caa8ef0482	\N	\N	\N
107266be-1142-4353-878e-1a049617d6cc	logout	User logged out	\N		2026-04-17 17:36:10.086556+05:30	6fd29da0-7080-4382-aaa8-77caa8ef0482	\N	\N	\N
a8ada674-1763-4a9d-8f2a-808b04a0e922	login	Login via username/password	\N		2026-04-17 17:36:43.214589+05:30	6136f201-bfb6-4e41-bf1e-cb9f231549a5	\N	\N	\N
4f52116b-bb29-4ae3-8729-6af5eaea48e7	change_password	User changed password	\N		2026-04-17 17:54:32.290497+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
9b07a0d9-a477-437a-a73f-5f6a166bc559	create_join_link	Created advocate join link for Saxena & Saxena Lawfirms	\N		2026-04-17 18:29:40.332183+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
9ecabd48-917f-4374-a30b-1caac7ba3cdb	join_via_link	Joined Saxena & Saxena Lawfirms via generic link as Advocate	\N		2026-04-17 18:30:41.025441+05:30	3b606ec3-0b52-4b70-a076-135e2185e64d	\N	\N	\N
7c615c52-0aa3-4c8e-a2a3-a7c8410a9f73	create_join_link	Created client join link for Saxena & Saxena Lawfirms	\N		2026-04-17 18:34:26.138472+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
c557583b-0c53-472c-a59d-ecb9eb4a43eb	login	Login via username/password	\N		2026-04-17 18:34:53.380093+05:30	6136f201-bfb6-4e41-bf1e-cb9f231549a5	\N	\N	\N
7bb751df-cb3e-4f05-90a0-1ff0c3bbdfc5	otp_sent	OTP sent to phone: 7008639757	\N		2026-04-17 20:51:43.599998+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43	\N	\N	\N
fdf0f786-6d8e-47a0-9a01-602010b97501	otp_verified	OTP verified via phone	\N		2026-04-17 20:51:48.975976+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43	\N	\N	\N
91672bb7-4fe5-4414-9d82-512dc0f3fc28	logout	User logged out	\N		2026-04-17 20:54:52.609729+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43	\N	\N	\N
b6064818-a35f-403d-98d5-52ca653bad62	otp_sent	OTP sent to email: bibhu.phy@gmail.com	\N		2026-04-17 20:55:06.81455+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43	\N	\N	\N
75d7f67d-120e-4794-8dac-f184704e68f7	otp_verified	OTP verified via email	\N		2026-04-17 20:55:30.798029+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43	\N	\N	\N
205fa3d3-356f-445b-893b-ab4b31daf8c8	logout	User logged out	\N		2026-04-17 20:55:50.024495+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43	\N	\N	\N
567eb9ec-ce1f-436f-801f-0da9cbc05a86	login	Login via username/password	\N		2026-04-17 22:40:57.329047+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
e0dec4c4-880b-42be-9c76-b4887dcbc07a	update_config	Updated global configuration	\N		2026-04-17 22:41:18.904384+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
1f39a46c-0338-49d8-903a-489e7a229092	logout	User logged out	\N		2026-04-17 22:44:16.21652+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
e08c3c21-a66c-4224-8a3c-d89d75158d10	otp_sent	OTP sent to phone: 7008639756	\N		2026-04-17 22:44:24.367633+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
38266c52-5334-4e8d-b12f-3347163a6e97	otp_verified	OTP verified via phone	\N		2026-04-17 22:44:28.642556+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
31ecc83f-63ae-49ee-8554-5552e59a44dd	login	Login via username/password	\N		2026-04-18 12:16:37.264888+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
c171cbc0-788f-43e0-a19d-c7fb4dac3ac1	logout	User logged out	\N		2026-04-18 12:17:07.664684+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
995842c0-68f4-4242-b453-10efea19391c	login	Login via username/password	\N		2026-04-18 12:17:19.426242+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
d795394f-613b-4d7f-a72f-07c3f2a77dbb	create_join_link	Created advocate join link for Saxena & Saxena Lawfirms	\N		2026-04-18 12:20:09.352779+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
fef53751-50f1-418f-b49c-4603cd587f5f	join_via_link	Joined Saxena & Saxena Lawfirms via generic link as Advocate	\N		2026-04-18 12:21:09.940855+05:30	bee18ba6-be01-4c4b-82ff-3103e307fc95	\N	\N	\N
c8e7fda2-6995-4edd-9e3f-446a471c9c25	login	Login via username/password	\N		2026-04-19 13:40:42.322492+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
3b25cbeb-f80b-4a96-917c-3dd51eb3feef	logout	User logged out	\N		2026-04-19 13:40:51.13493+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
b960919f-c38d-4e7c-8a57-45dfbafbdb68	login	Login via username/password	\N		2026-04-19 13:40:59.564086+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
f1fe56ba-d875-4099-b754-fbe691ef7dae	login	Login via username/password	\N		2026-04-19 13:42:58.095048+05:30	1d914b5d-b935-4b96-b55e-38a2cd83f763	\N	\N	\N
90b3cfc7-bc23-43d2-bacc-c5adb9d36675	logout	User logged out	\N		2026-04-19 13:43:20.942124+05:30	1d914b5d-b935-4b96-b55e-38a2cd83f763	\N	\N	\N
f1f82fa7-0a10-460a-b152-a5cc1e6f5564	login	Login via username/password	\N		2026-04-19 13:43:36.890934+05:30	6136f201-bfb6-4e41-bf1e-cb9f231549a5	\N	\N	\N
84c2c99f-6558-425b-addd-3b22fbfbb12b	create_join_link	Created advocate join link for Saxena & Saxena Lawfirms	\N		2026-04-20 07:59:32.366904+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
fd05912a-b2d3-45a7-a9de-ce7049b86222	logout	User logged out	\N		2026-04-20 09:37:41.71949+05:30	6136f201-bfb6-4e41-bf1e-cb9f231549a5	\N	\N	\N
7ba1d969-16de-4aae-a036-13adcec37372	login	Login via username/password	\N		2026-04-20 09:37:46.549318+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
ef726708-cf3a-46fb-9a8c-12512bb38630	logout	User logged out	\N		2026-04-20 09:40:12.519313+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
2af68a3e-3f78-44c3-8fa7-074cb3121349	create_join_link	Created advocate join link for Saxena & Saxena Lawfirms	\N		2026-04-20 09:40:58.761878+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
7ecafa2f-1959-401c-84ce-3b64ea724899	join_via_link	Joined Saxena & Saxena Lawfirms via generic link as Advocate	\N		2026-04-20 09:42:02.808152+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
47ef8d1b-f909-4fdc-9052-224c42676f74	create_join_link	Created client join link for Saxena & Saxena Lawfirms	\N		2026-04-20 09:50:41.10173+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
ab29efac-b0ed-4d3d-b876-e038a0fdcb14	login	Login via username/password	\N		2026-04-20 09:55:44.984649+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
de2f6573-2364-4fd5-b227-84d426355627	create_join_link	Created client join link for Saxena & Saxena Lawfirms	\N		2026-04-20 09:55:56.273847+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
9e56f1ec-35db-4f17-a1e4-0d54015d6b14	create_join_link	Created client join link for Saxena & Saxena Lawfirms	\N		2026-04-20 09:56:03.489671+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
6723bbd2-ee61-4916-a680-f026eacb8e5d	create_join_link	Created client join link for Saxena & Saxena Lawfirms	\N		2026-04-20 10:06:15.57905+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
2851befb-2866-476c-b31e-dbbf34370b3b	logout	User logged out	\N		2026-04-20 10:13:19.408893+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
fd627902-8840-4092-8d10-2b6dc81995c2	login	Login via username/password	\N		2026-04-20 10:13:32.448317+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
f43a18cd-09da-4478-84f1-e4dbea4214a1	login	Login via username/password	\N		2026-04-20 10:14:39.593381+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
203ae9d9-7195-44d5-99db-34450ae90ba0	create_join_link	Created client join link for Saxena & Saxena Lawfirms	\N		2026-04-20 10:18:19.844035+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
1d9779de-c4fd-4ca5-992f-923adc6d11e9	logout	User logged out	\N		2026-04-20 10:19:22.251034+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
946bc609-66e6-4159-82af-facec59abb41	join_via_link	Joined Saxena & Saxena Lawfirms via generic link as Client	\N		2026-04-20 10:19:32.656077+05:30	184ee2bb-6bf9-4dc6-8e05-3620562c827e	\N	\N	\N
0c278d8b-d372-404e-894b-264fb22210ea	login	Login via username/password	\N		2026-04-20 10:19:35.622066+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
97405e0d-1de4-4db6-954f-71383c486097	logout	User logged out	\N		2026-04-20 10:20:08.423209+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
727e663c-76f7-4e62-878b-a8b475d96775	login	Login via username/password	\N		2026-04-20 10:20:27.868038+05:30	6136f201-bfb6-4e41-bf1e-cb9f231549a5	\N	\N	\N
abd99a90-2e61-41d6-a1ea-1aee642a4627	login	Login via username/password	\N		2026-04-20 10:21:05.043821+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
9e630567-0995-4f8a-bc2d-6e8efd6971cd	logout	User logged out	\N		2026-04-20 10:36:07.748554+05:30	6136f201-bfb6-4e41-bf1e-cb9f231549a5	\N	\N	\N
9e6fa823-75f7-4c0d-b0c1-b053147d435d	login	Login via username/password	\N		2026-04-20 10:36:46.710895+05:30	90790d0f-374c-4a08-b0d6-b74a171a7ca5	\N	\N	\N
12812032-ee17-44fd-9a77-3cd617fcf768	logout	User logged out	\N		2026-04-20 11:20:46.727791+05:30	90790d0f-374c-4a08-b0d6-b74a171a7ca5	\N	\N	\N
287f33c2-29cc-43c3-aa41-9348651d8703	login	Login via username/password	\N		2026-04-20 11:21:25.745527+05:30	1d914b5d-b935-4b96-b55e-38a2cd83f763	\N	\N	\N
a9192c08-dd23-426c-80d6-1999cf199868	change_password	User changed password	\N		2026-04-20 11:46:43.893086+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
9cf2a6a8-7976-4e13-be7c-53137bc8c54f	logout	User logged out	\N		2026-04-20 12:07:24.317947+05:30	1d914b5d-b935-4b96-b55e-38a2cd83f763	\N	\N	\N
5d76ad3f-132e-4a8b-996a-76be5481ba05	login	Login via username/password	\N		2026-04-20 12:08:25.889456+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
ce2ee62e-de27-4480-8520-591cc1def9eb	logout	User logged out	\N		2026-04-20 12:45:10.661888+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
aa050e6f-8a35-459e-bcc6-c71b094bb29c	login	Login via username/password	\N		2026-04-20 12:45:34.06047+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
279038e0-127c-4b60-afe9-d860b92941b3	login	Login via username/password	\N		2026-04-20 12:57:47.871209+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
453e0836-ce5c-41ca-952b-36de945addf5	logout	User logged out	\N		2026-04-20 13:22:17.470582+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
b815b8b2-c42c-464c-9fb5-b67a3e9a0b9f	login	Login via username/password	\N		2026-04-20 13:22:26.64454+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
befaa6ce-e9e1-4d88-85d7-b9df38c0ddf1	logout	User logged out	\N		2026-04-20 13:22:56.730182+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
dc6a70f9-0470-45ff-a1d2-0d29ae11e8bf	login	Login via username/password	\N		2026-04-20 13:25:08.038722+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
ee01ebf1-7155-4b27-89d3-cfb02e4e4589	login	Login via username/password	\N		2026-04-20 13:30:28.11174+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
ae18a1b5-80f7-40cb-8d78-d9b2c9c12797	login	Login via username/password	\N		2026-04-20 13:59:52.580577+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
76cb65b3-5742-4859-84d4-4cc4d7dbc4d3	create_user	Added Partner Manager: cszcdcd czxc to Saxena & Saxena Lawfirms	\N		2026-04-20 16:03:17.478612+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
4422e8ac-fb4d-4015-a338-d486c3f865aa	logout	User logged out	\N		2026-04-20 16:08:00.785022+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
3feef13f-eabe-4ab5-a5e4-8e8b5e847b04	login	Login via username/password	\N		2026-04-20 16:09:50.576186+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
5e6a5206-d602-4997-a593-e4384733c3ef	create_join_link	Created admin join link for XYZZ Lawfirm	\N		2026-04-20 16:09:57.69737+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
e0784b17-cd58-4684-b028-1dbf39e57e10	create_user	Added Super Admin (Firm Owner): super admijn 112 to testfirm2	\N		2026-04-20 16:12:09.6395+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
bec1ba77-8012-44a4-8316-b24de5db19cf	create_join_link	Created admin join link for XYZZ Lawfirm	\N		2026-04-20 16:22:39.802554+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
052ad53b-1c5e-4d42-9fab-023139348019	create_user	Added Super Admin (Firm Owner): new super admin 2 to Test Law Firm 1775647779	\N		2026-04-20 16:26:07.206074+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
8345ef00-c653-4caa-8a65-47743f29931c	logout	User logged out	\N		2026-04-20 16:43:44.726536+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
ab79cbe8-42de-4f6f-8e5d-05dec7464695	login	Login via username/password	\N		2026-04-20 16:51:27.636958+05:30	1d914b5d-b935-4b96-b55e-38a2cd83f763	\N	\N	\N
7aacfdfe-74b2-4909-a3f8-57a5447143f9	change_password	User changed password	\N		2026-04-20 16:52:25.864281+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
a4c18598-eacf-469d-a1f2-0aae15b1890b	logout	User logged out	\N		2026-04-20 17:07:57.291891+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
f95c4ac3-bbdf-46f9-ba4d-f2ab432fd6af	login	Login via username/password	\N		2026-04-20 17:08:18.587725+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
4a119933-d36b-404c-b6ac-41cfa3ab00d9	update_config	Updated global configuration	\N		2026-04-20 17:08:39.00881+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
efcddb72-416e-4b76-b6bb-758f988ba7f7	logout	User logged out	\N		2026-04-20 17:08:44.473027+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
a47246d1-393e-49b2-a238-a5734690c3c0	logout	User logged out	\N		2026-04-20 17:32:44.58253+05:30	1d914b5d-b935-4b96-b55e-38a2cd83f763	\N	\N	\N
153e55a2-54a7-48b0-bb9d-3f56cf6818ac	login	Login via username/password	\N		2026-04-20 17:44:49.805631+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
3af0c83a-ad6d-45f0-a3a8-999864f5523b	update_config	Updated global configuration	\N		2026-04-20 17:49:33.903171+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
7c262db2-822f-4373-8ae0-764fbef2691a	logout	User logged out	\N		2026-04-20 17:49:38.249655+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
04b907c8-96d3-40a3-81f7-cf201d710719	login	Login via username/password	\N		2026-04-20 17:50:17.299677+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
8957085b-f6ee-4dea-a9ba-cdb45d2dedc0	update_config	Updated global configuration	\N		2026-04-20 17:50:27.348403+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
dbc217b7-9989-4655-a24d-ef40f4785fb9	logout	User logged out	\N		2026-04-20 17:50:43.568285+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
74b246e3-e86f-40e9-80a0-85d8af92d0d8	login	Login via username/password	\N		2026-04-20 18:25:32.705081+05:30	4e1a7020-f5e3-46aa-910c-0892eb73f480	\N	\N	\N
32350626-e1e3-4d92-a5b0-1556a30a1152	login	Login via username/password	\N		2026-04-20 18:25:34.635417+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
164f41b2-cebd-4cb0-abf9-878eb0f2173b	login	Login via username/password	\N		2026-04-20 18:32:13.317061+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
19a70723-17c4-4a74-a118-13fde8810b0d	logout	User logged out	\N		2026-04-21 09:38:13.781759+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
7842ef93-bd44-4da2-93db-e86c6f799ab4	login	Login via username/password	\N		2026-04-21 09:39:17.361367+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
f1cdeb0a-d77d-4579-9673-7f479efe87bd	update_config	Updated global configuration	\N		2026-04-21 09:39:58.679735+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
6e62eb3f-7a43-4f2a-953c-49166f329cdf	logout	User logged out	\N		2026-04-21 09:40:02.410974+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
17ca1774-ce9c-4e94-bfd9-d9d4600ef38b	login	Login via username/password	\N		2026-04-21 09:40:35.186096+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
f011ce81-5589-4d67-b035-f6724342257d	login	Login via username/password	\N		2026-04-21 09:53:12.745308+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
be7db10a-003f-4b04-957f-84f48207cad0	unsuspend_firm	Unsuspended firm: Basic Law firm	\N		2026-04-21 09:55:38.85563+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
97181b17-28aa-4292-a788-3baec0d04c27	create_user	Added Super Admin (Firm Owner): Shaswati Sahoo to Basic Law firm	\N		2026-04-21 09:58:20.305205+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
dd4b1ae1-802a-4097-b2c3-3c02485c1e04	logout	User logged out	\N		2026-04-21 09:59:25.814863+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
fee4759b-c724-4671-beae-a2202e9ba609	login	Login via username/password	\N		2026-04-21 09:59:35.428668+05:30	70dd5f3f-412e-4816-a258-6fc40c025bde	\N	\N	\N
3e562a47-07ba-4bbf-a608-697dac58306e	create_join_link	Created client join link for Basic Law firm	\N		2026-04-21 10:00:11.587118+05:30	70dd5f3f-412e-4816-a258-6fc40c025bde	\N	\N	\N
4f4d781e-81bc-4de5-a718-e89fcc12d708	join_via_link	Joined Basic Law firm via generic link as Client	\N		2026-04-21 10:01:04.904594+05:30	9b6e44a0-33b6-48b3-8d43-0f1de5234056	\N	\N	\N
df04edbf-4d4e-4ccb-b6b6-2d260eb7c058	login	Login via username/password	\N		2026-04-21 10:06:33.204492+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
90e2516d-a561-4316-8d4f-6bf21072b47b	create_join_link	Created advocate join link for Basic Law firm	\N		2026-04-21 10:14:38.2114+05:30	70dd5f3f-412e-4816-a258-6fc40c025bde	\N	\N	\N
ae891947-a577-4b72-b2bf-58f726f51293	login	Login via username/password	\N		2026-04-21 10:15:42.687124+05:30	90790d0f-374c-4a08-b0d6-b74a171a7ca5	\N	\N	\N
b4c997ea-b2ca-444d-8f36-4c86edcce2ee	join_via_link	Joined Basic Law firm via generic link as Advocate	\N		2026-04-21 10:16:07.447462+05:30	c1270be1-13d5-476e-a2cb-01d93da3816c	\N	\N	\N
77b7383c-84c3-48ef-a792-b84f7d167ea1	create_user	Added Admin: Lipika Jena to Basic Law firm	\N		2026-04-21 10:19:37.351392+05:30	70dd5f3f-412e-4816-a258-6fc40c025bde	\N	\N	\N
4cd68f3b-313b-4eac-8e56-e98b3dd5af7c	create_join_link	Created client join link for Basic Law firm	\N		2026-04-21 11:06:08.838364+05:30	c1270be1-13d5-476e-a2cb-01d93da3816c	\N	\N	\N
ebf7407b-b1f6-4b4b-9598-90b6e703b1c1	join_via_link	Joined Basic Law firm via generic link as Client	\N		2026-04-21 11:07:08.244695+05:30	d0ebad81-eae4-446f-a89b-0bdb5d513b7f	\N	\N	\N
de22b766-69b2-42fc-a5f9-164847304aec	login	Login via username/password	\N		2026-04-21 11:09:05.214356+05:30	d0ebad81-eae4-446f-a89b-0bdb5d513b7f	\N	\N	\N
8d33619b-3221-488d-8364-67c95220ef6c	logout	User logged out	\N		2026-04-21 11:09:21.692671+05:30	d0ebad81-eae4-446f-a89b-0bdb5d513b7f	\N	\N	\N
2eb98247-2688-4b19-af31-5666fc8d16bb	login	Login via username/password	\N		2026-04-21 11:09:45.360171+05:30	c1270be1-13d5-476e-a2cb-01d93da3816c	\N	\N	\N
f46f3ec2-a872-4d8d-8bcd-f40628d59431	login	Login via username/password	\N		2026-04-21 11:21:29.943817+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
d3194c3d-df10-49b1-9f73-b3f944deb56f	logout	User logged out	\N		2026-04-21 11:22:45.650546+05:30	70dd5f3f-412e-4816-a258-6fc40c025bde	\N	\N	\N
9185df5e-fcee-4697-ba6d-8a15165551c8	login	Login via username/password	\N		2026-04-21 11:25:05.735207+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
bd95eb01-072a-4ae3-840a-4919e6ece1f4	unsuspend_firm	Unsuspended firm: Basic law firm 2	\N		2026-04-21 11:27:52.373886+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
4fbcdf14-92ec-4220-a7d6-4db551e97dea	create_user	Added Super Admin (Firm Owner): Sharadha Sahoo to Basic law firm 2	\N		2026-04-21 11:29:10.405471+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
0bc7aeda-6857-4c65-afbc-be78de8ee82f	update_config	Updated global configuration	\N		2026-04-21 11:30:48.356883+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
0aee2f86-f09a-43d1-bea2-f89f03ed9274	logout	User logged out	\N		2026-04-21 11:30:51.802802+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
285126de-2723-4059-b780-075bc238c02a	login	Login via username/password	\N		2026-04-21 11:31:17.339623+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
8f5956de-1996-4ee0-a693-e412e715c3cf	update_config	Updated global configuration	\N		2026-04-21 11:31:23.217715+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
0afbbab7-b2a2-4b74-8d7a-570ed2c308cf	logout	User logged out	\N		2026-04-21 11:31:27.16111+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
eb55450f-a5e8-4c88-a25b-357dd1a8c18a	login	Login via username/password	\N		2026-04-21 11:31:49.186602+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
9e5b224a-10a5-4969-b7fe-442f6de7ec30	create_user	Added Partner Manager: Pooja Gupata to Basic law firm 2	\N		2026-04-21 11:33:17.448816+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
a6494fd8-f543-4a6d-aded-aca954a93cc3	logout	User logged out	\N		2026-04-21 11:34:39.957637+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
e3142687-efaf-4b58-b58b-b3507bd28e97	create_user	Super Admin (Firm Owner) self-registered	\N		2026-04-21 11:43:41.545597+05:30	d649f2d2-bccb-48a8-9db8-d851ff2aa037	\N	\N	\N
b80db65e-843e-4843-a381-b2a5a0dcdc4e	create_join_link	Created client join link for Ashutosh & associate	\N		2026-04-21 11:44:35.530951+05:30	d649f2d2-bccb-48a8-9db8-d851ff2aa037	\N	\N	\N
259ffcf6-180b-4838-8e8f-3be3a894eff5	join_via_link	Joined Ashutosh & associate via generic link as Client	\N		2026-04-21 11:46:03.230058+05:30	5c3c3793-5ad8-47c9-a31d-177ba7fc0081	\N	\N	\N
91d4181e-cfbf-4601-ac7e-c9ed612acc16	create_join_link	Created advocate join link for Ashutosh & associate	\N		2026-04-21 11:48:32.606094+05:30	d649f2d2-bccb-48a8-9db8-d851ff2aa037	\N	\N	\N
bbf30f7b-b371-455a-938b-889c532a07f2	create_join_link	Created advocate join link for Ashutosh & associate	\N		2026-04-21 11:49:02.261979+05:30	d649f2d2-bccb-48a8-9db8-d851ff2aa037	\N	\N	\N
8eaf2e4a-7d5a-40c1-8112-9ef29f9ed08b	join_via_link	Joined Ashutosh & associate via generic link as Advocate	\N		2026-04-21 11:49:57.953755+05:30	cbc4ea0e-015e-4d4f-ae0c-c85c450691c9	\N	\N	\N
e331c5f5-175a-4613-ba50-68df84fac2ae	logout	User logged out	\N		2026-04-21 11:52:54.653703+05:30	cbc4ea0e-015e-4d4f-ae0c-c85c450691c9	\N	\N	\N
65b13404-2585-4c7b-bf72-688f39a7d404	login	Login via username/password	\N		2026-04-21 11:53:20.188445+05:30	5c3c3793-5ad8-47c9-a31d-177ba7fc0081	\N	\N	\N
08ded13c-129f-41a2-a7c1-7cc198a121d2	logout	User logged out	\N		2026-04-21 11:54:14.894134+05:30	5c3c3793-5ad8-47c9-a31d-177ba7fc0081	\N	\N	\N
ffc70a70-e2c9-41ec-93ab-42744664a01f	login	Login via username/password	\N		2026-04-21 11:54:38.414645+05:30	cbc4ea0e-015e-4d4f-ae0c-c85c450691c9	\N	\N	\N
7050a37a-6b41-4e5c-a978-7f3f3cc52782	login	Login via username/password	\N		2026-04-21 12:05:30.497507+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
266100f5-295a-45a8-b70c-508161e0a82c	login	Login via username/password	\N		2026-04-21 14:36:29.903542+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
36d3ad16-901d-4b95-95b4-4586a984c771	logout	User logged out	\N		2026-04-21 14:36:52.519771+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
3c47657a-d7ee-4e5d-bacb-3e98680e4929	login	Login via username/password	\N		2026-04-21 14:37:11.462515+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
886c18d6-adce-44a7-903f-311f6a5dcdf9	login	Login via username/password	\N		2026-04-21 14:41:20.764019+05:30	4e1a7020-f5e3-46aa-910c-0892eb73f480	\N	\N	\N
d1fad5b9-235e-4665-b117-358bc6768e63	login	Login via username/password	\N		2026-04-21 15:19:39.213896+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
532b90a5-1cba-450c-8924-1a4de31b2730	logout	User logged out	\N		2026-04-21 15:33:03.536948+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
d5e9be91-f789-4a74-a321-4b260f75935e	login	Login via username/password	\N		2026-04-21 15:36:04.052059+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
0d2beb1e-ed14-4919-b789-7981c336335c	logout	User logged out	\N		2026-04-22 10:26:19.527142+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
26fec023-36ed-42a4-90ee-ed2af0d54b5e	login	Login via username/password	\N		2026-04-22 10:26:56.806003+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
abfdda95-3a6d-4cd5-8c95-6ce9cf446c31	logout	User logged out	\N		2026-04-22 11:18:19.815596+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
ff5c8929-f115-4d92-9ebe-81a406f44546	login	Login via username/password	\N		2026-04-22 11:18:48.548543+05:30	90790d0f-374c-4a08-b0d6-b74a171a7ca5	\N	\N	\N
114e9ef0-90f2-4325-9928-1f4ad845199f	logout	User logged out	\N		2026-04-22 11:56:54.004541+05:30	90790d0f-374c-4a08-b0d6-b74a171a7ca5	\N	\N	\N
e1326a88-1cc1-40db-bea2-ca3ac6846067	login	Login via username/password	\N		2026-04-22 11:56:59.047127+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
8f42cf42-50c2-436d-a115-05da974304a3	login	Login via username/password	\N		2026-04-22 12:27:26.369756+05:30	1d914b5d-b935-4b96-b55e-38a2cd83f763	\N	\N	\N
fd3e7b2e-2b03-4224-8c0a-c6c15c0dcc82	logout	User logged out	\N		2026-04-22 12:57:22.216597+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
17f7746a-2ceb-4ba5-a706-072357b87c03	logout	User logged out	\N		2026-04-22 13:37:22.758079+05:30	d649f2d2-bccb-48a8-9db8-d851ff2aa037	\N	\N	\N
12158688-6595-4661-8eca-edd27110d38d	login	Login via username/password	\N		2026-04-22 13:37:30.452233+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
15f5de54-9c54-47b2-9f55-82f456a4f218	login	Login via username/password	\N		2026-04-22 16:36:21.063665+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
25cc6e37-3340-410e-b9e3-5710fd1ce378	login	Login via username/password	\N		2026-04-23 12:11:24.749256+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
51981c90-4aef-421b-ac1e-96b1be59d8e3	unsuspend_firm	Unsuspended firm: Accord Juris Associates	\N		2026-04-23 12:20:46.593595+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
f2887fb2-078c-494d-a29e-a5369a148579	create_user	Added Super Admin (Firm Owner): Subham Panda to Accord Juris Associates	\N		2026-04-23 12:23:39.320945+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
ec28f24f-5ce7-4764-92ec-ba8f56537a68	create_user	Added Partner Manager: Jonn Daker to Accord Juris Associates	\N		2026-04-23 12:26:15.961455+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
37daceed-0390-4630-93db-22024d0681fb	logout	User logged out	\N		2026-04-23 12:26:59.977447+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
b736ec9d-5128-42f3-9f2f-7442400948b2	login	Login via username/password	\N		2026-04-23 12:27:19.685546+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
61a3ddd9-7a58-44c7-b4d6-c3cc095c83b1	logout	User logged out	\N		2026-04-23 12:27:52.805652+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
9e5a8d7a-2314-43a7-a9a0-c0a5b73c8496	login	Login via username/password	\N		2026-04-23 12:27:58.898398+05:30	4df8ea5f-ddb8-47c5-9d59-34af552ff821	\N	\N	\N
2e951d0b-d694-4417-9dd9-978e40524a8f	logout	User logged out	\N		2026-04-23 13:12:13.321641+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
b09bb8ec-05ab-444e-b02e-20ecd97a85fa	login	Login via username/password	\N		2026-04-23 13:13:47.592404+05:30	1d914b5d-b935-4b96-b55e-38a2cd83f763	\N	\N	\N
7447fab9-1606-4aeb-9fa7-a716d3e17a6e	login	Login via username/password	\N		2026-04-23 13:19:29.059773+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
bf057f99-e70d-4bee-965f-88a8aa380050	logout	User logged out	\N		2026-04-23 13:34:26.458204+05:30	4df8ea5f-ddb8-47c5-9d59-34af552ff821	\N	\N	\N
b0ebb348-e301-4d67-aecd-a8343bf6644f	login	Login via username/password	\N		2026-04-23 16:06:12.455507+05:30	4df8ea5f-ddb8-47c5-9d59-34af552ff821	\N	\N	\N
72b35a7a-16c6-47fd-87d3-d682c1be036f	login	Login via username/password	\N		2026-04-23 19:54:25.095028+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
17c70d7a-f8b6-43b4-86bb-2f4fbd58dcc2	logout	User logged out	\N		2026-04-23 19:56:07.130607+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
57182342-1b65-419d-83fc-5b35673a3c3b	logout	User logged out	\N		2026-04-24 11:56:45.802571+05:30	1d914b5d-b935-4b96-b55e-38a2cd83f763	\N	\N	\N
04534225-1350-42d9-b97a-285472f28ba1	login	Login via username/password	\N		2026-04-24 11:56:57.045308+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
edf2f022-d198-4f9f-a5d2-ae146ccc40d2	logout	User logged out	\N		2026-04-24 12:01:45.697176+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
79023464-fd3e-4b52-9a58-c287e862f8ac	login	Login via username/password	\N		2026-04-24 12:02:14.695614+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
3ab30d23-db0d-4ccc-9ee2-5dbf84f4e979	login	Login via username/password	\N		2026-04-24 12:09:18.466227+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
1e687d33-6dd6-41cf-b845-6a59fe03bae7	logout	User logged out	\N		2026-04-24 12:46:48.308705+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
839a00d9-81d9-4a17-9faa-f27645f47bcb	login	Login via username/password	\N		2026-04-24 12:47:11.642539+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
7129cf7f-1ef4-4834-8264-5d8ed54a8391	logout	User logged out	\N		2026-04-24 12:48:25.827655+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
13549a8d-f77c-4c79-91a2-d9a242f181dd	login	Login via username/password	\N		2026-04-24 12:48:36.960404+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
0fcc1fe2-47bf-4604-8bdf-2664047af1a0	update_config	Updated global configuration	\N		2026-04-24 12:49:06.640469+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
ecfb61a1-6719-4f69-8945-60ff992e6682	login	Login via username/password	\N		2026-04-24 12:56:29.431473+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
0e768aea-eba6-4b34-b960-8ff539e5638e	logout	User logged out	\N		2026-04-24 12:57:50.820043+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
feafe013-d533-40ec-a025-b77dd25f8181	logout	User logged out	\N		2026-04-24 12:58:12.822688+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
25a1be27-e121-405e-81ed-b279bdcf1999	login	Login via username/password	\N		2026-04-24 12:58:14.813689+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
012cb854-fc32-42c7-91d9-d531fcdaf804	login	Login via username/password	\N		2026-04-24 12:58:34.936521+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
40697215-c2f2-40be-bd33-c69b33d11fcc	logout	User logged out	\N		2026-04-24 13:00:13.988601+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
bcd154e0-4d5f-4981-b6e7-ee2e47247402	login	Login via username/password	\N		2026-04-24 13:00:37.48854+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
e7376295-af58-495f-ac6c-cf0dac22d7d1	logout	User logged out	\N		2026-04-24 13:11:03.10263+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
4981782e-90b3-4c95-a451-794c46a46428	login	Login via username/password	\N		2026-04-24 13:11:40.188845+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
8f3325c0-9ae0-493b-b954-109bf2f24c1d	login	Login via username/password	\N		2026-04-24 13:16:14.960442+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
3d1655ed-feff-4b1e-9352-ac84e398078b	create_user	Client self-registered	\N		2026-04-24 14:31:02.044234+05:30	9ee6f64d-fe8a-4278-8811-b96a25556da5	\N	\N	\N
5a68135f-4a3f-416c-93d4-db59f3379fca	create_user	Client self-registered	\N		2026-04-24 14:37:27.334134+05:30	d9c20303-1390-4b8d-bf0b-9e59ab2ca389	\N	\N	\N
91889360-6338-471f-b31a-d299adb14ed2	create_user	Super Admin (Firm Owner) self-registered	\N		2026-04-24 14:48:04.564325+05:30	f1c489fd-b120-484b-ad6c-871f23feacf9	\N	\N	\N
4d05c1d1-7f73-4b42-a2a5-040588081158	create_user	Client self-registered	\N		2026-04-24 15:46:32.203476+05:30	2090e49f-342e-4867-94d1-42cc12276a9e	\N	\N	\N
cab8161a-01b8-48f3-82ae-5a9d92b4acfd	login	Login via username/password	\N		2026-04-24 16:54:33.090302+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
048c6141-4867-410a-b1f8-0527ccb7a3e2	logout	User logged out	\N		2026-04-24 17:26:55.368722+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
9bf3bca5-ceaf-4579-b95d-c4628581a6a8	login	Login via username/password	\N		2026-04-24 17:27:26.703379+05:30	bee18ba6-be01-4c4b-82ff-3103e307fc95	\N	\N	\N
a3b6d269-4ad9-442a-af7a-70f50c57632b	login	Login via username/password	\N		2026-04-25 10:56:23.942258+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
69f0cbbd-0a9e-483b-a26f-627f96483615	login	Login via username/password	\N		2026-04-25 12:35:24.381713+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
ac3c2b49-166d-442c-a0aa-10238b433ed8	logout	User logged out	\N		2026-04-27 10:08:21.536675+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
5c3fa6b7-097e-461c-81a3-f9532c17bbd7	login	Login via username/password	\N		2026-04-27 10:08:32.484251+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
a88ddb4f-be84-4fb2-baa0-f0c0e51b3c4e	login	Login via username/password	\N		2026-04-27 10:09:04.571764+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
bb3c07bb-1a11-4ca6-b901-329133df7bf9	logout	User logged out	\N		2026-04-27 10:12:08.278789+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
f601f5d9-9a96-43ac-ad68-4900ee650d6d	login	Login via username/password	\N		2026-04-27 10:12:29.128283+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
d4005adc-fa45-4278-ba2f-9105335320af	logout	User logged out	\N		2026-04-27 10:12:45.432092+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
218d12cf-b23c-465f-a98d-8d15edf3c27d	login	Login via username/password	\N		2026-04-27 10:13:07.034378+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
5cb39c1a-0f99-4697-8446-3fd3c845ffdf	logout	User logged out	\N		2026-04-27 10:13:47.574064+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
8fbeabd6-76b7-4e3b-a11c-54d8b1bb964b	login	Login via username/password	\N		2026-04-27 10:13:58.319317+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
6afe5a18-7845-41a9-b744-3b5b534ae3b0	logout	User logged out	\N		2026-04-27 10:14:57.31083+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
83c63353-236f-422a-938a-dc5ac8740189	login	Login via username/password	\N		2026-04-27 10:15:32.037503+05:30	4a38df05-8e96-4b50-b5ad-54598ecba542	\N	\N	\N
563f87fa-a760-4f5c-b926-3d3155ee10f2	logout	User logged out	\N		2026-04-27 10:17:27.886705+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
30102922-23eb-4561-8104-017640173501	login	Login via username/password	\N		2026-04-27 10:17:41.058456+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
7d8d44e1-7842-4bf1-a84a-25b05613f6d8	logout	User logged out	\N		2026-04-27 10:21:49.575721+05:30	4a38df05-8e96-4b50-b5ad-54598ecba542	\N	\N	\N
ce0b3d04-e3a6-4794-8970-1692cc4773f3	login	Login via username/password	\N		2026-04-27 10:21:59.418329+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
10a14139-7549-4abe-8c62-1c512c13a04f	create_user	Client self-registered	\N		2026-04-27 12:52:04.567793+05:30	2132980d-ed53-4e38-b7b7-0e8435602058	\N	\N	\N
03aae8e9-8dde-44b1-bba7-bdbd6745ec28	login	Login via username/password	\N		2026-04-27 17:30:32.495567+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
a066a061-8743-403b-a8f7-8526760adba7	logout	User logged out	\N		2026-04-27 18:23:09.591349+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
264b6da6-7989-4592-9122-4085007bf1a6	login	Login via username/password	\N		2026-04-27 18:25:37.394242+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
280b51fb-abbf-43fe-814c-f06091ce15c3	create_user	Client self-registered	\N		2026-04-28 11:23:36.486262+05:30	e26c57c8-aa19-4356-9bb5-9d1cac160d9b	\N	\N	\N
95965457-b610-408d-96d2-ee6d304ab39a	login	Login via username/password	\N		2026-04-28 12:35:03.881249+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
d07bcbf2-56bb-4c77-b71e-be1e4ae86782	logout	User logged out	\N		2026-04-28 13:25:28.930662+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
c3fa9604-67e2-4b20-8abc-be09f640f74d	login	Login via username/password	\N		2026-04-28 13:25:53.77462+05:30	4e1a7020-f5e3-46aa-910c-0892eb73f480	\N	\N	\N
a9f37068-ffd4-486c-b44f-931cd109b5c8	logout	User logged out	\N		2026-04-28 13:29:56.843208+05:30	4e1a7020-f5e3-46aa-910c-0892eb73f480	\N	\N	\N
9d2eef9f-de8a-457a-9326-b7955d196946	login	Login via username/password	\N		2026-04-28 13:30:11.689639+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
283b8412-cc56-4db5-9008-1fd5ac4aa1f8	login	Login via username/password	\N		2026-04-28 13:39:40.288908+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
c0bf2e50-205b-4460-bc7f-27ab9e6d0dd4	login	Login via username/password	\N		2026-04-29 10:50:39.088881+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
4313555b-fdaf-48f9-8b3c-7927aeb5627d	login	Login via username/password	\N		2026-04-29 10:51:38.446814+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
6bf2a6b5-7d85-40da-b3e0-d08b345ca5d9	logout	User logged out	\N		2026-04-29 11:09:18.819044+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
43b04747-18c5-4401-b622-55c157fab003	login	Login via username/password	\N		2026-04-29 11:09:31.731252+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
1dcad233-d3d4-41ca-a8ac-41bb8087da0f	login	Login via username/password	\N		2026-04-29 11:18:17.347088+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
b72482bc-63c1-47b6-a9b6-5a4ec9fa2c51	logout	User logged out	\N		2026-04-29 11:18:28.615165+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
7d7a8d55-f9b2-4733-9c49-b99b191a1338	create_join_link	Created advocate join link for Saxena & Saxena Lawfirms	\N		2026-04-29 15:38:36.841014+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
533a6bb8-bdc1-4930-9160-2eb40fac0541	create_join_link	Created advocate join link for Saxena & Saxena Lawfirms	\N		2026-04-29 15:38:39.917648+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
db2a6d5d-1bbf-424f-b0a4-3219ed4ee059	login	Login via username/password	\N		2026-04-29 15:39:58.501027+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
42e652ea-b585-4f1e-8f2e-8c068869225a	login	Login via username/password	\N		2026-04-29 15:48:10.561627+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
4f6e3d7e-290a-4687-82a8-218d17c64922	login	Login via username/password	\N		2026-04-29 16:17:39.214946+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
6e904894-093e-4d7b-bef0-a4edab451185	login	Login via username/password	\N		2026-04-30 12:17:20.643456+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
8f9860b7-f643-42f3-8e3f-1a6ff34c601c	create_user	Client self-registered	\N		2026-04-30 12:20:01.148807+05:30	4f103703-ddbf-4f28-b312-c30c6f6d605c	\N	\N	\N
fe4ccad6-822d-4eee-90ce-1cc3741424af	logout	User logged out	\N		2026-04-30 12:24:39.443414+05:30	4f103703-ddbf-4f28-b312-c30c6f6d605c	\N	\N	\N
c15b264e-50f0-43ac-a5c3-59d0192fc0bb	logout	User logged out	\N		2026-04-30 12:27:39.611102+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
a728a212-2ee0-4834-bc5b-2a5535e8cff5	login	Login via username/password	\N		2026-04-30 12:27:49.046531+05:30	bee18ba6-be01-4c4b-82ff-3103e307fc95	\N	\N	\N
6f906ed7-3e07-46fc-a9e9-5c53b3f5fafd	login	Login via username/password	\N		2026-04-30 12:35:44.215386+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
a1ffb7bc-add0-45b3-96e1-4c1803d12576	create_user	Client self-registered	\N		2026-04-30 12:43:40.547005+05:30	3f54f6c1-3e73-420a-8333-6ef1649b6187	\N	\N	\N
5cfffac7-3a13-4285-a514-d5d492ed6c64	login	Login via username/password	\N		2026-04-30 12:51:19.60665+05:30	4e1a7020-f5e3-46aa-910c-0892eb73f480	\N	\N	\N
d551ce04-f67a-48c3-a117-a3e8595260db	login	Login via username/password	\N		2026-04-30 13:02:22.909328+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
29a1327c-abd0-43ab-8e9b-9fa7dfa38cf5	logout	User logged out	\N		2026-04-30 13:43:16.343728+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
09cd8162-7741-4242-a4b0-984f594708d7	otp_sent	OTP sent to phone: 7008639757	\N		2026-04-30 13:46:33.13193+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43	\N	\N	\N
ef605b16-0158-42b1-bcb1-90fcf5eece2b	otp_verified	OTP verified via phone	\N		2026-04-30 13:46:39.438979+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43	\N	\N	\N
5783d703-a9ac-4c50-a48b-ddcc51beb6d7	logout	User logged out	\N		2026-04-30 13:52:31.762217+05:30	7743b6c4-8b3a-44a5-a25c-669957340a43	\N	\N	\N
26e5ef62-0130-4040-a1a1-ddab23ac8e7e	logout	User logged out	\N		2026-04-30 16:10:01.622159+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
404861c5-0d5f-447e-8f24-517a55227fe8	login	Login via username/password	\N		2026-04-30 16:10:15.414998+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
96199558-202f-4763-bc79-c5fa73cb1915	login	Login via username/password	\N		2026-04-30 17:28:03.256012+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
55285d92-0f7f-42c5-955c-5584bc3ff8a4	login	Login via username/password	\N		2026-04-30 17:39:23.696319+05:30	bee18ba6-be01-4c4b-82ff-3103e307fc95	\N	\N	\N
51ffc450-6d75-4610-9e59-29fe28acbf75	login	Login via username/password	\N		2026-05-01 10:06:59.467528+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
13219ba8-ec20-4d35-9e58-15a7ff68cfd5	logout	User logged out	\N		2026-05-01 11:08:26.924376+05:30	bee18ba6-be01-4c4b-82ff-3103e307fc95	\N	\N	\N
b7608328-7730-4471-9c9a-29fc43ec2804	login	Login via username/password	\N		2026-05-01 11:08:41.703694+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
245f77c3-5203-45c1-aa28-3478a84fb19d	login	Login via username/password	\N		2026-05-01 11:17:29.263833+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
085756dc-59ea-4b8d-908c-bfd7cbf2b70c	logout	User logged out	\N		2026-05-01 11:41:30.242911+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
23ee5b23-ac7e-4cab-8017-221568333992	login	Login via username/password	\N		2026-05-01 11:41:48.849872+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
a2468518-e19a-46f5-905b-2513d68c1702	suspend_firm	Suspended firm: Saxena & Saxena Lawfirms	\N		2026-05-01 11:50:43.989664+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
c363ae35-b3c1-4d4f-b709-5cb4819482f6	unsuspend_firm	Unsuspended firm: Saxena & Saxena Lawfirms	\N		2026-05-01 11:51:23.845932+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
87978d1b-b374-45fa-ad9e-b24342b3aebb	suspend_firm	Suspended firm: Saxena & Saxena Lawfirms	\N		2026-05-01 12:05:24.713552+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
5d7204f0-428f-49db-9272-bd13bf242f95	unsuspend_firm	Unsuspended firm: Saxena & Saxena Lawfirms	\N		2026-05-01 12:06:38.351959+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
4f71b946-abf8-41f4-9f75-a4eaae82529f	login	Login via username/password	\N		2026-05-01 13:51:28.64945+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
4d584f2d-8e67-4786-86fd-6f27eb32735f	logout	User logged out	\N		2026-05-01 13:52:18.079656+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
471fe4fa-df18-4545-86f1-b160a2108fa5	login	Login via username/password	\N		2026-05-01 13:52:21.830887+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
2442ee9a-6a5b-4edb-8bd0-2a324e14ac65	login	Login via username/password	\N		2026-05-01 13:53:06.242253+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
1fc9d475-533c-4be5-948a-363652e9efe3	login	Login via username/password	\N		2026-05-01 13:53:43.348165+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
0d34fc63-efb0-48c1-85e1-8d078d9c052a	login	Login via username/password	\N		2026-05-01 13:54:47.36692+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
e4f9d220-cbbb-4a70-b97c-fe255e8555eb	login	Login via username/password	\N		2026-05-01 13:56:28.238387+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
da2b0000-a6b1-4e11-a0f8-75e1b79b762e	login	Login via username/password	\N		2026-05-01 14:00:04.109892+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
6c3c20d1-5348-46cd-b32f-e7c8fee9182e	create_user	Subscription activated with plan 'Business' for 1 month(s). New end: 2026-05-31T08:30:04.634102+00:00	\N		2026-05-01 14:00:04.65014+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
a0ee820a-b288-4d4d-bec0-5258e1b4f838	login	Login via username/password	\N		2026-05-01 15:18:56.524428+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
5c1557fa-692a-46ee-8dfc-4140c80bd91a	login	Login via username/password	\N		2026-05-01 15:25:56.014611+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
bddf20fa-2cb0-47a1-8093-27400d814704	create_user	Subscription activated with plan 'Business' for 1 month(s). New end: 2026-05-31T09:55:56.155814+00:00	\N		2026-05-01 15:25:56.162686+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
38342f15-b459-4611-a106-8226753983ec	create_user	Subscription activated with plan 'Basic' for 1 month(s). New end: 2026-05-31T10:20:39.364617+00:00	\N		2026-05-01 15:50:39.370532+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
12e10e7e-b7a5-43f6-b7e6-8de95f4bd818	create_user	Subscription activated with plan 'Enterprise' for 1 month(s). New end: 2026-05-31T10:20:50.449080+00:00	\N		2026-05-01 15:50:50.455238+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
4c54647e-385b-4b7c-8ae0-9b5619ef1176	create_user	Client self-registered	\N		2026-05-02 11:55:33.055103+05:30	da6195bb-5878-401e-a879-38bd0463fa5c	\N	\N	\N
9d0f19e7-dbe1-43c5-bb93-4cc99b41ace0	create_user	Client self-registered	\N		2026-05-02 12:13:20.833914+05:30	a5c2a056-9be3-4241-9557-525cf7c369c7	\N	\N	\N
f14be872-45e6-4994-941f-612f54f6e49c	logout	User logged out	\N		2026-05-02 12:23:07.905466+05:30	a5c2a056-9be3-4241-9557-525cf7c369c7	\N	\N	\N
5b077ecf-ee29-4608-83ee-3512cb059c89	create_user	Client self-registered	\N		2026-05-02 12:32:19.634808+05:30	3274b74d-4f13-4220-993b-7ec3e4020bfd	\N	\N	\N
f15714ac-5e98-48c7-8d27-d15918027d11	logout	User logged out	\N		2026-05-02 12:34:12.761401+05:30	3274b74d-4f13-4220-993b-7ec3e4020bfd	\N	\N	\N
84a34d04-bed4-4c8b-bd8d-42b898ab7883	create_user	Super Admin (Firm Owner) self-registered	\N		2026-05-02 12:38:08.821347+05:30	f331f893-75e1-4841-94f6-ac8a027a2439	\N	\N	\N
11b660f7-feaf-4145-aabe-396d9ff05b19	create_user	Client self-registered	\N		2026-05-02 14:50:46.33323+05:30	4d0159b7-ce1a-450a-87dd-830fa1780a84	\N	\N	\N
15bac6dc-2355-4fcf-beac-41583ef3a485	logout	User logged out	\N		2026-05-02 14:51:06.279967+05:30	4d0159b7-ce1a-450a-87dd-830fa1780a84	\N	\N	\N
3bccc8d3-b90b-4454-a4c4-ad0a2a638801	create_user	Client self-registered	\N		2026-05-02 14:55:49.840743+05:30	9f1e7cf7-e1f6-4154-9058-746a62b2aeea	\N	\N	\N
213f010a-5a3b-47e1-8c0a-d9c677c8560f	logout	User logged out	\N		2026-05-02 14:56:03.995771+05:30	9f1e7cf7-e1f6-4154-9058-746a62b2aeea	\N	\N	\N
85ca30ea-7ad7-49ee-8d8e-cab1c0375167	create_user	Client self-registered	\N		2026-05-02 14:59:57.836098+05:30	df719cfb-f040-42ce-a588-84c83ab1163d	\N	\N	\N
b9401dfa-f91f-459e-a2ff-e1e1cd1f1611	logout	User logged out	\N		2026-05-02 15:00:12.865484+05:30	df719cfb-f040-42ce-a588-84c83ab1163d	\N	\N	\N
d9f08c39-7c35-449d-b1d9-2a1393fc31be	create_user	Super Admin (Firm Owner) self-registered	\N		2026-05-02 15:04:13.054713+05:30	8b14eb83-f60f-43b7-860f-616947c11476	\N	\N	\N
387691f6-9fbe-490f-885d-a03fe1abe089	create_user	Client self-registered	\N		2026-05-02 15:17:16.226131+05:30	925f7869-8a14-41c9-a4cb-413c0d69109f	\N	\N	\N
f5d79968-e3b8-45da-8da4-c127e84e838f	logout	User logged out	\N		2026-05-02 15:17:42.630868+05:30	925f7869-8a14-41c9-a4cb-413c0d69109f	\N	\N	\N
637096dd-e8c2-45cf-911d-96f7daef15bf	create_user	Client self-registered	\N		2026-05-02 15:20:43.877239+05:30	6b324d98-22f0-4936-897e-6633d3e8c556	\N	\N	\N
6375a3dc-3d8e-4c3e-ab36-715669e2a7e3	logout	User logged out	\N		2026-05-02 15:20:56.725368+05:30	6b324d98-22f0-4936-897e-6633d3e8c556	\N	\N	\N
4727a12a-35cf-4fd9-a1b6-054f5b3a1475	create_user	Super Admin (Firm Owner) self-registered	\N		2026-05-02 15:23:57.529401+05:30	9cbb2fd8-6ae0-4277-972a-25bfaa0c523d	\N	\N	\N
dbd7d1c7-c6f7-46fa-bfa2-37635b08791e	login	Login via username/password	\N		2026-05-04 10:06:29.104555+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
4dfc63dd-99b8-4261-92f1-5e4e2b895794	logout	User logged out	\N		2026-05-04 10:24:15.360105+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
5e9f14b7-37a8-48e9-b098-1e7c743083c3	login	Login via username/password	\N		2026-05-04 10:24:30.069879+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
6853a8f3-db7c-477b-9306-064eb5a0f25d	logout	User logged out	\N		2026-05-04 10:25:05.752334+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
df6f990b-dc33-4aee-a80d-81c55910541c	login	Login via username/password	\N		2026-05-04 10:25:35.150065+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
4ed82c10-7de1-443c-8dfa-44ca5662a685	logout	User logged out	\N		2026-05-04 10:26:24.97893+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
31b97d36-49b0-4da8-831d-5ae32d1c59e9	login	Login via username/password	\N		2026-05-04 10:27:01.675493+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
df105094-97fc-4202-acfa-5d1c42f1fd36	logout	User logged out	\N		2026-05-04 10:32:03.57369+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
42d7c5b8-c695-40d7-8cc0-59d1c4f750fa	login	Login via username/password	\N		2026-05-04 10:32:15.919023+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
f32ac0ed-5f10-4c41-be95-3fbf392a4f7c	login	Login via username/password	\N		2026-05-04 10:39:21.711849+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
b8354855-63f5-465a-88e2-302e371133ff	login	Login via username/password	\N		2026-05-04 10:52:13.249547+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
e7490df5-b334-4b20-9657-ec322182aa3e	create_user	Subscription upgraded from Enterprise to Enterprise for 1 month(s). Payment: bank_transfer ref: 112233	\N		2026-05-04 10:54:21.557976+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
0c0ad5c6-785d-458a-b3c5-27547018b8e1	login	Login via username/password	\N		2026-05-04 11:15:05.918891+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
189d3ea1-5ae1-4f71-810c-3b2e6d75cf5b	logout	User logged out	\N		2026-05-04 11:15:26.485216+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
1e8d26ee-cead-4a06-b65f-62b6c96fa280	login	Login via username/password	\N		2026-05-04 11:15:31.409954+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
ffd38a4e-b951-4b22-94d7-ff547def11e9	logout	User logged out	\N		2026-05-04 11:15:37.231731+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
ab014bd2-a8e8-4ac0-9daf-6ead33fad982	login	Login via username/password	\N		2026-05-04 11:15:46.422206+05:30	70dd5f3f-412e-4816-a258-6fc40c025bde	\N	\N	\N
f02df6d4-ea77-4369-ab62-ad28d2320110	create_user	Subscription upgraded from Enterprise to Basic for 1 month(s). Payment: bank_transfer ref: 2e	\N		2026-05-04 11:20:22.316912+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
2de79b0d-9d97-462b-8333-19119874b196	create_user	Subscription upgraded from Basic to Trial for 1 month(s). Payment: bank_transfer ref: fd	\N		2026-05-04 11:22:15.435595+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
3473f9a2-9d60-416f-b301-dcd4fcede739	login	Login via username/password	\N		2026-05-04 11:23:57.177156+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
01b61b42-076c-48b8-ad0b-2af0013618d1	create_user	Subscription upgraded from Trial to Enterprise for 1 month(s). Payment: bank_transfer ref: fd	\N		2026-05-04 11:24:58.437373+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
7e4cf21c-2e3f-4332-8517-696db19aecf4	create_user	Subscription upgraded from Enterprise to Business for 1 month(s). Payment: bank_transfer ref: 6666	\N		2026-05-04 11:41:45.653193+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
bef1eac1-7c35-4aea-aab9-56e91e5d5950	create_user	Subscription upgraded from Business to Trial for 1 month(s). Payment: bank_transfer ref: 6666	\N		2026-05-04 11:42:07.497492+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
23e00bff-f4dc-4257-b916-760c76ab5b7d	create_user	Subscription upgraded from Trial to Business for 1 month(s). Payment: bank_transfer ref: assa	\N		2026-05-04 12:03:27.328584+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
b397dd12-9433-4dbb-bf9a-c2a2d0648fb6	create_user	Subscription upgraded from Business to Enterprise for 1 month(s). Payment: bank_transfer ref: assa	\N		2026-05-04 12:04:02.487946+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
257a149a-4741-4d1c-beb6-58afcf533e46	create_user	Subscription upgraded from Enterprise to Business for 1 month(s). Payment: bank_transfer ref: sa	\N		2026-05-04 12:36:43.757804+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
7ba5593d-4d66-4550-bff5-0808bfb8c55b	create_user	Subscription upgraded from Business to Basic for 1 month(s). Payment: bank_transfer ref: sa	\N		2026-05-04 12:37:12.258085+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
60d94c6a-24d6-4f9f-b5f8-1b77e28c42ed	create_user	Subscription upgraded from Basic to Trial for 1 month(s). Payment: bank_transfer ref: sa	\N		2026-05-04 12:37:28.206184+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
7fc47531-12b2-41a0-a8d2-b477e0536bac	create_user	Subscription upgraded from Trial to Enterprise for 1 month(s). Payment: bank_transfer ref: sa	\N		2026-05-04 12:38:08.924926+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
ad34fd68-1817-443e-851e-ecd92a2d6a1d	create_user	Subscription upgraded from Enterprise to Trial for 1 month(s). Payment: bank_transfer ref: sa	\N		2026-05-04 13:06:15.842907+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
e131f070-5d5c-4296-a6a6-a91d546a4cb2	create_user	Subscription upgraded from Trial to Basic for 1 month(s). Payment: bank_transfer ref: sa	\N		2026-05-04 13:06:34.379007+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
6bb5c0ba-bab4-4053-a328-0e7c215aff76	create_user	Subscription upgraded from Basic to Business for 1 month(s). Payment: bank_transfer ref: sa	\N		2026-05-04 13:06:47.479178+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
e09ba407-60f6-488b-adf7-f0c720021980	create_user	Subscription upgraded from Business to Trial for 1 month(s). Payment: bank_transfer ref: sa	\N		2026-05-04 13:10:49.068482+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
bbcdbb5e-376d-42ce-9be0-bac9cb592c16	login	Login via username/password	\N		2026-05-04 13:30:31.416394+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
ace5e2d3-3f15-40e3-b879-49b6f5c0736f	logout	User logged out	\N		2026-05-04 13:30:34.467001+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
a5b295bb-7b7a-443f-a83e-37df221db048	create_user	Advocate self-registered	\N		2026-05-04 13:39:36.150508+05:30	2594cfb1-8985-42d5-a068-13a6c277b5ee	\N	\N	\N
85d01324-4db3-4a3b-adab-0b3ce5010fde	login	Login via username/password	\N		2026-05-04 16:39:39.063535+05:30	2594cfb1-8985-42d5-a068-13a6c277b5ee	\N	\N	\N
84b5b494-a48a-4e98-8787-8a5e9d74c732	create_user	Subscription upgraded from Trial to Enterprise for 1 month(s). Payment: bank_transfer ref: 8	\N		2026-05-04 16:51:41.028001+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
9a17c145-3d34-456b-bc21-043e52beec4d	login	Login via username/password	\N		2026-05-04 17:02:08.028084+05:30	2594cfb1-8985-42d5-a068-13a6c277b5ee	\N	\N	\N
b9a3213f-12e2-4532-97e6-3508184f5069	login	Login via username/password	\N		2026-05-04 17:27:28.221246+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
6e5487b0-4eb6-4c87-bb43-8c8ff783c1c5	create_user	Client self-registered	\N		2026-05-05 11:25:50.08053+05:30	1e40fae8-1c67-476a-aee1-50c16d953633	\N	\N	\N
98b8d009-696f-4398-83b9-51a3aabd9356	logout	User logged out	\N		2026-05-05 11:26:06.668589+05:30	1e40fae8-1c67-476a-aee1-50c16d953633	\N	\N	\N
bef9a569-e07a-48a9-99ed-0b35573fbef7	create_user	Client self-registered	\N		2026-05-05 11:29:26.533333+05:30	55d2e024-98a6-4995-b500-b7b72ee32120	\N	\N	\N
611f137c-325a-4d36-a38d-68db53be25dc	logout	User logged out	\N		2026-05-05 11:30:09.026941+05:30	55d2e024-98a6-4995-b500-b7b72ee32120	\N	\N	\N
46f61d18-576e-4627-9b40-a25b6ae2719f	create_user	Super Admin (Firm Owner) self-registered	\N		2026-05-05 11:34:04.421924+05:30	022eaecb-2f3f-4c8d-b887-7b8e629d7f8b	\N	\N	\N
19449524-9969-4926-9f1f-48342cf10f1c	logout	User logged out	\N		2026-05-05 11:46:42.709423+05:30	022eaecb-2f3f-4c8d-b887-7b8e629d7f8b	\N	\N	\N
9aef542c-53d7-45b1-a4b6-542bf6f7e072	create_user	Client self-registered	\N		2026-05-05 11:52:17.414446+05:30	472c96b5-1c05-4b3c-8beb-fa6fba63b150	\N	\N	\N
be8827f7-c529-4f33-a665-d840ada24883	logout	User logged out	\N		2026-05-05 11:52:29.426216+05:30	472c96b5-1c05-4b3c-8beb-fa6fba63b150	\N	\N	\N
dda62270-ab9b-4bf4-b786-ee1937295cd5	create_user	Client self-registered	\N		2026-05-05 11:55:51.717826+05:30	f78d0ea2-b390-40ff-b7e0-ada24480a36e	\N	\N	\N
2246646f-58e0-497a-97b8-b155956eae3c	logout	User logged out	\N		2026-05-05 11:56:02.158377+05:30	f78d0ea2-b390-40ff-b7e0-ada24480a36e	\N	\N	\N
d64788da-df3d-4a51-a043-6462b56fb45e	create_user	Client self-registered	\N		2026-05-05 12:20:11.888796+05:30	fc46a32c-76f0-4c59-806d-f5d221d1af68	\N	\N	\N
4a061588-38ea-4cd0-b7c6-8138ce844067	logout	User logged out	\N		2026-05-05 12:20:21.985803+05:30	fc46a32c-76f0-4c59-806d-f5d221d1af68	\N	\N	\N
8ba430e2-19fc-488f-b6d5-e5b045ab2cee	create_user	Super Admin (Firm Owner) self-registered	\N		2026-05-05 12:23:38.552745+05:30	ac500223-29fe-42a1-ba68-b00039a4c545	\N	\N	\N
a0074c70-c71b-449e-ba5f-00413d345152	login	Login via username/password	\N		2026-05-05 13:27:12.608059+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
3700018b-f587-4348-ad8e-4a2a9aa5588d	login	Login via username/password	\N		2026-05-05 13:27:57.520079+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
32a2916b-5a70-424e-a5b0-44f444e1ebfb	logout	User logged out	\N		2026-05-05 14:58:16.104322+05:30	ac500223-29fe-42a1-ba68-b00039a4c545	\N	\N	\N
6660062e-cd78-44e0-a8ff-a30eae7a400c	create_user	Client self-registered	\N		2026-05-05 15:02:41.998457+05:30	e53922f1-669e-4ac7-9d4d-ba4ccd282339	\N	\N	\N
cc53cbe4-b74c-4921-bdd8-5e3925926903	logout	User logged out	\N		2026-05-05 15:02:48.447437+05:30	e53922f1-669e-4ac7-9d4d-ba4ccd282339	\N	\N	\N
eb40ac2c-cea8-4bc9-b777-36589860f971	create_user	Client self-registered	\N		2026-05-05 15:05:58.128913+05:30	daa399bd-d338-4948-bb07-e0d11f6a1bba	\N	\N	\N
0258fda1-d6f5-4439-be11-1f6e718ab48e	logout	User logged out	\N		2026-05-05 15:06:03.655782+05:30	daa399bd-d338-4948-bb07-e0d11f6a1bba	\N	\N	\N
82ad79d3-8975-4aef-8c6f-54ea732f94bc	create_user	Super Admin (Firm Owner) self-registered	\N		2026-05-05 15:09:05.026671+05:30	49a1fd68-7dd7-4295-a85a-71e4797c6783	\N	\N	\N
17a65d7e-cd39-46c4-b9ec-09d2efc904b8	login	Login via username/password	\N		2026-05-05 15:35:00.527229+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
06df2161-a470-4693-b987-d44f3e5d53d2	create_user	Subscription upgraded from None to Enterprise for 1 month(s). Payment: bank_transfer ref: zzc	\N		2026-05-05 15:35:31.068569+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9	ccbeec86-3943-4d83-be2f-971c1ff72498	subscription
a69f270f-a6da-4e6a-b173-be3b62105dcc	logout	User logged out	\N		2026-05-05 15:36:54.807325+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
b5f2aa05-19fe-49af-ad8e-1cbb9cfee288	login	Login via username/password	\N		2026-05-05 15:37:23.163847+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
d4b50571-57d4-4aea-9a81-91e96e6d339d	login	Login via username/password	\N		2026-05-05 15:40:15.069306+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
0bfad567-ecbd-480b-ad5f-14af3b53921f	login	Login via username/password	\N		2026-05-05 17:01:05.24543+05:30	2594cfb1-8985-42d5-a068-13a6c277b5ee	\N	\N	\N
84efeb3a-2d8b-43da-8d3b-e3bcf2c4f20a	logout	User logged out	\N		2026-05-05 17:01:08.844077+05:30	2594cfb1-8985-42d5-a068-13a6c277b5ee	\N	\N	\N
bf8cdc2d-cc2e-44e6-9afa-5f89fa4f7036	login	Login via username/password	\N		2026-05-05 17:01:16.988999+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
3af091f2-5220-4f73-9a54-ed3213b12aca	logout	User logged out	\N		2026-05-05 17:52:16.743592+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
5209f74e-ab0e-4e46-90d9-46846d829592	login	Login via username/password	\N		2026-05-05 17:52:24.448436+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
13aa41cf-6f39-4e37-862e-79d7ce195882	login	Login via username/password	\N		2026-05-05 18:01:17.401947+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
e7ae6586-1903-4fbf-a9c4-75c18a381b84	logout	User logged out	\N		2026-05-05 18:06:39.194056+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
36a8d40d-ee60-44f5-a162-57dfffe21262	login	Login via username/password	\N		2026-05-05 18:07:04.115744+05:30	2594cfb1-8985-42d5-a068-13a6c277b5ee	\N	\N	\N
be0f20af-ba2d-46b7-b063-cb9043d2d80c	login	Login via username/password	\N		2026-05-05 18:36:50.65535+05:30	2594cfb1-8985-42d5-a068-13a6c277b5ee	\N	\N	\N
9951ad68-e0de-4cf5-9aa1-9c86903c8a4e	logout	User logged out	\N		2026-05-06 09:37:39.77117+05:30	2594cfb1-8985-42d5-a068-13a6c277b5ee	\N	\N	\N
507d9c93-ec87-458c-994e-bc3b55518871	login	Login via username/password	\N		2026-05-06 09:39:36.352733+05:30	70dd5f3f-412e-4816-a258-6fc40c025bde	\N	\N	\N
aaa8f0da-2830-486a-ba2a-5dd709967bb6	login	Login via username/password	\N		2026-05-06 09:45:03.868972+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
4309b0cc-5b82-4456-b397-ffd8f7a90535	create_user	Added Paralegal: Shammy Rao to Basic Law firm	\N		2026-05-06 09:49:42.250316+05:30	70dd5f3f-412e-4816-a258-6fc40c025bde	\N	\N	\N
3d50eeab-94a8-4288-a645-c0b85d3a7912	logout	User logged out	\N		2026-05-06 09:51:12.841877+05:30	70dd5f3f-412e-4816-a258-6fc40c025bde	\N	\N	\N
48220ffa-4eca-4c0e-9bc4-08d0bea77601	login	Login via username/password	\N		2026-05-06 09:53:40.199771+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
2311c3f2-98ff-463f-943b-dad442d8fa8c	login	Login via username/password	\N		2026-05-06 10:00:13.221644+05:30	66a74a9e-7334-49fb-bfb0-15d9bf2df9f0	\N	\N	\N
ecf54440-e90d-4ba2-bd48-883d016980ca	login	Login via username/password	\N		2026-05-06 10:04:21.57699+05:30	2594cfb1-8985-42d5-a068-13a6c277b5ee	\N	\N	\N
74dc662f-c7f9-4acb-9925-e09d961c634e	create_user	Added Paralegal: fdhsadhg bvcbnv to AntLegal Platform	\N		2026-05-06 10:05:16.656453+05:30	2594cfb1-8985-42d5-a068-13a6c277b5ee	\N	\N	\N
bee90f5a-5c89-494c-9056-362b73e559f2	logout	User logged out	\N		2026-05-06 11:08:15.428393+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
d5553b61-a77f-487a-8109-fb05d350142d	login	Login via username/password	\N		2026-05-06 11:08:20.77286+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
d75bbaaf-1cbc-4069-8753-3ee12f541cae	create_user	Client self-registered	\N		2026-05-06 12:07:36.990133+05:30	e37adccf-9b47-46eb-be62-374d54dbd491	\N	\N	\N
8956cbfe-f78f-466f-a8ab-eb204959129f	logout	User logged out	\N		2026-05-06 12:14:26.451252+05:30	e37adccf-9b47-46eb-be62-374d54dbd491	\N	\N	\N
433f6c41-6bcf-4edd-950c-e747315b8ed7	logout	User logged out	\N		2026-05-06 12:18:26.107905+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
78e37312-3da8-4bd6-8c2c-eefefd02ce7c	login	Login via username/password	\N		2026-05-06 12:18:29.61693+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
97c2caff-5e56-45da-a63e-bef2c87352ac	create_user	Client self-registered	\N		2026-05-06 12:19:25.966994+05:30	e9a3cd06-bc4a-4a24-91c2-f254beef3f39	\N	\N	\N
3414741b-7588-4a16-827c-cbba559404fe	logout	User logged out	\N		2026-05-06 12:20:46.992501+05:30	e9a3cd06-bc4a-4a24-91c2-f254beef3f39	\N	\N	\N
404815aa-e6a7-40f5-ac4d-d9764091ea17	create_user	Super Admin (Firm Owner) self-registered	\N		2026-05-06 12:23:21.76161+05:30	c551fe95-428c-4435-96ce-2a87f4b46064	\N	\N	\N
8e10defb-37a4-4830-bc5d-2aeb3ee4ae83	login	Login via username/password	\N		2026-05-06 12:36:33.47763+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
f351e65b-b2d3-4a5e-b2de-37c3ec393db5	logout	User logged out	\N		2026-05-06 13:11:07.364702+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
a7b53680-f537-4b12-bb70-65f8e2fa4003	login	Login via username/password	\N		2026-05-06 13:11:26.716821+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
346037f8-d051-4b5d-bec6-71a4be315f66	logout	User logged out	\N		2026-05-06 13:17:11.057289+05:30	66a74a9e-7334-49fb-bfb0-15d9bf2df9f0	\N	\N	\N
3cd1d36f-b7aa-440e-a034-6aefbc2f2c9c	login	Login via username/password	\N		2026-05-06 13:17:19.713192+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
f4d217c6-995c-4f8a-8d7a-0aa805e05509	create_user	Added Paralegal: erer rerer to XYZZ Lawfirm	\N		2026-05-06 13:18:05.334442+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
c84b6068-8220-4839-9465-1b5320961389	create_user	Subscription upgraded from Enterprise to Basic for 1 month(s). Payment: bank_transfer ref: r4r4r	\N		2026-05-06 13:19:10.424985+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9	ccbeec86-3943-4d83-be2f-971c1ff72498	subscription
bff6c795-556c-4602-bfaa-a52389a73ca9	create_user	Added Advocate: fvdfddffdf fddfddfd to XYZZ Lawfirm	\N		2026-05-06 13:20:46.342334+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
be8b6402-5a8e-4557-9965-f28e08935736	logout	User logged out	\N		2026-05-06 13:32:16.76872+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
b0f2edf1-5bff-470d-8ce8-ac13725a6d58	create_user	Subscription upgraded from Enterprise to Trial for 1 month(s). Payment: bank_transfer ref: 333	\N		2026-05-06 13:45:59.249435+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
28d2314f-278f-4277-a89d-270063cb1f29	create_user	Added Advocate: fdggd dgd to Saxena & Saxena Lawfirms	\N		2026-05-06 13:47:42.912402+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
961567ce-4dbb-4ff3-994e-ecf84751a82b	create_user	Subscription upgraded from Trial to Basic for 1 month(s). Payment: bank_transfer ref: dasd	\N		2026-05-06 13:53:17.15281+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
e3206269-5632-4ab9-8dc6-33f397141a60	create_user	Client self-registered	\N		2026-05-06 14:03:10.054038+05:30	f0959cfe-9124-404a-8fb0-c89330cdd248	\N	\N	\N
d8e8a436-1025-42c6-9d04-7d8f3ca09a2d	create_user	Client self-registered	\N		2026-05-06 14:04:32.401193+05:30	dd4f0cba-8b3b-4d24-9601-0ef0eae3eda6	\N	\N	\N
5a2a2369-9801-44c7-8f84-f9ea09406c19	create_join_link	Created client join link for solo advocate	\N		2026-05-08 06:09:38.396507+05:30	d33932c9-8a33-4bb9-a5cb-38079d242d4e	\N	\N	\N
2f3f2278-5cda-4af3-b439-a698b153975b	create_user	Subscription activated with plan 'Enterprise' for 1 month(s). New end: 2026-06-05T08:38:20.945705+00:00	\N		2026-05-06 14:08:20.957453+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
130e4cb9-4ed2-44e4-8b97-2843e5fc6a15	create_user	Subscription activated with plan 'Enterprise' for 12 month(s). New end: 2027-05-01T08:38:57.703583+00:00	\N		2026-05-06 14:08:57.711285+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
1792f38b-0661-4aaa-8336-5726c6534c04	logout	User logged out	\N		2026-05-06 14:11:22.394265+05:30	dd4f0cba-8b3b-4d24-9601-0ef0eae3eda6	\N	\N	\N
acf571d5-9b14-4e67-8248-7c1d20c542b4	create_user	Client self-registered	\N		2026-05-06 14:12:51.827973+05:30	4ae22c78-372f-436d-9f33-19480c3b3482	\N	\N	\N
7ddeea39-3883-45fa-8762-f32dc233b971	create_user	Subscription upgraded from Enterprise to Trial for 1 month(s). Payment: upi ref: sda	\N		2026-05-06 14:14:22.456711+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
ee352091-44c5-450d-84bd-e6e78a7551da	logout	User logged out	\N		2026-05-06 14:44:12.391098+05:30	f0959cfe-9124-404a-8fb0-c89330cdd248	\N	\N	\N
3a0c78ab-117b-402a-8c60-d44dd37879cc	logout	User logged out	\N		2026-05-06 14:44:18.408927+05:30	4ae22c78-372f-436d-9f33-19480c3b3482	\N	\N	\N
e3b36e53-ac89-4366-8354-0857cb744425	login	Login via username/password	\N		2026-05-06 14:44:50.943863+05:30	4ae22c78-372f-436d-9f33-19480c3b3482	\N	\N	\N
084ac93e-fe1d-4012-960e-f9ea7177bce0	logout	User logged out	\N		2026-05-06 14:48:21.87438+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
08f740bd-e436-42a9-9795-235b91f70d97	login	Login via username/password	\N		2026-05-06 14:48:27.440626+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
cbf8d841-9c7d-4687-b255-417243a1dad0	login	Login via username/password	\N		2026-05-06 14:49:51.069374+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
f853b189-3abe-454f-95b4-eadb55b6a2e8	login	Login via username/password	\N		2026-05-06 14:54:23.293549+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
622d776c-9564-48f6-a9b4-c3ced28e06b6	create_user	Subscription upgraded from Trial to Enterprise for 1 month(s). Payment: bank_transfer ref: hch	\N		2026-05-06 14:54:55.958375+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
4d35cf40-90d3-4622-bb98-8c4997de9d76	login	Login via username/password	\N		2026-05-06 14:57:57.075042+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
a6707fa6-7df2-479c-aa02-3e7d3ff95c49	logout	User logged out	\N		2026-05-06 14:58:36.936754+05:30	4ae22c78-372f-436d-9f33-19480c3b3482	\N	\N	\N
e14af1b0-27c3-4485-a0bb-5560a46d39a4	login	Login via username/password	\N		2026-05-06 14:58:44.96269+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
77fb12e7-f64a-4ee0-b538-58ac6d4eb347	logout	User logged out	\N		2026-05-06 15:00:57.996705+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
c98c85eb-f20e-4532-a782-35e6ab598ecb	login	Login via username/password	\N		2026-05-06 15:01:18.837927+05:30	2594cfb1-8985-42d5-a068-13a6c277b5ee	\N	\N	\N
4cceef54-05ee-4147-bd10-f9a9fe823094	logout	User logged out	\N		2026-05-06 15:01:56.51575+05:30	2594cfb1-8985-42d5-a068-13a6c277b5ee	\N	\N	\N
eab85554-d0d1-486c-86ad-9afd6beacebe	create_user	Client self-registered	\N		2026-05-06 15:04:23.66518+05:30	98058847-547b-44d1-829f-abeeb12c57cb	\N	\N	\N
dbcac6ae-a08c-4f6e-a2ee-732ad7e9ba05	login	Login via username/password	\N		2026-05-06 15:12:18.35364+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
cb8e435f-14d5-479f-9650-ea1eaef8678c	logout	User logged out	\N		2026-05-06 15:18:28.297023+05:30	98058847-547b-44d1-829f-abeeb12c57cb	\N	\N	\N
013a27c9-2db6-471a-a847-453fb7faabbf	create_user	Advocate self-registered	\N		2026-05-06 15:19:42.332758+05:30	115b1e64-92b3-452d-9279-99dbb7911593	\N	\N	\N
a86ccb09-628a-4da9-8e94-7cf2f772b53f	login	Login via username/password	\N		2026-05-06 15:20:14.646111+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
525d6015-d1dc-4404-bd4e-4e21f5bb92eb	login	Login via username/password	\N		2026-05-06 15:29:46.706506+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
c317fcb1-37c6-48b0-8e22-f0f41993e50e	logout	User logged out	\N		2026-05-06 15:29:59.397917+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
afb8bbfc-d362-44d1-802b-4116e5a2a428	create_user	Super Admin (Firm Owner) self-registered	\N		2026-05-06 15:32:05.026584+05:30	33c21527-b152-48ea-af18-1b73e0301e6c	\N	\N	\N
42c940ef-353e-4544-af99-b5918dadbff1	create_user	Subscription upgraded from None to Trial for 1 month(s). Payment: bank_transfer ref: dsadsd	\N		2026-05-06 15:35:28.982932+05:30	33c21527-b152-48ea-af18-1b73e0301e6c	58826cf1-716f-4a46-9cd6-bbb0277022bc	27cff651-0d11-4a22-bb5c-14caa0bff54f	subscription
2ab5e714-6926-4d56-b812-e329a43d34ea	create_user	Subscription upgraded from Enterprise to Trial for 1 month(s). Payment: bank_transfer ref: dadsa	\N		2026-05-06 15:36:15.343934+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
2bed4405-0d03-4252-8697-bb95e2f70a92	create_user	Added Advocate: ASDSADA DASDAD to Saxena & Saxena Lawfirms	\N		2026-05-06 15:41:35.714902+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
1f9b78d4-b5e4-4293-8848-2fe5623e9232	create_user	Added Advocate: fgvzv xcvxczv to Saxena & Saxena Lawfirms	\N		2026-05-06 15:42:05.688474+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
e29fd903-186e-4254-a464-aadeb0fb4b17	create_user	Added Paralegal: 4545 4545 to AntLegal Platform	\N		2026-05-06 15:50:52.444102+05:30	115b1e64-92b3-452d-9279-99dbb7911593	\N	\N	\N
01733f2b-21b0-4ce1-97c0-80ac079bab90	logout	User logged out	\N		2026-05-06 15:53:07.74122+05:30	115b1e64-92b3-452d-9279-99dbb7911593	\N	\N	\N
e92bda4e-47af-4a11-8a78-1c7427484529	login	Login via username/password	\N		2026-05-06 15:53:13.11987+05:30	dd4f0cba-8b3b-4d24-9601-0ef0eae3eda6	\N	\N	\N
fad8e4b1-e997-4423-a741-3e6db46c44f4	logout	User logged out	\N		2026-05-06 15:53:16.726074+05:30	dd4f0cba-8b3b-4d24-9601-0ef0eae3eda6	\N	\N	\N
e0e6c867-65c3-4b5f-803e-da4859381880	logout	User logged out	\N		2026-05-06 16:00:36.361274+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
34559253-e128-48fa-8a31-3d0a40d5e910	login	Login via username/password	\N		2026-05-06 16:01:59.739782+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
1254984a-5132-4071-8bb8-1f6fac214e21	create_user	Advocate self-registered	\N		2026-05-06 16:05:49.328491+05:30	f3e8aca7-c948-4b11-bdb6-12b319bcc6b8	\N	\N	\N
8fbae2a1-f194-48af-8086-a6caa6e97cdd	login	Login via username/password	\N		2026-05-06 16:08:08.582874+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
c8728405-4692-4f1d-8195-616068da3131	logout	User logged out	\N		2026-05-06 16:16:26.051742+05:30	f3e8aca7-c948-4b11-bdb6-12b319bcc6b8	\N	\N	\N
4b3dd7a4-0cae-4872-aa58-412b6167553e	logout	User logged out	\N		2026-05-06 16:17:53.479595+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
bb024cd5-3247-452b-b960-db1e5022c09a	login	Login via username/password	\N		2026-05-06 16:17:59.185043+05:30	2594cfb1-8985-42d5-a068-13a6c277b5ee	\N	\N	\N
9f5ba9ab-a983-49f4-b63f-239033698851	login	Login via username/password	\N		2026-05-06 16:18:18.43122+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
20f2a072-35fa-4119-8412-756d5011bcc5	logout	User logged out	\N		2026-05-06 16:19:18.6583+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
42c56b79-3ba8-4792-b099-dc29d1dea207	login	Login via username/password	\N		2026-05-06 16:19:40.822674+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
4f037a95-aa86-400e-8143-d4ca9cb90edb	logout	User logged out	\N		2026-05-06 16:22:33.596377+05:30	2594cfb1-8985-42d5-a068-13a6c277b5ee	\N	\N	\N
dfb02dd6-6281-4159-b877-b1b71869f4a6	login	Login via username/password	\N		2026-05-06 16:22:59.438966+05:30	ad82aa5b-ad99-4007-8b0f-56fedc7f174b	\N	\N	\N
b044a53a-322e-433c-8a38-0e86b9de8c1c	logout	User logged out	\N		2026-05-06 16:30:36.651791+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
abe600a2-a97d-42be-a0d0-b4cb49a24be8	login	Login via username/password	\N		2026-05-06 16:31:00.630376+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
9fd2f239-aa0b-49fe-bd78-93aadf5a8b76	login	Login via username/password	\N		2026-05-06 19:53:42.306278+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
57fbb763-df67-453e-a01c-e679894b0209	otp_sent	OTP sent to phone: 1234567890	\N		2026-05-07 10:45:18.810317+05:30	a527e3db-fe90-4397-a6cd-d5ae9cd1d1e9	\N	\N	\N
538ff8fd-da80-4586-b142-33548c89dbc5	otp_verified	OTP verified via phone	\N		2026-05-07 10:45:24.157904+05:30	a527e3db-fe90-4397-a6cd-d5ae9cd1d1e9	\N	\N	\N
8e72b38e-2c21-4b36-8df7-7efac2605f36	login	Login via username/password	\N		2026-05-07 10:47:39.117194+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
9b4b344e-f849-4a34-a8d4-f2e8d03e685c	logout	User logged out	\N		2026-05-07 16:04:28.169057+05:30	a527e3db-fe90-4397-a6cd-d5ae9cd1d1e9	\N	\N	\N
2a5492d8-b47d-49f3-8e66-e0c56f49683f	login	Login via username/password	\N		2026-05-07 16:04:43.84512+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
2f9913ed-3b60-4b66-89f4-0c0ef5bbcf1a	create_user	Subscription upgraded from Trial to Enterprise for 1 month(s). Payment: bank_transfer ref: qwe	\N		2026-05-07 16:24:29.109566+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
bef7c267-83ef-4e97-bd55-7d0915be6893	create_user	Subscription upgraded from Enterprise to Business for 1 month(s). Payment: bank_transfer ref: dsd	\N		2026-05-07 18:09:18.921931+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
2e5473b9-84c6-4826-8a6a-6c2667a0b1fb	create_user	Subscription upgraded from Business to hero plan for 1 month(s). Payment: bank_transfer ref: sss22	\N		2026-05-07 18:14:55.547997+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
e9192db7-229c-4228-839d-eee3861abced	create_user	Advocate self-registered	\N		2026-05-08 00:30:30.359543+05:30	d33932c9-8a33-4bb9-a5cb-38079d242d4e	\N	\N	\N
ba6448a8-180e-40a6-a139-ff86d3d6f12f	create_join_link	Created client join link for solo advocate	\N		2026-05-08 06:08:24.080033+05:30	d33932c9-8a33-4bb9-a5cb-38079d242d4e	\N	\N	\N
3adf5e36-19f7-442f-9a6c-e4be28207bd9	logout	User logged out	\N		2026-05-08 09:38:31.88294+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
51f4efcd-5fbd-48ce-a62a-d1e8afad5734	login	Login via username/password	\N		2026-05-08 09:39:53.235133+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
67cabd55-3bd0-438f-a91f-2028748c3047	logout	User logged out	\N		2026-05-08 09:40:00.649418+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
d1f8ca47-4a99-4cec-9c3d-010a7cbb5f07	login	Login via username/password	\N		2026-05-08 09:40:04.464888+05:30	d649f2d2-bccb-48a8-9db8-d851ff2aa037	\N	\N	\N
6b90958c-06bc-4dee-974c-57d09958fcba	logout	User logged out	\N		2026-05-08 09:40:10.019596+05:30	d649f2d2-bccb-48a8-9db8-d851ff2aa037	\N	\N	\N
a089ecf0-4094-49ec-a2f2-0f0986b92684	login	Login via username/password	\N		2026-05-08 09:40:20.362457+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
aa4ed8f7-b11b-4363-9804-754c74980b53	logout	User logged out	\N		2026-05-08 09:40:23.064061+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
fb477949-1849-4851-8b8b-fdd910ae1def	login	Login via username/password	\N		2026-05-08 09:40:26.458129+05:30	f3e8aca7-c948-4b11-bdb6-12b319bcc6b8	\N	\N	\N
0c68790c-214f-4028-ba94-cc015cf805e4	create_join_link	Created client join link for solo advocate	\N		2026-05-08 09:40:39.122398+05:30	f3e8aca7-c948-4b11-bdb6-12b319bcc6b8	\N	\N	\N
98358bf1-a726-4ac2-934b-bd7046df4846	logout	User logged out	\N		2026-05-08 09:40:50.952058+05:30	f3e8aca7-c948-4b11-bdb6-12b319bcc6b8	\N	\N	\N
842d1718-f34b-45b7-872d-144d14c8824f	create_user	Advocate self-registered	\N		2026-05-08 09:42:08.150509+05:30	30629b8e-eaf6-4612-8e7c-d487fcb0ab11	\N	\N	\N
4a9fe7b7-b955-43ca-a3ee-5f0ccf2eb1ea	create_join_link	Created client join link for solo advocate	\N		2026-05-08 09:42:18.837155+05:30	30629b8e-eaf6-4612-8e7c-d487fcb0ab11	\N	\N	\N
599c2551-535c-40c5-8c31-c9667c2fe75a	logout	User logged out	\N		2026-05-08 09:42:25.186995+05:30	30629b8e-eaf6-4612-8e7c-d487fcb0ab11	\N	\N	\N
14ed676a-9bcf-4c54-b4bf-4393c9dad476	login	Login via username/password	\N		2026-05-08 09:45:11.747768+05:30	33c21527-b152-48ea-af18-1b73e0301e6c	\N	\N	\N
5fc9653a-bc25-46c9-ad8d-abef7da689ba	logout	User logged out	\N		2026-05-08 09:45:41.353801+05:30	33c21527-b152-48ea-af18-1b73e0301e6c	\N	\N	\N
88bb386e-69e5-41b7-bf81-8de5039eea8e	login	Login via username/password	\N		2026-05-08 09:47:30.871455+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
dfe58a3a-3052-40e3-b71b-876b36c476cd	logout	User logged out	\N		2026-05-08 09:47:34.788235+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
9db5eaa7-4fff-4170-b309-5dff5b565108	login	Login via username/password	\N		2026-05-08 09:47:46.466087+05:30	d649f2d2-bccb-48a8-9db8-d851ff2aa037	\N	\N	\N
d54572a3-2904-450c-adcb-5b3ce315158c	logout	User logged out	\N		2026-05-08 09:47:49.050108+05:30	d649f2d2-bccb-48a8-9db8-d851ff2aa037	\N	\N	\N
acc2c6d5-3a52-48e9-9d51-85f484c7d063	login	Login via username/password	\N		2026-05-08 09:47:52.307172+05:30	33c21527-b152-48ea-af18-1b73e0301e6c	\N	\N	\N
a2527bdc-2112-4268-914a-c3a74eb0b93a	logout	User logged out	\N		2026-05-08 09:47:57.176769+05:30	33c21527-b152-48ea-af18-1b73e0301e6c	\N	\N	\N
559e19dc-4fa2-4985-befe-9960f2c887e5	login	Login via username/password	\N		2026-05-08 09:48:52.551086+05:30	30629b8e-eaf6-4612-8e7c-d487fcb0ab11	\N	\N	\N
b2a36f26-1034-494e-8f71-3a0deaf4ea12	create_join_link	Created client join link for solo advocate	\N		2026-05-08 09:49:24.463867+05:30	30629b8e-eaf6-4612-8e7c-d487fcb0ab11	\N	\N	\N
f4269f0f-99ae-423d-8f83-ac4bccacd07b	join_via_link	Joined Solo Practice via generic link as Client	\N		2026-05-08 11:22:18.483935+05:30	e7b6f636-7aad-4655-a57d-a3d174fdf4d2	\N	\N	\N
432d65de-b903-43fc-9f44-22cf7df4687a	login	Login via username/password	\N		2026-05-08 11:22:56.557268+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
ee235601-9ef4-4f5d-bd29-d8f09927f796	logout	User logged out	\N		2026-05-08 11:28:02.342761+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
bffee3da-8f3d-482d-8fa4-b05e06e5806c	login	Login via username/password	\N		2026-05-08 11:28:06.960347+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
40fb2dfb-f2aa-4cf8-90b8-25f0e74410a6	otp_sent	OTP sent to phone: 1234567890	\N		2026-05-08 12:25:29.600618+05:30	a527e3db-fe90-4397-a6cd-d5ae9cd1d1e9	\N	\N	\N
a5c384ba-90db-425f-9545-acf474dd6b85	otp_verified	OTP verified via phone	\N		2026-05-08 12:25:38.518141+05:30	a527e3db-fe90-4397-a6cd-d5ae9cd1d1e9	\N	\N	\N
cae2877e-1ba9-4e43-b2d5-62492ce48c10	logout	User logged out	\N		2026-05-08 12:25:42.444214+05:30	a527e3db-fe90-4397-a6cd-d5ae9cd1d1e9	\N	\N	\N
daf24bc7-4748-4500-a8aa-fe255f273b4d	login	Login via username/password	\N		2026-05-08 12:25:56.430557+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
cfefc6f1-f4fe-4855-a8f4-3519e4fdde28	logout	User logged out	\N		2026-05-08 12:26:02.23144+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
44343804-1c89-410f-b72d-7fa3b0900de8	login	Login via username/password	\N		2026-05-08 13:00:17.875842+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
2d83d9a8-b3cb-4160-8cc0-648bab1f83f5	login	Login via username/password	\N		2026-05-08 13:02:31.00439+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
4b202525-6404-42eb-a9b3-7d4887e7c44a	otp_sent	OTP sent to phone: 1234567891	\N		2026-05-08 13:16:37.269916+05:30	d33932c9-8a33-4bb9-a5cb-38079d242d4e	\N	\N	\N
c8143d2a-ed50-420b-995a-ada726160799	otp_verified	OTP verified via phone	\N		2026-05-08 13:16:41.730989+05:30	d33932c9-8a33-4bb9-a5cb-38079d242d4e	\N	\N	\N
bb794b25-ca5a-47f4-a4d4-66125fb5fe0d	create_join_link	Created client join link for solo advocate	\N		2026-05-08 13:17:03.113525+05:30	d33932c9-8a33-4bb9-a5cb-38079d242d4e	\N	\N	\N
9232480e-c308-4be2-8a4b-c7a93cc0cf45	join_via_link	Joined Solo Practice via generic link as Client	\N		2026-05-08 17:50:11.81394+05:30	5185cd8b-45df-424d-9b65-e1473ab03301	\N	\N	\N
457dd0a5-bd5a-42a3-9d20-639deca7f23b	logout	User logged out	\N		2026-05-08 17:53:41.966561+05:30	5185cd8b-45df-424d-9b65-e1473ab03301	\N	\N	\N
1fe08762-8070-472f-8873-df04f76486f4	otp_sent	OTP sent to phone: 1234567891	\N		2026-05-08 17:57:47.48874+05:30	d33932c9-8a33-4bb9-a5cb-38079d242d4e	\N	\N	\N
47669f25-f790-4c55-a976-82791cee72e7	otp_verified	OTP verified via phone	\N		2026-05-08 17:57:51.831229+05:30	d33932c9-8a33-4bb9-a5cb-38079d242d4e	\N	\N	\N
0e89f3f1-d4b2-4b60-a453-bf119e280423	logout	User logged out	\N		2026-05-08 18:00:35.789028+05:30	d33932c9-8a33-4bb9-a5cb-38079d242d4e	\N	\N	\N
ba9b792c-b7cd-467f-9fb5-eab4029166c0	logout	User logged out	\N		2026-05-08 18:12:01.573809+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
524d3848-b8dc-4f6d-8910-1d559b760f94	login	Login via username/password	\N		2026-05-08 18:12:13.599876+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
519b6593-722c-44e8-83b4-98f79b7cfa9a	login	Login via username/password	\N		2026-05-09 10:56:56.765595+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
84a6be72-6adc-422e-bf5a-4188fdcbf904	create_user	Subscription upgraded from hero plan to Enterprise for 1 month(s). Payment: bank_transfer ref: 22	\N		2026-05-09 11:02:01.674412+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
60728da8-daee-4c9a-bdee-999fe3192c4b	create_user	Subscription upgraded from Enterprise to Business for 1 month(s). Payment: bank_transfer ref: 22	\N		2026-05-09 11:02:19.517447+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
0158fd2c-1f64-4644-9bee-edd1d9b2be4a	logout	User logged out	\N		2026-05-09 11:11:48.131457+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
7f1e0d40-2c46-4ea1-a8bf-94dc85309168	login	Login via username/password	\N		2026-05-09 11:12:02.792317+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
1b74a7db-ec58-4d4e-8cd2-7a0859a50240	create_user	Subscription upgraded from Business to Enterprise for 1 month(s). Payment: bank_transfer ref: qqq	\N		2026-05-09 11:14:18.418455+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
93d7b3c2-2534-4bfa-8125-56b5118655c3	create_user	Subscription upgraded from Enterprise to hero plan for 1 month(s). Payment: bank_transfer ref: 111	\N		2026-05-09 11:16:00.653038+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
9161919b-42ed-4d88-9539-73f89f8f56b9	create_user	Subscription upgraded from hero plan to hero plan for 1 month(s). Payment: bank_transfer ref: 111	\N		2026-05-09 11:16:03.240532+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
d5963032-1f48-4742-8324-4f11ec2080e6	create_user	Subscription upgraded from hero plan to Enterprise for 1 month(s). Payment: bank_transfer ref: 1233	\N		2026-05-09 11:16:33.077954+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
5b8a2d38-002b-4dd2-968c-6b7647b7376f	create_user	Subscription upgraded from Enterprise to Enterprise for 1 month(s). Payment: bank_transfer ref: 1233	\N		2026-05-09 11:17:20.610394+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
92a291ef-f664-409a-9a28-739f197e8227	create_user	Subscription upgraded from Enterprise to Basic for 1 month(s). Payment: bank_transfer ref: hhh	\N		2026-05-09 11:17:49.731155+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
2383a415-6049-483d-9e16-2654c768e73c	create_user	Subscription upgraded from Basic to Enterprise for 1 month(s). Payment: bank_transfer ref: 85	\N		2026-05-09 11:18:34.204155+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
857538d7-5796-4e82-9c6b-609086a36090	create_user	Subscription upgraded from Enterprise to Enterprise for 1 month(s). Payment: bank_transfer ref: 85	\N		2026-05-09 11:26:00.368704+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
d8853137-aef2-4354-b022-5ce354533bc5	login	Login via username/password	\N		2026-05-11 16:14:10.631673+05:30	184ee2bb-6bf9-4dc6-8e05-3620562c827e	\N	\N	\N
e58a1e61-802e-4728-aee3-a5dada9a5426	create_user	Subscription upgraded from Enterprise to Enterprise for 1 month(s). Payment: bank_transfer ref: 85	\N		2026-05-09 11:28:13.97257+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
1bf4f24f-e5b9-40cd-b25f-099860d6f97f	create_user	Subscription upgraded from Enterprise to Enterprise for 1 month(s). Payment: bank_transfer ref: 85	\N		2026-05-09 11:32:32.089412+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
56d45012-3394-4af2-ae52-e817186a6688	logout	User logged out	\N		2026-05-09 12:42:20.324295+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
281272ed-d033-4936-9d18-2aac3a9da27b	login	Login via username/password	\N		2026-05-09 12:42:25.308144+05:30	67c30f67-0391-428c-afb9-97a597f515f8	\N	\N	\N
00f3fb44-7deb-4fb8-9a1b-d350e482ea8b	logout	User logged out	\N		2026-05-09 12:42:33.67444+05:30	67c30f67-0391-428c-afb9-97a597f515f8	\N	\N	\N
eca61588-c94a-4180-97bc-c155fe99ce97	login	Login via username/password	\N		2026-05-09 12:42:44.409464+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
f37ebda5-e690-4bce-9edb-3e1bc021885c	create_user	Added Admin: subrat admin  saxena lawfirm to Saxena & Saxena Lawfirms	\N		2026-05-09 13:45:13.961284+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
6ca77c40-9d23-44f8-bdb2-4d1c48e1fb66	logout	User logged out	\N		2026-05-09 13:53:58.824346+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
614a9cbd-ffd3-4b07-92f1-6207fd3d2ad0	login	Login via username/password	\N		2026-05-09 13:54:09.237399+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
9818de9f-b2c4-455e-9ce4-def534101c8c	create_user	Subscription upgraded from Basic to Enterprise for 1 month(s). Payment: bank_transfer ref: 11	\N		2026-05-09 13:55:04.802632+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9	ccbeec86-3943-4d83-be2f-971c1ff72498	subscription
759526f8-bb83-43c0-94b8-bf927ed88175	create_user	Subscription upgraded from Enterprise to Enterprise for 1 month(s). Payment: bank_transfer ref: 11	\N		2026-05-09 13:55:06.251239+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9	ccbeec86-3943-4d83-be2f-971c1ff72498	subscription
141ff1ca-304e-41ff-8251-2695c0d99cf5	assign_branch_admin	Assigned Subrat admin as admin to branch: new branch patia	\N		2026-05-09 15:27:43.147893+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
ecca47cb-047d-4c0e-ae24-23fc926c374b	login	Login via username/password	\N		2026-05-09 15:59:57.498168+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
d84a8e29-c1b2-41e1-b131-c791ee5fa666	assign_branch_admin	Assigned SHRADHA SAHOO as admin to branch: new branch kalpana square	\N		2026-05-09 16:19:32.24628+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
b0b45c69-8a66-4d6b-9451-436503320dcc	logout	User logged out	\N		2026-05-09 16:20:41.292315+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
84258a15-3ba4-4b60-943f-31e299475354	login	Login via username/password	\N		2026-05-09 16:20:54.051672+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
aabb3f15-13d7-4d75-bb64-80d2f467f219	create_user	Subscription upgraded from Enterprise to hero plan for 1 month(s). Payment: bank_transfer ref: 111	\N		2026-05-09 16:38:10.805753+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
e5a19359-9ae6-44ac-af27-094ae80d9e25	create_invoice	Auto-generated invoice SUB-2026-00006 for subscription upgrade - Amount: ₹2712.8200	\N		2026-05-09 16:38:10.813456+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	9b313472-ed62-4b88-a60f-6a63b5770dff	platform_invoice
31ea0918-c5bb-4eb2-b44f-c9aea1676dd0	logout	User logged out	\N		2026-05-09 16:39:49.645594+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
3e7d52ca-ec7c-48fc-aab3-938e9d811700	login	Login via username/password	\N		2026-05-09 16:40:08.452837+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
81aab739-7d6d-4fa4-a81e-0f2496232259	login	Login via username/password	\N		2026-05-09 16:58:14.025314+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
fd3c7643-5c7e-4050-a05a-652aac7e8b3e	logout	User logged out	\N		2026-05-09 18:29:02.131345+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
48e5f441-6cb9-49c1-83b3-194c50427cdc	login	Login via username/password	\N		2026-05-09 18:49:25.732835+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
310cde93-de03-4774-9df0-86d3482c10c7	logout	User logged out	\N		2026-05-09 18:49:28.208627+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
c6a45abc-ab82-43ae-b750-8cb866138e42	login	Login via username/password	\N		2026-05-09 18:49:36.526265+05:30	d649f2d2-bccb-48a8-9db8-d851ff2aa037	\N	\N	\N
72785efb-5492-4d5d-96bf-34f7be9019ca	join_via_link	Joined Solo Practice via generic link as Client	\N		2026-05-11 10:17:03.742036+05:30	3411bfbd-d965-4897-a6ee-aa1a2fe06039	\N	\N	\N
09026835-3dac-42bd-9b7c-1235dc46b64f	login	Login via username/password	\N		2026-05-11 10:34:54.63006+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
9220b753-7971-45c1-a719-e74b540a97fa	login	Login via username/password	\N		2026-05-11 10:36:42.008935+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
6830f648-3350-41b9-aa3b-315888b047b2	login	Login via username/password	\N		2026-05-11 12:56:33.556578+05:30	d649f2d2-bccb-48a8-9db8-d851ff2aa037	\N	\N	\N
f6e92c5a-3df4-44b1-9871-3675b420b276	logout	User logged out	\N		2026-05-11 12:56:36.571778+05:30	d649f2d2-bccb-48a8-9db8-d851ff2aa037	\N	\N	\N
f7897a96-9563-4639-8a8e-c380fe43a1de	login	Login via username/password	\N		2026-05-11 12:56:58.617595+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
14fd5884-b8f5-4a51-8723-c362a8130934	logout	User logged out	\N		2026-05-11 12:57:03.081084+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
36a99c42-8db9-4f52-a62e-67e4a96cea7e	login	Login via username/password	\N		2026-05-11 12:57:07.58236+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
9df83e26-d0e2-44bc-8b40-fedadac67a61	logout	User logged out	\N		2026-05-11 12:57:34.085471+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
7f13cd26-db0e-4465-b90d-efc8ba54e0ee	login	Login via username/password	\N		2026-05-11 12:57:49.174202+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
1433067c-df18-4847-b812-633e58395ed5	logout	User logged out	\N		2026-05-11 12:58:00.039326+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
e87c9df4-6d23-4f99-9f64-0a1440e9d92b	login	Login via username/password	\N		2026-05-11 12:58:05.800003+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
b15dcaa2-9b4e-4767-bb40-d8441dfc9da8	logout	User logged out	\N		2026-05-11 12:58:32.051222+05:30	ef266648-9837-4cbc-86b1-5af95046120b	\N	\N	\N
f4eb5132-ba45-47d5-a377-d61c5bcb5d4c	login	Login via username/password	\N		2026-05-11 12:58:35.924061+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
272338ee-ef75-4bd6-9f8a-a0a8017d896d	logout	User logged out	\N		2026-05-11 12:59:23.092923+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
ca385a8d-11d8-4207-b80a-5906d4efa5b2	create_user	Advocate self-registered	\N		2026-05-11 13:04:01.427406+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
92b915fc-5bcc-415a-b2b0-fc19e3decd28	create_join_link	Created client join link for solo advocate	\N		2026-05-11 13:06:23.57393+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
f8777dde-6808-4016-bb03-0425dad55eee	join_via_link	Joined Solo Practice via generic link as Client	\N		2026-05-11 13:07:48.963371+05:30	f55a587a-2465-41fc-aa12-3975a18b21fb	\N	\N	\N
b324a554-dacd-4a9b-b2ff-74595f9b2c1c	logout	User logged out	\N		2026-05-11 13:08:43.719011+05:30	f55a587a-2465-41fc-aa12-3975a18b21fb	\N	\N	\N
3f923cdc-7f22-4efe-8991-86c370d747fb	login	Login via username/password	\N		2026-05-11 13:08:56.419188+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
b12200bc-409c-4390-86c2-7c010482128f	login	Login via username/password	\N		2026-05-11 13:17:23.427186+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
fba1eed6-2c65-4c35-8f2f-c98b9602a718	logout	User logged out	\N		2026-05-11 13:19:10.8038+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
a5d44a0a-e909-495d-968c-eb8df15679af	login	Login via username/password	\N		2026-05-11 13:19:15.109555+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
92773935-8bcf-4a27-8e78-5cbef375be55	create_user	Client self-registered	\N		2026-05-11 13:19:53.133138+05:30	ead81aad-44c7-4780-9afe-3a8501fac43e	\N	\N	\N
61d0fc4d-ab49-40f9-b739-3dd657fbf558	logout	User logged out	\N		2026-05-11 13:20:15.263332+05:30	ead81aad-44c7-4780-9afe-3a8501fac43e	\N	\N	\N
3b64e247-81ce-42f3-9ae7-406ac3bf88ba	create_user	Advocate self-registered	\N		2026-05-11 13:24:04.739676+05:30	1932bab4-adc6-4085-8150-aaabf361e3e8	\N	\N	\N
d66c7ef8-5f36-4135-b3b5-c2fb10d909ef	logout	User logged out	\N		2026-05-11 13:28:22.598399+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
ec44264c-6535-4469-a9be-3f3314c672c8	login	Login via username/password	\N		2026-05-11 13:29:05.24231+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
d71a0d46-7759-46ce-9de4-c40dade0ecee	login	Login via username/password	\N		2026-05-11 13:31:19.342074+05:30	f55a587a-2465-41fc-aa12-3975a18b21fb	\N	\N	\N
dfb57d7a-9695-456f-b401-60a9266305bf	logout	User logged out	\N		2026-05-11 13:46:17.745221+05:30	1932bab4-adc6-4085-8150-aaabf361e3e8	\N	\N	\N
bb1ad395-fc7c-46cd-949f-1097b48b674b	login	Login via username/password	\N		2026-05-11 13:46:21.647947+05:30	ead81aad-44c7-4780-9afe-3a8501fac43e	\N	\N	\N
04f91fda-936c-461e-98f1-ab25ba6135b2	logout	User logged out	\N		2026-05-11 13:46:28.274274+05:30	ead81aad-44c7-4780-9afe-3a8501fac43e	\N	\N	\N
ffc6889a-e3f0-468f-89fe-863fbf0a0a2c	login	Login via username/password	\N		2026-05-11 13:59:14.715157+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
0735bf71-b1e4-4a19-a2b3-6cbd2aa9ac79	create_user	Super Admin (Firm Owner) self-registered	\N		2026-05-11 15:08:43.220391+05:30	6b1a8158-aac2-45be-90c2-c21769f73f7b	\N	\N	\N
1a22a661-b6a5-44b5-b294-8bc685a500f5	login	Login via username/password	\N		2026-05-11 15:50:56.318651+05:30	184ee2bb-6bf9-4dc6-8e05-3620562c827e	\N	\N	\N
251cf0c3-297c-4060-90df-1b61a5c55925	logout	User logged out	\N		2026-05-11 16:07:29.318654+05:30	184ee2bb-6bf9-4dc6-8e05-3620562c827e	\N	\N	\N
f9fcda80-4d8a-445d-872d-a7f8142395ba	login	Login via username/password	\N		2026-05-11 16:10:50.187627+05:30	f55a587a-2465-41fc-aa12-3975a18b21fb	\N	\N	\N
4d754b0a-9ff3-4750-abec-a748f75256e0	logout	User logged out	\N		2026-05-11 16:13:58.982813+05:30	f55a587a-2465-41fc-aa12-3975a18b21fb	\N	\N	\N
da38e648-ad8f-4438-9d16-db57d6efc12b	logout	User logged out	\N		2026-05-11 16:14:48.227314+05:30	184ee2bb-6bf9-4dc6-8e05-3620562c827e	\N	\N	\N
766bd802-49f1-4ce4-a221-2b92ad62cf94	login	Login via username/password	\N		2026-05-11 16:15:05.016493+05:30	f55a587a-2465-41fc-aa12-3975a18b21fb	\N	\N	\N
7f8a7a20-0b7c-4099-84bf-dd5809a72f5d	logout	User logged out	\N		2026-05-11 16:24:31.515871+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
cd6cfd54-6ba4-4ac8-8c25-ba5feecbd3e8	login	Login via username/password	\N		2026-05-11 16:24:37.849835+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
cb40b15e-8100-44ae-9ae1-a7e27d83c73d	login	Login via username/password	\N		2026-05-11 16:29:52.601599+05:30	f55a587a-2465-41fc-aa12-3975a18b21fb	\N	\N	\N
8e9e15fa-6b62-4a71-ae11-ead70146adca	logout	User logged out	\N		2026-05-11 17:12:14.996243+05:30	f55a587a-2465-41fc-aa12-3975a18b21fb	\N	\N	\N
fe6fe4b6-1c72-4d38-bf7b-22fd6a9528f8	login	Login via username/password	\N		2026-05-11 17:12:45.118386+05:30	cfea0561-f92d-4eb8-90ff-7574f812dc63	\N	\N	\N
e5f3bc9d-4b9a-40c8-9ac8-fcc593ccc6d8	login	Login via username/password	\N		2026-05-11 17:19:10.280212+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
a6f5075a-25a2-4c7b-9dba-f967b71ecceb	create_user	Subscription upgraded from hero plan to Enterprise for 1 month(s). Payment: bank_transfer ref: qq	\N		2026-05-11 17:19:36.415946+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
0ba738dd-a4af-4789-8573-969148bbf8c1	create_user	Subscription upgraded from Enterprise to Enterprise for 1 month(s). Payment: bank_transfer ref: qq	\N		2026-05-11 17:19:40.306003+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
1b7d0233-8759-4f09-90f8-d6a7aa20044b	login	Login via username/password	\N		2026-05-11 22:13:18.210065+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
37340972-c515-440b-85d7-a98181ea07c7	logout	User logged out	\N		2026-05-12 11:38:52.507736+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
fadcabeb-c7af-4f62-8484-44d4ca912c29	login	Login via username/password	\N		2026-05-12 11:38:57.010366+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
ee8d302c-b4d9-44dd-b174-2c296c7d3bd4	login	Login via username/password	\N		2026-05-12 16:24:26.206562+05:30	f55a587a-2465-41fc-aa12-3975a18b21fb	\N	\N	\N
f5394cb8-ab56-437c-b4f0-c7b6a5afb487	login	Login via username/password	\N		2026-05-12 16:27:18.002275+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
d810bfc9-8a95-475e-8361-ac5c049aab53	login	Login via username/password	\N		2026-05-12 16:28:34.782957+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
ad55b61e-a618-4b03-ba66-c27c84d90dc3	login	Login via username/password	\N		2026-05-12 16:47:44.819839+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
a6800168-5c1a-4cfb-aee9-3ce25472429c	logout	User logged out	\N		2026-05-12 16:50:09.683722+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
412f6180-e0dc-4c7a-ad50-ba57cd6358eb	login	Login via username/password	\N		2026-05-12 16:50:24.03632+05:30	f55a587a-2465-41fc-aa12-3975a18b21fb	\N	\N	\N
d05863c1-cf77-42f4-85d5-563abd2a4722	logout	User logged out	\N		2026-05-12 17:15:15.190839+05:30	f55a587a-2465-41fc-aa12-3975a18b21fb	\N	\N	\N
9c0f09e6-cced-4178-808c-a4a5f2e4e78b	login	Login via username/password	\N		2026-05-12 17:15:45.145974+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
9a47d0f4-8652-411d-aa94-7b10e5c5c2b0	login	Login via username/password	\N		2026-05-13 11:32:04.595552+05:30	184ee2bb-6bf9-4dc6-8e05-3620562c827e	\N	\N	\N
1d7c4b3e-fde4-41c1-97bb-201a370eebd7	create_user	Client self-registered	\N		2026-05-13 11:45:58.027958+05:30	2264d078-daf3-456e-be50-112c6ca1a3f4	\N	\N	\N
0c61f094-8e3b-4893-bba6-80f47b6c0e57	logout	User logged out	\N		2026-05-13 17:52:43.022238+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
1116c6ff-f5ed-4222-b74b-ba0b20d93f24	login	Login via username/password	\N		2026-05-13 17:52:48.303472+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
b1242e61-3662-4250-8977-704e7cd36c68	login	Login via username/password	\N		2026-05-14 09:47:41.84797+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
ba238ec9-e9f8-4fda-a66d-fe4af3ad8121	create_user	Client self-registered	\N		2026-05-14 12:41:46.680991+05:30	70af14e0-742c-47a3-a450-78fdecad1399	\N	\N	\N
3256ca68-fa50-4b81-8f68-658ea87cbf84	logout	User logged out	\N		2026-05-14 12:48:03.492576+05:30	70af14e0-742c-47a3-a450-78fdecad1399	\N	\N	\N
1ffd88e8-b881-45f2-8dee-8cbe0248165d	login	Login via username/password	\N		2026-05-14 13:58:57.832204+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
deba029d-5bb1-439c-b9f5-a7648d52dc8e	logout	User logged out	\N		2026-05-14 13:59:15.325876+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
8aa878a1-5586-4008-b102-28cf0dbcb856	login	Login via username/password	\N		2026-05-14 13:59:22.320666+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
77b1f45a-88a8-40af-a255-1b6f1b87e6e2	logout	User logged out	\N		2026-05-14 14:00:07.877187+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
2ca58df8-44ce-4e30-b4e9-71992c9891b6	login	Login via username/password	\N		2026-05-14 14:00:13.272646+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
92c1eb78-03f8-4d6f-8847-471cdddee09a	logout	User logged out	\N		2026-05-14 14:00:45.707366+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
d40d8f21-9910-445f-affe-7241118e338a	login	Login via username/password	\N		2026-05-14 14:00:49.523903+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
a2932cd0-bb9f-4cbf-9a53-ac0f44bf818f	logout	User logged out	\N		2026-05-14 14:01:35.464279+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
a50fc9b6-59c2-48c5-b061-91ef260bd4bf	login	Login via username/password	\N		2026-05-14 14:01:41.825746+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
1bca516c-da10-4a63-95d1-f5937f32f320	logout	User logged out	\N		2026-05-14 14:01:52.623634+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
5c12c152-d2fb-4baa-8a40-037a08690c41	login	Login via username/password	\N		2026-05-14 14:01:59.72002+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
a11cdf6a-2cb3-4352-b8c3-0dc7342268d6	logout	User logged out	\N		2026-05-14 14:02:42.741636+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
e61fab7b-7f37-4a16-bb6c-a089c6d1c790	login	Login via username/password	\N		2026-05-14 14:02:48.981781+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
d7adcd41-288e-4996-8409-64422163a7e1	logout	User logged out	\N		2026-05-14 14:04:25.589147+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
13f27997-3c9a-4905-b00f-28dcc580b91c	login	Login via username/password	\N		2026-05-14 14:04:30.079927+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
a94341a2-7962-45f0-a8d5-c3508894e970	logout	User logged out	\N		2026-05-14 14:06:43.245606+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
1b6fc223-33e4-4d31-8d77-2abaf47a2ffa	login	Login via username/password	\N		2026-05-14 14:06:46.994033+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
9346d342-b030-4970-a728-44004a8565f8	logout	User logged out	\N		2026-05-14 14:47:51.075701+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
61a129a3-4991-4209-a5d5-4437559b30c2	login	Login via username/password	\N		2026-05-14 14:47:55.378894+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
f32dd9ed-027c-4e1f-8760-4a5e96fdf6e4	logout	User logged out	\N		2026-05-14 14:48:46.759773+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
38eb6d85-47e7-4af6-b0d6-d3146d87a65e	login	Login via username/password	\N		2026-05-14 14:48:50.935035+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
1d9b5d8d-40cf-4ced-866a-92166990fa0d	create_user	Advocate self-registered	\N		2026-05-14 14:51:58.614087+05:30	425dedd8-23d0-4248-8327-8da324819df0	\N	\N	\N
bedf7337-6d5d-48de-ba69-a5bee9805ae1	login	Login via username/password	\N		2026-05-15 11:13:52.187471+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
09bf8817-7bc2-4952-aebe-9c1b18fa56c9	login	Login via username/password	\N		2026-05-15 11:15:16.31997+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
e053fed2-1a32-453a-ab9d-89cdf9cd56e7	login	Login via username/password	\N		2026-05-15 11:28:03.089602+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
e5604258-e505-4ae7-8b13-f5ab5d0ce0de	logout	User logged out	\N		2026-05-15 11:28:25.187266+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
161dedf7-cdd0-42ea-ac55-55a75183b095	login	Login via username/password	\N		2026-05-15 15:38:07.921983+05:30	184ee2bb-6bf9-4dc6-8e05-3620562c827e	\N	\N	\N
8cc157a1-82e4-43cd-b9b4-c6a66c3eebbc	login	Login via username/password	\N		2026-05-18 10:00:23.546335+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
9ce3eeff-bafa-46f8-9ab6-b3a7de4a7fe7	login	Login via username/password	\N		2026-05-18 10:07:28.839672+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
7854c1be-6f5e-49e4-ba88-5ddc91a9157b	logout	User logged out	\N		2026-05-18 10:08:15.830587+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
71c8064c-bc8a-4062-9b39-08af9fb037cd	login	Login via username/password	\N		2026-05-18 10:09:18.770851+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
598efde6-997c-4bc2-9a50-890ab2240e42	login	Login via username/password	\N		2026-05-18 10:20:11.453655+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
d62af019-b5fe-4054-8027-894ca5bd1e72	login	Login via username/password	\N		2026-05-18 11:50:30.664621+05:30	dd4f0cba-8b3b-4d24-9601-0ef0eae3eda6	\N	\N	\N
25427236-6f83-4ccb-a137-0e0f4f55e576	logout	User logged out	\N		2026-05-18 11:56:08.163624+05:30	dd4f0cba-8b3b-4d24-9601-0ef0eae3eda6	\N	\N	\N
56fd3ef5-4b91-4826-920f-55813b026c1d	login	Login via username/password	\N		2026-05-18 11:57:59.56486+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
51462558-1e8e-443d-9ef7-12afe57c736c	login	Login via username/password	\N		2026-05-18 12:10:06.933077+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
8f553618-718e-4d8b-b58e-ff857587af37	login	Login via username/password	\N		2026-05-18 12:11:04.918391+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
d40b0825-e9ec-4f65-935a-791234dbf959	create_user	Client self-registered	\N		2026-05-18 14:25:18.880696+05:30	75b53f3e-46f8-45a7-ab94-437b13830279	\N	\N	\N
9531eba5-ad00-41a9-ab27-1bb36b23de9b	logout	User logged out	\N		2026-05-18 15:46:03.114282+05:30	75b53f3e-46f8-45a7-ab94-437b13830279	\N	\N	\N
c3deb136-c9a4-4c89-b88d-34e808fde2d1	create_user	Advocate self-registered	\N		2026-05-18 16:01:21.398044+05:30	e720e85d-111b-49cc-b86a-1aec508dc7a1	\N	\N	\N
f6bd2d40-8b02-4749-990a-343b5a64cdb7	logout	User logged out	\N		2026-05-18 16:32:01.671571+05:30	e720e85d-111b-49cc-b86a-1aec508dc7a1	\N	\N	\N
58a97a90-e16f-4f98-b68f-2ef9b1820fab	create_user	Super Admin (Firm Owner) self-registered	\N		2026-05-18 16:56:53.289784+05:30	6d3d81da-93ab-4617-a05b-72948bad95b1	\N	\N	\N
61c19b45-f472-4a0a-ac76-c04661a73f1c	login	Login via username/password	\N		2026-05-19 11:42:48.423781+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
0603b77c-f704-47ff-a8bd-8b556d2c13f8	login	Login via username/password	\N		2026-05-19 11:43:06.768723+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
f8d06e79-b674-44cd-a25a-e56782edc2fa	login	Login via username/password	\N		2026-05-20 15:53:27.001829+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
04d7557d-24ba-417a-9af8-2a5f3a14a204	login	Login via username/password	\N		2026-05-20 18:50:35.665251+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
c2e8297f-7d87-44af-af10-5ed68ae917f7	login	Login via username/password	\N		2026-05-22 13:58:15.525417+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
e5f727e3-5a19-4d94-a859-3a016c686a54	login	Login via username/password	\N		2026-06-18 13:43:32.327961+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
acbb0e7f-834e-43f7-8a4a-cd938bfcb20d	login	Login via username/password	\N		2026-06-18 14:39:48.504395+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
5ac27931-3046-4c35-9af0-572a866d0f17	login	Login via username/password	\N		2026-06-24 10:44:37.468169+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
97127d79-278a-404f-acc6-e415d233a372	login	Login via username/password	\N		2026-06-29 09:56:56.483127+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
2fbfb122-bdd6-4ddd-83eb-63f817f346a5	logout	User logged out	\N		2026-06-29 09:58:04.590998+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
7daa713b-2015-41cb-8973-3df0017cb7a5	login	Login via username/password	\N		2026-06-29 09:59:03.918641+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
0987561f-d53b-46a3-adaa-4fe120d48668	logout	User logged out	\N		2026-06-29 09:59:19.132234+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
06eaa6ca-a830-4c80-85d4-fe633e9a3db6	login	Login via username/password	\N		2026-06-29 10:00:59.972399+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
0668228d-e522-43de-acab-c864c15080cb	logout	User logged out	\N		2026-06-29 10:06:18.771283+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
1f1e7b2e-e64a-4618-9a21-6d66a2efcfe0	login	Login via username/password	\N		2026-06-29 10:14:50.494108+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
f4a04e17-2509-4e61-85b9-0858adbf5bcc	logout	User logged out	\N		2026-06-29 10:36:11.589719+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
d59c431a-9862-4cf0-9cc9-e4b76c292b73	login	Login via username/password	\N		2026-06-29 10:36:22.425088+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
5a0e2d53-7efa-43e0-8109-b4f7b779d32d	logout	User logged out	\N		2026-06-29 10:45:48.529677+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
85d00a0b-2401-4e10-b62a-ff4b1019e5cc	login	Login via username/password	\N		2026-06-29 10:46:27.402471+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
aaa06360-bcc5-4169-8924-10f3a2a0a343	logout	User logged out	\N		2026-06-29 10:59:37.717533+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
f445d264-7f9f-41c1-a898-28c344e9df54	login	Login via username/password	\N		2026-06-29 10:59:43.537325+05:30	4e1a7020-f5e3-46aa-910c-0892eb73f480	\N	\N	\N
8fec6a29-c8fb-4adc-8207-44845ee157c0	logout	User logged out	\N		2026-06-29 11:02:00.09925+05:30	4e1a7020-f5e3-46aa-910c-0892eb73f480	\N	\N	\N
26efe080-6473-4153-be91-8793e48dae59	login	Login via username/password	\N		2026-06-29 11:04:51.172763+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
486492d2-4f77-4a89-aec7-9e85f1ff5215	logout	User logged out	\N		2026-06-29 11:06:33.243033+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
5bc4e1b5-ae22-4778-8e8e-f15ffd550a55	login	Login via username/password	\N		2026-06-29 11:07:17.822034+05:30	90790d0f-374c-4a08-b0d6-b74a171a7ca5	\N	\N	\N
e79ee774-fdfa-4a68-ad5c-9a24d6d5bb48	logout	User logged out	\N		2026-06-29 11:11:12.055121+05:30	90790d0f-374c-4a08-b0d6-b74a171a7ca5	\N	\N	\N
b5830e1b-5082-4009-aa79-edc151be80f6	login	Login via username/password	\N		2026-06-29 11:11:25.031208+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
79f75f56-363b-4e99-85bf-1a15a7438dd8	logout	User logged out	\N		2026-06-29 11:18:05.029604+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
c1cc55a2-2363-431f-88e9-e7f95eb9799b	login	Login via username/password	\N		2026-06-29 11:18:45.925805+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
7cd564a4-341a-49d8-9486-0a329a63e29a	logout	User logged out	\N		2026-06-29 13:46:17.688313+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
bd22099a-20ae-4fb8-a9b4-2fc2b0b4c008	login	Login via username/password	\N		2026-07-15 10:55:01.521211+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
317fe2bc-8ac5-4682-a9f1-b89b7c5c99de	logout	User logged out	\N		2026-07-15 10:59:45.113336+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
a20ed59d-2c48-4048-9752-cca4e5a975f7	login	Login via username/password	\N		2026-07-15 10:59:51.374312+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
ad3b08bd-408e-4fe1-8ad7-3f3b0dacdc64	logout	User logged out	\N		2026-07-15 11:00:18.622218+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
bb2efae4-0bb3-4f38-aaee-92628be9dc26	login	Login via username/password	\N		2026-07-15 11:01:18.550606+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
1b36ecf8-7754-44bc-81ea-f4ddddb26d4f	logout	User logged out	\N		2026-07-15 11:01:21.655136+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
abc17a73-d34b-4769-9d9c-9e3c5ebda56c	login	Login via username/password	\N		2026-07-15 11:01:32.496685+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
78ddd1d3-4dc5-480e-b882-1e0ff1c7abf7	logout	User logged out	\N		2026-07-15 11:01:46.67338+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
887fa78a-b381-4d52-9cb0-84899ea81657	login	Login via username/password	\N		2026-07-15 11:01:56.67533+05:30	d649f2d2-bccb-48a8-9db8-d851ff2aa037	\N	\N	\N
7e643f0f-5529-4b50-9148-7a8bc9959c55	logout	User logged out	\N		2026-07-15 11:02:01.79554+05:30	d649f2d2-bccb-48a8-9db8-d851ff2aa037	\N	\N	\N
ee8f70f4-608d-4de6-bf61-d0a4a34d81c9	login	Login via username/password	\N		2026-07-15 11:02:07.275523+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
742b349b-6439-4f48-ad43-7555d350bea6	logout	User logged out	\N		2026-07-15 11:06:56.30761+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
985f70d2-ff0f-4623-92a5-3f3a6015e88a	login	Login via username/password	\N		2026-07-15 11:07:02.831381+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
8c24e46e-77e6-40f5-a2bd-fb65a3e7f502	create_user	Subscription upgraded from Enterprise to Business for 1 month(s). Payment: bank_transfer ref: cdfcd	\N		2026-07-15 11:07:29.871652+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
2694fcb4-625e-4814-b62c-466ebc08b5e3	create_invoice	Auto-generated invoice SUB-2026-00007 for subscription upgrade - Amount: ₹2948.8200	\N		2026-07-15 11:07:29.882422+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	92a167ff-4595-4f43-9c2c-d3cfdfec3819	platform_invoice
c22f2b50-5458-4600-bb6f-cc71cd3f527a	logout	User logged out	\N		2026-07-15 11:07:36.78181+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
372ef526-1502-4a1f-b036-d2375d80f1b6	login	Login via username/password	\N		2026-07-15 11:07:44.843359+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
66705c16-161a-4bf2-aae0-9bc1033187af	logout	User logged out	\N		2026-07-15 11:10:16.763578+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
8577ab43-ce72-47af-a148-646f4d909202	login	Login via username/password	\N		2026-07-15 11:10:24.441653+05:30	d649f2d2-bccb-48a8-9db8-d851ff2aa037	\N	\N	\N
8e31c87b-ae6a-491c-9379-136a92c26e46	logout	User logged out	\N		2026-07-15 11:10:27.273574+05:30	d649f2d2-bccb-48a8-9db8-d851ff2aa037	\N	\N	\N
bf7b27b1-47cd-4fd5-8e54-fc3250267e95	login	Login via username/password	\N		2026-07-15 11:10:32.306077+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
9ac16c85-739c-4819-b065-6938984e1423	logout	User logged out	\N		2026-07-15 11:11:11.789443+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N	\N
e564a44b-0f1a-4a56-9cbc-cb48e13a4330	login	Login via username/password	\N		2026-07-15 11:11:15.554704+05:30	33c21527-b152-48ea-af18-1b73e0301e6c	\N	\N	\N
8446d178-ceb7-406a-b9cf-f9f703fb3293	logout	User logged out	\N		2026-07-15 11:11:26.045948+05:30	33c21527-b152-48ea-af18-1b73e0301e6c	\N	\N	\N
6e86f1b9-9bcd-4d5e-a0b1-289dec5f1a4f	login	Login via username/password	\N		2026-07-15 11:11:31.29477+05:30	0dae6e2b-0eb2-4ccc-9261-e37b567bcdcc	\N	\N	\N
df0b0241-1515-4527-8ae4-3606d93a119d	logout	User logged out	\N		2026-07-15 11:11:34.646328+05:30	0dae6e2b-0eb2-4ccc-9261-e37b567bcdcc	\N	\N	\N
f8fdd400-5310-4627-83c5-9726e202159d	login	Login via username/password	\N		2026-07-15 11:11:38.963531+05:30	e3c89f4a-264a-4d7f-9625-d7f57e7f2c4f	\N	\N	\N
8befb527-5836-4046-970c-c4c01e279a31	logout	User logged out	\N		2026-07-15 11:11:42.601976+05:30	e3c89f4a-264a-4d7f-9625-d7f57e7f2c4f	\N	\N	\N
f1d4a23e-c78c-4299-8499-fa59358fbe46	login	Login via username/password	\N		2026-07-15 11:11:51.27595+05:30	70dd5f3f-412e-4816-a258-6fc40c025bde	\N	\N	\N
2377acfd-6687-4616-bcea-4d8c81265127	logout	User logged out	\N		2026-07-15 11:11:54.778417+05:30	70dd5f3f-412e-4816-a258-6fc40c025bde	\N	\N	\N
d94fe72a-e436-4889-a885-9dcb6d1623f8	login	Login via username/password	\N		2026-07-15 11:17:18.939614+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
737eed6b-8a35-4b3b-9afa-a30064262ec7	login	Login via username/password	\N		2026-07-17 16:51:29.285546+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
f226cc73-7dc0-4c97-adef-d170157f02e3	login	Login via username/password	\N		2026-07-17 16:52:37.239309+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
4fa4eab8-b205-4f54-a43e-fe6b3d501a80	logout	User logged out	\N		2026-07-17 16:53:01.485579+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
7f5594a3-52a8-4055-a9c0-24726ef71dea	login	Login via username/password	\N		2026-07-17 16:53:15.225221+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
a781649d-97a0-455d-a9be-276296be248e	login	Login via username/password	\N		2026-07-20 16:21:26.415838+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
887b3982-b87d-4dec-9ca6-24c2b62e66a3	logout	User logged out	\N		2026-07-20 16:42:53.732097+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
f383c73b-aab6-4aee-afad-0242e338e964	login	Login via username/password	\N		2026-07-20 16:44:51.185374+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
9cd12e50-0be0-4874-b0e0-523d0d99d3ab	logout	User logged out	\N		2026-07-20 18:05:53.336601+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
f9a6b0be-06a8-4abd-b2d4-197cd60370eb	login	Login via username/password	\N		2026-07-20 18:06:19.331762+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
acf4c8a2-eb08-432f-a434-555668b276f0	logout	User logged out	\N		2026-07-20 18:21:32.177374+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
db28d0da-5b2c-4432-ac81-dbca85777abd	login	Login via username/password	\N		2026-07-20 18:22:12.065047+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
25c59a7d-4cfd-482d-84d3-816a7fd560a5	logout	User logged out	\N		2026-07-20 18:22:30.454965+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
02350403-ee79-49c1-af7d-a8eaebe5a0c5	login	Login via username/password	\N		2026-07-20 18:22:38.876061+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
3624dd3f-20bb-41fe-8222-d53d4f7ea54c	login	Login via username/password	\N		2026-07-21 10:27:25.914036+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
86fbcddb-51e9-42ab-87a0-b7e1c144c6ab	logout	User logged out	\N		2026-07-21 10:29:01.114584+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N	\N
2521ca78-b880-43ef-a34b-ab98be0e74ef	login	Login via username/password	\N		2026-07-21 10:40:45.225211+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
875a1431-64f2-4373-a13d-87c742f0b2d1	logout	User logged out	\N		2026-07-21 10:42:46.126018+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	\N	\N
e422ad67-e784-48ec-b9ff-b28a98f8877f	login	Login via username/password	\N		2026-07-21 10:43:28.888149+05:30	3b606ec3-0b52-4b70-a076-135e2185e64d	\N	\N	\N
5732443c-a246-4275-9c89-14d4c19b22bf	logout	User logged out	\N		2026-07-21 11:34:48.433935+05:30	3b606ec3-0b52-4b70-a076-135e2185e64d	\N	\N	\N
c624f94e-520d-4b59-bd42-c905624048d0	login	Login via username/password	\N		2026-07-21 11:35:03.644931+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
70aeabfa-1da9-411e-b74a-055e221e2c48	login	Login via username/password	\N		2026-07-22 15:41:02.402517+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
44661781-2a0c-4d5f-bfd7-c37c734beb9f	login	Login via username/password	\N		2026-07-23 12:56:33.273573+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
0aff1c3a-7071-4040-8590-c3986b958bf9	login	Login via username/password	\N		2026-07-23 18:03:42.108282+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
54253b41-b0ea-49c5-a1f3-22c3d2ec1bb6	login	Login via username/password	\N		2026-07-24 11:02:35.319266+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
52c42ed0-44f5-401e-869a-1d503c0210c2	logout	User logged out	\N		2026-07-24 11:34:21.987353+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
eda09f84-2f32-4d85-a65c-ee164c5d8628	login	Login via username/password	\N		2026-07-24 11:34:42.701881+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
64f08bdc-7723-443b-9ae0-2013f45d65a5	logout	User logged out	\N		2026-07-24 11:52:15.469055+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
c5829461-db36-4f0d-994c-edde9e1c678e	login	Login via username/password	\N		2026-07-25 11:31:45.402199+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
c2399aa4-9273-4df4-9299-66d8b82a10eb	login	Login via username/password	\N		2026-07-27 10:28:50.459744+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
ad523c66-516c-4d03-aecd-a3303a73b264	login	Login via username/password	\N		2026-07-27 10:29:30.766864+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
594d2d6a-b7ab-4e01-9e48-0f4948cac89c	login	Login via username/password	\N		2026-07-30 11:38:18.528192+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
4170faf9-d869-4841-8697-ea2a70107d74	login	Login via username/password	\N		2026-07-31 10:37:16.718384+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
f4d24c60-85a2-4852-99d6-245c0634ae8f	login	Login via username/password	\N		2026-07-31 11:01:03.74888+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
bc67692f-134c-4e7c-88c7-cfaea6915998	logout	User logged out	\N		2026-07-31 15:55:34.063537+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N	\N	\N
c66060de-4e29-4f69-a024-ec8f2fb6227f	login	Login via username/password	\N		2026-07-31 15:55:47.335159+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N	\N	\N
67f82158-ae26-4bb3-aab6-b3b612b602fa	create_user	Subscription upgraded from Business to Trial for 1 month(s). Payment: bank_transfer ref: xxf	\N		2026-07-31 15:56:14.143917+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
d3eff3d6-a53f-45f7-a4ea-7d9401e13e8a	create_user	Subscription upgraded from Trial to Trial for 1 month(s). Payment: bank_transfer ref: xxf	\N		2026-07-31 15:56:16.8805+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
c291037b-331c-4ac3-983e-7d99027d969b	create_user	Subscription upgraded from Trial to Trial for 1 month(s). Payment: bank_transfer ref: xxf	\N		2026-07-31 15:56:21.047973+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
64054c3f-ce71-45c0-b7e4-7deebbb66c4e	create_user	Subscription upgraded from Trial to Trial for 1 month(s). Payment: bank_transfer ref: xxfc	\N		2026-07-31 17:34:42.075256+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
4f65a80d-f50e-4e9e-9ed1-6280c87ec3e4	create_invoice	Auto-generated invoice SUB-2026-00008 for subscription upgrade - Amount: ₹0.0000	\N		2026-07-31 17:34:42.085141+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	49c80d0e-a257-48d1-8d3a-f200951c100e	platform_invoice
38695907-b4d2-43e1-a673-0495ed56642b	create_user	Subscription upgraded from Trial to Business for 1 month(s). Payment: bank_transfer ref: xxfc	\N		2026-07-31 17:34:50.571111+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	subscription
c8e14067-084e-468a-99be-886f3d7b2dd6	create_invoice	Auto-generated invoice SUB-2026-00009 for subscription upgrade - Amount: ₹2948.8200	\N		2026-07-31 17:34:50.578682+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	fa7059c1-a059-4c4c-bb72-27c86098b25e	platform_invoice
d039a032-b49b-442e-8ae7-0252afe37347	login	Login via username/password	\N		2026-08-03 12:21:25.16415+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
6a99efae-6090-4964-a82b-2399eddb42a3	create_user	Advocate self-registered	\N		2026-08-03 13:11:21.186238+05:30	9eea803b-c301-41db-803d-6bdfb6278e89	\N	\N	\N
968b6570-23c0-4f6a-b0d8-1470e9b986cc	logout	User logged out	\N		2026-08-03 16:13:37.753506+05:30	9eea803b-c301-41db-803d-6bdfb6278e89	\N	\N	\N
f273149c-b109-4c58-8186-4bbc314663fb	login	Login via username/password	\N		2026-08-03 16:13:54.424063+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
9bd3a4f9-bd60-4ad6-9fbe-42a616186988	create_join_link	Created client join link for Saxena & Saxena Lawfirms	\N		2026-08-03 17:29:19.433998+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
a6110bfb-7316-49c6-829b-b301f01a688f	logout	User logged out	\N		2026-08-03 17:29:39.553783+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
086d7887-3cd3-4047-b2a2-e95e819764eb	login	Login via username/password	\N		2026-08-03 17:30:26.025258+05:30	9eea803b-c301-41db-803d-6bdfb6278e89	\N	\N	\N
13527909-e83f-4312-8c44-26095cfd7fb8	create_join_link	Created client join link for solo advocate	\N		2026-08-03 17:30:49.892917+05:30	9eea803b-c301-41db-803d-6bdfb6278e89	\N	\N	\N
763ffa56-8b15-4314-9450-712414f4f1e6	join_via_link	Joined Solo Practice via generic link as Client	\N		2026-08-03 17:31:56.895617+05:30	09e41654-0c15-43f0-95a9-3d2f6a541ef4	\N	\N	\N
8dc3757e-fd90-4b6b-8d9c-ccff067e5c5a	logout	User logged out	\N		2026-08-04 09:56:24.786747+05:30	9eea803b-c301-41db-803d-6bdfb6278e89	\N	\N	\N
b90de31f-6887-4f6f-9e83-f9af71ed460c	login	Login via username/password	\N		2026-08-04 09:56:34.448402+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
79b6d2f3-c36c-45c0-88cf-02c2c1d18878	create_join_link	Created client join link for Saxena & Saxena Lawfirms	\N		2026-08-04 10:15:02.026303+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
ff6c597d-da04-483d-9145-e17399651bb7	create_join_link	Created client join link for Saxena & Saxena Lawfirms	\N		2026-08-04 10:15:10.561639+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
11fcb75d-d78c-4518-afe7-827f151a58cd	create_join_link	Created client join link for Saxena & Saxena Lawfirms	\N		2026-08-04 10:15:12.489976+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
8bc00407-6b0a-4fef-8ac0-0a983913240c	create_join_link	Created client join link for Saxena & Saxena Lawfirms	\N		2026-08-04 10:15:17.772231+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
771c8fe0-c186-4897-bcee-547c6a39e980	logout	User logged out	\N		2026-08-05 12:01:06.780471+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
de361bd0-d74c-485e-baa9-1f0debb94f1b	login	Login via username/password	\N		2026-08-05 12:21:28.209466+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
9c609647-2c8d-4529-9447-d8041ed89719	otp_sent	OTP sent to email: advo@gmail.com	\N		2026-08-05 12:58:01.972222+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
4186f7df-83ec-4c21-89f2-b032d70a807e	otp_verified	OTP verified via email	\N		2026-08-05 12:58:02.006851+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
b52aa7de-f2b8-4bf6-acef-27967749b429	otp_sent	OTP sent to email: subratbarik2003@gmail.com	\N		2026-08-05 13:23:34.070208+05:30	c75be9a0-e6bc-49d8-b024-875db6cb4911	\N	\N	\N
fe45d28d-03a3-4b9a-ad17-4752495e1068	otp_verified	OTP verified via email	\N		2026-08-05 13:23:56.321743+05:30	c75be9a0-e6bc-49d8-b024-875db6cb4911	\N	\N	\N
cb482c38-8214-4757-877b-6392da1299ac	otp_sent	OTP sent to email: testnewemail@example.com	\N		2026-08-05 13:39:37.132122+05:30	9eea803b-c301-41db-803d-6bdfb6278e89	\N	\N	\N
aafa19ae-7ef0-4f4b-8596-9affc5f6b890	otp_sent	OTP sent to email: testnewemail@example.com	\N		2026-08-05 13:40:13.590965+05:30	9eea803b-c301-41db-803d-6bdfb6278e89	\N	\N	\N
a9e8e0d6-de74-4e3c-8890-3de10a4ac5b0	otp_verified	OTP verified via email	\N		2026-08-05 13:40:13.624912+05:30	9eea803b-c301-41db-803d-6bdfb6278e89	\N	\N	\N
ce5beab5-c425-4d30-b37c-5ee7430aa319	otp_sent	OTP sent to email: advo20=03@gmail.com	\N		2026-08-05 13:41:16.709268+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
07ab7609-59da-425d-a900-33f7cbb4a1f4	otp_verified	OTP verified via email	\N		2026-08-05 13:41:25.145489+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
0e39dfe0-ca6d-406d-ae7e-f9eb5dd8c7af	otp_sent	OTP sent to email: advo20=03@gmail.com	\N		2026-08-05 13:41:42.104559+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
0a3c75ec-0a63-4ce3-902a-7d42c4ea2449	otp_sent	OTP sent to email: advo20=03@gmail.com	\N		2026-08-05 13:42:05.217945+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
6b4a9d7e-f436-42f2-9a18-cb2e7707100f	otp_sent	OTP sent to email: advo20=03@gmail.com	\N		2026-08-05 13:42:07.006932+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
8fac7f82-61fe-46f0-9d7a-b23fecd0dd9b	otp_sent	OTP sent to email: advo20=03@gmail.com	\N		2026-08-05 13:42:08.193295+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
627625ae-598f-4296-a66f-fbe2e258d64a	otp_sent	OTP sent to email: advo20=03@gmail.com	\N		2026-08-05 13:56:25.010393+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
c3de8d6a-a232-4a43-a78f-0153e00e98f9	otp_sent	OTP sent to email: advo2003@gmail.com	\N		2026-08-05 13:57:11.718164+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
1110a5fb-9e10-453c-abd6-1a67502030f5	otp_sent	OTP sent to email: advo203@gmail.com	\N		2026-08-05 15:14:37.575967+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
6b06f830-7cdd-49d5-bd6a-3a3e64ec813e	otp_sent	OTP sent to email: advo203@gmail.com	\N		2026-08-05 15:14:39.308306+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
d45952ae-d80a-4952-97ce-4452ea4ac7d9	otp_sent	OTP sent to email: advo203@gmail.com	\N		2026-08-05 15:14:42.620222+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
c5bc984d-a1c4-4c1b-b6ef-5b57fca96d65	otp_verified	OTP verified via email	\N		2026-08-05 15:14:56.594263+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
cd7d92e8-6cf2-48e3-95b0-87df6e07b252	otp_sent	OTP sent to email: testmsg@example.com	\N		2026-08-05 15:17:14.082274+05:30	9eea803b-c301-41db-803d-6bdfb6278e89	\N	\N	\N
2bd7d498-9422-468f-bba9-012839de37f3	otp_verified	OTP verified via email	\N		2026-08-05 15:17:14.115123+05:30	9eea803b-c301-41db-803d-6bdfb6278e89	\N	\N	\N
e95b65d8-88ec-4a8f-a8d8-4a8be74dc86e	otp_sent	OTP sent to email: advo203@gmail.com	\N		2026-08-05 15:19:08.055188+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
4821ea13-9ad9-4958-bfd3-b8cfee6a4692	otp_verified	OTP verified via email	\N		2026-08-05 15:19:12.949115+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
7f08bb42-9363-447c-824f-bf079513e099	otp_sent	OTP sent to email: advo203@gmail.com	\N		2026-08-05 15:19:25.011+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
be2a57d4-1d1d-43c4-ba66-ca2f89e02e86	otp_verified	OTP verified via email	\N		2026-08-05 15:19:29.926383+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
c9cb6503-9483-4208-bfa8-4857d7c33715	otp_sent	OTP sent to email: advo@gmail.com	\N		2026-08-05 15:22:35.034052+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
c36e9424-fce5-4464-817b-720bea4726a5	otp_verified	OTP verified via email	\N		2026-08-05 15:22:44.114667+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
ac24926e-4dc9-49cf-a0d8-58bde82cafdc	otp_sent	OTP sent to email: unverified123@example.com	\N		2026-08-05 15:26:07.590339+05:30	9eea803b-c301-41db-803d-6bdfb6278e89	\N	\N	\N
2c619119-b6af-4911-841e-7f9a20d91eb1	otp_verified	OTP verified via email	\N		2026-08-05 15:26:07.623131+05:30	9eea803b-c301-41db-803d-6bdfb6278e89	\N	\N	\N
ae9c75d1-4b99-4103-99d0-3e7af8712854	otp_sent	OTP sent to email: advo123@gmail.com	\N		2026-08-05 16:08:33.931049+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
60ddfff0-edcc-4091-93c0-453bfbfdd9ed	otp_verified	OTP verified via email	\N		2026-08-05 16:08:45.944071+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
d54fad10-4855-44c1-88dd-79596a34d2ab	otp_sent	OTP sent to email: advo1123@gmail.com	\N		2026-08-05 16:38:34.978537+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
5491c118-3b7c-499a-b097-4c00c69876da	otp_verified	OTP verified via email	\N		2026-08-05 16:38:38.993257+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
92419f9b-10a8-4d8e-9bc5-a9b72f9e932e	otp_sent	OTP sent to email: advo11233@gmail.com	\N		2026-08-05 16:51:18.451787+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
7ceced52-3e4f-475a-9e89-1f473cc1d624	otp_verified	OTP verified via email	\N		2026-08-05 16:51:23.257511+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	\N	\N
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add Token	6	add_token
22	Can change Token	6	change_token
23	Can delete Token	6	delete_token
24	Can view Token	6	view_token
25	Can add token	7	add_tokenproxy
26	Can change token	7	change_tokenproxy
27	Can delete token	7	delete_tokenproxy
28	Can view token	7	view_tokenproxy
29	Can add custom user	8	add_customuser
30	Can change custom user	8	change_customuser
31	Can delete custom user	8	delete_customuser
32	Can view custom user	8	view_customuser
33	Can add user invitation	9	add_userinvitation
34	Can change user invitation	9	change_userinvitation
35	Can delete user invitation	9	delete_userinvitation
36	Can view user invitation	9	view_userinvitation
37	Can add otp verification	10	add_otpverification
38	Can change otp verification	10	change_otpverification
39	Can delete otp verification	10	delete_otpverification
40	Can view otp verification	10	view_otpverification
41	Can add login credential	11	add_logincredential
42	Can change login credential	11	change_logincredential
43	Can delete login credential	11	delete_logincredential
44	Can view login credential	11	view_logincredential
45	Can add global configuration	12	add_globalconfiguration
46	Can change global configuration	12	change_globalconfiguration
47	Can delete global configuration	12	delete_globalconfiguration
48	Can view global configuration	12	view_globalconfiguration
49	Can add user firm role	13	add_userfirmrole
50	Can change user firm role	13	change_userfirmrole
51	Can delete user firm role	13	delete_userfirmrole
52	Can view user firm role	13	view_userfirmrole
53	Can add firm	14	add_firm
54	Can change firm	14	change_firm
55	Can delete firm	14	delete_firm
56	Can view firm	14	view_firm
57	Can add branch	15	add_branch
58	Can change branch	15	change_branch
59	Can delete branch	15	delete_branch
60	Can view branch	15	view_branch
61	Can add user document	16	add_userdocument
62	Can change user document	16	change_userdocument
63	Can delete user document	16	delete_userdocument
64	Can view user document	16	view_userdocument
65	Can add partner	17	add_partner
66	Can change partner	17	change_partner
67	Can delete partner	17	delete_partner
68	Can view partner	17	view_partner
69	Can add audit log	18	add_auditlog
70	Can change audit log	18	change_auditlog
71	Can delete audit log	18	delete_auditlog
72	Can view audit log	18	view_auditlog
73	Can add case	19	add_case
74	Can change case	19	change_case
75	Can delete case	19	delete_case
76	Can view case	19	view_case
77	Can add hearing	20	add_hearing
78	Can change hearing	20	change_hearing
79	Can delete hearing	20	delete_hearing
80	Can view hearing	20	view_hearing
81	Can add case draft	21	add_casedraft
82	Can change case draft	21	change_casedraft
83	Can delete case draft	21	delete_casedraft
84	Can view case draft	21	view_casedraft
85	Can add case activity	22	add_caseactivity
86	Can change case activity	22	change_caseactivity
87	Can delete case activity	22	delete_caseactivity
88	Can view case activity	22	view_caseactivity
89	Can add client	23	add_client
90	Can change client	23	change_client
91	Can delete client	23	delete_client
92	Can view client	23	view_client
93	Can add task	24	add_task
94	Can change task	24	change_task
95	Can delete task	24	delete_task
96	Can view task	24	view_task
97	Can add firm join link	25	add_firmjoinlink
98	Can change firm join link	25	change_firmjoinlink
99	Can delete firm join link	25	delete_firmjoinlink
100	Can view firm join link	25	view_firmjoinlink
101	Can add subscription plan	26	add_subscriptionplan
102	Can change subscription plan	26	change_subscriptionplan
103	Can delete subscription plan	26	delete_subscriptionplan
104	Can view subscription plan	26	view_subscriptionplan
105	Can add firm subscription	27	add_firmsubscription
106	Can change firm subscription	27	change_firmsubscription
107	Can delete firm subscription	27	delete_firmsubscription
108	Can view firm subscription	27	view_firmsubscription
109	Can add calendar event	28	add_calendarevent
110	Can change calendar event	28	change_calendarevent
111	Can delete calendar event	28	delete_calendarevent
112	Can view calendar event	28	view_calendarevent
113	Can add advocate paralegal assignment	29	add_advocateparalegalassignment
114	Can change advocate paralegal assignment	29	change_advocateparalegalassignment
115	Can delete advocate paralegal assignment	29	delete_advocateparalegalassignment
116	Can view advocate paralegal assignment	29	view_advocateparalegalassignment
117	Can add invoice	30	add_invoice
118	Can change invoice	30	change_invoice
119	Can delete invoice	30	delete_invoice
120	Can view invoice	30	view_invoice
121	Can add expense	31	add_expense
122	Can change expense	31	change_expense
123	Can delete expense	31	delete_expense
124	Can view expense	31	view_expense
125	Can add trust account	32	add_trustaccount
126	Can change trust account	32	change_trustaccount
127	Can delete trust account	32	delete_trustaccount
128	Can view trust account	32	view_trustaccount
129	Can add time entry	33	add_timeentry
130	Can change time entry	33	change_timeentry
131	Can delete time entry	33	delete_timeentry
132	Can view time entry	33	view_timeentry
133	Can add payment	34	add_payment
134	Can change payment	34	change_payment
135	Can delete payment	34	delete_payment
136	Can view payment	34	view_payment
137	Can add platform invoice	35	add_platforminvoice
138	Can change platform invoice	35	change_platforminvoice
139	Can delete platform invoice	35	delete_platforminvoice
140	Can view platform invoice	35	view_platforminvoice
141	Can add advocate invoice	36	add_advocateinvoice
142	Can change advocate invoice	36	change_advocateinvoice
143	Can delete advocate invoice	36	delete_advocateinvoice
144	Can view advocate invoice	36	view_advocateinvoice
145	Can add document template	37	add_documenttemplate
146	Can change document template	37	change_documenttemplate
147	Can delete document template	37	delete_documenttemplate
148	Can view document template	37	view_documenttemplate
149	Can add filled template	38	add_filledtemplate
150	Can change filled template	38	change_filledtemplate
151	Can delete filled template	38	delete_filledtemplate
152	Can view filled template	38	view_filledtemplate
153	Can add case document request	39	add_casedocumentrequest
154	Can change case document request	39	change_casedocumentrequest
155	Can delete case document request	39	delete_casedocumentrequest
156	Can view case document request	39	view_casedocumentrequest
157	Can add Court Form Template	40	add_courtformtemplate
158	Can change Court Form Template	40	change_courtformtemplate
159	Can delete Court Form Template	40	delete_courtformtemplate
160	Can view Court Form Template	40	view_courtformtemplate
161	Can add Filled Court Form	41	add_filledcourtform
162	Can change Filled Court Form	41	change_filledcourtform
163	Can delete Filled Court Form	41	delete_filledcourtform
164	Can view Filled Court Form	41	view_filledcourtform
165	Can add Service Attempt	42	add_serviceattempt
166	Can change Service Attempt	42	change_serviceattempt
167	Can delete Service Attempt	42	delete_serviceattempt
168	Can view Service Attempt	42	view_serviceattempt
169	Can add Document Checklist Template	43	add_documentchecklist
170	Can change Document Checklist Template	43	change_documentchecklist
171	Can delete Document Checklist Template	43	delete_documentchecklist
172	Can view Document Checklist Template	43	view_documentchecklist
173	Can add Legal Notice	44	add_legalnotice
174	Can change Legal Notice	44	change_legalnotice
175	Can delete Legal Notice	44	delete_legalnotice
176	Can view Legal Notice	44	view_legalnotice
177	Can add Case Research Note	45	add_caseresearch
178	Can change Case Research Note	45	change_caseresearch
179	Can delete Case Research Note	45	delete_caseresearch
180	Can view Case Research Note	45	view_caseresearch
181	Can add Case Document Checklist Item	46	add_casedocumentchecklistitem
182	Can change Case Document Checklist Item	46	change_casedocumentchecklistitem
183	Can delete Case Document Checklist Item	46	delete_casedocumentchecklistitem
184	Can view Case Document Checklist Item	46	view_casedocumentchecklistitem
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
902c1e0c67b3a3a1d7abdeb19a9c964c4541e6b1	2026-05-02 11:55:28.974622+05:30	da6195bb-5878-401e-a879-38bd0463fa5c
b993c3e69f545af3bfc5d16fadd18d43a6fdb696	2026-04-08 17:16:00.623868+05:30	17265c17-ad13-4fb7-8b49-cda765078dbb
fd00ebcca843c027110bb08c6d3a19e9370a2e41	2026-05-18 16:56:49.752526+05:30	6d3d81da-93ab-4617-a05b-72948bad95b1
d4a7bd1337307dece2091858bfbf0b993fbb9e3e	2026-04-08 17:24:22.816397+05:30	e95a953e-f5cb-494b-a19d-2ae9c5a9cf0e
a2d2d88fd58cee9c3d28a06514fb105aff9e33b0	2026-05-02 12:38:03.648569+05:30	f331f893-75e1-4841-94f6-ac8a027a2439
087218f810df930b78c1b6600bf8b26dbe119589	2026-05-02 15:04:09.363123+05:30	8b14eb83-f60f-43b7-860f-616947c11476
25731fc2c6d74dbb2c66b26278a25d8b94e18df4	2026-04-21 10:01:04.90241+05:30	9b6e44a0-33b6-48b3-8d43-0f1de5234056
15efe0bf31e2ed4517f97a32cb1c6714b423e29a	2026-04-09 12:25:54.638794+05:30	0761e14b-822b-4e25-b331-1ad7126784ea
40475f6a0e0da1add8b20f9b08d7bbd75245f0cb	2026-04-21 10:16:07.445461+05:30	c1270be1-13d5-476e-a2cb-01d93da3816c
4b5f14758777efb56d07cc46780ccab1d111b1ea	2026-05-02 15:23:53.743383+05:30	9cbb2fd8-6ae0-4277-972a-25bfaa0c523d
0bb37de9189e4b0a39b3c3579d65b3d99a478439	2026-05-08 09:48:52.547264+05:30	30629b8e-eaf6-4612-8e7c-d487fcb0ab11
c18d2d058d9e4db315e44af0433226a2b44b6efe	2026-05-08 10:38:56.411517+05:30	905a0710-c0bc-4ff4-8540-f8fd24174a98
75759fba4b89e46444fee762653d07c59ee3ac83	2026-05-08 11:22:18.481329+05:30	e7b6f636-7aad-4655-a57d-a3d174fdf4d2
fde8621ce4de02750733b56b2a512115c5e9f4b1	2026-04-21 11:54:38.406336+05:30	cbc4ea0e-015e-4d4f-ae0c-c85c450691c9
429cd05b14c95db0d1bfbb205d239ea79a1d18b8	2026-04-09 17:20:57.483665+05:30	c75be9a0-e6bc-49d8-b024-875db6cb4911
0fdf0623f6fdd7b52d61fb668a5eea9578ef8068	2026-04-17 12:54:29.236675+05:30	139b2b54-06b6-4e1b-9469-bbda62e773d3
10aed4eeb6384ff2697de1330e5a318effd73aa4	2026-04-17 13:32:09.238544+05:30	c972c8b6-00f9-43fa-80ef-45253e7ac6c3
7b777fdd8f211fbff2290960bc9af149c826805b	2026-04-23 16:06:12.441216+05:30	4df8ea5f-ddb8-47c5-9d59-34af552ff821
903068421ba84593458055792ecf6e57dccd4dcf	2026-04-17 15:35:22.563999+05:30	fcde59a6-01eb-46cf-9e40-344f8282b54a
8c5e31d54ee4679583997f8fd5039ee60bc617b7	2026-04-11 11:39:06.505866+05:30	813f9eee-e9ae-43b7-967e-6768b7f6747f
6a8516b41a93b5c72a89ef989481d70ca1bea21b	2026-05-11 10:17:03.733226+05:30	3411bfbd-d965-4897-a6ee-aa1a2fe06039
e9531a726df0b6e560bc147866a9845672189427	2026-05-05 15:09:01.474241+05:30	49a1fd68-7dd7-4295-a85a-71e4797c6783
6661ff914e728d6d737c57cb5dd2ec670fc6ce6f	2026-04-11 17:39:49.944754+05:30	dcabe26c-3f75-4afe-b1f3-3bec679e557e
a86c73d9461947ae19188b91d2ea7d68b818e60e	2026-04-24 14:30:58.141576+05:30	9ee6f64d-fe8a-4278-8811-b96a25556da5
564a94046d0db71f73f375211be5d79324ede2b7	2026-04-24 14:37:23.669385+05:30	d9c20303-1390-4b8d-bf0b-9e59ab2ca389
a69b0039f80346c6a179f896eb4c23b0af95c333	2026-04-24 14:48:01.018485+05:30	f1c489fd-b120-484b-ad6c-871f23feacf9
93fc6f04542e92805e53bb10cc0a898f23b5e7dd	2026-04-24 15:46:28.455521+05:30	2090e49f-342e-4867-94d1-42cc12276a9e
1790369aa402cf2ee7253cc4fa9ea2906006bb38	2026-05-06 12:23:18.254814+05:30	c551fe95-428c-4435-96ce-2a87f4b46064
8fe7d17d8801f9844b43634b24c4a393eeaedc3b	2026-05-11 15:08:37.94993+05:30	6b1a8158-aac2-45be-90c2-c21769f73f7b
e67272a2e69c0b2d1be7bfc76799c16bcdcb4167	2026-04-27 12:52:00.659101+05:30	2132980d-ed53-4e38-b7b7-0e8435602058
a150623edbfedabc8d2859dfcdfd71b9c7945830	2026-04-28 11:23:32.731909+05:30	e26c57c8-aa19-4356-9bb5-9d1cac160d9b
838116f404464a090b63a9f083fad16736d6f9f7	2026-05-11 17:12:45.10879+05:30	cfea0561-f92d-4eb8-90ff-7574f812dc63
5fa38952a40ec7ae5cd2df004e391faf4eb99d81	2026-05-13 11:32:04.58319+05:30	184ee2bb-6bf9-4dc6-8e05-3620562c827e
785809852c21d8d7a1421af53564a65682000464	2026-05-13 11:45:54.358433+05:30	2264d078-daf3-456e-be50-112c6ca1a3f4
f4ac3388370fe7d1c0eba535a2517c843efe24f6	2026-04-30 12:43:36.339876+05:30	3f54f6c1-3e73-420a-8333-6ef1649b6187
32dfc141c73d4890e0b1bbbc7dcb861d289f2e39	2026-05-06 16:22:59.427975+05:30	ad82aa5b-ad99-4007-8b0f-56fedc7f174b
8f0b9ad703d9851a12a71541ec17097d3e4d7084	2026-05-14 14:51:54.782518+05:30	425dedd8-23d0-4248-8327-8da324819df0
62cf4afb000b9ae516c07659f8e8bbc601a97ea8	2026-07-21 10:27:25.905744+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89
f44f6e09263d30fdec1ae6bb9948ef2184ff1fa2	2026-08-03 17:31:56.892975+05:30	09e41654-0c15-43f0-95a9-3d2f6a541ef4
908d514727d1bb492931ab31a4d87997109f05de	2026-08-05 12:21:28.197939+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a
0317997838c2c969edb2db47ae233fdab63c903a	2026-08-05 12:53:34.902642+05:30	9eea803b-c301-41db-803d-6bdfb6278e89
\.


--
-- Data for Name: billing_advocateinvoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.billing_advocateinvoice (id, invoice_number, invoice_date, period_start, period_end, subtotal, tax_percentage, tax_amount, total_amount, status, approved_date, rejection_reason, paid_date, payment_method, payment_reference, notes, created_at, updated_at, advocate_id, approved_by_id, firm_id) FROM stdin;
065f6ed7-ed8f-4d49-9db7-4035afd52c2b	INV-2026-89703	2026-05-05	2026-05-05	2026-06-04	0.00	18.00	0.00	0.00	draft	\N		\N			Invoice for legal services	2026-05-05 18:15:09.379389+05:30	2026-05-05 18:15:09.379412+05:30	2594cfb1-8985-42d5-a068-13a6c277b5ee	\N	\N
3b199c28-e088-4b64-b7aa-afa5ea548ffd	INV-2026-99008	2026-05-05	2026-05-05	2026-06-04	4353.00	18.00	783.54	5136.54	draft	\N		\N			Invoice for legal services	2026-05-05 18:25:17.920998+05:30	2026-05-05 18:25:17.921017+05:30	2594cfb1-8985-42d5-a068-13a6c277b5ee	\N	\N
befdc54c-cc8c-4cf5-9e87-3cf8906b5e3b	INV-2026-37748	2026-05-05	2026-05-05	2026-06-04	4332.00	18.00	779.76	5111.76	sent	\N		\N			Invoice for legal services	2026-05-05 18:37:53.224593+05:30	2026-05-05 18:38:05.727129+05:30	2594cfb1-8985-42d5-a068-13a6c277b5ee	\N	\N
22616aed-ac13-4fc8-abb4-f85917b8dea3	INV-2026-48609	2026-05-11	2026-05-11	2026-06-10	15654.00	18.00	2817.72	18471.72	draft	\N		\N			Invoice for legal services	2026-05-11 16:24:22.403894+05:30	2026-05-11 16:24:22.403915+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	\N
\.


--
-- Data for Name: billing_expense; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.billing_expense (id, date, expense_type, description, amount, billable, markup_percentage, billable_amount, status, receipt, notes, created_at, updated_at, case_id, firm_id, invoice_id, submitted_by_id) FROM stdin;
ede398b7-64b4-4a17-9b4f-36ea4ea0f045	2024-05-15	court_fee	Court filing fee	2000.00	t	0.00	2000.00	draft			2026-04-28 16:22:48.4376+05:30	2026-04-28 16:22:48.437626+05:30	44146ad4-8676-4921-ae40-aa4b1f4e84d7	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89
d3afc801-f16a-4f92-aee2-9399b7619011	2024-05-15	court_fee	Court filing fee	2000.00	t	0.00	2000.00	draft			2026-04-28 16:24:39.33714+05:30	2026-04-28 16:24:39.33717+05:30	\N	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89
9099ba91-9198-4927-85e3-bf503ce9eeac	2026-04-28	travel	rgdf	35.00	t	453.00	193.55	draft		5345345ghd	2026-04-28 17:08:33.059252+05:30	2026-04-28 17:30:08.906551+05:30	3e446b0e-a532-4e51-b536-536c5588938f	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89
1e735da2-2a08-44a9-9078-7ddc6b53798a	2026-04-28	court_fee	gfd	222.00	t	18.00	261.96	draft		hgggdf	2026-04-28 17:56:34.192486+05:30	2026-04-28 17:56:34.192515+05:30	\N	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89
debc3128-3ec1-4e28-bd27-892066878ceb	2026-04-28	court_fee	fdsfsa	33333.00	t	0.00	33333.00	draft	expense_receipts/DI-INV-2026008_invoice.pdf		2026-04-28 17:58:04.735115+05:30	2026-04-28 17:58:04.735152+05:30	\N	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89
feabd50a-6b87-45cf-adf0-020aab0de4e8	2026-04-28	court_fee	wsda	22222.00	t	0.00	22222.00	draft	expense_receipts/Screenshot_from_2026-04-28_15-41-05.png		2026-04-28 18:00:41.014248+05:30	2026-04-28 18:03:00.395375+05:30	\N	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89
b572bd08-11f5-4999-9fc9-0b067d96c95a	2026-04-29	other	fdssf3	33.00	t	0.00	33.00	invoiced			2026-04-29 15:34:34.29246+05:30	2026-04-29 15:34:34.292484+05:30	24e676df-e794-43b9-b492-d3c0f1ab3d34	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89
46ff2aa6-6569-4711-84fb-031393004480	2026-05-11	other	travel allowance	5000.00	t	0.00	5000.00	invoiced			2026-05-11 17:53:51.247244+05:30	2026-05-11 17:53:51.247269+05:30	44146ad4-8676-4921-ae40-aa4b1f4e84d7	9b2a3376-624e-4aff-8c05-746491e1c0fb	2aeeae28-ecb4-45fe-8e73-8f951a33a97b	cfea0561-f92d-4eb8-90ff-7574f812dc63
\.


--
-- Data for Name: billing_invoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.billing_invoice (id, invoice_number, invoice_date, due_date, subtotal, tax_percentage, tax_amount, discount_amount, total_amount, paid_amount, balance_due, status, notes, internal_notes, terms_and_conditions, pdf_file, sent_date, viewed_date, created_at, updated_at, case_id, client_id, created_by_id, firm_id, branch_id) FROM stdin;
fb0a4b4a-91a6-42ff-9980-6df78448e67e	INV-AWBGO2MN-00001	2024-05-20	2024-06-20	0.00	18.00	0.00	0.00	0.00	0.00	0.00	draft	Invoice for legal services				\N	\N	2026-04-28 10:28:01.418315+05:30	2026-04-28 10:28:01.418345+05:30	24e676df-e794-43b9-b492-d3c0f1ab3d34	a1567037-4f6e-4bbe-95ec-1653c35658b0	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	8645b74b-51dc-4b14-b64c-71dbd4b77828
52d7d12d-ee83-475d-aa31-18c34f6407ea	INV-AWBGO2MN-00002	2024-05-20	2024-06-20	0.00	18.00	0.00	0.00	0.00	0.00	0.00	draft	Direct client billing - consultation fee				\N	\N	2026-04-28 10:28:40.42152+05:30	2026-04-28 10:28:40.421543+05:30	\N	a1567037-4f6e-4bbe-95ec-1653c35658b0	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N
6e9d637b-1825-4c9e-b50d-ac5a77359cea	INV-AWBGO2MN-00003	2026-04-28	2026-05-28	0.00	18.00	0.00	0.00	0.00	0.00	0.00	draft	Payment is due within 30 days. Thank you for your business.				\N	\N	2026-04-28 10:53:08.555497+05:30	2026-04-28 10:53:08.555515+05:30	\N	771ae8e8-3f6b-40e2-badb-e8c85501c90d	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N
5015ba31-8c70-467d-9367-730b7523f46b	INV-AWBGO2MN-00004	2026-04-28	2026-04-28	0.00	18.00	0.00	0.00	0.00	0.00	0.00	draft	Thanks for your business.				\N	\N	2026-04-28 12:10:21.537086+05:30	2026-04-28 12:10:21.537107+05:30	\N	771ae8e8-3f6b-40e2-badb-e8c85501c90d	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N
37c0cf5a-59b1-41a8-bf3b-396d2d958a1f	INV-AWBGO2MN-00005	2026-04-28	2026-04-28	0.00	18.00	0.00	0.00	0.00	0.00	0.00	sent	Thanks for your business.				\N	\N	2026-04-28 12:12:15.427079+05:30	2026-04-28 12:12:15.427096+05:30	\N	a1567037-4f6e-4bbe-95ec-1653c35658b0	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N
412a9507-3761-46e4-887f-263e0757c7e6	INV-AWBGO2MN-00006	2026-04-28	2026-04-28	0.00	18.00	0.00	0.00	0.00	0.00	0.00	draft	Thanks for your business.				\N	\N	2026-04-28 12:42:09.173059+05:30	2026-04-28 12:42:09.173075+05:30	\N	771ae8e8-3f6b-40e2-badb-e8c85501c90d	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N
d186a123-e020-4270-9655-e8c32e074056	INV-AWBGO2MN-00007	2026-04-28	2026-04-28	0.00	17.00	0.00	3.00	0.00	0.00	0.00	draft	Invoice for legal services				\N	\N	2026-04-28 13:02:30.561209+05:30	2026-04-28 13:02:30.561224+05:30	\N	771ae8e8-3f6b-40e2-badb-e8c85501c90d	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N
6309f208-ea13-4e89-9ecb-be0af83f13f4	INV-AWBGO2MN-00010	2024-05-20	2024-06-20	0.00	18.00	0.00	0.00	0.00	0.00	0.00	draft	Invoice for legal services				\N	\N	2026-04-28 13:41:42.431888+05:30	2026-04-28 13:41:42.431904+05:30	44146ad4-8676-4921-ae40-aa4b1f4e84d7	a1567037-4f6e-4bbe-95ec-1653c35658b0	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	8645b74b-51dc-4b14-b64c-71dbd4b77828
9a20afc3-b5fd-4a07-8b6d-ec71ef501972	INV-AWBGO2MN-00011	2024-05-20	2024-06-20	0.00	18.00	0.00	0.00	0.00	0.00	0.00	draft	Invoice for legal services				\N	\N	2026-04-28 13:41:56.024698+05:30	2026-04-28 13:41:56.024715+05:30	44146ad4-8676-4921-ae40-aa4b1f4e84d7	a1567037-4f6e-4bbe-95ec-1653c35658b0	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	8645b74b-51dc-4b14-b64c-71dbd4b77828
da7566cf-eceb-4343-a5f8-51e9fad9a60d	INV-AWBGO2MN-00012	2024-05-20	2024-06-20	0.00	18.00	0.00	0.00	0.00	0.00	0.00	draft	Invoice for legal servic				\N	\N	2026-04-28 13:42:12.365781+05:30	2026-04-28 13:42:12.365805+05:30	44146ad4-8676-4921-ae40-aa4b1f4e84d7	a1567037-4f6e-4bbe-95ec-1653c35658b0	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	8645b74b-51dc-4b14-b64c-71dbd4b77828
080fcd6b-5aec-4ab0-b0c2-cc7b64e8121f	INV-AWBGO2MN-00013	2024-05-20	2024-06-20	0.00	18.00	0.00	0.00	0.00	0.00	0.00	draft	Invoice for legal servic				\N	\N	2026-04-28 13:42:24.323798+05:30	2026-04-28 13:42:24.323813+05:30	44146ad4-8676-4921-ae40-aa4b1f4e84d7	a1567037-4f6e-4bbe-95ec-1653c35658b0	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	8645b74b-51dc-4b14-b64c-71dbd4b77828
d54a983e-bb58-45a7-bec8-dbdd4db4e01a	INV-AWBGO2MN-00014	2024-05-20	2024-06-20	0.00	18.00	0.00	400.00	0.00	0.00	0.00	draft	Invoice for legal servic				\N	\N	2026-04-28 13:43:38.823862+05:30	2026-04-28 13:43:38.82392+05:30	44146ad4-8676-4921-ae40-aa4b1f4e84d7	a1567037-4f6e-4bbe-95ec-1653c35658b0	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	8645b74b-51dc-4b14-b64c-71dbd4b77828
5a086522-5226-4d03-ae61-54eb600b7476	INV-AWBGO2MN-00015	2026-04-28	2026-04-28	2220.00	18.00	399.60	0.00	2619.60	0.00	2619.60	draft	Invoice for legal services				\N	\N	2026-04-28 15:23:51.102872+05:30	2026-04-28 15:23:51.102895+05:30	\N	771ae8e8-3f6b-40e2-badb-e8c85501c90d	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N
23ee4b02-5a5e-4bd3-b41a-baaf62c5ae40	INV-AWBGO2MN-00016	2026-04-28	2026-04-28	1.00	18.00	0.18	0.00	1.18	0.00	1.18	draft	Invoice for legal services				\N	\N	2026-04-28 15:29:16.501004+05:30	2026-04-28 15:29:16.501018+05:30	3e446b0e-a532-4e51-b536-536c5588938f	771ae8e8-3f6b-40e2-badb-e8c85501c90d	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	8645b74b-51dc-4b14-b64c-71dbd4b77828
fdcb49c4-cc00-4ead-8095-21ce99f606d3	INV-AWBGO2MN-00017	2024-05-20	2024-06-20	3330.00	18.00	599.40	400.00	3529.40	0.00	3529.40	draft	Invoice for legal servic				\N	\N	2026-04-28 15:32:32.20462+05:30	2026-04-28 15:32:32.204645+05:30	44146ad4-8676-4921-ae40-aa4b1f4e84d7	a1567037-4f6e-4bbe-95ec-1653c35658b0	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	8645b74b-51dc-4b14-b64c-71dbd4b77828
126f6a4b-46e8-4ec9-9d54-630461146804	INV-AWBGO2MN-00018	2024-05-20	2024-06-20	3330.00	13.00	432.90	400.00	3362.90	0.00	3362.90	draft	Invoice for legal servic				\N	\N	2026-04-28 15:32:43.08326+05:30	2026-04-28 15:32:43.083285+05:30	44146ad4-8676-4921-ae40-aa4b1f4e84d7	a1567037-4f6e-4bbe-95ec-1653c35658b0	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	8645b74b-51dc-4b14-b64c-71dbd4b77828
b853b279-1cc5-42d7-8500-66f102dfd05a	INV-AWBGO2MN-00019	2024-05-20	2024-06-20	3330.00	18.00	599.40	400.00	3529.40	0.00	3529.40	draft	Invoice for legal servic				\N	\N	2026-04-28 15:33:12.194274+05:30	2026-04-28 15:33:12.194294+05:30	44146ad4-8676-4921-ae40-aa4b1f4e84d7	a1567037-4f6e-4bbe-95ec-1653c35658b0	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	8645b74b-51dc-4b14-b64c-71dbd4b77828
1d25d46f-b271-49d3-aa28-5313eee692d8	INV-AWBGO2MN-00020	2024-05-20	2024-06-20	3330.00	18.00	599.40	400.00	3529.40	0.00	3529.40	draft	Invoice for legal servic		okayyy		\N	\N	2026-04-28 15:33:44.326462+05:30	2026-04-28 15:33:44.326477+05:30	44146ad4-8676-4921-ae40-aa4b1f4e84d7	a1567037-4f6e-4bbe-95ec-1653c35658b0	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	8645b74b-51dc-4b14-b64c-71dbd4b77828
f37f8f76-d735-45d3-b5e8-53a4fb0302bc	INV-AWBGO2MN-00021	2024-05-20	2024-06-20	3330.00	18.00	599.40	400.00	3529.40	0.00	3529.40	draft	Invoice for legal servic	okayy	okayyy		\N	\N	2026-04-28 15:34:08.138411+05:30	2026-04-28 15:34:08.138434+05:30	44146ad4-8676-4921-ae40-aa4b1f4e84d7	a1567037-4f6e-4bbe-95ec-1653c35658b0	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	8645b74b-51dc-4b14-b64c-71dbd4b77828
77335a8f-b87f-48f8-a5f4-d2d18d654eb4	INV-AWBGO2MN-00022	2024-05-20	2024-06-20	3330.00	18.00	599.40	400.00	3529.40	0.00	3529.40	draft	Invoice for legal servwwwic	okayy	okayyy		\N	\N	2026-04-28 15:34:17.222093+05:30	2026-04-28 15:34:17.222116+05:30	44146ad4-8676-4921-ae40-aa4b1f4e84d7	a1567037-4f6e-4bbe-95ec-1653c35658b0	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	8645b74b-51dc-4b14-b64c-71dbd4b77828
98b6d95b-0a84-47f6-8d6b-b01f9d198cab	INV-AWBGO2MN-00024	2026-04-29	2026-05-29	900.00	18.00	162.00	0.00	1062.00	0.00	1062.00	draft	Invoice for legal services				\N	\N	2026-04-29 11:11:25.942379+05:30	2026-04-29 11:11:25.942394+05:30	0aa41cdb-d7a3-46f8-b0bd-a42e9f373fe9	a1567037-4f6e-4bbe-95ec-1653c35658b0	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	8645b74b-51dc-4b14-b64c-71dbd4b77828
b24fadd0-54c0-411c-9fc0-f1020ae76bc0	INV-AWBGO2MN-00023	2026-04-28	2026-05-28	0.00	18.00	0.00	0.00	0.00	0.00	0.00	sent	Invoice for legal servicesfs	Internal Notes	Terms and Conditions		2026-04-29 11:23:35.179773+05:30	2026-04-28 16:10:10.244242+05:30	2026-04-28 16:04:23.936783+05:30	2026-04-29 11:23:35.180984+05:30	3e446b0e-a532-4e51-b536-536c5588938f	a1567037-4f6e-4bbe-95ec-1653c35658b0	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	8645b74b-51dc-4b14-b64c-71dbd4b77828
080b1915-e31b-4fc9-882c-3126db68579f	INV-AWBGO2MN-00025	2026-04-29	2026-05-31	900.00	18.00	162.00	0.00	1062.00	0.00	1062.00	draft	Invoice for legal services				\N	\N	2026-04-29 13:04:41.893253+05:30	2026-04-29 13:04:41.893269+05:30	\N	771ae8e8-3f6b-40e2-badb-e8c85501c90d	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N
40993dae-207b-428a-87c8-93d91a351e36	INV-AWBGO2MN-00026	2026-04-29	2026-05-29	20300.00	18.00	3654.00	25.00	23929.00	0.00	23929.00	draft	Invoice for legal services	cxz	cxzc		\N	\N	2026-04-29 13:26:11.86994+05:30	2026-04-29 13:26:11.869964+05:30	\N	a1567037-4f6e-4bbe-95ec-1653c35658b0	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N
bdc8b7a3-efc0-42e4-b1d2-ce4073d88f96	INV-2026-08270	2026-04-29	2026-05-29	555.00	18.00	99.90	0.00	654.90	0.00	654.90	draft	Invoice for legal services				\N	\N	2026-04-29 15:20:32.026705+05:30	2026-04-29 15:20:32.026722+05:30	24e676df-e794-43b9-b492-d3c0f1ab3d34	a1567037-4f6e-4bbe-95ec-1653c35658b0	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	8645b74b-51dc-4b14-b64c-71dbd4b77828
d4cc3b6d-40e1-4cf5-b82f-97abb5d12c3a	INV-2026-90537	2026-05-05	2026-06-04	5463.00	18.00	983.34	0.00	6446.34	0.00	6446.34	draft	Invoice for legal services				\N	\N	2026-05-05 18:01:43.674565+05:30	2026-05-05 18:01:43.674588+05:30	\N	c4bfb118-849f-4aed-9ee1-969b1533e002	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N
f78f7ee7-d428-46f6-8352-77bbe55301ec	INV-2026-34047	2026-05-05	2026-06-04	3424.00	18.00	616.32	0.00	4040.32	0.00	4040.32	draft	Invoice for legal services				\N	\N	2026-05-05 18:02:25.072232+05:30	2026-05-05 18:02:25.072247+05:30	\N	c4bfb118-849f-4aed-9ee1-969b1533e002	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N
8d732253-aed8-4b9e-889a-edca0eb8ac7c	INV-2026-40799	2026-05-05	2026-06-04	1008999.00	18.00	181619.82	0.00	1190618.82	0.00	1190618.82	draft	Invoice for legal services				\N	\N	2026-05-05 18:17:45.260868+05:30	2026-05-05 18:17:45.260886+05:30	\N	c4bfb118-849f-4aed-9ee1-969b1533e002	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N
7a4be5ad-4f2c-43ad-b788-561dc29910b0	INV-2026-34994	2026-05-05	2026-06-04	154353.00	18.00	27783.54	0.00	182136.54	0.00	182136.54	draft	Invoice for legal services				\N	\N	2026-05-05 17:50:47.080425+05:30	2026-05-05 17:50:47.08045+05:30	\N	c4bfb118-849f-4aed-9ee1-969b1533e002	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N
fbf9b8fa-76ef-4a65-ba8d-80e45499fcf5	INV-2026-28273	2026-05-05	2026-06-04	3444.00	18.00	619.92	0.00	4063.92	0.00	4063.92	draft	Invoice for legal services				\N	\N	2026-05-05 17:54:04.953001+05:30	2026-05-05 17:54:04.953037+05:30	\N	aeb6ce83-b529-41c2-8851-80e2b884b861	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9	\N
b24e801b-e544-4986-907a-a20305e89cb0	INV-2026-11411	2026-05-06	2026-06-05	5646546.00	20.00	1129309.20	0.00	6775855.20	0.00	6775855.20	sent	Invoice for legal services				\N	\N	2026-05-06 16:15:33.829672+05:30	2026-05-06 16:15:33.829696+05:30	\N	d26b0204-0f2a-4c57-8a3d-04bf62a57299	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N
9b29cd1a-b79e-414c-b340-859b94b303b1	INV-2026-41737	2026-05-06	2026-06-05	56346.00	18.00	10142.28	0.00	66488.28	0.00	66488.28	sent	Invoice for legal services				\N	\N	2026-05-06 16:17:00.925504+05:30	2026-05-06 16:17:00.925525+05:30	\N	f728f594-f735-4ed9-99e8-a2df4e47387d	ce8ce90c-be9b-49de-a959-f8459663593a	5c0747c8-99d2-4104-9fb4-97dd465fdaae	\N
839089be-d3ea-4f74-b7b3-612e7d4f6ae6	INV-2026-04912	2026-05-06	2026-06-05	4343.00	18.00	781.74	0.00	5124.74	0.00	5124.74	draft	Invoice for legal services				\N	\N	2026-05-06 16:28:45.973969+05:30	2026-05-06 16:28:45.97399+05:30	dbaa3bd7-a433-47c3-a6c8-b660aea3e75d	aeb6ce83-b529-41c2-8851-80e2b884b861	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9	7b6156a4-4804-4646-b647-4ffa21879455
1dfbbcbc-204b-43bb-af2d-a22728feb736	INV-2026-60639	2026-05-11	2026-06-10	54646.00	18.00	9836.28	0.00	64482.28	0.00	64482.28	sent	Invoice for legal services				\N	\N	2026-05-11 13:18:21.067518+05:30	2026-05-11 13:18:21.067532+05:30	\N	e72c42cb-4dac-40fb-aab4-38abf01560b9	ce8ce90c-be9b-49de-a959-f8459663593a	\N	\N
2aeeae28-ecb4-45fe-8e73-8f951a33a97b	INV-2026-15163	2026-05-11	2026-06-10	15000.00	18.00	2700.00	0.00	17700.00	0.00	17700.00	draft	Invoice for legal services				\N	\N	2026-05-11 17:53:51.236056+05:30	2026-05-11 17:53:51.236079+05:30	44146ad4-8676-4921-ae40-aa4b1f4e84d7	a1567037-4f6e-4bbe-95ec-1653c35658b0	cfea0561-f92d-4eb8-90ff-7574f812dc63	9b2a3376-624e-4aff-8c05-746491e1c0fb	38ba1911-6378-4da5-b523-ab10e3dbc0ad
\.


--
-- Data for Name: billing_payment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.billing_payment (id, payment_date, amount, payment_method, transaction_id, cheque_number, bank_name, status, notes, receipt, created_at, updated_at, client_id, firm_id, invoice_id, recorded_by_id) FROM stdin;
\.


--
-- Data for Name: billing_timeentry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.billing_timeentry (id, date, activity_type, description, hours, hourly_rate, amount, billable, status, notes, created_at, updated_at, case_id, firm_id, invoice_id, user_id, advocate_invoice_id) FROM stdin;
b0f4b4f2-09dd-483c-ae9f-a6b0989eb823	2024-05-15	court_appearance	Updated description	4.00	5000.00	20000.00	t	submitted		2026-04-24 12:07:19.828435+05:30	2026-04-24 12:17:26.97551+05:30	ddc72874-ef6c-47a7-a561-48b9b9a176df	6ae6b893-969f-432d-a7f4-62e5f14af2d9	\N	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N
84958a52-6c7a-4435-9c5a-80870c6e9885	2024-05-15	court_appearance	Attended hearing at District Court	3.50	5000.00	17500.00	t	draft		2026-04-24 12:18:48.135334+05:30	2026-04-24 12:18:48.135355+05:30	ddc72874-ef6c-47a7-a561-48b9b9a176df	6ae6b893-969f-432d-a7f4-62e5f14af2d9	\N	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N
21ecddbd-a8ac-4efe-9301-e614f6296c93	2024-05-15	court_appearance	Attended hearing at District Court	3.50	5000.00	17500.00	t	draft		2026-04-24 13:29:18.830265+05:30	2026-04-24 13:29:18.830292+05:30	ddc72874-ef6c-47a7-a561-48b9b9a176df	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N
d8a0bfea-906d-43e2-b4df-8fd3ad1285d1	2026-04-24	research	353	34.00	345.00	11730.00	t	draft	DSF	2026-04-24 16:24:00.046028+05:30	2026-04-24 16:24:00.046049+05:30	0aa41cdb-d7a3-46f8-b0bd-a42e9f373fe9	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N
e3bbb3d0-8873-413b-aca8-1d02d3ba5651	2026-04-18	drafting	sfgsdgdf	11.00	324.00	3564.00	t	draft	gfdds	2026-04-24 17:28:50.076118+05:30	2026-04-24 17:45:40.102222+05:30	0aa41cdb-d7a3-46f8-b0bd-a42e9f373fe9	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N	bee18ba6-be01-4c4b-82ff-3103e307fc95	\N
d939e7dc-893b-421b-9482-c22359107123	2026-04-24	drafting	gfg	3.00	32432.00	97296.00	t	draft	fsd	2026-04-24 17:22:58.157021+05:30	2026-04-24 17:45:49.902549+05:30	24e676df-e794-43b9-b492-d3c0f1ab3d34	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N	9a3b9470-80d4-444e-a370-55fd04bf185a	\N
6d913ea4-cb07-4552-99b8-b6460821704d	2026-04-24	research	gddgdsg	2.00	5000.00	10000.00	t	draft	gdfssd	2026-04-24 18:30:08.019836+05:30	2026-04-24 18:30:08.019873+05:30	24e676df-e794-43b9-b492-d3c0f1ab3d34	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N	bee18ba6-be01-4c4b-82ff-3103e307fc95	\N
de83a5a8-cfeb-4c52-8d28-488fd303a28b	2026-04-29	other	fdsf	1.00	222.00	222.00	t	invoiced		2026-04-29 15:20:32.031783+05:30	2026-04-29 15:20:32.0318+05:30	24e676df-e794-43b9-b492-d3c0f1ab3d34	9b2a3376-624e-4aff-8c05-746491e1c0fb	bdc8b7a3-efc0-42e4-b1d2-ce4073d88f96	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N
6362e9f6-0581-4d90-a1cf-0041678785bc	2026-04-29	other	vvcxxc	1.00	22.00	22.00	t	invoiced		2026-04-29 15:34:34.288632+05:30	2026-04-29 15:34:34.288654+05:30	24e676df-e794-43b9-b492-d3c0f1ab3d34	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89	\N
f6d1b882-9b0d-4abd-80b0-d5c838d02dab	2026-04-30	research	fdf	32.00	33.00	1056.00	t	draft	sfs	2026-04-30 12:28:41.317503+05:30	2026-04-30 12:28:41.31753+05:30	44146ad4-8676-4921-ae40-aa4b1f4e84d7	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N	bee18ba6-be01-4c4b-82ff-3103e307fc95	\N
e11152f4-8958-4335-94d1-40f8d3fd04f0	2026-05-05	other	etyfreyr	1.00	3444.00	3444.00	t	invoiced		2026-05-05 17:54:04.957783+05:30	2026-05-05 17:54:04.957802+05:30	\N	6ae6b893-969f-432d-a7f4-62e5f14af2d9	fbf9b8fa-76ef-4a65-ba8d-80e45499fcf5	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N
86dc49f3-d285-4911-a662-65b66fa24be2	2026-05-05	other	sgcfdghfhgd	1.00	5463.00	5463.00	t	invoiced		2026-05-05 18:01:43.679199+05:30	2026-05-05 18:01:43.67922+05:30	\N	\N	d4cc3b6d-40e1-4cf5-b82f-97abb5d12c3a	ce8ce90c-be9b-49de-a959-f8459663593a	\N
7b71107e-7e14-4068-8794-a80dba69b4d3	2026-05-05	other	5356	1.00	3424.00	3424.00	t	invoiced		2026-05-05 18:02:25.074503+05:30	2026-05-05 18:02:25.074518+05:30	\N	\N	f78f7ee7-d428-46f6-8352-77bbe55301ec	ce8ce90c-be9b-49de-a959-f8459663593a	\N
946a8651-6912-460a-b6de-634c5f759993	2026-05-06	other	tital time	1.00	5646546.00	5646546.00	t	invoiced		2026-05-06 16:15:33.837058+05:30	2026-05-06 16:15:33.837085+05:30	\N	\N	b24e801b-e544-4986-907a-a20305e89cb0	ce8ce90c-be9b-49de-a959-f8459663593a	\N
97a970db-99e1-421d-b975-2b391e2abe44	2026-05-06	other	the the	1.00	4343.00	4343.00	t	invoiced		2026-05-06 16:28:45.978803+05:30	2026-05-06 16:28:45.978828+05:30	dbaa3bd7-a433-47c3-a6c8-b660aea3e75d	6ae6b893-969f-432d-a7f4-62e5f14af2d9	839089be-d3ea-4f74-b7b3-612e7d4f6ae6	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	\N
d926707d-9790-42d5-af67-f71f6351d338	2026-05-11	other	Case details	1.00	54646.00	54646.00	t	invoiced		2026-05-11 13:18:21.07238+05:30	2026-05-11 13:18:21.072395+05:30	\N	\N	1dfbbcbc-204b-43bb-af2d-a22728feb736	ce8ce90c-be9b-49de-a959-f8459663593a	\N
4aa5fd90-d357-468f-95b7-4cd110892cdf	2026-05-11	other	Inspection	5.00	2000.00	10000.00	t	invoiced		2026-05-11 17:53:51.242795+05:30	2026-05-11 17:53:51.24282+05:30	44146ad4-8676-4921-ae40-aa4b1f4e84d7	9b2a3376-624e-4aff-8c05-746491e1c0fb	2aeeae28-ecb4-45fe-8e73-8f951a33a97b	cfea0561-f92d-4eb8-90ff-7574f812dc63	\N
3c5d6497-2cb2-40db-a70b-e03b74e83147	2026-08-03	research	detail go through to in the account	5.00	500.00	2500.00	t	draft		2026-08-03 16:21:05.466496+05:30	2026-08-03 16:21:05.466517+05:30	b1b52cd7-2c03-48dc-871d-4f561ab1c206	9b2a3376-624e-4aff-8c05-746491e1c0fb	\N	9a3b9470-80d4-444e-a370-55fd04bf185a	\N
\.


--
-- Data for Name: billing_trustaccount; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.billing_trustaccount (id, transaction_date, transaction_type, amount, balance_after, description, created_at, case_id, client_id, firm_id, recorded_by_id, reference_invoice_id) FROM stdin;
\.


--
-- Data for Name: calendar_events_calendarevent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.calendar_events_calendarevent (id, title, description, event_type, priority, status, start_datetime, end_datetime, all_day, location, court_name, reminder_sent, reminder_time, notes, created_at, updated_at, case_id, client_id, created_by_id, firm_id) FROM stdin;
c658e4d5-979c-4834-86ca-7296a9a4c7a5	sadad		hearing	medium	scheduled	2026-05-19 09:00:00+05:30	2026-05-19 10:00:00+05:30	f			f	\N		2026-05-06 16:13:02.388386+05:30	2026-05-06 16:13:02.388403+05:30	\N	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb
4b33afea-8b78-4b27-8a5e-2a205bcd4ac7	case hearing		hearing	medium	completed	2026-04-26 16:30:00+05:30	2026-04-24 23:00:00+05:30	f	cuttack	High Court	f	\N		2026-04-23 10:55:47.867393+05:30	2026-04-23 12:36:40.097583+05:30	1e6589c3-c22f-460c-9295-b822ab77107e	\N	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9
fc61041f-4d54-42c3-ac7e-b6e0ba8ce71c	sfdgs	sdfa	hearing	medium	scheduled	2026-04-21 09:00:00+05:30	2026-04-21 10:00:00+05:30	f	sdfa	sdfsa	f	\N		2026-04-23 13:24:55.819529+05:30	2026-04-23 13:24:55.81954+05:30	f2fd8c9d-51b4-4bd9-b5da-c34149bb6cef	\N	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9
2a4653b8-4fcb-4958-b5f0-9bf4e228da9f	fsdgsd	dfgfdg	hearing	medium	scheduled	2026-04-13 09:00:00+05:30	2026-04-13 10:00:00+05:30	f	fgdf	dfgdg	f	\N		2026-04-23 17:55:53.495951+05:30	2026-04-23 17:55:53.495961+05:30	\N	\N	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9
e4d55449-f9b9-4779-bc76-bb59053850e1	hfdg	dfhgfdgh	meeting	high	scheduled	2026-04-09 09:00:00+05:30	2026-04-09 10:00:00+05:30	f	fhdfdghggf	fdhgfhf	f	\N		2026-04-24 11:19:14.978847+05:30	2026-04-24 11:19:14.978864+05:30	f2fd8c9d-51b4-4bd9-b5da-c34149bb6cef	\N	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9
e0d0dbfb-c851-495c-b7f7-3af98233bfe2	Hearing: test case	Court hearing for case: test case\nCase Number: 76hg\nCNR Number: gfhfgh\nJudge: fhgh\nPetitioner: hgh\nRespondent: gh\n	hearing	high	scheduled	2026-04-12 05:30:00+05:30	2026-04-12 07:30:00+05:30	f	hfgh - Court No. hgf	hfgh	f	2026-04-11 05:30:00+05:30		2026-04-28 11:51:47.386808+05:30	2026-04-28 11:51:47.386824+05:30	44146ad4-8676-4921-ae40-aa4b1f4e84d7	a1567037-4f6e-4bbe-95ec-1653c35658b0	\N	9b2a3376-624e-4aff-8c05-746491e1c0fb
fe37671b-2fdc-4b36-a64d-35d413a951c6	ssada	ad	hearing	medium	scheduled	2026-04-22 09:00:00+05:30	2026-04-22 10:00:00+05:30	f	dsad	dasd	f	\N		2026-05-05 13:40:24.858275+05:30	2026-05-05 13:40:24.858287+05:30	\N	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb
e57136cc-e387-4d9a-ad72-36fe19729909	sdsdwew	ads	hearing	medium	scheduled	2026-04-23 09:00:00+05:30	2026-04-23 10:00:00+05:30	f			f	\N		2026-05-05 13:40:48.148241+05:30	2026-05-05 13:40:48.148252+05:30	\N	\N	ef266648-9837-4cbc-86b1-5af95046120b	9b2a3376-624e-4aff-8c05-746491e1c0fb
5a527760-a8e5-44e1-9c13-0578e9a1ed12	tyrt		hearing	medium	scheduled	2026-04-21 09:00:00+05:30	2026-04-21 10:00:00+05:30	f			f	\N		2026-05-06 09:54:22.630247+05:30	2026-05-06 09:54:22.630258+05:30	\N	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb
97021f61-2593-47bb-894d-c0dd0882bd55	fdd	fddg	meeting	medium	scheduled	2026-05-06 09:00:00+05:30	2026-05-06 10:00:00+05:30	f			f	\N	fdgdg	2026-05-06 12:32:44.916392+05:30	2026-05-06 12:32:44.916407+05:30	\N	c4bfb118-849f-4aed-9ee1-969b1533e002	2594cfb1-8985-42d5-a068-13a6c277b5ee	\N
7f13654c-4932-48c4-8e49-91c3f10b46e7	new cal		hearing	medium	rescheduled	2026-04-23 03:30:00+05:30	2026-04-23 04:30:00+05:30	f			f	\N		2026-05-06 12:37:19.468214+05:30	2026-05-06 12:38:22.230882+05:30	\N	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb
9572a670-60d9-4ff9-8950-c19bda725199	Meeting		other	medium	scheduled	2026-05-10 05:30:00+05:30	2026-05-10 05:30:00+05:30	f			f	\N		2026-05-06 13:13:16.293872+05:30	2026-05-06 13:13:16.293885+05:30	\N	\N	ce8ce90c-be9b-49de-a959-f8459663593a	9b2a3376-624e-4aff-8c05-746491e1c0fb
abe03e5f-e67b-4e12-90fb-83236f21d209	hgfsdvgdf	saavs	meeting	medium	completed	2026-04-21 03:30:00+05:30	2026-04-21 04:30:00+05:30	f	sva	asv	f	\N		2026-04-23 12:51:21.066869+05:30	2026-05-06 13:38:53.316731+05:30	\N	\N	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	6ae6b893-969f-432d-a7f4-62e5f14af2d9
79a73d03-9c45-4464-9b5c-ab18b4f663ce	firm notice for all		other	high	scheduled	2026-04-21 09:00:00+05:30	2026-04-21 10:00:00+05:30	f			f	\N		2026-05-06 14:50:53.404152+05:30	2026-05-06 14:50:53.404163+05:30	\N	\N	ce8ce90c-be9b-49de-a959-f8459663593a	123bbba8-686e-47b1-994e-4ad072952e09
cbe3a449-e615-4f5f-86d1-c0f08655e0eb	dsa	dsa	meeting	medium	scheduled	2026-05-19 09:00:00+05:30	2026-05-19 10:00:00+05:30	f	sadsa	asdad	f	\N		2026-05-06 16:06:14.828687+05:30	2026-05-06 16:06:14.828703+05:30	44146ad4-8676-4921-ae40-aa4b1f4e84d7	\N	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb
3caea680-dcb9-42fe-bc0e-574577debf67	firm notice	please check the calender	other	low	scheduled	2026-05-19 09:00:00+05:30	2026-05-19 10:00:00+05:30	f			f	\N		2026-05-06 16:10:06.784918+05:30	2026-05-06 16:10:06.78493+05:30	\N	\N	ce8ce90c-be9b-49de-a959-f8459663593a	9b2a3376-624e-4aff-8c05-746491e1c0fb
7aef58e9-90cd-4d99-a1d3-4915201668aa	firm notice	ssac	other	high	scheduled	2026-05-19 09:00:00+05:30	2026-05-19 10:00:00+05:30	f	dsad		f	\N		2026-05-06 16:11:28.619601+05:30	2026-05-06 16:11:28.619617+05:30	\N	\N	ce8ce90c-be9b-49de-a959-f8459663593a	9b2a3376-624e-4aff-8c05-746491e1c0fb
e7d5aaea-128c-4c57-9099-1ec516d894bf	Hearing: BBSR Couple Murder Case	Court hearing for case: BBSR Couple Murder Case\nCase Number: MURD999\nRespondent: Ramesh Padhi\n	hearing	high	scheduled	2026-05-23 05:30:00+05:30	2026-05-23 07:30:00+05:30	f	District court	District court	f	2026-05-22 05:30:00+05:30		2026-05-09 17:32:08.69361+05:30	2026-05-09 17:32:08.693621+05:30	b1b52cd7-2c03-48dc-871d-4f561ab1c206	a1567037-4f6e-4bbe-95ec-1653c35658b0	\N	9b2a3376-624e-4aff-8c05-746491e1c0fb
c626efda-c01e-433e-9f31-68bd01b22ae4	Hearing: Murder in Barbil- may 11 2026	Court hearing for case: Murder in Barbil- may 11 2026\nCase Number: 324324343\n	hearing	high	scheduled	2026-05-13 05:30:00+05:30	2026-05-13 07:30:00+05:30	f	High court	High court	f	2026-05-12 05:30:00+05:30		2026-05-11 13:13:59.675264+05:30	2026-05-11 13:13:59.675274+05:30	f5ed91b7-d2ab-4c86-8162-c2400ee2ef74	e72c42cb-4dac-40fb-aab4-38abf01560b9	\N	\N
e7c3ce02-567a-4a03-8b12-afabdbc7e3af	High Court Hearing,Cuttack	Final Hearing of Matter no-BLAPL_25_2026	hearing	high	scheduled	2026-06-30 10:00:00+05:30	2026-06-29 11:01:00+05:30	t	Cuttack	High Court of Orissa	f	\N	Seeking Bail	2026-06-29 10:41:04.66828+05:30	2026-06-29 10:41:04.668294+05:30	\N	\N	f05b496d-7eb1-46c2-aa7d-f55269c0287d	6ae6b893-969f-432d-a7f4-62e5f14af2d9
c4db6188-ab21-4265-8889-a861762c8f50	Hearing at Dist. Court	2a cc_255_2026	hearing	medium	scheduled	2026-06-30 12:03:00+05:30	2026-06-30 14:01:00+05:30	t	Cuttack	District Court Cuttack	f	\N	Final Argument	2026-06-29 10:42:48.756704+05:30	2026-06-29 10:42:48.756713+05:30	\N	\N	f05b496d-7eb1-46c2-aa7d-f55269c0287d	6ae6b893-969f-432d-a7f4-62e5f14af2d9
2a50d3fd-9181-4942-a883-4b040ecbcc89	Appearance in civil case at Dist court Khurdha	Client Meet regarding a new matter	consultation	urgent	scheduled	2026-06-30 17:05:00+05:30	2026-06-30 19:03:00+05:30	t	Bhubaneswar		f	\N	Urgent	2026-06-29 10:44:53.808791+05:30	2026-06-29 10:44:53.808799+05:30	\N	\N	f05b496d-7eb1-46c2-aa7d-f55269c0287d	6ae6b893-969f-432d-a7f4-62e5f14af2d9
\.


--
-- Data for Name: calendar_events_calendarevent_assigned_to; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.calendar_events_calendarevent_assigned_to (id, calendarevent_id, customuser_id) FROM stdin;
1	4b33afea-8b78-4b27-8a5e-2a205bcd4ac7	ad82aa5b-ad99-4007-8b0f-56fedc7f174b
2	4b33afea-8b78-4b27-8a5e-2a205bcd4ac7	6fd29da0-7080-4382-aaa8-77caa8ef0482
3	4b33afea-8b78-4b27-8a5e-2a205bcd4ac7	e71918c8-b14b-4ea8-9608-1a2d9632b1c4
4	abe03e5f-e67b-4e12-90fb-83236f21d209	ad82aa5b-ad99-4007-8b0f-56fedc7f174b
5	abe03e5f-e67b-4e12-90fb-83236f21d209	6fd29da0-7080-4382-aaa8-77caa8ef0482
6	abe03e5f-e67b-4e12-90fb-83236f21d209	e71918c8-b14b-4ea8-9608-1a2d9632b1c4
7	abe03e5f-e67b-4e12-90fb-83236f21d209	6136f201-bfb6-4e41-bf1e-cb9f231549a5
9	fc61041f-4d54-42c3-ac7e-b6e0ba8ce71c	6136f201-bfb6-4e41-bf1e-cb9f231549a5
10	2a4653b8-4fcb-4958-b5f0-9bf4e228da9f	6136f201-bfb6-4e41-bf1e-cb9f231549a5
11	2a4653b8-4fcb-4958-b5f0-9bf4e228da9f	139b2b54-06b6-4e1b-9469-bbda62e773d3
12	2a4653b8-4fcb-4958-b5f0-9bf4e228da9f	6fd29da0-7080-4382-aaa8-77caa8ef0482
13	2a4653b8-4fcb-4958-b5f0-9bf4e228da9f	90790d0f-374c-4a08-b0d6-b74a171a7ca5
14	e4d55449-f9b9-4779-bc76-bb59053850e1	6136f201-bfb6-4e41-bf1e-cb9f231549a5
15	e4d55449-f9b9-4779-bc76-bb59053850e1	139b2b54-06b6-4e1b-9469-bbda62e773d3
16	e4d55449-f9b9-4779-bc76-bb59053850e1	6fd29da0-7080-4382-aaa8-77caa8ef0482
20	e0d0dbfb-c851-495c-b7f7-3af98233bfe2	184ee2bb-6bf9-4dc6-8e05-3620562c827e
21	e0d0dbfb-c851-495c-b7f7-3af98233bfe2	9a3b9470-80d4-444e-a370-55fd04bf185a
22	fe37671b-2fdc-4b36-a64d-35d413a951c6	184ee2bb-6bf9-4dc6-8e05-3620562c827e
23	fe37671b-2fdc-4b36-a64d-35d413a951c6	d2a3cc2e-3011-43ab-9d25-6026fc830f2d
24	e57136cc-e387-4d9a-ad72-36fe19729909	184ee2bb-6bf9-4dc6-8e05-3620562c827e
25	e57136cc-e387-4d9a-ad72-36fe19729909	9a3b9470-80d4-444e-a370-55fd04bf185a
26	5a527760-a8e5-44e1-9c13-0578e9a1ed12	184ee2bb-6bf9-4dc6-8e05-3620562c827e
27	5a527760-a8e5-44e1-9c13-0578e9a1ed12	9a3b9470-80d4-444e-a370-55fd04bf185a
28	7f13654c-4932-48c4-8e49-91c3f10b46e7	9a3b9470-80d4-444e-a370-55fd04bf185a
29	cbe3a449-e615-4f5f-86d1-c0f08655e0eb	184ee2bb-6bf9-4dc6-8e05-3620562c827e
30	cbe3a449-e615-4f5f-86d1-c0f08655e0eb	1ba45842-9737-4c7b-83d9-4f957048b574
31	c658e4d5-979c-4834-86ca-7296a9a4c7a5	9a3b9470-80d4-444e-a370-55fd04bf185a
33	e7d5aaea-128c-4c57-9099-1ec516d894bf	184ee2bb-6bf9-4dc6-8e05-3620562c827e
34	e7d5aaea-128c-4c57-9099-1ec516d894bf	9a3b9470-80d4-444e-a370-55fd04bf185a
35	c626efda-c01e-433e-9f31-68bd01b22ae4	2e0a0f68-266a-489c-85a9-5d0b5f2b3283
36	c626efda-c01e-433e-9f31-68bd01b22ae4	f55a587a-2465-41fc-aa12-3975a18b21fb
\.


--
-- Data for Name: cases_case; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cases_case (id, case_title, case_number, case_type, description, status, priority, court_name, judge_name, filing_date, created_at, updated_at, assigned_advocate_id, assigned_paralegal_id, client_id, firm_id, category, cnr_number, court_no, district, next_hearing_date, petitioner_name, representing, respondent_name, state, additional_expenses, case_summary, hearing_fee, loe_notes, payment_terms, stage, total_fee, billing_type, estimated_value, opposing_counsel, branch_id, solo_advocate_id) FROM stdin;
a4793fc7-520b-462f-bd56-3b8442e47e9c	saadsad	dsfsfsdfs	intellectual property	sdsdsd	open	medium	dsfs	\N	2026-05-06	2026-05-06 15:01:48.729509+05:30	2026-05-06 15:01:48.729523+05:30	2594cfb1-8985-42d5-a068-13a6c277b5ee	2403e43f-02f7-46a2-ae48-253ca3dcb43d	c4bfb118-849f-4aed-9ee1-969b1533e002	\N	court_case	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	case_filing	\N	hourly	\N	\N	\N	2594cfb1-8985-42d5-a068-13a6c277b5ee
dbaa3bd7-a433-47c3-a6c8-b660aea3e75d	the test	4324324	intellectual property	test	open	medium	\N	\N	2026-05-06	2026-05-06 16:25:08.82824+05:30	2026-05-06 16:25:08.828256+05:30	6fd29da0-7080-4382-aaa8-77caa8ef0482	\N	aeb6ce83-b529-41c2-8851-80e2b884b861	6ae6b893-969f-432d-a7f4-62e5f14af2d9	pre_litigation	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	case_filing	\N	hourly	\N	\N	7b6156a4-4804-4646-b647-4ffa21879455	\N
b1b52cd7-2c03-48dc-871d-4f561ab1c206	BBSR Couple Murder Case	MURD999	intellectual property	it is the sensitive murder case of a couple	open	high	District court	\N	2026-05-09	2026-05-09 17:32:08.688878+05:30	2026-05-09 17:32:08.688895+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	a1567037-4f6e-4bbe-95ec-1653c35658b0	9b2a3376-624e-4aff-8c05-746491e1c0fb	court_case	\N	\N	\N	2026-05-23 05:30:00+05:30	\N	petitioner	Ramesh Padhi	Odisha	\N	\N	18000.00	\N	\N	case_filing	50000.00	hourly	32000.00	Self	8645b74b-51dc-4b14-b64c-71dbd4b77828	\N
bb2a8573-1385-4e8b-9436-ca05de4b79cf	Aston Fmaily Death File	1234	intellectual property	case	in_progress	high	district court	fd	2026-04-15	2026-04-15 15:27:19.404602+05:30	2026-04-15 16:40:43.12945+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	4e1a7020-f5e3-46aa-910c-0892eb73f480	96b4ddbd-b2c1-4d99-bcbc-0ce2e6b522ab	6ae6b893-969f-432d-a7f4-62e5f14af2d9	court_case	xfcdf3	kdsds	dfdf	2026-04-18 05:30:00+05:30	dfdf	petitioner	subrat	dfdf	At actuals	jkdfdks	15000.00	fdsfsdf	kdfnks	case_filing	1234.00	flat_fee	785000.00	subrat	c17e9b3b-1b1a-4560-b80e-3f0fb47116e6	\N
cd52e370-1f5b-40d3-b709-3de055ad0d59	dtyhfcj	123456	intellecthgjcjhgcual property	ycjhcg	open	low	urtduyt	\N	2026-04-26	2026-04-15 13:35:17.008089+05:30	2026-04-15 18:09:54.736518+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	\N	96b4ddbd-b2c1-4d99-bcbc-0ce2e6b522ab	6ae6b893-969f-432d-a7f4-62e5f14af2d9	pre_litigation	\N	\N	\N	\N	\N	\N	uiuuk	\N	\N	\N	\N	\N	\N	appeal	\N	hourly	23456.00	itfuk	c17e9b3b-1b1a-4560-b80e-3f0fb47116e6	\N
63a36afb-8ddd-4626-8dae-a7460475cf7c	new case file	retqr4w312424	intellectual property	3dhdghg	in_progress	medium	high court	fgdgd	2026-04-16	2026-04-16 13:19:32.216831+05:30	2026-04-16 13:19:32.216842+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	4e1a7020-f5e3-46aa-910c-0892eb73f480	96b4ddbd-b2c1-4d99-bcbc-0ce2e6b522ab	6ae6b893-969f-432d-a7f4-62e5f14af2d9	court_case	fgfdsgd	fgfd	tfgrsdg	2026-04-19 05:30:00+05:30	dgfdgdfg	respondent	gdfgd	Odisha	\N	\N	34343.00	\N	\N	negotiation	323.00	hourly	4324.00	gdfg	c17e9b3b-1b1a-4560-b80e-3f0fb47116e6	\N
d374a4a5-4bd7-473f-9c3f-a5ad3c30123f	xvsd	sdfsdf	intellectual property	fsdfsdf	open	medium	sdfsdfsdfc	fsfs	2026-04-16	2026-04-16 13:26:43.19424+05:30	2026-04-16 13:26:43.194253+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	4e1a7020-f5e3-46aa-910c-0892eb73f480	96b4ddbd-b2c1-4d99-bcbc-0ce2e6b522ab	6ae6b893-969f-432d-a7f4-62e5f14af2d9	court_case	sdfsdf	sdfsdf	fsdfsd	2026-04-10 05:30:00+05:30	sfdsfsd	respondent	ddsfsdf	Jharkhand	\N	\N	423423.00	\N	\N	case_filing	234234.00	hourly	43423.00	sdfdsfsaf	c17e9b3b-1b1a-4560-b80e-3f0fb47116e6	\N
1e6589c3-c22f-460c-9295-b822ab77107e	ABC	2313313	intellectual property	433	open	medium	H	\N	2026-04-16	2026-04-16 18:44:58.428501+05:30	2026-04-16 18:44:58.428518+05:30	f05b496d-7eb1-46c2-aa7d-f55269c0287d	4e1a7020-f5e3-46aa-910c-0892eb73f480	96b4ddbd-b2c1-4d99-bcbc-0ce2e6b522ab	6ae6b893-969f-432d-a7f4-62e5f14af2d9	court_case	\N	\N	\N	2026-04-17 05:30:00+05:30	\N	\N	\N	\N	\N	\N	\N	\N	\N	case_filing	3244.00	hourly	400.00	\N	c17e9b3b-1b1a-4560-b80e-3f0fb47116e6	\N
f2fd8c9d-51b4-4bd9-b5da-c34149bb6cef	sdasdada	sdsadsad	intellectual property	wewdwdw	open	medium	saddsad	\N	2026-04-17	2026-04-17 15:20:16.498706+05:30	2026-04-17 15:20:16.49873+05:30	c972c8b6-00f9-43fa-80ef-45253e7ac6c3	\N	96b4ddbd-b2c1-4d99-bcbc-0ce2e6b522ab	6ae6b893-969f-432d-a7f4-62e5f14af2d9	pre_litigation	dasdewe234234	\N	\N	\N	232232	petitioner	sddsad	Odisha	\N	\N	\N	\N	\N	case_filing	\N	hourly	\N	sdadadad	c17e9b3b-1b1a-4560-b80e-3f0fb47116e6	\N
d212e592-b732-434b-baf2-18de4895f15d	fghg	4324343	intellectual property	ewrwr	open	medium	erewrewr	\N	2026-04-17	2026-04-17 18:28:55.968315+05:30	2026-04-17 18:28:55.968337+05:30	744dd8b0-1403-4473-8d3a-2787f061c05a	\N	771ae8e8-3f6b-40e2-badb-e8c85501c90d	9b2a3376-624e-4aff-8c05-746491e1c0fb	pre_litigation	324334	\N	\N	\N	werwrw	petitioner	\N	Nagaland	\N	\N	\N	\N	\N	case_filing	\N	hourly	\N	\N	8645b74b-51dc-4b14-b64c-71dbd4b77828	\N
75498a6e-8dcb-438b-a244-86f8ad123d7c	rtyuty	46546757	intellectual property	trtyry	open	medium	trty	\N	2026-04-18	2026-04-18 12:18:08.247094+05:30	2026-04-18 12:18:08.247116+05:30	3b606ec3-0b52-4b70-a076-135e2185e64d	\N	771ae8e8-3f6b-40e2-badb-e8c85501c90d	9b2a3376-624e-4aff-8c05-746491e1c0fb	pre_litigation	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	case_filing	\N	hourly	\N	\N	8645b74b-51dc-4b14-b64c-71dbd4b77828	\N
697d8d5d-e7f7-4c23-8ffc-d931aff774b7	tyty	56776	intellectual property	hjgjhj	open	medium	ygy	\N	2026-04-18	2026-04-18 13:59:29.968111+05:30	2026-04-18 13:59:29.968125+05:30	bee18ba6-be01-4c4b-82ff-3103e307fc95	\N	771ae8e8-3f6b-40e2-badb-e8c85501c90d	9b2a3376-624e-4aff-8c05-746491e1c0fb	pre_litigation	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	case_filing	\N	hourly	\N	\N	8645b74b-51dc-4b14-b64c-71dbd4b77828	\N
3e446b0e-a532-4e51-b536-536c5588938f	fraud case	4324242	intellectual property	weryw	open	medium	Highcourt	\N	2026-04-20	2026-04-20 13:28:11.464174+05:30	2026-04-20 13:28:11.464195+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	a1567037-4f6e-4bbe-95ec-1653c35658b0	9b2a3376-624e-4aff-8c05-746491e1c0fb	pre_litigation	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	case_filing	\N	hourly	\N	\N	8645b74b-51dc-4b14-b64c-71dbd4b77828	\N
0aa41cdb-d7a3-46f8-b0bd-a42e9f373fe9	thief case	7632784	intellectual property	test	open	medium	\N	\N	2026-04-20	2026-04-20 13:32:14.908324+05:30	2026-04-20 13:32:14.908357+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	771ae8e8-3f6b-40e2-badb-e8c85501c90d	9b2a3376-624e-4aff-8c05-746491e1c0fb	pre_litigation	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	case_filing	\N	hourly	\N	\N	8645b74b-51dc-4b14-b64c-71dbd4b77828	\N
ddc72874-ef6c-47a7-a561-48b9b9a176df	asdadfa	asdaadsadadada	intellectual property	ewfr	open	high	wqedefd	wdwqdd	2026-04-20	2026-04-20 16:37:49.974195+05:30	2026-04-20 17:00:54.26116+05:30	6fd29da0-7080-4382-aaa8-77caa8ef0482	4e1a7020-f5e3-46aa-910c-0892eb73f480	aeb6ce83-b529-41c2-8851-80e2b884b861	6ae6b893-969f-432d-a7f4-62e5f14af2d9	court_case	dqd	dwqedwq	qdqwd	\N	dfvsd	petitioner	edwqd	Odisha	\N	\N	555500.00	\N	\N	execution	4545646.00	hourly	7854.00	dqwdqd	a800853d-8cfe-4e8e-b8dc-666ffdd24d3d	\N
90ed9562-b1f8-4502-a7b3-a2811753213b	Fraud case	532646	intellectual property	This is the details	open	medium	High Court	\N	2026-04-21	2026-04-21 10:21:02.881143+05:30	2026-04-21 10:21:02.881158+05:30	c1270be1-13d5-476e-a2cb-01d93da3816c	\N	f4138337-247a-4a67-9a99-1fd5e7bcae90	eb995188-6dfb-4eba-9425-930f18d36d7f	pre_litigation	5234265423452	\N	\N	\N	\N	petitioner	\N	Odisha	\N	\N	30.00	\N	\N	case_filing	1000.00	hourly	45000.00	\N	921fb527-5772-4b5b-ad65-52cef47bca6b	\N
ad913c90-296f-4dbf-9d66-68e1a97f362a	scdscs	cssc	intellectual property	dsdfsdf	open	medium	dwsd	\N	2026-04-21	2026-04-21 11:10:15.173438+05:30	2026-04-21 11:10:15.173465+05:30	c1270be1-13d5-476e-a2cb-01d93da3816c	\N	dd3ae556-a620-4b45-af95-0875dabf2925	eb995188-6dfb-4eba-9425-930f18d36d7f	pre_litigation	\N	\N	\N	\N	\N	petitioner	\N	Odisha	\N	\N	\N	\N	\N	case_filing	\N	hourly	\N	\N	921fb527-5772-4b5b-ad65-52cef47bca6b	\N
2efc47b8-7a39-4338-97f3-9c011e2a06bf	Fraaud case	324234324	intellectual property	This is test	open	medium	High court	\N	2026-04-21	2026-04-21 11:51:59.283192+05:30	2026-04-21 11:51:59.283207+05:30	cbc4ea0e-015e-4d4f-ae0c-c85c450691c9	\N	f728f594-f735-4ed9-99e8-a2df4e47387d	5c0747c8-99d2-4104-9fb4-97dd465fdaae	pre_litigation	\N	\N	\N	\N	\N	petitioner	\N	Odisha	\N	\N	50.00	\N	\N	case_filing	\N	hourly	4500.00	\N	0b597ba5-f5fb-456b-aa44-08e928808f36	\N
24e676df-e794-43b9-b492-d3c0f1ab3d34	fdd	5453	intellectual property	45455	open	medium	\N	\N	2026-04-24	2026-04-24 12:59:13.11458+05:30	2026-04-24 12:59:13.114601+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	a1567037-4f6e-4bbe-95ec-1653c35658b0	9b2a3376-624e-4aff-8c05-746491e1c0fb	pre_litigation	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	case_filing	\N	hourly	\N	\N	8645b74b-51dc-4b14-b64c-71dbd4b77828	\N
2fa61f65-986a-4620-a182-316daed27319	wqdewqew	wqewqewq	intellectual property	ewqewqe	open	medium	ewqe	\N	2026-05-04	2026-05-04 17:30:34.889571+05:30	2026-05-04 17:30:34.889593+05:30	2594cfb1-8985-42d5-a068-13a6c277b5ee	\N	c4bfb118-849f-4aed-9ee1-969b1533e002	\N	pre_litigation	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	case_filing	\N	hourly	\N	\N	\N	2594cfb1-8985-42d5-a068-13a6c277b5ee
f5ed91b7-d2ab-4c86-8162-c2400ee2ef74	Murder in Barbil- may 11 2026	324324343	Murder case	This is happens on the may 11	open	medium	High court	\N	2026-05-11	2026-05-11 13:13:59.671822+05:30	2026-05-11 13:13:59.671834+05:30	2e0a0f68-266a-489c-85a9-5d0b5f2b3283	\N	e72c42cb-4dac-40fb-aab4-38abf01560b9	\N	pre_litigation	\N	\N	\N	2026-05-13 05:30:00+05:30	\N	\N	\N	Odisha	\N	\N	\N	\N	\N	case_filing	\N	hourly	\N	\N	\N	2e0a0f68-266a-489c-85a9-5d0b5f2b3283
44146ad4-8676-4921-ae40-aa4b1f4e84d7	Khordha Murder Case 27 DEC 2026	MURDER112	intellectual property	the test case is specially created for the test purpose	open	medium	hfgh	fhgh	2026-04-28	2026-04-28 11:51:47.382012+05:30	2026-05-09 16:42:07.61973+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	\N	a1567037-4f6e-4bbe-95ec-1653c35658b0	9b2a3376-624e-4aff-8c05-746491e1c0fb	court_case	gfhfgh	hgf	fgh	2026-04-12 05:30:00+05:30	hgh	petitioner	gh	Manipur	\N	\N	4564.00	\N	\N	case_filing	546.00	hourly	456.00	ghf	38ba1911-6378-4da5-b523-ab10e3dbc0ad	\N
76d1e2fb-90d5-4efc-af16-38c0a5ec08a0	House Case	2926HCASE	intellectual property	the case	open	high	High Court	\N	2026-07-20	2026-07-20 17:16:23.49022+05:30	2026-07-20 17:16:23.490227+05:30	6fd29da0-7080-4382-aaa8-77caa8ef0482	e3c89f4a-264a-4d7f-9625-d7f57e7f2c4f	aeb6ce83-b529-41c2-8851-80e2b884b861	6ae6b893-969f-432d-a7f4-62e5f14af2d9	pre_litigation	\N	\N	\N	\N	\N	\N	bansidhar routray	\N	\N	\N	242424.00	\N	\N	case_filing	23424234.00	hourly	3242424.00	Sura Routray	c17e9b3b-1b1a-4560-b80e-3f0fb47116e6	\N
\.


--
-- Data for Name: cases_caseactivity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cases_caseactivity (id, activity_type, description, previous_status, new_status, created_at, case_id, performed_by_id) FROM stdin;
b06e34fd-ca86-4de7-9168-987ffaa1aec5	case_created	Case created by Main Super Admin 1 (Super Admin (Firm Owner))	\N	\N	2026-04-15 13:35:17.013862+05:30	cd52e370-1f5b-40d3-b709-3de055ad0d59	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5
848c4bef-0a57-4cdd-9ec2-63176f311ff6	case_created	Case created by Main Super Admin 1 (Super Admin (Firm Owner))	\N	\N	2026-04-15 15:27:19.409017+05:30	bb2a8573-1385-4e8b-9436-ca05de4b79cf	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5
d27f4e69-90ac-4c19-9854-6ed1d1509625	status_change	Status changed from open to in_progress	open	in_progress	2026-04-15 15:46:16.426809+05:30	bb2a8573-1385-4e8b-9436-ca05de4b79cf	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5
0be1d1a8-cd35-46b6-9277-0d9c84038ea0	case_created	Case created by Main Super Admin 1 (Super Admin (Firm Owner))	\N	\N	2026-04-16 13:19:32.222158+05:30	63a36afb-8ddd-4626-8dae-a7460475cf7c	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5
d216e9c4-8392-457f-a888-37ef4553ccc2	case_created	Case created by Main Super Admin 1 (Super Admin (Firm Owner))	\N	\N	2026-04-16 13:26:43.197832+05:30	d374a4a5-4bd7-473f-9c3f-a5ad3c30123f	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5
c6eb2fbe-fdf0-45cd-bbed-6bd0b03aace1	case_created	Case created by Main Super Admin 1 (Super Admin (Firm Owner))	\N	\N	2026-04-16 18:44:58.433303+05:30	1e6589c3-c22f-460c-9295-b822ab77107e	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5
b7e4687d-eac3-466d-aa9c-82416eafc3fa	case_created	Case created by SHRADHA SAHOO (Advocate)	\N	\N	2026-04-17 15:20:16.504457+05:30	f2fd8c9d-51b4-4bd9-b5da-c34149bb6cef	c972c8b6-00f9-43fa-80ef-45253e7ac6c3
509c49cf-2a0e-4c42-893e-d81d4d8b3314	case_created	Case created by Ritik Saxena (Super Admin (Firm Owner))	\N	\N	2026-04-17 18:28:55.973911+05:30	d212e592-b732-434b-baf2-18de4895f15d	afabcd85-1495-4ad4-8799-9a82f15c2d89
ff790c41-9e39-4521-a28f-1a46b6a64df8	case_created	Case created by Ritik Saxena (Super Admin (Firm Owner))	\N	\N	2026-04-18 12:18:08.252373+05:30	75498a6e-8dcb-438b-a244-86f8ad123d7c	afabcd85-1495-4ad4-8799-9a82f15c2d89
4d5b6b17-c96f-45cc-ba9d-588bc0935c5d	case_created	Case created by Suman Das (Advocate)	\N	\N	2026-04-18 13:59:29.97062+05:30	697d8d5d-e7f7-4c23-8ffc-d931aff774b7	bee18ba6-be01-4c4b-82ff-3103e307fc95
bb3b0fa4-94d6-40db-b7fd-ae43e2baed4c	case_created	Case created by Ritik Saxena (Super Admin (Firm Owner))	\N	\N	2026-04-20 13:28:11.469701+05:30	3e446b0e-a532-4e51-b536-536c5588938f	afabcd85-1495-4ad4-8799-9a82f15c2d89
ffeb6256-c3ae-448d-9866-342a32b15c35	case_created	Case created by Ritik Saxena (Super Admin (Firm Owner))	\N	\N	2026-04-20 13:32:14.914866+05:30	0aa41cdb-d7a3-46f8-b0bd-a42e9f373fe9	afabcd85-1495-4ad4-8799-9a82f15c2d89
8a54ca80-a03d-4240-91f9-f65215c27d86	case_created	Case created by Main Super Admin edited 1 (Super Admin (Firm Owner))	\N	\N	2026-04-20 16:37:49.979158+05:30	ddc72874-ef6c-47a7-a561-48b9b9a176df	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5
5976f9c7-cbab-4358-818d-b8e882d24446	case_created	Case created by Shaswati Sahoo (Super Admin (Firm Owner))	\N	\N	2026-04-21 10:21:02.887538+05:30	90ed9562-b1f8-4502-a7b3-a2811753213b	70dd5f3f-412e-4816-a258-6fc40c025bde
6cbffb10-9863-48c8-815c-c32d31bc8552	case_created	Case created by Bibhu Prasad Mahakud (Advocate)	\N	\N	2026-04-21 11:10:15.182483+05:30	ad913c90-296f-4dbf-9d66-68e1a97f362a	c1270be1-13d5-476e-a2cb-01d93da3816c
00111e14-2eb4-406f-ab96-eb50390a3a93	case_created	Case created by Santosh Biswal (Super Admin (Firm Owner))	\N	\N	2026-04-21 11:51:59.2869+05:30	2efc47b8-7a39-4338-97f3-9c011e2a06bf	d649f2d2-bccb-48a8-9db8-d851ff2aa037
b675c5a4-d324-492d-a442-ce90f4f7915e	case_created	Case created by Ritik Saxena (Super Admin (Firm Owner))	\N	\N	2026-04-24 12:59:13.124597+05:30	24e676df-e794-43b9-b492-d3c0f1ab3d34	afabcd85-1495-4ad4-8799-9a82f15c2d89
58ebc00a-beca-455d-9216-bb7cbeb6676a	case_created	Case created by Ritik Saxena (Super Admin (Firm Owner))	\N	\N	2026-04-28 11:51:47.402876+05:30	44146ad4-8676-4921-ae40-aa4b1f4e84d7	afabcd85-1495-4ad4-8799-9a82f15c2d89
dfa8b040-1216-444a-8129-6429adec55c3	case_created	Case created by fdgdh cbxn (Advocate)	\N	\N	2026-05-04 17:30:34.899042+05:30	2fa61f65-986a-4620-a182-316daed27319	2594cfb1-8985-42d5-a068-13a6c277b5ee
6c9e2868-fa43-4ef3-85dc-bf4f1856a1c5	case_created	Case created by fdgdh cbxn (Advocate)	\N	\N	2026-05-06 15:01:48.734004+05:30	a4793fc7-520b-462f-bd56-3b8442e47e9c	2594cfb1-8985-42d5-a068-13a6c277b5ee
98161a52-6ebb-4c4a-af4b-f451f47509e5	case_created	Case created by Main Super Admin 1 (Super Admin (Firm Owner))	\N	\N	2026-05-06 16:25:08.83412+05:30	dbaa3bd7-a433-47c3-a6c8-b660aea3e75d	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5
adf57e94-7a77-4464-95dd-da0f6037eba0	case_created	Case created by SHRADHA SAHOO (Admin)	\N	\N	2026-05-09 17:32:08.708195+05:30	b1b52cd7-2c03-48dc-871d-4f561ab1c206	ef266648-9837-4cbc-86b1-5af95046120b
dc53de0f-236e-4424-b89a-81cfdcfe6517	case_created	Case created by Sanjay Mohaptra (Advocate)	\N	\N	2026-05-11 13:13:59.68838+05:30	f5ed91b7-d2ab-4c86-8162-c2400ee2ef74	2e0a0f68-266a-489c-85a9-5d0b5f2b3283
496dd7e9-90ff-4be4-b7f1-086778f89c7a	case_created	Case created by Main Super Admin 1 (Super Admin (Firm Owner))	\N	\N	2026-07-20 17:16:23.501138+05:30	76d1e2fb-90d5-4efc-af16-38c0a5ec08a0	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5
\.


--
-- Data for Name: cases_casedocumentchecklistitem; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cases_casedocumentchecklistitem (id, document_name, description, is_mandatory, status, requested_date, received_date, verified_date, notes, reminder_sent, last_reminder_date, created_at, updated_at, case_id, checklist_template_id, uploaded_document_id, verified_by_id) FROM stdin;
\.


--
-- Data for Name: cases_casedocumentrequest; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cases_casedocumentrequest (id, document_type, document_title, description, status, priority, due_date, uploaded_at, advocate_notes, client_notes, rejection_reason, created_at, updated_at, case_id, requested_by_id, uploaded_document_id) FROM stdin;
20cec79a-c1a0-4f04-8f1e-03b5d44ad3e2	aadhar	Aadhar Card	Please upload clear copy	pending	high	2026-06-15	\N				2026-05-13 13:23:37.642219+05:30	2026-05-13 13:23:37.642233+05:30	b1b52cd7-2c03-48dc-871d-4f561ab1c206	9a3b9470-80d4-444e-a370-55fd04bf185a	\N
c50bd4cb-0aab-4421-924f-e093e8c06a48	aadhar	Aadhar Card	Need your Aadhar card for identity verification	verified	high	2024-05-20	2026-05-15 17:39:03.108326+05:30		sasa		2026-05-15 16:41:08.130321+05:30	2026-05-15 17:55:26.135015+05:30	b1b52cd7-2c03-48dc-871d-4f561ab1c206	9a3b9470-80d4-444e-a370-55fd04bf185a	d3060ee7-fd35-4a4d-a08b-e954aa93b248
0752290b-52e9-4d63-8f7b-80d02a492950	aadhar	Aadhar Card	Please upload clear copy	verified	high	2026-06-15	2026-05-15 18:30:39.871743+05:30		a		2026-05-13 13:27:50.710279+05:30	2026-07-21 13:48:32.03812+05:30	b1b52cd7-2c03-48dc-871d-4f561ab1c206	9a3b9470-80d4-444e-a370-55fd04bf185a	b4286046-7976-49a5-abe7-378213068282
\.


--
-- Data for Name: cases_casedraft; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cases_casedraft (id, title, content, draft_type, status, version, created_at, updated_at, case_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: cases_caseresearch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cases_caseresearch (id, research_type, title, content, case_citation, court_name, judgment_date, act_name, section_number, reference_document, is_favorable, relevance_score, created_at, updated_at, case_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: cases_documentchecklist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cases_documentchecklist (id, case_type, document_name, description, is_mandatory, display_order, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cases_hearing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cases_hearing (id, hearing_date, purpose, judge_remarks, status, order_passed, created_at, updated_at, case_id) FROM stdin;
\.


--
-- Data for Name: cases_legalnotice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cases_legalnotice (id, notice_type, subject, recipient_name, recipient_address, recipient_email, recipient_phone, notice_content, notice_document, status, delivery_method, sent_date, delivered_date, tracking_number, proof_of_delivery, response_deadline, response_received_date, response_document, response_summary, next_action, created_at, updated_at, case_id, created_by_id, delivery_attempts, email_delivered, email_opened, email_opened_date, email_sent, email_sent_date, last_status_update, last_status_updated_by_id, physical_delivered, physical_delivered_date, physical_sent, physical_sent_date, read_date, status_notes, whatsapp_delivered, whatsapp_read, whatsapp_read_date, whatsapp_sent, whatsapp_sent_date) FROM stdin;
\.


--
-- Data for Name: cases_serviceattempt; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cases_serviceattempt (id, service_type, service_date, service_method, served_to, served_by, address, status, proof_document, remarks, next_attempt_date, created_at, updated_at, case_id, created_by_id) FROM stdin;
\.


--
-- Data for Name: clients_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients_client (id, first_name, last_name, email, phone_number, address, created_at, updated_at, firm_id, assigned_advocate_id, brief_summary, user_account_id, profile_image) FROM stdin;
96b4ddbd-b2c1-4d99-bcbc-0ce2e6b522ab	surya client	1	surya@h.com	2345234567		2026-04-15 13:06:38.261597+05:30	2026-04-15 13:06:38.261613+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9	\N		90790d0f-374c-4a08-b0d6-b74a171a7ca5	
e515e592-0381-48b7-8fe0-e5e24bf841df	Sweta	Dey	shweta@gmail.com	6354366235		2026-04-17 15:15:42.822676+05:30	2026-04-17 15:15:42.822705+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9	c972c8b6-00f9-43fa-80ef-45253e7ac6c3		\N	
fec41b8e-bc57-4f4a-94de-e44c0982e5d3	dfsgd	dwedwd	dwdw@gmail.com	4324242		2026-04-17 15:40:44.212676+05:30	2026-04-17 15:40:44.212695+05:30	9b2a3376-624e-4aff-8c05-746491e1c0fb	744dd8b0-1403-4473-8d3a-2787f061c05a		\N	
ea2b3ebf-b799-45d1-876e-a6f12862320a	vcdfdd	fdsfdsf	shradhamilu160@gmail.com	7008566160	HIG- 243, K-5, Kalinga Vihar HIG- 243, K-5, Kalinga Vihar, dfdsff, Bhubaneswar, Odisha, 751019	2026-04-20 10:22:41.889582+05:30	2026-04-20 10:22:41.88961+05:30	9b2a3376-624e-4aff-8c05-746491e1c0fb	9a3b9470-80d4-444e-a370-55fd04bf185a		139b2b54-06b6-4e1b-9469-bbda62e773d3	
771ae8e8-3f6b-40e2-badb-e8c85501c90d	gsdjsd	dsasd	asda@gmail.com	234242423432		2026-04-17 18:28:55.950382+05:30	2026-04-20 13:32:14.912428+05:30	9b2a3376-624e-4aff-8c05-746491e1c0fb	9a3b9470-80d4-444e-a370-55fd04bf185a		fcde59a6-01eb-46cf-9e40-344f8282b54a	
aeb6ce83-b529-41c2-8851-80e2b884b861	Subrat	Barik	s03@gmail.com	+99999999567		2026-04-20 16:37:49.960665+05:30	2026-04-20 16:37:49.977161+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9	6fd29da0-7080-4382-aaa8-77caa8ef0482		6136f201-bfb6-4e41-bf1e-cb9f231549a5	
f4138337-247a-4a67-9a99-1fd5e7bcae90	Pooja	Gupta	pooja@gmail.com	3462267473		2026-04-21 10:01:04.894694+05:30	2026-04-21 10:21:02.885343+05:30	eb995188-6dfb-4eba-9425-930f18d36d7f	c1270be1-13d5-476e-a2cb-01d93da3816c		9b6e44a0-33b6-48b3-8d43-0f1de5234056	
dd3ae556-a620-4b45-af95-0875dabf2925	Asim	Rath	asim@gmail.com	764378426492		2026-04-21 11:07:08.235753+05:30	2026-04-21 11:07:08.235782+05:30	eb995188-6dfb-4eba-9425-930f18d36d7f	c1270be1-13d5-476e-a2cb-01d93da3816c		d0ebad81-eae4-446f-a89b-0bdb5d513b7f	
f728f594-f735-4ed9-99e8-a2df4e47387d	Shradha	Sahoo	sgfd@gmail.com	21321321		2026-04-21 11:46:03.220535+05:30	2026-04-21 11:51:59.285231+05:30	5c0747c8-99d2-4104-9fb4-97dd465fdaae	cbc4ea0e-015e-4d4f-ae0c-c85c450691c9		5c3c3793-5ad8-47c9-a31d-177ba7fc0081	
a1567037-4f6e-4bbe-95ec-1653c35658b0	rew	wetywue	cli@gmail.com	325347376237		2026-04-20 10:19:32.647355+05:30	2026-04-24 12:59:13.12158+05:30	9b2a3376-624e-4aff-8c05-746491e1c0fb	9a3b9470-80d4-444e-a370-55fd04bf185a		184ee2bb-6bf9-4dc6-8e05-3620562c827e	
c4bfb118-849f-4aed-9ee1-969b1533e002	erwrwr	tgff	fddsf@gmail.com	9898989898		2026-05-04 17:23:24.731962+05:30	2026-05-04 17:23:24.731988+05:30	\N	2594cfb1-8985-42d5-a068-13a6c277b5ee		f7f9848a-1696-4dbb-b37d-d303b218b9de	
2a9f98b3-3b66-40b7-a6e7-b7bd67764e60	sghdfs	xcxcx	tereyrer@gmail.com	4343434387	dfdsfdfd	2026-05-06 15:04:19.530905+05:30	2026-05-06 15:04:19.530925+05:30	\N	\N		98058847-547b-44d1-829f-abeeb12c57cb	
d26b0204-0f2a-4c57-8a3d-04bf62a57299	gfhhdf	xcx	cxcx@gmail.com	5435435435		2026-05-06 15:20:58.661615+05:30	2026-05-06 15:20:58.661643+05:30	\N	115b1e64-92b3-452d-9279-99dbb7911593		7087c792-34a2-4e9a-ae40-5b45f3e6c50a	
8ec45cdf-e45d-483b-bbb1-9263af0ad3b8	sds	dsdsd	sds@gmail.com	+917888566160		2026-05-08 10:38:56.402628+05:30	2026-05-08 10:38:56.402649+05:30	\N	30629b8e-eaf6-4612-8e7c-d487fcb0ab11		905a0710-c0bc-4ff4-8540-f8fd24174a98	
171c379f-bf59-4426-8062-a85354589dfd	fgdh	4354	sdg@gmail.com	5444444		2026-05-08 11:22:18.474891+05:30	2026-05-08 11:22:18.474916+05:30	\N	30629b8e-eaf6-4612-8e7c-d487fcb0ab11		e7b6f636-7aad-4655-a57d-a3d174fdf4d2	
15328861-a925-4aaa-8aac-d9fb97db2d7e	Ganesh	Panda	ganesh.panda@gmail.com	1234567892		2026-05-08 17:50:11.798127+05:30	2026-05-08 17:50:11.798158+05:30	\N	d33932c9-8a33-4bb9-a5cb-38079d242d4e		5185cd8b-45df-424d-9b65-e1473ab03301	
ee72b3b8-e28f-4f39-bf36-e122a25f99b8	etrb yhdi	sha hoo	shr@gmail.com	564636		2026-05-11 10:17:03.716285+05:30	2026-05-11 10:17:03.716317+05:30	\N	d33932c9-8a33-4bb9-a5cb-38079d242d4e		3411bfbd-d965-4897-a6ee-aa1a2fe06039	
e72c42cb-4dac-40fb-aab4-38abf01560b9	Akash	Das	akash@gmail.com	9898769898		2026-05-11 13:07:48.955608+05:30	2026-05-11 13:07:48.955634+05:30	\N	2e0a0f68-266a-489c-85a9-5d0b5f2b3283		f55a587a-2465-41fc-aa12-3975a18b21fb	
589f692d-8baf-4a17-86e0-fc58a3ba3764	Chakradhar	Panda	chakradhar72@gmail.com	7873099888	Kanan vihar sector-2 BBSR	2026-05-11 13:19:49.2033+05:30	2026-05-11 13:19:49.203321+05:30	\N	\N		ead81aad-44c7-4780-9afe-3a8501fac43e	
4332d851-4cc3-4af6-b4e8-79ed6b573272	Sanjay	Mohapatra	sanjaymohapatra90@gmail.com	9458006789	CDA sector-2 Cuttack	2026-05-13 11:45:54.353584+05:30	2026-05-13 11:45:54.353604+05:30	\N	\N		2264d078-daf3-456e-be50-112c6ca1a3f4	
7b859bb7-7784-4f8f-ba8c-ee58344b4447	Kanha	Krishna	krishnakanha92@gmail.com	7321000589	SCS College Puri	2026-05-14 12:41:42.609555+05:30	2026-05-14 12:41:42.609577+05:30	\N	\N		70af14e0-742c-47a3-a450-78fdecad1399	
39ec770d-3e18-4560-89f9-e5a6d80a6277	Minakhi	Rout	www.minakhrout@gmail.com	9861108580	Kalinga Nagar BBSR	2026-05-18 14:25:15.141315+05:30	2026-05-18 14:25:15.14133+05:30	\N	\N		75b53f3e-46f8-45a7-ab94-437b13830279	
6500db0d-fa66-408f-97d8-331d0eb12b48	test	client 2	testclient2@gmail.com	7895588778		2026-08-03 17:39:47.481693+05:30	2026-08-03 17:39:47.481699+05:30	\N	9eea803b-c301-41db-803d-6bdfb6278e89		d29c83c4-9330-4c97-a169-bff037ffbd36	
f5decf65-c28c-4aa0-85b5-daf0f33a8304	test	client	testclient@gmail.com	+774411225588		2026-08-03 17:31:56.88263+05:30	2026-08-03 18:13:29.411418+05:30	\N	9eea803b-c301-41db-803d-6bdfb6278e89		09e41654-0c15-43f0-95a9-3d2f6a541ef4	
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	authtoken	token
7	authtoken	tokenproxy
8	accounts	customuser
9	accounts	userinvitation
10	accounts	otpverification
11	accounts	logincredential
12	accounts	globalconfiguration
13	accounts	userfirmrole
14	firms	firm
15	firms	branch
16	documents	userdocument
17	partners	partner
18	audit	auditlog
19	cases	case
20	cases	hearing
21	cases	casedraft
22	cases	caseactivity
23	clients	client
24	tasks	task
25	accounts	firmjoinlink
26	subscriptions	subscriptionplan
27	subscriptions	firmsubscription
28	calendar_events	calendarevent
29	accounts	advocateparalegalassignment
30	billing	invoice
31	billing	expense
32	billing	trustaccount
33	billing	timeentry
34	billing	payment
35	subscriptions	platforminvoice
36	billing	advocateinvoice
37	documents	documenttemplate
38	documents	filledtemplate
39	cases	casedocumentrequest
40	documents	courtformtemplate
41	documents	filledcourtform
42	cases	serviceattempt
43	cases	documentchecklist
44	cases	legalnotice
45	cases	caseresearch
46	cases	casedocumentchecklistitem
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	firms	0001_initial	2026-04-08 15:25:48.264586+05:30
2	firms	0002_branch	2026-04-08 15:25:48.289564+05:30
3	contenttypes	0001_initial	2026-04-08 15:25:48.300037+05:30
4	contenttypes	0002_remove_content_type_name	2026-04-08 15:25:48.325266+05:30
5	auth	0001_initial	2026-04-08 15:25:48.382378+05:30
6	auth	0002_alter_permission_name_max_length	2026-04-08 15:25:48.403305+05:30
7	auth	0003_alter_user_email_max_length	2026-04-08 15:25:48.415401+05:30
8	auth	0004_alter_user_username_opts	2026-04-08 15:25:48.430709+05:30
9	auth	0005_alter_user_last_login_null	2026-04-08 15:25:48.446786+05:30
10	auth	0006_require_contenttypes_0002	2026-04-08 15:25:48.450846+05:30
11	auth	0007_alter_validators_add_error_messages	2026-04-08 15:25:48.46968+05:30
12	auth	0008_alter_user_username_max_length	2026-04-08 15:25:48.490201+05:30
13	auth	0009_alter_user_last_name_max_length	2026-04-08 15:25:48.517961+05:30
14	auth	0010_alter_group_name_max_length	2026-04-08 15:25:48.540654+05:30
15	auth	0011_update_proxy_permissions	2026-04-08 15:25:48.567322+05:30
16	auth	0012_alter_user_first_name_max_length	2026-04-08 15:25:48.587356+05:30
17	accounts	0001_initial	2026-04-08 15:25:49.076625+05:30
18	accounts	0002_globalconfiguration	2026-04-08 15:25:49.092452+05:30
19	accounts	0003_userfirmrole	2026-04-08 15:25:49.164973+05:30
20	accounts	0004_userfirmrole_branch	2026-04-08 15:25:49.222618+05:30
21	accounts	0005_alter_userinvitation_expires_at	2026-04-08 15:25:49.273595+05:30
22	admin	0001_initial	2026-04-08 15:25:49.343585+05:30
23	admin	0002_logentry_remove_auto_add	2026-04-08 15:25:49.392339+05:30
24	admin	0003_logentry_add_action_flag_choices	2026-04-08 15:25:49.44326+05:30
25	audit	0001_initial	2026-04-08 15:25:49.531103+05:30
26	audit	0002_auditlog_firm_auditlog_resource_id_and_more	2026-04-08 15:25:49.681489+05:30
27	authtoken	0001_initial	2026-04-08 15:25:49.749361+05:30
28	authtoken	0002_auto_20160226_1747	2026-04-08 15:25:50.071439+05:30
29	authtoken	0003_tokenproxy	2026-04-08 15:25:50.078586+05:30
30	documents	0001_initial	2026-04-08 15:25:50.133427+05:30
31	partners	0001_initial	2026-04-08 15:25:50.212606+05:30
32	sessions	0001_initial	2026-04-08 15:25:50.233898+05:30
33	accounts	0006_globalconfiguration_trial_period_days_and_more	2026-04-08 18:18:31.723417+05:30
34	clients	0001_initial	2026-04-09 18:12:29.649271+05:30
35	cases	0001_initial	2026-04-09 18:12:29.798153+05:30
36	cases	0002_initial	2026-04-09 18:12:29.853089+05:30
37	documents	0002_userdocument_case_userdocument_document_category_and_more	2026-04-09 18:12:30.008827+05:30
38	firms	0003_firm_logo_firm_partner_firm_practice_areas_and_more	2026-04-09 18:12:30.078507+05:30
39	tasks	0001_initial	2026-04-09 18:12:30.122686+05:30
40	subscriptions	0001_initial	2026-04-14 10:08:59.357226+05:30
41	cases	0003_case_category_case_cnr_number_case_court_no_and_more	2026-04-15 12:45:22.695507+05:30
42	cases	0004_case_additional_expenses_case_case_summary_and_more	2026-04-15 12:45:22.842801+05:30
43	cases	0005_case_billing_type_case_estimated_value_and_more	2026-04-15 12:45:22.906411+05:30
44	cases	0006_case_branch	2026-04-15 12:45:22.936436+05:30
45	cases	0007_alter_case_case_title_alter_case_status	2026-04-15 12:45:22.976778+05:30
46	clients	0002_alter_client_options_client_assigned_advocate_and_more	2026-04-15 12:45:23.05227+05:30
47	clients	0003_client_profile_image	2026-04-15 12:45:23.072375+05:30
48	firms	0003_add_logo_registration_practice_areas	2026-04-15 12:54:42.917818+05:30
49	cases	0008_alter_case_additional_expenses_and_more	2026-04-15 18:08:13.053981+05:30
50	accounts	0007_firmjoinlink	2026-04-16 16:26:21.261646+05:30
51	accounts	0008_alter_userfirmrole_firm_alter_userinvitation_firm	2026-04-16 16:26:21.381205+05:30
52	accounts	0009_customuser_profile_image	2026-04-16 16:27:44.979968+05:30
53	documents	0003_remove_userdocument_user_userdocument_client_and_more	2026-04-16 16:27:46.953477+05:30
54	accounts	0010_customuser_case_fee_customuser_consultation_fee_and_more	2026-04-22 13:27:35.596931+05:30
55	accounts	0011_alter_customuser_consultation_fee_and_more	2026-04-22 13:28:40.892503+05:30
56	calendar_events	0001_initial	2026-04-22 13:32:53.276517+05:30
57	billing	0001_initial	2026-04-24 10:47:24.609659+05:30
58	subscriptions	0002_subscriptionplan_enable_api_access_and_more	2026-04-24 10:47:24.715962+05:30
59	billing	0002_alter_expense_case_alter_invoice_case_and_more	2026-04-27 17:54:46.081909+05:30
60	billing	0003_invoice_branch	2026-04-27 17:54:46.171743+05:30
61	billing	0004_advocateinvoice_timeentry_advocate_invoice_and_more	2026-04-27 17:54:46.46707+05:30
62	subscriptions	0003_increase_subscription_limits	2026-04-27 17:54:46.529144+05:30
63	subscriptions	0004_platforminvoice	2026-04-27 17:54:46.639427+05:30
64	billing	0005_invoice_total_amount_default	2026-04-28 10:24:11.221095+05:30
65	cases	0009_make_firm_nullable_add_solo_advocate	2026-05-01 11:05:26.285963+05:30
66	subscriptions	0005_seed_subscription_plans	2026-05-01 12:32:17.432233+05:30
67	accounts	0012_firmjoinlink_solo_advocate	2026-05-04 16:37:56.778065+05:30
68	clients	0004_solo_advocate_support	2026-05-04 16:37:56.883914+05:30
69	accounts	0013_firmjoinlink_firm_nullable	2026-05-04 17:07:11.890124+05:30
70	accounts	0014_advocateparalegal_firm_nullable	2026-05-04 17:07:11.945359+05:30
71	clients	0005_client_firm_nullable	2026-05-04 17:18:22.675126+05:30
72	billing	0006_fix_advocate_invoice_total_amount_default	2026-05-05 17:26:57.341985+05:30
73	billing	0007_allow_null_firm_on_invoices	2026-05-05 17:49:34.153689+05:30
74	billing	0008_allow_null_firm_on_timeentry_expense	2026-05-05 18:00:10.6664+05:30
75	calendar_events	0002_make_firm_optional_on_calendar_event	2026-05-06 12:27:02.720798+05:30
76	documents	0004_documenttemplate_filledtemplate_and_more	2026-05-09 12:39:52.988758+05:30
77	cases	0010_casedocumentrequest	2026-05-12 16:56:06.50735+05:30
78	cases	0011_rename_cases_cased_case_id_b8c9e5_idx_cases_cased_case_id_e562fe_idx_and_more	2026-05-12 16:56:06.598269+05:30
79	cases	0012_serviceattempt	2026-05-22 18:17:28.820288+05:30
80	cases	0013_documentchecklist_legalnotice_caseresearch_and_more	2026-05-22 18:17:29.011058+05:30
81	cases	0014_update_legal_notice_tracking	2026-05-22 18:17:30.162499+05:30
82	documents	0005_alter_userdocument_document_type	2026-05-22 18:17:30.207368+05:30
83	documents	0006_courtformtemplate_filledcourtform_and_more	2026-05-22 18:17:30.926847+05:30
84	documents	0007_filledcourtform_advocate_signature_image_and_more	2026-05-22 18:17:31.169681+05:30
85	documents	0008_filledcourtform_digital_signature_details_and_more	2026-05-22 18:17:31.264575+05:30
86	clients	0006_alter_client_user_account_and_more	2026-06-03 18:01:41.104823+05:30
87	documents	0009_filledtemplate_advocate_signature_image_and_more	2026-06-03 18:01:41.214816+05:30
88	documents	0010_alter_courtformtemplate_options_and_more	2026-06-03 18:01:41.325872+05:30
89	documents	0011_alter_courtformtemplate_category	2026-06-03 18:01:41.375021+05:30
90	documents	0012_filledcourtform_custom_sequence	2026-06-03 18:01:41.430161+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
\.


--
-- Data for Name: documents_courtformtemplate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents_courtformtemplate (id, name, description, category, content_structure, default_field_mappings, is_active, created_at, updated_at, created_by_id, sequence) FROM stdin;
95e8ed72-7146-4880-a9ee-0ffe4e0ca9d9	ANNEXURE (Generic Cover Page)	Generic cover page for an annexure (FIR, Orders, Evidence, etc.)	drafting	{"margins": {"top": 72, "left": 72, "right": 72, "bottom": 72}, "sections": [{"type": "header", "style": {"bold": true, "size": 16, "align": "center", "underline": true}, "content": "ANNEXURE-{annexure_no}"}, {"type": "spacer", "height": 60}, {"type": "paragraph", "style": {"size": 14, "align": "justify", "line_height": 1.8}, "content": "       True copy of the {document_description} dated {document_date}."}, {"type": "spacer", "height": 150}, {"type": "grid_row", "style": {"bold": true, "size": 11}, "columns": [{"flex": 1, "field": "place_date", "prefix": "CUTTACK\\nDATE: {current_date}"}, {"flex": 1, "align": "center", "field": "advocate_signature", "prefix": "ADVOCATE\\nFOR THE PETITIONER"}]}], "page_size": "A4"}	{"annexure_no": "1", "document_date": "01.01.2026", "document_description": "F.I.R."}	t	2026-07-21 12:39:27.048508+05:30	2026-07-21 13:33:07.989102+05:30	\N	5
fb16216b-cb4d-4816-aaff-b2f11d1a6c0e	Personal Bail Bond	Bail Bond U/S 437-A Cr.P.C. with Affidavit (2 Pages)	drafting	{"margins": {"top": 50, "left": 50, "right": 50, "bottom": 50}, "sections": [{"type": "header", "style": {"bold": true, "size": 14, "align": "center"}, "content": "BAIL BOND U/S 437-A CR.P.C."}, {"type": "header", "style": {"bold": true, "size": 12, "align": "center"}, "content": "BOND & BAIL BOND FOR ATTENDANCE BEFORE THE APPELLANT COURT"}, {"type": "spacer", "height": 20}, {"type": "editable_line", "field": "judge_name", "style": {"size": 11}, "prefix": "In the court of Sh."}, {"type": "grid_row", "columns": [{"flex": 1, "field": "ps_name", "prefix": "P.S. ...:"}, {"flex": 1, "field": "sections_law", "prefix": "U/S"}, {"flex": 1, "field": "fir_number", "prefix": "FIR No."}]}, {"type": "spacer", "height": 20}, {"type": "header", "style": {"bold": true, "align": "center", "underline": true}, "content": "PERSONAL BOND"}, {"type": "paragraph", "style": {"align": "justify", "line_height": 1.8}, "content": "I, {accused_name} S/o. Sh. {accused_parent} R/o {accused_address} Having been acquitted by this Hon’ble Court on {acquittal_date} in above said case FIR No. {fir_number} P.S. {ps_name} U/s {sections_law} and required to give surety for my attendance before the Hon’ble Court on condition that I shall attend the Hon’ble Appellate Court on every date of hearing in which any appeal filed against the judgment & Order of acquittal, passed by this Hon’ble Court and in case making default therein I myself undertake to forfeit to the Govt. of India the sum of Rs. {bond_amount}."}, {"type": "spacer", "height": 15}, {"type": "paragraph", "style": {"bold": true}, "content": "Delhi\\nDate:\\n\\nSignature"}, {"type": "spacer", "height": 20}, {"type": "header", "style": {"bold": true, "align": "center", "underline": true}, "content": "SURETY BOND"}, {"type": "paragraph", "style": {"align": "justify", "line_height": 1.8}, "content": "I, {surety_name} S/o. Sh. {surety_parent} R/o {surety_address} hereby declare myself for the above said Sh. {accused_name} S/o {accused_parent} shall attend the appellate court every date in which any appeal filed against the Judgment & Order of acquittal, passed by this Hon’ble Court and in case making default therein I myself undertake to forfeit to the Govt. of India the sum of Rs. {surety_amount}."}, {"type": "editable_line", "field": "date_day", "style": {"size": 11}, "prefix": "Dated this", "suffix": "day of"}, {"type": "editable_line", "field": "date_month_year", "style": {"size": 11}, "prefix": "", "suffix": "201"}, {"type": "spacer", "height": 30}, {"type": "signature_block", "style": {"align": "center"}, "content": "Presented by:"}, {"type": "signature_block", "style": {"align": "right"}, "content": "Signature"}, {"type": "spacer", "height": 50}, {"type": "header", "style": {"bold": true, "size": 24, "align": "center", "italic": true}, "content": "AFFIDAVIT"}, {"type": "spacer", "height": 20}, {"type": "paragraph", "style": {"align": "justify", "line_height": 1.5}, "content": "I, {deponent_name} son / daughter / wife of {deponent_parent} Aged about {deponent_age} R/o {deponent_address} do hereby solemnly affirm and declare as under..."}, {"type": "paragraph", "style": {"align": "justify"}, "content": "1. That deponent is the resident of above said address and having his/her Ration Card no. is {ration_card} and Election Card No. {election_card}."}, {"type": "paragraph", "style": {"align": "justify"}, "content": "2. That accused is {accused_relation} of the deponent and deponent has full control over him/her and capable to produce him/her before this hon’ble court."}, {"type": "paragraph", "style": {"align": "justify"}, "content": "3. That deponent is working as {work_desc} at {work_place} T/C. No. {tc_number} earns Rs. {income_amt} per month."}, {"type": "paragraph", "style": {"align": "justify"}, "content": "4. That deponent is the owner of household articles valued about of Rs. {articles_value}."}, {"type": "paragraph", "style": {"align": "justify"}, "content": "5. That deponent is the owner of the immovable property bearing No. {property_no} Measuring {property_size} sq. yards situated at {property_loc} valued not less than Rs. {property_value}."}, {"type": "paragraph", "style": {"align": "justify"}, "content": "6. That deponent undertakes to produce the accused before the honourable court on every date of hearing."}, {"type": "paragraph", "style": {"align": "justify"}, "content": "7. That I have an F.D.R. No. {fdr_no} Issued by {fdr_bank} For Rs. {fdr_amount}."}, {"type": "paragraph", "style": {"align": "justify"}, "content": "8. That I own a vehicle No. {vehicle_no} make {vehicle_make} R/C no {vehicle_rc} at present valued not less than Rs. {vehicle_value}."}, {"type": "spacer", "height": 20}, {"type": "header", "style": {"bold": true, "align": "right"}, "content": "DEPONENT"}, {"type": "header", "style": {"bold": true, "align": "left"}, "content": "VERIFICATION"}, {"type": "paragraph", "style": {"align": "justify"}, "content": "Verified at Delhi on this {verify_day} day of 200{verify_year} that the contents of this Affidavit are true and correct to the best of my knowledge & nothing material has been concealed therefrom, no part of it is untrue."}, {"type": "spacer", "height": 20}, {"type": "header", "style": {"bold": true, "align": "right"}, "content": "DEPONENT"}], "page_size": "A4"}	{"ps_name": "case.police_station", "judge_name": "case.judge_name", "accused_name": "client.full_name", "accused_address": "client.address"}	t	2026-07-21 12:39:27.116553+05:30	2026-07-21 13:33:08.057439+05:30	\N	0
e50a1723-544a-4b2f-bac0-3ace2dfe8d03	Case Information Format	Main Case Information and Extra Party Information Form (2 Pages)	drafting	{"margins": {"top": 40, "left": 40, "right": 40, "bottom": 40}, "sections": [{"type": "header", "style": {"bold": true, "size": 16, "align": "center"}, "content": "CHECK LIST\\nCASE INFORMATION FORMAT"}, {"type": "grid_row", "style": {"align": "right"}, "columns": [{"flex": 1, "field": "is_civil", "prefix": "Civil _____"}, {"flex": 1, "field": "is_criminal", "prefix": "Criminal _____"}]}, {"type": "editable_line", "field": "district_name_ext", "style": {"bold": true}, "prefix": "DISTRICT"}, {"type": "header", "style": {"size": 10, "background": true}, "content": "S.NO. PLAINTIFF/PETITIONER/COMPLAINANT/APPELLANT/DECREE HOLDER ETC\\nPLEASE FILL UP ALL THE RELEVANT FIELDS & (*) FIELDS ARE MANDATORY"}, {"rows": [{"cells": [{"flex": 0.1, "text": "1."}, {"flex": 2, "field": "p_name", "label": "Name of the Plaintiff/complainant/etc"}]}, {"cells": [{"flex": 0.1, "text": "2."}, {"flex": 2, "field": "p_parent", "label": "S/o W/o D/o"}]}, {"cells": [{"flex": 0.1, "text": "3."}, {"flex": 2, "field": "p_address", "label": "Address"}]}, {"cells": [{"flex": 0.1, "text": "4."}, {"flex": 1, "field": "p_aadhar", "label": "Aadhar Card No."}, {"flex": 1, "field": "p_pincode", "label": "Pin Code"}]}, {"cells": [{"flex": 0.1, "text": "5."}, {"flex": 1, "text": "Male---Female---Other---", "field": "p_gender", "label": "Gender"}, {"flex": 1, "field": "p_nationality", "label": "Nationality"}]}, {"cells": [{"flex": 0.1, "text": "6."}, {"flex": 1, "field": "p_dob", "label": "Date of Birth"}, {"flex": 1, "field": "p_age", "label": "Age"}]}, {"cells": [{"flex": 0.1, "text": "7."}, {"flex": 1, "field": "p_mobile", "label": "Mobile No."}, {"flex": 1, "field": "p_email", "label": "E mail Id"}]}, {"cells": [{"flex": 0.1, "text": "9."}, {"flex": 2, "field": "p_act_section", "label": "Act/Section"}]}, {"cells": [{"flex": 0.1, "text": "10."}, {"flex": 1, "field": "suit_valuation", "label": "Valuation of Suit"}, {"flex": 1, "field": "fee_ascertained", "label": "Court Fee Ascertained"}]}, {"cells": [{"flex": 0.1, "text": ""}, {"flex": 2, "field": "fee_paid_deposited", "label": "Court Fee paid/Deposited"}]}, {"cells": [{"flex": 0.1, "text": "11."}, {"flex": 2, "field": "ps_name_info", "label": "Police Station"}]}, {"cells": [{"flex": 0.1, "text": "12."}, {"flex": 2, "field": "fir_no_year", "label": "F.I.R. NO. and Year"}]}], "type": "form_grid"}, {"type": "page_break"}, {"type": "header", "style": {"size": 10, "background": true}, "content": "S.NO. DEFENDANT/ACCUSED/RESPONDENT JUDGEMENT DEBATER ETC\\nPLEASE FILL UP ALL THE RELEVANT FIELDS & (*) FIELDS ARE MANDATORY"}, {"rows": [{"cells": [{"flex": 0.1, "text": "1."}, {"flex": 2, "field": "d_name", "label": "Name of the DEFENDANT/ACCUSED/etc"}]}, {"cells": [{"flex": 0.1, "text": "2."}, {"flex": 2, "field": "d_parent", "label": "S/o W/o D/o"}]}, {"cells": [{"flex": 0.1, "text": "3."}, {"flex": 2, "field": "d_address", "label": "Address"}]}, {"cells": [{"flex": 0.1, "text": "4."}, {"flex": 1, "field": "d_aadhar", "label": "Aadhar Card No."}, {"flex": 1, "field": "d_pincode", "label": "Pin Code"}]}, {"cells": [{"flex": 0.1, "text": "5."}, {"flex": 1, "text": "Male---Female---Other---", "field": "d_gender", "label": "Gender"}, {"flex": 1, "field": "d_nationality", "label": "Nationality"}]}, {"cells": [{"flex": 0.1, "text": "6."}, {"flex": 1, "field": "d_dob", "label": "Date of Birth"}, {"flex": 1, "field": "d_age", "label": "Age"}]}, {"cells": [{"flex": 0.1, "text": "7."}, {"flex": 1, "field": "d_mobile", "label": "Mobile No."}, {"flex": 1, "field": "d_email", "label": "E mail Id"}]}], "type": "form_grid"}, {"type": "header", "style": {"size": 10, "background": true}, "content": "S.NO. ADVOCATE FOR PLAINTIFF/ COMPLAINANT /PETITIONER /DECREE HOLDER ETC"}, {"rows": [{"cells": [{"flex": 0.1, "text": "1."}, {"flex": 1, "field": "adv_name_info", "label": "NAME OF THE ADVOCATER"}, {"flex": 1, "field": "adv_enroll", "label": "ENROLMENT NO."}]}, {"cells": [{"flex": 0.1, "text": "2."}, {"flex": 2, "field": "adv_office", "label": "OFFICE/ CHAMBER NO."}]}, {"cells": [{"flex": 0.1, "text": "3."}, {"flex": 1, "field": "adv_mobile_info", "label": "MOBILE NO."}, {"flex": 1, "field": "adv_email_info", "label": "E-mail:"}]}], "type": "form_grid"}, {"type": "spacer", "height": 20}, {"type": "editable_line", "field": "submitted_by_name", "prefix": "SUBMITTED BY:-"}, {"type": "paragraph", "style": {"bold": true, "size": 10, "align": "center"}, "content": "PLAINTIFF / PETITIONER / DEFENDANT / ACCUSED / OTHER / ADVOCATE"}, {"type": "spacer", "height": 40}, {"type": "page_break"}, {"type": "header", "style": {"bold": true, "size": 16, "align": "center"}, "content": "EXTRA PARTY INFORMATION"}, {"type": "spacer", "height": 20}, {"rows": [{"cells": [{"flex": 0.1, "text": "1."}, {"flex": 2, "field": "ep1_name", "label": "Name Of The Extra Party"}]}, {"cells": [{"flex": 0.1, "text": "2."}, {"flex": 2, "field": "ep1_parent", "label": "S/o W/o D/o"}]}, {"cells": [{"flex": 0.1, "text": "3."}, {"flex": 2, "field": "ep1_address", "label": "Address"}]}, {"cells": [{"flex": 0.1, "text": "4."}, {"flex": 1, "field": "ep1_aadhar", "label": "Aadhar Card No."}, {"flex": 1, "field": "ep1_pincode", "label": "Pin Code"}]}, {"cells": [{"flex": 0.1, "text": "5."}, {"flex": 1, "text": "Male [ ] Female [ ] Other [ ]", "field": "ep1_gender", "label": "Gender"}, {"flex": 1, "text": "INDIAN [ ] Other: ", "field": "ep1_nationality", "label": "Nationality"}]}, {"cells": [{"flex": 0.1, "text": "6."}, {"flex": 1, "field": "ep1_dob", "label": "Date of Birth", "placeholder": "/ /"}, {"flex": 1, "field": "ep1_age", "label": "Age"}]}, {"cells": [{"flex": 0.1, "text": "7."}, {"flex": 1, "field": "ep1_mobile", "label": "Mobile No."}, {"flex": 1, "field": "ep1_email", "label": "e-mail:"}]}], "type": "form_grid"}, {"type": "spacer", "height": 20}, {"rows": [{"cells": [{"flex": 0.1, "text": "1."}, {"flex": 2, "field": "ep2_name", "label": "Name Of The Extra Party"}]}, {"cells": [{"flex": 0.1, "text": "2."}, {"flex": 2, "field": "ep2_parent", "label": "S/o W/o D/o"}]}, {"cells": [{"flex": 0.1, "text": "3."}, {"flex": 2, "field": "ep2_address", "label": "Address"}]}, {"cells": [{"flex": 0.1, "text": "4."}, {"flex": 1, "field": "ep2_aadhar", "label": "Aadhar Card No."}, {"flex": 1, "field": "ep2_pincode", "label": "Pin Code"}]}, {"cells": [{"flex": 0.1, "text": "5."}, {"flex": 1, "text": "Male [ ] Female [ ] Other [ ]", "field": "ep2_gender", "label": "Gender"}, {"flex": 1, "text": "INDIAN [ ] Other: ", "field": "ep2_nationality", "label": "Nationality"}]}, {"cells": [{"flex": 0.1, "text": "6."}, {"flex": 1, "field": "ep2_dob", "label": "Date of Birth", "placeholder": "/ /"}, {"flex": 1, "field": "ep2_age", "label": "Age"}]}, {"cells": [{"flex": 0.1, "text": "7."}, {"flex": 1, "field": "ep2_mobile", "label": "Mobile No."}, {"flex": 1, "field": "ep2_email", "label": "e-mail:"}]}], "type": "form_grid"}, {"type": "spacer", "height": 20}, {"type": "editable_line", "field": "submitted_by_name_extra", "prefix": "SUBMITTED BY:-"}, {"type": "paragraph", "style": {"bold": true, "size": 10, "align": "center"}, "content": "PLAINTIFF / PETITIONER / DEFENDANT / ACCUSED / OTHER / ADVOCATE"}], "page_size": "A4"}	{"p_name": "client.full_name", "p_address": "client.address", "adv_name_info": "Counsel Name", "district_name_ext": "NEW DELHI"}	t	2026-07-21 12:39:27.120197+05:30	2026-07-21 13:33:08.060968+05:30	\N	0
80f8b3e8-d6a1-4957-8031-eb0df99b1e48	LIST OF DATES & EVENTS (Orissa High Court)	Appendix-II List of Dates and Events	drafting	{"margins": {"top": 72, "left": 72, "right": 72, "bottom": 72}, "sections": [{"type": "header", "style": {"bold": true, "size": 12, "align": "right"}, "content": "APPENDIX-II"}, {"type": "header", "style": {"bold": true, "size": 14, "align": "center", "underline": true}, "content": "LIST OF DATES & EVENTS"}, {"type": "spacer", "height": 30}, {"rows": 10, "type": "dynamic_table", "columns": [{"field": "date", "width": "25%", "header": "DATE"}, {"field": "events", "width": "75%", "header": "EVENTS"}]}, {"type": "spacer", "height": 40}, {"type": "signature_block", "style": {"align": "right"}, "content": "Advocate for the Petitioner"}], "page_size": "A4"}	{}	t	2026-07-21 12:39:27.042+05:30	2026-07-21 13:33:07.982501+05:30	\N	3
5eaeda97-b1c9-4c04-b2e4-1529faf050f2	Vakalatnama	Standard Power of Attorney (Vakalatnama) for Court Representation	drafting	{"margins": {"top": 72, "left": 72, "right": 72, "bottom": 72}, "sections": [{"type": "stamp_box"}, {"type": "editable_line", "field": "court_full_name", "style": {"bold": true}, "prefix": "IN THE COURT OF"}, {"type": "grid_row", "columns": [{"flex": 2.5, "field": "case_tracking_no", "prefix": "Suit /Appeal No./CWP"}, {"flex": 1, "field": "jurisdiction", "prefix": "JURISDICTION"}]}, {"type": "paragraph", "style": {"align": "right"}, "content": "of 202{year_suffix}"}, {"type": "paragraph", "style": {"bold": true}, "content": "In re:"}, {"type": "editable_line", "field": "plaintiff_names", "style": {"align": "justify"}, "prefix": "", "suffix": "Plaintiff /Appellants/ Petitioner/ Complainant"}, {"type": "spacer", "height": 20}, {"type": "header", "style": {"bold": true, "align": "center"}, "content": "V E R S U S"}, {"type": "spacer", "height": 20}, {"type": "editable_line", "field": "defendant_names", "style": {"align": "justify"}, "prefix": "", "suffix": "Defendant/Respondent/ Accused"}, {"type": "spacer", "height": 20}, {"type": "paragraph", "style": {"align": "justify", "line_height": 1.6}, "content": "KNOW ALL to whom these present shall come that I/We {litigant_names_full} the above named {litigant_role} do hereby appoint (herein after called the advocate/s) to be my/our Advocate in the above noted case authorized him :-"}, {"type": "paragraph", "style": {"size": 11, "align": "justify"}, "content": "To act, appear and plead in the above-noted case in this Court or in any other Court in which the same may be tried or heard and also in the appellate Court including High Court subject to payment of fees separately for each Court by me/ us."}, {"type": "paragraph", "style": {"size": 11, "align": "justify"}, "content": "To sign, file verify and present pleadings, appeals cross objections or petitions for execution review, revision, withdrawal, compromise or other petitions or affidavits or other documents as may be deemed necessary or proper for the prosecution of the said case in all its stages."}, {"type": "paragraph", "style": {"size": 11, "align": "justify"}, "content": "To file and take back documents to admit and/or deny the documents of opposite party."}, {"type": "paragraph", "style": {"size": 11, "align": "justify"}, "content": "To withdraw or compromise the said case or submit to arbitration any differences or disputes that may arise touching or in any manner relating to the said case."}, {"type": "paragraph", "style": {"size": 11, "align": "justify"}, "content": "To take execution proceedings."}, {"type": "paragraph", "style": {"size": 11, "align": "justify"}, "content": "The deposit, draw and receive money, cheques, cash and grant receipts thereof and to do all other acts and things which may be necessary to be done for the progress and in the course of the prosecution of the said case."}, {"type": "paragraph", "style": {"size": 11, "align": "justify"}, "content": "To appoint and instruct any other Legal Practitioner, authorizing him to exercise the power and authority hereby conferred upon the Advocate whenever he may think it to do so and to sign the Power of Attorney on our behalf."}, {"type": "paragraph", "style": {"size": 11, "align": "justify"}, "content": "And I/We the undersigned do hereby agree to ratify and confirm all acts done by the Advocate or his substitute in the matter as my/our own acts, as if done by me/us to all intents and purposes."}, {"type": "paragraph", "style": {"size": 11, "align": "justify"}, "content": "And I/We undertake that I / we or my /our duly authorized agent would appear in the Court on all hearings and will inform the Advocates for appearance when the case is called."}, {"type": "paragraph", "style": {"size": 11, "align": "justify"}, "content": "And I /we undersigned do hereby agree not to hold the advocate or his substitute responsible for the result of the said case. The adjournment costs whenever ordered by the Court shall be of the Advocate which he shall receive and retain himself."}, {"type": "paragraph", "style": {"size": 11, "align": "justify"}, "content": "And I /we the undersigned do hereby agree that in the event of the whole or part of the fee agreed by me/us to be paid to the Advocate remaining unpaid he shall be entitled to withdraw from the prosecution of the said case until the same is paid up. The fee settled is only for the above case and above Court. I/We hereby agree that once the fee is paid. I /we will not be entitled for the refund of the same in any case whatsoever. If the case lasts for more than three years, the advocate shall be entitled for additional fee equivalent to half of the agreed fee for every addition three years or part thereof."}, {"type": "spacer", "height": 20}, {"type": "paragraph", "style": {"align": "justify"}, "content": "IN WITNESS WHEREOF I/We do hereunto set my /our hand to these presents the contents of which have been understood by me/us on this {day_of_witness} day of {month_of_witness} 202{year_suffix}."}, {"type": "spacer", "height": 20}, {"type": "paragraph", "style": {"bold": true}, "content": "Accepted subject to the terms of fees."}, {"type": "spacer", "height": 50}, {"type": "page_break"}, {"type": "grid_row", "style": {"bold": true}, "columns": [{"flex": 1, "field": "advocate_signature", "prefix": "Advocate"}, {"flex": 1, "align": "center", "field": "client_signature_1", "prefix": "Client"}, {"flex": 1, "align": "right", "field": "client_signature_2", "prefix": "Client"}]}], "page_size": "A4"}	{"court_full_name": "case.court_name", "case_tracking_no": "case.case_number"}	t	2026-07-21 12:39:27.059144+05:30	2026-07-21 13:33:07.999147+05:30	\N	11
6efa097e-2699-4839-9a58-f7a64a9dd68f	Index Form	Index list for documents filed in court	drafting	{"margins": {"top": 72, "left": 72, "right": 72, "bottom": 72}, "sections": [{"type": "header", "style": {"bold": true, "size": 14, "align": "center"}, "content": "IN THE COURT OF {court_name}"}, {"type": "header", "style": {"bold": true, "size": 12, "align": "center", "underline": true}, "content": "INDEX"}, {"type": "spacer", "height": 20}, {"type": "paragraph", "style": {"bold": true}, "content": "Case: {case_title}\\nCase No: {case_number}"}, {"type": "spacer", "height": 20}, {"rows": 5, "type": "dynamic_table", "columns": [{"field": "sr_no", "width": "10%", "header": "Sr. No."}, {"field": "description", "width": "70%", "header": "Description of Documents"}, {"field": "pages", "width": "20%", "header": "Pages"}]}, {"type": "spacer", "height": 40}, {"type": "signature_block", "style": {"align": "right"}, "content": "Through Advocate"}], "page_size": "A4"}	{"court_name": "case.court_name", "case_number": "case.case_number"}	t	2026-07-21 12:39:27.069961+05:30	2026-07-21 13:33:08.01181+05:30	\N	2
ff7b3d75-dba5-4b85-b079-c75c447ad018	Litigant Form	Mobile-Email Details Collection Form for Litigants	drafting	{"margins": {"top": 72, "left": 72, "right": 72, "bottom": 72}, "sections": [{"type": "header", "style": {"bold": true, "size": 12, "align": "center", "underline": true}, "content": "Mobile-Email Details Collection Form for Litigants"}, {"type": "header", "style": {"size": 10, "align": "center"}, "content": "(Please use CAPITAL Letters Only)"}, {"type": "spacer", "height": 20}, {"rows": [{"cells": [{"flex": 1, "field": "court_complex", "label": "Court Complex"}]}, {"cells": [{"flex": 1, "field": "district_main", "label": "District"}]}, {"cells": [{"flex": 1, "label": "Litigants Name", "background": true}, {"flex": 1, "field": "surname"}, {"flex": 1, "field": "first_name"}, {"flex": 1, "field": "middle_name"}]}, {"cells": [{"flex": 1, "label": "", "background": true}, {"flex": 1, "text": "SURNAME"}, {"flex": 1, "text": "FIRST NAME"}, {"flex": 1, "text": "MIDDLE NAME"}]}, {"cells": [{"flex": 1, "label": "Date of Birth", "background": true}, {"flex": 1, "field": "dob_dd"}, {"flex": 1, "field": "dob_mm"}, {"flex": 1, "field": "dob_yyyy"}]}, {"cells": [{"flex": 1, "label": "", "background": true}, {"flex": 1, "text": "DD"}, {"flex": 1, "text": "MM"}, {"flex": 1, "text": "YYYY"}]}, {"cells": [{"flex": 1, "field": "address_line_1", "label": "Address"}]}, {"cells": [{"flex": 1, "field": "address_line_2", "label": ""}]}, {"cells": [{"flex": 1, "field": "address_line_3", "label": ""}]}, {"cells": [{"flex": 1, "field": "district_litigant", "label": "District"}]}, {"cells": [{"flex": 1, "field": "email_litigant", "label": "E-mail Address"}]}, {"cells": [{"flex": 1.5, "field": "mobile_no", "label": "Mobile No."}, {"flex": 1.5, "field": "phone_no", "label": "Phone No."}]}], "type": "form_grid"}, {"type": "spacer", "height": 50}, {"type": "grid_row", "columns": [{"flex": 1, "field": "date_val", "prefix": "Date :"}, {"flex": 0.5, "field": "month_val", "prefix": "/"}, {"flex": 0.5, "field": "year_val", "prefix": "/20"}, {"flex": 2, "align": "right", "field": "", "prefix": "Signature of Litigants"}]}, {"type": "spacer", "height": 40}, {"type": "paragraph", "style": {"align": "right"}, "content": "Signature of Advocate"}, {"type": "spacer", "height": 30}, {"type": "header", "style": {"align": "center"}, "content": "Verified by"}, {"type": "spacer", "height": 20}, {"type": "header", "style": {"align": "center"}, "content": "Asst.Supdt/Superintendent"}], "page_size": "A4"}	{"court_complex": "case.court_name", "district_main": "district_val"}	t	2026-07-21 12:39:27.087857+05:30	2026-07-21 13:33:08.028962+05:30	\N	0
2cb47ad3-04f0-4979-9c51-00a6c9fdc3df	Filing Form	Standard Civil Case Filing Form for Court Registrations	drafting	{"margins": {"top": 50, "left": 50, "right": 50, "bottom": 50}, "sections": [{"type": "header", "style": {"bold": true, "size": 12, "align": "center", "background": true}, "content": "DISTRICT & SESSIONS COURT {district_name}"}, {"type": "header", "style": {"bold": true, "size": 10, "align": "center", "background": true}, "content": "CIVIL CASE - FILING FORM"}, {"type": "grid_row", "style": {"border": true}, "columns": [{"flex": 1, "field": "case_type", "prefix": "Case Type"}]}, {"type": "header", "style": {"bold": true, "size": 10, "align": "center", "background": true}, "content": "PLAINTIFF DETAILS"}, {"cols": 25, "rows": 2, "type": "character_boxes", "field": "plaintiff_name", "label": "Name", "sublabel": "In Blocks"}, {"cols": 25, "rows": 2, "type": "character_boxes", "field": "plaintiff_parent", "label": "Father/Mother/Husband", "sublabel": "Strike out which is not applicable"}, {"cols": 25, "rows": 3, "type": "character_boxes", "field": "plaintiff_address", "label": "Address", "sublabel": "In Blocks"}, {"type": "grid_row", "columns": [{"flex": 0.5, "field": "plaintiff_sex_marker", "prefix": "Sex (? Appropriate)"}, {"flex": 0.3, "field": "is_male", "prefix": "Male"}, {"flex": 0.3, "field": "is_female", "prefix": "Female"}, {"flex": 0.5, "field": "plaintiff_age", "prefix": "Age (in Completed Years)"}, {"flex": 1, "field": "plaintiff_caste", "prefix": "Caste"}]}, {"type": "grid_row", "columns": [{"flex": 1, "field": "plaintiff_nationality", "prefix": "Nationality"}, {"flex": 1, "field": "is_indian", "prefix": "If Indian (?)"}, {"flex": 1, "field": "other_nationality", "prefix": "If Other Mention"}, {"flex": 1, "field": "plaintiff_occupation", "prefix": "Occupation"}]}, {"type": "grid_row", "columns": [{"flex": 1.5, "field": "plaintiff_email", "prefix": "E-mail address"}, {"flex": 1, "field": "plaintiff_phone", "prefix": "Phone"}, {"flex": 1, "field": "plaintiff_mobile", "prefix": "Mobile"}, {"flex": 1, "field": "plaintiff_fax", "prefix": "Fax"}]}, {"type": "grid_row", "columns": [{"flex": 1, "field": "case_subject", "prefix": "Subject"}]}, {"type": "grid_row", "columns": [{"flex": 1, "field": "advocate_code", "prefix": "Advocate Code"}, {"flex": 3, "field": "advocate_name", "prefix": "Advocate"}]}, {"type": "header", "style": {"bold": true, "size": 10, "align": "center", "background": true}, "content": "RESPONDENT DETAILS"}, {"cols": 25, "rows": 2, "type": "character_boxes", "field": "respondent_name", "label": "Name", "sublabel": "In Blocks"}, {"cols": 25, "rows": 2, "type": "character_boxes", "field": "respondent_parent", "label": "Father/Mother/Husband", "sublabel": "Strike out which is not applicable"}, {"cols": 25, "rows": 3, "type": "character_boxes", "field": "respondent_address", "label": "Address", "sublabel": "In Blocks"}, {"type": "grid_row", "columns": [{"flex": 0.5, "field": "resp_sex_marker", "prefix": "Sex (? Appropriate)"}, {"flex": 0.3, "field": "resp_is_male", "prefix": "Male"}, {"flex": 0.3, "field": "resp_is_female", "prefix": "Female"}, {"flex": 0.5, "field": "resp_age", "prefix": "Age (in Completed Years)"}, {"flex": 1, "field": "resp_caste", "prefix": "Caste"}]}, {"type": "header", "style": {"bold": true, "size": 10, "align": "center", "background": true}, "content": "LOWER COURT DETAILS"}, {"type": "grid_row", "columns": [{"flex": 1, "field": "lower_court_name", "prefix": "Court Name"}]}, {"type": "grid_row", "columns": [{"flex": 1, "field": "lower_case_no", "prefix": "Case No."}, {"flex": 1, "field": "decision_date", "prefix": "Decision Date"}]}, {"type": "header", "style": {"bold": true, "size": 10, "align": "center", "background": true}, "content": "MAIN MATTER DETAILS"}, {"type": "grid_row", "columns": [{"flex": 1, "field": "case_type_main", "prefix": "Case Type"}, {"flex": 1, "field": "case_no_main", "prefix": "Case No."}, {"flex": 1, "field": "case_year_main", "prefix": "Year"}]}, {"type": "header", "style": {"bold": true, "size": 10, "align": "center"}, "content": "------------- FOR OFFICE USE ONLY -------------"}, {"type": "grid_row", "columns": [{"flex": 1, "field": "office_case_type", "prefix": "Case Type"}, {"flex": 1, "field": "filing_no", "prefix": "Filing No"}, {"flex": 1, "field": "filing_date_office", "prefix": "Filing Date"}]}, {"type": "grid_row", "columns": [{"flex": 1, "field": "objection_date", "prefix": "Objection Red. Date"}, {"flex": 1, "field": "compliance_date", "prefix": "Objection Compliance Date"}]}, {"type": "grid_row", "columns": [{"flex": 1, "field": "reg_no", "prefix": "Registration No"}, {"flex": 1, "field": "reg_date", "prefix": "Registration Date"}, {"flex": 1, "field": "listing_date", "prefix": "Listing Date"}]}, {"type": "grid_row", "columns": [{"flex": 1.5, "field": "court_allotted", "prefix": "Court Allotted"}, {"flex": 1, "field": "allocation_date", "prefix": "Allocation Date"}]}, {"cols": 25, "rows": 1, "type": "character_boxes", "field": "case_code", "label": "Case Code"}], "page_size": "A4"}	{"advocate_name": "Counsel Name", "district_name": "NEW DELHI"}	t	2026-07-21 12:39:27.091327+05:30	2026-07-21 13:33:08.032447+05:30	\N	0
c8d1b871-4269-4ca5-9f98-7735e9da3cfa	Surety Bond	Standard Surety Bond for Court Guarantee	drafting	{"margins": {"top": 72, "left": 72, "right": 72, "bottom": 72}, "sections": [{"type": "header", "style": {"bold": true, "align": "center"}, "content": "SURETY BOND."}, {"type": "spacer", "height": 40}, {"type": "editable_line", "field": "surety_name_ro", "style": {"size": 11}, "prefix": "I,"}, {"type": "paragraph", "style": {"size": 11, "align": "justify", "line_height": 2.5}, "content": "_____________________________________________ hereby declare myself or (we jointly and severally declare ourselves and such of us ) surety / or (sureties) for the above said name _________________________________________ R/o _________________________________ that he shall attend the _______________________________________Court for the purpose of on every day on which any Investigation, officer or Court for the purpose of such investigation, or to answer the charge against him ( as the case may be and in case of his making default therein) I hereby bind my self (we hereby bind ourselves)"}, {"type": "spacer", "height": 40}, {"type": "editable_line", "field": "bond_amount", "style": {"size": 11}, "prefix": "To forfeit to the Government the sum of Rs."}, {"type": "editable_line", "field": "bond_amount_words", "style": {"size": 11}, "prefix": "(in words)"}, {"type": "spacer", "height": 30}, {"type": "grid_row", "columns": [{"flex": 1, "field": "dated_day", "prefix": "Dated this"}, {"flex": 1, "field": "dated_month", "prefix": "day of"}, {"flex": 0.5, "field": "dated_year", "prefix": "202"}]}, {"type": "spacer", "height": 60}, {"type": "paragraph", "style": {"align": "right"}, "content": "(Signature of the surety.)"}], "page_size": "A4"}	{"case_number": "case.case_number", "accused_name": "client.full_name"}	t	2026-07-21 12:39:27.080648+05:30	2026-07-21 13:33:08.022105+05:30	\N	55
08a42859-e417-4ee5-b435-bf3dc20a5080	E-Court Fee Form	SHCIL e-Court fee Receipt Application Form and Receipt	drafting	{"margins": {"top": 30, "left": 30, "right": 30, "bottom": 30}, "sections": [{"type": "header", "style": {"bold": true, "size": 18, "align": "center"}, "content": "Stock Holding Corporation of India Limited"}, {"type": "paragraph", "style": {"size": 9, "align": "center"}, "content": "Registered office : 301, Centre Point, Dr. Babasaheb Ambedkar Road, Parel, Mumbai – 400012\\nVisit us at : www.shcilestamp.com"}, {"type": "header", "style": {"bold": true, "size": 20, "align": "center"}, "content": "e-Court fee Receipt Application Form"}, {"type": "grid_row", "style": {"background": true}, "columns": [{"flex": 1, "field": "", "prefix": "SHCIL e-Court fee"}, {"flex": 1, "align": "right", "field": "", "prefix": "(To be filled in CAPITAL letter by the client)"}]}, {"rows": [{"cells": [{"flex": 2.5, "field": "litigant_name", "label": "Name of the Litigant (s)"}, {"flex": 1, "field": "phone_no", "label": "Phone No"}, {"flex": 1, "field": "mobile_no", "label": "Mobile"}]}, {"cells": [{"flex": 1.5, "field": "fee_amount", "label": "eCourt fee Amount", "placeholder": "₹"}, {"flex": 2, "text": "[ ] Cash [ ] Cheque [ ] DD [ ] Pay-Order [ ] NEFT\\n[ ] RTGS [ ] Account to Account Transfer", "label": "Type of Payment"}]}, {"cells": [{"flex": 3, "field": "payment_details", "label": "Details of Cash/ Cheque/ DD/ PO/ RTGS/NEFT/Funds Transfer Account No."}, {"flex": 1, "field": "payment_date", "label": "Date:", "placeholder": "/ / 20"}]}, {"cells": [{"flex": 1.5, "field": "bank_name", "label": "Bank Name"}, {"flex": 1.5, "field": "branch_name", "label": "Branch Name"}]}, {"cells": [{"flex": 3, "field": "applicant_sig", "label": "Signature of the applicant"}]}], "type": "form_grid"}, {"type": "spacer", "height": 30}, {"type": "paragraph", "style": {"align": "center"}, "content": "-------------------------------------------✂-------------------------------------------✂-------------------------------------------"}, {"type": "spacer", "height": 15}, {"type": "grid_row", "style": {"background": true}, "columns": [{"flex": 1, "field": "", "prefix": "SHCIL e-Court fee"}, {"flex": 1, "align": "center", "field": "", "prefix": "Receipt"}, {"flex": 1, "align": "right", "field": "", "prefix": "(To be filled in CAPITAL letter by the client)"}]}, {"rows": [{"cells": [{"flex": 2.5, "field": "litigant_name_receipt", "label": "Name of the Litigant (s)"}, {"flex": 1, "field": "phone_no_receipt", "label": "Phone No"}, {"flex": 1, "field": "mobile_no_receipt", "label": "Mobile"}]}, {"cells": [{"flex": 1.5, "field": "fee_amount_receipt", "label": "eCourt fee Amount", "placeholder": "₹"}, {"flex": 2, "text": "[ ] Cash [ ] Cheque [ ] DD [ ] Pay-Order [ ] NEFT\\n[ ] RTGS [ ] Account to Account Transfer", "label": "Type of Payment"}]}, {"cells": [{"flex": 3, "field": "payment_details_receipt", "label": "Details of Cash/ Cheque/ DD/ PO/ RTGS/NEFT/Funds Transfer Account No."}, {"flex": 1, "field": "payment_date_receipt", "label": "Date:", "placeholder": "/ / 20"}]}, {"cells": [{"flex": 1.5, "field": "bank_name_receipt", "label": "Bank Name"}, {"flex": 1.5, "field": "branch_name_receipt", "label": "Branch Name"}]}, {"cells": [{"flex": 3, "field": "shcil_sig", "label": "Signature & Seal of SHCIL"}]}], "type": "form_grid"}, {"type": "spacer", "height": 15}, {"type": "paragraph", "style": {"bold": true, "align": "center"}, "content": "This original receipt has to be produced and surrenderd to collect the eCourt fee receipt"}], "page_size": "A4"}	{"mobile_no": "client.phone_number", "litigant_name": "client.full_name", "mobile_no_receipt": "client.phone_number", "litigant_name_receipt": "client.full_name"}	t	2026-07-21 12:39:27.112913+05:30	2026-07-21 13:33:08.053737+05:30	\N	0
202b55f1-ac8b-4a89-a8e3-e1957521ca27	NI Act Check List	Check List for Sec 138 NI Act Matters	drafting	{"margins": {"top": 50, "left": 50, "right": 50, "bottom": 50}, "sections": [{"type": "header", "style": {"bold": true, "size": 18, "align": "center"}, "content": "CHECK LIST"}, {"type": "spacer", "height": 20}, {"rows": [{"cells": [{"flex": 0.2, "text": "1."}, {"flex": 2, "field": "case_details_ni", "label": "Details of the case whether 138 N.I. Act, complaint case etc."}]}, {"cells": [{"flex": 0.2, "text": "2."}, {"flex": 2, "field": "cheque_amount", "label": "Total Cheque(s) Amount Only in 138 Cases.", "placeholder": "Rs."}]}, {"cells": [{"flex": 0.2, "text": "3."}, {"flex": 2, "field": "bounce_area", "label": "Area of bounce cheque (s)"}]}, {"cells": [{"flex": 0.2, "text": "4."}, {"flex": 2, "field": "complaint_details", "label": "Name\\nAddress of the complaint,\\n\\nAge :\\n(Whether Sr. Citizen)\\nGender\\nContact No."}, {"flex": 1, "text": "Male/Female", "field": "complaint_gender"}]}, {"cells": [{"flex": 0.2, "text": "5."}, {"flex": 2, "field": "accused_details_ni", "label": "Name\\nAddress of the complaint,\\n\\nAge :\\n(Whether Sr. Citizen)\\nGender\\nContact No."}, {"flex": 1, "text": "Male/Female", "field": "accused_gender_ni"}]}, {"cells": [{"flex": 0.2, "text": "5-a."}, {"flex": 2, "field": "accused_details_5a", "label": "Name\\nAddress of the complaint,\\n\\nAge :\\n(Whether Sr. Citizen)\\nGender\\nContact No."}, {"flex": 1, "text": "Male/Female", "field": "accused_gender_5a"}]}, {"cells": [{"flex": 0.2, "text": "5-b."}, {"flex": 2, "field": "accused_details_5b", "label": "Name\\nAddress of the complaint,\\n\\nAge :\\n(Whether Sr. Citizen)\\nGender\\nContact No."}, {"flex": 1, "text": "Male/Female", "field": "accused_gender_5b"}]}, {"cells": [{"flex": 0.2, "text": "6."}, {"flex": 2, "field": "ps_name_ni", "label": "Name of Police Station"}]}, {"cells": [{"flex": 0.2, "text": "7."}, {"flex": 2, "field": "other_info_ni", "label": "Any other information with respect to present case."}]}], "type": "form_grid"}], "page_size": "A4"}	{"complaint_details": "client.full_name"}	t	2026-07-21 12:39:27.109332+05:30	2026-07-21 13:33:08.050353+05:30	\N	0
74b87810-051a-44d0-aa08-1944e177d7c8	Commercial Court Mediation Forms	Schedule I Forms 1-6 for Pre-Institution Mediation (5 Pages)	drafting	{"margins": {"top": 50, "left": 50, "right": 50, "bottom": 50}, "sections": [{"type": "header", "style": {"bold": true, "align": "center"}, "content": "SCHEDULE I\\nFORM 1: MEDIATION APPLICATION FORM"}, {"type": "paragraph", "style": {"align": "center"}, "content": "[See rule 3(1)]\\nName of the Authority and address"}, {"type": "spacer", "height": 20}, {"type": "header", "style": {"bold": true, "align": "left"}, "content": "DETAILS OF PARTIES:"}, {"type": "paragraph", "style": {"line_height": 1.6}, "content": "1. Name of applicant : {applicant_name}\\n2. Address and contact details of applicant:\\n   Address:- {applicant_address}\\n   Telephone No. {app_tel} Mobile {app_mob} E-mail ID: {app_email}"}, {"type": "paragraph", "style": {"line_height": 1.6}, "content": "3. Name of opposite party: {op_name}\\n4. Address and contact details of opposite party:\\n   Address:- {op_address}\\n   Telephone No. {op_tel} Mobile {op_mob} E-mail ID: {op_email}"}, {"type": "header", "style": {"bold": true, "align": "left"}, "content": "DETAILS OF DISPUTE:"}, {"type": "paragraph", "style": {"line_height": 1.5}, "content": "1. Nature of dispute as per section 2(1)(c) of the Commercial Courts Act 2015 (4 of 2016):\\n   {dispute_nature}\\n2. Quantum of Claim: {quantum_claim}\\n3. Territorial jurisdiction of the competent Court: {jurisdiction}\\n4. Brief synopsis of commercial dispute (not to exceed 5000 words):\\n   {synopsis}\\n5. Additional points of relevance:\\n   {additional_points}"}, {"type": "header", "style": {"bold": true, "align": "left"}, "content": "DETAILS OF FEE PAID:"}, {"type": "paragraph", "style": {"line_height": 1.6}, "content": "Fee paid by DD No.{dd_no} dated {dd_date} Name of Bank and branch {bank_branch} Online transaction No.{tx_no} dated {tx_date}"}, {"type": "spacer", "height": 20}, {"type": "paragraph", "style": {"bold": true}, "content": "Date: {current_date}\\n\\nNote.- Form shall be submitted to the Authority with a fee of one thousand rupees."}, {"type": "spacer", "height": 20}, {"rows": [{"cells": [{"flex": 1, "field": "office_use_notes", "label": "For Office Use:\\nForm received on :\\nFile No. allotted:\\nMode of sending notice to the opposite party:\\nNotice to opposite party sent on:\\nWhether Notice acknowledged by opposite party or not:\\nDate of Non-starter report/Assignment of commercial dispute to Mediator:"}]}], "type": "form_grid"}, {"type": "spacer", "height": 50}, {"type": "header", "style": {"bold": true, "align": "center"}, "content": "FORM 2: NOTICE/FINAL NOTICE TO THE OPPOSITE PARTY FOR PRE-INSTITUTION MEDIATION"}, {"type": "paragraph", "style": {"align": "center"}, "content": "[See rule 3(2) and rule 3(3)]\\nName of the Authority and address."}, {"type": "paragraph", "style": {"align": "justify", "line_height": 1.5}, "content": "1. Whereas a commercial dispute has been submitted to {authority_name} by {applicant_name} against {op_name} requesting for pre-institution mediation in terms of section 12-A of Chapter III-A of Commercial Courts Act, 2015. A copy of the mediation application Form is attached herewith."}, {"type": "paragraph", "style": {"align": "justify", "line_height": 1.5}, "content": "2. The opposite party is here but directed to appear in person or through his duly authorized representative or Counsel on {appearance_date} (Date) {appearance_time} (Time) at the {appearance_place} and convey his consent to participate in mediation process."}, {"type": "paragraph", "style": {"align": "justify"}, "content": "3. Failure to appear before the Authority by opposite party would be deemed as his refusal to participate in mediation process initiated by the applicant."}, {"type": "paragraph", "style": {"align": "justify"}, "content": "4. In case, the date and time mentioned in para 2 i sought to be rescheduled the same can be done by the opposite party either on its own or through its authorized representative or counsel by making a request in writing at-least two days prior to the scheduled date of appearance."}, {"type": "spacer", "height": 30}, {"type": "grid_row", "columns": [{"flex": 1, "field": "current_date", "prefix": "Authority address\\n\\nDate:"}, {"flex": 1, "align": "right", "field": "", "prefix": "Signature of the Authority"}]}, {"type": "spacer", "height": 50}, {"type": "header", "style": {"bold": true, "align": "center"}, "content": "FORM 3 : NON-STARTER REPORT"}, {"type": "paragraph", "style": {"align": "center"}, "content": "[See Rule 3 (4) and (6)]\\nName of the Authority and address"}, {"type": "paragraph", "style": {"line_height": 1.8}, "content": "1. Name of the applicant : {applicant_name}\\n2. Date of application for Pre-Institution mediation : {app_date}\\n3. Name of the opposite party : {op_name}\\n4. Date scheduled for appearance of opposite party : {appearance_date}\\n5. Report made under rule 3(4) or 3(6) : {report_under_rule}\\n6. Non-Starter Report reason :\\n   {non_starter_reason}"}, {"type": "spacer", "height": 30}, {"type": "grid_row", "columns": [{"flex": 1, "field": "current_date", "prefix": "Date :"}, {"flex": 1, "align": "right", "field": "", "prefix": "Signature of the Authority"}]}, {"type": "paragraph", "style": {"bold": true}, "content": "Copy to :\\n   Applicant.\\n   Opposite Party."}, {"type": "spacer", "height": 50}, {"type": "header", "style": {"bold": true, "align": "center"}, "content": "FORM 4 : SETTLEMENT"}, {"type": "paragraph", "style": {"align": "center"}, "content": "[See rule 7(1)(vii)]\\nName of the Authority and address"}, {"type": "paragraph", "style": {"line_height": 1.8}, "content": "1. Name of the Mediator : {mediator_name}\\n2. Name of the applicant : {applicant_name}\\n3. Name of the opposite party : {op_name}\\n4. Date of application for Pre-Institution mediation : {app_date}\\n5. Venue of mediation : {venue}\\n6. Date(s) of mediation : {mediation_dates}\\n7. No. of sittings and duration of sittings : {sittings_details}\\n8. Terms of settlement :\\n   {settlement_terms}"}, {"type": "spacer", "height": 30}, {"type": "grid_row", "columns": [{"flex": 1, "field": "", "prefix": "Date :\\nSignature of Opposite Party"}, {"flex": 1, "align": "center", "field": "", "prefix": "\\nSignature of Applicant"}, {"flex": 1, "align": "right", "field": "", "prefix": "\\nSignature of Mediator"}]}, {"type": "spacer", "height": 50}, {"type": "header", "style": {"bold": true, "align": "center"}, "content": "FORM: FAILURE REPORT"}, {"type": "paragraph", "style": {"align": "center"}, "content": "[See rule 7(1)(ix)]\\nName of the Authority and address"}, {"type": "paragraph", "style": {"line_height": 1.8}, "content": "1. Name of the Mediator : {mediator_name}\\n2. Name of the applicant : {applicant_name}\\n3. Name of the opposite party : {op_name}\\n4. Date of application for Pre-Institution mediation : {app_date}\\n5. Venue of mediation : {venue}\\n6. Date(s) of mediation : {mediation_dates}\\n7. No. of sitting and duration of sittings : {sittings_details}\\n8. Reasons for failure :\\n   {failure_reasons}"}, {"type": "spacer", "height": 20}, {"type": "paragraph", "style": {"bold": true}, "content": "Date :"}, {"type": "grid_row", "columns": [{"flex": 1, "field": "", "prefix": "Signature of Applicant"}, {"flex": 1, "align": "right", "field": "", "prefix": "Signature of Opposite Party"}]}, {"type": "signature_block", "style": {"align": "center"}, "content": "Signature of Mediator"}, {"type": "spacer", "height": 30}, {"type": "header", "style": {"bold": true, "align": "center"}, "content": "Form 6 : MEDIATION DATA\\n[See Rule 10(2)]"}, {"type": "dynamic_table", "fields": ["sr", "auth", "app_type", "op_type", "slabs", "disposed", "referred", "fail", "success"], "headers": [{"flex": 0.5, "text": "Sr. No"}, {"flex": 1.2, "text": "Name of the Authority"}, {"flex": 1.5, "text": "Name of Applicant Party\\n(Indiv / Corp)"}, {"flex": 1.5, "text": "Nature of Opposite Party\\n(Indiv / Corp)"}, {"flex": 2, "text": "No. of application slab-wise\\n(I to V)"}, {"flex": 1, "text": "No. of app disposed Rule 3(4)/3(6)"}, {"flex": 0.8, "text": "No. refer mediation"}, {"flex": 1, "text": "No. settlement not arrived"}, {"flex": 1, "text": "No. settlement reached"}], "row_count": 3}, {"type": "spacer", "height": 50}, {"type": "header", "style": {"bold": true, "align": "center"}, "content": "*SCHEDULE II\\nMEDIATION FEE\\n[See rule 11]"}, {"rows": [["1.", "From Rs. 3,00,000 to Rs. 10,00,000.", "Rs. 15,000"], ["2.", "Above Rs. 10,00,000 and upto to Rs. 50,00,000.", "Rs. 30,000"], ["3.", "Above Rs. 50,00,000 and upto to Rs. 1,00,00,000.", "Rs. 40,000"], ["4.", "Above Rs. 1,00,00,000 and upto to Rs. 3,00,00,000.", "Rs. 50,000"], ["5.", "Above Rs. 3,00,00,000.", "Rs. 75,000"]], "type": "dynamic_table", "style": {"bold_header": true}, "headers": [{"flex": 0.5, "text": "Sr. No."}, {"flex": 2, "text": "QUANTUM OF CLAIM"}, {"flex": 1.5, "text": "MEDIATION FEE PAYABLE TO AUTHORITY (IN INR)"}]}, {"type": "spacer", "height": 80}, {"type": "header", "style": {"bold": true, "align": "center"}, "content": "THE COMMERCIAL COURTS (STATISTICAL DATA)\\nRules, 2018*"}, {"type": "paragraph", "style": {"align": "justify"}, "content": "In exercise of the powers conferred by sub-section (1) of section 21-A of the Commercial Courts Act, 20154 and in pursuance of section 17 of the said Act, the Central Government hereby makes the following rules, namely:-"}, {"type": "paragraph", "style": {"align": "justify", "line_height": 1.4}, "content": "1. Short title and commencement. (1) These rules may be called The Commercial Courts (Statistical Data) Rules, 2018.\\n(2) They shall come into force on the date of their publication in the Official Gazette.\\n\\n2. definitions. - (1) In these rules unless the context otherwise requires, -\\n(a) \\"Act\\" means the Commercial Courts Act, 2015 (4 of 2016);\\n(b) \\"Schedule\\" means the Schedule appended to these rules.\\n(c) The words and expressions used and not defined in these rules but defined in the Act, Shall have the same meanings as respectively assigned to them in that Act."}, {"type": "paragraph", "style": {"bold": true, "align": "justify"}, "content": "3. Collection and disclosure of data by Commercial Courts, Commercial Appellate Courts, Commercial Divisions and Commercial Appellate Divisions of High Courts. - The statistical data, as required by section 17 of the Act, regarding the number of suits, applications, appeals or writ petitions filed before the Commercial Courts, Commercial Appellate Courts, Commercial Division or Commercial Appellate Division, as the case may be, the pendency of such cases, the status of each case, and the number of cases disposed off, shall be maintained, updated and published by the tenth day of every month in the form specified in Schedule appended to these rules, by the concerned High Courts on their website."}, {"type": "spacer", "height": 30}, {"type": "header", "style": {"bold": true, "size": 14, "align": "center"}, "content": "SCHEDULE\\nFORMAT FOR STATISTICAL DATA\\n[See rule 3]"}, {"type": "dynamic_table", "fields": ["sr_stat", "court_name_stat", "pending_start", "instituted", "pending_end", "disposed_stat", "avg_days"], "headers": [{"flex": 0.4, "text": "Sr. No"}, {"flex": 1, "text": "Name of the Court"}, {"flex": 1.2, "text": "No. of case pending (on the 1st day of month)"}, {"flex": 1.2, "text": "No. of new cases instituted (during the month)"}, {"flex": 1.2, "text": "Total Cases pending in Court (on last day)"}, {"flex": 1, "text": "No. of cases disposed (during the month)"}, {"flex": 1, "text": "Average no. of days taken to decide"}], "row_count": 3}, {"type": "spacer", "height": 30}, {"type": "paragraph", "style": {"size": 10, "italic": true}, "content": "*Vide G.S.R. 607(E), dated 3-7-2018, published in the Gazette of India, Ext., Pt. II, S. 3(i), dated 3-7-2018."}], "page_size": "A4"}	{"op_name": "case.opposing_counsel", "applicant_name": "client.full_name", "authority_name": "DISTRICT LEGAL SERVICES AUTHORITY", "applicant_address": "client.address"}	t	2026-07-21 12:39:27.127618+05:30	2026-07-21 13:33:08.068421+05:30	\N	0
ae9fd123-b46b-4725-b060-e1eadda4f26b	BLANK A4 DRAFTING PAPER	A blank A4 sheet for custom drafting from scratch	drafting	{"margins": {"top": 72, "left": 72, "right": 72, "bottom": 72}, "sections": [{"type": "header", "style": {"bold": true, "size": 14, "align": "center", "underline": true}, "content": "{document_title}"}, {"type": "spacer", "height": 40}, {"type": "textarea", "field": "document_content", "style": {"size": 13, "align": "justify", "line_height": 1.8}, "placeholder": "Start typing your document here..."}, {"type": "spacer", "height": 500}], "page_size": "A4"}	{}	t	2026-07-21 12:39:27.033505+05:30	2026-07-21 13:33:07.973871+05:30	\N	10
e21aef0c-ec57-4e85-8f4a-98dfe23f3db4	SYNOPSIS (Orissa High Court)	Appendix-I Synopsis for Criminal Miscellaneous documents	drafting	{"margins": {"top": 72, "left": 72, "right": 72, "bottom": 72}, "sections": [{"type": "header", "style": {"bold": false, "size": 12, "align": "right"}, "content": "[A]"}, {"type": "spacer", "height": 20}, {"type": "header", "style": {"bold": true, "size": 12, "align": "left", "underline": true}, "content": "APPENDIX-I"}, {"type": "spacer", "height": 20}, {"type": "header", "style": {"bold": true, "size": 14, "align": "center", "underline": true}, "content": "S Y N O P S I S"}, {"type": "spacer", "height": 40}, {"type": "paragraph", "style": {"size": 13, "align": "justify", "line_height": 1.8}, "content": "       The petitioner has file the above anticipatory bail application as he has been falsely implicated and due to apprehending his arrest in connection with {police_station} P.S. Case No.{fir_number} of {year} corresponding to {gr_number} of {year} pending before the court of learned {lower_court_name}, {place}."}, {"type": "spacer", "height": 60}, {"type": "grid_row", "style": {"bold": false, "size": 10}, "columns": [{"flex": 1, "field": "place", "prefix": "PLACE:"}, {"flex": 1, "field": "date", "prefix": "DATE:"}]}, {"type": "spacer", "height": 30}, {"type": "grid_row", "style": {"bold": false, "size": 10}, "columns": [{"flex": 1}, {"flex": 2, "align": "center", "field": "advocate_name", "prefix": "Advocate Name:"}]}, {"type": "grid_row", "style": {"bold": false, "size": 10}, "columns": [{"flex": 1}, {"flex": 2, "align": "center", "field": "enrollment_number", "prefix": "En. No.:"}]}, {"type": "grid_row", "style": {"bold": false, "size": 10}, "columns": [{"flex": 1}, {"flex": 2, "align": "center", "field": "phone_number", "prefix": "Ph. No.:"}]}, {"type": "grid_row", "style": {"bold": false, "size": 10}, "columns": [{"flex": 1}, {"flex": 2, "align": "center", "field": "advocate_designation", "prefix": "Designation:"}]}], "page_size": "A4"}	{"year": "case.year", "gr_number": "case.gr_number", "fir_number": "case.fir_number", "police_station": "case.police_station", "lower_court_name": "case.court_name"}	t	2026-07-21 12:39:27.038455+05:30	2026-07-21 13:33:07.979092+05:30	\N	2
ea68e2e0-6559-469b-9d02-79a390436ea6	INDEX (Orissa High Court)	Document Index for Orissa High Court filing (Criminal Miscellaneous)	drafting	{"margins": {"top": 72, "left": 72, "right": 72, "bottom": 72}, "sections": [{"type": "header", "style": {"bold": true, "size": 14, "align": "center"}, "content": "IN THE HIGH COURT OF ORISSA, CUTTACK"}, {"type": "header", "style": {"size": 12, "align": "center"}, "content": "(Criminal Miscellaneous Jurisdiction)"}, {"type": "spacer", "height": 20}, {"type": "grid_row", "style": {"bold": true}, "columns": [{"flex": 2, "field": "ablapl_no", "prefix": "ABLAPL NO."}, {"flex": 1, "field": "year_suffix", "prefix": "OF 202"}]}, {"type": "header", "style": {"bold": true, "size": 11, "align": "right", "underline": true}, "content": "CODE NO.091002."}, {"type": "spacer", "height": 20}, {"type": "grid_row", "style": {"bold": true}, "columns": [{"flex": 3, "field": "petitioner_name", "prefix": ""}, {"flex": 1, "field": "", "prefix": "...Petitioner"}]}, {"type": "header", "style": {"bold": true, "align": "center"}, "content": "-Versus-"}, {"type": "grid_row", "style": {"bold": true}, "columns": [{"flex": 3, "field": "opposite_party", "prefix": "{opposite_party}"}, {"flex": 1, "field": "", "prefix": ".....Opp. Party"}]}, {"type": "spacer", "height": 20}, {"type": "header", "style": {"bold": true, "size": 14, "align": "center", "underline": true}, "content": "I N D E X"}, {"rows": 8, "type": "dynamic_table", "columns": [{"field": "sl_no", "width": "10%", "header": "SL. NO."}, {"field": "desc", "width": "70%", "header": "DESCRIPTION OF DOCUMENTS"}, {"field": "page", "width": "20%", "header": "PAGE"}], "row_height": 50}, {"type": "spacer", "height": 40}, {"type": "grid_row", "style": {"bold": true, "size": 11}, "columns": [{"flex": 1, "field": "place", "prefix": "PLACE:"}, {"flex": 1, "align": "center", "field": "advocate_name", "prefix": "Advocate Name:"}]}, {"type": "grid_row", "style": {"bold": true, "size": 11}, "columns": [{"flex": 1, "field": "date", "prefix": "DATE:"}, {"flex": 1, "align": "center", "field": "enrollment_number", "prefix": "En.No.:"}]}, {"type": "grid_row", "style": {"bold": true, "size": 11}, "columns": [{"flex": 1}, {"flex": 1, "align": "center", "field": "phone_number", "prefix": "Ph.No.:"}]}, {"type": "grid_row", "style": {"bold": true, "size": 11}, "columns": [{"flex": 1}, {"flex": 1, "align": "center", "field": "advocate_designation", "prefix": "Designation:"}]}], "page_size": "A4"}	{"opposite_party": "case.opposite_party", "petitioner_name": "client.full_name"}	t	2026-07-21 12:39:27.051891+05:30	2026-07-21 13:33:07.992532+05:30	\N	1
b36082d7-fdb5-4966-aaa2-cebf3fe16f64	Inspection Form	Standard Application for Inspection of Court File	drafting	{"margins": {"top": 72, "left": 72, "right": 72, "bottom": 72}, "sections": [{"type": "editable_line", "field": "court_name", "style": {"bold": true}, "prefix": "IN THE COURT OF"}, {"type": "spacer", "height": 15}, {"type": "grid_row", "columns": [{"flex": 2.5, "field": "case_number", "prefix": "NO"}, {"flex": 0.5, "field": "year_suffix", "prefix": "OF 202"}]}, {"type": "spacer", "height": 15}, {"type": "editable_line", "field": "case_matter", "style": {"bold": true}, "prefix": "IN THE MATTER OF"}, {"type": "spacer", "height": 30}, {"type": "header", "style": {"bold": true, "align": "center"}, "content": "VERSUS"}, {"type": "spacer", "height": 30}, {"type": "paragraph", "style": {"bold": true, "align": "right"}, "content": "FIR / Case No. {case_no_val}"}, {"type": "paragraph", "style": {"bold": true, "align": "right"}, "content": "NDOH :- {hearing_date}"}, {"type": "spacer", "height": 30}, {"type": "header", "style": {"bold": true, "size": 14, "align": "center"}, "content": "HUMBLE APPLICATION FOR INSPECTION OF THE COURT FILE"}, {"type": "spacer", "height": 20}, {"type": "paragraph", "style": {"size": 11}, "content": "MOST RESPECTFULLY SHOWETH :-"}, {"type": "spacer", "height": 15}, {"type": "paragraph", "style": {"size": 11, "align": "justify"}, "content": "1. That the above said matter is pending adjudication and determination before the Hon’ble Court and the next date of hearing is {hearing_date_val}."}, {"type": "spacer", "height": 10}, {"type": "paragraph", "style": {"size": 11, "align": "justify"}, "content": "2. That the counsel for the {party_represented} wants to inspect the Court file and documents."}, {"type": "spacer", "height": 30}, {"type": "header", "style": {"bold": true, "align": "center"}, "content": "PRAYER"}, {"type": "spacer", "height": 15}, {"type": "paragraph", "style": {"size": 11, "align": "justify"}, "content": "It is therefore, most respectfully prayed that this Hon’ble Court may be pleased to allow the Counsel for the {party_represented_prayer} to inspect the Court file."}, {"type": "spacer", "height": 50}, {"type": "paragraph", "style": {"align": "right"}, "content": "Yours faithfully"}, {"type": "spacer", "height": 20}, {"type": "grid_row", "style": {"bold": true}, "columns": [{"flex": 1.5, "field": "advocate_address", "prefix": "Address"}, {"flex": 1, "align": "right", "field": "advocate_name", "prefix": "Advocate"}]}, {"type": "spacer", "height": 10}, {"type": "paragraph", "style": {"bold": true}, "content": "{city_name}"}, {"type": "paragraph", "style": {"bold": true}, "content": "DATED :"}, {"type": "spacer", "height": 20}, {"type": "paragraph", "style": {"bold": true, "align": "right"}, "content": "For the Petitioner / Respondent"}], "page_size": "A4"}	{"city_name": "NEW DELHI", "court_name": "case.court_name", "case_number": "case.case_number", "hearing_date": "case.next_hearing_date"}	t	2026-07-21 12:39:27.084311+05:30	2026-07-21 13:33:08.025487+05:30	\N	8
5f90ba15-5b3f-4f54-b6eb-3113faa15819	Advocate Form	Advocate Registration and Information Form	drafting	{"margins": {"top": 50, "left": 50, "right": 50, "bottom": 50}, "sections": [{"rows": [{"cells": [{"flex": 1, "label": "Advocate Name"}, {"flex": 1, "field": "adv_surname"}, {"flex": 1, "field": "adv_first_name"}, {"flex": 1, "field": "adv_middle_name"}]}, {"cells": [{"flex": 1, "label": "(Capital letters only)"}, {"flex": 1, "text": "SURNAME"}, {"flex": 1, "text": "FIRST NAME"}, {"flex": 1, "text": "MIDDLE NAME"}]}, {"cells": [{"flex": 1, "label": "Sex"}, {"flex": 3, "text": "Male / Female", "field": "adv_sex"}]}, {"cells": [{"flex": 1, "label": "Date of Birth"}, {"flex": 1, "field": "adv_dob_dd"}, {"flex": 1, "field": "adv_dob_mm"}, {"flex": 1, "field": "adv_dob_yyyy"}]}, {"cells": [{"flex": 1, "label": ""}, {"flex": 1, "text": "DD"}, {"flex": 1, "text": "MM"}, {"flex": 1, "text": "YYYY"}]}, {"cells": [{"flex": 1, "label": "Bar Registration Number"}, {"flex": 3, "field": "bar_reg_no", "placeholder": "MAH/_______/________"}]}, {"cells": [{"flex": 3, "field": "res_address", "label": "Residential Address"}]}, {"cells": [{"flex": 3, "field": "off_address", "label": "Office Address"}]}, {"cells": [{"flex": 3, "field": "adv_district", "label": "District"}]}, {"cells": [{"flex": 3, "field": "adv_email", "label": "email"}]}, {"cells": [{"flex": 1, "field": "adv_mobile", "label": "Mobile No."}, {"flex": 1, "field": "adv_phone_off", "label": "Phone Office"}]}, {"cells": [{"flex": 1, "field": "adv_phone_res", "label": "Phone Residence"}, {"flex": 1, "field": "adv_fax", "label": "Fax No. (If, available)"}]}], "type": "form_grid"}, {"type": "spacer", "height": 20}, {"type": "header", "style": {"align": "center", "background": true}, "content": "मराठी"}, {"rows": [{"cells": [{"flex": 1, "label": "विधीज्ञाचे नाव"}, {"flex": 1, "field": "adv_surname_mr"}, {"flex": 1, "field": "adv_first_name_mr"}, {"flex": 1, "field": "adv_middle_name_mr"}]}, {"cells": [{"flex": 1, "label": ""}, {"flex": 1, "text": "आडनाव"}, {"flex": 1, "text": "स्वत:चे नाव"}, {"flex": 1, "text": "वडिलांचे नाव"}]}, {"cells": [{"flex": 3, "field": "res_address_mr", "label": "निवासस्थानाचा पत्ता"}]}, {"cells": [{"flex": 3, "field": "off_address_mr", "label": "कार्यालयाचा पत्ता"}]}], "type": "form_grid"}, {"type": "spacer", "height": 40}, {"type": "paragraph", "style": {"align": "right"}, "content": "Signature of Advocate"}], "page_size": "A4"}	{"adv_district": "Aurangabad"}	t	2026-07-21 12:39:27.095168+05:30	2026-07-21 13:33:08.036131+05:30	\N	0
47436b2d-179e-4c45-bcb7-60f66e38a6cc	Check-list	Court Case Filing Check-list	drafting	{"margins": {"top": 50, "left": 50, "right": 50, "bottom": 50}, "sections": [{"type": "header", "style": {"bold": true, "size": 18, "align": "center"}, "content": "CHECK-LIST"}, {"type": "spacer", "height": 20}, {"rows": [{"cells": [{"flex": 0.2, "text": "1."}, {"flex": 2, "field": "valuation_suit", "label": "VALUATION OF SUIT JURISDICTION"}]}, {"cells": [{"flex": 0.2, "text": "2."}, {"flex": 2, "field": "adv_name_addr", "label": "NAME & ADDRESS OF ADVOCATE"}]}, {"cells": [{"flex": 0.2, "text": "3."}, {"flex": 2, "field": "suit_nature", "label": "NATURE OF SUIT"}]}, {"cells": [{"flex": 0.2, "text": "4."}, {"flex": 2, "label": "AGE OF PARTIES"}, {"flex": 2, "field": "age_plaintiff", "label": "Plaintiff"}]}, {"cells": [{"flex": 0.2, "text": ""}, {"flex": 2, "label": ""}, {"flex": 2, "field": "age_defendant", "label": "Defendant"}]}, {"cells": [{"flex": 0.2, "text": "5."}, {"flex": 2, "field": "caveat_val", "label": "CAVEAT"}]}, {"cells": [{"flex": 0.2, "text": "6."}, {"flex": 2, "field": "earmarked_court", "label": "WHETHER ANYT EARMARKED COURT"}]}], "type": "form_grid"}, {"type": "grid_row", "style": {"border": true}, "columns": [{"flex": 1, "field": "", "prefix": "7. COURT FEE AFFIXED"}]}, {"rows": 7, "type": "dynamic_table", "columns": [{"field": "sl_no", "width": "10%", "header": "Sl No."}, {"field": "relief", "width": "20%", "header": "Relief Sought"}, {"field": "val_jurisdiction", "width": "25%", "header": "Valuation of Relief for jurisdiction"}, {"field": "val_court_fee", "width": "25%", "header": "Valuation of relief for court fee"}, {"field": "fee_paid", "width": "20%", "header": "Court fee paid individually"}]}, {"rows": [{"cells": [{"flex": 0.2, "text": "8."}, {"flex": 2, "field": "connected_cases", "label": "CONNECTED CASES IF ANY & NAME OF THE COURT WHERE PENDING"}]}], "type": "form_grid"}], "page_size": "A4"}	{}	t	2026-07-21 12:39:27.098559+05:30	2026-07-21 13:33:08.039571+05:30	\N	0
da8fa81e-ae96-4430-9e08-964637dd5f69	Process Fee	Standard Process Fee (P.F.) Form with Table and Acknowledgement	drafting	{"margins": {"top": 72, "left": 72, "right": 72, "bottom": 72}, "sections": [{"type": "header", "style": {"bold": true, "size": 14, "align": "center"}, "content": "Process Fee Form"}, {"type": "spacer", "height": 20}, {"type": "editable_line", "field": "court_name_top", "style": {"size": 11}, "prefix": "IN THE COURT OF"}, {"type": "editable_line", "field": "case_no_top", "style": {"size": 11}, "prefix": "Suit/Case No."}, {"type": "grid_row", "columns": [{"flex": 2, "field": "plaintiff_name", "prefix": ""}, {"flex": 2, "field": "defendant_name", "prefix": "Versus"}]}, {"type": "grid_row", "columns": [{"flex": 1, "field": "pdoh", "prefix": "P.D.O.H."}, {"flex": 1, "field": "ndoh", "prefix": "N.D.O.H."}]}, {"type": "spacer", "height": 20}, {"rows": 1, "type": "dynamic_table", "columns": [{"field": "filing_date", "width": "15%", "header": "Date of Filing"}, {"field": "filed_by", "width": "20%", "header": "Filed By Whom"}, {"field": "purpose", "width": "20%", "header": "Purpose of Filing"}, {"field": "number_val", "width": "10%", "header": "Number"}, {"field": "fees_amt", "width": "15%", "header": "Amount of P. Fees"}, {"field": "fee_affixed", "width": "20%", "header": "Court Fee Affixed"}], "row_height": 350}, {"type": "spacer", "height": 20}, {"type": "paragraph", "style": {"align": "center"}, "content": "---------------------------------------------------------------------------------------------------------------------------------"}, {"type": "spacer", "height": 20}, {"type": "paragraph", "style": {"size": 11}, "content": "In the Court of Shri"}, {"type": "editable_line", "field": "judge_name_footer", "style": {"size": 11}, "prefix": ""}, {"type": "editable_line", "field": "case_no_footer", "style": {"size": 11}, "prefix": "Suit/Case No."}, {"type": "grid_row", "columns": [{"flex": 2, "field": "case_title_footer", "prefix": "In Re"}, {"flex": 2, "field": "vs_footer", "prefix": "V/S"}]}, {"type": "grid_row", "columns": [{"flex": 1, "field": "pdoh_footer", "prefix": "P.D.O.H."}, {"flex": 1, "field": "ndoh_footer", "prefix": "N.D.O.H."}]}, {"type": "editable_line", "field": "filing_date_footer", "style": {"size": 11}, "prefix": "Date of Filing"}, {"type": "spacer", "height": 20}, {"type": "paragraph", "style": {"bold": true, "align": "right"}, "content": "Ahlmad / Asstt. Ahlmad"}], "page_size": "A4"}	{"court_name_top": "case.court_name"}	t	2026-07-21 12:39:27.076907+05:30	2026-07-21 13:33:08.018725+05:30	\N	70
f8dd40d2-f6e1-4a33-bcb9-f4f4b86bcc9f	Memorandum of Appearance	Standard Memorandum of Appearance for Advocates	drafting	{"margins": {"top": 80, "left": 60, "right": 60, "bottom": 60}, "sections": [{"type": "header", "style": {"bold": true, "size": 32, "align": "center"}, "content": "Memorandum of Appearance"}, {"type": "header", "style": {"bold": true, "size": 14, "align": "center"}, "content": "OF"}, {"type": "header", "style": {"bold": true, "size": 18, "align": "center"}, "content": "ADVOCATE"}, {"type": "spacer", "height": 50}, {"type": "editable_line", "field": "court_name", "style": {"size": 12}, "prefix": "In the Court of"}, {"type": "spacer", "height": 30}, {"type": "editable_line", "field": "case_title", "style": {"size": 12}, "prefix": "In Re :"}, {"type": "spacer", "height": 30}, {"type": "header", "style": {"bold": true, "size": 14, "align": "center"}, "content": "V E R S U S"}, {"type": "spacer", "height": 50}, {"type": "editable_line", "field": "opposite_party", "style": {"size": 12}, "prefix": ""}, {"type": "spacer", "height": 50}, {"type": "paragraph", "style": {"size": 12}, "content": "The undersigned is appearing in the above case on behalf of {client_name}"}, {"type": "spacer", "height": 20}, {"type": "editable_line", "field": "client_desc_extra", "style": {"size": 12}, "prefix": ""}, {"type": "spacer", "height": 40}, {"type": "paragraph", "style": {"size": 12}, "content": "He has been authorized to appear by {authorizer_name}"}, {"type": "spacer", "height": 20}, {"type": "editable_line", "field": "authority_extra", "style": {"size": 12}, "prefix": ""}, {"type": "spacer", "height": 80}, {"type": "grid_row", "columns": [{"flex": 1, "field": "current_date", "prefix": "Dated"}, {"flex": 1, "align": "right", "field": "", "prefix": "ADVOCATE"}]}], "page_size": "A4"}	{"court_name": "case.court_name", "client_name": "client.full_name", "authorizer_name": "client.full_name"}	t	2026-07-21 12:39:27.063096+05:30	2026-07-21 13:33:08.004813+05:30	\N	9
3aeb66ea-83c8-4279-a938-da5244d3de5e	Address Form	Standard Address Form for Court Service	drafting	{"margins": {"top": 72, "left": 72, "right": 72, "bottom": 72}, "sections": [{"type": "header", "style": {"bold": true, "size": 16, "align": "center"}, "content": "ADDRESS FORM"}, {"type": "spacer", "height": 30}, {"type": "editable_line", "field": "court_name", "style": {"size": 11}, "prefix": "In the Court of :"}, {"type": "spacer", "height": 20}, {"type": "grid_row", "columns": [{"flex": 1.2, "field": "case_number", "prefix": "Case"}, {"flex": 1, "field": "opposite_party", "prefix": "Versus"}]}, {"type": "spacer", "height": 20}, {"type": "grid_row", "columns": [{"flex": 1.2, "field": "suit_type", "prefix": "Suit"}, {"flex": 1, "field": "hearing_date", "prefix": "Date of Hearing"}]}, {"type": "spacer", "height": 30}, {"type": "paragraph", "style": {"size": 11}, "content": "The address of Plaintiff/ Defendant/ Applicant is as under :-"}, {"type": "spacer", "height": 15}, {"rows": 1, "type": "dynamic_table", "columns": [{"field": "name_father", "width": "25%", "header": "Name with Father's Name"}, {"field": "caste", "width": "10%", "header": "Caste"}, {"field": "residence", "width": "20%", "header": "Resident of"}, {"field": "post_office", "width": "15%", "header": "Post Office"}, {"field": "tehsil", "width": "10%", "header": "Tehsil"}, {"field": "district", "width": "10%", "header": "Distt."}, {"field": "remarks", "width": "10%", "header": "Remarks"}]}, {"type": "spacer", "height": 40}, {"type": "paragraph", "style": {"size": 11}, "content": "Sir,"}, {"type": "spacer", "height": 15}, {"type": "paragraph", "style": {"size": 11, "align": "justify", "line_height": 1.5}, "content": "       All the summons, notices orders etc. In connection with the above suit be sent to me at the address given above."}, {"type": "spacer", "height": 15}, {"type": "paragraph", "style": {"size": 11, "align": "justify", "line_height": 1.5}, "content": "       In Case of any change in address, the same shall be communicated to with full particulars and details."}], "page_size": "A4"}	{"court_name": "case.court_name", "case_number": "case.case_number", "opposite_party": "case.opposite_party"}	t	2026-07-21 12:39:27.066483+05:30	2026-07-21 13:33:08.008154+05:30	\N	6
50b7af13-845c-46e7-aca0-6e879a6b9187	ABLAPL PETITION (Orissa High Court)	Anticipatory Bail Application (ABLAPL) Petition	drafting	{"margins": {"top": 72, "left": 72, "right": 72, "bottom": 72}, "sections": [{"type": "header", "style": {"bold": true, "size": 14, "align": "center"}, "content": "IN THE HIGH COURT OF ORISSA, CUTTACK"}, {"type": "header", "style": {"size": 12, "align": "center"}, "content": "(Criminal Miscellaneous Jurisdiction)"}, {"type": "spacer", "height": 20}, {"type": "grid_row", "style": {"bold": true}, "columns": [{"flex": 2, "field": "ablapl_no", "prefix": "ABLAPL NO."}, {"flex": 1, "field": "year_suffix", "prefix": "OF 202"}]}, {"type": "spacer", "height": 20}, {"type": "editable_line", "field": "petitioner_name", "style": {"bold": true}, "prefix": "", "suffix": "... Petitioner"}, {"type": "header", "style": {"bold": true, "align": "center"}, "content": "-Versus-"}, {"type": "editable_line", "field": "state_opp_party", "style": {"bold": true}, "prefix": "State of Odisha", "suffix": "... Opp. Party"}, {"type": "spacer", "height": 30}, {"type": "header", "style": {"bold": true, "size": 12, "align": "center", "underline": true}, "content": "PETITION UNDER SECTION 438 OF Cr.P.C."}, {"type": "paragraph", "style": {"size": 11, "align": "left"}, "content": "The petitioner above named most respectfully showeth:"}, {"type": "paragraph", "style": {"size": 11, "align": "justify", "line_height": 1.6}, "content": "1. That the petitioner is a law-abiding citizen of India.\\n2. That the petitioner has been falsely implicated in the above-mentioned case due to local village politics.\\n3. That the petitioner is ready and willing to cooperate with the investigation."}, {"type": "spacer", "height": 40}, {"type": "signature_block", "style": {"align": "right"}, "content": "Advocate for the Petitioner"}], "page_size": "A4"}	{"petitioner_name": "client.full_name"}	t	2026-07-21 12:39:27.045251+05:30	2026-07-21 13:33:07.985777+05:30	\N	4
f862aad3-903a-47c8-a9ca-93f6eda518f3	Form No 45 Bail Bond	Standard bail bond form as per Form No. 45	drafting	{"margins": {"top": 72, "left": 72, "right": 72, "bottom": 72}, "sections": [{"type": "header", "style": {"bold": true, "size": 14, "align": "center", "uppercase": true}, "content": "IN THE COURT OF {court_name}"}, {"type": "spacer", "height": 20}, {"type": "header", "style": {"bold": true, "size": 12, "align": "center"}, "content": "FORM NO. 45"}, {"type": "header", "style": {"bold": true, "size": 12, "align": "center", "underline": true}, "content": "BAIL BOND"}, {"type": "paragraph", "style": {"size": 10, "align": "center", "italic": true}, "content": "(See Section 436 to 450 of the Code of Criminal Procedure, 1973)"}, {"type": "spacer", "height": 20}, {"type": "field_group", "fields": [{"name": "date", "type": "date", "label": "Date", "inline": true}, {"name": "sections", "type": "text", "label": "Sections", "inline": true}]}, {"type": "spacer", "height": 15}, {"type": "paragraph", "style": {"size": 11, "align": "justify", "line_height": 1.5}, "content": "I, {accused_name}, son/daughter/wife of {father_name}, aged {age} years, resident of {address}, do hereby bind myself to attend before the Court of {court_name} on {hearing_date} and continue to attend until otherwise directed by the Court, to answer to the charge on which I have been admitted to bail."}, {"type": "spacer", "height": 15}, {"type": "paragraph", "style": {"size": 11, "align": "justify", "line_height": 1.5}, "content": "And I bind myself to pay to Government the sum of Rs. {bond_amount}/- (Rupees {bond_amount_words}) if I fail to comply with this condition."}, {"type": "spacer", "height": 15}, {"type": "paragraph", "style": {"size": 11}, "content": "FIR Number: {fir_number}"}, {"type": "paragraph", "style": {"size": 11}, "content": "Case Number: {case_number}"}, {"type": "spacer", "height": 30}, {"type": "signature_block", "style": {"align": "right"}, "content": "Signature of the Accused"}, {"type": "spacer", "height": 20}, {"type": "paragraph", "style": {"size": 11}, "content": "Accepted this {acceptance_date}"}, {"type": "spacer", "height": 30}, {"type": "signature_block", "style": {"align": "right"}, "content": "Magistrate/Judge"}], "page_size": "A4"}	{"address": "client.address", "court_name": "case.court_name", "case_number": "case.case_number", "accused_name": "client.full_name"}	t	2026-07-21 12:39:27.055504+05:30	2026-07-21 13:33:07.995844+05:30	\N	7
80406778-c57c-43f5-ac5c-09d81a9db361	List of Documents	Standard List of Documents Produced by Plaintiff/Defendant	drafting	{"margins": {"top": 72, "left": 72, "right": 72, "bottom": 72}, "sections": [{"type": "header", "style": {"size": 14, "align": "center"}, "content": "List of documents Produced by"}, {"type": "paragraph", "style": {"bold": true, "align": "right", "underline": true}, "content": "PLAINTIFF\\nDEFENDANT"}, {"type": "paragraph", "style": {"size": 10}, "content": "(Order XIII Rule 1 of the order of Civil Procedure, Form prescribed by the High Court in the Court of"}, {"type": "spacer", "height": 15}, {"type": "paragraph", "style": {"align": "right"}, "content": "Suit No. ___________ of 202{year_suffix}"}, {"type": "grid_row", "columns": [{"flex": 4, "field": "plaintiff_name", "prefix": ""}, {"flex": 1, "field": "", "prefix": "Plaintiff"}]}, {"type": "spacer", "height": 15}, {"type": "header", "style": {"align": "center"}, "content": "Versus"}, {"type": "spacer", "height": 15}, {"type": "grid_row", "columns": [{"flex": 4, "field": "defendant_name", "prefix": ""}, {"flex": 1, "field": "", "prefix": "Defendant"}]}, {"type": "spacer", "height": 20}, {"type": "paragraph", "style": {"size": 11}, "content": "List of documents produced with the plaint (or at first hearing on behalf of the Plaintiff or defendant)."}, {"type": "spacer", "height": 15}, {"rows": 10, "type": "dynamic_table", "columns": [{"field": "sno", "width": "5%", "header": "1\\nS.No."}, {"field": "desc", "width": "25%", "header": "2\\nDescription and date If any"}, {"field": "proof", "width": "20%", "header": "3\\nThat the document is intended to prove"}, {"field": "status", "width": "30%", "header": "4\\nWhat become of the document\\nBrought the record | If rejected date of return"}, {"field": "remarks", "width": "20%", "header": "5\\nRemarks"}], "row_height": 60}, {"type": "spacer", "height": 30}, {"type": "paragraph", "style": {"align": "right"}, "content": "through Advocate"}, {"type": "paragraph", "style": {"align": "right"}, "content": "Signature of part or plead procedure"}], "page_size": "A4"}	{"court_name": "case.court_name", "case_number": "case.case_number"}	t	2026-07-21 12:39:27.073366+05:30	2026-07-21 13:33:08.015276+05:30	\N	40
61da7640-6d5a-4e60-a521-1c4d547c2a22	CA Form 7	FORM C.A.I. (RULE) Application for Certified Copy	drafting	{"margins": {"top": 40, "left": 40, "right": 40, "bottom": 40}, "sections": [{"type": "header", "style": {"bold": true, "size": 18, "align": "center"}, "content": "FORM. C.A.I."}, {"type": "header", "style": {"bold": true, "size": 14, "align": "center"}, "content": "(RULE)"}, {"type": "grid_row", "style": {"align": "right"}, "columns": [{"flex": 1, "field": "", "prefix": "Application for copy [ ]"}, {"flex": 0.5, "field": "", "prefix": "Urgent [ ]"}, {"flex": 0.5, "field": "", "prefix": "Ordinary [ ]"}]}, {"type": "spacer", "height": 20}, {"type": "grid_row", "columns": [{"flex": 1, "columns": [{"type": "editable_line", "field": "dist_officer", "prefix": "To the District Officer"}, {"type": "editable_line", "field": "applicant_name", "prefix": "Name of applicant"}, {"type": "editable_line", "field": "parent_name", "prefix": "W/o, D/o, S/o", "suffix": "Resident of"}, {"type": "editable_line", "field": "residence_addr", "prefix": ""}, {"type": "editable_line", "field": "po_dist", "prefix": "Post Office and District"}, {"type": "paragraph", "style": {"size": 10}, "content": "Description and number of the case from the record of which the copy is Required"}, {"type": "editable_line", "field": "case_desc_no", "prefix": ""}, {"type": "grid_row", "columns": [{"flex": 1, "field": "mauza", "prefix": "Mauza"}, {"flex": 1, "field": "ps", "prefix": "P.S."}]}, {"type": "grid_row", "columns": [{"flex": 1, "field": "goshwara", "prefix": "Goshwara No."}, {"flex": 1, "field": "district_name", "prefix": "District"}]}, {"type": "editable_line", "field": "parties_names", "prefix": "Name of Parties"}, {"type": "grid_row", "columns": [{"flex": 1.5, "field": "case_nature", "prefix": "Nature of case"}, {"flex": 1, "field": "decision_date", "prefix": "Date of Decision"}]}, {"type": "editable_line", "field": "next_date", "prefix": "Order Next date fixed"}, {"type": "editable_line", "field": "court_name_val", "prefix": "Name of Court"}]}, {"flex": 1, "columns": [{"type": "header", "style": {"bold": true, "size": 14, "align": "center"}, "content": "SPACE FOR COURT FEES STAMP"}, {"type": "spacer", "height": 100}, {"type": "editable_line", "field": "stamp_filed", "prefix": "Court fee Stamp filed"}, {"type": "grid_row", "columns": [{"flex": 1, "field": "stamp_num", "prefix": "Number"}, {"flex": 1, "field": "stamp_val", "prefix": "Value"}]}, {"type": "paragraph", "style": {"size": 10}, "content": "I copy to be sent by post or Will applicant attend in Person"}, {"type": "editable_line", "field": "attendance_mode", "prefix": ""}, {"type": "spacer", "height": 20}, {"type": "editable_line", "field": "sig_applicant", "prefix": "Signature"}, {"type": "editable_line", "field": "sig_date", "prefix": "Date"}, {"type": "editable_line", "field": "order_on_app", "prefix": "Order on application"}, {"type": "editable_line", "field": "sig_agent", "prefix": "Sig. Copying Agent"}, {"type": "editable_line", "field": "agent_date", "prefix": "Date"}, {"type": "editable_line", "field": "sig_recipient", "prefix": "Sig. Recipient"}, {"type": "editable_line", "field": "recipient_date", "prefix": "Date"}]}]}], "page_size": "A4"}	{"applicant_name": "client.full_name", "court_name_val": "case.court_name"}	t	2026-07-21 12:39:27.105583+05:30	2026-07-21 13:33:08.046683+05:30	\N	0
4a448807-8f01-4965-9472-02a199341f94	Bail Bond Form	Standard Bail Bond for Attendance before Police or Court	drafting	{"margins": {"top": 72, "left": 72, "right": 72, "bottom": 72}, "sections": [{"type": "header", "style": {"bold": true, "size": 14, "align": "center"}, "content": "BAIL BOND"}, {"type": "spacer", "height": 20}, {"type": "editable_line", "field": "court_name", "style": {"size": 11}, "prefix": "IN THE COURT OF"}, {"type": "editable_line", "field": "case_no", "style": {"size": 11}, "prefix": "Case No."}, {"type": "spacer", "height": 15}, {"type": "paragraph", "style": {"bold": true, "align": "center"}, "content": "BOND OR BAIL BOND FOR ATTENDANCE BEFORE OFFICER IN CHARGE OF THE POLICE STATION OR COURT."}, {"type": "spacer", "height": 20}, {"type": "editable_line", "field": "accused_name", "style": {"size": 11}, "prefix": "       I, (Name)"}, {"type": "grid_row", "columns": [{"flex": 1, "field": "accused_age", "prefix": "Age"}, {"flex": 4, "field": "accused_address", "prefix": "R/o."}]}, {"type": "paragraph", "style": {"align": "justify", "line_height": 1.8}, "content": "having been arrested or detained without warrant by the officer in-charge or Police Station {ps_name} ( or having been brought before the court of {court_desc} changed with the offences on {offence_date} and required to give surety for, my attendance before such officer or court and required on condition, that I shall attend such officer or court on everyday on which any investigation or trial is held with regard to such charges and in case of making default therein, I bind myself to forfeit to the Government the sum of Rs. {bond_amt}."}, {"type": "editable_line", "field": "bond_amt_words", "style": {"size": 11}, "prefix": "In words Rs."}, {"type": "grid_row", "columns": [{"flex": 1, "field": "date_day", "prefix": "Dated this"}, {"flex": 1, "field": "date_month", "prefix": "day of"}, {"flex": 0.5, "field": "", "prefix": "202{year_suffix}"}]}, {"type": "spacer", "height": 50}, {"type": "signature_block", "style": {"align": "right"}, "content": "(Signature of the accused.)"}], "page_size": "A4"}	{"case_no": "case.case_number", "court_name": "case.court_name", "accused_name": "client.full_name", "accused_address": "client.address"}	t	2026-07-21 12:39:27.102062+05:30	2026-07-21 13:33:08.043031+05:30	\N	0
047cc688-2cdd-4939-bd33-e0742728e958	Advocate Details Form	Mobile-Email Details Collection Form for Advocates	drafting	{"margins": {"top": 50, "left": 50, "right": 50, "bottom": 50}, "sections": [{"type": "header", "style": {"bold": true, "align": "center"}, "content": "Mobile-Email Details Collection Form for Advocates"}, {"type": "paragraph", "style": {"size": 10, "align": "center"}, "content": "(Please use Capital Letters only)"}, {"type": "spacer", "height": 20}, {"rows": [{"cells": [{"flex": 1, "field": "court_complex_adv", "label": "Court Complex:"}]}, {"cells": [{"flex": 1, "field": "district_adv", "label": "District:"}]}, {"cells": [{"flex": 0.5, "text": "Advocate Name:"}, {"flex": 1, "field": "adv_surname", "label": "SURNAME"}, {"flex": 1, "field": "adv_firstname", "label": "FIRST NAME"}]}, {"cells": [{"flex": 1, "field": "adv_middlename", "label": "MIDDLE NAME"}, {"flex": 1, "field": "adv_sex", "label": "Sex (Male / Female)"}]}, {"cells": [{"flex": 2, "text": "Date of Birth"}, {"flex": 1, "field": "adv_dob_dd", "label": "DD"}, {"flex": 1, "field": "adv_dob_mm", "label": "MM"}, {"flex": 2, "field": "adv_dob_yyyy", "label": "YYYY"}]}, {"cells": [{"flex": 1, "field": "bar_reg_no", "label": "Bar Council Registration Number"}]}, {"cells": [{"flex": 1, "field": "res_address_adv", "label": "Residential Address"}]}, {"cells": [{"flex": 1, "field": "off_address_adv", "label": "Office Address"}]}, {"cells": [{"flex": 1, "field": "district_adv_2", "label": "District"}]}, {"cells": [{"flex": 1, "field": "adv_email_col", "label": "Email"}]}, {"cells": [{"flex": 1, "field": "adv_mobile_col", "label": "Mobile No."}, {"flex": 1, "field": "adv_phone_off", "label": "Phone Office"}]}, {"cells": [{"flex": 1, "field": "adv_phone_res", "label": "Phone Residence"}, {"flex": 1, "field": "adv_fax", "label": "Fax No. (If, available)"}]}], "type": "form_grid"}, {"type": "spacer", "height": 80}, {"type": "grid_row", "columns": [{"flex": 1, "field": "current_date_adv", "prefix": "Date:"}, {"bold": true, "flex": 1, "align": "right", "field": "", "prefix": "Signature of Advocate"}]}], "page_size": "A4"}	{"adv_email_col": "User Email", "adv_firstname": "Counsel Name", "adv_mobile_col": "User Phone"}	t	2026-07-21 12:39:27.124022+05:30	2026-07-21 13:33:08.064899+05:30	\N	0
\.


--
-- Data for Name: documents_documenttemplate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents_documenttemplate (id, name, description, category, template_file, file_size_kb, template_fields, is_active, is_public, created_at, updated_at, created_by_id) FROM stdin;
\.


--
-- Data for Name: documents_filledcourtform; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents_filledcourtform (id, filled_content, field_values, status, advocate_signed, advocate_signature_date, client_signed, client_signature_date, is_shared_with_client, shared_at, generated_pdf, created_at, updated_at, case_id, client_id, created_by_id, template_id, advocate_signature_image, client_signature_image, digital_signature_details, is_digitally_signed, custom_sequence) FROM stdin;
febe9fcd-2598-4d3a-9fab-7b167971e10a	{"margins": {"top": 50, "left": 50, "right": 50, "bottom": 50}, "sections": [{"type": "header", "style": {"bold": true, "align": "center"}, "content": "Mobile-Email Details Collection Form for Advocates"}, {"type": "paragraph", "style": {"size": 10, "align": "center"}, "content": "(Please use Capital Letters only)"}, {"type": "spacer", "height": 20}, {"rows": [{"cells": [{"flex": 1, "field": "court_complex_adv", "label": "Court Complex:"}]}, {"cells": [{"flex": 1, "field": "district_adv", "label": "District:"}]}, {"cells": [{"flex": 0.5, "text": "Advocate Name:"}, {"flex": 1, "field": "adv_surname", "label": "SURNAME"}, {"flex": 1, "field": "adv_firstname", "label": "FIRST NAME"}]}, {"cells": [{"flex": 1, "field": "adv_middlename", "label": "MIDDLE NAME"}, {"flex": 1, "field": "adv_sex", "label": "Sex (Male / Female)"}]}, {"cells": [{"flex": 2, "text": "Date of Birth"}, {"flex": 1, "field": "adv_dob_dd", "label": "DD"}, {"flex": 1, "field": "adv_dob_mm", "label": "MM"}, {"flex": 2, "field": "adv_dob_yyyy", "label": "YYYY"}]}, {"cells": [{"flex": 1, "field": "bar_reg_no", "label": "Bar Council Registration Number"}]}, {"cells": [{"flex": 1, "field": "res_address_adv", "label": "Residential Address"}]}, {"cells": [{"flex": 1, "field": "off_address_adv", "label": "Office Address"}]}, {"cells": [{"flex": 1, "field": "district_adv_2", "label": "District"}]}, {"cells": [{"flex": 1, "field": "adv_email_col", "label": "Email"}]}, {"cells": [{"flex": 1, "field": "adv_mobile_col", "label": "Mobile No."}, {"flex": 1, "field": "adv_phone_off", "label": "Phone Office"}]}, {"cells": [{"flex": 1, "field": "adv_phone_res", "label": "Phone Residence"}, {"flex": 1, "field": "adv_fax", "label": "Fax No. (If, available)"}]}], "type": "form_grid"}, {"type": "spacer", "height": 80}, {"type": "grid_row", "columns": [{"flex": 1, "field": "current_date_adv", "prefix": "Date:"}, {"bold": true, "flex": 1, "align": "right", "field": "", "prefix": "Signature of Advocate"}]}], "page_size": "A4"}	{}	completed	f	\N	f	\N	f	\N		2026-07-21 17:17:14.698747+05:30	2026-07-21 17:30:54.579037+05:30	b1b52cd7-2c03-48dc-871d-4f561ab1c206	a1567037-4f6e-4bbe-95ec-1653c35658b0	9a3b9470-80d4-444e-a370-55fd04bf185a	047cc688-2cdd-4939-bd33-e0742728e958			{}	f	3
62473e88-b65a-4e53-98f9-3aab27c9fdce	{"margins": {"top": 72, "left": 72, "right": 72, "bottom": 72}, "sections": [{"type": "header", "style": {"bold": true, "size": 14, "align": "center"}, "content": "BAIL BOND"}, {"type": "spacer", "height": 20}, {"type": "editable_line", "field": "court_name", "style": {"size": 11}, "prefix": "IN THE COURT OF"}, {"type": "editable_line", "field": "case_no", "style": {"size": 11}, "prefix": "Case No."}, {"type": "spacer", "height": 15}, {"type": "paragraph", "style": {"bold": true, "align": "center"}, "content": "BOND OR BAIL BOND FOR ATTENDANCE BEFORE OFFICER IN CHARGE OF THE POLICE STATION OR COURT."}, {"type": "spacer", "height": 20}, {"type": "editable_line", "field": "accused_name", "style": {"size": 11}, "prefix": "       I, (Name)"}, {"type": "grid_row", "columns": [{"flex": 1, "field": "accused_age", "prefix": "Age"}, {"flex": 4, "field": "accused_address", "prefix": "R/o."}]}, {"type": "paragraph", "style": {"align": "justify", "line_height": 1.8}, "content": "having been arrested or detained without warrant by the officer in-charge or Police Station {ps_name} ( or having been brought before the court of {court_desc} changed with the offences on {offence_date} and required to give surety for, my attendance before such officer or court and required on condition, that I shall attend such officer or court on everyday on which any investigation or trial is held with regard to such charges and in case of making default therein, I bind myself to forfeit to the Government the sum of Rs. {bond_amt}."}, {"type": "editable_line", "field": "bond_amt_words", "style": {"size": 11}, "prefix": "In words Rs."}, {"type": "grid_row", "columns": [{"flex": 1, "field": "date_day", "prefix": "Dated this"}, {"flex": 1, "field": "date_month", "prefix": "day of"}, {"flex": 0.5, "field": "", "prefix": "202{year_suffix}"}]}, {"type": "spacer", "height": 50}, {"type": "signature_block", "style": {"align": "right"}, "content": "(Signature of the accused.)"}], "page_size": "A4"}	{}	completed	f	\N	f	\N	f	\N		2026-07-21 17:31:20.678055+05:30	2026-07-21 17:34:47.754687+05:30	b1b52cd7-2c03-48dc-871d-4f561ab1c206	a1567037-4f6e-4bbe-95ec-1653c35658b0	9a3b9470-80d4-444e-a370-55fd04bf185a	4a448807-8f01-4965-9472-02a199341f94			{}	f	5
1de648f6-cec1-4d0b-a979-458a75ecd916	{"margins": {"top": 50, "left": 50, "right": 50, "bottom": 50}, "sections": [{"type": "header", "style": {"bold": true, "size": 18, "align": "center"}, "content": "CHECK LIST"}, {"type": "spacer", "height": 20}, {"rows": [{"cells": [{"flex": 0.2, "text": "1."}, {"flex": 2, "field": "case_details_ni", "label": "Details of the case whether 138 N.I. Act, complaint case etc."}]}, {"cells": [{"flex": 0.2, "text": "2."}, {"flex": 2, "field": "cheque_amount", "label": "Total Cheque(s) Amount Only in 138 Cases.", "placeholder": "Rs."}]}, {"cells": [{"flex": 0.2, "text": "3."}, {"flex": 2, "field": "bounce_area", "label": "Area of bounce cheque (s)"}]}, {"cells": [{"flex": 0.2, "text": "4."}, {"flex": 2, "field": "complaint_details", "label": "Name\\nAddress of the complaint,\\n\\nAge :\\n(Whether Sr. Citizen)\\nGender\\nContact No."}, {"flex": 1, "text": "Male/Female", "field": "complaint_gender"}]}, {"cells": [{"flex": 0.2, "text": "5."}, {"flex": 2, "field": "accused_details_ni", "label": "Name\\nAddress of the complaint,\\n\\nAge :\\n(Whether Sr. Citizen)\\nGender\\nContact No."}, {"flex": 1, "text": "Male/Female", "field": "accused_gender_ni"}]}, {"cells": [{"flex": 0.2, "text": "5-a."}, {"flex": 2, "field": "accused_details_5a", "label": "Name\\nAddress of the complaint,\\n\\nAge :\\n(Whether Sr. Citizen)\\nGender\\nContact No."}, {"flex": 1, "text": "Male/Female", "field": "accused_gender_5a"}]}, {"cells": [{"flex": 0.2, "text": "5-b."}, {"flex": 2, "field": "accused_details_5b", "label": "Name\\nAddress of the complaint,\\n\\nAge :\\n(Whether Sr. Citizen)\\nGender\\nContact No."}, {"flex": 1, "text": "Male/Female", "field": "accused_gender_5b"}]}, {"cells": [{"flex": 0.2, "text": "6."}, {"flex": 2, "field": "ps_name_ni", "label": "Name of Police Station"}]}, {"cells": [{"flex": 0.2, "text": "7."}, {"flex": 2, "field": "other_info_ni", "label": "Any other information with respect to present case."}]}], "type": "form_grid"}], "page_size": "A4"}	{}	completed	f	\N	f	\N	f	\N		2026-07-21 17:32:24.16646+05:30	2026-07-21 17:35:05.818294+05:30	b1b52cd7-2c03-48dc-871d-4f561ab1c206	a1567037-4f6e-4bbe-95ec-1653c35658b0	9a3b9470-80d4-444e-a370-55fd04bf185a	202b55f1-ac8b-4a89-a8e3-e1957521ca27			{}	f	4
dbcf6464-cf2e-4b12-84dc-3687c9b7e993	{"margins": {"top": 50, "left": 50, "right": 50, "bottom": 50}, "sections": [{"type": "header", "style": {"bold": true, "size": 14, "align": "center"}, "content": "BAIL BOND U/S 437-A CR.P.C."}, {"type": "header", "style": {"bold": true, "size": 12, "align": "center"}, "content": "BOND & BAIL BOND FOR ATTENDANCE BEFORE THE APPELLANT COURT"}, {"type": "spacer", "height": 20}, {"type": "editable_line", "field": "judge_name", "style": {"size": 11}, "prefix": "In the court of Sh."}, {"type": "grid_row", "columns": [{"flex": 1, "field": "ps_name", "prefix": "P.S. ...:"}, {"flex": 1, "field": "sections_law", "prefix": "U/S"}, {"flex": 1, "field": "fir_number", "prefix": "FIR No."}]}, {"type": "spacer", "height": 20}, {"type": "header", "style": {"bold": true, "align": "center", "underline": true}, "content": "PERSONAL BOND"}, {"type": "paragraph", "style": {"align": "justify", "line_height": 1.8}, "content": "I, {accused_name} S/o. Sh. {accused_parent} R/o {accused_address} Having been acquitted by this Hon’ble Court on {acquittal_date} in above said case FIR No. {fir_number} P.S. {ps_name} U/s {sections_law} and required to give surety for my attendance before the Hon’ble Court on condition that I shall attend the Hon’ble Appellate Court on every date of hearing in which any appeal filed against the judgment & Order of acquittal, passed by this Hon’ble Court and in case making default therein I myself undertake to forfeit to the Govt. of India the sum of Rs. {bond_amount}."}, {"type": "spacer", "height": 15}, {"type": "paragraph", "style": {"bold": true}, "content": "Delhi\\nDate:\\n\\nSignature"}, {"type": "spacer", "height": 20}, {"type": "header", "style": {"bold": true, "align": "center", "underline": true}, "content": "SURETY BOND"}, {"type": "paragraph", "style": {"align": "justify", "line_height": 1.8}, "content": "I, {surety_name} S/o. Sh. {surety_parent} R/o {surety_address} hereby declare myself for the above said Sh. {accused_name} S/o {accused_parent} shall attend the appellate court every date in which any appeal filed against the Judgment & Order of acquittal, passed by this Hon’ble Court and in case making default therein I myself undertake to forfeit to the Govt. of India the sum of Rs. {surety_amount}."}, {"type": "editable_line", "field": "date_day", "style": {"size": 11}, "prefix": "Dated this", "suffix": "day of"}, {"type": "editable_line", "field": "date_month_year", "style": {"size": 11}, "prefix": "", "suffix": "201"}, {"type": "spacer", "height": 30}, {"type": "signature_block", "style": {"align": "center"}, "content": "Presented by:"}, {"type": "signature_block", "style": {"align": "right"}, "content": "Signature"}, {"type": "spacer", "height": 50}, {"type": "header", "style": {"bold": true, "size": 24, "align": "center", "italic": true}, "content": "AFFIDAVIT"}, {"type": "spacer", "height": 20}, {"type": "paragraph", "style": {"align": "justify", "line_height": 1.5}, "content": "I, {deponent_name} son / daughter / wife of {deponent_parent} Aged about {deponent_age} R/o {deponent_address} do hereby solemnly affirm and declare as under..."}, {"type": "paragraph", "style": {"align": "justify"}, "content": "1. That deponent is the resident of above said address and having his/her Ration Card no. is {ration_card} and Election Card No. {election_card}."}, {"type": "paragraph", "style": {"align": "justify"}, "content": "2. That accused is {accused_relation} of the deponent and deponent has full control over him/her and capable to produce him/her before this hon’ble court."}, {"type": "paragraph", "style": {"align": "justify"}, "content": "3. That deponent is working as {work_desc} at {work_place} T/C. No. {tc_number} earns Rs. {income_amt} per month."}, {"type": "paragraph", "style": {"align": "justify"}, "content": "4. That deponent is the owner of household articles valued about of Rs. {articles_value}."}, {"type": "paragraph", "style": {"align": "justify"}, "content": "5. That deponent is the owner of the immovable property bearing No. {property_no} Measuring {property_size} sq. yards situated at {property_loc} valued not less than Rs. {property_value}."}, {"type": "paragraph", "style": {"align": "justify"}, "content": "6. That deponent undertakes to produce the accused before the honourable court on every date of hearing."}, {"type": "paragraph", "style": {"align": "justify"}, "content": "7. That I have an F.D.R. No. {fdr_no} Issued by {fdr_bank} For Rs. {fdr_amount}."}, {"type": "paragraph", "style": {"align": "justify"}, "content": "8. That I own a vehicle No. {vehicle_no} make {vehicle_make} R/C no {vehicle_rc} at present valued not less than Rs. {vehicle_value}."}, {"type": "spacer", "height": 20}, {"type": "header", "style": {"bold": true, "align": "right"}, "content": "DEPONENT"}, {"type": "header", "style": {"bold": true, "align": "left"}, "content": "VERIFICATION"}, {"type": "paragraph", "style": {"align": "justify"}, "content": "Verified at Delhi on this {verify_day} day of 200{verify_year} that the contents of this Affidavit are true and correct to the best of my knowledge & nothing material has been concealed therefrom, no part of it is untrue."}, {"type": "spacer", "height": 20}, {"type": "header", "style": {"bold": true, "align": "right"}, "content": "DEPONENT"}], "page_size": "A4"}	{}	completed	f	\N	f	\N	f	\N		2026-07-21 17:32:31.247748+05:30	2026-07-21 17:35:14.900612+05:30	b1b52cd7-2c03-48dc-871d-4f561ab1c206	a1567037-4f6e-4bbe-95ec-1653c35658b0	9a3b9470-80d4-444e-a370-55fd04bf185a	fb16216b-cb4d-4816-aaff-b2f11d1a6c0e			{}	f	2
f5918a81-62de-4c0a-a147-6ad26ca20471	{"margins": {"top": 40, "left": 40, "right": 40, "bottom": 40}, "sections": [{"type": "header", "style": {"bold": true, "size": 18, "align": "center"}, "content": "FORM. C.A.I."}, {"type": "header", "style": {"bold": true, "size": 14, "align": "center"}, "content": "(RULE)"}, {"type": "grid_row", "style": {"align": "right"}, "columns": [{"flex": 1, "field": "", "prefix": "Application for copy [ ]"}, {"flex": 0.5, "field": "", "prefix": "Urgent [ ]"}, {"flex": 0.5, "field": "", "prefix": "Ordinary [ ]"}]}, {"type": "spacer", "height": 20}, {"type": "grid_row", "columns": [{"flex": 1, "columns": [{"type": "editable_line", "field": "dist_officer", "prefix": "To the District Officer"}, {"type": "editable_line", "field": "applicant_name", "prefix": "Name of applicant"}, {"type": "editable_line", "field": "parent_name", "prefix": "W/o, D/o, S/o", "suffix": "Resident of"}, {"type": "editable_line", "field": "residence_addr", "prefix": ""}, {"type": "editable_line", "field": "po_dist", "prefix": "Post Office and District"}, {"type": "paragraph", "style": {"size": 10}, "content": "Description and number of the case from the record of which the copy is Required"}, {"type": "editable_line", "field": "case_desc_no", "prefix": ""}, {"type": "grid_row", "columns": [{"flex": 1, "field": "mauza", "prefix": "Mauza"}, {"flex": 1, "field": "ps", "prefix": "P.S."}]}, {"type": "grid_row", "columns": [{"flex": 1, "field": "goshwara", "prefix": "Goshwara No."}, {"flex": 1, "field": "district_name", "prefix": "District"}]}, {"type": "editable_line", "field": "parties_names", "prefix": "Name of Parties"}, {"type": "grid_row", "columns": [{"flex": 1.5, "field": "case_nature", "prefix": "Nature of case"}, {"flex": 1, "field": "decision_date", "prefix": "Date of Decision"}]}, {"type": "editable_line", "field": "next_date", "prefix": "Order Next date fixed"}, {"type": "editable_line", "field": "court_name_val", "prefix": "Name of Court"}]}, {"flex": 1, "columns": [{"type": "header", "style": {"bold": true, "size": 14, "align": "center"}, "content": "SPACE FOR COURT FEES STAMP"}, {"type": "spacer", "height": 100}, {"type": "editable_line", "field": "stamp_filed", "prefix": "Court fee Stamp filed"}, {"type": "grid_row", "columns": [{"flex": 1, "field": "stamp_num", "prefix": "Number"}, {"flex": 1, "field": "stamp_val", "prefix": "Value"}]}, {"type": "paragraph", "style": {"size": 10}, "content": "I copy to be sent by post or Will applicant attend in Person"}, {"type": "editable_line", "field": "attendance_mode", "prefix": ""}, {"type": "spacer", "height": 20}, {"type": "editable_line", "field": "sig_applicant", "prefix": "Signature"}, {"type": "editable_line", "field": "sig_date", "prefix": "Date"}, {"type": "editable_line", "field": "order_on_app", "prefix": "Order on application"}, {"type": "editable_line", "field": "sig_agent", "prefix": "Sig. Copying Agent"}, {"type": "editable_line", "field": "agent_date", "prefix": "Date"}, {"type": "editable_line", "field": "sig_recipient", "prefix": "Sig. Recipient"}, {"type": "editable_line", "field": "recipient_date", "prefix": "Date"}]}]}], "page_size": "A4"}	{}	completed	f	\N	f	\N	f	\N		2026-07-21 17:32:16.292344+05:30	2026-07-21 17:35:00.49427+05:30	b1b52cd7-2c03-48dc-871d-4f561ab1c206	a1567037-4f6e-4bbe-95ec-1653c35658b0	9a3b9470-80d4-444e-a370-55fd04bf185a	61da7640-6d5a-4e60-a521-1c4d547c2a22			{}	f	5
b33849c5-5b7a-4226-b0e9-b87be71d3b4b	{"margins": {"top": 72, "left": 72, "right": 72, "bottom": 72}, "sections": [{"type": "header", "style": {"bold": true, "size": 12, "align": "center", "underline": true}, "content": "Mobile-Email Details Collection Form for Litigants"}, {"type": "header", "style": {"size": 10, "align": "center"}, "content": "(Please use CAPITAL Letters Only)"}, {"type": "spacer", "height": 20}, {"rows": [{"cells": [{"flex": 1, "field": "court_complex", "label": "Court Complex"}]}, {"cells": [{"flex": 1, "field": "district_main", "label": "District"}]}, {"cells": [{"flex": 1, "label": "Litigants Name", "background": true}, {"flex": 1, "field": "surname"}, {"flex": 1, "field": "first_name"}, {"flex": 1, "field": "middle_name"}]}, {"cells": [{"flex": 1, "label": "", "background": true}, {"flex": 1, "text": "SURNAME"}, {"flex": 1, "text": "FIRST NAME"}, {"flex": 1, "text": "MIDDLE NAME"}]}, {"cells": [{"flex": 1, "label": "Date of Birth", "background": true}, {"flex": 1, "field": "dob_dd"}, {"flex": 1, "field": "dob_mm"}, {"flex": 1, "field": "dob_yyyy"}]}, {"cells": [{"flex": 1, "label": "", "background": true}, {"flex": 1, "text": "DD"}, {"flex": 1, "text": "MM"}, {"flex": 1, "text": "YYYY"}]}, {"cells": [{"flex": 1, "field": "address_line_1", "label": "Address"}]}, {"cells": [{"flex": 1, "field": "address_line_2", "label": ""}]}, {"cells": [{"flex": 1, "field": "address_line_3", "label": ""}]}, {"cells": [{"flex": 1, "field": "district_litigant", "label": "District"}]}, {"cells": [{"flex": 1, "field": "email_litigant", "label": "E-mail Address"}]}, {"cells": [{"flex": 1.5, "field": "mobile_no", "label": "Mobile No."}, {"flex": 1.5, "field": "phone_no", "label": "Phone No."}]}], "type": "form_grid"}, {"type": "spacer", "height": 50}, {"type": "grid_row", "columns": [{"flex": 1, "field": "date_val", "prefix": "Date :"}, {"flex": 0.5, "field": "month_val", "prefix": "/"}, {"flex": 0.5, "field": "year_val", "prefix": "/20"}, {"flex": 2, "align": "right", "field": "", "prefix": "Signature of Litigants"}]}, {"type": "spacer", "height": 40}, {"type": "paragraph", "style": {"align": "right"}, "content": "Signature of Advocate"}, {"type": "spacer", "height": 30}, {"type": "header", "style": {"align": "center"}, "content": "Verified by"}, {"type": "spacer", "height": 20}, {"type": "header", "style": {"align": "center"}, "content": "Asst.Supdt/Superintendent"}], "page_size": "A4"}	{"signature_offsets": {"advocate": {"x": 12.3388671875, "y": 4.052734375}}}	completed	t	2026-07-21 17:51:38.978477+05:30	f	\N	f	\N		2026-07-21 17:32:39.391657+05:30	2026-07-21 17:51:50.288721+05:30	b1b52cd7-2c03-48dc-871d-4f561ab1c206	a1567037-4f6e-4bbe-95ec-1653c35658b0	9a3b9470-80d4-444e-a370-55fd04bf185a	ff7b3d75-dba5-4b85-b079-c75c447ad018	signatures/advocate/signature_g7fuZ0M.png		{}	f	1
\.


--
-- Data for Name: documents_filledtemplate; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents_filledtemplate (id, filled_data, generated_file, status, is_shared_with_client, shared_at, client_signed, client_signed_at, advocate_signed, advocate_signed_at, notes, created_at, updated_at, case_id, client_id, created_by_id, firm_id, template_id, advocate_signature_image, client_signature_image) FROM stdin;
\.


--
-- Data for Name: documents_userdocument; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.documents_userdocument (id, document_type, document_number, document_file, verification_status, verification_notes, uploaded_at, verified_at, verified_by_id, case_id, document_category, client_id, deleted_at, deleted_by_id, description, document_title, firm_id, is_deleted, parent_document_id, updated_at, uploaded_by_id, version) FROM stdin;
4079c85c-f111-425d-9139-f26f47966568	other	TEST123456	documents/2026/04/08/test_doc.txt	pending		2026-04-08 16:59:41.693453+05:30	\N	\N	\N		\N	\N	\N	\N	\N	\N	f	\N	2026-04-16 16:27:46.620944+05:30	\N	1
2d97608e-559e-4212-95bf-33a71f81eb0f	other	TEST123456	documents/2026/04/08/test_doc_PmkH3bf.txt	pending		2026-04-08 17:14:21.081637+05:30	\N	\N	\N		\N	\N	\N	\N	\N	\N	f	\N	2026-04-16 16:27:46.620944+05:30	\N	1
a0777b9d-a4ca-441f-8b8c-a6e20f49292e	other	TEST123456	documents/2026/04/08/test_doc_xUAmGwa.txt	pending		2026-04-08 17:16:05.043096+05:30	\N	\N	\N		\N	\N	\N	\N	\N	\N	f	\N	2026-04-16 16:27:46.620944+05:30	\N	1
35a36d70-04e0-4c74-a743-f6c35be28fe0	other	TEST123456	documents/2026/04/08/test_doc_8t9S32y.txt	pending		2026-04-08 17:24:25.179585+05:30	\N	\N	\N		\N	\N	\N	\N	\N	\N	f	\N	2026-04-16 16:27:46.620944+05:30	\N	1
cb8c4cb2-0acc-47fe-8834-dcc0a1224693	aadhar	\N	documents/2026/04/16/completed_apis_list.txt	pending		2026-04-16 17:29:46.247377+05:30	\N	\N	\N	\N	\N	\N	\N	\N	admin	6ae6b893-969f-432d-a7f4-62e5f14af2d9	f	\N	2026-04-16 17:29:46.247394+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	1
24437ece-edaa-4762-9f43-88794b6abf6c	other	\N	documents/2026/04/17/Screenshot_from_2026-04-16_12-24-41.png	pending		2026-04-17 15:34:15.220862+05:30	\N	\N	\N	\N	\N	\N	\N	\N	my doc	9b2a3376-624e-4aff-8c05-746491e1c0fb	f	\N	2026-04-17 15:34:15.220887+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	1
91871aae-4c77-408e-95cd-1a2add184afd	other	\N	documents/2026/04/17/Screenshot_from_2026-04-16_12-24-41_mR9zenE.png	pending		2026-04-17 15:43:32.188356+05:30	\N	\N	\N	\N	\N	\N	\N	ewwew	Screenshot from 2026-04-16 12-24-41.png	9b2a3376-624e-4aff-8c05-746491e1c0fb	f	\N	2026-04-17 15:43:32.188372+05:30	744dd8b0-1403-4473-8d3a-2787f061c05a	1
630c2058-6f72-41de-a7e8-d411e9751b9d	order	\N	documents/2026/04/21/Screenshot_from_2026-04-20_17-09-17.png	pending		2026-04-21 10:02:54.996195+05:30	\N	\N	\N	\N	f4138337-247a-4a67-9a99-1fd5e7bcae90	\N	\N	\N	my document	eb995188-6dfb-4eba-9425-930f18d36d7f	f	\N	2026-04-21 10:02:54.996223+05:30	9b6e44a0-33b6-48b3-8d43-0f1de5234056	1
558ae619-94dd-4e87-a6e3-ee10353a7859	power_of_attorney	\N	documents/2026/04/21/Screenshot_from_2026-04-20_17-09-17_7tgBSAc.png	pending		2026-04-21 10:03:44.542137+05:30	\N	\N	\N	\N	\N	\N	\N	\N	this my document	eb995188-6dfb-4eba-9425-930f18d36d7f	f	\N	2026-04-21 10:03:44.542161+05:30	70dd5f3f-412e-4816-a258-6fc40c025bde	1
9ea75ab7-307c-4a0f-8dce-73fc7acb4530	other	\N	documents/2026/04/21/download.jpeg	pending		2026-04-21 10:22:37.743985+05:30	\N	\N	\N	\N	\N	\N	\N	\N	download.jpeg	6ae6b893-969f-432d-a7f4-62e5f14af2d9	f	\N	2026-04-21 10:22:37.744008+05:30	38aedcdc-d5cb-4eac-b5c4-64b44c96a9f5	1
d9ca4c5d-f35d-46dd-8616-540aa35922ee	aadhar	\N	documents/2026/04/21/Screenshot_from_2026-04-17_18-35-26.png	pending		2026-04-21 11:54:01.484242+05:30	\N	\N	\N	\N	f728f594-f735-4ed9-99e8-a2df4e47387d	\N	\N	\N	my document	5c0747c8-99d2-4104-9fb4-97dd465fdaae	f	\N	2026-04-21 11:54:01.484267+05:30	5c3c3793-5ad8-47c9-a31d-177ba7fc0081	1
fdcea433-f549-42a7-82ac-8ceda7dea948	aadhar	\N	documents/2026/05/02/download.jpg	pending		2026-05-02 12:39:06.89185+05:30	\N	\N	\N	\N	\N	\N	\N	OK	Aadhar Card	052bec83-a91a-418e-bd48-6ee1e0cd9dbf	f	\N	2026-05-02 12:39:06.891869+05:30	f331f893-75e1-4841-94f6-ac8a027a2439	1
f52c2171-65a0-4b99-a911-3fa23a386d95	order	\N	documents/2026/05/02/323_AMARESH_NAYAK.png	pending		2026-05-02 12:40:02.931429+05:30	\N	\N	\N	\N	\N	\N	\N	ok	Court Order	052bec83-a91a-418e-bd48-6ee1e0cd9dbf	f	\N	2026-05-02 12:40:02.931459+05:30	f331f893-75e1-4841-94f6-ac8a027a2439	1
4b07722e-5cad-42e9-ba76-8ffdfd036284	aadhar	\N	documents/2026/05/02/417_Soumya_Saurav.jpeg	pending		2026-05-02 15:05:16.305168+05:30	\N	\N	\N	\N	\N	\N	\N	OK	Aadhar Card	df8a95f7-2400-4747-8782-6a6e7642ce4c	f	\N	2026-05-02 15:05:16.30519+05:30	8b14eb83-f60f-43b7-860f-616947c11476	1
a25b3b4c-819c-4732-8374-d91a17a76c07	order	\N	documents/2026/05/02/417_Soumya_Saurav_jn0hyu9.jpeg	pending		2026-05-02 15:24:49.699164+05:30	\N	\N	\N	\N	\N	\N	\N	OK	Court Order	89cb5141-27cb-4e1a-9d85-89399b6032d4	f	\N	2026-05-02 15:24:49.699181+05:30	9cbb2fd8-6ae0-4277-972a-25bfaa0c523d	1
24f6e77d-a71f-4bdb-860d-35fc4fbceccd	aadhar	\N	documents/2026/05/05/228_Sri_Satyabrata_Mishra_Additional_District__Session_Judge.jpg	pending		2026-05-05 11:35:59.67955+05:30	\N	\N	\N	\N	\N	\N	\N	OK	Aadhar Card	197702cb-a3f7-4d43-a7cf-5b4d02a83ec4	f	\N	2026-05-05 11:35:59.679576+05:30	022eaecb-2f3f-4c8d-b887-7b8e629d7f8b	1
3fbe0e82-8e6d-42e6-bee1-2b4ee10e1d26	aadhar	\N	documents/2026/05/05/BSE_logo3.jpg	pending		2026-05-05 12:24:26.706395+05:30	\N	\N	\N	\N	\N	\N	\N	OK	Aadhar Card	23d1cff5-9768-47d8-b341-0cd2cf8367f9	f	\N	2026-05-05 12:24:26.706422+05:30	ac500223-29fe-42a1-ba68-b00039a4c545	1
8689c827-c3f3-407e-9882-3b318e80026f	pan	\N	documents/2026/05/05/cbse-logo.png	pending		2026-05-05 15:09:42.225866+05:30	\N	\N	\N	\N	\N	\N	\N	OK	PAN Card	a039273e-ee03-4e3b-807d-0bacfae01ab6	f	\N	2026-05-05 15:09:42.22589+05:30	49a1fd68-7dd7-4295-a85a-71e4797c6783	1
917e4697-c096-471f-a171-0f8f5248d21d	order	\N	documents/2026/05/06/Kapaleeswarar-temple-Hindu-Mylapore-Chennai-India-Tamil.jpg	pending		2026-05-06 12:24:31.105895+05:30	\N	\N	\N	\N	\N	\N	\N	OK	Court Order	afd98f7d-dd3d-47b5-a534-e535db042557	f	\N	2026-05-06 12:24:31.105917+05:30	c551fe95-428c-4435-96ce-2a87f4b46064	1
e04f7149-8d4a-4bda-83de-cda7d08f14a6	aadhar	\N	documents/2026/05/11/417_Soumya_Saurav.jpeg	pending		2026-05-11 15:09:39.735005+05:30	\N	\N	\N	\N	\N	\N	\N	OK	Aadhar Card	ff66fc5d-803a-4073-8300-96a29f497ce1	f	\N	2026-05-11 15:09:39.735024+05:30	6b1a8158-aac2-45be-90c2-c21769f73f7b	1
c52bcb3c-d35e-4262-ab80-097edc348a54	other	\N	documents/2026/05/11/chemistry_questions.pdf	pending		2026-05-11 16:41:47.968858+05:30	\N	\N	\N	\N	e72c42cb-4dac-40fb-aab4-38abf01560b9	\N	\N	sdsad	sdsa	\N	f	\N	2026-05-11 16:41:47.968873+05:30	f55a587a-2465-41fc-aa12-3975a18b21fb	1
47fdb773-e096-4bd0-a046-9c9d0ae778ac	vakalatnama	\N	documents/2026/05/13/Screenshot_from_2026-05-12_13-08-21.png	pending		2026-05-13 10:34:58.0321+05:30	\N	\N	\N	\N	\N	\N	\N	the case documents	vakalatnama	9b2a3376-624e-4aff-8c05-746491e1c0fb	f	\N	2026-05-13 10:34:58.032124+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	1
975ce6a2-9f07-4fd2-bf5a-bb3921b6a94b	other	\N	documents/2026/05/13/DOCUMENTS_AND_TEMPLATES_API_GUIDE_1.md	pending		2026-05-13 10:45:47.317515+05:30	\N	\N	\N	\N	\N	\N	\N	my doc	my doc	9b2a3376-624e-4aff-8c05-746491e1c0fb	f	\N	2026-05-13 10:45:47.31753+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	1
3f6b4593-61eb-4047-b836-fe21bf3ea44c	other	\N	documents/2026/05/13/documents_and_template_postman.json	pending		2026-05-13 11:36:33.528111+05:30	\N	\N	\N	\N	a1567037-4f6e-4bbe-95ec-1653c35658b0	\N	\N	doc for advo	my doc for advocate	9b2a3376-624e-4aff-8c05-746491e1c0fb	f	\N	2026-05-13 11:36:33.528124+05:30	184ee2bb-6bf9-4dc6-8e05-3620562c827e	1
7b461ecf-f96f-4f32-bdbb-212710d1c2ac	aadhar	\N	documents/2026/05/13/226_SK_DAS_RAY.png	pending		2026-05-13 12:56:19.046388+05:30	\N	\N	\N	\N	4332d851-4cc3-4af6-b4e8-79ed6b573272	\N	\N	OK	Aadhar Card	\N	f	\N	2026-05-13 12:56:19.046405+05:30	2264d078-daf3-456e-be50-112c6ca1a3f4	1
094d145b-2125-4b56-ad18-c17068ecbb24	other	\N	documents/2026/05/15/DI-INV000005_invoice_1.pdf	pending		2026-05-15 15:45:43.519902+05:30	\N	\N	b1b52cd7-2c03-48dc-871d-4f561ab1c206	\N	a1567037-4f6e-4bbe-95ec-1653c35658b0	\N	\N	for case purpose	case files	9b2a3376-624e-4aff-8c05-746491e1c0fb	f	\N	2026-05-15 15:45:43.519918+05:30	184ee2bb-6bf9-4dc6-8e05-3620562c827e	1
2946f3da-06da-49ee-82f4-a0f3f6949a3a	other	fsf	documents/2026/05/15/Screenshot_from_2026-05-15_15-47-53.png	pending		2026-05-15 15:52:13.871133+05:30	\N	\N	b1b52cd7-2c03-48dc-871d-4f561ab1c206	legal	a1567037-4f6e-4bbe-95ec-1653c35658b0	\N	\N	vzvvz	df	9b2a3376-624e-4aff-8c05-746491e1c0fb	f	\N	2026-05-15 15:52:13.871152+05:30	184ee2bb-6bf9-4dc6-8e05-3620562c827e	1
acd20c73-b506-4b4a-9274-bf0d13a833f0	other	doc111	documents/2026/05/15/DI-INV000005_invoice_1_5RdlzpD.pdf	pending		2026-05-15 16:10:49.686841+05:30	\N	\N	b1b52cd7-2c03-48dc-871d-4f561ab1c206	legal	a1567037-4f6e-4bbe-95ec-1653c35658b0	\N	\N	doc	doc	9b2a3376-624e-4aff-8c05-746491e1c0fb	f	\N	2026-05-15 16:10:49.686859+05:30	184ee2bb-6bf9-4dc6-8e05-3620562c827e	1
d3060ee7-fd35-4a4d-a08b-e954aa93b248	aadhar	\N	documents/2026/05/15/DOCUMENTS_AND_TEMPLATES_API_GUIDE_2.md	verified		2026-05-15 17:39:02.861336+05:30	2026-05-15 17:55:26.13208+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	b1b52cd7-2c03-48dc-871d-4f561ab1c206	legal	a1567037-4f6e-4bbe-95ec-1653c35658b0	\N	\N	\N	Aadhar Card	9b2a3376-624e-4aff-8c05-746491e1c0fb	f	\N	2026-05-15 17:55:26.132207+05:30	184ee2bb-6bf9-4dc6-8e05-3620562c827e	1
fe32f2d3-59d6-410f-9acf-2c95a61007be	aadhar	\N	documents/2026/05/15/Screenshot_from_2026-05-15_15-47-53_7PHiaXd.png	rejected	not vlear	2026-05-15 17:55:57.710475+05:30	2026-05-15 18:30:17.300677+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	b1b52cd7-2c03-48dc-871d-4f561ab1c206	legal	a1567037-4f6e-4bbe-95ec-1653c35658b0	\N	\N	\N	Aadhar Card	9b2a3376-624e-4aff-8c05-746491e1c0fb	f	\N	2026-05-15 18:30:17.300814+05:30	184ee2bb-6bf9-4dc6-8e05-3620562c827e	1
88eb1608-f36c-491d-99bc-19bb6328c046	aadhar	\N	documents/2026/05/18/228_Sri_Satyabrata_Mishra_Additional_District__Session_Judge.jpg	pending		2026-05-18 16:31:41.17507+05:30	\N	\N	\N	\N	\N	\N	\N	OK	Aadhar Card	\N	f	\N	2026-05-18 16:31:41.175084+05:30	e720e85d-111b-49cc-b86a-1aec508dc7a1	1
3b6354e5-d938-4bc2-9fb3-c549a01e21e7	aadhar	\N	documents/2026/05/18/cbse-logo.png	pending		2026-05-18 16:57:40.02074+05:30	\N	\N	\N	\N	\N	\N	\N	OK	Aadhar Card	8ac8fe12-9187-4ab5-a204-7801effe716b	f	\N	2026-05-18 16:57:40.020755+05:30	6d3d81da-93ab-4617-a05b-72948bad95b1	1
b4286046-7976-49a5-abe7-378213068282	aadhar	\N	documents/2026/05/15/Screenshot_from_2026-05-15_16-02-10.png	verified		2026-05-15 18:30:39.792195+05:30	2026-07-21 13:48:32.032045+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	b1b52cd7-2c03-48dc-871d-4f561ab1c206	legal	a1567037-4f6e-4bbe-95ec-1653c35658b0	\N	\N	\N	Aadhar Card	9b2a3376-624e-4aff-8c05-746491e1c0fb	f	\N	2026-07-21 13:48:32.032124+05:30	184ee2bb-6bf9-4dc6-8e05-3620562c827e	1
b9c3505f-666f-4c6d-94c1-1c3f5a4eb199	drafting	\N	documents/2026/07/25/operational-analysis-of-dashoapp-2-1-pdf.ltproj.json	verified		2026-07-25 11:32:38.144069+05:30	2026-07-25 11:32:38.138254+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	b1b52cd7-2c03-48dc-871d-4f561ab1c206	\N	\N	\N	\N	\N	operational-analysis-of-dashoapp-2-1-pdf.ltproj	9b2a3376-624e-4aff-8c05-746491e1c0fb	f	\N	2026-07-25 11:32:38.144077+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	1
cfdc8ff2-921f-494d-a143-bb0bd03d195c	drafting	\N	documents/2026/07/25/operational-analysis-of-dashoapp-2-1-pdf_ekvPx9D.ltproj.json	verified		2026-07-25 11:33:14.9534+05:30	2026-07-25 11:33:14.950343+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	b1b52cd7-2c03-48dc-871d-4f561ab1c206	\N	\N	\N	\N	\N	operational-analysis-of-dashoapp-2-1-pdf.ltproj	9b2a3376-624e-4aff-8c05-746491e1c0fb	f	\N	2026-07-25 11:33:14.953405+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	1
f15874c8-c683-4181-94ec-bdf5292fd7e3	drafting	\N	documents/2026/07/25/diracai-block-cutting-optimization-case-study-4-pdf.ltproj.json	verified		2026-07-25 11:34:12.162537+05:30	2026-07-25 11:34:12.161791+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	b1b52cd7-2c03-48dc-871d-4f561ab1c206	\N	\N	\N	\N	\N	diracai-block-cutting-optimization-case-study-4-pdf.ltproj	9b2a3376-624e-4aff-8c05-746491e1c0fb	f	\N	2026-07-25 11:34:12.162543+05:30	9a3b9470-80d4-444e-a370-55fd04bf185a	1
\.


--
-- Data for Name: firms_branch; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.firms_branch (id, branch_name, branch_code, city, state, address, phone_number, email, is_active, created_at, updated_at, firm_id) FROM stdin;
c17e9b3b-1b1a-4560-b80e-3f0fb47116e6	bbsr branch		Bhubaneswar	Odisha	Pl\nH	+8808847806814	bbsrbranch@gmail.com	t	2026-04-11 17:01:50.834222+05:30	2026-04-11 17:01:50.834243+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9
7b6156a4-4804-4646-b647-4ffa21879455	cuttackk	cutt100	cuttack	odisha	cuttack	1122334455	cuttackbranch@gmail.com	t	2026-04-11 17:04:07.384809+05:30	2026-04-17 11:46:51.613516+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9
8645b74b-51dc-4b14-b64c-71dbd4b77828	BBsr	BR09	Bhubaneswar	Odisha	kalinga vihar	7008566160	wdfwfd@gmail.com	t	2026-04-17 15:52:20.678528+05:30	2026-04-17 15:52:20.678547+05:30	9b2a3376-624e-4aff-8c05-746491e1c0fb
921fb527-5772-4b5b-ad65-52cef47bca6b	BarbilTown	BR090	Barbil	Odisha		4233325342	b1@gmail.com	t	2026-04-21 10:18:20.738634+05:30	2026-04-21 10:18:20.738661+05:30	eb995188-6dfb-4eba-9425-930f18d36d7f
0b597ba5-f5fb-456b-aa44-08e928808f36	Barbil Firm	Br235	Barbil	Odisha	Gurudwara Road	7008566160	branch@gmail.com	t	2026-04-21 11:47:52.786169+05:30	2026-04-21 11:47:52.786199+05:30	5c0747c8-99d2-4104-9fb4-97dd465fdaae
ff3e952b-9032-4295-8270-efe06dcad7b8	dsa	sdasd	dasd	dad	dad	3223323232	dada@333.vom	t	2026-05-04 15:22:29.683428+05:30	2026-05-04 15:22:29.683449+05:30	9b2a3376-624e-4aff-8c05-746491e1c0fb
0c86b284-9b49-4775-8e13-09810d606701	sadada	dadad	adadad	adadsad	dsadsada	4324324234	dsadad@vxgdg.cvbc	t	2026-05-06 13:52:54.694459+05:30	2026-05-06 13:52:54.694511+05:30	9b2a3376-624e-4aff-8c05-746491e1c0fb
19764ad1-9da0-4956-a95f-5b16a6787f7e	sdgsh	4334	Bhubaneswar	Odisha	dfdsfs	7008566160	shradhamilu160@gmail.com	t	2026-05-06 15:33:49.91275+05:30	2026-05-06 15:33:49.912772+05:30	58826cf1-716f-4a46-9cd6-bbb0277022bc
6c042335-4805-4883-919f-91f9fecd45d0	test bbsr	br5454	Bhubaneswar	Odisha	HIG- 243, K-5, Kalinga Vihar HIG- 243, K-5, Kalinga Vihar	7008566160	shradhamilu160@gmail.com	t	2026-05-06 16:25:47.290779+05:30	2026-05-06 16:25:47.290799+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9
38ba1911-6378-4da5-b523-ab10e3dbc0ad	New Common Branch	NEW002	Bhubaneswar	Odisha	Baramunda Bhubaneswar	7788994455	newcommon@gmail.com	t	2026-05-09 11:48:14.506857+05:30	2026-05-09 11:48:14.506881+05:30	9b2a3376-624e-4aff-8c05-746491e1c0fb
a800853d-8cfe-4e8e-b8dc-666ffdd24d3d	jajpur branch	jaj123	jajpur	odisha	Pl\nH	+918847888884	jajpur@gmail.com	t	2026-04-11 18:35:16.837784+05:30	2026-05-09 13:54:25.888062+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9
8694fe53-ed8d-438a-a4ed-7ce4496d554d	new branch patia	NEW005	bbsr	odisha	bbsr patia	4343323234	patiabranch@admin.com	t	2026-05-09 13:59:19.363606+05:30	2026-05-09 13:59:19.36363+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9
d9510d65-2ef2-45e4-aa39-11c4e06199bb	new branch baramunda	NE33	bbsr	odisha	BBSR, Odisha	1258456523	newbaramunda@branch.com	t	2026-05-09 16:04:07.022332+05:30	2026-05-09 16:04:07.022354+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9
f34cb11d-ca27-4a22-b266-b5598363b02c	new branch kalpana square	NEW009	BBSR	Odisha	Kalpana Square, BBSR	8565412565	kalpanabranch@lawfirm.com	t	2026-05-09 16:19:32.11759+05:30	2026-05-09 16:19:32.117612+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9
\.


--
-- Data for Name: firms_firm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.firms_firm (id, firm_name, firm_code, city, state, country, address, postal_code, phone_number, email, website, subscription_type, trial_end_date, subscription_start_date, subscription_end_date, is_active, created_at, updated_at, logo, partner_id, practice_areas, registration_number) FROM stdin;
1e0ab2b3-f52e-4793-b9fd-cdceecd59e06	Test Law Firm 1775647779	TEST1775647779	Mumbai	Maharashtra	India	123 Test Street	400001	+912212345678	test1775647779@lawfirm.com	https://testfirm.com	professional	\N	2026-04-08 16:59:40.130234+05:30	\N	t	2026-04-08 16:59:40.130273+05:30	2026-04-08 16:59:40.582925+05:30	\N	\N	[]	
cb467cd0-1330-4d2a-96f1-1f011714ae51	Test Law Firm 1775648631	TEST1775648631	Mumbai	Maharashtra	India	123 Test Street	400001	+912212345678	test1775648631@lawfirm.com	https://testfirm.com	professional	\N	2026-04-08 17:13:56.044283+05:30	\N	t	2026-04-08 17:13:56.044316+05:30	2026-04-08 17:14:01.908416+05:30	\N	\N	[]	
4dc8e120-5a0a-47d7-b5c9-5e5a1069e323	Test Law Firm 1775648754	TEST1775648754	Mumbai	Maharashtra	India	123 Test Street	400001	+912212345678	test1775648754@lawfirm.com	https://testfirm.com	professional	\N	2026-04-08 17:15:54.778989+05:30	\N	t	2026-04-08 17:15:54.779019+05:30	2026-04-08 17:15:59.173805+05:30	\N	\N	[]	
89139faa-b451-4c26-96ba-1d34635edb4b	Test Law Firm 1775649261	TEST1775649261	Mumbai	Maharashtra	India	123 Test Street	400001	+912212345678	test1775649261@lawfirm.com	https://testfirm.com	professional	\N	2026-04-08 17:24:21.291538+05:30	\N	t	2026-04-08 17:24:21.291574+05:30	2026-04-08 17:24:21.748577+05:30	\N	\N	[]	
44b23374-ad48-4a79-be52-8daca9fb0a72	Test Law Firm 1775649262	OXAD68ZD	Mumbai	Maharashtra	India	456 Legal Street, Mumbai	400002	+91976546342	firmowner1775649262@example.com		trial	\N	2026-04-08 17:24:23.024487+05:30	\N	t	2026-04-08 17:24:23.024508+05:30	2026-04-08 17:24:23.024514+05:30	\N	\N	[]	
7014678b-9497-462c-af84-faa7d0f279d0	ABC Lawfirm	GXCN1KI3	Bhubaneshwar	Odisha	India	Bhubaneswar, Odisha	751003	1234567890	firmowner@lawfirm.com		trial	\N	2026-04-09 11:20:56.529307+05:30	\N	t	2026-04-09 11:20:56.529337+05:30	2026-04-09 11:20:56.529342+05:30	\N	\N	[]	
163695ec-06e3-4bc9-abcc-c790adb731cc	Test Firm unique 1	JUSOB05M	Test City	Test State	India	Test Address	123456	9191919191	testadmin@examflow.com		trial	2026-04-24 12:19:17.798149+05:30	2026-04-09 12:19:17.798743+05:30	2026-04-24 12:19:17.798149+05:30	t	2026-04-09 12:19:17.798769+05:30	2026-04-09 12:19:17.798777+05:30	\N	\N	[]	
a8c373ce-cd7c-4252-ae9e-32aa6d8e7d77	Success Firm 1775717753	00Y8TNJ2	Bhubaneshwar	Odisha	India	Success Address	751003	91775717753	successtest1775717753@lawfirm.com		trial	2026-04-24 12:25:54.211083+05:30	2026-04-09 12:25:54.211702+05:30	2026-04-24 12:25:54.211083+05:30	t	2026-04-09 12:25:54.211729+05:30	2026-04-09 12:25:54.211737+05:30	\N	\N	[]	
e484ef42-c53a-4d91-99c9-a5306d58c639	Subrat lawfirm	PSDK07B3	Bhubaneshwar	Odisha	India	BBSR	751003	6655443322	subratbarik2003@gmail.com		trial	2026-04-24 13:07:01.187523+05:30	2026-04-09 13:07:01.188097+05:30	2026-04-24 13:07:01.187523+05:30	t	2026-04-09 13:07:01.188116+05:30	2026-04-09 13:07:01.188122+05:30	\N	\N	[]	
58c11394-bdea-4826-837b-e5c3a85bb0e0	ABC LAwfirm	45LP7WPY	Bhubaneshwar	Odisha	India	BBSR	751003	1122334455	abc@lawfirm.com		trial	2026-04-25 11:15:24.309682+05:30	2026-04-10 11:15:24.312027+05:30	2026-04-25 11:15:24.309682+05:30	t	2026-04-10 11:15:24.312055+05:30	2026-04-10 11:15:24.31206+05:30		\N	[]	
be1d8c7e-751e-4a30-83a9-2a9f684e3e42	Alok Lawfirm	2SGJ8AXE	Bhubaneshwar	Odisha	India	bbsr	751003	6372088453	alokbehera407@gmail.com		trial	2026-04-25 12:42:31.313708+05:30	2026-04-10 12:42:31.316937+05:30	2026-04-25 12:42:31.313708+05:30	t	2026-04-10 12:42:31.31699+05:30	2026-04-10 12:42:31.316999+05:30		\N	[]	
6a594f2e-0dee-4ce8-9698-ca1aab1f4b23	subrat	test002	Bhubaneswar	odisha	india	Plot-84,lane-3,road-2	751003	0000000000	subratbarik20038847@gmail.com		trial	\N	2026-04-10 17:01:45.191656+05:30	\N	t	2026-04-10 17:01:45.191701+05:30	2026-04-10 17:01:45.19171+05:30		\N	[]	
df8a95f7-2400-4747-8782-6a6e7642ce4c	Manas Ranjan Bohidar	Y7BYVMNY	Balangir	Odisha	India	Sagar para	767001	9439100105	bohidarranjanmanas80@gmail.com		trial	2026-06-01 15:04:08.917984+05:30	2026-05-02 15:04:08.919192+05:30	2026-06-01 15:04:08.917984+05:30	t	2026-05-02 15:04:08.919218+05:30	2026-05-02 15:04:08.919223+05:30		\N	[]	
8e7fd5a0-82d5-49ec-b47c-c122e1306186	ffdgf	fgfdg	fgfgf	Odisha	India	HIG- 243, K-5, Kalinga Vihar HIG- 243, K-5, Kalinga Vihar	751019	fgfdgff	fgdfgf@gmail.com		trial	\N	2026-04-11 15:29:13.582703+05:30	\N	t	2026-04-11 15:29:13.582757+05:30	2026-04-11 16:33:22.41865+05:30		\N	[]	
619fda7b-cdce-4b9f-8cde-4fdade1006db	ABC Law Firm Pvt Ltd	NXCM47Q2	Basudebpur	Odisha	India	HIG233	751003	8790278025	bibhu.phy.m@gmail.com		trial	2026-04-25 18:25:49.873358+05:30	2026-04-10 18:25:49.873925+05:30	2026-04-25 18:25:49.873358+05:30	t	2026-04-10 18:25:49.873948+05:30	2026-04-11 16:33:35.539485+05:30		\N	[]	
eb995188-6dfb-4eba-9425-930f18d36d7f	Basic Law firm	Law123	Barbil	Odisha	India	Gurudwara Road		+91 7867545678	barbil@gmail.com		trial	\N	2026-04-21 09:55:30.852418+05:30	\N	t	2026-04-21 09:55:30.852462+05:30	2026-04-21 09:55:38.853458+05:30	firm_logos/Screenshot_from_2026-04-20_16-39-06.png	\N	[]	
3c389772-1fb8-4472-9165-cd2607ecd66c	Basic law firm 2	32323	Barbil	Odisha	India	Barbil	758038	+91 6253773644	basic@gmail.com		trial	\N	2026-04-21 11:27:43.918463+05:30	\N	t	2026-04-21 11:27:43.918508+05:30	2026-04-21 11:27:52.370388+05:30	firm_logos/Screenshot_from_2026-04-20_16-39-06_gK8OjFb.png	\N	[]	
5c0747c8-99d2-4104-9fb4-97dd465fdaae	Ashutosh & associate	I63I1PET	Khallikot	Odisha	India	Bhubaneswar	751019	1232453645	aashutosh@gmail.com		trial	2026-05-06 11:43:37.646483+05:30	2026-04-21 11:43:37.64695+05:30	2026-05-06 11:43:37.646483+05:30	t	2026-04-21 11:43:37.646973+05:30	2026-04-21 11:43:37.646978+05:30		\N	[]	
1362c7a1-e7b3-40cf-846a-bdd37a526b5a	Accord Juris Associates	AJA230426	Bhubaneshwar	Odisha	India	Office no-303, Fortune Tower,Jeydev vihar	751016	+91 9895682364	info@accordjurisassosiates.com	https://aja.com/	trial	\N	2026-04-23 12:20:36.919086+05:30	\N	t	2026-04-23 12:20:36.919125+05:30	2026-04-23 12:20:46.59049+05:30	firm_logos/ChatGPT_Image_Apr_23_2026_12_17_23_PM.png	\N	[]	
89cb5141-27cb-4e1a-9d85-89399b6032d4	Satya Narayan Mishra	07SVMOI1	Sonepur	Odisha	India	District Judge Cadre	767017	887006928	www.satyanarayanmishra68@gmail.com		trial	2026-06-01 15:23:53.197988+05:30	2026-05-02 15:23:53.199908+05:30	2026-06-01 15:23:53.197988+05:30	t	2026-05-02 15:23:53.199956+05:30	2026-05-02 15:23:53.199965+05:30		\N	[]	
81663d19-18cb-45ac-a1c9-6a0d0c0d9e9d	testfirm2	testfirm2	bbsr	odisha	India	bbsr	751003	0000000000	testfirm2@gmail.com		basic	\N	2026-04-11 18:07:37.035702+05:30	\N	t	2026-04-11 18:07:37.035747+05:30	2026-04-17 13:51:04.02985+05:30		\N	[]	
047493f0-4349-4661-9815-987701d41bf7	Sameer Maharana	7HUJLIBG	Bhubaneshwar	Odisha	India	Bhubaneswar	751024	9567205948	sameermaharana@gmail.com		trial	2026-05-24 14:48:00.410296+05:30	2026-04-24 14:48:00.410905+05:30	2026-05-24 14:48:00.410296+05:30	t	2026-04-24 14:48:00.410939+05:30	2026-04-24 14:48:00.410947+05:30		\N	[]	
197702cb-a3f7-4d43-a7cf-5b4d02a83ec4	Nikhil Bohidar	ZZF1K52M	Balangir	Odisha	India	Sagar para	767001	9040202941	bohidarnikhil@gmail.com		trial	2026-06-04 11:34:00.302745+05:30	2026-05-05 11:34:00.305136+05:30	2026-06-04 11:34:00.302745+05:30	t	2026-05-05 11:34:00.305187+05:30	2026-05-05 11:34:00.305197+05:30		\N	[]	
23d1cff5-9768-47d8-b341-0cd2cf8367f9	Jayadev Mishra	EOJNYMCL	Bhubaneshwar	Odisha	India	Rajmahal Square	751024	8978022140	mishrajayadev92@gmail.com		trial	2026-06-04 12:23:34.310253+05:30	2026-05-05 12:23:34.311112+05:30	2026-06-04 12:23:34.310253+05:30	t	2026-05-05 12:23:34.311144+05:30	2026-05-05 12:23:34.311152+05:30		\N	[]	
123bbba8-686e-47b1-994e-4ad072952e09	xyzz Lawfirm	test001	BBSR	odisha	India	bhubaneswar	751003	12121212	abc@xyz.com		trial	\N	2026-04-10 16:52:45.108951+05:30	\N	t	2026-04-10 16:52:45.10899+05:30	2026-04-17 13:59:23.956648+05:30		\N	[]	
a039273e-ee03-4e3b-807d-0bacfae01ab6	Sushil Kumar	FC61N5MV	Patna	Bihar	India	Begusarai	0612	8456007230	kumarsushil@gmail.com		trial	2026-06-04 15:09:00.822488+05:30	2026-05-05 15:09:00.82336+05:30	2026-06-04 15:09:00.822488+05:30	t	2026-05-05 15:09:00.823397+05:30	2026-05-05 15:09:00.823405+05:30		\N	[]	
ff66fc5d-803a-4073-8300-96a29f497ce1	Chakradhar Panda	SHZ9U2RB	Bhubaneshwar	Odisha	India	Kanan vihar	751024	7873099999	www.chakradharpanda@gmail.com		trial	2026-06-10 15:08:37.452355+05:30	2026-05-11 15:08:37.452829+05:30	2026-06-10 15:08:37.452355+05:30	t	2026-05-11 15:08:37.45285+05:30	2026-05-11 15:08:37.452854+05:30		\N	[]	
6ae6b893-969f-432d-a7f4-62e5f14af2d9	XYZZ Lawfirm	ZE2RC0XT	Bhubaneshwar	Odisha	India	Bhubaneswar,odisha	751003	0987654321	firmowner1@lawfirm.com		enterprise	2026-04-24 01:39:00+05:30	2026-04-09 12:39:42.783299+05:30	2026-06-08 13:55:06.237689+05:30	t	2026-04-09 12:39:42.783325+05:30	2026-05-09 13:55:06.246964+05:30	firm_logos/download_DaNQdML.jpeg	\N	[]	
052bec83-a91a-418e-bd48-6ee1e0cd9dbf	Priya Ranjan Bohidar	RUWOMQ23	Balangir	Odisha	India	A.B.S.S Road Balangir	767001	9437241873	bohidarranjanpriya@gmail.com		trial	2026-06-01 12:38:03.018585+05:30	2026-05-02 12:38:03.024489+05:30	2026-06-01 12:38:03.018585+05:30	t	2026-05-02 12:38:03.024542+05:30	2026-05-02 12:38:03.02455+05:30		\N	[]	
afd98f7d-dd3d-47b5-a534-e535db042557	Ramakant Reddy	KVFPZPQK	Hyderabad	Telangana	India	Gandhi Nagar	040	9750023459	reddyramakant@gmail.com		trial	2026-06-05 12:23:17.817933+05:30	2026-05-06 12:23:17.818431+05:30	2026-06-05 12:23:17.817933+05:30	t	2026-05-06 12:23:17.818456+05:30	2026-05-06 12:23:17.818461+05:30		\N	[]	
58826cf1-716f-4a46-9cd6-bbb0277022bc	ededew	CS8S50XA	Qobustan	Gobustan District	Azerbaijan	ccsdc	3222	9988998899	dfsfdsf@gmail.com		professional	2026-06-05 10:02:00+05:30	2026-05-06 15:32:00.547274+05:30	2026-06-05 10:05:00+05:30	t	2026-05-06 15:32:00.547305+05:30	2026-05-09 16:02:03.27144+05:30		\N	[]	
8ac8fe12-9187-4ab5-a204-7801effe716b	Minakhi Rout	QHYEEY9M	Bhubaneshwar	Odisha	India	Kalinga Vihar	751024	9861108590	routminakhi@gmail.com		trial	2026-06-17 16:56:49.327926+05:30	2026-05-18 16:56:49.328366+05:30	2026-06-17 16:56:49.327926+05:30	t	2026-05-18 16:56:49.328386+05:30	2026-05-18 16:56:49.328391+05:30		\N	[]	
9b2a3376-624e-4aff-8c05-746491e1c0fb	Saxena & Saxena Lawfirms	AWBGO2MN	Bhubaneshwar	Odisha	India	Bhubaneswar	751003	7008639752	saxenalawfirm@gmail.com		professional	2026-04-28 00:43:00+05:30	2026-04-15 18:43:19.254671+05:30	2026-08-30 17:34:50.563298+05:30	t	2026-04-15 18:43:19.254696+05:30	2026-07-31 17:34:50.568419+05:30	firm_logos/download.jpeg	\N	[]	
\.


--
-- Data for Name: partners_partner; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.partners_partner (id, company_name, registration_number, commission_percentage, status, created_at, updated_at, user_id) FROM stdin;
\.


--
-- Data for Name: subscriptions_firmsubscription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriptions_firmsubscription (id, status, start_date, end_date, is_trial, auto_renew, external_subscription_id, external_customer_id, created_at, updated_at, firm_id, plan_id) FROM stdin;
27cff651-0d11-4a22-bb5c-14caa0bff54f	active	2026-05-06 15:35:28.976885+05:30	2026-06-05 15:35:28.974451+05:30	f	t	\N	\N	2026-05-06 15:35:28.976925+05:30	2026-05-06 15:35:28.976931+05:30	58826cf1-716f-4a46-9cd6-bbb0277022bc	da973639-6c65-48ec-b23f-09568671748f
ccbeec86-3943-4d83-be2f-971c1ff72498	active	2026-05-05 15:35:31.064607+05:30	2026-06-08 13:55:06.237689+05:30	f	t	\N	\N	2026-05-05 15:35:31.064646+05:30	2026-05-09 13:55:06.24393+05:30	6ae6b893-969f-432d-a7f4-62e5f14af2d9	4f468d40-a761-4e26-a7f5-a4f8e45c7534
a8e1ac3f-5b09-4fd7-a3a1-b9a504e52328	active	2026-05-01 13:53:43.457982+05:30	2026-08-30 17:34:50.563298+05:30	f	t	\N	\N	2026-05-01 13:53:43.45802+05:30	2026-07-31 17:34:50.564557+05:30	9b2a3376-624e-4aff-8c05-746491e1c0fb	81d8de45-4415-42f8-8864-8e2b7d9d7812
\.


--
-- Data for Name: subscriptions_platforminvoice; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriptions_platforminvoice (id, invoice_number, invoice_date, due_date, period_start, period_end, plan_amount, tax_percentage, tax_amount, total_amount, paid_amount, balance_due, status, payment_date, payment_method, transaction_id, payment_notes, notes, internal_notes, sent_date, created_at, updated_at, created_by_id, firm_id, subscription_plan_id) FROM stdin;
fb37d16f-fcd9-4b36-8bf9-80259e0e78ef	PLAT-2024-001	2024-05-01	2024-05-31	2024-05-01	2024-05-31	2499.00	18.00	449.82	2948.82	2948.82	0.00	paid	2026-05-04	bank_transfer	TXN-2024-001	Payment received via bank transfer	Updated: Monthly subscription for May 2024	Reviewed and updated by admin	2026-05-04 13:43:36.97511+05:30	2026-05-04 13:40:57.793477+05:30	2026-05-04 13:44:05.159274+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	89cb5141-27cb-4e1a-9d85-89399b6032d4	81d8de45-4415-42f8-8864-8e2b7d9d7812
7e1022c1-feaf-4250-a20f-113d7d81f126	PLAT-2026-7110	2026-05-04	2026-06-03	2026-05-04	2026-06-03	999.00	18.00	179.82	1178.82	0.00	1178.82	sent	\N				Monthly subscription		2026-05-04 15:25:18.321336+05:30	2026-05-04 15:24:24.11389+05:30	2026-05-04 16:05:17.571547+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	9b2a3376-624e-4aff-8c05-746491e1c0fb	d6b8bcb2-37d5-49fe-b6b5-76081ac38a1d
34fd0a8b-bcb5-4bec-971f-86466754e32a	PLAT-2026-3823	2026-05-04	2026-06-03	2026-05-04	2026-06-03	2499.00	18.00	449.82	2948.82	0.00	2948.82	sent	\N				Monthly subscription		2026-05-04 18:12:37.958387+05:30	2026-05-04 18:12:31.460923+05:30	2026-05-04 18:12:37.95857+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	9b2a3376-624e-4aff-8c05-746491e1c0fb	81d8de45-4415-42f8-8864-8e2b7d9d7812
5d4a46b4-537e-4ce4-8472-20b2b93a027d	PLAT-2026-8042	2026-05-06	2026-06-05	2026-05-06	2026-06-05	999.00	18.00	179.82	1178.82	0.00	1178.82	sent	\N				Monthly subscription		2026-05-06 15:22:52.577228+05:30	2026-05-06 15:22:40.741136+05:30	2026-05-06 15:22:52.577401+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	5c0747c8-99d2-4104-9fb4-97dd465fdaae	d6b8bcb2-37d5-49fe-b6b5-76081ac38a1d
d7a6d11d-b984-4bd8-be9a-b21d15b4232b	PLAT-2026-8015	2026-05-06	2026-06-05	2026-05-06	2026-06-05	999.00	18.00	179.82	1178.82	0.00	1178.82	sent	\N				Monthly subscription		2026-05-06 16:14:17.25775+05:30	2026-05-06 16:14:04.774059+05:30	2026-05-06 16:14:17.258016+05:30	ce8ce90c-be9b-49de-a959-f8459663593a	5c0747c8-99d2-4104-9fb4-97dd465fdaae	d6b8bcb2-37d5-49fe-b6b5-76081ac38a1d
9b313472-ed62-4b88-a60f-6a63b5770dff	SUB-2026-00006	2026-05-09	2026-06-08	2026-05-09	2026-06-08	2299.00	18.00	413.82	2712.82	0.00	2712.82	sent	\N	bank_transfer	111		Subscription upgrade to hero plan plan - 1 month(s)		\N	2026-05-09 16:38:10.81066+05:30	2026-05-09 16:38:10.810671+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	511cdf50-8d6d-4878-b1c4-2304f37baf5b
92a167ff-4595-4f43-9c2c-d3cfdfec3819	SUB-2026-00007	2026-07-15	2026-08-14	2026-07-15	2026-08-14	2499.00	18.00	449.82	2948.82	0.00	2948.82	sent	\N	bank_transfer	cdfcd		Subscription upgrade to Business plan - 1 month(s)		\N	2026-07-15 11:07:29.877691+05:30	2026-07-15 11:07:29.877702+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	81d8de45-4415-42f8-8864-8e2b7d9d7812
49c80d0e-a257-48d1-8d3a-f200951c100e	SUB-2026-00008	2026-07-31	2026-08-30	2026-07-31	2026-08-30	0.00	18.00	0.00	0.00	0.00	0.00	paid	\N	bank_transfer	xxfc		Subscription upgrade to Trial plan - 1 month(s)		\N	2026-07-31 17:34:42.079115+05:30	2026-07-31 17:34:42.079122+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	da973639-6c65-48ec-b23f-09568671748f
fa7059c1-a059-4c4c-bb72-27c86098b25e	SUB-2026-00009	2026-07-31	2026-08-30	2026-07-31	2026-08-30	2499.00	18.00	449.82	2948.82	0.00	2948.82	sent	\N	bank_transfer	xxfc		Subscription upgrade to Business plan - 1 month(s)		\N	2026-07-31 17:34:50.576071+05:30	2026-07-31 17:34:50.576078+05:30	afabcd85-1495-4ad4-8799-9a82f15c2d89	9b2a3376-624e-4aff-8c05-746491e1c0fb	81d8de45-4415-42f8-8864-8e2b7d9d7812
\.


--
-- Data for Name: subscriptions_subscriptionplan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.subscriptions_subscriptionplan (id, name, plan_type, description, price, billing_cycle, max_users, max_cases, max_storage_gb, features, is_active, created_at, updated_at, enable_api_access, enable_billing, enable_calendar, enable_documents, enable_reports, max_admins, max_advocates, max_branches, max_clients, max_paralegals) FROM stdin;
da973639-6c65-48ec-b23f-09568671748f	Trial	basic	Perfect to explore and test the platform features.	0.00	monthly	3	10	1	{"support": "community", "api_access": false, "trial_days": 14, "white_labeling": false, "automated_billing": false, "advanced_reporting": false}	t	2026-05-01 12:32:17.417286+05:30	2026-05-01 12:32:17.417321+05:30	f	f	t	t	f	1	1	1	5	1
81d8de45-4415-42f8-8864-8e2b7d9d7812	Business	professional	Comprehensive suite for growing law firms.	2499.00	monthly	120	999999	100	{"support": "priority_24_7", "api_access": false, "white_labeling": false, "automated_billing": true, "advanced_reporting": true}	t	2026-05-01 12:32:17.425576+05:30	2026-05-07 17:13:46.462967+05:30	t	t	t	t	t	10	50	10	999999	50
4f468d40-a761-4e26-a7f5-a4f8e45c7534	Enterprise	enterprise	Custom solutions for large legal enterprises.	0.00	monthly	999999	999999	999999	{"support": "dedicated", "api_access": true, "custom_domain": true, "white_labeling": true, "automated_billing": true, "advanced_reporting": true, "dedicated_account_manager": true}	t	2026-05-01 12:32:17.42883+05:30	2026-05-07 17:16:36.497314+05:30	t	t	t	t	t	999999	999999	999999	999999	999999
d6b8bcb2-37d5-49fe-b6b5-76081ac38a1d	Basic	basic	Essential tools for independent advocates.	999.00	monthly	15	200	10	{"support": "email", "api_access": false, "white_labeling": false, "automated_billing": false, "advanced_reporting": false}	t	2026-05-01 12:32:17.422236+05:30	2026-05-07 17:16:47.796974+05:30	t	t	t	t	f	2	5	1	50	5
511cdf50-8d6d-4878-b1c4-2304f37baf5b	hero plan	basic		2299.00	monthly	1000	50	10	{}	t	2026-05-07 18:14:43.985894+05:30	2026-05-07 18:14:43.985924+05:30	f	t	t	t	f	1	5	1	100	5
\.


--
-- Data for Name: tasks_task; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tasks_task (id, title, description, status, due_date, created_at, updated_at, assigned_to_id, firm_id) FROM stdin;
\.


--
-- Name: accounts_customuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_customuser_groups_id_seq', 1, false);


--
-- Name: accounts_customuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_customuser_user_permissions_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 184, true);


--
-- Name: calendar_events_calendarevent_assigned_to_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.calendar_events_calendarevent_assigned_to_id_seq', 36, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 46, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 90, true);


--
-- Name: accounts_advocateparalegalassignment accounts_advocateparaleg_advocate_id_paralegal_id_6645d803_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_advocateparalegalassignment
    ADD CONSTRAINT accounts_advocateparaleg_advocate_id_paralegal_id_6645d803_uniq UNIQUE (advocate_id, paralegal_id, firm_id);


--
-- Name: accounts_advocateparalegalassignment accounts_advocateparalegalassignment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_advocateparalegalassignment
    ADD CONSTRAINT accounts_advocateparalegalassignment_pkey PRIMARY KEY (id);


--
-- Name: accounts_customuser accounts_customuser_aadhar_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser
    ADD CONSTRAINT accounts_customuser_aadhar_number_key UNIQUE (aadhar_number);


--
-- Name: accounts_customuser_groups accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser_groups_customuser_id_group_id_c074bdcb_uniq UNIQUE (customuser_id, group_id);


--
-- Name: accounts_customuser_groups accounts_customuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser_groups_pkey PRIMARY KEY (id);


--
-- Name: accounts_customuser accounts_customuser_pan_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser
    ADD CONSTRAINT accounts_customuser_pan_number_key UNIQUE (pan_number);


--
-- Name: accounts_customuser accounts_customuser_phone_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser
    ADD CONSTRAINT accounts_customuser_phone_number_key UNIQUE (phone_number);


--
-- Name: accounts_customuser accounts_customuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser
    ADD CONSTRAINT accounts_customuser_pkey PRIMARY KEY (id);


--
-- Name: accounts_customuser_user_permissions accounts_customuser_user_customuser_id_permission_9632a709_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions
    ADD CONSTRAINT accounts_customuser_user_customuser_id_permission_9632a709_uniq UNIQUE (customuser_id, permission_id);


--
-- Name: accounts_customuser_user_permissions accounts_customuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions
    ADD CONSTRAINT accounts_customuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: accounts_customuser accounts_customuser_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser
    ADD CONSTRAINT accounts_customuser_username_key UNIQUE (username);


--
-- Name: accounts_firmjoinlink accounts_firmjoinlink_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_firmjoinlink
    ADD CONSTRAINT accounts_firmjoinlink_pkey PRIMARY KEY (id);


--
-- Name: accounts_globalconfiguration accounts_globalconfiguration_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_globalconfiguration
    ADD CONSTRAINT accounts_globalconfiguration_pkey PRIMARY KEY (id);


--
-- Name: accounts_logincredential accounts_logincredential_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_logincredential
    ADD CONSTRAINT accounts_logincredential_pkey PRIMARY KEY (id);


--
-- Name: accounts_logincredential accounts_logincredential_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_logincredential
    ADD CONSTRAINT accounts_logincredential_user_id_key UNIQUE (user_id);


--
-- Name: accounts_logincredential accounts_logincredential_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_logincredential
    ADD CONSTRAINT accounts_logincredential_username_key UNIQUE (username);


--
-- Name: accounts_otpverification accounts_otpverification_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_otpverification
    ADD CONSTRAINT accounts_otpverification_pkey PRIMARY KEY (id);


--
-- Name: accounts_userfirmrole accounts_userfirmrole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userfirmrole
    ADD CONSTRAINT accounts_userfirmrole_pkey PRIMARY KEY (id);


--
-- Name: accounts_userfirmrole accounts_userfirmrole_user_id_firm_id_cd0c5ad8_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userfirmrole
    ADD CONSTRAINT accounts_userfirmrole_user_id_firm_id_cd0c5ad8_uniq UNIQUE (user_id, firm_id);


--
-- Name: accounts_userinvitation accounts_userinvitation_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userinvitation
    ADD CONSTRAINT accounts_userinvitation_pkey PRIMARY KEY (id);


--
-- Name: audit_auditlog audit_auditlog_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_auditlog
    ADD CONSTRAINT audit_auditlog_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: billing_advocateinvoice billing_advocateinvoice_invoice_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_advocateinvoice
    ADD CONSTRAINT billing_advocateinvoice_invoice_number_key UNIQUE (invoice_number);


--
-- Name: billing_advocateinvoice billing_advocateinvoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_advocateinvoice
    ADD CONSTRAINT billing_advocateinvoice_pkey PRIMARY KEY (id);


--
-- Name: billing_expense billing_expense_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_expense
    ADD CONSTRAINT billing_expense_pkey PRIMARY KEY (id);


--
-- Name: billing_invoice billing_invoice_invoice_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_invoice
    ADD CONSTRAINT billing_invoice_invoice_number_key UNIQUE (invoice_number);


--
-- Name: billing_invoice billing_invoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_invoice
    ADD CONSTRAINT billing_invoice_pkey PRIMARY KEY (id);


--
-- Name: billing_payment billing_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_payment
    ADD CONSTRAINT billing_payment_pkey PRIMARY KEY (id);


--
-- Name: billing_timeentry billing_timeentry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_timeentry
    ADD CONSTRAINT billing_timeentry_pkey PRIMARY KEY (id);


--
-- Name: billing_trustaccount billing_trustaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_trustaccount
    ADD CONSTRAINT billing_trustaccount_pkey PRIMARY KEY (id);


--
-- Name: calendar_events_calendarevent_assigned_to calendar_events_calendar_calendarevent_id_customu_4d1d0cd2_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendar_events_calendarevent_assigned_to
    ADD CONSTRAINT calendar_events_calendar_calendarevent_id_customu_4d1d0cd2_uniq UNIQUE (calendarevent_id, customuser_id);


--
-- Name: calendar_events_calendarevent_assigned_to calendar_events_calendarevent_assigned_to_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendar_events_calendarevent_assigned_to
    ADD CONSTRAINT calendar_events_calendarevent_assigned_to_pkey PRIMARY KEY (id);


--
-- Name: calendar_events_calendarevent calendar_events_calendarevent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendar_events_calendarevent
    ADD CONSTRAINT calendar_events_calendarevent_pkey PRIMARY KEY (id);


--
-- Name: cases_case cases_case_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_case
    ADD CONSTRAINT cases_case_pkey PRIMARY KEY (id);


--
-- Name: cases_caseactivity cases_caseactivity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_caseactivity
    ADD CONSTRAINT cases_caseactivity_pkey PRIMARY KEY (id);


--
-- Name: cases_casedocumentchecklistitem cases_casedocumentchecklistitem_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_casedocumentchecklistitem
    ADD CONSTRAINT cases_casedocumentchecklistitem_pkey PRIMARY KEY (id);


--
-- Name: cases_casedocumentrequest cases_casedocumentrequest_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_casedocumentrequest
    ADD CONSTRAINT cases_casedocumentrequest_pkey PRIMARY KEY (id);


--
-- Name: cases_casedraft cases_casedraft_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_casedraft
    ADD CONSTRAINT cases_casedraft_pkey PRIMARY KEY (id);


--
-- Name: cases_caseresearch cases_caseresearch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_caseresearch
    ADD CONSTRAINT cases_caseresearch_pkey PRIMARY KEY (id);


--
-- Name: cases_documentchecklist cases_documentchecklist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_documentchecklist
    ADD CONSTRAINT cases_documentchecklist_pkey PRIMARY KEY (id);


--
-- Name: cases_hearing cases_hearing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_hearing
    ADD CONSTRAINT cases_hearing_pkey PRIMARY KEY (id);


--
-- Name: cases_legalnotice cases_legalnotice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_legalnotice
    ADD CONSTRAINT cases_legalnotice_pkey PRIMARY KEY (id);


--
-- Name: cases_serviceattempt cases_serviceattempt_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_serviceattempt
    ADD CONSTRAINT cases_serviceattempt_pkey PRIMARY KEY (id);


--
-- Name: clients_client clients_client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients_client
    ADD CONSTRAINT clients_client_pkey PRIMARY KEY (id);


--
-- Name: clients_client clients_client_user_account_id_firm_id_4368eede_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients_client
    ADD CONSTRAINT clients_client_user_account_id_firm_id_4368eede_uniq UNIQUE (user_account_id, firm_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: documents_courtformtemplate documents_courtformtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_courtformtemplate
    ADD CONSTRAINT documents_courtformtemplate_pkey PRIMARY KEY (id);


--
-- Name: documents_documenttemplate documents_documenttemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_documenttemplate
    ADD CONSTRAINT documents_documenttemplate_pkey PRIMARY KEY (id);


--
-- Name: documents_filledcourtform documents_filledcourtform_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_filledcourtform
    ADD CONSTRAINT documents_filledcourtform_pkey PRIMARY KEY (id);


--
-- Name: documents_filledtemplate documents_filledtemplate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_filledtemplate
    ADD CONSTRAINT documents_filledtemplate_pkey PRIMARY KEY (id);


--
-- Name: documents_userdocument documents_userdocument_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_userdocument
    ADD CONSTRAINT documents_userdocument_pkey PRIMARY KEY (id);


--
-- Name: firms_branch firms_branch_firm_id_branch_name_f6cf533f_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firms_branch
    ADD CONSTRAINT firms_branch_firm_id_branch_name_f6cf533f_uniq UNIQUE (firm_id, branch_name);


--
-- Name: firms_branch firms_branch_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firms_branch
    ADD CONSTRAINT firms_branch_pkey PRIMARY KEY (id);


--
-- Name: firms_firm firms_firm_firm_code_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firms_firm
    ADD CONSTRAINT firms_firm_firm_code_key UNIQUE (firm_code);


--
-- Name: firms_firm firms_firm_firm_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firms_firm
    ADD CONSTRAINT firms_firm_firm_name_key UNIQUE (firm_name);


--
-- Name: firms_firm firms_firm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firms_firm
    ADD CONSTRAINT firms_firm_pkey PRIMARY KEY (id);


--
-- Name: partners_partner partners_partner_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_partner
    ADD CONSTRAINT partners_partner_pkey PRIMARY KEY (id);


--
-- Name: partners_partner partners_partner_user_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_partner
    ADD CONSTRAINT partners_partner_user_id_key UNIQUE (user_id);


--
-- Name: subscriptions_firmsubscription subscriptions_firmsubscription_firm_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions_firmsubscription
    ADD CONSTRAINT subscriptions_firmsubscription_firm_id_key UNIQUE (firm_id);


--
-- Name: subscriptions_firmsubscription subscriptions_firmsubscription_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions_firmsubscription
    ADD CONSTRAINT subscriptions_firmsubscription_pkey PRIMARY KEY (id);


--
-- Name: subscriptions_platforminvoice subscriptions_platforminvoice_invoice_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions_platforminvoice
    ADD CONSTRAINT subscriptions_platforminvoice_invoice_number_key UNIQUE (invoice_number);


--
-- Name: subscriptions_platforminvoice subscriptions_platforminvoice_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions_platforminvoice
    ADD CONSTRAINT subscriptions_platforminvoice_pkey PRIMARY KEY (id);


--
-- Name: subscriptions_subscriptionplan subscriptions_subscriptionplan_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions_subscriptionplan
    ADD CONSTRAINT subscriptions_subscriptionplan_pkey PRIMARY KEY (id);


--
-- Name: tasks_task tasks_task_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks_task
    ADD CONSTRAINT tasks_task_pkey PRIMARY KEY (id);


--
-- Name: accounts_ad_advocat_709825_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_ad_advocat_709825_idx ON public.accounts_advocateparalegalassignment USING btree (advocate_id, firm_id);


--
-- Name: accounts_ad_is_acti_f20e9c_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_ad_is_acti_f20e9c_idx ON public.accounts_advocateparalegalassignment USING btree (is_active);


--
-- Name: accounts_ad_paraleg_280fec_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_ad_paraleg_280fec_idx ON public.accounts_advocateparalegalassignment USING btree (paralegal_id, firm_id);


--
-- Name: accounts_advocateparalegalassignment_advocate_id_4ff07a31; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_advocateparalegalassignment_advocate_id_4ff07a31 ON public.accounts_advocateparalegalassignment USING btree (advocate_id);


--
-- Name: accounts_advocateparalegalassignment_assigned_by_id_bb4f3d7f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_advocateparalegalassignment_assigned_by_id_bb4f3d7f ON public.accounts_advocateparalegalassignment USING btree (assigned_by_id);


--
-- Name: accounts_advocateparalegalassignment_firm_id_68a91971; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_advocateparalegalassignment_firm_id_68a91971 ON public.accounts_advocateparalegalassignment USING btree (firm_id);


--
-- Name: accounts_advocateparalegalassignment_paralegal_id_82bbed5e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_advocateparalegalassignment_paralegal_id_82bbed5e ON public.accounts_advocateparalegalassignment USING btree (paralegal_id);


--
-- Name: accounts_cu_email_5ce40b_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_cu_email_5ce40b_idx ON public.accounts_customuser USING btree (email);


--
-- Name: accounts_cu_firm_id_136e62_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_cu_firm_id_136e62_idx ON public.accounts_customuser USING btree (firm_id);


--
-- Name: accounts_cu_phone_n_908ea4_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_cu_phone_n_908ea4_idx ON public.accounts_customuser USING btree (phone_number);


--
-- Name: accounts_cu_user_ty_97b0bf_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_cu_user_ty_97b0bf_idx ON public.accounts_customuser USING btree (user_type);


--
-- Name: accounts_customuser_aadhar_number_4850f478_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_customuser_aadhar_number_4850f478_like ON public.accounts_customuser USING btree (aadhar_number varchar_pattern_ops);


--
-- Name: accounts_customuser_firm_id_55594c84; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_customuser_firm_id_55594c84 ON public.accounts_customuser USING btree (firm_id);


--
-- Name: accounts_customuser_groups_customuser_id_bc55088e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_customuser_groups_customuser_id_bc55088e ON public.accounts_customuser_groups USING btree (customuser_id);


--
-- Name: accounts_customuser_groups_group_id_86ba5f9e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_customuser_groups_group_id_86ba5f9e ON public.accounts_customuser_groups USING btree (group_id);


--
-- Name: accounts_customuser_pan_number_403a0e57_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_customuser_pan_number_403a0e57_like ON public.accounts_customuser USING btree (pan_number varchar_pattern_ops);


--
-- Name: accounts_customuser_phone_number_32c4e511_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_customuser_phone_number_32c4e511_like ON public.accounts_customuser USING btree (phone_number varchar_pattern_ops);


--
-- Name: accounts_customuser_user_permissions_customuser_id_0deaefae; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_customuser_user_permissions_customuser_id_0deaefae ON public.accounts_customuser_user_permissions USING btree (customuser_id);


--
-- Name: accounts_customuser_user_permissions_permission_id_aea3d0e5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_customuser_user_permissions_permission_id_aea3d0e5 ON public.accounts_customuser_user_permissions USING btree (permission_id);


--
-- Name: accounts_customuser_username_722f3555_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_customuser_username_722f3555_like ON public.accounts_customuser USING btree (username varchar_pattern_ops);


--
-- Name: accounts_fi_firm_id_b4122c_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_fi_firm_id_b4122c_idx ON public.accounts_firmjoinlink USING btree (firm_id, user_type, is_active);


--
-- Name: accounts_firmjoinlink_created_by_id_7a5ddece; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_firmjoinlink_created_by_id_7a5ddece ON public.accounts_firmjoinlink USING btree (created_by_id);


--
-- Name: accounts_firmjoinlink_firm_id_7a5b44ae; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_firmjoinlink_firm_id_7a5b44ae ON public.accounts_firmjoinlink USING btree (firm_id);


--
-- Name: accounts_globalconfiguration_updated_by_id_14a2b875; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_globalconfiguration_updated_by_id_14a2b875 ON public.accounts_globalconfiguration USING btree (updated_by_id);


--
-- Name: accounts_lo_usernam_9fec08_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_lo_usernam_9fec08_idx ON public.accounts_logincredential USING btree (username);


--
-- Name: accounts_logincredential_username_dcb9e64f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_logincredential_username_dcb9e64f_like ON public.accounts_logincredential USING btree (username varchar_pattern_ops);


--
-- Name: accounts_otpverification_user_id_b036466a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_otpverification_user_id_b036466a ON public.accounts_otpverification USING btree (user_id);


--
-- Name: accounts_us_is_acti_952e1c_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_us_is_acti_952e1c_idx ON public.accounts_userfirmrole USING btree (is_active);


--
-- Name: accounts_us_user_id_9a0cdf_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_us_user_id_9a0cdf_idx ON public.accounts_userfirmrole USING btree (user_id, firm_id);


--
-- Name: accounts_userfirmrole_branch_id_f47545b5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_userfirmrole_branch_id_f47545b5 ON public.accounts_userfirmrole USING btree (branch_id);


--
-- Name: accounts_userfirmrole_firm_id_471bed65; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_userfirmrole_firm_id_471bed65 ON public.accounts_userfirmrole USING btree (firm_id);


--
-- Name: accounts_userfirmrole_user_id_2ba4e296; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_userfirmrole_user_id_2ba4e296 ON public.accounts_userfirmrole USING btree (user_id);


--
-- Name: accounts_userinvitation_firm_id_cc1d5b8a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_userinvitation_firm_id_cc1d5b8a ON public.accounts_userinvitation USING btree (firm_id);


--
-- Name: accounts_userinvitation_invited_by_id_2a04e843; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_userinvitation_invited_by_id_2a04e843 ON public.accounts_userinvitation USING btree (invited_by_id);


--
-- Name: accounts_userinvitation_invited_user_id_4d0c0858; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX accounts_userinvitation_invited_user_id_4d0c0858 ON public.accounts_userinvitation USING btree (invited_user_id);


--
-- Name: audit_audit_action_0c6a84_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX audit_audit_action_0c6a84_idx ON public.audit_auditlog USING btree (action, created_at DESC);


--
-- Name: audit_audit_user_id_429f6b_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX audit_audit_user_id_429f6b_idx ON public.audit_auditlog USING btree (user_id, created_at DESC);


--
-- Name: audit_auditlog_firm_id_bc80d4d1; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX audit_auditlog_firm_id_bc80d4d1 ON public.audit_auditlog USING btree (firm_id);


--
-- Name: audit_auditlog_user_id_c1cca96c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX audit_auditlog_user_id_c1cca96c ON public.audit_auditlog USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: billing_adv_firm_id_8ed630_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_adv_firm_id_8ed630_idx ON public.billing_advocateinvoice USING btree (firm_id, advocate_id, status);


--
-- Name: billing_adv_invoice_083b77_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_adv_invoice_083b77_idx ON public.billing_advocateinvoice USING btree (invoice_date);


--
-- Name: billing_adv_invoice_156c4b_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_adv_invoice_156c4b_idx ON public.billing_advocateinvoice USING btree (invoice_number);


--
-- Name: billing_advocateinvoice_advocate_id_73e4b80e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_advocateinvoice_advocate_id_73e4b80e ON public.billing_advocateinvoice USING btree (advocate_id);


--
-- Name: billing_advocateinvoice_approved_by_id_134d09f8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_advocateinvoice_approved_by_id_134d09f8 ON public.billing_advocateinvoice USING btree (approved_by_id);


--
-- Name: billing_advocateinvoice_firm_id_ed0c3cfa; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_advocateinvoice_firm_id_ed0c3cfa ON public.billing_advocateinvoice USING btree (firm_id);


--
-- Name: billing_advocateinvoice_invoice_number_811c1161_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_advocateinvoice_invoice_number_811c1161_like ON public.billing_advocateinvoice USING btree (invoice_number varchar_pattern_ops);


--
-- Name: billing_exp_firm_id_8c02fb_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_exp_firm_id_8c02fb_idx ON public.billing_expense USING btree (firm_id, case_id, date);


--
-- Name: billing_exp_status_ddbf2b_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_exp_status_ddbf2b_idx ON public.billing_expense USING btree (status);


--
-- Name: billing_expense_case_id_168dfd91; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_expense_case_id_168dfd91 ON public.billing_expense USING btree (case_id);


--
-- Name: billing_expense_firm_id_c1bb23f9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_expense_firm_id_c1bb23f9 ON public.billing_expense USING btree (firm_id);


--
-- Name: billing_expense_invoice_id_e5b417d7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_expense_invoice_id_e5b417d7 ON public.billing_expense USING btree (invoice_id);


--
-- Name: billing_expense_submitted_by_id_376e8cfe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_expense_submitted_by_id_376e8cfe ON public.billing_expense USING btree (submitted_by_id);


--
-- Name: billing_inv_client__85c90b_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_inv_client__85c90b_idx ON public.billing_invoice USING btree (client_id, status);


--
-- Name: billing_inv_firm_id_695ebc_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_inv_firm_id_695ebc_idx ON public.billing_invoice USING btree (firm_id, status);


--
-- Name: billing_inv_invoice_70511c_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_inv_invoice_70511c_idx ON public.billing_invoice USING btree (invoice_number);


--
-- Name: billing_invoice_branch_id_e5c80119; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_invoice_branch_id_e5c80119 ON public.billing_invoice USING btree (branch_id);


--
-- Name: billing_invoice_case_id_32a17646; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_invoice_case_id_32a17646 ON public.billing_invoice USING btree (case_id);


--
-- Name: billing_invoice_client_id_01577a63; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_invoice_client_id_01577a63 ON public.billing_invoice USING btree (client_id);


--
-- Name: billing_invoice_created_by_id_c711181e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_invoice_created_by_id_c711181e ON public.billing_invoice USING btree (created_by_id);


--
-- Name: billing_invoice_firm_id_043eeed3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_invoice_firm_id_043eeed3 ON public.billing_invoice USING btree (firm_id);


--
-- Name: billing_invoice_invoice_number_c444ad03_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_invoice_invoice_number_c444ad03_like ON public.billing_invoice USING btree (invoice_number varchar_pattern_ops);


--
-- Name: billing_pay_firm_id_2a7f15_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_pay_firm_id_2a7f15_idx ON public.billing_payment USING btree (firm_id, payment_date);


--
-- Name: billing_pay_invoice_a67165_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_pay_invoice_a67165_idx ON public.billing_payment USING btree (invoice_id, status);


--
-- Name: billing_payment_client_id_a94724d9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_payment_client_id_a94724d9 ON public.billing_payment USING btree (client_id);


--
-- Name: billing_payment_firm_id_76f93827; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_payment_firm_id_76f93827 ON public.billing_payment USING btree (firm_id);


--
-- Name: billing_payment_invoice_id_998dd3c5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_payment_invoice_id_998dd3c5 ON public.billing_payment USING btree (invoice_id);


--
-- Name: billing_payment_recorded_by_id_ea29dd82; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_payment_recorded_by_id_ea29dd82 ON public.billing_payment USING btree (recorded_by_id);


--
-- Name: billing_tim_firm_id_388ddf_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_tim_firm_id_388ddf_idx ON public.billing_timeentry USING btree (firm_id, case_id, date);


--
-- Name: billing_tim_user_id_f4a8e3_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_tim_user_id_f4a8e3_idx ON public.billing_timeentry USING btree (user_id, status);


--
-- Name: billing_timeentry_advocate_invoice_id_2016defd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_timeentry_advocate_invoice_id_2016defd ON public.billing_timeentry USING btree (advocate_invoice_id);


--
-- Name: billing_timeentry_case_id_b3d21d0a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_timeentry_case_id_b3d21d0a ON public.billing_timeentry USING btree (case_id);


--
-- Name: billing_timeentry_firm_id_4cb84049; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_timeentry_firm_id_4cb84049 ON public.billing_timeentry USING btree (firm_id);


--
-- Name: billing_timeentry_invoice_id_3782f65a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_timeentry_invoice_id_3782f65a ON public.billing_timeentry USING btree (invoice_id);


--
-- Name: billing_timeentry_user_id_273f1373; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_timeentry_user_id_273f1373 ON public.billing_timeentry USING btree (user_id);


--
-- Name: billing_tru_firm_id_60f662_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_tru_firm_id_60f662_idx ON public.billing_trustaccount USING btree (firm_id, client_id);


--
-- Name: billing_tru_transac_56b01e_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_tru_transac_56b01e_idx ON public.billing_trustaccount USING btree (transaction_date);


--
-- Name: billing_trustaccount_case_id_da20b8d2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_trustaccount_case_id_da20b8d2 ON public.billing_trustaccount USING btree (case_id);


--
-- Name: billing_trustaccount_client_id_a796c45d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_trustaccount_client_id_a796c45d ON public.billing_trustaccount USING btree (client_id);


--
-- Name: billing_trustaccount_firm_id_89c33562; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_trustaccount_firm_id_89c33562 ON public.billing_trustaccount USING btree (firm_id);


--
-- Name: billing_trustaccount_recorded_by_id_8d95b5f3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_trustaccount_recorded_by_id_8d95b5f3 ON public.billing_trustaccount USING btree (recorded_by_id);


--
-- Name: billing_trustaccount_reference_invoice_id_0bdb2c5d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX billing_trustaccount_reference_invoice_id_0bdb2c5d ON public.billing_trustaccount USING btree (reference_invoice_id);


--
-- Name: calendar_ev_event_t_a01d70_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX calendar_ev_event_t_a01d70_idx ON public.calendar_events_calendarevent USING btree (event_type, status);


--
-- Name: calendar_ev_firm_id_40c20d_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX calendar_ev_firm_id_40c20d_idx ON public.calendar_events_calendarevent USING btree (firm_id, start_datetime);


--
-- Name: calendar_ev_start_d_ebf05b_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX calendar_ev_start_d_ebf05b_idx ON public.calendar_events_calendarevent USING btree (start_datetime, end_datetime);


--
-- Name: calendar_events_calendarev_calendarevent_id_794a58f6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX calendar_events_calendarev_calendarevent_id_794a58f6 ON public.calendar_events_calendarevent_assigned_to USING btree (calendarevent_id);


--
-- Name: calendar_events_calendarev_customuser_id_306dbe1e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX calendar_events_calendarev_customuser_id_306dbe1e ON public.calendar_events_calendarevent_assigned_to USING btree (customuser_id);


--
-- Name: calendar_events_calendarevent_case_id_50520432; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX calendar_events_calendarevent_case_id_50520432 ON public.calendar_events_calendarevent USING btree (case_id);


--
-- Name: calendar_events_calendarevent_client_id_65d8ff62; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX calendar_events_calendarevent_client_id_65d8ff62 ON public.calendar_events_calendarevent USING btree (client_id);


--
-- Name: calendar_events_calendarevent_created_by_id_7543de9a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX calendar_events_calendarevent_created_by_id_7543de9a ON public.calendar_events_calendarevent USING btree (created_by_id);


--
-- Name: calendar_events_calendarevent_firm_id_aa6f1ce4; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX calendar_events_calendarevent_firm_id_aa6f1ce4 ON public.calendar_events_calendarevent USING btree (firm_id);


--
-- Name: cases_case_assigned_advocate_id_79ed6963; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_case_assigned_advocate_id_79ed6963 ON public.cases_case USING btree (assigned_advocate_id);


--
-- Name: cases_case_assigned_paralegal_id_84162e09; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_case_assigned_paralegal_id_84162e09 ON public.cases_case USING btree (assigned_paralegal_id);


--
-- Name: cases_case_branch_id_4071ae4c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_case_branch_id_4071ae4c ON public.cases_case USING btree (branch_id);


--
-- Name: cases_case_client_id_d55d12dd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_case_client_id_d55d12dd ON public.cases_case USING btree (client_id);


--
-- Name: cases_case_firm_id_6f74c8be; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_case_firm_id_6f74c8be ON public.cases_case USING btree (firm_id);


--
-- Name: cases_case_solo_advocate_id_d43ed8ef; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_case_solo_advocate_id_d43ed8ef ON public.cases_case USING btree (solo_advocate_id);


--
-- Name: cases_caseactivity_case_id_31678709; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_caseactivity_case_id_31678709 ON public.cases_caseactivity USING btree (case_id);


--
-- Name: cases_caseactivity_performed_by_id_ce2b1aee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_caseactivity_performed_by_id_ce2b1aee ON public.cases_caseactivity USING btree (performed_by_id);


--
-- Name: cases_cased_case_id_e562fe_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_cased_case_id_e562fe_idx ON public.cases_casedocumentrequest USING btree (case_id, status);


--
-- Name: cases_cased_status_91adee_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_cased_status_91adee_idx ON public.cases_casedocumentrequest USING btree (status, due_date);


--
-- Name: cases_casedocumentchecklistitem_case_id_2d72b29f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_casedocumentchecklistitem_case_id_2d72b29f ON public.cases_casedocumentchecklistitem USING btree (case_id);


--
-- Name: cases_casedocumentchecklistitem_checklist_template_id_7a415373; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_casedocumentchecklistitem_checklist_template_id_7a415373 ON public.cases_casedocumentchecklistitem USING btree (checklist_template_id);


--
-- Name: cases_casedocumentchecklistitem_uploaded_document_id_3fb137a6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_casedocumentchecklistitem_uploaded_document_id_3fb137a6 ON public.cases_casedocumentchecklistitem USING btree (uploaded_document_id);


--
-- Name: cases_casedocumentchecklistitem_verified_by_id_28af225e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_casedocumentchecklistitem_verified_by_id_28af225e ON public.cases_casedocumentchecklistitem USING btree (verified_by_id);


--
-- Name: cases_casedocumentrequest_case_id_a6555cc2; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_casedocumentrequest_case_id_a6555cc2 ON public.cases_casedocumentrequest USING btree (case_id);


--
-- Name: cases_casedocumentrequest_requested_by_id_bbf68e61; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_casedocumentrequest_requested_by_id_bbf68e61 ON public.cases_casedocumentrequest USING btree (requested_by_id);


--
-- Name: cases_casedocumentrequest_uploaded_document_id_517ef377; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_casedocumentrequest_uploaded_document_id_517ef377 ON public.cases_casedocumentrequest USING btree (uploaded_document_id);


--
-- Name: cases_casedraft_case_id_751aca94; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_casedraft_case_id_751aca94 ON public.cases_casedraft USING btree (case_id);


--
-- Name: cases_casedraft_created_by_id_5b2e9085; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_casedraft_created_by_id_5b2e9085 ON public.cases_casedraft USING btree (created_by_id);


--
-- Name: cases_caseresearch_case_id_f0390755; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_caseresearch_case_id_f0390755 ON public.cases_caseresearch USING btree (case_id);


--
-- Name: cases_caseresearch_created_by_id_11caeb56; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_caseresearch_created_by_id_11caeb56 ON public.cases_caseresearch USING btree (created_by_id);


--
-- Name: cases_hearing_case_id_4e219f2e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_hearing_case_id_4e219f2e ON public.cases_hearing USING btree (case_id);


--
-- Name: cases_legalnotice_case_id_0e707d9b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_legalnotice_case_id_0e707d9b ON public.cases_legalnotice USING btree (case_id);


--
-- Name: cases_legalnotice_created_by_id_fbb48ecc; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_legalnotice_created_by_id_fbb48ecc ON public.cases_legalnotice USING btree (created_by_id);


--
-- Name: cases_legalnotice_last_status_updated_by_id_308c37f3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_legalnotice_last_status_updated_by_id_308c37f3 ON public.cases_legalnotice USING btree (last_status_updated_by_id);


--
-- Name: cases_serviceattempt_case_id_9ca7e725; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_serviceattempt_case_id_9ca7e725 ON public.cases_serviceattempt USING btree (case_id);


--
-- Name: cases_serviceattempt_created_by_id_cc8b86f7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX cases_serviceattempt_created_by_id_cc8b86f7 ON public.cases_serviceattempt USING btree (created_by_id);


--
-- Name: clients_client_assigned_advocate_id_6166c336; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX clients_client_assigned_advocate_id_6166c336 ON public.clients_client USING btree (assigned_advocate_id);


--
-- Name: clients_client_firm_id_f01fe4b9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX clients_client_firm_id_f01fe4b9 ON public.clients_client USING btree (firm_id);


--
-- Name: clients_client_user_account_id_4eae210b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX clients_client_user_account_id_4eae210b ON public.clients_client USING btree (user_account_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: documents_courtformtemplate_created_by_id_6d62c788; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_courtformtemplate_created_by_id_6d62c788 ON public.documents_courtformtemplate USING btree (created_by_id);


--
-- Name: documents_d_categor_ca6c30_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_d_categor_ca6c30_idx ON public.documents_documenttemplate USING btree (category, is_active);


--
-- Name: documents_documenttemplate_created_by_id_fce09d26; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_documenttemplate_created_by_id_fce09d26 ON public.documents_documenttemplate USING btree (created_by_id);


--
-- Name: documents_f_case_id_69f6ee_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_f_case_id_69f6ee_idx ON public.documents_filledtemplate USING btree (case_id, status);


--
-- Name: documents_f_client__00ebcc_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_f_client__00ebcc_idx ON public.documents_filledtemplate USING btree (client_id, status);


--
-- Name: documents_filledcourtform_case_id_b2dd4546; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_filledcourtform_case_id_b2dd4546 ON public.documents_filledcourtform USING btree (case_id);


--
-- Name: documents_filledcourtform_client_id_33ff8886; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_filledcourtform_client_id_33ff8886 ON public.documents_filledcourtform USING btree (client_id);


--
-- Name: documents_filledcourtform_created_by_id_44083e33; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_filledcourtform_created_by_id_44083e33 ON public.documents_filledcourtform USING btree (created_by_id);


--
-- Name: documents_filledcourtform_template_id_0e93b117; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_filledcourtform_template_id_0e93b117 ON public.documents_filledcourtform USING btree (template_id);


--
-- Name: documents_filledtemplate_case_id_e1094399; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_filledtemplate_case_id_e1094399 ON public.documents_filledtemplate USING btree (case_id);


--
-- Name: documents_filledtemplate_client_id_1272c712; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_filledtemplate_client_id_1272c712 ON public.documents_filledtemplate USING btree (client_id);


--
-- Name: documents_filledtemplate_created_by_id_3db5a309; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_filledtemplate_created_by_id_3db5a309 ON public.documents_filledtemplate USING btree (created_by_id);


--
-- Name: documents_filledtemplate_firm_id_75938c0f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_filledtemplate_firm_id_75938c0f ON public.documents_filledtemplate USING btree (firm_id);


--
-- Name: documents_filledtemplate_template_id_ac7fbc96; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_filledtemplate_template_id_ac7fbc96 ON public.documents_filledtemplate USING btree (template_id);


--
-- Name: documents_u_case_id_8e3245_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_u_case_id_8e3245_idx ON public.documents_userdocument USING btree (case_id, is_deleted);


--
-- Name: documents_u_client__02596f_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_u_client__02596f_idx ON public.documents_userdocument USING btree (client_id, is_deleted);


--
-- Name: documents_u_firm_id_c3a9bd_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_u_firm_id_c3a9bd_idx ON public.documents_userdocument USING btree (firm_id, is_deleted);


--
-- Name: documents_u_uploade_25d511_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_u_uploade_25d511_idx ON public.documents_userdocument USING btree (uploaded_by_id, is_deleted);


--
-- Name: documents_userdocument_case_id_1349fd44; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_userdocument_case_id_1349fd44 ON public.documents_userdocument USING btree (case_id);


--
-- Name: documents_userdocument_client_id_c7c4b7f8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_userdocument_client_id_c7c4b7f8 ON public.documents_userdocument USING btree (client_id);


--
-- Name: documents_userdocument_deleted_by_id_bcd8d9e5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_userdocument_deleted_by_id_bcd8d9e5 ON public.documents_userdocument USING btree (deleted_by_id);


--
-- Name: documents_userdocument_firm_id_cea33ead; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_userdocument_firm_id_cea33ead ON public.documents_userdocument USING btree (firm_id);


--
-- Name: documents_userdocument_parent_document_id_40d92964; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_userdocument_parent_document_id_40d92964 ON public.documents_userdocument USING btree (parent_document_id);


--
-- Name: documents_userdocument_uploaded_by_id_3ca547c8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_userdocument_uploaded_by_id_3ca547c8 ON public.documents_userdocument USING btree (uploaded_by_id);


--
-- Name: documents_userdocument_verified_by_id_82898597; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX documents_userdocument_verified_by_id_82898597 ON public.documents_userdocument USING btree (verified_by_id);


--
-- Name: firms_branch_firm_id_4766aa77; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX firms_branch_firm_id_4766aa77 ON public.firms_branch USING btree (firm_id);


--
-- Name: firms_firm_firm_code_887422af_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX firms_firm_firm_code_887422af_like ON public.firms_firm USING btree (firm_code varchar_pattern_ops);


--
-- Name: firms_firm_firm_name_28b886c1_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX firms_firm_firm_name_28b886c1_like ON public.firms_firm USING btree (firm_name varchar_pattern_ops);


--
-- Name: firms_firm_partner_id_d7459ff9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX firms_firm_partner_id_d7459ff9 ON public.firms_firm USING btree (partner_id);


--
-- Name: subscriptio_firm_id_2b6573_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX subscriptio_firm_id_2b6573_idx ON public.subscriptions_platforminvoice USING btree (firm_id, status);


--
-- Name: subscriptio_invoice_bca470_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX subscriptio_invoice_bca470_idx ON public.subscriptions_platforminvoice USING btree (invoice_number);


--
-- Name: subscriptio_invoice_cebd76_idx; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX subscriptio_invoice_cebd76_idx ON public.subscriptions_platforminvoice USING btree (invoice_date);


--
-- Name: subscriptions_firmsubscription_plan_id_a18eb6a8; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX subscriptions_firmsubscription_plan_id_a18eb6a8 ON public.subscriptions_firmsubscription USING btree (plan_id);


--
-- Name: subscriptions_platforminvoice_created_by_id_c4bb7851; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX subscriptions_platforminvoice_created_by_id_c4bb7851 ON public.subscriptions_platforminvoice USING btree (created_by_id);


--
-- Name: subscriptions_platforminvoice_firm_id_84cc879b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX subscriptions_platforminvoice_firm_id_84cc879b ON public.subscriptions_platforminvoice USING btree (firm_id);


--
-- Name: subscriptions_platforminvoice_invoice_number_51bfa8b7_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX subscriptions_platforminvoice_invoice_number_51bfa8b7_like ON public.subscriptions_platforminvoice USING btree (invoice_number varchar_pattern_ops);


--
-- Name: subscriptions_platforminvoice_subscription_plan_id_fbb2d25c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX subscriptions_platforminvoice_subscription_plan_id_fbb2d25c ON public.subscriptions_platforminvoice USING btree (subscription_plan_id);


--
-- Name: tasks_task_assigned_to_id_e8821f61; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tasks_task_assigned_to_id_e8821f61 ON public.tasks_task USING btree (assigned_to_id);


--
-- Name: tasks_task_firm_id_d4629d31; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX tasks_task_firm_id_d4629d31 ON public.tasks_task USING btree (firm_id);


--
-- Name: accounts_advocateparalegalassignment accounts_advocatepar_advocate_id_4ff07a31_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_advocateparalegalassignment
    ADD CONSTRAINT accounts_advocatepar_advocate_id_4ff07a31_fk_accounts_ FOREIGN KEY (advocate_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_advocateparalegalassignment accounts_advocatepar_assigned_by_id_bb4f3d7f_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_advocateparalegalassignment
    ADD CONSTRAINT accounts_advocatepar_assigned_by_id_bb4f3d7f_fk_accounts_ FOREIGN KEY (assigned_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_advocateparalegalassignment accounts_advocatepar_firm_id_68a91971_fk_firms_fir; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_advocateparalegalassignment
    ADD CONSTRAINT accounts_advocatepar_firm_id_68a91971_fk_firms_fir FOREIGN KEY (firm_id) REFERENCES public.firms_firm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_advocateparalegalassignment accounts_advocatepar_paralegal_id_82bbed5e_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_advocateparalegalassignment
    ADD CONSTRAINT accounts_advocatepar_paralegal_id_82bbed5e_fk_accounts_ FOREIGN KEY (paralegal_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_customuser_user_permissions accounts_customuser__customuser_id_0deaefae_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions
    ADD CONSTRAINT accounts_customuser__customuser_id_0deaefae_fk_accounts_ FOREIGN KEY (customuser_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_customuser_groups accounts_customuser__customuser_id_bc55088e_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser__customuser_id_bc55088e_fk_accounts_ FOREIGN KEY (customuser_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_customuser_user_permissions accounts_customuser__permission_id_aea3d0e5_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_user_permissions
    ADD CONSTRAINT accounts_customuser__permission_id_aea3d0e5_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_customuser accounts_customuser_firm_id_55594c84_fk_firms_firm_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser
    ADD CONSTRAINT accounts_customuser_firm_id_55594c84_fk_firms_firm_id FOREIGN KEY (firm_id) REFERENCES public.firms_firm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_customuser_groups accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_customuser_groups
    ADD CONSTRAINT accounts_customuser_groups_group_id_86ba5f9e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_firmjoinlink accounts_firmjoinlin_created_by_id_7a5ddece_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_firmjoinlink
    ADD CONSTRAINT accounts_firmjoinlin_created_by_id_7a5ddece_fk_accounts_ FOREIGN KEY (created_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_firmjoinlink accounts_firmjoinlink_firm_id_7a5b44ae_fk_firms_firm_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_firmjoinlink
    ADD CONSTRAINT accounts_firmjoinlink_firm_id_7a5b44ae_fk_firms_firm_id FOREIGN KEY (firm_id) REFERENCES public.firms_firm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_globalconfiguration accounts_globalconfi_updated_by_id_14a2b875_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_globalconfiguration
    ADD CONSTRAINT accounts_globalconfi_updated_by_id_14a2b875_fk_accounts_ FOREIGN KEY (updated_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_logincredential accounts_logincreden_user_id_6feb3817_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_logincredential
    ADD CONSTRAINT accounts_logincreden_user_id_6feb3817_fk_accounts_ FOREIGN KEY (user_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_otpverification accounts_otpverifica_user_id_b036466a_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_otpverification
    ADD CONSTRAINT accounts_otpverifica_user_id_b036466a_fk_accounts_ FOREIGN KEY (user_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_userfirmrole accounts_userfirmrol_user_id_2ba4e296_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userfirmrole
    ADD CONSTRAINT accounts_userfirmrol_user_id_2ba4e296_fk_accounts_ FOREIGN KEY (user_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_userfirmrole accounts_userfirmrole_branch_id_f47545b5_fk_firms_branch_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userfirmrole
    ADD CONSTRAINT accounts_userfirmrole_branch_id_f47545b5_fk_firms_branch_id FOREIGN KEY (branch_id) REFERENCES public.firms_branch(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_userfirmrole accounts_userfirmrole_firm_id_471bed65_fk_firms_firm_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userfirmrole
    ADD CONSTRAINT accounts_userfirmrole_firm_id_471bed65_fk_firms_firm_id FOREIGN KEY (firm_id) REFERENCES public.firms_firm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_userinvitation accounts_userinvitat_invited_by_id_2a04e843_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userinvitation
    ADD CONSTRAINT accounts_userinvitat_invited_by_id_2a04e843_fk_accounts_ FOREIGN KEY (invited_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_userinvitation accounts_userinvitat_invited_user_id_4d0c0858_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userinvitation
    ADD CONSTRAINT accounts_userinvitat_invited_user_id_4d0c0858_fk_accounts_ FOREIGN KEY (invited_user_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: accounts_userinvitation accounts_userinvitation_firm_id_cc1d5b8a_fk_firms_firm_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts_userinvitation
    ADD CONSTRAINT accounts_userinvitation_firm_id_cc1d5b8a_fk_firms_firm_id FOREIGN KEY (firm_id) REFERENCES public.firms_firm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: audit_auditlog audit_auditlog_firm_id_bc80d4d1_fk_firms_firm_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_auditlog
    ADD CONSTRAINT audit_auditlog_firm_id_bc80d4d1_fk_firms_firm_id FOREIGN KEY (firm_id) REFERENCES public.firms_firm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: audit_auditlog audit_auditlog_user_id_c1cca96c_fk_accounts_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.audit_auditlog
    ADD CONSTRAINT audit_auditlog_user_id_c1cca96c_fk_accounts_customuser_id FOREIGN KEY (user_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_accounts_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_accounts_customuser_id FOREIGN KEY (user_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_advocateinvoice billing_advocateinvo_advocate_id_73e4b80e_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_advocateinvoice
    ADD CONSTRAINT billing_advocateinvo_advocate_id_73e4b80e_fk_accounts_ FOREIGN KEY (advocate_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_advocateinvoice billing_advocateinvo_approved_by_id_134d09f8_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_advocateinvoice
    ADD CONSTRAINT billing_advocateinvo_approved_by_id_134d09f8_fk_accounts_ FOREIGN KEY (approved_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_advocateinvoice billing_advocateinvoice_firm_id_ed0c3cfa_fk_firms_firm_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_advocateinvoice
    ADD CONSTRAINT billing_advocateinvoice_firm_id_ed0c3cfa_fk_firms_firm_id FOREIGN KEY (firm_id) REFERENCES public.firms_firm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_expense billing_expense_case_id_168dfd91_fk_cases_case_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_expense
    ADD CONSTRAINT billing_expense_case_id_168dfd91_fk_cases_case_id FOREIGN KEY (case_id) REFERENCES public.cases_case(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_expense billing_expense_firm_id_c1bb23f9_fk_firms_firm_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_expense
    ADD CONSTRAINT billing_expense_firm_id_c1bb23f9_fk_firms_firm_id FOREIGN KEY (firm_id) REFERENCES public.firms_firm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_expense billing_expense_invoice_id_e5b417d7_fk_billing_invoice_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_expense
    ADD CONSTRAINT billing_expense_invoice_id_e5b417d7_fk_billing_invoice_id FOREIGN KEY (invoice_id) REFERENCES public.billing_invoice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_expense billing_expense_submitted_by_id_376e8cfe_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_expense
    ADD CONSTRAINT billing_expense_submitted_by_id_376e8cfe_fk_accounts_ FOREIGN KEY (submitted_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_invoice billing_invoice_branch_id_e5c80119_fk_firms_branch_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_invoice
    ADD CONSTRAINT billing_invoice_branch_id_e5c80119_fk_firms_branch_id FOREIGN KEY (branch_id) REFERENCES public.firms_branch(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_invoice billing_invoice_case_id_32a17646_fk_cases_case_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_invoice
    ADD CONSTRAINT billing_invoice_case_id_32a17646_fk_cases_case_id FOREIGN KEY (case_id) REFERENCES public.cases_case(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_invoice billing_invoice_client_id_01577a63_fk_clients_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_invoice
    ADD CONSTRAINT billing_invoice_client_id_01577a63_fk_clients_client_id FOREIGN KEY (client_id) REFERENCES public.clients_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_invoice billing_invoice_created_by_id_c711181e_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_invoice
    ADD CONSTRAINT billing_invoice_created_by_id_c711181e_fk_accounts_ FOREIGN KEY (created_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_invoice billing_invoice_firm_id_043eeed3_fk_firms_firm_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_invoice
    ADD CONSTRAINT billing_invoice_firm_id_043eeed3_fk_firms_firm_id FOREIGN KEY (firm_id) REFERENCES public.firms_firm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_payment billing_payment_client_id_a94724d9_fk_clients_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_payment
    ADD CONSTRAINT billing_payment_client_id_a94724d9_fk_clients_client_id FOREIGN KEY (client_id) REFERENCES public.clients_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_payment billing_payment_firm_id_76f93827_fk_firms_firm_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_payment
    ADD CONSTRAINT billing_payment_firm_id_76f93827_fk_firms_firm_id FOREIGN KEY (firm_id) REFERENCES public.firms_firm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_payment billing_payment_invoice_id_998dd3c5_fk_billing_invoice_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_payment
    ADD CONSTRAINT billing_payment_invoice_id_998dd3c5_fk_billing_invoice_id FOREIGN KEY (invoice_id) REFERENCES public.billing_invoice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_payment billing_payment_recorded_by_id_ea29dd82_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_payment
    ADD CONSTRAINT billing_payment_recorded_by_id_ea29dd82_fk_accounts_ FOREIGN KEY (recorded_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_timeentry billing_timeentry_advocate_invoice_id_2016defd_fk_billing_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_timeentry
    ADD CONSTRAINT billing_timeentry_advocate_invoice_id_2016defd_fk_billing_a FOREIGN KEY (advocate_invoice_id) REFERENCES public.billing_advocateinvoice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_timeentry billing_timeentry_case_id_b3d21d0a_fk_cases_case_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_timeentry
    ADD CONSTRAINT billing_timeentry_case_id_b3d21d0a_fk_cases_case_id FOREIGN KEY (case_id) REFERENCES public.cases_case(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_timeentry billing_timeentry_firm_id_4cb84049_fk_firms_firm_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_timeentry
    ADD CONSTRAINT billing_timeentry_firm_id_4cb84049_fk_firms_firm_id FOREIGN KEY (firm_id) REFERENCES public.firms_firm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_timeentry billing_timeentry_invoice_id_3782f65a_fk_billing_invoice_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_timeentry
    ADD CONSTRAINT billing_timeentry_invoice_id_3782f65a_fk_billing_invoice_id FOREIGN KEY (invoice_id) REFERENCES public.billing_invoice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_timeentry billing_timeentry_user_id_273f1373_fk_accounts_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_timeentry
    ADD CONSTRAINT billing_timeentry_user_id_273f1373_fk_accounts_customuser_id FOREIGN KEY (user_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_trustaccount billing_trustaccount_case_id_da20b8d2_fk_cases_case_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_trustaccount
    ADD CONSTRAINT billing_trustaccount_case_id_da20b8d2_fk_cases_case_id FOREIGN KEY (case_id) REFERENCES public.cases_case(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_trustaccount billing_trustaccount_client_id_a796c45d_fk_clients_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_trustaccount
    ADD CONSTRAINT billing_trustaccount_client_id_a796c45d_fk_clients_client_id FOREIGN KEY (client_id) REFERENCES public.clients_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_trustaccount billing_trustaccount_firm_id_89c33562_fk_firms_firm_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_trustaccount
    ADD CONSTRAINT billing_trustaccount_firm_id_89c33562_fk_firms_firm_id FOREIGN KEY (firm_id) REFERENCES public.firms_firm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_trustaccount billing_trustaccount_recorded_by_id_8d95b5f3_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_trustaccount
    ADD CONSTRAINT billing_trustaccount_recorded_by_id_8d95b5f3_fk_accounts_ FOREIGN KEY (recorded_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: billing_trustaccount billing_trustaccount_reference_invoice_id_0bdb2c5d_fk_billing_i; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.billing_trustaccount
    ADD CONSTRAINT billing_trustaccount_reference_invoice_id_0bdb2c5d_fk_billing_i FOREIGN KEY (reference_invoice_id) REFERENCES public.billing_invoice(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: calendar_events_calendarevent_assigned_to calendar_events_cale_calendarevent_id_794a58f6_fk_calendar_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendar_events_calendarevent_assigned_to
    ADD CONSTRAINT calendar_events_cale_calendarevent_id_794a58f6_fk_calendar_ FOREIGN KEY (calendarevent_id) REFERENCES public.calendar_events_calendarevent(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: calendar_events_calendarevent calendar_events_cale_client_id_65d8ff62_fk_clients_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendar_events_calendarevent
    ADD CONSTRAINT calendar_events_cale_client_id_65d8ff62_fk_clients_c FOREIGN KEY (client_id) REFERENCES public.clients_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: calendar_events_calendarevent calendar_events_cale_created_by_id_7543de9a_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendar_events_calendarevent
    ADD CONSTRAINT calendar_events_cale_created_by_id_7543de9a_fk_accounts_ FOREIGN KEY (created_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: calendar_events_calendarevent_assigned_to calendar_events_cale_customuser_id_306dbe1e_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendar_events_calendarevent_assigned_to
    ADD CONSTRAINT calendar_events_cale_customuser_id_306dbe1e_fk_accounts_ FOREIGN KEY (customuser_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: calendar_events_calendarevent calendar_events_calendarevent_case_id_50520432_fk_cases_case_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendar_events_calendarevent
    ADD CONSTRAINT calendar_events_calendarevent_case_id_50520432_fk_cases_case_id FOREIGN KEY (case_id) REFERENCES public.cases_case(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: calendar_events_calendarevent calendar_events_calendarevent_firm_id_aa6f1ce4_fk_firms_firm_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calendar_events_calendarevent
    ADD CONSTRAINT calendar_events_calendarevent_firm_id_aa6f1ce4_fk_firms_firm_id FOREIGN KEY (firm_id) REFERENCES public.firms_firm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_case cases_case_assigned_advocate_id_79ed6963_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_case
    ADD CONSTRAINT cases_case_assigned_advocate_id_79ed6963_fk_accounts_ FOREIGN KEY (assigned_advocate_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_case cases_case_assigned_paralegal_i_84162e09_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_case
    ADD CONSTRAINT cases_case_assigned_paralegal_i_84162e09_fk_accounts_ FOREIGN KEY (assigned_paralegal_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_case cases_case_branch_id_4071ae4c_fk_firms_branch_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_case
    ADD CONSTRAINT cases_case_branch_id_4071ae4c_fk_firms_branch_id FOREIGN KEY (branch_id) REFERENCES public.firms_branch(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_case cases_case_client_id_d55d12dd_fk_clients_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_case
    ADD CONSTRAINT cases_case_client_id_d55d12dd_fk_clients_client_id FOREIGN KEY (client_id) REFERENCES public.clients_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_case cases_case_firm_id_6f74c8be_fk_firms_firm_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_case
    ADD CONSTRAINT cases_case_firm_id_6f74c8be_fk_firms_firm_id FOREIGN KEY (firm_id) REFERENCES public.firms_firm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_case cases_case_solo_advocate_id_d43ed8ef_fk_accounts_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_case
    ADD CONSTRAINT cases_case_solo_advocate_id_d43ed8ef_fk_accounts_customuser_id FOREIGN KEY (solo_advocate_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_caseactivity cases_caseactivity_case_id_31678709_fk_cases_case_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_caseactivity
    ADD CONSTRAINT cases_caseactivity_case_id_31678709_fk_cases_case_id FOREIGN KEY (case_id) REFERENCES public.cases_case(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_caseactivity cases_caseactivity_performed_by_id_ce2b1aee_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_caseactivity
    ADD CONSTRAINT cases_caseactivity_performed_by_id_ce2b1aee_fk_accounts_ FOREIGN KEY (performed_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_casedocumentchecklistitem cases_casedocumentch_case_id_2d72b29f_fk_cases_cas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_casedocumentchecklistitem
    ADD CONSTRAINT cases_casedocumentch_case_id_2d72b29f_fk_cases_cas FOREIGN KEY (case_id) REFERENCES public.cases_case(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_casedocumentchecklistitem cases_casedocumentch_checklist_template_i_7a415373_fk_cases_doc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_casedocumentchecklistitem
    ADD CONSTRAINT cases_casedocumentch_checklist_template_i_7a415373_fk_cases_doc FOREIGN KEY (checklist_template_id) REFERENCES public.cases_documentchecklist(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_casedocumentchecklistitem cases_casedocumentch_uploaded_document_id_3fb137a6_fk_documents; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_casedocumentchecklistitem
    ADD CONSTRAINT cases_casedocumentch_uploaded_document_id_3fb137a6_fk_documents FOREIGN KEY (uploaded_document_id) REFERENCES public.documents_userdocument(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_casedocumentchecklistitem cases_casedocumentch_verified_by_id_28af225e_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_casedocumentchecklistitem
    ADD CONSTRAINT cases_casedocumentch_verified_by_id_28af225e_fk_accounts_ FOREIGN KEY (verified_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_casedocumentrequest cases_casedocumentre_requested_by_id_bbf68e61_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_casedocumentrequest
    ADD CONSTRAINT cases_casedocumentre_requested_by_id_bbf68e61_fk_accounts_ FOREIGN KEY (requested_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_casedocumentrequest cases_casedocumentre_uploaded_document_id_517ef377_fk_documents; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_casedocumentrequest
    ADD CONSTRAINT cases_casedocumentre_uploaded_document_id_517ef377_fk_documents FOREIGN KEY (uploaded_document_id) REFERENCES public.documents_userdocument(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_casedocumentrequest cases_casedocumentrequest_case_id_a6555cc2_fk_cases_case_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_casedocumentrequest
    ADD CONSTRAINT cases_casedocumentrequest_case_id_a6555cc2_fk_cases_case_id FOREIGN KEY (case_id) REFERENCES public.cases_case(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_casedraft cases_casedraft_case_id_751aca94_fk_cases_case_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_casedraft
    ADD CONSTRAINT cases_casedraft_case_id_751aca94_fk_cases_case_id FOREIGN KEY (case_id) REFERENCES public.cases_case(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_casedraft cases_casedraft_created_by_id_5b2e9085_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_casedraft
    ADD CONSTRAINT cases_casedraft_created_by_id_5b2e9085_fk_accounts_ FOREIGN KEY (created_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_caseresearch cases_caseresearch_case_id_f0390755_fk_cases_case_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_caseresearch
    ADD CONSTRAINT cases_caseresearch_case_id_f0390755_fk_cases_case_id FOREIGN KEY (case_id) REFERENCES public.cases_case(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_caseresearch cases_caseresearch_created_by_id_11caeb56_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_caseresearch
    ADD CONSTRAINT cases_caseresearch_created_by_id_11caeb56_fk_accounts_ FOREIGN KEY (created_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_hearing cases_hearing_case_id_4e219f2e_fk_cases_case_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_hearing
    ADD CONSTRAINT cases_hearing_case_id_4e219f2e_fk_cases_case_id FOREIGN KEY (case_id) REFERENCES public.cases_case(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_legalnotice cases_legalnotice_case_id_0e707d9b_fk_cases_case_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_legalnotice
    ADD CONSTRAINT cases_legalnotice_case_id_0e707d9b_fk_cases_case_id FOREIGN KEY (case_id) REFERENCES public.cases_case(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_legalnotice cases_legalnotice_created_by_id_fbb48ecc_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_legalnotice
    ADD CONSTRAINT cases_legalnotice_created_by_id_fbb48ecc_fk_accounts_ FOREIGN KEY (created_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_legalnotice cases_legalnotice_last_status_updated__308c37f3_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_legalnotice
    ADD CONSTRAINT cases_legalnotice_last_status_updated__308c37f3_fk_accounts_ FOREIGN KEY (last_status_updated_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_serviceattempt cases_serviceattempt_case_id_9ca7e725_fk_cases_case_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_serviceattempt
    ADD CONSTRAINT cases_serviceattempt_case_id_9ca7e725_fk_cases_case_id FOREIGN KEY (case_id) REFERENCES public.cases_case(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: cases_serviceattempt cases_serviceattempt_created_by_id_cc8b86f7_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cases_serviceattempt
    ADD CONSTRAINT cases_serviceattempt_created_by_id_cc8b86f7_fk_accounts_ FOREIGN KEY (created_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: clients_client clients_client_assigned_advocate_id_6166c336_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients_client
    ADD CONSTRAINT clients_client_assigned_advocate_id_6166c336_fk_accounts_ FOREIGN KEY (assigned_advocate_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: clients_client clients_client_firm_id_f01fe4b9_fk_firms_firm_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients_client
    ADD CONSTRAINT clients_client_firm_id_f01fe4b9_fk_firms_firm_id FOREIGN KEY (firm_id) REFERENCES public.firms_firm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: clients_client clients_client_user_account_id_4eae210b_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients_client
    ADD CONSTRAINT clients_client_user_account_id_4eae210b_fk_accounts_ FOREIGN KEY (user_account_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_accounts_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_accounts_customuser_id FOREIGN KEY (user_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_courtformtemplate documents_courtformt_created_by_id_6d62c788_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_courtformtemplate
    ADD CONSTRAINT documents_courtformt_created_by_id_6d62c788_fk_accounts_ FOREIGN KEY (created_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_documenttemplate documents_documentte_created_by_id_fce09d26_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_documenttemplate
    ADD CONSTRAINT documents_documentte_created_by_id_fce09d26_fk_accounts_ FOREIGN KEY (created_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_filledcourtform documents_filledcour_client_id_33ff8886_fk_clients_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_filledcourtform
    ADD CONSTRAINT documents_filledcour_client_id_33ff8886_fk_clients_c FOREIGN KEY (client_id) REFERENCES public.clients_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_filledcourtform documents_filledcour_created_by_id_44083e33_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_filledcourtform
    ADD CONSTRAINT documents_filledcour_created_by_id_44083e33_fk_accounts_ FOREIGN KEY (created_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_filledcourtform documents_filledcour_template_id_0e93b117_fk_documents; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_filledcourtform
    ADD CONSTRAINT documents_filledcour_template_id_0e93b117_fk_documents FOREIGN KEY (template_id) REFERENCES public.documents_courtformtemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_filledcourtform documents_filledcourtform_case_id_b2dd4546_fk_cases_case_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_filledcourtform
    ADD CONSTRAINT documents_filledcourtform_case_id_b2dd4546_fk_cases_case_id FOREIGN KEY (case_id) REFERENCES public.cases_case(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_filledtemplate documents_filledtemp_client_id_1272c712_fk_clients_c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_filledtemplate
    ADD CONSTRAINT documents_filledtemp_client_id_1272c712_fk_clients_c FOREIGN KEY (client_id) REFERENCES public.clients_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_filledtemplate documents_filledtemp_created_by_id_3db5a309_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_filledtemplate
    ADD CONSTRAINT documents_filledtemp_created_by_id_3db5a309_fk_accounts_ FOREIGN KEY (created_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_filledtemplate documents_filledtemp_template_id_ac7fbc96_fk_documents; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_filledtemplate
    ADD CONSTRAINT documents_filledtemp_template_id_ac7fbc96_fk_documents FOREIGN KEY (template_id) REFERENCES public.documents_documenttemplate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_filledtemplate documents_filledtemplate_case_id_e1094399_fk_cases_case_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_filledtemplate
    ADD CONSTRAINT documents_filledtemplate_case_id_e1094399_fk_cases_case_id FOREIGN KEY (case_id) REFERENCES public.cases_case(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_filledtemplate documents_filledtemplate_firm_id_75938c0f_fk_firms_firm_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_filledtemplate
    ADD CONSTRAINT documents_filledtemplate_firm_id_75938c0f_fk_firms_firm_id FOREIGN KEY (firm_id) REFERENCES public.firms_firm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_userdocument documents_userdocume_deleted_by_id_bcd8d9e5_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_userdocument
    ADD CONSTRAINT documents_userdocume_deleted_by_id_bcd8d9e5_fk_accounts_ FOREIGN KEY (deleted_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_userdocument documents_userdocume_parent_document_id_40d92964_fk_documents; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_userdocument
    ADD CONSTRAINT documents_userdocume_parent_document_id_40d92964_fk_documents FOREIGN KEY (parent_document_id) REFERENCES public.documents_userdocument(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_userdocument documents_userdocume_uploaded_by_id_3ca547c8_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_userdocument
    ADD CONSTRAINT documents_userdocume_uploaded_by_id_3ca547c8_fk_accounts_ FOREIGN KEY (uploaded_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_userdocument documents_userdocume_verified_by_id_82898597_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_userdocument
    ADD CONSTRAINT documents_userdocume_verified_by_id_82898597_fk_accounts_ FOREIGN KEY (verified_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_userdocument documents_userdocument_case_id_1349fd44_fk_cases_case_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_userdocument
    ADD CONSTRAINT documents_userdocument_case_id_1349fd44_fk_cases_case_id FOREIGN KEY (case_id) REFERENCES public.cases_case(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_userdocument documents_userdocument_client_id_c7c4b7f8_fk_clients_client_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_userdocument
    ADD CONSTRAINT documents_userdocument_client_id_c7c4b7f8_fk_clients_client_id FOREIGN KEY (client_id) REFERENCES public.clients_client(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: documents_userdocument documents_userdocument_firm_id_cea33ead_fk_firms_firm_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.documents_userdocument
    ADD CONSTRAINT documents_userdocument_firm_id_cea33ead_fk_firms_firm_id FOREIGN KEY (firm_id) REFERENCES public.firms_firm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: firms_branch firms_branch_firm_id_4766aa77_fk_firms_firm_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firms_branch
    ADD CONSTRAINT firms_branch_firm_id_4766aa77_fk_firms_firm_id FOREIGN KEY (firm_id) REFERENCES public.firms_firm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: firms_firm firms_firm_partner_id_d7459ff9_fk_partners_partner_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.firms_firm
    ADD CONSTRAINT firms_firm_partner_id_d7459ff9_fk_partners_partner_id FOREIGN KEY (partner_id) REFERENCES public.partners_partner(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: partners_partner partners_partner_user_id_c9159f29_fk_accounts_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.partners_partner
    ADD CONSTRAINT partners_partner_user_id_c9159f29_fk_accounts_customuser_id FOREIGN KEY (user_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subscriptions_firmsubscription subscriptions_firmsu_firm_id_f1be20b6_fk_firms_fir; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions_firmsubscription
    ADD CONSTRAINT subscriptions_firmsu_firm_id_f1be20b6_fk_firms_fir FOREIGN KEY (firm_id) REFERENCES public.firms_firm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subscriptions_firmsubscription subscriptions_firmsu_plan_id_a18eb6a8_fk_subscript; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions_firmsubscription
    ADD CONSTRAINT subscriptions_firmsu_plan_id_a18eb6a8_fk_subscript FOREIGN KEY (plan_id) REFERENCES public.subscriptions_subscriptionplan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subscriptions_platforminvoice subscriptions_platfo_created_by_id_c4bb7851_fk_accounts_; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions_platforminvoice
    ADD CONSTRAINT subscriptions_platfo_created_by_id_c4bb7851_fk_accounts_ FOREIGN KEY (created_by_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subscriptions_platforminvoice subscriptions_platfo_subscription_plan_id_fbb2d25c_fk_subscript; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions_platforminvoice
    ADD CONSTRAINT subscriptions_platfo_subscription_plan_id_fbb2d25c_fk_subscript FOREIGN KEY (subscription_plan_id) REFERENCES public.subscriptions_subscriptionplan(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: subscriptions_platforminvoice subscriptions_platforminvoice_firm_id_84cc879b_fk_firms_firm_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subscriptions_platforminvoice
    ADD CONSTRAINT subscriptions_platforminvoice_firm_id_84cc879b_fk_firms_firm_id FOREIGN KEY (firm_id) REFERENCES public.firms_firm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tasks_task tasks_task_assigned_to_id_e8821f61_fk_accounts_customuser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks_task
    ADD CONSTRAINT tasks_task_assigned_to_id_e8821f61_fk_accounts_customuser_id FOREIGN KEY (assigned_to_id) REFERENCES public.accounts_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: tasks_task tasks_task_firm_id_d4629d31_fk_firms_firm_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tasks_task
    ADD CONSTRAINT tasks_task_firm_id_d4629d31_fk_firms_firm_id FOREIGN KEY (firm_id) REFERENCES public.firms_firm(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict 6S2obV2wotU90p4bDoGp64oWA8wIlwMEE91CVmhRh4DUojyShnCWVuaFUmllS3q

