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

from App import views

app_name = 'App'
urlpatterns = [
    path('', views.index, name='index'),
    # 左边导航栏
    path('left_public/', views.left_public, name='left_public'),
    # 右边上部标题栏
    path('header_public/', views.header_public, name='header_public'),
    # 主窗口，内容展示
    path('main/',views.public_main,name='main'),
    path('main/<int:cid>/',views.public_main,name='main'),
    path('main/<int:cid>/<int:page>/',views.public_main,name='main'),
    #文章搜索
    # path('search/',views.search,name='search'),
    # path('search/<int:cid>/',views.search,name='search'),
    #登录
    path('login/',views.login,name='login'),
    # path('cap/',views.handle_captcha,name='cap'),
    #退出
    path('logout/',views.logout,name='logout'),
    #修改密码
    path('reset/',views.reset_password,name='resetpsw'),

    #文章太多，单独写一个
    # #文章管理
    # path('deletearticle',)

    #错误页面
    path('errors/',views.handle_errors,name='errors'),

]
