
from django.db import models

class Pollution (models.Model):

    POLLUTION_TYPES = [
        # En, Arabic
        ('grbg', 'Garbage'),
        ('grpty', 'Graphite'),
        ('snd', 'Sand'),
    ]
    
    date = models.DateField(auto_now_add=True)
    street = models.CharField(max_length=200)
    location = models.CharField(max_length= 30) # (x, y)
    location_url = models.URLField(max_length=200)

    # TO change max 
    type = models.CharField(max_length=10, choices= POLLUTION_TYPES)
    image = models.ImageField(upload_to= f'images/')

    # not sure keep it like this
    approved = models.BooleanField(default=False)
    rejected = models.BooleanField(default=False)


    def __str__(self):
        return f'{self.street}, {self.type}'
