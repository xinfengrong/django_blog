import os

from django.contrib import messages
from django.http import HttpResponse
from django.shortcuts import render, redirect

# Create your views here.
from django.urls import reverse

from App.models import Article, Category, Tag

# {% url 'App02:delete' aid=article.aid cid=cid page=page %}
# 这是模板里的写法：url是反向定位到这个应用的路由名对应的视图函数名，并把它里面的需要的参数传过去
# 这里获取到的参数值是由渲染这个模板的视图函数早就传过来的，所以可以直接写，最后注意，跳转的反向定位的视图函数最后处理完，不能再是渲染了，
# 而应该是跳转redirect 和 reverse结合
from App.views import check_login
from App02.form import ArticleForm
from App02.utils import FileUpload
from blog import settings

@check_login
def delete_article(request, aid, cid=-1, page=1):  # aid必须给，没有默认值 注意位置
    # aid：文章id号  cid：类别id  page：当前页码
    article = Article.objects.get(pk=aid)
    if article:
        article.delete()
    # 删除之后，跳转到当前页面，并把参数传过去 注意django的路由后面的参数传的方法与flask不一样
    # return HttpResponse('ok')
    return redirect(reverse('App:main', kwargs={'cid': cid, 'page': page}))


# 开发：路由正确，视图函数完成业务功能
# 跟数据处理的有关的操作完全可以放到模型中，定义一个类
@check_login
def fabu(request,cid=-1):
    if request.method=='POST':
        fobj = request.FILES.get('picture')
        path=settings.MDEIA_ROOT
        fp=FileUpload(fobj)
        # print(fp) #<App02.utils.FileUpload object at 0x00000000048BA4A8>
        # print(fobj.name) #2.png
        form = ArticleForm(request.POST)
        if form.is_valid() and fp.upload(path):
            data=request.POST.dict()
            print(data)
            data.pop('csrfmiddlewaretoken')
            data['picture']='upload/'+fobj.name
            # print(data)
            Article.add(**data)
            messages.success(request,'发表成功')
            return redirect(reverse('App:main'))
            # return HttpResponse('ok')
        else:
            messages.error(request,'文件上传有误，请重新上传')
            return render(request,'wenzhang_xinwen_fabu.html',locals())
    else:
        cid=cid if cid >0 else Category.first_category().cid
    return render(request, 'wenzhang_xinwen_fabu.html',locals())


# def fabu(request,cid=-1):
#     if request.method=='POST':
#         form=ArticleForm(request.POST)
#         if form.is_valid():
#             data=form.cleaned_data
#             if data.get('content') in ['反动派','反政府','反人民'] or data.get('full_content') in ['反动派','反政府','反人民']\
#                     or data.get('title') in ['反动派','反政府','反人民']:
#                 messages.error(request,'内容包含不当言论，请注意你的言辞')
#                 return render(request,'wenzhang_xinwen_fabu.html',locals())
#             else:
#                 # article=Article(title=data.get('title'),content=data.get('content'),full_content=data.get('full_content'))
#                 # article.save()
#                 # name=data.get('tag')
#                 # tag=Tag(name=name,aid=article)
#                 # tag.save()
#                 print(data)
#                 # data.pop()
#                 Article.add(**data)
#                 messages.success(request,'发表成功')
#                 return redirect(reverse('App:main'))
#         else:
#             return render(request,'wenzhang_xinwen_fabu.html',locals())
#     else:
#         cid=cid if cid>0 else Category.first_category().cid
#         form=ArticleForm()
#     return render(request,'wenzhang_xinwen_fabu.html',locals())

@check_login
def update_article(request,aid,cid=-1):
    if request.method=='POST':
        fobj = request.FILES.get('picture')
        path = settings.MDEIA_ROOT
        fp = FileUpload(fobj)
        form=ArticleForm(request.POST)
        if form.is_valid() and fp.upload(path):
            data=form.cleaned_data
            data['picture']='upload/'+fobj.name
            # print(data)
            # data.poop('csrfmiddlewaretoken')
            # data.pop('photo')
            article=Article.objects.get(pk=aid)
            article.title=data.get('title')
            article.content=data.get('content')
            article.full_content=data.get('full_content')
            article.create_time=data.get('create_time')
            article.picture=data.get('picture')
            article.save()
            messages.success(request,'修改成功')
            return redirect(reverse('App:main'))
        else:
            return render(request,'wenzhang_xinwen_update.html',locals())
    article = Article.objects.get(pk=aid)
    form=ArticleForm()
    return render(request,'wenzhang_xinwen_update.html',locals())

@check_login
def upload_article(request):
    # if request.method=='POST':
    fobj=request.FILES.get('photo')
    path=os.path.join(settings.STATICFILES_DIRS[0],'upload')
    path=os.path.join(path,fobj.name)
    if fobj:
        print(fobj.name,fobj.size)
        with open(path,'wb') as target:
            if fobj.multiple_chunks():
                for data in fobj.chunks():
                    target.write(data)
            else:
                target.write(fobj.read())

    return redirect(reverse('App02:fabu'))
# return redirect(reverse('App02:fabu'))