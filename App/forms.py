
from django import forms
from captcha.fields import CaptchaField
from django.core.exceptions import ValidationError
from django.forms.utils import ErrorList


class LoginForm(forms.Form):
    captcha=CaptchaField()  #验证码字段


class ChangePassword(forms.Form):
    # def __init__(self, data=None, files=None, auto_id='id_%s', prefix=None,
    #              initial=None, error_class=ErrorList, label_suffix=None,
    #              empty_permitted=False, field_order=None, use_required_attribute=None, renderer=None,request=None):
    #     super().__init__(data,files,auto_id,prefix,label_suffix,empty_permitted,field_order,use_required_attribute,renderer)
    #     # self.request = request

    old_password = forms.CharField(required=True, error_messages={
        'required': '密码必须输入'
    })
    new_password=forms.CharField(required=True,error_messages={
        'required':'密码必须输入'
    })
    confirm=forms.CharField(required=True,error_messages={
        'required': '密码必须输入'
    })
    # def clean_old_password(self):
    #     old_password=self.cleaned_data.get('old_password')
    #     if old_password==
    def clean(self):
        new_password=self.cleaned_data.get('new_password',None)
        confirm=self.cleaned_data.get('confirm','')
        if new_password!=confirm:
            raise ValidationError({'confirm':'输入的两次密码不一致'})
        return self.cleaned_data