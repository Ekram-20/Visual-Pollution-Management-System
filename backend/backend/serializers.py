from rest_framework import serializers
from .models import Pollution


class PollutionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Pollution
        fields = '__all__'

