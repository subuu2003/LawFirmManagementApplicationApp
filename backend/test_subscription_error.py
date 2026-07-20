#!/usr/bin/env python
"""Test subscription error messages"""
import os
import django
from datetime import timedelta

# Setup Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'myproject.settings')
django.setup()

from firms.models import Firm
from accounts.models import CustomUser
from django.utils import timezone
from rest_framework.authtoken.models import Token
import requests

# Find a test firm and user
firm = Firm.objects.filter(firm_name__icontains='saxena').first()
user = CustomUser.objects.filter(firm=firm, user_type='advocate').first()

if not firm or not user:
    print("❌ Test firm or user not found")
    exit(1)

print("=" * 70)
print("TESTING SUBSCRIPTION ERROR MESSAGES")
print("=" * 70)

# Get auth token
token, _ = Token.objects.get_or_create(user=user)

print(f"\n📋 Test Setup:")
print(f"   Firm: {firm.firm_name}")
print(f"   User: {user.get_full_name()} ({user.email})")
print(f"   Current subscription_end_date: {firm.subscription_end_date}")

# Test 1: Active subscription
print(f"\n{'='*70}")
print("TEST 1: Active Subscription (should work)")
print("="*70)

firm.subscription_end_date = timezone.now() + timedelta(days=30)
firm.is_active = True
firm.save()

response = requests.get(
    'http://127.0.0.1:8000/api/cases/cases/',
    headers={'Authorization': f'Token {token.key}'}
)

print(f"Status Code: {response.status_code}")
if response.status_code == 200:
    print("✅ SUCCESS: Cases endpoint accessible")
else:
    print(f"❌ FAILED: {response.text}")

# Test 2: Expired subscription
print(f"\n{'='*70}")
print("TEST 2: Expired Subscription (should show detailed error)")
print("="*70)

firm.subscription_end_date = timezone.now() - timedelta(days=15)
firm.save()

response = requests.get(
    'http://127.0.0.1:8000/api/cases/cases/',
    headers={'Authorization': f'Token {token.key}'}
)

print(f"Status Code: {response.status_code}")
if response.status_code == 403:
    error_data = response.json()
    print(f"✅ SUCCESS: Got 403 Forbidden")
    print(f"📧 Error Message:")
    print(f"   {error_data.get('detail', 'No detail provided')}")
else:
    print(f"❌ UNEXPECTED: {response.status_code} - {response.text}")

# Test 3: Suspended firm
print(f"\n{'='*70}")
print("TEST 3: Suspended Firm (should show suspension message)")
print("="*70)

firm.is_active = False
firm.save()

response = requests.get(
    'http://127.0.0.1:8000/api/cases/cases/',
    headers={'Authorization': f'Token {token.key}'}
)

print(f"Status Code: {response.status_code}")
if response.status_code == 403:
    error_data = response.json()
    print(f"✅ SUCCESS: Got 403 Forbidden")
    print(f"📧 Error Message:")
    print(f"   {error_data.get('detail', 'No detail provided')}")
else:
    print(f"❌ UNEXPECTED: {response.status_code} - {response.text}")

# Restore firm to active state
print(f"\n{'='*70}")
print("🔧 Restoring firm to active state...")
print("="*70)

firm.subscription_end_date = timezone.now() + timedelta(days=365)
firm.is_active = True
firm.save()

print(f"✅ Firm restored:")
print(f"   is_active: {firm.is_active}")
print(f"   subscription_end_date: {firm.subscription_end_date}")
print(f"   is_suspended: {firm.is_suspended}")
