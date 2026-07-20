#!/usr/bin/env python
"""Find a test user with known credentials"""
import os
import django

# Setup Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'myproject.settings')
django.setup()

from accounts.models import CustomUser
from rest_framework.authtoken.models import Token

# Find users
users = CustomUser.objects.filter(user_type='advocate').exclude(email__icontains='test')[:5]

print("Available test users:\n")
for user in users:
    token, _ = Token.objects.get_or_create(user=user)
    print(f"Email: {user.email}")
    print(f"Firm: {user.firm.firm_name if user.firm else 'None'}")
    print(f"Token: {token.key}")
    print(f"User ID: {user.id}")
    print("-" * 50)
