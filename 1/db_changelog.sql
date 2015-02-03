

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



