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
-- Table structure for datas_skillgroup
-- ----------------------------
DROP TABLE IF EXISTS `datas_skillgroup`;
CREATE TABLE `datas_skillgroup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1242 DEFAULT CHARSET=utf8;

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
-- Table structure for datas_implant
-- ----------------------------
DROP TABLE IF EXISTS `datas_implant`;
CREATE TABLE `datas_implant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `implant_name` varchar(100) NOT NULL,
  `languageID` varchar(100) NOT NULL,
  `implant_type` smallint(6) NOT NULL,
  `implant_value` smallint(6) NOT NULL,
  `type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

