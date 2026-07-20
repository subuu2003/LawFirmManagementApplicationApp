#!/usr/bin/env python
"""Test that login works even with expired subscription"""
import os
import django
from datetime import timedelta

# Setup Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'myproject.settings')
django.setup()

from firms.models import Firm
from accounts.models import CustomUser
from django.utils import timezone
import requests

print("=" * 70)
print("TESTING LOGIN WITH EXPIRED SUBSCRIPTION")
print("=" * 70)

# Find test user
firm = Firm.objects.filter(firm_name__icontains='saxena').first()
user = CustomUser.objects.filter(firm=firm, user_type='advocate').first()

if not firm or not user:
    print("❌ Test firm or user not found")
    exit(1)

print(f"\n📋 Test Setup:")
print(f"   Firm: {firm.firm_name}")
print(f"   User: {user.email}")

# Test 1: Expire the subscription first
print(f"\n{'='*70}")
print("STEP 1: Expiring subscription...")
print("="*70)

firm.subscription_end_date = timezone.now() - timedelta(days=15)
firm.is_active = True
firm.save()

print(f"✅ Subscription expired 15 days ago")
print(f"   is_suspended: {firm.is_suspended}")

# Test 2: Try to login (should work!)
print(f"\n{'='*70}")
print("STEP 2: Testing LOGIN with expired subscription")
print("="*70)

login_response = requests.post(
    'http://127.0.0.1:8000/api/auth/login_username_password/',
    json={
        'username': user.email,
        'password': '123'  # Update with correct password
    }
)

print(f"Status Code: {login_response.status_code}")

if login_response.status_code == 200:
    print("✅ SUCCESS: Login works even with expired subscription!")
    data = login_response.json()
    token = data.get('token')
    print(f"   Token received: {token[:20]}...")
    
    # Test 3: Try to access protected resource (should fail with detailed message)
    print(f"\n{'='*70}")
    print("STEP 3: Accessing protected resource (Cases)")
    print("="*70)
    
    cases_response = requests.get(
        'http://127.0.0.1:8000/api/cases/cases/',
        headers={'Authorization': f'Token {token}'}
    )
    
    print(f"Status Code: {cases_response.status_code}")
    
    if cases_response.status_code == 403:
        print("✅ SUCCESS: Protected resource blocked as expected")
        error_data = cases_response.json()
        print(f"📧 Error Message:")
        print(f"   {error_data.get('detail', 'No detail')}")
    else:
        print(f"❌ UNEXPECTED: {cases_response.status_code}")
        
    # Test 4: Try to access allowed resources (Dashboard, User profile)
    print(f"\n{'='*70}")
    print("STEP 4: Accessing allowed endpoints (User profile)")
    print("="*70)
    
    user_response = requests.get(
        'http://127.0.0.1:8000/api/users/me/',
        headers={'Authorization': f'Token {token}'}
    )
    
    print(f"Status Code: {user_response.status_code}")
    
    if user_response.status_code == 200:
        print("✅ SUCCESS: User can access their profile even with expired subscription")
    else:
        error_data = user_response.json()
        print(f"❌ FAILED: {error_data}")
        
elif login_response.status_code == 400:
    print("❌ FAILED: Invalid credentials (update test password)")
    print(f"   Response: {login_response.json()}")
else:
    print(f"❌ FAILED: {login_response.status_code}")
    print(f"   Response: {login_response.text}")

# Restore firm
print(f"\n{'='*70}")
print("CLEANUP: Restoring firm to active state")
print("="*70)

firm.subscription_end_date = timezone.now() + timedelta(days=365)
firm.save()

print(f"✅ Firm restored")
print(f"   subscription_end_date: {firm.subscription_end_date}")
