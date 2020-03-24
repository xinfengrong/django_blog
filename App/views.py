import hashlib

from django.contrib import messages

from django.core.paginator import Paginator
from django.http import HttpResponse
from django.shortcuts import render, redirect

# Create your views here.
from django.urls import reverse

from App.forms import LoginForm, ChangePassword
from App.models import Category, Article, User

# #路由保护函数
from App.tools import BaiduPaginator


def check_login(func):
    def inner(*args, **kwargs):
        if args[0].session.get('username'):
            return func(*args, **kwargs)
        else:
            return redirect('/blog/login/')
            # return HttpResponse('error')

    return inner


@check_login
def index(request):
    # print(1/0)
    return render(request, 'index.html')
    # if request.session.get('username'):
    #
    #     return render(request,'index.html')
    # else:
    #     return redirect('/blog/login/')


# 左边导航栏

@check_login
def left_public(request):
    return render(request, 'public_left.html')


@check_login
def header_public(request):
    username = request.session.get('username')
    # print(username)

    return render(request, 'public_header.html', locals())


# 模板渲染时，传的局部变量都会把谁传进去
# 文章管理

@check_login
def public_main(request, cid=-1, page=1):  # 因为数据库可能会删记录，cid有可能没有为1的,所以就默认没有cid，让cid=-1
    # 获取所有类型
    categories = Category.objects.all()
    # 记住当前是第几个类别，好加额外的类名，变颜色，记忆功能
    # 获取所有的分类id
    position = [cat.cid for cat in categories]
    # 列表的index是查询，当前是第几项，渲染到局部变量到模板中
    # 百度分页的类？？？？？？？？？？？？？？？？？？？？定义这一页显示多少个页码
    # 1.检索分类
    if request.method == 'POST':  # 因为这里是post提交，不是get提交了，就不能从网址中直接获取cid了，就得用个隐藏标签得到一个cid的值，如果是get不用，直接就可以拿得到,注意两者都是取的局部变量cid，在模板中要用{{cid}}
        cid = int(request.POST.get('cid', -1))  # 如果没有获取到cid，就默认为-1，注意默认得到的是字符串，如果要和整型比较，要转一下才行
        search = request.POST.get('search', '')
        # 文章检索，按照cid和标题搜索
        articles = Article.objects.filter(cid=cid, title__contains=search)
    else:  # 要注意整体的逻辑判断 这里是get提交
        if cid < 0:
            first_category = categories.first()  # 查询第一个分类，博客初始化，最少必须有一条记录的
            cid = first_category.cid  # first返回来的是对象  找第一个分类的cid
        # 按照cid查询，刚开始默认的第一页
        articles = Article.objects.filter(cid=cid)
    pos = position.index(cid)  # 查询当前的cid在列表中是第几项，同样会把这个局部变量也渲染到模板中

    # 分页是传哪个结果集就对哪个数据进行分页  只要局部变量名一样就行了
    # 生成分页器
    paginator = BaiduPaginator(articles, 2)  # 返回的是分页的数据，模板中改成分页的数据
    # 分页对象
    pager = paginator.page(page)
    # 老师改写的那里总页数给了pagination.num_pages
    pager.page_range = paginator.custom_range(paginator.num_pages, page, 5)
    # return render(request, 'wenzhang_xinwen.html', {'categories': categories})
    return render(request, 'wenzhang_xinwen.html', locals())


'''
 调用自己定义的增加方法的分页类
    # 分页
    paginator = BaiduPaginator(articles,10) 实例化分页对象
    pager = paginator.page(page)  调用page得到当前的分页对象
    pager.page_range = paginator.custom_range(page,5) 调用custom_range返回一个可迭代对象range，赋值为page的page_range
    不直接改父类paginator中的page_range ，因为是个方法，一赋值就报错，还不能重写
   路由需要两个参数的，一个cid一个页数，需要改变路由 三个路由 带板块cid和当前页码  
   也可一个路由对应一个函数，都可以  一个函数的 名字可以给不一样的
   看看模板源代码中应该怎么写分页
   page_range当前页码范围，遍历时是页码 
   多个类名 中间用空格隔开 cid是局部变量渲染过来的
   想不清楚就看下源代码，看下是什么效果
   如果一个函数中处理三个路由，逻辑过于复杂，所以可以重写另一个函数，虽然代码重复率可能会高点
   缺的是思路，数据一多就不知道哪是哪
   post提交只是用于获取提交数据和cid的

   自己封存的扩展的，要多接触多写一点，面试时才有话说，自定义封装了分页，对django进行了改进，实现了功能
   面向对象？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？
   自定义的？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？
   #百度分页？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？？
   '''


# 老师的方法：1、用ajax提交，用js实现得到数据，2、在form表单中，可以跳转当前页面，
# 但是要在前面加上一个隐藏标签<input type='hidden' name='cid' value="{{cid}}">
# 页面结果div+iframe（相当于内嵌了一个窗口）构成的网站框架
# 先看源代码，iframe有名字，跳转好调，用django框架的话，要把页面写成接口即view
# 这样才能显示
# 选项卡，每个选项卡代表一个类，循环生成，样式已给，动态生成内容就行
# 一个页面一个去调整，去掉没用的，动态生成内容选项卡、文章列表，添加文章也是一个接口
# 模糊查询关键字


def login(request):
    if request.method == 'POST':
        form = LoginForm(request.POST)
        try:
            if request.POST.get('login') == '登录':

                if form.is_valid():
                    username = request.POST.get('username')
                    # print(username)
                    password = request.POST.get('password')
                    user = User.objects.get(username=username, password=password)
                    print(user)
                    # username1 = request.POST.get('username')
                    # password1 = hashlib.sha1(request.POST.get('password').encode('utf-8')).hexdigest()
                    # user1 = User.objects.get(username=username1, password=password1)
                    # print(user1)
                    # print(11111)
                    # user.password=hashlib.sha1(user.password.decode('utf-8')).hexdigest()
                    # if user or (User.objects.get(username=username,password=(hashlib.sha1(request.POST.get('password').encode('utf-8')).hexdigest()))) :
                    if user:
                        response=redirect('/blog/')
                        #设置session
                        request.session['username']=username
                        request.session['password']=password
                        return response

                    # elif user1:
                    #     response = redirect('/blog/')
                    #     # 设置session
                    #     request.session['username'] = username
                    #     request.session['password'] = password
                    #     return response

                else:
                    messages.error(request, '抱歉，验证码错误，请再试一次')
                    return render(request,'loginb.html',context={'form':form})
                # elif (not user) or (not form.is_valid()):
        except:
            messages.error(request, '抱歉，用户名或密码错误，请再试一次')
            return redirect('/blog/login/', locals())
    form = LoginForm()
    return render(request, 'loginb.html', locals())


def logout(request):
    request.session.flush()
    return render(request, 'logout.html')


# def handle_captcha(request):
#     if request.method=='POST':
#         form=LoginForm(request.POST)
#         if form.is_valid():
#             return HttpResponse('验证通过')
#         else:
#             return render(request,'loginb.html',locals())
#     else:
#         # form=LoginForm()
#         return render(request,'loginb.html')

# 修改发布类似
# 删除把当前的id号传回去，返回时把id号带着  给个路由 视图函数



@check_login
def reset_password(request):
    if request.method == 'POST':
        # 用提交的数据生成表单
        form = ChangePassword(request.POST)
        # print(1111111)
        if form.is_valid():
            data = form.cleaned_data
            user = User.objects.filter(password=data.get('old_password'),username=request.session.get('username')).first()
            if user:
                user.password = data.get('new_password')
                # user.password=hashlib.sha1(user.password.encode('utf-8')).hexdigest()
                user.save()
                request.session.flush()
                # return redirect('/blog/login/')
                jump_to_console = '''<html><body onLoad="window.top.location.href='/blog/login/'" ></body></html>'''
                response = HttpResponse(jump_to_console)
                return response
            else:
                messages.error(request, '抱歉，该用户不存在')
                return redirect('/blog/reset/', locals())
        else:
            return render(request, 'change_psw.html', {'form': form})
    return render(request, 'change_psw.html')


def handle_errors(request):
    return render(request,'handle_errors.html')