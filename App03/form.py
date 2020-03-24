import re

from django import forms
from captcha.fields import CaptchaField
from django.core.exceptions import ValidationError
from django.forms.utils import ErrorList


class CategoryForm(forms.Form):
    name=forms.CharField(required=True,error_messages={
        'required':'分类标题必须输入'
    })
    # def clean_old_password(self):
    #     old_password=self.cleaned_data.get('old_password')
    #     if old_password==
class UserForm(forms.Form):
    username=forms.CharField(min_length=3,required=True,error_messages={
        'required':'用户名必须输入',
        'min_length':'用户名长度不得小于3个字符'
    })
    password=forms.CharField(min_length=6,required=True,error_messages={
        'required':'密码是必须输入的',
        'min_length':'初始密码长度至少6位',
    })
    confirm = forms.CharField(min_length=6, required=True, error_messages={
        'required': '密码是必须输入的',
        'min_length': '初始密码长度至少6位',
    })
    email=forms.EmailField(error_messages={
        'invalid':'请输入正确的邮箱账号'
    })
    phone=forms.CharField()

    def clean_phone(self):
        phone=self.cleaned_data.get('phone')
        if not re.match(r'1[35678]\d{9}$', phone):
            raise ValidationError('电话号码不符合规则')
        return phone

    #全局验证
    def clean(self):
        password=self.cleaned_data.get('password')
        confirm=self.cleaned_data.get('confirm')
        if password!=confirm:
            raise ValidationError({'confirm':'两次初始密码不一致'})
        return self.cleaned_data

class MarkForm(forms.Form):
    content=forms.CharField(error_messages={
        'required':'若想发布评论，评论不得为空'
    })
    marker_name=forms.CharField(error_messages={
        'required':'请输入您的用户名'
    })
    article_name = forms.CharField(error_messages={
        'required': '请输入您评论的文章标题'
    })

