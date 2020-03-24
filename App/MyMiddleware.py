import re
import sys

from django.shortcuts import redirect
from django.template import loader
from django.urls import reverse
from django.utils.deprecation import MiddlewareMixin

# 自定义中间件，全局路由保护
from django.views.debug import technical_500_response

from App.forms import LoginForm


class MyMiddleware(MiddlewareMixin):
    # def process_request(self, request):
    #     username = request.session.get('username')
    #     if username or re.match(r'/blog/image/', request.path) or re.match(r'/blog/refresh/', request.path):
    #         # if username:
    #         return
    #     # elif re.match(r'/blog/image/', requset.path) or requset.path not in ['/blog/login/']:
    #     elif request.path not in ['/blog/login/']:
    #         return redirect('/blog/login/')

    # 异常处理
    def process_exception(self, request, exception):
        # 对管理员展示错误页面，一般用户只能看到404 500等页面
        ip = request.META.get('REMOTE_ADDR')
        if ip == '127.0.0.1':
            return technical_500_response(request, *sys.exc_info())
        return redirect(reverse('App:errors'))
