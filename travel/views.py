import csv
import time
import os.path
from math import sqrt
from django.contrib import messages
from django.db.models import Avg, Count, Max
from django.http import HttpResponse, request
from django.shortcuts import render, redirect, reverse
from .forms import RegisterForm, LoginForm, CommentForm, UserUpdateForm
from django.views.generic import View, ListView, DetailView
from .models import User, Travel, Genre, Travel_rating, Travel_similarity, Travel_hot

# DO NOT MAKE ANY CHANGES
BASE = os.path.dirname(os.path.abspath(__file__))

class IndexView(ListView):
    model = Travel
    template_name = 'travel/index.html'
    paginate_by = 15
    context_object_name = 'travels'
    ordering = 'imdb_id'
    page_kwarg = 'p'

    def get_queryset(self):
        # 返回前100个景点
        return Travel.objects.filter()[:100]

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(IndexView, self).get_context_data(*kwargs)
        paginator = context.get('paginator')
        page_obj = context.get('page_obj')
        pagination_data = self.get_pagination_data(paginator, page_obj)
        context.update(pagination_data)
        # print(context)
        return context

    def get_pagination_data(self, paginator, page_obj, around_count=2):
        current_page = page_obj.number

        if current_page <= around_count + 2:
            left_pages = range(1, current_page)
            left_has_more = False
        else:
            left_pages = range(current_page - around_count, current_page)
            left_has_more = True

        if current_page >= paginator.num_pages - around_count - 1:
            right_pages = range(current_page + 1, paginator.num_pages + 1)
            right_has_more = False
        else:
            right_pages = range(current_page + 1, current_page + 1 + around_count)
            right_has_more = True
        return {
            'left_pages': left_pages,
            'right_pages': right_pages,
            'current_page': current_page,
            'left_has_more': left_has_more,
            'right_has_more': right_has_more
        }


class PopularTravelView(ListView):
    model = Travel_hot
    template_name = 'travel/hot.html'
    paginate_by = 15
    context_object_name = 'travels'
    page_kwarg = 'p'

    def get_queryset(self):
        hot_travels=Travel_hot.objects.all().values("travel_id")
        travels=Travel.objects.filter(id__in=hot_travels).annotate(nums=Max('travel_hot__rating_number')).order_by('-nums')
        return travels

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(PopularTravelView, self).get_context_data(*kwargs)
        paginator = context.get('paginator')
        page_obj = context.get('page_obj')
        pagination_data = self.get_pagination_data(paginator, page_obj)
        context.update(pagination_data)
        # print(context)
        return context

    def get_pagination_data(self, paginator, page_obj, around_count=2):
        current_page = page_obj.number

        if current_page <= around_count + 2:
            left_pages = range(1, current_page)
            left_has_more = False
        else:
            left_pages = range(current_page - around_count, current_page)
            left_has_more = True

        if current_page >= paginator.num_pages - around_count - 1:
            right_pages = range(current_page + 1, paginator.num_pages + 1)
            right_has_more = False
        else:
            right_pages = range(current_page + 1, current_page + 1 + around_count)
            right_has_more = True
        return {
            'left_pages': left_pages,
            'right_pages': right_pages,
            'current_page': current_page,
            'left_has_more': left_has_more,
            'right_has_more': right_has_more
        }


class TagView(ListView):
    travel = Travel
    template_name = 'travel/tag.html'
    paginate_by = 15
    context_object_name = 'travels'
    # ordering = 'travel_rating__score'
    page_kwarg = 'p'

    def get_queryset(self):
        if 'genre' not in self.request.GET.dict().keys():
            travels = Travel.objects.all()
            return travels[100:200]
        else:
            travels = Travel.objects.filter(genre__name=self.request.GET.dict()['genre'])
            print(travels)
            return travels[:100]

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(TagView, self).get_context_data(*kwargs)
        if 'genre' in self.request.GET.dict().keys():
            genre = self.request.GET.dict()['genre']
            context.update({'genre': genre})
        paginator = context.get('paginator')
        page_obj = context.get('page_obj')
        pagination_data = self.get_pagination_data(paginator, page_obj)
        context.update(pagination_data)
        return context

    def get_pagination_data(self, paginator, page_obj, around_count=2):
        current_page = page_obj.number

        if current_page <= around_count + 2:
            left_pages = range(1, current_page)
            left_has_more = False
        else:
            left_pages = range(current_page - around_count, current_page)
            left_has_more = True

        if current_page >= paginator.num_pages - around_count - 1:
            right_pages = range(current_page + 1, paginator.num_pages + 1)
            right_has_more = False
        else:
            right_pages = range(current_page + 1, current_page + 1 + around_count)
            right_has_more = True
        return {
            'left_pages': left_pages,
            'right_pages': right_pages,
            'current_page': current_page,
            'left_has_more': left_has_more,
            'right_has_more': right_has_more
        }


class SearchView(ListView):
    travel = Travel
    template_name = 'travel/search.html'
    paginate_by = 15
    context_object_name = 'travels'
    # ordering = 'travel_rating__score'
    page_kwarg = 'p'

    def get_queryset(self):
        travels = Travel.objects.filter(country__icontains=self.request.GET.dict()['country'])
        print(travels)
        return travels

    def get_context_data(self, *, object_list=None, **kwargs):
        # self.genre=self.request.GET.dict()['genre']
        context = super(SearchView, self).get_context_data(*kwargs)
        paginator = context.get('paginator')
        page_obj = context.get('page_obj')
        pagination_data = self.get_pagination_data(paginator, page_obj)
        context.update(pagination_data)
        context.update({'country': self.request.GET.dict()['country']})
        return context

    def get_pagination_data(self, paginator, page_obj, around_count=2):
        current_page = page_obj.number

        if current_page <= around_count + 2:
            left_pages = range(1, current_page)
            left_has_more = False
        else:
            left_pages = range(current_page - around_count, current_page)
            left_has_more = True

        if current_page >= paginator.num_pages - around_count - 1:
            right_pages = range(current_page + 1, paginator.num_pages + 1)
            right_has_more = False
        else:
            right_pages = range(current_page + 1, current_page + 1 + around_count)
            right_has_more = True
        return {
            'left_pages': left_pages,
            'right_pages': right_pages,
            'current_page': current_page,
            'left_has_more': left_has_more,
            'right_has_more': right_has_more
        }


# 注册视图
class RegisterView(View):
    def get(self, request):
        return render(request, 'travel/register.html')

    def post(self, request):
        form = RegisterForm(request.POST)
        if form.is_valid():
            # 没毛病，保存
            form.save()
            return redirect(reverse('travel:index'))
        else:
            # 表单验证失败，重定向到注册页面
            errors = form.get_errors()
            for error in errors:
                messages.info(request, error)
            print(form.errors.get_json_data())
            return redirect(reverse('travel:register'))


# 登录视图
class LoginView(View):
    def get(self, request):
        return render(request, 'travel/login.html')

    def post(self, request):
        print(request.POST)
        form = LoginForm(request.POST)
        if form.is_valid():
            name = form.cleaned_data.get('name')
            pwd = form.cleaned_data.get('password')
            user = User.objects.filter(name=name, password=pwd).first()
            # username = form.cleaned_data.get('name')
            # print(username)
            # pwd = form.cleaned_data.get('password')
            if user:
                # 登录成功，在session 里面加上当前用户的id，作为标识
                request.session['user_id'] = user.id
                return redirect(reverse('travel:index'))
                if remember:
                    # 设置为None，则表示使用全局的过期时间
                    request.session.set_expiry(None)
                else:
                    request.session.set_expiry(0)
            else:
                print('用户名或者密码错误')
                # messages.add_message(request,messages.INFO,'用户名或者密码错误!')
                messages.info(request, '用户名或者密码错误!')
                return redirect(reverse('travel:login'))
        else:
            print("error!!!!!!!!!!!")
            errors = form.get_errors()
            for error in errors:
                messages.info(request, error)
            print(form.errors.get_json_data())
            return redirect(reverse('travel:login'))


def UserLogout(request):
    # 登出，立即停止会话
    request.session.set_expiry(-1)
    return redirect(reverse('travel:index'))


class TravelDetailView(DetailView):
    '''景点详情页面'''
    model = Travel
    template_name = 'travel/detail.html'
    # 上下文对象的名称
    context_object_name = 'travel'

    def get_context_data(self, **kwargs):
        # 重写获取上下文方法，增加评分参数
        context = super().get_context_data(**kwargs)
        # 判断是否登录用
        login = True
        try:
            user_id = self.request.session['user_id']
        except KeyError as e:
            login = False  # 未登录

        # 获得景点的pk
        pk = self.kwargs['pk']
        travel = Travel.objects.get(pk=pk)

        if login:
            # 已经登录，获取当前用户的历史评分数据
            user = User.objects.get(pk=user_id)

            rating = Travel_rating.objects.filter(user=user, travel=travel).first()
            # 默认值
            score = 0
            comment = ''
            if rating:
                score = rating.score
                comment = rating.comment
            context.update({'score': score, 'comment': comment})

        similarity_travels = travel.get_similarity()
        # 获取与当前景点最相似的景点
        context.update({'similarity_travels': similarity_travels})
        # 判断是否登录，没有登录则不显示评分页面
        context.update({'login': login})

        return context

    # 接受评分表单,pk是当前景点的数据库主键id
    def post(self, request, pk):
        url = request.get_full_path()
        form = CommentForm(request.POST)
        if form.is_valid():
            # 获取分数和评论
            score = form.cleaned_data.get('score')
            comment = form.cleaned_data.get('comment')
            print(score, comment)
            # 获取用户和景点
            user_id = request.session['user_id']
            user = User.objects.get(pk=user_id)
            travel = Travel.objects.get(pk=pk)

            # 更新一条记录
            rating = Travel_rating.objects.filter(user=user, travel=travel).first()
            if rating:
                # 如果存在则更新
                # print(rating)
                rating.score = score
                rating.comment = comment
                rating.save()
                # messages.info(request,"更新评分成功！")
            else:
                print('记录不存在')
                # 如果不存在则添加
                rating = Travel_rating(user=user, travel=travel, score=score, comment=comment)
                rating.save()
            messages.info(request, "评论成功!")

        else:
            # 表单没有验证通过
            messages.info(request, "评分不能为空!")
        return redirect(reverse('travel:detail', args=(pk,)))


class RatingHistoryView(DetailView):
    '''用户详情页面'''
    model = User
    template_name = 'travel/history.html'
    # 上下文对象的名称
    context_object_name = 'user'

    def get_context_data(self, **kwargs):
        # 这里要增加的对象：当前用户过的景点历史
        context = super().get_context_data(**kwargs)
        user_id = self.request.session['user_id']
        user = User.objects.get(pk=user_id)
        # 获取ratings即可
        ratings = Travel_rating.objects.filter(user=user)

        context.update({'ratings': ratings})
        return context


def delete_recode(request, pk):
    print(pk)
    travel = Travel.objects.get(pk=pk)
    user_id = request.session['user_id']
    print(user_id)
    user = User.objects.get(pk=user_id)
    rating = Travel_rating.objects.get(user=user, travel=travel)
    print(travel, user, rating)
    rating.delete()
    messages.info(request, f"删除 {travel.country} 评分记录成功！")
    # 跳转回评分历史
    return redirect(reverse('travel:history', args=(user_id,)))


class RecommendTravelView(ListView):
    travel = Travel
    template_name = 'travel/recommend.html'
    paginate_by = 15
    context_object_name = 'travels'
    ordering = 'travel_rating__score'
    page_kwarg = 'p'

    def __init__(self):
        super().__init__()
        # 最相似的20个用户
        self.K = 20
        # 推荐出10本书
        self.N = 10
        # 存放当前用户评分过的景点querySet
        self.cur_user_travel_qs = None

    def get_user_sim(self):
        # 用户相似度字典，格式为{ user_id1:val , user_id2:val , ... }
        user_sim_dct = dict()
        '''获取用户之间的相似度,存放在user_sim_dct中'''
        # 获取当前用户
        cur_user_id = self.request.session['user_id']
        cur_user = User.objects.get(pk=cur_user_id)
        # 获取其它用户
        other_users = User.objects.exclude(pk=cur_user_id)

        self.cur_user_travel_qs = Travel.objects.filter(user=cur_user)

        # 计算当前用户与其他用户评分过的景点交集数
        for user in other_users:
            # 记录感兴趣的数量
            user_sim_dct[user.id] = len(Travel.objects.filter(user=user) & self.cur_user_travel_qs)

        # 按照key排序value，返回K个最相近的用户
        print("user similarity calculated!")
        # 格式是 [ (user, value), (user, value), ... ]
        return sorted(user_sim_dct.items(), key=lambda x: -x[1])[:self.K]

    def get_recommend_travel(self, user_lst):
        # 景点兴趣值字典，{ travel:value, travel:value , ...}
        travel_val_dct = dict()
        # 用户，相似度
        for user, _ in user_lst:
            # 获取相似用户评分过的景点，并且不在前用户的评分列表中的，再加上score字段，方便计算兴趣值
            travel_set = Travel.objects.filter(user=user).exclude(id__in=self.cur_user_travel_qs).annotate(
                score=Max('travel_rating__score'))
            for travel in travel_set:
                travel_val_dct.setdefault(travel, 0)
                # 累计用户的评分
                travel_val_dct[travel] += travel.score
        print('recommend travel list calculated!')
        return sorted(travel_val_dct.items(), key=lambda x: -x[1])[:self.N]

    def get_queryset(self):
        s = time.time()
        # 获得最相似的K个用户列表
        user_lst = self.get_user_sim()
        # 获得推荐景点的id
        travel_lst = self.get_recommend_travel(user_lst)
        print(travel_lst)
        result_lst = []
        for travel, _ in travel_lst:
            result_lst.append(travel)
        e = time.time()
        print(f"用时:{e - s}")
        return result_lst

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(RecommendTravelView, self).get_context_data(*kwargs)
        paginator = context.get('paginator')
        page_obj = context.get('page_obj')
        pagination_data = self.get_pagination_data(paginator, page_obj)
        context.update(pagination_data)
        return context

    def get_pagination_data(self, paginator, page_obj, around_count=2):
        current_page = page_obj.number

        if current_page <= around_count + 2:
            left_pages = range(1, current_page)
            left_has_more = False
        else:
            left_pages = range(current_page - around_count, current_page)
            left_has_more = True

        if current_page >= paginator.num_pages - around_count - 1:
            right_pages = range(current_page + 1, paginator.num_pages + 1)
            right_has_more = False
        else:
            right_pages = range(current_page + 1, current_page + 1 + around_count)
            right_has_more = True
        return {
            'left_pages': left_pages,
            'right_pages': right_pages,
            'current_page': current_page,
            'left_has_more': left_has_more,
            'right_has_more': right_has_more
        }


class UserDetailView(DetailView):
    '''人员详情页面'''
    model = User
    template_name = 'travel/user_update.html'
    # 上下文对象的名称
    context_object_name = 'user'

    def get_context_data(self, **kwargs):
        # 重写获取上下文方
        context = super().get_context_data(**kwargs)

        # 获得用户的pk
        user_id = self.kwargs['pk']
        user = User.objects.get(pk=user_id)
        context.update({'user': user})

        return context

    # 接受评分表单,pk是当前用户的数据库主键id
    def post(self, request, pk):
        url = request.get_full_path()
        form = UserUpdateForm(request.POST)
        form.is_valid()
        user = User.objects.filter(id=form.data.get('id')).first()
        old_password = form.data.get('old_password')
        if old_password and len(old_password) > 0:
            if user.password != old_password:
                messages.info(request, "输入原始密码不正确！!")
                return redirect(reverse('travel:user'))
            password_repeat = form.data.get('password_repeat')
            if form.data.get('password') != password_repeat:
                messages.info(request, '两次密码输入不一致！')
                return redirect(reverse('travel:user'))
        user = User.objects.filter(id=form.cleaned_data.get('id')).first()
        name = form.data.get('name')
        email = form.data.get('email')
        user.name = name
        user.email = email
        print(name, email)
        old_password = form.data.get('old_password')
        if old_password and len(old_password) > 0:
            # update password
            password = form.data.get('password') 
            user.password = password
        user.save()
        messages.info(request, "更新成功!")
        return redirect(reverse('travel:user'))


def delete_user(request, pk):
    print(pk)
    user = User.objects.get(pk=pk)
    user.delete()
    messages.info(request, f"删除记录成功！")
    # 跳转回评分历史
    return redirect(reverse('travel:user'))


# 注册视图
class UserUpdateView(View):
    def get(self, request):
        return render(request, 'travel/user_update.html')

    def post(self, request):
        form = RegisterForm(request.POST)
        if form.is_valid():
            # 没毛病，保存
            form.save()
            return redirect(reverse('travel:index'))
        else:
            # 表单验证失败，重定向到注册页面
            errors = form.get_errors()
            for error in errors:
                messages.info(request, error)
            print(form.errors.get_json_data())
            return redirect(reverse('travel:register'))


class UserView(ListView):
    model = User
    template_name = 'travel/user.html'
    paginate_by = 15
    context_object_name = 'users'
    ordering = 'id'
    page_kwarg = 'p'

    def get_queryset(self):
        # 返回user
        return User.objects.filter()

    def get_context_data(self, *, object_list=None, **kwargs):
        context = super(UserView, self).get_context_data(*kwargs)
        paginator = context.get('paginator')
        page_obj = context.get('page_obj')
        pagination_data = self.get_pagination_data(paginator, page_obj)
        context.update(pagination_data)
        # print(context)
        return context

    def get_pagination_data(self, paginator, page_obj, around_count=2):
        current_page = page_obj.number

        if current_page <= around_count + 2:
            left_pages = range(1, current_page)
            left_has_more = False
        else:
            left_pages = range(current_page - around_count, current_page)
            left_has_more = True

        if current_page >= paginator.num_pages - around_count - 1:
            right_pages = range(current_page + 1, paginator.num_pages + 1)
            right_has_more = False
        else:
            right_pages = range(current_page + 1, current_page + 1 + around_count)
            right_has_more = True
        return {
            'left_pages': left_pages,
            'right_pages': right_pages,
            'current_page': current_page,
            'left_has_more': left_has_more,
            'right_has_more': right_has_more
        }
