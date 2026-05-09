"""
Utility functions for accounts app
"""
from .models import UserFirmRole


def get_user_branch(user):
    """
    Get the branch assigned to a user (if any).
    Returns None if user is not assigned to a branch.
    
    Args:
        user: CustomUser instance
        
    Returns:
        Branch instance or None
    """
    if not user or not user.firm:
        return None
    
    membership = UserFirmRole.objects.filter(
        user=user,
        firm=user.firm,
        is_active=True,
        branch__isnull=False
    ).first()
    
    return membership.branch if membership else None


def is_admin_in_branch(user):
    """
    Check if user is an admin assigned to a specific branch.
    
    Args:
        user: CustomUser instance
        
    Returns:
        tuple: (is_branch_admin: bool, branch: Branch or None)
    """
    if user.user_type != 'admin':
        return False, None
    
    branch = get_user_branch(user)
    return (branch is not None, branch)
