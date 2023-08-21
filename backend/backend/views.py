from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.decorators import api_view
from rest_framework import status

from backend.detection_model import detect_pollutions
from backend.settings import BASE_DIR
from .models import Pollution
from .serializers import PollutionSerializer

"""
DB methods

all_data = Pollution.objects.all()
get_by_id = Pollution.objects.get(pk=id)


add data
object = Pollution(attributes=...)
object.save()


delete
get the object by id
then 
object.delete()
"""


# main/pollutions
@api_view(['GET'])
def get_pollutions(request):
    # get all pollutions
    pollutions = Pollution.objects.all()

    # serialize objects (convert to JSON)
    serializer = PollutionSerializer(pollutions, many=True)  # many=True indicates that it's a list

    # send the JSON
    return JsonResponse(serializer.data, safe=False)


# main/export<str:pollution_type>
def export_pollutions(request):
    return JsonResponse()


# main/delete<int:id>
def delete_pollution(request, id):
    try:
        pollution_instance = Pollution.objects.get(pk=id)
        pollution_instance.delete()
        return get_pollutions(request)
    except Pollution.DoesNotExist:
        return HttpResponse("Pollution instance does not exist.", status=404)

    



from datetime import date
import geocoder
from PIL import Image
import cv2
from ultralytics import YOLO
from .models import Pollution


# Load the YOLOv8 model
model = YOLO('backend/pollution_detection.pt')


classes = {0: 'BAD_BILLBOARD', 1: 'BAD_STREETLIGHT',
           2: 'BROKEN_SIGNAGE', 3: 'CLUTTER_SIDEWALK', 
           4: 'CONSTRUCTION_ROAD', 5: 'FADED_SIGNAGE',
           6: 'GARBAGE', 7: 'GRAFFITI', 8: 'POTHOLES', 
           9: 'SAND_ON_ROAD', 10: 'UNKEPT_FACADE'}

pollutions_arabic = {
         'GRAFFITI': 'كتابة على الجدران',
         'FADED_SIGNAGE' : 'لوحة إرشاد باهتة',
         'BROKEN_SIGNAGE': 'لوحة إرشاد تالفة',
         'POTHOLES' : 'حفريات',
         'GARBAGE': 'نفايات',
         'CONSTRUCTION_ROAD' : 'أعمال طريق',
         'BAD_STREETLIGHT' : 'إشارة سيئة', 
         'BAD_BILLBOARD' : 'لوحة سيئة',
         'SAND_ON_ROAD' : 'رمل على الطريق', 
         'CLUTTER_SIDEWALK' : 'أرصفة مشوهة',
         'UNKEPT_FACADE': 'واجهة سيئة',
}



def save(request):

    image = cv2.imread('/Users/ekram/Desktop/11.jpg')

    # Run YOLOv8 inference on the frame
    results = model(image)

    class_indics = list(results[0].boxes.cls)

    if len(class_indics) == 0:
        return HttpResponse("There is not detected pollution") 
    

    class_names = [classes[int(i)] for i in class_indics]
    for name in class_names:

        # Visualize the results on the frame
        annotated_image = results[0].plot()

        created_date = date.today()
        location_obj = geocoder.ip('me')
        image_path = f'{BASE_DIR}/media/images/{tuple(location_obj.latlng)}_{name}_{created_date}.jpg'

        # save image
        image_save = cv2.imwrite(image_path, annotated_image)

        new = Pollution(
            date = created_date, 
            street = location_obj.city, 
            location = str(tuple(location_obj.latlng)) + '9', 
            location_url = 'https://www.google.com/maps',
            type = pollutions_arabic[name],
            image = f'images/{tuple(location_obj.latlng)}_{name}_{created_date}.jpg',
            approved = False,
            rejected = False,
        )
        try:
            new.save()
        except:
            'ok'

    return get_pollutions(request)




def tryVideo(request):

     # Open the video file
    cap = cv2.VideoCapture("/Users/ekram/Desktop/before.mp4")

    # Loop through the video frames
    while cap.isOpened():
       
        success, frame = cap.read()

        if success:
            
            results = model(frame)

            # Visualize the results on the frame
            annotated_frame = results[0].plot()

            class_indics = list(results[0].boxes.cls)

            if len(class_indics) == 0:
                break #return HttpResponse("There is not detected pollution") 
            
            class_names = [classes[int(i)] for i in class_indics if i == class_indics[0]]
            for name in class_names:

                created_date = date.today()
                location_obj = geocoder.ip('me')
                image_path = f'{BASE_DIR}/media/images/{tuple(location_obj.latlng)}_{name}_{created_date}.jpg'

                # save image
                image_save = cv2.imwrite(image_path, annotated_frame)

                new = Pollution(
                    date = created_date, 
                    street = location_obj.city, 
                    location = str(tuple(location_obj.latlng)), 
                    location_url = 'https://www.google.com/maps',
                    type = pollutions_arabic[name],
                    image = f'images/{tuple(location_obj.latlng)}_{name}_{created_date}.jpg',
                    approved = False,
                    rejected = False,
                )
                try:
                    new.save()
                except:
                    'ok'

            
    # Release the video capture object and close the display window
    cap.release()
    return get_pollutions(request)
   

    
  