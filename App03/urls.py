"""blog URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
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

from django.urls import path

from App03 import views

app_name = 'App03'
urlpatterns = [
    #分类管理的
    path('catg/',views.catg_manage,name='catg'),
    path('catg/<int:page>/',views.catg_manage,name='catg'),
    path('drop/<int:cid>/',views.delete_category,name='drop'),
    path('pubcate/',views.pub_category,name='pubcate'),
    path('updatecate/<int:cid>/',views.update_cate,name='updatecate'),

    #用户管理
    path('users/',views.user_manage,name='users'),
    path('users/<int:page>/',views.user_manage,name='users'),
    # path('deluser/',views.del_user,name='deluser'),
    path('deluser/<int:uid>/',views.del_user,name='deluser'),
    path('adduser/',views.add_user,name='adduser'),
    # path('adduser/<int:uid>/',views.add_user,name='adduser'),
    # path('updateuser/',views.update_user,name='updateuser'),
    path('updateuser/<int:uid>/',views.update_user,name='updateuser'),

    #评论管理
    path('marks/',views.mark_manage,name='mark'),
    path('marks/<int:page>/',views.mark_manage,name='mark'),
    path('delmark/<int:mid>/',views.del_mark,name='delmark'),
    path('addmark/',views.add_mark,name='addmark'),
    path('updatemark/<int:mid>/',views.update_mark,name='updatemark'),



]
