/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100136
 Source Host           : localhost:3306
 Source Schema         : loonflownew

 Target Server Type    : MySQL
 Target Server Version : 100136
 File Encoding         : 65001

 Date: 10/12/2019 13:04:37
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_apptoken
-- ----------------------------
DROP TABLE IF EXISTS `account_apptoken`;
CREATE TABLE `account_apptoken`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `workflow_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ticket_sn_prefix` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of account_apptoken
-- ----------------------------
INSERT INTO `account_apptoken` VALUES (1, 'ops', '8cd585da-3cc6-11e8-9946-784f437daad6', 'admin', '2018-04-10 21:53:29.879742', '2019-11-17 21:45:12.404485', 0, '1,2,3', 'loonflow');

-- ----------------------------
-- Table structure for account_loondept
-- ----------------------------
DROP TABLE IF EXISTS `account_loondept`;
CREATE TABLE `account_loondept`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent_dept_id` int(11) NOT NULL,
  `leader` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `approver` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of account_loondept
-- ----------------------------
INSERT INTO `account_loondept` VALUES (1, '总部', 0, 'admin', '', '', 'admin', '2018-04-10 16:41:27.370288', '2018-05-09 07:03:50.473161', 0);
INSERT INTO `account_loondept` VALUES (2, '技术部', 1, 'lilei', '', '', 'admin', '2018-04-14 23:37:06.988349', '2018-05-09 06:45:27.315309', 0);
INSERT INTO `account_loondept` VALUES (3, '运维部', 2, 'guiji', '', '', 'admin', '2018-04-14 23:37:23.932202', '2018-05-09 07:03:32.427484', 0);
INSERT INTO `account_loondept` VALUES (4, '支付部', 2, 'scm', 'scm,lisi', '', 'admin', '2018-04-14 23:37:36.703706', '2018-05-09 07:04:53.360398', 0);
INSERT INTO `account_loondept` VALUES (5, '人事部', 1, 'jack', '', '', 'admin', '2018-05-09 07:22:09.520164', '2018-05-09 07:22:09.520195', 0);
INSERT INTO `account_loondept` VALUES (6, '审核部', 0, 'SH_TL', 'SH_A,SH_B', '', 'admin', '2019-12-06 16:07:19.111549', '2019-12-06 16:07:19.111549', 0);
INSERT INTO `account_loondept` VALUES (7, '维护部', 0, 'WH_TL', 'WH_A,WH_B', '', 'admin', '2019-12-06 16:07:44.761548', '2019-12-06 16:07:44.762555', 0);

-- ----------------------------
-- Table structure for account_loonrole
-- ----------------------------
DROP TABLE IF EXISTS `account_loonrole`;
CREATE TABLE `account_loonrole`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of account_loonrole
-- ----------------------------
INSERT INTO `account_loonrole` VALUES (1, 'VPN管理员', '处理VPN申请工单的人员', '', 'admin', '2018-05-09 07:06:02.739092', '2018-05-09 07:06:02.739132', 0);
INSERT INTO `account_loonrole` VALUES (2, '维护人', '维护各种指标', '{}', 'admin', '2019-12-06 16:06:20.360239', '2019-12-06 16:06:20.361224', 0);
INSERT INTO `account_loonrole` VALUES (3, '审核人', '审核各种指标', '{}', 'admin', '2019-12-06 16:06:29.657226', '2019-12-06 16:06:29.659228', 0);

-- ----------------------------
-- Table structure for account_loonuser
-- ----------------------------
DROP TABLE IF EXISTS `account_loonuser`;
CREATE TABLE `account_loonuser`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alias` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `dept_id` int(11) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of account_loonuser
-- ----------------------------
INSERT INTO `account_loonuser` VALUES (1, 'pbkdf2_sha256$100000$J39Pcos0NVm5$ADypfYGvdGLCd6tYKLGpT4ZEb3eWeQQRIYDlb1yvXu4=', '2019-12-06 16:48:06.051932', 'admin', '超级管理员', '2020956572@qq.com', '13888888888', 1, 1, 1, 'admin', '2019-12-04 15:22:06.595874', '2019-12-04 15:22:06.627874', 0);
INSERT INTO `account_loonuser` VALUES (2, '12222222', NULL, 'guiji', '轨迹', 'guiji@163.com', '13888888888', 3, 1, 0, 'admin', '2018-04-14 23:38:18.390197', '2018-05-09 07:00:34.120672', 0);
INSERT INTO `account_loonuser` VALUES (3, '12222222', NULL, 'lilei', '李磊', 'lilei@163.com', '13888888888', 2, 1, 0, 'admin', '2018-04-14 23:42:25.708830', '2018-05-09 07:00:27.999012', 0);
INSERT INTO `account_loonuser` VALUES (4, '12222222', NULL, 'zhangsan', '张三', 'zhangsan@163.com', '13888888888', 4, 1, 0, 'admin', '2018-05-05 22:54:48.910667', '2018-05-09 07:02:27.252209', 0);
INSERT INTO `account_loonuser` VALUES (5, 'pbkdf2_sha256$100000$zGXANjruyXdu$SqwI+v31Cfh8/dtc9Ah4vlCwPYqv2OHEUGxSkrC9HME=', NULL, 'lisi', '李四', 'lisi@163.com', '13888888888', 2, 1, 0, 'admin', '2018-05-09 06:58:59.733893', '2018-05-09 07:02:52.073569', 0);
INSERT INTO `account_loonuser` VALUES (6, 'pbkdf2_sha256$100000$h2IARMdK6uA8$sn4S1ZVqqbVl4ON5M2ZWngX8uZXsw2N/JYNZstMPL54=', NULL, 'wangwu', '王五', 'wangwu@163.com', '13888888888', 3, 1, 0, 'admin', '2018-05-09 07:01:50.403604', '2018-05-09 07:03:03.185105', 0);
INSERT INTO `account_loonuser` VALUES (7, 'pbkdf2_sha256$100000$qbrmZkc8i9x2$/T3sLArvEccA7gGVytuh7qnu0AnhiDWiXI+XXz66auo=', NULL, 'jack', '杰克', 'jack@163.com', '13888888888', 5, 1, 0, 'admin', '2018-05-09 07:22:53.491321', '2018-05-09 07:22:53.491356', 0);
INSERT INTO `account_loonuser` VALUES (8, '12222222', NULL, 'webb', '王先生', 'webb@youshutong.com', '13888888888', 4, 1, 0, 'admin', '0000-00-00 00:00:00.000000', '0000-00-00 00:00:00.000000', 0);
INSERT INTO `account_loonuser` VALUES (9, 'fangyuan1230', NULL, 'WH_A', '维护人路人A', '2020956572@qq.com', '', 7, 1, 0, 'admin', '2019-12-06 16:03:54.191078', '2019-12-06 16:03:54.191078', 0);
INSERT INTO `account_loonuser` VALUES (10, 'fangyuan1230', NULL, 'WH_B', '维护人路人B', '2020956572@qq.com', '', 7, 1, 0, 'admin', '2019-12-06 16:04:45.600691', '2019-12-06 16:04:45.601690', 0);
INSERT INTO `account_loonuser` VALUES (11, 'fangyuan1230', NULL, 'WH_TL', '维护人老大', '2020956572@qq.com', '', 7, 1, 0, 'admin', '2019-12-06 16:04:54.612690', '2019-12-06 16:04:54.613692', 0);
INSERT INTO `account_loonuser` VALUES (12, 'fangyuan1230', NULL, 'SH_TL', '审核人老大', '2020956572@qq.com', '', 6, 1, 0, 'admin', '2019-12-06 16:05:04.140691', '2019-12-06 16:05:04.140691', 0);
INSERT INTO `account_loonuser` VALUES (13, 'fangyuan1230', NULL, 'SH_A', '审核人路人A', '2020956572@qq.com', '', 6, 1, 0, 'admin', '2019-12-06 16:05:09.060686', '2019-12-06 16:05:09.061688', 0);
INSERT INTO `account_loonuser` VALUES (14, 'fangyuan1230', NULL, 'SH_B', '审核人路人B', '2020956572@qq.com', '', 6, 1, 0, 'admin', '2019-12-06 16:05:13.263690', '2019-12-06 16:05:13.265686', 0);

-- ----------------------------
-- Table structure for account_loonuserrole
-- ----------------------------
DROP TABLE IF EXISTS `account_loonuserrole`;
CREATE TABLE `account_loonuserrole`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of account_loonuserrole
-- ----------------------------
INSERT INTO `account_loonuserrole` VALUES (1, 2, 1, 'admin', '2018-05-09 07:05:32.301883', '2018-05-09 07:05:32.301929', 0);
INSERT INTO `account_loonuserrole` VALUES (2, 9, 2, 'admin', '2019-12-06 16:08:18.185633', '2019-12-06 16:08:18.185633', 0);
INSERT INTO `account_loonuserrole` VALUES (3, 10, 2, 'admin', '2019-12-06 16:08:22.359631', '2019-12-06 16:08:22.359631', 0);
INSERT INTO `account_loonuserrole` VALUES (4, 11, 2, 'admin', '2019-12-06 16:08:25.016155', '2019-12-06 16:08:25.017154', 0);
INSERT INTO `account_loonuserrole` VALUES (5, 12, 3, 'admin', '2019-12-06 16:08:36.857689', '2019-12-06 16:08:36.860691', 0);
INSERT INTO `account_loonuserrole` VALUES (6, 13, 3, 'admin', '2019-12-06 16:08:39.544688', '2019-12-06 16:08:39.544688', 0);
INSERT INTO `account_loonuserrole` VALUES (7, 14, 3, 'admin', '2019-12-06 16:08:41.871690', '2019-12-06 16:08:41.872689', 0);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add group', 2, 'add_group');
INSERT INTO `auth_permission` VALUES (5, 'Can change group', 2, 'change_group');
INSERT INTO `auth_permission` VALUES (6, 'Can delete group', 2, 'delete_group');
INSERT INTO `auth_permission` VALUES (7, 'Can add permission', 3, 'add_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can change permission', 3, 'change_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can delete permission', 3, 'delete_permission');
INSERT INTO `auth_permission` VALUES (10, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (11, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (12, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (13, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (14, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (15, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (16, 'Can add 用户角色', 6, 'add_loonuserrole');
INSERT INTO `auth_permission` VALUES (17, 'Can change 用户角色', 6, 'change_loonuserrole');
INSERT INTO `auth_permission` VALUES (18, 'Can delete 用户角色', 6, 'delete_loonuserrole');
INSERT INTO `auth_permission` VALUES (19, 'Can add 角色', 7, 'add_loonrole');
INSERT INTO `auth_permission` VALUES (20, 'Can change 角色', 7, 'change_loonrole');
INSERT INTO `auth_permission` VALUES (21, 'Can delete 角色', 7, 'delete_loonrole');
INSERT INTO `auth_permission` VALUES (22, 'Can add 部门', 8, 'add_loondept');
INSERT INTO `auth_permission` VALUES (23, 'Can change 部门', 8, 'change_loondept');
INSERT INTO `auth_permission` VALUES (24, 'Can delete 部门', 8, 'delete_loondept');
INSERT INTO `auth_permission` VALUES (25, 'Can add 用户', 9, 'add_loonuser');
INSERT INTO `auth_permission` VALUES (26, 'Can change 用户', 9, 'change_loonuser');
INSERT INTO `auth_permission` VALUES (27, 'Can delete 用户', 9, 'delete_loonuser');
INSERT INTO `auth_permission` VALUES (28, 'Can add ticket record', 10, 'add_ticketrecord');
INSERT INTO `auth_permission` VALUES (29, 'Can change ticket record', 10, 'change_ticketrecord');
INSERT INTO `auth_permission` VALUES (30, 'Can delete ticket record', 10, 'delete_ticketrecord');
INSERT INTO `auth_permission` VALUES (31, 'Can add ticket state last man', 11, 'add_ticketstatelastman');
INSERT INTO `auth_permission` VALUES (32, 'Can change ticket state last man', 11, 'change_ticketstatelastman');
INSERT INTO `auth_permission` VALUES (33, 'Can delete ticket state last man', 11, 'delete_ticketstatelastman');
INSERT INTO `auth_permission` VALUES (34, 'Can add ticket custom field', 12, 'add_ticketcustomfield');
INSERT INTO `auth_permission` VALUES (35, 'Can change ticket custom field', 12, 'change_ticketcustomfield');
INSERT INTO `auth_permission` VALUES (36, 'Can delete ticket custom field', 12, 'delete_ticketcustomfield');
INSERT INTO `auth_permission` VALUES (37, 'Can add ticket flow log', 13, 'add_ticketflowlog');
INSERT INTO `auth_permission` VALUES (38, 'Can change ticket flow log', 13, 'change_ticketflowlog');
INSERT INTO `auth_permission` VALUES (39, 'Can delete ticket flow log', 13, 'delete_ticketflowlog');
INSERT INTO `auth_permission` VALUES (40, 'Can add custom notice', 14, 'add_customnotice');
INSERT INTO `auth_permission` VALUES (41, 'Can change custom notice', 14, 'change_customnotice');
INSERT INTO `auth_permission` VALUES (42, 'Can delete custom notice', 14, 'delete_customnotice');
INSERT INTO `auth_permission` VALUES (43, 'Can add workflow script', 15, 'add_workflowscript');
INSERT INTO `auth_permission` VALUES (44, 'Can change workflow script', 15, 'change_workflowscript');
INSERT INTO `auth_permission` VALUES (45, 'Can delete workflow script', 15, 'delete_workflowscript');
INSERT INTO `auth_permission` VALUES (46, 'Can add custom field', 16, 'add_customfield');
INSERT INTO `auth_permission` VALUES (47, 'Can change custom field', 16, 'change_customfield');
INSERT INTO `auth_permission` VALUES (48, 'Can delete custom field', 16, 'delete_customfield');
INSERT INTO `auth_permission` VALUES (49, 'Can add state', 17, 'add_state');
INSERT INTO `auth_permission` VALUES (50, 'Can change state', 17, 'change_state');
INSERT INTO `auth_permission` VALUES (51, 'Can delete state', 17, 'delete_state');
INSERT INTO `auth_permission` VALUES (52, 'Can add workflow', 18, 'add_workflow');
INSERT INTO `auth_permission` VALUES (53, 'Can change workflow', 18, 'change_workflow');
INSERT INTO `auth_permission` VALUES (54, 'Can delete workflow', 18, 'delete_workflow');
INSERT INTO `auth_permission` VALUES (55, 'Can add transition', 19, 'add_transition');
INSERT INTO `auth_permission` VALUES (56, 'Can change transition', 19, 'change_transition');
INSERT INTO `auth_permission` VALUES (57, 'Can delete transition', 19, 'delete_transition');
INSERT INTO `auth_permission` VALUES (58, 'Can add 调用token', 20, 'add_apptoken');
INSERT INTO `auth_permission` VALUES (59, 'Can change 调用token', 20, 'change_apptoken');
INSERT INTO `auth_permission` VALUES (60, 'Can delete 调用token', 20, 'delete_apptoken');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_account_loonuser_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_loonuser_id` FOREIGN KEY (`user_id`) REFERENCES `account_loonuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 294 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2018-04-10 16:41:27.371448', '1', 'LoonDept object (1)', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (2, '2018-04-10 16:43:20.412821', '1', 'TicketRecord object (1)', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (3, '2018-04-10 16:48:43.820666', '2', 'TicketRecord object (2)', 1, '[{\"added\": {}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (4, '2018-04-10 17:22:45.041511', '1', 'TicketCustomField object (1)', 1, '[{\"added\": {}}]', 12, 1);
INSERT INTO `django_admin_log` VALUES (5, '2018-04-10 17:39:33.646162', '1', 'TicketFlowLog object (1)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (6, '2018-04-10 21:53:29.880887', '1', 'AppToken object (1)', 1, '[{\"added\": {}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (7, '2018-04-14 23:37:06.997088', '2', 'LoonDept object (2)', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (8, '2018-04-14 23:37:23.932965', '3', 'LoonDept object (3)', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (9, '2018-04-14 23:37:36.704502', '4', 'LoonDept object (4)', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (10, '2018-04-14 23:38:18.392472', '2', 'guiji', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (11, '2018-04-14 23:42:25.710130', '3', 'hah', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (12, '2018-04-23 20:49:32.232372', '1', 'Workflow object (1)', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (13, '2018-04-23 20:53:33.056648', '1', 'State object (1)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (14, '2018-04-23 20:56:25.945319', '1', 'CustomField object (1)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (15, '2018-04-23 20:56:49.875057', '1', 'State object (1)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (16, '2018-04-24 06:57:24.740151', '1', 'Workflow object (1)', 2, '[{\"changed\": {\"fields\": [\"display_form_str\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (17, '2018-04-24 06:58:45.040694', '1', 'Workflow object (1)', 2, '[{\"changed\": {\"fields\": [\"display_form_str\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (18, '2018-04-24 07:09:25.924775', '1', 'Transition object (1)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (19, '2018-04-24 07:15:38.015269', '1', 'State object (1)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (20, '2018-04-24 07:15:54.951782', '1', 'State object (1)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (21, '2018-04-30 15:30:25.653254', '2', 'Transition object (2)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (22, '2018-04-30 15:45:48.978997', '2', 'State object (2)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (23, '2018-04-30 15:46:42.186978', '3', 'State object (3)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (24, '2018-04-30 15:47:58.792301', '4', 'State object (4)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (25, '2018-04-30 15:48:52.379536', '2', 'Transition object (2)', 2, '[{\"changed\": {\"fields\": [\"destination_state_id\"]}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (26, '2018-04-30 15:48:57.049551', '1', 'Transition object (1)', 2, '[{\"changed\": {\"fields\": [\"destination_state_id\"]}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (27, '2018-04-30 15:49:23.452938', '3', 'Transition object (3)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (28, '2018-04-30 15:50:00.971444', '5', 'State object (5)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (29, '2018-04-30 15:51:41.264461', '6', 'State object (6)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (30, '2018-04-30 15:52:16.535041', '1', 'TicketFlowLog object (1)', 2, '[{\"changed\": {\"fields\": [\"participant\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (31, '2018-04-30 15:52:35.306847', '1', 'TicketFlowLog object (1)', 2, '[{\"changed\": {\"fields\": [\"suggestion\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (32, '2018-04-30 15:53:19.306551', '2', 'TicketFlowLog object (2)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (33, '2018-04-30 15:54:32.070531', '4', 'Transition object (4)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (34, '2018-04-30 15:55:00.074263', '5', 'Transition object (5)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (35, '2018-04-30 15:55:32.417133', '3', 'TicketFlowLog object (3)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (36, '2018-04-30 15:56:02.571406', '4', 'TicketFlowLog object (4)', 1, '[{\"added\": {}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (37, '2018-04-30 15:57:00.143445', '2', 'TicketFlowLog object (2)', 2, '[{\"changed\": {\"fields\": [\"state_id\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (38, '2018-04-30 15:57:14.407122', '3', 'TicketFlowLog object (3)', 2, '[{\"changed\": {\"fields\": [\"state_id\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (39, '2018-04-30 15:57:26.345616', '4', 'TicketFlowLog object (4)', 2, '[{\"changed\": {\"fields\": [\"state_id\"]}}]', 13, 1);
INSERT INTO `django_admin_log` VALUES (40, '2018-04-30 16:20:38.479478', '1', 'State object (1)', 2, '[{\"changed\": {\"fields\": [\"is_hidden\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (41, '2018-04-30 16:20:55.076990', '3', 'State object (3)', 2, '[{\"changed\": {\"fields\": [\"is_hidden\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (42, '2018-04-30 16:21:02.336811', '4', 'State object (4)', 2, '[{\"changed\": {\"fields\": [\"is_hidden\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (43, '2018-04-30 16:21:07.513626', '5', 'State object (5)', 2, '[{\"changed\": {\"fields\": [\"is_hidden\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (44, '2018-04-30 16:21:13.163688', '6', 'State object (6)', 2, '[{\"changed\": {\"fields\": [\"is_hidden\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (45, '2018-04-30 20:33:11.317176', '1', 'TicketRecord object (1)', 2, '[{\"changed\": {\"fields\": [\"state_id\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (46, '2018-05-02 07:14:18.036032', '1', 'TicketRecord object (1)', 2, '[{\"changed\": {\"fields\": [\"participant_type_id\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (47, '2018-05-02 07:16:34.696279', '1', 'TicketRecord object (1)', 2, '[{\"changed\": {\"fields\": [\"state_id\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (48, '2018-05-02 07:32:09.915224', '1', 'TicketRecord object (1)', 2, '[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (49, '2018-05-02 09:57:24.555618', '1', 'TicketRecord object (1)', 2, '[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (50, '2018-05-05 16:00:25.314396', '1', 'WorkflowScript object (1)', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (51, '2018-05-05 16:05:50.756135', '2', 'WorkflowScript object (2)', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (52, '2018-05-05 16:29:29.901517', '3', 'WorkflowScript object (3)', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (53, '2018-05-05 16:30:43.883607', '4', 'WorkflowScript object (4)', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (54, '2018-05-05 16:31:06.336502', '4', 'WorkflowScript object (4)', 2, '[{\"changed\": {\"fields\": [\"is_active\"]}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (55, '2018-05-05 22:54:48.913998', '4', 'zhangsan', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (56, '2018-05-06 12:32:36.701617', '2', 'Workflow object (2)', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (57, '2018-05-08 06:50:35.276119', '2', 'Workflow object (2)', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (58, '2018-05-08 06:50:47.308245', '1', 'Workflow object (1)', 2, '[{\"changed\": {\"fields\": [\"name\", \"description\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (59, '2018-05-08 06:50:56.521305', '2', 'Workflow object (2)', 2, '[{\"changed\": {\"fields\": [\"description\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (60, '2018-05-08 21:15:16.433888', '1', 'State object (1)', 2, '[{\"changed\": {\"fields\": [\"type_id\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (61, '2018-05-08 21:16:18.128035', '1', 'State object (1)', 2, '[{\"changed\": {\"fields\": [\"type_id\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (62, '2018-05-08 21:16:33.106507', '1', 'State object (1)', 2, '[{\"changed\": {\"fields\": [\"type_id\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (63, '2018-05-09 06:44:38.400539', '3', '李磊', 2, '[{\"changed\": {\"fields\": [\"username\", \"alias\", \"email\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (64, '2018-05-09 06:45:12.998421', '2', 'LoonDept object (2)', 2, '[{\"changed\": {\"fields\": [\"leader\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (65, '2018-05-09 06:45:27.317759', '2', 'LoonDept object (2)', 2, '[{\"changed\": {\"fields\": [\"leader\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (66, '2018-05-09 06:45:44.025800', '4', 'LoonDept object (4)', 2, '[{\"changed\": {\"fields\": [\"leader\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (67, '2018-05-09 06:45:57.695441', '1', 'LoonDept object (1)', 2, '[{\"changed\": {\"fields\": [\"leader\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (68, '2018-05-09 06:46:21.353123', '3', 'lilei', 2, '[{\"changed\": {\"fields\": [\"username\", \"alias\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (69, '2018-05-09 06:46:40.026932', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"alias\", \"phone\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (70, '2018-05-09 06:57:21.399430', '4', 'zhangsan', 2, '[]', 9, 1);
INSERT INTO `django_admin_log` VALUES (71, '2018-05-09 06:57:31.480613', '4', 'zhangsan', 2, '[]', 9, 1);
INSERT INTO `django_admin_log` VALUES (72, '2018-05-09 06:57:57.104306', '4', 'zhangsan', 2, '[]', 9, 1);
INSERT INTO `django_admin_log` VALUES (73, '2018-05-09 06:58:59.737392', '5', 'aaa', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (74, '2018-05-09 06:59:57.018591', '5', 'aaa', 2, '[{\"changed\": {\"fields\": [\"phone\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (75, '2018-05-09 07:00:08.256294', '5', 'aaa', 2, '[{\"changed\": {\"fields\": [\"phone\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (76, '2018-05-09 07:00:19.792755', '4', 'zhangsan', 2, '[{\"changed\": {\"fields\": [\"phone\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (77, '2018-05-09 07:00:28.000474', '3', 'lilei', 2, '[{\"changed\": {\"fields\": [\"phone\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (78, '2018-05-09 07:00:34.122113', '2', 'guiji', 2, '[{\"changed\": {\"fields\": [\"phone\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (79, '2018-05-09 07:00:39.717494', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"phone\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (80, '2018-05-09 07:01:10.342386', '5', 'lisi', 2, '[{\"changed\": {\"fields\": [\"username\", \"alias\", \"email\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (81, '2018-05-09 07:01:50.406258', '6', 'wangwu', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (82, '2018-05-09 07:01:58.901060', '6', 'wangwu', 2, '[{\"changed\": {\"fields\": [\"dept_id\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (83, '2018-05-09 07:02:27.253982', '4', 'zhangsan', 2, '[{\"changed\": {\"fields\": [\"dept_id\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (84, '2018-05-09 07:02:42.222474', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"dept_id\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (85, '2018-05-09 07:02:52.076901', '5', 'lisi', 2, '[{\"changed\": {\"fields\": [\"dept_id\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (86, '2018-05-09 07:03:03.188035', '6', 'wangwu', 2, '[{\"changed\": {\"fields\": [\"dept_id\"]}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (87, '2018-05-09 07:03:32.428843', '3', 'LoonDept object (3)', 2, '[{\"changed\": {\"fields\": [\"leader\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (88, '2018-05-09 07:03:50.474873', '1', 'LoonDept object (1)', 2, '[{\"changed\": {\"fields\": [\"leader\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (89, '2018-05-09 07:04:53.362885', '4', 'LoonDept object (4)', 2, '[{\"changed\": {\"fields\": [\"approver\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (90, '2018-05-09 07:05:32.302984', '1', 'LoonUserRole object (1)', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (91, '2018-05-09 07:06:02.739935', '1', 'LoonRole object (1)', 1, '[{\"added\": {}}]', 7, 1);
INSERT INTO `django_admin_log` VALUES (92, '2018-05-09 07:10:47.328804', '3', 'Workflow object (3)', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (93, '2018-05-09 07:17:18.966435', '2', 'Workflow object (2)', 2, '[{\"changed\": {\"fields\": [\"flowchart\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (94, '2018-05-09 07:17:41.651573', '2', 'Workflow object (2)', 2, '[{\"changed\": {\"fields\": [\"display_form_str\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (95, '2018-05-09 07:17:49.336722', '3', 'Workflow object (3)', 3, '', 18, 1);
INSERT INTO `django_admin_log` VALUES (96, '2018-05-09 07:21:40.230215', '4', 'State object (4)', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (97, '2018-05-09 07:22:09.520970', '5', 'LoonDept object (5)', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (98, '2018-05-09 07:22:53.494815', '7', 'jack', 1, '[{\"added\": {}}]', 9, 1);
INSERT INTO `django_admin_log` VALUES (99, '2018-05-10 07:34:45.309242', '7', 'State object (7)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (100, '2018-05-10 07:37:57.667512', '1', 'CustomField object (1)', 2, '[{\"changed\": {\"fields\": [\"field_key\", \"field_name\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (101, '2018-05-10 07:41:03.720632', '2', 'CustomField object (2)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (102, '2018-05-10 07:41:13.238769', '1', 'CustomField object (1)', 2, '[{\"changed\": {\"fields\": [\"field_type_id\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (103, '2018-05-10 07:41:56.892036', '1', 'CustomField object (1)', 2, '[{\"changed\": {\"fields\": [\"order_id\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (104, '2018-05-11 06:47:36.390140', '8', 'State object (8)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (105, '2018-05-11 06:48:26.948684', '9', 'State object (9)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (106, '2018-05-11 06:50:09.417112', '10', 'State object (10)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (107, '2018-05-11 06:51:02.915599', '11', 'State object (11)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (108, '2018-05-11 06:52:39.803234', '6', 'State object (6)', 2, '[{\"changed\": {\"fields\": [\"participant_type_id\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (109, '2018-05-11 06:58:43.399074', '6', 'Transition object (6)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (110, '2018-05-11 07:00:24.371739', '4', 'Transition object (4)', 2, '[{\"changed\": {\"fields\": [\"name\", \"source_state_id\", \"destination_state_id\", \"field_require_check\", \"alert_enable\", \"alert_text\"]}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (111, '2018-05-11 07:00:52.921792', '5', 'Transition object (5)', 2, '[{\"changed\": {\"fields\": [\"name\", \"source_state_id\", \"destination_state_id\"]}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (112, '2018-05-11 07:01:52.181201', '5', 'State object (5)', 3, '', 17, 1);
INSERT INTO `django_admin_log` VALUES (113, '2018-05-11 07:03:29.352745', '5', 'Transition object (5)', 2, '[{\"changed\": {\"fields\": [\"source_state_id\", \"destination_state_id\"]}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (114, '2018-05-11 07:04:14.898117', '6', 'Transition object (6)', 2, '[{\"changed\": {\"fields\": [\"name\", \"workflow_id\", \"source_state_id\", \"destination_state_id\", \"field_require_check\"]}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (115, '2018-05-11 07:06:22.747270', '7', 'Transition object (7)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (116, '2018-05-11 07:07:33.214528', '8', 'Transition object (8)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (117, '2018-05-11 07:08:33.440502', '8', 'State object (8)', 2, '[{\"changed\": {\"fields\": [\"name\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (118, '2018-05-11 07:10:25.201782', '9', 'State object (9)', 2, '[{\"changed\": {\"fields\": [\"name\", \"participant_type_id\", \"participant\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (119, '2018-05-11 07:11:28.673604', '10', 'State object (10)', 2, '[{\"changed\": {\"fields\": [\"name\", \"order_id\", \"type_id\", \"participant_type_id\", \"participant\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (120, '2018-05-11 07:11:53.077507', '12', 'State object (12)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (121, '2018-05-11 07:12:53.037065', '9', 'Transition object (9)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (122, '2018-05-11 07:13:12.070939', '10', 'Transition object (10)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (123, '2018-05-11 07:13:52.428524', '11', 'Transition object (11)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (124, '2018-05-11 07:16:26.827492', '12', 'Transition object (12)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (125, '2018-05-11 07:16:36.074415', '12', 'Transition object (12)', 2, '[{\"changed\": {\"fields\": [\"field_require_check\"]}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (126, '2018-05-11 07:27:11.605280', '1', 'CustomField object (1)', 2, '[{\"changed\": {\"fields\": [\"field_type_id\", \"field_key\", \"field_name\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (127, '2018-05-11 07:27:32.716438', '2', 'CustomField object (2)', 2, '[{\"changed\": {\"fields\": [\"field_type_id\", \"field_key\", \"field_name\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (128, '2018-05-11 07:28:31.651385', '3', 'CustomField object (3)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (129, '2018-05-11 07:30:01.579803', '3', 'CustomField object (3)', 2, '[{\"changed\": {\"fields\": [\"field_type_id\", \"field_key\", \"field_name\", \"description\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (130, '2018-05-11 07:31:01.069847', '4', 'CustomField object (4)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (131, '2018-05-11 07:31:11.135481', '1', 'CustomField object (1)', 2, '[{\"changed\": {\"fields\": [\"order_id\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (132, '2018-05-11 07:31:19.926090', '2', 'CustomField object (2)', 2, '[{\"changed\": {\"fields\": [\"order_id\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (133, '2018-05-11 07:31:28.837817', '3', 'CustomField object (3)', 2, '[{\"changed\": {\"fields\": [\"order_id\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (134, '2018-05-11 07:31:35.324557', '4', 'CustomField object (4)', 2, '[{\"changed\": {\"fields\": [\"order_id\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (135, '2018-05-11 07:34:29.610951', '5', 'CustomField object (5)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (136, '2018-05-11 07:34:36.494826', '5', 'CustomField object (5)', 2, '[{\"changed\": {\"fields\": [\"order_id\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (137, '2018-05-11 07:36:41.886558', '6', 'CustomField object (6)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (138, '2018-05-12 09:30:21.816878', '4', 'WorkflowScript object (4)', 3, '', 15, 1);
INSERT INTO `django_admin_log` VALUES (139, '2018-05-12 09:30:21.825379', '3', 'WorkflowScript object (3)', 3, '', 15, 1);
INSERT INTO `django_admin_log` VALUES (140, '2018-05-12 09:30:21.828199', '2', 'WorkflowScript object (2)', 3, '', 15, 1);
INSERT INTO `django_admin_log` VALUES (141, '2018-05-12 09:30:21.831010', '1', 'WorkflowScript object (1)', 3, '', 15, 1);
INSERT INTO `django_admin_log` VALUES (142, '2018-05-12 09:32:41.503701', '5', 'WorkflowScript object (5)', 2, '[{\"changed\": {\"fields\": [\"is_active\"]}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (143, '2018-05-12 09:39:01.044508', '6', 'TicketFlowLog object (6)', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (144, '2018-05-12 09:39:01.048177', '5', 'TicketFlowLog object (5)', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (145, '2018-05-12 09:39:01.051358', '4', 'TicketFlowLog object (4)', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (146, '2018-05-12 09:39:01.054278', '3', 'TicketFlowLog object (3)', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (147, '2018-05-12 09:39:01.057906', '2', 'TicketFlowLog object (2)', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (148, '2018-05-12 09:39:01.059693', '1', 'TicketFlowLog object (1)', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (149, '2018-05-12 09:39:15.345379', '1', 'TicketCustomField object (1)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (150, '2018-05-12 09:39:40.905715', '2', 'TicketRecord object (2)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (151, '2018-05-12 09:39:40.909196', '1', 'TicketRecord object (1)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (152, '2018-05-12 09:40:48.913446', '4', 'Workflow object (4)', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (153, '2018-05-12 09:41:56.334411', '5', 'Workflow object (5)', 1, '[{\"added\": {}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (154, '2018-05-12 09:43:27.851903', '13', 'State object (13)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (155, '2018-05-12 10:02:31.504686', '7', 'CustomField object (7)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (156, '2018-05-12 10:05:06.484413', '8', 'CustomField object (8)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (157, '2018-05-12 10:52:47.141754', '9', 'CustomField object (9)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (158, '2018-05-12 10:53:14.718498', '10', 'CustomField object (10)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (159, '2018-05-13 11:00:50.505075', '11', 'CustomField object (11)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (160, '2018-05-13 11:01:20.651616', '12', 'CustomField object (12)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (161, '2018-05-13 11:05:48.193472', '14', 'State object (14)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (162, '2018-05-13 11:06:03.751286', '14', 'State object (14)', 2, '[{\"changed\": {\"fields\": [\"sub_workflow_id\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (163, '2018-05-13 11:07:18.514558', '15', 'State object (15)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (164, '2018-05-13 11:07:48.483499', '16', 'State object (16)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (165, '2018-05-13 11:10:36.044615', '17', 'State object (17)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (166, '2018-05-13 11:13:00.583531', '18', 'State object (18)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (167, '2018-05-13 11:13:25.616042', '19', 'State object (19)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (168, '2018-05-13 11:18:07.523093', '20', 'State object (20)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (169, '2018-05-13 11:23:27.199379', '21', 'State object (21)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (170, '2018-05-13 11:24:03.443085', '22', 'State object (22)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (171, '2018-05-13 11:24:26.021075', '23', 'State object (23)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (172, '2018-05-13 11:29:26.863526', '24', 'State object (24)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (173, '2018-05-13 11:29:54.167372', '25', 'State object (25)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (174, '2018-05-13 11:39:31.326527', '1', 'State object (1)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (175, '2018-05-13 11:41:39.486386', '2', 'State object (2)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (176, '2018-05-13 11:42:11.276418', '1', 'State object (1)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (177, '2018-05-13 11:42:18.797194', '2', 'State object (2)', 2, '[]', 17, 1);
INSERT INTO `django_admin_log` VALUES (178, '2018-05-13 11:42:46.037250', '3', 'State object (3)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (179, '2018-05-13 11:42:59.836340', '4', 'State object (4)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (180, '2018-05-13 11:45:22.525271', '1', 'Workflow object (1)', 2, '[{\"changed\": {\"fields\": [\"display_form_str\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (181, '2018-05-13 21:52:30.445390', '12', 'TicketRecord object (12)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (182, '2018-05-13 21:52:30.450894', '11', 'TicketRecord object (11)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (183, '2018-05-13 21:52:30.453813', '10', 'TicketRecord object (10)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (184, '2018-05-13 21:52:30.457430', '9', 'TicketRecord object (9)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (185, '2018-05-13 21:52:30.460235', '8', 'TicketRecord object (8)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (186, '2018-05-13 21:52:30.463067', '7', 'TicketRecord object (7)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (187, '2018-05-13 21:52:30.465696', '6', 'TicketRecord object (6)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (188, '2018-05-13 21:52:30.468862', '5', 'TicketRecord object (5)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (189, '2018-05-13 21:52:30.471665', '4', 'TicketRecord object (4)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (190, '2018-05-13 21:52:30.475075', '3', 'TicketRecord object (3)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (191, '2018-05-13 21:52:40.353331', '8', 'TicketFlowLog object (8)', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (192, '2018-05-13 21:52:40.357544', '7', 'TicketFlowLog object (7)', 3, '', 13, 1);
INSERT INTO `django_admin_log` VALUES (193, '2018-05-13 21:52:51.921703', '13', 'TicketCustomField object (13)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (194, '2018-05-13 21:52:51.925544', '12', 'TicketCustomField object (12)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (195, '2018-05-13 21:52:51.929737', '11', 'TicketCustomField object (11)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (196, '2018-05-13 21:52:51.932684', '10', 'TicketCustomField object (10)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (197, '2018-05-13 21:52:51.937093', '9', 'TicketCustomField object (9)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (198, '2018-05-13 21:52:51.940781', '8', 'TicketCustomField object (8)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (199, '2018-05-13 21:52:51.943562', '7', 'TicketCustomField object (7)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (200, '2018-05-13 21:52:51.946282', '6', 'TicketCustomField object (6)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (201, '2018-05-13 21:52:51.949748', '5', 'TicketCustomField object (5)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (202, '2018-05-13 21:52:51.952655', '4', 'TicketCustomField object (4)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (203, '2018-05-13 21:52:51.955529', '3', 'TicketCustomField object (3)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (204, '2018-05-13 21:52:51.958281', '2', 'TicketCustomField object (2)', 3, '', 12, 1);
INSERT INTO `django_admin_log` VALUES (205, '2018-05-13 22:15:33.205999', '5', 'CustomField object (5)', 2, '[{\"changed\": {\"fields\": [\"field_choice\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (206, '2018-05-13 22:20:52.916723', '1', 'Workflow object (1)', 2, '[{\"changed\": {\"fields\": [\"view_permission_check\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (207, '2018-05-13 22:28:39.393075', '13', 'TicketRecord object (13)', 3, '', 10, 1);
INSERT INTO `django_admin_log` VALUES (208, '2018-05-13 22:34:55.809709', '13', 'Transition object (13)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (209, '2018-05-13 22:35:05.023248', '14', 'Transition object (14)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (210, '2018-05-14 06:33:27.477305', '15', 'TicketRecord object (15)', 2, '[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (211, '2018-05-14 06:36:35.583915', '2', 'State object (2)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (212, '2018-05-14 06:44:10.386635', '2', 'State object (2)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (213, '2018-05-14 06:44:10.686119', '2', 'State object (2)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (214, '2018-05-14 06:46:38.351021', '1', 'Workflow object (1)', 2, '[{\"changed\": {\"fields\": [\"view_permission_check\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (215, '2018-05-14 06:46:54.963491', '1', 'Workflow object (1)', 2, '[{\"changed\": {\"fields\": [\"view_permission_check\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (216, '2018-05-15 07:13:06.602752', '6', 'State object (6)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (217, '2018-05-15 07:19:16.050832', '7', 'State object (7)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (218, '2018-05-15 07:37:12.926590', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"relation\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (219, '2018-05-16 06:57:11.209321', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"state_id\", \"participant_type_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (220, '2018-05-16 06:58:36.853125', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"state_id\", \"participant_type_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (221, '2018-05-16 07:01:48.836327', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"state_id\", \"participant_type_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (222, '2018-05-16 07:03:21.974005', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"state_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (223, '2018-05-16 07:04:29.225097', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"state_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (224, '2018-05-16 07:31:24.913771', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"state_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (225, '2018-05-16 23:20:55.440488', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"state_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (226, '2018-05-16 23:23:54.673079', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"state_id\", \"participant\", \"relation\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (227, '2018-05-16 23:24:40.088742', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"state_id\", \"participant\", \"relation\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (228, '2018-05-16 23:33:22.201139', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"state_id\", \"participant\", \"relation\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (229, '2018-05-20 23:22:11.031943', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (230, '2018-05-20 23:22:30.905458', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"participant_type_id\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (231, '2018-05-20 23:23:00.808836', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (232, '2018-05-21 10:57:04.791725', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (233, '2018-05-21 10:57:50.019431', '10', 'State object (10)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (234, '2018-05-21 19:27:37.561663', '18', 'TicketRecord object (18)', 2, '[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (235, '2018-05-22 07:25:13.573757', '10', 'State object (10)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (236, '2018-05-22 07:26:27.931548', '10', 'State object (10)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (237, '2018-05-22 07:26:54.688326', '17', 'TicketRecord object (17)', 2, '[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]', 10, 1);
INSERT INTO `django_admin_log` VALUES (238, '2018-05-22 07:40:16.575221', '10', 'State object (10)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (239, '2018-05-22 22:06:27.493740', '10', 'State object (10)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (240, '2018-05-22 22:06:52.641516', '10', 'State object (10)', 2, '[]', 17, 1);
INSERT INTO `django_admin_log` VALUES (241, '2018-05-22 22:21:51.875014', '10', 'State object (10)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (242, '2018-05-23 22:38:57.333718', '5', 'CustomField object (5)', 2, '[{\"changed\": {\"fields\": [\"field_type_id\"]}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (243, '2018-05-23 22:43:46.101026', '6', 'WorkflowScript object (6)', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (244, '2018-05-23 22:43:59.732931', '6', 'WorkflowScript object (6)', 3, '', 15, 1);
INSERT INTO `django_admin_log` VALUES (245, '2018-05-23 22:54:44.592052', '7', 'WorkflowScript object (7)', 1, '[{\"added\": {}}]', 15, 1);
INSERT INTO `django_admin_log` VALUES (246, '2018-07-14 11:18:48.988543', '2', 'Workflow object (2)', 2, '[{\"changed\": {\"fields\": [\"display_form_str\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (247, '2018-07-14 11:20:59.664393', '8', 'State object (8)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (248, '2018-07-14 11:21:15.910947', '8', 'State object (8)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (249, '2018-07-14 11:21:35.665414', '8', 'State object (8)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (250, '2018-07-14 11:22:19.869553', '8', 'State object (8)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (251, '2018-07-14 11:22:58.953273', '8', 'State object (8)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (252, '2018-07-14 11:23:11.554199', '8', 'State object (8)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (253, '2018-07-14 11:23:28.868062', '8', 'State object (8)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (254, '2018-08-26 10:31:43.376813', '1', 'CustomNotice object (1)', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (255, '2018-08-26 10:35:47.887114', '2', 'CustomNotice object (2)', 1, '[{\"added\": {}}]', 14, 1);
INSERT INTO `django_admin_log` VALUES (256, '2018-10-21 11:06:57.632666', '13', 'State object (13)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (257, '2018-10-21 11:07:27.696611', '14', 'State object (14)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (258, '2018-10-21 11:07:37.599847', '15', 'State object (15)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (259, '2018-10-21 11:07:44.207824', '16', 'State object (16)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (260, '2018-10-21 11:07:51.154185', '17', 'State object (17)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (261, '2018-10-21 11:07:57.144224', '18', 'State object (18)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (262, '2018-10-21 11:08:04.858972', '19', 'State object (19)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (263, '2018-10-21 11:09:00.404020', '3', 'Workflow object (3)', 2, '[{\"changed\": {\"fields\": [\"display_form_str\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (264, '2018-10-21 11:11:31.706470', '15', 'Transition object (15)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (265, '2018-10-21 11:12:03.734323', '16', 'Transition object (16)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (266, '2018-10-21 11:12:24.520272', '17', 'Transition object (17)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (267, '2018-10-21 11:13:05.940466', '18', 'Transition object (18)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (268, '2018-10-21 11:13:45.169121', '19', 'Transition object (19)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (269, '2018-10-21 11:14:03.426173', '20', 'Transition object (20)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (270, '2018-10-21 20:34:14.264284', '21', 'Transition object (21)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (271, '2018-10-21 20:34:44.151821', '22', 'Transition object (22)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (272, '2018-10-21 20:35:06.483278', '23', 'Transition object (23)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (273, '2018-10-21 20:35:36.766623', '24', 'Transition object (24)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (274, '2018-10-21 20:37:46.197309', '25', 'State object (25)', 2, '[{\"changed\": {\"fields\": [\"name\", \"type_id\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (275, '2018-10-21 20:38:26.337351', '26', 'State object (26)', 1, '[{\"added\": {}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (276, '2018-10-21 20:38:52.323989', '25', 'State object (25)', 2, '[{\"changed\": {\"fields\": [\"participant_type_id\", \"participant\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (277, '2018-10-21 20:39:30.617278', '25', 'Transition object (25)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (278, '2018-10-21 20:39:54.168411', '26', 'Transition object (26)', 1, '[{\"added\": {}}]', 19, 1);
INSERT INTO `django_admin_log` VALUES (279, '2018-10-21 20:45:04.771748', '13', 'CustomField object (13)', 1, '[{\"added\": {}}]', 16, 1);
INSERT INTO `django_admin_log` VALUES (280, '2018-10-21 20:45:59.294356', '4', 'Workflow object (4)', 2, '[{\"changed\": {\"fields\": [\"display_form_str\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (281, '2018-10-21 20:47:32.722318', '20', 'State object (20)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (282, '2018-10-21 20:47:44.534654', '21', 'State object (21)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (283, '2018-10-21 20:47:50.981963', '22', 'State object (22)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (284, '2018-10-21 20:47:56.590018', '23', 'State object (23)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (285, '2018-10-21 20:48:02.129252', '24', 'State object (24)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (286, '2018-10-21 20:48:07.833032', '25', 'State object (25)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (287, '2018-10-21 20:48:13.986949', '26', 'State object (26)', 2, '[{\"changed\": {\"fields\": [\"state_field_str\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (288, '2018-10-22 07:10:45.188484', '1', 'AppToken object (1)', 2, '[{\"changed\": {\"fields\": [\"ticket_sn_prefix\"]}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (289, '2018-10-22 07:12:32.403714', '1', 'AppToken object (1)', 2, '[{\"changed\": {\"fields\": [\"ticket_sn_prefix\"]}}]', 20, 1);
INSERT INTO `django_admin_log` VALUES (290, '2018-10-22 07:38:39.230703', '14', 'State object (14)', 2, '[{\"changed\": {\"fields\": [\"sub_workflow_id\"]}}]', 17, 1);
INSERT INTO `django_admin_log` VALUES (291, '2018-10-22 08:05:15.577141', '1', 'Workflow object (1)', 2, '[{\"changed\": {\"fields\": [\"notices\"]}}]', 18, 1);
INSERT INTO `django_admin_log` VALUES (292, '2018-10-22 15:24:45.126953', '4', 'Workflow object (4)', 3, '', 18, 1);
INSERT INTO `django_admin_log` VALUES (293, '2018-10-22 15:24:45.131527', '3', 'Workflow object (3)', 3, '', 18, 1);

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (20, 'account', 'apptoken');
INSERT INTO `django_content_type` VALUES (8, 'account', 'loondept');
INSERT INTO `django_content_type` VALUES (7, 'account', 'loonrole');
INSERT INTO `django_content_type` VALUES (9, 'account', 'loonuser');
INSERT INTO `django_content_type` VALUES (6, 'account', 'loonuserrole');
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (12, 'ticket', 'ticketcustomfield');
INSERT INTO `django_content_type` VALUES (13, 'ticket', 'ticketflowlog');
INSERT INTO `django_content_type` VALUES (10, 'ticket', 'ticketrecord');
INSERT INTO `django_content_type` VALUES (11, 'ticket', 'ticketstatelastman');
INSERT INTO `django_content_type` VALUES (16, 'workflow', 'customfield');
INSERT INTO `django_content_type` VALUES (14, 'workflow', 'customnotice');
INSERT INTO `django_content_type` VALUES (17, 'workflow', 'state');
INSERT INTO `django_content_type` VALUES (19, 'workflow', 'transition');
INSERT INTO `django_content_type` VALUES (18, 'workflow', 'workflow');
INSERT INTO `django_content_type` VALUES (15, 'workflow', 'workflowscript');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'account', '0001_initial', '2018-04-10 16:23:41.026839');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0001_initial', '2018-04-10 16:23:41.088822');
INSERT INTO `django_migrations` VALUES (3, 'admin', '0001_initial', '2018-04-10 16:23:41.202720');
INSERT INTO `django_migrations` VALUES (4, 'admin', '0002_logentry_remove_auto_add', '2018-04-10 16:23:41.215504');
INSERT INTO `django_migrations` VALUES (5, 'contenttypes', '0002_remove_content_type_name', '2018-04-10 16:23:41.316210');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0001_initial', '2018-04-10 16:23:41.492653');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0002_alter_permission_name_max_length', '2018-04-10 16:23:41.536426');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0003_alter_user_email_max_length', '2018-04-10 16:23:41.555765');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0004_alter_user_username_opts', '2018-04-10 16:23:41.579352');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0005_alter_user_last_login_null', '2018-04-10 16:23:41.616306');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0006_require_contenttypes_0002', '2018-04-10 16:23:41.620447');
INSERT INTO `django_migrations` VALUES (12, 'auth', '0007_alter_validators_add_error_messages', '2018-04-10 16:23:41.643171');
INSERT INTO `django_migrations` VALUES (13, 'auth', '0008_alter_user_username_max_length', '2018-04-10 16:23:41.663023');
INSERT INTO `django_migrations` VALUES (14, 'auth', '0009_alter_user_last_name_max_length', '2018-04-10 16:23:41.679754');
INSERT INTO `django_migrations` VALUES (15, 'sessions', '0001_initial', '2018-04-10 16:23:41.711283');
INSERT INTO `django_migrations` VALUES (16, 'ticket', '0001_initial', '2018-04-10 16:23:41.848590');
INSERT INTO `django_migrations` VALUES (17, 'workflow', '0001_initial', '2018-04-10 16:23:41.994564');
INSERT INTO `django_migrations` VALUES (18, 'ticket', '0002_auto_20180410_1749', '2018-04-10 17:49:06.562710');
INSERT INTO `django_migrations` VALUES (19, 'workflow', '0002_auto_20180410_1749', '2018-04-10 17:49:06.690036');
INSERT INTO `django_migrations` VALUES (20, 'account', '0002_apptoken', '2018-04-10 21:53:25.098976');
INSERT INTO `django_migrations` VALUES (21, 'ticket', '0003_ticketrecord_relation', '2018-04-15 17:21:55.494957');
INSERT INTO `django_migrations` VALUES (22, 'ticket', '0004_auto_20180417_2348', '2018-04-17 23:48:22.378917');
INSERT INTO `django_migrations` VALUES (23, 'workflow', '0003_auto_20180417_2348', '2018-04-17 23:48:22.391679');
INSERT INTO `django_migrations` VALUES (24, 'ticket', '0005_auto_20180418_0001', '2018-04-18 00:01:52.296081');
INSERT INTO `django_migrations` VALUES (25, 'workflow', '0004_workflow_view_permission_check', '2018-04-22 15:58:37.766199');
INSERT INTO `django_migrations` VALUES (26, 'workflow', '0005_auto_20180423_2114', '2018-04-23 21:14:51.345960');
INSERT INTO `django_migrations` VALUES (27, 'workflow', '0006_auto_20180423_2116', '2018-04-23 21:17:03.970113');
INSERT INTO `django_migrations` VALUES (28, 'workflow', '0007_auto_20180424_0656', '2018-04-24 06:56:48.399867');
INSERT INTO `django_migrations` VALUES (29, 'workflow', '0008_auto_20180424_0708', '2018-04-24 07:08:53.913939');
INSERT INTO `django_migrations` VALUES (30, 'workflow', '0009_auto_20180430_2129', '2018-04-30 21:29:29.307194');
INSERT INTO `django_migrations` VALUES (31, 'ticket', '0006_auto_20180505_1549', '2018-05-05 15:49:16.131657');
INSERT INTO `django_migrations` VALUES (32, 'workflow', '0010_auto_20180505_1549', '2018-05-05 15:49:16.168741');
INSERT INTO `django_migrations` VALUES (33, 'workflow', '0011_auto_20180509_0709', '2018-05-09 07:09:37.847547');
INSERT INTO `django_migrations` VALUES (34, 'workflow', '0012_auto_20180511_0654', '2018-05-11 06:54:50.920765');
INSERT INTO `django_migrations` VALUES (35, 'ticket', '0007_auto_20180516_0741', '2018-05-16 07:46:02.412425');
INSERT INTO `django_migrations` VALUES (36, 'ticket', '0008_auto_20180516_0743', '2018-05-16 07:46:02.417966');
INSERT INTO `django_migrations` VALUES (37, 'workflow', '0013_auto_20180511_1826', '2018-05-16 07:46:02.420751');
INSERT INTO `django_migrations` VALUES (38, 'workflow', '0014_auto_20180516_0741', '2018-05-16 07:46:02.423199');
INSERT INTO `django_migrations` VALUES (39, 'ticket', '0009_ticketflowlog_intervene_type_id', '2018-05-17 06:36:01.493028');
INSERT INTO `django_migrations` VALUES (40, 'ticket', '0010_ticketcustomfield_multi_username_value', '2018-05-22 06:46:49.124237');
INSERT INTO `django_migrations` VALUES (41, 'workflow', '0015_auto_20180522_0646', '2018-05-22 06:46:49.132266');
INSERT INTO `django_migrations` VALUES (42, 'workflow', '0016_auto_20180620_1709', '2018-07-30 07:21:05.079135');
INSERT INTO `django_migrations` VALUES (43, 'workflow', '0017_auto_20180730_0720', '2018-07-30 07:21:05.193141');
INSERT INTO `django_migrations` VALUES (44, 'ticket', '0011_ticketrecord_script_run_last_result', '2018-08-09 07:32:10.254032');
INSERT INTO `django_migrations` VALUES (45, 'workflow', '0018_auto_20180809_0732', '2018-08-09 07:32:10.374771');
INSERT INTO `django_migrations` VALUES (46, 'ticket', '0012_delete_ticketstatelastman', '2018-08-12 16:58:07.510558');
INSERT INTO `django_migrations` VALUES (47, 'workflow', '0019_state_remember_last_man_enable', '2018-08-12 16:58:07.598511');
INSERT INTO `django_migrations` VALUES (48, 'account', '0003_apptoken_workflow_type_ids', '2018-08-12 17:46:44.688698');
INSERT INTO `django_migrations` VALUES (49, 'account', '0004_auto_20180812_1802', '2018-08-12 18:02:21.165206');
INSERT INTO `django_migrations` VALUES (50, 'workflow', '0020_workflow_limit_expression', '2018-08-24 07:39:19.095010');
INSERT INTO `django_migrations` VALUES (51, 'workflow', '0021_customnotice', '2018-08-26 10:30:18.818854');
INSERT INTO `django_migrations` VALUES (52, 'ticket', '0013_ticketrecord_is_end', '2018-09-26 06:53:40.535144');
INSERT INTO `django_migrations` VALUES (53, 'workflow', '0022_auto_20180926_0653', '2018-09-26 06:53:40.625847');
INSERT INTO `django_migrations` VALUES (54, 'workflow', '0023_auto_20181001_1012', '2018-10-01 10:12:52.255104');
INSERT INTO `django_migrations` VALUES (55, 'account', '0005_apptoken_ticket_sn_prefix', '2018-10-03 17:08:44.632310');
INSERT INTO `django_migrations` VALUES (56, 'ticket', '0014_auto_20181003_1708', '2018-10-03 17:08:44.788212');
INSERT INTO `django_migrations` VALUES (57, 'workflow', '0024_auto_20181003_1708', '2018-10-03 17:08:44.885439');
INSERT INTO `django_migrations` VALUES (58, 'workflow', '0025_transition_condition_expression', '2018-10-06 17:03:26.434330');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('2p4bd3iu2iz6cakbxn9hamdvqp3fvx7y', 'MWUzZjFjNThjNmM1MmRlMWIzYjY0NDFiODNlODE3MDIzMjQ2NGQwYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2MTUwYzAwNmQyNGM0Y2QyNzQ5Zjc2NGE4N2MzZDNlNjY0ZDA5NzgiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-05-06 15:24:30.402451');
INSERT INTO `django_session` VALUES ('3bvgp1uqozyloos8gugskjbhhebbmz0g', 'M2EwMmViZmQyZDAxZmU2NmE2Njg4OWYxNzk3ZDVkY2E1NmM0NzNiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2018-11-01 10:12:43.428760');
INSERT INTO `django_session` VALUES ('6pft9qeivcxj8lfm7b1qr02yh2wddt53', 'ZDRlZjhmNTg5OGM0NGE1ZTFjNGU3MTRkYjM4ZWQ3NjE3MjIzMWFlMjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiI4NTYyMWJmOWM2M2ZhNGM4MmJkZDI2NTY4ZmJmYjlhYzc2ZDNiZWQ0In0=', '2019-12-20 16:43:12.777820');
INSERT INTO `django_session` VALUES ('fp4zkhd8cgfj6tacff6giqm75wwd4p93', 'NTU1NDRhMGM1MDIyMDczYmFlY2MzZDdkZTMyYWZlYmYyMGRiMzhiNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-08-20 07:12:12.680740');
INSERT INTO `django_session` VALUES ('fxdc90snam1vje7bpv3wiafwu9pooeyk', 'M2EwMmViZmQyZDAxZmU2NmE2Njg4OWYxNzk3ZDVkY2E1NmM0NzNiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2018-07-17 07:04:43.733996');
INSERT INTO `django_session` VALUES ('gi4p54ka4u6vww4kpqogolmdquj52wup', 'YTQyMzg3NzMzMzRkZDgxNzU1YWM1OTE3YWExZTFjMDdlMWZmNzM5Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2MTUwYzAwNmQyNGM0Y2QyNzQ5Zjc2NGE4N2MzZDNlNjY0ZDA5NzgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2018-04-24 21:38:48.844698');
INSERT INTO `django_session` VALUES ('gwwul2nmxqyrdzx1wbej4uj0ahzsdwow', 'YmI5MjhmNmQ3YzFjMjM3ZjgwYTg4ZmRkMjk1MmU0ZGU5ZjI4Nzg0Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJiZTkyMDVmNDcxNTM5ZDIwYjg0YzU1MjRjMjUwMWE5MGFjZTA0ZjczIn0=', '2018-10-28 16:07:27.753614');
INSERT INTO `django_session` VALUES ('ikpnzy0jsc0jiede5r6cxhoyagq2payb', 'YTQyMzg3NzMzMzRkZDgxNzU1YWM1OTE3YWExZTFjMDdlMWZmNzM5Zjp7Il9hdXRoX3VzZXJfaGFzaCI6IjQ2MTUwYzAwNmQyNGM0Y2QyNzQ5Zjc2NGE4N2MzZDNlNjY0ZDA5NzgiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2018-04-24 21:36:50.610586');
INSERT INTO `django_session` VALUES ('immo7viwmlantgx7ubbwawz7kknhmjgd', 'M2EwMmViZmQyZDAxZmU2NmE2Njg4OWYxNzk3ZDVkY2E1NmM0NzNiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2019-11-26 17:58:31.816749');
INSERT INTO `django_session` VALUES ('jw2psatj7z4zrur42urk3wluopurpqr1', 'YmI5MjhmNmQ3YzFjMjM3ZjgwYTg4ZmRkMjk1MmU0ZGU5ZjI4Nzg0Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJiZTkyMDVmNDcxNTM5ZDIwYjg0YzU1MjRjMjUwMWE5MGFjZTA0ZjczIn0=', '2018-10-21 19:52:52.775319');
INSERT INTO `django_session` VALUES ('l187tcfmtjwn2yvr407elnm51dqmaa0u', 'YmI5MjhmNmQ3YzFjMjM3ZjgwYTg4ZmRkMjk1MmU0ZGU5ZjI4Nzg0Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJiZTkyMDVmNDcxNTM5ZDIwYjg0YzU1MjRjMjUwMWE5MGFjZTA0ZjczIn0=', '2018-08-13 07:21:42.060139');
INSERT INTO `django_session` VALUES ('lo8legnunej20ohxp0zegm4r6u22b6zw', 'ZGM2OGMzMDU3NDBkMTFhY2ViMjNlZjRhNWQyNDRhOTUxNGExNjQ4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZTkyMDVmNDcxNTM5ZDIwYjg0YzU1MjRjMjUwMWE5MGFjZTA0ZjczIn0=', '2019-12-01 22:47:58.597505');
INSERT INTO `django_session` VALUES ('qo53v19toowa0nxaxv8ab9clj1cyis3z', 'MWNmMzI5NDJjMDBjNGExNzEwNjFiZDdmYzE0ZDVjNTA5ZGM0NmVhMjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiODU2MjFiZjljNjNmYTRjODJiZGQyNjU2OGZiZmI5YWM3NmQzYmVkNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2019-12-20 16:48:06.080918');
INSERT INTO `django_session` VALUES ('qrugroidqpdoepvimz4mtqrsw8elq3px', 'M2EwMmViZmQyZDAxZmU2NmE2Njg4OWYxNzk3ZDVkY2E1NmM0NzNiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2018-06-06 09:50:27.154850');
INSERT INTO `django_session` VALUES ('rhy3t0ut1v8ev1bqja8sql9htybr95k7', 'NTU1NDRhMGM1MDIyMDczYmFlY2MzZDdkZTMyYWZlYmYyMGRiMzhiNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-09-05 07:18:38.000344');
INSERT INTO `django_session` VALUES ('uc120vlnss4jhy3i8kxow00uqbozf6m4', 'ZGM2OGMzMDU3NDBkMTFhY2ViMjNlZjRhNWQyNDRhOTUxNGExNjQ4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJiZTkyMDVmNDcxNTM5ZDIwYjg0YzU1MjRjMjUwMWE5MGFjZTA0ZjczIn0=', '2018-05-23 06:56:36.173728');
INSERT INTO `django_session` VALUES ('xg0q3efrgh60a8svbz3qbomctp6eexmq', 'M2EwMmViZmQyZDAxZmU2NmE2Njg4OWYxNzk3ZDVkY2E1NmM0NzNiYjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=', '2019-11-28 14:11:13.565280');
INSERT INTO `django_session` VALUES ('yqo3dtnk8pasr19u3qwkgz4bvpv0yg08', 'NTU1NDRhMGM1MDIyMDczYmFlY2MzZDdkZTMyYWZlYmYyMGRiMzhiNDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYmU5MjA1ZjQ3MTUzOWQyMGI4NGM1NTI0YzI1MDFhOTBhY2UwNGY3MyIsIl9hdXRoX3VzZXJfaWQiOiIxIn0=', '2018-05-28 10:04:09.557125');

-- ----------------------------
-- Table structure for ticket_ticketcustomfield
-- ----------------------------
DROP TABLE IF EXISTS `ticket_ticketcustomfield`;
CREATE TABLE `ticket_ticketcustomfield`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `field_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `field_type_id` int(11) NOT NULL,
  `char_value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `int_value` int(11) NOT NULL,
  `float_value` double NOT NULL,
  `bool_value` tinyint(1) NOT NULL,
  `date_value` date NOT NULL,
  `datetime_value` datetime(6) NOT NULL,
  `time_value` time(6) NOT NULL,
  `radio_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `checkbox_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `select_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `multi_select_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `text_value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `username_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `multi_username_value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ticket_ticketcustomfield
-- ----------------------------
INSERT INTO `ticket_ticketcustomfield` VALUES (14, '请假类型', 13, 'leave_type', 40, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '2', '', '', '', '', 'admin', '2018-05-13 21:53:15.776693', '2018-05-13 21:53:15.776753', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (15, '代理人', 13, 'leave_proxy', 60, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', 'zhangsan', 'admin', '2018-05-13 21:53:15.784787', '2018-05-13 21:53:15.784839', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (16, '请假原因及相关附件', 13, 'leave_reason', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '去喝喜酒', '', 'admin', '2018-05-13 21:53:15.792655', '2018-05-13 21:53:15.792711', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (17, '开始时间', 13, 'leave_start', 30, '', 0, 0, 0, '0001-01-01', '2018-04-10 09:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 21:53:15.800632', '2018-05-13 21:53:15.800683', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (18, '请假天数(0.5的倍数)', 13, 'leave_days', 5, '3', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 21:53:15.809216', '2018-05-13 21:53:15.809266', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (19, '结束时间', 13, 'leave_end', 30, '', 0, 0, 0, '0001-01-01', '2018-04-12 18:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 21:53:15.817437', '2018-05-13 21:53:15.817484', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (20, '代理人', 14, 'leave_proxy', 60, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', 'zhangsan1', 'admin', '2018-05-13 22:24:41.969926', '2018-05-13 22:24:41.969982', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (21, '请假天数(0.5的倍数)', 14, 'leave_days', 5, '3', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 22:24:41.978508', '2018-05-13 22:24:41.978600', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (22, '开始时间', 14, 'leave_start', 30, '', 0, 0, 0, '0001-01-01', '2018-05-10 09:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 22:24:41.988270', '2018-05-13 22:24:41.988346', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (23, '请假类型', 14, 'leave_type', 40, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '1', '', '', '', '', 'admin', '2018-05-13 22:24:41.997839', '2018-05-13 22:24:41.997891', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (24, '结束时间', 14, 'leave_end', 30, '', 0, 0, 0, '0001-01-01', '2018-05-13 09:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 22:24:42.008241', '2018-05-13 22:24:42.008292', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (25, '请假原因及相关附件', 14, 'leave_reason', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '喝喜酒', '', 'admin', '2018-05-13 22:24:42.016808', '2018-05-13 22:24:42.016898', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (26, '结束时间', 15, 'leave_end', 30, '', 0, 0, 0, '0001-01-01', '2018-05-13 09:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 22:28:21.643297', '2018-05-13 22:28:21.643346', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (27, '请假原因及相关附件', 15, 'leave_reason', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '喝喜酒', '', 'admin', '2018-05-13 22:28:21.650778', '2018-05-13 22:28:21.650828', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (28, '代理人', 15, 'leave_proxy', 60, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', 'zhangsan1', 'admin', '2018-05-13 22:28:21.659327', '2018-05-13 22:28:21.659375', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (29, '请假天数(0.5的倍数)', 15, 'leave_days', 5, '3', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 22:28:21.667908', '2018-05-13 22:28:21.667955', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (30, '开始时间', 15, 'leave_start', 30, '', 0, 0, 0, '0001-01-01', '2018-05-10 09:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 22:28:21.675754', '2018-05-13 22:28:21.675803', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (31, '请假类型', 15, 'leave_type', 40, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '1', '', '', '', '', 'admin', '2018-05-13 22:28:21.683366', '2018-05-13 22:28:21.683414', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (32, '结束时间', 16, 'leave_end', 30, '', 0, 0, 0, '0001-01-01', '2018-04-12 18:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 22:34:12.690959', '2018-05-13 22:34:12.691033', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (33, '请假原因及相关附件', 16, 'leave_reason', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '去喝喜酒', '', 'admin', '2018-05-13 22:34:12.701832', '2018-05-13 22:34:12.701889', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (34, '代理人', 16, 'leave_proxy', 60, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', 'zhangsan', 'admin', '2018-05-13 22:34:12.711844', '2018-05-13 22:34:12.711905', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (35, '请假天数(0.5的倍数)', 16, 'leave_days', 5, '3', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 22:34:12.721909', '2018-05-13 22:34:12.721966', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (36, '开始时间', 16, 'leave_start', 30, '', 0, 0, 0, '0001-01-01', '2018-04-10 09:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-05-13 22:34:12.730191', '2018-05-13 22:34:12.730245', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (37, '请假类型', 16, 'leave_type', 40, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '2', '', '', '', '', 'admin', '2018-05-13 22:34:12.741366', '2018-05-13 22:34:12.741426', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (38, '申请原因', 17, 'vpn_reason', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '在家办公', '', 'admin', '2018-05-15 07:16:38.326174', '2018-05-15 07:16:38.326274', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (39, '申请原因', 18, 'vpn_reason', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '在家办公', '', 'admin', '2018-05-15 07:37:28.008199', '2018-05-15 07:37:28.008245', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (40, '请假天数(0.5的倍数)', 19, 'leave_days', 5, '1', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-19 00:08:40.397150', '2018-10-19 00:08:40.397166', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (41, '请假类型', 19, 'leave_type', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '3', '', '', '', '', '', 'admin', '2018-10-19 00:08:40.402913', '2018-10-19 00:08:40.402928', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (42, '开始时间', 19, 'leave_start', 30, '', 0, 0, 0, '0001-01-01', '2019-12-06 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-19 00:08:40.408762', '2018-10-19 00:08:40.408775', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (43, '请假原因及相关附件', 19, 'leave_reason', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '<p>大師傅但是</p>', '', 'admin', '2018-10-19 00:08:40.413509', '2018-10-19 00:08:40.413529', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (44, '结束时间', 19, 'leave_end', 30, '', 0, 0, 0, '0001-01-01', '2019-12-07 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-19 00:08:40.419809', '2018-10-19 00:08:40.419833', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (45, '代理人', 19, 'leave_proxy', 60, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', 'david', 'admin', '2018-10-19 00:08:40.425879', '2018-10-19 00:08:40.425895', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (46, '结束时间', 20, 'leave_end', 30, '', 0, 0, 0, '0001-01-01', '2019-12-07 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-19 00:38:41.367687', '2018-10-19 00:38:41.367703', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (47, '开始时间', 20, 'leave_start', 30, '', 0, 0, 0, '0001-01-01', '2019-12-06 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-19 00:38:41.372330', '2018-10-19 00:38:41.372352', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (48, '代理人', 20, 'leave_proxy', 60, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', 'david', 'admin', '2018-10-19 00:38:41.376402', '2018-10-19 00:38:41.376417', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (49, '请假天数(0.5的倍数)', 20, 'leave_days', 5, '1', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-19 00:38:41.379313', '2018-10-19 00:38:41.379327', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (50, '请假类型', 20, 'leave_type', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '3', '', '', '', '', '', 'admin', '2018-10-19 00:38:41.383436', '2018-10-19 00:38:41.383450', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (51, '请假原因及相关附件', 20, 'leave_reason', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '<p>大師傅但是</p>', '', 'admin', '2018-10-19 00:38:41.387250', '2018-10-19 00:38:41.387266', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (52, '项目标识', 21, 'project_code', 5, 'prj001', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-21 11:14:37.680365', '2018-10-21 11:14:37.680400', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (53, '项目开发人员', 21, 'project_devs', 60, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', 'admin', 'admin', '2018-10-21 11:14:37.686541', '2018-10-21 11:14:37.686575', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (54, '项目测试人员', 21, 'project_qas', 60, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', 'admin', 'admin', '2018-10-21 11:14:37.692349', '2018-10-21 11:14:37.692382', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (55, '请假原因及相关附件', 22, 'leave_reason', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '<p>的发鬼地方</p>', '', 'admin', '2018-10-22 07:12:16.466886', '2018-10-22 07:12:16.466914', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (56, '请假天数(0.5的倍数)', 22, 'leave_days', 5, '2', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-22 07:12:16.472163', '2018-10-22 07:12:16.472181', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (57, '请假类型', 22, 'leave_type', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '1', '', '', '', '', '', 'admin', '2018-10-22 07:12:16.477751', '2018-10-22 07:12:16.477769', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (58, '开始时间', 22, 'leave_start', 30, '', 0, 0, 0, '0001-01-01', '2019-12-07 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-22 07:12:16.481785', '2018-10-22 07:12:16.481810', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (59, '代理人', 22, 'leave_proxy', 60, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', 'lisi', 'admin', '2018-10-22 07:12:16.485136', '2018-10-22 07:12:16.485153', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (60, '结束时间', 22, 'leave_end', 30, '', 0, 0, 0, '0001-01-01', '2019-12-08 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-22 07:12:16.489084', '2018-10-22 07:12:16.489109', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (61, '请假原因及相关附件', 23, 'leave_reason', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '<p>语言</p>', '', 'admin', '2018-10-22 08:05:37.200981', '2018-10-22 08:05:37.201000', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (62, '请假天数(0.5的倍数)', 23, 'leave_days', 5, '1', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-22 08:05:37.204565', '2018-10-22 08:05:37.204582', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (63, '请假类型', 23, 'leave_type', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '3', '', '', '', '', '', 'admin', '2018-10-22 08:05:37.207974', '2018-10-22 08:05:37.207991', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (64, '开始时间', 23, 'leave_start', 30, '', 0, 0, 0, '0001-01-01', '2019-12-07 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-22 08:05:37.212592', '2018-10-22 08:05:37.212654', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (65, '代理人', 23, 'leave_proxy', 60, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', 'lilei', 'admin', '2018-10-22 08:05:37.217232', '2018-10-22 08:05:37.217251', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (66, '结束时间', 23, 'leave_end', 30, '', 0, 0, 0, '0001-01-01', '2019-12-08 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', 'admin', '2018-10-22 08:05:37.221150', '2018-10-22 08:05:37.221170', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (67, '开始时间', 21, 'leave_start', 30, '', 0, 0, 0, '0001-01-01', '2019-12-06 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-05 13:07:17.996207', '2019-12-05 13:07:17.996207', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (68, '请假类型', 21, 'leave_type', 35, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '2', '', '', '', '', '', '', '2019-12-05 13:07:18.040207', '2019-12-05 13:07:18.040207', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (69, '请假原因及相关附件', 21, 'leave_reason', 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '<p>dfdsf<br/></p>', '', '', '2019-12-05 13:07:18.099207', '2019-12-05 13:07:18.099207', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (70, '代理人', 21, 'leave_proxy', 60, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', 'lilian', '', '2019-12-05 13:07:18.140205', '2019-12-05 13:07:18.140205', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (71, '请假天数(0.5的倍数)', 21, 'leave_days', 5, '1', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-05 13:07:18.198206', '2019-12-05 13:07:18.198206', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (72, '结束时间', 21, 'leave_end', 30, '', 0, 0, 0, '0001-01-01', '2019-12-06 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-05 13:07:18.231206', '2019-12-05 13:07:18.231206', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (73, '指标名称', 24, 'sec_name', 5, '原始指标', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-06 18:24:58.321904', '2019-12-06 18:24:58.321904', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (74, '指标id', 24, 'sec_id', 5, 'att-01', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-06 18:24:58.368904', '2019-12-06 18:24:58.368904', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (75, '指标的值', 24, 'sec_val', 15, '', 0, 12, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-06 18:24:58.422904', '2019-12-06 18:24:58.422904', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (76, '指标的值', 25, 'sec_val', 15, '', 0, 234, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 10:18:23.317436', '2019-12-09 10:18:23.317436', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (77, '指标名称', 25, 'sec_name', 5, '初始数据', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 10:18:23.356435', '2019-12-09 10:18:23.356435', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (78, '指标id', 25, 'sec_id', 5, 'att_01', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 10:18:23.385434', '2019-12-09 10:18:23.385434', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (79, '指标的值', 26, 'sec_val', 15, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 10:25:40.904418', '2019-12-09 10:25:40.904418', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (80, '指标id', 26, 'sec_id', 5, 'df', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 10:25:40.928452', '2019-12-09 10:25:40.928452', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (81, '指标名称', 26, 'sec_name', 5, 'df', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 10:25:40.957419', '2019-12-09 10:25:40.957419', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (82, '指标的值', 27, 'sec_val', 15, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 10:31:24.367449', '2019-12-09 10:31:24.368437', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (83, '指标id', 27, 'sec_id', 5, '12', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 10:31:24.394451', '2019-12-09 10:31:24.394451', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (84, '指标名称', 27, 'sec_name', 5, 'df3', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 10:31:24.435452', '2019-12-09 10:31:24.435452', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (85, '指标id', 28, 'sec_id', 5, 'er', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 13:07:19.643878', '2019-12-09 13:07:19.643878', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (86, '指标的值', 28, 'sec_val', 15, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 13:07:19.673878', '2019-12-09 13:07:19.673878', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (87, '指标名称', 28, 'sec_name', 5, '43', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 13:07:19.702888', '2019-12-09 13:07:19.702888', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (88, '指标的值', 29, 'sec_val', 15, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 13:39:25.097686', '2019-12-09 13:39:25.097686', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (89, '指标名称', 29, 'sec_name', 5, '地方2', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 13:39:25.129688', '2019-12-09 13:39:25.129688', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (90, '指标id', 29, 'sec_id', 5, '地方', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 13:39:25.192675', '2019-12-09 13:39:25.192675', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (91, '指标id', 30, 'sec_id', 5, '地方23', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 14:18:35.658128', '2019-12-09 14:18:35.658128', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (92, '指标名称', 30, 'sec_name', 5, '二', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 14:18:35.700124', '2019-12-09 14:18:35.701127', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (93, '指标的值', 30, 'sec_val', 15, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 14:18:35.722141', '2019-12-09 14:18:35.722141', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (94, '指标id', 31, 'sec_id', 5, '地方', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 16:36:44.715900', '2019-12-09 16:36:44.715900', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (95, '指标的值', 31, 'sec_val', 15, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 16:36:44.759901', '2019-12-09 16:36:44.759901', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (96, '指标名称', 31, 'sec_name', 5, '地方', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 16:36:44.790902', '2019-12-09 16:36:44.790902', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (97, '指标id', 32, 'sec_id', 5, '二恶', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 17:17:02.644413', '2019-12-09 17:17:02.644413', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (98, '指标的值', 32, 'sec_val', 15, '', 0, 23, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 17:17:02.668417', '2019-12-09 17:17:02.668417', 0, '');
INSERT INTO `ticket_ticketcustomfield` VALUES (99, '指标名称', 32, 'sec_name', 5, '而为额', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00.000000', '00:00:01.000000', '', '', '', '', '', '', '', '2019-12-09 17:17:02.704445', '2019-12-09 17:17:02.704445', 0, '');

-- ----------------------------
-- Table structure for ticket_ticketflowlog
-- ----------------------------
DROP TABLE IF EXISTS `ticket_ticketflowlog`;
CREATE TABLE `ticket_ticketflowlog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ticket_id` int(11) NOT NULL,
  `transition_id` int(11) NOT NULL,
  `suggestion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `participant_type_id` int(11) NOT NULL,
  `participant` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state_id` int(11) NOT NULL,
  `ticket_data` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `intervene_type_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ticket_ticketflowlog
-- ----------------------------
INSERT INTO `ticket_ticketflowlog` VALUES (9, 13, 1, '', 1, 'lilei', 1, '', 'admin', '2018-05-13 21:53:15.820550', '2018-05-13 21:53:15.820610', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (10, 14, 2, '', 1, 'lilei', 1, '', 'admin', '2018-05-13 22:24:42.021711', '2018-05-13 22:24:42.021792', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (11, 15, 2, '', 1, 'lilei', 1, '', 'admin', '2018-05-13 22:28:21.686709', '2018-05-13 22:28:21.686769', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (12, 16, 1, '', 1, 'lilei', 1, '', 'admin', '2018-05-13 22:34:12.744844', '2018-05-13 22:34:12.744912', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (13, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-13 22:59:06.743524', '2018-05-13 22:59:06.743634', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (14, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-13 23:00:44.421329', '2018-05-13 23:00:44.421396', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (15, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-13 23:04:40.758014', '2018-05-13 23:04:40.758125', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (16, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-13 23:07:21.279315', '2018-05-13 23:07:21.280068', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (17, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-13 23:10:19.742789', '2018-05-13 23:10:19.742861', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (18, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-13 23:52:21.760281', '2018-05-13 23:52:21.760339', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (19, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-14 00:01:54.824910', '2018-05-14 00:01:54.824974', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (20, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-14 00:02:45.942264', '2018-05-14 00:02:45.942325', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (21, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-14 00:12:18.293208', '2018-05-14 00:12:18.293269', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (22, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-14 00:15:43.074352', '2018-05-14 00:15:43.074635', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (23, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-14 00:21:56.019252', '2018-05-14 00:21:56.019666', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (24, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-14 00:24:11.381536', '2018-05-14 00:24:11.381609', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (25, 14, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-14 06:55:24.437483', '2018-05-14 06:55:24.437546', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (26, 15, 0, '转交工单', 1, 'lilei', 2, '', 'lilei', '2018-05-14 06:56:26.664730', '2018-05-14 06:56:26.664802', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (27, 15, 0, '转交工单', 1, 'zhangsan', 2, '', 'zhangsan', '2018-05-14 06:56:52.101637', '2018-05-14 06:56:52.101705', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (28, 15, 14, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-14 06:59:33.505946', '2018-05-14 06:59:33.506019', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (29, 15, 13, '保存草稿', 1, 'lilei', 2, '', 'lilei', '2018-05-14 07:00:03.655105', '2018-05-14 07:00:03.655196', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (30, 15, 0, '强制修改工单状态', 1, 'lilei', 3, '', 'admin', '2018-05-14 07:07:39.586383', '2018-05-14 07:07:39.586456', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (31, 14, 0, '加签工单', 1, 'lilei', 2, '', 'lilei', '2018-05-15 06:46:11.225083', '2018-05-15 06:46:11.225146', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (32, 17, 7, '', 1, 'lilei', 6, '', 'admin', '2018-05-15 07:16:38.332521', '2018-05-15 07:16:38.332680', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (33, 17, 8, '同意申请', 1, 'lilei', 7, '', 'lilei', '2018-05-15 07:20:40.816765', '2018-05-15 07:20:40.816925', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (34, 18, 7, '', 1, 'lilei', 6, '', 'admin', '2018-05-15 07:37:28.012487', '2018-05-15 07:37:28.012548', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (35, 18, 8, '同意申请', 1, 'lilei', 7, '', 'lilei', '2018-05-15 07:37:37.111956', '2018-05-15 07:37:37.112027', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (36, 17, 0, '接单处理', 1, 'guiji', 8, '', 'guiji', '2018-05-16 06:42:00.998562', '2018-05-16 06:42:00.998625', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (37, 17, 9, '同意', 1, 'guiji', 8, '', 'guiji', '2018-05-16 06:49:55.948811', '2018-05-16 06:49:55.948905', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (38, 17, 0, '接单处理', 1, 'guiji', 8, '', 'guiji', '2018-05-16 06:57:31.802266', '2018-05-16 06:57:31.802360', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (39, 17, 9, '同意', 1, 'guiji', 8, '', 'guiji', '2018-05-16 06:57:36.347563', '2018-05-16 06:57:36.347634', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (40, 17, 9, '同意', 1, 'guiji', 8, '', 'guiji', '2018-05-16 06:58:41.660593', '2018-05-16 06:58:41.660701', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (41, 17, 9, '同意', 1, 'guiji', 8, '', 'guiji', '2018-05-16 07:01:53.888622', '2018-05-16 07:01:53.888689', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (42, 17, 10, 'False\n', 6, 'demo_script.py', 9, '', 'loonrobot', '2018-05-16 07:01:54.040851', '2018-05-16 07:01:54.041150', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (43, 17, 9, '同意', 1, 'guiji', 8, '', 'guiji', '2018-05-16 07:03:34.673960', '2018-05-16 07:03:34.674037', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (44, 17, 10, 'False\n', 6, 'demo_script.py', 9, '', 'loonrobot', '2018-05-16 07:03:34.846610', '2018-05-16 07:03:34.847216', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (45, 17, 9, '同意', 1, 'guiji', 8, '', 'guiji', '2018-05-16 07:04:45.745455', '2018-05-16 07:04:45.745521', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (46, 17, 10, 'False\n', 6, 'demo_script.py', 9, '', 'loonrobot', '2018-05-16 07:04:45.955902', '2018-05-16 07:04:45.956166', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (47, 17, 9, '同意', 1, 'guiji', 8, '', 'guiji', '2018-05-16 07:31:29.378033', '2018-05-16 07:31:29.378090', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (48, 17, 10, 'lilei\n', 6, 'demo_script.py', 9, '', 'loonrobot', '2018-05-16 07:31:29.552179', '2018-05-16 07:31:29.552446', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (49, 17, 9, '同意', 1, 'guiji', 8, '', 'guiji', '2018-05-16 23:21:00.251306', '2018-05-16 23:21:00.251363', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (50, 17, 10, 'lilei\n', 6, 'demo_script.py', 9, '', 'loonrobot', '2018-05-16 23:21:00.578354', '2018-05-16 23:21:00.578555', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (51, 17, 9, '同意', 1, 'guiji', 8, '', 'guiji', '2018-05-16 23:24:03.606092', '2018-05-16 23:24:03.606156', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (52, 17, 10, 'lilei\n', 6, 'demo_script.py', 9, '', 'loonrobot', '2018-05-16 23:24:03.779136', '2018-05-16 23:24:03.779504', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (53, 17, 9, '同意', 1, 'guiji', 8, '', 'guiji', '2018-05-16 23:24:44.286319', '2018-05-16 23:24:44.286429', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (54, 17, 10, 'lilei\n', 6, 'demo_script.py', 9, '', 'loonrobot', '2018-05-16 23:24:44.338829', '2018-05-16 23:24:44.339101', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (55, 17, 9, '同意', 1, 'guiji', 8, '', 'guiji', '2018-05-16 23:33:26.619543', '2018-05-16 23:33:26.619613', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (56, 17, 10, 'lilei\n', 6, 'demo_script.py', 9, '', 'loonrobot', '2018-05-16 23:33:26.803850', '2018-05-16 23:33:26.804073', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (57, 17, 0, '请处理', 1, 'lilei', 10, '', 'lilei', '2018-05-17 06:45:58.830078', '2018-05-17 06:45:58.830167', 0, 1);
INSERT INTO `ticket_ticketflowlog` VALUES (58, 17, 0, '请协助处理', 1, 'zhangsan', 10, '', 'zhangsan', '2018-05-17 06:47:46.380983', '2018-05-17 06:47:46.381055', 0, 2);
INSERT INTO `ticket_ticketflowlog` VALUES (59, 19, 1, '', 1, 'admin', 1, '{\"leave_days\": \"2\", \"leave_proxy\": \"admin\", \"title\": \"testt\", \"in_add_node\": false, \"is_deleted\": false, \"gmt_modified\": \"2018-10-19 00:08:40.380672\", \"add_node_man\": \"\", \"sn\": \"loonflow_201810190001\", \"leave_type\": \"2\", \"gmt_created\": \"2018-10-19 00:08:40.371908\", \"parent_ticket_id\": 0, \"leave_reason\": \"<p>teste</p>\", \"leave_start\": \"2018-10-20 09:00:00\", \"participant_type_id\": 1, \"state_id\": 3, \"workflow_id\": 1, \"parent_ticket_state_id\": 0, \"relation\": \"admin\", \"participant\": \"admin\", \"leave_end\": \"2018-10-21 18:00:00\", \"creator\": \"admin\"}', 'admin', '2018-10-19 00:08:40.466104', '2018-10-19 00:08:40.466128', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (60, 20, 1, '', 1, 'admin', 1, '{\"leave_reason\": \"<p>dfsf</p>\", \"sn\": \"loonflow_201810190002\", \"add_node_man\": \"\", \"leave_days\": \"2\", \"participant\": \"admin\", \"title\": \"teste\", \"gmt_modified\": \"2018-10-19 00:38:41.359283\", \"workflow_id\": 1, \"creator\": \"admin\", \"leave_start\": \"2018-10-19 12:00:00\", \"is_deleted\": false, \"parent_ticket_id\": 0, \"relation\": \"admin\", \"leave_type\": \"2\", \"leave_end\": \"2018-10-20 12:00:00\", \"state_id\": 3, \"in_add_node\": false, \"leave_proxy\": \"admin\", \"participant_type_id\": 1, \"gmt_created\": \"2018-10-19 00:38:41.354008\", \"parent_ticket_state_id\": 0}', 'admin', '2018-10-19 00:38:41.428448', '2018-10-19 00:38:41.428473', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (61, 20, 3, 'fdsfsf', 1, 'admin', 3, '{\"leave_reason\": \"<p>dfsf</p>\", \"sn\": \"loonflow_201810190002\", \"add_node_man\": \"\", \"leave_days\": \"2\", \"participant\": \"jack\", \"title\": \"teste\", \"gmt_modified\": \"2018-10-19 00:38:53.872124\", \"workflow_id\": 1, \"creator\": \"admin\", \"leave_start\": \"2018-10-19 12:00:00\", \"is_deleted\": false, \"parent_ticket_id\": 0, \"relation\": \"jack,admin\", \"leave_type\": \"2\", \"leave_end\": \"2018-10-20 12:00:00\", \"state_id\": 4, \"in_add_node\": false, \"leave_proxy\": \"admin\", \"participant_type_id\": 1, \"gmt_created\": \"2018-10-19 00:38:41.354008\", \"parent_ticket_state_id\": 0}', 'admin', '2018-10-19 00:38:53.942394', '2018-10-19 00:38:53.942431', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (62, 21, 15, '', 1, 'admin', 13, '{\"gmt_modified\": \"2018-10-21 11:14:37.663604\", \"gmt_created\": \"2018-10-21 11:14:37.656067\", \"creator\": \"admin\", \"parent_ticket_state_id\": 0, \"participant\": \"loonrobot\", \"workflow_id\": 3, \"parent_ticket_id\": 0, \"in_add_node\": false, \"project_qas\": \"admin\", \"participant_type_id\": 1, \"relation\": \"loonrobot,admin\", \"project_devs\": \"admin\", \"state_id\": 14, \"is_deleted\": false, \"sn\": \"loonflow_201810210001\", \"add_node_man\": \"\", \"title\": \"\", \"project_code\": \"prj001\"}', 'admin', '2018-10-21 11:14:37.775029', '2018-10-21 11:14:37.775227', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (63, 19, 5, '111', 1, 'jack', 4, '{\"leave_end\": \"2018-10-21 18:00:00\", \"parent_ticket_state_id\": 0, \"participant_type_id\": 0, \"title\": \"testt\", \"sn\": \"loonflow_201810190001\", \"leave_reason\": \"<p>teste</p>\", \"gmt_modified\": \"2018-10-21 20:06:57.527067\", \"participant\": \"\", \"parent_ticket_id\": 0, \"workflow_id\": 1, \"relation\": \"jack,admin\", \"is_deleted\": false, \"creator\": \"admin\", \"leave_type\": \"2\", \"add_node_man\": \"\", \"leave_start\": \"2018-10-20 09:00:00\", \"in_add_node\": false, \"state_id\": 5, \"leave_proxy\": \"admin\", \"leave_days\": \"2\", \"gmt_created\": \"2018-10-19 00:08:40.371908\"}', 'jack', '2018-10-21 20:06:57.579230', '2018-10-21 20:06:57.579267', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (115, 32, 21, '', 1, 'WH_A', 12, '{\"gmt_created\": \"2019-12-09 17:17:02\", \"parent_ticket_id\": 0, \"state_id\": 14, \"creator\": \"WH_A\", \"script_run_last_result\": true, \"sn\": \"loonflow_201912090008\", \"sec_name\": \"\\u800c\\u4e3a\\u989d\", \"title\": \"\\u5730\\u65b9\", \"is_rejected\": false, \"participant_type_id\": 1, \"parent_ticket_state_id\": 0, \"relation\": \"WH_A,WH_TL\", \"is_end\": false, \"multi_all_person\": \"{}\", \"sec_id\": \"\\u4e8c\\u6076\", \"in_add_node\": false, \"participant\": \"WH_TL\", \"gmt_modified\": \"2019-12-09 17:17:02\", \"workflow_id\": 3, \"id\": 32, \"sec_val\": 23.0, \"is_deleted\": false, \"add_node_man\": \"\"}', 'WH_A', '2019-12-09 17:17:02.767413', '2019-12-09 17:17:02.767413', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (116, 32, 23, '地方大幅度', 1, 'WH_TL', 14, '{\"gmt_created\": \"2019-12-09 17:17:02\", \"parent_ticket_id\": 0, \"state_id\": 15, \"creator\": \"WH_A\", \"script_run_last_result\": true, \"sn\": \"loonflow_201912090008\", \"sec_name\": \"\\u800c\\u4e3a\\u989d\", \"title\": \"\\u5730\\u65b9\", \"is_rejected\": false, \"participant_type_id\": 3, \"parent_ticket_state_id\": 0, \"relation\": \"SH_A,WH_A,SH_TL,WH_TL,SH_B\", \"is_end\": false, \"multi_all_person\": \"{}\", \"sec_id\": \"\\u4e8c\\u6076\", \"in_add_node\": false, \"participant\": \"6\", \"gmt_modified\": \"2019-12-09 17:17:20\", \"workflow_id\": 3, \"id\": 32, \"sec_val\": 23.0, \"is_deleted\": false, \"add_node_man\": \"\"}', 'WH_TL', '2019-12-09 17:17:20.080414', '2019-12-09 17:17:20.080414', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (117, 32, 24, '地方大幅度', 1, 'SH_A', 15, '{\"gmt_created\": \"2019-12-09 17:17:02\", \"parent_ticket_id\": 0, \"state_id\": 16, \"creator\": \"WH_A\", \"script_run_last_result\": true, \"sn\": \"loonflow_201912090008\", \"sec_name\": \"\\u800c\\u4e3a\\u989d\", \"title\": \"\\u5730\\u65b9\", \"is_rejected\": false, \"participant_type_id\": 6, \"parent_ticket_state_id\": 0, \"relation\": \"SH_A,WH_A,SH_TL,WH_TL,SH_B\", \"is_end\": false, \"multi_all_person\": \"{}\", \"sec_id\": \"\\u4e8c\\u6076\", \"in_add_node\": false, \"participant\": \"2\", \"gmt_modified\": \"2019-12-09 17:17:39\", \"workflow_id\": 3, \"id\": 32, \"sec_val\": 23.0, \"is_deleted\": false, \"add_node_man\": \"\"}', 'SH_A', '2019-12-09 17:17:39.102445', '2019-12-09 17:17:39.102445', 0, 0);
INSERT INTO `ticket_ticketflowlog` VALUES (118, 32, 27, 'WH_A\nloonrobot\n', 6, '脚本:(id:2, name:测试 最后执行脚本)', 16, '', 'loonrobot', '2019-12-09 17:17:39.230417', '2019-12-09 17:17:39.230417', 0, 0);

-- ----------------------------
-- Table structure for ticket_ticketrecord
-- ----------------------------
DROP TABLE IF EXISTS `ticket_ticketrecord`;
CREATE TABLE `ticket_ticketrecord`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `sn` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state_id` int(11) NOT NULL,
  `parent_ticket_id` int(11) NOT NULL,
  `parent_ticket_state_id` int(11) NOT NULL,
  `participant_type_id` int(11) NOT NULL,
  `participant` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `relation` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `add_node_man` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `in_add_node` tinyint(1) NOT NULL,
  `script_run_last_result` tinyint(1) NOT NULL,
  `is_end` tinyint(1) NOT NULL,
  `is_rejected` tinyint(1) NOT NULL,
  `multi_all_person` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of ticket_ticketrecord
-- ----------------------------
INSERT INTO `ticket_ticketrecord` VALUES (14, '12', 1, 'loonflow_201805130012', 2, 0, 0, 1, 'zhangsan', 'lilei', '2018-05-13 22:24:41.952132', '2018-08-09 07:33:44.762337', 0, 'lileilileilileilileilileilileilileilileilileilileilileilileilileilileilileilileilileililei', 'lilei', 1, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (15, '请假哈哈22哈', 1, 'loonflow_201805130013', 2, 0, 0, 5, 'creator', 'lilei', '2018-05-13 22:28:21.623510', '2018-05-14 07:07:39.579607', 0, 'lileilileililei', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (16, '请假申请3', 1, 'loonflow_201805130014', 3, 0, 0, 1, 'lilei', 'lilei', '2018-05-13 22:34:12.668018', '2018-05-13 22:34:12.668141', 0, 'lilei', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (17, 'vpn申请2', 2, 'loonflow_201805150001', 10, 0, 0, 3, '1', 'lilei', '2018-05-15 07:16:38.281209', '2018-05-22 07:26:54.685116', 0, 'guiji,wangwu,lilei', 'zhangsan', 1, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (18, 'vpn申请11', 2, 'loonflow_201805150002', 8, 0, 0, 2, 'guiji,wangwu', 'lilei', '2018-05-15 07:37:27.984815', '2018-05-21 19:27:37.550734', 0, 'lilei,guiji,wangwu', '', 0, 1, 0, 0, '{}');
INSERT INTO `ticket_ticketrecord` VALUES (32, '地方', 3, 'loonflow_201912090008', 17, 0, 0, 0, '', 'WH_A', '2019-12-09 17:17:02.571414', '2019-12-09 17:17:39.280415', 0, 'SH_A,WH_A,SH_TL,WH_TL,SH_B', '', 0, 1, 1, 0, '{}');

-- ----------------------------
-- Table structure for workflow_customfield
-- ----------------------------
DROP TABLE IF EXISTS `workflow_customfield`;
CREATE TABLE `workflow_customfield`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_id` int(11) NOT NULL,
  `field_type_id` int(11) NOT NULL,
  `field_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `field_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `order_id` int(11) NOT NULL,
  `default_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `field_template` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `boolean_field_display` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `field_choice` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of workflow_customfield
-- ----------------------------
INSERT INTO `workflow_customfield` VALUES (1, 1, 30, 'leave_start', '开始时间', 20, NULL, '', '', '{}', 'admin', '2018-04-23 20:56:25.940486', '2018-05-11 07:31:11.133782', 0, '{}', '');
INSERT INTO `workflow_customfield` VALUES (2, 1, 30, 'leave_end', '结束时间', 25, NULL, '', '', '{}', 'admin', '2018-05-10 07:41:03.717540', '2018-05-11 07:31:19.923554', 0, '{}', '');
INSERT INTO `workflow_customfield` VALUES (3, 1, 5, 'leave_days', '请假天数(0.5的倍数)', 30, NULL, '前端根据起止时间自动计算', '', '{}', 'admin', '2018-05-11 07:28:31.649506', '2018-05-11 07:31:28.835612', 0, '{}', '');
INSERT INTO `workflow_customfield` VALUES (4, 1, 60, 'leave_proxy', '代理人', 35, NULL, '请假期间的代理人', '', '{}', 'admin', '2018-05-11 07:31:01.068850', '2018-05-11 07:31:35.323117', 0, '{}', '');
INSERT INTO `workflow_customfield` VALUES (5, 1, 35, 'leave_type', '请假类型', 40, NULL, '', '', '{}', 'admin', '2018-05-11 07:34:29.608579', '2018-05-23 22:38:57.324916', 0, '{\"1\": \"年假\", \"2\": \"调休\", \"3\": \"病假\", \"4\": \"婚假\"}', '');
INSERT INTO `workflow_customfield` VALUES (6, 1, 55, 'leave_reason', '请假原因及相关附件', 45, NULL, '', '病假请提供证明拍照附件， 婚假请提供结婚证拍照附件', '{}', 'admin', '2018-05-11 07:36:41.882377', '2018-05-11 07:36:41.882413', 0, '{}', '');
INSERT INTO `workflow_customfield` VALUES (7, 2, 55, 'vpn_reason', '申请原因', 110, '请填写申请vpn的理由', 'vpn申请原因', '', '{}', 'admin', '2018-05-12 10:02:31.501142', '2018-05-12 10:02:31.501189', 0, '{}', '');
INSERT INTO `workflow_customfield` VALUES (8, 3, 5, 'sec_id', '指标id', 21, '', '表示 指标 在数据库的表示id', '', '{}', 'admin', '2019-12-06 17:37:54.887358', '2019-12-06 17:37:54.887358', 0, '{}', '{}');
INSERT INTO `workflow_customfield` VALUES (9, 3, 5, 'sec_name', '指标名称', 22, '', '表示指标的名称', '请填写指标名称', '{}', 'admin', '2019-12-06 17:39:25.367434', '2019-12-06 17:39:25.367434', 0, '{}', '{}');
INSERT INTO `workflow_customfield` VALUES (10, 3, 15, 'sec_val', '指标的值', 23, '', '', '', '{}', 'admin', '2019-12-06 17:39:53.751445', '2019-12-06 17:39:53.751445', 0, '{}', '{}');

-- ----------------------------
-- Table structure for workflow_customnotice
-- ----------------------------
DROP TABLE IF EXISTS `workflow_customnotice`;
CREATE TABLE `workflow_customnotice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `script` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `title_template` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content_template` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of workflow_customnotice
-- ----------------------------
INSERT INTO `workflow_customnotice` VALUES (1, '测试', '地方', 'notice_script/0c616390-1a4b-11ea-9cff-0857001bd263.py', '你有一个待办工单:{title}', '标题:{title}, 创建时间:{gmt_created}', 'admin', '2019-12-09 14:13:42.081993', '2019-12-09 14:13:42.081993', 0);

-- ----------------------------
-- Table structure for workflow_state
-- ----------------------------
DROP TABLE IF EXISTS `workflow_state`;
CREATE TABLE `workflow_state`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `sub_workflow_id` int(11) NOT NULL,
  `is_hidden` tinyint(1) NOT NULL,
  `order_id` int(11) NOT NULL,
  `type_id` int(11) NOT NULL,
  `participant_type_id` int(11) NOT NULL,
  `participant` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `distribute_type_id` int(11) NOT NULL,
  `state_field_str` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `label` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `remember_last_man_enable` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of workflow_state
-- ----------------------------
INSERT INTO `workflow_state` VALUES (1, '新建中', 1, 0, 0, 0, 1, 1, 'dfdfdgree', 1, '{\"leave_proxy\":2,\"leave_type\":2,\"leave_days\":2,\"leave_start\":2,\"leave_end\":2,\"title\":2,\"leave_reason\":2}', '{}', 'admin', '2018-04-23 20:53:33.052134', '2018-05-13 11:42:11.273695', 0, 0);
INSERT INTO `workflow_state` VALUES (2, '发起人-编辑中', 1, 0, 1, 2, 0, 5, 'creator', 1, '{\"sn\":1,  \"title\":2, \"leave_start\": 2,  \"leave_end\":2,  \"leave_days\":2,  \"leave_proxy\":2,  \"leave_type\":2, \"creator\":1, \"gmt_created\":1,  \"leave_reason\":2, \"state.state_name\":1}', '{}', 'admin', '2018-04-30 15:45:48.976712', '2018-05-14 06:44:10.661777', 0, 0);
INSERT INTO `workflow_state` VALUES (3, 'TL审批中', 1, 0, 0, 3, 0, 5, 'creator_tl', 1, '{\"sn\":1,  \"title\":1, \"leave_start\": 1,  \"leave_end\":1,  \"leave_days\":1,  \"leave_proxy\":1,  \"leave_type\":1, \"creator\":1, \"gmt_created\":1,  \"leave_reason\":1}', '{}', 'admin', '2018-04-30 15:46:42.184252', '2018-05-13 11:42:46.035705', 0, 0);
INSERT INTO `workflow_state` VALUES (4, '人事部门-处理中', 1, 0, 0, 4, 0, 1, 'jack', 1, '{\"sn\":1,  \"title\":1, \"leave_start\": 1,  \"leave_end\":1,  \"leave_days\":1,  \"leave_proxy\":1,  \"leave_type\":1, \"creator\":1, \"gmt_created\":1,  \"leave_reason\":1}', '{}', 'admin', '2018-04-30 15:47:58.790510', '2018-05-13 11:42:59.834440', 0, 0);
INSERT INTO `workflow_state` VALUES (5, '结束', 1, 0, 0, 6, 2, 0, '', 1, '{}', '{}', 'admin', '2018-04-30 15:51:41.260309', '2018-05-11 06:52:39.799922', 0, 0);
INSERT INTO `workflow_state` VALUES (6, '发起人-新建中', 2, 0, 0, 1, 1, 5, 'creator', 1, '{\"vpn_reason\":2, \"title\":2}', '{}', 'admin', '2018-05-10 07:34:45.302697', '2018-05-15 07:13:06.599270', 0, 0);
INSERT INTO `workflow_state` VALUES (7, '发起人tl-审批中', 2, 0, 0, 2, 0, 5, 'creator_tl', 2, '{\"sn\":1,  \"title\":1, \"creator\":1, \"gmt_created\":1,  \"vpn_reason\":1}', '{}', 'admin', '2018-05-11 06:47:36.381658', '2018-05-15 07:19:16.038155', 0, 0);
INSERT INTO `workflow_state` VALUES (8, '运维人员-审批中', 2, 0, 0, 3, 0, 3, '3', 1, '{\"sn\":1,  \"title\":1, \"creator\":1, \"gmt_created\":1,  \"vpn_reason\":1,\"participant_info.participant_alias\":1,\"participant_info.participant_name\":1}', '{}', 'admin', '2018-05-11 06:48:26.945117', '2018-07-14 11:23:28.865836', 0, 0);
INSERT INTO `workflow_state` VALUES (9, '授权脚本-自动执行中', 2, 0, 0, 4, 0, 6, '1', 1, '{}', '{}', 'admin', '2018-05-11 06:50:09.416344', '2018-05-11 07:10:25.197748', 0, 0);
INSERT INTO `workflow_state` VALUES (10, '发起人-确认中', 2, 0, 0, 6, 0, 5, 'creator', 1, '{\"workflow.workflow_name\":1,\"sn\":1,\"state.state_name\":1,\"participant_info.participant_name\":1}', '{}', 'admin', '2018-05-11 06:51:02.913212', '2018-05-22 22:21:51.867707', 0, 0);
INSERT INTO `workflow_state` VALUES (11, '结束', 2, 0, 0, 7, 2, 0, '', 1, '{}', '{}', 'admin', '2018-05-11 07:11:53.076731', '2018-05-11 07:11:53.076766', 0, 0);
INSERT INTO `workflow_state` VALUES (12, '新建中', 3, 0, 0, 0, 1, 5, 'creator', 1, '{\"sec_name\":2,\"title\":2,\"sec_id\":2,\"sec_val\":2}', '{}', 'admin', '2019-12-06 17:47:28.946503', '2019-12-06 17:47:28.946503', 0, 1);
INSERT INTO `workflow_state` VALUES (13, '发起人编辑中', 3, 0, 0, 1, 0, 5, 'creator', 1, '{\"sec_name\":2,\"title\":2,\"sec_val\":2,\"sec_id\":2}', '{}', 'admin', '2019-12-06 17:48:31.688799', '2019-12-06 17:48:31.688799', 0, 1);
INSERT INTO `workflow_state` VALUES (14, '维护人TL审核中', 3, 0, 0, 3, 0, 5, 'creator_tl', 2, '{\"sec_name\":1,\"sec_id\":1,\"sec_val\":1,\"title\":1}', '{}', 'admin', '2019-12-06 17:49:34.873678', '2019-12-06 17:49:34.873678', 0, 1);
INSERT INTO `workflow_state` VALUES (15, '审核人审核中', 3, 0, 0, 4, 0, 3, '6', 2, '{\"sec_name\":1,\"title\":1,\"sec_id\":1,\"sec_val\":1}', '{}', 'admin', '2019-12-06 17:53:06.938885', '2019-12-06 17:53:06.938885', 0, 1);
INSERT INTO `workflow_state` VALUES (16, '结束', 3, 0, 0, 5, 0, 6, '2', 2, '{\"sec_id\":1,\"sec_val\":1,\"sec_name\":1,\"title\":1}', '{}', 'admin', '2019-12-06 17:54:36.232907', '2019-12-06 17:54:36.232907', 0, 1);
INSERT INTO `workflow_state` VALUES (17, '工作流收尾脚本', 3, 0, 0, 0, 2, 0, '', 2, '{\"title\":2}', '{}', 'admin', '2019-12-09 17:14:07.627414', '2019-12-09 17:14:07.627414', 0, 1);

-- ----------------------------
-- Table structure for workflow_transition
-- ----------------------------
DROP TABLE IF EXISTS `workflow_transition`;
CREATE TABLE `workflow_transition`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `workflow_id` int(11) NOT NULL,
  `transition_type_id` int(11) NOT NULL,
  `source_state_id` int(11) NOT NULL,
  `destination_state_id` int(11) NOT NULL,
  `alert_enable` tinyint(1) NOT NULL,
  `alert_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `field_require_check` tinyint(1) NOT NULL,
  `timer` int(11) NOT NULL,
  `attribute_type_id` int(11) NOT NULL,
  `condition_expression` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of workflow_transition
-- ----------------------------
INSERT INTO `workflow_transition` VALUES (1, '提交', 1, 1, 1, 3, 0, '必填项', 'admin', '2018-04-24 07:09:25.922814', '2018-04-30 15:48:57.047369', 0, 1, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (2, '保存', 1, 1, 1, 2, 0, '', 'admin', '2018-04-30 15:30:25.650813', '2018-04-30 15:48:52.372363', 0, 1, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (3, '同意', 1, 1, 3, 4, 0, '', 'admin', '2018-04-30 15:49:23.451582', '2018-04-30 15:49:23.451627', 0, 1, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (4, '拒绝', 1, 1, 3, 2, 1, '请确认是否真的拒绝', 'admin', '2018-04-30 15:54:32.069649', '2018-05-11 07:00:24.370322', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (5, '同意', 1, 1, 4, 5, 0, '', 'admin', '2018-04-30 15:55:00.072437', '2018-05-11 07:03:29.349770', 0, 1, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (6, '退回', 1, 1, 4, 2, 0, '', 'admin', '2018-05-11 06:58:43.395655', '2018-05-11 07:04:14.896678', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (7, '提交', 2, 1, 6, 7, 0, '', 'admin', '2018-05-11 07:06:22.745312', '2018-05-11 07:06:22.745342', 0, 1, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (8, '同意', 2, 1, 7, 8, 0, '', 'admin', '2018-05-11 07:07:33.213731', '2018-05-11 07:07:33.213760', 0, 1, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (9, '同意', 2, 1, 8, 9, 0, '', 'admin', '2018-05-11 07:12:53.036037', '2018-05-11 07:12:53.036077', 0, 1, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (10, '脚本执行完成', 2, 1, 9, 10, 0, '', 'admin', '2018-05-11 07:13:12.070223', '2018-05-11 07:13:12.070254', 0, 1, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (11, '确认完成', 2, 1, 10, 11, 0, '', 'admin', '2018-05-11 07:13:52.427815', '2018-05-11 07:13:52.427844', 0, 1, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (12, '未生效', 2, 1, 10, 8, 1, '是否真的退回？  请查看vpn使用文档保证使用姿势正确，再退回', 'admin', '2018-05-11 07:16:26.826525', '2018-05-11 07:16:36.072876', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (13, '提交', 1, 1, 2, 3, 0, '', 'admin', '2018-05-13 22:34:55.808381', '2018-05-13 22:34:55.808461', 0, 1, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (14, '保存', 1, 1, 2, 2, 0, '', 'admin', '2018-05-13 22:35:05.020546', '2018-05-13 22:35:05.020615', 0, 1, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (21, '提交审核', 3, 1, 12, 14, 0, '请填写必填项', 'admin', '2019-12-09 13:32:21.598226', '2019-12-09 13:32:21.598226', 0, 1, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (22, '审核拒绝并退回', 3, 1, 14, 13, 0, '', 'admin', '2019-12-09 13:33:23.562367', '2019-12-09 13:33:23.562367', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (23, '审核通过', 3, 1, 14, 15, 0, '', 'admin', '2019-12-09 13:33:46.049336', '2019-12-09 13:33:46.049336', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (24, '审核通过', 3, 1, 15, 16, 0, '', 'admin', '2019-12-09 13:34:27.789763', '2019-12-09 13:34:27.789763', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (25, '审核拒绝并退回', 3, 1, 15, 13, 0, '', 'admin', '2019-12-09 13:34:43.377996', '2019-12-09 13:34:43.377996', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (26, '重新提交', 3, 1, 13, 14, 0, '', 'admin', '2019-12-09 13:35:01.766179', '2019-12-09 13:35:01.766179', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (27, '收尾任务', 3, 1, 16, 17, 0, '', 'admin', '2019-12-09 17:14:51.320415', '2019-12-09 17:14:51.320415', 0, 0, 0, 1, '[]');

-- ----------------------------
-- Table structure for workflow_workflow
-- ----------------------------
DROP TABLE IF EXISTS `workflow_workflow`;
CREATE TABLE `workflow_workflow`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `flowchart` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `display_form_str` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  `view_permission_check` tinyint(1) NOT NULL,
  `limit_expression` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `notices` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of workflow_workflow
-- ----------------------------
INSERT INTO `workflow_workflow` VALUES (1, '请假申请', '请假申请', '', '[\"sn\", \"title\", \"leave_start\", \"leave_end\", \"leave_days\", \"leave_proxy\",  \"leave_type\", \"creator\", \"gmt_created\", \"leave_reason\"]', 'admin', '2018-04-23 20:49:32.229386', '2018-10-22 08:05:15.574860', 0, 0, '{}', '2');
INSERT INTO `workflow_workflow` VALUES (2, 'vpn申请', 'vpn权限申请', 'flowchart/WechatIMG242_YpFQb5K.jpeg', '[\"sn\", \"title\", \"model\", \"gmt_created\",\"participant.participant_alias\"]', 'admin', '2018-05-06 12:32:36.690665', '2018-07-14 11:18:48.975018', 0, 1, '{}', '');
INSERT INTO `workflow_workflow` VALUES (3, 'nlp审核', '审核nlp指标数据', '', '[]', '', '2019-12-06 16:34:43.321629', '2019-12-06 16:34:43.322630', 0, 0, '{}', '1');

-- ----------------------------
-- Table structure for workflow_workflowscript
-- ----------------------------
DROP TABLE IF EXISTS `workflow_workflowscript`;
CREATE TABLE `workflow_workflowscript`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `saved_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL,
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gmt_created` datetime(6) NOT NULL,
  `gmt_modified` datetime(6) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of workflow_workflowscript
-- ----------------------------
INSERT INTO `workflow_workflowscript` VALUES (1, 'demo脚本', 'demo_script.py', '示例脚本', 1, 'admin', '2019-11-05 00:00:00.000000', '2019-11-05 00:00:00.000000', 0);
INSERT INTO `workflow_workflowscript` VALUES (2, '测试 最后执行脚本', 'workflow_script/33894d00-1a61-11ea-bba2-0857001bd263.py', '地方', 1, 'admin', '2019-12-09 16:52:16.702749', '2019-12-09 16:52:16.702749', 0);

SET FOREIGN_KEY_CHECKS = 1;
