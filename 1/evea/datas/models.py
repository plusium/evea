# -*- coding:utf-8 -*-

from django.db import models
from django.core.exceptions import ValidationError
from django.contrib.auth.models import User


# 5大属性值的合法验证
def validate_property(value):
    if 17 <= value <= 27:
        pass
    else:
        raise ValidationError(u'值必须在 17 和 27 之间。')


# 大脑植入体
class Implant(models.Model):
    implant_name = models.CharField(max_length=100)
    languageID = models.CharField(max_length=100)
    implant_type = models.SmallIntegerField()
    implant_value = models.SmallIntegerField()
    
    def __unicode__(self):
        return u'槽位：%s 属性+%s %s' % (self.implant_type, self.implant_value, self.implant_name)

#技能分组
class SkillGroup(models.Model):
    group_name = models.CharField(max_length=100)

    def __unicode__(self):
        return u'%s' % self.group_name

#技能
class Skill(models.Model):
    skill_name = models.CharField(max_length=100)
    skill_group = models.ForeignKey(SkillGroup)
    skill_rank = models.SmallIntegerField()

    def __unicode__(self):
        return u'%s' % self.skill_name

#账号
class Account(models.Model):
    user = models.ForeignKey(User, unique=True)
    vCode = models.CharField(verbose_name=u'vCode', max_length=64)

    class Meta:
        verbose_name = u'账号'
        verbose_name_plural = u'账号'

    def __unicode__(self):
        return str(self.user)

#角色
class Character(models.Model):
    account = models.ForeignKey(Account, verbose_name=u'账号')
    char_name = models.CharField(verbose_name=u'角色名', max_length=30)
    perception = models.PositiveSmallIntegerField(verbose_name=u'感知（属性）', default=20, validators=[validate_property])
    memory = models.PositiveSmallIntegerField(verbose_name=u'记忆（属性）', default=20, validators=[validate_property])
    willpower = models.PositiveSmallIntegerField(verbose_name=u'毅力（属性）', default=20, validators=[validate_property])
    intelligence = models.PositiveSmallIntegerField(verbose_name=u'智力（属性）', default=20, validators=[validate_property])
    charisma = models.PositiveSmallIntegerField(verbose_name=u'魅力（属性）', default=19, validators=[validate_property])
    per_implant = models.ForeignKey(Implant, verbose_name=u'感知（植入体）', blank=True, null=True, limit_choices_to = {'implant_type': 1}, related_name='chars_per')
    mem_implant = models.ForeignKey(Implant, verbose_name=u'记忆（植入体）', blank=True, null=True, limit_choices_to = {'implant_type': 2}, related_name='chars_mem')
    wil_implant = models.ForeignKey(Implant, verbose_name=u'毅力（植入体）', blank=True, null=True, limit_choices_to = {'implant_type': 3}, related_name='chars_wil')
    int_implant = models.ForeignKey(Implant, verbose_name=u'智力（植入体）', blank=True, null=True, limit_choices_to = {'implant_type': 4}, related_name='chars_int')
    cha_implant = models.ForeignKey(Implant, verbose_name=u'魅力（植入体）', blank=True, null=True, limit_choices_to = {'implant_type': 5}, related_name='chars_cha')
    
    @property
    def keyID(self):
        return self.account_id

    @property
    def vCode(self):
        return self.account.vCode

    @property
    def characterID(self):
        return self.id

    class Meta:
        verbose_name = u'角色'
        verbose_name_plural = u'角色'

    def __unicode__(self):
        return u'%s-%s' % (str(self.account.user), self.char_name)

#角色技能
class Character_Skills(models.Model):
    char = models.ForeignKey(Character, verbose_name=u'角色', related_name='skills')
    skill = models.ForeignKey(Skill, verbose_name=u'技能')
    skill_level = models.PositiveSmallIntegerField(verbose_name=u'技能等级', default=0)
    skill_point = models.PositiveIntegerField(verbose_name=u'技能点数', default=0)

    class Meta:
        verbose_name = u'角色技能'
        verbose_name_plural = u'角色技能'

    def __unicode__(self):
        return u'%s-等级%s' % (self.skill.skill_name, self.skill_level)

