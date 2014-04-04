/*
Navicat MySQL Data Transfer

Source Server         : lcoal_mysql
Source Server Version : 50536
Source Host           : localhost:3306
Source Database       : evea

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2014-03-27 00:10:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('1', 'normaluser');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_425ae3c4` (`group_id`),
  KEY `auth_group_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `group_id_refs_id_3cea63fe` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_5886d21f` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
INSERT INTO `auth_group_permissions` VALUES ('1', '1', '31');
INSERT INTO `auth_group_permissions` VALUES ('2', '1', '32');
INSERT INTO `auth_group_permissions` VALUES ('3', '1', '33');

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_728de91f` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add permission', '1', 'add_permission');
INSERT INTO `auth_permission` VALUES ('2', 'Can change permission', '1', 'change_permission');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete permission', '1', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('4', 'Can add group', '2', 'add_group');
INSERT INTO `auth_permission` VALUES ('5', 'Can change group', '2', 'change_group');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete group', '2', 'delete_group');
INSERT INTO `auth_permission` VALUES ('7', 'Can add user', '3', 'add_user');
INSERT INTO `auth_permission` VALUES ('8', 'Can change user', '3', 'change_user');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete user', '3', 'delete_user');
INSERT INTO `auth_permission` VALUES ('10', 'Can add content type', '4', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('11', 'Can change content type', '4', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('12', 'Can delete content type', '4', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('13', 'Can add session', '5', 'add_session');
INSERT INTO `auth_permission` VALUES ('14', 'Can change session', '5', 'change_session');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete session', '5', 'delete_session');
INSERT INTO `auth_permission` VALUES ('16', 'Can add site', '6', 'add_site');
INSERT INTO `auth_permission` VALUES ('17', 'Can change site', '6', 'change_site');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete site', '6', 'delete_site');
INSERT INTO `auth_permission` VALUES ('19', 'Can add log entry', '7', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('20', 'Can change log entry', '7', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete log entry', '7', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('22', 'Can add skill group', '8', 'add_skillgroup');
INSERT INTO `auth_permission` VALUES ('23', 'Can change skill group', '8', 'change_skillgroup');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete skill group', '8', 'delete_skillgroup');
INSERT INTO `auth_permission` VALUES ('25', 'Can add skill', '9', 'add_skill');
INSERT INTO `auth_permission` VALUES ('26', 'Can change skill', '9', 'change_skill');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete skill', '9', 'delete_skill');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 账号', '10', 'add_account');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 账号', '10', 'change_account');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 账号', '10', 'delete_account');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 角色', '11', 'add_character');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 角色', '11', 'change_character');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 角色', '11', 'delete_character');
INSERT INTO `auth_permission` VALUES ('34', 'Can add 角色技能', '12', 'add_character_skills');
INSERT INTO `auth_permission` VALUES ('35', 'Can change 角色技能', '12', 'change_character_skills');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete 角色技能', '12', 'delete_character_skills');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `password` varchar(128) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `last_login` datetime NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES ('1', 'root', '', '', 'root@1.cc', 'pbkdf2_sha256$10000$Qqx2h0Yrd8kc$x0g8FqNQANHA6FZMsgYdP3c1kbx4jCQwwWdRKpOQ2Eg=', '1', '1', '1', '2014-03-26 16:03:04', '2014-03-26 16:03:04');

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_403f60f` (`user_id`),
  KEY `auth_user_groups_425ae3c4` (`group_id`),
  CONSTRAINT `user_id_refs_id_7ceef80f` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `group_id_refs_id_f116770` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_403f60f` (`user_id`),
  KEY `auth_user_user_permissions_1e014c8f` (`permission_id`),
  CONSTRAINT `user_id_refs_id_dfbab7d` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `permission_id_refs_id_67e79cb` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for datas_account
-- ----------------------------
DROP TABLE IF EXISTS `datas_account`;
CREATE TABLE `datas_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `vCode` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `user_id_refs_id_741c9bb2` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of datas_account
-- ----------------------------
INSERT INTO `datas_account` VALUES ('1', '1', 'a');

-- ----------------------------
-- Table structure for datas_character
-- ----------------------------
DROP TABLE IF EXISTS `datas_character`;
CREATE TABLE `datas_character` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_id` int(11) NOT NULL,
  `char_name` varchar(30) NOT NULL,
  `perception` smallint(6) NOT NULL,
  `memory` smallint(6) NOT NULL,
  `willpower` smallint(6) NOT NULL,
  `intelligence` smallint(6) NOT NULL,
  `charisma` smallint(6) NOT NULL,
  `per_implant_id` int(11) DEFAULT NULL,
  `mem_implant_id` int(11) DEFAULT NULL,
  `wil_implant_id` int(11) DEFAULT NULL,
  `int_implant_id` int(11) DEFAULT NULL,
  `cha_implant_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `datas_character_6f2fe10e` (`account_id`),
  KEY `per_implant_id_refs_id_2a93b44f` (`per_implant_id`),
  KEY `mem_implant_id_refs_id_2a93b44f` (`mem_implant_id`),
  KEY `wil_implant_id_refs_id_2a93b44f` (`wil_implant_id`),
  KEY `int_implant_id_refs_id_2a93b44f` (`int_implant_id`),
  KEY `cha_implant_id_refs_id_2a93b44f` (`cha_implant_id`),
  CONSTRAINT `cha_implant_id_refs_id_2a93b44f` FOREIGN KEY (`cha_implant_id`) REFERENCES `datas_implant` (`id`),
  CONSTRAINT `account_id_refs_id_37d646d5` FOREIGN KEY (`account_id`) REFERENCES `datas_account` (`id`),
  CONSTRAINT `int_implant_id_refs_id_2a93b44f` FOREIGN KEY (`int_implant_id`) REFERENCES `datas_implant` (`id`),
  CONSTRAINT `mem_implant_id_refs_id_2a93b44f` FOREIGN KEY (`mem_implant_id`) REFERENCES `datas_implant` (`id`),
  CONSTRAINT `per_implant_id_refs_id_2a93b44f` FOREIGN KEY (`per_implant_id`) REFERENCES `datas_implant` (`id`),
  CONSTRAINT `wil_implant_id_refs_id_2a93b44f` FOREIGN KEY (`wil_implant_id`) REFERENCES `datas_implant` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of datas_character
-- ----------------------------
INSERT INTO `datas_character` VALUES ('1', '1', '测试角色', '20', '20', '20', '20', '19', null, null, null, null, null);

-- ----------------------------
-- Table structure for datas_character_skills
-- ----------------------------
DROP TABLE IF EXISTS `datas_character_skills`;
CREATE TABLE `datas_character_skills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `skill_level` smallint(6) NOT NULL,
  `skill_point` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `datas_character_skills_4211a20c` (`char_id`),
  KEY `datas_character_skills_30f70346` (`skill_id`),
  CONSTRAINT `skill_id_refs_id_75d3dcdf` FOREIGN KEY (`skill_id`) REFERENCES `datas_skill` (`id`),
  CONSTRAINT `char_id_refs_id_1408fef9` FOREIGN KEY (`char_id`) REFERENCES `datas_character` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of datas_character_skills
-- ----------------------------
INSERT INTO `datas_character_skills` VALUES ('1', '1', '3319', '1', '250');

-- ----------------------------
-- Table structure for datas_skill
-- ----------------------------
DROP TABLE IF EXISTS `datas_skill`;
CREATE TABLE `datas_skill` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `skill_name` varchar(100) NOT NULL,
  `skill_group_id` int(11) NOT NULL,
  `skill_rank` smallint(6) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `datas_skill_1df91844` (`skill_group_id`),
  CONSTRAINT `skill_group_id_refs_id_63af0ae3` FOREIGN KEY (`skill_group_id`) REFERENCES `datas_skillgroup` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33468 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of datas_skill
-- ----------------------------
INSERT INTO `datas_skill` VALUES ('2403', '高级行星学', '1241', '5');
INSERT INTO `datas_skill` VALUES ('2406', '行星学', '1241', '3');
INSERT INTO `datas_skill` VALUES ('2495', '行星统筹管理学', '1241', '4');
INSERT INTO `datas_skill` VALUES ('2505', '指挥中心升级理论', '1241', '4');
INSERT INTO `datas_skill` VALUES ('3184', '联合矿业工业舰操作', '257', '4');
INSERT INTO `datas_skill` VALUES ('3300', '射击学', '255', '1');
INSERT INTO `datas_skill` VALUES ('3301', '小型混合炮台研究', '255', '1');
INSERT INTO `datas_skill` VALUES ('3302', '小型射弹炮台研究', '255', '1');
INSERT INTO `datas_skill` VALUES ('3303', '小型能量炮台研究', '255', '1');
INSERT INTO `datas_skill` VALUES ('3304', '中型混合炮台研究', '255', '3');
INSERT INTO `datas_skill` VALUES ('3305', '中型射弹炮台研究', '255', '3');
INSERT INTO `datas_skill` VALUES ('3306', '中型能量炮台研究', '255', '3');
INSERT INTO `datas_skill` VALUES ('3307', '大型混合炮台研究', '255', '5');
INSERT INTO `datas_skill` VALUES ('3308', '大型射弹炮台研究', '255', '5');
INSERT INTO `datas_skill` VALUES ('3309', '大型能量炮台研究', '255', '5');
INSERT INTO `datas_skill` VALUES ('3310', '高速射击理论', '255', '2');
INSERT INTO `datas_skill` VALUES ('3311', '精确射击理论', '255', '2');
INSERT INTO `datas_skill` VALUES ('3312', '航迹预算学', '255', '2');
INSERT INTO `datas_skill` VALUES ('3315', '外科手术打击理论', '255', '4');
INSERT INTO `datas_skill` VALUES ('3316', '受控点射理论', '255', '2');
INSERT INTO `datas_skill` VALUES ('3317', '弹道分析学', '255', '5');
INSERT INTO `datas_skill` VALUES ('3318', '武器升级研究', '1216', '2');
INSERT INTO `datas_skill` VALUES ('3319', '导弹发射器操作', '256', '1');
INSERT INTO `datas_skill` VALUES ('3320', '火箭概论', '256', '1');
INSERT INTO `datas_skill` VALUES ('3321', '轻型导弹概论', '256', '2');
INSERT INTO `datas_skill` VALUES ('3322', '自动锁定导弹', '256', '3');
INSERT INTO `datas_skill` VALUES ('3323', '反弹道导弹理论', '256', '2');
INSERT INTO `datas_skill` VALUES ('3324', '重型导弹概论', '256', '3');
INSERT INTO `datas_skill` VALUES ('3325', '鱼雷概论', '256', '4');
INSERT INTO `datas_skill` VALUES ('3326', '巡航导弹概论', '256', '5');
INSERT INTO `datas_skill` VALUES ('3327', '飞船操控学', '257', '1');
INSERT INTO `datas_skill` VALUES ('3328', '盖伦特护卫舰操作', '257', '2');
INSERT INTO `datas_skill` VALUES ('3329', '米玛塔尔护卫舰操作', '257', '2');
INSERT INTO `datas_skill` VALUES ('3330', '加达里护卫舰操作', '257', '2');
INSERT INTO `datas_skill` VALUES ('3331', '艾玛护卫舰操作', '257', '2');
INSERT INTO `datas_skill` VALUES ('3332', '盖伦特巡洋舰操作', '257', '5');
INSERT INTO `datas_skill` VALUES ('3333', '米玛塔尔巡洋舰操作', '257', '5');
INSERT INTO `datas_skill` VALUES ('3334', '加达里巡洋舰操作', '257', '5');
INSERT INTO `datas_skill` VALUES ('3335', '艾玛巡洋舰操作', '257', '5');
INSERT INTO `datas_skill` VALUES ('3336', '盖伦特战列舰操作', '257', '8');
INSERT INTO `datas_skill` VALUES ('3337', '米玛塔尔战列舰操作', '257', '8');
INSERT INTO `datas_skill` VALUES ('3338', '加达里战列舰操作', '257', '8');
INSERT INTO `datas_skill` VALUES ('3339', '艾玛战列舰操作', '257', '8');
INSERT INTO `datas_skill` VALUES ('3340', '盖伦特工业舰操作', '257', '4');
INSERT INTO `datas_skill` VALUES ('3341', '米玛塔尔工业舰操作', '257', '4');
INSERT INTO `datas_skill` VALUES ('3342', '加达里工业舰操作', '257', '4');
INSERT INTO `datas_skill` VALUES ('3343', '艾玛工业舰操作', '257', '4');
INSERT INTO `datas_skill` VALUES ('3344', '盖伦特泰坦操作', '257', '16');
INSERT INTO `datas_skill` VALUES ('3345', '米玛塔尔泰坦操作', '257', '16');
INSERT INTO `datas_skill` VALUES ('3346', '加达里泰坦操作', '257', '16');
INSERT INTO `datas_skill` VALUES ('3347', '艾玛泰坦操作', '257', '16');
INSERT INTO `datas_skill` VALUES ('3348', '领导理论', '258', '1');
INSERT INTO `datas_skill` VALUES ('3349', '游击战理论', '258', '2');
INSERT INTO `datas_skill` VALUES ('3350', '会战理论', '258', '2');
INSERT INTO `datas_skill` VALUES ('3351', '会战专业研究', '258', '5');
INSERT INTO `datas_skill` VALUES ('3352', '信息战专业研究', '258', '5');
INSERT INTO `datas_skill` VALUES ('3354', '作战网络专业研究', '258', '6');
INSERT INTO `datas_skill` VALUES ('3355', '社会学', '278', '1');
INSERT INTO `datas_skill` VALUES ('3356', '谈判技巧', '278', '2');
INSERT INTO `datas_skill` VALUES ('3357', '外交学', '278', '1');
INSERT INTO `datas_skill` VALUES ('3358', '高级沟通技巧', '278', '4');
INSERT INTO `datas_skill` VALUES ('3359', '关系学', '278', '3');
INSERT INTO `datas_skill` VALUES ('3361', '犯罪关系研究', '278', '3');
INSERT INTO `datas_skill` VALUES ('3363', '军团管理培训', '266', '1');
INSERT INTO `datas_skill` VALUES ('3368', '外交关系学', '266', '2');
INSERT INTO `datas_skill` VALUES ('3373', '母星防御控制管理', '266', '7');
INSERT INTO `datas_skill` VALUES ('3380', '工业理论', '268', '1');
INSERT INTO `datas_skill` VALUES ('3385', '精炼学概论', '1218', '1');
INSERT INTO `datas_skill` VALUES ('3386', '采矿技术', '1218', '1');
INSERT INTO `datas_skill` VALUES ('3387', '批量生产学', '268', '2');
INSERT INTO `datas_skill` VALUES ('3388', '材料效率', '268', '3');
INSERT INTO `datas_skill` VALUES ('3389', '精炼效率理论', '1218', '3');
INSERT INTO `datas_skill` VALUES ('3392', '机械学', '1210', '1');
INSERT INTO `datas_skill` VALUES ('3393', '维修系统理论', '1210', '1');
INSERT INTO `datas_skill` VALUES ('3394', '船体加固理论', '1210', '2');
INSERT INTO `datas_skill` VALUES ('3395', '护卫舰建造研究', '268', '2');
INSERT INTO `datas_skill` VALUES ('3396', '工业舰建造研究', '268', '3');
INSERT INTO `datas_skill` VALUES ('3397', '巡洋舰建造研究', '268', '5');
INSERT INTO `datas_skill` VALUES ('3398', '战列舰建造研究', '268', '8');
INSERT INTO `datas_skill` VALUES ('3400', '哨站建造研究', '268', '16');
INSERT INTO `datas_skill` VALUES ('3402', '科学原理', '270', '1');
INSERT INTO `datas_skill` VALUES ('3403', '研究概论', '270', '1');
INSERT INTO `datas_skill` VALUES ('3405', '生物学', '1220', '1');
INSERT INTO `datas_skill` VALUES ('3406', '实验室运作理论', '270', '1');
INSERT INTO `datas_skill` VALUES ('3408', '逆向工程原理', '270', '4');
INSERT INTO `datas_skill` VALUES ('3409', '冶金学', '270', '3');
INSERT INTO `datas_skill` VALUES ('3410', '太空地质学', '1218', '3');
INSERT INTO `datas_skill` VALUES ('3411', '控制论', '1220', '3');
INSERT INTO `datas_skill` VALUES ('3412', '太空测量学', '1217', '3');
INSERT INTO `datas_skill` VALUES ('3413', '能量栅格管理学', '1216', '1');
INSERT INTO `datas_skill` VALUES ('3416', '护盾操作', '1209', '1');
INSERT INTO `datas_skill` VALUES ('3417', '电容系统操作', '1216', '1');
INSERT INTO `datas_skill` VALUES ('3418', '电容管理学', '1216', '3');
INSERT INTO `datas_skill` VALUES ('3419', '护盾管理', '1209', '3');
INSERT INTO `datas_skill` VALUES ('3420', '战术护盾操控', '1209', '4');
INSERT INTO `datas_skill` VALUES ('3421', '能量脉冲武器', '1216', '2');
INSERT INTO `datas_skill` VALUES ('3422', '护盾频散系统', '1209', '2');
INSERT INTO `datas_skill` VALUES ('3423', '电容散发系统研究', '1216', '2');
INSERT INTO `datas_skill` VALUES ('3424', '能量栅格提升', '1216', '2');
INSERT INTO `datas_skill` VALUES ('3425', '护盾提升', '1209', '2');
INSERT INTO `datas_skill` VALUES ('3426', 'CPU管理学', '1216', '1');
INSERT INTO `datas_skill` VALUES ('3427', '电子战理论', '272', '2');
INSERT INTO `datas_skill` VALUES ('3428', '远距锁定研究', '1213', '2');
INSERT INTO `datas_skill` VALUES ('3429', '目标锁定训练', '1213', '1');
INSERT INTO `datas_skill` VALUES ('3430', '高级目标锁定训练', '1213', '3');
INSERT INTO `datas_skill` VALUES ('3431', '信号分析学', '1213', '1');
INSERT INTO `datas_skill` VALUES ('3432', '电子升级研究', '1216', '2');
INSERT INTO `datas_skill` VALUES ('3433', '感应器链研究', '272', '3');
INSERT INTO `datas_skill` VALUES ('3434', '武器干扰研究', '272', '3');
INSERT INTO `datas_skill` VALUES ('3435', '推进阻扰理论', '272', '3');
INSERT INTO `datas_skill` VALUES ('3436', '无人机概论', '273', '1');
INSERT INTO `datas_skill` VALUES ('3437', '无人机侦查理论', '273', '1');
INSERT INTO `datas_skill` VALUES ('3438', '采矿无人机操控理论', '273', '2');
INSERT INTO `datas_skill` VALUES ('3439', '维修无人机操控理论', '273', '3');
INSERT INTO `datas_skill` VALUES ('3440', '打捞无人机操控理论', '273', '4');
INSERT INTO `datas_skill` VALUES ('3441', '重型无人机操控理论', '273', '5');
INSERT INTO `datas_skill` VALUES ('3442', '无人机控制理论', '273', '5');
INSERT INTO `datas_skill` VALUES ('3443', '贸易学', '274', '1');
INSERT INTO `datas_skill` VALUES ('3444', '零售技巧', '274', '2');
INSERT INTO `datas_skill` VALUES ('3446', '经纪人关系学', '274', '2');
INSERT INTO `datas_skill` VALUES ('3447', '市场观测学', '274', '3');
INSERT INTO `datas_skill` VALUES ('3449', '导航学', '275', '1');
INSERT INTO `datas_skill` VALUES ('3450', '加力燃烧器原理', '275', '1');
INSERT INTO `datas_skill` VALUES ('3451', '燃料节约技术', '275', '2');
INSERT INTO `datas_skill` VALUES ('3452', '加速控制理论', '275', '4');
INSERT INTO `datas_skill` VALUES ('3453', '规避机动理论', '275', '2');
INSERT INTO `datas_skill` VALUES ('3454', '高速机动理论', '275', '5');
INSERT INTO `datas_skill` VALUES ('3455', '跃迁引擎操控基础', '275', '1');
INSERT INTO `datas_skill` VALUES ('3456', '跳跃引擎操作理论', '275', '5');
INSERT INTO `datas_skill` VALUES ('3551', '测量学', '1217', '1');
INSERT INTO `datas_skill` VALUES ('3731', '大型军团管理培训', '266', '3');
INSERT INTO `datas_skill` VALUES ('3732', '高级军团管理培训', '266', '5');
INSERT INTO `datas_skill` VALUES ('3893', '采矿关系学', '278', '2');
INSERT INTO `datas_skill` VALUES ('3894', '物流关系学', '278', '2');
INSERT INTO `datas_skill` VALUES ('3895', '安全关系学', '278', '2');
INSERT INTO `datas_skill` VALUES ('4385', '微型跳跃引擎操作', '275', '5');
INSERT INTO `datas_skill` VALUES ('4411', '目标锁定扰断训练', '272', '5');
INSERT INTO `datas_skill` VALUES ('11082', '小型磁轨炮专业研究', '255', '3');
INSERT INTO `datas_skill` VALUES ('11083', '小型集束激光专业研究', '255', '3');
INSERT INTO `datas_skill` VALUES ('11084', '小型自动加农炮专业研究', '255', '3');
INSERT INTO `datas_skill` VALUES ('11207', '高级武器升级研究', '1216', '6');
INSERT INTO `datas_skill` VALUES ('11395', '深核开采法研究', '1218', '6');
INSERT INTO `datas_skill` VALUES ('11433', '高能物理学', '270', '5');
INSERT INTO `datas_skill` VALUES ('11441', '等离子物理学', '270', '5');
INSERT INTO `datas_skill` VALUES ('11442', '纳米工程学', '270', '5');
INSERT INTO `datas_skill` VALUES ('11443', '磁流体物理学', '270', '5');
INSERT INTO `datas_skill` VALUES ('11444', '艾玛星舰工程学', '270', '5');
INSERT INTO `datas_skill` VALUES ('11445', '米玛塔尔星舰工程学', '270', '5');
INSERT INTO `datas_skill` VALUES ('11446', '引力子物理学', '270', '5');
INSERT INTO `datas_skill` VALUES ('11447', '激光物理学', '270', '5');
INSERT INTO `datas_skill` VALUES ('11448', '电磁物理学', '270', '5');
INSERT INTO `datas_skill` VALUES ('11449', '火箭科学', '270', '5');
INSERT INTO `datas_skill` VALUES ('11450', '盖伦特星舰工程学', '270', '5');
INSERT INTO `datas_skill` VALUES ('11451', '核芯物理学', '270', '5');
INSERT INTO `datas_skill` VALUES ('11452', '机械工程学', '270', '5');
INSERT INTO `datas_skill` VALUES ('11453', '电子工程学', '270', '5');
INSERT INTO `datas_skill` VALUES ('11454', '加达里星舰工程学', '270', '5');
INSERT INTO `datas_skill` VALUES ('11455', '量子物理学', '270', '5');
INSERT INTO `datas_skill` VALUES ('11487', '空间航行工程学', '270', '5');
INSERT INTO `datas_skill` VALUES ('11529', '分子工程学', '270', '5');
INSERT INTO `datas_skill` VALUES ('11566', '热能护盾补偿', '1209', '2');
INSERT INTO `datas_skill` VALUES ('11569', '装甲战专业研究', '258', '5');
INSERT INTO `datas_skill` VALUES ('11572', '游击战专业研究', '258', '5');
INSERT INTO `datas_skill` VALUES ('11574', '联队指挥学', '258', '8');
INSERT INTO `datas_skill` VALUES ('11579', '隐形理论', '272', '6');
INSERT INTO `datas_skill` VALUES ('11584', '空间定锚', '266', '3');
INSERT INTO `datas_skill` VALUES ('12092', '截击舰操作', '257', '4');
INSERT INTO `datas_skill` VALUES ('12093', '隐形特勤舰操作', '257', '4');
INSERT INTO `datas_skill` VALUES ('12095', '突击护卫舰操作', '257', '4');
INSERT INTO `datas_skill` VALUES ('12096', '后勤舰操作', '257', '6');
INSERT INTO `datas_skill` VALUES ('12098', '拦截舰操作', '257', '5');
INSERT INTO `datas_skill` VALUES ('12179', '研究工程管理学', '270', '8');
INSERT INTO `datas_skill` VALUES ('12180', '艾克诺处理技术', '1218', '4');
INSERT INTO `datas_skill` VALUES ('12181', '双多特处理技术', '1218', '4');
INSERT INTO `datas_skill` VALUES ('12182', '克洛基处理技术', '1218', '4');
INSERT INTO `datas_skill` VALUES ('12183', '黑赭石处理技术', '1218', '3');
INSERT INTO `datas_skill` VALUES ('12184', '片麻岩处理技术', '1218', '3');
INSERT INTO `datas_skill` VALUES ('12185', '同位原矿处理技术', '1218', '3');
INSERT INTO `datas_skill` VALUES ('12186', '希莫非特处理技术', '1218', '2');
INSERT INTO `datas_skill` VALUES ('12187', '杰斯贝矿处理技术', '1218', '2');
INSERT INTO `datas_skill` VALUES ('12188', '水硼砂处理技术', '1218', '2');
INSERT INTO `datas_skill` VALUES ('12189', '基腹断岩处理技术', '1218', '5');
INSERT INTO `datas_skill` VALUES ('12190', '奥贝尔石处理技术', '1218', '2');
INSERT INTO `datas_skill` VALUES ('12191', '斜长岩处理技术', '1218', '1');
INSERT INTO `datas_skill` VALUES ('12192', '干焦岩处理技术', '1218', '1');
INSERT INTO `datas_skill` VALUES ('12193', '灼烧岩处理技术', '1218', '1');
INSERT INTO `datas_skill` VALUES ('12194', '灰岩处理技术', '1218', '3');
INSERT INTO `datas_skill` VALUES ('12195', '凡晶石处理技术', '1218', '1');
INSERT INTO `datas_skill` VALUES ('12196', '碎铁处理技术', '1218', '5');
INSERT INTO `datas_skill` VALUES ('12201', '小型火炮专业研究', '255', '3');
INSERT INTO `datas_skill` VALUES ('12202', '中型火炮专业研究', '255', '5');
INSERT INTO `datas_skill` VALUES ('12203', '大型火炮专业研究', '255', '8');
INSERT INTO `datas_skill` VALUES ('12204', '中型集束激光专业研究', '255', '5');
INSERT INTO `datas_skill` VALUES ('12205', '大型集束激光专业研究', '255', '8');
INSERT INTO `datas_skill` VALUES ('12206', '中型磁轨炮专业研究', '255', '5');
INSERT INTO `datas_skill` VALUES ('12207', '大型磁轨炮专业研究', '255', '8');
INSERT INTO `datas_skill` VALUES ('12208', '中型自动加农炮专业研究', '255', '5');
INSERT INTO `datas_skill` VALUES ('12209', '大型自动加农炮专业研究', '255', '8');
INSERT INTO `datas_skill` VALUES ('12210', '小型疾速炮专业研究', '255', '3');
INSERT INTO `datas_skill` VALUES ('12211', '中型疾速炮专业研究', '255', '5');
INSERT INTO `datas_skill` VALUES ('12212', '大型疾速炮专业研究', '255', '8');
INSERT INTO `datas_skill` VALUES ('12213', '小型脉冲激光专业研究', '255', '3');
INSERT INTO `datas_skill` VALUES ('12214', '中型脉冲激光专业研究', '255', '5');
INSERT INTO `datas_skill` VALUES ('12215', '大型脉冲激光专业研究', '255', '8');
INSERT INTO `datas_skill` VALUES ('12241', '超大型军团管理培训', '266', '8');
INSERT INTO `datas_skill` VALUES ('12305', '无人机导航学', '273', '1');
INSERT INTO `datas_skill` VALUES ('12365', '电磁护盾补偿', '1209', '2');
INSERT INTO `datas_skill` VALUES ('12366', '动能护盾补偿', '1209', '2');
INSERT INTO `datas_skill` VALUES ('12367', '爆炸护盾补偿', '1209', '2');
INSERT INTO `datas_skill` VALUES ('12441', '导弹打击概论', '256', '2');
INSERT INTO `datas_skill` VALUES ('12442', '导弹动力学', '256', '4');
INSERT INTO `datas_skill` VALUES ('12484', '艾玛无人机专业研究', '273', '5');
INSERT INTO `datas_skill` VALUES ('12485', '米玛塔尔无人机专业研究', '273', '5');
INSERT INTO `datas_skill` VALUES ('12486', '盖伦特无人机专业研究', '273', '5');
INSERT INTO `datas_skill` VALUES ('12487', '加达里无人机专业研究', '273', '5');
INSERT INTO `datas_skill` VALUES ('13278', '考古学', '1217', '3');
INSERT INTO `datas_skill` VALUES ('13279', '遥测感应技术', '1241', '1');
INSERT INTO `datas_skill` VALUES ('16069', '远程装甲维修系统研究', '1210', '2');
INSERT INTO `datas_skill` VALUES ('16281', '冰矿采集理论', '1218', '1');
INSERT INTO `datas_skill` VALUES ('16591', '重型突击巡洋舰操作', '257', '6');
INSERT INTO `datas_skill` VALUES ('16594', '供给学', '274', '3');
INSERT INTO `datas_skill` VALUES ('16595', '投机技巧', '274', '1');
INSERT INTO `datas_skill` VALUES ('16596', '批发技巧', '274', '4');
INSERT INTO `datas_skill` VALUES ('16597', '风险投资技巧', '274', '3');
INSERT INTO `datas_skill` VALUES ('16598', '市场学', '274', '3');
INSERT INTO `datas_skill` VALUES ('16622', '会计学', '274', '3');
INSERT INTO `datas_skill` VALUES ('17940', '采矿驳船操作', '257', '4');
INSERT INTO `datas_skill` VALUES ('18025', '冰矿处理技术', '1218', '5');
INSERT INTO `datas_skill` VALUES ('18580', '商业巨头', '274', '6');
INSERT INTO `datas_skill` VALUES ('19719', '运输舰操作', '257', '6');
INSERT INTO `datas_skill` VALUES ('19759', '远距干扰学', '272', '4');
INSERT INTO `datas_skill` VALUES ('19760', '频率调制理论', '272', '3');
INSERT INTO `datas_skill` VALUES ('19761', '信号频散学', '272', '5');
INSERT INTO `datas_skill` VALUES ('19766', '信号压制原理', '272', '5');
INSERT INTO `datas_skill` VALUES ('19767', '炮塔反稳定对抗', '272', '5');
INSERT INTO `datas_skill` VALUES ('19921', '目标标记研究', '272', '3');
INSERT INTO `datas_skill` VALUES ('19922', '信号聚焦研究', '272', '5');
INSERT INTO `datas_skill` VALUES ('20209', '火箭专业研究', '256', '3');
INSERT INTO `datas_skill` VALUES ('20210', '轻型导弹专业研究', '256', '3');
INSERT INTO `datas_skill` VALUES ('20211', '重型导弹专业研究', '256', '5');
INSERT INTO `datas_skill` VALUES ('20212', '巡航导弹专业研究', '256', '8');
INSERT INTO `datas_skill` VALUES ('20213', '鱼雷专业研究', '256', '8');
INSERT INTO `datas_skill` VALUES ('20312', '制导导弹精确打击理论', '256', '5');
INSERT INTO `datas_skill` VALUES ('20314', '目标导航预测学', '256', '2');
INSERT INTO `datas_skill` VALUES ('20315', '战斗部升级研究', '256', '5');
INSERT INTO `datas_skill` VALUES ('20327', '旗舰级能量炮台研究', '255', '7');
INSERT INTO `datas_skill` VALUES ('20342', '高级飞船操控学', '257', '5');
INSERT INTO `datas_skill` VALUES ('20433', '塔洛迦技术研究', '270', '5');
INSERT INTO `datas_skill` VALUES ('20494', '装甲战理论', '258', '2');
INSERT INTO `datas_skill` VALUES ('20495', '信息战理论', '258', '2');
INSERT INTO `datas_skill` VALUES ('20524', '艾玛货舰操作', '257', '10');
INSERT INTO `datas_skill` VALUES ('20525', '艾玛无畏舰操作', '257', '12');
INSERT INTO `datas_skill` VALUES ('20526', '加达里货舰操作', '257', '10');
INSERT INTO `datas_skill` VALUES ('20527', '盖伦特货舰操作', '257', '10');
INSERT INTO `datas_skill` VALUES ('20528', '米玛塔尔货舰操作', '257', '10');
INSERT INTO `datas_skill` VALUES ('20530', '加达里无畏舰操作', '257', '12');
INSERT INTO `datas_skill` VALUES ('20531', '盖伦特无畏舰操作', '257', '12');
INSERT INTO `datas_skill` VALUES ('20532', '米玛塔尔无畏舰操作', '257', '12');
INSERT INTO `datas_skill` VALUES ('20533', '旗舰级舰船操作', '257', '14');
INSERT INTO `datas_skill` VALUES ('21059', '护盾补偿', '1209', '2');
INSERT INTO `datas_skill` VALUES ('21071', '导弹发射效率', '256', '2');
INSERT INTO `datas_skill` VALUES ('21603', '诱导力场理论', '275', '5');
INSERT INTO `datas_skill` VALUES ('21610', '跳跃引擎燃料节约技术', '275', '8');
INSERT INTO `datas_skill` VALUES ('21611', '跳跃引擎校对理论', '275', '9');
INSERT INTO `datas_skill` VALUES ('21666', '旗舰级混合炮台研究', '255', '7');
INSERT INTO `datas_skill` VALUES ('21667', '旗舰级射弹炮台研究', '255', '7');
INSERT INTO `datas_skill` VALUES ('21668', '堡垒级鱼雷理论', '256', '7');
INSERT INTO `datas_skill` VALUES ('21718', '电脑破译原理', '1217', '3');
INSERT INTO `datas_skill` VALUES ('21789', '冬眠者技术研究', '270', '5');
INSERT INTO `datas_skill` VALUES ('21790', '加达里加密技术原理', '270', '5');
INSERT INTO `datas_skill` VALUES ('21791', '米玛塔尔加密技术原理', '270', '5');
INSERT INTO `datas_skill` VALUES ('21802', '旗舰级护盾操作', '1209', '8');
INSERT INTO `datas_skill` VALUES ('21803', '旗舰维修系统研究', '1210', '8');
INSERT INTO `datas_skill` VALUES ('22043', '战术武器配置理论', '255', '8');
INSERT INTO `datas_skill` VALUES ('22242', '旗舰级船只建造研究', '268', '14');
INSERT INTO `datas_skill` VALUES ('22536', '开采先锋技术', '258', '2');
INSERT INTO `datas_skill` VALUES ('22551', '采掘者操作', '257', '5');
INSERT INTO `datas_skill` VALUES ('22552', '采矿管理技术', '258', '5');
INSERT INTO `datas_skill` VALUES ('22578', '矿冶提升理论', '1218', '4');
INSERT INTO `datas_skill` VALUES ('22761', '侦察舰操作', '257', '6');
INSERT INTO `datas_skill` VALUES ('22806', '电磁装甲补偿理论', '1210', '2');
INSERT INTO `datas_skill` VALUES ('22807', '爆炸装甲补偿理论', '1210', '2');
INSERT INTO `datas_skill` VALUES ('22808', '动能装甲补偿理论', '1210', '2');
INSERT INTO `datas_skill` VALUES ('22809', '热能装甲补偿理论', '1210', '2');
INSERT INTO `datas_skill` VALUES ('23069', '铁骑舰载机操控理论', '273', '12');
INSERT INTO `datas_skill` VALUES ('23087', '艾玛加密技术原理', '270', '5');
INSERT INTO `datas_skill` VALUES ('23121', '盖伦特加密技术原理', '270', '5');
INSERT INTO `datas_skill` VALUES ('23123', '塔克玛技术研究', '270', '5');
INSERT INTO `datas_skill` VALUES ('23124', '燕军技术研究', '270', '5');
INSERT INTO `datas_skill` VALUES ('23566', '电子战无人机控制学', '273', '5');
INSERT INTO `datas_skill` VALUES ('23594', '岗哨无人机操控理论', '273', '5');
INSERT INTO `datas_skill` VALUES ('23606', '无人机精准射击', '273', '1');
INSERT INTO `datas_skill` VALUES ('23618', '无人机效能研究', '273', '5');
INSERT INTO `datas_skill` VALUES ('23950', '指挥舰操作', '257', '8');
INSERT INTO `datas_skill` VALUES ('24241', '无人机战斗操控', '273', '2');
INSERT INTO `datas_skill` VALUES ('24242', '坚韧心理学', '1220', '1');
INSERT INTO `datas_skill` VALUES ('24268', '供给链管理', '268', '3');
INSERT INTO `datas_skill` VALUES ('24270', '科学网络学', '270', '3');
INSERT INTO `datas_skill` VALUES ('24311', '艾玛航空母舰操作', '257', '14');
INSERT INTO `datas_skill` VALUES ('24312', '加达里航空母舰操作', '257', '14');
INSERT INTO `datas_skill` VALUES ('24313', '盖伦特航空母舰操作', '257', '14');
INSERT INTO `datas_skill` VALUES ('24314', '米玛塔尔航空母舰操作', '257', '14');
INSERT INTO `datas_skill` VALUES ('24562', '跳跃通道发生学', '275', '14');
INSERT INTO `datas_skill` VALUES ('24563', '末日武器操作技术', '255', '14');
INSERT INTO `datas_skill` VALUES ('24568', '旗舰级远程装甲修理技术', '1210', '10');
INSERT INTO `datas_skill` VALUES ('24571', '旗舰级护盾频散系统', '1209', '10');
INSERT INTO `datas_skill` VALUES ('24572', '旗舰级电容散发系统研究', '1216', '10');
INSERT INTO `datas_skill` VALUES ('24606', '克隆设施运作技术', '1220', '10');
INSERT INTO `datas_skill` VALUES ('24613', '高级无人机接口技术', '273', '8');
INSERT INTO `datas_skill` VALUES ('24624', '高级实验室运作理论', '270', '8');
INSERT INTO `datas_skill` VALUES ('24625', '高级量产技术', '268', '8');
INSERT INTO `datas_skill` VALUES ('24764', '舰队指挥学', '258', '12');
INSERT INTO `datas_skill` VALUES ('25233', '军团合同规则', '274', '3');
INSERT INTO `datas_skill` VALUES ('25235', '合同规则', '274', '1');
INSERT INTO `datas_skill` VALUES ('25530', '神经毒化抵抗理论', '1220', '5');
INSERT INTO `datas_skill` VALUES ('25538', '神经毒化控制理论', '1220', '2');
INSERT INTO `datas_skill` VALUES ('25544', '气云采集理论', '1218', '1');
INSERT INTO `datas_skill` VALUES ('25718', '重型攻击导弹专业研究', '256', '5');
INSERT INTO `datas_skill` VALUES ('25719', '重型攻击导弹概论', '256', '3');
INSERT INTO `datas_skill` VALUES ('25739', '天文测距学', '1217', '8');
INSERT INTO `datas_skill` VALUES ('25810', '定点测量学', '1217', '5');
INSERT INTO `datas_skill` VALUES ('25811', '天文探测学', '1217', '5');
INSERT INTO `datas_skill` VALUES ('25863', '打捞回收技术', '1218', '3');
INSERT INTO `datas_skill` VALUES ('26224', '药品制备', '268', '2');
INSERT INTO `datas_skill` VALUES ('26252', '构件改装技术', '269', '2');
INSERT INTO `datas_skill` VALUES ('26253', '装甲改装技术', '269', '3');
INSERT INTO `datas_skill` VALUES ('26254', '空间航行改装技术', '269', '3');
INSERT INTO `datas_skill` VALUES ('26255', '无人机改装技术', '269', '3');
INSERT INTO `datas_skill` VALUES ('26256', '电子优势改装技术', '269', '3');
INSERT INTO `datas_skill` VALUES ('26257', '射弹武器改装技术', '269', '3');
INSERT INTO `datas_skill` VALUES ('26258', '能量武器改装技术', '269', '3');
INSERT INTO `datas_skill` VALUES ('26259', '混合武器改装技术', '269', '3');
INSERT INTO `datas_skill` VALUES ('26260', '发射器改装技术', '269', '3');
INSERT INTO `datas_skill` VALUES ('26261', '护盾改造技术', '269', '3');
INSERT INTO `datas_skill` VALUES ('27902', '远程船体维修系统研究', '1210', '2');
INSERT INTO `datas_skill` VALUES ('27906', '战术后勤控制理论', '272', '8');
INSERT INTO `datas_skill` VALUES ('27911', '投射型ECM理论', '272', '8');
INSERT INTO `datas_skill` VALUES ('27936', '旗舰级远程船体修理技术', '1210', '10');
INSERT INTO `datas_skill` VALUES ('28073', '炸弹部署理论', '256', '4');
INSERT INTO `datas_skill` VALUES ('28164', '热力学', '1216', '3');
INSERT INTO `datas_skill` VALUES ('28374', '旗舰级工业舰操作', '257', '12');
INSERT INTO `datas_skill` VALUES ('28585', '工业配置技术', '1218', '8');
INSERT INTO `datas_skill` VALUES ('28609', '重型拦截巡洋舰操作', '257', '6');
INSERT INTO `datas_skill` VALUES ('28615', '电子攻击舰操作', '257', '4');
INSERT INTO `datas_skill` VALUES ('28656', '黑隐特勤舰操作', '257', '10');
INSERT INTO `datas_skill` VALUES ('28667', '掠夺舰操作', '257', '10');
INSERT INTO `datas_skill` VALUES ('28879', '纳米体操作技术', '1216', '2');
INSERT INTO `datas_skill` VALUES ('28880', '纳米体控制技术', '1216', '3');
INSERT INTO `datas_skill` VALUES ('29029', '战略货舰操作', '257', '14');
INSERT INTO `datas_skill` VALUES ('29637', '工业指挥舰操作', '257', '8');
INSERT INTO `datas_skill` VALUES ('30324', '防御子系统技术', '270', '5');
INSERT INTO `datas_skill` VALUES ('30325', '工程子系统技术', '270', '5');
INSERT INTO `datas_skill` VALUES ('30326', '电子子系统技术', '270', '5');
INSERT INTO `datas_skill` VALUES ('30327', '攻击子系统技术', '270', '5');
INSERT INTO `datas_skill` VALUES ('30532', '艾玛防御子系统', '1240', '1');
INSERT INTO `datas_skill` VALUES ('30536', '艾玛电子子系统', '1240', '1');
INSERT INTO `datas_skill` VALUES ('30537', '艾玛攻击子系统', '1240', '1');
INSERT INTO `datas_skill` VALUES ('30538', '艾玛推进子系统', '1240', '1');
INSERT INTO `datas_skill` VALUES ('30539', '艾玛工程子系统', '1240', '1');
INSERT INTO `datas_skill` VALUES ('30540', '盖伦特防御子系统', '1240', '1');
INSERT INTO `datas_skill` VALUES ('30541', '盖伦特电子子系统', '1240', '1');
INSERT INTO `datas_skill` VALUES ('30542', '加达里电子子系统', '1240', '1');
INSERT INTO `datas_skill` VALUES ('30543', '米玛塔尔电子子系统', '1240', '1');
INSERT INTO `datas_skill` VALUES ('30544', '加达里防御子系统', '1240', '1');
INSERT INTO `datas_skill` VALUES ('30545', '米玛塔尔防御子系统', '1240', '1');
INSERT INTO `datas_skill` VALUES ('30546', '盖伦特工程子系统', '1240', '1');
INSERT INTO `datas_skill` VALUES ('30547', '米玛塔尔工程子系统', '1240', '1');
INSERT INTO `datas_skill` VALUES ('30548', '加达里工程子系统', '1240', '1');
INSERT INTO `datas_skill` VALUES ('30549', '加达里攻击子系统', '1240', '1');
INSERT INTO `datas_skill` VALUES ('30550', '盖伦特攻击子系统', '1240', '1');
INSERT INTO `datas_skill` VALUES ('30551', '米玛塔尔攻击子系统', '1240', '1');
INSERT INTO `datas_skill` VALUES ('30552', '加达里推进子系统', '1240', '1');
INSERT INTO `datas_skill` VALUES ('30553', '盖伦特推进子系统', '1240', '1');
INSERT INTO `datas_skill` VALUES ('30554', '米玛塔尔推进子系统', '1240', '1');
INSERT INTO `datas_skill` VALUES ('30650', '艾玛战略巡洋舰操作', '257', '5');
INSERT INTO `datas_skill` VALUES ('30651', '加达里战略巡洋舰操作', '257', '5');
INSERT INTO `datas_skill` VALUES ('30652', '盖伦特战略巡洋舰操作', '257', '5');
INSERT INTO `datas_skill` VALUES ('30653', '米玛塔尔战略巡洋舰操作', '257', '5');
INSERT INTO `datas_skill` VALUES ('30788', '推进子系统技术', '270', '5');
INSERT INTO `datas_skill` VALUES ('32339', '铁骑轰炸机控制学', '273', '12');
INSERT INTO `datas_skill` VALUES ('32435', '堡垒级巡航导弹理论', '256', '7');
INSERT INTO `datas_skill` VALUES ('32797', '装甲抗性定相理论', '1210', '3');
INSERT INTO `datas_skill` VALUES ('32918', '采矿护卫舰操作', '257', '2');
INSERT INTO `datas_skill` VALUES ('32999', '磁力感应器补偿', '1213', '2');
INSERT INTO `datas_skill` VALUES ('33000', '引力感应器补偿', '1213', '2');
INSERT INTO `datas_skill` VALUES ('33001', '光雷达感应器补偿', '1213', '2');
INSERT INTO `datas_skill` VALUES ('33002', '雷达感应器补偿', '1213', '2');
INSERT INTO `datas_skill` VALUES ('33078', '装甲覆层理论', '1210', '3');
INSERT INTO `datas_skill` VALUES ('33091', '艾玛驱逐舰操作', '257', '2');
INSERT INTO `datas_skill` VALUES ('33092', '加达里驱逐舰操作', '257', '2');
INSERT INTO `datas_skill` VALUES ('33093', '盖伦特驱逐舰操作', '257', '2');
INSERT INTO `datas_skill` VALUES ('33094', '米玛塔尔驱逐舰操作', '257', '2');
INSERT INTO `datas_skill` VALUES ('33095', '艾玛战列巡洋舰操作', '257', '6');
INSERT INTO `datas_skill` VALUES ('33096', '加达里战列巡洋舰操作', '257', '6');
INSERT INTO `datas_skill` VALUES ('33097', '盖伦特战列巡洋舰操作', '257', '6');
INSERT INTO `datas_skill` VALUES ('33098', '米玛塔尔战列巡洋舰操作', '257', '6');
INSERT INTO `datas_skill` VALUES ('33399', '神经同步学', '1220', '2');
INSERT INTO `datas_skill` VALUES ('33407', '高级坚韧心理学', '1220', '5');
INSERT INTO `datas_skill` VALUES ('33467', '海关操作专业理论', '274', '2');

-- ----------------------------
-- Table structure for datas_skillgroup
-- ----------------------------
DROP TABLE IF EXISTS `datas_skillgroup`;
CREATE TABLE `datas_skillgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1242 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of datas_skillgroup
-- ----------------------------
INSERT INTO `datas_skillgroup` VALUES ('255', '射击学');
INSERT INTO `datas_skillgroup` VALUES ('256', '导弹');
INSERT INTO `datas_skillgroup` VALUES ('257', '飞船操控学');
INSERT INTO `datas_skillgroup` VALUES ('258', '领导学');
INSERT INTO `datas_skillgroup` VALUES ('266', '军团管理');
INSERT INTO `datas_skillgroup` VALUES ('268', '生产');
INSERT INTO `datas_skillgroup` VALUES ('269', '改装件');
INSERT INTO `datas_skillgroup` VALUES ('270', '科学');
INSERT INTO `datas_skillgroup` VALUES ('272', '电子系统');
INSERT INTO `datas_skillgroup` VALUES ('273', '无人机');
INSERT INTO `datas_skillgroup` VALUES ('274', '贸易学');
INSERT INTO `datas_skillgroup` VALUES ('275', '导航学');
INSERT INTO `datas_skillgroup` VALUES ('278', '社会学');
INSERT INTO `datas_skillgroup` VALUES ('1209', '护盾');
INSERT INTO `datas_skillgroup` VALUES ('1210', '装甲');
INSERT INTO `datas_skillgroup` VALUES ('1213', '锁定系统');
INSERT INTO `datas_skillgroup` VALUES ('1216', '工程学');
INSERT INTO `datas_skillgroup` VALUES ('1217', '扫描');
INSERT INTO `datas_skillgroup` VALUES ('1218', '资源处理');
INSERT INTO `datas_skillgroup` VALUES ('1220', '神经增强');
INSERT INTO `datas_skillgroup` VALUES ('1240', '子系统');
INSERT INTO `datas_skillgroup` VALUES ('1241', '行星管理');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_403f60f` (`user_id`),
  KEY `django_admin_log_1bb8f392` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_288599e6` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c8665aa` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'permission', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('2', 'group', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('3', 'user', 'auth', 'user');
INSERT INTO `django_content_type` VALUES ('4', 'content type', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('5', 'session', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('6', 'site', 'sites', 'site');
INSERT INTO `django_content_type` VALUES ('7', 'log entry', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('8', 'skill group', 'datas', 'skillgroup');
INSERT INTO `django_content_type` VALUES ('9', 'skill', 'datas', 'skill');
INSERT INTO `django_content_type` VALUES ('10', '账号', 'datas', 'account');
INSERT INTO `django_content_type` VALUES ('11', '角色', 'datas', 'character');
INSERT INTO `django_content_type` VALUES ('12', '角色技能', 'datas', 'character_skills');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_3da3d3d8` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------

-- ----------------------------
-- Table structure for django_site
-- ----------------------------
DROP TABLE IF EXISTS `django_site`;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_site
-- ----------------------------
INSERT INTO `django_site` VALUES ('1', 'example.com', 'example.com');

-- ----------------------------
-- Table structure for datas_implant
-- ----------------------------
DROP TABLE IF EXISTS `datas_implant`;
CREATE TABLE `datas_implant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `implant_name` varchar(100) NOT NULL,
  `languageID` varchar(100) NOT NULL,
  `implant_type` smallint(6) NOT NULL,
  `implant_value` smallint(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of datas_implant
-- ----------------------------
INSERT INTO datas_implant (implant_name, languageID, implant_type, implant_value) VALUES 
 ('初级视觉滤镜', 'ZH', '1', '1')
,('初级视觉滤镜—加强版', 'ZH', '1', '2')
,('视觉滤镜—基础级', 'ZH', '1', '3')
,('视觉滤镜—标准级', 'ZH', '1', '4')
,('视觉滤镜—强化级', 'ZH', '1', '5')
,('视觉滤镜—高级', 'ZH', '1', '6')
,('视觉滤镜—精英级', 'ZH', '1', '7')
,('初级记忆增强体', 'ZH', '2', '1')
,('初级记忆增强体—加强版', 'ZH', '2', '2')
,('记忆增强体—基础级', 'ZH', '2', '3')
,('记忆增强体—标准级', 'ZH', '2', '4')
,('记忆增强体—强化级', 'ZH', '2', '5')
,('记忆强植体—高级', 'ZH', '2', '6')
,('记忆增强体—精英级', 'ZH', '2', '7')
,('初级神经增效体', 'ZH', '3', '1')
,('初级神经增效体—加强版', 'ZH', '3', '2')
,('神经增效体—基础级', 'ZH', '3', '3')
,('神经增效体—标准级', 'ZH', '3', '4')
,('神经增效体—强化级', 'ZH', '3', '5')
,('神经增效体—高级', 'ZH', '3', '6')
,('神经增效体—精英级', 'ZH', '3', '7')
,('初级脑控次处理器', 'ZH', '4', '1')
,('初级脑控次处理器—加强版', 'ZH', '4', '2')
,('脑控次处理器—基础级', 'ZH', '4', '3')
,('脑控次处理器—标准级', 'ZH', '4', '4')
,('脑控次处理器—强化级', 'ZH', '4', '5')
,('脑控次处理器—高级', 'ZH', '4', '6')
,('脑控次处理器—精英级', 'ZH', '4', '7')
,('初级社交适应芯片', 'ZH', '5', '1')
,('初级社交适应芯片—加强版', 'ZH', '5', '2')
,('社交适应芯片—基础级', 'ZH', '5', '3')
,('社交适应芯片—标准级', 'ZH', '5', '4')
,('社交适应芯片—强化级', 'ZH', '5', '5')
,('社交适应芯片—高级', 'ZH', '5', '6')
,('Limited Ocular Filter', 'EN-US', '1', '1')
,('Limited Ocular Filter - Beta', 'EN-US', '1', '2')
,('Ocular Filter - Basic', 'EN-US', '1', '3')
,('Ocular Filter - Standard', 'EN-US', '1', '4')
,('Ocular Filter - Improved', 'EN-US', '1', '5')
,('Ocular Filter - Advanced', 'EN-US', '1', '6')
,('Ocular Filter - Elite', 'EN-US', '1', '7')
,('Limited Memory Augmentation', 'EN-US', '2', '1')
,('Limited Memory Augmentation - Beta', 'EN-US', '2', '2')
,('Memory Augmentation - Basic', 'EN-US', '2', '3')
,('Memory Augmentation - Standard', 'EN-US', '2', '4')
,('Memory Augmentation - Improved', 'EN-US', '2', '5')
,('Memory Augmentation - Advanced', 'EN-US', '2', '6')
,('Memory Augmentation - Elite', 'EN-US', '2', '7')
,('Limited Neural Boost', 'EN-US', '3', '1')
,('Limited Neural Boost - Beta', 'EN-US', '3', '2')
,('Neural Boost - Basic', 'EN-US', '3', '3')
,('Neural Boost - Standard', 'EN-US', '3', '4')
,('Neural Boost - Improved', 'EN-US', '3', '5')
,('Neural Boost - Advanced', 'EN-US', '3', '6')
,('Neural Boost - Elite', 'EN-US', '3', '7')
,('Limited Cybernetic Subprocessor', 'EN-US', '4', '1')
,('Limited Cybernetic Subprocessor - Beta', 'EN-US', '4', '2')
,('Cybernetic Subprocessor - Basic', 'EN-US', '4', '3')
,('Cybernetic Subprocessor - Standard', 'EN-US', '4', '4')
,('Cybernetic Subprocessor - Improved', 'EN-US', '4', '5')
,('Cybernetic Subprocessor - Advanced', 'EN-US', '4', '6')
,('Cybernetic Subprocessor - Elite', 'EN-US', '4', '7')
,('Limited Social Adaptation Chip', 'EN-US', '5', '1')
,('Limited Social Adaptation Chip - Beta', 'EN-US', '5', '2')
,('Social Adaptation Chip - Basic', 'EN-US', '5', '3')
,('Social Adaptation Chip - Standard', 'EN-US', '5', '4')
,('Social Adaptation Chip - Improved', 'EN-US', '5', '5')
,('Social Adaptation Chip - Advanced', 'EN-US', '5', '6');

