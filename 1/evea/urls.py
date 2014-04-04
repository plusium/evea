# -*- coding:utf-8 -*-

from django.conf.urls import patterns, include, url
from evea.views import *
from evea.datas.views import *

# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    url(r'^$', hello),
    url(r'^index', hello),
    url(r'^admin/register/$', register),
    url(r'^admin/datas/charskillimport/(\d+)/$', charskillimport),

    # eve api
    url(r'^server/ServerStatus.xml.aspx$',         XXStatus, {'template_name':   'xml/serverServerStatus.xml', 'cache_time': 3600}),
    url(r'^account/AccountStatus.xml.aspx$',       XXStatus, {'template_name': 'xml/accountAccountStatus.xml', 'cache_time': 3600}),
    url(r'^account/APIKeyInfo.xml.aspx$',     CharacterList, {'template_name':    'xml/accountAPIKeyInfo.xml', 'cache_time':  300}),
    url(r'^account/Characters.xml.aspx$',     CharacterList, {'template_name':    'xml/accountCharacters.xml', 'cache_time': 3600}),
    url(r'^char/CharacterSheet.xml.aspx$',   CharacterSheet, {'template_name':   'xml/charCharacterSheet.xml', 'cache_time': 3600}),
    url(r'^char/SkillQueue.xml.aspx$',           SkillQueue, {'template_name':       'xml/charSkillQueue.xml', 'cache_time': 3600}),
    url(r'^char/SkillInTraining.xml.aspx$', SkillInTraining, {'template_name':  'xml/charSkillInTraining.xml', 'cache_time': 3600}),
    url(r'^eve/CharacterInfo.xml.aspx$',      CharacterInfo, {'template_name':     'xml/eveCharacterInfo.xml', 'cache_time': 3600}),
    url(r'.xml.aspx$', APIError),
    
    # evea 附加 api：角色信息上传API
    url(r'api/updateCharInfo/$', updateCharInfo),
    
    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
)

# Serve static files for admin, use this for debug usage only
# `python manage.py collectstatic` is preferred.
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
urlpatterns += staticfiles_urlpatterns()

