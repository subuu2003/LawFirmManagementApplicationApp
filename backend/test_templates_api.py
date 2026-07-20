#!/usr/bin/env python
"""Test templates API"""
import os
import django

# Setup Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'myproject.settings')
django.setup()

from documents.models_templates import CourtFormTemplate
from accounts.models import CustomUser
from rest_framework.authtoken.models import Token

# Count templates
templates = CourtFormTemplate.objects.all()
print(f"Total templates in database: {templates.count()}")
print("\nTemplates:")
for t in templates:
    print(f"  - {t.name} ({t.category})")

# Get a token for testing
user = CustomUser.objects.filter(user_type='advocate').first()
if user:
    token, _ = Token.objects.get_or_create(user=user)
    print(f"\n\nTest API with:")
    print(f"curl -H 'Authorization: Token {token.key}' http://127.0.0.1:8000/api/documents/court-form-templates/")
