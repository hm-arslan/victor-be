from django.contrib import admin
from django.urls import path, include
from fileupload import urls as file_urls
from authentication import urls as auth_urls
from dataanalysis import urls as data_urls

urlpatterns = [
    path('admin/', admin.site.urls),
    path('file/', include(file_urls)),
    path('data/', include(data_urls)),
    path('auth/', include(auth_urls))
]
