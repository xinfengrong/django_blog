import re

from django import forms
from captcha.fields import CaptchaField
from django.core.exceptions import ValidationError
from django.forms.utils import ErrorList


class ArticleForm(forms.Form):
    # picture=forms.CharField()
    title=forms.CharField(required=True,error_messages={
        'required':'文章标题必须输入'
    })
    tag = forms.CharField(required=True, error_messages={
        'required': '文章标签必须输入'
    })
    content = forms.CharField(required=True, error_messages={
        'required': '文章简介必须输入'
    })
    full_content = forms.CharField(required=True, min_length=20,error_messages={
        'required': '文章简介必须输入',
        'min_length':'文章内容不得少于20个字符'
    })
