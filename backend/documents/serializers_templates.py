"""
Serializers for Document Templates
"""
from rest_framework import serializers
from .models_templates import DocumentTemplate, FilledTemplate


class DocumentTemplateSerializer(serializers.ModelSerializer):
    """Serializer for document templates"""
    category_display = serializers.CharField(source='get_category_display', read_only=True)
    created_by_name = serializers.SerializerMethodField()
    
    class Meta:
        model = DocumentTemplate
        fields = [
            'id', 'name', 'description', 'category', 'category_display',
            'template_file', 'file_size_kb', 'template_fields',
            'is_active', 'is_public', 'created_by', 'created_by_name',
            'created_at', 'updated_at'
        ]
        read_only_fields = ['id', 'created_at', 'updated_at', 'created_by']
    
    def get_created_by_name(self, obj):
        if obj.created_by:
            return obj.created_by.get_full_name() or obj.created_by.email
        return None


class FilledTemplateSerializer(serializers.ModelSerializer):
    """Serializer for filled templates"""
    template_name = serializers.CharField(source='template.name', read_only=True)
    template_category = serializers.CharField(source='template.category', read_only=True)
    case_title = serializers.SerializerMethodField()
    case_number = serializers.SerializerMethodField()
    client_name = serializers.CharField(source='client.get_full_name', read_only=True)
    created_by_name = serializers.SerializerMethodField()
    status_display = serializers.CharField(source='get_status_display', read_only=True)
    
    class Meta:
        model = FilledTemplate
        fields = [
            'id', 'template', 'template_name', 'template_category',
            'case', 'case_title', 'case_number',
            'client', 'client_name', 'firm',
            'filled_data', 'generated_file',
            'status', 'status_display',
            'is_shared_with_client', 'shared_at',
            'client_signed', 'client_signed_at',
            'advocate_signed', 'advocate_signed_at',
            'created_by', 'created_by_name', 'notes',
            'created_at', 'updated_at'
        ]
        read_only_fields = [
            'id', 'created_at', 'updated_at', 'created_by',
            'shared_at', 'client_signed_at', 'advocate_signed_at'
        ]
    
    def get_case_title(self, obj):
        return obj.case.case_title if obj.case else None
    
    def get_case_number(self, obj):
        return obj.case.case_number if obj.case else None
    
    def get_created_by_name(self, obj):
        if obj.created_by:
            return obj.created_by.get_full_name() or obj.created_by.email
        return None


class FilledTemplateListSerializer(serializers.ModelSerializer):
    """Lightweight serializer for listing filled templates"""
    template_name = serializers.CharField(source='template.name', read_only=True)
    client_name = serializers.CharField(source='client.get_full_name', read_only=True)
    case_number = serializers.SerializerMethodField()
    status_display = serializers.CharField(source='get_status_display', read_only=True)
    
    class Meta:
        model = FilledTemplate
        fields = [
            'id', 'template_name', 'client_name', 'case_number',
            'status', 'status_display', 'is_shared_with_client',
            'client_signed', 'advocate_signed', 'created_at'
        ]
    
    def get_case_number(self, obj):
        return obj.case.case_number if obj.case else None
