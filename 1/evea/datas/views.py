# -*- coding:utf-8 -*-

from django.views.decorators.csrf import csrf_exempt
from django.shortcuts import render_to_response
from evea import settings
from evea.datas.models import Character
import datetime


def custom_proc(cache_time):
    now = datetime.datetime.now()
    cache_time = now + datetime.timedelta(0, cache_time)
    return {
        'current_time': now.strftime('%Y-%m-%d %H:%M:%S'),
        'cached_until_time': cache_time.strftime('%Y-%m-%d %H:%M:%S'),
    }


@csrf_exempt
def XXStatus(request, template_name, cache_time):
    
    d = {
        'is_server_open': settings.API_SERVER_ON,
    }
    d.update(custom_proc(cache_time))

    return render_to_response(template_name, d, mimetype='application/xml')


@csrf_exempt
def CharacterList(request, template_name, cache_time):
    
    if      'keyID' in request.REQUEST and request.REQUEST['keyID'] \
        and 'vCode' in request.REQUEST and request.REQUEST['vCode']:
        pass
    else:
        return Error(u'错误，缺少参数')

    keyID = int(request.REQUEST['keyID'])
    vCode = request.REQUEST['vCode']
    
    chars = Character.objects.filter(account__id = keyID, account__vCode = vCode)

    d = {
        'chars': chars,
    }
    d.update(custom_proc(cache_time))

    return render_to_response(template_name, d, mimetype='application/xml')


@csrf_exempt
def CharacterSheet(request, template_name, cache_time):
    
    if      'keyID' in request.REQUEST and request.REQUEST['keyID'] \
        and 'vCode' in request.REQUEST and request.REQUEST['vCode'] \
        and 'characterID' in request.REQUEST and request.REQUEST['characterID']:
        pass
    else:
        return Error(u'错误，缺少参数')

    keyID = int(request.REQUEST['keyID'])
    vCode = request.REQUEST['vCode']
    characterID = int(request.REQUEST['characterID'])

    char = Character.objects.get(account__id = keyID, account__vCode = vCode, id = characterID)
    skills = char.skills.all()

    d = {
        'char': char,
        'skills': skills,
    }
    d.update(custom_proc(cache_time))

    return render_to_response(template_name, d, mimetype='application/xml')


@csrf_exempt
def CharacterInfo(request, template_name, cache_time):
    
    if      'keyID' in request.REQUEST and request.REQUEST['keyID'] \
        and 'vCode' in request.REQUEST and request.REQUEST['vCode'] \
        and 'characterID' in request.REQUEST and request.REQUEST['characterID']:
        pass
    else:
        return Error(u'错误，缺少参数')

    keyID = int(request.REQUEST['keyID'])
    vCode = request.REQUEST['vCode']
    characterID = int(request.REQUEST['characterID'])

    char = Character.objects.get(account__id = keyID, account__vCode = vCode, id = characterID)

    d = {
        'char': char,
    }
    d.update(custom_proc(cache_time))

    return render_to_response(template_name, d, mimetype='application/xml')


@csrf_exempt
def SkillQueue(request, template_name, cache_time):
    
    if      'keyID' in request.REQUEST and request.REQUEST['keyID'] \
        and 'vCode' in request.REQUEST and request.REQUEST['vCode'] \
        and 'characterID' in request.REQUEST and request.REQUEST['characterID']:
        pass
    else:
        return Error(u'错误，缺少参数')

    keyID = int(request.REQUEST['keyID'])
    vCode = request.REQUEST['vCode']
    characterID = int(request.REQUEST['characterID'])

    d = {
    }
    d.update(custom_proc(cache_time))

    return render_to_response(template_name, d, mimetype='application/xml')


@csrf_exempt
def SkillInTraining(request, template_name, cache_time):
    
    if      'keyID' in request.REQUEST and request.REQUEST['keyID'] \
        and 'vCode' in request.REQUEST and request.REQUEST['vCode'] \
        and 'characterID' in request.REQUEST and request.REQUEST['characterID']:
        pass
    else:
        return Error(u'错误，缺少参数')

    keyID = int(request.REQUEST['keyID'])
    vCode = request.REQUEST['vCode']
    characterID = int(request.REQUEST['characterID'])

    d = {
    }
    d.update(custom_proc(cache_time))

    return render_to_response(template_name, d, mimetype='application/xml')


@csrf_exempt
def APIError(request):
    d = {
        'error_code': '1002',
        'error_msg': u'该API未实装：%s' % request.path,
    }
    d.update(custom_proc(3600))
    return render_to_response('xml/Error.xml', d, mimetype='application/xml')


def Error(msg):
    d = {
        'error_code': '1003',
        'error_msg': msg,
    }
    return render_to_response('xml/Error.xml', d, mimetype='application/xml')

