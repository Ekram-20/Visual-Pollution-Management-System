from django.http import HttpResponse, HttpResponseRedirect, JsonResponse
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.decorators import api_view
from rest_framework import status
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



# main/pollutions<str:pollution_type>
def filter_pollutions(request, pollution_type):
    return JsonResponse()



# main/search<str:search_key>
def search(request, searchkey):
    data = Pollution.objects.get(pk=id)

    # if (searchkey == name or searchkey== locations):

    return JsonResponse()



# main/export<str:pollution_type>
def export_pollutions(request):
    return JsonResponse()

    path("main/delete<int:id>", views.delete_pollution),



# main/delete<int:id>
def delete_pollution(request, id):
    return HttpResponse()


# statistics
def get_all_statistic(request):
    return JsonResponse()



# statistics/<str:street>
def get_street_statistic(request, street):
    return JsonResponse()

 



 
# try
def please(request):
    return JsonResponse({'ok': 'finally work'})






