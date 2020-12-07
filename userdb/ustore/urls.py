from .views import RegisterAPI
from django.urls import path
from knox import views as knox_views
from .views import LoginAPI, ChangePasswordView, FilesAccessView, ProjectAcessView, FilegetView, ProjectgetView



urlpatterns = [
    path('api/register/', RegisterAPI.as_view(), name='register'),
    path('api/login/', LoginAPI.as_view(), name='login'),
    path('api/logout/', knox_views.LogoutView.as_view(), name='logout'),
    path('api/logoutall/', knox_views.LogoutAllView.as_view(), name='logoutall'),
    path('api/paschange/',ChangePasswordView.as_view(), name='change-password'),
    path('api/files/', FilesAccessView.as_view(), name='file-access'),
    path('api/fileget/', FilegetView.as_view(), name='file-get'),
    path('api/projects/',ProjectAcessView.as_view(),name='project-access'),
    path('api/projectget/',ProjectgetView.as_view(),name='project-get')
]