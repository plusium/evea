# -*- coding:utf-8 -*-

from django.contrib.auth.models import User, Group
from django.contrib.auth.forms import UserCreationForm
from evea.datas.models import Account
import random, string

# 用户注册 Form
class UserCreationForm2(UserCreationForm):
    
    class Meta:
        model = User
        fields = ("username", "email", )
    
    def save(self):
        new_user = super(UserCreationForm2, self).save()
        # 可以登录后台管理
        new_user.is_staff = True
        # 添加默认权限
        new_user.groups = [Group.objects.get(id=1)]
        new_user.save()
        
        # 生成 vCode
        vCode = random_str(64)
        # 保存账号
        new_account = Account(user=new_user, vCode=vCode)
        new_account.save()
        
        return new_user

def random_str(randomlength):
    str = ''
    chars = string.ascii_letters + string.digits
    for i in range(randomlength):
        str += random.choice(chars)
    return str

