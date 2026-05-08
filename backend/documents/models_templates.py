"""
Document Templates for Legal Forms
E-Courts forms that advocates can fill and share with clients
"""
from django.db import models
import uuid
from django.utils import timezone


class DocumentTemplate(models.Model):
    """
    Master template for legal forms (e.g., Vakalatnama, Bail Bond, etc.)
    """
    CATEGORY_CHOICES = [
        ('ecourts', 'E-Courts Forms'),
        ('petition', 'Petitions'),
        ('application', 'Applications'),
        ('affidavit', 'Affidavits'),
        ('notice', 'Notices'),
        ('agreement', 'Agreements'),
        ('other', 'Other'),
    ]
    
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    name = models.CharField(max_length=255, help_text="Template name (e.g., Vakalatnama Form)")
    description = models.TextField(blank=True, help_text="Description of the template")
    category = models.CharField(max_length=50, choices=CATEGORY_CHOICES, default='ecourts')
    
    # Template file (PDF or DOCX)
    template_file = models.FileField(
        upload_to='templates/',
        help_text="Original template file (PDF/DOCX)"
    )
    file_size_kb = models.IntegerField(default=0, help_text="File size in KB")
    
    # Template fields (JSON) - defines what fields need to be filled
    # Example: {"client_name": "text", "case_number": "text", "court_name": "text"}
    template_fields = models.JSONField(
        default=dict,
        blank=True,
        help_text="JSON defining fillable fields in the template"
    )
    
    # Metadata
    is_active = models.BooleanField(default=True)
    is_public = models.BooleanField(
        default=True,
        help_text="If true, all advocates can use this template"
    )
    created_by = models.ForeignKey(
        'accounts.CustomUser',
        on_delete=models.SET_NULL,
        null=True,
        related_name='created_templates'
    )
    
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    class Meta:
        ordering = ['category', 'name']
        indexes = [
            models.Index(fields=['category', 'is_active']),
        ]
    
    def __str__(self):
        return f"{self.name} ({self.get_category_display()})"


class FilledTemplate(models.Model):
    """
    Instance of a filled template for a specific case
    Advocate fills the template and can share with client
    """
    STATUS_CHOICES = [
        ('draft', 'Draft'),
        ('completed', 'Completed'),
        ('shared', 'Shared with Client'),
        ('signed', 'Signed'),
        ('filed', 'Filed in Court'),
    ]
    
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    template = models.ForeignKey(
        DocumentTemplate,
        on_delete=models.CASCADE,
        related_name='filled_instances'
    )
    
    # Associated entities
    case = models.ForeignKey(
        'cases.Case',
        on_delete=models.CASCADE,
        related_name='filled_templates',
        null=True,
        blank=True
    )
    client = models.ForeignKey(
        'clients.Client',
        on_delete=models.CASCADE,
        related_name='filled_templates'
    )
    firm = models.ForeignKey(
        'firms.Firm',
        on_delete=models.CASCADE,
        related_name='filled_templates',
        null=True,
        blank=True
    )
    
    # Filled data (JSON) - stores the filled field values
    # Example: {"client_name": "Rajesh Mehta", "case_number": "CRL-2026-1042"}
    filled_data = models.JSONField(
        default=dict,
        help_text="JSON containing filled field values"
    )
    
    # Generated document
    generated_file = models.FileField(
        upload_to='filled_templates/%Y/%m/',
        null=True,
        blank=True,
        help_text="Generated PDF with filled data"
    )
    
    # Status and sharing
    status = models.CharField(max_length=20, choices=STATUS_CHOICES, default='draft')
    is_shared_with_client = models.BooleanField(default=False)
    shared_at = models.DateTimeField(null=True, blank=True)
    
    # Signatures (if applicable)
    client_signed = models.BooleanField(default=False)
    client_signed_at = models.DateTimeField(null=True, blank=True)
    advocate_signed = models.BooleanField(default=False)
    advocate_signed_at = models.DateTimeField(null=True, blank=True)
    
    # Metadata
    created_by = models.ForeignKey(
        'accounts.CustomUser',
        on_delete=models.SET_NULL,
        null=True,
        related_name='created_filled_templates'
    )
    notes = models.TextField(blank=True, help_text="Internal notes about this document")
    
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    
    class Meta:
        ordering = ['-created_at']
        indexes = [
            models.Index(fields=['case', 'status']),
            models.Index(fields=['client', 'is_shared_with_client']),
            models.Index(fields=['firm', 'status']),
        ]
    
    def __str__(self):
        return f"{self.template.name} - {self.client.get_full_name()} ({self.status})"
    
    def share_with_client(self):
        """Mark template as shared with client"""
        self.is_shared_with_client = True
        self.shared_at = timezone.now()
        if self.status == 'draft':
            self.status = 'shared'
        self.save()
    
    def mark_client_signed(self):
        """Mark as signed by client"""
        self.client_signed = True
        self.client_signed_at = timezone.now()
        self.status = 'signed'
        self.save()
    
    def mark_advocate_signed(self):
        """Mark as signed by advocate"""
        self.advocate_signed = True
        self.advocate_signed_at = timezone.now()
        self.save()
