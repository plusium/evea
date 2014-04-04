# -*- coding:utf-8 -*-

from django.contrib import admin
from evea.datas.models import Account, Character
from evea.datas.forms import CharacterForm


# 角色管理
class CharacterAdmin(admin.ModelAdmin):

    form = CharacterForm
    list_display = ('char_name', 'import_link', 'keyID', 'vCode', 'characterID')
    save_on_top = True
    
    add_form_template = 'character_change_form.html'
    change_form_template = 'character_change_form.html'
    
    def import_link(self, obj):
        return '<a href="/admin/datas/charskillimport/%s/">快速导入技能</a>' % obj.id
    import_link.allow_tags = True
    import_link.short_description = u'操作'
    
    # 禁用修改Log
    def log_change(self, request, object, message):
        pass
    
    # 只能看到自己账号下的角色
    def queryset(self, request):
        qs = super(CharacterAdmin, self).queryset(request)
        return qs.filter(account=request.user.get_profile())
    
    # 添加/修改角色信息时，账号下拉菜单只能选择自己的账号
    def formfield_for_foreignkey(self, db_field, request, **kwargs):
        if db_field.name == 'account':
            kwargs["queryset"] = Account.objects.filter(user=request.user)
        return super(CharacterAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)


# 帐号管理
class AccountAdmin(admin.ModelAdmin):
    pass


admin.site.register(Character, CharacterAdmin)
admin.site.register(Account, AccountAdmin)
