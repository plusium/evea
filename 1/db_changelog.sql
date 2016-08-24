

-- 2016-08-24
-- 从 Frostline_1.0_116241(捍卫者) 到 sde-20160809-TRANQUILITY(堡垒 YC118.6) 的数据库更新  start

update datas_skillgroup set group_name     = '建筑管理'                 where id=1545;

update datas_skill      set skill_group_id = '1545'                     where id=3373;
update datas_skill      set skill_group_id = '1545'                     where id=11584;
update datas_skill      set skill_name     = '后勤巡洋舰'               where id=12096;
update datas_skill      set skill_name     = '电磁护盾补偿研究'         where id=12365;
update datas_skill      set skill_name     = '动能护盾补偿研究'         where id=12366;
update datas_skill      set skill_name     = '爆炸护盾补偿研究'         where id=12367;
update datas_skill      set skill_name     = '武器扰乱'                 where id=19767;
update datas_skill      set skill_name     = '超大型鱼雷'               where id=21668;
update datas_skill      set skill_name     = '铁骑舰载机机库管理'       where id=24613;
update datas_skill      set skill_name     = '护盾改装技术'             where id=26261;
update datas_skill      set skill_name     = '脉冲波投射器操作'         where id=27911;
update datas_skill      set skill_name     = '重型铁骑舰载机操控理论'   where id=32339;
update datas_skill      set skill_name     = '超大型巡航导弹'           where id=32435;
update datas_skill      set skill_name     = '抗性定相'                 where id=32797;
update datas_skill      set skill_group_id = '1216'                     where id=32797;
update datas_skill      set skill_name     = '勘探护卫舰操作'           where id=33856;
update datas_skill      set skill_name     = '指挥驱逐舰操作'           where id=37615;
update datas_skill      set skill_name     = '后勤护卫舰'               where id=40328;

INSERT INTO datas_skill (id, skill_name, skill_group_id, skill_rank) VALUES 
 ('37796', '建筑导弹系统研究',           '1545', '2')
,('37797', '建筑末日武器操作技术',       '1545', '2')
,('37798', '建筑电子系统研究',           '1545', '2')
,('37799', '建筑工程系统研究',           '1545', '2')
,('40572', '轻型铁骑舰载机操控理论',     '273',  '12')
,('40573', '后勤铁骑舰载机操控理论',     '273',  '12')
,('41403', '旗舰级自动加农炮专业研究',   '255',  '10')
,('41404', '旗舰级火炮专业研究',         '255',  '10')
,('41405', '旗舰级疾速炮专业研究',       '255',  '10')
,('41406', '旗舰级磁轨炮专业研究',       '255',  '10')
,('41407', '旗舰级脉冲激光专业研究',     '255',  '10')
,('41408', '旗舰级集束激光专业研究',     '255',  '10')
,('41409', '超大型鱼雷专业研究',         '256',  '10')
,('41410', '超大型巡航导弹专业研究',     '256',  '10')
,('41537', '末日武器快速发射',           '255',  '14');

-- 从 Frostline_1.0_116241(捍卫者) 到 sde-20160809-TRANQUILITY(堡垒 YC118.6) 的数据库更新  end



-- 2016-01-20
-- 从 Parallax_1.0_115480 到 Frostline_1.0_116241(捍卫者) 的数据库更新  start

INSERT INTO datas_skillgroup (id, group_name) VALUES 
 ('1545', 'Structure Management');

INSERT INTO datas_skill (id, skill_name, skill_group_id, skill_rank) VALUES 
 ('37615', 'Command Destroyers', '257', '6')
,('40328', 'Logistics Frigates', '257', '4');

update datas_skill set skill_name = '热能护盾补偿研究'         where id=11566;

-- 从 Parallax_1.0_115480 到 Frostline_1.0_116241(捍卫者) 的数据库更新  end



-- 2015-12-08
-- 从 破晓版(Mosaic1.2) 更新到 Parallax_1.0_115480 的数据库更新  start

INSERT INTO datas_skill (id, skill_name, skill_group_id, skill_rank) VALUES 
 ('35680', '加达里战术驱逐舰操作', '257', '3')
,('35685', '盖伦特战术驱逐舰操作', '257', '3');

-- 从 破晓版(Mosaic1.2) 更新到 Parallax_1.0_115480 的数据库更新  end



-- 2015-06-29
-- 从 破晓版 更新到 破晓版(Mosaic1.2) 的数据库更新  start

INSERT INTO datas_skill (id, skill_name, skill_group_id, skill_rank) VALUES 
 ('34533', '米玛塔尔战术驱逐舰操作', '257', '3');

-- 从 破晓版 更新到 破晓版(Mosaic1.2) 的数据库更新  end



-- 2015-03-14
-- 修正由于CCP修改API接口导致EVEMon无法获取属性植入体信息的bug  start

alter table `datas_implant` add column `type_id` int(11) NULL;

truncate table `datas_implant`;

INSERT INTO datas_implant (implant_name, languageID, implant_type, implant_value, type_id) VALUES 
 ('初级视觉滤镜', 'ZH', '1', '1', '13283')
,('初级视觉滤镜—加强版', 'ZH', '1', '2', '14295')
,('视觉滤镜—基础级', 'ZH', '1', '3', '9899')
,('视觉滤镜—标准级', 'ZH', '1', '4', '10216')
,('视觉滤镜—强化级', 'ZH', '1', '5', '10217')
,('视觉滤镜—高级', 'ZH', '1', '6', '10218')
,('视觉滤镜—精英级', 'ZH', '1', '7', '10219')
,('初级记忆增强体', 'ZH', '2', '1', '13284')
,('初级记忆增强体—加强版', 'ZH', '2', '2', '14297')
,('记忆增强体—基础级', 'ZH', '2', '3', '9941')
,('记忆增强体—标准级', 'ZH', '2', '4', '10208')
,('记忆增强体—强化级', 'ZH', '2', '5', '10209')
,('记忆强植体—高级', 'ZH', '2', '6', '10210')
,('记忆增强体—精英级', 'ZH', '2', '7', '10211')
,('初级神经增效体', 'ZH', '3', '1', '13285')
,('初级神经增效体—加强版', 'ZH', '3', '2', '14296')
,('神经增效体—基础级', 'ZH', '3', '3', '9942')
,('神经增效体—标准级', 'ZH', '3', '4', '10212')
,('神经增效体—强化级', 'ZH', '3', '5', '10213')
,('神经增效体—高级', 'ZH', '3', '6', '10214')
,('神经增效体—精英级', 'ZH', '3', '7', '10215')
,('初级脑控次处理器', 'ZH', '4', '1', '13287')
,('初级脑控次处理器—加强版', 'ZH', '4', '2', '14298')
,('脑控次处理器—基础级', 'ZH', '4', '3', '9943')
,('脑控次处理器—标准级', 'ZH', '4', '4', '10221')
,('脑控次处理器—强化级', 'ZH', '4', '5', '10222')
,('脑控次处理器—高级', 'ZH', '4', '6', '10223')
,('脑控次处理器—精英级', 'ZH', '4', '7', '10224')
,('初级社交适应芯片', 'ZH', '5', '1', '13286')
,('初级社交适应芯片—加强版', 'ZH', '5', '2', '14299')
,('社交适应芯片—基础级', 'ZH', '5', '3', '9956')
,('社交适应芯片—标准级', 'ZH', '5', '4', '10225')
,('社交适应芯片—强化级', 'ZH', '5', '5', '10226')
,('社交适应芯片—高级', 'ZH', '5', '6', '10227')
,('Limited Ocular Filter', 'EN-US', '1', '1', '13283')
,('Limited Ocular Filter - Beta', 'EN-US', '1', '2', '14295')
,('Ocular Filter - Basic', 'EN-US', '1', '3', '9899')
,('Ocular Filter - Standard', 'EN-US', '1', '4', '10216')
,('Ocular Filter - Improved', 'EN-US', '1', '5', '10217')
,('Ocular Filter - Advanced', 'EN-US', '1', '6', '10218')
,('Ocular Filter - Elite', 'EN-US', '1', '7', '10219')
,('Limited Memory Augmentation', 'EN-US', '2', '1', '13284')
,('Limited Memory Augmentation - Beta', 'EN-US', '2', '2', '14297')
,('Memory Augmentation - Basic', 'EN-US', '2', '3', '9941')
,('Memory Augmentation - Standard', 'EN-US', '2', '4', '10208')
,('Memory Augmentation - Improved', 'EN-US', '2', '5', '10209')
,('Memory Augmentation - Advanced', 'EN-US', '2', '6', '10210')
,('Memory Augmentation - Elite', 'EN-US', '2', '7', '10211')
,('Limited Neural Boost', 'EN-US', '3', '1', '13285')
,('Limited Neural Boost - Beta', 'EN-US', '3', '2', '14296')
,('Neural Boost - Basic', 'EN-US', '3', '3', '9942')
,('Neural Boost - Standard', 'EN-US', '3', '4', '10212')
,('Neural Boost - Improved', 'EN-US', '3', '5', '10213')
,('Neural Boost - Advanced', 'EN-US', '3', '6', '10214')
,('Neural Boost - Elite', 'EN-US', '3', '7', '10215')
,('Limited Cybernetic Subprocessor', 'EN-US', '4', '1', '13287')
,('Limited Cybernetic Subprocessor - Beta', 'EN-US', '4', '2', '14298')
,('Cybernetic Subprocessor - Basic', 'EN-US', '4', '3', '9943')
,('Cybernetic Subprocessor - Standard', 'EN-US', '4', '4', '10221')
,('Cybernetic Subprocessor - Improved', 'EN-US', '4', '5', '10222')
,('Cybernetic Subprocessor - Advanced', 'EN-US', '4', '6', '10223')
,('Cybernetic Subprocessor - Elite', 'EN-US', '4', '7', '10224')
,('Limited Social Adaptation Chip', 'EN-US', '5', '1', '13286')
,('Limited Social Adaptation Chip - Beta', 'EN-US', '5', '2', '14299')
,('Social Adaptation Chip - Basic', 'EN-US', '5', '3', '9956')
,('Social Adaptation Chip - Standard', 'EN-US', '5', '4', '10225')
,('Social Adaptation Chip - Improved', 'EN-US', '5', '5', '10226')
,('Social Adaptation Chip - Advanced', 'EN-US', '5', '6', '10227');

alter table `datas_implant` modify column `type_id` int(11) NOT NULL;

-- 修正由于CCP修改API接口导致EVEMon无法获取属性植入体信息的bug  end



-- 2015-02-03
-- 从工业时代版更新到破晓版的数据库更新  start

update datas_skill set skill_name = '提炼学概论'               where id=3385;
update datas_skill set skill_name = '高级工业理论'             where id=3388;
update datas_skill set skill_name = '提炼效率理论'             where id=3389;
update datas_skill set skill_name = '高级小型舰船建造研究'     where id=3395;
update datas_skill set skill_name = '高级工业舰船建造研究'     where id=3396;
update datas_skill set skill_name = '高级中型舰船建造研究'     where id=3397;
update datas_skill set skill_name = '高级大型舰船建造研究'     where id=3398;
update datas_skill set skill_name = '冬眠者加密技术原理'       where id=3408;
INSERT INTO datas_skill (id, skill_name, skill_group_id, skill_rank) VALUES 
 ('34327', '联合矿业货舰操作', '257', '9')
,('34390', '艾玛战术驱逐舰操作', '257', '3');

-- 从工业时代版更新到破晓版的数据库更新  end



-- 2014-09-21
-- 从绝地反击版更新到工业时代版的数据库更新  start

update datas_skill set skill_name = '无人机电子理论'     where id=3437;
update datas_skill set skill_name = '高级无人机电子理论' where id=23566;
update datas_skill set skill_name = '轻型无人机操控理论', skill_rank = 1 where id=24241;
INSERT INTO datas_skill (id, skill_group_id, skill_rank, skill_name) VALUES 
 ('33699', '273', '2', '中型无人机操控理论')
,('33856', '257', '4', '勘探护卫舰');

-- 从绝地反击版更新到工业时代版的数据库更新  end



