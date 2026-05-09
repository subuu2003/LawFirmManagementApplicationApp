from django.contrib import admin
from .models import UserDocument
from .models_templates import DocumentTemplate, FilledTemplate


@admin.register(UserDocument)
class UserDocumentAdmin(admin.ModelAdmin):
    list_display = [
        'document_title', 'uploaded_by', 'firm', 'client', 'document_type', 
        'verification_status', 'is_deleted', 'uploaded_at'
    ]
    list_filter = [
        'document_type', 'verification_status', 'is_deleted', 
        'uploaded_at', 'firm'
    ]
    search_fields = [
        'document_title', 'uploaded_by__email', 'uploaded_by__first_name',
        'uploaded_by__last_name', 'document_number', 'client__first_name',
        'client__last_name'
    ]
    readonly_fields = [
        'id', 'uploaded_at', 'updated_at', 'verified_at', 
        'deleted_at', 'verified_by', 'deleted_by'
    ]
    
    fieldsets = (
        ('Document Information', {
            'fields': ('document_title', 'document_type', 'document_category', 
                      'document_number', 'document_file', 'description')
        }),
        ('Relationships', {
            'fields': ('uploaded_by', 'firm', 'client', 'case')
        }),
        ('Verification', {
            'fields': ('verification_status', 'verified_by', 'verification_notes', 'verified_at')
        }),
        ('Version Control', {
            'fields': ('version', 'parent_document')
        }),
        ('Deletion Status', {
            'fields': ('is_deleted', 'deleted_at', 'deleted_by')
        }),
        ('Timestamps', {
            'fields': ('uploaded_at', 'updated_at')
        }),
    )
    
    def get_queryset(self, request):
        """Show all documents including soft-deleted ones in admin"""
        return super().get_queryset(request)


@admin.register(DocumentTemplate)
class DocumentTemplateAdmin(admin.ModelAdmin):
    list_display = [
        'name', 'category', 'is_active', 'is_public', 
        'created_by', 'created_at'
    ]
    list_filter = ['category', 'is_active', 'is_public', 'created_at']
    search_fields = ['name', 'description']
    readonly_fields = ['id', 'created_at', 'updated_at']
    
    fieldsets = (
        ('Template Information', {
            'fields': ('name', 'description', 'category', 'template_file', 
                      'file_size_kb', 'template_fields')
        }),
        ('Settings', {
            'fields': ('is_active', 'is_public', 'created_by')
        }),
        ('Timestamps', {
            'fields': ('created_at', 'updated_at')
        }),
    )


@admin.register(FilledTemplate)
class FilledTemplateAdmin(admin.ModelAdmin):
    list_display = [
        'template', 'client', 'case', 'status', 
        'is_shared_with_client', 'client_signed', 'advocate_signed',
        'created_at'
    ]
    list_filter = [
        'status', 'is_shared_with_client', 'client_signed', 
        'advocate_signed', 'created_at', 'firm'
    ]
    search_fields = [
        'template__name', 'client__first_name', 'client__last_name',
        'case__case_number', 'notes'
    ]
    readonly_fields = [
        'id', 'created_at', 'updated_at', 'shared_at',
        'client_signed_at', 'advocate_signed_at'
    ]
    
    fieldsets = (
        ('Template & Relationships', {
            'fields': ('template', 'case', 'client', 'firm')
        }),
        ('Form Data', {
            'fields': ('filled_data', 'generated_file', 'notes')
        }),
        ('Status & Sharing', {
            'fields': ('status', 'is_shared_with_client', 'shared_at')
        }),
        ('Signatures', {
            'fields': ('client_signed', 'client_signed_at', 
                      'advocate_signed', 'advocate_signed_at')
        }),
        ('Metadata', {
            'fields': ('created_by', 'created_at', 'updated_at')
        }),
    )
