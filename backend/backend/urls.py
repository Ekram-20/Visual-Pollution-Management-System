"""backend URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/4.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from backend import views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path("admin/", admin.site.urls),
    
    # main page
    path("main/pollutions", views.get_pollutions),
    path("main/pollutions<str:pollution_type>", views.filter_pollutions),
    path("main/search<str:search_key>", views.search),
    path("main/export", views.export_pollutions),
    path("main/delete<int:id>", views.delete_pollution),

    # statistics page
    path("statistics", views.get_all_statistic),
    path("statistics/<str:street>", views.get_street_statistic),

    # for test
    path("please/", views.please),
]


# this is image paths
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
