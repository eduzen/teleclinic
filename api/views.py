from django.contrib.auth.models import User
from rest_framework import viewsets, permissions
from rest_framework.permissions import IsAuthenticated, AllowAny

from .serializers import UserSerializer


class CustomerAccessPermission(permissions.BasePermission):
    def has_permission(self, request, view) -> list:
        if request.method == "GET" and not request.user.is_anonymous:
            return [IsAuthenticated()]
        elif request.method == "POST":
            return [AllowAny()]
        return []


class UserViewSet(viewsets.ModelViewSet):
    queryset = User.objects.all()
    serializer_class = UserSerializer
    permission_classes = (CustomerAccessPermission,)
