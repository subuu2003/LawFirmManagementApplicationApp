from django.test import TestCase
from django.contrib.auth import get_user_model
from rest_framework.test import APIClient
from rest_framework import status
from firms.models import Firm
from clients.models import Client
from cases.models import Case
from documents.models_templates import CourtFormTemplate, FilledCourtForm
from documents.utils_pdf import PDFService, get_letter_label, safe_file_url

User = get_user_model()


class FilingPackPreviewTestCase(TestCase):
    def setUp(self):
        self.firm = Firm.objects.create(
            firm_name="Test Firm",
            firm_code="FIRM01",
            email="firm@test.com"
        )
        self.user = User.objects.create_user(
            username="advocate_user",
            email="adv@test.com",
            password="pass",
            user_type="advocate",
            firm=self.firm
        )
        self.client_obj = Client.objects.create(
            firm=self.firm,
            first_name="John",
            last_name="Doe",
            email="john@test.com"
        )
        self.case = Case.objects.create(
            firm=self.firm,
            client=self.client_obj,
            case_title="Filing Pack Test Case",
            case_type="Civil",
            status="open"
        )
        self.api_client = APIClient()
        self.api_client.force_authenticate(user=self.user)

    def test_letter_label_generation(self):
        """Test get_letter_label converts numbers to letters correctly without overflow"""
        self.assertEqual(get_letter_label(0), 'A')
        self.assertEqual(get_letter_label(6), 'G')
        self.assertEqual(get_letter_label(7), 'H')
        self.assertEqual(get_letter_label(25), 'Z')
        self.assertEqual(get_letter_label(26), 'AA')

    def test_preview_filing_pack_with_many_front_pages(self):
        """Test that preview_filing_pack handles >7 front matter pages without IndexError"""
        index_tmpl = CourtFormTemplate.objects.create(
            name="INDEX OF DOCUMENTS",
            category="drafting",
            sequence=1,
            content_structure={"sections": []}
        )
        synopsis_tmpl = CourtFormTemplate.objects.create(
            name="SYNOPSIS AND LIST OF DATES",
            category="drafting",
            sequence=2,
            content_structure={"sections": []}
        )

        FilledCourtForm.objects.create(
            case=self.case,
            client=self.client_obj,
            template=index_tmpl,
            field_values={}
        )
        FilledCourtForm.objects.create(
            case=self.case,
            client=self.client_obj,
            template=synopsis_tmpl,
            field_values={}
        )

        url = f"/api/documents/filled-court-forms/preview_filing_pack/?case_id={self.case.id}"
        response = self.api_client.get(url)
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertIn('forms', response.data)
        self.assertIn('index_data', response.data)
        self.assertIn('form_pages', response.data)
