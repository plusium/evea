# -*- coding:utf-8 -*-

from django import forms
from evea.datas.models import Character, Skill, Character_Skills
from evea import settings
import math


# 角色创建、修改 Form
class CharacterForm(forms.ModelForm):
    
    class Meta:
        model = Character
    
    def __init__(self, *args, **kwargs):
        
        super(CharacterForm, self).__init__(*args, **kwargs)
        
        # 用于模板显示的技能信息，数组的每一项包括如下元素：
        # field: 用于输入技能等级的字段
        # skill_id: 技能编号
        # group_name: 技能组名称
        # skill_name: 技能名称
        # skill_rank: 技能系数
        # skill_point: 角色的技能点数
        self.skill_fields = []
        
        # 获得所有技能列表。如果角色拥有某个技能，则同时获得该技能的角色技能信息
        if 'instance' in kwargs:
            instance = kwargs['instance']
            skills = get_skill_info(instance.id)
        else:
            skills = get_skill_info(0)
        
        # 技能信息统计
        skill_count = 0
        skill_point = 0
        
        # 填充上述技能信息
        for skill in skills:
            field = forms.IntegerField(required=False, initial=skill.skill_level, min_value=0, max_value=5)
            field.widget.attrs['size'] = '10'
            field.widget.attrs['maxlength'] = '1'
            fieldname = 'skillfield_%s' % skill.id
            self.fields[fieldname] = field
            skill_field = {
                'field': self[fieldname],
                'skill_id': skill.id,
                'group_name': skill.group_name,
                'skill_name': skill.skill_name,
                'skill_rank': skill.skill_rank,
                'skill_point': skill.skill_point,
            }
            self.skill_fields.append(skill_field)
            if skill.skill_level != None:
                skill_count += 1
                skill_point += skill.skill_point
        
        # 用于模板显示的其他技能信息
        self.skill_info = {
            'skill_count': skill_count,
            'skill_point': skill_point,
        }
    
    def save(self, commit):
        
        # 先保存角色信息
        char = super(CharacterForm, self).save(commit=False)
        char.save()
        
        # 预先获取已有的角色技能信息
        charskills = Character_Skills.objects.filter(char=char)
        # 预先获取所有技能信息
        skills = Skill.objects.all()
        
        # 需要稍后批量增加的角色技能
        charskills_to_create = []
        # 需要稍后批量删除的角色技能
        charskills_to_delete = []
        
        # 循环处理从 Form 提交过来的每个技能信息
        for field in self.cleaned_data:
            # 仅处理以 skillfield_ 开头的字段（即技能等级字段）
            if field.startswith('skillfield_'):
                skill_id = int(field.replace('skillfield_', ''))
                skill_level = self.cleaned_data[field]
                if skill_level == None:
                    # 该技能的等级为空。如果角色本来有该技能，则删除该角色技能
                    charskills_to_delete.append(skill_id)
                else:
                    # 该技能的等级不为空。根据情况做【增加、修改、不变】中的一项操作
                    
                    # 在已有角色技能信息中查找该技能，找到了则取出来进行修改，否则增加新角色技能
                    #   同时在准备增加的角色技能信息中查找，以防万一增加两个一样的技能。如果找到，则不做任何操作（走【不变】的路径）
                    obj = get_charskill(skill_id, charskills, charskills_to_create)
                    if obj == None:
                        # 增加
                        skill = get_skill(skill_id, skills)
                        obj = Character_Skills(char=char, skill=skill, 
                            skill_level = skill_level, 
                            skill_point = get_skill_point(skill_level, skill.skill_rank))
                        charskills_to_create.append(obj)
                    else:
                        if obj.skill_level != skill_level:
                            # 修改
                            skill = get_skill(skill_id, skills)
                            obj.skill_level = skill_level
                            obj.skill_point = get_skill_point(skill_level, skill.skill_rank)
                            obj.save()
                        else:
                            # 不变
                            pass
        
        # 批量删除等级为空的角色技能
        if len(charskills_to_delete) > 0:
            charskills.filter(skill_id__in=charskills_to_delete).delete()
        
        # 批量增加新角色技能
        if len(charskills_to_create) > 0:
            Character_Skills.objects.bulk_create(charskills_to_create)
        
        return char

def get_skill(id, skills):
    for skill in skills:
        if skill.id == id:
            return skill
    return None

def get_charskill(skill_id, charskills, charskills_to_create):
    for charskill in charskills:
        if charskill.skill_id == skill_id:
            return charskill
    for charskill in charskills_to_create:
        if charskill.skill_id == skill_id:
            return charskill
    return None

# 通过技能等级和系数计算相应的技能点数
def get_skill_point(skill_level, skill_rank):
     if skill_level in (1, 2, 3, 4, 5):
         return math.ceil(math.pow(2, 2.5 * (skill_level - 1)) * 250 * skill_rank)
     else:
         return 0


# 获得所有技能列表。接受一个角色编号的参数，如果该角色拥有某个技能，则同时获得该技能的角色技能信息
def get_skill_info(object_id):

    sql = '''
        SELECT s.id, s.skill_name, s.skill_rank, g.group_name, c.skill_level, c.skill_point
          FROM datas_skill s
         INNER JOIN datas_skillgroup g ON s.skill_group_id = g.id
          LEFT JOIN datas_character_skills c ON (s.id = c.skill_id AND c.char_id = %s) '''
    
    # 如果是 mysql，使用 gbk 编码进行排序
    if settings.DB_ENGINE == 'django.db.backends.mysql':
        sql += ' ORDER BY CONVERT(g.group_name USING gbk), CONVERT(s.skill_name USING gbk)'
    else:
        sql += ' ORDER BY g.group_name, s.skill_name'
    
    return Skill.objects.raw(sql, [object_id])

