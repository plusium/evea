# -*- coding:utf-8 -*-

from django.contrib.auth.decorators import login_required
from django.shortcuts import render_to_response
from django.http import HttpResponse
from django.core.context_processors import csrf
from evea import settings
from evea.forms import UserCreationForm2
from evea.datas.models import Character, Skill, Character_Skills
import json


# 首页
def hello(request):

    d = {'opened': settings.API_SERVER_ON}
    return render_to_response('index.html', d)


# 账号注册
def register(request):

    if request.user.is_authenticated():
        # 已经登录，不能注册
        return render_to_response('register.html', {'has_account': True})
    
    if request.method == 'POST':
        form = UserCreationForm2(request.POST)
        if form.is_valid():
            new_user = form.save()
            d = {
                'opened': settings.API_SERVER_ON, 
                'register_ok': True,
            }
            return render_to_response('index.html', d)
    else:
        form = UserCreationForm2()
    
    d = {
        'form': form,
    }
    d.update(csrf(request))
    return render_to_response('register.html', d)


# 角色信息上传页
@login_required(login_url='/admin/')
def charskillimport(request, charid):

    d = {
        'characterID': charid,
    }
    d.update(csrf(request))
    return render_to_response('LogSkillParser.html', d)


# 角色信息上传
def updateCharInfo(request):
    
    if      'characterID' in request.POST and request.POST['characterID'] \
        and 'jsondict' in request.POST and request.POST['jsondict']:
        pass
    else:
        d = {'success': False, 'msg': u'缺少参数'}
        return render_to_response('LogSkillParserResult.html', d)
    
    characterID = int(request.POST['characterID'])
    jsondict = json.loads(request.POST['jsondict'])
    updated = False
    
    try:
        char = Character.objects.get(account = request.user.get_profile(), id = characterID)
    except:
        d = {'success': False, 'msg': u'指定的角色不存在:%s' % characterID}
        return render_to_response('LogSkillParserResult.html', d)
    
    try:
        # 技能信息
        if 'skillinfo' in jsondict and jsondict['skillinfo']:
            skillinfo = jsondict['skillinfo']
            
            # 以下处理类似于 evea.datas.forms.CharacterForm.save()
            
            charskills = Character_Skills.objects.filter(char=char)
            skills = Skill.objects.all()
            
            charskills_to_create = []
            skills_unknown = []
            
            for oneskill in skillinfo:
                skill_id = int(oneskill["id"])
                skill_level = int(oneskill["lv"])
                skill_point = int(oneskill["pt"])
                if skill_level < 0 or skill_level > 5:
                    d = {'success': False, 'msg': u'技能等级超出范围:%s' % oneskill}
                    return render_to_response('LogSkillParserResult.html', d)
                if skill_point < 0:
                    d = {'success': False, 'msg': u'技能点超出范围:%s' % oneskill}
                    return render_to_response('LogSkillParserResult.html', d)
                
                obj = get_charskill(skill_id, charskills, charskills_to_create)
                if obj == None:
                    # 增加
                    
                    # 先获得技能实例
                    skill = get_skill(skill_id, skills)
                    if skill == None:
                        skills_unknown.append(skill_id)
                    else:
                        obj = Character_Skills(char=char, skill=skill, 
                            skill_level = skill_level, 
                            skill_point = skill_point)
                        charskills_to_create.append(obj)
                else:
                    if obj.skill_level != skill_level or obj.skill_point != skill_point:
                        # 修改
                        obj.skill_level = skill_level
                        obj.skill_point = skill_point
                        obj.save()
                        updated = True
                    else:
                        # 不变
                        pass
            
            if len(charskills_to_create) > 0:
                Character_Skills.objects.bulk_create(charskills_to_create)
                updated = True
            
            if len(skills_unknown) > 0:
                d = {'success': False, 'msg': u'技能导入成功，但是以下技能ID无法识别，已被忽略:%s等' % skills_unknown[0]}
                return render_to_response('LogSkillParserResult.html', d)
        
        # todo:其他信息
        
    except Exception, info:
        d = {'success': False, 'msg': info}
        return render_to_response('LogSkillParserResult.html', d)
    
    if updated:
        d = {'success': True, 'char_name': char.char_name}
        return render_to_response('LogSkillParserResult.html', d)
    else:
        d = {'success': False, 'msg': u'技能数据没有发生任何变化'}
        return render_to_response('LogSkillParserResult.html', d)

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

