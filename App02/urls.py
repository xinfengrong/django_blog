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

from App02 import views

# 文章管理的应用
app_name = 'App02'

urlpatterns = [
    # 文章删除
    # 注意传参的顺序
    path('delete/<int:aid>/<int:cid>/<int:page>/', views.delete_article, name='delete'),

    # 发布文章,先考虑要求，发布文章，要求知道文章的cid分类，不然不知道发布的是什么文章，所以要路由请求中要传cid
    path('fabu/<int:cid>/', views.fabu, name='fabu'),

    # 文章修改
    path('update/<int:cid>/<int:aid>/', views.update_article, name='update'),

    #文章上传图片
    path('upload/',views.upload_article,name='upload'),

]
