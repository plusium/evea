
-- 2014-09-21
-- 从绝地反击版更新到工业时代版的数据库更新  start

update datas_skill set skill_name = '无人机电子理论'     where id=3437;
update datas_skill set skill_name = '高级无人机电子理论' where id=23566;
update datas_skill set skill_name = '轻型无人机操控理论', skill_rank = 1 where id=24241;
INSERT INTO datas_skill (id, skill_group_id, skill_rank, skill_name) VALUES 
 ('33699', '273', '2', '中型无人机操控理论')
,('33856', '257', '4', '勘探护卫舰');

-- 从绝地反击版更新到工业时代版的数据库更新  end

