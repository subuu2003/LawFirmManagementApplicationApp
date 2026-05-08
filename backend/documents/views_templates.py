"""
Views for Document Templates
"""
from rest_framework import viewsets, permissions, status, filters
from rest_framework.decorators import action
from rest_framework.response import Response
from django.db.models import Q
from django.utils import timezone

from .models_templates import DocumentTemplate, FilledTemplate
from .serializers_templates import (
    DocumentTemplateSerializer,
    FilledTemplateSerializer,
    FilledTemplateListSerializer
)


class DocumentTemplateViewSet(viewsets.ModelViewSet):
    """
    ViewSet for managing document templates
    
    Endpoints:
    - GET /api/documents/templates/ - List all templates
    - GET /api/documents/templates/{id}/ - Get template details
    - POST /api/documents/templates/ - Create template (Platform Owner/Super Admin)
    - PUT/PATCH /api/documents/templates/{id}/ - Update template
    - DELETE /api/documents/templates/{id}/ - Delete template
    """
    serializer_class = DocumentTemplateSerializer
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [filters.SearchFilter, filters.OrderingFilter]
    search_fields = ['name', 'description', 'category']
    ordering_fields = ['name', 'category', 'created_at']
    ordering = ['category', 'name']
    
    def get_queryset(self):
        user = self.request.user
        
        # Platform Owner sees all templates
        if user.user_type == 'platform_owner':
            return DocumentTemplate.objects.all()
        
        # Others see only active and public templates
        queryset = DocumentTemplate.objects.filter(is_active=True, is_public=True)
        
        # Filter by category if provided
        category = self.request.query_params.get('category')
        if category:
            queryset = queryset.filter(category=category)
        
        return queryset
    
    def perform_create(self, serializer):
        serializer.save(created_by=self.request.user)


class FilledTemplateViewSet(viewsets.ModelViewSet):
    """
    ViewSet for managing filled templates
    
    Endpoints:
    - GET /api/documents/filled-templates/ - List filled templates
    - GET /api/documents/filled-templates/{id}/ - Get filled template details
    - POST /api/documents/filled-templates/ - Create filled template
    - PUT/PATCH /api/documents/filled-templates/{id}/ - Update filled template
    - DELETE /api/documents/filled-templates/{id}/ - Delete filled template
    - POST /api/documents/filled-templates/{id}/share/ - Share with client
    - POST /api/documents/filled-templates/{id}/sign/ - Sign template
    """
    permission_classes = [permissions.IsAuthenticated]
    filter_backends = [filters.SearchFilter, filters.OrderingFilter]
    search_fields = ['template__name', 'client__first_name', 'client__last_name', 'case__case_number']
    ordering_fields = ['created_at', 'status']
    ordering = ['-created_at']
    
    def get_serializer_class(self):
        if self.action == 'list':
            return FilledTemplateListSerializer
        return FilledTemplateSerializer
    
    def get_queryset(self):
        user = self.request.user
        
        if user.user_type == 'platform_owner':
            return FilledTemplate.objects.all()
        
        elif user.user_type in ['super_admin', 'admin', 'advocate', 'paralegal']:
            # Firm members see their firm's filled templates
            return FilledTemplate.objects.filter(firm=user.firm)
        
        elif user.user_type == 'client':
            # Clients see only templates shared with them
            client_profile = getattr(user, 'client_profile', None)
            if client_profile:
                return FilledTemplate.objects.filter(
                    client=client_profile,
                    is_shared_with_client=True
                )
        
        return FilledTemplate.objects.none()
    
    def perform_create(self, serializer):
        user = self.request.user
        serializer.save(
            created_by=user,
            firm=user.firm if user.firm else None
        )
    
    @action(detail=True, methods=['post'])
    def share(self, request, pk=None):
        """
        Share filled template with client
        
        POST /api/documents/filled-templates/{id}/share/
        """
        filled_template = self.get_object()
        
        # Only advocate, admin, or super_admin can share
        if request.user.user_type not in ['advocate', 'admin', 'super_admin']:
            return Response(
                {'error': 'Only advocates and admins can share templates'},
                status=status.HTTP_403_FORBIDDEN
            )
        
        filled_template.share_with_client()
        
        serializer = self.get_serializer(filled_template)
        return Response({
            'message': f'Template "{filled_template.template.name}" shared with {filled_template.client.get_full_name()}',
            'filled_template': serializer.data
        })
    
    @action(detail=True, methods=['post'])
    def sign(self, request, pk=None):
        """
        Sign the filled template
        
        POST /api/documents/filled-templates/{id}/sign/
        {
            "signature_type": "client" or "advocate"
        }
        """
        filled_template = self.get_object()
        signature_type = request.data.get('signature_type')
        
        if signature_type == 'client':
            # Client signing
            if request.user.user_type != 'client':
                return Response(
                    {'error': 'Only clients can sign as client'},
                    status=status.HTTP_403_FORBIDDEN
                )
            
            filled_template.mark_client_signed()
            message = 'Template signed by client successfully'
        
        elif signature_type == 'advocate':
            # Advocate signing
            if request.user.user_type not in ['advocate', 'admin', 'super_admin']:
                return Response(
                    {'error': 'Only advocates can sign as advocate'},
                    status=status.HTTP_403_FORBIDDEN
                )
            
            filled_template.mark_advocate_signed()
            message = 'Template signed by advocate successfully'
        
        else:
            return Response(
                {'error': 'signature_type must be "client" or "advocate"'},
                status=status.HTTP_400_BAD_REQUEST
            )
        
        serializer = self.get_serializer(filled_template)
        return Response({
            'message': message,
            'filled_template': serializer.data
        })
    
    @action(detail=False, methods=['get'])
    def my_templates(self, request):
        """
        Get templates for the current user
        
        GET /api/documents/filled-templates/my_templates/
        - Advocates see templates they created
        - Clients see templates shared with them
        """
        user = request.user
        
        if user.user_type == 'client':
            client_profile = getattr(user, 'client_profile', None)
            if not client_profile:
                return Response({'error': 'Client profile not found'}, status=status.HTTP_404_NOT_FOUND)
            
            templates = FilledTemplate.objects.filter(
                client=client_profile,
                is_shared_with_client=True
            )
        
        elif user.user_type in ['advocate', 'admin', 'super_admin']:
            templates = FilledTemplate.objects.filter(created_by=user)
        
        else:
            templates = FilledTemplate.objects.none()
        
        # Filter by status if provided
        status_filter = request.query_params.get('status')
        if status_filter:
            templates = templates.filter(status=status_filter)
        
        # Filter by case if provided
        case_id = request.query_params.get('case_id')
        if case_id:
            templates = templates.filter(case_id=case_id)
        
        serializer = FilledTemplateListSerializer(templates, many=True)
        return Response(serializer.data)
    
    @action(detail=False, methods=['get'])
    def by_case(self, request):
        """
        Get all filled templates for a specific case
        
        GET /api/documents/filled-templates/by_case/?case_id=uuid
        """
        case_id = request.query_params.get('case_id')
        if not case_id:
            return Response({'error': 'case_id is required'}, status=status.HTTP_400_BAD_REQUEST)
        
        templates = self.get_queryset().filter(case_id=case_id)
        serializer = FilledTemplateListSerializer(templates, many=True)
        return Response(serializer.data)
