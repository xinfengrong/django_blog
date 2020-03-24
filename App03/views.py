from django.contrib import messages
from django.shortcuts import render, redirect

# Create your views here.

# @check_login
from django.urls import reverse

from App.models import Category, User, Mark, Article
from App.tools import BaiduPaginator
from App.views import check_login
from App02.utils import FileUpload
from App03.form import CategoryForm, UserForm, MarkForm
from blog import settings

@check_login
def catg_manage(request, page=1):
    if request.method == 'POST':
        search = request.POST.get('search', '')
        categories = Category.objects.filter(name__contains=search)
    else:
        categories = Category.objects.all()
    paginator = BaiduPaginator(categories, 2)  # 返回的是分页的数据，模板中改成分页的数据
    # 分页对象
    pager = paginator.page(page)
    # 老师改写的那里总页数给了pagination.num_pages
    pager.page_range = paginator.custom_range(paginator.num_pages, page, 3)
    # return render(request, 'wenzhang_xinwen.html', {'categories': categories})
    return render(request, 'fenlie_guanli.html', locals())


# 删除分类
@check_login
def delete_category(request, cid):
    category = Category.objects.get(pk=cid)
    if category:
        category.delete()
    return redirect(reverse('App03:catg', kwargs={'page': 1}))

@check_login
def pub_category(request):
    if request.method == 'POST':
        form = CategoryForm(request.POST)
        if form.is_valid():
            name = request.POST.get('name')
            num = request.POST.get('num')
            categories = Category.objects.all()
            # print(categories)
            for data in categories:
                if data.name == name:
                    messages.error(request, '该类别已存在，请重新输入')
                    return render(request, 'category_fabu.html')
            else:
                category = Category(name=name, num=num)
                category.save()
                return redirect(reverse('App03:catg'))
        else:
            return render(request, 'category_fabu.html', locals())
    else:
        return render(request, 'category_fabu.html')

@check_login
def update_cate(request, cid):
    category = Category.objects.get(pk=cid)
    if request.method == 'POST':
        num = request.POST.get('num')
        category.num = num
        category.save()
        return redirect(reverse('App03:catg'))
    return render(request, 'category_update.html', locals())

@check_login
def catg_manage(request, page=1):
    if request.method == 'POST':
        search = request.POST.get('search', '')
        categories = Category.objects.filter(name__contains=search)
    else:
        categories = Category.objects.all()
    paginator = BaiduPaginator(categories, 2)  # 返回的是分页的数据，模板中改成分页的数据
    # 分页对象
    pager = paginator.page(page)
    # 老师改写的那里总页数给了pagination.num_pages
    pager.page_range = paginator.custom_range(paginator.num_pages, page, 3)
    # return render(request, 'wenzhang_xinwen.html', {'categories': categories})
    return render(request, 'fenlie_guanli.html', locals())

@check_login
def user_manage(request, page=1):
    if request.method == 'POST':
        search = request.POST.get('search', '')
        users = User.objects.filter(username__contains=search)
    else:
        users = User.objects.all()
    paginator = BaiduPaginator(users, 2)
    pager = paginator.page(page)
    pager.page_range = paginator.custom_range(paginator.num_pages, page, 3)
    return render(request, 'users_manage.html', locals())

@check_login
def del_user(request, uid):
    username = request.session.get('username')
    if username == 'monica':
        user = User.objects.get(pk=uid)
        # print(user)
        if user:
            user.delete()
            # user.save()
            return redirect(reverse('App03:users'))
    else:
        return render(request, 'nochange_users.html')

@check_login
def add_user(request):
    username = request.session.get('username')
    if username == 'monica':
        if request.method == 'POST':
            fobj = request.FILES.get('picture')
            path = settings.MDEIA_ROOT
            fp = FileUpload(fobj)
            # user=User.objects.get(username=username)
            form = UserForm(request.POST)
            # print(form)
            if form.is_valid() and fp.upload(path):
                data = form.cleaned_data
                data.pop('confirm')
                data['portrait']='upload/'+fobj.name
                users = User.objects.all()
                for every in users:
                    if every.username == data.get('username'):
                        messages.error(request, '该用户名已存在，请重新输入')
                        return render(request, 'add_users.html', locals())
                else:
                    user = User.objects.create(**data)
                    messages.success(request, '添加成功，请告知用户及时更改初始密码!')
                    return redirect(reverse('App03:users'))
            else:
                messages.error(request,'文件上传有误，请重新选择')
                return render(request, 'add_users.html', locals())
        else:
            form = UserForm()
            return render(request, 'add_users.html', locals())
    else:
        # print(1111111)
        return render(request, 'nochange_users.html')

@check_login
def update_user(request, uid):
    username = request.session.get('username')
    if username == 'monica':
        if request.method == 'POST':
            fobj = request.FILES.get('picture')
            path = settings.MDEIA_ROOT
            fp = FileUpload(fobj)
            user = User.objects.get(uid=uid)
            if user:
                form = UserForm(request.POST)
                if form.is_valid() and fp.upload(path):
                    data = form.cleaned_data
                    # data.pop('confirm')
                    user = User.objects.get(uid=uid)
                    user.username = data.get('username')
                    users = User.objects.all()
                    for every in users:
                        if every.username == data.get('username'):
                            messages.error(request, '该用户名已存在，请重新输入用户名')
                            return render(request, 'update_users.html', locals())
                    else:
                        user.password = data.get('password')
                        user.email = data.get('email')
                        user.phone = data.get('phone')
                        user.portrait='upload/'+fobj.name
                        user.save()
                        messages.success(request,
                                         'successful,please tell the user to change password as soon as possible')
                        return redirect(reverse('App03:users'))
                # elif not fp.upload(path):
                #     messages.error(request,'请选图片')
                #     return render(request, 'update_users.html', locals())
                else:
                    messages.error(request,'请重新输入')
                    return render(request, 'update_users.html', locals())
        else:
            form = UserForm()
            return render(request, 'update_users.html', locals())
    else:
        return render(request, 'nochange_users.html')


# 评论管理
@check_login
def mark_manage(request, page=1):
    if request.method == 'POST':
        search = request.POST.get('search')
        marks = Mark.objects.filter(content__contains=search)
    else:
        marks = Mark.objects.all()
    # 创建分页器对象
    paginator = BaiduPaginator(marks, 2)
    # 创建每一页的分页对象
    pager = paginator.page(page)
    # 每页的页码范围，使用自定义封装类
    pager.page_range = paginator.custom_range(paginator.num_pages, page, 3)
    return render(request, 'mark_manage.html', locals())

@check_login
def del_mark(request,mid):
    try:
        mark=Mark.objects.get(pk=mid)
        if mark:
            mark.delete()
    except:
        return redirect(reverse('App03:mark'))
    return redirect(reverse('App03:mark'))

@check_login
def add_mark(request):
    if request.method=='POST':
        form=MarkForm(request.POST)
        if form.is_valid():
            data=form.cleaned_data
            articles=Article.objects.all()
            for every in articles:
                if every.title==data.get('article_name'):
                    users=User.objects.all()
                    for i in users:
                        if i.username==data.get('marker_name'):
                            data.pop('article_name')
                            mark=Mark.objects.create(**data)
                            messages.success(request,'发表成功')
                            return redirect(reverse('App03:mark'))
                    else:
                        messages.error(request,'该用户不存在，请输入正确的用户名')
            else:
                messages.error(request,'该文章不存在，请输入正确的文章标题')
                return render(request,'add_marks.html',locals())
        else:
            return render(request,'add_marks.html',locals())
    form=MarkForm()
    return render(request,'add_marks.html',locals())

@check_login
def update_mark(request,mid):
    if request.method=='POST':
        form=MarkForm(request.POST)
        if form.is_valid():
            data=form.cleaned_data
            articles=Article.objects.all()
            for every in articles:
                if every.title==data.get('article_name'):
                    username=request.session.get('username')
                    if username==data.get('marker_name'):
                        data.pop('article_name')
                        mark=Mark.objects.get(pk=mid)
                        mark.content=data.get('content')
                        mark.marker_name=data.get('marker_name')
                        mark.save()
                        messages.success(request,'修改成功')
                        return redirect(reverse('App03:mark'))
                    else:
                        messages.error(request,'请正确输入您当前登录的用户名')
            else:
                messages.error(request,'该文章不存在，请输入正确的文章标题')
                return render(request,'update_marks.html',locals())
        else:
            return render(request,'update_marks.html',locals())
    form=MarkForm()
    return render(request,'update_marks.html',locals())