from .serializers import TodoSerializer
from .models import Todo
from rest_framework import viewsets

class TodoViewset(viewsets.ModelViewSet):
    serializer_class = TodoSerializer
    queryset = Todo.objects.all()