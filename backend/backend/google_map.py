import requests
import smtplib # to send email

api_key = ''


import geocoder
g = geocoder.ip('176.18.9.114')
print(g)
print(g.latlng)
# <[OK] Ipinfo - Geocode [Jeddah, Mecca Region, SA]>
# [21.4901, 39.1862]


def get_location(request):

    try: 
        client_ip = request.META.get('REMOTE_ADDR', '')  # Get the client's IP address
        location = geocoder.ip(client_ip)

        if location.ok:
            return JsonResponse({'latitude': location.latlng[0], 'longitude': location.latlng[1]})
        else:
            return JsonResponse({'error': 'Unable to fetch location'}, status=500)
        
    except Exception as e:
        return JsonResponse({'error': str(e)}, status=500)
    







# def get_ip():
#     response = requests.get('https://api64.ipify.org?format=json').json()
#     return response["ip"]


# def get_location():
#     ip_address = get_ip()
#     response = requests.get(f'https://ipapi.co/{ip_address}/json/').json()
#     location_data = {
#         "ip": ip_address,
#         "city": response.get("city"),
#         "region": response.get("region"),
#         "country": response.get("country_name"),
#         "latitude": response.get("latitude"),
#         "longitude": response.get("longitude"),
#     }
#     return location_data
# print(get_location())