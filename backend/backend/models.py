
from django.db import models

class Pollution (models.Model):


    POLLUTION_TYPES = [
        ('كتابة على الجدران', 'GRAFFITI'),
        ('لوحة إرشاد باهتة', 'FADEDـSIGNAGE'),
         ('لوحة إرشاد تالفة', 'BROKEN_SIGNAGE'),
        ('حفريات', 'POTHOLES'),
        ('نفايات', 'GARBAGE'),
        ('أعمال طريق', 'CONSTRUCTIONـROAD'),
        ('إشارة سيئة', 'BADـSTREETLIGHT'),
        ('لوحة سيئة', 'BADـBILLBOARD'),
        ('رمل على الطريق', 'SAND ON ROAD'),
        ('أرصفة مشوهة', 'CLUTTER_SIDEWALK'),
        ('واجهة سيئة', 'UNKEPT_FACADE'),
    ]
    
    date = models.DateField(auto_now_add=True)
    street = models.CharField(max_length=200)
    location = models.CharField(max_length= 30) # (x, y)
    location_url = models.URLField(max_length=200)

    type = models.CharField(max_length=30, choices= POLLUTION_TYPES)
    image = models.ImageField(upload_to= f'images/')

    # not sure keep it like this
    approved = models.BooleanField(default=False)
    rejected = models.BooleanField(default=False)


    def __str__(self):
        return f'{self.street}, {self.type}'
    
    class Meta:
        unique_together = ["location", "type"]
    

    # def __eq__(self, __value: object) -> bool:
    #     return super().__eq__(__value)
