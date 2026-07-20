#!/usr/bin/env python
"""Check Saxena & Saxena subscription status"""
import os
import django
from datetime import datetime, timedelta

# Setup Django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'myproject.settings')
django.setup()

from firms.models import Firm
from django.utils import timezone

# Find Saxena firm
saxena = Firm.objects.filter(firm_name__icontains='Saxena').first()

if saxena:
    print("=" * 60)
    print(f"Firm: {saxena.firm_name}")
    print("=" * 60)
    print(f"ID: {saxena.id}")
    print(f"is_active: {saxena.is_active}")
    print(f"subscription_type: {saxena.subscription_type}")
    print(f"subscription_start_date: {saxena.subscription_start_date}")
    print(f"subscription_end_date: {saxena.subscription_end_date}")
    print(f"trial_end_date: {saxena.trial_end_date}")
    print(f"\nCurrent time: {timezone.now()}")
    print(f"\nis_suspended (calculated): {saxena.is_suspended}")
    
    if saxena.is_suspended:
        print("\n⚠️  FIRM IS SUSPENDED!")
        
        # Fix it by extending subscription
        new_end_date = timezone.now() + timedelta(days=365)
        saxena.subscription_end_date = new_end_date
        saxena.save()
        
        print(f"\n✓ Extended subscription to: {new_end_date}")
        print(f"✓ is_suspended now: {saxena.is_suspended}")
    else:
        print("\n✓ Firm is NOT suspended")
else:
    print("Saxena firm not found!")
