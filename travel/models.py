from django.db import models
from django.db.models import Avg
from django.core import validators


class Genre(models.Model):
    name = models.CharField(max_length=100)

    class Meta:
        db_table = 'genre'

    def __str__(self):
        return f"<Genre:{self.name}>"


class Travel(models.Model):
    #名
    # name = models.CharField(max_length=256)
    # imdb_id是景点图片id
    imdb_id = models.IntegerField()

    # country
    country = models.CharField(max_length=256, blank=True)
    # 类型
    genre = models.ManyToManyField(Genre)
    # 详情
    intro = models.CharField(max_length=256, blank=True)
    # 景点之间的相似度,A和B的相似度与B和A的相似度是一致的，所以symmetrical设置为True
    travel_similarity=models.ManyToManyField("self",through="Travel_similarity",symmetrical=False)

    class Meta:
        db_table = 'travel'

    def __str__(self):
        return f"<Travel:{self.country},{self.imdb_id}>"

    def get_score(self):
        # 定义一个获取平均分的方法，模板中直接调用即可
        # 格式 {'score__avg': 3.125}
        result_dct = self.travel_rating_set.aggregate(Avg('score'))
        try:
            # 只保留一位小数
            result = round(result_dct['score__avg'], 1)
        except TypeError:
            return 0
        else:
            return result

    def get_user_score(self, user):
        return self.travel_rating_set.filter(user=user).values('score')

    def get_score_int_range(self):
        return range(int(self.get_score()))

    def get_genre(self):
        genre_dct = self.genre.all().values('name')
        genre_lst = []
        for dct in genre_dct.values():
            genre_lst.append(dct['name'])
        return genre_lst

    def get_similarity(self,k=6):
        # 获取5个最相似的景点的id
        similarity_travels=self.travel_similarity.all()[:k]
        print(similarity_travels)
        return similarity_travels

class Travel_similarity(models.Model):
    travel_source=models.ForeignKey(Travel,related_name='travel_source',on_delete=models.CASCADE)
    travel_target=models.ForeignKey(Travel,related_name='travel_target',on_delete=models.CASCADE)
    similarity=models.FloatField()
    class Meta:
        # 按照相似度降序排序
        ordering=['-similarity']

class User(models.Model):
    name = models.CharField(max_length=128, unique=True)
    password = models.CharField(max_length=256)
    email = models.EmailField(unique=True)
    rating_travels = models.ManyToManyField(Travel, through="Travel_rating")

    def __str__(self):
        return "<USER:( name: {:},password: {:},email: {:} )>".format(self.name, self.password, self.email)

    class Meta:
        db_table = 'user'


class Travel_rating(models.Model):
    # 评分的用户
    user = models.ForeignKey(User, on_delete=models.CASCADE, unique=False)
    # 评分的景点
    travel = models.ForeignKey(Travel, on_delete=models.CASCADE, unique=False)
    # 分数
    score = models.FloatField()
    # 评论，可选
    comment = models.TextField(blank=True)

    class Meta:
        db_table = 'travel_rating'

class Travel_hot(models.Model):
    '''存放最热门的几个景点'''
    # 景点外键
    travel=models.ForeignKey(Travel,on_delete=models.CASCADE)
    # 评分人数
    rating_number=models.IntegerField()
    class Meta:
        db_table='travel_hot'
        ordering=['-rating_number']
