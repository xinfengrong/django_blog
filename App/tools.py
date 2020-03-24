# 自定义分页页码范围
import math

from django.core.paginator import Paginator


# 自定义分页类,可以根据自己喜好自己定义每页显示几个页码，怎么来减加页码
# 自己增加的方法，定义这一页显示多少页码，仿百度的
class BaiduPaginator(Paginator):
    def custom_range(self, num_pages, page, per_range):
        """
        :param page: 当前页号
        :param per_range: 每页显示多少个页码
        :return: range对象，页码范围
        """
        self.num_pages = num_pages
        # 页码数大于总页数
        if per_range > self.num_pages:
            return range(1, self.num_pages + 1)
        elif page <= per_range // 2:
            return range(1, per_range + 1)
        elif page + per_range // 2 > self.num_pages:
            return range(self.num_pages - per_range + 1, self.num_pages + 1)
        else:
            return range(page - per_range // 2, page + math.ceil(per_range / 2))


if __name__ == '__main__':
    # baidu=BaiduPaginator()
    # # baidu.num_pages=17  #例如总页数一共17页
    # print(list(baidu.custom_range(17,7,10)))  #现在是第7页，一页上最多显示10个页码
    # print(baidu.custom_range(7,10))

    baidu = BaiduPaginator(None, 10)
    print(list(baidu.custom_range(17, 6, 10)))  # [2, 3, 4, 5, 6, 7, 8, 9, 10, 11]
    print(baidu.custom_range(17, 7, 10))  # range(2, 12)
