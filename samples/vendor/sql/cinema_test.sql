/*
 Navicat Premium Data Transfer

 Source Server         : 公司
 Source Server Type    : MySQL
 Source Server Version : 50724
 Source Host           : 192.168.3.239:3306
 Source Schema         : cinema_test

 Target Server Type    : MySQL
 Target Server Version : 50724
 File Encoding         : 65001

 Date: 27/04/2021 10:18:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ca_adverting_material
-- ----------------------------
DROP TABLE IF EXISTS `ca_adverting_material`;
CREATE TABLE `ca_adverting_material`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT '所属组织ID',
  `org_tag` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织标志',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '素材名称',
  `advertiser_resource_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告主云盘地址',
  `advertiser_resource_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告主云盘密码',
  `assistant_resource_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商务人员主云盘地址',
  `assistant_resource_password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商务人员云盘密码',
  `file_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '素材url',
  `another_resource_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '其他方式',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除状态（0-未删除，1-已删除）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明 备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `org_id`(`org_id`, `name`) USING BTREE,
  UNIQUE INDEX `org_id_2`(`org_id`, `file_url`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_adverting_material
-- ----------------------------
INSERT INTO `ca_adverting_material` VALUES (4, 100000000000000010, NULL, '广告素材', 'http://www.baiduyun.com', 'aaa', NULL, NULL, NULL, NULL, '0', '2020-10-08 16:46:51', '2020-10-08 16:46:51', NULL);
INSERT INTO `ca_adverting_material` VALUES (5, 100000000000000064, NULL, '广告素材', 'http://www.baiduyun.com', NULL, NULL, NULL, NULL, NULL, '0', '2020-10-08 17:26:00', '2020-10-08 17:26:00', NULL);
INSERT INTO `ca_adverting_material` VALUES (6, 100000000000000077, NULL, '广告', 'http://www.baiduyun.com', NULL, NULL, NULL, NULL, NULL, '1', '2020-10-09 16:33:43', '2020-10-17 10:00:37', NULL);
INSERT INTO `ca_adverting_material` VALUES (7, 100000000000000073, NULL, '广告', 'http://www.baiduyun.com', NULL, 'http://1212', NULL, NULL, NULL, '0', '2020-10-09 17:12:36', '2020-10-09 17:12:36', '1212');
INSERT INTO `ca_adverting_material` VALUES (8, 100000000000000085, NULL, '速速', 'http://www.baiduyun.com', '111111', 'http://www.baidu.com', NULL, NULL, 'http://www.Tencentyun.com', '0', '2020-10-10 17:46:37', '2020-10-10 17:46:37', '密码:123456');
INSERT INTO `ca_adverting_material` VALUES (9, 100000000000000085, NULL, '阿里云', 'http://www.aliyun.com', '111111', NULL, NULL, NULL, NULL, '0', '2020-10-10 17:48:27', '2020-10-10 17:48:27', NULL);
INSERT INTO `ca_adverting_material` VALUES (10, 100000000000000085, NULL, '腾讯云', 'http://www.Tencentyun.com', NULL, 'http://www.jhfk.com', NULL, NULL, NULL, '0', '2020-10-10 17:48:51', '2020-10-10 17:48:51', '1111');
INSERT INTO `ca_adverting_material` VALUES (11, 100000000000000073, NULL, '素材', 'http://www.Tencentyun.com', '111111', NULL, NULL, NULL, NULL, '1', '2020-10-16 10:15:17', '2020-10-17 10:00:29', NULL);
INSERT INTO `ca_adverting_material` VALUES (12, 100000000000000088, NULL, '素材', 'http://www.baiduyun.com', '111111', 'http://www.douyin.com', NULL, NULL, NULL, '0', '2020-10-16 11:28:05', '2020-10-16 11:28:05', '抖音素材\n密码:123456');
INSERT INTO `ca_adverting_material` VALUES (13, 100000000000000090, NULL, '广告', 'http://www.baiduyun.com', '111111', 'http://www.baodu.com', NULL, NULL, NULL, '0', '2020-10-16 16:12:10', '2020-10-16 16:12:10', NULL);
INSERT INTO `ca_adverting_material` VALUES (14, 100000000000000090, NULL, '素材', 'http://www.Tencentyun.com', '123456', 'http://www.tencent.com', NULL, NULL, NULL, '0', '2020-10-16 16:12:19', '2020-10-16 16:12:19', '素材');
INSERT INTO `ca_adverting_material` VALUES (15, 100000000000000109, NULL, 'toufang', 'http://www.baiduyun.com', '111111', 'http://www.baiduyun.com', NULL, NULL, NULL, '0', '2020-10-20 10:36:08', '2020-10-20 10:36:08', '123456');

-- ----------------------------
-- Table structure for ca_adverting_plan
-- ----------------------------
DROP TABLE IF EXISTS `ca_adverting_plan`;
CREATE TABLE `ca_adverting_plan`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT '所属组织ID',
  `org_tag` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织标志',
  `film_id` bigint(20) NULL DEFAULT NULL COMMENT '影片id(可以为空)',
  `advertiser_id` bigint(20) NOT NULL COMMENT '广告主id',
  `assistant_id` bigint(20) NOT NULL COMMENT '店小二id',
  `plan_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '计划编号',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告名称',
  `budget` decimal(10, 2) NULL DEFAULT NULL COMMENT '广告预算',
  `time_slot` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告播放时间段（一分钟内、1-3分钟、3分钟后）',
  `release_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告投放类型(贴片， 按场次)',
  `release_start_time` datetime NULL DEFAULT NULL COMMENT '投放开始日期',
  `release_end_time` datetime NULL DEFAULT NULL COMMENT '投放结束日期',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告类型',
  `duration` smallint(6) NULL DEFAULT NULL COMMENT '广告时长',
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '已选区域',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `apply_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明 备注',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '广告计划状态（待审核、已审核、已下单、已拒绝）',
  `reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '拒绝原因',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `org_id`(`org_id`, `plan_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_adverting_plan
-- ----------------------------
INSERT INTO `ca_adverting_plan` VALUES (5, 100000000000000064, NULL, 7, 3, 876708082437197836, '1314125947087228928', '七龙珠', NULL, 'IN_ONE_MINUTE', 'BY_FILM', '2020-10-09 00:00:00', '2020-10-16 00:00:00', 'SCREEN', 30, NULL, '2020-09-02 16:50:15', '2020-10-23 17:31:22', '2020-10-08 16:50:47', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (6, 100000000000000064, NULL, 2, 3, 876708082437197836, '1314140301014732800', '手机广告', NULL, 'IN_ONE_MINUTE', 'BY_FILM', '2020-10-09 00:00:00', '2020-10-16 00:00:00', 'SCREEN', 30, NULL, '2020-10-08 17:47:17', '2020-10-10 10:39:21', '2020-10-10 10:39:12', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (7, 100000000000000064, NULL, 4, 3, 876708082437197836, '1314141036620156928', '理财广告', NULL, 'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-12 00:00:00', '2020-10-16 00:00:00', 'SCREEN', 15, NULL, '2020-10-08 17:50:13', '2020-10-08 17:51:09', '2020-10-08 17:50:46', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (15, 100000000000000077, NULL, NULL, 15, 876708082437197836, '1314479862106427392', 'admin', NULL, 'AFTER_THREE_MINUTES', 'BY_ROUNDS', '2020-10-12 00:00:00', '2020-10-15 00:00:00', 'SCREEN', 15, NULL, '2020-10-09 16:16:35', '2020-10-09 16:16:35', NULL, NULL, 'TO_BE_REVIEWED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (16, 100000000000000077, NULL, 3, 15, 876708082437197836, '1314481784414670848', '店小二主管', NULL, 'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-12 00:00:00', '2020-10-14 00:00:00', 'SCENES', 30, NULL, '2020-10-09 16:24:13', '2020-10-09 16:24:13', NULL, NULL, 'TO_BE_REVIEWED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (17, 100000000000000077, NULL, 6, 15, 876708082437197836, '1314482888753942528', '店小二', NULL, 'IN_ONE_MINUTE', 'BY_FILM', '2020-10-14 00:00:00', '2020-10-16 00:00:00', 'SCENES', 30, NULL, '2020-10-09 16:28:37', '2020-10-10 10:42:17', '2020-10-10 10:42:16', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (18, 100000000000000077, NULL, NULL, 15, 876708082437197836, '1314484274933665792', '广告主', NULL, 'AFTER_THREE_MINUTES', 'BY_ROUNDS', '2020-10-21 00:00:00', '2020-10-23 00:00:00', 'SCENES', 30, NULL, '2020-10-09 16:34:07', '2020-10-10 10:36:56', '2020-10-10 10:36:44', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (19, 100000000000000073, NULL, NULL, 11, 876708082437197848, '1314494040154181632', '短信', NULL, 'AFTER_THREE_MINUTES', 'BY_ROUNDS', '2020-10-13 00:00:00', '2020-10-15 00:00:00', 'SCREEN', 15, NULL, '2020-10-09 17:12:55', '2020-10-09 17:15:35', '2020-10-09 17:15:24', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (20, 100000000000000077, NULL, 4, 15, 876708082437197836, '1314499228562755584', '中文', NULL, 'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-13 00:00:00', '2020-10-16 00:00:00', 'SCREEN', 45, NULL, '2020-10-09 17:33:32', '2020-10-09 17:36:18', '2020-10-09 17:36:11', NULL, 'ORDER_PLACED', '资料不明确，请重新修改再提交\n');
INSERT INTO `ca_adverting_plan` VALUES (21, 100000000000000077, NULL, NULL, 15, 876708082437197836, '1314524161200230400', '广告', NULL, 'AFTER_THREE_MINUTES', 'BY_ROUNDS', '2020-10-21 00:00:00', '2020-10-23 00:00:00', 'SCENES', 15, NULL, '2020-10-09 19:12:37', '2020-10-09 19:15:24', '2020-10-09 19:15:22', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (24, 100000000000000064, NULL, 3, 3, 876708082437197836, '1314742795306668032', '家装', NULL, 'IN_ONE_MINUTE', 'BY_FILM', '2020-10-21 00:00:00', '2020-10-23 00:00:00', 'SCENES', 30, NULL, '2020-10-10 09:41:23', '2020-10-10 10:18:35', '2020-10-10 10:18:30', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (25, 100000000000000077, NULL, 3, 15, 876708082437197836, '1314744089199120384', '汽车广告', NULL, 'IN_ONE_MINUTE', 'BY_FILM', '2020-10-21 00:00:00', '2020-10-31 00:00:00', 'SCREEN', 45, NULL, '2020-10-10 09:46:32', '2020-10-10 09:47:01', '2020-10-10 09:46:48', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (26, 100000000000000064, NULL, NULL, 3, 876708082437197836, '1314751225064984576', '场次', NULL, 'IN_ONE_MINUTE', 'BY_ROUNDS', '2020-10-20 00:00:00', '2020-10-23 00:00:00', 'SCREEN', 15, NULL, '2020-10-10 10:14:53', '2020-10-10 10:17:20', '2020-10-10 10:17:17', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (27, 100000000000000077, NULL, 7, 15, 876708082437197836, '1314751565780881408', '七龙珠', NULL, 'IN_ONE_MINUTE', 'BY_FILM', '2020-10-11 00:00:00', '2020-10-16 00:00:00', 'SCREEN', 30, NULL, '2020-10-10 10:16:14', '2020-10-10 10:17:40', '2020-10-10 10:17:36', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (28, 100000000000000069, NULL, NULL, 9, 876708082437197836, '1314758353645342720', '汽广告', NULL, 'AFTER_THREE_MINUTES', 'BY_ROUNDS', '2020-10-11 00:00:00', '2020-10-18 00:00:00', 'SCREEN', 15, NULL, '2020-10-10 10:43:13', '2020-10-10 10:43:52', NULL, NULL, 'ABOLISHED', '不通过');
INSERT INTO `ca_adverting_plan` VALUES (29, 100000000000000081, NULL, NULL, 18, 876708082437197848, '1314766094967377920', '药片广告', NULL, 'IN_ONE_MINUTE', 'BY_ROUNDS', '2020-10-17 00:00:00', '2020-10-24 00:00:00', 'SCREEN', 30, NULL, '2020-10-10 11:13:58', '2020-10-10 11:14:14', '2020-10-10 11:14:12', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (30, 100000000000000064, NULL, 6, 3, 876708082437197836, '1314784270639828992', '怡宝广告', NULL, 'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-11 00:00:00', '2020-10-12 00:00:00', 'SCREEN', 30, NULL, '2020-10-10 12:26:12', '2020-10-10 12:26:38', '2020-10-10 12:26:36', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (31, 100000000000000064, NULL, NULL, 3, 876708082437197836, '1314785612036968448', '怡宝', NULL, 'IN_ONE_MINUTE', 'BY_ROUNDS', '2020-10-11 00:00:00', '2020-10-12 00:00:00', 'SCENES', 15, NULL, '2020-10-10 12:31:32', '2020-10-10 12:31:48', '2020-10-10 12:31:47', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (32, 100000000000000074, NULL, 6, 12, 876708082437197848, '1314817801722138624', '龙珠GT', NULL, 'IN_ONE_MINUTE', 'BY_FILM', '2020-10-11 00:00:00', '2020-10-23 00:00:00', 'SCREEN', 30, NULL, '2020-10-10 14:39:26', '2020-10-10 14:40:16', '2020-10-10 14:40:13', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (33, 100000000000000077, NULL, NULL, 15, 876708082437197836, '1314822938947620864', '测试test', NULL, 'AFTER_ONE_MINUTE', 'BY_ROUNDS', '2020-10-12 00:00:00', '2020-10-16 00:00:00', 'SCREEN', 30, NULL, '2020-10-10 14:59:51', '2020-10-10 15:07:39', '2020-10-10 15:07:14', NULL, 'ORDER_PLACED', '订单太多，不通过');
INSERT INTO `ca_adverting_plan` VALUES (34, 100000000000000085, NULL, 4, 22, 876708082437197836, '1314866746880036864', '饮用水广告', NULL, 'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-22 00:00:00', '2020-10-31 00:00:00', 'SCREEN', 60, NULL, '2020-10-10 17:53:56', '2020-10-10 17:53:56', NULL, NULL, 'TO_BE_REVIEWED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (35, 100000000000000085, NULL, 2, 22, 876708082437197836, '1315555480600449024', '添加', NULL, 'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-13 00:00:00', '2020-10-17 00:00:00', 'SCREEN', 30, NULL, '2020-10-12 15:30:43', '2020-10-12 15:33:28', NULL, NULL, 'REVIEW_REJECTED', '计划填写有误，请重新填写');
INSERT INTO `ca_adverting_plan` VALUES (36, 100000000000000085, NULL, 7, 22, 876708082437197836, '1315555906703986688', '广告拒绝测试', NULL, 'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-13 00:00:00', '2020-11-09 00:00:00', 'SCREEN', 15, NULL, '2020-10-12 15:32:24', '2020-10-12 15:36:50', '2020-10-12 15:36:50', NULL, 'REVIEW_APPROVED', '不合法广告');
INSERT INTO `ca_adverting_plan` VALUES (37, 100000000000000085, NULL, NULL, 22, 876708082437197836, '1315558914611351552', 'test', NULL, 'AFTER_ONE_MINUTE', 'BY_ROUNDS', '2020-10-13 00:00:00', '2020-10-24 00:00:00', 'SCENES', 30, NULL, '2020-09-01 15:44:21', '2020-10-21 11:51:43', '2020-10-12 15:46:36', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (38, 100000000000000085, NULL, NULL, 22, 876708082437197836, '1315837846652850176', '详情', NULL, 'AFTER_THREE_MINUTES', 'BY_ROUNDS', '2020-10-21 00:00:00', '2020-10-24 00:00:00', NULL, 30, NULL, '2020-10-13 10:12:44', '2020-10-13 11:50:38', NULL, NULL, 'REVIEW_REJECTED', '拒绝你');
INSERT INTO `ca_adverting_plan` VALUES (39, 100000000000000085, NULL, 3, 22, 876708082437197836, '1315849008987639808', '查看', 0.00, 'AFTER_ONE_MINUTE', 'BY_FILM', '2020-11-01 00:00:00', '2020-11-04 00:00:00', NULL, 30, NULL, '2020-10-13 10:57:05', '2020-10-13 11:49:50', '2020-10-13 11:49:32', NULL, 'ORDER_PLACED', '重新填写\n');
INSERT INTO `ca_adverting_plan` VALUES (40, 100000000000000073, NULL, 7, 11, 876708082437197848, '1315854322013179904', '榴莲广告', NULL, 'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-14 00:00:00', '2020-11-11 00:00:00', NULL, 15, NULL, '2020-10-13 11:18:12', '2020-10-13 12:31:38', '2020-10-13 12:31:30', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (41, 100000000000000073, NULL, 7, 11, 876708082437197848, '1315901516816715776', '山竹', NULL, 'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-14 00:00:00', '2020-11-11 00:00:00', NULL, 15, NULL, '2020-10-13 14:25:44', '2020-10-13 14:25:55', '2020-10-13 14:25:52', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (42, 100000000000000073, NULL, 7, 11, 876708082437197848, '1315936697535565824', '水蜜桃', NULL, 'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-14 00:00:00', '2020-11-10 00:00:00', NULL, 15, NULL, '2020-10-13 16:45:32', '2020-10-13 16:45:32', NULL, NULL, 'TO_BE_REVIEWED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (43, 100000000000000073, NULL, 3, 11, 876708082437197848, '1315937651794251776', '香橙广告', NULL, 'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-14 00:00:00', '2020-11-10 00:00:00', NULL, 15, NULL, '2020-10-13 16:49:19', '2020-10-13 17:03:41', '2020-10-13 17:03:38', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (44, 100000000000000085, NULL, 4, 22, 876708082437197836, '1316211096159391744', '广告素材', NULL, 'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-23 00:00:00', '2020-10-25 00:00:00', NULL, 30, NULL, '2020-10-14 10:55:54', '2020-10-14 11:42:36', '2020-10-14 11:42:17', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (45, 100000000000000088, NULL, NULL, 27, 876708082437197836, '1316944099504427008', '广告场次', 14700.00, 'AFTER_THREE_MINUTES', 'BY_ROUNDS', '2020-10-22 00:00:00', '2020-10-25 00:00:00', NULL, 30, NULL, '2020-10-16 11:28:35', '2020-10-16 11:43:23', '2020-10-16 11:29:00', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (46, 100000000000000090, NULL, NULL, 1, 876708082437197836, '1317015630892896256', '水果', NULL, 'AFTER_THREE_MINUTES', 'BY_ROUNDS', '2020-10-21 00:00:00', '2020-10-24 00:00:00', NULL, 30, NULL, '2020-10-16 16:12:50', '2020-10-16 18:42:10', '2020-10-16 18:41:53', NULL, 'ORDER_PLACED', '拒绝不通过');
INSERT INTO `ca_adverting_plan` VALUES (47, 100000000000000090, NULL, NULL, 1, 876708082437197836, '1317018141569716224', '场次', NULL, 'AFTER_THREE_MINUTES', 'BY_ROUNDS', '2020-10-23 00:00:00', '2020-10-31 00:00:00', NULL, 15, NULL, '2020-10-16 16:22:48', '2020-10-16 16:22:48', NULL, NULL, 'TO_BE_REVIEWED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (48, 100000000000000090, NULL, NULL, 1, 876708082437197836, '1317043073162809344', '没素材', NULL, 'IN_ONE_MINUTE', 'BY_ROUNDS', '2020-10-21 00:00:00', '2020-10-23 00:00:00', NULL, 15, NULL, '2020-10-16 18:01:52', '2020-10-16 18:03:38', NULL, NULL, 'TO_BE_REVIEWED', '计划有误');
INSERT INTO `ca_adverting_plan` VALUES (50, 100000000000000090, NULL, 3, 1, 876708082437197836, '1317394436090630144', '测', 9800.00, 'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-30 00:00:00', '2020-11-01 00:00:00', NULL, 30, NULL, '2020-10-17 17:18:04', '2020-10-17 17:18:39', '2020-10-17 17:18:37', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (51, 100000000000000090, NULL, 2, 1, 876708082437197836, '1317410134363869184', '预算', NULL, 'AFTER_THREE_MINUTES', 'BY_FILM', '2020-10-30 00:00:00', '2020-11-04 00:00:00', NULL, 30, NULL, '2020-10-17 18:20:27', '2020-10-19 15:14:00', '2020-10-17 18:20:32', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (52, 1, NULL, 2, 1, 876708082437197836, '1317410134363869184', '测试', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2019-10-15 10:11:02', '2020-10-19 10:11:27', NULL, NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (53, 100000000000000090, NULL, NULL, 1, 876708082437197836, '1318023965641412608', 'shouji', 16200.00, 'AFTER_ONE_MINUTE', 'BY_ROUNDS', '2020-10-29 00:00:00', '2020-10-31 00:00:00', NULL, 30, NULL, '2020-10-19 10:59:35', '2020-10-19 11:22:15', '2020-10-19 11:00:39', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (54, 100000000000000090, NULL, NULL, 1, 876708082437197836, '1318087390081978368', 'test', 9800.00, 'IN_ONE_MINUTE', 'BY_ROUNDS', '2020-10-29 00:00:00', '2020-10-31 00:00:00', NULL, 30, NULL, '2020-10-19 15:11:37', '2020-10-19 15:32:56', '2020-10-19 15:32:54', NULL, 'ORDER_PLACED', '审核不通过');
INSERT INTO `ca_adverting_plan` VALUES (55, 100000000000000090, NULL, NULL, 1, 876708082437197836, '1318093841747808256', '不通过', NULL, 'AFTER_ONE_MINUTE', 'BY_ROUNDS', '2020-10-23 00:00:00', '2020-10-30 00:00:00', NULL, 15, NULL, '2020-10-19 15:37:15', '2020-10-19 15:37:22', '2020-10-19 15:37:21', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (56, 100000000000000109, NULL, NULL, 4, 876708082437197836, '1318119509965541376', '水', 4200.00, 'AFTER_THREE_MINUTES', 'BY_ROUNDS', '2020-11-04 00:00:00', '2020-11-05 00:00:00', NULL, 15, NULL, '2020-10-19 17:19:15', '2020-10-19 17:19:31', '2020-10-19 17:19:29', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (57, 100000000000000109, NULL, 766966176415744004, 4, 876708082437197836, '1318381715252711424', '贴片', 36000.00, 'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-23 00:00:00', '2020-10-31 00:00:00', NULL, 45, NULL, '2020-10-20 10:41:09', '2020-10-20 11:38:22', '2020-10-20 11:38:20', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (58, 100000000000000109, NULL, NULL, 4, 876708082437197836, '1318460323262500864', '全部', 18000.00, 'IN_ONE_MINUTE', 'BY_ROUNDS', '2020-10-25 08:00:00', '2020-10-31 08:00:00', NULL, 15, NULL, '2020-10-20 15:53:31', '2020-10-20 15:57:01', '2020-10-20 15:56:59', NULL, 'ORDER_PLACED', '长文本');
INSERT INTO `ca_adverting_plan` VALUES (59, 100000000000000109, NULL, NULL, 4, 876708082437197836, '1318736619834052608', '12345', 18900.00, 'AFTER_THREE_MINUTES', 'BY_ROUNDS', '2020-10-28 08:00:00', '2020-10-31 08:00:00', NULL, 15, NULL, '2020-10-21 10:11:25', '2020-10-21 10:12:03', '2020-10-21 10:12:02', NULL, 'ORDER_PLACED', NULL);
INSERT INTO `ca_adverting_plan` VALUES (60, 100000000000000109, NULL, 6, 4, 876708082437197836, '1319095162353356800', '执行中', NULL, 'AFTER_THREE_MINUTES', 'BY_FILM', '2020-10-29 08:00:00', '2020-11-03 08:00:00', NULL, 30, NULL, '2020-10-22 09:56:09', '2020-10-22 09:57:47', '2020-10-22 09:57:46', NULL, 'ORDER_PLACED', NULL);

-- ----------------------------
-- Table structure for ca_advertiser
-- ----------------------------
DROP TABLE IF EXISTS `ca_advertiser`;
CREATE TABLE `ca_advertiser`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告主名',
  `contact_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人名字',
  `contact_phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人电话',
  `contact_id` bigint(20) NULL DEFAULT NULL COMMENT '联系人id  有id的话按id的信息来 为空按照上面的字段为主',
  `balance` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '金额',
  `come_from` int(10) NULL DEFAULT 0 COMMENT '来源 0-系统创建 1-用户注册',
  `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'PENDING_APPROVAL' COMMENT '状态   PASS-已审核 PENDING_APPROVAL-待审核 REFUSE-已拒绝',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在地区',
  `assistant_id` bigint(20) NULL DEFAULT NULL COMMENT '店小二id',
  `org_id` bigint(20) NULL DEFAULT NULL,
  `province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在省',
  `city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在城市',
  `district` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市区',
  `id_card` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
  `id_card_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证图片',
  `id_card_back_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证图片',
  `business_license_prove` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照资质证明',
  `business_license_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照照片',
  `industry` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在行业',
  `x_industry` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在行业 x行业',
  `l_industry` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在行业 l大分类',
  `m_industry` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在行业 m中分类',
  `login_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近登录时间',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明 备注',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `contact_phone`(`contact_phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_advertiser
-- ----------------------------
INSERT INTO `ca_advertiser` VALUES (1, '大地影院', '林某', '18219300257', NULL, 0.00, 0, 'PENDING_APPROVAL', '广州', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-26 11:34:29', '2021-04-26 11:34:29', '2021-04-26 11:34:29', NULL, NULL);

-- ----------------------------
-- Table structure for ca_advertiser_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `ca_advertiser_operate_log`;
CREATE TABLE `ca_advertiser_operate_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `advertiser_id` bigint(20) NULL DEFAULT NULL COMMENT '广告主id',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '修改后状态',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告主审核记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_advertiser_operate_log
-- ----------------------------

-- ----------------------------
-- Table structure for ca_billing_strategy
-- ----------------------------
DROP TABLE IF EXISTS `ca_billing_strategy`;
CREATE TABLE `ca_billing_strategy`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '策略名称',
  `city_level` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '城市级别',
  `box_office` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '票房级别',
  `time_slot` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '广告位（时间段）',
  `release_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '投放类型',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `price` decimal(10, 2) NULL DEFAULT NULL COMMENT '单价',
  `retail_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '刊例价（零售价）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `city_level`(`city_level`, `box_office`, `time_slot`, `release_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_billing_strategy
-- ----------------------------
INSERT INTO `ca_billing_strategy` VALUES (1, '影片', 'TIER_2_CITY', 'MORE_THAN_FIFTEEN_MILLION', 'IN_ONE_MINUTE', 'BY_FILM', NULL, 300.00, 300.00, '2020-10-09 12:13:00', NULL);
INSERT INTO `ca_billing_strategy` VALUES (2, '场次', 'TIER_1_CITY', 'MORE_THAN_FIFTEEN_MILLION', 'IN_ONE_MINUTE', 'BY_ROUNDS', NULL, 350.00, 350.00, '2020-10-09 12:13:31', NULL);
INSERT INTO `ca_billing_strategy` VALUES (3, '默认策略', NULL, NULL, NULL, NULL, NULL, 100.00, NULL, '2020-10-13 14:25:14', NULL);

-- ----------------------------
-- Table structure for ca_cinema
-- ----------------------------
DROP TABLE IF EXISTS `ca_cinema`;
CREATE TABLE `ca_cinema`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影院名称',
  `line_name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影线名称',
  `pcd_id` bigint(20) NULL DEFAULT NULL COMMENT '所在省市的pcdid',
  `ticket` decimal(11, 2) NULL DEFAULT 0.00 COMMENT '票房',
  `province` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所在省',
  `city` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所在城市',
  `district` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市区',
  `area` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '地区，例如：  华北地区',
  `line_id` int(10) NULL DEFAULT NULL COMMENT '所属影线',
  `qualification_number` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '专资编号',
  `room_number` int(10) NULL DEFAULT 0 COMMENT '影厅数',
  `seat_number` int(10) NULL DEFAULT 0 COMMENT '总座位数',
  `contact_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人名字',
  `contact` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `city_level` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '一线' COMMENT '城市级别',
  `assistant_id` bigint(20) NULL DEFAULT NULL COMMENT '商务id',
  `business_area` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所属商圈',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `business_license_prove` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照资质证明',
  `business_license_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照照片',
  `import_note` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'NOT DETECTED' COMMENT '导入数据检查情况',
  `average_ticket_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '平均票价',
  `opening_time` datetime NULL DEFAULT NULL COMMENT '开业时间',
  `org_id` bigint(20) NULL DEFAULT NULL,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注 说明',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `contact`(`contact`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '影院表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_cinema
-- ----------------------------

-- ----------------------------
-- Table structure for ca_cinema_line
-- ----------------------------
DROP TABLE IF EXISTS `ca_cinema_line`;
CREATE TABLE `ca_cinema_line`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影线名称',
  `org_id` bigint(20) NOT NULL,
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明 备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '影线表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_cinema_line
-- ----------------------------

-- ----------------------------
-- Table structure for ca_film
-- ----------------------------
DROP TABLE IF EXISTS `ca_film`;
CREATE TABLE `ca_film`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影片名称',
  `manufacture_areas` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出品地区',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影片封面',
  `producer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影片出品方',
  `film_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影片编号',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 766966176415744007 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_film
-- ----------------------------
INSERT INTO `ca_film` VALUES (2, '姜子牙', '中国', 'https://ss1.bdstatic.com/70cFuXSh_Q1YnxGkpoWK1HF6hhy/it/u=1026447708,353294009&fm=26&gp=0.jpg', '中传合道文化发展有限公司、霍尔果斯彩条屋影业有限公司', 'MZ003', '2020-10-01 12:07:13', '2020-10-31 12:07:24');
INSERT INTO `ca_film` VALUES (3, '夺冠', '中国大陆', 'https://p1.meituan.net/movie/988ab3d3a50f51f31d090e84da88d5ae3461853.jpg@464w_644h_1e_1c', '华夏电影发行有限责任公司', 'DG001', '2020-09-25 16:52:11', '2020-09-21 16:52:19');
INSERT INTO `ca_film` VALUES (4, '西游记真假美猴王', '中国大陆、美国', 'https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c', '由探照灯文化传媒（北京）有限公司、上海逸亭文化传播有限公司', 'MHW000', '2020-09-23 16:55:24', '2020-09-21 16:55:32');
INSERT INTO `ca_film` VALUES (5, '海兽之子\r\n', '日本', 'https://p1.meituan.net/moviemachine/e1310fb4b0e0a98775acd6cd192808f6589939.jpg@464w_644h_1e_1c', '东宝影像事业部', 'HS005', '2020-09-21 17:01:13', '2020-09-21 17:01:13');
INSERT INTO `ca_film` VALUES (6, '花木兰', '美国', 'https://p1.meituan.net/moviemachine/ca9d0c0268a940d73d62c004d57b957a5241814.jpg@160w_220h_1e_1c', '迪士尼', 'TEST0001', '2020-09-22 09:40:26', '2020-09-22 09:40:26');
INSERT INTO `ca_film` VALUES (7, '信条', '美国', 'https://p0.meituan.net/moviemachine/40d1e5ac176f1e9258da10a3222dbff7952117.png@160w_220h_1e_1c', '美国华纳兄弟影片公司', 'TEST0002', '2020-09-22 09:44:20', '2020-09-22 09:45:02');
INSERT INTO `ca_film` VALUES (8, '急先锋', '中国大陆', 'https://p0.meituan.net/movie/d1a953193e001c8dec96c17ea5075ec0788729.jpg@464w_644h_1e_1c', '腾讯影业', 'JXF2020', '2020-09-22 15:54:18', '2020-09-22 15:55:54');
INSERT INTO `ca_film` VALUES (9, '唐人街探案3', '中国大陆', 'https://p0.meituan.net/movie/b0e0d6ce9914f37e7f9f6ade13e096342721150.jpg@464w_644h_1e_1c', '万达影视传媒有限公司、北京壹同传奇影视文化有限公司', NULL, '2020-09-22 18:34:49', '2020-09-22 18:35:48');
INSERT INTO `ca_film` VALUES (15, '七龙珠', '亚洲', NULL, '亚洲', NULL, '2020-09-25 17:39:29', '2020-09-25 17:39:29');
INSERT INTO `ca_film` VALUES (16, '米老鼠', '美洲', NULL, '美洲', NULL, '2020-09-25 17:56:33', '2020-09-25 17:56:33');
INSERT INTO `ca_film` VALUES (766966176415744002, '我和我的家乡', '中国大陆', '/attachments/bfdd62cc-c400-40c8-a20c-2fbcdbabf741.jpg', '中国电影股份有限公司', NULL, '2020-10-19 17:44:42', '2020-10-19 17:44:42');
INSERT INTO `ca_film` VALUES (766966176415744003, '一点就到家', '中国大陆', '/attachments/9968b312-2ee3-4148-b660-9a5d7c90aa0b.jpg', '阿里巴巴影业(北京)有限公司', NULL, '2020-10-19 17:45:22', '2020-10-19 17:45:22');
INSERT INTO `ca_film` VALUES (766966176415744004, '蓝色防线', '中国大陆', '/attachments/8d7e777a-33ef-4f9a-b62d-d139be14c86f.jpg', '河南电影电视制作集团有限公司', NULL, '2020-10-19 17:47:22', '2020-10-19 17:47:22');
INSERT INTO `ca_film` VALUES (766966176415744005, '八百', '中国大陆', '/attachments/1965a9c0-dc0a-48b2-bd55-2a763d5c13f3.jpg', '华谊兄弟电影有限公司', NULL, '2020-10-19 17:47:44', '2020-10-19 17:47:44');
INSERT INTO `ca_film` VALUES (766966176415744006, '哪吒', '中国大陆', NULL, '腾讯影业', NULL, '2020-10-22 14:21:14', '2020-10-22 14:21:14');

-- ----------------------------
-- Table structure for ca_film_schedule
-- ----------------------------
DROP TABLE IF EXISTS `ca_film_schedule`;
CREATE TABLE `ca_film_schedule`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `film_id` bigint(20) NULL DEFAULT NULL COMMENT '影片id',
  `film_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影片名称',
  `manufacture_areas` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出品地区',
  `producer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影片出品方',
  `film_start_time` datetime NULL DEFAULT NULL COMMENT '播放开始时间',
  `film_end_time` datetime NULL DEFAULT NULL COMMENT '播放结束时间',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '上映状态（TO_BE_RELEASE(未上映)，BEING_RELEASE(上映中)，ALREADY_RELEASED(下架)）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 768860358180864001 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_film_schedule
-- ----------------------------
INSERT INTO `ca_film_schedule` VALUES (3, NULL, '夺冠', '中国', '华夏电影发行有限责任公司', '2020-09-25 08:00:00', NULL, NULL, '2020-09-18 17:33:33', '2020-09-18 17:33:33');
INSERT INTO `ca_film_schedule` VALUES (4, NULL, '猫和老鼠', '广州海珠', '腾讯影业', '2020-09-21 11:32:05', '2020-10-24 14:41:21', NULL, '2020-09-21 11:32:08', '2020-09-22 09:43:15');
INSERT INTO `ca_film_schedule` VALUES (5, NULL, '姜子牙', '中国', '中传合道文化发展有限公司、霍尔果斯彩条屋影业有限公司', '2020-10-01 14:41:14', '2020-10-24 14:41:21', NULL, '2020-09-21 14:41:32', '2020-09-21 14:41:32');
INSERT INTO `ca_film_schedule` VALUES (757647750182469632, NULL, '八百', '中国大陆', '华谊兄弟电影有限公司', '2020-08-21 00:00:00', '2020-10-24 14:41:21', NULL, '2020-09-21 17:01:40', '2020-09-22 09:43:15');
INSERT INTO `ca_film_schedule` VALUES (757647750186663936, NULL, '花木兰', '美国,中国大陆', '美国迪士尼影片公司', '2020-09-11 00:00:00', '2020-10-24 14:41:21', NULL, '2020-09-21 17:01:40', '2020-09-22 09:42:42');
INSERT INTO `ca_film_schedule` VALUES (757647750186663937, NULL, '信条', '美国', '美国华纳兄弟影片公司', '2020-09-04 00:00:00', '2020-10-24 14:41:21', NULL, '2020-09-21 17:01:40', '2020-09-22 09:43:15');
INSERT INTO `ca_film_schedule` VALUES (757647750186663938, NULL, '夺冠', '中国大陆,中国香港', '北京嘉映春天影业有限公司', '2020-09-24 08:00:00', '2020-10-11 08:00:00', NULL, '2020-09-21 17:01:40', '2020-09-21 17:01:40');
INSERT INTO `ca_film_schedule` VALUES (757647750186663939, NULL, '蓝色防线', '中国大陆', '河南电影电视制作集团有限公司', '2020-09-17 08:00:00', '2020-10-08 08:00:00', NULL, '2020-09-21 17:01:40', '2020-09-21 17:01:40');
INSERT INTO `ca_film_schedule` VALUES (757647750186663940, NULL, '麦路人', '中国大陆,中国香港', '中国寰亚音像制品有限公司', '2020-09-16 08:00:00', '2020-10-06 08:00:00', NULL, '2020-09-21 17:01:40', '2020-09-21 17:01:40');
INSERT INTO `ca_film_schedule` VALUES (757647750186663941, NULL, '姜子牙', '中国大陆', '111', '2020-10-01 08:00:00', '2020-11-05 08:00:00', NULL, '2020-09-23 14:19:48', '2020-09-23 14:19:48');
INSERT INTO `ca_film_schedule` VALUES (757647750186663942, NULL, '西游记真假美猴王', '中国大陆', '由探照灯文化传媒（北京）有限公司、上海逸亭文化传播有限公司', '2020-10-01 08:00:00', '2020-10-22 08:00:00', NULL, '2020-09-23 14:21:16', '2020-09-23 14:21:16');
INSERT INTO `ca_film_schedule` VALUES (757647750186663943, NULL, '姜子牙', '中国大陆', '123465', '2020-10-02 08:00:00', '2020-10-04 08:00:00', NULL, '2020-09-23 19:25:26', '2020-09-23 19:25:26');
INSERT INTO `ca_film_schedule` VALUES (766605978790526976, NULL, '我和我的家乡', '中国大陆', '中国电影股份有限公司', '2020-10-20 00:00:00', '2020-11-30 00:00:00', NULL, '2020-10-16 10:18:28', '2020-10-16 10:18:28');
INSERT INTO `ca_film_schedule` VALUES (766605978794721280, NULL, '一点就到家', '中国大陆', '阿里巴巴影业(北京)有限公司', '2020-11-11 00:00:00', '2020-12-11 00:00:00', NULL, '2020-10-16 10:18:28', '2020-10-16 10:18:28');
INSERT INTO `ca_film_schedule` VALUES (768797722584023040, NULL, '我和我的家乡', '中国大陆', '中国电影股份有限公司', '2020-10-20 00:00:00', '2020-11-30 00:00:00', NULL, '2020-10-22 11:27:40', '2020-10-22 11:27:40');
INSERT INTO `ca_film_schedule` VALUES (768797722592411648, NULL, '一点就到家', '中国大陆', '阿里巴巴影业(北京)有限公司', '2020-11-11 00:00:00', '2020-12-11 00:00:00', NULL, '2020-10-22 11:27:40', '2020-10-22 11:27:40');
INSERT INTO `ca_film_schedule` VALUES (768798050704424960, NULL, '我和我的家乡', '中国大陆', '中国电影股份有限公司', '2020-10-20 00:00:00', '2020-11-30 00:00:00', NULL, '2020-10-22 11:28:58', '2020-10-22 11:28:58');
INSERT INTO `ca_film_schedule` VALUES (768798050708619264, NULL, '一点就到家', '中国大陆', '阿里巴巴影业(北京)有限公司', '2020-11-11 00:00:00', '2020-12-11 00:00:00', NULL, '2020-10-22 11:28:58', '2020-10-22 11:28:58');
INSERT INTO `ca_film_schedule` VALUES (768798050708619265, NULL, '喜宝', '中国大陆', '阿里巴巴影业(北京)有限公司', '2020-11-12 00:00:00', '2020-12-12 00:00:00', NULL, '2020-10-22 11:28:58', '2020-10-22 11:28:58');
INSERT INTO `ca_film_schedule` VALUES (768798851258646528, NULL, '哪吒', '中国大陆', '腾讯影业', '2020-09-30 08:00:00', '2020-10-30 08:00:00', NULL, '2020-10-22 11:32:09', '2020-10-22 11:32:09');
INSERT INTO `ca_film_schedule` VALUES (768798851258646529, NULL, '生化危机', '美国', '好莱坞影业', '2019-06-12 00:00:00', '2019-07-01 00:00:00', NULL, '2020-10-22 11:32:09', '2020-10-22 11:32:09');
INSERT INTO `ca_film_schedule` VALUES (768804538516766720, NULL, '金刚川', '中国大陆', '中国电影股份有限公司', '2020-10-23 00:00:00', '2020-11-15 00:00:00', NULL, '2020-10-22 11:54:45', '2020-10-22 11:54:45');
INSERT INTO `ca_film_schedule` VALUES (768807259047198720, NULL, '哪吒', '中国大陆', '腾讯影业', '2020-10-01 00:00:00', '2020-10-31 00:00:00', NULL, '2020-10-22 12:05:34', '2020-10-22 12:05:34');
INSERT INTO `ca_film_schedule` VALUES (768807259047198721, NULL, '生化危机', '美国', '好莱坞影业', '2020-10-02 00:00:00', '2020-10-31 00:00:00', NULL, '2020-10-22 12:05:34', '2020-10-22 12:05:34');
INSERT INTO `ca_film_schedule` VALUES (768860358180864000, NULL, '金刚川', '中国大陆', '中国电影股份有限公司', '2020-10-23 00:00:00', '2020-11-15 00:00:00', NULL, '2020-10-22 15:36:34', '2020-10-22 15:36:34');

-- ----------------------------
-- Table structure for ca_order_cinema_relation
-- ----------------------------
DROP TABLE IF EXISTS `ca_order_cinema_relation`;
CREATE TABLE `ca_order_cinema_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '总订单id',
  `cinema_id` bigint(20) NULL DEFAULT NULL COMMENT '广告素材id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_order_cinema_relation
-- ----------------------------
INSERT INTO `ca_order_cinema_relation` VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for ca_order_file
-- ----------------------------
DROP TABLE IF EXISTS `ca_order_file`;
CREATE TABLE `ca_order_file`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NULL DEFAULT NULL COMMENT '订单id',
  `file_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件url',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除(0=正常，1=删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_order_file
-- ----------------------------

-- ----------------------------
-- Table structure for ca_order_material_relation
-- ----------------------------
DROP TABLE IF EXISTS `ca_order_material_relation`;
CREATE TABLE `ca_order_material_relation`  (
  `id` bigint(20) NOT NULL,
  `order_id` bigint(20) NOT NULL COMMENT '总订单id',
  `material_id` bigint(20) NULL DEFAULT NULL COMMENT '广告素材id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_order_material_relation
-- ----------------------------

-- ----------------------------
-- Table structure for ca_order_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `ca_order_operate_log`;
CREATE TABLE `ca_order_operate_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `operator` bigint(20) NULL DEFAULT NULL COMMENT '操作人',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 75 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_order_operate_log
-- ----------------------------
INSERT INTO `ca_order_operate_log` VALUES (1, 4, 876708082437197836, 'EXECUTING', '2020-10-08 16:50:51', NULL, '订单时间：2020-10-08 16:50:51');
INSERT INTO `ca_order_operate_log` VALUES (2, 5, 876708082437197836, 'EXECUTING', '2020-10-08 17:51:09', NULL, '订单时间：2020-10-08 17:51:09');
INSERT INTO `ca_order_operate_log` VALUES (3, 6, 876708082437197848, 'EXECUTING', '2020-10-09 17:15:35', NULL, '订单时间：2020-10-09 17:15:35');
INSERT INTO `ca_order_operate_log` VALUES (4, 7, 876708082437197836, 'EXECUTING', '2020-10-09 17:36:18', NULL, '订单时间：2020-10-09 17:36:18');
INSERT INTO `ca_order_operate_log` VALUES (5, 6, 11, 'TO_BE_CONFIRM', '2020-10-09 17:55:36', NULL, '销售助理提交了结案请求\n提交时间：2020-10-09 17:55:36');
INSERT INTO `ca_order_operate_log` VALUES (6, 8, 876708082437197836, 'EXECUTING', '2020-10-09 19:15:24', NULL, '订单时间：2020-10-09 19:15:24');
INSERT INTO `ca_order_operate_log` VALUES (7, 8, 15, 'TO_BE_CONFIRM', '2020-10-09 19:25:34', NULL, '销售助理提交了结案请求\n提交时间：2020-10-09 19:25:33');
INSERT INTO `ca_order_operate_log` VALUES (8, 8, 15, 'TO_BE_CONFIRM', '2020-10-09 19:25:35', NULL, '销售助理提交了结案请求\n提交时间：2020-10-09 19:25:35');
INSERT INTO `ca_order_operate_log` VALUES (9, 8, 15, 'TO_BE_CONFIRM', '2020-10-09 19:25:53', NULL, '销售助理提交了结案请求\n提交时间：2020-10-09 19:25:53');
INSERT INTO `ca_order_operate_log` VALUES (10, 8, 15, 'TO_BE_CONFIRM', '2020-10-09 19:25:55', NULL, '销售助理提交了结案请求\n提交时间：2020-10-09 19:25:55');
INSERT INTO `ca_order_operate_log` VALUES (11, 8, 15, 'TO_BE_CONFIRM', '2020-10-09 19:26:23', NULL, '销售助理提交了结案请求\n提交时间：2020-10-09 19:26:23');
INSERT INTO `ca_order_operate_log` VALUES (12, 8, 15, 'TO_BE_CONFIRM', '2020-10-09 19:27:12', NULL, '销售助理提交了结案请求\n提交时间：2020-10-09 19:27:12');
INSERT INTO `ca_order_operate_log` VALUES (13, 8, 15, 'TO_BE_CONFIRM', '2020-10-09 19:27:20', NULL, '销售助理提交了结案请求\n提交时间：2020-10-09 19:27:20');
INSERT INTO `ca_order_operate_log` VALUES (14, 9, 876708082437197836, 'EXECUTING', '2020-10-10 09:47:01', NULL, '订单时间：2020-10-10 09:47:01');
INSERT INTO `ca_order_operate_log` VALUES (15, 10, 876708082437197836, 'EXECUTING', '2020-10-10 10:17:19', NULL, '订单时间：2020-10-10 10:17:19');
INSERT INTO `ca_order_operate_log` VALUES (16, 11, 876708082437197836, 'EXECUTING', '2020-10-10 10:17:40', NULL, '订单时间：2020-10-10 10:17:39');
INSERT INTO `ca_order_operate_log` VALUES (17, 12, 876708082437197836, 'EXECUTING', '2020-10-10 10:18:35', NULL, '订单时间：2020-10-10 10:18:35');
INSERT INTO `ca_order_operate_log` VALUES (18, 10, 3, 'TO_BE_VERIFY', '2020-10-10 10:27:15', NULL, '订单更新为待结案状态\n更新时间：2020-10-10 10:27:15');
INSERT INTO `ca_order_operate_log` VALUES (19, 10, 3, 'TO_BE_CONFIRM', '2020-10-10 10:28:24', NULL, '销售助理提交了结案请求\n提交时间：2020-10-10 10:28:24');
INSERT INTO `ca_order_operate_log` VALUES (20, 10, 3, 'VERIFIED', '2020-10-10 10:29:18', NULL, '广告主确认结案\n确认时间：2020-10-10 10:29:18');
INSERT INTO `ca_order_operate_log` VALUES (21, 10, 3, 'FINISHED', '2020-10-10 10:30:00', NULL, '销售助理结算订单\n结算时间：2020-10-10 10:30:00');
INSERT INTO `ca_order_operate_log` VALUES (22, 13, 876708082437197836, 'EXECUTING', '2020-10-10 10:36:56', NULL, '订单时间：2020-10-10 10:36:56');
INSERT INTO `ca_order_operate_log` VALUES (23, 14, 876708082437197836, 'EXECUTING', '2020-10-10 10:39:21', NULL, '订单时间：2020-10-10 10:39:21');
INSERT INTO `ca_order_operate_log` VALUES (24, 15, 876708082437197836, 'EXECUTING', '2020-10-10 10:42:17', NULL, '订单时间：2020-10-10 10:42:17');
INSERT INTO `ca_order_operate_log` VALUES (25, 16, 876708082437197848, 'EXECUTING', '2020-10-10 11:14:14', NULL, '订单时间：2020-10-10 11:14:14');
INSERT INTO `ca_order_operate_log` VALUES (26, 13, 15, 'TO_BE_VERIFY', '2020-10-10 12:04:26', NULL, '订单更新为待结案状态\n更新时间：2020-10-10 12:04:26');
INSERT INTO `ca_order_operate_log` VALUES (27, 17, 876708082437197836, 'EXECUTING', '2020-10-10 12:26:38', NULL, '订单时间：2020-10-10 12:26:38');
INSERT INTO `ca_order_operate_log` VALUES (28, 18, 876708082437197836, 'EXECUTING', '2020-10-10 12:31:48', NULL, '订单时间：2020-10-10 12:31:48');
INSERT INTO `ca_order_operate_log` VALUES (29, 19, 876708082437197848, 'EXECUTING', '2020-10-10 14:40:16', NULL, '订单时间：2020-10-10 14:40:16');
INSERT INTO `ca_order_operate_log` VALUES (30, 20, 876708082437197836, 'EXECUTING', '2020-10-10 15:07:39', NULL, '订单时间：2020-10-10 15:07:39');
INSERT INTO `ca_order_operate_log` VALUES (31, 20, 15, 'TO_BE_VERIFY', '2020-10-10 16:51:29', NULL, '订单更新为待结案状态\n更新时间：2020-10-10 16:51:29');
INSERT INTO `ca_order_operate_log` VALUES (32, 20, 15, 'TO_BE_CONFIRM', '2020-10-10 16:57:07', NULL, '销售助理提交了结案请求\n提交时间：2020-10-10 16:57:07');
INSERT INTO `ca_order_operate_log` VALUES (33, 20, 15, 'VERIFIED', '2020-10-10 16:57:12', NULL, '广告主确认结案\n确认时间：2020-10-10 16:57:11');
INSERT INTO `ca_order_operate_log` VALUES (34, 20, 15, 'FINISHED', '2020-10-10 16:59:42', NULL, '销售助理结算订单\n结算时间：2020-10-10 16:59:42');
INSERT INTO `ca_order_operate_log` VALUES (35, 21, 876708082437197836, 'EXECUTING', '2020-10-12 15:46:39', NULL, '订单时间：2020-10-12 15:46:39');
INSERT INTO `ca_order_operate_log` VALUES (37, 21, 22, 'TO_BE_VERIFY', '2020-10-12 15:57:22', NULL, '订单更新为待结案状态\n更新时间：2020-10-12 15:57:22');
INSERT INTO `ca_order_operate_log` VALUES (38, 21, 22, 'TO_BE_CONFIRM', '2020-10-12 15:57:59', NULL, '销售助理提交了结案请求\n提交时间：2020-10-12 15:57:58');
INSERT INTO `ca_order_operate_log` VALUES (39, 21, 22, 'VERIFIED', '2020-10-12 15:58:40', NULL, '广告主确认结案\n确认时间：2020-10-12 15:58:40');
INSERT INTO `ca_order_operate_log` VALUES (40, 23, 876708082437197836, 'EXECUTING', '2020-10-13 11:49:50', NULL, '订单时间：2020-10-13 11:49:50');
INSERT INTO `ca_order_operate_log` VALUES (41, 24, 876708082437197848, 'EXECUTING', '2020-10-13 12:31:38', NULL, '订单时间：2020-10-13 12:31:38');
INSERT INTO `ca_order_operate_log` VALUES (43, 26, 876708082437197848, 'EXECUTING', '2020-10-13 14:25:55', NULL, '订单时间：2020-10-13 14:25:54');
INSERT INTO `ca_order_operate_log` VALUES (44, 27, 876708082437197848, 'EXECUTING', '2020-10-13 17:03:41', NULL, '订单时间：2020-10-13 17:03:40');
INSERT INTO `ca_order_operate_log` VALUES (45, 28, 876708082437197836, 'EXECUTING', '2020-10-14 11:42:36', NULL, '订单时间：2020-10-14 11:42:36');
INSERT INTO `ca_order_operate_log` VALUES (46, 28, 22, 'TO_BE_VERIFY', '2020-10-14 11:57:41', NULL, '订单更新为待结案状态\n更新时间：2020-10-14 11:57:41');
INSERT INTO `ca_order_operate_log` VALUES (47, 23, 22, 'TO_BE_VERIFY', '2020-10-16 11:18:45', NULL, '订单更新为待结案状态\n更新时间：2020-10-16 11:18:45');
INSERT INTO `ca_order_operate_log` VALUES (48, 29, 876708082437197836, 'EXECUTING', '2020-10-16 11:43:23', NULL, '订单时间：2020-10-16 11:43:23');
INSERT INTO `ca_order_operate_log` VALUES (49, 30, 876708082437197836, 'EXECUTING', '2020-10-16 18:42:09', NULL, '订单时间：2020-10-16 18:42:09');
INSERT INTO `ca_order_operate_log` VALUES (50, 31, 876708082437197836, 'EXECUTING', '2020-10-17 11:17:11', NULL, '订单时间：2020-10-17 11:17:11');
INSERT INTO `ca_order_operate_log` VALUES (51, 31, 1, 'TO_BE_VERIFY', '2020-10-17 11:29:32', NULL, '订单更新为待结案状态\n更新时间：2020-10-17 11:29:32');
INSERT INTO `ca_order_operate_log` VALUES (52, 32, 876708082437197836, 'EXECUTING', '2020-10-17 17:18:39', NULL, '订单时间：2020-10-17 17:18:39');
INSERT INTO `ca_order_operate_log` VALUES (53, 33, 876708082437197836, 'EXECUTING', '2020-10-19 11:22:14', NULL, '订单时间：2020-10-19 11:22:14');
INSERT INTO `ca_order_operate_log` VALUES (54, 34, 876708082437197836, 'EXECUTING', '2020-10-19 15:14:00', NULL, '订单时间：2020-10-19 15:14:00');
INSERT INTO `ca_order_operate_log` VALUES (55, 35, 876708082437197836, 'EXECUTING', '2020-10-19 15:32:56', NULL, '订单时间：2020-10-19 15:32:56');
INSERT INTO `ca_order_operate_log` VALUES (56, 35, 1, 'TO_BE_VERIFY', '2020-10-19 15:35:20', NULL, '订单更新为待结案状态\n更新时间：2020-10-19 15:35:20');
INSERT INTO `ca_order_operate_log` VALUES (57, 35, 1, 'TO_BE_CONFIRM', '2020-10-19 15:35:57', NULL, '销售助理提交了结案请求\n提交时间：2020-10-19 15:35:57');
INSERT INTO `ca_order_operate_log` VALUES (58, 35, 1, 'VERIFIED', '2020-10-19 15:36:06', NULL, '广告主确认结案\n确认时间：2020-10-19 15:36:06');
INSERT INTO `ca_order_operate_log` VALUES (59, 35, 1, 'FINISHED', '2020-10-19 15:36:33', NULL, '销售助理结算订单\n结算时间：2020-10-19 15:36:33');
INSERT INTO `ca_order_operate_log` VALUES (60, 36, 876708082437197836, 'EXECUTING', '2020-10-19 15:37:22', NULL, '订单时间：2020-10-19 15:37:22');
INSERT INTO `ca_order_operate_log` VALUES (61, 37, 876708082437197836, 'EXECUTING', '2020-10-19 17:19:31', NULL, '订单时间：2020-10-19 17:19:31');
INSERT INTO `ca_order_operate_log` VALUES (62, 37, 4, 'TO_BE_VERIFY', '2020-10-19 17:55:55', NULL, '订单更新为待结案状态\n更新时间：2020-10-19 17:55:55');
INSERT INTO `ca_order_operate_log` VALUES (63, 37, 4, 'TO_BE_CONFIRM', '2020-10-19 17:56:58', NULL, '销售助理提交了结案请求\n提交时间：2020-10-19 17:56:58');
INSERT INTO `ca_order_operate_log` VALUES (64, 37, 4, 'VERIFIED', '2020-10-19 17:57:12', NULL, '广告主确认结案\n确认时间：2020-10-19 17:57:12');
INSERT INTO `ca_order_operate_log` VALUES (65, 37, 4, 'FINISHED', '2020-10-19 17:58:38', NULL, '销售助理结算订单\n结算时间：2020-10-19 17:58:38');
INSERT INTO `ca_order_operate_log` VALUES (66, 38, 876708082437197836, 'EXECUTING', '2020-10-20 11:38:22', NULL, '订单时间：2020-10-20 11:38:22');
INSERT INTO `ca_order_operate_log` VALUES (67, 38, 4, 'TO_BE_VERIFY', '2020-10-20 15:00:31', NULL, '订单更新为待结案状态\n更新时间：2020-10-20 15:00:31');
INSERT INTO `ca_order_operate_log` VALUES (68, 38, 4, 'TO_BE_CONFIRM', '2020-10-20 15:02:06', NULL, '销售助理提交了结案请求\n提交时间：2020-10-20 15:02:06');
INSERT INTO `ca_order_operate_log` VALUES (69, 38, 4, 'VERIFIED', '2020-10-20 15:02:08', NULL, '广告主确认结案\n确认时间：2020-10-20 15:02:08');
INSERT INTO `ca_order_operate_log` VALUES (70, 39, 876708082437197836, 'EXECUTING', '2020-10-20 15:57:01', NULL, '订单时间：2020-10-20 15:57:01');
INSERT INTO `ca_order_operate_log` VALUES (71, 40, 876708082437197836, 'EXECUTING', '2020-10-21 10:12:03', NULL, '订单时间：2020-10-21 10:12:03');
INSERT INTO `ca_order_operate_log` VALUES (72, 40, 4, 'TO_BE_VERIFY', '2020-10-21 10:13:46', NULL, '订单更新为待结案状态\n更新时间：2020-10-21 10:13:46');
INSERT INTO `ca_order_operate_log` VALUES (73, 38, 4, 'FINISHED', '2020-10-21 15:44:04', NULL, '销售助理结算订单\n结算时间：2020-10-21 15:44:03');
INSERT INTO `ca_order_operate_log` VALUES (74, 41, 876708082437197836, 'EXECUTING', '2020-10-22 09:57:47', NULL, '订单时间：2020-10-22 09:57:47');

-- ----------------------------
-- Table structure for ca_order_task
-- ----------------------------
DROP TABLE IF EXISTS `ca_order_task`;
CREATE TABLE `ca_order_task`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '子订单编号',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT '所属组织ID',
  `org_tag` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织标志',
  `advertiser_id` bigint(20) NOT NULL COMMENT '广告主id',
  `assistant_id` bigint(20) NOT NULL COMMENT '店小二id',
  `plan_id` bigint(20) NOT NULL COMMENT '广告计划id',
  `planning_order_id` bigint(20) NOT NULL COMMENT '总订单id',
  `release_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告投放类型(贴片， 按场次)',
  `film_id` bigint(20) NULL DEFAULT NULL COMMENT '影片id(可以为空)',
  `film_start_date` datetime NULL DEFAULT NULL COMMENT '排期播放开始日期',
  `film_end_date` datetime NULL DEFAULT NULL COMMENT '排期播放结束日期',
  `cinema_id` bigint(20) NULL DEFAULT NULL COMMENT '影院id',
  `round` smallint(6) NULL DEFAULT NULL COMMENT '场次',
  `time_slot` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告播放时间段（一分钟内、1-3分钟、3分钟后）',
  `report_file_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子订单结案文件url',
  `report_file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '子订单结案文件名称',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单状态（待投放、投放中、投放结束、已结案、已结算 ）',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `room_number` int(10) NULL DEFAULT 0 COMMENT '影厅数',
  `budget` decimal(10, 2) NULL DEFAULT NULL COMMENT '子订单预算',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '审核拒绝原因',
  `start_alarm` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '投放开始时间提醒',
  `end_alarm` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '投放结束时间提醒',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `org_id`(`org_id`, `task_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 49 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_order_task
-- ----------------------------
INSERT INTO `ca_order_task` VALUES (35, '1317394583172288512', 100000000000000095, NULL, 1, 876708082437197862, 50, 32, 'BY_FILM', 3, '2020-10-30 00:00:00', '2020-11-01 00:00:00', 766985300982366210, 7, 'AFTER_ONE_MINUTE', '/attachments/68872816-570f-4c72-b149-2300eb0d655e.docx', '科目结存单.docx', 'TO_BE_VERIFY', '2020-10-17 17:18:39', 7, 9800.00, '123456', '0', '0', '2020-10-21 12:04:41');
INSERT INTO `ca_order_task` VALUES (36, '1318029665608273920', 100000000000000094, NULL, 1, 876708082437197862, 53, 33, 'BY_ROUNDS', NULL, '2020-10-29 00:00:00', '2020-10-31 00:00:00', 766985300982366209, 5, 'AFTER_ONE_MINUTE', NULL, NULL, 'TO_BE_DELIVER', '2020-10-19 11:22:15', 9, 9000.00, NULL, '0', '0', '2020-10-21 12:04:41');
INSERT INTO `ca_order_task` VALUES (37, '1318029665830572032', NULL, NULL, 1, 876708082437197862, 53, 33, 'BY_ROUNDS', NULL, '2020-10-29 00:00:00', '2020-10-31 00:00:00', 767073150625120256, 6, 'AFTER_ONE_MINUTE', NULL, NULL, 'DELIVERED', '2020-10-19 11:22:15', 6, 7200.00, NULL, '0', '1', '2020-10-31 20:00:00');
INSERT INTO `ca_order_task` VALUES (38, '1318087992149151744', 100000000000000094, NULL, 1, 876708082437197862, 51, 34, 'BY_FILM', 2, '2020-10-30 00:00:00', '2020-11-04 00:00:00', 766985300982366209, 5, 'AFTER_THREE_MINUTES', '/attachments/e0d5e826-b956-422b-8c76-275dfaf6a7f0.docx', '库存台账记录单单.docx', 'VERIFIED', '2020-10-19 15:14:01', 9, 22500.00, NULL, '0', '0', '2020-10-21 12:04:41');
INSERT INTO `ca_order_task` VALUES (39, '1318087992274980864', NULL, NULL, 1, 876708082437197862, 51, 34, 'BY_FILM', 2, '2020-10-30 00:00:00', '2020-11-04 00:00:00', 767073150625120256, 5, 'AFTER_THREE_MINUTES', NULL, NULL, 'TO_BE_DELIVER', '2020-10-19 15:14:01', 5, 12500.00, NULL, '0', '0', '2020-10-21 12:04:41');
INSERT INTO `ca_order_task` VALUES (40, '1318092754777149440', 100000000000000094, NULL, 1, 876708082437197862, 54, 35, 'BY_ROUNDS', NULL, '2020-10-29 00:00:00', '2020-10-31 00:00:00', 766985300982366209, 7, 'IN_ONE_MINUTE', '/attachments/a327d9aa-7945-4951-90e6-a42a4cf3a9ec.docx', 'BOM单.docx', 'FINISHED', '2020-10-19 15:32:56', 7, 9800.00, NULL, '0', '0', '2020-10-21 12:04:41');
INSERT INTO `ca_order_task` VALUES (41, '1318093870235521024', NULL, NULL, 1, 876708082437197862, 55, 36, 'BY_ROUNDS', NULL, '2020-10-23 00:00:00', '2020-10-30 00:00:00', 767073150625120256, 5, 'AFTER_ONE_MINUTE', NULL, NULL, 'ABOLISHED', '2020-10-19 15:37:22', 5, 17500.00, NULL, '0', '0', '2020-10-21 12:04:41');
INSERT INTO `ca_order_task` VALUES (42, '1318119575895805952', 100000000000000095, NULL, 4, 876708082437197862, 56, 37, 'BY_ROUNDS', NULL, '2020-11-04 00:00:00', '2020-11-05 00:00:00', 766985300982366210, 7, 'AFTER_THREE_MINUTES', '/attachments/0882e68f-a597-4f20-8216-88b3eb5fafca.docx', '报销单模板.docx', 'FINISHED', '2020-10-19 17:19:31', 6, 4200.00, '阿勒？不通过喔', '0', '0', '2020-10-21 12:04:41');
INSERT INTO `ca_order_task` VALUES (43, '1318396112155054080', 100000000000000094, NULL, 4, 876708082437197862, 57, 38, 'BY_FILM', 766966176415744004, '2020-10-23 00:00:00', '2020-10-31 00:00:00', 766985300982366209, 5, 'AFTER_ONE_MINUTE', '/attachments/dd293c80-732b-464a-84fa-dee316cf4887.docx', '出库单单.docx', 'FINISHED', '2020-10-20 11:38:22', 9, 36000.00, NULL, '0', '0', '2020-10-21 15:44:03');
INSERT INTO `ca_order_task` VALUES (44, '1318396112536735744', 100000000000000095, NULL, 4, 876708082437197862, 57, 38, 'BY_FILM', 766966176415744004, '2020-10-23 00:00:00', '2020-10-31 00:00:00', 766985300982366210, 5, 'AFTER_ONE_MINUTE', NULL, NULL, 'ABOLISHED', '2020-10-20 11:38:22', 6, 24000.00, NULL, '0', '0', '2020-10-21 12:04:41');
INSERT INTO `ca_order_task` VALUES (45, '1318461202745135104', 100000000000000094, NULL, 4, 876708082437197862, 58, 39, 'BY_ROUNDS', NULL, '2020-10-25 08:00:00', '2020-10-31 08:00:00', 766985300982366209, 5, 'IN_ONE_MINUTE', NULL, NULL, 'ABOLISHED', '2020-10-20 15:57:01', 9, 27000.00, NULL, '0', '0', '2020-10-21 12:04:41');
INSERT INTO `ca_order_task` VALUES (46, '1318461202887741440', 100000000000000095, NULL, 4, 876708082437197862, 58, 39, 'BY_ROUNDS', NULL, '2020-10-25 08:00:00', '2020-10-31 08:00:00', 766985300982366210, 5, 'IN_ONE_MINUTE', NULL, NULL, 'ABOLISHED', '2020-10-20 15:57:01', 6, 18000.00, NULL, '0', '0', '2020-10-21 12:04:41');
INSERT INTO `ca_order_task` VALUES (47, '1318736777737015296', 100000000000000094, NULL, 4, 876708082437197862, 59, 40, 'BY_ROUNDS', NULL, '2020-10-28 08:00:00', '2020-10-31 08:00:00', 766985300982366209, 7, 'AFTER_THREE_MINUTES', '/attachments/6065ad31-153d-4f9c-83f6-87019453b814.docx', '销售订单Word套打模板.docx', 'VERIFIED', '2020-10-21 10:12:03', 9, 18900.00, NULL, '0', '0', '2020-10-21 12:04:41');
INSERT INTO `ca_order_task` VALUES (48, '1319095576050143232', 100000000000000094, NULL, 4, 876708082437197862, 60, 41, 'BY_FILM', 6, '2020-10-29 08:00:00', '2020-11-03 08:00:00', 766985300982366209, 5, 'AFTER_THREE_MINUTES', NULL, NULL, 'ABOLISHED', '2020-10-22 09:57:47', 9, 22500.00, NULL, '0', '0', '2020-10-22 09:59:47');

-- ----------------------------
-- Table structure for ca_order_task_history
-- ----------------------------
DROP TABLE IF EXISTS `ca_order_task_history`;
CREATE TABLE `ca_order_task_history`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_task_id` bigint(20) NOT NULL COMMENT '子订单id',
  `operator` bigint(20) NULL DEFAULT NULL COMMENT '执行人id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `film_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影片名',
  `film_id` bigint(20) NULL DEFAULT NULL COMMENT '影片id',
  `from_film_start_date` datetime NULL DEFAULT NULL COMMENT '排期播放开始日期',
  `from_film_end_date` datetime NULL DEFAULT NULL COMMENT '排期播放结束日期',
  `to_film_start_date` datetime NULL DEFAULT NULL COMMENT '排期播放开始日期',
  `to_film_end_date` datetime NULL DEFAULT NULL COMMENT '排期播放结束日期',
  `from_duration` smallint(6) NULL DEFAULT NULL COMMENT '广告时长 // 秒',
  `to_duration` smallint(6) NULL DEFAULT NULL COMMENT '广告时长 // 秒',
  `from_round` smallint(6) NULL DEFAULT NULL COMMENT '场次',
  `to_round` smallint(6) NULL DEFAULT NULL COMMENT '场次',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_order_task_history
-- ----------------------------

-- ----------------------------
-- Table structure for ca_order_task_schedule
-- ----------------------------
DROP TABLE IF EXISTS `ca_order_task_schedule`;
CREATE TABLE `ca_order_task_schedule`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_task_id` bigint(20) NOT NULL COMMENT '子订单id',
  `film_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '影片名',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影片投放状态（未投放，已投放，已拒绝）',
  `film_start_date` datetime NULL DEFAULT NULL COMMENT '排期播放开始日期',
  `film_end_date` datetime NULL DEFAULT NULL COMMENT '排期播放结束日期',
  `round` smallint(6) NULL DEFAULT NULL COMMENT '场次 (每天)',
  `room_number` smallint(6) NULL DEFAULT NULL COMMENT '影厅数',
  `cast_show_time` datetime NULL DEFAULT NULL COMMENT '投放时间 // 具体时间',
  `duration` smallint(6) NULL DEFAULT NULL COMMENT '广告时长 // 秒',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_order_task_schedule
-- ----------------------------

-- ----------------------------
-- Table structure for ca_plan_cinema
-- ----------------------------
DROP TABLE IF EXISTS `ca_plan_cinema`;
CREATE TABLE `ca_plan_cinema`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plan_id` bigint(20) NOT NULL COMMENT '广告计划id',
  `cinema_id` bigint(20) NOT NULL COMMENT '影院id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 88 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_plan_cinema
-- ----------------------------
INSERT INTO `ca_plan_cinema` VALUES (1, 5, 1);
INSERT INTO `ca_plan_cinema` VALUES (2, 6, 1);
INSERT INTO `ca_plan_cinema` VALUES (3, 7, 1);
INSERT INTO `ca_plan_cinema` VALUES (4, 8, 1);
INSERT INTO `ca_plan_cinema` VALUES (5, 9, 1);
INSERT INTO `ca_plan_cinema` VALUES (6, 10, 1);
INSERT INTO `ca_plan_cinema` VALUES (7, 11, 1);
INSERT INTO `ca_plan_cinema` VALUES (8, 12, 1);
INSERT INTO `ca_plan_cinema` VALUES (11, 15, 1);
INSERT INTO `ca_plan_cinema` VALUES (12, 16, 2);
INSERT INTO `ca_plan_cinema` VALUES (13, 17, 1);
INSERT INTO `ca_plan_cinema` VALUES (14, 18, 2);
INSERT INTO `ca_plan_cinema` VALUES (15, 19, 2);
INSERT INTO `ca_plan_cinema` VALUES (17, 20, 2);
INSERT INTO `ca_plan_cinema` VALUES (18, 21, 2);
INSERT INTO `ca_plan_cinema` VALUES (20, 23, 1);
INSERT INTO `ca_plan_cinema` VALUES (21, 22, 2);
INSERT INTO `ca_plan_cinema` VALUES (22, 24, 2);
INSERT INTO `ca_plan_cinema` VALUES (23, 24, 1);
INSERT INTO `ca_plan_cinema` VALUES (24, 25, 2);
INSERT INTO `ca_plan_cinema` VALUES (25, 26, 2);
INSERT INTO `ca_plan_cinema` VALUES (26, 27, 2);
INSERT INTO `ca_plan_cinema` VALUES (27, 27, 1);
INSERT INTO `ca_plan_cinema` VALUES (28, 28, 2);
INSERT INTO `ca_plan_cinema` VALUES (29, 29, 4);
INSERT INTO `ca_plan_cinema` VALUES (30, 30, 6);
INSERT INTO `ca_plan_cinema` VALUES (31, 31, 6);
INSERT INTO `ca_plan_cinema` VALUES (32, 32, 6);
INSERT INTO `ca_plan_cinema` VALUES (33, 32, 4);
INSERT INTO `ca_plan_cinema` VALUES (34, 32, 3);
INSERT INTO `ca_plan_cinema` VALUES (38, 33, 4);
INSERT INTO `ca_plan_cinema` VALUES (39, 33, 6);
INSERT INTO `ca_plan_cinema` VALUES (40, 34, 6);
INSERT INTO `ca_plan_cinema` VALUES (41, 34, 2);
INSERT INTO `ca_plan_cinema` VALUES (42, 35, 4);
INSERT INTO `ca_plan_cinema` VALUES (44, 36, 2);
INSERT INTO `ca_plan_cinema` VALUES (45, 37, 3);
INSERT INTO `ca_plan_cinema` VALUES (46, 38, 2);
INSERT INTO `ca_plan_cinema` VALUES (49, 40, 1);
INSERT INTO `ca_plan_cinema` VALUES (50, 39, 3);
INSERT INTO `ca_plan_cinema` VALUES (51, 39, 4);
INSERT INTO `ca_plan_cinema` VALUES (52, 41, 1);
INSERT INTO `ca_plan_cinema` VALUES (53, 42, 1);
INSERT INTO `ca_plan_cinema` VALUES (54, 43, 1);
INSERT INTO `ca_plan_cinema` VALUES (57, 44, 6);
INSERT INTO `ca_plan_cinema` VALUES (58, 45, 6);
INSERT INTO `ca_plan_cinema` VALUES (61, 47, 1);
INSERT INTO `ca_plan_cinema` VALUES (64, 48, 1);
INSERT INTO `ca_plan_cinema` VALUES (65, 46, 1);
INSERT INTO `ca_plan_cinema` VALUES (68, 49, 1);
INSERT INTO `ca_plan_cinema` VALUES (69, 49, 2);
INSERT INTO `ca_plan_cinema` VALUES (70, 50, 766985300982366210);
INSERT INTO `ca_plan_cinema` VALUES (71, 51, 766985300982366209);
INSERT INTO `ca_plan_cinema` VALUES (72, 51, 767073150625120256);
INSERT INTO `ca_plan_cinema` VALUES (73, 53, 766985300982366209);
INSERT INTO `ca_plan_cinema` VALUES (74, 53, 767073150625120256);
INSERT INTO `ca_plan_cinema` VALUES (77, 54, 766985300982366209);
INSERT INTO `ca_plan_cinema` VALUES (78, 55, 767073150625120256);
INSERT INTO `ca_plan_cinema` VALUES (79, 56, 766985300982366210);
INSERT INTO `ca_plan_cinema` VALUES (80, 57, 766985300982366209);
INSERT INTO `ca_plan_cinema` VALUES (81, 57, 766985300982366210);
INSERT INTO `ca_plan_cinema` VALUES (84, 58, 766985300982366209);
INSERT INTO `ca_plan_cinema` VALUES (85, 58, 766985300982366210);
INSERT INTO `ca_plan_cinema` VALUES (86, 59, 766985300982366209);
INSERT INTO `ca_plan_cinema` VALUES (87, 60, 766985300982366209);

-- ----------------------------
-- Table structure for ca_plan_material
-- ----------------------------
DROP TABLE IF EXISTS `ca_plan_material`;
CREATE TABLE `ca_plan_material`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plan_id` bigint(20) NOT NULL COMMENT '广告计划id',
  `material_id` bigint(20) NULL DEFAULT NULL COMMENT '广告素材id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_plan_material
-- ----------------------------
INSERT INTO `ca_plan_material` VALUES (1, 11, 5);
INSERT INTO `ca_plan_material` VALUES (2, 12, 4);
INSERT INTO `ca_plan_material` VALUES (3, 15, 4);
INSERT INTO `ca_plan_material` VALUES (4, 16, 5);
INSERT INTO `ca_plan_material` VALUES (5, 17, 5);
INSERT INTO `ca_plan_material` VALUES (6, 18, 6);
INSERT INTO `ca_plan_material` VALUES (7, 19, 7);
INSERT INTO `ca_plan_material` VALUES (8, 20, 6);
INSERT INTO `ca_plan_material` VALUES (9, 21, 6);
INSERT INTO `ca_plan_material` VALUES (10, 22, 5);
INSERT INTO `ca_plan_material` VALUES (11, 23, 6);
INSERT INTO `ca_plan_material` VALUES (12, 24, 5);
INSERT INTO `ca_plan_material` VALUES (13, 25, 5);
INSERT INTO `ca_plan_material` VALUES (14, 26, 6);
INSERT INTO `ca_plan_material` VALUES (15, 27, 5);
INSERT INTO `ca_plan_material` VALUES (16, 28, 6);
INSERT INTO `ca_plan_material` VALUES (17, 29, 6);
INSERT INTO `ca_plan_material` VALUES (18, 30, 5);
INSERT INTO `ca_plan_material` VALUES (19, 31, 5);
INSERT INTO `ca_plan_material` VALUES (20, 32, 7);
INSERT INTO `ca_plan_material` VALUES (21, 32, 6);
INSERT INTO `ca_plan_material` VALUES (22, 32, 5);
INSERT INTO `ca_plan_material` VALUES (23, 33, 5);
INSERT INTO `ca_plan_material` VALUES (24, 33, 6);
INSERT INTO `ca_plan_material` VALUES (25, 34, 8);
INSERT INTO `ca_plan_material` VALUES (26, 34, 9);
INSERT INTO `ca_plan_material` VALUES (27, 34, 10);
INSERT INTO `ca_plan_material` VALUES (28, 39, 10);
INSERT INTO `ca_plan_material` VALUES (29, 40, 7);
INSERT INTO `ca_plan_material` VALUES (30, 42, 9);
INSERT INTO `ca_plan_material` VALUES (31, 43, 8);
INSERT INTO `ca_plan_material` VALUES (32, 44, 8);
INSERT INTO `ca_plan_material` VALUES (33, 45, 12);
INSERT INTO `ca_plan_material` VALUES (34, 47, 13);
INSERT INTO `ca_plan_material` VALUES (35, 48, 13);
INSERT INTO `ca_plan_material` VALUES (36, 46, 13);
INSERT INTO `ca_plan_material` VALUES (37, 49, 13);
INSERT INTO `ca_plan_material` VALUES (38, 49, 14);
INSERT INTO `ca_plan_material` VALUES (39, 50, 14);
INSERT INTO `ca_plan_material` VALUES (40, 51, 13);
INSERT INTO `ca_plan_material` VALUES (41, 53, 14);
INSERT INTO `ca_plan_material` VALUES (42, 53, 13);
INSERT INTO `ca_plan_material` VALUES (44, 54, 13);
INSERT INTO `ca_plan_material` VALUES (45, 55, 14);
INSERT INTO `ca_plan_material` VALUES (46, 56, 14);
INSERT INTO `ca_plan_material` VALUES (47, 57, 15);
INSERT INTO `ca_plan_material` VALUES (49, 58, 15);
INSERT INTO `ca_plan_material` VALUES (50, 59, 15);
INSERT INTO `ca_plan_material` VALUES (51, 60, 15);

-- ----------------------------
-- Table structure for ca_plan_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `ca_plan_operate_log`;
CREATE TABLE `ca_plan_operate_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `plan_id` bigint(20) NOT NULL COMMENT '计划id',
  `operator` bigint(20) NULL DEFAULT NULL COMMENT '操作人',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 147 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_plan_operate_log
-- ----------------------------
INSERT INTO `ca_plan_operate_log` VALUES (1, 5, 3, 'TO_BE_REVIEWED', '2020-10-08 16:50:15', NULL, '等待销售助理审核\n申请时间：2020-10-08 16:50:15');
INSERT INTO `ca_plan_operate_log` VALUES (2, 5, 876708082437197836, 'REVIEW_APPROVED', '2020-10-08 16:50:46', NULL, '审核时间：2020-10-08 16:50:46');
INSERT INTO `ca_plan_operate_log` VALUES (3, 5, 3, 'ORDER_PLACED', '2020-10-08 16:50:51', NULL, '下单时间：2020-10-08 16:50:51');
INSERT INTO `ca_plan_operate_log` VALUES (4, 6, 3, 'TO_BE_REVIEWED', '2020-10-08 17:47:18', NULL, '等待销售助理审核\n申请时间：2020-10-08 17:47:17');
INSERT INTO `ca_plan_operate_log` VALUES (5, 7, 3, 'TO_BE_REVIEWED', '2020-10-08 17:50:13', NULL, '等待销售助理审核\n申请时间：2020-10-08 17:50:13');
INSERT INTO `ca_plan_operate_log` VALUES (6, 7, 876708082437197836, 'REVIEW_APPROVED', '2020-10-08 17:50:46', NULL, '审核时间：2020-10-08 17:50:45');
INSERT INTO `ca_plan_operate_log` VALUES (7, 7, 3, 'ORDER_PLACED', '2020-10-08 17:51:09', NULL, '下单时间：2020-10-08 17:51:09');
INSERT INTO `ca_plan_operate_log` VALUES (8, 11, 3, 'TO_BE_REVIEWED', '2020-10-09 15:05:34', NULL, '等待销售助理审核\n申请时间：2020-10-09 15:05:34');
INSERT INTO `ca_plan_operate_log` VALUES (9, 12, 3, 'TO_BE_REVIEWED', '2020-10-09 15:21:03', NULL, '等待销售助理审核\n申请时间：2020-10-09 15:21:03');
INSERT INTO `ca_plan_operate_log` VALUES (10, 15, 15, 'TO_BE_REVIEWED', '2020-10-09 16:16:35', NULL, '等待销售助理审核\n申请时间：2020-10-09 16:16:35');
INSERT INTO `ca_plan_operate_log` VALUES (11, 16, 15, 'TO_BE_REVIEWED', '2020-10-09 16:24:14', NULL, '等待销售助理审核\n申请时间：2020-10-09 16:24:13');
INSERT INTO `ca_plan_operate_log` VALUES (12, 17, 15, 'TO_BE_REVIEWED', '2020-10-09 16:28:37', NULL, '等待销售助理审核\n申请时间：2020-10-09 16:28:37');
INSERT INTO `ca_plan_operate_log` VALUES (13, 18, 15, 'TO_BE_REVIEWED', '2020-10-09 16:34:07', NULL, '等待销售助理审核\n申请时间：2020-10-09 16:34:07');
INSERT INTO `ca_plan_operate_log` VALUES (14, 19, 11, 'TO_BE_REVIEWED', '2020-10-09 17:12:56', NULL, '等待销售助理审核\n申请时间：2020-10-09 17:12:55');
INSERT INTO `ca_plan_operate_log` VALUES (15, 19, 876708082437197848, 'REVIEW_APPROVED', '2020-10-09 17:15:24', NULL, '审核时间：2020-10-09 17:15:23');
INSERT INTO `ca_plan_operate_log` VALUES (16, 19, 11, 'ORDER_PLACED', '2020-10-09 17:15:35', NULL, '下单时间：2020-10-09 17:15:35');
INSERT INTO `ca_plan_operate_log` VALUES (17, 20, 15, 'TO_BE_REVIEWED', '2020-10-09 17:33:33', NULL, '等待销售助理审核\n申请时间：2020-10-09 17:33:32');
INSERT INTO `ca_plan_operate_log` VALUES (18, 20, NULL, 'REVIEW_REJECTED', '2020-10-09 17:35:01', NULL, '广告计划审核不通过\n原因：资料不明确，请重新修改再提交\n\n审核时间：2020-10-09 17:35:01');
INSERT INTO `ca_plan_operate_log` VALUES (19, 20, NULL, 'TO_BE_REVIEWED', '2020-10-09 17:35:44', NULL, '再次提交审核申请\n提交时间：2020-10-09 17:35:44');
INSERT INTO `ca_plan_operate_log` VALUES (20, 20, 876708082437197836, 'REVIEW_APPROVED', '2020-10-09 17:36:10', NULL, '审核时间：2020-10-09 17:36:10');
INSERT INTO `ca_plan_operate_log` VALUES (21, 20, 15, 'ORDER_PLACED', '2020-10-09 17:36:18', NULL, '下单时间：2020-10-09 17:36:18');
INSERT INTO `ca_plan_operate_log` VALUES (22, 21, 15, 'TO_BE_REVIEWED', '2020-10-09 19:12:37', NULL, '等待销售助理审核\n申请时间：2020-10-09 19:12:37');
INSERT INTO `ca_plan_operate_log` VALUES (23, 21, 876708082437197836, 'REVIEW_APPROVED', '2020-10-09 19:15:22', NULL, '审核时间：2020-10-09 19:15:22');
INSERT INTO `ca_plan_operate_log` VALUES (24, 21, 15, 'ORDER_PLACED', '2020-10-09 19:15:24', NULL, '下单时间：2020-10-09 19:15:24');
INSERT INTO `ca_plan_operate_log` VALUES (25, 22, 15, 'TO_BE_REVIEWED', '2020-10-10 09:33:00', NULL, '等待销售助理审核\n申请时间：2020-10-10 09:32:59');
INSERT INTO `ca_plan_operate_log` VALUES (26, 23, 3, 'TO_BE_REVIEWED', '2020-10-10 09:34:31', NULL, '等待销售助理审核\n申请时间：2020-10-10 09:34:31');
INSERT INTO `ca_plan_operate_log` VALUES (27, 22, NULL, 'REVIEW_REJECTED', '2020-10-10 09:35:22', NULL, '广告计划审核不通过\n原因：重庆提交资料\n审核时间：2020-10-10 09:35:22');
INSERT INTO `ca_plan_operate_log` VALUES (28, 22, NULL, 'TO_BE_REVIEWED', '2020-10-10 09:40:24', NULL, '再次提交审核申请\n提交时间：2020-10-10 09:40:24');
INSERT INTO `ca_plan_operate_log` VALUES (29, 24, 3, 'TO_BE_REVIEWED', '2020-10-10 09:41:24', NULL, '等待销售助理审核\n申请时间：2020-10-10 09:41:23');
INSERT INTO `ca_plan_operate_log` VALUES (30, 25, 15, 'TO_BE_REVIEWED', '2020-10-10 09:46:32', NULL, '等待销售助理审核\n申请时间：2020-10-10 09:46:32');
INSERT INTO `ca_plan_operate_log` VALUES (31, 25, 876708082437197836, 'REVIEW_APPROVED', '2020-10-10 09:46:48', NULL, '审核时间：2020-10-10 09:46:48');
INSERT INTO `ca_plan_operate_log` VALUES (32, 25, 15, 'ORDER_PLACED', '2020-10-10 09:47:02', NULL, '下单时间：2020-10-10 09:47:01');
INSERT INTO `ca_plan_operate_log` VALUES (33, 26, 3, 'TO_BE_REVIEWED', '2020-10-10 10:14:53', NULL, '等待销售助理审核\n申请时间：2020-10-10 10:14:53');
INSERT INTO `ca_plan_operate_log` VALUES (34, 27, 15, 'TO_BE_REVIEWED', '2020-10-10 10:16:15', NULL, '等待销售助理审核\n申请时间：2020-10-10 10:16:14');
INSERT INTO `ca_plan_operate_log` VALUES (35, 27, 876708082437197836, 'REVIEW_APPROVED', '2020-10-10 10:17:05', NULL, '审核时间：2020-10-10 10:17:05');
INSERT INTO `ca_plan_operate_log` VALUES (36, 26, 876708082437197836, 'REVIEW_APPROVED', '2020-10-10 10:17:17', NULL, '审核时间：2020-10-10 10:17:17');
INSERT INTO `ca_plan_operate_log` VALUES (37, 26, 3, 'ORDER_PLACED', '2020-10-10 10:17:20', NULL, '下单时间：2020-10-10 10:17:19');
INSERT INTO `ca_plan_operate_log` VALUES (38, 27, 876708082437197836, 'REVIEW_APPROVED', '2020-10-10 10:17:36', NULL, '审核时间：2020-10-10 10:17:36');
INSERT INTO `ca_plan_operate_log` VALUES (39, 27, 15, 'ORDER_PLACED', '2020-10-10 10:17:40', NULL, '下单时间：2020-10-10 10:17:39');
INSERT INTO `ca_plan_operate_log` VALUES (40, 24, 876708082437197836, 'REVIEW_APPROVED', '2020-10-10 10:18:29', NULL, '审核时间：2020-10-10 10:18:29');
INSERT INTO `ca_plan_operate_log` VALUES (41, 24, 3, 'ORDER_PLACED', '2020-10-10 10:18:35', NULL, '下单时间：2020-10-10 10:18:35');
INSERT INTO `ca_plan_operate_log` VALUES (42, 18, 876708082437197836, 'REVIEW_APPROVED', '2020-10-10 10:36:43', NULL, '审核时间：2020-10-10 10:36:43');
INSERT INTO `ca_plan_operate_log` VALUES (43, 18, 15, 'ORDER_PLACED', '2020-10-10 10:36:56', NULL, '下单时间：2020-10-10 10:36:56');
INSERT INTO `ca_plan_operate_log` VALUES (44, 6, 876708082437197836, 'REVIEW_APPROVED', '2020-10-10 10:39:11', NULL, '审核时间：2020-10-10 10:39:11');
INSERT INTO `ca_plan_operate_log` VALUES (45, 6, 3, 'ORDER_PLACED', '2020-10-10 10:39:21', NULL, '下单时间：2020-10-10 10:39:21');
INSERT INTO `ca_plan_operate_log` VALUES (46, 17, 876708082437197836, 'REVIEW_APPROVED', '2020-10-10 10:42:15', NULL, '审核时间：2020-10-10 10:42:15');
INSERT INTO `ca_plan_operate_log` VALUES (47, 17, 15, 'ORDER_PLACED', '2020-10-10 10:42:17', NULL, '下单时间：2020-10-10 10:42:17');
INSERT INTO `ca_plan_operate_log` VALUES (48, 28, 9, 'TO_BE_REVIEWED', '2020-10-10 10:43:13', NULL, '等待销售助理审核\n申请时间：2020-10-10 10:43:13');
INSERT INTO `ca_plan_operate_log` VALUES (49, 28, NULL, 'REVIEW_REJECTED', '2020-10-10 10:43:49', NULL, '广告计划审核不通过\n原因：不通过\n审核时间：2020-10-10 10:43:49');
INSERT INTO `ca_plan_operate_log` VALUES (50, 28, NULL, 'ABOLISHED', '2020-10-10 10:43:52', NULL, '关闭广告计划\n关闭时间：2020-10-10 10:43:52');
INSERT INTO `ca_plan_operate_log` VALUES (51, 29, 18, 'TO_BE_REVIEWED', '2020-10-10 11:13:59', NULL, '等待销售助理审核\n申请时间：2020-10-10 11:13:58');
INSERT INTO `ca_plan_operate_log` VALUES (52, 29, 876708082437197848, 'REVIEW_APPROVED', '2020-10-10 11:14:11', NULL, '审核时间：2020-10-10 11:14:11');
INSERT INTO `ca_plan_operate_log` VALUES (53, 29, 18, 'ORDER_PLACED', '2020-10-10 11:14:14', NULL, '下单时间：2020-10-10 11:14:14');
INSERT INTO `ca_plan_operate_log` VALUES (54, 30, 3, 'TO_BE_REVIEWED', '2020-10-10 12:26:12', NULL, '等待销售助理审核\n申请时间：2020-10-10 12:26:12');
INSERT INTO `ca_plan_operate_log` VALUES (55, 30, 876708082437197836, 'REVIEW_APPROVED', '2020-10-10 12:26:35', NULL, '审核时间：2020-10-10 12:26:35');
INSERT INTO `ca_plan_operate_log` VALUES (56, 30, 3, 'ORDER_PLACED', '2020-10-10 12:26:38', NULL, '下单时间：2020-10-10 12:26:38');
INSERT INTO `ca_plan_operate_log` VALUES (57, 31, 3, 'TO_BE_REVIEWED', '2020-10-10 12:31:32', NULL, '等待销售助理审核\n申请时间：2020-10-10 12:31:32');
INSERT INTO `ca_plan_operate_log` VALUES (58, 31, 876708082437197836, 'REVIEW_APPROVED', '2020-10-10 12:31:46', NULL, '审核时间：2020-10-10 12:31:46');
INSERT INTO `ca_plan_operate_log` VALUES (59, 31, 3, 'ORDER_PLACED', '2020-10-10 12:31:48', NULL, '下单时间：2020-10-10 12:31:48');
INSERT INTO `ca_plan_operate_log` VALUES (60, 32, 12, 'TO_BE_REVIEWED', '2020-10-10 14:39:27', NULL, '等待销售助理审核\n申请时间：2020-10-10 14:39:26');
INSERT INTO `ca_plan_operate_log` VALUES (61, 32, 876708082437197848, 'REVIEW_APPROVED', '2020-10-10 14:40:13', NULL, '审核时间：2020-10-10 14:40:12');
INSERT INTO `ca_plan_operate_log` VALUES (62, 32, 12, 'ORDER_PLACED', '2020-10-10 14:40:16', NULL, '下单时间：2020-10-10 14:40:16');
INSERT INTO `ca_plan_operate_log` VALUES (63, 33, 15, 'TO_BE_REVIEWED', '2020-10-10 14:59:51', NULL, '等待销售助理审核\n申请时间：2020-10-10 14:59:51');
INSERT INTO `ca_plan_operate_log` VALUES (64, 33, NULL, 'REVIEW_REJECTED', '2020-10-10 15:04:59', NULL, '广告计划审核不通过\n原因：订单太多，不通过\n审核时间：2020-10-10 15:04:59');
INSERT INTO `ca_plan_operate_log` VALUES (65, 33, NULL, 'TO_BE_REVIEWED', '2020-10-10 15:07:08', NULL, '再次提交审核申请\n提交时间：2020-10-10 15:07:08');
INSERT INTO `ca_plan_operate_log` VALUES (66, 33, 876708082437197836, 'REVIEW_APPROVED', '2020-10-10 15:07:14', NULL, '审核时间：2020-10-10 15:07:14');
INSERT INTO `ca_plan_operate_log` VALUES (67, 33, 15, 'ORDER_PLACED', '2020-10-10 15:07:39', NULL, '下单时间：2020-10-10 15:07:39');
INSERT INTO `ca_plan_operate_log` VALUES (68, 34, 22, 'TO_BE_REVIEWED', '2020-10-10 17:53:56', NULL, '等待销售助理审核\n申请时间：2020-10-10 17:53:56');
INSERT INTO `ca_plan_operate_log` VALUES (69, 35, 22, 'TO_BE_REVIEWED', '2020-10-12 15:30:43', NULL, '等待销售助理审核\n申请时间：2020-10-12 15:30:42');
INSERT INTO `ca_plan_operate_log` VALUES (70, 36, 22, 'TO_BE_REVIEWED', '2020-10-12 15:32:24', NULL, '等待销售助理审核\n申请时间：2020-10-12 15:32:24');
INSERT INTO `ca_plan_operate_log` VALUES (71, 36, NULL, 'REVIEW_REJECTED', '2020-10-12 15:33:16', NULL, '广告计划审核不通过\n原因：不合法广告\n审核时间：2020-10-12 15:33:16');
INSERT INTO `ca_plan_operate_log` VALUES (72, 35, NULL, 'REVIEW_REJECTED', '2020-10-12 15:33:28', NULL, '广告计划审核不通过\n原因：计划填写有误，请重新填写\n审核时间：2020-10-12 15:33:28');
INSERT INTO `ca_plan_operate_log` VALUES (73, 36, NULL, 'TO_BE_REVIEWED', '2020-10-12 15:34:22', NULL, '再次提交审核申请\n提交时间：2020-10-12 15:34:22');
INSERT INTO `ca_plan_operate_log` VALUES (74, 36, 876708082437197836, 'REVIEW_APPROVED', '2020-10-12 15:36:50', NULL, '审核时间：2020-10-12 15:36:50');
INSERT INTO `ca_plan_operate_log` VALUES (75, 37, 22, 'TO_BE_REVIEWED', '2020-10-12 15:44:21', NULL, '等待销售助理审核\n申请时间：2020-10-12 15:44:21');
INSERT INTO `ca_plan_operate_log` VALUES (76, 37, 876708082437197836, 'REVIEW_APPROVED', '2020-10-12 15:46:35', NULL, '审核时间：2020-10-12 15:46:35');
INSERT INTO `ca_plan_operate_log` VALUES (77, 37, 22, 'ORDER_PLACED', '2020-10-12 15:46:40', NULL, '下单时间：2020-10-12 15:46:39');
INSERT INTO `ca_plan_operate_log` VALUES (78, 38, 22, 'TO_BE_REVIEWED', '2020-10-13 10:12:44', NULL, '等待销售助理审核\n申请时间：2020-10-13 10:12:44');
INSERT INTO `ca_plan_operate_log` VALUES (79, 39, 22, 'TO_BE_REVIEWED', '2020-10-13 10:57:06', NULL, '等待销售助理审核\n申请时间：2020-10-13 10:57:05');
INSERT INTO `ca_plan_operate_log` VALUES (80, 40, 11, 'TO_BE_REVIEWED', '2020-10-13 11:18:12', NULL, '等待销售助理审核\n申请时间：2020-10-13 11:18:12');
INSERT INTO `ca_plan_operate_log` VALUES (81, 39, NULL, 'REVIEW_REJECTED', '2020-10-13 11:47:53', NULL, '广告计划审核不通过\n原因：重新填写\n\n审核时间：2020-10-13 11:47:53');
INSERT INTO `ca_plan_operate_log` VALUES (82, 39, NULL, 'TO_BE_REVIEWED', '2020-10-13 11:49:14', NULL, '再次提交审核申请\n提交时间：2020-10-13 11:49:13');
INSERT INTO `ca_plan_operate_log` VALUES (83, 39, 876708082437197836, 'REVIEW_APPROVED', '2020-10-13 11:49:32', NULL, '审核时间：2020-10-13 11:49:32');
INSERT INTO `ca_plan_operate_log` VALUES (84, 39, 22, 'ORDER_PLACED', '2020-10-13 11:49:50', NULL, '下单时间：2020-10-13 11:49:50');
INSERT INTO `ca_plan_operate_log` VALUES (85, 38, NULL, 'REVIEW_REJECTED', '2020-10-13 11:50:38', NULL, '广告计划审核不通过\n原因：拒绝你\n审核时间：2020-10-13 11:50:38');
INSERT INTO `ca_plan_operate_log` VALUES (86, 40, 876708082437197848, 'REVIEW_APPROVED', '2020-10-13 12:31:30', NULL, '审核时间：2020-10-13 12:31:29');
INSERT INTO `ca_plan_operate_log` VALUES (87, 40, 11, 'ORDER_PLACED', '2020-10-13 12:31:39', NULL, '下单时间：2020-10-13 12:31:38');
INSERT INTO `ca_plan_operate_log` VALUES (88, 41, 11, 'TO_BE_REVIEWED', '2020-10-13 14:25:44', NULL, '等待销售助理审核\n申请时间：2020-10-13 14:25:44');
INSERT INTO `ca_plan_operate_log` VALUES (89, 41, 876708082437197848, 'REVIEW_APPROVED', '2020-10-13 14:25:51', NULL, '审核时间：2020-10-13 14:25:51');
INSERT INTO `ca_plan_operate_log` VALUES (90, 41, 11, 'ORDER_PLACED', '2020-10-13 14:25:55', NULL, '下单时间：2020-10-13 14:25:54');
INSERT INTO `ca_plan_operate_log` VALUES (91, 42, 11, 'TO_BE_REVIEWED', '2020-10-13 16:45:32', NULL, '等待销售助理审核\n申请时间：2020-10-13 16:45:32');
INSERT INTO `ca_plan_operate_log` VALUES (92, 43, 11, 'TO_BE_REVIEWED', '2020-10-13 16:49:20', NULL, '等待销售助理审核\n申请时间：2020-10-13 16:49:19');
INSERT INTO `ca_plan_operate_log` VALUES (93, 43, 876708082437197848, 'REVIEW_APPROVED', '2020-10-13 17:03:37', NULL, '审核时间：2020-10-13 17:03:37');
INSERT INTO `ca_plan_operate_log` VALUES (94, 43, 11, 'ORDER_PLACED', '2020-10-13 17:03:41', NULL, '下单时间：2020-10-13 17:03:40');
INSERT INTO `ca_plan_operate_log` VALUES (95, 44, 22, 'TO_BE_REVIEWED', '2020-10-14 10:55:54', NULL, '等待销售助理审核\n申请时间：2020-10-14 10:55:53');
INSERT INTO `ca_plan_operate_log` VALUES (96, 44, 876708082437197836, 'REVIEW_APPROVED', '2020-10-14 11:42:17', NULL, '审核时间：2020-10-14 11:42:17');
INSERT INTO `ca_plan_operate_log` VALUES (97, 44, 22, 'ORDER_PLACED', '2020-10-14 11:42:36', NULL, '下单时间：2020-10-14 11:42:36');
INSERT INTO `ca_plan_operate_log` VALUES (98, 45, 27, 'TO_BE_REVIEWED', '2020-10-16 11:28:35', NULL, '等待销售助理审核\n申请时间：2020-10-16 11:28:35');
INSERT INTO `ca_plan_operate_log` VALUES (99, 45, 876708082437197836, 'REVIEW_APPROVED', '2020-10-16 11:28:59', NULL, '审核时间：2020-10-16 11:28:59');
INSERT INTO `ca_plan_operate_log` VALUES (100, 45, 27, 'ORDER_PLACED', '2020-10-16 11:43:23', NULL, '下单时间：2020-10-16 11:43:23');
INSERT INTO `ca_plan_operate_log` VALUES (101, 46, 1, 'TO_BE_REVIEWED', '2020-10-16 16:12:50', NULL, '等待销售助理审核\n申请时间：2020-10-16 16:12:50');
INSERT INTO `ca_plan_operate_log` VALUES (102, 46, NULL, 'REVIEW_REJECTED', '2020-10-16 16:15:58', NULL, '广告计划审核不通过\n原因：拒绝不通过\n审核时间：2020-10-16 16:15:58');
INSERT INTO `ca_plan_operate_log` VALUES (103, 47, 1, 'TO_BE_REVIEWED', '2020-10-16 16:22:48', NULL, '等待销售助理审核\n申请时间：2020-10-16 16:22:48');
INSERT INTO `ca_plan_operate_log` VALUES (104, 46, NULL, 'TO_BE_REVIEWED', '2020-10-16 17:47:25', NULL, '再次提交审核申请\n提交时间：2020-10-16 17:47:25');
INSERT INTO `ca_plan_operate_log` VALUES (105, 48, 1, 'TO_BE_REVIEWED', '2020-10-16 18:01:52', NULL, '等待销售助理审核\n申请时间：2020-10-16 18:01:52');
INSERT INTO `ca_plan_operate_log` VALUES (106, 48, NULL, 'REVIEW_REJECTED', '2020-10-16 18:02:28', NULL, '广告计划审核不通过\n原因：计划有误\n审核时间：2020-10-16 18:02:28');
INSERT INTO `ca_plan_operate_log` VALUES (107, 48, NULL, 'TO_BE_REVIEWED', '2020-10-16 18:03:38', NULL, '再次提交审核申请\n提交时间：2020-10-16 18:03:38');
INSERT INTO `ca_plan_operate_log` VALUES (108, 46, 876708082437197836, 'REVIEW_APPROVED', '2020-10-16 18:41:52', NULL, '审核时间：2020-10-16 18:41:52');
INSERT INTO `ca_plan_operate_log` VALUES (109, 46, 1, 'ORDER_PLACED', '2020-10-16 18:42:10', NULL, '下单时间：2020-10-16 18:42:09');
INSERT INTO `ca_plan_operate_log` VALUES (110, 49, 1, 'TO_BE_REVIEWED', '2020-10-17 11:12:19', NULL, '等待销售助理审核\n申请时间：2020-10-17 11:12:19');
INSERT INTO `ca_plan_operate_log` VALUES (111, 49, 876708082437197836, 'REVIEW_APPROVED', '2020-10-17 11:17:04', NULL, '审核时间：2020-10-17 11:17:04');
INSERT INTO `ca_plan_operate_log` VALUES (112, 49, 1, 'ORDER_PLACED', '2020-10-17 11:17:11', NULL, '下单时间：2020-10-17 11:17:11');
INSERT INTO `ca_plan_operate_log` VALUES (113, 50, 1, 'TO_BE_REVIEWED', '2020-10-17 17:18:04', NULL, '等待销售助理审核\n申请时间：2020-10-17 17:18:04');
INSERT INTO `ca_plan_operate_log` VALUES (114, 50, 876708082437197836, 'REVIEW_APPROVED', '2020-10-17 17:18:37', NULL, '审核时间：2020-10-17 17:18:36');
INSERT INTO `ca_plan_operate_log` VALUES (115, 50, 1, 'ORDER_PLACED', '2020-10-17 17:18:39', NULL, '下单时间：2020-10-17 17:18:39');
INSERT INTO `ca_plan_operate_log` VALUES (116, 51, 1, 'TO_BE_REVIEWED', '2020-10-17 18:20:27', NULL, '等待销售助理审核\n申请时间：2020-10-17 18:20:26');
INSERT INTO `ca_plan_operate_log` VALUES (117, 51, 876708082437197836, 'REVIEW_APPROVED', '2020-10-17 18:20:32', NULL, '审核时间：2020-10-17 18:20:32');
INSERT INTO `ca_plan_operate_log` VALUES (118, 53, 1, 'TO_BE_REVIEWED', '2020-10-19 10:59:36', NULL, '等待销售助理审核\n申请时间：2020-10-19 10:59:35');
INSERT INTO `ca_plan_operate_log` VALUES (119, 53, 876708082437197836, 'REVIEW_APPROVED', '2020-10-19 11:00:38', NULL, '审核时间：2020-10-19 11:00:38');
INSERT INTO `ca_plan_operate_log` VALUES (120, 53, 1, 'ORDER_PLACED', '2020-10-19 11:22:15', NULL, '下单时间：2020-10-19 11:22:14');
INSERT INTO `ca_plan_operate_log` VALUES (121, 54, 1, 'TO_BE_REVIEWED', '2020-10-19 15:11:37', NULL, '等待销售助理审核\n申请时间：2020-10-19 15:11:37');
INSERT INTO `ca_plan_operate_log` VALUES (122, 54, NULL, 'REVIEW_REJECTED', '2020-10-19 15:11:50', NULL, '广告计划审核不通过\n原因：审核不通过\n审核时间：2020-10-19 15:11:50');
INSERT INTO `ca_plan_operate_log` VALUES (123, 51, 1, 'ORDER_PLACED', '2020-10-19 15:14:01', NULL, '下单时间：2020-10-19 15:14:00');
INSERT INTO `ca_plan_operate_log` VALUES (124, 54, NULL, 'TO_BE_REVIEWED', '2020-10-19 15:31:12', NULL, '再次提交审核申请\n提交时间：2020-10-19 15:31:12');
INSERT INTO `ca_plan_operate_log` VALUES (125, 54, 876708082437197836, 'REVIEW_APPROVED', '2020-10-19 15:32:54', NULL, '审核时间：2020-10-19 15:32:54');
INSERT INTO `ca_plan_operate_log` VALUES (126, 54, 1, 'ORDER_PLACED', '2020-10-19 15:32:56', NULL, '下单时间：2020-10-19 15:32:56');
INSERT INTO `ca_plan_operate_log` VALUES (127, 55, 1, 'TO_BE_REVIEWED', '2020-10-19 15:37:15', NULL, '等待销售助理审核\n申请时间：2020-10-19 15:37:15');
INSERT INTO `ca_plan_operate_log` VALUES (128, 55, 876708082437197836, 'REVIEW_APPROVED', '2020-10-19 15:37:20', NULL, '审核时间：2020-10-19 15:37:20');
INSERT INTO `ca_plan_operate_log` VALUES (129, 55, 1, 'ORDER_PLACED', '2020-10-19 15:37:22', NULL, '下单时间：2020-10-19 15:37:22');
INSERT INTO `ca_plan_operate_log` VALUES (130, 56, 4, 'TO_BE_REVIEWED', '2020-10-19 17:19:15', NULL, '等待销售助理审核\n申请时间：2020-10-19 17:19:15');
INSERT INTO `ca_plan_operate_log` VALUES (131, 56, 876708082437197836, 'REVIEW_APPROVED', '2020-10-19 17:19:28', NULL, '审核时间：2020-10-19 17:19:28');
INSERT INTO `ca_plan_operate_log` VALUES (132, 56, 4, 'ORDER_PLACED', '2020-10-19 17:19:31', NULL, '下单时间：2020-10-19 17:19:31');
INSERT INTO `ca_plan_operate_log` VALUES (133, 57, 4, 'TO_BE_REVIEWED', '2020-10-20 10:41:10', NULL, '等待销售助理审核\n申请时间：2020-10-20 10:41:09');
INSERT INTO `ca_plan_operate_log` VALUES (134, 57, 876708082437197836, 'REVIEW_APPROVED', '2020-10-20 11:38:19', NULL, '审核时间：2020-10-20 11:38:19');
INSERT INTO `ca_plan_operate_log` VALUES (135, 57, 4, 'ORDER_PLACED', '2020-10-20 11:38:22', NULL, '下单时间：2020-10-20 11:38:22');
INSERT INTO `ca_plan_operate_log` VALUES (136, 58, 4, 'TO_BE_REVIEWED', '2020-10-20 15:53:31', NULL, '等待销售助理审核\n申请时间：2020-10-20 15:53:31');
INSERT INTO `ca_plan_operate_log` VALUES (137, 58, NULL, 'REVIEW_REJECTED', '2020-10-20 15:54:35', NULL, '广告计划审核不通过\n原因：长文本\n审核时间：2020-10-20 15:54:35');
INSERT INTO `ca_plan_operate_log` VALUES (138, 58, NULL, 'TO_BE_REVIEWED', '2020-10-20 15:55:10', NULL, '再次提交审核申请\n提交时间：2020-10-20 15:55:10');
INSERT INTO `ca_plan_operate_log` VALUES (139, 58, 876708082437197836, 'REVIEW_APPROVED', '2020-10-20 15:56:59', NULL, '审核时间：2020-10-20 15:56:59');
INSERT INTO `ca_plan_operate_log` VALUES (140, 58, 4, 'ORDER_PLACED', '2020-10-20 15:57:01', NULL, '下单时间：2020-10-20 15:57:01');
INSERT INTO `ca_plan_operate_log` VALUES (141, 59, 4, 'TO_BE_REVIEWED', '2020-10-21 10:11:25', NULL, '等待销售助理审核\n申请时间：2020-10-21 10:11:25');
INSERT INTO `ca_plan_operate_log` VALUES (142, 59, 876708082437197836, 'REVIEW_APPROVED', '2020-10-21 10:12:01', NULL, '审核时间：2020-10-21 10:12:01');
INSERT INTO `ca_plan_operate_log` VALUES (143, 59, 4, 'ORDER_PLACED', '2020-10-21 10:12:03', NULL, '下单时间：2020-10-21 10:12:03');
INSERT INTO `ca_plan_operate_log` VALUES (144, 60, 4, 'TO_BE_REVIEWED', '2020-10-22 09:56:09', NULL, '等待销售助理审核\n申请时间：2020-10-22 09:56:08');
INSERT INTO `ca_plan_operate_log` VALUES (145, 60, 876708082437197836, 'REVIEW_APPROVED', '2020-10-22 09:57:45', NULL, '审核时间：2020-10-22 09:57:45');
INSERT INTO `ca_plan_operate_log` VALUES (146, 60, 4, 'ORDER_PLACED', '2020-10-22 09:57:47', NULL, '下单时间：2020-10-22 09:57:47');

-- ----------------------------
-- Table structure for ca_planning_order
-- ----------------------------
DROP TABLE IF EXISTS `ca_planning_order`;
CREATE TABLE `ca_planning_order`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT '所属组织ID',
  `org_tag` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组织标志',
  `plan_id` bigint(20) NOT NULL COMMENT '广告计划id',
  `order_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
  `fee` decimal(10, 2) NULL DEFAULT NULL COMMENT '预计最大预算',
  `release_start_time` datetime NULL DEFAULT NULL COMMENT '投放开始日期',
  `release_end_time` datetime NULL DEFAULT NULL COMMENT '投放结束日期',
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单状态（执行中、已作废、执行完毕）',
  `advertiser_id` bigint(20) NOT NULL COMMENT '广告主id',
  `assistant_id` bigint(20) NOT NULL COMMENT '店小二id',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `report_file_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单结案文件url',
  `report_file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单结案文件名称',
  `round` smallint(6) NULL DEFAULT NULL COMMENT '总场次',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `org_id`(`org_id`, `order_number`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 42 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_planning_order
-- ----------------------------
INSERT INTO `ca_planning_order` VALUES (32, 100000000000000090, NULL, 50, '1317394583717548032', 6000.00, '2020-10-30 00:00:00', '2020-11-01 00:00:00', 'EXECUTING', 1, 876708082437197836, '2020-10-17 17:18:39', NULL, NULL, NULL, '2020-10-22 12:30:27');
INSERT INTO `ca_planning_order` VALUES (33, 100000000000000090, NULL, 53, '1318029666111590400', 14000.00, '2020-10-29 00:00:00', '2020-10-31 00:00:00', 'EXECUTING', 1, 876708082437197836, '2020-10-19 11:22:14', NULL, NULL, NULL, '2020-10-22 12:30:27');
INSERT INTO `ca_planning_order` VALUES (34, 100000000000000090, NULL, 51, '1318087992405004288', 35000.00, '2020-10-30 00:00:00', '2020-11-04 00:00:00', 'EXECUTING', 1, 876708082437197836, '2020-10-19 15:14:00', NULL, NULL, NULL, '2020-10-22 12:30:27');
INSERT INTO `ca_planning_order` VALUES (35, 100000000000000090, NULL, 54, '1318092754970087424', 9000.00, '2020-10-29 00:00:00', '2020-10-31 00:00:00', 'FINISHED', 1, 876708082437197836, '2020-10-19 15:32:56', '/attachments/28bf8629-0bfd-4d26-8f49-f86f3bb98885.xlsx', '销售订单Excel套打模板.xlsx', NULL, '2020-10-22 12:30:27');
INSERT INTO `ca_planning_order` VALUES (36, 100000000000000090, NULL, 55, '1318093870344572928', 17500.00, '2020-10-23 00:00:00', '2020-10-30 00:00:00', 'EXECUTING', 1, 876708082437197836, '2020-10-19 15:37:22', NULL, NULL, NULL, '2020-10-22 12:30:27');
INSERT INTO `ca_planning_order` VALUES (37, 100000000000000109, NULL, 56, '1318119575992274944', 3000.00, '2020-11-04 00:00:00', '2020-11-05 00:00:00', 'FINISHED', 4, 876708082437197836, '2020-10-19 17:19:31', '/attachments/d9bf4680-5a3f-49ff-9b22-a6bb31556194.docx', '绩效考核单.docx', NULL, '2020-10-22 12:30:27');
INSERT INTO `ca_planning_order` VALUES (38, 100000000000000109, NULL, 57, '1318396112847114240', 60000.00, '2020-10-23 00:00:00', '2020-10-31 00:00:00', 'FINISHED', 4, 876708082437197836, '2020-10-20 11:38:22', '/attachments/de6f57bf-3ce7-4fe4-bf4a-ed5038492be5.docx', '物料信息表.docx', NULL, '2020-10-22 12:30:27');
INSERT INTO `ca_planning_order` VALUES (39, 100000000000000109, NULL, 58, '1318461203000987648', 45000.00, '2020-10-25 08:00:00', '2020-10-31 08:00:00', 'EXECUTING', 4, 876708082437197836, '2020-10-20 15:57:01', NULL, NULL, NULL, '2020-10-22 12:30:27');
INSERT INTO `ca_planning_order` VALUES (40, 100000000000000109, NULL, 59, '1318736777917370368', 13500.00, '2020-10-28 08:00:00', '2020-10-31 08:00:00', 'TO_BE_VERIFY', 4, 876708082437197836, '2020-10-21 10:12:03', NULL, NULL, NULL, '2020-10-22 12:30:27');
INSERT INTO `ca_planning_order` VALUES (41, 100000000000000109, NULL, 60, '1319095576398270464', 22500.00, '2020-10-29 08:00:00', '2020-11-03 08:00:00', 'EXECUTING', 4, 876708082437197836, '2020-10-22 09:57:47', NULL, NULL, NULL, '2020-10-22 12:30:27');

-- ----------------------------
-- Table structure for ca_task_file
-- ----------------------------
DROP TABLE IF EXISTS `ca_task_file`;
CREATE TABLE `ca_task_file`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) NULL DEFAULT NULL COMMENT '子订单id',
  `file_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件url',
  `file_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件名称',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '逻辑删除(0=正常，1=删除)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_task_file
-- ----------------------------

-- ----------------------------
-- Table structure for ca_task_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `ca_task_operate_log`;
CREATE TABLE `ca_task_operate_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `task_id` bigint(20) NOT NULL COMMENT '子订单id',
  `operator` bigint(20) NULL DEFAULT NULL COMMENT '操作人',
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `note` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 154 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_task_operate_log
-- ----------------------------
INSERT INTO `ca_task_operate_log` VALUES (1, 2, NULL, 'TO_BE_DELIVER', '2020-10-08 16:50:52', NULL, '订单时间：2020-10-08 16:50:51');
INSERT INTO `ca_task_operate_log` VALUES (2, 2, NULL, 'DELIVERED', '2020-10-08 16:51:31', NULL, '商务助理下发订单\n下发时间：2020-10-08 16:51:31');
INSERT INTO `ca_task_operate_log` VALUES (3, 3, NULL, 'TO_BE_DELIVER', '2020-10-08 17:51:09', NULL, '订单时间：2020-10-08 17:51:09');
INSERT INTO `ca_task_operate_log` VALUES (4, 3, NULL, 'DELIVERED', '2020-10-09 09:37:25', NULL, '商务助理下发订单\n下发时间：2020-10-09 09:37:25');
INSERT INTO `ca_task_operate_log` VALUES (5, 3, NULL, 'TO_BE_VERIFY', '2020-10-09 09:49:36', NULL, '影院上传结案文件：BOM单.docx\n上传时间：2020-10-09 09:49:36');
INSERT INTO `ca_task_operate_log` VALUES (6, 3, NULL, 'VERIFIED', '2020-10-09 16:19:29', NULL, '商务审核拒绝结案\n审核时间：2020-10-09 16:19:29');
INSERT INTO `ca_task_operate_log` VALUES (7, 4, NULL, 'TO_BE_DELIVER', '2020-10-09 17:15:35', NULL, '订单时间：2020-10-09 17:15:35');
INSERT INTO `ca_task_operate_log` VALUES (8, 4, NULL, 'DELIVERED', '2020-10-09 17:16:00', NULL, '商务助理下发订单\n下发时间：2020-10-09 17:16:00');
INSERT INTO `ca_task_operate_log` VALUES (9, 4, NULL, 'TO_BE_VERIFY', '2020-10-09 17:18:23', NULL, '影院上传结案文件：BOM单.docx\n上传时间：2020-10-09 17:18:23');
INSERT INTO `ca_task_operate_log` VALUES (10, 4, NULL, 'VERIFIED', '2020-10-09 17:20:51', NULL, '商务审核拒绝结案\n拒绝原因：拒绝\n审核时间：2020-10-09 17:20:51');
INSERT INTO `ca_task_operate_log` VALUES (11, 5, NULL, 'TO_BE_DELIVER', '2020-10-09 17:36:18', NULL, '订单时间：2020-10-09 17:36:18');
INSERT INTO `ca_task_operate_log` VALUES (12, 4, NULL, 'TO_BE_VERIFY', '2020-10-09 17:48:32', NULL, '影院上传结案文件：PMC计划单.docx\n上传时间：2020-10-09 17:48:32');
INSERT INTO `ca_task_operate_log` VALUES (13, 4, NULL, 'REJECTED', '2020-10-09 17:49:36', NULL, '商务审核拒绝结案\n拒绝原因：原因不明\n审核时间：2020-10-09 17:49:36');
INSERT INTO `ca_task_operate_log` VALUES (14, 4, NULL, 'TO_BE_VERIFY', '2020-10-09 17:50:25', NULL, '影院上传结案文件：BOM单.docx\n上传时间：2020-10-09 17:50:25');
INSERT INTO `ca_task_operate_log` VALUES (15, 4, NULL, 'VERIFIED', '2020-10-09 17:50:47', NULL, '商务确认结案\n结案时间：2020-10-09 17:50:47');
INSERT INTO `ca_task_operate_log` VALUES (16, 6, NULL, 'TO_BE_DELIVER', '2020-10-09 19:15:25', NULL, '订单时间：2020-10-09 19:15:24');
INSERT INTO `ca_task_operate_log` VALUES (17, 6, NULL, 'DELIVERED', '2020-10-09 19:15:59', NULL, '商务助理下发订单\n下发时间：2020-10-09 19:15:59');
INSERT INTO `ca_task_operate_log` VALUES (18, 6, NULL, 'TO_BE_VERIFY', '2020-10-09 19:16:23', NULL, '影院上传结案文件：BOM单.docx\n上传时间：2020-10-09 19:16:23');
INSERT INTO `ca_task_operate_log` VALUES (19, 6, NULL, 'VERIFIED', '2020-10-09 19:16:43', NULL, '商务确认结案\n结案时间：2020-10-09 19:16:43');
INSERT INTO `ca_task_operate_log` VALUES (20, 6, NULL, 'VERIFIED', '2020-10-09 19:16:50', NULL, '商务确认结案\n结案时间：2020-10-09 19:16:50');
INSERT INTO `ca_task_operate_log` VALUES (21, 7, NULL, 'TO_BE_DELIVER', '2020-10-10 09:47:02', NULL, '订单时间：2020-10-10 09:47:01');
INSERT INTO `ca_task_operate_log` VALUES (22, 7, NULL, 'DELIVERED', '2020-10-10 09:48:41', NULL, '商务助理下发订单\n下发时间：2020-10-10 09:48:41');
INSERT INTO `ca_task_operate_log` VALUES (23, 7, NULL, 'TO_BE_VERIFY', '2020-10-10 09:49:32', NULL, '影院上传结案文件：BOM单.docx\n上传时间：2020-10-10 09:49:31');
INSERT INTO `ca_task_operate_log` VALUES (24, 7, NULL, 'REJECTED', '2020-10-10 09:51:07', NULL, '商务审核拒绝结案\n拒绝原因：请重新上传\n审核时间：2020-10-10 09:51:07');
INSERT INTO `ca_task_operate_log` VALUES (25, 7, NULL, 'TO_BE_VERIFY', '2020-10-10 09:51:41', NULL, '影院上传结案文件：BOM单.docx\n上传时间：2020-10-10 09:51:41');
INSERT INTO `ca_task_operate_log` VALUES (26, 7, NULL, 'VERIFIED', '2020-10-10 09:52:01', NULL, '商务确认结案\n结案时间：2020-10-10 09:52:01');
INSERT INTO `ca_task_operate_log` VALUES (27, 8, NULL, 'TO_BE_DELIVER', '2020-10-10 10:17:21', NULL, '订单时间：2020-10-10 10:17:19');
INSERT INTO `ca_task_operate_log` VALUES (28, 9, NULL, 'TO_BE_DELIVER', '2020-10-10 10:17:40', NULL, '订单时间：2020-10-10 10:17:39');
INSERT INTO `ca_task_operate_log` VALUES (29, 10, NULL, 'TO_BE_DELIVER', '2020-10-10 10:17:40', NULL, '订单时间：2020-10-10 10:17:39');
INSERT INTO `ca_task_operate_log` VALUES (30, 11, NULL, 'TO_BE_DELIVER', '2020-10-10 10:18:36', NULL, '订单时间：2020-10-10 10:18:35');
INSERT INTO `ca_task_operate_log` VALUES (31, 12, NULL, 'TO_BE_DELIVER', '2020-10-10 10:18:36', NULL, '订单时间：2020-10-10 10:18:35');
INSERT INTO `ca_task_operate_log` VALUES (32, 10, NULL, 'DELIVERED', '2020-10-10 10:20:52', NULL, '商务助理下发订单\n下发时间：2020-10-10 10:20:52');
INSERT INTO `ca_task_operate_log` VALUES (33, 8, NULL, 'DELIVERED', '2020-10-10 10:26:19', NULL, '商务助理下发订单\n下发时间：2020-10-10 10:26:19');
INSERT INTO `ca_task_operate_log` VALUES (34, 8, NULL, 'TO_BE_VERIFY', '2020-10-10 10:26:54', NULL, '影院上传结案文件：BOM单.docx\n上传时间：2020-10-10 10:26:54');
INSERT INTO `ca_task_operate_log` VALUES (35, 8, NULL, 'VERIFIED', '2020-10-10 10:27:15', NULL, '商务确认结案\n结案时间：2020-10-10 10:27:15');
INSERT INTO `ca_task_operate_log` VALUES (36, 8, NULL, 'FINISHED', '2020-10-10 10:30:00', NULL, '订单已结算完成\n完成时间：2020-10-10 10:30:00');
INSERT INTO `ca_task_operate_log` VALUES (37, 13, NULL, 'TO_BE_DELIVER', '2020-10-10 10:36:56', NULL, '订单时间：2020-10-10 10:36:56');
INSERT INTO `ca_task_operate_log` VALUES (38, 14, NULL, 'TO_BE_DELIVER', '2020-10-10 10:39:21', NULL, '订单时间：2020-10-10 10:39:21');
INSERT INTO `ca_task_operate_log` VALUES (39, 15, NULL, 'TO_BE_DELIVER', '2020-10-10 10:42:17', NULL, '订单时间：2020-10-10 10:42:17');
INSERT INTO `ca_task_operate_log` VALUES (40, 16, NULL, 'TO_BE_DELIVER', '2020-10-10 11:14:14', NULL, '订单时间：2020-10-10 11:14:14');
INSERT INTO `ca_task_operate_log` VALUES (41, 16, NULL, 'DELIVERED', '2020-10-10 11:15:27', NULL, '商务助理下发订单\n下发时间：2020-10-10 11:15:26');
INSERT INTO `ca_task_operate_log` VALUES (42, 10, NULL, 'TO_BE_VERIFY', '2020-10-10 11:27:57', NULL, '影院上传结案文件：BOM单.docx\n上传时间：2020-10-10 11:27:57');
INSERT INTO `ca_task_operate_log` VALUES (43, 10, NULL, 'VERIFIED', '2020-10-10 11:28:10', NULL, '商务确认结案\n结案时间：2020-10-10 11:28:10');
INSERT INTO `ca_task_operate_log` VALUES (44, 12, NULL, 'DELIVERED', '2020-10-10 11:30:16', NULL, '商务助理下发订单\n下发时间：2020-10-10 11:30:16');
INSERT INTO `ca_task_operate_log` VALUES (45, 12, NULL, 'TO_BE_VERIFY', '2020-10-10 11:30:23', NULL, '影院上传结案文件：BOM单.docx\n上传时间：2020-10-10 11:30:23');
INSERT INTO `ca_task_operate_log` VALUES (46, 13, NULL, 'DELIVERED', '2020-10-10 11:40:02', NULL, '商务助理下发订单\n下发时间：2020-10-10 11:40:02');
INSERT INTO `ca_task_operate_log` VALUES (47, 13, NULL, 'TO_BE_VERIFY', '2020-10-10 12:04:21', NULL, '影院上传结案文件：BOM单.docx\n上传时间：2020-10-10 12:04:21');
INSERT INTO `ca_task_operate_log` VALUES (48, 13, NULL, 'VERIFIED', '2020-10-10 12:04:26', NULL, '商务确认结案\n结案时间：2020-10-10 12:04:26');
INSERT INTO `ca_task_operate_log` VALUES (49, 9, NULL, 'DELIVERED', '2020-10-10 12:07:02', NULL, '商务助理下发订单\n下发时间：2020-10-10 12:07:02');
INSERT INTO `ca_task_operate_log` VALUES (50, 11, NULL, 'DELIVERED', '2020-10-10 12:07:36', NULL, '商务助理下发订单\n下发时间：2020-10-10 12:07:36');
INSERT INTO `ca_task_operate_log` VALUES (51, 17, NULL, 'TO_BE_DELIVER', '2020-10-10 12:26:38', NULL, '订单时间：2020-10-10 12:26:38');
INSERT INTO `ca_task_operate_log` VALUES (52, 17, NULL, 'DELIVERED', '2020-10-10 12:28:57', NULL, '商务助理下发订单\n下发时间：2020-10-10 12:28:57');
INSERT INTO `ca_task_operate_log` VALUES (53, 18, NULL, 'TO_BE_DELIVER', '2020-10-10 12:31:48', NULL, '订单时间：2020-10-10 12:31:48');
INSERT INTO `ca_task_operate_log` VALUES (54, 18, NULL, 'DELIVERED', '2020-10-10 12:32:07', NULL, '商务助理下发订单\n下发时间：2020-10-10 12:32:06');
INSERT INTO `ca_task_operate_log` VALUES (55, 12, NULL, 'VERIFIED', '2020-10-10 14:09:54', NULL, '商务确认结案\n结案时间：2020-10-10 14:09:54');
INSERT INTO `ca_task_operate_log` VALUES (56, 19, NULL, 'TO_BE_DELIVER', '2020-10-10 14:40:16', NULL, '订单时间：2020-10-10 14:40:16');
INSERT INTO `ca_task_operate_log` VALUES (57, 20, NULL, 'TO_BE_DELIVER', '2020-10-10 14:40:16', NULL, '订单时间：2020-10-10 14:40:16');
INSERT INTO `ca_task_operate_log` VALUES (58, 21, NULL, 'TO_BE_DELIVER', '2020-10-10 14:40:16', NULL, '订单时间：2020-10-10 14:40:16');
INSERT INTO `ca_task_operate_log` VALUES (59, 22, NULL, 'TO_BE_DELIVER', '2020-10-10 15:07:39', NULL, '订单时间：2020-10-10 15:07:39');
INSERT INTO `ca_task_operate_log` VALUES (60, 23, NULL, 'TO_BE_DELIVER', '2020-10-10 15:07:39', NULL, '订单时间：2020-10-10 15:07:39');
INSERT INTO `ca_task_operate_log` VALUES (61, 23, NULL, 'DELIVERED', '2020-10-10 15:13:06', NULL, '商务助理下发订单\n下发时间：2020-10-10 15:13:06');
INSERT INTO `ca_task_operate_log` VALUES (62, 23, NULL, 'TO_BE_VERIFY', '2020-10-10 15:14:21', NULL, '影院上传结案文件：PMC计划单.docx\n上传时间：2020-10-10 15:14:21');
INSERT INTO `ca_task_operate_log` VALUES (63, 23, NULL, 'VERIFIED', '2020-10-10 15:16:45', NULL, '商务审核拒绝结案\n审核时间：2020-10-10 15:16:45');
INSERT INTO `ca_task_operate_log` VALUES (64, 23, NULL, 'TO_BE_VERIFY', '2020-10-10 16:03:55', NULL, '影院上传结案文件：PMC计划单.docx\n上传时间：2020-10-10 16:03:55');
INSERT INTO `ca_task_operate_log` VALUES (65, 22, NULL, 'DELIVERED', '2020-10-10 16:07:48', NULL, '商务助理下发订单\n下发时间：2020-10-10 16:07:48');
INSERT INTO `ca_task_operate_log` VALUES (66, 22, NULL, 'TO_BE_VERIFY', '2020-10-10 16:31:51', NULL, '影院上传结案文件：BOM单.docx\n上传时间：2020-10-10 16:31:51');
INSERT INTO `ca_task_operate_log` VALUES (67, 22, NULL, 'REJECTED', '2020-10-10 16:32:33', NULL, '商务审核拒绝结案\n拒绝原因：123456\n审核时间：2020-10-10 16:32:33');
INSERT INTO `ca_task_operate_log` VALUES (68, 22, NULL, 'TO_BE_VERIFY', '2020-10-10 16:33:44', NULL, '影院上传结案文件：PMC计划单.docx\n上传时间：2020-10-10 16:33:44');
INSERT INTO `ca_task_operate_log` VALUES (69, 22, NULL, 'VERIFIED', '2020-10-10 16:34:33', NULL, '商务确认结案\n结案时间：2020-10-10 16:34:33');
INSERT INTO `ca_task_operate_log` VALUES (70, 23, NULL, 'VERIFIED', '2020-10-10 16:51:29', NULL, '商务确认结案\n结案时间：2020-10-10 16:51:29');
INSERT INTO `ca_task_operate_log` VALUES (71, 22, NULL, 'FINISHED', '2020-10-10 16:59:42', NULL, '订单已结算完成\n完成时间：2020-10-10 16:59:42');
INSERT INTO `ca_task_operate_log` VALUES (72, 23, NULL, 'FINISHED', '2020-10-10 16:59:42', NULL, '订单已结算完成\n完成时间：2020-10-10 16:59:42');
INSERT INTO `ca_task_operate_log` VALUES (73, 20, NULL, 'DELIVERED', '2020-10-10 17:09:34', NULL, '商务助理下发订单\n下发时间：2020-10-10 17:09:33');
INSERT INTO `ca_task_operate_log` VALUES (74, 14, NULL, 'ABOLISHED', '2020-10-10 18:25:25', NULL, '订单取消时间：2020-10-10 18:25:25');
INSERT INTO `ca_task_operate_log` VALUES (75, 17, NULL, 'TO_BE_VERIFY', '2020-10-10 18:27:58', NULL, '影院上传结案文件：BOM单.docx\n上传时间：2020-10-10 18:27:57');
INSERT INTO `ca_task_operate_log` VALUES (76, 24, NULL, 'TO_BE_DELIVER', '2020-10-12 15:46:51', NULL, '订单时间：2020-10-12 15:46:39');
INSERT INTO `ca_task_operate_log` VALUES (77, 24, NULL, 'DELIVERED', '2020-10-12 15:51:42', NULL, '商务助理下发订单\n下发时间：2020-10-12 15:51:42');
INSERT INTO `ca_task_operate_log` VALUES (78, 24, NULL, 'TO_BE_VERIFY', '2020-10-12 15:52:59', NULL, '影院上传结案文件：BOM单.docx\n上传时间：2020-10-12 15:52:59');
INSERT INTO `ca_task_operate_log` VALUES (79, 24, NULL, 'REJECTED', '2020-10-12 15:54:49', NULL, '商务审核拒绝结案\n拒绝原因：结案不完整，请重新提交\n\n审核时间：2020-10-12 15:54:49');
INSERT INTO `ca_task_operate_log` VALUES (80, 24, NULL, 'TO_BE_VERIFY', '2020-10-12 15:55:55', NULL, '影院上传结案文件：PMC计划单.docx\n上传时间：2020-10-12 15:55:55');
INSERT INTO `ca_task_operate_log` VALUES (81, 24, NULL, 'VERIFIED', '2020-10-12 15:57:22', NULL, '商务确认结案\n结案时间：2020-10-12 15:57:22');
INSERT INTO `ca_task_operate_log` VALUES (82, 25, NULL, 'TO_BE_DELIVER', '2020-10-13 11:49:52', NULL, '订单时间：2020-10-13 11:49:50');
INSERT INTO `ca_task_operate_log` VALUES (83, 26, NULL, 'TO_BE_DELIVER', '2020-10-13 11:49:52', NULL, '订单时间：2020-10-13 11:49:50');
INSERT INTO `ca_task_operate_log` VALUES (84, 26, NULL, 'DELIVERED', '2020-10-13 12:21:29', NULL, '商务助理下发订单\n下发时间：2020-10-13 12:21:29');
INSERT INTO `ca_task_operate_log` VALUES (85, 26, NULL, 'TO_BE_VERIFY', '2020-10-13 12:22:42', NULL, '影院上传结案文件：BOM单.docx\n上传时间：2020-10-13 12:22:42');
INSERT INTO `ca_task_operate_log` VALUES (86, 26, NULL, 'REJECTED', '2020-10-13 12:23:10', NULL, '商务审核拒绝结案\n拒绝原因：重新上传\n审核时间：2020-10-13 12:23:10');
INSERT INTO `ca_task_operate_log` VALUES (87, 26, NULL, 'TO_BE_VERIFY', '2020-10-13 12:24:17', NULL, '影院上传结案文件：BOM单.docx\n上传时间：2020-10-13 12:24:16');
INSERT INTO `ca_task_operate_log` VALUES (88, 26, NULL, 'VERIFIED', '2020-10-13 12:24:36', NULL, '商务确认结案\n结案时间：2020-10-13 12:24:36');
INSERT INTO `ca_task_operate_log` VALUES (89, 27, NULL, 'TO_BE_DELIVER', '2020-10-13 12:31:55', NULL, '订单时间：2020-10-13 12:31:38');
INSERT INTO `ca_task_operate_log` VALUES (90, 27, NULL, 'DELIVERED', '2020-10-13 12:32:21', NULL, '商务助理下发订单\n下发时间：2020-10-13 12:32:20');
INSERT INTO `ca_task_operate_log` VALUES (91, 28, NULL, 'TO_BE_DELIVER', '2020-10-13 14:26:01', NULL, '订单时间：2020-10-13 14:25:54');
INSERT INTO `ca_task_operate_log` VALUES (92, 25, NULL, 'DELIVERED', '2020-10-13 14:56:32', NULL, '商务助理下发订单\n下发时间：2020-10-13 14:56:32');
INSERT INTO `ca_task_operate_log` VALUES (93, 29, NULL, 'TO_BE_DELIVER', '2020-10-13 17:03:48', NULL, '订单时间：2020-10-13 17:03:40');
INSERT INTO `ca_task_operate_log` VALUES (94, 30, NULL, 'TO_BE_DELIVER', '2020-10-14 11:42:38', NULL, '订单时间：2020-10-14 11:42:36');
INSERT INTO `ca_task_operate_log` VALUES (95, 30, NULL, 'DELIVERED', '2020-10-14 11:50:14', NULL, '商务助理下发订单\n下发时间：2020-10-14 11:50:14');
INSERT INTO `ca_task_operate_log` VALUES (96, 30, NULL, 'TO_BE_VERIFY', '2020-10-14 11:50:46', NULL, '影院上传结案文件：BOM单.docx\n上传时间：2020-10-14 11:50:45');
INSERT INTO `ca_task_operate_log` VALUES (97, 30, NULL, 'VERIFIED', '2020-10-14 11:57:41', NULL, '商务确认结案\n结案时间：2020-10-14 11:57:41');
INSERT INTO `ca_task_operate_log` VALUES (98, 25, NULL, 'TO_BE_VERIFY', '2020-10-16 11:12:05', NULL, '影院上传结案文件：BOM单.docx\n上传时间：2020-10-16 11:12:05');
INSERT INTO `ca_task_operate_log` VALUES (99, 25, NULL, 'VERIFIED', '2020-10-16 11:18:45', NULL, '商务确认结案\n结案时间：2020-10-16 11:18:45');
INSERT INTO `ca_task_operate_log` VALUES (100, 31, NULL, 'TO_BE_DELIVER', '2020-10-16 11:43:24', NULL, '订单时间：2020-10-16 11:43:23');
INSERT INTO `ca_task_operate_log` VALUES (101, 31, NULL, 'DELIVERED', '2020-10-16 15:07:16', NULL, '商务助理下发订单\n下发时间：2020-10-16 15:07:16');
INSERT INTO `ca_task_operate_log` VALUES (102, 31, NULL, 'TO_BE_VERIFY', '2020-10-16 15:09:04', NULL, '影院上传结案文件：BOM单.docx\n上传时间：2020-10-16 15:09:04');
INSERT INTO `ca_task_operate_log` VALUES (103, 32, NULL, 'TO_BE_DELIVER', '2020-10-16 18:42:11', NULL, '订单时间：2020-10-16 18:42:09');
INSERT INTO `ca_task_operate_log` VALUES (104, 33, NULL, 'TO_BE_DELIVER', '2020-10-17 11:17:17', NULL, '订单时间：2020-10-17 11:17:11');
INSERT INTO `ca_task_operate_log` VALUES (105, 34, NULL, 'TO_BE_DELIVER', '2020-10-17 11:17:17', NULL, '订单时间：2020-10-17 11:17:11');
INSERT INTO `ca_task_operate_log` VALUES (106, 34, NULL, 'DELIVERED', '2020-10-17 11:25:56', NULL, '商务助理下发订单\n下发时间：2020-10-17 11:25:56');
INSERT INTO `ca_task_operate_log` VALUES (107, 33, NULL, 'ABOLISHED', '2020-10-17 11:27:32', NULL, '订单取消时间：2020-10-17 11:27:32');
INSERT INTO `ca_task_operate_log` VALUES (108, 34, NULL, 'TO_BE_VERIFY', '2020-10-17 11:28:34', NULL, '影院上传结案文件：绩效考核标准维护单.docx\n上传时间：2020-10-17 11:28:34');
INSERT INTO `ca_task_operate_log` VALUES (109, 34, NULL, 'VERIFIED', '2020-10-17 11:29:32', NULL, '商务确认结案\n结案时间：2020-10-17 11:29:31');
INSERT INTO `ca_task_operate_log` VALUES (110, 35, NULL, 'TO_BE_DELIVER', '2020-10-17 17:18:39', NULL, '订单时间：2020-10-17 17:18:39');
INSERT INTO `ca_task_operate_log` VALUES (111, 35, NULL, 'DELIVERED', '2020-10-17 17:19:16', NULL, '商务助理下发订单\n下发时间：2020-10-17 17:19:16');
INSERT INTO `ca_task_operate_log` VALUES (112, 35, NULL, 'TO_BE_VERIFY', '2020-10-17 17:20:08', NULL, '影院上传结案文件：物料信息表.docx\n上传时间：2020-10-17 17:20:08');
INSERT INTO `ca_task_operate_log` VALUES (113, 35, NULL, 'REJECTED', '2020-10-17 17:21:30', NULL, '商务审核拒绝结案\n拒绝原因：123456\n审核时间：2020-10-17 17:21:30');
INSERT INTO `ca_task_operate_log` VALUES (114, 35, NULL, 'TO_BE_VERIFY', '2020-10-17 17:22:03', NULL, '影院上传结案文件：科目结存单.docx\n上传时间：2020-10-17 17:22:03');
INSERT INTO `ca_task_operate_log` VALUES (115, 36, NULL, 'TO_BE_DELIVER', '2020-10-19 11:22:16', NULL, '订单时间：2020-10-19 11:22:14');
INSERT INTO `ca_task_operate_log` VALUES (116, 37, NULL, 'TO_BE_DELIVER', '2020-10-19 11:22:16', NULL, '订单时间：2020-10-19 11:22:14');
INSERT INTO `ca_task_operate_log` VALUES (117, 37, NULL, 'DELIVERED', '2020-10-19 11:27:29', NULL, '商务助理下发订单\n下发时间：2020-10-19 11:27:29');
INSERT INTO `ca_task_operate_log` VALUES (118, 38, NULL, 'TO_BE_DELIVER', '2020-10-19 15:14:01', NULL, '订单时间：2020-10-19 15:14:00');
INSERT INTO `ca_task_operate_log` VALUES (119, 39, NULL, 'TO_BE_DELIVER', '2020-10-19 15:14:01', NULL, '订单时间：2020-10-19 15:14:00');
INSERT INTO `ca_task_operate_log` VALUES (120, 40, NULL, 'TO_BE_DELIVER', '2020-10-19 15:33:02', NULL, '订单时间：2020-10-19 15:32:56');
INSERT INTO `ca_task_operate_log` VALUES (121, 40, NULL, 'DELIVERED', '2020-10-19 15:33:39', NULL, '商务助理下发订单\n下发时间：2020-10-19 15:33:39');
INSERT INTO `ca_task_operate_log` VALUES (122, 40, NULL, 'TO_BE_VERIFY', '2020-10-19 15:34:23', NULL, '影院上传结案文件：BOM单.docx\n上传时间：2020-10-19 15:34:23');
INSERT INTO `ca_task_operate_log` VALUES (123, 40, NULL, 'VERIFIED', '2020-10-19 15:35:20', NULL, '商务确认结案\n结案时间：2020-10-19 15:35:20');
INSERT INTO `ca_task_operate_log` VALUES (124, 40, NULL, 'FINISHED', '2020-10-19 15:36:33', NULL, '订单已结算完成\n完成时间：2020-10-19 15:36:33');
INSERT INTO `ca_task_operate_log` VALUES (125, 41, NULL, 'TO_BE_DELIVER', '2020-10-19 15:37:22', NULL, '订单时间：2020-10-19 15:37:22');
INSERT INTO `ca_task_operate_log` VALUES (126, 41, NULL, 'ABOLISHED', '2020-10-19 15:37:34', NULL, '订单取消时间：2020-10-19 15:37:34');
INSERT INTO `ca_task_operate_log` VALUES (127, 42, NULL, 'TO_BE_DELIVER', '2020-10-19 17:19:31', NULL, '订单时间：2020-10-19 17:19:31');
INSERT INTO `ca_task_operate_log` VALUES (128, 42, NULL, 'DELIVERED', '2020-10-19 17:52:56', NULL, '商务助理下发订单\n下发时间：2020-10-19 17:52:55');
INSERT INTO `ca_task_operate_log` VALUES (129, 42, NULL, 'TO_BE_VERIFY', '2020-10-19 17:53:46', NULL, '影院上传结案文件：报销单模板.docx\n上传时间：2020-10-19 17:53:45');
INSERT INTO `ca_task_operate_log` VALUES (130, 42, NULL, 'REJECTED', '2020-10-19 17:55:08', NULL, '商务审核拒绝结案\n拒绝原因：阿勒？不通过喔\n审核时间：2020-10-19 17:55:08');
INSERT INTO `ca_task_operate_log` VALUES (131, 42, NULL, 'TO_BE_VERIFY', '2020-10-19 17:55:35', NULL, '影院上传结案文件：报销单模板.docx\n上传时间：2020-10-19 17:55:34');
INSERT INTO `ca_task_operate_log` VALUES (132, 42, NULL, 'VERIFIED', '2020-10-19 17:55:55', NULL, '商务确认结案\n结案时间：2020-10-19 17:55:55');
INSERT INTO `ca_task_operate_log` VALUES (133, 42, NULL, 'FINISHED', '2020-10-19 17:58:38', NULL, '订单已结算完成\n完成时间：2020-10-19 17:58:38');
INSERT INTO `ca_task_operate_log` VALUES (134, 43, NULL, 'TO_BE_DELIVER', '2020-10-20 11:38:24', NULL, '订单时间：2020-10-20 11:38:22');
INSERT INTO `ca_task_operate_log` VALUES (135, 44, NULL, 'TO_BE_DELIVER', '2020-10-20 11:38:24', NULL, '订单时间：2020-10-20 11:38:22');
INSERT INTO `ca_task_operate_log` VALUES (136, 44, NULL, 'ABOLISHED', '2020-10-20 14:56:59', NULL, '订单取消时间：2020-10-20 14:56:59');
INSERT INTO `ca_task_operate_log` VALUES (137, 43, NULL, 'DELIVERED', '2020-10-20 14:57:03', NULL, '商务助理下发订单\n下发时间：2020-10-20 14:57:02');
INSERT INTO `ca_task_operate_log` VALUES (138, 43, NULL, 'TO_BE_VERIFY', '2020-10-20 14:59:29', NULL, '影院上传结案文件：出库单单.docx\n上传时间：2020-10-20 14:59:29');
INSERT INTO `ca_task_operate_log` VALUES (139, 43, NULL, 'VERIFIED', '2020-10-20 15:00:31', NULL, '商务确认结案\n结案时间：2020-10-20 15:00:30');
INSERT INTO `ca_task_operate_log` VALUES (140, 45, NULL, 'TO_BE_DELIVER', '2020-10-20 15:57:15', NULL, '订单时间：2020-10-20 15:57:01');
INSERT INTO `ca_task_operate_log` VALUES (141, 46, NULL, 'TO_BE_DELIVER', '2020-10-20 15:57:15', NULL, '订单时间：2020-10-20 15:57:01');
INSERT INTO `ca_task_operate_log` VALUES (142, 45, NULL, 'ABOLISHED', '2020-10-20 15:57:58', NULL, '订单取消时间：2020-10-20 15:57:58');
INSERT INTO `ca_task_operate_log` VALUES (143, 46, NULL, 'ABOLISHED', '2020-10-20 15:58:01', NULL, '订单取消时间：2020-10-20 15:58:00');
INSERT INTO `ca_task_operate_log` VALUES (144, 38, NULL, 'DELIVERED', '2020-10-21 09:55:54', NULL, '商务助理下发订单\n下发时间：2020-10-21 09:55:54');
INSERT INTO `ca_task_operate_log` VALUES (145, 38, NULL, 'TO_BE_VERIFY', '2020-10-21 09:56:28', NULL, '影院上传结案文件：库存台账记录单单.docx\n上传时间：2020-10-21 09:56:28');
INSERT INTO `ca_task_operate_log` VALUES (146, 38, NULL, 'VERIFIED', '2020-10-21 09:58:47', NULL, '商务确认结案\n结案时间：2020-10-21 09:58:47');
INSERT INTO `ca_task_operate_log` VALUES (147, 47, NULL, 'TO_BE_DELIVER', '2020-10-21 10:12:04', NULL, '订单时间：2020-10-21 10:12:03');
INSERT INTO `ca_task_operate_log` VALUES (148, 47, NULL, 'DELIVERED', '2020-10-21 10:12:30', NULL, '商务助理下发订单\n下发时间：2020-10-21 10:12:30');
INSERT INTO `ca_task_operate_log` VALUES (149, 47, NULL, 'TO_BE_VERIFY', '2020-10-21 10:13:12', NULL, '影院上传结案文件：销售订单Word套打模板.docx\n上传时间：2020-10-21 10:13:12');
INSERT INTO `ca_task_operate_log` VALUES (150, 47, NULL, 'VERIFIED', '2020-10-21 10:13:46', NULL, '商务确认结案\n结案时间：2020-10-21 10:13:46');
INSERT INTO `ca_task_operate_log` VALUES (151, 43, NULL, 'FINISHED', '2020-10-21 15:44:03', NULL, '订单已结算完成\n完成时间：2020-10-21 15:44:03');
INSERT INTO `ca_task_operate_log` VALUES (152, 48, NULL, 'TO_BE_DELIVER', '2020-10-22 09:57:48', NULL, '订单时间：2020-10-22 09:57:47');
INSERT INTO `ca_task_operate_log` VALUES (153, 48, NULL, 'ABOLISHED', '2020-10-22 09:59:47', NULL, '订单取消时间：2020-10-22 09:59:46');

-- ----------------------------
-- Table structure for cr_issue_task
-- ----------------------------
DROP TABLE IF EXISTS `cr_issue_task`;
CREATE TABLE `cr_issue_task`  (
  `id` bigint(20) NOT NULL COMMENT '缺陷记录ID',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT '用于隔离的组织ID，由crud-plus维护（保留便于扩展）',
  `org_tag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用于隔离的组织标识（保留便于扩展）',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '关联问题ID，可以引申子问题',
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '标题',
  `ticket` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '编号(任务或问题)',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '缺陷名称',
  `originator` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '问题发起人',
  `originator_user_id` bigint(20) NULL DEFAULT NULL COMMENT '问题发起人系统用户ID',
  `module_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '问题所属模块',
  `status` smallint(6) NULL DEFAULT NULL COMMENT 'Undefined-无状态, Open-打开,Fixed-已修得,Verifed-已验证,Closed-已关闭,Duplicated-重复问题,NFP-无计划修改,Failure-验证失败',
  `type` smallint(6) NULL DEFAULT NULL COMMENT '0-任务类型, ..., 10-前端问题,11 -> 后端问题 ...',
  `reference_url` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '问题详情引用 (通过第三方平台进行管理具体问题详情)',
  `priority` smallint(6) NULL DEFAULT NULL COMMENT '问题优先级 1-最高优化先  5-最低优先级',
  `follower_user_id` bigint(20) NULL DEFAULT NULL COMMENT '跟进人员ID',
  `follower` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '跟进人名称',
  `remark` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_deleted` smallint(6) NULL DEFAULT NULL COMMENT '逻辑删除 默认值0, 1为删除标记',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '缺陷信息创建时间',
  `update_time` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '缺陷记录更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cr_issue_task
-- ----------------------------

-- ----------------------------
-- Table structure for flyway_schema_history
-- ----------------------------
DROP TABLE IF EXISTS `flyway_schema_history`;
CREATE TABLE `flyway_schema_history`  (
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `type` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `script` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `checksum` int(11) NULL DEFAULT NULL,
  `installed_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`installed_rank`) USING BTREE,
  INDEX `flyway_schema_history_s_idx`(`success`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of flyway_schema_history
-- ----------------------------
INSERT INTO `flyway_schema_history` VALUES (1, NULL, 'hello', 'SQL', 'R__hello.sql', 0, 'root', '2020-09-19 16:36:58', 29, 1);

-- ----------------------------
-- Table structure for kpi_coding_commit_record
-- ----------------------------
DROP TABLE IF EXISTS `kpi_coding_commit_record`;
CREATE TABLE `kpi_coding_commit_record`  (
  `id` bigint(20) NOT NULL COMMENT '记录ID',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT '用于隔离的组织ID，由crud-plus维护（保留便于扩展）',
  `org_tag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用于隔离的组织标识',
  `module_id` bigint(20) NULL DEFAULT NULL COMMENT '模块ID',
  `module_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块名称',
  `commit_id` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '提交ID',
  `commit_author` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '作者',
  `commit_comment` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `commit_lines` int(11) NULL DEFAULT NULL COMMENT '提交行数',
  `is_deleted` smallint(6) NULL DEFAULT NULL COMMENT '逻辑删除 默认值0, 1为删除标记',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间，crud-plus框架保留字段**,**自动忽略更新',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kpi_coding_commit_record
-- ----------------------------

-- ----------------------------
-- Table structure for kpi_coding_module
-- ----------------------------
DROP TABLE IF EXISTS `kpi_coding_module`;
CREATE TABLE `kpi_coding_module`  (
  `id` bigint(20) NOT NULL COMMENT '模块ID',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT '用于隔离的组织ID，由crud-plus维护',
  `org_tag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用于隔离的组织标识',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块名称',
  `project_id` bigint(20) NULL DEFAULT NULL COMMENT '仓库ID',
  `project_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '模块代码项目名称',
  `repo_url` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '仓库地址',
  `is_deleted` smallint(6) NULL DEFAULT NULL COMMENT '逻辑删除 默认值0, 1为删除标记',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '模块信息创建时间，crud-plus框架保留字段**,**自动忽略更新',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kpi_coding_module
-- ----------------------------

-- ----------------------------
-- Table structure for kpi_coding_project
-- ----------------------------
DROP TABLE IF EXISTS `kpi_coding_project`;
CREATE TABLE `kpi_coding_project`  (
  `id` bigint(20) NOT NULL COMMENT '记录ID',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT '用于隔离的组织ID，由crud-plus维护（保留便于扩展）',
  `org_tag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用于隔离的组织标识',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目名称',
  `client_id` bigint(20) NULL DEFAULT NULL COMMENT '客户ID',
  `desc` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '项目描述',
  `is_deleted` smallint(6) NULL DEFAULT NULL COMMENT '逻辑删除 默认值0, 1为删除标记',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '项目信息创建时间，crud-plus框架保留字段,自动忽略更新',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kpi_coding_project
-- ----------------------------

-- ----------------------------
-- Table structure for kpi_coding_submitter
-- ----------------------------
DROP TABLE IF EXISTS `kpi_coding_submitter`;
CREATE TABLE `kpi_coding_submitter`  (
  `id` bigint(20) NOT NULL COMMENT '人员ID',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT '用于隔离的组织ID，由crud-plus维护',
  `org_tag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用于隔离的组织标识',
  `commit_author` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开发者名称',
  `commit_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '开发者邮箱',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '系统用户ID',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '开发人员信息创建时间，crud-plus框架保留字段,自动忽略更新',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of kpi_coding_submitter
-- ----------------------------

-- ----------------------------
-- Table structure for pcd
-- ----------------------------
DROP TABLE IF EXISTS `pcd`;
CREATE TABLE `pcd`  (
  `id` bigint(20) NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` bigint(20) NULL DEFAULT NULL,
  `city_level` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `pcd_name`(`name`) USING BTREE,
  INDEX `pid`(`pid`) USING BTREE,
  CONSTRAINT `pcd_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `pcd` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pcd
-- ----------------------------
INSERT INTO `pcd` VALUES (1, '北京', 'p', NULL, 'A1');
INSERT INTO `pcd` VALUES (2, '北京', 'c', 1, 'A1');
INSERT INTO `pcd` VALUES (3, '东城区', 'd', 2, NULL);
INSERT INTO `pcd` VALUES (4, '西城区', 'd', 2, NULL);
INSERT INTO `pcd` VALUES (5, '崇文区', 'd', 2, NULL);
INSERT INTO `pcd` VALUES (6, '宣武区', 'd', 2, NULL);
INSERT INTO `pcd` VALUES (7, '朝阳区', 'd', 2, 'A5');
INSERT INTO `pcd` VALUES (8, '丰台区', 'd', 2, NULL);
INSERT INTO `pcd` VALUES (9, '石景山区', 'd', 2, NULL);
INSERT INTO `pcd` VALUES (10, '海淀区', 'd', 2, NULL);
INSERT INTO `pcd` VALUES (11, '门头沟区', 'd', 2, NULL);
INSERT INTO `pcd` VALUES (12, '房山区', 'd', 2, NULL);
INSERT INTO `pcd` VALUES (13, '通州区', 'd', 2, NULL);
INSERT INTO `pcd` VALUES (14, '顺义区', 'd', 2, NULL);
INSERT INTO `pcd` VALUES (15, '昌平区', 'd', 2, NULL);
INSERT INTO `pcd` VALUES (16, '大兴区', 'd', 2, NULL);
INSERT INTO `pcd` VALUES (17, '平谷区', 'd', 2, NULL);
INSERT INTO `pcd` VALUES (18, '怀柔区', 'd', 2, NULL);
INSERT INTO `pcd` VALUES (19, '密云县', 'd', 2, NULL);
INSERT INTO `pcd` VALUES (20, '延庆县', 'd', 2, NULL);
INSERT INTO `pcd` VALUES (21, '天津', 'p', NULL, 'A3');
INSERT INTO `pcd` VALUES (22, '天津', 'c', 21, 'A3');
INSERT INTO `pcd` VALUES (23, '和平区', 'd', 22, NULL);
INSERT INTO `pcd` VALUES (24, '河东区', 'd', 22, NULL);
INSERT INTO `pcd` VALUES (25, '河西区', 'd', 22, NULL);
INSERT INTO `pcd` VALUES (26, '南开区', 'd', 22, NULL);
INSERT INTO `pcd` VALUES (27, '河北区', 'd', 22, NULL);
INSERT INTO `pcd` VALUES (28, '红桥区', 'd', 22, NULL);
INSERT INTO `pcd` VALUES (29, '塘沽区', 'd', 22, NULL);
INSERT INTO `pcd` VALUES (30, '汉沽区', 'd', 22, NULL);
INSERT INTO `pcd` VALUES (31, '大港区', 'd', 22, NULL);
INSERT INTO `pcd` VALUES (32, '东丽区', 'd', 22, NULL);
INSERT INTO `pcd` VALUES (33, '西青区', 'd', 22, NULL);
INSERT INTO `pcd` VALUES (34, '津南区', 'd', 22, NULL);
INSERT INTO `pcd` VALUES (35, '北辰区', 'd', 22, NULL);
INSERT INTO `pcd` VALUES (36, '武清区', 'd', 22, NULL);
INSERT INTO `pcd` VALUES (37, '宝坻区', 'd', 22, NULL);
INSERT INTO `pcd` VALUES (38, '宁河县', 'd', 22, NULL);
INSERT INTO `pcd` VALUES (39, '静海县', 'd', 22, NULL);
INSERT INTO `pcd` VALUES (40, '蓟  县', 'd', 22, NULL);
INSERT INTO `pcd` VALUES (41, '河北', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (42, '石家庄', 'c', 41, 'A3');
INSERT INTO `pcd` VALUES (43, '长安区', 'd', 42, NULL);
INSERT INTO `pcd` VALUES (44, '桥东区', 'd', 42, NULL);
INSERT INTO `pcd` VALUES (45, '桥西区', 'd', 42, NULL);
INSERT INTO `pcd` VALUES (46, '新华区', 'd', 42, NULL);
INSERT INTO `pcd` VALUES (47, '郊  区', 'd', 42, NULL);
INSERT INTO `pcd` VALUES (48, '井陉矿区', 'd', 42, NULL);
INSERT INTO `pcd` VALUES (49, '井陉县', 'd', 42, NULL);
INSERT INTO `pcd` VALUES (50, '正定县', 'd', 42, NULL);
INSERT INTO `pcd` VALUES (51, '栾城县', 'd', 42, NULL);
INSERT INTO `pcd` VALUES (52, '行唐县', 'd', 42, NULL);
INSERT INTO `pcd` VALUES (53, '灵寿县', 'd', 42, NULL);
INSERT INTO `pcd` VALUES (54, '高邑县', 'd', 42, NULL);
INSERT INTO `pcd` VALUES (55, '深泽县', 'd', 42, NULL);
INSERT INTO `pcd` VALUES (56, '赞皇县', 'd', 42, NULL);
INSERT INTO `pcd` VALUES (57, '无极县', 'd', 42, NULL);
INSERT INTO `pcd` VALUES (58, '平山县', 'd', 42, NULL);
INSERT INTO `pcd` VALUES (59, '元氏县', 'd', 42, NULL);
INSERT INTO `pcd` VALUES (60, '赵  县', 'd', 42, NULL);
INSERT INTO `pcd` VALUES (61, '辛集市', 'd', 42, NULL);
INSERT INTO `pcd` VALUES (62, '藁', 'd', 42, NULL);
INSERT INTO `pcd` VALUES (63, '晋州市', 'd', 42, NULL);
INSERT INTO `pcd` VALUES (64, '新乐市', 'd', 42, NULL);
INSERT INTO `pcd` VALUES (65, '鹿泉市', 'd', 42, NULL);
INSERT INTO `pcd` VALUES (66, '唐山', 'c', 41, 'A3');
INSERT INTO `pcd` VALUES (67, '路南区', 'd', 66, NULL);
INSERT INTO `pcd` VALUES (68, '路北区', 'd', 66, NULL);
INSERT INTO `pcd` VALUES (69, '古冶区', 'd', 66, NULL);
INSERT INTO `pcd` VALUES (70, '开平区', 'd', 66, NULL);
INSERT INTO `pcd` VALUES (71, '新  区', 'd', 66, NULL);
INSERT INTO `pcd` VALUES (72, '丰润县', 'd', 66, NULL);
INSERT INTO `pcd` VALUES (73, '滦  县', 'd', 66, NULL);
INSERT INTO `pcd` VALUES (74, '滦南县', 'd', 66, NULL);
INSERT INTO `pcd` VALUES (75, '乐亭县', 'd', 66, NULL);
INSERT INTO `pcd` VALUES (76, '迁西县', 'd', 66, NULL);
INSERT INTO `pcd` VALUES (77, '玉田县', 'd', 66, NULL);
INSERT INTO `pcd` VALUES (78, '唐海县', 'd', 66, NULL);
INSERT INTO `pcd` VALUES (79, '遵化市', 'd', 66, NULL);
INSERT INTO `pcd` VALUES (80, '丰南市', 'd', 66, NULL);
INSERT INTO `pcd` VALUES (81, '迁安市', 'd', 66, NULL);
INSERT INTO `pcd` VALUES (82, '秦皇岛', 'c', 41, 'A4');
INSERT INTO `pcd` VALUES (83, '海港区', 'd', 82, NULL);
INSERT INTO `pcd` VALUES (84, '山海关区', 'd', 82, NULL);
INSERT INTO `pcd` VALUES (85, '北戴河区', 'd', 82, NULL);
INSERT INTO `pcd` VALUES (86, '青龙满族自治县', 'd', 82, NULL);
INSERT INTO `pcd` VALUES (87, '昌黎县', 'd', 82, NULL);
INSERT INTO `pcd` VALUES (88, '抚宁县', 'd', 82, NULL);
INSERT INTO `pcd` VALUES (89, '卢龙县', 'd', 82, NULL);
INSERT INTO `pcd` VALUES (90, '邯郸', 'c', 41, 'A4');
INSERT INTO `pcd` VALUES (91, '邯山区', 'd', 90, NULL);
INSERT INTO `pcd` VALUES (92, '丛台区', 'd', 90, NULL);
INSERT INTO `pcd` VALUES (93, '复兴区', 'd', 90, NULL);
INSERT INTO `pcd` VALUES (94, '峰峰矿区', 'd', 90, NULL);
INSERT INTO `pcd` VALUES (95, '邯郸县', 'd', 90, 'A4');
INSERT INTO `pcd` VALUES (96, '临漳县', 'd', 90, NULL);
INSERT INTO `pcd` VALUES (97, '成安县', 'd', 90, NULL);
INSERT INTO `pcd` VALUES (98, '大名县', 'd', 90, NULL);
INSERT INTO `pcd` VALUES (99, '涉  县', 'd', 90, NULL);
INSERT INTO `pcd` VALUES (100, '磁  县', 'd', 90, NULL);
INSERT INTO `pcd` VALUES (101, '肥乡县', 'd', 90, NULL);
INSERT INTO `pcd` VALUES (102, '永年县', 'd', 90, NULL);
INSERT INTO `pcd` VALUES (103, '邱  县', 'd', 90, NULL);
INSERT INTO `pcd` VALUES (104, '鸡泽县', 'd', 90, NULL);
INSERT INTO `pcd` VALUES (105, '广平县', 'd', 90, NULL);
INSERT INTO `pcd` VALUES (106, '馆陶县', 'd', 90, NULL);
INSERT INTO `pcd` VALUES (107, '魏  县', 'd', 90, NULL);
INSERT INTO `pcd` VALUES (108, '曲周县', 'd', 90, NULL);
INSERT INTO `pcd` VALUES (109, '武安市', 'd', 90, NULL);
INSERT INTO `pcd` VALUES (110, '邢台', 'c', 41, 'A4');
INSERT INTO `pcd` VALUES (111, '桥东区', 'd', 110, NULL);
INSERT INTO `pcd` VALUES (112, '桥西区', 'd', 110, NULL);
INSERT INTO `pcd` VALUES (113, '邢台县', 'd', 110, 'A4');
INSERT INTO `pcd` VALUES (114, '临城县', 'd', 110, NULL);
INSERT INTO `pcd` VALUES (115, '内丘县', 'd', 110, NULL);
INSERT INTO `pcd` VALUES (116, '柏乡县', 'd', 110, NULL);
INSERT INTO `pcd` VALUES (117, '隆尧县', 'd', 110, NULL);
INSERT INTO `pcd` VALUES (118, '任  县', 'd', 110, NULL);
INSERT INTO `pcd` VALUES (119, '南和县', 'd', 110, NULL);
INSERT INTO `pcd` VALUES (120, '宁晋县', 'd', 110, NULL);
INSERT INTO `pcd` VALUES (121, '巨鹿县', 'd', 110, NULL);
INSERT INTO `pcd` VALUES (122, '新河县', 'd', 110, NULL);
INSERT INTO `pcd` VALUES (123, '广宗县', 'd', 110, NULL);
INSERT INTO `pcd` VALUES (124, '平乡县', 'd', 110, NULL);
INSERT INTO `pcd` VALUES (125, '威  县', 'd', 110, NULL);
INSERT INTO `pcd` VALUES (126, '清河县', 'd', 110, NULL);
INSERT INTO `pcd` VALUES (127, '临西县', 'd', 110, NULL);
INSERT INTO `pcd` VALUES (128, '南宫市', 'd', 110, NULL);
INSERT INTO `pcd` VALUES (129, '沙河市', 'd', 110, NULL);
INSERT INTO `pcd` VALUES (130, '保定', 'c', 41, 'A4');
INSERT INTO `pcd` VALUES (131, '新市区', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (132, '北市区', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (133, '南市区', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (134, '满城县', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (135, '清苑县', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (136, '涞水县', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (137, '阜平县', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (138, '徐水县', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (139, '定兴县', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (140, '唐  县', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (141, '高阳县', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (142, '容城县', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (143, '涞源县', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (144, '望都县', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (145, '安新县', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (146, '易  县', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (147, '曲阳县', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (148, '蠡  县', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (149, '顺平县', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (150, '博野', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (151, '雄县', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (152, '涿州市', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (153, '定州市', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (154, '安国市', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (155, '高碑店市', 'd', 130, NULL);
INSERT INTO `pcd` VALUES (156, '张家口', 'c', 41, 'A4');
INSERT INTO `pcd` VALUES (157, '桥东区', 'd', 156, NULL);
INSERT INTO `pcd` VALUES (158, '桥西区', 'd', 156, NULL);
INSERT INTO `pcd` VALUES (159, '宣化区', 'd', 156, NULL);
INSERT INTO `pcd` VALUES (160, '下花园区', 'd', 156, NULL);
INSERT INTO `pcd` VALUES (161, '宣化县', 'd', 156, NULL);
INSERT INTO `pcd` VALUES (162, '张北县', 'd', 156, NULL);
INSERT INTO `pcd` VALUES (163, '康保县', 'd', 156, NULL);
INSERT INTO `pcd` VALUES (164, '沽源县', 'd', 156, NULL);
INSERT INTO `pcd` VALUES (165, '尚义县', 'd', 156, NULL);
INSERT INTO `pcd` VALUES (166, '蔚  县', 'd', 156, NULL);
INSERT INTO `pcd` VALUES (167, '阳原县', 'd', 156, NULL);
INSERT INTO `pcd` VALUES (168, '怀安县', 'd', 156, NULL);
INSERT INTO `pcd` VALUES (169, '万全县', 'd', 156, NULL);
INSERT INTO `pcd` VALUES (170, '怀来县', 'd', 156, NULL);
INSERT INTO `pcd` VALUES (171, '涿鹿县', 'd', 156, NULL);
INSERT INTO `pcd` VALUES (172, '赤城县', 'd', 156, NULL);
INSERT INTO `pcd` VALUES (173, '崇礼县', 'd', 156, NULL);
INSERT INTO `pcd` VALUES (174, '承德', 'c', 41, 'A4');
INSERT INTO `pcd` VALUES (175, '双桥区', 'd', 174, NULL);
INSERT INTO `pcd` VALUES (176, '双滦区', 'd', 174, NULL);
INSERT INTO `pcd` VALUES (177, '鹰手营子矿区', 'd', 174, NULL);
INSERT INTO `pcd` VALUES (178, '承德县', 'd', 174, 'A4');
INSERT INTO `pcd` VALUES (179, '兴隆县', 'd', 174, NULL);
INSERT INTO `pcd` VALUES (180, '平泉县', 'd', 174, NULL);
INSERT INTO `pcd` VALUES (181, '滦平县', 'd', 174, NULL);
INSERT INTO `pcd` VALUES (182, '隆化县', 'd', 174, NULL);
INSERT INTO `pcd` VALUES (183, '丰宁满族自治县', 'd', 174, NULL);
INSERT INTO `pcd` VALUES (184, '宽城满族自治县', 'd', 174, NULL);
INSERT INTO `pcd` VALUES (185, '围场满族蒙古族自治县', 'd', 174, NULL);
INSERT INTO `pcd` VALUES (186, '沧州', 'c', 41, 'A4');
INSERT INTO `pcd` VALUES (187, '新华区', 'd', 186, NULL);
INSERT INTO `pcd` VALUES (188, '运河区', 'd', 186, NULL);
INSERT INTO `pcd` VALUES (189, '沧  县', 'd', 186, NULL);
INSERT INTO `pcd` VALUES (190, '青  县', 'd', 186, NULL);
INSERT INTO `pcd` VALUES (191, '东光县', 'd', 186, NULL);
INSERT INTO `pcd` VALUES (192, '海兴县', 'd', 186, NULL);
INSERT INTO `pcd` VALUES (193, '盐山县', 'd', 186, NULL);
INSERT INTO `pcd` VALUES (194, '肃宁县', 'd', 186, NULL);
INSERT INTO `pcd` VALUES (195, '南皮县', 'd', 186, NULL);
INSERT INTO `pcd` VALUES (196, '吴桥县', 'd', 186, NULL);
INSERT INTO `pcd` VALUES (197, '献  县', 'd', 186, NULL);
INSERT INTO `pcd` VALUES (198, '孟村回族自治县', 'd', 186, NULL);
INSERT INTO `pcd` VALUES (199, '泊头市', 'd', 186, NULL);
INSERT INTO `pcd` VALUES (200, '任丘市', 'd', 186, NULL);
INSERT INTO `pcd` VALUES (201, '黄骅市', 'd', 186, NULL);
INSERT INTO `pcd` VALUES (202, '河间市', 'd', 186, NULL);
INSERT INTO `pcd` VALUES (203, '廊坊', 'c', 41, 'A4');
INSERT INTO `pcd` VALUES (204, '安次区', 'd', 203, NULL);
INSERT INTO `pcd` VALUES (205, '固安县', 'd', 203, NULL);
INSERT INTO `pcd` VALUES (206, '永清县', 'd', 203, NULL);
INSERT INTO `pcd` VALUES (207, '香河县', 'd', 203, NULL);
INSERT INTO `pcd` VALUES (208, '大城县', 'd', 203, NULL);
INSERT INTO `pcd` VALUES (209, '文安县', 'd', 203, NULL);
INSERT INTO `pcd` VALUES (210, '大厂回族自治县', 'd', 203, NULL);
INSERT INTO `pcd` VALUES (211, '霸州市', 'd', 203, NULL);
INSERT INTO `pcd` VALUES (212, '三河市', 'd', 203, NULL);
INSERT INTO `pcd` VALUES (213, '衡水', 'c', 41, 'A4');
INSERT INTO `pcd` VALUES (214, '桃城区', 'd', 213, NULL);
INSERT INTO `pcd` VALUES (215, '枣强县', 'd', 213, NULL);
INSERT INTO `pcd` VALUES (216, '武邑县', 'd', 213, NULL);
INSERT INTO `pcd` VALUES (217, '武强县', 'd', 213, NULL);
INSERT INTO `pcd` VALUES (218, '饶阳县', 'd', 213, NULL);
INSERT INTO `pcd` VALUES (219, '安平县', 'd', 213, NULL);
INSERT INTO `pcd` VALUES (220, '故城县', 'd', 213, NULL);
INSERT INTO `pcd` VALUES (221, '景  县', 'd', 213, NULL);
INSERT INTO `pcd` VALUES (222, '阜城县', 'd', 213, NULL);
INSERT INTO `pcd` VALUES (223, '冀州市', 'd', 213, NULL);
INSERT INTO `pcd` VALUES (224, '深州市', 'd', 213, NULL);
INSERT INTO `pcd` VALUES (225, '山西', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (226, '太原', 'c', 225, 'A3');
INSERT INTO `pcd` VALUES (227, '小店区', 'd', 226, NULL);
INSERT INTO `pcd` VALUES (228, '迎泽区', 'd', 226, NULL);
INSERT INTO `pcd` VALUES (229, '杏花岭区', 'd', 226, NULL);
INSERT INTO `pcd` VALUES (230, '尖草坪区', 'd', 226, NULL);
INSERT INTO `pcd` VALUES (231, '万柏林区', 'd', 226, NULL);
INSERT INTO `pcd` VALUES (232, '晋源区', 'd', 226, NULL);
INSERT INTO `pcd` VALUES (233, '清徐县', 'd', 226, NULL);
INSERT INTO `pcd` VALUES (234, '阳曲县', 'd', 226, NULL);
INSERT INTO `pcd` VALUES (235, '娄烦县', 'd', 226, NULL);
INSERT INTO `pcd` VALUES (236, '古交市', 'd', 226, NULL);
INSERT INTO `pcd` VALUES (237, '大同', 'c', 225, 'A5');
INSERT INTO `pcd` VALUES (238, '城  区', 'd', 237, NULL);
INSERT INTO `pcd` VALUES (239, '矿  区', 'd', 237, NULL);
INSERT INTO `pcd` VALUES (240, '南郊区', 'd', 237, NULL);
INSERT INTO `pcd` VALUES (241, '新荣区', 'd', 237, NULL);
INSERT INTO `pcd` VALUES (242, '阳高县', 'd', 237, NULL);
INSERT INTO `pcd` VALUES (243, '天镇县', 'd', 237, NULL);
INSERT INTO `pcd` VALUES (244, '广灵县', 'd', 237, NULL);
INSERT INTO `pcd` VALUES (245, '灵丘县', 'd', 237, NULL);
INSERT INTO `pcd` VALUES (246, '浑源县', 'd', 237, NULL);
INSERT INTO `pcd` VALUES (247, '左云县', 'd', 237, NULL);
INSERT INTO `pcd` VALUES (248, '大同县', 'd', 237, 'A5');
INSERT INTO `pcd` VALUES (249, '阳泉', 'c', 225, 'A5');
INSERT INTO `pcd` VALUES (250, '城  区', 'd', 249, NULL);
INSERT INTO `pcd` VALUES (251, '矿  区', 'd', 249, NULL);
INSERT INTO `pcd` VALUES (252, '郊  区', 'd', 249, NULL);
INSERT INTO `pcd` VALUES (253, '平定县', 'd', 249, NULL);
INSERT INTO `pcd` VALUES (254, '盂  县', 'd', 249, NULL);
INSERT INTO `pcd` VALUES (255, '长治', 'c', 225, 'A4');
INSERT INTO `pcd` VALUES (256, '城  区', 'd', 255, NULL);
INSERT INTO `pcd` VALUES (257, '郊  区', 'd', 255, NULL);
INSERT INTO `pcd` VALUES (258, '长治县', 'd', 255, 'A4');
INSERT INTO `pcd` VALUES (259, '襄垣县', 'd', 255, NULL);
INSERT INTO `pcd` VALUES (260, '屯留县', 'd', 255, NULL);
INSERT INTO `pcd` VALUES (261, '平顺县', 'd', 255, NULL);
INSERT INTO `pcd` VALUES (262, '黎城县', 'd', 255, NULL);
INSERT INTO `pcd` VALUES (263, '壶关县', 'd', 255, NULL);
INSERT INTO `pcd` VALUES (264, '长子县', 'd', 255, NULL);
INSERT INTO `pcd` VALUES (265, '武乡县', 'd', 255, NULL);
INSERT INTO `pcd` VALUES (266, '沁  县', 'd', 255, NULL);
INSERT INTO `pcd` VALUES (267, '沁源县', 'd', 255, NULL);
INSERT INTO `pcd` VALUES (268, '潞城市', 'd', 255, NULL);
INSERT INTO `pcd` VALUES (269, '晋城', 'c', 225, 'A5');
INSERT INTO `pcd` VALUES (270, '城  区', 'd', 269, NULL);
INSERT INTO `pcd` VALUES (271, '沁水县', 'd', 269, NULL);
INSERT INTO `pcd` VALUES (272, '阳城县', 'd', 269, NULL);
INSERT INTO `pcd` VALUES (273, '陵川县', 'd', 269, NULL);
INSERT INTO `pcd` VALUES (274, '泽州县', 'd', 269, NULL);
INSERT INTO `pcd` VALUES (275, '高平市', 'd', 269, 'A5');
INSERT INTO `pcd` VALUES (276, '朔州', 'c', 225, 'A5');
INSERT INTO `pcd` VALUES (277, '朔城区', 'd', 276, NULL);
INSERT INTO `pcd` VALUES (278, '平鲁区', 'd', 276, NULL);
INSERT INTO `pcd` VALUES (279, '山阴县', 'd', 276, NULL);
INSERT INTO `pcd` VALUES (280, '应  县', 'd', 276, NULL);
INSERT INTO `pcd` VALUES (281, '右玉县', 'd', 276, NULL);
INSERT INTO `pcd` VALUES (282, '怀仁县', 'd', 276, NULL);
INSERT INTO `pcd` VALUES (283, '忻州', 'c', 225, 'A5');
INSERT INTO `pcd` VALUES (284, '忻府区', 'd', 283, NULL);
INSERT INTO `pcd` VALUES (285, '原平市', 'd', 283, NULL);
INSERT INTO `pcd` VALUES (286, '定襄县', 'd', 283, NULL);
INSERT INTO `pcd` VALUES (287, '五台县', 'd', 283, NULL);
INSERT INTO `pcd` VALUES (288, '代  县', 'd', 283, NULL);
INSERT INTO `pcd` VALUES (289, '繁峙县', 'd', 283, NULL);
INSERT INTO `pcd` VALUES (290, '宁武县', 'd', 283, NULL);
INSERT INTO `pcd` VALUES (291, '静乐县', 'd', 283, NULL);
INSERT INTO `pcd` VALUES (292, '神池县', 'd', 283, NULL);
INSERT INTO `pcd` VALUES (293, '五寨县', 'd', 283, NULL);
INSERT INTO `pcd` VALUES (294, '岢岚县', 'd', 283, NULL);
INSERT INTO `pcd` VALUES (295, '河曲县', 'd', 283, NULL);
INSERT INTO `pcd` VALUES (296, '保德县', 'd', 283, NULL);
INSERT INTO `pcd` VALUES (297, '偏关县', 'd', 283, NULL);
INSERT INTO `pcd` VALUES (298, '吕梁', 'c', 225, 'A5');
INSERT INTO `pcd` VALUES (299, '离石区', 'd', 298, NULL);
INSERT INTO `pcd` VALUES (300, '孝义市', 'd', 298, NULL);
INSERT INTO `pcd` VALUES (301, '汾阳市', 'd', 298, NULL);
INSERT INTO `pcd` VALUES (302, '文水县', 'd', 298, NULL);
INSERT INTO `pcd` VALUES (303, '交城县', 'd', 298, NULL);
INSERT INTO `pcd` VALUES (304, '兴  县', 'd', 298, NULL);
INSERT INTO `pcd` VALUES (305, '临  县', 'd', 298, NULL);
INSERT INTO `pcd` VALUES (306, '柳林县', 'd', 298, NULL);
INSERT INTO `pcd` VALUES (307, '石楼县', 'd', 298, NULL);
INSERT INTO `pcd` VALUES (308, '岚  县', 'd', 298, NULL);
INSERT INTO `pcd` VALUES (309, '方山县', 'd', 298, NULL);
INSERT INTO `pcd` VALUES (310, '中阳县', 'd', 298, NULL);
INSERT INTO `pcd` VALUES (311, '交口县', 'd', 298, NULL);
INSERT INTO `pcd` VALUES (312, '晋中', 'c', 225, 'A5');
INSERT INTO `pcd` VALUES (313, '榆次市', 'd', 312, NULL);
INSERT INTO `pcd` VALUES (314, '介休市', 'd', 312, NULL);
INSERT INTO `pcd` VALUES (315, '榆社县', 'd', 312, NULL);
INSERT INTO `pcd` VALUES (316, '左权县', 'd', 312, NULL);
INSERT INTO `pcd` VALUES (317, '和顺县', 'd', 312, NULL);
INSERT INTO `pcd` VALUES (318, '昔阳县', 'd', 312, NULL);
INSERT INTO `pcd` VALUES (319, '寿阳县', 'd', 312, NULL);
INSERT INTO `pcd` VALUES (320, '太谷县', 'd', 312, NULL);
INSERT INTO `pcd` VALUES (321, '祁  县', 'd', 312, NULL);
INSERT INTO `pcd` VALUES (322, '平遥县', 'd', 312, NULL);
INSERT INTO `pcd` VALUES (323, '灵石县', 'd', 312, NULL);
INSERT INTO `pcd` VALUES (324, '临汾', 'c', 225, 'A5');
INSERT INTO `pcd` VALUES (325, '临汾市', 'd', 324, 'A5');
INSERT INTO `pcd` VALUES (326, '侯马市', 'd', 324, NULL);
INSERT INTO `pcd` VALUES (327, '霍州市', 'd', 324, NULL);
INSERT INTO `pcd` VALUES (328, '曲沃县', 'd', 324, NULL);
INSERT INTO `pcd` VALUES (329, '翼城县', 'd', 324, NULL);
INSERT INTO `pcd` VALUES (330, '襄汾县', 'd', 324, NULL);
INSERT INTO `pcd` VALUES (331, '洪洞县', 'd', 324, NULL);
INSERT INTO `pcd` VALUES (332, '古  县', 'd', 324, NULL);
INSERT INTO `pcd` VALUES (333, '安泽县', 'd', 324, NULL);
INSERT INTO `pcd` VALUES (334, '浮山县', 'd', 324, NULL);
INSERT INTO `pcd` VALUES (335, '吉  县', 'd', 324, NULL);
INSERT INTO `pcd` VALUES (336, '乡宁县', 'd', 324, NULL);
INSERT INTO `pcd` VALUES (337, '蒲  县', 'd', 324, NULL);
INSERT INTO `pcd` VALUES (338, '大宁县', 'd', 324, NULL);
INSERT INTO `pcd` VALUES (339, '永和县', 'd', 324, NULL);
INSERT INTO `pcd` VALUES (340, '隰  县', 'd', 324, NULL);
INSERT INTO `pcd` VALUES (341, '汾西县', 'd', 324, NULL);
INSERT INTO `pcd` VALUES (342, '运城', 'c', 225, 'A4');
INSERT INTO `pcd` VALUES (343, '运城市', 'd', 342, 'A4');
INSERT INTO `pcd` VALUES (344, '永济市', 'd', 342, NULL);
INSERT INTO `pcd` VALUES (345, '河津市', 'd', 342, NULL);
INSERT INTO `pcd` VALUES (346, '芮城县', 'd', 342, NULL);
INSERT INTO `pcd` VALUES (347, '临猗县', 'd', 342, NULL);
INSERT INTO `pcd` VALUES (348, '万荣县', 'd', 342, NULL);
INSERT INTO `pcd` VALUES (349, '新绛县', 'd', 342, NULL);
INSERT INTO `pcd` VALUES (350, '稷山县', 'd', 342, NULL);
INSERT INTO `pcd` VALUES (351, '闻喜县', 'd', 342, NULL);
INSERT INTO `pcd` VALUES (352, '夏  县', 'd', 342, NULL);
INSERT INTO `pcd` VALUES (353, '绛  县', 'd', 342, NULL);
INSERT INTO `pcd` VALUES (354, '平陆县', 'd', 342, NULL);
INSERT INTO `pcd` VALUES (355, '垣曲县', 'd', 342, NULL);
INSERT INTO `pcd` VALUES (356, '内蒙古', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (357, '呼和浩特', 'c', 356, 'A3');
INSERT INTO `pcd` VALUES (358, '新城区', 'd', 357, NULL);
INSERT INTO `pcd` VALUES (359, '回民区', 'd', 357, NULL);
INSERT INTO `pcd` VALUES (360, '玉泉区', 'd', 357, NULL);
INSERT INTO `pcd` VALUES (361, '郊  区', 'd', 357, NULL);
INSERT INTO `pcd` VALUES (362, '土默特左旗', 'd', 357, NULL);
INSERT INTO `pcd` VALUES (363, '托克托县', 'd', 357, NULL);
INSERT INTO `pcd` VALUES (364, '和林格尔县', 'd', 357, NULL);
INSERT INTO `pcd` VALUES (365, '清水河县', 'd', 357, NULL);
INSERT INTO `pcd` VALUES (366, '武川县', 'd', 357, NULL);
INSERT INTO `pcd` VALUES (367, '包头', 'c', 356, 'A4');
INSERT INTO `pcd` VALUES (368, '东河区', 'd', 367, NULL);
INSERT INTO `pcd` VALUES (369, '昆都伦区', 'd', 367, NULL);
INSERT INTO `pcd` VALUES (370, '青山区', 'd', 367, NULL);
INSERT INTO `pcd` VALUES (371, '石拐矿区', 'd', 367, NULL);
INSERT INTO `pcd` VALUES (372, '白云矿区', 'd', 367, NULL);
INSERT INTO `pcd` VALUES (373, '郊  区', 'd', 367, NULL);
INSERT INTO `pcd` VALUES (374, '土默特右旗', 'd', 367, NULL);
INSERT INTO `pcd` VALUES (375, '固阳县', 'd', 367, NULL);
INSERT INTO `pcd` VALUES (376, '达尔罕茂明安联合旗', 'd', 367, NULL);
INSERT INTO `pcd` VALUES (377, '乌海', 'c', 356, 'A5');
INSERT INTO `pcd` VALUES (378, '海勃湾区', 'd', 377, NULL);
INSERT INTO `pcd` VALUES (379, '海南区', 'd', 377, NULL);
INSERT INTO `pcd` VALUES (380, '乌达区', 'd', 377, NULL);
INSERT INTO `pcd` VALUES (381, '赤峰', 'c', 356, 'A4');
INSERT INTO `pcd` VALUES (382, '红山区', 'd', 381, NULL);
INSERT INTO `pcd` VALUES (383, '元宝山区', 'd', 381, NULL);
INSERT INTO `pcd` VALUES (384, '松山区', 'd', 381, NULL);
INSERT INTO `pcd` VALUES (385, '阿鲁科尔沁旗', 'd', 381, NULL);
INSERT INTO `pcd` VALUES (386, '巴林左旗', 'd', 381, NULL);
INSERT INTO `pcd` VALUES (387, '巴林右旗', 'd', 381, NULL);
INSERT INTO `pcd` VALUES (388, '林西县', 'd', 381, NULL);
INSERT INTO `pcd` VALUES (389, '克什克腾旗', 'd', 381, NULL);
INSERT INTO `pcd` VALUES (390, '翁牛特旗', 'd', 381, NULL);
INSERT INTO `pcd` VALUES (391, '喀喇沁旗', 'd', 381, NULL);
INSERT INTO `pcd` VALUES (392, '宁城县', 'd', 381, NULL);
INSERT INTO `pcd` VALUES (393, '敖汉旗', 'd', 381, NULL);
INSERT INTO `pcd` VALUES (394, '呼伦贝尔', 'c', 356, 'A5');
INSERT INTO `pcd` VALUES (395, '海拉尔市', 'd', 394, NULL);
INSERT INTO `pcd` VALUES (396, '满洲里市', 'd', 394, 'A5');
INSERT INTO `pcd` VALUES (397, '扎兰屯市', 'd', 394, NULL);
INSERT INTO `pcd` VALUES (398, '牙克石市', 'd', 394, NULL);
INSERT INTO `pcd` VALUES (399, '根河市', 'd', 394, NULL);
INSERT INTO `pcd` VALUES (400, '额尔古纳市', 'd', 394, NULL);
INSERT INTO `pcd` VALUES (401, '阿荣旗', 'd', 394, NULL);
INSERT INTO `pcd` VALUES (402, '莫力达瓦达斡尔族自治旗', 'd', 394, NULL);
INSERT INTO `pcd` VALUES (403, '鄂伦春自治旗', 'd', 394, NULL);
INSERT INTO `pcd` VALUES (404, '鄂温克族自治旗', 'd', 394, NULL);
INSERT INTO `pcd` VALUES (405, '新巴尔虎右旗', 'd', 394, NULL);
INSERT INTO `pcd` VALUES (406, '新巴尔虎左旗', 'd', 394, NULL);
INSERT INTO `pcd` VALUES (407, '陈巴尔虎旗', 'd', 394, NULL);
INSERT INTO `pcd` VALUES (408, '兴安盟', 'c', 356, 'A5');
INSERT INTO `pcd` VALUES (409, '乌兰浩特市', 'd', 408, NULL);
INSERT INTO `pcd` VALUES (410, '阿尔山市', 'd', 408, NULL);
INSERT INTO `pcd` VALUES (411, '科尔沁右翼前旗', 'd', 408, NULL);
INSERT INTO `pcd` VALUES (412, '科尔沁右翼中旗', 'd', 408, NULL);
INSERT INTO `pcd` VALUES (413, '扎赉特旗', 'd', 408, NULL);
INSERT INTO `pcd` VALUES (414, '突泉县', 'd', 408, NULL);
INSERT INTO `pcd` VALUES (415, '通辽', 'c', 356, 'A5');
INSERT INTO `pcd` VALUES (416, '科尔沁区', 'd', 415, NULL);
INSERT INTO `pcd` VALUES (417, '霍林郭勒市', 'd', 415, NULL);
INSERT INTO `pcd` VALUES (418, '科尔沁左翼中旗', 'd', 415, NULL);
INSERT INTO `pcd` VALUES (419, '科尔沁左翼后旗', 'd', 415, NULL);
INSERT INTO `pcd` VALUES (420, '开鲁县', 'd', 415, NULL);
INSERT INTO `pcd` VALUES (421, '库伦旗', 'd', 415, NULL);
INSERT INTO `pcd` VALUES (422, '奈曼旗', 'd', 415, NULL);
INSERT INTO `pcd` VALUES (423, '扎鲁特旗', 'd', 415, NULL);
INSERT INTO `pcd` VALUES (424, '锡林郭勒盟', 'c', 356, 'A5');
INSERT INTO `pcd` VALUES (425, '二连浩特市', 'd', 424, NULL);
INSERT INTO `pcd` VALUES (426, '锡林浩特市', 'd', 424, NULL);
INSERT INTO `pcd` VALUES (427, '阿巴嘎旗', 'd', 424, NULL);
INSERT INTO `pcd` VALUES (428, '苏尼特左旗', 'd', 424, NULL);
INSERT INTO `pcd` VALUES (429, '苏尼特右旗', 'd', 424, NULL);
INSERT INTO `pcd` VALUES (430, '东乌珠穆沁旗', 'd', 424, NULL);
INSERT INTO `pcd` VALUES (431, '西乌珠穆沁旗', 'd', 424, NULL);
INSERT INTO `pcd` VALUES (432, '太仆寺旗', 'd', 424, NULL);
INSERT INTO `pcd` VALUES (433, '镶黄旗', 'd', 424, NULL);
INSERT INTO `pcd` VALUES (434, '正镶白旗', 'd', 424, NULL);
INSERT INTO `pcd` VALUES (435, '正蓝旗', 'd', 424, NULL);
INSERT INTO `pcd` VALUES (436, '多伦县', 'd', 424, NULL);
INSERT INTO `pcd` VALUES (437, '乌兰察布盟', 'c', 356, 'A5');
INSERT INTO `pcd` VALUES (438, '集宁市', 'd', 437, NULL);
INSERT INTO `pcd` VALUES (439, '丰镇市', 'd', 437, NULL);
INSERT INTO `pcd` VALUES (440, '卓资县', 'd', 437, NULL);
INSERT INTO `pcd` VALUES (441, '化德县', 'd', 437, NULL);
INSERT INTO `pcd` VALUES (442, '商都县', 'd', 437, NULL);
INSERT INTO `pcd` VALUES (443, '兴和县', 'd', 437, NULL);
INSERT INTO `pcd` VALUES (444, '凉城县', 'd', 437, NULL);
INSERT INTO `pcd` VALUES (445, '察哈尔右翼前旗', 'd', 437, NULL);
INSERT INTO `pcd` VALUES (446, '察哈尔右翼中旗', 'd', 437, NULL);
INSERT INTO `pcd` VALUES (447, '察哈尔右翼后旗', 'd', 437, NULL);
INSERT INTO `pcd` VALUES (448, '四子王旗', 'd', 437, NULL);
INSERT INTO `pcd` VALUES (449, '伊克昭盟', 'c', 356, NULL);
INSERT INTO `pcd` VALUES (450, '东胜市', 'd', 449, NULL);
INSERT INTO `pcd` VALUES (451, '达拉特旗', 'd', 449, NULL);
INSERT INTO `pcd` VALUES (452, '准格尔旗', 'd', 449, NULL);
INSERT INTO `pcd` VALUES (453, '鄂托克前旗', 'd', 449, NULL);
INSERT INTO `pcd` VALUES (454, '鄂托克旗', 'd', 449, NULL);
INSERT INTO `pcd` VALUES (455, '杭锦旗', 'd', 449, NULL);
INSERT INTO `pcd` VALUES (456, '乌审旗', 'd', 449, NULL);
INSERT INTO `pcd` VALUES (457, '伊金霍洛旗', 'd', 449, NULL);
INSERT INTO `pcd` VALUES (458, '巴彦淖尔盟', 'c', 356, 'A5');
INSERT INTO `pcd` VALUES (459, '临河市', 'd', 458, NULL);
INSERT INTO `pcd` VALUES (460, '五原县', 'd', 458, NULL);
INSERT INTO `pcd` VALUES (461, '磴口县', 'd', 458, NULL);
INSERT INTO `pcd` VALUES (462, '乌拉特前旗', 'd', 458, NULL);
INSERT INTO `pcd` VALUES (463, '乌拉特中旗', 'd', 458, NULL);
INSERT INTO `pcd` VALUES (464, '乌拉特后旗', 'd', 458, NULL);
INSERT INTO `pcd` VALUES (465, '杭锦后旗', 'd', 458, NULL);
INSERT INTO `pcd` VALUES (466, '阿拉善盟', 'c', 356, 'A5');
INSERT INTO `pcd` VALUES (467, '阿拉善左旗', 'd', 466, NULL);
INSERT INTO `pcd` VALUES (468, '阿拉善右旗', 'd', 466, NULL);
INSERT INTO `pcd` VALUES (469, '额济纳旗', 'd', 466, NULL);
INSERT INTO `pcd` VALUES (470, '辽宁', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (471, '沈阳', 'c', 470, 'A3');
INSERT INTO `pcd` VALUES (472, '沈河区', 'd', 471, NULL);
INSERT INTO `pcd` VALUES (473, '皇姑区', 'd', 471, NULL);
INSERT INTO `pcd` VALUES (474, '和平区', 'd', 471, NULL);
INSERT INTO `pcd` VALUES (475, '大东区', 'd', 471, NULL);
INSERT INTO `pcd` VALUES (476, '铁西区', 'd', 471, NULL);
INSERT INTO `pcd` VALUES (477, '苏家屯区', 'd', 471, NULL);
INSERT INTO `pcd` VALUES (478, '东陵区', 'd', 471, NULL);
INSERT INTO `pcd` VALUES (479, '于洪区', 'd', 471, NULL);
INSERT INTO `pcd` VALUES (480, '新民市', 'd', 471, NULL);
INSERT INTO `pcd` VALUES (481, '法库县', 'd', 471, NULL);
INSERT INTO `pcd` VALUES (482, '辽中县', 'd', 471, NULL);
INSERT INTO `pcd` VALUES (483, '康平县', 'd', 471, NULL);
INSERT INTO `pcd` VALUES (484, '新城子区', 'd', 471, NULL);
INSERT INTO `pcd` VALUES (485, '其他', 'd', 471, NULL);
INSERT INTO `pcd` VALUES (486, '大连', 'c', 470, 'A3');
INSERT INTO `pcd` VALUES (487, '西岗区', 'd', 486, NULL);
INSERT INTO `pcd` VALUES (488, '中山区', 'd', 486, 'A4');
INSERT INTO `pcd` VALUES (489, '沙河口区', 'd', 486, NULL);
INSERT INTO `pcd` VALUES (490, '甘井子区', 'd', 486, NULL);
INSERT INTO `pcd` VALUES (491, '旅顺口区', 'd', 486, NULL);
INSERT INTO `pcd` VALUES (492, '金州区', 'd', 486, NULL);
INSERT INTO `pcd` VALUES (493, '瓦房店市', 'd', 486, NULL);
INSERT INTO `pcd` VALUES (494, '普兰店市', 'd', 486, NULL);
INSERT INTO `pcd` VALUES (495, '庄河市', 'd', 486, 'A4');
INSERT INTO `pcd` VALUES (496, '长海县', 'd', 486, NULL);
INSERT INTO `pcd` VALUES (497, '其他', 'd', 486, NULL);
INSERT INTO `pcd` VALUES (498, '鞍山', 'c', 470, 'A4');
INSERT INTO `pcd` VALUES (499, '铁东区', 'd', 498, NULL);
INSERT INTO `pcd` VALUES (500, '铁西区', 'd', 498, NULL);
INSERT INTO `pcd` VALUES (501, '立山区', 'd', 498, NULL);
INSERT INTO `pcd` VALUES (502, '千山区', 'd', 498, NULL);
INSERT INTO `pcd` VALUES (503, '海城市', 'd', 498, NULL);
INSERT INTO `pcd` VALUES (504, '台安县', 'd', 498, NULL);
INSERT INTO `pcd` VALUES (505, '岫岩满族自治县', 'd', 498, NULL);
INSERT INTO `pcd` VALUES (506, '其他', 'd', 498, NULL);
INSERT INTO `pcd` VALUES (507, '抚顺', 'c', 470, 'A5');
INSERT INTO `pcd` VALUES (508, '顺城区', 'd', 507, NULL);
INSERT INTO `pcd` VALUES (509, '新抚区', 'd', 507, NULL);
INSERT INTO `pcd` VALUES (510, '东洲区', 'd', 507, NULL);
INSERT INTO `pcd` VALUES (511, '望花区', 'd', 507, NULL);
INSERT INTO `pcd` VALUES (512, '抚顺县', 'd', 507, 'A5');
INSERT INTO `pcd` VALUES (513, '清原满族自治县', 'd', 507, NULL);
INSERT INTO `pcd` VALUES (514, '新宾满族自治县', 'd', 507, NULL);
INSERT INTO `pcd` VALUES (515, '其他', 'd', 507, NULL);
INSERT INTO `pcd` VALUES (516, '本溪', 'c', 470, 'A5');
INSERT INTO `pcd` VALUES (517, '平山区', 'd', 516, NULL);
INSERT INTO `pcd` VALUES (518, '明山区', 'd', 516, NULL);
INSERT INTO `pcd` VALUES (519, '溪湖区', 'd', 516, NULL);
INSERT INTO `pcd` VALUES (520, '南芬区', 'd', 516, NULL);
INSERT INTO `pcd` VALUES (521, '本溪满族自治县', 'd', 516, 'A5');
INSERT INTO `pcd` VALUES (522, '桓仁满族自治县', 'd', 516, NULL);
INSERT INTO `pcd` VALUES (523, '其他', 'd', 516, NULL);
INSERT INTO `pcd` VALUES (524, '丹东', 'c', 470, 'A5');
INSERT INTO `pcd` VALUES (525, '振兴区', 'd', 524, NULL);
INSERT INTO `pcd` VALUES (526, '元宝区', 'd', 524, NULL);
INSERT INTO `pcd` VALUES (527, '振安区', 'd', 524, NULL);
INSERT INTO `pcd` VALUES (528, '东港市', 'd', 524, NULL);
INSERT INTO `pcd` VALUES (529, '凤城市', 'd', 524, NULL);
INSERT INTO `pcd` VALUES (530, '宽甸满族自治县', 'd', 524, NULL);
INSERT INTO `pcd` VALUES (531, '其他', 'd', 524, NULL);
INSERT INTO `pcd` VALUES (532, '锦州', 'c', 470, 'A5');
INSERT INTO `pcd` VALUES (533, '太和区', 'd', 532, NULL);
INSERT INTO `pcd` VALUES (534, '古塔区', 'd', 532, NULL);
INSERT INTO `pcd` VALUES (535, '凌河区', 'd', 532, NULL);
INSERT INTO `pcd` VALUES (536, '凌海市', 'd', 532, NULL);
INSERT INTO `pcd` VALUES (537, '黑山县', 'd', 532, NULL);
INSERT INTO `pcd` VALUES (538, '义县', 'd', 532, NULL);
INSERT INTO `pcd` VALUES (539, '北宁市', 'd', 532, NULL);
INSERT INTO `pcd` VALUES (540, '其他', 'd', 532, NULL);
INSERT INTO `pcd` VALUES (541, '营口', 'c', 470, 'A5');
INSERT INTO `pcd` VALUES (542, '站前区', 'd', 541, NULL);
INSERT INTO `pcd` VALUES (543, '西市区', 'd', 541, NULL);
INSERT INTO `pcd` VALUES (544, '鲅鱼圈区', 'd', 541, NULL);
INSERT INTO `pcd` VALUES (545, '老边区', 'd', 541, NULL);
INSERT INTO `pcd` VALUES (546, '大石桥市', 'd', 541, NULL);
INSERT INTO `pcd` VALUES (547, '盖州市', 'd', 541, NULL);
INSERT INTO `pcd` VALUES (548, '其他', 'd', 541, NULL);
INSERT INTO `pcd` VALUES (549, '阜新', 'c', 470, 'A5');
INSERT INTO `pcd` VALUES (550, '海州区', 'd', 549, NULL);
INSERT INTO `pcd` VALUES (551, '新邱区', 'd', 549, NULL);
INSERT INTO `pcd` VALUES (552, '太平区', 'd', 549, NULL);
INSERT INTO `pcd` VALUES (553, '清河门区', 'd', 549, NULL);
INSERT INTO `pcd` VALUES (554, '细河区', 'd', 549, NULL);
INSERT INTO `pcd` VALUES (555, '彰武县', 'd', 549, NULL);
INSERT INTO `pcd` VALUES (556, '阜新蒙古族自治县', 'd', 549, 'A5');
INSERT INTO `pcd` VALUES (557, '其他', 'd', 549, NULL);
INSERT INTO `pcd` VALUES (558, '辽阳', 'c', 470, 'A5');
INSERT INTO `pcd` VALUES (559, '白塔区', 'd', 558, NULL);
INSERT INTO `pcd` VALUES (560, '文圣区', 'd', 558, NULL);
INSERT INTO `pcd` VALUES (561, '宏伟区', 'd', 558, NULL);
INSERT INTO `pcd` VALUES (562, '太子河区', 'd', 558, NULL);
INSERT INTO `pcd` VALUES (563, '弓长岭区', 'd', 558, NULL);
INSERT INTO `pcd` VALUES (564, '灯塔市', 'd', 558, NULL);
INSERT INTO `pcd` VALUES (565, '辽阳县', 'd', 558, 'A5');
INSERT INTO `pcd` VALUES (566, '其他', 'd', 558, NULL);
INSERT INTO `pcd` VALUES (567, '盘锦', 'c', 470, 'A5');
INSERT INTO `pcd` VALUES (568, '双台子区', 'd', 567, NULL);
INSERT INTO `pcd` VALUES (569, '兴隆台区', 'd', 567, NULL);
INSERT INTO `pcd` VALUES (570, '盘山县', 'd', 567, NULL);
INSERT INTO `pcd` VALUES (571, '大洼县', 'd', 567, NULL);
INSERT INTO `pcd` VALUES (572, '其他', 'd', 567, NULL);
INSERT INTO `pcd` VALUES (573, '铁岭', 'c', 470, 'A5');
INSERT INTO `pcd` VALUES (574, '银州区', 'd', 573, NULL);
INSERT INTO `pcd` VALUES (575, '清河区', 'd', 573, NULL);
INSERT INTO `pcd` VALUES (576, '调兵山市', 'd', 573, NULL);
INSERT INTO `pcd` VALUES (577, '开原市', 'd', 573, NULL);
INSERT INTO `pcd` VALUES (578, '铁岭县', 'd', 573, 'A5');
INSERT INTO `pcd` VALUES (579, '昌图县', 'd', 573, NULL);
INSERT INTO `pcd` VALUES (580, '西丰县', 'd', 573, NULL);
INSERT INTO `pcd` VALUES (581, '其他', 'd', 573, NULL);
INSERT INTO `pcd` VALUES (582, '朝阳', 'c', 470, 'A5');
INSERT INTO `pcd` VALUES (583, '双塔区', 'd', 582, NULL);
INSERT INTO `pcd` VALUES (584, '龙城区', 'd', 582, NULL);
INSERT INTO `pcd` VALUES (585, '凌源市', 'd', 582, NULL);
INSERT INTO `pcd` VALUES (586, '北票市', 'd', 582, NULL);
INSERT INTO `pcd` VALUES (587, '朝阳县', 'd', 582, 'A5');
INSERT INTO `pcd` VALUES (588, '建平县', 'd', 582, NULL);
INSERT INTO `pcd` VALUES (589, '喀喇沁左翼蒙古族自治县', 'd', 582, NULL);
INSERT INTO `pcd` VALUES (590, '其他', 'd', 582, NULL);
INSERT INTO `pcd` VALUES (591, '葫芦岛', 'c', 470, 'A5');
INSERT INTO `pcd` VALUES (592, '龙港区', 'd', 591, NULL);
INSERT INTO `pcd` VALUES (593, '南票区', 'd', 591, NULL);
INSERT INTO `pcd` VALUES (594, '连山区', 'd', 591, NULL);
INSERT INTO `pcd` VALUES (595, '兴城市', 'd', 591, NULL);
INSERT INTO `pcd` VALUES (596, '绥中县', 'd', 591, NULL);
INSERT INTO `pcd` VALUES (597, '建昌县', 'd', 591, NULL);
INSERT INTO `pcd` VALUES (598, '其他', 'd', 591, NULL);
INSERT INTO `pcd` VALUES (599, '其他', 'c', 470, NULL);
INSERT INTO `pcd` VALUES (600, '其他', 'd', 599, NULL);
INSERT INTO `pcd` VALUES (601, '吉林', 'p', NULL, 'A4');
INSERT INTO `pcd` VALUES (602, '长春', 'c', 601, 'A3');
INSERT INTO `pcd` VALUES (603, '朝阳区', 'd', 602, 'A5');
INSERT INTO `pcd` VALUES (604, '宽城区', 'd', 602, NULL);
INSERT INTO `pcd` VALUES (605, '二道区', 'd', 602, NULL);
INSERT INTO `pcd` VALUES (606, '南关区', 'd', 602, NULL);
INSERT INTO `pcd` VALUES (607, '绿园区', 'd', 602, NULL);
INSERT INTO `pcd` VALUES (608, '双阳区', 'd', 602, NULL);
INSERT INTO `pcd` VALUES (609, '九台市', 'd', 602, NULL);
INSERT INTO `pcd` VALUES (610, '榆树市', 'd', 602, NULL);
INSERT INTO `pcd` VALUES (611, '德惠市', 'd', 602, NULL);
INSERT INTO `pcd` VALUES (612, '农安县', 'd', 602, NULL);
INSERT INTO `pcd` VALUES (613, '其他', 'd', 602, NULL);
INSERT INTO `pcd` VALUES (614, '吉林', 'c', 601, 'A4');
INSERT INTO `pcd` VALUES (615, '船营区', 'd', 614, NULL);
INSERT INTO `pcd` VALUES (616, '昌邑区', 'd', 614, NULL);
INSERT INTO `pcd` VALUES (617, '龙潭区', 'd', 614, NULL);
INSERT INTO `pcd` VALUES (618, '丰满区', 'd', 614, NULL);
INSERT INTO `pcd` VALUES (619, '舒兰市', 'd', 614, NULL);
INSERT INTO `pcd` VALUES (620, '桦甸市', 'd', 614, 'A4');
INSERT INTO `pcd` VALUES (621, '蛟河市', 'd', 614, NULL);
INSERT INTO `pcd` VALUES (622, '磐石市', 'd', 614, NULL);
INSERT INTO `pcd` VALUES (623, '永吉县', 'd', 614, NULL);
INSERT INTO `pcd` VALUES (624, '其他', 'd', 614, NULL);
INSERT INTO `pcd` VALUES (625, '四平', 'c', 601, 'A5');
INSERT INTO `pcd` VALUES (626, '铁西区', 'd', 625, NULL);
INSERT INTO `pcd` VALUES (627, '铁东区', 'd', 625, NULL);
INSERT INTO `pcd` VALUES (628, '公主岭市', 'd', 625, NULL);
INSERT INTO `pcd` VALUES (629, '双辽市', 'd', 625, NULL);
INSERT INTO `pcd` VALUES (630, '梨树县', 'd', 625, NULL);
INSERT INTO `pcd` VALUES (631, '伊通满族自治县', 'd', 625, NULL);
INSERT INTO `pcd` VALUES (632, '其他', 'd', 625, NULL);
INSERT INTO `pcd` VALUES (633, '辽源', 'c', 601, 'A5');
INSERT INTO `pcd` VALUES (634, '龙山区', 'd', 633, NULL);
INSERT INTO `pcd` VALUES (635, '西安区', 'd', 633, 'A2');
INSERT INTO `pcd` VALUES (636, '东辽县', 'd', 633, NULL);
INSERT INTO `pcd` VALUES (637, '东丰县', 'd', 633, NULL);
INSERT INTO `pcd` VALUES (638, '其他', 'd', 633, NULL);
INSERT INTO `pcd` VALUES (639, '通化', 'c', 601, 'A5');
INSERT INTO `pcd` VALUES (640, '东昌区', 'd', 639, NULL);
INSERT INTO `pcd` VALUES (641, '二道江区', 'd', 639, NULL);
INSERT INTO `pcd` VALUES (642, '梅河口市', 'd', 639, 'A5');
INSERT INTO `pcd` VALUES (643, '集安市', 'd', 639, NULL);
INSERT INTO `pcd` VALUES (644, '通化县', 'd', 639, 'A5');
INSERT INTO `pcd` VALUES (645, '辉南县', 'd', 639, NULL);
INSERT INTO `pcd` VALUES (646, '柳河县', 'd', 639, NULL);
INSERT INTO `pcd` VALUES (647, '其他', 'd', 639, NULL);
INSERT INTO `pcd` VALUES (648, '白山', 'c', 601, NULL);
INSERT INTO `pcd` VALUES (649, '八道江区', 'd', 648, NULL);
INSERT INTO `pcd` VALUES (650, '江源区', 'd', 648, NULL);
INSERT INTO `pcd` VALUES (651, '临江市', 'd', 648, NULL);
INSERT INTO `pcd` VALUES (652, '靖宇县', 'd', 648, NULL);
INSERT INTO `pcd` VALUES (653, '抚松县', 'd', 648, NULL);
INSERT INTO `pcd` VALUES (654, '长白朝鲜族自治县', 'd', 648, NULL);
INSERT INTO `pcd` VALUES (655, '其他', 'd', 648, NULL);
INSERT INTO `pcd` VALUES (656, '松原', 'c', 601, 'A5');
INSERT INTO `pcd` VALUES (657, '宁江区', 'd', 656, NULL);
INSERT INTO `pcd` VALUES (658, '乾安县', 'd', 656, NULL);
INSERT INTO `pcd` VALUES (659, '长岭县', 'd', 656, NULL);
INSERT INTO `pcd` VALUES (660, '扶余县', 'd', 656, NULL);
INSERT INTO `pcd` VALUES (661, '前郭尔罗斯蒙古族自治县', 'd', 656, NULL);
INSERT INTO `pcd` VALUES (662, '其他', 'd', 656, NULL);
INSERT INTO `pcd` VALUES (663, '白城', 'c', 601, 'A5');
INSERT INTO `pcd` VALUES (664, '洮北区', 'd', 663, NULL);
INSERT INTO `pcd` VALUES (665, '大安市', 'd', 663, NULL);
INSERT INTO `pcd` VALUES (666, '洮南市', 'd', 663, NULL);
INSERT INTO `pcd` VALUES (667, '镇赉县', 'd', 663, NULL);
INSERT INTO `pcd` VALUES (668, '通榆县', 'd', 663, NULL);
INSERT INTO `pcd` VALUES (669, '其他', 'd', 663, NULL);
INSERT INTO `pcd` VALUES (670, '延边朝鲜族自治州', 'c', 601, 'A5');
INSERT INTO `pcd` VALUES (671, '延吉市', 'd', 670, 'A5');
INSERT INTO `pcd` VALUES (672, '图们市', 'd', 670, NULL);
INSERT INTO `pcd` VALUES (673, '敦化市', 'd', 670, 'A5');
INSERT INTO `pcd` VALUES (674, '龙井市', 'd', 670, NULL);
INSERT INTO `pcd` VALUES (675, '珲春市', 'd', 670, NULL);
INSERT INTO `pcd` VALUES (676, '和龙市', 'd', 670, NULL);
INSERT INTO `pcd` VALUES (677, '安图县', 'd', 670, NULL);
INSERT INTO `pcd` VALUES (678, '汪清县', 'd', 670, NULL);
INSERT INTO `pcd` VALUES (679, '其他', 'd', 670, NULL);
INSERT INTO `pcd` VALUES (680, '其他', 'c', 601, NULL);
INSERT INTO `pcd` VALUES (681, '其他', 'd', 680, NULL);
INSERT INTO `pcd` VALUES (682, '黑龙江', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (683, '哈尔滨', 'c', 682, 'A3');
INSERT INTO `pcd` VALUES (684, '松北区', 'd', 683, NULL);
INSERT INTO `pcd` VALUES (685, '道里区', 'd', 683, NULL);
INSERT INTO `pcd` VALUES (686, '南岗区', 'd', 683, NULL);
INSERT INTO `pcd` VALUES (687, '平房区', 'd', 683, NULL);
INSERT INTO `pcd` VALUES (688, '香坊区', 'd', 683, NULL);
INSERT INTO `pcd` VALUES (689, '道外区', 'd', 683, NULL);
INSERT INTO `pcd` VALUES (690, '呼兰区', 'd', 683, NULL);
INSERT INTO `pcd` VALUES (691, '阿城区', 'd', 683, NULL);
INSERT INTO `pcd` VALUES (692, '双城市', 'd', 683, NULL);
INSERT INTO `pcd` VALUES (693, '尚志市', 'd', 683, NULL);
INSERT INTO `pcd` VALUES (694, '五常市', 'd', 683, 'A4');
INSERT INTO `pcd` VALUES (695, '宾县', 'd', 683, NULL);
INSERT INTO `pcd` VALUES (696, '方正县', 'd', 683, NULL);
INSERT INTO `pcd` VALUES (697, '通河县', 'd', 683, NULL);
INSERT INTO `pcd` VALUES (698, '巴彦县', 'd', 683, NULL);
INSERT INTO `pcd` VALUES (699, '延寿县', 'd', 683, NULL);
INSERT INTO `pcd` VALUES (700, '木兰县', 'd', 683, NULL);
INSERT INTO `pcd` VALUES (701, '依兰县', 'd', 683, NULL);
INSERT INTO `pcd` VALUES (702, '其他', 'd', 683, NULL);
INSERT INTO `pcd` VALUES (703, '齐齐哈尔', 'c', 682, 'A5');
INSERT INTO `pcd` VALUES (704, '龙沙区', 'd', 703, NULL);
INSERT INTO `pcd` VALUES (705, '昂昂溪区', 'd', 703, NULL);
INSERT INTO `pcd` VALUES (706, '铁锋区', 'd', 703, NULL);
INSERT INTO `pcd` VALUES (707, '建华区', 'd', 703, NULL);
INSERT INTO `pcd` VALUES (708, '富拉尔基区', 'd', 703, NULL);
INSERT INTO `pcd` VALUES (709, '碾子山区', 'd', 703, NULL);
INSERT INTO `pcd` VALUES (710, '梅里斯达斡尔族区', 'd', 703, NULL);
INSERT INTO `pcd` VALUES (711, '讷河市', 'd', 703, NULL);
INSERT INTO `pcd` VALUES (712, '富裕县', 'd', 703, NULL);
INSERT INTO `pcd` VALUES (713, '拜泉县', 'd', 703, NULL);
INSERT INTO `pcd` VALUES (714, '甘南县', 'd', 703, NULL);
INSERT INTO `pcd` VALUES (715, '依安县', 'd', 703, NULL);
INSERT INTO `pcd` VALUES (716, '克山县', 'd', 703, NULL);
INSERT INTO `pcd` VALUES (717, '泰来县', 'd', 703, NULL);
INSERT INTO `pcd` VALUES (718, '克东县', 'd', 703, NULL);
INSERT INTO `pcd` VALUES (719, '龙江县', 'd', 703, NULL);
INSERT INTO `pcd` VALUES (720, '其他', 'd', 703, NULL);
INSERT INTO `pcd` VALUES (721, '鹤岗', 'c', 682, 'A5');
INSERT INTO `pcd` VALUES (722, '兴山区', 'd', 721, NULL);
INSERT INTO `pcd` VALUES (723, '工农区', 'd', 721, NULL);
INSERT INTO `pcd` VALUES (724, '南山区', 'd', 721, NULL);
INSERT INTO `pcd` VALUES (725, '兴安区', 'd', 721, NULL);
INSERT INTO `pcd` VALUES (726, '向阳区', 'd', 721, NULL);
INSERT INTO `pcd` VALUES (727, '东山区', 'd', 721, NULL);
INSERT INTO `pcd` VALUES (728, '萝北县', 'd', 721, NULL);
INSERT INTO `pcd` VALUES (729, '绥滨县', 'd', 721, NULL);
INSERT INTO `pcd` VALUES (730, '其他', 'd', 721, NULL);
INSERT INTO `pcd` VALUES (731, '双鸭山', 'c', 682, 'A5');
INSERT INTO `pcd` VALUES (732, '尖山区', 'd', 731, NULL);
INSERT INTO `pcd` VALUES (733, '岭东区', 'd', 731, NULL);
INSERT INTO `pcd` VALUES (734, '四方台区', 'd', 731, NULL);
INSERT INTO `pcd` VALUES (735, '宝山区', 'd', 731, NULL);
INSERT INTO `pcd` VALUES (736, '集贤县', 'd', 731, NULL);
INSERT INTO `pcd` VALUES (737, '宝清县', 'd', 731, NULL);
INSERT INTO `pcd` VALUES (738, '友谊县', 'd', 731, NULL);
INSERT INTO `pcd` VALUES (739, '饶河县', 'd', 731, NULL);
INSERT INTO `pcd` VALUES (740, '其他', 'd', 731, NULL);
INSERT INTO `pcd` VALUES (741, '鸡西', 'c', 682, 'A5');
INSERT INTO `pcd` VALUES (742, '鸡冠区', 'd', 741, NULL);
INSERT INTO `pcd` VALUES (743, '恒山区', 'd', 741, NULL);
INSERT INTO `pcd` VALUES (744, '城子河区', 'd', 741, NULL);
INSERT INTO `pcd` VALUES (745, '滴道区', 'd', 741, NULL);
INSERT INTO `pcd` VALUES (746, '梨树区', 'd', 741, NULL);
INSERT INTO `pcd` VALUES (747, '麻山区', 'd', 741, NULL);
INSERT INTO `pcd` VALUES (748, '密山市', 'd', 741, NULL);
INSERT INTO `pcd` VALUES (749, '虎林市', 'd', 741, NULL);
INSERT INTO `pcd` VALUES (750, '鸡东县', 'd', 741, NULL);
INSERT INTO `pcd` VALUES (751, '其他', 'd', 741, NULL);
INSERT INTO `pcd` VALUES (752, '大庆', 'c', 682, 'A4');
INSERT INTO `pcd` VALUES (753, '萨尔图区', 'd', 752, NULL);
INSERT INTO `pcd` VALUES (754, '红岗区', 'd', 752, NULL);
INSERT INTO `pcd` VALUES (755, '龙凤区', 'd', 752, NULL);
INSERT INTO `pcd` VALUES (756, '让胡路区', 'd', 752, NULL);
INSERT INTO `pcd` VALUES (757, '大同区', 'd', 752, 'A5');
INSERT INTO `pcd` VALUES (758, '林甸县', 'd', 752, NULL);
INSERT INTO `pcd` VALUES (759, '肇州县', 'd', 752, NULL);
INSERT INTO `pcd` VALUES (760, '肇源县', 'd', 752, NULL);
INSERT INTO `pcd` VALUES (761, '杜尔伯特蒙古族自治县', 'd', 752, NULL);
INSERT INTO `pcd` VALUES (762, '其他', 'd', 752, NULL);
INSERT INTO `pcd` VALUES (763, '伊春', 'c', 682, 'A5');
INSERT INTO `pcd` VALUES (764, '伊春区', 'd', 763, 'A5');
INSERT INTO `pcd` VALUES (765, '带岭区', 'd', 763, NULL);
INSERT INTO `pcd` VALUES (766, '南岔区', 'd', 763, NULL);
INSERT INTO `pcd` VALUES (767, '金山屯区', 'd', 763, NULL);
INSERT INTO `pcd` VALUES (768, '西林区', 'd', 763, NULL);
INSERT INTO `pcd` VALUES (769, '美溪区', 'd', 763, NULL);
INSERT INTO `pcd` VALUES (770, '乌马河区', 'd', 763, NULL);
INSERT INTO `pcd` VALUES (771, '翠峦区', 'd', 763, NULL);
INSERT INTO `pcd` VALUES (772, '友好区', 'd', 763, NULL);
INSERT INTO `pcd` VALUES (773, '上甘岭区', 'd', 763, NULL);
INSERT INTO `pcd` VALUES (774, '五营区', 'd', 763, NULL);
INSERT INTO `pcd` VALUES (775, '红星区', 'd', 763, NULL);
INSERT INTO `pcd` VALUES (776, '新青区', 'd', 763, NULL);
INSERT INTO `pcd` VALUES (777, '汤旺河区', 'd', 763, NULL);
INSERT INTO `pcd` VALUES (778, '乌伊岭区', 'd', 763, NULL);
INSERT INTO `pcd` VALUES (779, '铁力市', 'd', 763, NULL);
INSERT INTO `pcd` VALUES (780, '嘉荫县', 'd', 763, NULL);
INSERT INTO `pcd` VALUES (781, '其他', 'd', 763, NULL);
INSERT INTO `pcd` VALUES (782, '牡丹江', 'c', 682, 'A5');
INSERT INTO `pcd` VALUES (783, '爱民区', 'd', 782, NULL);
INSERT INTO `pcd` VALUES (784, '东安区', 'd', 782, NULL);
INSERT INTO `pcd` VALUES (785, '阳明区', 'd', 782, NULL);
INSERT INTO `pcd` VALUES (786, '西安区', 'd', 782, 'A2');
INSERT INTO `pcd` VALUES (787, '绥芬河市', 'd', 782, NULL);
INSERT INTO `pcd` VALUES (788, '宁安市', 'd', 782, NULL);
INSERT INTO `pcd` VALUES (789, '海林市', 'd', 782, NULL);
INSERT INTO `pcd` VALUES (790, '穆棱市', 'd', 782, NULL);
INSERT INTO `pcd` VALUES (791, '林口县', 'd', 782, NULL);
INSERT INTO `pcd` VALUES (792, '东宁县', 'd', 782, NULL);
INSERT INTO `pcd` VALUES (793, '其他', 'd', 782, NULL);
INSERT INTO `pcd` VALUES (794, '佳木斯', 'c', 682, 'A5');
INSERT INTO `pcd` VALUES (795, '向阳区', 'd', 794, NULL);
INSERT INTO `pcd` VALUES (796, '前进区', 'd', 794, NULL);
INSERT INTO `pcd` VALUES (797, '东风区', 'd', 794, NULL);
INSERT INTO `pcd` VALUES (798, '郊区', 'd', 794, NULL);
INSERT INTO `pcd` VALUES (799, '同江市', 'd', 794, NULL);
INSERT INTO `pcd` VALUES (800, '富锦市', 'd', 794, NULL);
INSERT INTO `pcd` VALUES (801, '桦川县', 'd', 794, NULL);
INSERT INTO `pcd` VALUES (802, '抚远县', 'd', 794, NULL);
INSERT INTO `pcd` VALUES (803, '桦南县', 'd', 794, NULL);
INSERT INTO `pcd` VALUES (804, '汤原县', 'd', 794, NULL);
INSERT INTO `pcd` VALUES (805, '其他', 'd', 794, NULL);
INSERT INTO `pcd` VALUES (806, '七台河', 'c', 682, 'A5');
INSERT INTO `pcd` VALUES (807, '桃山区', 'd', 806, NULL);
INSERT INTO `pcd` VALUES (808, '新兴区', 'd', 806, NULL);
INSERT INTO `pcd` VALUES (809, '茄子河区', 'd', 806, NULL);
INSERT INTO `pcd` VALUES (810, '勃利县', 'd', 806, NULL);
INSERT INTO `pcd` VALUES (811, '其他', 'd', 806, NULL);
INSERT INTO `pcd` VALUES (812, '黑河', 'c', 682, 'A5');
INSERT INTO `pcd` VALUES (813, '爱辉区', 'd', 812, NULL);
INSERT INTO `pcd` VALUES (814, '北安市', 'd', 812, NULL);
INSERT INTO `pcd` VALUES (815, '五大连池市', 'd', 812, 'A3');
INSERT INTO `pcd` VALUES (816, '逊克县', 'd', 812, NULL);
INSERT INTO `pcd` VALUES (817, '嫩江县', 'd', 812, NULL);
INSERT INTO `pcd` VALUES (818, '孙吴县', 'd', 812, NULL);
INSERT INTO `pcd` VALUES (819, '其他', 'd', 812, NULL);
INSERT INTO `pcd` VALUES (820, '绥化', 'c', 682, 'A5');
INSERT INTO `pcd` VALUES (821, '北林区', 'd', 820, NULL);
INSERT INTO `pcd` VALUES (822, '安达市', 'd', 820, NULL);
INSERT INTO `pcd` VALUES (823, '肇东市', 'd', 820, NULL);
INSERT INTO `pcd` VALUES (824, '海伦市', 'd', 820, NULL);
INSERT INTO `pcd` VALUES (825, '绥棱县', 'd', 820, NULL);
INSERT INTO `pcd` VALUES (826, '兰西县', 'd', 820, NULL);
INSERT INTO `pcd` VALUES (827, '明水县', 'd', 820, NULL);
INSERT INTO `pcd` VALUES (828, '青冈县', 'd', 820, NULL);
INSERT INTO `pcd` VALUES (829, '庆安县', 'd', 820, NULL);
INSERT INTO `pcd` VALUES (830, '望奎县', 'd', 820, NULL);
INSERT INTO `pcd` VALUES (831, '其他', 'd', 820, NULL);
INSERT INTO `pcd` VALUES (832, '大兴安岭地区', 'c', 682, 'A5');
INSERT INTO `pcd` VALUES (833, '呼玛县', 'd', 832, NULL);
INSERT INTO `pcd` VALUES (834, '塔河县', 'd', 832, NULL);
INSERT INTO `pcd` VALUES (835, '漠河县', 'd', 832, NULL);
INSERT INTO `pcd` VALUES (836, '大兴安岭辖区', 'd', 832, NULL);
INSERT INTO `pcd` VALUES (837, '其他', 'd', 832, NULL);
INSERT INTO `pcd` VALUES (838, '其他', 'c', 682, NULL);
INSERT INTO `pcd` VALUES (839, '其他', 'd', 838, NULL);
INSERT INTO `pcd` VALUES (840, '上海', 'p', NULL, 'A1');
INSERT INTO `pcd` VALUES (841, '上海', 'c', 840, 'A1');
INSERT INTO `pcd` VALUES (842, '黄浦区', 'd', 841, NULL);
INSERT INTO `pcd` VALUES (843, '卢湾区', 'd', 841, NULL);
INSERT INTO `pcd` VALUES (844, '徐汇区', 'd', 841, NULL);
INSERT INTO `pcd` VALUES (845, '长宁区', 'd', 841, NULL);
INSERT INTO `pcd` VALUES (846, '静安区', 'd', 841, NULL);
INSERT INTO `pcd` VALUES (847, '普陀区', 'd', 841, NULL);
INSERT INTO `pcd` VALUES (848, '闸北区', 'd', 841, NULL);
INSERT INTO `pcd` VALUES (849, '虹口区', 'd', 841, NULL);
INSERT INTO `pcd` VALUES (850, '杨浦区', 'd', 841, NULL);
INSERT INTO `pcd` VALUES (851, '宝山区', 'd', 841, NULL);
INSERT INTO `pcd` VALUES (852, '闵行区', 'd', 841, NULL);
INSERT INTO `pcd` VALUES (853, '嘉定区', 'd', 841, NULL);
INSERT INTO `pcd` VALUES (854, '松江区', 'd', 841, NULL);
INSERT INTO `pcd` VALUES (855, '金山区', 'd', 841, NULL);
INSERT INTO `pcd` VALUES (856, '青浦区', 'd', 841, NULL);
INSERT INTO `pcd` VALUES (857, '南汇区', 'd', 841, NULL);
INSERT INTO `pcd` VALUES (858, '奉贤区', 'd', 841, NULL);
INSERT INTO `pcd` VALUES (859, '浦东新区', 'd', 841, NULL);
INSERT INTO `pcd` VALUES (860, '崇明县', 'd', 841, NULL);
INSERT INTO `pcd` VALUES (861, '其他', 'd', 841, NULL);
INSERT INTO `pcd` VALUES (862, '江苏', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (863, '南京', 'c', 862, 'A2');
INSERT INTO `pcd` VALUES (864, '玄武区', 'd', 863, NULL);
INSERT INTO `pcd` VALUES (865, '白下区', 'd', 863, NULL);
INSERT INTO `pcd` VALUES (866, '秦淮区', 'd', 863, NULL);
INSERT INTO `pcd` VALUES (867, '建邺区', 'd', 863, NULL);
INSERT INTO `pcd` VALUES (868, '鼓楼区', 'd', 863, NULL);
INSERT INTO `pcd` VALUES (869, '下关区', 'd', 863, NULL);
INSERT INTO `pcd` VALUES (870, '栖霞区', 'd', 863, NULL);
INSERT INTO `pcd` VALUES (871, '雨花台区', 'd', 863, NULL);
INSERT INTO `pcd` VALUES (872, '浦口区', 'd', 863, NULL);
INSERT INTO `pcd` VALUES (873, '江宁区', 'd', 863, NULL);
INSERT INTO `pcd` VALUES (874, '六合区', 'd', 863, NULL);
INSERT INTO `pcd` VALUES (875, '溧水县', 'd', 863, NULL);
INSERT INTO `pcd` VALUES (876, '高淳县', 'd', 863, NULL);
INSERT INTO `pcd` VALUES (877, '其他', 'd', 863, NULL);
INSERT INTO `pcd` VALUES (878, '苏州', 'c', 862, 'A2');
INSERT INTO `pcd` VALUES (879, '金阊区', 'd', 878, NULL);
INSERT INTO `pcd` VALUES (880, '平江区', 'd', 878, NULL);
INSERT INTO `pcd` VALUES (881, '沧浪区', 'd', 878, NULL);
INSERT INTO `pcd` VALUES (882, '虎丘区', 'd', 878, NULL);
INSERT INTO `pcd` VALUES (883, '吴中区', 'd', 878, NULL);
INSERT INTO `pcd` VALUES (884, '相城区', 'd', 878, NULL);
INSERT INTO `pcd` VALUES (885, '常熟市', 'd', 878, 'A4');
INSERT INTO `pcd` VALUES (886, '张家港市', 'd', 878, 'A4');
INSERT INTO `pcd` VALUES (887, '昆山市', 'd', 878, 'A4');
INSERT INTO `pcd` VALUES (888, '吴江市', 'd', 878, NULL);
INSERT INTO `pcd` VALUES (889, '太仓市', 'd', 878, 'A4');
INSERT INTO `pcd` VALUES (890, '其他', 'd', 878, NULL);
INSERT INTO `pcd` VALUES (891, '无锡', 'c', 862, 'A3');
INSERT INTO `pcd` VALUES (892, '崇安区', 'd', 891, NULL);
INSERT INTO `pcd` VALUES (893, '南长区', 'd', 891, NULL);
INSERT INTO `pcd` VALUES (894, '北塘区', 'd', 891, NULL);
INSERT INTO `pcd` VALUES (895, '滨湖区', 'd', 891, NULL);
INSERT INTO `pcd` VALUES (896, '锡山区', 'd', 891, NULL);
INSERT INTO `pcd` VALUES (897, '惠山区', 'd', 891, NULL);
INSERT INTO `pcd` VALUES (898, '江阴市', 'd', 891, 'A4');
INSERT INTO `pcd` VALUES (899, '宜兴市', 'd', 891, 'A4');
INSERT INTO `pcd` VALUES (900, '其他', 'd', 891, NULL);
INSERT INTO `pcd` VALUES (901, '常州', 'c', 862, 'A3');
INSERT INTO `pcd` VALUES (902, '钟楼区', 'd', 901, NULL);
INSERT INTO `pcd` VALUES (903, '天宁区', 'd', 901, NULL);
INSERT INTO `pcd` VALUES (904, '戚墅堰区', 'd', 901, NULL);
INSERT INTO `pcd` VALUES (905, '新北区', 'd', 901, NULL);
INSERT INTO `pcd` VALUES (906, '武进区', 'd', 901, NULL);
INSERT INTO `pcd` VALUES (907, '金坛市', 'd', 901, NULL);
INSERT INTO `pcd` VALUES (908, '溧阳市', 'd', 901, NULL);
INSERT INTO `pcd` VALUES (909, '其他', 'd', 901, NULL);
INSERT INTO `pcd` VALUES (910, '镇江', 'c', 862, 'A4');
INSERT INTO `pcd` VALUES (911, '京口区', 'd', 910, NULL);
INSERT INTO `pcd` VALUES (912, '润州区', 'd', 910, NULL);
INSERT INTO `pcd` VALUES (913, '丹徒区', 'd', 910, NULL);
INSERT INTO `pcd` VALUES (914, '丹阳市', 'd', 910, NULL);
INSERT INTO `pcd` VALUES (915, '扬中市', 'd', 910, NULL);
INSERT INTO `pcd` VALUES (916, '句容市', 'd', 910, 'A4');
INSERT INTO `pcd` VALUES (917, '其他', 'd', 910, NULL);
INSERT INTO `pcd` VALUES (918, '南通', 'c', 862, 'A3');
INSERT INTO `pcd` VALUES (919, '崇川区', 'd', 918, NULL);
INSERT INTO `pcd` VALUES (920, '港闸区', 'd', 918, NULL);
INSERT INTO `pcd` VALUES (921, '通州市', 'd', 918, NULL);
INSERT INTO `pcd` VALUES (922, '如皋市', 'd', 918, NULL);
INSERT INTO `pcd` VALUES (923, '海门市', 'd', 918, NULL);
INSERT INTO `pcd` VALUES (924, '启东市', 'd', 918, NULL);
INSERT INTO `pcd` VALUES (925, '海安县', 'd', 918, NULL);
INSERT INTO `pcd` VALUES (926, '如东县', 'd', 918, NULL);
INSERT INTO `pcd` VALUES (927, '其他', 'd', 918, NULL);
INSERT INTO `pcd` VALUES (928, '泰州', 'c', 862, 'A4');
INSERT INTO `pcd` VALUES (929, '海陵区', 'd', 928, NULL);
INSERT INTO `pcd` VALUES (930, '高港区', 'd', 928, NULL);
INSERT INTO `pcd` VALUES (931, '姜堰市', 'd', 928, NULL);
INSERT INTO `pcd` VALUES (932, '泰兴市', 'd', 928, 'A4');
INSERT INTO `pcd` VALUES (933, '靖江市', 'd', 928, NULL);
INSERT INTO `pcd` VALUES (934, '兴化市', 'd', 928, NULL);
INSERT INTO `pcd` VALUES (935, '其他', 'd', 928, NULL);
INSERT INTO `pcd` VALUES (936, '扬州', 'c', 862, 'A4');
INSERT INTO `pcd` VALUES (937, '广陵区', 'd', 936, NULL);
INSERT INTO `pcd` VALUES (938, '维扬区', 'd', 936, NULL);
INSERT INTO `pcd` VALUES (939, '邗江区', 'd', 936, NULL);
INSERT INTO `pcd` VALUES (940, '江都市', 'd', 936, NULL);
INSERT INTO `pcd` VALUES (941, '仪征市', 'd', 936, NULL);
INSERT INTO `pcd` VALUES (942, '高邮市', 'd', 936, NULL);
INSERT INTO `pcd` VALUES (943, '宝应县', 'd', 936, NULL);
INSERT INTO `pcd` VALUES (944, '其他', 'd', 936, NULL);
INSERT INTO `pcd` VALUES (945, '盐城', 'c', 862, 'A4');
INSERT INTO `pcd` VALUES (946, '亭湖区', 'd', 945, NULL);
INSERT INTO `pcd` VALUES (947, '盐都区', 'd', 945, NULL);
INSERT INTO `pcd` VALUES (948, '大丰市', 'd', 945, NULL);
INSERT INTO `pcd` VALUES (949, '东台市', 'd', 945, NULL);
INSERT INTO `pcd` VALUES (950, '建湖县', 'd', 945, NULL);
INSERT INTO `pcd` VALUES (951, '射阳县', 'd', 945, NULL);
INSERT INTO `pcd` VALUES (952, '阜宁县', 'd', 945, NULL);
INSERT INTO `pcd` VALUES (953, '滨海县', 'd', 945, NULL);
INSERT INTO `pcd` VALUES (954, '响水县', 'd', 945, NULL);
INSERT INTO `pcd` VALUES (955, '其他', 'd', 945, NULL);
INSERT INTO `pcd` VALUES (956, '连云港', 'c', 862, 'A4');
INSERT INTO `pcd` VALUES (957, '新浦区', 'd', 956, NULL);
INSERT INTO `pcd` VALUES (958, '海州区', 'd', 956, NULL);
INSERT INTO `pcd` VALUES (959, '连云区', 'd', 956, NULL);
INSERT INTO `pcd` VALUES (960, '东海县', 'd', 956, NULL);
INSERT INTO `pcd` VALUES (961, '灌云县', 'd', 956, NULL);
INSERT INTO `pcd` VALUES (962, '赣榆县', 'd', 956, NULL);
INSERT INTO `pcd` VALUES (963, '灌南县', 'd', 956, NULL);
INSERT INTO `pcd` VALUES (964, '其他', 'd', 956, NULL);
INSERT INTO `pcd` VALUES (965, '徐州', 'c', 862, 'A3');
INSERT INTO `pcd` VALUES (966, '云龙区', 'd', 965, NULL);
INSERT INTO `pcd` VALUES (967, '鼓楼区', 'd', 965, NULL);
INSERT INTO `pcd` VALUES (968, '九里区', 'd', 965, NULL);
INSERT INTO `pcd` VALUES (969, '泉山区', 'd', 965, NULL);
INSERT INTO `pcd` VALUES (970, '贾汪区', 'd', 965, NULL);
INSERT INTO `pcd` VALUES (971, '邳州市', 'd', 965, NULL);
INSERT INTO `pcd` VALUES (972, '新沂市', 'd', 965, NULL);
INSERT INTO `pcd` VALUES (973, '铜山县', 'd', 965, NULL);
INSERT INTO `pcd` VALUES (974, '睢宁县', 'd', 965, NULL);
INSERT INTO `pcd` VALUES (975, '沛县', 'd', 965, NULL);
INSERT INTO `pcd` VALUES (976, '丰县', 'd', 965, NULL);
INSERT INTO `pcd` VALUES (977, '其他', 'd', 965, NULL);
INSERT INTO `pcd` VALUES (978, '淮安', 'c', 862, 'A4');
INSERT INTO `pcd` VALUES (979, '清河区', 'd', 978, NULL);
INSERT INTO `pcd` VALUES (980, '清浦区', 'd', 978, NULL);
INSERT INTO `pcd` VALUES (981, '楚州区', 'd', 978, NULL);
INSERT INTO `pcd` VALUES (982, '淮阴区', 'd', 978, NULL);
INSERT INTO `pcd` VALUES (983, '涟水县', 'd', 978, NULL);
INSERT INTO `pcd` VALUES (984, '洪泽县', 'd', 978, NULL);
INSERT INTO `pcd` VALUES (985, '金湖县', 'd', 978, NULL);
INSERT INTO `pcd` VALUES (986, '盱眙县', 'd', 978, 'A4');
INSERT INTO `pcd` VALUES (987, '其他', 'd', 978, NULL);
INSERT INTO `pcd` VALUES (988, '宿迁', 'c', 862, 'A4');
INSERT INTO `pcd` VALUES (989, '宿城区', 'd', 988, NULL);
INSERT INTO `pcd` VALUES (990, '宿豫区', 'd', 988, NULL);
INSERT INTO `pcd` VALUES (991, '沭阳县', 'd', 988, NULL);
INSERT INTO `pcd` VALUES (992, '泗阳县', 'd', 988, NULL);
INSERT INTO `pcd` VALUES (993, '泗洪县', 'd', 988, NULL);
INSERT INTO `pcd` VALUES (994, '其他', 'd', 988, NULL);
INSERT INTO `pcd` VALUES (995, '其他', 'c', 862, NULL);
INSERT INTO `pcd` VALUES (996, '其他', 'd', 995, NULL);
INSERT INTO `pcd` VALUES (997, '浙江', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (998, '杭州', 'c', 997, 'A2');
INSERT INTO `pcd` VALUES (999, '拱墅区', 'd', 998, NULL);
INSERT INTO `pcd` VALUES (1000, '西湖区', 'd', 998, NULL);
INSERT INTO `pcd` VALUES (1001, '上城区', 'd', 998, NULL);
INSERT INTO `pcd` VALUES (1002, '下城区', 'd', 998, NULL);
INSERT INTO `pcd` VALUES (1003, '江干区', 'd', 998, NULL);
INSERT INTO `pcd` VALUES (1004, '滨江区', 'd', 998, NULL);
INSERT INTO `pcd` VALUES (1005, '余杭区', 'd', 998, NULL);
INSERT INTO `pcd` VALUES (1006, '萧山区', 'd', 998, NULL);
INSERT INTO `pcd` VALUES (1007, '建德市', 'd', 998, NULL);
INSERT INTO `pcd` VALUES (1008, '富阳市', 'd', 998, NULL);
INSERT INTO `pcd` VALUES (1009, '临安市', 'd', 998, NULL);
INSERT INTO `pcd` VALUES (1010, '桐庐县', 'd', 998, NULL);
INSERT INTO `pcd` VALUES (1011, '淳安县', 'd', 998, NULL);
INSERT INTO `pcd` VALUES (1012, '其他', 'd', 998, NULL);
INSERT INTO `pcd` VALUES (1013, '宁波', 'c', 997, 'A3');
INSERT INTO `pcd` VALUES (1014, '海曙区', 'd', 1013, NULL);
INSERT INTO `pcd` VALUES (1015, '江东区', 'd', 1013, NULL);
INSERT INTO `pcd` VALUES (1016, '江北区', 'd', 1013, NULL);
INSERT INTO `pcd` VALUES (1017, '镇海区', 'd', 1013, NULL);
INSERT INTO `pcd` VALUES (1018, '北仑区', 'd', 1013, NULL);
INSERT INTO `pcd` VALUES (1019, '鄞州区', 'd', 1013, NULL);
INSERT INTO `pcd` VALUES (1020, '余姚市', 'd', 1013, 'A4');
INSERT INTO `pcd` VALUES (1021, '慈溪市', 'd', 1013, NULL);
INSERT INTO `pcd` VALUES (1022, '奉化市', 'd', 1013, NULL);
INSERT INTO `pcd` VALUES (1023, '宁海县', 'd', 1013, NULL);
INSERT INTO `pcd` VALUES (1024, '象山县', 'd', 1013, NULL);
INSERT INTO `pcd` VALUES (1025, '其他', 'd', 1013, NULL);
INSERT INTO `pcd` VALUES (1026, '温州', 'c', 997, 'A3');
INSERT INTO `pcd` VALUES (1027, '鹿城区', 'd', 1026, NULL);
INSERT INTO `pcd` VALUES (1028, '龙湾区', 'd', 1026, NULL);
INSERT INTO `pcd` VALUES (1029, '瓯海区', 'd', 1026, NULL);
INSERT INTO `pcd` VALUES (1030, '瑞安市', 'd', 1026, NULL);
INSERT INTO `pcd` VALUES (1031, '乐清市', 'd', 1026, 'A4');
INSERT INTO `pcd` VALUES (1032, '永嘉县', 'd', 1026, NULL);
INSERT INTO `pcd` VALUES (1033, '洞头县', 'd', 1026, NULL);
INSERT INTO `pcd` VALUES (1034, '平阳县', 'd', 1026, NULL);
INSERT INTO `pcd` VALUES (1035, '苍南县', 'd', 1026, NULL);
INSERT INTO `pcd` VALUES (1036, '文成县', 'd', 1026, NULL);
INSERT INTO `pcd` VALUES (1037, '泰顺县', 'd', 1026, NULL);
INSERT INTO `pcd` VALUES (1038, '其他', 'd', 1026, NULL);
INSERT INTO `pcd` VALUES (1039, '嘉兴', 'c', 997, 'A4');
INSERT INTO `pcd` VALUES (1040, '秀城区', 'd', 1039, NULL);
INSERT INTO `pcd` VALUES (1041, '秀洲区', 'd', 1039, NULL);
INSERT INTO `pcd` VALUES (1042, '海宁市', 'd', 1039, NULL);
INSERT INTO `pcd` VALUES (1043, '平湖市', 'd', 1039, NULL);
INSERT INTO `pcd` VALUES (1044, '桐乡市', 'd', 1039, NULL);
INSERT INTO `pcd` VALUES (1045, '嘉善县', 'd', 1039, NULL);
INSERT INTO `pcd` VALUES (1046, '海盐县', 'd', 1039, NULL);
INSERT INTO `pcd` VALUES (1047, '其他', 'd', 1039, NULL);
INSERT INTO `pcd` VALUES (1048, '湖州', 'c', 997, 'A4');
INSERT INTO `pcd` VALUES (1049, '吴兴区', 'd', 1048, NULL);
INSERT INTO `pcd` VALUES (1050, '南浔区', 'd', 1048, NULL);
INSERT INTO `pcd` VALUES (1051, '长兴县', 'd', 1048, NULL);
INSERT INTO `pcd` VALUES (1052, '德清县', 'd', 1048, NULL);
INSERT INTO `pcd` VALUES (1053, '安吉县', 'd', 1048, NULL);
INSERT INTO `pcd` VALUES (1054, '其他', 'd', 1048, NULL);
INSERT INTO `pcd` VALUES (1055, '绍兴', 'c', 997, 'A4');
INSERT INTO `pcd` VALUES (1056, '越城区', 'd', 1055, NULL);
INSERT INTO `pcd` VALUES (1057, '诸暨市', 'd', 1055, 'A4');
INSERT INTO `pcd` VALUES (1058, '上虞市', 'd', 1055, NULL);
INSERT INTO `pcd` VALUES (1059, '嵊州市', 'd', 1055, NULL);
INSERT INTO `pcd` VALUES (1060, '绍兴县', 'd', 1055, 'A4');
INSERT INTO `pcd` VALUES (1061, '新昌县', 'd', 1055, NULL);
INSERT INTO `pcd` VALUES (1062, '其他', 'd', 1055, NULL);
INSERT INTO `pcd` VALUES (1063, '金华', 'c', 997, 'A4');
INSERT INTO `pcd` VALUES (1064, '婺城区', 'd', 1063, NULL);
INSERT INTO `pcd` VALUES (1065, '金东区', 'd', 1063, NULL);
INSERT INTO `pcd` VALUES (1066, '兰溪市', 'd', 1063, NULL);
INSERT INTO `pcd` VALUES (1067, '义乌市', 'd', 1063, 'A4');
INSERT INTO `pcd` VALUES (1068, '东阳市', 'd', 1063, NULL);
INSERT INTO `pcd` VALUES (1069, '永康市', 'd', 1063, NULL);
INSERT INTO `pcd` VALUES (1070, '武义县', 'd', 1063, NULL);
INSERT INTO `pcd` VALUES (1071, '浦江县', 'd', 1063, NULL);
INSERT INTO `pcd` VALUES (1072, '磐安县', 'd', 1063, NULL);
INSERT INTO `pcd` VALUES (1073, '其他', 'd', 1063, NULL);
INSERT INTO `pcd` VALUES (1074, '衢州', 'c', 997, 'A5');
INSERT INTO `pcd` VALUES (1075, '柯城区', 'd', 1074, NULL);
INSERT INTO `pcd` VALUES (1076, '衢江区', 'd', 1074, NULL);
INSERT INTO `pcd` VALUES (1077, '江山市', 'd', 1074, NULL);
INSERT INTO `pcd` VALUES (1078, '龙游县', 'd', 1074, NULL);
INSERT INTO `pcd` VALUES (1079, '常山县', 'd', 1074, NULL);
INSERT INTO `pcd` VALUES (1080, '开化县', 'd', 1074, NULL);
INSERT INTO `pcd` VALUES (1081, '其他', 'd', 1074, NULL);
INSERT INTO `pcd` VALUES (1082, '舟山', 'c', 997, 'A5');
INSERT INTO `pcd` VALUES (1083, '定海区', 'd', 1082, NULL);
INSERT INTO `pcd` VALUES (1084, '普陀区', 'd', 1082, NULL);
INSERT INTO `pcd` VALUES (1085, '岱山县', 'd', 1082, NULL);
INSERT INTO `pcd` VALUES (1086, '嵊泗县', 'd', 1082, NULL);
INSERT INTO `pcd` VALUES (1087, '其他', 'd', 1082, NULL);
INSERT INTO `pcd` VALUES (1088, '台州', 'c', 997, 'A4');
INSERT INTO `pcd` VALUES (1089, '椒江区', 'd', 1088, NULL);
INSERT INTO `pcd` VALUES (1090, '黄岩区', 'd', 1088, NULL);
INSERT INTO `pcd` VALUES (1091, '路桥区', 'd', 1088, NULL);
INSERT INTO `pcd` VALUES (1092, '临海市', 'd', 1088, NULL);
INSERT INTO `pcd` VALUES (1093, '温岭市', 'd', 1088, NULL);
INSERT INTO `pcd` VALUES (1094, '玉环县', 'd', 1088, NULL);
INSERT INTO `pcd` VALUES (1095, '天台县', 'd', 1088, NULL);
INSERT INTO `pcd` VALUES (1096, '仙居县', 'd', 1088, NULL);
INSERT INTO `pcd` VALUES (1097, '三门县', 'd', 1088, NULL);
INSERT INTO `pcd` VALUES (1098, '其他', 'd', 1088, NULL);
INSERT INTO `pcd` VALUES (1099, '丽水', 'c', 997, 'A5');
INSERT INTO `pcd` VALUES (1100, '莲都区', 'd', 1099, NULL);
INSERT INTO `pcd` VALUES (1101, '龙泉市', 'd', 1099, NULL);
INSERT INTO `pcd` VALUES (1102, '缙云县', 'd', 1099, NULL);
INSERT INTO `pcd` VALUES (1103, '青田县', 'd', 1099, NULL);
INSERT INTO `pcd` VALUES (1104, '云和县', 'd', 1099, NULL);
INSERT INTO `pcd` VALUES (1105, '遂昌县', 'd', 1099, NULL);
INSERT INTO `pcd` VALUES (1106, '松阳县', 'd', 1099, NULL);
INSERT INTO `pcd` VALUES (1107, '庆元县', 'd', 1099, NULL);
INSERT INTO `pcd` VALUES (1108, '景宁畲族自治县', 'd', 1099, NULL);
INSERT INTO `pcd` VALUES (1109, '其他', 'd', 1099, NULL);
INSERT INTO `pcd` VALUES (1110, '其他', 'c', 997, NULL);
INSERT INTO `pcd` VALUES (1111, '其他', 'd', 1110, NULL);
INSERT INTO `pcd` VALUES (1112, '安徽', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (1113, '合肥', 'c', 1112, 'A3');
INSERT INTO `pcd` VALUES (1114, '庐阳区', 'd', 1113, NULL);
INSERT INTO `pcd` VALUES (1115, '瑶海区', 'd', 1113, NULL);
INSERT INTO `pcd` VALUES (1116, '蜀山区', 'd', 1113, NULL);
INSERT INTO `pcd` VALUES (1117, '包河区', 'd', 1113, NULL);
INSERT INTO `pcd` VALUES (1118, '长丰县', 'd', 1113, NULL);
INSERT INTO `pcd` VALUES (1119, '肥东县', 'd', 1113, NULL);
INSERT INTO `pcd` VALUES (1120, '肥西县', 'd', 1113, NULL);
INSERT INTO `pcd` VALUES (1121, '其他', 'd', 1113, NULL);
INSERT INTO `pcd` VALUES (1122, '芜湖', 'c', 1112, 'A4');
INSERT INTO `pcd` VALUES (1123, '镜湖区', 'd', 1122, NULL);
INSERT INTO `pcd` VALUES (1124, '弋江区', 'd', 1122, NULL);
INSERT INTO `pcd` VALUES (1125, '鸠江区', 'd', 1122, NULL);
INSERT INTO `pcd` VALUES (1126, '三山区', 'd', 1122, NULL);
INSERT INTO `pcd` VALUES (1127, '芜湖县', 'd', 1122, 'A4');
INSERT INTO `pcd` VALUES (1128, '南陵县', 'd', 1122, NULL);
INSERT INTO `pcd` VALUES (1129, '繁昌县', 'd', 1122, NULL);
INSERT INTO `pcd` VALUES (1130, '其他', 'd', 1122, NULL);
INSERT INTO `pcd` VALUES (1131, '蚌埠', 'c', 1112, 'A4');
INSERT INTO `pcd` VALUES (1132, '蚌山区', 'd', 1131, NULL);
INSERT INTO `pcd` VALUES (1133, '龙子湖区', 'd', 1131, NULL);
INSERT INTO `pcd` VALUES (1134, '禹会区', 'd', 1131, NULL);
INSERT INTO `pcd` VALUES (1135, '淮上区', 'd', 1131, NULL);
INSERT INTO `pcd` VALUES (1136, '怀远县', 'd', 1131, NULL);
INSERT INTO `pcd` VALUES (1137, '固镇县', 'd', 1131, NULL);
INSERT INTO `pcd` VALUES (1138, '五河县', 'd', 1131, NULL);
INSERT INTO `pcd` VALUES (1139, '其他', 'd', 1131, NULL);
INSERT INTO `pcd` VALUES (1140, '淮南', 'c', 1112, 'A5');
INSERT INTO `pcd` VALUES (1141, '田家庵区', 'd', 1140, NULL);
INSERT INTO `pcd` VALUES (1142, '大通区', 'd', 1140, NULL);
INSERT INTO `pcd` VALUES (1143, '谢家集区', 'd', 1140, NULL);
INSERT INTO `pcd` VALUES (1144, '八公山区', 'd', 1140, NULL);
INSERT INTO `pcd` VALUES (1145, '潘集区', 'd', 1140, NULL);
INSERT INTO `pcd` VALUES (1146, '凤台县', 'd', 1140, NULL);
INSERT INTO `pcd` VALUES (1147, '其他', 'd', 1140, NULL);
INSERT INTO `pcd` VALUES (1148, '马鞍山', 'c', 1112, 'A4');
INSERT INTO `pcd` VALUES (1149, '雨山区', 'd', 1148, NULL);
INSERT INTO `pcd` VALUES (1150, '花山区', 'd', 1148, NULL);
INSERT INTO `pcd` VALUES (1151, '金家庄区', 'd', 1148, NULL);
INSERT INTO `pcd` VALUES (1152, '当涂县', 'd', 1148, NULL);
INSERT INTO `pcd` VALUES (1153, '其他', 'd', 1148, NULL);
INSERT INTO `pcd` VALUES (1154, '淮北', 'c', 1112, 'A5');
INSERT INTO `pcd` VALUES (1155, '相山区', 'd', 1154, NULL);
INSERT INTO `pcd` VALUES (1156, '杜集区', 'd', 1154, NULL);
INSERT INTO `pcd` VALUES (1157, '烈山区', 'd', 1154, NULL);
INSERT INTO `pcd` VALUES (1158, '濉溪县', 'd', 1154, NULL);
INSERT INTO `pcd` VALUES (1159, '其他', 'd', 1154, NULL);
INSERT INTO `pcd` VALUES (1160, '铜陵', 'c', 1112, 'A5');
INSERT INTO `pcd` VALUES (1161, '铜官山区', 'd', 1160, NULL);
INSERT INTO `pcd` VALUES (1162, '狮子山区', 'd', 1160, NULL);
INSERT INTO `pcd` VALUES (1163, '郊区', 'd', 1160, NULL);
INSERT INTO `pcd` VALUES (1164, '铜陵县', 'd', 1160, 'A5');
INSERT INTO `pcd` VALUES (1165, '其他', 'd', 1160, NULL);
INSERT INTO `pcd` VALUES (1166, '安庆', 'c', 1112, 'A4');
INSERT INTO `pcd` VALUES (1167, '迎江区', 'd', 1166, NULL);
INSERT INTO `pcd` VALUES (1168, '大观区', 'd', 1166, NULL);
INSERT INTO `pcd` VALUES (1169, '宜秀区', 'd', 1166, NULL);
INSERT INTO `pcd` VALUES (1170, '桐城市', 'd', 1166, NULL);
INSERT INTO `pcd` VALUES (1171, '宿松县', 'd', 1166, NULL);
INSERT INTO `pcd` VALUES (1172, '枞阳县', 'd', 1166, NULL);
INSERT INTO `pcd` VALUES (1173, '太湖县', 'd', 1166, NULL);
INSERT INTO `pcd` VALUES (1174, '怀宁县', 'd', 1166, NULL);
INSERT INTO `pcd` VALUES (1175, '岳西县', 'd', 1166, NULL);
INSERT INTO `pcd` VALUES (1176, '望江县', 'd', 1166, NULL);
INSERT INTO `pcd` VALUES (1177, '潜山县', 'd', 1166, NULL);
INSERT INTO `pcd` VALUES (1178, '其他', 'd', 1166, NULL);
INSERT INTO `pcd` VALUES (1179, '黄山', 'c', 1112, 'A5');
INSERT INTO `pcd` VALUES (1180, '屯溪区', 'd', 1179, NULL);
INSERT INTO `pcd` VALUES (1181, '黄山区', 'd', 1179, 'A5');
INSERT INTO `pcd` VALUES (1182, '徽州区', 'd', 1179, NULL);
INSERT INTO `pcd` VALUES (1183, '休宁县', 'd', 1179, NULL);
INSERT INTO `pcd` VALUES (1184, '歙县', 'd', 1179, NULL);
INSERT INTO `pcd` VALUES (1185, '祁门县', 'd', 1179, NULL);
INSERT INTO `pcd` VALUES (1186, '黟县', 'd', 1179, NULL);
INSERT INTO `pcd` VALUES (1187, '其他', 'd', 1179, NULL);
INSERT INTO `pcd` VALUES (1188, '滁州', 'c', 1112, 'A4');
INSERT INTO `pcd` VALUES (1189, '琅琊区', 'd', 1188, NULL);
INSERT INTO `pcd` VALUES (1190, '南谯区', 'd', 1188, NULL);
INSERT INTO `pcd` VALUES (1191, '天长市', 'd', 1188, 'A4');
INSERT INTO `pcd` VALUES (1192, '明光市', 'd', 1188, NULL);
INSERT INTO `pcd` VALUES (1193, '全椒县', 'd', 1188, NULL);
INSERT INTO `pcd` VALUES (1194, '来安县', 'd', 1188, NULL);
INSERT INTO `pcd` VALUES (1195, '定远县', 'd', 1188, NULL);
INSERT INTO `pcd` VALUES (1196, '凤阳县', 'd', 1188, NULL);
INSERT INTO `pcd` VALUES (1197, '其他', 'd', 1188, NULL);
INSERT INTO `pcd` VALUES (1198, '阜阳', 'c', 1112, 'A4');
INSERT INTO `pcd` VALUES (1199, '颍州区', 'd', 1198, NULL);
INSERT INTO `pcd` VALUES (1200, '颍东区', 'd', 1198, NULL);
INSERT INTO `pcd` VALUES (1201, '颍泉区', 'd', 1198, NULL);
INSERT INTO `pcd` VALUES (1202, '界首市', 'd', 1198, NULL);
INSERT INTO `pcd` VALUES (1203, '临泉县', 'd', 1198, NULL);
INSERT INTO `pcd` VALUES (1204, '颍上县', 'd', 1198, NULL);
INSERT INTO `pcd` VALUES (1205, '阜南县', 'd', 1198, NULL);
INSERT INTO `pcd` VALUES (1206, '太和县', 'd', 1198, NULL);
INSERT INTO `pcd` VALUES (1207, '其他', 'd', 1198, NULL);
INSERT INTO `pcd` VALUES (1208, '宿州', 'c', 1112, 'A4');
INSERT INTO `pcd` VALUES (1209, '埇桥区', 'd', 1208, NULL);
INSERT INTO `pcd` VALUES (1210, '萧县', 'd', 1208, NULL);
INSERT INTO `pcd` VALUES (1211, '泗县', 'd', 1208, NULL);
INSERT INTO `pcd` VALUES (1212, '砀山县', 'd', 1208, NULL);
INSERT INTO `pcd` VALUES (1213, '灵璧县', 'd', 1208, NULL);
INSERT INTO `pcd` VALUES (1214, '其他', 'd', 1208, NULL);
INSERT INTO `pcd` VALUES (1215, '巢湖', 'c', 1112, 'A4');
INSERT INTO `pcd` VALUES (1216, '居巢区', 'd', 1215, NULL);
INSERT INTO `pcd` VALUES (1217, '含山县', 'd', 1215, NULL);
INSERT INTO `pcd` VALUES (1218, '无为县', 'd', 1215, NULL);
INSERT INTO `pcd` VALUES (1219, '庐江县', 'd', 1215, NULL);
INSERT INTO `pcd` VALUES (1220, '和县', 'd', 1215, NULL);
INSERT INTO `pcd` VALUES (1221, '其他', 'd', 1215, NULL);
INSERT INTO `pcd` VALUES (1222, '六安', 'c', 1112, 'A5');
INSERT INTO `pcd` VALUES (1223, '金安区', 'd', 1222, NULL);
INSERT INTO `pcd` VALUES (1224, '裕安区', 'd', 1222, NULL);
INSERT INTO `pcd` VALUES (1225, '寿县', 'd', 1222, NULL);
INSERT INTO `pcd` VALUES (1226, '霍山县', 'd', 1222, NULL);
INSERT INTO `pcd` VALUES (1227, '霍邱县', 'd', 1222, NULL);
INSERT INTO `pcd` VALUES (1228, '舒城县', 'd', 1222, NULL);
INSERT INTO `pcd` VALUES (1229, '金寨县', 'd', 1222, NULL);
INSERT INTO `pcd` VALUES (1230, '其他', 'd', 1222, NULL);
INSERT INTO `pcd` VALUES (1231, '亳州', 'c', 1112, 'A5');
INSERT INTO `pcd` VALUES (1232, '谯城区', 'd', 1231, NULL);
INSERT INTO `pcd` VALUES (1233, '利辛县', 'd', 1231, NULL);
INSERT INTO `pcd` VALUES (1234, '涡阳县', 'd', 1231, NULL);
INSERT INTO `pcd` VALUES (1235, '蒙城县', 'd', 1231, NULL);
INSERT INTO `pcd` VALUES (1236, '其他', 'd', 1231, NULL);
INSERT INTO `pcd` VALUES (1237, '池州', 'c', 1112, 'A5');
INSERT INTO `pcd` VALUES (1238, '贵池区', 'd', 1237, NULL);
INSERT INTO `pcd` VALUES (1239, '东至县', 'd', 1237, NULL);
INSERT INTO `pcd` VALUES (1240, '石台县', 'd', 1237, NULL);
INSERT INTO `pcd` VALUES (1241, '青阳县', 'd', 1237, NULL);
INSERT INTO `pcd` VALUES (1242, '其他', 'd', 1237, NULL);
INSERT INTO `pcd` VALUES (1243, '宣城', 'c', 1112, 'A5');
INSERT INTO `pcd` VALUES (1244, '宣州区', 'd', 1243, NULL);
INSERT INTO `pcd` VALUES (1245, '宁国市', 'd', 1243, NULL);
INSERT INTO `pcd` VALUES (1246, '广德县', 'd', 1243, NULL);
INSERT INTO `pcd` VALUES (1247, '郎溪县', 'd', 1243, NULL);
INSERT INTO `pcd` VALUES (1248, '泾县', 'd', 1243, NULL);
INSERT INTO `pcd` VALUES (1249, '旌德县', 'd', 1243, NULL);
INSERT INTO `pcd` VALUES (1250, '绩溪县', 'd', 1243, NULL);
INSERT INTO `pcd` VALUES (1251, '其他', 'd', 1243, NULL);
INSERT INTO `pcd` VALUES (1252, '其他', 'c', 1112, NULL);
INSERT INTO `pcd` VALUES (1253, '其他', 'd', 1252, NULL);
INSERT INTO `pcd` VALUES (1254, '福建', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (1255, '福州', 'c', 1254, 'A3');
INSERT INTO `pcd` VALUES (1256, '鼓楼区', 'd', 1255, NULL);
INSERT INTO `pcd` VALUES (1257, '台江区', 'd', 1255, NULL);
INSERT INTO `pcd` VALUES (1258, '仓山区', 'd', 1255, NULL);
INSERT INTO `pcd` VALUES (1259, '马尾区', 'd', 1255, NULL);
INSERT INTO `pcd` VALUES (1260, '晋安区', 'd', 1255, NULL);
INSERT INTO `pcd` VALUES (1261, '福清市', 'd', 1255, 'A4');
INSERT INTO `pcd` VALUES (1262, '长乐市', 'd', 1255, 'A4');
INSERT INTO `pcd` VALUES (1263, '闽侯县', 'd', 1255, NULL);
INSERT INTO `pcd` VALUES (1264, '闽清县', 'd', 1255, NULL);
INSERT INTO `pcd` VALUES (1265, '永泰县', 'd', 1255, NULL);
INSERT INTO `pcd` VALUES (1266, '连江县', 'd', 1255, NULL);
INSERT INTO `pcd` VALUES (1267, '罗源县', 'd', 1255, NULL);
INSERT INTO `pcd` VALUES (1268, '平潭县', 'd', 1255, NULL);
INSERT INTO `pcd` VALUES (1269, '其他', 'd', 1255, NULL);
INSERT INTO `pcd` VALUES (1270, '厦门', 'c', 1254, 'A3');
INSERT INTO `pcd` VALUES (1271, '思明区', 'd', 1270, NULL);
INSERT INTO `pcd` VALUES (1272, '海沧区', 'd', 1270, NULL);
INSERT INTO `pcd` VALUES (1273, '湖里区', 'd', 1270, NULL);
INSERT INTO `pcd` VALUES (1274, '集美区', 'd', 1270, NULL);
INSERT INTO `pcd` VALUES (1275, '同安区', 'd', 1270, NULL);
INSERT INTO `pcd` VALUES (1276, '翔安区', 'd', 1270, NULL);
INSERT INTO `pcd` VALUES (1277, '其他', 'd', 1270, NULL);
INSERT INTO `pcd` VALUES (1278, '莆田', 'c', 1254, 'A4');
INSERT INTO `pcd` VALUES (1279, '城厢区', 'd', 1278, NULL);
INSERT INTO `pcd` VALUES (1280, '涵江区', 'd', 1278, NULL);
INSERT INTO `pcd` VALUES (1281, '荔城区', 'd', 1278, NULL);
INSERT INTO `pcd` VALUES (1282, '秀屿区', 'd', 1278, NULL);
INSERT INTO `pcd` VALUES (1283, '仙游县', 'd', 1278, NULL);
INSERT INTO `pcd` VALUES (1284, '其他', 'd', 1278, NULL);
INSERT INTO `pcd` VALUES (1285, '三明', 'c', 1254, 'A4');
INSERT INTO `pcd` VALUES (1286, '梅列区', 'd', 1285, NULL);
INSERT INTO `pcd` VALUES (1287, '三元区', 'd', 1285, NULL);
INSERT INTO `pcd` VALUES (1288, '永安市', 'd', 1285, NULL);
INSERT INTO `pcd` VALUES (1289, '明溪县', 'd', 1285, NULL);
INSERT INTO `pcd` VALUES (1290, '将乐县', 'd', 1285, NULL);
INSERT INTO `pcd` VALUES (1291, '大田县', 'd', 1285, NULL);
INSERT INTO `pcd` VALUES (1292, '宁化县', 'd', 1285, NULL);
INSERT INTO `pcd` VALUES (1293, '建宁县', 'd', 1285, NULL);
INSERT INTO `pcd` VALUES (1294, '沙县', 'd', 1285, NULL);
INSERT INTO `pcd` VALUES (1295, '尤溪县', 'd', 1285, NULL);
INSERT INTO `pcd` VALUES (1296, '清流县', 'd', 1285, NULL);
INSERT INTO `pcd` VALUES (1297, '泰宁县', 'd', 1285, NULL);
INSERT INTO `pcd` VALUES (1298, '其他', 'd', 1285, NULL);
INSERT INTO `pcd` VALUES (1299, '泉州', 'c', 1254, 'A3');
INSERT INTO `pcd` VALUES (1300, '鲤城区', 'd', 1299, NULL);
INSERT INTO `pcd` VALUES (1301, '丰泽区', 'd', 1299, NULL);
INSERT INTO `pcd` VALUES (1302, '洛江区', 'd', 1299, NULL);
INSERT INTO `pcd` VALUES (1303, '泉港区', 'd', 1299, NULL);
INSERT INTO `pcd` VALUES (1304, '石狮市', 'd', 1299, 'A4');
INSERT INTO `pcd` VALUES (1305, '晋江市', 'd', 1299, 'A4');
INSERT INTO `pcd` VALUES (1306, '南安市', 'd', 1299, NULL);
INSERT INTO `pcd` VALUES (1307, '惠安县', 'd', 1299, NULL);
INSERT INTO `pcd` VALUES (1308, '永春县', 'd', 1299, NULL);
INSERT INTO `pcd` VALUES (1309, '安溪县', 'd', 1299, NULL);
INSERT INTO `pcd` VALUES (1310, '德化县', 'd', 1299, NULL);
INSERT INTO `pcd` VALUES (1311, '金门县', 'd', 1299, NULL);
INSERT INTO `pcd` VALUES (1312, '其他', 'd', 1299, NULL);
INSERT INTO `pcd` VALUES (1313, '漳州', 'c', 1254, 'A4');
INSERT INTO `pcd` VALUES (1314, '芗城区', 'd', 1313, NULL);
INSERT INTO `pcd` VALUES (1315, '龙文区', 'd', 1313, NULL);
INSERT INTO `pcd` VALUES (1316, '龙海市', 'd', 1313, NULL);
INSERT INTO `pcd` VALUES (1317, '平和县', 'd', 1313, NULL);
INSERT INTO `pcd` VALUES (1318, '南靖县', 'd', 1313, NULL);
INSERT INTO `pcd` VALUES (1319, '诏安县', 'd', 1313, NULL);
INSERT INTO `pcd` VALUES (1320, '漳浦县', 'd', 1313, NULL);
INSERT INTO `pcd` VALUES (1321, '华安县', 'd', 1313, NULL);
INSERT INTO `pcd` VALUES (1322, '东山县', 'd', 1313, NULL);
INSERT INTO `pcd` VALUES (1323, '长泰县', 'd', 1313, NULL);
INSERT INTO `pcd` VALUES (1324, '云霄县', 'd', 1313, NULL);
INSERT INTO `pcd` VALUES (1325, '其他', 'd', 1313, NULL);
INSERT INTO `pcd` VALUES (1326, '南平', 'c', 1254, 'A4');
INSERT INTO `pcd` VALUES (1327, '延平区', 'd', 1326, NULL);
INSERT INTO `pcd` VALUES (1328, '建瓯市', 'd', 1326, NULL);
INSERT INTO `pcd` VALUES (1329, '邵武市', 'd', 1326, 'A4');
INSERT INTO `pcd` VALUES (1330, '武夷山市', 'd', 1326, NULL);
INSERT INTO `pcd` VALUES (1331, '建阳市', 'd', 1326, NULL);
INSERT INTO `pcd` VALUES (1332, '松溪县', 'd', 1326, NULL);
INSERT INTO `pcd` VALUES (1333, '光泽县', 'd', 1326, NULL);
INSERT INTO `pcd` VALUES (1334, '顺昌县', 'd', 1326, NULL);
INSERT INTO `pcd` VALUES (1335, '浦城县', 'd', 1326, NULL);
INSERT INTO `pcd` VALUES (1336, '政和县', 'd', 1326, NULL);
INSERT INTO `pcd` VALUES (1337, '其他', 'd', 1326, NULL);
INSERT INTO `pcd` VALUES (1338, '龙岩', 'c', 1254, 'A4');
INSERT INTO `pcd` VALUES (1339, '新罗区', 'd', 1338, NULL);
INSERT INTO `pcd` VALUES (1340, '漳平市', 'd', 1338, NULL);
INSERT INTO `pcd` VALUES (1341, '长汀县', 'd', 1338, NULL);
INSERT INTO `pcd` VALUES (1342, '武平县', 'd', 1338, NULL);
INSERT INTO `pcd` VALUES (1343, '上杭县', 'd', 1338, NULL);
INSERT INTO `pcd` VALUES (1344, '永定县', 'd', 1338, NULL);
INSERT INTO `pcd` VALUES (1345, '连城县', 'd', 1338, NULL);
INSERT INTO `pcd` VALUES (1346, '其他', 'd', 1338, NULL);
INSERT INTO `pcd` VALUES (1347, '宁德', 'c', 1254, 'A4');
INSERT INTO `pcd` VALUES (1348, '蕉城区', 'd', 1347, NULL);
INSERT INTO `pcd` VALUES (1349, '福安市', 'd', 1347, NULL);
INSERT INTO `pcd` VALUES (1350, '福鼎市', 'd', 1347, NULL);
INSERT INTO `pcd` VALUES (1351, '寿宁县', 'd', 1347, NULL);
INSERT INTO `pcd` VALUES (1352, '霞浦县', 'd', 1347, NULL);
INSERT INTO `pcd` VALUES (1353, '柘荣县', 'd', 1347, NULL);
INSERT INTO `pcd` VALUES (1354, '屏南县', 'd', 1347, NULL);
INSERT INTO `pcd` VALUES (1355, '古田县', 'd', 1347, NULL);
INSERT INTO `pcd` VALUES (1356, '周宁县', 'd', 1347, NULL);
INSERT INTO `pcd` VALUES (1357, '其他', 'd', 1347, NULL);
INSERT INTO `pcd` VALUES (1358, '其他', 'c', 1254, NULL);
INSERT INTO `pcd` VALUES (1359, '其他', 'd', 1358, NULL);
INSERT INTO `pcd` VALUES (1360, '江西', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (1361, '南昌', 'c', 1360, 'A3');
INSERT INTO `pcd` VALUES (1362, '东湖区', 'd', 1361, NULL);
INSERT INTO `pcd` VALUES (1363, '西湖区', 'd', 1361, NULL);
INSERT INTO `pcd` VALUES (1364, '青云谱区', 'd', 1361, NULL);
INSERT INTO `pcd` VALUES (1365, '湾里区', 'd', 1361, NULL);
INSERT INTO `pcd` VALUES (1366, '青山湖区', 'd', 1361, NULL);
INSERT INTO `pcd` VALUES (1367, '新建县', 'd', 1361, NULL);
INSERT INTO `pcd` VALUES (1368, '南昌县', 'd', 1361, 'A3');
INSERT INTO `pcd` VALUES (1369, '进贤县', 'd', 1361, NULL);
INSERT INTO `pcd` VALUES (1370, '安义县', 'd', 1361, NULL);
INSERT INTO `pcd` VALUES (1371, '其他', 'd', 1361, NULL);
INSERT INTO `pcd` VALUES (1372, '景德镇', 'c', 1360, 'A5');
INSERT INTO `pcd` VALUES (1373, '珠山区', 'd', 1372, NULL);
INSERT INTO `pcd` VALUES (1374, '昌江区', 'd', 1372, NULL);
INSERT INTO `pcd` VALUES (1375, '乐平市', 'd', 1372, NULL);
INSERT INTO `pcd` VALUES (1376, '浮梁县', 'd', 1372, NULL);
INSERT INTO `pcd` VALUES (1377, '其他', 'd', 1372, NULL);
INSERT INTO `pcd` VALUES (1378, '萍乡', 'c', 1360, 'A5');
INSERT INTO `pcd` VALUES (1379, '安源区', 'd', 1378, NULL);
INSERT INTO `pcd` VALUES (1380, '湘东区', 'd', 1378, NULL);
INSERT INTO `pcd` VALUES (1381, '莲花县', 'd', 1378, NULL);
INSERT INTO `pcd` VALUES (1382, '上栗县', 'd', 1378, NULL);
INSERT INTO `pcd` VALUES (1383, '芦溪县', 'd', 1378, NULL);
INSERT INTO `pcd` VALUES (1384, '其他', 'd', 1378, NULL);
INSERT INTO `pcd` VALUES (1385, '九江', 'c', 1360, 'A4');
INSERT INTO `pcd` VALUES (1386, '浔阳区', 'd', 1385, NULL);
INSERT INTO `pcd` VALUES (1387, '庐山区', 'd', 1385, NULL);
INSERT INTO `pcd` VALUES (1388, '瑞昌市', 'd', 1385, NULL);
INSERT INTO `pcd` VALUES (1389, '九江县', 'd', 1385, 'A4');
INSERT INTO `pcd` VALUES (1390, '星子县', 'd', 1385, NULL);
INSERT INTO `pcd` VALUES (1391, '武宁县', 'd', 1385, NULL);
INSERT INTO `pcd` VALUES (1392, '彭泽县', 'd', 1385, NULL);
INSERT INTO `pcd` VALUES (1393, '永修县', 'd', 1385, NULL);
INSERT INTO `pcd` VALUES (1394, '修水县', 'd', 1385, NULL);
INSERT INTO `pcd` VALUES (1395, '湖口县', 'd', 1385, NULL);
INSERT INTO `pcd` VALUES (1396, '德安县', 'd', 1385, NULL);
INSERT INTO `pcd` VALUES (1397, '都昌县', 'd', 1385, NULL);
INSERT INTO `pcd` VALUES (1398, '其他', 'd', 1385, NULL);
INSERT INTO `pcd` VALUES (1399, '新余', 'c', 1360, 'A5');
INSERT INTO `pcd` VALUES (1400, '渝水区', 'd', 1399, NULL);
INSERT INTO `pcd` VALUES (1401, '分宜县', 'd', 1399, NULL);
INSERT INTO `pcd` VALUES (1402, '其他', 'd', 1399, NULL);
INSERT INTO `pcd` VALUES (1403, '鹰潭', 'c', 1360, 'A5');
INSERT INTO `pcd` VALUES (1404, '月湖区', 'd', 1403, NULL);
INSERT INTO `pcd` VALUES (1405, '贵溪市', 'd', 1403, NULL);
INSERT INTO `pcd` VALUES (1406, '余江县', 'd', 1403, NULL);
INSERT INTO `pcd` VALUES (1407, '其他', 'd', 1403, NULL);
INSERT INTO `pcd` VALUES (1408, '赣州', 'c', 1360, 'A4');
INSERT INTO `pcd` VALUES (1409, '章贡区', 'd', 1408, NULL);
INSERT INTO `pcd` VALUES (1410, '瑞金市', 'd', 1408, NULL);
INSERT INTO `pcd` VALUES (1411, '南康市', 'd', 1408, NULL);
INSERT INTO `pcd` VALUES (1412, '石城县', 'd', 1408, NULL);
INSERT INTO `pcd` VALUES (1413, '安远县', 'd', 1408, NULL);
INSERT INTO `pcd` VALUES (1414, '赣县', 'd', 1408, NULL);
INSERT INTO `pcd` VALUES (1415, '宁都县', 'd', 1408, NULL);
INSERT INTO `pcd` VALUES (1416, '寻乌县', 'd', 1408, NULL);
INSERT INTO `pcd` VALUES (1417, '兴国县', 'd', 1408, NULL);
INSERT INTO `pcd` VALUES (1418, '定南县', 'd', 1408, NULL);
INSERT INTO `pcd` VALUES (1419, '上犹县', 'd', 1408, NULL);
INSERT INTO `pcd` VALUES (1420, '于都县', 'd', 1408, NULL);
INSERT INTO `pcd` VALUES (1421, '龙南县', 'd', 1408, NULL);
INSERT INTO `pcd` VALUES (1422, '崇义县', 'd', 1408, NULL);
INSERT INTO `pcd` VALUES (1423, '信丰县', 'd', 1408, NULL);
INSERT INTO `pcd` VALUES (1424, '全南县', 'd', 1408, NULL);
INSERT INTO `pcd` VALUES (1425, '大余县', 'd', 1408, NULL);
INSERT INTO `pcd` VALUES (1426, '会昌县', 'd', 1408, NULL);
INSERT INTO `pcd` VALUES (1427, '其他', 'd', 1408, NULL);
INSERT INTO `pcd` VALUES (1428, '吉安', 'c', 1360, 'A4');
INSERT INTO `pcd` VALUES (1429, '吉州区', 'd', 1428, NULL);
INSERT INTO `pcd` VALUES (1430, '青原区', 'd', 1428, NULL);
INSERT INTO `pcd` VALUES (1431, '井冈山市', 'd', 1428, NULL);
INSERT INTO `pcd` VALUES (1432, '吉安县', 'd', 1428, 'A4');
INSERT INTO `pcd` VALUES (1433, '永丰县', 'd', 1428, NULL);
INSERT INTO `pcd` VALUES (1434, '永新县', 'd', 1428, NULL);
INSERT INTO `pcd` VALUES (1435, '新干县', 'd', 1428, NULL);
INSERT INTO `pcd` VALUES (1436, '泰和县', 'd', 1428, NULL);
INSERT INTO `pcd` VALUES (1437, '峡江县', 'd', 1428, NULL);
INSERT INTO `pcd` VALUES (1438, '遂川县', 'd', 1428, NULL);
INSERT INTO `pcd` VALUES (1439, '安福县', 'd', 1428, NULL);
INSERT INTO `pcd` VALUES (1440, '吉水县', 'd', 1428, NULL);
INSERT INTO `pcd` VALUES (1441, '万安县', 'd', 1428, NULL);
INSERT INTO `pcd` VALUES (1442, '其他', 'd', 1428, NULL);
INSERT INTO `pcd` VALUES (1443, '宜春', 'c', 1360, 'A4');
INSERT INTO `pcd` VALUES (1444, '袁州区', 'd', 1443, NULL);
INSERT INTO `pcd` VALUES (1445, '丰城市', 'd', 1443, NULL);
INSERT INTO `pcd` VALUES (1446, '樟树市', 'd', 1443, NULL);
INSERT INTO `pcd` VALUES (1447, '高安市', 'd', 1443, NULL);
INSERT INTO `pcd` VALUES (1448, '铜鼓县', 'd', 1443, NULL);
INSERT INTO `pcd` VALUES (1449, '靖安县', 'd', 1443, NULL);
INSERT INTO `pcd` VALUES (1450, '宜丰县', 'd', 1443, NULL);
INSERT INTO `pcd` VALUES (1451, '奉新县', 'd', 1443, NULL);
INSERT INTO `pcd` VALUES (1452, '万载县', 'd', 1443, NULL);
INSERT INTO `pcd` VALUES (1453, '上高县', 'd', 1443, NULL);
INSERT INTO `pcd` VALUES (1454, '其他', 'd', 1443, NULL);
INSERT INTO `pcd` VALUES (1455, '抚州', 'c', 1360, 'A5');
INSERT INTO `pcd` VALUES (1456, '临川区', 'd', 1455, NULL);
INSERT INTO `pcd` VALUES (1457, '南丰县', 'd', 1455, NULL);
INSERT INTO `pcd` VALUES (1458, '乐安县', 'd', 1455, NULL);
INSERT INTO `pcd` VALUES (1459, '金溪县', 'd', 1455, NULL);
INSERT INTO `pcd` VALUES (1460, '南城县', 'd', 1455, NULL);
INSERT INTO `pcd` VALUES (1461, '东乡县', 'd', 1455, NULL);
INSERT INTO `pcd` VALUES (1462, '资溪县', 'd', 1455, NULL);
INSERT INTO `pcd` VALUES (1463, '宜黄县', 'd', 1455, NULL);
INSERT INTO `pcd` VALUES (1464, '广昌县', 'd', 1455, NULL);
INSERT INTO `pcd` VALUES (1465, '黎川县', 'd', 1455, NULL);
INSERT INTO `pcd` VALUES (1466, '崇仁县', 'd', 1455, NULL);
INSERT INTO `pcd` VALUES (1467, '其他', 'd', 1455, NULL);
INSERT INTO `pcd` VALUES (1468, '上饶', 'c', 1360, 'A4');
INSERT INTO `pcd` VALUES (1469, '信州区', 'd', 1468, NULL);
INSERT INTO `pcd` VALUES (1470, '德兴市', 'd', 1468, 'A4');
INSERT INTO `pcd` VALUES (1471, '上饶县', 'd', 1468, 'A4');
INSERT INTO `pcd` VALUES (1472, '广丰县', 'd', 1468, NULL);
INSERT INTO `pcd` VALUES (1473, '鄱阳县', 'd', 1468, 'A4');
INSERT INTO `pcd` VALUES (1474, '婺源县', 'd', 1468, NULL);
INSERT INTO `pcd` VALUES (1475, '铅山县', 'd', 1468, NULL);
INSERT INTO `pcd` VALUES (1476, '余干县', 'd', 1468, NULL);
INSERT INTO `pcd` VALUES (1477, '横峰县', 'd', 1468, NULL);
INSERT INTO `pcd` VALUES (1478, '弋阳县', 'd', 1468, NULL);
INSERT INTO `pcd` VALUES (1479, '玉山县', 'd', 1468, NULL);
INSERT INTO `pcd` VALUES (1480, '万年县', 'd', 1468, NULL);
INSERT INTO `pcd` VALUES (1481, '其他', 'd', 1468, NULL);
INSERT INTO `pcd` VALUES (1482, '其他', 'c', 1360, NULL);
INSERT INTO `pcd` VALUES (1483, '其他', 'd', 1482, NULL);
INSERT INTO `pcd` VALUES (1484, '山东', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (1485, '济南', 'c', 1484, 'A3');
INSERT INTO `pcd` VALUES (1486, '市中区', 'd', 1485, NULL);
INSERT INTO `pcd` VALUES (1487, '历下区', 'd', 1485, NULL);
INSERT INTO `pcd` VALUES (1488, '天桥区', 'd', 1485, NULL);
INSERT INTO `pcd` VALUES (1489, '槐荫区', 'd', 1485, NULL);
INSERT INTO `pcd` VALUES (1490, '历城区', 'd', 1485, NULL);
INSERT INTO `pcd` VALUES (1491, '长清区', 'd', 1485, NULL);
INSERT INTO `pcd` VALUES (1492, '章丘市', 'd', 1485, NULL);
INSERT INTO `pcd` VALUES (1493, '平阴县', 'd', 1485, NULL);
INSERT INTO `pcd` VALUES (1494, '济阳县', 'd', 1485, NULL);
INSERT INTO `pcd` VALUES (1495, '商河县', 'd', 1485, NULL);
INSERT INTO `pcd` VALUES (1496, '其他', 'd', 1485, NULL);
INSERT INTO `pcd` VALUES (1497, '青岛', 'c', 1484, 'A3');
INSERT INTO `pcd` VALUES (1498, '市南区', 'd', 1497, NULL);
INSERT INTO `pcd` VALUES (1499, '市北区', 'd', 1497, NULL);
INSERT INTO `pcd` VALUES (1500, '城阳区', 'd', 1497, NULL);
INSERT INTO `pcd` VALUES (1501, '四方区', 'd', 1497, NULL);
INSERT INTO `pcd` VALUES (1502, '李沧区', 'd', 1497, NULL);
INSERT INTO `pcd` VALUES (1503, '黄岛区', 'd', 1497, NULL);
INSERT INTO `pcd` VALUES (1504, '崂山区', 'd', 1497, NULL);
INSERT INTO `pcd` VALUES (1505, '胶南市', 'd', 1497, NULL);
INSERT INTO `pcd` VALUES (1506, '胶州市', 'd', 1497, NULL);
INSERT INTO `pcd` VALUES (1507, '平度市', 'd', 1497, NULL);
INSERT INTO `pcd` VALUES (1508, '莱西市', 'd', 1497, NULL);
INSERT INTO `pcd` VALUES (1509, '即墨市', 'd', 1497, NULL);
INSERT INTO `pcd` VALUES (1510, '其他', 'd', 1497, NULL);
INSERT INTO `pcd` VALUES (1511, '淄博', 'c', 1484, 'A4');
INSERT INTO `pcd` VALUES (1512, '张店区', 'd', 1511, NULL);
INSERT INTO `pcd` VALUES (1513, '临淄区', 'd', 1511, NULL);
INSERT INTO `pcd` VALUES (1514, '淄川区', 'd', 1511, NULL);
INSERT INTO `pcd` VALUES (1515, '博山区', 'd', 1511, NULL);
INSERT INTO `pcd` VALUES (1516, '周村区', 'd', 1511, NULL);
INSERT INTO `pcd` VALUES (1517, '桓台县', 'd', 1511, NULL);
INSERT INTO `pcd` VALUES (1518, '高青县', 'd', 1511, NULL);
INSERT INTO `pcd` VALUES (1519, '沂源县', 'd', 1511, NULL);
INSERT INTO `pcd` VALUES (1520, '其他', 'd', 1511, NULL);
INSERT INTO `pcd` VALUES (1521, '枣庄', 'c', 1484, 'A4');
INSERT INTO `pcd` VALUES (1522, '市中区', 'd', 1521, NULL);
INSERT INTO `pcd` VALUES (1523, '山亭区', 'd', 1521, NULL);
INSERT INTO `pcd` VALUES (1524, '峄城区', 'd', 1521, NULL);
INSERT INTO `pcd` VALUES (1525, '台儿庄区', 'd', 1521, NULL);
INSERT INTO `pcd` VALUES (1526, '薛城区', 'd', 1521, NULL);
INSERT INTO `pcd` VALUES (1527, '滕州市', 'd', 1521, NULL);
INSERT INTO `pcd` VALUES (1528, '其他', 'd', 1521, NULL);
INSERT INTO `pcd` VALUES (1529, '东营', 'c', 1484, 'A4');
INSERT INTO `pcd` VALUES (1530, '东营区', 'd', 1529, 'A4');
INSERT INTO `pcd` VALUES (1531, '河口区', 'd', 1529, NULL);
INSERT INTO `pcd` VALUES (1532, '垦利县', 'd', 1529, NULL);
INSERT INTO `pcd` VALUES (1533, '广饶县', 'd', 1529, NULL);
INSERT INTO `pcd` VALUES (1534, '利津县', 'd', 1529, NULL);
INSERT INTO `pcd` VALUES (1535, '其他', 'd', 1529, NULL);
INSERT INTO `pcd` VALUES (1536, '烟台', 'c', 1484, 'A3');
INSERT INTO `pcd` VALUES (1537, '芝罘区', 'd', 1536, NULL);
INSERT INTO `pcd` VALUES (1538, '福山区', 'd', 1536, NULL);
INSERT INTO `pcd` VALUES (1539, '牟平区', 'd', 1536, NULL);
INSERT INTO `pcd` VALUES (1540, '莱山区', 'd', 1536, NULL);
INSERT INTO `pcd` VALUES (1541, '龙口市', 'd', 1536, NULL);
INSERT INTO `pcd` VALUES (1542, '莱阳市', 'd', 1536, NULL);
INSERT INTO `pcd` VALUES (1543, '莱州市', 'd', 1536, NULL);
INSERT INTO `pcd` VALUES (1544, '招远市', 'd', 1536, NULL);
INSERT INTO `pcd` VALUES (1545, '蓬莱市', 'd', 1536, NULL);
INSERT INTO `pcd` VALUES (1546, '栖霞市', 'd', 1536, NULL);
INSERT INTO `pcd` VALUES (1547, '海阳市', 'd', 1536, NULL);
INSERT INTO `pcd` VALUES (1548, '长岛县', 'd', 1536, NULL);
INSERT INTO `pcd` VALUES (1549, '其他', 'd', 1536, NULL);
INSERT INTO `pcd` VALUES (1550, '潍坊', 'c', 1484, 'A3');
INSERT INTO `pcd` VALUES (1551, '潍城区', 'd', 1550, NULL);
INSERT INTO `pcd` VALUES (1552, '寒亭区', 'd', 1550, NULL);
INSERT INTO `pcd` VALUES (1553, '坊子区', 'd', 1550, NULL);
INSERT INTO `pcd` VALUES (1554, '奎文区', 'd', 1550, NULL);
INSERT INTO `pcd` VALUES (1555, '青州市', 'd', 1550, NULL);
INSERT INTO `pcd` VALUES (1556, '诸城市', 'd', 1550, NULL);
INSERT INTO `pcd` VALUES (1557, '寿光市', 'd', 1550, 'A4');
INSERT INTO `pcd` VALUES (1558, '安丘市', 'd', 1550, NULL);
INSERT INTO `pcd` VALUES (1559, '高密市', 'd', 1550, NULL);
INSERT INTO `pcd` VALUES (1560, '昌邑市', 'd', 1550, NULL);
INSERT INTO `pcd` VALUES (1561, '昌乐县', 'd', 1550, NULL);
INSERT INTO `pcd` VALUES (1562, '临朐县', 'd', 1550, NULL);
INSERT INTO `pcd` VALUES (1563, '其他', 'd', 1550, NULL);
INSERT INTO `pcd` VALUES (1564, '济宁', 'c', 1484, 'A4');
INSERT INTO `pcd` VALUES (1565, '市中区', 'd', 1564, NULL);
INSERT INTO `pcd` VALUES (1566, '任城区', 'd', 1564, NULL);
INSERT INTO `pcd` VALUES (1567, '曲阜市', 'd', 1564, NULL);
INSERT INTO `pcd` VALUES (1568, '兖州市', 'd', 1564, NULL);
INSERT INTO `pcd` VALUES (1569, '邹城市', 'd', 1564, NULL);
INSERT INTO `pcd` VALUES (1570, '鱼台县', 'd', 1564, NULL);
INSERT INTO `pcd` VALUES (1571, '金乡县', 'd', 1564, NULL);
INSERT INTO `pcd` VALUES (1572, '嘉祥县', 'd', 1564, NULL);
INSERT INTO `pcd` VALUES (1573, '微山县', 'd', 1564, NULL);
INSERT INTO `pcd` VALUES (1574, '汶上县', 'd', 1564, NULL);
INSERT INTO `pcd` VALUES (1575, '泗水县', 'd', 1564, NULL);
INSERT INTO `pcd` VALUES (1576, '梁山县', 'd', 1564, NULL);
INSERT INTO `pcd` VALUES (1577, '其他', 'd', 1564, NULL);
INSERT INTO `pcd` VALUES (1578, '泰安', 'c', 1484, 'A4');
INSERT INTO `pcd` VALUES (1579, '泰山区', 'd', 1578, NULL);
INSERT INTO `pcd` VALUES (1580, '岱岳区', 'd', 1578, NULL);
INSERT INTO `pcd` VALUES (1581, '新泰市', 'd', 1578, NULL);
INSERT INTO `pcd` VALUES (1582, '肥城市', 'd', 1578, NULL);
INSERT INTO `pcd` VALUES (1583, '宁阳县', 'd', 1578, NULL);
INSERT INTO `pcd` VALUES (1584, '东平县', 'd', 1578, NULL);
INSERT INTO `pcd` VALUES (1585, '其他', 'd', 1578, NULL);
INSERT INTO `pcd` VALUES (1586, '威海', 'c', 1484, 'A4');
INSERT INTO `pcd` VALUES (1587, '环翠区', 'd', 1586, NULL);
INSERT INTO `pcd` VALUES (1588, '乳山市', 'd', 1586, NULL);
INSERT INTO `pcd` VALUES (1589, '文登市', 'd', 1586, NULL);
INSERT INTO `pcd` VALUES (1590, '荣成市', 'd', 1586, NULL);
INSERT INTO `pcd` VALUES (1591, '其他', 'd', 1586, NULL);
INSERT INTO `pcd` VALUES (1592, '日照', 'c', 1484, 'A4');
INSERT INTO `pcd` VALUES (1593, '东港区', 'd', 1592, NULL);
INSERT INTO `pcd` VALUES (1594, '岚山区', 'd', 1592, NULL);
INSERT INTO `pcd` VALUES (1595, '五莲县', 'd', 1592, NULL);
INSERT INTO `pcd` VALUES (1596, '莒县', 'd', 1592, NULL);
INSERT INTO `pcd` VALUES (1597, '其他', 'd', 1592, NULL);
INSERT INTO `pcd` VALUES (1598, '莱芜', 'c', 1484, 'A5');
INSERT INTO `pcd` VALUES (1599, '莱城区', 'd', 1598, NULL);
INSERT INTO `pcd` VALUES (1600, '钢城区', 'd', 1598, NULL);
INSERT INTO `pcd` VALUES (1601, '其他', 'd', 1598, NULL);
INSERT INTO `pcd` VALUES (1602, '临沂', 'c', 1484, 'A4');
INSERT INTO `pcd` VALUES (1603, '兰山区', 'd', 1602, NULL);
INSERT INTO `pcd` VALUES (1604, '罗庄区', 'd', 1602, NULL);
INSERT INTO `pcd` VALUES (1605, '河东区', 'd', 1602, NULL);
INSERT INTO `pcd` VALUES (1606, '沂南县', 'd', 1602, NULL);
INSERT INTO `pcd` VALUES (1607, '郯城县', 'd', 1602, NULL);
INSERT INTO `pcd` VALUES (1608, '沂水县', 'd', 1602, NULL);
INSERT INTO `pcd` VALUES (1609, '苍山县', 'd', 1602, NULL);
INSERT INTO `pcd` VALUES (1610, '费县', 'd', 1602, NULL);
INSERT INTO `pcd` VALUES (1611, '平邑县', 'd', 1602, NULL);
INSERT INTO `pcd` VALUES (1612, '莒南县', 'd', 1602, NULL);
INSERT INTO `pcd` VALUES (1613, '蒙阴县', 'd', 1602, NULL);
INSERT INTO `pcd` VALUES (1614, '临沭县', 'd', 1602, NULL);
INSERT INTO `pcd` VALUES (1615, '其他', 'd', 1602, NULL);
INSERT INTO `pcd` VALUES (1616, '德州', 'c', 1484, 'A4');
INSERT INTO `pcd` VALUES (1617, '德城区', 'd', 1616, NULL);
INSERT INTO `pcd` VALUES (1618, '乐陵市', 'd', 1616, NULL);
INSERT INTO `pcd` VALUES (1619, '禹城市', 'd', 1616, NULL);
INSERT INTO `pcd` VALUES (1620, '陵县', 'd', 1616, NULL);
INSERT INTO `pcd` VALUES (1621, '宁津县', 'd', 1616, NULL);
INSERT INTO `pcd` VALUES (1622, '齐河县', 'd', 1616, NULL);
INSERT INTO `pcd` VALUES (1623, '武城县', 'd', 1616, NULL);
INSERT INTO `pcd` VALUES (1624, '庆云县', 'd', 1616, NULL);
INSERT INTO `pcd` VALUES (1625, '平原县', 'd', 1616, NULL);
INSERT INTO `pcd` VALUES (1626, '夏津县', 'd', 1616, NULL);
INSERT INTO `pcd` VALUES (1627, '临邑县', 'd', 1616, NULL);
INSERT INTO `pcd` VALUES (1628, '其他', 'd', 1616, NULL);
INSERT INTO `pcd` VALUES (1629, '聊城', 'c', 1484, 'A4');
INSERT INTO `pcd` VALUES (1630, '东昌府区', 'd', 1629, NULL);
INSERT INTO `pcd` VALUES (1631, '临清市', 'd', 1629, NULL);
INSERT INTO `pcd` VALUES (1632, '高唐县', 'd', 1629, NULL);
INSERT INTO `pcd` VALUES (1633, '阳谷县', 'd', 1629, NULL);
INSERT INTO `pcd` VALUES (1634, '茌平县', 'd', 1629, NULL);
INSERT INTO `pcd` VALUES (1635, '莘县', 'd', 1629, NULL);
INSERT INTO `pcd` VALUES (1636, '东阿县', 'd', 1629, NULL);
INSERT INTO `pcd` VALUES (1637, '冠县', 'd', 1629, NULL);
INSERT INTO `pcd` VALUES (1638, '其他', 'd', 1629, NULL);
INSERT INTO `pcd` VALUES (1639, '滨州', 'c', 1484, 'A4');
INSERT INTO `pcd` VALUES (1640, '滨城区', 'd', 1639, NULL);
INSERT INTO `pcd` VALUES (1641, '邹平县', 'd', 1639, NULL);
INSERT INTO `pcd` VALUES (1642, '沾化县', 'd', 1639, NULL);
INSERT INTO `pcd` VALUES (1643, '惠民县', 'd', 1639, NULL);
INSERT INTO `pcd` VALUES (1644, '博兴县', 'd', 1639, NULL);
INSERT INTO `pcd` VALUES (1645, '阳信县', 'd', 1639, NULL);
INSERT INTO `pcd` VALUES (1646, '无棣县', 'd', 1639, NULL);
INSERT INTO `pcd` VALUES (1647, '其他', 'd', 1639, NULL);
INSERT INTO `pcd` VALUES (1648, '菏泽', 'c', 1484, 'A4');
INSERT INTO `pcd` VALUES (1649, '牡丹区', 'd', 1648, NULL);
INSERT INTO `pcd` VALUES (1650, '鄄城县', 'd', 1648, NULL);
INSERT INTO `pcd` VALUES (1651, '单县', 'd', 1648, NULL);
INSERT INTO `pcd` VALUES (1652, '郓城县', 'd', 1648, NULL);
INSERT INTO `pcd` VALUES (1653, '曹县', 'd', 1648, NULL);
INSERT INTO `pcd` VALUES (1654, '定陶县', 'd', 1648, NULL);
INSERT INTO `pcd` VALUES (1655, '巨野县', 'd', 1648, NULL);
INSERT INTO `pcd` VALUES (1656, '东明县', 'd', 1648, NULL);
INSERT INTO `pcd` VALUES (1657, '成武县', 'd', 1648, NULL);
INSERT INTO `pcd` VALUES (1658, '其他', 'd', 1648, NULL);
INSERT INTO `pcd` VALUES (1659, '其他', 'c', 1484, NULL);
INSERT INTO `pcd` VALUES (1660, '其他', 'd', 1659, NULL);
INSERT INTO `pcd` VALUES (1661, '河南', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (1662, '郑州', 'c', 1661, 'A2');
INSERT INTO `pcd` VALUES (1663, '中原区', 'd', 1662, NULL);
INSERT INTO `pcd` VALUES (1664, '金水区', 'd', 1662, NULL);
INSERT INTO `pcd` VALUES (1665, '二七区', 'd', 1662, NULL);
INSERT INTO `pcd` VALUES (1666, '管城回族区', 'd', 1662, NULL);
INSERT INTO `pcd` VALUES (1667, '上街区', 'd', 1662, NULL);
INSERT INTO `pcd` VALUES (1668, '惠济区', 'd', 1662, NULL);
INSERT INTO `pcd` VALUES (1669, '巩义市', 'd', 1662, NULL);
INSERT INTO `pcd` VALUES (1670, '新郑市', 'd', 1662, NULL);
INSERT INTO `pcd` VALUES (1671, '新密市', 'd', 1662, NULL);
INSERT INTO `pcd` VALUES (1672, '登封市', 'd', 1662, NULL);
INSERT INTO `pcd` VALUES (1673, '荥阳市', 'd', 1662, 'A4');
INSERT INTO `pcd` VALUES (1674, '中牟县', 'd', 1662, NULL);
INSERT INTO `pcd` VALUES (1675, '其他', 'd', 1662, NULL);
INSERT INTO `pcd` VALUES (1676, '开封', 'c', 1661, 'A4');
INSERT INTO `pcd` VALUES (1677, '鼓楼区', 'd', 1676, NULL);
INSERT INTO `pcd` VALUES (1678, '龙亭区', 'd', 1676, NULL);
INSERT INTO `pcd` VALUES (1679, '顺河回族区', 'd', 1676, NULL);
INSERT INTO `pcd` VALUES (1680, '禹王台区', 'd', 1676, NULL);
INSERT INTO `pcd` VALUES (1681, '金明区', 'd', 1676, NULL);
INSERT INTO `pcd` VALUES (1682, '开封县', 'd', 1676, 'A4');
INSERT INTO `pcd` VALUES (1683, '尉氏县', 'd', 1676, NULL);
INSERT INTO `pcd` VALUES (1684, '兰考县', 'd', 1676, NULL);
INSERT INTO `pcd` VALUES (1685, '杞县', 'd', 1676, NULL);
INSERT INTO `pcd` VALUES (1686, '通许县', 'd', 1676, NULL);
INSERT INTO `pcd` VALUES (1687, '其他', 'd', 1676, NULL);
INSERT INTO `pcd` VALUES (1688, '洛阳', 'c', 1661, 'A4');
INSERT INTO `pcd` VALUES (1689, '西工区', 'd', 1688, NULL);
INSERT INTO `pcd` VALUES (1690, '老城区', 'd', 1688, NULL);
INSERT INTO `pcd` VALUES (1691, '涧西区', 'd', 1688, NULL);
INSERT INTO `pcd` VALUES (1692, '瀍河回族区', 'd', 1688, NULL);
INSERT INTO `pcd` VALUES (1693, '洛龙区', 'd', 1688, NULL);
INSERT INTO `pcd` VALUES (1694, '吉利区', 'd', 1688, NULL);
INSERT INTO `pcd` VALUES (1695, '偃师市', 'd', 1688, NULL);
INSERT INTO `pcd` VALUES (1696, '孟津县', 'd', 1688, NULL);
INSERT INTO `pcd` VALUES (1697, '汝阳县', 'd', 1688, NULL);
INSERT INTO `pcd` VALUES (1698, '伊川县', 'd', 1688, NULL);
INSERT INTO `pcd` VALUES (1699, '洛宁县', 'd', 1688, NULL);
INSERT INTO `pcd` VALUES (1700, '嵩县', 'd', 1688, NULL);
INSERT INTO `pcd` VALUES (1701, '宜阳县', 'd', 1688, NULL);
INSERT INTO `pcd` VALUES (1702, '新安县', 'd', 1688, NULL);
INSERT INTO `pcd` VALUES (1703, '栾川县', 'd', 1688, NULL);
INSERT INTO `pcd` VALUES (1704, '其他', 'd', 1688, NULL);
INSERT INTO `pcd` VALUES (1705, '平顶山', 'c', 1661, 'A4');
INSERT INTO `pcd` VALUES (1706, '新华区', 'd', 1705, NULL);
INSERT INTO `pcd` VALUES (1707, '卫东区', 'd', 1705, NULL);
INSERT INTO `pcd` VALUES (1708, '湛河区', 'd', 1705, NULL);
INSERT INTO `pcd` VALUES (1709, '石龙区', 'd', 1705, NULL);
INSERT INTO `pcd` VALUES (1710, '汝州市', 'd', 1705, NULL);
INSERT INTO `pcd` VALUES (1711, '舞钢市', 'd', 1705, NULL);
INSERT INTO `pcd` VALUES (1712, '宝丰县', 'd', 1705, NULL);
INSERT INTO `pcd` VALUES (1713, '叶县', 'd', 1705, NULL);
INSERT INTO `pcd` VALUES (1714, '郏县', 'd', 1705, NULL);
INSERT INTO `pcd` VALUES (1715, '鲁山县', 'd', 1705, NULL);
INSERT INTO `pcd` VALUES (1716, '其他', 'd', 1705, NULL);
INSERT INTO `pcd` VALUES (1717, '安阳', 'c', 1661, 'A4');
INSERT INTO `pcd` VALUES (1718, '北关区', 'd', 1717, NULL);
INSERT INTO `pcd` VALUES (1719, '文峰区', 'd', 1717, NULL);
INSERT INTO `pcd` VALUES (1720, '殷都区', 'd', 1717, NULL);
INSERT INTO `pcd` VALUES (1721, '龙安区', 'd', 1717, NULL);
INSERT INTO `pcd` VALUES (1722, '林州市', 'd', 1717, NULL);
INSERT INTO `pcd` VALUES (1723, '安阳县', 'd', 1717, 'A4');
INSERT INTO `pcd` VALUES (1724, '滑县', 'd', 1717, NULL);
INSERT INTO `pcd` VALUES (1725, '内黄县', 'd', 1717, NULL);
INSERT INTO `pcd` VALUES (1726, '汤阴县', 'd', 1717, NULL);
INSERT INTO `pcd` VALUES (1727, '其他', 'd', 1717, NULL);
INSERT INTO `pcd` VALUES (1728, '鹤壁', 'c', 1661, 'A5');
INSERT INTO `pcd` VALUES (1729, '淇滨区', 'd', 1728, NULL);
INSERT INTO `pcd` VALUES (1730, '山城区', 'd', 1728, NULL);
INSERT INTO `pcd` VALUES (1731, '鹤山区', 'd', 1728, NULL);
INSERT INTO `pcd` VALUES (1732, '浚县', 'd', 1728, NULL);
INSERT INTO `pcd` VALUES (1733, '淇县', 'd', 1728, NULL);
INSERT INTO `pcd` VALUES (1734, '其他', 'd', 1728, NULL);
INSERT INTO `pcd` VALUES (1735, '新乡', 'c', 1661, 'A4');
INSERT INTO `pcd` VALUES (1736, '卫滨区', 'd', 1735, NULL);
INSERT INTO `pcd` VALUES (1737, '红旗区', 'd', 1735, NULL);
INSERT INTO `pcd` VALUES (1738, '凤泉区', 'd', 1735, NULL);
INSERT INTO `pcd` VALUES (1739, '牧野区', 'd', 1735, NULL);
INSERT INTO `pcd` VALUES (1740, '卫辉市', 'd', 1735, NULL);
INSERT INTO `pcd` VALUES (1741, '辉县市', 'd', 1735, NULL);
INSERT INTO `pcd` VALUES (1742, '新乡县', 'd', 1735, 'A4');
INSERT INTO `pcd` VALUES (1743, '获嘉县', 'd', 1735, NULL);
INSERT INTO `pcd` VALUES (1744, '原阳县', 'd', 1735, NULL);
INSERT INTO `pcd` VALUES (1745, '长垣县', 'd', 1735, NULL);
INSERT INTO `pcd` VALUES (1746, '封丘县', 'd', 1735, NULL);
INSERT INTO `pcd` VALUES (1747, '延津县', 'd', 1735, NULL);
INSERT INTO `pcd` VALUES (1748, '其他', 'd', 1735, NULL);
INSERT INTO `pcd` VALUES (1749, '焦作', 'c', 1661, 'A4');
INSERT INTO `pcd` VALUES (1750, '解放区', 'd', 1749, NULL);
INSERT INTO `pcd` VALUES (1751, '中站区', 'd', 1749, NULL);
INSERT INTO `pcd` VALUES (1752, '马村区', 'd', 1749, NULL);
INSERT INTO `pcd` VALUES (1753, '山阳区', 'd', 1749, NULL);
INSERT INTO `pcd` VALUES (1754, '沁阳市', 'd', 1749, NULL);
INSERT INTO `pcd` VALUES (1755, '孟州市', 'd', 1749, NULL);
INSERT INTO `pcd` VALUES (1756, '修武县', 'd', 1749, NULL);
INSERT INTO `pcd` VALUES (1757, '温县', 'd', 1749, NULL);
INSERT INTO `pcd` VALUES (1758, '武陟县', 'd', 1749, NULL);
INSERT INTO `pcd` VALUES (1759, '博爱县', 'd', 1749, NULL);
INSERT INTO `pcd` VALUES (1760, '其他', 'd', 1749, NULL);
INSERT INTO `pcd` VALUES (1761, '濮阳', 'c', 1661, 'A4');
INSERT INTO `pcd` VALUES (1762, '华龙区', 'd', 1761, NULL);
INSERT INTO `pcd` VALUES (1763, '濮阳县', 'd', 1761, 'A4');
INSERT INTO `pcd` VALUES (1764, '南乐县', 'd', 1761, NULL);
INSERT INTO `pcd` VALUES (1765, '台前县', 'd', 1761, NULL);
INSERT INTO `pcd` VALUES (1766, '清丰县', 'd', 1761, NULL);
INSERT INTO `pcd` VALUES (1767, '范县', 'd', 1761, NULL);
INSERT INTO `pcd` VALUES (1768, '其他', 'd', 1761, NULL);
INSERT INTO `pcd` VALUES (1769, '许昌', 'c', 1661, 'A4');
INSERT INTO `pcd` VALUES (1770, '魏都区', 'd', 1769, NULL);
INSERT INTO `pcd` VALUES (1771, '禹州市', 'd', 1769, NULL);
INSERT INTO `pcd` VALUES (1772, '长葛市', 'd', 1769, NULL);
INSERT INTO `pcd` VALUES (1773, '许昌县', 'd', 1769, 'A4');
INSERT INTO `pcd` VALUES (1774, '鄢陵县', 'd', 1769, NULL);
INSERT INTO `pcd` VALUES (1775, '襄城县', 'd', 1769, NULL);
INSERT INTO `pcd` VALUES (1776, '其他', 'd', 1769, NULL);
INSERT INTO `pcd` VALUES (1777, '漯河', 'c', 1661, 'A5');
INSERT INTO `pcd` VALUES (1778, '源汇区', 'd', 1777, NULL);
INSERT INTO `pcd` VALUES (1779, '郾城区', 'd', 1777, NULL);
INSERT INTO `pcd` VALUES (1780, '召陵区', 'd', 1777, NULL);
INSERT INTO `pcd` VALUES (1781, '临颍县', 'd', 1777, NULL);
INSERT INTO `pcd` VALUES (1782, '舞阳县', 'd', 1777, NULL);
INSERT INTO `pcd` VALUES (1783, '其他', 'd', 1777, NULL);
INSERT INTO `pcd` VALUES (1784, '三门峡', 'c', 1661, 'A4');
INSERT INTO `pcd` VALUES (1785, '湖滨区', 'd', 1784, NULL);
INSERT INTO `pcd` VALUES (1786, '义马市', 'd', 1784, NULL);
INSERT INTO `pcd` VALUES (1787, '灵宝市', 'd', 1784, NULL);
INSERT INTO `pcd` VALUES (1788, '渑池县', 'd', 1784, NULL);
INSERT INTO `pcd` VALUES (1789, '卢氏县', 'd', 1784, NULL);
INSERT INTO `pcd` VALUES (1790, '陕县', 'd', 1784, NULL);
INSERT INTO `pcd` VALUES (1791, '其他', 'd', 1784, NULL);
INSERT INTO `pcd` VALUES (1792, '南阳', 'c', 1661, 'A4');
INSERT INTO `pcd` VALUES (1793, '卧龙区', 'd', 1792, NULL);
INSERT INTO `pcd` VALUES (1794, '宛城区', 'd', 1792, NULL);
INSERT INTO `pcd` VALUES (1795, '邓州市', 'd', 1792, NULL);
INSERT INTO `pcd` VALUES (1796, '桐柏县', 'd', 1792, NULL);
INSERT INTO `pcd` VALUES (1797, '方城县', 'd', 1792, NULL);
INSERT INTO `pcd` VALUES (1798, '淅川县', 'd', 1792, NULL);
INSERT INTO `pcd` VALUES (1799, '镇平县', 'd', 1792, NULL);
INSERT INTO `pcd` VALUES (1800, '唐河县', 'd', 1792, NULL);
INSERT INTO `pcd` VALUES (1801, '南召县', 'd', 1792, NULL);
INSERT INTO `pcd` VALUES (1802, '内乡县', 'd', 1792, NULL);
INSERT INTO `pcd` VALUES (1803, '新野县', 'd', 1792, NULL);
INSERT INTO `pcd` VALUES (1804, '社旗县', 'd', 1792, NULL);
INSERT INTO `pcd` VALUES (1805, '西峡县', 'd', 1792, NULL);
INSERT INTO `pcd` VALUES (1806, '其他', 'd', 1792, NULL);
INSERT INTO `pcd` VALUES (1807, '商丘', 'c', 1661, 'A4');
INSERT INTO `pcd` VALUES (1808, '梁园区', 'd', 1807, NULL);
INSERT INTO `pcd` VALUES (1809, '睢阳区', 'd', 1807, NULL);
INSERT INTO `pcd` VALUES (1810, '永城市', 'd', 1807, NULL);
INSERT INTO `pcd` VALUES (1811, '宁陵县', 'd', 1807, NULL);
INSERT INTO `pcd` VALUES (1812, '虞城县', 'd', 1807, NULL);
INSERT INTO `pcd` VALUES (1813, '民权县', 'd', 1807, NULL);
INSERT INTO `pcd` VALUES (1814, '夏邑县', 'd', 1807, NULL);
INSERT INTO `pcd` VALUES (1815, '柘城县', 'd', 1807, NULL);
INSERT INTO `pcd` VALUES (1816, '睢县', 'd', 1807, NULL);
INSERT INTO `pcd` VALUES (1817, '其他', 'd', 1807, NULL);
INSERT INTO `pcd` VALUES (1818, '信阳', 'c', 1661, 'A4');
INSERT INTO `pcd` VALUES (1819, '浉河区', 'd', 1818, NULL);
INSERT INTO `pcd` VALUES (1820, '平桥区', 'd', 1818, NULL);
INSERT INTO `pcd` VALUES (1821, '潢川县', 'd', 1818, NULL);
INSERT INTO `pcd` VALUES (1822, '淮滨县', 'd', 1818, NULL);
INSERT INTO `pcd` VALUES (1823, '息县', 'd', 1818, NULL);
INSERT INTO `pcd` VALUES (1824, '新县', 'd', 1818, NULL);
INSERT INTO `pcd` VALUES (1825, '商城县', 'd', 1818, NULL);
INSERT INTO `pcd` VALUES (1826, '固始县', 'd', 1818, NULL);
INSERT INTO `pcd` VALUES (1827, '罗山县', 'd', 1818, NULL);
INSERT INTO `pcd` VALUES (1828, '光山县', 'd', 1818, NULL);
INSERT INTO `pcd` VALUES (1829, '其他', 'd', 1818, NULL);
INSERT INTO `pcd` VALUES (1830, '周口', 'c', 1661, 'A4');
INSERT INTO `pcd` VALUES (1831, '川汇区', 'd', 1830, NULL);
INSERT INTO `pcd` VALUES (1832, '项城市', 'd', 1830, NULL);
INSERT INTO `pcd` VALUES (1833, '商水县', 'd', 1830, NULL);
INSERT INTO `pcd` VALUES (1834, '淮阳县', 'd', 1830, NULL);
INSERT INTO `pcd` VALUES (1835, '太康县', 'd', 1830, NULL);
INSERT INTO `pcd` VALUES (1836, '鹿邑县', 'd', 1830, NULL);
INSERT INTO `pcd` VALUES (1837, '西华县', 'd', 1830, NULL);
INSERT INTO `pcd` VALUES (1838, '扶沟县', 'd', 1830, NULL);
INSERT INTO `pcd` VALUES (1839, '沈丘县', 'd', 1830, NULL);
INSERT INTO `pcd` VALUES (1840, '郸城县', 'd', 1830, NULL);
INSERT INTO `pcd` VALUES (1841, '其他', 'd', 1830, NULL);
INSERT INTO `pcd` VALUES (1842, '驻马店', 'c', 1661, 'A4');
INSERT INTO `pcd` VALUES (1843, '驿城区', 'd', 1842, NULL);
INSERT INTO `pcd` VALUES (1844, '确山县', 'd', 1842, NULL);
INSERT INTO `pcd` VALUES (1845, '新蔡县', 'd', 1842, NULL);
INSERT INTO `pcd` VALUES (1846, '上蔡县', 'd', 1842, NULL);
INSERT INTO `pcd` VALUES (1847, '西平县', 'd', 1842, NULL);
INSERT INTO `pcd` VALUES (1848, '泌阳县', 'd', 1842, NULL);
INSERT INTO `pcd` VALUES (1849, '平舆县', 'd', 1842, NULL);
INSERT INTO `pcd` VALUES (1850, '汝南县', 'd', 1842, NULL);
INSERT INTO `pcd` VALUES (1851, '遂平县', 'd', 1842, NULL);
INSERT INTO `pcd` VALUES (1852, '正阳县', 'd', 1842, NULL);
INSERT INTO `pcd` VALUES (1853, '其他', 'd', 1842, NULL);
INSERT INTO `pcd` VALUES (1855, '济源市', 'd', 1854, NULL);
INSERT INTO `pcd` VALUES (1856, '其他', 'd', 1854, NULL);
INSERT INTO `pcd` VALUES (1857, '其他', 'c', 1661, NULL);
INSERT INTO `pcd` VALUES (1858, '其他', 'd', 1857, NULL);
INSERT INTO `pcd` VALUES (1859, '湖北', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (1860, '武汉', 'c', 1859, 'A2');
INSERT INTO `pcd` VALUES (1861, '江岸区', 'd', 1860, NULL);
INSERT INTO `pcd` VALUES (1862, '武昌区', 'd', 1860, NULL);
INSERT INTO `pcd` VALUES (1863, '江汉区', 'd', 1860, NULL);
INSERT INTO `pcd` VALUES (1864, '硚口区', 'd', 1860, NULL);
INSERT INTO `pcd` VALUES (1865, '汉阳区', 'd', 1860, NULL);
INSERT INTO `pcd` VALUES (1866, '青山区', 'd', 1860, NULL);
INSERT INTO `pcd` VALUES (1867, '洪山区', 'd', 1860, NULL);
INSERT INTO `pcd` VALUES (1868, '东西湖区', 'd', 1860, NULL);
INSERT INTO `pcd` VALUES (1869, '汉南区', 'd', 1860, NULL);
INSERT INTO `pcd` VALUES (1870, '蔡甸区', 'd', 1860, NULL);
INSERT INTO `pcd` VALUES (1871, '江夏区', 'd', 1860, NULL);
INSERT INTO `pcd` VALUES (1872, '黄陂区', 'd', 1860, NULL);
INSERT INTO `pcd` VALUES (1873, '新洲区', 'd', 1860, NULL);
INSERT INTO `pcd` VALUES (1874, '其他', 'd', 1860, NULL);
INSERT INTO `pcd` VALUES (1875, '黄石', 'c', 1859, 'A4');
INSERT INTO `pcd` VALUES (1876, '黄石港区', 'd', 1875, 'A4');
INSERT INTO `pcd` VALUES (1877, '西塞山区', 'd', 1875, NULL);
INSERT INTO `pcd` VALUES (1878, '下陆区', 'd', 1875, NULL);
INSERT INTO `pcd` VALUES (1879, '铁山区', 'd', 1875, NULL);
INSERT INTO `pcd` VALUES (1880, '大冶市', 'd', 1875, NULL);
INSERT INTO `pcd` VALUES (1881, '阳新县', 'd', 1875, NULL);
INSERT INTO `pcd` VALUES (1882, '其他', 'd', 1875, NULL);
INSERT INTO `pcd` VALUES (1883, '十堰', 'c', 1859, 'A4');
INSERT INTO `pcd` VALUES (1884, '张湾区', 'd', 1883, NULL);
INSERT INTO `pcd` VALUES (1885, '茅箭区', 'd', 1883, NULL);
INSERT INTO `pcd` VALUES (1886, '丹江口市', 'd', 1883, NULL);
INSERT INTO `pcd` VALUES (1887, '郧县', 'd', 1883, NULL);
INSERT INTO `pcd` VALUES (1888, '竹山县', 'd', 1883, NULL);
INSERT INTO `pcd` VALUES (1889, '房县', 'd', 1883, NULL);
INSERT INTO `pcd` VALUES (1890, '郧西县', 'd', 1883, NULL);
INSERT INTO `pcd` VALUES (1891, '竹溪县', 'd', 1883, NULL);
INSERT INTO `pcd` VALUES (1892, '其他', 'd', 1883, NULL);
INSERT INTO `pcd` VALUES (1893, '荆州', 'c', 1859, 'A4');
INSERT INTO `pcd` VALUES (1894, '沙市区', 'd', 1893, NULL);
INSERT INTO `pcd` VALUES (1895, '荆州区', 'd', 1893, 'A4');
INSERT INTO `pcd` VALUES (1896, '洪湖市', 'd', 1893, NULL);
INSERT INTO `pcd` VALUES (1897, '石首市', 'd', 1893, NULL);
INSERT INTO `pcd` VALUES (1898, '松滋市', 'd', 1893, NULL);
INSERT INTO `pcd` VALUES (1899, '监利县', 'd', 1893, NULL);
INSERT INTO `pcd` VALUES (1900, '公安县', 'd', 1893, NULL);
INSERT INTO `pcd` VALUES (1901, '江陵县', 'd', 1893, NULL);
INSERT INTO `pcd` VALUES (1902, '其他', 'd', 1893, NULL);
INSERT INTO `pcd` VALUES (1903, '宜昌', 'c', 1859, 'A4');
INSERT INTO `pcd` VALUES (1904, '西陵区', 'd', 1903, NULL);
INSERT INTO `pcd` VALUES (1905, '伍家岗区', 'd', 1903, NULL);
INSERT INTO `pcd` VALUES (1906, '点军区', 'd', 1903, NULL);
INSERT INTO `pcd` VALUES (1907, '猇亭区', 'd', 1903, NULL);
INSERT INTO `pcd` VALUES (1908, '夷陵区', 'd', 1903, NULL);
INSERT INTO `pcd` VALUES (1909, '宜都市', 'd', 1903, NULL);
INSERT INTO `pcd` VALUES (1910, '当阳市', 'd', 1903, NULL);
INSERT INTO `pcd` VALUES (1911, '枝江市', 'd', 1903, NULL);
INSERT INTO `pcd` VALUES (1912, '秭归县', 'd', 1903, NULL);
INSERT INTO `pcd` VALUES (1913, '远安县', 'd', 1903, NULL);
INSERT INTO `pcd` VALUES (1914, '兴山县', 'd', 1903, NULL);
INSERT INTO `pcd` VALUES (1915, '五峰土家族自治县', 'd', 1903, NULL);
INSERT INTO `pcd` VALUES (1916, '长阳土家族自治县', 'd', 1903, NULL);
INSERT INTO `pcd` VALUES (1917, '其他', 'd', 1903, NULL);
INSERT INTO `pcd` VALUES (1918, '襄樊', 'c', 1859, NULL);
INSERT INTO `pcd` VALUES (1919, '襄城区', 'd', 1918, NULL);
INSERT INTO `pcd` VALUES (1920, '樊城区', 'd', 1918, NULL);
INSERT INTO `pcd` VALUES (1921, '襄阳区', 'd', 1918, 'A4');
INSERT INTO `pcd` VALUES (1922, '老河口市', 'd', 1918, NULL);
INSERT INTO `pcd` VALUES (1923, '枣阳市', 'd', 1918, NULL);
INSERT INTO `pcd` VALUES (1924, '宜城市', 'd', 1918, NULL);
INSERT INTO `pcd` VALUES (1925, '南漳县', 'd', 1918, NULL);
INSERT INTO `pcd` VALUES (1926, '谷城县', 'd', 1918, NULL);
INSERT INTO `pcd` VALUES (1927, '保康县', 'd', 1918, NULL);
INSERT INTO `pcd` VALUES (1928, '其他', 'd', 1918, NULL);
INSERT INTO `pcd` VALUES (1929, '鄂州', 'c', 1859, 'A5');
INSERT INTO `pcd` VALUES (1930, '鄂城区', 'd', 1929, NULL);
INSERT INTO `pcd` VALUES (1931, '华容区', 'd', 1929, NULL);
INSERT INTO `pcd` VALUES (1932, '梁子湖区', 'd', 1929, NULL);
INSERT INTO `pcd` VALUES (1933, '其他', 'd', 1929, NULL);
INSERT INTO `pcd` VALUES (1934, '荆门', 'c', 1859, 'A4');
INSERT INTO `pcd` VALUES (1935, '东宝区', 'd', 1934, NULL);
INSERT INTO `pcd` VALUES (1936, '掇刀区', 'd', 1934, NULL);
INSERT INTO `pcd` VALUES (1937, '钟祥市', 'd', 1934, 'A4');
INSERT INTO `pcd` VALUES (1938, '京山县', 'd', 1934, NULL);
INSERT INTO `pcd` VALUES (1939, '沙洋县', 'd', 1934, NULL);
INSERT INTO `pcd` VALUES (1940, '其他', 'd', 1934, NULL);
INSERT INTO `pcd` VALUES (1941, '孝感', 'c', 1859, 'A4');
INSERT INTO `pcd` VALUES (1942, '孝南区', 'd', 1941, NULL);
INSERT INTO `pcd` VALUES (1943, '应城市', 'd', 1941, NULL);
INSERT INTO `pcd` VALUES (1944, '安陆市', 'd', 1941, NULL);
INSERT INTO `pcd` VALUES (1945, '汉川市', 'd', 1941, NULL);
INSERT INTO `pcd` VALUES (1946, '云梦县', 'd', 1941, NULL);
INSERT INTO `pcd` VALUES (1947, '大悟县', 'd', 1941, NULL);
INSERT INTO `pcd` VALUES (1948, '孝昌县', 'd', 1941, NULL);
INSERT INTO `pcd` VALUES (1949, '其他', 'd', 1941, NULL);
INSERT INTO `pcd` VALUES (1950, '黄冈', 'c', 1859, 'A4');
INSERT INTO `pcd` VALUES (1951, '黄州区', 'd', 1950, NULL);
INSERT INTO `pcd` VALUES (1952, '麻城市', 'd', 1950, 'A4');
INSERT INTO `pcd` VALUES (1953, '武穴市', 'd', 1950, NULL);
INSERT INTO `pcd` VALUES (1954, '红安县', 'd', 1950, NULL);
INSERT INTO `pcd` VALUES (1955, '罗田县', 'd', 1950, NULL);
INSERT INTO `pcd` VALUES (1956, '浠水县', 'd', 1950, NULL);
INSERT INTO `pcd` VALUES (1957, '蕲春县', 'd', 1950, NULL);
INSERT INTO `pcd` VALUES (1958, '黄梅县', 'd', 1950, NULL);
INSERT INTO `pcd` VALUES (1959, '英山县', 'd', 1950, NULL);
INSERT INTO `pcd` VALUES (1960, '团风县', 'd', 1950, NULL);
INSERT INTO `pcd` VALUES (1961, '其他', 'd', 1950, NULL);
INSERT INTO `pcd` VALUES (1962, '咸宁', 'c', 1859, 'A5');
INSERT INTO `pcd` VALUES (1963, '咸安区', 'd', 1962, NULL);
INSERT INTO `pcd` VALUES (1964, '赤壁市', 'd', 1962, NULL);
INSERT INTO `pcd` VALUES (1965, '嘉鱼县', 'd', 1962, NULL);
INSERT INTO `pcd` VALUES (1966, '通山县', 'd', 1962, NULL);
INSERT INTO `pcd` VALUES (1967, '崇阳县', 'd', 1962, NULL);
INSERT INTO `pcd` VALUES (1968, '通城县', 'd', 1962, NULL);
INSERT INTO `pcd` VALUES (1969, '其他', 'd', 1962, NULL);
INSERT INTO `pcd` VALUES (1970, '随州', 'c', 1859, 'A5');
INSERT INTO `pcd` VALUES (1971, '曾都区', 'd', 1970, NULL);
INSERT INTO `pcd` VALUES (1972, '广水市', 'd', 1970, NULL);
INSERT INTO `pcd` VALUES (1973, '其他', 'd', 1970, NULL);
INSERT INTO `pcd` VALUES (1974, '恩施土家族苗族自治州', 'c', 1859, 'A5');
INSERT INTO `pcd` VALUES (1975, '恩施市', 'd', 1974, NULL);
INSERT INTO `pcd` VALUES (1976, '利川市', 'd', 1974, NULL);
INSERT INTO `pcd` VALUES (1977, '建始县', 'd', 1974, NULL);
INSERT INTO `pcd` VALUES (1978, '来凤县', 'd', 1974, NULL);
INSERT INTO `pcd` VALUES (1979, '巴东县', 'd', 1974, NULL);
INSERT INTO `pcd` VALUES (1980, '鹤峰县', 'd', 1974, NULL);
INSERT INTO `pcd` VALUES (1981, '宣恩县', 'd', 1974, NULL);
INSERT INTO `pcd` VALUES (1982, '咸丰县', 'd', 1974, NULL);
INSERT INTO `pcd` VALUES (1983, '其他', 'd', 1974, NULL);
INSERT INTO `pcd` VALUES (1984, '仙桃', 'c', 1859, 'A5');
INSERT INTO `pcd` VALUES (1985, '仙桃', 'd', 1984, 'A5');
INSERT INTO `pcd` VALUES (1986, '天门', 'c', 1859, NULL);
INSERT INTO `pcd` VALUES (1987, '天门', 'd', 1986, NULL);
INSERT INTO `pcd` VALUES (1988, '潜江', 'c', 1859, NULL);
INSERT INTO `pcd` VALUES (1989, '潜江', 'd', 1988, NULL);
INSERT INTO `pcd` VALUES (1990, '神农架林区', 'c', 1859, NULL);
INSERT INTO `pcd` VALUES (1991, '神农架林区', 'd', 1990, NULL);
INSERT INTO `pcd` VALUES (1992, '其他', 'c', 1859, NULL);
INSERT INTO `pcd` VALUES (1993, '其他', 'd', 1992, NULL);
INSERT INTO `pcd` VALUES (1994, '湖南', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (1995, '长沙', 'c', 1994, 'A3');
INSERT INTO `pcd` VALUES (1996, '岳麓区', 'd', 1995, NULL);
INSERT INTO `pcd` VALUES (1997, '芙蓉区', 'd', 1995, NULL);
INSERT INTO `pcd` VALUES (1998, '天心区', 'd', 1995, NULL);
INSERT INTO `pcd` VALUES (1999, '开福区', 'd', 1995, NULL);
INSERT INTO `pcd` VALUES (2000, '雨花区', 'd', 1995, NULL);
INSERT INTO `pcd` VALUES (2001, '浏阳市', 'd', 1995, 'A4');
INSERT INTO `pcd` VALUES (2002, '长沙县', 'd', 1995, 'A3');
INSERT INTO `pcd` VALUES (2003, '望城县', 'd', 1995, NULL);
INSERT INTO `pcd` VALUES (2004, '宁乡县', 'd', 1995, NULL);
INSERT INTO `pcd` VALUES (2005, '其他', 'd', 1995, NULL);
INSERT INTO `pcd` VALUES (2006, '株洲', 'c', 1994, 'A4');
INSERT INTO `pcd` VALUES (2007, '天元区', 'd', 2006, NULL);
INSERT INTO `pcd` VALUES (2008, '荷塘区', 'd', 2006, NULL);
INSERT INTO `pcd` VALUES (2009, '芦淞区', 'd', 2006, NULL);
INSERT INTO `pcd` VALUES (2010, '石峰区', 'd', 2006, NULL);
INSERT INTO `pcd` VALUES (2011, '醴陵市', 'd', 2006, NULL);
INSERT INTO `pcd` VALUES (2012, '株洲县', 'd', 2006, 'A4');
INSERT INTO `pcd` VALUES (2013, '炎陵县', 'd', 2006, NULL);
INSERT INTO `pcd` VALUES (2014, '茶陵县', 'd', 2006, NULL);
INSERT INTO `pcd` VALUES (2015, '攸县', 'd', 2006, NULL);
INSERT INTO `pcd` VALUES (2016, '其他', 'd', 2006, NULL);
INSERT INTO `pcd` VALUES (2017, '湘潭', 'c', 1994, 'A4');
INSERT INTO `pcd` VALUES (2018, '岳塘区', 'd', 2017, NULL);
INSERT INTO `pcd` VALUES (2019, '雨湖区', 'd', 2017, NULL);
INSERT INTO `pcd` VALUES (2020, '湘乡市', 'd', 2017, NULL);
INSERT INTO `pcd` VALUES (2021, '韶山市', 'd', 2017, NULL);
INSERT INTO `pcd` VALUES (2022, '湘潭县', 'd', 2017, 'A4');
INSERT INTO `pcd` VALUES (2023, '其他', 'd', 2017, NULL);
INSERT INTO `pcd` VALUES (2024, '衡阳', 'c', 1994, 'A4');
INSERT INTO `pcd` VALUES (2025, '雁峰区', 'd', 2024, NULL);
INSERT INTO `pcd` VALUES (2026, '珠晖区', 'd', 2024, NULL);
INSERT INTO `pcd` VALUES (2027, '石鼓区', 'd', 2024, NULL);
INSERT INTO `pcd` VALUES (2028, '蒸湘区', 'd', 2024, NULL);
INSERT INTO `pcd` VALUES (2029, '南岳区', 'd', 2024, NULL);
INSERT INTO `pcd` VALUES (2030, '耒阳市', 'd', 2024, NULL);
INSERT INTO `pcd` VALUES (2031, '常宁市', 'd', 2024, NULL);
INSERT INTO `pcd` VALUES (2032, '衡阳县', 'd', 2024, 'A4');
INSERT INTO `pcd` VALUES (2033, '衡东县', 'd', 2024, NULL);
INSERT INTO `pcd` VALUES (2034, '衡山县', 'd', 2024, NULL);
INSERT INTO `pcd` VALUES (2035, '衡南县', 'd', 2024, NULL);
INSERT INTO `pcd` VALUES (2036, '祁东县', 'd', 2024, NULL);
INSERT INTO `pcd` VALUES (2037, '其他', 'd', 2024, NULL);
INSERT INTO `pcd` VALUES (2038, '邵阳', 'c', 1994, 'A4');
INSERT INTO `pcd` VALUES (2039, '双清区', 'd', 2038, NULL);
INSERT INTO `pcd` VALUES (2040, '大祥区', 'd', 2038, NULL);
INSERT INTO `pcd` VALUES (2041, '北塔区', 'd', 2038, NULL);
INSERT INTO `pcd` VALUES (2042, '武冈市', 'd', 2038, NULL);
INSERT INTO `pcd` VALUES (2043, '邵东县', 'd', 2038, NULL);
INSERT INTO `pcd` VALUES (2044, '洞口县', 'd', 2038, NULL);
INSERT INTO `pcd` VALUES (2045, '新邵县', 'd', 2038, NULL);
INSERT INTO `pcd` VALUES (2046, '绥宁县', 'd', 2038, NULL);
INSERT INTO `pcd` VALUES (2047, '新宁县', 'd', 2038, NULL);
INSERT INTO `pcd` VALUES (2048, '邵阳县', 'd', 2038, 'A4');
INSERT INTO `pcd` VALUES (2049, '隆回县', 'd', 2038, NULL);
INSERT INTO `pcd` VALUES (2050, '城步苗族自治县', 'd', 2038, NULL);
INSERT INTO `pcd` VALUES (2051, '其他', 'd', 2038, NULL);
INSERT INTO `pcd` VALUES (2052, '岳阳', 'c', 1994, 'A4');
INSERT INTO `pcd` VALUES (2053, '岳阳楼区', 'd', 2052, 'A4');
INSERT INTO `pcd` VALUES (2054, '云溪区', 'd', 2052, NULL);
INSERT INTO `pcd` VALUES (2055, '君山区', 'd', 2052, NULL);
INSERT INTO `pcd` VALUES (2056, '临湘市', 'd', 2052, NULL);
INSERT INTO `pcd` VALUES (2057, '汨罗市', 'd', 2052, NULL);
INSERT INTO `pcd` VALUES (2058, '岳阳县', 'd', 2052, 'A4');
INSERT INTO `pcd` VALUES (2059, '湘阴县', 'd', 2052, NULL);
INSERT INTO `pcd` VALUES (2060, '平江县', 'd', 2052, NULL);
INSERT INTO `pcd` VALUES (2061, '华容县', 'd', 2052, NULL);
INSERT INTO `pcd` VALUES (2062, '其他', 'd', 2052, NULL);
INSERT INTO `pcd` VALUES (2063, '常德', 'c', 1994, 'A4');
INSERT INTO `pcd` VALUES (2064, '武陵区', 'd', 2063, NULL);
INSERT INTO `pcd` VALUES (2065, '鼎城区', 'd', 2063, NULL);
INSERT INTO `pcd` VALUES (2066, '津市市', 'd', 2063, NULL);
INSERT INTO `pcd` VALUES (2067, '澧县', 'd', 2063, NULL);
INSERT INTO `pcd` VALUES (2068, '临澧县', 'd', 2063, NULL);
INSERT INTO `pcd` VALUES (2069, '桃源县', 'd', 2063, NULL);
INSERT INTO `pcd` VALUES (2070, '汉寿县', 'd', 2063, NULL);
INSERT INTO `pcd` VALUES (2071, '安乡县', 'd', 2063, NULL);
INSERT INTO `pcd` VALUES (2072, '石门县', 'd', 2063, NULL);
INSERT INTO `pcd` VALUES (2073, '其他', 'd', 2063, NULL);
INSERT INTO `pcd` VALUES (2074, '张家界', 'c', 1994, 'A5');
INSERT INTO `pcd` VALUES (2075, '永定区', 'd', 2074, NULL);
INSERT INTO `pcd` VALUES (2076, '武陵源区', 'd', 2074, NULL);
INSERT INTO `pcd` VALUES (2077, '慈利县', 'd', 2074, NULL);
INSERT INTO `pcd` VALUES (2078, '桑植县', 'd', 2074, NULL);
INSERT INTO `pcd` VALUES (2079, '其他', 'd', 2074, NULL);
INSERT INTO `pcd` VALUES (2080, '益阳', 'c', 1994, 'A4');
INSERT INTO `pcd` VALUES (2081, '赫山区', 'd', 2080, NULL);
INSERT INTO `pcd` VALUES (2082, '资阳区', 'd', 2080, 'A5');
INSERT INTO `pcd` VALUES (2083, '沅江市', 'd', 2080, NULL);
INSERT INTO `pcd` VALUES (2084, '桃江县', 'd', 2080, NULL);
INSERT INTO `pcd` VALUES (2085, '南县', 'd', 2080, NULL);
INSERT INTO `pcd` VALUES (2086, '安化县', 'd', 2080, NULL);
INSERT INTO `pcd` VALUES (2087, '其他', 'd', 2080, NULL);
INSERT INTO `pcd` VALUES (2088, '郴州', 'c', 1994, 'A4');
INSERT INTO `pcd` VALUES (2089, '北湖区', 'd', 2088, NULL);
INSERT INTO `pcd` VALUES (2090, '苏仙区', 'd', 2088, NULL);
INSERT INTO `pcd` VALUES (2091, '资兴市', 'd', 2088, NULL);
INSERT INTO `pcd` VALUES (2092, '宜章县', 'd', 2088, NULL);
INSERT INTO `pcd` VALUES (2093, '汝城县', 'd', 2088, NULL);
INSERT INTO `pcd` VALUES (2094, '安仁县', 'd', 2088, NULL);
INSERT INTO `pcd` VALUES (2095, '嘉禾县', 'd', 2088, NULL);
INSERT INTO `pcd` VALUES (2096, '临武县', 'd', 2088, NULL);
INSERT INTO `pcd` VALUES (2097, '桂东县', 'd', 2088, NULL);
INSERT INTO `pcd` VALUES (2098, '永兴县', 'd', 2088, NULL);
INSERT INTO `pcd` VALUES (2099, '桂阳县', 'd', 2088, NULL);
INSERT INTO `pcd` VALUES (2100, '其他', 'd', 2088, NULL);
INSERT INTO `pcd` VALUES (2101, '永州', 'c', 1994, 'A4');
INSERT INTO `pcd` VALUES (2102, '冷水滩区', 'd', 2101, NULL);
INSERT INTO `pcd` VALUES (2103, '零陵区', 'd', 2101, NULL);
INSERT INTO `pcd` VALUES (2104, '祁阳县', 'd', 2101, NULL);
INSERT INTO `pcd` VALUES (2105, '蓝山县', 'd', 2101, NULL);
INSERT INTO `pcd` VALUES (2106, '宁远县', 'd', 2101, NULL);
INSERT INTO `pcd` VALUES (2107, '新田县', 'd', 2101, NULL);
INSERT INTO `pcd` VALUES (2108, '东安县', 'd', 2101, NULL);
INSERT INTO `pcd` VALUES (2109, '江永县', 'd', 2101, NULL);
INSERT INTO `pcd` VALUES (2110, '道县', 'd', 2101, NULL);
INSERT INTO `pcd` VALUES (2111, '双牌县', 'd', 2101, NULL);
INSERT INTO `pcd` VALUES (2112, '江华瑶族自治县', 'd', 2101, NULL);
INSERT INTO `pcd` VALUES (2113, '其他', 'd', 2101, NULL);
INSERT INTO `pcd` VALUES (2114, '怀化', 'c', 1994, 'A4');
INSERT INTO `pcd` VALUES (2115, '鹤城区', 'd', 2114, NULL);
INSERT INTO `pcd` VALUES (2116, '洪江市', 'd', 2114, NULL);
INSERT INTO `pcd` VALUES (2117, '会同县', 'd', 2114, NULL);
INSERT INTO `pcd` VALUES (2118, '沅陵县', 'd', 2114, NULL);
INSERT INTO `pcd` VALUES (2119, '辰溪县', 'd', 2114, NULL);
INSERT INTO `pcd` VALUES (2120, '溆浦县', 'd', 2114, NULL);
INSERT INTO `pcd` VALUES (2121, '中方县', 'd', 2114, NULL);
INSERT INTO `pcd` VALUES (2122, '新晃侗族自治县', 'd', 2114, NULL);
INSERT INTO `pcd` VALUES (2123, '芷江侗族自治县', 'd', 2114, NULL);
INSERT INTO `pcd` VALUES (2124, '通道侗族自治县', 'd', 2114, NULL);
INSERT INTO `pcd` VALUES (2125, '靖州苗族侗族自治县', 'd', 2114, NULL);
INSERT INTO `pcd` VALUES (2126, '麻阳苗族自治县', 'd', 2114, NULL);
INSERT INTO `pcd` VALUES (2127, '其他', 'd', 2114, NULL);
INSERT INTO `pcd` VALUES (2128, '娄底', 'c', 1994, 'A4');
INSERT INTO `pcd` VALUES (2129, '娄星区', 'd', 2128, NULL);
INSERT INTO `pcd` VALUES (2130, '冷水江市', 'd', 2128, NULL);
INSERT INTO `pcd` VALUES (2131, '涟源市', 'd', 2128, NULL);
INSERT INTO `pcd` VALUES (2132, '新化县', 'd', 2128, NULL);
INSERT INTO `pcd` VALUES (2133, '双峰县', 'd', 2128, NULL);
INSERT INTO `pcd` VALUES (2134, '其他', 'd', 2128, NULL);
INSERT INTO `pcd` VALUES (2135, '湘西土家族苗族自治州', 'c', 1994, 'A5');
INSERT INTO `pcd` VALUES (2136, '吉首市', 'd', 2135, NULL);
INSERT INTO `pcd` VALUES (2137, '古丈县', 'd', 2135, NULL);
INSERT INTO `pcd` VALUES (2138, '龙山县', 'd', 2135, NULL);
INSERT INTO `pcd` VALUES (2139, '永顺县', 'd', 2135, NULL);
INSERT INTO `pcd` VALUES (2140, '凤凰县', 'd', 2135, NULL);
INSERT INTO `pcd` VALUES (2141, '泸溪县', 'd', 2135, NULL);
INSERT INTO `pcd` VALUES (2142, '保靖县', 'd', 2135, NULL);
INSERT INTO `pcd` VALUES (2143, '花垣县', 'd', 2135, NULL);
INSERT INTO `pcd` VALUES (2144, '其他', 'd', 2135, NULL);
INSERT INTO `pcd` VALUES (2145, '其他', 'c', 1994, NULL);
INSERT INTO `pcd` VALUES (2146, '其他', 'd', 2145, NULL);
INSERT INTO `pcd` VALUES (2147, '广东', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (2148, '广州', 'c', 2147, 'A1');
INSERT INTO `pcd` VALUES (2149, '越秀区', 'd', 2148, NULL);
INSERT INTO `pcd` VALUES (2150, '荔湾区', 'd', 2148, NULL);
INSERT INTO `pcd` VALUES (2151, '海珠区', 'd', 2148, NULL);
INSERT INTO `pcd` VALUES (2152, '天河区', 'd', 2148, NULL);
INSERT INTO `pcd` VALUES (2153, '白云区', 'd', 2148, NULL);
INSERT INTO `pcd` VALUES (2154, '黄埔区', 'd', 2148, NULL);
INSERT INTO `pcd` VALUES (2155, '番禺区', 'd', 2148, NULL);
INSERT INTO `pcd` VALUES (2156, '花都区', 'd', 2148, NULL);
INSERT INTO `pcd` VALUES (2157, '南沙区', 'd', 2148, NULL);
INSERT INTO `pcd` VALUES (2158, '萝岗区', 'd', 2148, NULL);
INSERT INTO `pcd` VALUES (2159, '增城市', 'd', 2148, NULL);
INSERT INTO `pcd` VALUES (2160, '从化市', 'd', 2148, NULL);
INSERT INTO `pcd` VALUES (2161, '其他', 'd', 2148, NULL);
INSERT INTO `pcd` VALUES (2162, '深圳', 'c', 2147, 'A1');
INSERT INTO `pcd` VALUES (2163, '福田区', 'd', 2162, NULL);
INSERT INTO `pcd` VALUES (2164, '罗湖区', 'd', 2162, NULL);
INSERT INTO `pcd` VALUES (2165, '南山区', 'd', 2162, NULL);
INSERT INTO `pcd` VALUES (2166, '宝安区', 'd', 2162, NULL);
INSERT INTO `pcd` VALUES (2167, '龙岗区', 'd', 2162, NULL);
INSERT INTO `pcd` VALUES (2168, '盐田区', 'd', 2162, NULL);
INSERT INTO `pcd` VALUES (2169, '其他', 'd', 2162, NULL);
INSERT INTO `pcd` VALUES (2170, '东莞', 'c', 2147, 'A3');
INSERT INTO `pcd` VALUES (2171, '莞城', 'd', 2170, NULL);
INSERT INTO `pcd` VALUES (2172, '常平', 'd', 2170, NULL);
INSERT INTO `pcd` VALUES (2173, '塘厦', 'd', 2170, NULL);
INSERT INTO `pcd` VALUES (2176, '其他', 'd', 2170, NULL);
INSERT INTO `pcd` VALUES (2177, '中山', 'c', 2147, 'A4');
INSERT INTO `pcd` VALUES (2178, '中山', 'd', 2177, 'A4');
INSERT INTO `pcd` VALUES (2179, '潮州', 'c', 2147, 'A5');
INSERT INTO `pcd` VALUES (2180, '湘桥区', 'd', 2179, NULL);
INSERT INTO `pcd` VALUES (2181, '潮安县', 'd', 2179, NULL);
INSERT INTO `pcd` VALUES (2182, '饶平县', 'd', 2179, NULL);
INSERT INTO `pcd` VALUES (2183, '其他', 'd', 2179, NULL);
INSERT INTO `pcd` VALUES (2184, '揭阳', 'c', 2147, 'A4');
INSERT INTO `pcd` VALUES (2185, '榕城区', 'd', 2184, NULL);
INSERT INTO `pcd` VALUES (2186, '揭东县', 'd', 2184, NULL);
INSERT INTO `pcd` VALUES (2187, '揭西县', 'd', 2184, NULL);
INSERT INTO `pcd` VALUES (2188, '惠来县', 'd', 2184, NULL);
INSERT INTO `pcd` VALUES (2189, '普宁市', 'd', 2184, NULL);
INSERT INTO `pcd` VALUES (2190, '其他', 'd', 2184, NULL);
INSERT INTO `pcd` VALUES (2191, '云浮', 'c', 2147, 'A5');
INSERT INTO `pcd` VALUES (2192, '云城区', 'd', 2191, NULL);
INSERT INTO `pcd` VALUES (2193, '新兴县', 'd', 2191, NULL);
INSERT INTO `pcd` VALUES (2194, '郁南县', 'd', 2191, NULL);
INSERT INTO `pcd` VALUES (2195, '云安县', 'd', 2191, NULL);
INSERT INTO `pcd` VALUES (2196, '罗定市', 'd', 2191, NULL);
INSERT INTO `pcd` VALUES (2197, '其他', 'd', 2191, NULL);
INSERT INTO `pcd` VALUES (2198, '珠海', 'c', 2147, 'A3');
INSERT INTO `pcd` VALUES (2199, '香洲区', 'd', 2198, NULL);
INSERT INTO `pcd` VALUES (2200, '斗门区', 'd', 2198, NULL);
INSERT INTO `pcd` VALUES (2201, '金湾区', 'd', 2198, NULL);
INSERT INTO `pcd` VALUES (2202, '其他', 'd', 2198, NULL);
INSERT INTO `pcd` VALUES (2203, '汕头', 'c', 2147, 'A4');
INSERT INTO `pcd` VALUES (2204, '金平区', 'd', 2203, NULL);
INSERT INTO `pcd` VALUES (2205, '濠江区', 'd', 2203, NULL);
INSERT INTO `pcd` VALUES (2206, '龙湖区', 'd', 2203, NULL);
INSERT INTO `pcd` VALUES (2207, '潮阳区', 'd', 2203, NULL);
INSERT INTO `pcd` VALUES (2208, '潮南区', 'd', 2203, NULL);
INSERT INTO `pcd` VALUES (2209, '澄海区', 'd', 2203, NULL);
INSERT INTO `pcd` VALUES (2210, '南澳县', 'd', 2203, NULL);
INSERT INTO `pcd` VALUES (2211, '其他', 'd', 2203, NULL);
INSERT INTO `pcd` VALUES (2212, '韶关', 'c', 2147, 'A5');
INSERT INTO `pcd` VALUES (2213, '浈江区', 'd', 2212, NULL);
INSERT INTO `pcd` VALUES (2214, '武江区', 'd', 2212, NULL);
INSERT INTO `pcd` VALUES (2215, '曲江区', 'd', 2212, NULL);
INSERT INTO `pcd` VALUES (2216, '乐昌市', 'd', 2212, NULL);
INSERT INTO `pcd` VALUES (2217, '南雄市', 'd', 2212, NULL);
INSERT INTO `pcd` VALUES (2218, '始兴县', 'd', 2212, NULL);
INSERT INTO `pcd` VALUES (2219, '仁化县', 'd', 2212, NULL);
INSERT INTO `pcd` VALUES (2220, '翁源县', 'd', 2212, NULL);
INSERT INTO `pcd` VALUES (2221, '新丰县', 'd', 2212, NULL);
INSERT INTO `pcd` VALUES (2222, '乳源瑶族自治县', 'd', 2212, NULL);
INSERT INTO `pcd` VALUES (2223, '其他', 'd', 2212, NULL);
INSERT INTO `pcd` VALUES (2224, '佛山', 'c', 2147, 'A3');
INSERT INTO `pcd` VALUES (2225, '禅城区', 'd', 2224, NULL);
INSERT INTO `pcd` VALUES (2226, '南海区', 'd', 2224, NULL);
INSERT INTO `pcd` VALUES (2227, '顺德区', 'd', 2224, NULL);
INSERT INTO `pcd` VALUES (2228, '三水区', 'd', 2224, NULL);
INSERT INTO `pcd` VALUES (2229, '高明区', 'd', 2224, NULL);
INSERT INTO `pcd` VALUES (2230, '其他', 'd', 2224, NULL);
INSERT INTO `pcd` VALUES (2231, '江门', 'c', 2147, 'A4');
INSERT INTO `pcd` VALUES (2232, '蓬江区', 'd', 2231, NULL);
INSERT INTO `pcd` VALUES (2233, '江海区', 'd', 2231, NULL);
INSERT INTO `pcd` VALUES (2234, '新会区', 'd', 2231, NULL);
INSERT INTO `pcd` VALUES (2235, '恩平市', 'd', 2231, NULL);
INSERT INTO `pcd` VALUES (2236, '台山市', 'd', 2231, NULL);
INSERT INTO `pcd` VALUES (2237, '开平市', 'd', 2231, NULL);
INSERT INTO `pcd` VALUES (2238, '鹤山市', 'd', 2231, NULL);
INSERT INTO `pcd` VALUES (2239, '其他', 'd', 2231, NULL);
INSERT INTO `pcd` VALUES (2240, '湛江', 'c', 2147, 'A4');
INSERT INTO `pcd` VALUES (2241, '赤坎区', 'd', 2240, NULL);
INSERT INTO `pcd` VALUES (2242, '霞山区', 'd', 2240, NULL);
INSERT INTO `pcd` VALUES (2243, '坡头区', 'd', 2240, NULL);
INSERT INTO `pcd` VALUES (2244, '麻章区', 'd', 2240, NULL);
INSERT INTO `pcd` VALUES (2245, '吴川市', 'd', 2240, NULL);
INSERT INTO `pcd` VALUES (2246, '廉江市', 'd', 2240, NULL);
INSERT INTO `pcd` VALUES (2247, '雷州市', 'd', 2240, NULL);
INSERT INTO `pcd` VALUES (2248, '遂溪县', 'd', 2240, NULL);
INSERT INTO `pcd` VALUES (2249, '徐闻县', 'd', 2240, NULL);
INSERT INTO `pcd` VALUES (2250, '其他', 'd', 2240, NULL);
INSERT INTO `pcd` VALUES (2251, '茂名', 'c', 2147, 'A4');
INSERT INTO `pcd` VALUES (2252, '茂南区', 'd', 2251, NULL);
INSERT INTO `pcd` VALUES (2253, '茂港区', 'd', 2251, NULL);
INSERT INTO `pcd` VALUES (2254, '化州市', 'd', 2251, NULL);
INSERT INTO `pcd` VALUES (2255, '信宜市', 'd', 2251, NULL);
INSERT INTO `pcd` VALUES (2256, '高州市', 'd', 2251, NULL);
INSERT INTO `pcd` VALUES (2257, '电白县', 'd', 2251, NULL);
INSERT INTO `pcd` VALUES (2258, '其他', 'd', 2251, NULL);
INSERT INTO `pcd` VALUES (2259, '肇庆', 'c', 2147, 'A4');
INSERT INTO `pcd` VALUES (2260, '端州区', 'd', 2259, NULL);
INSERT INTO `pcd` VALUES (2261, '鼎湖区', 'd', 2259, NULL);
INSERT INTO `pcd` VALUES (2262, '高要市', 'd', 2259, NULL);
INSERT INTO `pcd` VALUES (2263, '四会市', 'd', 2259, NULL);
INSERT INTO `pcd` VALUES (2264, '广宁县', 'd', 2259, NULL);
INSERT INTO `pcd` VALUES (2265, '怀集县', 'd', 2259, NULL);
INSERT INTO `pcd` VALUES (2266, '封开县', 'd', 2259, NULL);
INSERT INTO `pcd` VALUES (2267, '德庆县', 'd', 2259, NULL);
INSERT INTO `pcd` VALUES (2268, '其他', 'd', 2259, NULL);
INSERT INTO `pcd` VALUES (2269, '惠州', 'c', 2147, 'A4');
INSERT INTO `pcd` VALUES (2270, '惠城区', 'd', 2269, NULL);
INSERT INTO `pcd` VALUES (2271, '惠阳区', 'd', 2269, NULL);
INSERT INTO `pcd` VALUES (2272, '博罗县', 'd', 2269, NULL);
INSERT INTO `pcd` VALUES (2273, '惠东县', 'd', 2269, NULL);
INSERT INTO `pcd` VALUES (2274, '龙门县', 'd', 2269, NULL);
INSERT INTO `pcd` VALUES (2275, '其他', 'd', 2269, NULL);
INSERT INTO `pcd` VALUES (2276, '梅州', 'c', 2147, 'A5');
INSERT INTO `pcd` VALUES (2277, '梅江区', 'd', 2276, NULL);
INSERT INTO `pcd` VALUES (2278, '兴宁市', 'd', 2276, NULL);
INSERT INTO `pcd` VALUES (2279, '梅县', 'd', 2276, NULL);
INSERT INTO `pcd` VALUES (2280, '大埔县', 'd', 2276, NULL);
INSERT INTO `pcd` VALUES (2281, '丰顺县', 'd', 2276, NULL);
INSERT INTO `pcd` VALUES (2282, '五华县', 'd', 2276, NULL);
INSERT INTO `pcd` VALUES (2283, '平远县', 'd', 2276, NULL);
INSERT INTO `pcd` VALUES (2284, '蕉岭县', 'd', 2276, NULL);
INSERT INTO `pcd` VALUES (2285, '其他', 'd', 2276, NULL);
INSERT INTO `pcd` VALUES (2286, '汕尾', 'c', 2147, 'A5');
INSERT INTO `pcd` VALUES (2287, '城区', 'd', 2286, NULL);
INSERT INTO `pcd` VALUES (2288, '陆丰市', 'd', 2286, NULL);
INSERT INTO `pcd` VALUES (2289, '海丰县', 'd', 2286, NULL);
INSERT INTO `pcd` VALUES (2290, '陆河县', 'd', 2286, NULL);
INSERT INTO `pcd` VALUES (2291, '其他', 'd', 2286, NULL);
INSERT INTO `pcd` VALUES (2292, '河源', 'c', 2147, 'A5');
INSERT INTO `pcd` VALUES (2293, '源城区', 'd', 2292, NULL);
INSERT INTO `pcd` VALUES (2294, '紫金县', 'd', 2292, NULL);
INSERT INTO `pcd` VALUES (2295, '龙川县', 'd', 2292, NULL);
INSERT INTO `pcd` VALUES (2296, '连平县', 'd', 2292, NULL);
INSERT INTO `pcd` VALUES (2297, '和平县', 'd', 2292, NULL);
INSERT INTO `pcd` VALUES (2298, '东源县', 'd', 2292, NULL);
INSERT INTO `pcd` VALUES (2299, '其他', 'd', 2292, NULL);
INSERT INTO `pcd` VALUES (2300, '阳江', 'c', 2147, 'A5');
INSERT INTO `pcd` VALUES (2301, '江城区', 'd', 2300, NULL);
INSERT INTO `pcd` VALUES (2302, '阳春市', 'd', 2300, NULL);
INSERT INTO `pcd` VALUES (2303, '阳西县', 'd', 2300, NULL);
INSERT INTO `pcd` VALUES (2304, '阳东县', 'd', 2300, NULL);
INSERT INTO `pcd` VALUES (2305, '其他', 'd', 2300, NULL);
INSERT INTO `pcd` VALUES (2306, '清远', 'c', 2147, 'A4');
INSERT INTO `pcd` VALUES (2307, '清城区', 'd', 2306, NULL);
INSERT INTO `pcd` VALUES (2308, '英德市', 'd', 2306, NULL);
INSERT INTO `pcd` VALUES (2309, '连州市', 'd', 2306, NULL);
INSERT INTO `pcd` VALUES (2310, '佛冈县', 'd', 2306, NULL);
INSERT INTO `pcd` VALUES (2311, '阳山县', 'd', 2306, NULL);
INSERT INTO `pcd` VALUES (2312, '清新县', 'd', 2306, NULL);
INSERT INTO `pcd` VALUES (2313, '连山壮族瑶族自治县', 'd', 2306, NULL);
INSERT INTO `pcd` VALUES (2314, '连南瑶族自治县', 'd', 2306, NULL);
INSERT INTO `pcd` VALUES (2315, '其他', 'd', 2306, NULL);
INSERT INTO `pcd` VALUES (2316, '广西', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (2317, '南宁', 'c', 2316, 'A3');
INSERT INTO `pcd` VALUES (2318, '青秀区', 'd', 2317, NULL);
INSERT INTO `pcd` VALUES (2319, '兴宁区', 'd', 2317, NULL);
INSERT INTO `pcd` VALUES (2320, '西乡塘区', 'd', 2317, NULL);
INSERT INTO `pcd` VALUES (2321, '良庆区', 'd', 2317, NULL);
INSERT INTO `pcd` VALUES (2322, '江南区', 'd', 2317, NULL);
INSERT INTO `pcd` VALUES (2323, '邕宁区', 'd', 2317, NULL);
INSERT INTO `pcd` VALUES (2324, '武鸣县', 'd', 2317, NULL);
INSERT INTO `pcd` VALUES (2325, '隆安县', 'd', 2317, NULL);
INSERT INTO `pcd` VALUES (2326, '马山县', 'd', 2317, NULL);
INSERT INTO `pcd` VALUES (2327, '上林县', 'd', 2317, NULL);
INSERT INTO `pcd` VALUES (2328, '宾阳县', 'd', 2317, NULL);
INSERT INTO `pcd` VALUES (2329, '横县', 'd', 2317, NULL);
INSERT INTO `pcd` VALUES (2330, '其他', 'd', 2317, NULL);
INSERT INTO `pcd` VALUES (2331, '柳州', 'c', 2316, 'A4');
INSERT INTO `pcd` VALUES (2332, '城中区', 'd', 2331, NULL);
INSERT INTO `pcd` VALUES (2333, '鱼峰区', 'd', 2331, NULL);
INSERT INTO `pcd` VALUES (2334, '柳北区', 'd', 2331, NULL);
INSERT INTO `pcd` VALUES (2335, '柳南区', 'd', 2331, NULL);
INSERT INTO `pcd` VALUES (2336, '柳江县', 'd', 2331, NULL);
INSERT INTO `pcd` VALUES (2337, '柳城县', 'd', 2331, NULL);
INSERT INTO `pcd` VALUES (2338, '鹿寨县', 'd', 2331, NULL);
INSERT INTO `pcd` VALUES (2339, '融安县', 'd', 2331, NULL);
INSERT INTO `pcd` VALUES (2340, '融水苗族自治县', 'd', 2331, NULL);
INSERT INTO `pcd` VALUES (2341, '三江侗族自治县', 'd', 2331, NULL);
INSERT INTO `pcd` VALUES (2342, '其他', 'd', 2331, NULL);
INSERT INTO `pcd` VALUES (2343, '桂林', 'c', 2316, 'A4');
INSERT INTO `pcd` VALUES (2344, '象山区', 'd', 2343, NULL);
INSERT INTO `pcd` VALUES (2345, '秀峰区', 'd', 2343, NULL);
INSERT INTO `pcd` VALUES (2346, '叠彩区', 'd', 2343, NULL);
INSERT INTO `pcd` VALUES (2347, '七星区', 'd', 2343, NULL);
INSERT INTO `pcd` VALUES (2348, '雁山区', 'd', 2343, NULL);
INSERT INTO `pcd` VALUES (2349, '阳朔县', 'd', 2343, NULL);
INSERT INTO `pcd` VALUES (2350, '临桂县', 'd', 2343, NULL);
INSERT INTO `pcd` VALUES (2351, '灵川县', 'd', 2343, NULL);
INSERT INTO `pcd` VALUES (2352, '全州县', 'd', 2343, NULL);
INSERT INTO `pcd` VALUES (2353, '平乐县', 'd', 2343, NULL);
INSERT INTO `pcd` VALUES (2354, '兴安县', 'd', 2343, NULL);
INSERT INTO `pcd` VALUES (2355, '灌阳县', 'd', 2343, NULL);
INSERT INTO `pcd` VALUES (2356, '荔浦县', 'd', 2343, NULL);
INSERT INTO `pcd` VALUES (2357, '资源县', 'd', 2343, NULL);
INSERT INTO `pcd` VALUES (2358, '永福县', 'd', 2343, NULL);
INSERT INTO `pcd` VALUES (2359, '龙胜各族自治县', 'd', 2343, NULL);
INSERT INTO `pcd` VALUES (2360, '恭城瑶族自治县', 'd', 2343, NULL);
INSERT INTO `pcd` VALUES (2361, '其他', 'd', 2343, NULL);
INSERT INTO `pcd` VALUES (2362, '梧州', 'c', 2316, 'A5');
INSERT INTO `pcd` VALUES (2363, '万秀区', 'd', 2362, NULL);
INSERT INTO `pcd` VALUES (2364, '蝶山区', 'd', 2362, NULL);
INSERT INTO `pcd` VALUES (2365, '长洲区', 'd', 2362, NULL);
INSERT INTO `pcd` VALUES (2366, '岑溪市', 'd', 2362, NULL);
INSERT INTO `pcd` VALUES (2367, '苍梧县', 'd', 2362, NULL);
INSERT INTO `pcd` VALUES (2368, '藤县', 'd', 2362, NULL);
INSERT INTO `pcd` VALUES (2369, '蒙山县', 'd', 2362, NULL);
INSERT INTO `pcd` VALUES (2370, '其他', 'd', 2362, NULL);
INSERT INTO `pcd` VALUES (2371, '北海', 'c', 2316, 'A5');
INSERT INTO `pcd` VALUES (2372, '海城区', 'd', 2371, NULL);
INSERT INTO `pcd` VALUES (2373, '银海区', 'd', 2371, NULL);
INSERT INTO `pcd` VALUES (2374, '铁山港区', 'd', 2371, NULL);
INSERT INTO `pcd` VALUES (2375, '合浦县', 'd', 2371, NULL);
INSERT INTO `pcd` VALUES (2376, '其他', 'd', 2371, NULL);
INSERT INTO `pcd` VALUES (2377, '防城港', 'c', 2316, 'A5');
INSERT INTO `pcd` VALUES (2378, '港口区', 'd', 2377, NULL);
INSERT INTO `pcd` VALUES (2379, '防城区', 'd', 2377, NULL);
INSERT INTO `pcd` VALUES (2380, '东兴市', 'd', 2377, NULL);
INSERT INTO `pcd` VALUES (2381, '上思县', 'd', 2377, NULL);
INSERT INTO `pcd` VALUES (2382, '其他', 'd', 2377, NULL);
INSERT INTO `pcd` VALUES (2383, '钦州', 'c', 2316, 'A5');
INSERT INTO `pcd` VALUES (2384, '钦南区', 'd', 2383, NULL);
INSERT INTO `pcd` VALUES (2385, '钦北区', 'd', 2383, NULL);
INSERT INTO `pcd` VALUES (2386, '灵山县', 'd', 2383, NULL);
INSERT INTO `pcd` VALUES (2387, '浦北县', 'd', 2383, NULL);
INSERT INTO `pcd` VALUES (2388, '其他', 'd', 2383, NULL);
INSERT INTO `pcd` VALUES (2389, '贵港', 'c', 2316, 'A5');
INSERT INTO `pcd` VALUES (2390, '港北区', 'd', 2389, NULL);
INSERT INTO `pcd` VALUES (2391, '港南区', 'd', 2389, NULL);
INSERT INTO `pcd` VALUES (2392, '覃塘区', 'd', 2389, NULL);
INSERT INTO `pcd` VALUES (2393, '桂平市', 'd', 2389, NULL);
INSERT INTO `pcd` VALUES (2394, '平南县', 'd', 2389, NULL);
INSERT INTO `pcd` VALUES (2395, '其他', 'd', 2389, NULL);
INSERT INTO `pcd` VALUES (2396, '玉林', 'c', 2316, 'A4');
INSERT INTO `pcd` VALUES (2397, '玉州区', 'd', 2396, NULL);
INSERT INTO `pcd` VALUES (2398, '北流市', 'd', 2396, NULL);
INSERT INTO `pcd` VALUES (2399, '容县', 'd', 2396, NULL);
INSERT INTO `pcd` VALUES (2400, '陆川县', 'd', 2396, NULL);
INSERT INTO `pcd` VALUES (2401, '博白县', 'd', 2396, NULL);
INSERT INTO `pcd` VALUES (2402, '兴业县', 'd', 2396, NULL);
INSERT INTO `pcd` VALUES (2403, '其他', 'd', 2396, NULL);
INSERT INTO `pcd` VALUES (2404, '百色', 'c', 2316, 'A5');
INSERT INTO `pcd` VALUES (2405, '右江区', 'd', 2404, NULL);
INSERT INTO `pcd` VALUES (2406, '凌云县', 'd', 2404, NULL);
INSERT INTO `pcd` VALUES (2407, '平果县', 'd', 2404, NULL);
INSERT INTO `pcd` VALUES (2408, '西林县', 'd', 2404, NULL);
INSERT INTO `pcd` VALUES (2409, '乐业县', 'd', 2404, NULL);
INSERT INTO `pcd` VALUES (2410, '德保县', 'd', 2404, NULL);
INSERT INTO `pcd` VALUES (2411, '田林县', 'd', 2404, NULL);
INSERT INTO `pcd` VALUES (2412, '田阳县', 'd', 2404, NULL);
INSERT INTO `pcd` VALUES (2413, '靖西县', 'd', 2404, NULL);
INSERT INTO `pcd` VALUES (2414, '田东县', 'd', 2404, NULL);
INSERT INTO `pcd` VALUES (2415, '那坡县', 'd', 2404, NULL);
INSERT INTO `pcd` VALUES (2416, '隆林各族自治县', 'd', 2404, NULL);
INSERT INTO `pcd` VALUES (2417, '其他', 'd', 2404, NULL);
INSERT INTO `pcd` VALUES (2418, '贺州', 'c', 2316, 'A5');
INSERT INTO `pcd` VALUES (2419, '八步区', 'd', 2418, NULL);
INSERT INTO `pcd` VALUES (2420, '钟山县', 'd', 2418, NULL);
INSERT INTO `pcd` VALUES (2421, '昭平县', 'd', 2418, NULL);
INSERT INTO `pcd` VALUES (2422, '富川瑶族自治县', 'd', 2418, NULL);
INSERT INTO `pcd` VALUES (2423, '其他', 'd', 2418, NULL);
INSERT INTO `pcd` VALUES (2424, '河池', 'c', 2316, 'A5');
INSERT INTO `pcd` VALUES (2425, '金城江区', 'd', 2424, NULL);
INSERT INTO `pcd` VALUES (2426, '宜州市', 'd', 2424, NULL);
INSERT INTO `pcd` VALUES (2427, '天峨县', 'd', 2424, NULL);
INSERT INTO `pcd` VALUES (2428, '凤山县', 'd', 2424, NULL);
INSERT INTO `pcd` VALUES (2429, '南丹县', 'd', 2424, NULL);
INSERT INTO `pcd` VALUES (2430, '东兰县', 'd', 2424, NULL);
INSERT INTO `pcd` VALUES (2431, '都安瑶族自治县', 'd', 2424, NULL);
INSERT INTO `pcd` VALUES (2432, '罗城仫佬族自治县', 'd', 2424, NULL);
INSERT INTO `pcd` VALUES (2433, '巴马瑶族自治县', 'd', 2424, NULL);
INSERT INTO `pcd` VALUES (2434, '环江毛南族自治县', 'd', 2424, NULL);
INSERT INTO `pcd` VALUES (2435, '大化瑶族自治县', 'd', 2424, NULL);
INSERT INTO `pcd` VALUES (2436, '其他', 'd', 2424, NULL);
INSERT INTO `pcd` VALUES (2437, '来宾', 'c', 2316, 'A5');
INSERT INTO `pcd` VALUES (2438, '兴宾区', 'd', 2437, NULL);
INSERT INTO `pcd` VALUES (2439, '合山市', 'd', 2437, NULL);
INSERT INTO `pcd` VALUES (2440, '象州县', 'd', 2437, NULL);
INSERT INTO `pcd` VALUES (2441, '武宣县', 'd', 2437, NULL);
INSERT INTO `pcd` VALUES (2442, '忻城县', 'd', 2437, NULL);
INSERT INTO `pcd` VALUES (2443, '金秀瑶族自治县', 'd', 2437, NULL);
INSERT INTO `pcd` VALUES (2444, '其他', 'd', 2437, NULL);
INSERT INTO `pcd` VALUES (2445, '崇左', 'c', 2316, 'A5');
INSERT INTO `pcd` VALUES (2446, '江州区', 'd', 2445, NULL);
INSERT INTO `pcd` VALUES (2447, '凭祥市', 'd', 2445, NULL);
INSERT INTO `pcd` VALUES (2448, '宁明县', 'd', 2445, NULL);
INSERT INTO `pcd` VALUES (2449, '扶绥县', 'd', 2445, NULL);
INSERT INTO `pcd` VALUES (2450, '龙州县', 'd', 2445, NULL);
INSERT INTO `pcd` VALUES (2451, '大新县', 'd', 2445, NULL);
INSERT INTO `pcd` VALUES (2452, '天等县', 'd', 2445, NULL);
INSERT INTO `pcd` VALUES (2453, '其他', 'd', 2445, NULL);
INSERT INTO `pcd` VALUES (2454, '其他', 'c', 2316, NULL);
INSERT INTO `pcd` VALUES (2455, '其他', 'd', 2454, NULL);
INSERT INTO `pcd` VALUES (2456, '海南', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (2457, '海口', 'c', 2456, 'A3');
INSERT INTO `pcd` VALUES (2458, '龙华区', 'd', 2457, NULL);
INSERT INTO `pcd` VALUES (2459, '秀英区', 'd', 2457, NULL);
INSERT INTO `pcd` VALUES (2460, '琼山区', 'd', 2457, NULL);
INSERT INTO `pcd` VALUES (2461, '美兰区', 'd', 2457, NULL);
INSERT INTO `pcd` VALUES (2462, '其他', 'd', 2457, NULL);
INSERT INTO `pcd` VALUES (2463, '三亚', 'c', 2456, 'A5');
INSERT INTO `pcd` VALUES (2464, '三亚市', 'd', 2463, 'A5');
INSERT INTO `pcd` VALUES (2465, '其他', 'd', 2463, NULL);
INSERT INTO `pcd` VALUES (2466, '五指山', 'c', 2456, NULL);
INSERT INTO `pcd` VALUES (2467, '五指山', 'd', 2466, NULL);
INSERT INTO `pcd` VALUES (2468, '琼海', 'c', 2456, NULL);
INSERT INTO `pcd` VALUES (2469, '琼海', 'd', 2468, NULL);
INSERT INTO `pcd` VALUES (2470, '儋州', 'c', 2456, 'A5');
INSERT INTO `pcd` VALUES (2471, '儋州', 'd', 2470, 'A5');
INSERT INTO `pcd` VALUES (2472, '文昌', 'c', 2456, NULL);
INSERT INTO `pcd` VALUES (2473, '文昌', 'd', 2472, NULL);
INSERT INTO `pcd` VALUES (2474, '万宁', 'c', 2456, NULL);
INSERT INTO `pcd` VALUES (2475, '万宁', 'd', 2474, NULL);
INSERT INTO `pcd` VALUES (2476, '东方', 'c', 2456, 'A5');
INSERT INTO `pcd` VALUES (2477, '东方', 'd', 2476, 'A5');
INSERT INTO `pcd` VALUES (2478, '澄迈县', 'c', 2456, NULL);
INSERT INTO `pcd` VALUES (2479, '澄迈县', 'd', 2478, NULL);
INSERT INTO `pcd` VALUES (2480, '定安县', 'c', 2456, NULL);
INSERT INTO `pcd` VALUES (2481, '定安县', 'd', 2480, NULL);
INSERT INTO `pcd` VALUES (2482, '屯昌县', 'c', 2456, NULL);
INSERT INTO `pcd` VALUES (2483, '屯昌县', 'd', 2482, NULL);
INSERT INTO `pcd` VALUES (2484, '临高县', 'c', 2456, NULL);
INSERT INTO `pcd` VALUES (2485, '临高县', 'd', 2484, NULL);
INSERT INTO `pcd` VALUES (2486, '白沙黎族自治县', 'c', 2456, NULL);
INSERT INTO `pcd` VALUES (2487, '白沙黎族自治县', 'd', 2486, NULL);
INSERT INTO `pcd` VALUES (2488, '昌江黎族自治县', 'c', 2456, NULL);
INSERT INTO `pcd` VALUES (2489, '昌江黎族自治县', 'd', 2488, NULL);
INSERT INTO `pcd` VALUES (2490, '乐东黎族自治县', 'c', 2456, NULL);
INSERT INTO `pcd` VALUES (2491, '乐东黎族自治县', 'd', 2490, NULL);
INSERT INTO `pcd` VALUES (2492, '陵水黎族自治县', 'c', 2456, NULL);
INSERT INTO `pcd` VALUES (2493, '陵水黎族自治县', 'd', 2492, NULL);
INSERT INTO `pcd` VALUES (2494, '保亭黎族苗族自治县', 'c', 2456, NULL);
INSERT INTO `pcd` VALUES (2495, '保亭黎族苗族自治县', 'd', 2494, NULL);
INSERT INTO `pcd` VALUES (2496, '琼中黎族苗族自治县', 'c', 2456, NULL);
INSERT INTO `pcd` VALUES (2497, '琼中黎族苗族自治县', 'd', 2496, NULL);
INSERT INTO `pcd` VALUES (2498, '其他', 'c', 2456, NULL);
INSERT INTO `pcd` VALUES (2499, '其他', 'd', 2498, NULL);
INSERT INTO `pcd` VALUES (2500, '重庆', 'p', NULL, 'A2');
INSERT INTO `pcd` VALUES (2501, '重庆', 'c', 2500, 'A2');
INSERT INTO `pcd` VALUES (2502, '渝中区', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2503, '大渡口区', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2504, '江北区', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2505, '南岸区', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2506, '北碚区', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2507, '渝北区', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2508, '巴南区', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2509, '长寿区', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2510, '双桥区', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2511, '沙坪坝区', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2512, '万盛区', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2513, '万州区', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2514, '涪陵区', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2515, '黔江区', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2516, '永川区', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2517, '合川区', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2518, '江津区', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2519, '九龙坡区', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2520, '南川区', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2521, '綦江县', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2522, '潼南县', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2523, '荣昌县', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2524, '璧山县', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2525, '大足县', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2526, '铜梁县', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2527, '梁平县', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2528, '开县', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2529, '忠县', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2530, '城口县', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2531, '垫江县', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2532, '武隆县', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2533, '丰都县', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2534, '奉节县', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2535, '云阳县', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2536, '巫溪县', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2537, '巫山县', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2538, '石柱土家族自治县', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2539, '秀山土家族苗族自治县', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2540, '酉阳土家族苗族自治县', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2541, '彭水苗族土家族自治县', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2542, '其他', 'd', 2501, NULL);
INSERT INTO `pcd` VALUES (2543, '四川', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (2544, '成都', 'c', 2543, 'A2');
INSERT INTO `pcd` VALUES (2545, '青羊区', 'd', 2544, NULL);
INSERT INTO `pcd` VALUES (2546, '锦江区', 'd', 2544, NULL);
INSERT INTO `pcd` VALUES (2547, '金牛区', 'd', 2544, NULL);
INSERT INTO `pcd` VALUES (2548, '武侯区', 'd', 2544, NULL);
INSERT INTO `pcd` VALUES (2549, '成华区', 'd', 2544, NULL);
INSERT INTO `pcd` VALUES (2550, '龙泉驿区', 'd', 2544, NULL);
INSERT INTO `pcd` VALUES (2551, '青白江区', 'd', 2544, NULL);
INSERT INTO `pcd` VALUES (2552, '新都区', 'd', 2544, NULL);
INSERT INTO `pcd` VALUES (2553, '温江区', 'd', 2544, NULL);
INSERT INTO `pcd` VALUES (2554, '都江堰市', 'd', 2544, NULL);
INSERT INTO `pcd` VALUES (2555, '彭州市', 'd', 2544, NULL);
INSERT INTO `pcd` VALUES (2556, '邛崃市', 'd', 2544, NULL);
INSERT INTO `pcd` VALUES (2557, '崇州市', 'd', 2544, 'A4');
INSERT INTO `pcd` VALUES (2558, '金堂县', 'd', 2544, NULL);
INSERT INTO `pcd` VALUES (2559, '郫县', 'd', 2544, NULL);
INSERT INTO `pcd` VALUES (2560, '新津县', 'd', 2544, NULL);
INSERT INTO `pcd` VALUES (2561, '双流县', 'd', 2544, NULL);
INSERT INTO `pcd` VALUES (2562, '蒲江县', 'd', 2544, NULL);
INSERT INTO `pcd` VALUES (2563, '大邑县', 'd', 2544, NULL);
INSERT INTO `pcd` VALUES (2564, '其他', 'd', 2544, NULL);
INSERT INTO `pcd` VALUES (2565, '自贡', 'c', 2543, 'A5');
INSERT INTO `pcd` VALUES (2566, '大安区', 'd', 2565, NULL);
INSERT INTO `pcd` VALUES (2567, '自流井区', 'd', 2565, NULL);
INSERT INTO `pcd` VALUES (2568, '贡井区', 'd', 2565, NULL);
INSERT INTO `pcd` VALUES (2569, '沿滩区', 'd', 2565, NULL);
INSERT INTO `pcd` VALUES (2570, '荣县', 'd', 2565, NULL);
INSERT INTO `pcd` VALUES (2571, '富顺县', 'd', 2565, NULL);
INSERT INTO `pcd` VALUES (2572, '其他', 'd', 2565, NULL);
INSERT INTO `pcd` VALUES (2573, '攀枝花', 'c', 2543, 'A5');
INSERT INTO `pcd` VALUES (2574, '仁和区', 'd', 2573, NULL);
INSERT INTO `pcd` VALUES (2575, '米易县', 'd', 2573, NULL);
INSERT INTO `pcd` VALUES (2576, '盐边县', 'd', 2573, NULL);
INSERT INTO `pcd` VALUES (2577, '东区', 'd', 2573, NULL);
INSERT INTO `pcd` VALUES (2578, '西区', 'd', 2573, NULL);
INSERT INTO `pcd` VALUES (2579, '其他', 'd', 2573, NULL);
INSERT INTO `pcd` VALUES (2580, '泸州', 'c', 2543, 'A4');
INSERT INTO `pcd` VALUES (2581, '江阳区', 'd', 2580, NULL);
INSERT INTO `pcd` VALUES (2582, '纳溪区', 'd', 2580, NULL);
INSERT INTO `pcd` VALUES (2583, '龙马潭区', 'd', 2580, NULL);
INSERT INTO `pcd` VALUES (2584, '泸县', 'd', 2580, NULL);
INSERT INTO `pcd` VALUES (2585, '合江县', 'd', 2580, NULL);
INSERT INTO `pcd` VALUES (2586, '叙永县', 'd', 2580, NULL);
INSERT INTO `pcd` VALUES (2587, '古蔺县', 'd', 2580, NULL);
INSERT INTO `pcd` VALUES (2588, '其他', 'd', 2580, NULL);
INSERT INTO `pcd` VALUES (2589, '德阳', 'c', 2543, 'A4');
INSERT INTO `pcd` VALUES (2590, '旌阳区', 'd', 2589, NULL);
INSERT INTO `pcd` VALUES (2591, '广汉市', 'd', 2589, NULL);
INSERT INTO `pcd` VALUES (2592, '什邡市', 'd', 2589, NULL);
INSERT INTO `pcd` VALUES (2593, '绵竹市', 'd', 2589, NULL);
INSERT INTO `pcd` VALUES (2594, '罗江县', 'd', 2589, NULL);
INSERT INTO `pcd` VALUES (2595, '中江县', 'd', 2589, NULL);
INSERT INTO `pcd` VALUES (2596, '其他', 'd', 2589, NULL);
INSERT INTO `pcd` VALUES (2597, '绵阳', 'c', 2543, 'A4');
INSERT INTO `pcd` VALUES (2598, '涪城区', 'd', 2597, NULL);
INSERT INTO `pcd` VALUES (2599, '游仙区', 'd', 2597, NULL);
INSERT INTO `pcd` VALUES (2600, '江油市', 'd', 2597, NULL);
INSERT INTO `pcd` VALUES (2601, '盐亭县', 'd', 2597, NULL);
INSERT INTO `pcd` VALUES (2602, '三台县', 'd', 2597, NULL);
INSERT INTO `pcd` VALUES (2603, '平武县', 'd', 2597, NULL);
INSERT INTO `pcd` VALUES (2604, '安县', 'd', 2597, NULL);
INSERT INTO `pcd` VALUES (2605, '梓潼县', 'd', 2597, NULL);
INSERT INTO `pcd` VALUES (2606, '北川羌族自治县', 'd', 2597, NULL);
INSERT INTO `pcd` VALUES (2607, '其他', 'd', 2597, NULL);
INSERT INTO `pcd` VALUES (2608, '广元', 'c', 2543, 'A5');
INSERT INTO `pcd` VALUES (2609, '元坝区', 'd', 2608, NULL);
INSERT INTO `pcd` VALUES (2610, '朝天区', 'd', 2608, NULL);
INSERT INTO `pcd` VALUES (2611, '青川县', 'd', 2608, NULL);
INSERT INTO `pcd` VALUES (2612, '旺苍县', 'd', 2608, NULL);
INSERT INTO `pcd` VALUES (2613, '剑阁县', 'd', 2608, NULL);
INSERT INTO `pcd` VALUES (2614, '苍溪县', 'd', 2608, NULL);
INSERT INTO `pcd` VALUES (2615, '市中区', 'd', 2608, NULL);
INSERT INTO `pcd` VALUES (2616, '其他', 'd', 2608, NULL);
INSERT INTO `pcd` VALUES (2617, '遂宁', 'c', 2543, 'A5');
INSERT INTO `pcd` VALUES (2618, '船山区', 'd', 2617, NULL);
INSERT INTO `pcd` VALUES (2619, '安居区', 'd', 2617, NULL);
INSERT INTO `pcd` VALUES (2620, '射洪县', 'd', 2617, NULL);
INSERT INTO `pcd` VALUES (2621, '蓬溪县', 'd', 2617, NULL);
INSERT INTO `pcd` VALUES (2622, '大英县', 'd', 2617, NULL);
INSERT INTO `pcd` VALUES (2623, '其他', 'd', 2617, NULL);
INSERT INTO `pcd` VALUES (2624, '内江', 'c', 2543, 'A5');
INSERT INTO `pcd` VALUES (2625, '市中区', 'd', 2624, NULL);
INSERT INTO `pcd` VALUES (2626, '东兴区', 'd', 2624, NULL);
INSERT INTO `pcd` VALUES (2627, '资中县', 'd', 2624, NULL);
INSERT INTO `pcd` VALUES (2628, '隆昌县', 'd', 2624, NULL);
INSERT INTO `pcd` VALUES (2629, '威远县', 'd', 2624, NULL);
INSERT INTO `pcd` VALUES (2630, '其他', 'd', 2624, NULL);
INSERT INTO `pcd` VALUES (2631, '乐山', 'c', 2543, 'A4');
INSERT INTO `pcd` VALUES (2632, '市中区', 'd', 2631, NULL);
INSERT INTO `pcd` VALUES (2633, '五通桥区', 'd', 2631, NULL);
INSERT INTO `pcd` VALUES (2634, '沙湾区', 'd', 2631, NULL);
INSERT INTO `pcd` VALUES (2635, '金口河区', 'd', 2631, NULL);
INSERT INTO `pcd` VALUES (2636, '峨眉山市', 'd', 2631, 'A5');
INSERT INTO `pcd` VALUES (2637, '夹江县', 'd', 2631, NULL);
INSERT INTO `pcd` VALUES (2638, '井研县', 'd', 2631, NULL);
INSERT INTO `pcd` VALUES (2639, '犍为县', 'd', 2631, NULL);
INSERT INTO `pcd` VALUES (2640, '沐川县', 'd', 2631, NULL);
INSERT INTO `pcd` VALUES (2641, '马边彝族自治县', 'd', 2631, NULL);
INSERT INTO `pcd` VALUES (2642, '峨边彝族自治县', 'd', 2631, NULL);
INSERT INTO `pcd` VALUES (2643, '其他', 'd', 2631, NULL);
INSERT INTO `pcd` VALUES (2644, '南充', 'c', 2543, 'A4');
INSERT INTO `pcd` VALUES (2645, '顺庆区', 'd', 2644, NULL);
INSERT INTO `pcd` VALUES (2646, '高坪区', 'd', 2644, NULL);
INSERT INTO `pcd` VALUES (2647, '嘉陵区', 'd', 2644, NULL);
INSERT INTO `pcd` VALUES (2648, '阆中市', 'd', 2644, NULL);
INSERT INTO `pcd` VALUES (2649, '营山县', 'd', 2644, NULL);
INSERT INTO `pcd` VALUES (2650, '蓬安县', 'd', 2644, NULL);
INSERT INTO `pcd` VALUES (2651, '仪陇县', 'd', 2644, NULL);
INSERT INTO `pcd` VALUES (2652, '南部县', 'd', 2644, NULL);
INSERT INTO `pcd` VALUES (2653, '西充县', 'd', 2644, NULL);
INSERT INTO `pcd` VALUES (2654, '其他', 'd', 2644, NULL);
INSERT INTO `pcd` VALUES (2655, '眉山', 'c', 2543, 'A5');
INSERT INTO `pcd` VALUES (2656, '东坡区', 'd', 2655, NULL);
INSERT INTO `pcd` VALUES (2657, '仁寿县', 'd', 2655, NULL);
INSERT INTO `pcd` VALUES (2658, '彭山县', 'd', 2655, NULL);
INSERT INTO `pcd` VALUES (2659, '洪雅县', 'd', 2655, NULL);
INSERT INTO `pcd` VALUES (2660, '丹棱县', 'd', 2655, NULL);
INSERT INTO `pcd` VALUES (2661, '青神县', 'd', 2655, NULL);
INSERT INTO `pcd` VALUES (2662, '其他', 'd', 2655, NULL);
INSERT INTO `pcd` VALUES (2663, '宜宾', 'c', 2543, 'A4');
INSERT INTO `pcd` VALUES (2664, '翠屏区', 'd', 2663, NULL);
INSERT INTO `pcd` VALUES (2665, '宜宾县', 'd', 2663, 'A4');
INSERT INTO `pcd` VALUES (2666, '兴文县', 'd', 2663, NULL);
INSERT INTO `pcd` VALUES (2667, '南溪县', 'd', 2663, NULL);
INSERT INTO `pcd` VALUES (2668, '珙县', 'd', 2663, NULL);
INSERT INTO `pcd` VALUES (2669, '长宁县', 'd', 2663, NULL);
INSERT INTO `pcd` VALUES (2670, '高县', 'd', 2663, NULL);
INSERT INTO `pcd` VALUES (2671, '江安县', 'd', 2663, NULL);
INSERT INTO `pcd` VALUES (2672, '筠连县', 'd', 2663, NULL);
INSERT INTO `pcd` VALUES (2673, '屏山县', 'd', 2663, NULL);
INSERT INTO `pcd` VALUES (2674, '其他', 'd', 2663, NULL);
INSERT INTO `pcd` VALUES (2675, '广安', 'c', 2543, 'A5');
INSERT INTO `pcd` VALUES (2676, '广安区', 'd', 2675, 'A5');
INSERT INTO `pcd` VALUES (2677, '华蓥市', 'd', 2675, NULL);
INSERT INTO `pcd` VALUES (2678, '岳池县', 'd', 2675, NULL);
INSERT INTO `pcd` VALUES (2679, '邻水县', 'd', 2675, NULL);
INSERT INTO `pcd` VALUES (2680, '武胜县', 'd', 2675, NULL);
INSERT INTO `pcd` VALUES (2681, '其他', 'd', 2675, NULL);
INSERT INTO `pcd` VALUES (2682, '达州', 'c', 2543, 'A4');
INSERT INTO `pcd` VALUES (2683, '通川区', 'd', 2682, NULL);
INSERT INTO `pcd` VALUES (2684, '万源市', 'd', 2682, NULL);
INSERT INTO `pcd` VALUES (2685, '达县', 'd', 2682, NULL);
INSERT INTO `pcd` VALUES (2686, '渠县', 'd', 2682, NULL);
INSERT INTO `pcd` VALUES (2687, '宣汉县', 'd', 2682, NULL);
INSERT INTO `pcd` VALUES (2688, '开江县', 'd', 2682, NULL);
INSERT INTO `pcd` VALUES (2689, '大竹县', 'd', 2682, NULL);
INSERT INTO `pcd` VALUES (2690, '其他', 'd', 2682, NULL);
INSERT INTO `pcd` VALUES (2691, '雅安', 'c', 2543, 'A5');
INSERT INTO `pcd` VALUES (2692, '雨城区', 'd', 2691, NULL);
INSERT INTO `pcd` VALUES (2693, '芦山县', 'd', 2691, NULL);
INSERT INTO `pcd` VALUES (2694, '石棉县', 'd', 2691, NULL);
INSERT INTO `pcd` VALUES (2695, '名山县', 'd', 2691, NULL);
INSERT INTO `pcd` VALUES (2696, '天全县', 'd', 2691, NULL);
INSERT INTO `pcd` VALUES (2697, '荥经县', 'd', 2691, NULL);
INSERT INTO `pcd` VALUES (2698, '宝兴县', 'd', 2691, NULL);
INSERT INTO `pcd` VALUES (2699, '汉源县', 'd', 2691, NULL);
INSERT INTO `pcd` VALUES (2700, '其他', 'd', 2691, NULL);
INSERT INTO `pcd` VALUES (2701, '巴中', 'c', 2543, 'A5');
INSERT INTO `pcd` VALUES (2702, '巴州区', 'd', 2701, NULL);
INSERT INTO `pcd` VALUES (2703, '南江县', 'd', 2701, NULL);
INSERT INTO `pcd` VALUES (2704, '平昌县', 'd', 2701, NULL);
INSERT INTO `pcd` VALUES (2705, '通江县', 'd', 2701, NULL);
INSERT INTO `pcd` VALUES (2706, '其他', 'd', 2701, NULL);
INSERT INTO `pcd` VALUES (2707, '资阳', 'c', 2543, 'A5');
INSERT INTO `pcd` VALUES (2708, '雁江区', 'd', 2707, NULL);
INSERT INTO `pcd` VALUES (2709, '简阳市', 'd', 2707, 'A4');
INSERT INTO `pcd` VALUES (2710, '安岳县', 'd', 2707, NULL);
INSERT INTO `pcd` VALUES (2711, '乐至县', 'd', 2707, NULL);
INSERT INTO `pcd` VALUES (2712, '其他', 'd', 2707, NULL);
INSERT INTO `pcd` VALUES (2713, '阿坝藏族羌族自治州', 'c', 2543, 'A5');
INSERT INTO `pcd` VALUES (2714, '马尔康县', 'd', 2713, NULL);
INSERT INTO `pcd` VALUES (2715, '九寨沟县', 'd', 2713, NULL);
INSERT INTO `pcd` VALUES (2716, '红原县', 'd', 2713, NULL);
INSERT INTO `pcd` VALUES (2717, '汶川县', 'd', 2713, NULL);
INSERT INTO `pcd` VALUES (2718, '阿坝县', 'd', 2713, NULL);
INSERT INTO `pcd` VALUES (2719, '理县', 'd', 2713, NULL);
INSERT INTO `pcd` VALUES (2720, '若尔盖县', 'd', 2713, NULL);
INSERT INTO `pcd` VALUES (2721, '小金县', 'd', 2713, NULL);
INSERT INTO `pcd` VALUES (2722, '黑水县', 'd', 2713, NULL);
INSERT INTO `pcd` VALUES (2723, '金川县', 'd', 2713, NULL);
INSERT INTO `pcd` VALUES (2724, '松潘县', 'd', 2713, NULL);
INSERT INTO `pcd` VALUES (2725, '壤塘县', 'd', 2713, NULL);
INSERT INTO `pcd` VALUES (2726, '茂县', 'd', 2713, NULL);
INSERT INTO `pcd` VALUES (2727, '其他', 'd', 2713, NULL);
INSERT INTO `pcd` VALUES (2728, '甘孜藏族自治州', 'c', 2543, 'A5');
INSERT INTO `pcd` VALUES (2729, '康定县', 'd', 2728, NULL);
INSERT INTO `pcd` VALUES (2730, '丹巴县', 'd', 2728, NULL);
INSERT INTO `pcd` VALUES (2731, '炉霍县', 'd', 2728, NULL);
INSERT INTO `pcd` VALUES (2732, '九龙县', 'd', 2728, NULL);
INSERT INTO `pcd` VALUES (2733, '甘孜县', 'd', 2728, NULL);
INSERT INTO `pcd` VALUES (2734, '雅江县', 'd', 2728, NULL);
INSERT INTO `pcd` VALUES (2735, '新龙县', 'd', 2728, NULL);
INSERT INTO `pcd` VALUES (2736, '道孚县', 'd', 2728, NULL);
INSERT INTO `pcd` VALUES (2737, '白玉县', 'd', 2728, NULL);
INSERT INTO `pcd` VALUES (2738, '理塘县', 'd', 2728, NULL);
INSERT INTO `pcd` VALUES (2739, '德格县', 'd', 2728, NULL);
INSERT INTO `pcd` VALUES (2740, '乡城县', 'd', 2728, NULL);
INSERT INTO `pcd` VALUES (2741, '石渠县', 'd', 2728, NULL);
INSERT INTO `pcd` VALUES (2742, '稻城县', 'd', 2728, NULL);
INSERT INTO `pcd` VALUES (2743, '色达县', 'd', 2728, NULL);
INSERT INTO `pcd` VALUES (2744, '巴塘县', 'd', 2728, NULL);
INSERT INTO `pcd` VALUES (2745, '泸定县', 'd', 2728, NULL);
INSERT INTO `pcd` VALUES (2746, '得荣县', 'd', 2728, NULL);
INSERT INTO `pcd` VALUES (2747, '其他', 'd', 2728, NULL);
INSERT INTO `pcd` VALUES (2748, '凉山彝族自治州', 'c', 2543, 'A4');
INSERT INTO `pcd` VALUES (2749, '西昌市', 'd', 2748, NULL);
INSERT INTO `pcd` VALUES (2750, '美姑县', 'd', 2748, NULL);
INSERT INTO `pcd` VALUES (2751, '昭觉县', 'd', 2748, NULL);
INSERT INTO `pcd` VALUES (2752, '金阳县', 'd', 2748, NULL);
INSERT INTO `pcd` VALUES (2753, '甘洛县', 'd', 2748, NULL);
INSERT INTO `pcd` VALUES (2754, '布拖县', 'd', 2748, NULL);
INSERT INTO `pcd` VALUES (2755, '雷波县', 'd', 2748, NULL);
INSERT INTO `pcd` VALUES (2756, '普格县', 'd', 2748, NULL);
INSERT INTO `pcd` VALUES (2757, '宁南县', 'd', 2748, NULL);
INSERT INTO `pcd` VALUES (2758, '喜德县', 'd', 2748, NULL);
INSERT INTO `pcd` VALUES (2759, '会东县', 'd', 2748, NULL);
INSERT INTO `pcd` VALUES (2760, '越西县', 'd', 2748, NULL);
INSERT INTO `pcd` VALUES (2761, '会理县', 'd', 2748, NULL);
INSERT INTO `pcd` VALUES (2762, '盐源县', 'd', 2748, NULL);
INSERT INTO `pcd` VALUES (2763, '德昌县', 'd', 2748, NULL);
INSERT INTO `pcd` VALUES (2764, '冕宁县', 'd', 2748, NULL);
INSERT INTO `pcd` VALUES (2765, '木里藏族自治县', 'd', 2748, NULL);
INSERT INTO `pcd` VALUES (2766, '其他', 'd', 2748, NULL);
INSERT INTO `pcd` VALUES (2767, '其他', 'c', 2543, NULL);
INSERT INTO `pcd` VALUES (2768, '其他', 'd', 2767, NULL);
INSERT INTO `pcd` VALUES (2769, '贵州', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (2770, '贵阳', 'c', 2769, 'A3');
INSERT INTO `pcd` VALUES (2771, '南明区', 'd', 2770, NULL);
INSERT INTO `pcd` VALUES (2772, '云岩区', 'd', 2770, NULL);
INSERT INTO `pcd` VALUES (2773, '花溪区', 'd', 2770, NULL);
INSERT INTO `pcd` VALUES (2774, '乌当区', 'd', 2770, NULL);
INSERT INTO `pcd` VALUES (2775, '白云区', 'd', 2770, NULL);
INSERT INTO `pcd` VALUES (2776, '小河区', 'd', 2770, NULL);
INSERT INTO `pcd` VALUES (2777, '清镇市', 'd', 2770, NULL);
INSERT INTO `pcd` VALUES (2778, '开阳县', 'd', 2770, NULL);
INSERT INTO `pcd` VALUES (2779, '修文县', 'd', 2770, NULL);
INSERT INTO `pcd` VALUES (2780, '息烽县', 'd', 2770, NULL);
INSERT INTO `pcd` VALUES (2781, '其他', 'd', 2770, NULL);
INSERT INTO `pcd` VALUES (2782, '六盘水', 'c', 2769, 'A4');
INSERT INTO `pcd` VALUES (2783, '钟山区', 'd', 2782, NULL);
INSERT INTO `pcd` VALUES (2784, '水城县', 'd', 2782, NULL);
INSERT INTO `pcd` VALUES (2785, '盘县', 'd', 2782, NULL);
INSERT INTO `pcd` VALUES (2786, '六枝特区', 'd', 2782, NULL);
INSERT INTO `pcd` VALUES (2787, '其他', 'd', 2782, NULL);
INSERT INTO `pcd` VALUES (2788, '遵义', 'c', 2769, 'A4');
INSERT INTO `pcd` VALUES (2789, '红花岗区', 'd', 2788, NULL);
INSERT INTO `pcd` VALUES (2790, '汇川区', 'd', 2788, NULL);
INSERT INTO `pcd` VALUES (2791, '赤水市', 'd', 2788, NULL);
INSERT INTO `pcd` VALUES (2792, '仁怀市', 'd', 2788, NULL);
INSERT INTO `pcd` VALUES (2793, '遵义县', 'd', 2788, 'A4');
INSERT INTO `pcd` VALUES (2794, '绥阳县', 'd', 2788, NULL);
INSERT INTO `pcd` VALUES (2795, '桐梓县', 'd', 2788, NULL);
INSERT INTO `pcd` VALUES (2796, '习水县', 'd', 2788, NULL);
INSERT INTO `pcd` VALUES (2797, '凤冈县', 'd', 2788, NULL);
INSERT INTO `pcd` VALUES (2798, '正安县', 'd', 2788, NULL);
INSERT INTO `pcd` VALUES (2799, '余庆县', 'd', 2788, NULL);
INSERT INTO `pcd` VALUES (2800, '湄潭县', 'd', 2788, NULL);
INSERT INTO `pcd` VALUES (2801, '道真仡佬族苗族自治县', 'd', 2788, NULL);
INSERT INTO `pcd` VALUES (2802, '务川仡佬族苗族自治县', 'd', 2788, NULL);
INSERT INTO `pcd` VALUES (2803, '其他', 'd', 2788, NULL);
INSERT INTO `pcd` VALUES (2804, '安顺', 'c', 2769, 'A5');
INSERT INTO `pcd` VALUES (2805, '西秀区', 'd', 2804, NULL);
INSERT INTO `pcd` VALUES (2806, '普定县', 'd', 2804, NULL);
INSERT INTO `pcd` VALUES (2807, '平坝县', 'd', 2804, NULL);
INSERT INTO `pcd` VALUES (2808, '镇宁布依族苗族自治县', 'd', 2804, NULL);
INSERT INTO `pcd` VALUES (2809, '紫云苗族布依族自治县', 'd', 2804, NULL);
INSERT INTO `pcd` VALUES (2810, '关岭布依族苗族自治县', 'd', 2804, NULL);
INSERT INTO `pcd` VALUES (2811, '其他', 'd', 2804, NULL);
INSERT INTO `pcd` VALUES (2812, '铜仁地区', 'c', 2769, 'A5');
INSERT INTO `pcd` VALUES (2813, '铜仁市', 'd', 2812, 'A5');
INSERT INTO `pcd` VALUES (2814, '德江县', 'd', 2812, NULL);
INSERT INTO `pcd` VALUES (2815, '江口县', 'd', 2812, NULL);
INSERT INTO `pcd` VALUES (2816, '思南县', 'd', 2812, NULL);
INSERT INTO `pcd` VALUES (2817, '石阡县', 'd', 2812, NULL);
INSERT INTO `pcd` VALUES (2818, '玉屏侗族自治县', 'd', 2812, NULL);
INSERT INTO `pcd` VALUES (2819, '松桃苗族自治县', 'd', 2812, NULL);
INSERT INTO `pcd` VALUES (2820, '印江土家族苗族自治县', 'd', 2812, NULL);
INSERT INTO `pcd` VALUES (2821, '沿河土家族自治县', 'd', 2812, NULL);
INSERT INTO `pcd` VALUES (2822, '万山特区', 'd', 2812, NULL);
INSERT INTO `pcd` VALUES (2823, '其他', 'd', 2812, NULL);
INSERT INTO `pcd` VALUES (2824, '毕节地区', 'c', 2769, 'A4');
INSERT INTO `pcd` VALUES (2825, '毕节市', 'd', 2824, 'A4');
INSERT INTO `pcd` VALUES (2826, '黔西县', 'd', 2824, NULL);
INSERT INTO `pcd` VALUES (2827, '大方县', 'd', 2824, NULL);
INSERT INTO `pcd` VALUES (2828, '织金县', 'd', 2824, NULL);
INSERT INTO `pcd` VALUES (2829, '金沙县', 'd', 2824, NULL);
INSERT INTO `pcd` VALUES (2830, '赫章县', 'd', 2824, NULL);
INSERT INTO `pcd` VALUES (2831, '纳雍县', 'd', 2824, NULL);
INSERT INTO `pcd` VALUES (2832, '威宁彝族回族苗族自治县', 'd', 2824, NULL);
INSERT INTO `pcd` VALUES (2833, '其他', 'd', 2824, NULL);
INSERT INTO `pcd` VALUES (2834, '黔西南布依族苗族自治州', 'c', 2769, 'A5');
INSERT INTO `pcd` VALUES (2835, '兴义市', 'd', 2834, NULL);
INSERT INTO `pcd` VALUES (2836, '望谟县', 'd', 2834, NULL);
INSERT INTO `pcd` VALUES (2837, '兴仁县', 'd', 2834, NULL);
INSERT INTO `pcd` VALUES (2838, '普安县', 'd', 2834, NULL);
INSERT INTO `pcd` VALUES (2839, '册亨县', 'd', 2834, NULL);
INSERT INTO `pcd` VALUES (2840, '晴隆县', 'd', 2834, NULL);
INSERT INTO `pcd` VALUES (2841, '贞丰县', 'd', 2834, NULL);
INSERT INTO `pcd` VALUES (2842, '安龙县', 'd', 2834, NULL);
INSERT INTO `pcd` VALUES (2843, '其他', 'd', 2834, NULL);
INSERT INTO `pcd` VALUES (2844, '黔东南苗族侗族自治州', 'c', 2769, 'A5');
INSERT INTO `pcd` VALUES (2845, '凯里市', 'd', 2844, 'A5');
INSERT INTO `pcd` VALUES (2846, '施秉县', 'd', 2844, NULL);
INSERT INTO `pcd` VALUES (2847, '从江县', 'd', 2844, NULL);
INSERT INTO `pcd` VALUES (2848, '锦屏县', 'd', 2844, NULL);
INSERT INTO `pcd` VALUES (2849, '镇远县', 'd', 2844, NULL);
INSERT INTO `pcd` VALUES (2850, '麻江县', 'd', 2844, NULL);
INSERT INTO `pcd` VALUES (2851, '台江县', 'd', 2844, NULL);
INSERT INTO `pcd` VALUES (2852, '天柱县', 'd', 2844, NULL);
INSERT INTO `pcd` VALUES (2853, '黄平县', 'd', 2844, NULL);
INSERT INTO `pcd` VALUES (2854, '榕江县', 'd', 2844, NULL);
INSERT INTO `pcd` VALUES (2855, '剑河县', 'd', 2844, NULL);
INSERT INTO `pcd` VALUES (2856, '三穗县', 'd', 2844, NULL);
INSERT INTO `pcd` VALUES (2857, '雷山县', 'd', 2844, NULL);
INSERT INTO `pcd` VALUES (2858, '黎平县', 'd', 2844, NULL);
INSERT INTO `pcd` VALUES (2859, '岑巩县', 'd', 2844, NULL);
INSERT INTO `pcd` VALUES (2860, '丹寨县', 'd', 2844, 'A5');
INSERT INTO `pcd` VALUES (2861, '其他', 'd', 2844, NULL);
INSERT INTO `pcd` VALUES (2862, '黔南布依族苗族自治州', 'c', 2769, 'A5');
INSERT INTO `pcd` VALUES (2863, '都匀市', 'd', 2862, 'A5');
INSERT INTO `pcd` VALUES (2864, '福泉市', 'd', 2862, 'A5');
INSERT INTO `pcd` VALUES (2865, '贵定县', 'd', 2862, NULL);
INSERT INTO `pcd` VALUES (2866, '惠水县', 'd', 2862, NULL);
INSERT INTO `pcd` VALUES (2867, '罗甸县', 'd', 2862, NULL);
INSERT INTO `pcd` VALUES (2868, '瓮安县', 'd', 2862, NULL);
INSERT INTO `pcd` VALUES (2869, '荔波县', 'd', 2862, NULL);
INSERT INTO `pcd` VALUES (2870, '龙里县', 'd', 2862, NULL);
INSERT INTO `pcd` VALUES (2871, '平塘县', 'd', 2862, NULL);
INSERT INTO `pcd` VALUES (2872, '长顺县', 'd', 2862, NULL);
INSERT INTO `pcd` VALUES (2873, '独山县', 'd', 2862, NULL);
INSERT INTO `pcd` VALUES (2874, '三都水族自治县', 'd', 2862, NULL);
INSERT INTO `pcd` VALUES (2875, '其他', 'd', 2862, NULL);
INSERT INTO `pcd` VALUES (2876, '其他', 'c', 2769, NULL);
INSERT INTO `pcd` VALUES (2877, '其他', 'd', 2876, NULL);
INSERT INTO `pcd` VALUES (2878, '云南', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (2879, '昆明', 'c', 2878, 'A3');
INSERT INTO `pcd` VALUES (2880, '盘龙区', 'd', 2879, NULL);
INSERT INTO `pcd` VALUES (2881, '五华区', 'd', 2879, NULL);
INSERT INTO `pcd` VALUES (2882, '官渡区', 'd', 2879, NULL);
INSERT INTO `pcd` VALUES (2883, '西山区', 'd', 2879, NULL);
INSERT INTO `pcd` VALUES (2884, '东川区', 'd', 2879, NULL);
INSERT INTO `pcd` VALUES (2885, '安宁市', 'd', 2879, NULL);
INSERT INTO `pcd` VALUES (2886, '呈贡县', 'd', 2879, NULL);
INSERT INTO `pcd` VALUES (2887, '晋宁县', 'd', 2879, NULL);
INSERT INTO `pcd` VALUES (2888, '富民县', 'd', 2879, NULL);
INSERT INTO `pcd` VALUES (2889, '宜良县', 'd', 2879, NULL);
INSERT INTO `pcd` VALUES (2890, '嵩明县', 'd', 2879, NULL);
INSERT INTO `pcd` VALUES (2891, '石林彝族自治县', 'd', 2879, NULL);
INSERT INTO `pcd` VALUES (2892, '禄劝彝族苗族自治县', 'd', 2879, NULL);
INSERT INTO `pcd` VALUES (2893, '寻甸回族彝族自治县', 'd', 2879, NULL);
INSERT INTO `pcd` VALUES (2894, '其他', 'd', 2879, NULL);
INSERT INTO `pcd` VALUES (2895, '曲靖', 'c', 2878, 'A4');
INSERT INTO `pcd` VALUES (2896, '麒麟区', 'd', 2895, NULL);
INSERT INTO `pcd` VALUES (2897, '宣威市', 'd', 2895, NULL);
INSERT INTO `pcd` VALUES (2898, '马龙县', 'd', 2895, NULL);
INSERT INTO `pcd` VALUES (2899, '沾益县', 'd', 2895, NULL);
INSERT INTO `pcd` VALUES (2900, '富源县', 'd', 2895, NULL);
INSERT INTO `pcd` VALUES (2901, '罗平县', 'd', 2895, NULL);
INSERT INTO `pcd` VALUES (2902, '师宗县', 'd', 2895, NULL);
INSERT INTO `pcd` VALUES (2903, '陆良县', 'd', 2895, NULL);
INSERT INTO `pcd` VALUES (2904, '会泽县', 'd', 2895, NULL);
INSERT INTO `pcd` VALUES (2905, '其他', 'd', 2895, NULL);
INSERT INTO `pcd` VALUES (2906, '玉溪', 'c', 2878, 'A4');
INSERT INTO `pcd` VALUES (2907, '红塔区', 'd', 2906, NULL);
INSERT INTO `pcd` VALUES (2908, '江川县', 'd', 2906, NULL);
INSERT INTO `pcd` VALUES (2909, '澄江县', 'd', 2906, NULL);
INSERT INTO `pcd` VALUES (2910, '通海县', 'd', 2906, NULL);
INSERT INTO `pcd` VALUES (2911, '华宁县', 'd', 2906, NULL);
INSERT INTO `pcd` VALUES (2912, '易门县', 'd', 2906, NULL);
INSERT INTO `pcd` VALUES (2913, '峨山彝族自治县', 'd', 2906, NULL);
INSERT INTO `pcd` VALUES (2914, '新平彝族傣族自治县', 'd', 2906, NULL);
INSERT INTO `pcd` VALUES (2915, '元江哈尼族彝族傣族自治县', 'd', 2906, NULL);
INSERT INTO `pcd` VALUES (2916, '其他', 'd', 2906, NULL);
INSERT INTO `pcd` VALUES (2917, '保山', 'c', 2878, 'A5');
INSERT INTO `pcd` VALUES (2918, '隆阳区', 'd', 2917, NULL);
INSERT INTO `pcd` VALUES (2919, '施甸县', 'd', 2917, NULL);
INSERT INTO `pcd` VALUES (2920, '腾冲县', 'd', 2917, NULL);
INSERT INTO `pcd` VALUES (2921, '龙陵县', 'd', 2917, NULL);
INSERT INTO `pcd` VALUES (2922, '昌宁县', 'd', 2917, NULL);
INSERT INTO `pcd` VALUES (2923, '其他', 'd', 2917, NULL);
INSERT INTO `pcd` VALUES (2924, '昭通', 'c', 2878, 'A5');
INSERT INTO `pcd` VALUES (2925, '昭阳区', 'd', 2924, NULL);
INSERT INTO `pcd` VALUES (2926, '鲁甸县', 'd', 2924, NULL);
INSERT INTO `pcd` VALUES (2927, '巧家县', 'd', 2924, NULL);
INSERT INTO `pcd` VALUES (2928, '盐津县', 'd', 2924, NULL);
INSERT INTO `pcd` VALUES (2929, '大关县', 'd', 2924, NULL);
INSERT INTO `pcd` VALUES (2930, '永善县', 'd', 2924, NULL);
INSERT INTO `pcd` VALUES (2931, '绥江县', 'd', 2924, NULL);
INSERT INTO `pcd` VALUES (2932, '镇雄县', 'd', 2924, NULL);
INSERT INTO `pcd` VALUES (2933, '彝良县', 'd', 2924, NULL);
INSERT INTO `pcd` VALUES (2934, '威信县', 'd', 2924, NULL);
INSERT INTO `pcd` VALUES (2935, '水富县', 'd', 2924, NULL);
INSERT INTO `pcd` VALUES (2936, '其他', 'd', 2924, NULL);
INSERT INTO `pcd` VALUES (2937, '丽江', 'c', 2878, 'A5');
INSERT INTO `pcd` VALUES (2938, '古城区', 'd', 2937, NULL);
INSERT INTO `pcd` VALUES (2939, '永胜县', 'd', 2937, NULL);
INSERT INTO `pcd` VALUES (2940, '华坪县', 'd', 2937, NULL);
INSERT INTO `pcd` VALUES (2941, '玉龙纳西族自治县', 'd', 2937, NULL);
INSERT INTO `pcd` VALUES (2942, '宁蒗彝族自治县', 'd', 2937, NULL);
INSERT INTO `pcd` VALUES (2943, '其他', 'd', 2937, NULL);
INSERT INTO `pcd` VALUES (2944, '普洱', 'c', 2878, 'A5');
INSERT INTO `pcd` VALUES (2945, '思茅区', 'd', 2944, NULL);
INSERT INTO `pcd` VALUES (2946, '普洱哈尼族彝族自治县', 'd', 2944, 'A5');
INSERT INTO `pcd` VALUES (2947, '墨江哈尼族自治县', 'd', 2944, NULL);
INSERT INTO `pcd` VALUES (2948, '景东彝族自治县', 'd', 2944, NULL);
INSERT INTO `pcd` VALUES (2949, '景谷傣族彝族自治县', 'd', 2944, NULL);
INSERT INTO `pcd` VALUES (2950, '镇沅彝族哈尼族拉祜族自治县', 'd', 2944, NULL);
INSERT INTO `pcd` VALUES (2951, '江城哈尼族彝族自治县', 'd', 2944, NULL);
INSERT INTO `pcd` VALUES (2952, '孟连傣族拉祜族佤族自治县', 'd', 2944, NULL);
INSERT INTO `pcd` VALUES (2953, '澜沧拉祜族自治县', 'd', 2944, NULL);
INSERT INTO `pcd` VALUES (2954, '西盟佤族自治县', 'd', 2944, NULL);
INSERT INTO `pcd` VALUES (2955, '其他', 'd', 2944, NULL);
INSERT INTO `pcd` VALUES (2956, '临沧', 'c', 2878, 'A5');
INSERT INTO `pcd` VALUES (2957, '临翔区', 'd', 2956, NULL);
INSERT INTO `pcd` VALUES (2958, '凤庆县', 'd', 2956, NULL);
INSERT INTO `pcd` VALUES (2959, '云县', 'd', 2956, NULL);
INSERT INTO `pcd` VALUES (2960, '永德县', 'd', 2956, NULL);
INSERT INTO `pcd` VALUES (2961, '镇康县', 'd', 2956, NULL);
INSERT INTO `pcd` VALUES (2962, '双江拉祜族佤族布朗族傣族自治县', 'd', 2956, NULL);
INSERT INTO `pcd` VALUES (2963, '耿马傣族佤族自治县', 'd', 2956, NULL);
INSERT INTO `pcd` VALUES (2964, '沧源佤族自治县', 'd', 2956, NULL);
INSERT INTO `pcd` VALUES (2965, '其他', 'd', 2956, NULL);
INSERT INTO `pcd` VALUES (2966, '德宏傣族景颇族自治州', 'c', 2878, 'A5');
INSERT INTO `pcd` VALUES (2967, '潞西市', 'd', 2966, NULL);
INSERT INTO `pcd` VALUES (2968, '瑞丽市', 'd', 2966, NULL);
INSERT INTO `pcd` VALUES (2969, '梁河县', 'd', 2966, NULL);
INSERT INTO `pcd` VALUES (2970, '盈江县', 'd', 2966, NULL);
INSERT INTO `pcd` VALUES (2971, '陇川县', 'd', 2966, NULL);
INSERT INTO `pcd` VALUES (2972, '其他', 'd', 2966, NULL);
INSERT INTO `pcd` VALUES (2973, '怒江傈僳族自治州', 'c', 2878, 'A5');
INSERT INTO `pcd` VALUES (2974, '泸水县', 'd', 2973, NULL);
INSERT INTO `pcd` VALUES (2975, '福贡县', 'd', 2973, NULL);
INSERT INTO `pcd` VALUES (2976, '贡山独龙族怒族自治县', 'd', 2973, NULL);
INSERT INTO `pcd` VALUES (2977, '兰坪白族普米族自治县', 'd', 2973, NULL);
INSERT INTO `pcd` VALUES (2978, '其他', 'd', 2973, NULL);
INSERT INTO `pcd` VALUES (2979, '迪庆藏族自治州', 'c', 2878, 'A5');
INSERT INTO `pcd` VALUES (2980, '香格里拉县', 'd', 2979, NULL);
INSERT INTO `pcd` VALUES (2981, '德钦县', 'd', 2979, NULL);
INSERT INTO `pcd` VALUES (2982, '维西傈僳族自治县', 'd', 2979, NULL);
INSERT INTO `pcd` VALUES (2983, '其他', 'd', 2979, NULL);
INSERT INTO `pcd` VALUES (2984, '大理白族自治州', 'c', 2878, 'A5');
INSERT INTO `pcd` VALUES (2985, '大理市', 'd', 2984, NULL);
INSERT INTO `pcd` VALUES (2986, '祥云县', 'd', 2984, NULL);
INSERT INTO `pcd` VALUES (2987, '宾川县', 'd', 2984, NULL);
INSERT INTO `pcd` VALUES (2988, '弥渡县', 'd', 2984, NULL);
INSERT INTO `pcd` VALUES (2989, '永平县', 'd', 2984, NULL);
INSERT INTO `pcd` VALUES (2990, '云龙县', 'd', 2984, NULL);
INSERT INTO `pcd` VALUES (2991, '洱源县', 'd', 2984, NULL);
INSERT INTO `pcd` VALUES (2992, '剑川县', 'd', 2984, NULL);
INSERT INTO `pcd` VALUES (2993, '鹤庆县', 'd', 2984, NULL);
INSERT INTO `pcd` VALUES (2994, '漾濞彝族自治县', 'd', 2984, NULL);
INSERT INTO `pcd` VALUES (2995, '南涧彝族自治县', 'd', 2984, NULL);
INSERT INTO `pcd` VALUES (2996, '巍山彝族回族自治县', 'd', 2984, NULL);
INSERT INTO `pcd` VALUES (2997, '其他', 'd', 2984, NULL);
INSERT INTO `pcd` VALUES (2998, '楚雄彝族自治州', 'c', 2878, 'A5');
INSERT INTO `pcd` VALUES (2999, '楚雄市', 'd', 2998, 'A5');
INSERT INTO `pcd` VALUES (3000, '双柏县', 'd', 2998, NULL);
INSERT INTO `pcd` VALUES (3001, '牟定县', 'd', 2998, NULL);
INSERT INTO `pcd` VALUES (3002, '南华县', 'd', 2998, NULL);
INSERT INTO `pcd` VALUES (3003, '姚安县', 'd', 2998, NULL);
INSERT INTO `pcd` VALUES (3004, '大姚县', 'd', 2998, NULL);
INSERT INTO `pcd` VALUES (3005, '永仁县', 'd', 2998, NULL);
INSERT INTO `pcd` VALUES (3006, '元谋县', 'd', 2998, NULL);
INSERT INTO `pcd` VALUES (3007, '武定县', 'd', 2998, NULL);
INSERT INTO `pcd` VALUES (3008, '禄丰县', 'd', 2998, NULL);
INSERT INTO `pcd` VALUES (3009, '其他', 'd', 2998, NULL);
INSERT INTO `pcd` VALUES (3010, '红河哈尼族彝族自治州', 'c', 2878, 'A4');
INSERT INTO `pcd` VALUES (3011, '蒙自县', 'd', 3010, NULL);
INSERT INTO `pcd` VALUES (3012, '个旧市', 'd', 3010, NULL);
INSERT INTO `pcd` VALUES (3013, '开远市', 'd', 3010, NULL);
INSERT INTO `pcd` VALUES (3014, '绿春县', 'd', 3010, NULL);
INSERT INTO `pcd` VALUES (3015, '建水县', 'd', 3010, NULL);
INSERT INTO `pcd` VALUES (3016, '石屏县', 'd', 3010, NULL);
INSERT INTO `pcd` VALUES (3017, '弥勒县', 'd', 3010, NULL);
INSERT INTO `pcd` VALUES (3018, '泸西县', 'd', 3010, NULL);
INSERT INTO `pcd` VALUES (3019, '元阳县', 'd', 3010, NULL);
INSERT INTO `pcd` VALUES (3020, '红河县', 'd', 3010, NULL);
INSERT INTO `pcd` VALUES (3021, '金平苗族瑶族傣族自治县', 'd', 3010, NULL);
INSERT INTO `pcd` VALUES (3022, '河口瑶族自治县', 'd', 3010, NULL);
INSERT INTO `pcd` VALUES (3023, '屏边苗族自治县', 'd', 3010, NULL);
INSERT INTO `pcd` VALUES (3024, '其他', 'd', 3010, NULL);
INSERT INTO `pcd` VALUES (3025, '文山壮族苗族自治州', 'c', 2878, 'A5');
INSERT INTO `pcd` VALUES (3026, '文山县', 'd', 3025, NULL);
INSERT INTO `pcd` VALUES (3027, '砚山县', 'd', 3025, NULL);
INSERT INTO `pcd` VALUES (3028, '西畴县', 'd', 3025, NULL);
INSERT INTO `pcd` VALUES (3029, '麻栗坡县', 'd', 3025, NULL);
INSERT INTO `pcd` VALUES (3030, '马关县', 'd', 3025, NULL);
INSERT INTO `pcd` VALUES (3031, '丘北县', 'd', 3025, NULL);
INSERT INTO `pcd` VALUES (3032, '广南县', 'd', 3025, NULL);
INSERT INTO `pcd` VALUES (3033, '富宁县', 'd', 3025, NULL);
INSERT INTO `pcd` VALUES (3034, '其他', 'd', 3025, NULL);
INSERT INTO `pcd` VALUES (3035, '西双版纳傣族自治州', 'c', 2878, 'A5');
INSERT INTO `pcd` VALUES (3036, '景洪市', 'd', 3035, NULL);
INSERT INTO `pcd` VALUES (3037, '勐海县', 'd', 3035, NULL);
INSERT INTO `pcd` VALUES (3038, '勐腊县', 'd', 3035, NULL);
INSERT INTO `pcd` VALUES (3039, '其他', 'd', 3035, NULL);
INSERT INTO `pcd` VALUES (3040, '其他', 'c', 2878, NULL);
INSERT INTO `pcd` VALUES (3041, '其他', 'd', 3040, NULL);
INSERT INTO `pcd` VALUES (3042, '西藏', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (3043, '拉萨', 'c', 3042, 'A3');
INSERT INTO `pcd` VALUES (3044, '城关区', 'd', 3043, NULL);
INSERT INTO `pcd` VALUES (3045, '林周县', 'd', 3043, NULL);
INSERT INTO `pcd` VALUES (3046, '当雄县', 'd', 3043, NULL);
INSERT INTO `pcd` VALUES (3047, '尼木县', 'd', 3043, NULL);
INSERT INTO `pcd` VALUES (3048, '曲水县', 'd', 3043, NULL);
INSERT INTO `pcd` VALUES (3049, '堆龙德庆县', 'd', 3043, NULL);
INSERT INTO `pcd` VALUES (3050, '达孜县', 'd', 3043, NULL);
INSERT INTO `pcd` VALUES (3051, '墨竹工卡县', 'd', 3043, NULL);
INSERT INTO `pcd` VALUES (3052, '其他', 'd', 3043, NULL);
INSERT INTO `pcd` VALUES (3053, '那曲地区', 'c', 3042, 'A5');
INSERT INTO `pcd` VALUES (3054, '那曲县', 'd', 3053, NULL);
INSERT INTO `pcd` VALUES (3055, '嘉黎县', 'd', 3053, NULL);
INSERT INTO `pcd` VALUES (3056, '比如县', 'd', 3053, NULL);
INSERT INTO `pcd` VALUES (3057, '聂荣县', 'd', 3053, NULL);
INSERT INTO `pcd` VALUES (3058, '安多县', 'd', 3053, NULL);
INSERT INTO `pcd` VALUES (3059, '申扎县', 'd', 3053, NULL);
INSERT INTO `pcd` VALUES (3060, '索县', 'd', 3053, NULL);
INSERT INTO `pcd` VALUES (3061, '班戈县', 'd', 3053, NULL);
INSERT INTO `pcd` VALUES (3062, '巴青县', 'd', 3053, NULL);
INSERT INTO `pcd` VALUES (3063, '尼玛县', 'd', 3053, NULL);
INSERT INTO `pcd` VALUES (3064, '其他', 'd', 3053, NULL);
INSERT INTO `pcd` VALUES (3065, '昌都地区', 'c', 3042, 'A5');
INSERT INTO `pcd` VALUES (3066, '昌都县', 'd', 3065, 'A5');
INSERT INTO `pcd` VALUES (3067, '江达县', 'd', 3065, NULL);
INSERT INTO `pcd` VALUES (3068, '贡觉县', 'd', 3065, NULL);
INSERT INTO `pcd` VALUES (3069, '类乌齐县', 'd', 3065, NULL);
INSERT INTO `pcd` VALUES (3070, '丁青县', 'd', 3065, NULL);
INSERT INTO `pcd` VALUES (3071, '察雅县', 'd', 3065, NULL);
INSERT INTO `pcd` VALUES (3072, '八宿县', 'd', 3065, NULL);
INSERT INTO `pcd` VALUES (3073, '左贡县', 'd', 3065, NULL);
INSERT INTO `pcd` VALUES (3074, '芒康县', 'd', 3065, NULL);
INSERT INTO `pcd` VALUES (3075, '洛隆县', 'd', 3065, NULL);
INSERT INTO `pcd` VALUES (3076, '边坝县', 'd', 3065, NULL);
INSERT INTO `pcd` VALUES (3077, '其他', 'd', 3065, NULL);
INSERT INTO `pcd` VALUES (3078, '林芝地区', 'c', 3042, 'A5');
INSERT INTO `pcd` VALUES (3079, '林芝县', 'd', 3078, 'A5');
INSERT INTO `pcd` VALUES (3080, '工布江达县', 'd', 3078, NULL);
INSERT INTO `pcd` VALUES (3081, '米林县', 'd', 3078, NULL);
INSERT INTO `pcd` VALUES (3082, '墨脱县', 'd', 3078, NULL);
INSERT INTO `pcd` VALUES (3083, '波密县', 'd', 3078, NULL);
INSERT INTO `pcd` VALUES (3084, '察隅县', 'd', 3078, NULL);
INSERT INTO `pcd` VALUES (3085, '朗县', 'd', 3078, NULL);
INSERT INTO `pcd` VALUES (3086, '其他', 'd', 3078, NULL);
INSERT INTO `pcd` VALUES (3087, '山南地区', 'c', 3042, 'A5');
INSERT INTO `pcd` VALUES (3088, '乃东县', 'd', 3087, NULL);
INSERT INTO `pcd` VALUES (3089, '扎囊县', 'd', 3087, NULL);
INSERT INTO `pcd` VALUES (3090, '贡嘎县', 'd', 3087, NULL);
INSERT INTO `pcd` VALUES (3091, '桑日县', 'd', 3087, NULL);
INSERT INTO `pcd` VALUES (3092, '琼结县', 'd', 3087, NULL);
INSERT INTO `pcd` VALUES (3093, '曲松县', 'd', 3087, NULL);
INSERT INTO `pcd` VALUES (3094, '措美县', 'd', 3087, NULL);
INSERT INTO `pcd` VALUES (3095, '洛扎县', 'd', 3087, NULL);
INSERT INTO `pcd` VALUES (3096, '加查县', 'd', 3087, NULL);
INSERT INTO `pcd` VALUES (3097, '隆子县', 'd', 3087, NULL);
INSERT INTO `pcd` VALUES (3098, '错那县', 'd', 3087, NULL);
INSERT INTO `pcd` VALUES (3099, '浪卡子县', 'd', 3087, NULL);
INSERT INTO `pcd` VALUES (3100, '其他', 'd', 3087, NULL);
INSERT INTO `pcd` VALUES (3101, '日喀则地区', 'c', 3042, 'A5');
INSERT INTO `pcd` VALUES (3102, '日喀则市', 'd', 3101, NULL);
INSERT INTO `pcd` VALUES (3103, '南木林县', 'd', 3101, NULL);
INSERT INTO `pcd` VALUES (3104, '江孜县', 'd', 3101, NULL);
INSERT INTO `pcd` VALUES (3105, '定日县', 'd', 3101, NULL);
INSERT INTO `pcd` VALUES (3106, '萨迦县', 'd', 3101, NULL);
INSERT INTO `pcd` VALUES (3107, '拉孜县', 'd', 3101, NULL);
INSERT INTO `pcd` VALUES (3108, '昂仁县', 'd', 3101, NULL);
INSERT INTO `pcd` VALUES (3109, '谢通门县', 'd', 3101, NULL);
INSERT INTO `pcd` VALUES (3110, '白朗县', 'd', 3101, NULL);
INSERT INTO `pcd` VALUES (3111, '仁布县', 'd', 3101, NULL);
INSERT INTO `pcd` VALUES (3112, '康马县', 'd', 3101, NULL);
INSERT INTO `pcd` VALUES (3113, '定结县', 'd', 3101, NULL);
INSERT INTO `pcd` VALUES (3114, '仲巴县', 'd', 3101, NULL);
INSERT INTO `pcd` VALUES (3115, '亚东县', 'd', 3101, NULL);
INSERT INTO `pcd` VALUES (3116, '吉隆县', 'd', 3101, NULL);
INSERT INTO `pcd` VALUES (3117, '聂拉木县', 'd', 3101, NULL);
INSERT INTO `pcd` VALUES (3118, '萨嘎县', 'd', 3101, NULL);
INSERT INTO `pcd` VALUES (3119, '岗巴县', 'd', 3101, NULL);
INSERT INTO `pcd` VALUES (3120, '其他', 'd', 3101, NULL);
INSERT INTO `pcd` VALUES (3121, '阿里地区', 'c', 3042, 'A5');
INSERT INTO `pcd` VALUES (3122, '噶尔县', 'd', 3121, NULL);
INSERT INTO `pcd` VALUES (3123, '普兰县', 'd', 3121, NULL);
INSERT INTO `pcd` VALUES (3124, '札达县', 'd', 3121, NULL);
INSERT INTO `pcd` VALUES (3125, '日土县', 'd', 3121, NULL);
INSERT INTO `pcd` VALUES (3126, '革吉县', 'd', 3121, NULL);
INSERT INTO `pcd` VALUES (3127, '改则县', 'd', 3121, NULL);
INSERT INTO `pcd` VALUES (3128, '措勤县', 'd', 3121, NULL);
INSERT INTO `pcd` VALUES (3129, '其他', 'd', 3121, NULL);
INSERT INTO `pcd` VALUES (3130, '其他', 'c', 3042, NULL);
INSERT INTO `pcd` VALUES (3131, '其他', 'd', 3130, NULL);
INSERT INTO `pcd` VALUES (3132, '陕西', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (3133, '西安', 'c', 3132, 'A2');
INSERT INTO `pcd` VALUES (3134, '莲湖区', 'd', 3133, NULL);
INSERT INTO `pcd` VALUES (3135, '新城区', 'd', 3133, NULL);
INSERT INTO `pcd` VALUES (3136, '碑林区', 'd', 3133, NULL);
INSERT INTO `pcd` VALUES (3137, '雁塔区', 'd', 3133, NULL);
INSERT INTO `pcd` VALUES (3138, '灞桥区', 'd', 3133, NULL);
INSERT INTO `pcd` VALUES (3139, '未央区', 'd', 3133, NULL);
INSERT INTO `pcd` VALUES (3140, '阎良区', 'd', 3133, NULL);
INSERT INTO `pcd` VALUES (3141, '临潼区', 'd', 3133, NULL);
INSERT INTO `pcd` VALUES (3142, '长安区', 'd', 3133, NULL);
INSERT INTO `pcd` VALUES (3143, '高陵县', 'd', 3133, NULL);
INSERT INTO `pcd` VALUES (3144, '蓝田县', 'd', 3133, NULL);
INSERT INTO `pcd` VALUES (3145, '户县', 'd', 3133, NULL);
INSERT INTO `pcd` VALUES (3146, '周至县', 'd', 3133, NULL);
INSERT INTO `pcd` VALUES (3147, '其他', 'd', 3133, NULL);
INSERT INTO `pcd` VALUES (3148, '铜川', 'c', 3132, 'A5');
INSERT INTO `pcd` VALUES (3149, '耀州区', 'd', 3148, NULL);
INSERT INTO `pcd` VALUES (3150, '王益区', 'd', 3148, NULL);
INSERT INTO `pcd` VALUES (3151, '印台区', 'd', 3148, NULL);
INSERT INTO `pcd` VALUES (3152, '宜君县', 'd', 3148, NULL);
INSERT INTO `pcd` VALUES (3153, '其他', 'd', 3148, NULL);
INSERT INTO `pcd` VALUES (3154, '宝鸡', 'c', 3132, 'A4');
INSERT INTO `pcd` VALUES (3155, '渭滨区', 'd', 3154, NULL);
INSERT INTO `pcd` VALUES (3156, '金台区', 'd', 3154, NULL);
INSERT INTO `pcd` VALUES (3157, '陈仓区', 'd', 3154, NULL);
INSERT INTO `pcd` VALUES (3158, '岐山县', 'd', 3154, NULL);
INSERT INTO `pcd` VALUES (3159, '凤翔县', 'd', 3154, NULL);
INSERT INTO `pcd` VALUES (3160, '陇县', 'd', 3154, NULL);
INSERT INTO `pcd` VALUES (3161, '太白县', 'd', 3154, NULL);
INSERT INTO `pcd` VALUES (3162, '麟游县', 'd', 3154, NULL);
INSERT INTO `pcd` VALUES (3163, '扶风县', 'd', 3154, NULL);
INSERT INTO `pcd` VALUES (3164, '千阳县', 'd', 3154, NULL);
INSERT INTO `pcd` VALUES (3165, '眉县', 'd', 3154, NULL);
INSERT INTO `pcd` VALUES (3166, '凤县', 'd', 3154, NULL);
INSERT INTO `pcd` VALUES (3167, '其他', 'd', 3154, NULL);
INSERT INTO `pcd` VALUES (3168, '咸阳', 'c', 3132, 'A4');
INSERT INTO `pcd` VALUES (3169, '秦都区', 'd', 3168, NULL);
INSERT INTO `pcd` VALUES (3170, '渭城区', 'd', 3168, NULL);
INSERT INTO `pcd` VALUES (3171, '杨陵区', 'd', 3168, NULL);
INSERT INTO `pcd` VALUES (3172, '兴平市', 'd', 3168, NULL);
INSERT INTO `pcd` VALUES (3173, '礼泉县', 'd', 3168, NULL);
INSERT INTO `pcd` VALUES (3174, '泾阳县', 'd', 3168, NULL);
INSERT INTO `pcd` VALUES (3175, '永寿县', 'd', 3168, NULL);
INSERT INTO `pcd` VALUES (3176, '三原县', 'd', 3168, NULL);
INSERT INTO `pcd` VALUES (3177, '彬县', 'd', 3168, NULL);
INSERT INTO `pcd` VALUES (3178, '旬邑县', 'd', 3168, NULL);
INSERT INTO `pcd` VALUES (3179, '长武县', 'd', 3168, NULL);
INSERT INTO `pcd` VALUES (3180, '乾县', 'd', 3168, NULL);
INSERT INTO `pcd` VALUES (3181, '武功县', 'd', 3168, NULL);
INSERT INTO `pcd` VALUES (3182, '淳化县', 'd', 3168, NULL);
INSERT INTO `pcd` VALUES (3183, '其他', 'd', 3168, NULL);
INSERT INTO `pcd` VALUES (3184, '渭南', 'c', 3132, 'A4');
INSERT INTO `pcd` VALUES (3185, '临渭区', 'd', 3184, NULL);
INSERT INTO `pcd` VALUES (3186, '韩城市', 'd', 3184, NULL);
INSERT INTO `pcd` VALUES (3187, '华阴市', 'd', 3184, NULL);
INSERT INTO `pcd` VALUES (3188, '蒲城县', 'd', 3184, NULL);
INSERT INTO `pcd` VALUES (3189, '潼关县', 'd', 3184, NULL);
INSERT INTO `pcd` VALUES (3190, '白水县', 'd', 3184, NULL);
INSERT INTO `pcd` VALUES (3191, '澄城县', 'd', 3184, NULL);
INSERT INTO `pcd` VALUES (3192, '华县', 'd', 3184, NULL);
INSERT INTO `pcd` VALUES (3193, '合阳县', 'd', 3184, NULL);
INSERT INTO `pcd` VALUES (3194, '富平县', 'd', 3184, NULL);
INSERT INTO `pcd` VALUES (3195, '大荔县', 'd', 3184, NULL);
INSERT INTO `pcd` VALUES (3196, '其他', 'd', 3184, NULL);
INSERT INTO `pcd` VALUES (3197, '延安', 'c', 3132, 'A4');
INSERT INTO `pcd` VALUES (3198, '宝塔区', 'd', 3197, NULL);
INSERT INTO `pcd` VALUES (3199, '安塞县', 'd', 3197, NULL);
INSERT INTO `pcd` VALUES (3200, '洛川县', 'd', 3197, NULL);
INSERT INTO `pcd` VALUES (3201, '子长县', 'd', 3197, NULL);
INSERT INTO `pcd` VALUES (3202, '黄陵县', 'd', 3197, NULL);
INSERT INTO `pcd` VALUES (3203, '延川县', 'd', 3197, NULL);
INSERT INTO `pcd` VALUES (3204, '富县', 'd', 3197, NULL);
INSERT INTO `pcd` VALUES (3205, '延长县', 'd', 3197, NULL);
INSERT INTO `pcd` VALUES (3206, '甘泉县', 'd', 3197, NULL);
INSERT INTO `pcd` VALUES (3207, '宜川县', 'd', 3197, NULL);
INSERT INTO `pcd` VALUES (3208, '志丹县', 'd', 3197, NULL);
INSERT INTO `pcd` VALUES (3209, '黄龙县', 'd', 3197, NULL);
INSERT INTO `pcd` VALUES (3210, '吴起县', 'd', 3197, NULL);
INSERT INTO `pcd` VALUES (3211, '其他', 'd', 3197, NULL);
INSERT INTO `pcd` VALUES (3212, '汉中', 'c', 3132, 'A4');
INSERT INTO `pcd` VALUES (3213, '汉台区', 'd', 3212, NULL);
INSERT INTO `pcd` VALUES (3214, '留坝县', 'd', 3212, NULL);
INSERT INTO `pcd` VALUES (3215, '镇巴县', 'd', 3212, NULL);
INSERT INTO `pcd` VALUES (3216, '城固县', 'd', 3212, NULL);
INSERT INTO `pcd` VALUES (3217, '南郑县', 'd', 3212, NULL);
INSERT INTO `pcd` VALUES (3218, '洋县', 'd', 3212, NULL);
INSERT INTO `pcd` VALUES (3219, '宁强县', 'd', 3212, NULL);
INSERT INTO `pcd` VALUES (3220, '佛坪县', 'd', 3212, NULL);
INSERT INTO `pcd` VALUES (3221, '勉县', 'd', 3212, NULL);
INSERT INTO `pcd` VALUES (3222, '西乡县', 'd', 3212, NULL);
INSERT INTO `pcd` VALUES (3223, '略阳县', 'd', 3212, NULL);
INSERT INTO `pcd` VALUES (3224, '其他', 'd', 3212, NULL);
INSERT INTO `pcd` VALUES (3225, '榆林', 'c', 3132, 'A4');
INSERT INTO `pcd` VALUES (3226, '榆阳区', 'd', 3225, NULL);
INSERT INTO `pcd` VALUES (3227, '清涧县', 'd', 3225, NULL);
INSERT INTO `pcd` VALUES (3228, '绥德县', 'd', 3225, NULL);
INSERT INTO `pcd` VALUES (3229, '神木县', 'd', 3225, NULL);
INSERT INTO `pcd` VALUES (3230, '佳县', 'd', 3225, NULL);
INSERT INTO `pcd` VALUES (3231, '府谷县', 'd', 3225, NULL);
INSERT INTO `pcd` VALUES (3232, '子洲县', 'd', 3225, NULL);
INSERT INTO `pcd` VALUES (3233, '靖边县', 'd', 3225, NULL);
INSERT INTO `pcd` VALUES (3234, '横山县', 'd', 3225, NULL);
INSERT INTO `pcd` VALUES (3235, '米脂县', 'd', 3225, NULL);
INSERT INTO `pcd` VALUES (3236, '吴堡县', 'd', 3225, NULL);
INSERT INTO `pcd` VALUES (3237, '定边县', 'd', 3225, NULL);
INSERT INTO `pcd` VALUES (3238, '其他', 'd', 3225, NULL);
INSERT INTO `pcd` VALUES (3239, '安康', 'c', 3132, 'A5');
INSERT INTO `pcd` VALUES (3240, '汉滨区', 'd', 3239, NULL);
INSERT INTO `pcd` VALUES (3241, '紫阳县', 'd', 3239, NULL);
INSERT INTO `pcd` VALUES (3242, '岚皋县', 'd', 3239, NULL);
INSERT INTO `pcd` VALUES (3243, '旬阳县', 'd', 3239, NULL);
INSERT INTO `pcd` VALUES (3244, '镇坪县', 'd', 3239, NULL);
INSERT INTO `pcd` VALUES (3245, '平利县', 'd', 3239, NULL);
INSERT INTO `pcd` VALUES (3246, '石泉县', 'd', 3239, NULL);
INSERT INTO `pcd` VALUES (3247, '宁陕县', 'd', 3239, NULL);
INSERT INTO `pcd` VALUES (3248, '白河县', 'd', 3239, NULL);
INSERT INTO `pcd` VALUES (3249, '汉阴县', 'd', 3239, NULL);
INSERT INTO `pcd` VALUES (3250, '其他', 'd', 3239, NULL);
INSERT INTO `pcd` VALUES (3251, '商洛', 'c', 3132, 'A5');
INSERT INTO `pcd` VALUES (3252, '商州区', 'd', 3251, NULL);
INSERT INTO `pcd` VALUES (3253, '镇安县', 'd', 3251, NULL);
INSERT INTO `pcd` VALUES (3254, '山阳县', 'd', 3251, NULL);
INSERT INTO `pcd` VALUES (3255, '洛南县', 'd', 3251, NULL);
INSERT INTO `pcd` VALUES (3256, '商南县', 'd', 3251, NULL);
INSERT INTO `pcd` VALUES (3257, '丹凤县', 'd', 3251, NULL);
INSERT INTO `pcd` VALUES (3258, '柞水县', 'd', 3251, NULL);
INSERT INTO `pcd` VALUES (3259, '其他', 'd', 3251, NULL);
INSERT INTO `pcd` VALUES (3260, '其他', 'c', 3132, NULL);
INSERT INTO `pcd` VALUES (3261, '其他', 'd', 3260, NULL);
INSERT INTO `pcd` VALUES (3262, '甘肃', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (3263, '兰州', 'c', 3262, 'A3');
INSERT INTO `pcd` VALUES (3264, '城关区', 'd', 3263, NULL);
INSERT INTO `pcd` VALUES (3265, '七里河区', 'd', 3263, NULL);
INSERT INTO `pcd` VALUES (3266, '西固区', 'd', 3263, NULL);
INSERT INTO `pcd` VALUES (3267, '安宁区', 'd', 3263, NULL);
INSERT INTO `pcd` VALUES (3268, '红古区', 'd', 3263, NULL);
INSERT INTO `pcd` VALUES (3269, '永登县', 'd', 3263, NULL);
INSERT INTO `pcd` VALUES (3270, '皋兰县', 'd', 3263, NULL);
INSERT INTO `pcd` VALUES (3271, '榆中县', 'd', 3263, NULL);
INSERT INTO `pcd` VALUES (3272, '其他', 'd', 3263, NULL);
INSERT INTO `pcd` VALUES (3273, '嘉峪关', 'c', 3262, 'A5');
INSERT INTO `pcd` VALUES (3274, '嘉峪关市', 'd', 3273, 'A5');
INSERT INTO `pcd` VALUES (3275, '其他', 'd', 3273, NULL);
INSERT INTO `pcd` VALUES (3276, '金昌', 'c', 3262, 'A5');
INSERT INTO `pcd` VALUES (3277, '金川区', 'd', 3276, NULL);
INSERT INTO `pcd` VALUES (3278, '永昌县', 'd', 3276, NULL);
INSERT INTO `pcd` VALUES (3279, '其他', 'd', 3276, NULL);
INSERT INTO `pcd` VALUES (3280, '白银', 'c', 3262, 'A5');
INSERT INTO `pcd` VALUES (3281, '白银区', 'd', 3280, 'A5');
INSERT INTO `pcd` VALUES (3282, '平川区', 'd', 3280, NULL);
INSERT INTO `pcd` VALUES (3283, '靖远县', 'd', 3280, NULL);
INSERT INTO `pcd` VALUES (3284, '会宁县', 'd', 3280, NULL);
INSERT INTO `pcd` VALUES (3285, '景泰县', 'd', 3280, NULL);
INSERT INTO `pcd` VALUES (3286, '其他', 'd', 3280, NULL);
INSERT INTO `pcd` VALUES (3287, '天水', 'c', 3262, 'A5');
INSERT INTO `pcd` VALUES (3288, '清水县', 'd', 3287, NULL);
INSERT INTO `pcd` VALUES (3289, '秦安县', 'd', 3287, NULL);
INSERT INTO `pcd` VALUES (3290, '甘谷县', 'd', 3287, NULL);
INSERT INTO `pcd` VALUES (3291, '武山县', 'd', 3287, NULL);
INSERT INTO `pcd` VALUES (3292, '张家川回族自治县', 'd', 3287, NULL);
INSERT INTO `pcd` VALUES (3293, '北道区', 'd', 3287, NULL);
INSERT INTO `pcd` VALUES (3294, '秦城区', 'd', 3287, NULL);
INSERT INTO `pcd` VALUES (3295, '其他', 'd', 3287, NULL);
INSERT INTO `pcd` VALUES (3296, '武威', 'c', 3262, 'A5');
INSERT INTO `pcd` VALUES (3297, '凉州区', 'd', 3296, NULL);
INSERT INTO `pcd` VALUES (3298, '民勤县', 'd', 3296, NULL);
INSERT INTO `pcd` VALUES (3299, '古浪县', 'd', 3296, NULL);
INSERT INTO `pcd` VALUES (3300, '天祝藏族自治县', 'd', 3296, NULL);
INSERT INTO `pcd` VALUES (3301, '其他', 'd', 3296, NULL);
INSERT INTO `pcd` VALUES (3302, '酒泉', 'c', 3262, 'A5');
INSERT INTO `pcd` VALUES (3303, '肃州区', 'd', 3302, NULL);
INSERT INTO `pcd` VALUES (3304, '玉门市', 'd', 3302, NULL);
INSERT INTO `pcd` VALUES (3305, '敦煌市', 'd', 3302, NULL);
INSERT INTO `pcd` VALUES (3306, '金塔县', 'd', 3302, NULL);
INSERT INTO `pcd` VALUES (3307, '肃北蒙古族自治县', 'd', 3302, NULL);
INSERT INTO `pcd` VALUES (3308, '阿克塞哈萨克族自治县', 'd', 3302, NULL);
INSERT INTO `pcd` VALUES (3309, '安西县', 'd', 3302, NULL);
INSERT INTO `pcd` VALUES (3310, '其他', 'd', 3302, NULL);
INSERT INTO `pcd` VALUES (3311, '张掖', 'c', 3262, 'A5');
INSERT INTO `pcd` VALUES (3312, '甘州区', 'd', 3311, NULL);
INSERT INTO `pcd` VALUES (3313, '民乐县', 'd', 3311, NULL);
INSERT INTO `pcd` VALUES (3314, '临泽县', 'd', 3311, NULL);
INSERT INTO `pcd` VALUES (3315, '高台县', 'd', 3311, NULL);
INSERT INTO `pcd` VALUES (3316, '山丹县', 'd', 3311, NULL);
INSERT INTO `pcd` VALUES (3317, '肃南裕固族自治县', 'd', 3311, NULL);
INSERT INTO `pcd` VALUES (3318, '其他', 'd', 3311, NULL);
INSERT INTO `pcd` VALUES (3319, '庆阳', 'c', 3262, 'A5');
INSERT INTO `pcd` VALUES (3320, '西峰区', 'd', 3319, NULL);
INSERT INTO `pcd` VALUES (3321, '庆城县', 'd', 3319, NULL);
INSERT INTO `pcd` VALUES (3322, '环县', 'd', 3319, NULL);
INSERT INTO `pcd` VALUES (3323, '华池县', 'd', 3319, NULL);
INSERT INTO `pcd` VALUES (3324, '合水县', 'd', 3319, NULL);
INSERT INTO `pcd` VALUES (3325, '正宁县', 'd', 3319, NULL);
INSERT INTO `pcd` VALUES (3326, '宁县', 'd', 3319, NULL);
INSERT INTO `pcd` VALUES (3327, '镇原县', 'd', 3319, NULL);
INSERT INTO `pcd` VALUES (3328, '其他', 'd', 3319, NULL);
INSERT INTO `pcd` VALUES (3329, '平凉', 'c', 3262, 'A5');
INSERT INTO `pcd` VALUES (3330, '崆峒区', 'd', 3329, NULL);
INSERT INTO `pcd` VALUES (3331, '泾川县', 'd', 3329, NULL);
INSERT INTO `pcd` VALUES (3332, '灵台县', 'd', 3329, NULL);
INSERT INTO `pcd` VALUES (3333, '崇信县', 'd', 3329, NULL);
INSERT INTO `pcd` VALUES (3334, '华亭县', 'd', 3329, NULL);
INSERT INTO `pcd` VALUES (3335, '庄浪县', 'd', 3329, NULL);
INSERT INTO `pcd` VALUES (3336, '静宁县', 'd', 3329, NULL);
INSERT INTO `pcd` VALUES (3337, '其他', 'd', 3329, NULL);
INSERT INTO `pcd` VALUES (3338, '定西', 'c', 3262, 'A5');
INSERT INTO `pcd` VALUES (3339, '安定区', 'd', 3338, NULL);
INSERT INTO `pcd` VALUES (3340, '通渭县', 'd', 3338, NULL);
INSERT INTO `pcd` VALUES (3341, '临洮县', 'd', 3338, NULL);
INSERT INTO `pcd` VALUES (3342, '漳县', 'd', 3338, NULL);
INSERT INTO `pcd` VALUES (3343, '岷县', 'd', 3338, NULL);
INSERT INTO `pcd` VALUES (3344, '渭源县', 'd', 3338, NULL);
INSERT INTO `pcd` VALUES (3345, '陇西县', 'd', 3338, NULL);
INSERT INTO `pcd` VALUES (3346, '其他', 'd', 3338, NULL);
INSERT INTO `pcd` VALUES (3347, '陇南', 'c', 3262, 'A5');
INSERT INTO `pcd` VALUES (3348, '武都区', 'd', 3347, NULL);
INSERT INTO `pcd` VALUES (3349, '成县', 'd', 3347, NULL);
INSERT INTO `pcd` VALUES (3350, '宕昌县', 'd', 3347, NULL);
INSERT INTO `pcd` VALUES (3351, '康县', 'd', 3347, NULL);
INSERT INTO `pcd` VALUES (3352, '文县', 'd', 3347, NULL);
INSERT INTO `pcd` VALUES (3353, '西和县', 'd', 3347, NULL);
INSERT INTO `pcd` VALUES (3354, '礼县', 'd', 3347, NULL);
INSERT INTO `pcd` VALUES (3355, '两当县', 'd', 3347, NULL);
INSERT INTO `pcd` VALUES (3356, '徽县', 'd', 3347, NULL);
INSERT INTO `pcd` VALUES (3357, '其他', 'd', 3347, NULL);
INSERT INTO `pcd` VALUES (3358, '临夏回族自治州', 'c', 3262, 'A5');
INSERT INTO `pcd` VALUES (3359, '临夏市', 'd', 3358, NULL);
INSERT INTO `pcd` VALUES (3360, '临夏县', 'd', 3358, NULL);
INSERT INTO `pcd` VALUES (3361, '康乐县', 'd', 3358, NULL);
INSERT INTO `pcd` VALUES (3362, '永靖县', 'd', 3358, NULL);
INSERT INTO `pcd` VALUES (3363, '广河县', 'd', 3358, NULL);
INSERT INTO `pcd` VALUES (3364, '和政县', 'd', 3358, NULL);
INSERT INTO `pcd` VALUES (3365, '东乡族自治县', 'd', 3358, NULL);
INSERT INTO `pcd` VALUES (3366, '积石山保安族东乡族撒拉族自治县', 'd', 3358, NULL);
INSERT INTO `pcd` VALUES (3367, '其他', 'd', 3358, NULL);
INSERT INTO `pcd` VALUES (3368, '甘南藏族自治州', 'c', 3262, 'A5');
INSERT INTO `pcd` VALUES (3369, '合作市', 'd', 3368, NULL);
INSERT INTO `pcd` VALUES (3370, '临潭县', 'd', 3368, NULL);
INSERT INTO `pcd` VALUES (3371, '卓尼县', 'd', 3368, NULL);
INSERT INTO `pcd` VALUES (3372, '舟曲县', 'd', 3368, NULL);
INSERT INTO `pcd` VALUES (3373, '迭部县', 'd', 3368, NULL);
INSERT INTO `pcd` VALUES (3374, '玛曲县', 'd', 3368, NULL);
INSERT INTO `pcd` VALUES (3375, '碌曲县', 'd', 3368, NULL);
INSERT INTO `pcd` VALUES (3376, '夏河县', 'd', 3368, NULL);
INSERT INTO `pcd` VALUES (3377, '其他', 'd', 3368, NULL);
INSERT INTO `pcd` VALUES (3378, '其他', 'c', 3262, NULL);
INSERT INTO `pcd` VALUES (3379, '其他', 'd', 3378, NULL);
INSERT INTO `pcd` VALUES (3380, '青海', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (3381, '西宁', 'c', 3380, 'A3');
INSERT INTO `pcd` VALUES (3382, '城中区', 'd', 3381, NULL);
INSERT INTO `pcd` VALUES (3383, '城东区', 'd', 3381, NULL);
INSERT INTO `pcd` VALUES (3384, '城西区', 'd', 3381, NULL);
INSERT INTO `pcd` VALUES (3385, '城北区', 'd', 3381, NULL);
INSERT INTO `pcd` VALUES (3386, '湟源县', 'd', 3381, NULL);
INSERT INTO `pcd` VALUES (3387, '湟中县', 'd', 3381, NULL);
INSERT INTO `pcd` VALUES (3388, '大通回族土族自治县', 'd', 3381, NULL);
INSERT INTO `pcd` VALUES (3389, '其他', 'd', 3381, NULL);
INSERT INTO `pcd` VALUES (3390, '海东地区', 'c', 3380, 'A5');
INSERT INTO `pcd` VALUES (3391, '平安县', 'd', 3390, NULL);
INSERT INTO `pcd` VALUES (3392, '乐都县', 'd', 3390, NULL);
INSERT INTO `pcd` VALUES (3393, '民和回族土族自治县', 'd', 3390, NULL);
INSERT INTO `pcd` VALUES (3394, '互助土族自治县', 'd', 3390, NULL);
INSERT INTO `pcd` VALUES (3395, '化隆回族自治县', 'd', 3390, NULL);
INSERT INTO `pcd` VALUES (3396, '循化撒拉族自治县', 'd', 3390, NULL);
INSERT INTO `pcd` VALUES (3397, '其他', 'd', 3390, NULL);
INSERT INTO `pcd` VALUES (3398, '海北藏族自治州', 'c', 3380, 'A5');
INSERT INTO `pcd` VALUES (3399, '海晏县', 'd', 3398, NULL);
INSERT INTO `pcd` VALUES (3400, '祁连县', 'd', 3398, NULL);
INSERT INTO `pcd` VALUES (3401, '刚察县', 'd', 3398, NULL);
INSERT INTO `pcd` VALUES (3402, '门源回族自治县', 'd', 3398, NULL);
INSERT INTO `pcd` VALUES (3403, '其他', 'd', 3398, NULL);
INSERT INTO `pcd` VALUES (3404, '海南藏族自治州', 'c', 3380, 'A5');
INSERT INTO `pcd` VALUES (3405, '共和县', 'd', 3404, NULL);
INSERT INTO `pcd` VALUES (3406, '同德县', 'd', 3404, NULL);
INSERT INTO `pcd` VALUES (3407, '贵德县', 'd', 3404, NULL);
INSERT INTO `pcd` VALUES (3408, '兴海县', 'd', 3404, NULL);
INSERT INTO `pcd` VALUES (3409, '贵南县', 'd', 3404, NULL);
INSERT INTO `pcd` VALUES (3410, '其他', 'd', 3404, NULL);
INSERT INTO `pcd` VALUES (3411, '黄南藏族自治州', 'c', 3380, 'A5');
INSERT INTO `pcd` VALUES (3412, '同仁县', 'd', 3411, NULL);
INSERT INTO `pcd` VALUES (3413, '尖扎县', 'd', 3411, NULL);
INSERT INTO `pcd` VALUES (3414, '泽库县', 'd', 3411, NULL);
INSERT INTO `pcd` VALUES (3415, '河南蒙古族自治县', 'd', 3411, NULL);
INSERT INTO `pcd` VALUES (3416, '其他', 'd', 3411, NULL);
INSERT INTO `pcd` VALUES (3417, '果洛藏族自治州', 'c', 3380, NULL);
INSERT INTO `pcd` VALUES (3418, '玛沁县', 'd', 3417, NULL);
INSERT INTO `pcd` VALUES (3419, '班玛县', 'd', 3417, NULL);
INSERT INTO `pcd` VALUES (3420, '甘德县', 'd', 3417, NULL);
INSERT INTO `pcd` VALUES (3421, '达日县', 'd', 3417, NULL);
INSERT INTO `pcd` VALUES (3422, '久治县', 'd', 3417, NULL);
INSERT INTO `pcd` VALUES (3423, '玛多县', 'd', 3417, NULL);
INSERT INTO `pcd` VALUES (3424, '其他', 'd', 3417, NULL);
INSERT INTO `pcd` VALUES (3425, '玉树藏族自治州', 'c', 3380, 'A5');
INSERT INTO `pcd` VALUES (3426, '玉树县', 'd', 3425, NULL);
INSERT INTO `pcd` VALUES (3427, '杂多县', 'd', 3425, NULL);
INSERT INTO `pcd` VALUES (3428, '称多县', 'd', 3425, NULL);
INSERT INTO `pcd` VALUES (3429, '治多县', 'd', 3425, NULL);
INSERT INTO `pcd` VALUES (3430, '囊谦县', 'd', 3425, NULL);
INSERT INTO `pcd` VALUES (3431, '曲麻莱县', 'd', 3425, NULL);
INSERT INTO `pcd` VALUES (3432, '其他', 'd', 3425, NULL);
INSERT INTO `pcd` VALUES (3433, '海西蒙古族藏族自治州', 'c', 3380, 'A5');
INSERT INTO `pcd` VALUES (3434, '德令哈市', 'd', 3433, NULL);
INSERT INTO `pcd` VALUES (3435, '格尔木市', 'd', 3433, NULL);
INSERT INTO `pcd` VALUES (3436, '乌兰县', 'd', 3433, NULL);
INSERT INTO `pcd` VALUES (3437, '都兰县', 'd', 3433, NULL);
INSERT INTO `pcd` VALUES (3438, '天峻县', 'd', 3433, NULL);
INSERT INTO `pcd` VALUES (3439, '其他', 'd', 3433, NULL);
INSERT INTO `pcd` VALUES (3440, '其他', 'c', 3380, NULL);
INSERT INTO `pcd` VALUES (3441, '其他', 'd', 3440, NULL);
INSERT INTO `pcd` VALUES (3442, '宁夏', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (3443, '银川', 'c', 3442, 'A3');
INSERT INTO `pcd` VALUES (3444, '兴庆区', 'd', 3443, NULL);
INSERT INTO `pcd` VALUES (3445, '西夏区', 'd', 3443, NULL);
INSERT INTO `pcd` VALUES (3446, '金凤区', 'd', 3443, NULL);
INSERT INTO `pcd` VALUES (3447, '灵武市', 'd', 3443, NULL);
INSERT INTO `pcd` VALUES (3448, '永宁县', 'd', 3443, NULL);
INSERT INTO `pcd` VALUES (3449, '贺兰县', 'd', 3443, NULL);
INSERT INTO `pcd` VALUES (3450, '其他', 'd', 3443, NULL);
INSERT INTO `pcd` VALUES (3451, '石嘴山', 'c', 3442, 'A5');
INSERT INTO `pcd` VALUES (3452, '大武口区', 'd', 3451, NULL);
INSERT INTO `pcd` VALUES (3453, '惠农区', 'd', 3451, NULL);
INSERT INTO `pcd` VALUES (3454, '平罗县', 'd', 3451, NULL);
INSERT INTO `pcd` VALUES (3455, '其他', 'd', 3451, NULL);
INSERT INTO `pcd` VALUES (3456, '吴忠', 'c', 3442, 'A5');
INSERT INTO `pcd` VALUES (3457, '利通区', 'd', 3456, NULL);
INSERT INTO `pcd` VALUES (3458, '青铜峡市', 'd', 3456, NULL);
INSERT INTO `pcd` VALUES (3459, '盐池县', 'd', 3456, NULL);
INSERT INTO `pcd` VALUES (3460, '同心县', 'd', 3456, NULL);
INSERT INTO `pcd` VALUES (3461, '其他', 'd', 3456, NULL);
INSERT INTO `pcd` VALUES (3462, '固原', 'c', 3442, 'A5');
INSERT INTO `pcd` VALUES (3463, '原州区', 'd', 3462, NULL);
INSERT INTO `pcd` VALUES (3464, '西吉县', 'd', 3462, NULL);
INSERT INTO `pcd` VALUES (3465, '隆德县', 'd', 3462, NULL);
INSERT INTO `pcd` VALUES (3466, '泾源县', 'd', 3462, NULL);
INSERT INTO `pcd` VALUES (3467, '彭阳县', 'd', 3462, NULL);
INSERT INTO `pcd` VALUES (3468, '其他', 'd', 3462, NULL);
INSERT INTO `pcd` VALUES (3469, '中卫', 'c', 3442, 'A5');
INSERT INTO `pcd` VALUES (3470, '沙坡头区', 'd', 3469, NULL);
INSERT INTO `pcd` VALUES (3471, '中宁县', 'd', 3469, NULL);
INSERT INTO `pcd` VALUES (3472, '海原县', 'd', 3469, NULL);
INSERT INTO `pcd` VALUES (3473, '其他', 'd', 3469, NULL);
INSERT INTO `pcd` VALUES (3474, '其他', 'c', 3442, NULL);
INSERT INTO `pcd` VALUES (3475, '其他', 'd', 3474, NULL);
INSERT INTO `pcd` VALUES (3476, '新疆', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (3477, '乌鲁木齐', 'c', 3476, 'A3');
INSERT INTO `pcd` VALUES (3478, '天山区', 'd', 3477, NULL);
INSERT INTO `pcd` VALUES (3479, '沙依巴克区', 'd', 3477, NULL);
INSERT INTO `pcd` VALUES (3480, '新市区', 'd', 3477, NULL);
INSERT INTO `pcd` VALUES (3481, '水磨沟区', 'd', 3477, NULL);
INSERT INTO `pcd` VALUES (3482, '头屯河区', 'd', 3477, NULL);
INSERT INTO `pcd` VALUES (3483, '达坂城区', 'd', 3477, NULL);
INSERT INTO `pcd` VALUES (3484, '东山区', 'd', 3477, NULL);
INSERT INTO `pcd` VALUES (3485, '乌鲁木齐县', 'd', 3477, 'A3');
INSERT INTO `pcd` VALUES (3486, '其他', 'd', 3477, NULL);
INSERT INTO `pcd` VALUES (3487, '克拉玛依', 'c', 3476, 'A5');
INSERT INTO `pcd` VALUES (3488, '克拉玛依区', 'd', 3487, 'A5');
INSERT INTO `pcd` VALUES (3489, '独山子区', 'd', 3487, NULL);
INSERT INTO `pcd` VALUES (3490, '白碱滩区', 'd', 3487, NULL);
INSERT INTO `pcd` VALUES (3491, '乌尔禾区', 'd', 3487, NULL);
INSERT INTO `pcd` VALUES (3492, '其他', 'd', 3487, NULL);
INSERT INTO `pcd` VALUES (3493, '吐鲁番地区', 'c', 3476, 'A5');
INSERT INTO `pcd` VALUES (3494, '吐鲁番市', 'd', 3493, 'A5');
INSERT INTO `pcd` VALUES (3495, '托克逊县', 'd', 3493, NULL);
INSERT INTO `pcd` VALUES (3496, '鄯善县', 'd', 3493, NULL);
INSERT INTO `pcd` VALUES (3497, '其他', 'd', 3493, NULL);
INSERT INTO `pcd` VALUES (3498, '哈密地区', 'c', 3476, 'A5');
INSERT INTO `pcd` VALUES (3499, '哈密市', 'd', 3498, 'A5');
INSERT INTO `pcd` VALUES (3500, '伊吾县', 'd', 3498, NULL);
INSERT INTO `pcd` VALUES (3501, '巴里坤哈萨克自治县', 'd', 3498, NULL);
INSERT INTO `pcd` VALUES (3502, '其他', 'd', 3498, NULL);
INSERT INTO `pcd` VALUES (3503, '和田地区', 'c', 3476, 'A5');
INSERT INTO `pcd` VALUES (3504, '和田市', 'd', 3503, NULL);
INSERT INTO `pcd` VALUES (3505, '和田县', 'd', 3503, NULL);
INSERT INTO `pcd` VALUES (3506, '洛浦县', 'd', 3503, NULL);
INSERT INTO `pcd` VALUES (3507, '民丰县', 'd', 3503, NULL);
INSERT INTO `pcd` VALUES (3508, '皮山县', 'd', 3503, NULL);
INSERT INTO `pcd` VALUES (3509, '策勒县', 'd', 3503, NULL);
INSERT INTO `pcd` VALUES (3510, '于田县', 'd', 3503, NULL);
INSERT INTO `pcd` VALUES (3511, '墨玉县', 'd', 3503, NULL);
INSERT INTO `pcd` VALUES (3512, '其他', 'd', 3503, NULL);
INSERT INTO `pcd` VALUES (3513, '阿克苏地区', 'c', 3476, 'A5');
INSERT INTO `pcd` VALUES (3514, '阿克苏市', 'd', 3513, NULL);
INSERT INTO `pcd` VALUES (3515, '温宿县', 'd', 3513, NULL);
INSERT INTO `pcd` VALUES (3516, '沙雅县', 'd', 3513, NULL);
INSERT INTO `pcd` VALUES (3517, '拜城县', 'd', 3513, NULL);
INSERT INTO `pcd` VALUES (3518, '阿瓦提县', 'd', 3513, NULL);
INSERT INTO `pcd` VALUES (3519, '库车县', 'd', 3513, NULL);
INSERT INTO `pcd` VALUES (3520, '柯坪县', 'd', 3513, NULL);
INSERT INTO `pcd` VALUES (3521, '新和县', 'd', 3513, NULL);
INSERT INTO `pcd` VALUES (3522, '乌什县', 'd', 3513, NULL);
INSERT INTO `pcd` VALUES (3523, '其他', 'd', 3513, NULL);
INSERT INTO `pcd` VALUES (3524, '喀什地区', 'c', 3476, 'A5');
INSERT INTO `pcd` VALUES (3525, '喀什市', 'd', 3524, NULL);
INSERT INTO `pcd` VALUES (3526, '巴楚县', 'd', 3524, NULL);
INSERT INTO `pcd` VALUES (3527, '泽普县', 'd', 3524, NULL);
INSERT INTO `pcd` VALUES (3528, '伽师县', 'd', 3524, NULL);
INSERT INTO `pcd` VALUES (3529, '叶城县', 'd', 3524, NULL);
INSERT INTO `pcd` VALUES (3530, '岳普湖县', 'd', 3524, NULL);
INSERT INTO `pcd` VALUES (3531, '疏勒县', 'd', 3524, NULL);
INSERT INTO `pcd` VALUES (3532, '麦盖提县', 'd', 3524, NULL);
INSERT INTO `pcd` VALUES (3533, '英吉沙县', 'd', 3524, NULL);
INSERT INTO `pcd` VALUES (3534, '莎车县', 'd', 3524, NULL);
INSERT INTO `pcd` VALUES (3535, '疏附县', 'd', 3524, NULL);
INSERT INTO `pcd` VALUES (3536, '塔什库尔干塔吉克自治县', 'd', 3524, NULL);
INSERT INTO `pcd` VALUES (3537, '其他', 'd', 3524, NULL);
INSERT INTO `pcd` VALUES (3538, '克孜勒苏柯尔克孜自治州', 'c', 3476, 'A5');
INSERT INTO `pcd` VALUES (3539, '阿图什市', 'd', 3538, NULL);
INSERT INTO `pcd` VALUES (3540, '阿合奇县', 'd', 3538, NULL);
INSERT INTO `pcd` VALUES (3541, '乌恰县', 'd', 3538, NULL);
INSERT INTO `pcd` VALUES (3542, '阿克陶县', 'd', 3538, NULL);
INSERT INTO `pcd` VALUES (3543, '其他', 'd', 3538, NULL);
INSERT INTO `pcd` VALUES (3544, '巴音郭楞蒙古自治州', 'c', 3476, 'A5');
INSERT INTO `pcd` VALUES (3545, '库尔勒市', 'd', 3544, NULL);
INSERT INTO `pcd` VALUES (3546, '和静县', 'd', 3544, NULL);
INSERT INTO `pcd` VALUES (3547, '尉犁县', 'd', 3544, NULL);
INSERT INTO `pcd` VALUES (3548, '和硕县', 'd', 3544, NULL);
INSERT INTO `pcd` VALUES (3549, '且末县', 'd', 3544, NULL);
INSERT INTO `pcd` VALUES (3550, '博湖县', 'd', 3544, NULL);
INSERT INTO `pcd` VALUES (3551, '轮台县', 'd', 3544, NULL);
INSERT INTO `pcd` VALUES (3552, '若羌县', 'd', 3544, NULL);
INSERT INTO `pcd` VALUES (3553, '焉耆回族自治县', 'd', 3544, NULL);
INSERT INTO `pcd` VALUES (3554, '其他', 'd', 3544, NULL);
INSERT INTO `pcd` VALUES (3555, '昌吉回族自治州', 'c', 3476, 'A5');
INSERT INTO `pcd` VALUES (3556, '昌吉市', 'd', 3555, NULL);
INSERT INTO `pcd` VALUES (3557, '阜康市', 'd', 3555, NULL);
INSERT INTO `pcd` VALUES (3558, '奇台县', 'd', 3555, NULL);
INSERT INTO `pcd` VALUES (3559, '玛纳斯县', 'd', 3555, NULL);
INSERT INTO `pcd` VALUES (3560, '吉木萨尔县', 'd', 3555, NULL);
INSERT INTO `pcd` VALUES (3561, '呼图壁县', 'd', 3555, NULL);
INSERT INTO `pcd` VALUES (3562, '木垒哈萨克自治县', 'd', 3555, NULL);
INSERT INTO `pcd` VALUES (3563, '米泉市', 'd', 3555, NULL);
INSERT INTO `pcd` VALUES (3564, '其他', 'd', 3555, NULL);
INSERT INTO `pcd` VALUES (3565, '博尔塔拉蒙古自治州', 'c', 3476, 'A5');
INSERT INTO `pcd` VALUES (3566, '博乐市', 'd', 3565, NULL);
INSERT INTO `pcd` VALUES (3567, '精河县', 'd', 3565, NULL);
INSERT INTO `pcd` VALUES (3568, '温泉县', 'd', 3565, NULL);
INSERT INTO `pcd` VALUES (3569, '其他', 'd', 3565, NULL);
INSERT INTO `pcd` VALUES (3570, '石河子', 'c', 3476, NULL);
INSERT INTO `pcd` VALUES (3571, '石河子', 'd', 3570, NULL);
INSERT INTO `pcd` VALUES (3572, '阿拉尔', 'c', 3476, NULL);
INSERT INTO `pcd` VALUES (3573, '阿拉尔', 'd', 3572, NULL);
INSERT INTO `pcd` VALUES (3574, '图木舒克', 'c', 3476, NULL);
INSERT INTO `pcd` VALUES (3575, '图木舒克', 'd', 3574, NULL);
INSERT INTO `pcd` VALUES (3576, '五家渠', 'c', 3476, NULL);
INSERT INTO `pcd` VALUES (3577, '五家渠', 'd', 3576, NULL);
INSERT INTO `pcd` VALUES (3578, '伊犁哈萨克自治州', 'c', 3476, 'A5');
INSERT INTO `pcd` VALUES (3579, '伊宁市', 'd', 3578, NULL);
INSERT INTO `pcd` VALUES (3580, '奎屯市', 'd', 3578, NULL);
INSERT INTO `pcd` VALUES (3581, '伊宁县', 'd', 3578, NULL);
INSERT INTO `pcd` VALUES (3582, '特克斯县', 'd', 3578, NULL);
INSERT INTO `pcd` VALUES (3583, '尼勒克县', 'd', 3578, NULL);
INSERT INTO `pcd` VALUES (3584, '昭苏县', 'd', 3578, NULL);
INSERT INTO `pcd` VALUES (3585, '新源县', 'd', 3578, NULL);
INSERT INTO `pcd` VALUES (3586, '霍城县', 'd', 3578, NULL);
INSERT INTO `pcd` VALUES (3587, '巩留县', 'd', 3578, NULL);
INSERT INTO `pcd` VALUES (3588, '察布查尔锡伯自治县', 'd', 3578, NULL);
INSERT INTO `pcd` VALUES (3589, '塔城地区', 'd', 3578, 'A5');
INSERT INTO `pcd` VALUES (3590, '阿勒泰地区', 'd', 3578, 'A5');
INSERT INTO `pcd` VALUES (3591, '其他', 'd', 3578, NULL);
INSERT INTO `pcd` VALUES (3592, '其他', 'c', 3476, NULL);
INSERT INTO `pcd` VALUES (3593, '其他', 'd', 3592, NULL);
INSERT INTO `pcd` VALUES (3594, '台湾', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (3595, '台湾', 'c', 3594, NULL);
INSERT INTO `pcd` VALUES (3596, '台北市', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3597, '高雄市', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3598, '台北县', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3599, '桃园县', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3600, '新竹县', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3601, '苗栗县', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3602, '台中县', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3603, '彰化县', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3604, '南投县', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3605, '云林县', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3606, '嘉义县', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3607, '台南县', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3608, '高雄县', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3609, '屏东县', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3610, '宜兰县', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3611, '花莲县', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3612, '台东县', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3613, '澎湖县', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3614, '基隆市', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3615, '新竹市', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3616, '台中市', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3617, '嘉义市', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3618, '台南市', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3619, '其他', 'd', 3595, NULL);
INSERT INTO `pcd` VALUES (3620, '其他', 'c', 3594, NULL);
INSERT INTO `pcd` VALUES (3621, '其他', 'd', 3620, NULL);
INSERT INTO `pcd` VALUES (3622, '澳门', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (3623, '澳门', 'c', 3622, NULL);
INSERT INTO `pcd` VALUES (3624, '花地玛堂区', 'd', 3623, NULL);
INSERT INTO `pcd` VALUES (3625, '圣安多尼堂区', 'd', 3623, NULL);
INSERT INTO `pcd` VALUES (3626, '大堂区', 'd', 3623, NULL);
INSERT INTO `pcd` VALUES (3627, '望德堂区', 'd', 3623, NULL);
INSERT INTO `pcd` VALUES (3628, '风顺堂区', 'd', 3623, NULL);
INSERT INTO `pcd` VALUES (3629, '嘉模堂区', 'd', 3623, NULL);
INSERT INTO `pcd` VALUES (3630, '圣方济各堂区', 'd', 3623, NULL);
INSERT INTO `pcd` VALUES (3631, '路凼', 'd', 3623, NULL);
INSERT INTO `pcd` VALUES (3632, '其他', 'd', 3623, NULL);
INSERT INTO `pcd` VALUES (3633, '香港', 'p', NULL, NULL);
INSERT INTO `pcd` VALUES (3634, '香港', 'c', 3633, NULL);
INSERT INTO `pcd` VALUES (3635, '中西区', 'd', 3634, NULL);
INSERT INTO `pcd` VALUES (3636, '湾仔区', 'd', 3634, NULL);
INSERT INTO `pcd` VALUES (3637, '东区', 'd', 3634, NULL);
INSERT INTO `pcd` VALUES (3638, '南区', 'd', 3634, NULL);
INSERT INTO `pcd` VALUES (3639, '深水埗区', 'd', 3634, NULL);
INSERT INTO `pcd` VALUES (3640, '油尖旺区', 'd', 3634, NULL);
INSERT INTO `pcd` VALUES (3641, '九龙城区', 'd', 3634, NULL);
INSERT INTO `pcd` VALUES (3642, '黄大仙区', 'd', 3634, NULL);
INSERT INTO `pcd` VALUES (3643, '观塘区', 'd', 3634, NULL);
INSERT INTO `pcd` VALUES (3644, '北区', 'd', 3634, NULL);
INSERT INTO `pcd` VALUES (3645, '大埔区', 'd', 3634, NULL);
INSERT INTO `pcd` VALUES (3646, '沙田区', 'd', 3634, NULL);
INSERT INTO `pcd` VALUES (3647, '西贡区', 'd', 3634, NULL);
INSERT INTO `pcd` VALUES (3648, '元朗区', 'd', 3634, NULL);
INSERT INTO `pcd` VALUES (3649, '屯门区', 'd', 3634, NULL);
INSERT INTO `pcd` VALUES (3650, '荃湾区', 'd', 3634, NULL);
INSERT INTO `pcd` VALUES (3651, '葵青区', 'd', 3634, NULL);
INSERT INTO `pcd` VALUES (3652, '离岛区', 'd', 3634, NULL);
INSERT INTO `pcd` VALUES (3653, '其他', 'd', 3634, NULL);

-- ----------------------------
-- Table structure for schema_version
-- ----------------------------
DROP TABLE IF EXISTS `schema_version`;
CREATE TABLE `schema_version`  (
  `version_rank` int(11) NOT NULL,
  `installed_rank` int(11) NOT NULL,
  `version` varchar(50) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `description` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `type` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `script` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `checksum` int(11) NULL DEFAULT NULL,
  `installed_by` varchar(100) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `installed_on` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `execution_time` int(11) NOT NULL,
  `success` tinyint(1) NOT NULL,
  PRIMARY KEY (`version`) USING BTREE,
  INDEX `schema_version_vr_idx`(`version_rank`) USING BTREE,
  INDEX `schema_version_ir_idx`(`installed_rank`) USING BTREE,
  INDEX `schema_version_s_idx`(`success`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of schema_version
-- ----------------------------
INSERT INTO `schema_version` VALUES (1, 1, '1', '<< Flyway Baseline >>', 'BASELINE', '<< Flyway Baseline >>', NULL, 'root', '2020-09-17 16:00:33', 0, 1);

-- ----------------------------
-- Table structure for st_statistics_field
-- ----------------------------
DROP TABLE IF EXISTS `st_statistics_field`;
CREATE TABLE `st_statistics_field`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `field` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据域唯一标识符',
  `group_id` bigint(20) NULL DEFAULT NULL COMMENT '所属分组ID',
  `group_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所属分组名称',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据域名称',
  `pattern` varchar(26) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '统计数据类型[Count,Rate,Tuple [Timeline,Cluster]]',
  `chart` varchar(26) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标准组件图表名称',
  `attr_invisible` smallint(6) NULL DEFAULT 0 COMMENT '[属性]是否不可见',
  `attr_runtime` smallint(6) NULL DEFAULT 0 COMMENT '是否实时查询[via meta]',
  `attr_span` smallint(6) NULL DEFAULT 1 COMMENT '[属性]所占布局跨列数',
  `attr_index` smallint(6) NULL DEFAULT 0 COMMENT '[属性]排序号',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `field`(`field`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_statistics_field
-- ----------------------------
INSERT INTO `st_statistics_field` VALUES (1, 'total:sales:sum@stat:b:store:child', 2, 'stat:b:store:child2', '新增广告主', 'Count', 'BarTimeline', 0, 0, 1, 0);
INSERT INTO `st_statistics_field` VALUES (2, 'pie', 2, 'stat:b:store:child2', 'pie图', 'Rate', 'BarTimeline', 0, 0, 1, 0);

-- ----------------------------
-- Table structure for st_statistics_group
-- ----------------------------
DROP TABLE IF EXISTS `st_statistics_group`;
CREATE TABLE `st_statistics_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '上级分组',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '组名[唯一标记]',
  `layout` varchar(26) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '布局名称',
  `title` varchar(26) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组标题',
  `span` smallint(6) NULL DEFAULT 1 COMMENT '子分组占父分组的列跨度',
  `idx` smallint(6) NULL DEFAULT 0 COMMENT '分组排序号',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '分组描述',
  `isApiUrl` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_statistics_group
-- ----------------------------
INSERT INTO `st_statistics_group` VALUES (1, NULL, 'stat:b:store:child', NULL, NULL, 1, 0, NULL, '0');
INSERT INTO `st_statistics_group` VALUES (2, 1, 'stat:b:store:child2', NULL, NULL, 1, 0, NULL, '0');

-- ----------------------------
-- Table structure for st_statistics_meta
-- ----------------------------
DROP TABLE IF EXISTS `st_statistics_meta`;
CREATE TABLE `st_statistics_meta`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `field` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据指标唯一标识符',
  `query_sql` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '实时查询sql',
  `percent` smallint(6) NULL DEFAULT 0 COMMENT '是否显示为百分比',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标路径',
  `title` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图表标题',
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '字段类型 D金钱  T时间  P百分比  C数量  S字符串 存储例子：D，D，T',
  `search` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '搜索字段',
  `permission` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限',
  `tips` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明',
  `layout` varchar(26) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `span` int(11) NULL DEFAULT NULL COMMENT '子分组占父分组的列跨度',
  `chart` varchar(26) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件',
  `pattern` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_statistics_meta
-- ----------------------------
INSERT INTO `st_statistics_meta` VALUES (1, 'advertisers', 'SELECT\r\n	ca_advertiser.contact_name AS \'广告主名字\',\r\n	ca_advertiser.contact_phone AS \'广告主联系方式\',\r\n	ca_advertiser.address AS \'广告主地址\',\r\n	(\r\n		SELECT\r\n			COUNT(*)\r\n		FROM\r\n			ca_adverting_plan\r\n		LEFT JOIN ca_advertiser t ON t.id = ca_adverting_plan.advertiser_id\r\n		WHERE\r\n			t.id = ca_advertiser.id\r\n		AND MONTH (\r\n			ca_adverting_plan.create_time\r\n		) = MONTH (CURDATE())\r\n		AND YEAR (\r\n			ca_adverting_plan.create_time\r\n		) = YEAR (CURDATE())\r\n	) AS \'当月广告计划数量\',\r\n	(\r\n		SELECT\r\n			COUNT(*)\r\n		FROM\r\n			ca_adverting_plan\r\n		LEFT JOIN ca_advertiser t ON t.id = ca_adverting_plan.advertiser_id\r\n		WHERE\r\n			t.id = ca_advertiser.id\r\n		AND YEAR (\r\n			ca_adverting_plan.create_time\r\n		) = YEAR (CURDATE())\r\n	) AS \'当年广告计划数量\'\r\nFROM\r\n	ca_advertiser\r\n', 0, NULL, NULL, 'S,S,S,C,C', NULL, NULL, NULL, '', NULL, NULL, NULL);
INSERT INTO `st_statistics_meta` VALUES (2, 'advertiserTotal', 'SELECT\r\n\'advertiserTotal\' AS \'field\',\r\n\'广告主总数\' as \'title\',\r\n\'广告主总数\' as \'name\',\r\n COUNT(*) AS \'value\' ,\r\n \'Count\' as \'pattern\',\r\n \'BarTimeline\' As \'chart\',\r\n 1 AS \'span\'\r\nFROM\r\n  ca_advertiser ', 0, NULL, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, NULL);
INSERT INTO `st_statistics_meta` VALUES (3, 'orderStatePie', 'select ca_adverting_plan.`status` as `name`,COUNT(*) as `value`\r\nfrom ca_adverting_plan GROUP BY ca_adverting_plan.`status`', 0, NULL, '订单状态占比', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'rate');
INSERT INTO `st_statistics_meta` VALUES (4, 'mon', 'SELECT \r\n    mon.cmonth as `name`, mon.seq as \'value\',mon.seq\r\nFROM\r\n(\r\n	SELECT\r\n		DATE_FORMAT( @cdate := DATE_ADD( @cdate, INTERVAL + 1 MONTH ), \'%Y-%m\' ) AS cmonth ,FORMAT(@seq := @seq+1,0) as \'seq\'\r\n	FROM\r\n		( SELECT @cdate := DATE_ADD( concat(year(now()),\'-12-31\'), INTERVAL - 1 YEAR ) FROM pcd LIMIT 12 ) t0 ,(select @seq :=0) as seq\r\n	WHERE\r\n		date( @cdate ) <= DATE_ADD( concat(year(now()),\'-12-31\'), INTERVAL - 1 DAY )\r\n	\r\n)  mon \r\nLEFT JOIN\r\n    ca_adverting_plan on mon.cmonth = DATE_FORMAT(ca_adverting_plan.create_time, \'%Y-%m\')\r\nGROUP BY mon.cmonth\r\n', 0, NULL, '月度报表', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'TimeLine');
INSERT INTO `st_statistics_meta` VALUES (6, 'advertingPlanTotalAdvertiser', 'SELECT\r\n\'advertingPlanTotal\' AS \'field\',\r\n\'投放广告总数\' as \'title\',\r\n\'投放广告总数\' as \'name\',\r\n COUNT(*) AS \'value\' ,\r\n \'Count\' as \'pattern\',\r\n \'BarTimeline\' As \'chart\',\r\n 1 AS \'span\'\r\nFROM\r\n  ca_adverting_plan\r\nLEFT JOIN\r\n  ca_advertiser ON ca_advertiser.id = ca_adverting_plan.advertiser_id\r\nWHERE\r\n  ca_adverting_plan.`status` != \'REVIEW_REJECTED\'\r\n@if[advertiserId!=null]\r\nAND ca_advertiser.id = #{advertiserId}\r\n@end', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'count');
INSERT INTO `st_statistics_meta` VALUES (10, 'advertiserAdvertingPlanRank', 'SELECT\r\n  json_array(\r\n	ca_advertiser.contact_name\r\n ,\r\n	IFNULL(\r\n		ca_advertiser.avatar,\r\n		(\r\n			SELECT\r\n				t_config_field.`value`\r\n			FROM\r\n				t_config_field\r\n			WHERE\r\n				org_id = \'100000000000000010\'\r\n			AND t_config_field.field = \'defaultImage\'\r\n		)\r\n	)) as `用户`,\r\n	ca_advertiser.contact_phone AS `联系方式`,\r\n	ca_advertiser.address AS `地址`,\r\n	ca_advertiser.id,\r\n	COUNT(*) AS `广告计划数量`\r\nFROM\r\n	ca_advertiser\r\nLEFT JOIN ca_adverting_plan ON ca_adverting_plan.advertiser_id = ca_advertiser.id\r\nWHERE\r\n	ca_adverting_plan.`status` != \'REVIEW_REJECTED\'\r\nGROUP BY\r\n	ca_advertiser.id\r\nORDER BY\r\n	`广告计划数量` DESC\r\nLIMIT 0,10', 0, NULL, '广告主投放广告排名', 'A,S,S,C,C', NULL, NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO `st_statistics_meta` VALUES (13, 'cinemaOrderTotal', 'SELECT\r\n	\'cinemaOrderTotal\' AS \'field\',\r\n	\'影院总订单数量\' AS \'title\',\r\n	\'影院总订单数量\' AS \'name\',\r\n	COUNT(*) AS \'value\',\r\n	\'Count\' AS \'pattern\',\r\n	\'BarTimeline\' AS \'chart\',\r\n	1 AS \'span\'\r\nFROM\r\n	ca_cinema\r\nLEFT JOIN ca_order_task ON ca_order_task.cinema_id = ca_cinema.id\r\nLEFT JOIN t_sys_user ON t_sys_user.org_id = ca_cinema.org_id\r\nWHERE\r\n@if[orgId!=null]\r\n  t_sys_user.org_id = #{orgId}\r\n@end\r\nAND ca_order_task.`status` != \'ABOLISHE\'', 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 'Count');
INSERT INTO `st_statistics_meta` VALUES (27, 'waiterCompleteOrderThisMonthRank', 'SELECT\r\n  json_array(\r\n	t_sys_user. NAME,\r\n	IFNULL(\r\n		t_sys_user.avatar,\r\n		(\r\n			SELECT\r\n				t_config_field.`value`\r\n			FROM\r\n				t_config_field\r\n			WHERE\r\n				org_id = \'100000000000000010\'\r\n			AND t_config_field.field = \'defaultImage\'\r\n		)\r\n	))AS `用户`,\r\n	t_sys_user.phone AS `电话`,\r\n	t_sys_user.id,\r\n	COUNT(*) AS `当月完成订单数量`\r\nFROM\r\n	t_sys_user\r\nLEFT JOIN ca_planning_order ON ca_planning_order.assistant_id = t_sys_user.id\r\nWHERE\r\n	ca_planning_order.`status` = \'FINISHED\'\r\nAND MONTH (\r\n	ca_planning_order.update_time\r\n) = MONTH (CURDATE())\r\nAND YEAR (\r\n	ca_planning_order.update_time\r\n) = YEAR (CURDATE())\r\nGROUP BY\r\n	t_sys_user.id\r\nORDER BY\r\n	`当月完成订单数量` DESC\r\nLIMIT 0,10', 0, NULL, '店小二当月完成订单排名', 'A,S,C,C', NULL, NULL, NULL, NULL, 2, NULL, NULL);
INSERT INTO `st_statistics_meta` VALUES (28, 'user', 'select name as \'姓名\' from user', 0, NULL, '用户姓名', 'S', NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for st_statistics_meta_group
-- ----------------------------
DROP TABLE IF EXISTS `st_statistics_meta_group`;
CREATE TABLE `st_statistics_meta_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分组标识',
  `pid` bigint(20) NULL DEFAULT NULL,
  `pattern` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '自图标类型',
  `span` int(11) NULL DEFAULT NULL COMMENT '父span',
  `layout` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '布局json',
  `title` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '标题',
  `field` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `presenter` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `api_return` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0',
  `seq` int(11) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_statistics_meta_group
-- ----------------------------
INSERT INTO `st_statistics_meta_group` VALUES (1, 'AdvTemplate', NULL, NULL, NULL, '{\"name\":\"Grid\", \"props\":{}}', '测试标题', NULL, NULL, '0', 0);
INSERT INTO `st_statistics_meta_group` VALUES (2, NULL, 1, NULL, NULL, NULL, NULL, 'mon', 'MonthReportDemo', '0', 1);
INSERT INTO `st_statistics_meta_group` VALUES (3, 'secondTemplate', 1, NULL, NULL, NULL, NULL, NULL, NULL, '0', 2);
INSERT INTO `st_statistics_meta_group` VALUES (4, NULL, 3, NULL, NULL, NULL, NULL, 'orderStatePie', 'SpecialLabelPieDemo', '0', 0);
INSERT INTO `st_statistics_meta_group` VALUES (5, 'simple', NULL, NULL, NULL, '{\"name\":\"Grid\", \"props\":{\"col\":4}}', '简单组合', NULL, NULL, '0', 1);
INSERT INTO `st_statistics_meta_group` VALUES (6, NULL, 5, NULL, NULL, NULL, NULL, 'orderStatePie', 'SpecialLabelPieDemo', '0', 5);
INSERT INTO `st_statistics_meta_group` VALUES (7, NULL, 5, NULL, NULL, NULL, NULL, 'mon', 'MonthReportDemo', '1', 3);

-- ----------------------------
-- Table structure for st_statistics_record
-- ----------------------------
DROP TABLE IF EXISTS `st_statistics_record`;
CREATE TABLE `st_statistics_record`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `field` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据域标识符',
  `identifier` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统计归属标识',
  `seq` int(11) NOT NULL DEFAULT 0 COMMENT '记录排序号',
  `record_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录名称',
  `record_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记录值',
  `record_tuple` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录值所属行名称',
  `record_cluster` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录值所属分类名称',
  `record_timeline` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '记录值所属时间区间名称',
  `timeline` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '统计时段说明[T,D,W,M,Y,LD3,LW1,LM1,LM3,Q1,Q2,Q3,Q4,TF]',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `tmp_field_id` bigint(20) NULL DEFAULT NULL COMMENT '临时标记数据域ID',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `field`(`field`, `record_name`, `record_tuple`, `record_cluster`, `timeline`, `identifier`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of st_statistics_record
-- ----------------------------
INSERT INTO `st_statistics_record` VALUES (1, 'total:sales:sum@stat:b:store:child', 'adv', 0, '新增广告主record', '123', NULL, NULL, NULL, NULL, '2020-10-21 18:02:02', NULL);
INSERT INTO `st_statistics_record` VALUES (2, 'pie', 'pie', 0, 'pie例子', '20', NULL, NULL, NULL, NULL, '2020-10-23 18:28:46', NULL);

-- ----------------------------
-- Table structure for sys_app_permission
-- ----------------------------
DROP TABLE IF EXISTS `sys_app_permission`;
CREATE TABLE `sys_app_permission`  (
  `id` bigint(20) NOT NULL,
  `appid` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '项目id',
  `permission` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限',
  `apiid` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口id',
  `api_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '请求路径',
  `api_method` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'GET POST, DELETE PUT 请求方式',
  `service_name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '微服务名',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_app_permission
-- ----------------------------

-- ----------------------------
-- Table structure for sys_perm
-- ----------------------------
DROP TABLE IF EXISTS `sys_perm`;
CREATE TABLE `sys_perm`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `group_id` bigint(20) NULL DEFAULT NULL COMMENT '权限所属组',
  `identifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限值',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限名',
  `tag` smallint(6) NULL DEFAULT 0 COMMENT '标签，0：普通权限，1：菜单',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `group_id`(`group_id`) USING BTREE,
  CONSTRAINT `sys_perm_ibfk_1` FOREIGN KEY (`group_id`) REFERENCES `sys_perm_group` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 876708082437197926 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_perm
-- ----------------------------
INSERT INTO `sys_perm` VALUES (100000000000010001, 100000000000000105, 'sysUser.view', '查看用户', 0);
INSERT INTO `sys_perm` VALUES (100000000000010002, 100000000000000105, 'sysUser.edit', '编辑用户', 0);
INSERT INTO `sys_perm` VALUES (100000000000010003, 100000000000000105, 'sysUser.del', '删除用户', 0);
INSERT INTO `sys_perm` VALUES (100000000000011001, 100000000000000005, 'OperationLog.view', '查看日志', 0);
INSERT INTO `sys_perm` VALUES (100000000000011002, 100000000000000006, 'Config.view', '查看配置', 0);
INSERT INTO `sys_perm` VALUES (100000000000011003, 100000000000000006, 'Config.edit', '修改配置', 0);
INSERT INTO `sys_perm` VALUES (100000000000020001, 100000000000000106, 'sysRole.view', '查看角色', 0);
INSERT INTO `sys_perm` VALUES (100000000000020002, 100000000000000106, 'sysRole.edit', '更新角色', 0);
INSERT INTO `sys_perm` VALUES (100000000000020003, 100000000000000106, 'sysRole.del', '删除角色', 0);
INSERT INTO `sys_perm` VALUES (100000000000030001, 100000000000000103, 'Org.view', '查看组织', 0);
INSERT INTO `sys_perm` VALUES (100000000000030002, 100000000000000103, 'Org.edit', '编辑组织', 0);
INSERT INTO `sys_perm` VALUES (100000000000030003, 100000000000000103, 'Org.del', '删除组织', 0);
INSERT INTO `sys_perm` VALUES (100000000000030010, 100000000000000108, 'advertingplan.view', '查看广告计划', 0);
INSERT INTO `sys_perm` VALUES (100000000000030011, 100000000000000108, 'advertingplan.new', '新建广告计划', 0);
INSERT INTO `sys_perm` VALUES (100000000000030012, 100000000000000108, 'advertingplan.edit', '编辑广告计划', 0);
INSERT INTO `sys_perm` VALUES (100000000000030013, 100000000000000108, 'advertingplan.delete', '删除广告计划', 0);
INSERT INTO `sys_perm` VALUES (100000000000030014, 100000000000000109, 'order.view', '查看广告订单', 0);
INSERT INTO `sys_perm` VALUES (100000000000030015, 100000000000000109, 'order.new', '新建广告订单', 0);
INSERT INTO `sys_perm` VALUES (100000000000030016, 100000000000000109, 'order.edit', '编辑广告订单', 0);
INSERT INTO `sys_perm` VALUES (100000000000030017, 100000000000000109, 'order.delete', '删除广告订单', 0);
INSERT INTO `sys_perm` VALUES (100000000000030018, 100000000000000110, 'ordertask.view', '查看执行订单', 0);
INSERT INTO `sys_perm` VALUES (100000000000030019, 100000000000000110, 'ordertask.new', '新建执行订单', 0);
INSERT INTO `sys_perm` VALUES (100000000000030020, 100000000000000110, 'ordertask.edit', '编辑执行订单', 0);
INSERT INTO `sys_perm` VALUES (100000000000030021, 100000000000000110, 'ordertask.delete', '删除执行订单', 0);
INSERT INTO `sys_perm` VALUES (100000000000030022, 100000000000000111, 'advertingmaterial.view', '查看素材管理', 0);
INSERT INTO `sys_perm` VALUES (100000000000030023, 100000000000000111, 'advertingmaterial.new', '新建素材管理', 0);
INSERT INTO `sys_perm` VALUES (100000000000030024, 100000000000000111, 'advertingmaterial.edit', '编辑素材管理', 0);
INSERT INTO `sys_perm` VALUES (100000000000030025, 100000000000000111, 'advertingmaterial.delete', '删除素材管理', 0);
INSERT INTO `sys_perm` VALUES (100000000000030026, 100000000000000114, 'filmschedule.view', '查看排期管理', 0);
INSERT INTO `sys_perm` VALUES (100000000000030027, 100000000000000114, 'filmschedule.new', '新建排期管理', 0);
INSERT INTO `sys_perm` VALUES (100000000000030028, 100000000000000114, 'filmschedule.edit', '编辑排期管理', 0);
INSERT INTO `sys_perm` VALUES (100000000000030029, 100000000000000114, 'filmschedule.delete', '删除排期管理', 0);
INSERT INTO `sys_perm` VALUES (100000000000030030, 100000000000000115, 'film.view', '查看影片管理', 0);
INSERT INTO `sys_perm` VALUES (100000000000030031, 100000000000000115, 'film.new', '新建影片管理', 0);
INSERT INTO `sys_perm` VALUES (100000000000030032, 100000000000000115, 'film.edit', '编辑影片管理', 0);
INSERT INTO `sys_perm` VALUES (100000000000030033, 100000000000000115, 'film.delete', '删除影片管理', 0);
INSERT INTO `sys_perm` VALUES (100000000000030034, 100000000000000116, 'cinema.view', '查看影院管理', 0);
INSERT INTO `sys_perm` VALUES (100000000000030035, 100000000000000116, 'cinema.new', '新建影院管理', 0);
INSERT INTO `sys_perm` VALUES (100000000000030036, 100000000000000116, 'cinema.edit', '编辑影院管理', 0);
INSERT INTO `sys_perm` VALUES (100000000000030037, 100000000000000116, 'cinema.delete', '删除影院管理', 0);
INSERT INTO `sys_perm` VALUES (100000000000030038, 100000000000000117, 'billingstrategy.view', '查看策略管理', 0);
INSERT INTO `sys_perm` VALUES (100000000000030039, 100000000000000117, 'billingstrategy.new', '新建策略管理', 0);
INSERT INTO `sys_perm` VALUES (100000000000030040, 100000000000000117, 'billingstrategy.edit', '编辑策略管理', 0);
INSERT INTO `sys_perm` VALUES (100000000000030041, 100000000000000117, 'billingstrategy.delete', '删除策略管理', 0);
INSERT INTO `sys_perm` VALUES (100000000000030042, 100000000000000108, 'advertingplan.review', '审核广告计划', 0);
INSERT INTO `sys_perm` VALUES (100000000000030043, 100000000000000108, 'advertingplan.order', '下单广告计划', 0);
INSERT INTO `sys_perm` VALUES (100000000000030044, 100000000000000109, 'order.provide', '提交订单结案', 0);
INSERT INTO `sys_perm` VALUES (100000000000030045, 100000000000000109, 'order.confirm', '确认订单', 0);
INSERT INTO `sys_perm` VALUES (100000000000030046, 100000000000000109, 'order.finish', '结算订单', 0);
INSERT INTO `sys_perm` VALUES (100000000000030047, 100000000000000110, 'ordertask.deliver', '下发子订单', 0);
INSERT INTO `sys_perm` VALUES (100000000000030048, 100000000000000110, 'ordertask.cancel', '取消子订单', 0);
INSERT INTO `sys_perm` VALUES (100000000000030049, 100000000000000110, 'ordertask.provide', '上传子订单结案文件', 0);
INSERT INTO `sys_perm` VALUES (100000000000030050, 100000000000000110, 'ordertask.verify', '确认子订单结案', 0);
INSERT INTO `sys_perm` VALUES (100000000000030051, 100000000000000111, 'advertingmaterialsw.edit', '商务编辑素材管理', 0);
INSERT INTO `sys_perm` VALUES (100000000000030052, 100000000000000112, 'advertiser.setAssistant', '分配店小二', 0);
INSERT INTO `sys_perm` VALUES (100000000000030053, 100000000000000116, 'cinema.setAssistant', '分配商务', 0);
INSERT INTO `sys_perm` VALUES (100000000000310001, 100000000000000112, 'advertiser.view', '查看广告主', 0);
INSERT INTO `sys_perm` VALUES (100000000000310002, 100000000000000112, 'advertiser.edit', '编辑广告主', 0);
INSERT INTO `sys_perm` VALUES (100000000000310003, 100000000000000112, 'advertiser.del', '删除广告主', 0);
INSERT INTO `sys_perm` VALUES (100000000000310004, 100000000000000112, 'advertiser.new', '新增广告主', 0);
INSERT INTO `sys_perm` VALUES (876708082437197920, 876708082437197910, 'sysUser.view', '查看用户', 0);
INSERT INTO `sys_perm` VALUES (876708082437197921, 876708082437197910, 'sysUser.edit', '编辑用户', 0);
INSERT INTO `sys_perm` VALUES (876708082437197922, 876708082437197910, 'sysUser.del', '删除用户', 0);
INSERT INTO `sys_perm` VALUES (876708082437197923, 876708082437197911, 'sysRole.view', '查看角色', 0);
INSERT INTO `sys_perm` VALUES (876708082437197924, 876708082437197911, 'sysRole.edit', '更新角色', 0);
INSERT INTO `sys_perm` VALUES (876708082437197925, 876708082437197911, 'sysRole.del', '删除角色', 0);

-- ----------------------------
-- Table structure for sys_perm_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_perm_group`;
CREATE TABLE `sys_perm_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `org_id` bigint(20) NOT NULL COMMENT '资源隔离字段',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '父部门id',
  `identifier` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标识符',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 876708082437197912 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_perm_group
-- ----------------------------
INSERT INTO `sys_perm_group` VALUES (100000000000000001, 100000000000000001, NULL, 'root', '权限管理');
INSERT INTO `sys_perm_group` VALUES (100000000000000002, 100000000000000001, 100000000000000001, 'management', '系统管理');
INSERT INTO `sys_perm_group` VALUES (100000000000000005, 100000000000000010, 100000000000000102, 'contract.management', '操作日志');
INSERT INTO `sys_perm_group` VALUES (100000000000000006, 100000000000000010, 100000000000000102, 'Config.management', '系统配置');
INSERT INTO `sys_perm_group` VALUES (100000000000000101, 100000000000000010, NULL, 'root', '权限管理');
INSERT INTO `sys_perm_group` VALUES (100000000000000102, 100000000000000010, 100000000000000101, 'management', '系统管理');
INSERT INTO `sys_perm_group` VALUES (100000000000000103, 100000000000000010, 100000000000000102, 'Org.management', '组织管理');
INSERT INTO `sys_perm_group` VALUES (100000000000000105, 100000000000000010, 100000000000000102, 'sysUser.management', '用户管理');
INSERT INTO `sys_perm_group` VALUES (100000000000000106, 100000000000000010, 100000000000000102, 'sysRole.management', '角色管理');
INSERT INTO `sys_perm_group` VALUES (100000000000000107, 100000000000000010, 100000000000000101, 'adverting.management', '广告管理');
INSERT INTO `sys_perm_group` VALUES (100000000000000108, 100000000000000010, 100000000000000107, 'advertingPlan.management', '广告计划');
INSERT INTO `sys_perm_group` VALUES (100000000000000109, 100000000000000010, 100000000000000107, 'planningOrder.management', '广告订单');
INSERT INTO `sys_perm_group` VALUES (100000000000000110, 100000000000000010, 100000000000000107, 'orderTask.management', '执行订单');
INSERT INTO `sys_perm_group` VALUES (100000000000000111, 100000000000000010, 100000000000000107, 'advertingMaterial.management', '素材管理');
INSERT INTO `sys_perm_group` VALUES (100000000000000112, 100000000000000010, 100000000000000107, 'Org.management', '广告主管理');
INSERT INTO `sys_perm_group` VALUES (100000000000000113, 100000000000000010, 100000000000000101, 'cinema.management', '影院管理');
INSERT INTO `sys_perm_group` VALUES (100000000000000114, 100000000000000010, 100000000000000113, 'filmSchedule.management', '影片排期');
INSERT INTO `sys_perm_group` VALUES (100000000000000115, 100000000000000010, 100000000000000113, 'film.management', '影片管理');
INSERT INTO `sys_perm_group` VALUES (100000000000000116, 100000000000000010, 100000000000000113, 'cinemaOrg.management', '影院管理');
INSERT INTO `sys_perm_group` VALUES (100000000000000117, 100000000000000010, 100000000000000107, 'billingStrategy.management', '收费策略');
INSERT INTO `sys_perm_group` VALUES (876708082437197910, 100000000000000001, 100000000000000002, 'sysUser.management', '用户管理');
INSERT INTO `sys_perm_group` VALUES (876708082437197911, 100000000000000001, 100000000000000002, 'sysRole.management', '角色管理');

-- ----------------------------
-- Table structure for sys_perm_url
-- ----------------------------
DROP TABLE IF EXISTS `sys_perm_url`;
CREATE TABLE `sys_perm_url`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `perm_id` bigint(20) NOT NULL COMMENT '权限id',
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '路径',
  `org_id` bigint(20) NULL DEFAULT NULL,
  `org_tag` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '路径权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_perm_url
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `org_id` bigint(20) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT 1 COMMENT '排序号',
  `pid` bigint(20) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tips` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `version` int(11) NULL DEFAULT NULL,
  `role_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '不允许用户修改的Code字段',
  `made_by` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'USER' COMMENT '如果由系统创建则不允许删除 USER 用户创建    SYSTEM 系统创建',
  `user_type` int(11) NULL DEFAULT NULL COMMENT '用户类型 0-默认-平台用户(传统用户，隔离在租户下) 1-组织管理人 2-个人用户 3-个人组织用户 101-管理员（租户管理员 自动跳过权限检查） 102-观察者用户 所有看的权限',
  `delete_flag` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `org_id_2`(`org_id`, `role_code`) USING BTREE,
  UNIQUE INDEX `org_id`(`org_id`, `name`) USING BTREE,
  CONSTRAINT `sys_role_ibfk_1` FOREIGN KEY (`org_id`) REFERENCES `t_sys_org` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 876708082437197851 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (2, 100000000000000010, 1, NULL, '商务主管', '各个商务的管理人', NULL, '105', 'SYSTEM', 3, 0);
INSERT INTO `sys_role` VALUES (3, 100000000000000010, 1, NULL, '店小二主管', '各个店小二的管理人', NULL, '103', 'SYSTEM', 3, 0);
INSERT INTO `sys_role` VALUES (4, 100000000000000010, 1, NULL, '商务', '负责影院管理的角色', NULL, '106', 'SYSTEM', 2, 0);
INSERT INTO `sys_role` VALUES (5, 100000000000000010, 1, NULL, '店小二', '复制广告主管理的角色', NULL, '104', 'SYSTEM', 2, 0);
INSERT INTO `sys_role` VALUES (6, 100000000000000010, 1, NULL, '平台管理员', '平台管理员', NULL, '101', 'SYSTEM', 101, 0);
INSERT INTO `sys_role` VALUES (7, 100000000000000010, 1, NULL, '广告主-审核前', '广告主-审核前', NULL, '200', 'SYSTEM', NULL, 0);
INSERT INTO `sys_role` VALUES (8, 100000000000000010, 1, NULL, '广告主-审核后', '广告主-审核后', NULL, '201', 'SYSTEM', NULL, 0);
INSERT INTO `sys_role` VALUES (9, 100000000000000010, 1, NULL, '影院管理人', '影院', NULL, '301', 'SYSTEM', NULL, 0);
INSERT INTO `sys_role` VALUES (876708082437197826, 100000000000000001, 1, 0, '超级管理员', 'administrator', 1, 'admin', 'SYSTEM', NULL, 1);
INSERT INTO `sys_role` VALUES (876708082437197827, 100000000000000010, 1, NULL, '财务', '专门用于结算的角色', NULL, NULL, 'USER', NULL, 0);
INSERT INTO `sys_role` VALUES (876708082437197828, 100000000000000010, 1, NULL, '运营', '负责系统的运营工作', NULL, NULL, 'USER', NULL, 1);
INSERT INTO `sys_role` VALUES (876708082437197829, 100000000000000114, 1, NULL, '运营人员', '', NULL, NULL, 'USER', NULL, 0);
INSERT INTO `sys_role` VALUES (876708082437197830, 100000000000000114, 1, NULL, '财务人员', '', NULL, NULL, 'USER', NULL, 0);
INSERT INTO `sys_role` VALUES (876708082437197831, 100000000000000115, 1, NULL, '运营人员', '', NULL, NULL, 'USER', NULL, 0);
INSERT INTO `sys_role` VALUES (876708082437197832, 100000000000000115, 1, NULL, '财务人员', '', NULL, NULL, 'USER', NULL, 0);
INSERT INTO `sys_role` VALUES (876708082437197833, 100000000000000116, 1, NULL, '运营人员', '', NULL, NULL, 'USER', NULL, 0);
INSERT INTO `sys_role` VALUES (876708082437197834, 100000000000000116, 1, NULL, '财务人员', '', NULL, NULL, 'USER', NULL, 0);
INSERT INTO `sys_role` VALUES (876708082437197835, 100000000000000117, 1, NULL, '运营人员', '', NULL, NULL, 'USER', NULL, 0);
INSERT INTO `sys_role` VALUES (876708082437197836, 100000000000000117, 1, NULL, '财务人员', '', NULL, NULL, 'USER', NULL, 0);
INSERT INTO `sys_role` VALUES (876708082437197837, 100000000000000118, 1, NULL, '运营人员', '', NULL, NULL, 'USER', NULL, 0);
INSERT INTO `sys_role` VALUES (876708082437197838, 100000000000000118, 1, NULL, '财务人员', '', NULL, NULL, 'USER', NULL, 0);
INSERT INTO `sys_role` VALUES (876708082437197839, 100000000000000119, 1, NULL, '运营人员', '', NULL, NULL, 'USER', NULL, 0);
INSERT INTO `sys_role` VALUES (876708082437197840, 100000000000000119, 1, NULL, '财务人员', '', NULL, NULL, 'USER', NULL, 0);
INSERT INTO `sys_role` VALUES (876708082437197841, 100000000000000120, 1, NULL, '运营人员', '', NULL, NULL, 'USER', NULL, 0);
INSERT INTO `sys_role` VALUES (876708082437197842, 100000000000000120, 1, NULL, '财务人员', '', NULL, NULL, 'USER', NULL, 0);
INSERT INTO `sys_role` VALUES (876708082437197843, 100000000000000121, 1, NULL, '运营人员', '', NULL, NULL, 'USER', NULL, 0);
INSERT INTO `sys_role` VALUES (876708082437197844, 100000000000000121, 1, NULL, '财务人员', '', NULL, NULL, 'USER', NULL, 0);
INSERT INTO `sys_role` VALUES (876708082437197845, 100000000000000122, 1, NULL, '运营人员', '', NULL, NULL, 'USER', NULL, 0);
INSERT INTO `sys_role` VALUES (876708082437197846, 100000000000000122, 1, NULL, '财务人员', '', NULL, NULL, 'USER', NULL, 0);
INSERT INTO `sys_role` VALUES (876708082437197847, 100000000000000123, 1, NULL, '运营人员', '', NULL, NULL, 'USER', NULL, 0);
INSERT INTO `sys_role` VALUES (876708082437197848, 100000000000000123, 1, NULL, '财务人员', '', NULL, NULL, 'USER', NULL, 0);
INSERT INTO `sys_role` VALUES (876708082437197849, 100000000000000124, 1, NULL, '运营人员', '', NULL, NULL, 'USER', NULL, 0);
INSERT INTO `sys_role` VALUES (876708082437197850, 100000000000000124, 1, NULL, '财务人员', '', NULL, NULL, 'USER', NULL, 0);

-- ----------------------------
-- Table structure for sys_role_perm
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_perm`;
CREATE TABLE `sys_role_perm`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `perm_id` bigint(20) NULL DEFAULT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE,
  INDEX `perm_id`(`perm_id`) USING BTREE,
  CONSTRAINT `sys_role_perm_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sys_role_perm_ibfk_2` FOREIGN KEY (`perm_id`) REFERENCES `sys_perm` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 876708082437209047 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_perm
-- ----------------------------
INSERT INTO `sys_role_perm` VALUES (876708082437201468, 100000000000030010, 3);
INSERT INTO `sys_role_perm` VALUES (876708082437201469, 100000000000030012, 3);
INSERT INTO `sys_role_perm` VALUES (876708082437201470, 100000000000030042, 3);
INSERT INTO `sys_role_perm` VALUES (876708082437201471, 100000000000030043, 3);
INSERT INTO `sys_role_perm` VALUES (876708082437201472, 100000000000030014, 3);
INSERT INTO `sys_role_perm` VALUES (876708082437201473, 100000000000030044, 3);
INSERT INTO `sys_role_perm` VALUES (876708082437201474, 100000000000030018, 3);
INSERT INTO `sys_role_perm` VALUES (876708082437201475, 100000000000310001, 3);
INSERT INTO `sys_role_perm` VALUES (876708082437201476, 100000000000030022, 3);
INSERT INTO `sys_role_perm` VALUES (876708082437201477, 100000000000030024, 3);
INSERT INTO `sys_role_perm` VALUES (876708082437201478, 100000000000030026, 3);
INSERT INTO `sys_role_perm` VALUES (876708082437201479, 100000000000010001, 3);
INSERT INTO `sys_role_perm` VALUES (876708082437201480, 100000000000310002, 3);
INSERT INTO `sys_role_perm` VALUES (876708082437201481, 100000000000030001, 3);
INSERT INTO `sys_role_perm` VALUES (876708082437201482, 100000000000030015, 3);
INSERT INTO `sys_role_perm` VALUES (876708082437201483, 100000000000030052, 3);
INSERT INTO `sys_role_perm` VALUES (876708082437201484, 100000000000310003, 3);
INSERT INTO `sys_role_perm` VALUES (876708082437201485, 100000000000310004, 3);
INSERT INTO `sys_role_perm` VALUES (876708082437203197, 100000000000310001, 5);
INSERT INTO `sys_role_perm` VALUES (876708082437203198, 100000000000310002, 5);
INSERT INTO `sys_role_perm` VALUES (876708082437203199, 100000000000030010, 5);
INSERT INTO `sys_role_perm` VALUES (876708082437203200, 100000000000030012, 5);
INSERT INTO `sys_role_perm` VALUES (876708082437203201, 100000000000030042, 5);
INSERT INTO `sys_role_perm` VALUES (876708082437203202, 100000000000030014, 5);
INSERT INTO `sys_role_perm` VALUES (876708082437203203, 100000000000030044, 5);
INSERT INTO `sys_role_perm` VALUES (876708082437203204, 100000000000030018, 5);
INSERT INTO `sys_role_perm` VALUES (876708082437203205, 100000000000030022, 5);
INSERT INTO `sys_role_perm` VALUES (876708082437203206, 100000000000030024, 5);
INSERT INTO `sys_role_perm` VALUES (876708082437203207, 100000000000030026, 5);
INSERT INTO `sys_role_perm` VALUES (876708082437203208, 100000000000030043, 5);
INSERT INTO `sys_role_perm` VALUES (876708082437203209, 100000000000030015, 5);
INSERT INTO `sys_role_perm` VALUES (876708082437203210, 100000000000310003, 5);
INSERT INTO `sys_role_perm` VALUES (876708082437203211, 100000000000310004, 5);
INSERT INTO `sys_role_perm` VALUES (876708082437203212, 100000000000030045, 5);
INSERT INTO `sys_role_perm` VALUES (876708082437203300, 100000000000030018, 9);
INSERT INTO `sys_role_perm` VALUES (876708082437203301, 100000000000030020, 9);
INSERT INTO `sys_role_perm` VALUES (876708082437203302, 100000000000030049, 9);
INSERT INTO `sys_role_perm` VALUES (876708082437203303, 100000000000030001, 9);
INSERT INTO `sys_role_perm` VALUES (876708082437203304, 100000000000030002, 9);
INSERT INTO `sys_role_perm` VALUES (876708082437203305, 100000000000030003, 9);
INSERT INTO `sys_role_perm` VALUES (876708082437203306, 100000000000010001, 9);
INSERT INTO `sys_role_perm` VALUES (876708082437203307, 100000000000010002, 9);
INSERT INTO `sys_role_perm` VALUES (876708082437203308, 100000000000010003, 9);
INSERT INTO `sys_role_perm` VALUES (876708082437203309, 100000000000030026, 9);
INSERT INTO `sys_role_perm` VALUES (876708082437203310, 100000000000020001, 9);
INSERT INTO `sys_role_perm` VALUES (876708082437203311, 100000000000020002, 9);
INSERT INTO `sys_role_perm` VALUES (876708082437203312, 100000000000020003, 9);
INSERT INTO `sys_role_perm` VALUES (876708082437203709, 100000000000030010, 8);
INSERT INTO `sys_role_perm` VALUES (876708082437203710, 100000000000030011, 8);
INSERT INTO `sys_role_perm` VALUES (876708082437203711, 100000000000030012, 8);
INSERT INTO `sys_role_perm` VALUES (876708082437203712, 100000000000030013, 8);
INSERT INTO `sys_role_perm` VALUES (876708082437203713, 100000000000030043, 8);
INSERT INTO `sys_role_perm` VALUES (876708082437203714, 100000000000030014, 8);
INSERT INTO `sys_role_perm` VALUES (876708082437203715, 100000000000030022, 8);
INSERT INTO `sys_role_perm` VALUES (876708082437203716, 100000000000030023, 8);
INSERT INTO `sys_role_perm` VALUES (876708082437203717, 100000000000030024, 8);
INSERT INTO `sys_role_perm` VALUES (876708082437203718, 100000000000030025, 8);
INSERT INTO `sys_role_perm` VALUES (876708082437203719, 100000000000030026, 8);
INSERT INTO `sys_role_perm` VALUES (876708082437203720, 100000000000011001, 8);
INSERT INTO `sys_role_perm` VALUES (876708082437203721, 100000000000030001, 8);
INSERT INTO `sys_role_perm` VALUES (876708082437203722, 100000000000030002, 8);
INSERT INTO `sys_role_perm` VALUES (876708082437203723, 100000000000030003, 8);
INSERT INTO `sys_role_perm` VALUES (876708082437203724, 100000000000010001, 8);
INSERT INTO `sys_role_perm` VALUES (876708082437203725, 100000000000010002, 8);
INSERT INTO `sys_role_perm` VALUES (876708082437203726, 100000000000010003, 8);
INSERT INTO `sys_role_perm` VALUES (876708082437203727, 100000000000020001, 8);
INSERT INTO `sys_role_perm` VALUES (876708082437203728, 100000000000020002, 8);
INSERT INTO `sys_role_perm` VALUES (876708082437203729, 100000000000020003, 8);
INSERT INTO `sys_role_perm` VALUES (876708082437205314, 100000000000030018, 2);
INSERT INTO `sys_role_perm` VALUES (876708082437205315, 100000000000030020, 2);
INSERT INTO `sys_role_perm` VALUES (876708082437205316, 100000000000030048, 2);
INSERT INTO `sys_role_perm` VALUES (876708082437205317, 100000000000030050, 2);
INSERT INTO `sys_role_perm` VALUES (876708082437205318, 100000000000030047, 2);
INSERT INTO `sys_role_perm` VALUES (876708082437205319, 100000000000030026, 2);
INSERT INTO `sys_role_perm` VALUES (876708082437205320, 100000000000010001, 2);
INSERT INTO `sys_role_perm` VALUES (876708082437205321, 100000000000030001, 2);
INSERT INTO `sys_role_perm` VALUES (876708082437205322, 100000000000030051, 2);
INSERT INTO `sys_role_perm` VALUES (876708082437205323, 100000000000030034, 2);
INSERT INTO `sys_role_perm` VALUES (876708082437205324, 100000000000030035, 2);
INSERT INTO `sys_role_perm` VALUES (876708082437205325, 100000000000030036, 2);
INSERT INTO `sys_role_perm` VALUES (876708082437205326, 100000000000030037, 2);
INSERT INTO `sys_role_perm` VALUES (876708082437205327, 100000000000030053, 2);
INSERT INTO `sys_role_perm` VALUES (876708082437205328, 100000000000030049, 2);
INSERT INTO `sys_role_perm` VALUES (876708082437205329, 100000000000030018, 4);
INSERT INTO `sys_role_perm` VALUES (876708082437205330, 100000000000030020, 4);
INSERT INTO `sys_role_perm` VALUES (876708082437205331, 100000000000030047, 4);
INSERT INTO `sys_role_perm` VALUES (876708082437205332, 100000000000030048, 4);
INSERT INTO `sys_role_perm` VALUES (876708082437205333, 100000000000030050, 4);
INSERT INTO `sys_role_perm` VALUES (876708082437205334, 100000000000030034, 4);
INSERT INTO `sys_role_perm` VALUES (876708082437205335, 100000000000030036, 4);
INSERT INTO `sys_role_perm` VALUES (876708082437205336, 100000000000030026, 4);
INSERT INTO `sys_role_perm` VALUES (876708082437205337, 100000000000030051, 4);
INSERT INTO `sys_role_perm` VALUES (876708082437205338, 100000000000030035, 4);
INSERT INTO `sys_role_perm` VALUES (876708082437205339, 100000000000030037, 4);
INSERT INTO `sys_role_perm` VALUES (876708082437205340, 100000000000030049, 4);
INSERT INTO `sys_role_perm` VALUES (876708082437205803, 100000000000030001, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205804, 100000000000030002, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205805, 100000000000030003, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205806, 100000000000010001, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205807, 100000000000010002, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205808, 100000000000010003, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205809, 100000000000020001, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205810, 100000000000020002, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205811, 100000000000020003, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205812, 100000000000030018, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205813, 100000000000030019, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205814, 100000000000030020, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205815, 100000000000030022, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205816, 100000000000030024, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205817, 100000000000310001, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205818, 100000000000310002, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205819, 100000000000310004, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205820, 100000000000030026, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205821, 100000000000030027, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205822, 100000000000030028, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205823, 100000000000030029, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205824, 100000000000030030, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205825, 100000000000030031, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205826, 100000000000030032, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205827, 100000000000030033, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205828, 100000000000030034, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205829, 100000000000030035, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205830, 100000000000030036, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205831, 100000000000030037, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205832, 100000000000030010, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205833, 100000000000030012, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205834, 100000000000030042, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205835, 100000000000030043, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205836, 100000000000030014, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205837, 100000000000030015, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205838, 100000000000030016, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205839, 100000000000030044, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205840, 100000000000030045, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205841, 100000000000030046, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205842, 100000000000030047, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205843, 100000000000030048, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205844, 100000000000030049, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205845, 100000000000030050, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205846, 100000000000030038, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205847, 100000000000030039, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205848, 100000000000030040, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205849, 100000000000030041, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205850, 100000000000011001, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205851, 100000000000011002, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205852, 100000000000011003, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205853, 100000000000030051, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205854, 100000000000310003, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437205855, 100000000000030052, 6);
INSERT INTO `sys_role_perm` VALUES (876708082437206582, 100000000000030046, 876708082437197827);
INSERT INTO `sys_role_perm` VALUES (876708082437206583, 100000000000030014, 876708082437197827);
INSERT INTO `sys_role_perm` VALUES (876708082437208981, 100000000000010001, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437208982, 100000000000010002, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437208983, 100000000000010003, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437208984, 100000000000011001, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437208985, 100000000000011002, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437208986, 100000000000011003, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437208987, 100000000000020001, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437208988, 100000000000020002, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437208989, 100000000000020003, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437208990, 100000000000030001, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437208991, 100000000000030002, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437208992, 100000000000030003, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437208993, 100000000000030010, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437208994, 100000000000030011, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437208995, 100000000000030012, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437208996, 100000000000030013, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437208997, 100000000000030014, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437208998, 100000000000030015, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437208999, 100000000000030016, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209000, 100000000000030017, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209001, 100000000000030018, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209002, 100000000000030019, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209003, 100000000000030020, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209004, 100000000000030021, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209005, 100000000000030022, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209006, 100000000000030023, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209007, 100000000000030024, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209008, 100000000000030025, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209009, 100000000000030026, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209010, 100000000000030027, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209011, 100000000000030028, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209012, 100000000000030029, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209013, 100000000000030030, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209014, 100000000000030031, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209015, 100000000000030032, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209016, 100000000000030033, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209017, 100000000000030034, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209018, 100000000000030035, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209019, 100000000000030036, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209020, 100000000000030037, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209021, 100000000000030038, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209022, 100000000000030039, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209023, 100000000000030040, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209024, 100000000000030041, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209025, 100000000000030042, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209026, 100000000000030043, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209027, 100000000000030044, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209028, 100000000000030045, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209029, 100000000000030046, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209030, 100000000000030047, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209031, 100000000000030048, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209032, 100000000000030049, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209033, 100000000000030050, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209034, 100000000000030051, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209035, 100000000000030052, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209036, 100000000000030053, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209037, 100000000000310001, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209038, 100000000000310002, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209039, 100000000000310003, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209040, 100000000000310004, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209041, 876708082437197920, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209042, 876708082437197921, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209043, 876708082437197922, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209044, 876708082437197923, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209045, 876708082437197924, 876708082437197826);
INSERT INTO `sys_role_perm` VALUES (876708082437209046, 876708082437197925, 876708082437197826);

-- ----------------------------
-- Table structure for sys_role_perm_group
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_perm_group`;
CREATE TABLE `sys_role_perm_group`  (
  `id` bigint(20) NOT NULL,
  `perm_group_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_id`(`role_id`, `perm_group_id`) USING BTREE,
  INDEX `role_id_2`(`role_id`) USING BTREE,
  INDEX `perm_group_id`(`perm_group_id`) USING BTREE,
  CONSTRAINT `sys_role_perm_group_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sys_role_perm_group_ibfk_2` FOREIGN KEY (`perm_group_id`) REFERENCES `sys_perm_group` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_perm_group
-- ----------------------------

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `role_id`(`role_id`, `user_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `sys_user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_sys_user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `sys_user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `sys_role` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 876708082437197914 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (876708082437197862, 876708082437197837, 2);
INSERT INTO `sys_user_role` VALUES (876708082437197850, 876708082437197847, 2);
INSERT INTO `sys_user_role` VALUES (876708082437197863, 876708082437197851, 3);
INSERT INTO `sys_user_role` VALUES (876708082437197856, 876708082437197853, 3);
INSERT INTO `sys_user_role` VALUES (876708082437197872, 876708082437197862, 4);
INSERT INTO `sys_user_role` VALUES (876708082437197874, 876708082437197836, 5);
INSERT INTO `sys_user_role` VALUES (876708082437197851, 876708082437197848, 5);
INSERT INTO `sys_user_role` VALUES (876708082437197878, 876708082437197830, 6);
INSERT INTO `sys_user_role` VALUES (876708082437197834, 876708082437197834, 7);
INSERT INTO `sys_user_role` VALUES (876708082437197842, 876708082437197840, 7);
INSERT INTO `sys_user_role` VALUES (876708082437197844, 876708082437197841, 7);
INSERT INTO `sys_user_role` VALUES (876708082437197846, 876708082437197844, 7);
INSERT INTO `sys_user_role` VALUES (876708082437197847, 876708082437197845, 7);
INSERT INTO `sys_user_role` VALUES (876708082437197852, 876708082437197849, 7);
INSERT INTO `sys_user_role` VALUES (876708082437197859, 876708082437197854, 7);
INSERT INTO `sys_user_role` VALUES (876708082437197864, 876708082437197855, 7);
INSERT INTO `sys_user_role` VALUES (876708082437197865, 876708082437197856, 7);
INSERT INTO `sys_user_role` VALUES (876708082437197868, 876708082437197858, 7);
INSERT INTO `sys_user_role` VALUES (876708082437197869, 876708082437197859, 7);
INSERT INTO `sys_user_role` VALUES (876708082437197880, 876708082437197866, 7);
INSERT INTO `sys_user_role` VALUES (876708082437197881, 876708082437197869, 7);
INSERT INTO `sys_user_role` VALUES (876708082437197882, 876708082437197870, 7);
INSERT INTO `sys_user_role` VALUES (876708082437197885, 876708082437197872, 7);
INSERT INTO `sys_user_role` VALUES (876708082437197886, 876708082437197873, 7);
INSERT INTO `sys_user_role` VALUES (876708082437197887, 876708082437197882, 7);
INSERT INTO `sys_user_role` VALUES (876708082437197893, 876708082437197890, 7);
INSERT INTO `sys_user_role` VALUES (876708082437197894, 876708082437197891, 7);
INSERT INTO `sys_user_role` VALUES (876708082437197902, 876708082437197911, 7);
INSERT INTO `sys_user_role` VALUES (876708082437197903, 876708082437197912, 7);
INSERT INTO `sys_user_role` VALUES (876708082437197839, 876708082437197833, 8);
INSERT INTO `sys_user_role` VALUES (876708082437197840, 876708082437197835, 8);
INSERT INTO `sys_user_role` VALUES (876708082437197843, 876708082437197838, 8);
INSERT INTO `sys_user_role` VALUES (876708082437197849, 876708082437197846, 8);
INSERT INTO `sys_user_role` VALUES (876708082437197867, 876708082437197857, 8);
INSERT INTO `sys_user_role` VALUES (876708082437197875, 876708082437197863, 8);
INSERT INTO `sys_user_role` VALUES (876708082437197884, 876708082437197871, 8);
INSERT INTO `sys_user_role` VALUES (876708082437197889, 876708082437197885, 8);
INSERT INTO `sys_user_role` VALUES (876708082437197892, 876708082437197889, 8);
INSERT INTO `sys_user_role` VALUES (876708082437197901, 876708082437197909, 8);
INSERT INTO `sys_user_role` VALUES (876708082437197841, 876708082437197839, 9);
INSERT INTO `sys_user_role` VALUES (876708082437197845, 876708082437197842, 9);
INSERT INTO `sys_user_role` VALUES (876708082437197853, 876708082437197850, 9);
INSERT INTO `sys_user_role` VALUES (876708082437197870, 876708082437197860, 9);
INSERT INTO `sys_user_role` VALUES (876708082437197871, 876708082437197861, 9);
INSERT INTO `sys_user_role` VALUES (876708082437197876, 876708082437197864, 9);
INSERT INTO `sys_user_role` VALUES (876708082437197879, 876708082437197865, 9);
INSERT INTO `sys_user_role` VALUES (876708082437197890, 876708082437197888, 9);
INSERT INTO `sys_user_role` VALUES (876708082437197895, 876708082437197892, 9);
INSERT INTO `sys_user_role` VALUES (876708082437197896, 876708082437197893, 9);
INSERT INTO `sys_user_role` VALUES (876708082437197897, 876708082437197894, 9);
INSERT INTO `sys_user_role` VALUES (876708082437197898, 876708082437197895, 9);
INSERT INTO `sys_user_role` VALUES (876708082437197899, 876708082437197896, 9);
INSERT INTO `sys_user_role` VALUES (876708082437197906, 876708082437197918, 9);
INSERT INTO `sys_user_role` VALUES (876708082437197908, 876708082437197920, 9);
INSERT INTO `sys_user_role` VALUES (876708082437197909, 876708082437197921, 9);
INSERT INTO `sys_user_role` VALUES (876708082437197910, 876708082437197922, 9);
INSERT INTO `sys_user_role` VALUES (876708082437197911, 876708082437197923, 9);
INSERT INTO `sys_user_role` VALUES (876708082437197912, 876708082437197924, 9);
INSERT INTO `sys_user_role` VALUES (876708082437197913, 876708082437197925, 9);
INSERT INTO `sys_user_role` VALUES (876708082437197830, 876708082437197827, 876708082437197826);
INSERT INTO `sys_user_role` VALUES (876708082437197907, 876708082437197919, 876708082437197827);

-- ----------------------------
-- Table structure for t_config_field
-- ----------------------------
DROP TABLE IF EXISTS `t_config_field`;
CREATE TABLE `t_config_field`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `field` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '领域',
  `group_id` bigint(20) NOT NULL COMMENT '所属分组',
  `lang` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区分语言',
  `name` varchar(26) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配置名称',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '值',
  `data_type` varchar(26) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '值类型',
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '配置描述',
  `org_id` bigint(20) NOT NULL COMMENT '资源隔离字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `field`(`field`, `lang`, `org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_config_field
-- ----------------------------
INSERT INTO `t_config_field` VALUES (1, 'defaultImage', 4, 'zh', '基础图片', 'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1600766787&di=dc12b1588ebe5757206bc55122223ef7&src=http://a0.att.hudong.com/56/12/01300000164151121576126282411.jpg', 'STRING', '默认图片配置', 100000000000000010);
INSERT INTO `t_config_field` VALUES (2, 'defaultImage', 2, 'zh', '基础图片', 'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1600766787&di=dc12b1588ebe5757206bc55122223ef7&src=http://a0.att.hudong.com/56/12/01300000164151121576126282411.jpg', 'STRING', '默认图片配置', 100000000000000001);

-- ----------------------------
-- Table structure for t_config_field_group
-- ----------------------------
DROP TABLE IF EXISTS `t_config_field_group`;
CREATE TABLE `t_config_field_group`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '上级分组id',
  `lang` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区分语言',
  `name` varchar(26) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分组名称',
  `comment` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '分组描述',
  `sort` int(11) NULL DEFAULT NULL COMMENT '排序',
  `type` varchar(26) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '类型(区分不同分组)',
  `org_id` bigint(20) NOT NULL COMMENT '资源隔离字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `lang`(`lang`, `name`, `type`, `org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_config_field_group
-- ----------------------------
INSERT INTO `t_config_field_group` VALUES (1, NULL, 'zh', '数据字典', NULL, 1, 'OPTION', 100000000000000001);
INSERT INTO `t_config_field_group` VALUES (2, NULL, 'zh', '基础配置', NULL, 2, 'CONFIG', 100000000000000001);
INSERT INTO `t_config_field_group` VALUES (3, NULL, 'zh', '数据字典', NULL, 1, 'OPTION', 100000000000000010);
INSERT INTO `t_config_field_group` VALUES (4, NULL, 'zh', '基础配置', NULL, 2, 'CONFIG', 100000000000000010);

-- ----------------------------
-- Table structure for t_config_field_item
-- ----------------------------
DROP TABLE IF EXISTS `t_config_field_item`;
CREATE TABLE `t_config_field_item`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `field` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '领域',
  `lang` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '区分语言',
  `name` varchar(26) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '独立语言名称',
  `value` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '值',
  `org_id` bigint(20) NOT NULL COMMENT '资源隔离字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `lang`(`lang`, `name`, `org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_config_field_item
-- ----------------------------

-- ----------------------------
-- Table structure for t_config_global
-- ----------------------------
DROP TABLE IF EXISTS `t_config_global`;
CREATE TABLE `t_config_global`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `lang` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '选定的语言',
  `selected` smallint(6) NULL DEFAULT 0 COMMENT '选定的语言',
  `org_id` bigint(20) NOT NULL COMMENT '资源隔离字段',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `lang`(`lang`, `org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_config_global
-- ----------------------------
INSERT INTO `t_config_global` VALUES (1, 'zh', 1, 100000000000000010);
INSERT INTO `t_config_global` VALUES (2, 'en', 0, 100000000000000010);
INSERT INTO `t_config_global` VALUES (3, 'zh', 1, 100000000000000001);
INSERT INTO `t_config_global` VALUES (4, 'en', 0, 100000000000000001);

-- ----------------------------
-- Table structure for t_eav_attribute
-- ----------------------------
DROP TABLE IF EXISTS `t_eav_attribute`;
CREATE TABLE `t_eav_attribute`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `entity_id` bigint(20) NOT NULL COMMENT '实体类ID',
  `attribute_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '属性名称',
  `field_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段名',
  `field_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '类型',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `attribute_name`(`attribute_name`, `entity_id`) USING BTREE,
  INDEX `entity_id`(`entity_id`) USING BTREE,
  CONSTRAINT `t_eav_attribute_ibfk_1` FOREIGN KEY (`entity_id`) REFERENCES `t_eav_entity` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_eav_attribute
-- ----------------------------

-- ----------------------------
-- Table structure for t_eav_config
-- ----------------------------
DROP TABLE IF EXISTS `t_eav_config`;
CREATE TABLE `t_eav_config`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表单名',
  `config` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '表单配置',
  `origin_config` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '画布配置',
  `entity_id` bigint(20) NOT NULL COMMENT '实体类ID',
  `org_id` bigint(20) NOT NULL COMMENT '所属部门id',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `title`(`title`, `org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_eav_config
-- ----------------------------

-- ----------------------------
-- Table structure for t_eav_entity
-- ----------------------------
DROP TABLE IF EXISTS `t_eav_entity`;
CREATE TABLE `t_eav_entity`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `entity_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `org_id` bigint(20) NOT NULL COMMENT '所属部门id',
  `org_tag` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '隔离标识',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '实体名称',
  `note` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '实体描述',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `entity_name`(`entity_name`, `org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_eav_entity
-- ----------------------------

-- ----------------------------
-- Table structure for t_eav_value
-- ----------------------------
DROP TABLE IF EXISTS `t_eav_value`;
CREATE TABLE `t_eav_value`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `row_id` bigint(20) NOT NULL COMMENT '行数，确定同一个实体的所有属性的值的同一条记录',
  `attribute_id` bigint(20) NOT NULL,
  `attribute_value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '长字符串为 varchar(255)',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `row_id`(`row_id`, `attribute_id`) USING BTREE,
  INDEX `attribute_id`(`attribute_id`) USING BTREE,
  CONSTRAINT `t_eav_value_ibfk_1` FOREIGN KEY (`attribute_id`) REFERENCES `t_eav_attribute` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_eav_value
-- ----------------------------

-- ----------------------------
-- Table structure for t_industry
-- ----------------------------
DROP TABLE IF EXISTS `t_industry`;
CREATE TABLE `t_industry`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'X-门   L-大   M-中  S-小',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pid` int(11) NULL DEFAULT NULL,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1425 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_industry
-- ----------------------------
INSERT INTO `t_industry` VALUES (1, 'X', '农、林、牧、渔业', NULL, 'A');
INSERT INTO `t_industry` VALUES (2, 'L', '农业', 1, '1');
INSERT INTO `t_industry` VALUES (3, 'M', '谷物种植', 2, '11');
INSERT INTO `t_industry` VALUES (4, 'S', '稻谷种植', 3, '111');
INSERT INTO `t_industry` VALUES (5, 'S', '小麦种植', 3, '112');
INSERT INTO `t_industry` VALUES (6, 'S', '玉米种植', 3, '113');
INSERT INTO `t_industry` VALUES (7, 'S', '其他谷物种植', 3, '119');
INSERT INTO `t_industry` VALUES (8, 'M', '豆类、油料和薯类种植', 2, '12');
INSERT INTO `t_industry` VALUES (9, 'S', '豆类种植', 8, '121');
INSERT INTO `t_industry` VALUES (10, 'S', '油料种植', 8, '122');
INSERT INTO `t_industry` VALUES (11, 'S', '薯类种植', 8, '123');
INSERT INTO `t_industry` VALUES (12, 'M', '棉、麻、糖、烟草种植', 2, '13');
INSERT INTO `t_industry` VALUES (13, 'S', '棉花种植', 12, '131');
INSERT INTO `t_industry` VALUES (14, 'S', '麻类种植', 12, '132');
INSERT INTO `t_industry` VALUES (15, 'S', '糖料种植', 12, '133');
INSERT INTO `t_industry` VALUES (16, 'S', '烟草种植', 12, '134');
INSERT INTO `t_industry` VALUES (17, 'M', '蔬菜、食用菌及园艺作物种植', 2, '14');
INSERT INTO `t_industry` VALUES (18, 'S', '蔬菜种植', 17, '141');
INSERT INTO `t_industry` VALUES (19, 'S', '食用菌种植', 17, '142');
INSERT INTO `t_industry` VALUES (20, 'S', '花卉种植', 17, '143');
INSERT INTO `t_industry` VALUES (21, 'S', '其他园艺作物种植', 17, '149');
INSERT INTO `t_industry` VALUES (22, 'M', '水果种植', 2, '15');
INSERT INTO `t_industry` VALUES (23, 'S', '仁果类和核果类水果种植', 22, '151');
INSERT INTO `t_industry` VALUES (24, 'S', '葡萄种植', 22, '152');
INSERT INTO `t_industry` VALUES (25, 'S', '柑橘类种植', 22, '153');
INSERT INTO `t_industry` VALUES (26, 'S', '香蕉等亚热带水果种植', 22, '154');
INSERT INTO `t_industry` VALUES (27, 'S', '其他水果种植', 22, '159');
INSERT INTO `t_industry` VALUES (28, 'M', '坚果、含油果、香料和饮料作物种植', 2, '16');
INSERT INTO `t_industry` VALUES (29, 'S', '坚果种植', 28, '161');
INSERT INTO `t_industry` VALUES (30, 'S', '含油果种植', 28, '162');
INSERT INTO `t_industry` VALUES (31, 'S', '香料作物种植', 28, '163');
INSERT INTO `t_industry` VALUES (32, 'S', '茶及其他饮料作物种植', 28, '169');
INSERT INTO `t_industry` VALUES (33, 'M', '中药材种植', 2, '17');
INSERT INTO `t_industry` VALUES (34, 'M', '其他农业', 2, '19');
INSERT INTO `t_industry` VALUES (35, 'L', '林业', 1, '2');
INSERT INTO `t_industry` VALUES (36, 'M', '林木育种和育苗', 35, '21');
INSERT INTO `t_industry` VALUES (37, 'S', '林木育种', 36, '211');
INSERT INTO `t_industry` VALUES (38, 'S', '林木育苗', 36, '212');
INSERT INTO `t_industry` VALUES (39, 'M', '造林和更新', 35, '22');
INSERT INTO `t_industry` VALUES (40, 'M', '森林经营和管护', 35, '23');
INSERT INTO `t_industry` VALUES (41, 'M', '木材和竹材采运', 35, '24');
INSERT INTO `t_industry` VALUES (42, 'S', '木材采运', 41, '241');
INSERT INTO `t_industry` VALUES (43, 'S', '竹材采运', 41, '242');
INSERT INTO `t_industry` VALUES (44, 'M', '林产品采集', 35, '25');
INSERT INTO `t_industry` VALUES (45, 'S', '木竹材林产品采集', 44, '251');
INSERT INTO `t_industry` VALUES (46, 'S', '非木竹材林产品采集', 44, '252');
INSERT INTO `t_industry` VALUES (47, 'L', '畜牧业', 1, '3');
INSERT INTO `t_industry` VALUES (48, 'M', '牲畜饲养', 47, '31');
INSERT INTO `t_industry` VALUES (49, 'S', '牛的饲养', 48, '311');
INSERT INTO `t_industry` VALUES (50, 'S', '马的饲养', 48, '312');
INSERT INTO `t_industry` VALUES (51, 'S', '猪的饲养', 48, '313');
INSERT INTO `t_industry` VALUES (52, 'S', '羊的饲养', 48, '314');
INSERT INTO `t_industry` VALUES (53, 'S', '骆驼饲养', 48, '315');
INSERT INTO `t_industry` VALUES (54, 'S', '其他牲畜饲养', 48, '319');
INSERT INTO `t_industry` VALUES (55, 'M', '家禽饲养', 47, '32');
INSERT INTO `t_industry` VALUES (56, 'S', '鸡的饲养', 55, '321');
INSERT INTO `t_industry` VALUES (57, 'S', '鸭的饲养', 55, '322');
INSERT INTO `t_industry` VALUES (58, 'S', '鹅的饲养', 55, '323');
INSERT INTO `t_industry` VALUES (59, 'S', '其他家禽饲养', 55, '329');
INSERT INTO `t_industry` VALUES (60, 'M', '狩猎和捕捉动物', 47, '33');
INSERT INTO `t_industry` VALUES (61, 'M', '其他畜牧业', 47, '39');
INSERT INTO `t_industry` VALUES (62, 'L', '渔业', 1, '4');
INSERT INTO `t_industry` VALUES (63, 'M', '水产养殖', 62, '41');
INSERT INTO `t_industry` VALUES (64, 'S', '海水养殖', 63, '411');
INSERT INTO `t_industry` VALUES (65, 'S', '内陆养殖', 63, '412');
INSERT INTO `t_industry` VALUES (66, 'M', '水产捕捞', 62, '42');
INSERT INTO `t_industry` VALUES (67, 'S', '海水捕捞', 66, '421');
INSERT INTO `t_industry` VALUES (68, 'S', '内陆捕捞', 66, '422');
INSERT INTO `t_industry` VALUES (69, 'L', '农、林、牧、渔服务业', 1, '5');
INSERT INTO `t_industry` VALUES (70, 'M', '农业服务业', 69, '51');
INSERT INTO `t_industry` VALUES (71, 'S', '农业机械服务', 70, '511');
INSERT INTO `t_industry` VALUES (72, 'S', '灌溉服务', 70, '512');
INSERT INTO `t_industry` VALUES (73, 'S', '农产品初加工服务', 70, '513');
INSERT INTO `t_industry` VALUES (74, 'S', '其他农业服务', 70, '519');
INSERT INTO `t_industry` VALUES (75, 'M', '林业服务业', 69, '52');
INSERT INTO `t_industry` VALUES (76, 'S', '林业有害生物防治服务', 75, '521');
INSERT INTO `t_industry` VALUES (77, 'S', '森林防火服务', 75, '522');
INSERT INTO `t_industry` VALUES (78, 'S', '林产品初级加工服务', 75, '523');
INSERT INTO `t_industry` VALUES (79, 'S', '其他林业服务', 75, '529');
INSERT INTO `t_industry` VALUES (80, 'M', '畜牧服务业', 69, '53');
INSERT INTO `t_industry` VALUES (81, 'M', '渔业服务业', 69, '54');
INSERT INTO `t_industry` VALUES (82, 'X', '采矿业', NULL, 'B');
INSERT INTO `t_industry` VALUES (83, 'L', '煤炭开采和洗选业', 82, '6');
INSERT INTO `t_industry` VALUES (84, 'M', '烟煤和无烟煤开采洗选', 83, '61');
INSERT INTO `t_industry` VALUES (85, 'M', '褐煤开采洗选', 83, '62');
INSERT INTO `t_industry` VALUES (86, 'M', '其他煤炭采选', 83, '69');
INSERT INTO `t_industry` VALUES (87, 'L', '石油和天然气开采业', 82, '7');
INSERT INTO `t_industry` VALUES (88, 'M', '石油开采', 87, '71');
INSERT INTO `t_industry` VALUES (89, 'M', '天然气开采', 87, '72');
INSERT INTO `t_industry` VALUES (90, 'L', '黑色金属矿采选业', 82, '8');
INSERT INTO `t_industry` VALUES (91, 'M', '铁矿采选', 90, '81');
INSERT INTO `t_industry` VALUES (92, 'M', '锰矿、铬矿采选', 90, '82');
INSERT INTO `t_industry` VALUES (93, 'M', '其他黑色金属矿采选', 90, '89');
INSERT INTO `t_industry` VALUES (94, 'L', '有色金属矿采选业', 82, '9');
INSERT INTO `t_industry` VALUES (95, 'M', '常用有色金属矿采选', 94, '91');
INSERT INTO `t_industry` VALUES (96, 'S', '铜矿采选', 95, '911');
INSERT INTO `t_industry` VALUES (97, 'S', '铅锌矿采选', 95, '912');
INSERT INTO `t_industry` VALUES (98, 'S', '镍钴矿采选', 95, '913');
INSERT INTO `t_industry` VALUES (99, 'S', '锡矿采选', 95, '914');
INSERT INTO `t_industry` VALUES (100, 'S', '锑矿采选', 95, '915');
INSERT INTO `t_industry` VALUES (101, 'S', '铝矿采选', 95, '916');
INSERT INTO `t_industry` VALUES (102, 'S', '镁矿采选', 95, '917');
INSERT INTO `t_industry` VALUES (103, 'S', '其他常用有色金属矿采选', 95, '919');
INSERT INTO `t_industry` VALUES (104, 'M', '贵金属矿采选', 94, '92');
INSERT INTO `t_industry` VALUES (105, 'S', '金矿采选', 104, '921');
INSERT INTO `t_industry` VALUES (106, 'S', '银矿采选', 104, '922');
INSERT INTO `t_industry` VALUES (107, 'S', '其他贵金属矿采选', 104, '929');
INSERT INTO `t_industry` VALUES (108, 'M', '稀有稀土金属矿采选', 94, '93');
INSERT INTO `t_industry` VALUES (109, 'S', '钨钼矿采选', 108, '931');
INSERT INTO `t_industry` VALUES (110, 'S', '稀土金属矿采选', 108, '932');
INSERT INTO `t_industry` VALUES (111, 'S', '放射性金属矿采选', 108, '933');
INSERT INTO `t_industry` VALUES (112, 'S', '其他稀有金属矿采选', 108, '939');
INSERT INTO `t_industry` VALUES (113, 'L', '非金属矿采选业', 82, '10');
INSERT INTO `t_industry` VALUES (114, 'M', '土砂石开采', 113, '101');
INSERT INTO `t_industry` VALUES (115, 'S', '石灰石、石膏开采', 114, '1011');
INSERT INTO `t_industry` VALUES (116, 'S', '建筑装饰用石开采', 114, '1012');
INSERT INTO `t_industry` VALUES (117, 'S', '耐火土石开采', 114, '1013');
INSERT INTO `t_industry` VALUES (118, 'S', '粘土及其他土砂石开采', 114, '1019');
INSERT INTO `t_industry` VALUES (119, 'M', '化学矿开采', 113, '102');
INSERT INTO `t_industry` VALUES (120, 'M', '采盐', 113, '103');
INSERT INTO `t_industry` VALUES (121, 'M', '石棉及其他非金属矿采选', 113, '109');
INSERT INTO `t_industry` VALUES (122, 'S', '石棉、云母矿采选', 121, '1091');
INSERT INTO `t_industry` VALUES (123, 'S', '石墨、滑石采选', 121, '1092');
INSERT INTO `t_industry` VALUES (124, 'S', '宝石、玉石采选', 121, '1093');
INSERT INTO `t_industry` VALUES (125, 'S', '其他未列明非金属矿采选', 121, '1099');
INSERT INTO `t_industry` VALUES (126, 'L', '开采辅助活动', 82, '11');
INSERT INTO `t_industry` VALUES (127, 'M', '煤炭开采和洗选辅助活动', 126, '111');
INSERT INTO `t_industry` VALUES (128, 'M', '石油和天然气开采辅助活动', 126, '112');
INSERT INTO `t_industry` VALUES (129, 'M', '其他开采辅助活动', 126, '119');
INSERT INTO `t_industry` VALUES (130, 'L', '其他采矿业', 82, '12');
INSERT INTO `t_industry` VALUES (131, 'M', '其他采矿业', 130, '120');
INSERT INTO `t_industry` VALUES (132, 'X', '制造业', NULL, 'C');
INSERT INTO `t_industry` VALUES (133, 'L', '农副食品加工业', 132, '13');
INSERT INTO `t_industry` VALUES (134, 'M', '谷物磨制', 133, '131');
INSERT INTO `t_industry` VALUES (135, 'M', '饲料加工', 133, '132');
INSERT INTO `t_industry` VALUES (136, 'M', '植物油加工', 133, '133');
INSERT INTO `t_industry` VALUES (137, 'S', '食用植物油加工', 136, '1331');
INSERT INTO `t_industry` VALUES (138, 'S', '非食用植物油加工', 136, '1332');
INSERT INTO `t_industry` VALUES (139, 'M', '制糖业', 133, '134');
INSERT INTO `t_industry` VALUES (140, 'M', '屠宰及肉类加工', 133, '135');
INSERT INTO `t_industry` VALUES (141, 'S', '牲畜屠宰', 140, '1351');
INSERT INTO `t_industry` VALUES (142, 'S', '禽类屠宰', 140, '1352');
INSERT INTO `t_industry` VALUES (143, 'S', '肉制品及副产品加工', 140, '1353');
INSERT INTO `t_industry` VALUES (144, 'M', '水产品加工', 133, '136');
INSERT INTO `t_industry` VALUES (145, 'S', '水产品冷冻加工', 144, '1361');
INSERT INTO `t_industry` VALUES (146, 'S', '鱼糜制品及水产品干腌制加工', 144, '1362');
INSERT INTO `t_industry` VALUES (147, 'S', '水产饲料制造', 144, '1363');
INSERT INTO `t_industry` VALUES (148, 'S', '鱼油提取及制品制造', 144, '1364');
INSERT INTO `t_industry` VALUES (149, 'S', '其他水产品加工', 144, '1369');
INSERT INTO `t_industry` VALUES (150, 'M', '蔬菜、水果和坚果加工', 133, '137');
INSERT INTO `t_industry` VALUES (151, 'S', '蔬菜加工', 150, '1371');
INSERT INTO `t_industry` VALUES (152, 'S', '水果和坚果加工', 150, '1372');
INSERT INTO `t_industry` VALUES (153, 'M', '其他农副食品加工', 133, '139');
INSERT INTO `t_industry` VALUES (154, 'S', '淀粉及淀粉制品制造', 153, '1391');
INSERT INTO `t_industry` VALUES (155, 'S', '豆制品制造', 153, '1392');
INSERT INTO `t_industry` VALUES (156, 'S', '蛋品加工', 153, '1393');
INSERT INTO `t_industry` VALUES (157, 'S', '其他未列明农副食品加工', 153, '1399');
INSERT INTO `t_industry` VALUES (158, 'L', '食品制造业', 132, '14');
INSERT INTO `t_industry` VALUES (159, 'M', '焙烤食品制造', 158, '141');
INSERT INTO `t_industry` VALUES (160, 'S', '糕点、面包制造', 159, '1411');
INSERT INTO `t_industry` VALUES (161, 'S', '饼干及其他焙烤食品制造', 159, '1419');
INSERT INTO `t_industry` VALUES (162, 'M', '糖果、巧克力及蜜饯制造', 158, '142');
INSERT INTO `t_industry` VALUES (163, 'S', '糖果、巧克力制造', 162, '1421');
INSERT INTO `t_industry` VALUES (164, 'S', '蜜饯制作', 162, '1422');
INSERT INTO `t_industry` VALUES (165, 'M', '方便食品制造', 158, '143');
INSERT INTO `t_industry` VALUES (166, 'S', '米、面制品制造', 165, '1431');
INSERT INTO `t_industry` VALUES (167, 'S', '速冻食品制造', 165, '1432');
INSERT INTO `t_industry` VALUES (168, 'S', '方便面及其他方便食品制造', 165, '1439');
INSERT INTO `t_industry` VALUES (169, 'M', '乳制品制造', 158, '144');
INSERT INTO `t_industry` VALUES (170, 'M', '罐头食品制造', 158, '145');
INSERT INTO `t_industry` VALUES (171, 'S', '肉、禽类罐头制造', 170, '1451');
INSERT INTO `t_industry` VALUES (172, 'S', '水产品罐头制造', 170, '1452');
INSERT INTO `t_industry` VALUES (173, 'S', '蔬菜、水果罐头制造', 170, '1453');
INSERT INTO `t_industry` VALUES (174, 'S', '其他罐头食品制造', 170, '1459');
INSERT INTO `t_industry` VALUES (175, 'M', '调味品、发酵制品制造', 158, '146');
INSERT INTO `t_industry` VALUES (176, 'S', '味精制造', 175, '1461');
INSERT INTO `t_industry` VALUES (177, 'S', '酱油、食醋及类似制品制造', 175, '1462');
INSERT INTO `t_industry` VALUES (178, 'S', '其他调味品、发酵制品制造', 175, '1469');
INSERT INTO `t_industry` VALUES (179, 'M', '其他食品制造', 158, '149');
INSERT INTO `t_industry` VALUES (180, 'S', '营养食品制造', 179, '1491');
INSERT INTO `t_industry` VALUES (181, 'S', '保健食品制造', 179, '1492');
INSERT INTO `t_industry` VALUES (182, 'S', '冷冻饮品及食用冰制造', 179, '1493');
INSERT INTO `t_industry` VALUES (183, 'S', '盐加工', 179, '1494');
INSERT INTO `t_industry` VALUES (184, 'S', '食品及饲料添加剂制造', 179, '1495');
INSERT INTO `t_industry` VALUES (185, 'S', '其他未列明食品制造', 179, '1499');
INSERT INTO `t_industry` VALUES (186, 'L', '酒、饮料和精制茶制造业', 132, '15');
INSERT INTO `t_industry` VALUES (187, 'M', '酒的制造', 186, '151');
INSERT INTO `t_industry` VALUES (188, 'S', '酒精制造', 187, '1511');
INSERT INTO `t_industry` VALUES (189, 'S', '白酒制造', 187, '1512');
INSERT INTO `t_industry` VALUES (190, 'S', '啤酒制造', 187, '1513');
INSERT INTO `t_industry` VALUES (191, 'S', '黄酒制造', 187, '1514');
INSERT INTO `t_industry` VALUES (192, 'S', '葡萄酒制造', 187, '1515');
INSERT INTO `t_industry` VALUES (193, 'S', '其他酒制造', 187, '1519');
INSERT INTO `t_industry` VALUES (194, 'M', '饮料制造', 186, '152');
INSERT INTO `t_industry` VALUES (195, 'S', '碳酸饮料制造', 194, '1521');
INSERT INTO `t_industry` VALUES (196, 'S', '瓶（罐）装饮用水制造', 194, '1522');
INSERT INTO `t_industry` VALUES (197, 'S', '果菜汁及果菜汁饮料制造', 194, '1523');
INSERT INTO `t_industry` VALUES (198, 'S', '含乳饮料和植物蛋白饮料制造', 194, '1524');
INSERT INTO `t_industry` VALUES (199, 'S', '固体饮料制造', 194, '1525');
INSERT INTO `t_industry` VALUES (200, 'S', '茶饮料及其他饮料制造', 194, '1529');
INSERT INTO `t_industry` VALUES (201, 'M', '精制茶加工', 186, '153');
INSERT INTO `t_industry` VALUES (202, 'L', '烟草制品业', 132, '16');
INSERT INTO `t_industry` VALUES (203, 'M', '烟叶复烤', 202, '161');
INSERT INTO `t_industry` VALUES (204, 'M', '卷烟制造', 202, '162');
INSERT INTO `t_industry` VALUES (205, 'M', '其他烟草制品制造', 202, '169');
INSERT INTO `t_industry` VALUES (206, 'L', '纺织业', 132, '17');
INSERT INTO `t_industry` VALUES (207, 'M', '棉纺织及印染精加工', 206, '171');
INSERT INTO `t_industry` VALUES (208, 'S', '棉纺纱加工', 207, '1711');
INSERT INTO `t_industry` VALUES (209, 'S', '棉织造加工', 207, '1712');
INSERT INTO `t_industry` VALUES (210, 'S', '棉印染精加工', 207, '1713');
INSERT INTO `t_industry` VALUES (211, 'M', '毛纺织及染整精加工', 206, '172');
INSERT INTO `t_industry` VALUES (212, 'S', '毛条和毛纱线加工', 211, '1721');
INSERT INTO `t_industry` VALUES (213, 'S', '毛织造加工', 211, '1722');
INSERT INTO `t_industry` VALUES (214, 'S', '毛染整精加工', 211, '1723');
INSERT INTO `t_industry` VALUES (215, 'M', '麻纺织及染整精加工', 206, '173');
INSERT INTO `t_industry` VALUES (216, 'S', '麻纤维纺前加工和纺纱', 215, '1731');
INSERT INTO `t_industry` VALUES (217, 'S', '麻织造加工', 215, '1732');
INSERT INTO `t_industry` VALUES (218, 'S', '麻染整精加工', 215, '1733');
INSERT INTO `t_industry` VALUES (219, 'M', '丝绢纺织及印染精加工', 206, '174');
INSERT INTO `t_industry` VALUES (220, 'S', '缫丝加工', 219, '1741');
INSERT INTO `t_industry` VALUES (221, 'S', '绢纺和丝织加工', 219, '1742');
INSERT INTO `t_industry` VALUES (222, 'S', '丝印染精加工', 219, '1743');
INSERT INTO `t_industry` VALUES (223, 'M', '化纤织造及印染精加工', 206, '175');
INSERT INTO `t_industry` VALUES (224, 'S', '化纤织造加工', 223, '1751');
INSERT INTO `t_industry` VALUES (225, 'S', '化纤织物染整精加工', 223, '1752');
INSERT INTO `t_industry` VALUES (226, 'M', '针织或钩针编织物及其制品制造', 206, '176');
INSERT INTO `t_industry` VALUES (227, 'S', '针织或钩针编织物织造', 226, '1761');
INSERT INTO `t_industry` VALUES (228, 'S', '针织或钩针编织物印染精加工', 226, '1762');
INSERT INTO `t_industry` VALUES (229, 'S', '针织或钩针编织品制造', 226, '1763');
INSERT INTO `t_industry` VALUES (230, 'M', '家用纺织制成品制造', 206, '177');
INSERT INTO `t_industry` VALUES (231, 'S', '床上用品制造', 230, '1771');
INSERT INTO `t_industry` VALUES (232, 'S', '毛巾类制品制造', 230, '1772');
INSERT INTO `t_industry` VALUES (233, 'S', '窗帘、布艺类产品制造', 230, '1773');
INSERT INTO `t_industry` VALUES (234, 'S', '其他家用纺织制成品制造', 230, '1779');
INSERT INTO `t_industry` VALUES (235, 'M', '非家用纺织制成品制造', 206, '178');
INSERT INTO `t_industry` VALUES (236, 'S', '非织造布制造', 235, '1781');
INSERT INTO `t_industry` VALUES (237, 'S', '绳、索、缆制造', 235, '1782');
INSERT INTO `t_industry` VALUES (238, 'S', '纺织带和帘子布制造', 235, '1783');
INSERT INTO `t_industry` VALUES (239, 'S', '篷、帆布制造', 235, '1784');
INSERT INTO `t_industry` VALUES (240, 'S', '其他非家用纺织制成品制造', 235, '1789');
INSERT INTO `t_industry` VALUES (241, 'L', '纺织服装、服饰业', 132, '18');
INSERT INTO `t_industry` VALUES (242, 'M', '机织服装制造', 241, '181');
INSERT INTO `t_industry` VALUES (243, 'M', '针织或钩针编织服装制造', 241, '182');
INSERT INTO `t_industry` VALUES (244, 'M', '服饰制造', 241, '183');
INSERT INTO `t_industry` VALUES (245, 'L', '皮革、毛皮、羽毛及其制品和制鞋业', 132, '19');
INSERT INTO `t_industry` VALUES (246, 'M', '皮革鞣制加工', 245, '191');
INSERT INTO `t_industry` VALUES (247, 'M', '皮革制品制造', 245, '192');
INSERT INTO `t_industry` VALUES (248, 'S', '皮革服装制造', 247, '1921');
INSERT INTO `t_industry` VALUES (249, 'S', '皮箱、包（袋）制造', 247, '1922');
INSERT INTO `t_industry` VALUES (250, 'S', '皮手套及皮装饰制品制造', 247, '1923');
INSERT INTO `t_industry` VALUES (251, 'S', '其他皮革制品制造', 247, '1929');
INSERT INTO `t_industry` VALUES (252, 'M', '毛皮鞣制及制品加工', 245, '193');
INSERT INTO `t_industry` VALUES (253, 'S', '毛皮鞣制加工', 252, '1931');
INSERT INTO `t_industry` VALUES (254, 'S', '毛皮服装加工', 252, '1932');
INSERT INTO `t_industry` VALUES (255, 'S', '其他毛皮制品加工', 252, '1939');
INSERT INTO `t_industry` VALUES (256, 'M', '羽毛(绒)加工及制品制造', 245, '194');
INSERT INTO `t_industry` VALUES (257, 'S', '羽毛（绒）加工', 256, '1941');
INSERT INTO `t_industry` VALUES (258, 'S', '羽毛（绒）制品加工', 256, '1942');
INSERT INTO `t_industry` VALUES (259, 'M', '制鞋业', 245, '195');
INSERT INTO `t_industry` VALUES (260, 'S', '纺织面料鞋制造', 259, '1951');
INSERT INTO `t_industry` VALUES (261, 'S', '皮鞋制造', 259, '1952');
INSERT INTO `t_industry` VALUES (262, 'S', '塑料鞋制造', 259, '1953');
INSERT INTO `t_industry` VALUES (263, 'S', '橡胶鞋制造', 259, '1954');
INSERT INTO `t_industry` VALUES (264, 'S', '其他制鞋业', 259, '1959');
INSERT INTO `t_industry` VALUES (265, 'L', '木材加工和木、竹、藤、棕、草制品业', 132, '20');
INSERT INTO `t_industry` VALUES (266, 'M', '木材加工', 265, '201');
INSERT INTO `t_industry` VALUES (267, 'S', '锯材加工', 266, '2011');
INSERT INTO `t_industry` VALUES (268, 'S', '木片加工', 266, '2012');
INSERT INTO `t_industry` VALUES (269, 'S', '单板加工', 266, '2013');
INSERT INTO `t_industry` VALUES (270, 'S', '其他木材加工', 266, '2019');
INSERT INTO `t_industry` VALUES (271, 'M', '人造板制造', 265, '202');
INSERT INTO `t_industry` VALUES (272, 'S', '胶合板制造', 271, '2021');
INSERT INTO `t_industry` VALUES (273, 'S', '纤维板制造', 271, '2022');
INSERT INTO `t_industry` VALUES (274, 'S', '刨花板制造', 271, '2023');
INSERT INTO `t_industry` VALUES (275, 'S', '其他人造板制造', 271, '2029');
INSERT INTO `t_industry` VALUES (276, 'M', '木制品制造', 265, '203');
INSERT INTO `t_industry` VALUES (277, 'S', '建筑用木料及木材组件加工', 276, '2031');
INSERT INTO `t_industry` VALUES (278, 'S', '木门窗、楼梯制造', 276, '2032');
INSERT INTO `t_industry` VALUES (279, 'S', '地板制造', 276, '2033');
INSERT INTO `t_industry` VALUES (280, 'S', '木制容器制造', 276, '2034');
INSERT INTO `t_industry` VALUES (281, 'S', '软木制品及其他木制品制造', 276, '2039');
INSERT INTO `t_industry` VALUES (282, 'M', '竹、藤、棕、草等制品制造', 265, '204');
INSERT INTO `t_industry` VALUES (283, 'S', '竹制品制造', 282, '2041');
INSERT INTO `t_industry` VALUES (284, 'S', '藤制品制造', 282, '2042');
INSERT INTO `t_industry` VALUES (285, 'S', '棕制品制造', 282, '2043');
INSERT INTO `t_industry` VALUES (286, 'S', '草及其他制品制造', 282, '2049');
INSERT INTO `t_industry` VALUES (287, 'L', '家具制造业', 132, '21');
INSERT INTO `t_industry` VALUES (288, 'M', '木质家具制造', 287, '211');
INSERT INTO `t_industry` VALUES (289, 'M', '竹、藤家具制造', 287, '212');
INSERT INTO `t_industry` VALUES (290, 'M', '金属家具制造', 287, '213');
INSERT INTO `t_industry` VALUES (291, 'M', '塑料家具制造', 287, '214');
INSERT INTO `t_industry` VALUES (292, 'M', '其他家具制造', 287, '219');
INSERT INTO `t_industry` VALUES (293, 'L', '造纸和纸制品业', 132, '22');
INSERT INTO `t_industry` VALUES (294, 'M', '纸浆制造', 293, '221');
INSERT INTO `t_industry` VALUES (295, 'S', '木竹浆制造', 294, '2211');
INSERT INTO `t_industry` VALUES (296, 'S', '非木竹浆制造', 294, '2212');
INSERT INTO `t_industry` VALUES (297, 'M', '造纸', 293, '222');
INSERT INTO `t_industry` VALUES (298, 'S', '机制纸及纸板制造', 297, '2221');
INSERT INTO `t_industry` VALUES (299, 'S', '手工纸制造', 297, '2222');
INSERT INTO `t_industry` VALUES (300, 'S', '加工纸制造', 297, '2223');
INSERT INTO `t_industry` VALUES (301, 'M', '纸制品制造', 293, '223');
INSERT INTO `t_industry` VALUES (302, 'S', '纸和纸板容器制造', 301, '2231');
INSERT INTO `t_industry` VALUES (303, 'S', '其他纸制品制造', 301, '2239');
INSERT INTO `t_industry` VALUES (304, 'L', '印刷和记录媒介复制业', 132, '23');
INSERT INTO `t_industry` VALUES (305, 'M', '印刷', 304, '231');
INSERT INTO `t_industry` VALUES (306, 'S', '书、报刊印刷', 305, '2311');
INSERT INTO `t_industry` VALUES (307, 'S', '本册印制', 305, '2312');
INSERT INTO `t_industry` VALUES (308, 'S', '包装装潢及其他印刷', 305, '2319');
INSERT INTO `t_industry` VALUES (309, 'M', '装订及印刷相关服务', 304, '232');
INSERT INTO `t_industry` VALUES (310, 'M', '记录媒介复制', 304, '233');
INSERT INTO `t_industry` VALUES (311, 'L', '文教、工美、体育和娱乐用品制造业', 132, '24');
INSERT INTO `t_industry` VALUES (312, 'M', '文教办公用品制造', 311, '241');
INSERT INTO `t_industry` VALUES (313, 'S', '文具制造', 312, '2411');
INSERT INTO `t_industry` VALUES (314, 'S', '笔的制造', 312, '2412');
INSERT INTO `t_industry` VALUES (315, 'S', '教学用模型及教具制造', 312, '2413');
INSERT INTO `t_industry` VALUES (316, 'S', '墨水、墨汁制造', 312, '2414');
INSERT INTO `t_industry` VALUES (317, 'S', '其他文教办公用品制造', 312, '2419');
INSERT INTO `t_industry` VALUES (318, 'M', '乐器制造', 311, '242');
INSERT INTO `t_industry` VALUES (319, 'S', '中乐器制造', 318, '2421');
INSERT INTO `t_industry` VALUES (320, 'S', '西乐器制造', 318, '2422');
INSERT INTO `t_industry` VALUES (321, 'S', '电子乐器制造', 318, '2423');
INSERT INTO `t_industry` VALUES (322, 'S', '其他乐器及零件制造', 318, '2429');
INSERT INTO `t_industry` VALUES (323, 'M', '工艺美术品制造', 311, '243');
INSERT INTO `t_industry` VALUES (324, 'S', '雕塑工艺品制造', 323, '2431');
INSERT INTO `t_industry` VALUES (325, 'S', '金属工艺品制造', 323, '2432');
INSERT INTO `t_industry` VALUES (326, 'S', '漆器工艺品制造', 323, '2433');
INSERT INTO `t_industry` VALUES (327, 'S', '花画工艺品制造', 323, '2434');
INSERT INTO `t_industry` VALUES (328, 'S', '天然植物纤维编织工艺品制造', 323, '2435');
INSERT INTO `t_industry` VALUES (329, 'S', '抽纱刺绣工艺品制造', 323, '2436');
INSERT INTO `t_industry` VALUES (330, 'S', '地毯、挂毯制造', 323, '2437');
INSERT INTO `t_industry` VALUES (331, 'S', '珠宝首饰及有关物品制造', 323, '2438');
INSERT INTO `t_industry` VALUES (332, 'S', '其他工艺美术品制造', 323, '2439');
INSERT INTO `t_industry` VALUES (333, 'M', '体育用品制造', 311, '244');
INSERT INTO `t_industry` VALUES (334, 'S', '球类制造', 333, '2441');
INSERT INTO `t_industry` VALUES (335, 'S', '体育器材及配件制造', 333, '2442');
INSERT INTO `t_industry` VALUES (336, 'S', '训练健身器材制造', 333, '2443');
INSERT INTO `t_industry` VALUES (337, 'S', '运动防护用具制造', 333, '2444');
INSERT INTO `t_industry` VALUES (338, 'S', '其他体育用品制造', 333, '2449');
INSERT INTO `t_industry` VALUES (339, 'M', '玩具制造', 311, '245');
INSERT INTO `t_industry` VALUES (340, 'M', '游艺器材及娱乐用品制造', 311, '246');
INSERT INTO `t_industry` VALUES (341, 'S', '露天游乐场所游乐设备制造', 340, '2461');
INSERT INTO `t_industry` VALUES (342, 'S', '游艺用品及室内游艺器材制造', 340, '2462');
INSERT INTO `t_industry` VALUES (343, 'S', '其他娱乐用品制造', 340, '2469');
INSERT INTO `t_industry` VALUES (344, 'L', '石油加工、炼焦和核燃料加工业', 132, '25');
INSERT INTO `t_industry` VALUES (345, 'M', '精炼石油产品制造', 344, '251');
INSERT INTO `t_industry` VALUES (346, 'S', '原油加工及石油制品制造', 345, '2511');
INSERT INTO `t_industry` VALUES (347, 'S', '人造原油制造', 345, '2512');
INSERT INTO `t_industry` VALUES (348, 'M', '炼焦', 344, '252');
INSERT INTO `t_industry` VALUES (349, 'M', '核燃料加工', 344, '253');
INSERT INTO `t_industry` VALUES (350, 'L', '化学原料和化学制品制造业', 132, '26');
INSERT INTO `t_industry` VALUES (351, 'M', '基础化学原料制造', 350, '261');
INSERT INTO `t_industry` VALUES (352, 'S', '无机酸制造', 351, '2611');
INSERT INTO `t_industry` VALUES (353, 'S', '无机碱制造', 351, '2612');
INSERT INTO `t_industry` VALUES (354, 'S', '无机盐制造', 351, '2613');
INSERT INTO `t_industry` VALUES (355, 'S', '有机化学原料制造', 351, '2614');
INSERT INTO `t_industry` VALUES (356, 'S', '其他基础化学原料制造', 351, '2619');
INSERT INTO `t_industry` VALUES (357, 'M', '肥料制造', 350, '262');
INSERT INTO `t_industry` VALUES (358, 'S', '氮肥制造', 357, '2621');
INSERT INTO `t_industry` VALUES (359, 'S', '磷肥制造', 357, '2622');
INSERT INTO `t_industry` VALUES (360, 'S', '钾肥制造', 357, '2623');
INSERT INTO `t_industry` VALUES (361, 'S', '复混肥料制造', 357, '2624');
INSERT INTO `t_industry` VALUES (362, 'S', '有机肥料及微生物肥料制造', 357, '2625');
INSERT INTO `t_industry` VALUES (363, 'S', '其他肥料制造', 357, '2629');
INSERT INTO `t_industry` VALUES (364, 'M', '农药制造', 350, '263');
INSERT INTO `t_industry` VALUES (365, 'S', '化学农药制造', 364, '2631');
INSERT INTO `t_industry` VALUES (366, 'S', '生物化学农药及微生物农药制造', 364, '2632');
INSERT INTO `t_industry` VALUES (367, 'M', '涂料、油墨、颜料及类似产品制造', 350, '264');
INSERT INTO `t_industry` VALUES (368, 'S', '涂料制造', 367, '2641');
INSERT INTO `t_industry` VALUES (369, 'S', '油墨及类似产品制造', 367, '2642');
INSERT INTO `t_industry` VALUES (370, 'S', '颜料制造', 367, '2643');
INSERT INTO `t_industry` VALUES (371, 'S', '染料制造', 367, '2644');
INSERT INTO `t_industry` VALUES (372, 'S', '密封用填料及类似品制造', 367, '2645');
INSERT INTO `t_industry` VALUES (373, 'M', '合成材料制造', 350, '265');
INSERT INTO `t_industry` VALUES (374, 'S', '初级形态塑料及合成树脂制造', 373, '2651');
INSERT INTO `t_industry` VALUES (375, 'S', '合成橡胶制造', 373, '2652');
INSERT INTO `t_industry` VALUES (376, 'S', '合成纤维单（聚合）体制造', 373, '2653');
INSERT INTO `t_industry` VALUES (377, 'S', '其他合成材料制造', 373, '2659');
INSERT INTO `t_industry` VALUES (378, 'M', '专用化学产品制造', 350, '266');
INSERT INTO `t_industry` VALUES (379, 'S', '化学试剂和助剂制造', 378, '2661');
INSERT INTO `t_industry` VALUES (380, 'S', '专项化学用品制造', 378, '2662');
INSERT INTO `t_industry` VALUES (381, 'S', '林产化学产品制造', 378, '2663');
INSERT INTO `t_industry` VALUES (382, 'S', '信息化学品制造', 378, '2664');
INSERT INTO `t_industry` VALUES (383, 'S', '环境污染处理专用药剂材料制造', 378, '2665');
INSERT INTO `t_industry` VALUES (384, 'S', '动物胶制造', 378, '2666');
INSERT INTO `t_industry` VALUES (385, 'S', '其他专用化学产品制造', 378, '2669');
INSERT INTO `t_industry` VALUES (386, 'M', '炸药、火工及焰火产品制造', 350, '267');
INSERT INTO `t_industry` VALUES (387, 'S', '炸药及火工产品制造', 386, '2671');
INSERT INTO `t_industry` VALUES (388, 'S', '焰火、鞭炮产品制造', 386, '2672');
INSERT INTO `t_industry` VALUES (389, 'M', '日用化学产品制造', 350, '268');
INSERT INTO `t_industry` VALUES (390, 'S', '肥皂及合成洗涤剂制造', 389, '2681');
INSERT INTO `t_industry` VALUES (391, 'S', '化妆品制造', 389, '2682');
INSERT INTO `t_industry` VALUES (392, 'S', '口腔清洁用品制造', 389, '2683');
INSERT INTO `t_industry` VALUES (393, 'S', '香料、香精制造', 389, '2684');
INSERT INTO `t_industry` VALUES (394, 'S', '其他日用化学产品制造', 389, '2689');
INSERT INTO `t_industry` VALUES (395, 'L', '医药制造业', 132, '27');
INSERT INTO `t_industry` VALUES (396, 'M', '化学药品原料药制造', 395, '271');
INSERT INTO `t_industry` VALUES (397, 'M', '化学药品制剂制造', 395, '272');
INSERT INTO `t_industry` VALUES (398, 'M', '中药饮片加工', 395, '273');
INSERT INTO `t_industry` VALUES (399, 'M', '中成药生产', 395, '274');
INSERT INTO `t_industry` VALUES (400, 'M', '兽用药品制造', 395, '275');
INSERT INTO `t_industry` VALUES (401, 'M', '生物药品制造', 395, '276');
INSERT INTO `t_industry` VALUES (402, 'M', '卫生材料及医药用品制造', 395, '277');
INSERT INTO `t_industry` VALUES (403, 'L', '化学纤维制造业', 132, '28');
INSERT INTO `t_industry` VALUES (404, 'M', '纤维素纤维原料及纤维制造', 403, '281');
INSERT INTO `t_industry` VALUES (405, 'S', '化纤浆粕制造', 404, '2811');
INSERT INTO `t_industry` VALUES (406, 'S', '人造纤维（纤维素纤维）制造', 404, '2812');
INSERT INTO `t_industry` VALUES (407, 'M', '合成纤维制造', 403, '282');
INSERT INTO `t_industry` VALUES (408, 'S', '锦纶纤维制造', 407, '2821');
INSERT INTO `t_industry` VALUES (409, 'S', '涤纶纤维制造', 407, '2822');
INSERT INTO `t_industry` VALUES (410, 'S', '腈纶纤维制造', 407, '2823');
INSERT INTO `t_industry` VALUES (411, 'S', '维纶纤维制造', 407, '2824');
INSERT INTO `t_industry` VALUES (412, 'S', '丙纶纤维制造', 407, '2825');
INSERT INTO `t_industry` VALUES (413, 'S', '氨纶纤维制造', 407, '2826');
INSERT INTO `t_industry` VALUES (414, 'S', '其他合成纤维制造', 407, '2829');
INSERT INTO `t_industry` VALUES (415, 'L', '橡胶和塑料制品业', 132, '29');
INSERT INTO `t_industry` VALUES (416, 'M', '橡胶制品业', 415, '291');
INSERT INTO `t_industry` VALUES (417, 'S', '轮胎制造', 416, '2911');
INSERT INTO `t_industry` VALUES (418, 'S', '橡胶板、管、带制造', 416, '2912');
INSERT INTO `t_industry` VALUES (419, 'S', '橡胶零件制造', 416, '2913');
INSERT INTO `t_industry` VALUES (420, 'S', '再生橡胶制造', 416, '2914');
INSERT INTO `t_industry` VALUES (421, 'S', '日用及医用橡胶制品制造', 416, '2915');
INSERT INTO `t_industry` VALUES (422, 'S', '其他橡胶制品制造', 416, '2919');
INSERT INTO `t_industry` VALUES (423, 'M', '塑料制品业', 415, '292');
INSERT INTO `t_industry` VALUES (424, 'S', '塑料薄膜制造', 423, '2921');
INSERT INTO `t_industry` VALUES (425, 'S', '塑料板、管、型材制造', 423, '2922');
INSERT INTO `t_industry` VALUES (426, 'S', '塑料丝、绳及编织品制造', 423, '2923');
INSERT INTO `t_industry` VALUES (427, 'S', '泡沫塑料制造', 423, '2924');
INSERT INTO `t_industry` VALUES (428, 'S', '塑料人造革、合成革制造', 423, '2925');
INSERT INTO `t_industry` VALUES (429, 'S', '塑料包装箱及容器制造', 423, '2926');
INSERT INTO `t_industry` VALUES (430, 'S', '日用塑料制品制造', 423, '2927');
INSERT INTO `t_industry` VALUES (431, 'S', '塑料零件制造', 423, '2928');
INSERT INTO `t_industry` VALUES (432, 'S', '其他塑料制品制造', 423, '2929');
INSERT INTO `t_industry` VALUES (433, 'L', '非金属矿物制品业', 132, '30');
INSERT INTO `t_industry` VALUES (434, 'M', '水泥、石灰和石膏制造', 433, '301');
INSERT INTO `t_industry` VALUES (435, 'S', '水泥制造', 434, '3011');
INSERT INTO `t_industry` VALUES (436, 'S', '石灰和石膏制造', 434, '3012');
INSERT INTO `t_industry` VALUES (437, 'M', '石膏、水泥制品及类似制品制造', 433, '302');
INSERT INTO `t_industry` VALUES (438, 'S', '水泥制品制造', 437, '3021');
INSERT INTO `t_industry` VALUES (439, 'S', '砼结构构件制造', 437, '3022');
INSERT INTO `t_industry` VALUES (440, 'S', '石棉水泥制品制造', 437, '3023');
INSERT INTO `t_industry` VALUES (441, 'S', '轻质建筑材料制造', 437, '3024');
INSERT INTO `t_industry` VALUES (442, 'S', '其他水泥类似制品制造', 437, '3029');
INSERT INTO `t_industry` VALUES (443, 'M', '砖瓦、石材等建筑材料制造', 433, '303');
INSERT INTO `t_industry` VALUES (444, 'S', '粘土砖瓦及建筑砌块制造', 443, '3031');
INSERT INTO `t_industry` VALUES (445, 'S', '建筑陶瓷制品制造', 443, '3032');
INSERT INTO `t_industry` VALUES (446, 'S', '建筑用石加工', 443, '3033');
INSERT INTO `t_industry` VALUES (447, 'S', '防水建筑材料制造', 443, '3034');
INSERT INTO `t_industry` VALUES (448, 'S', '隔热和隔音材料制造', 443, '3035');
INSERT INTO `t_industry` VALUES (449, 'S', '其他建筑材料制造', 443, '3039');
INSERT INTO `t_industry` VALUES (450, 'M', '玻璃制造', 433, '304');
INSERT INTO `t_industry` VALUES (451, 'S', '平板玻璃制造', 450, '3041');
INSERT INTO `t_industry` VALUES (452, 'S', '其他玻璃制造', 450, '3049');
INSERT INTO `t_industry` VALUES (453, 'M', '玻璃制品制造', 433, '305');
INSERT INTO `t_industry` VALUES (454, 'S', '技术玻璃制品制造', 453, '3051');
INSERT INTO `t_industry` VALUES (455, 'S', '光学玻璃制造', 453, '3052');
INSERT INTO `t_industry` VALUES (456, 'S', '玻璃仪器制造', 453, '3053');
INSERT INTO `t_industry` VALUES (457, 'S', '日用玻璃制品制造', 453, '3054');
INSERT INTO `t_industry` VALUES (458, 'S', '玻璃包装容器制造', 453, '3055');
INSERT INTO `t_industry` VALUES (459, 'S', '玻璃保温容器制造', 453, '3056');
INSERT INTO `t_industry` VALUES (460, 'S', '制镜及类似品加工', 453, '3057');
INSERT INTO `t_industry` VALUES (461, 'S', '其他玻璃制品制造', 453, '3059');
INSERT INTO `t_industry` VALUES (462, 'M', '玻璃纤维和玻璃纤维增强塑料制品制造', 433, '306');
INSERT INTO `t_industry` VALUES (463, 'S', '玻璃纤维及制品制造', 462, '3061');
INSERT INTO `t_industry` VALUES (464, 'S', '玻璃纤维增强塑料制品制造', 462, '3062');
INSERT INTO `t_industry` VALUES (465, 'M', '陶瓷制品制造', 433, '307');
INSERT INTO `t_industry` VALUES (466, 'S', '卫生陶瓷制品制造', 465, '3071');
INSERT INTO `t_industry` VALUES (467, 'S', '特种陶瓷制品制造', 465, '3072');
INSERT INTO `t_industry` VALUES (468, 'S', '日用陶瓷制品制造', 465, '3073');
INSERT INTO `t_industry` VALUES (469, 'S', '园林、陈设艺术及其他陶瓷制品制造', 465, '3079');
INSERT INTO `t_industry` VALUES (470, 'M', '耐火材料制品制造', 433, '308');
INSERT INTO `t_industry` VALUES (471, 'S', '石棉制品制造', 470, '3081');
INSERT INTO `t_industry` VALUES (472, 'S', '云母制品制造', 470, '3082');
INSERT INTO `t_industry` VALUES (473, 'S', '耐火陶瓷制品及其他耐火材料制造', 470, '3089');
INSERT INTO `t_industry` VALUES (474, 'M', '石墨及其他非金属矿物制品制造', 433, '309');
INSERT INTO `t_industry` VALUES (475, 'S', '石墨及碳素制品制造', 474, '3091');
INSERT INTO `t_industry` VALUES (476, 'S', '其他非金属矿物制品制造', 474, '3099');
INSERT INTO `t_industry` VALUES (477, 'L', '黑色金属冶炼和压延加工业', 132, '31');
INSERT INTO `t_industry` VALUES (478, 'M', '炼铁', 477, '311');
INSERT INTO `t_industry` VALUES (479, 'M', '炼钢', 477, '312');
INSERT INTO `t_industry` VALUES (480, 'M', '黑色金属铸造', 477, '313');
INSERT INTO `t_industry` VALUES (481, 'M', '钢压延加工', 477, '314');
INSERT INTO `t_industry` VALUES (482, 'M', '铁合金冶炼', 477, '315');
INSERT INTO `t_industry` VALUES (483, 'L', '有色金属冶炼和压延加工业', 132, '32');
INSERT INTO `t_industry` VALUES (484, 'M', '常用有色金属冶炼', 483, '321');
INSERT INTO `t_industry` VALUES (485, 'S', '铜冶炼', 484, '3211');
INSERT INTO `t_industry` VALUES (486, 'S', '铅锌冶炼', 484, '3212');
INSERT INTO `t_industry` VALUES (487, 'S', '镍钴冶炼', 484, '3213');
INSERT INTO `t_industry` VALUES (488, 'S', '锡冶炼', 484, '3214');
INSERT INTO `t_industry` VALUES (489, 'S', '锑冶炼', 484, '3215');
INSERT INTO `t_industry` VALUES (490, 'S', '铝冶炼', 484, '3216');
INSERT INTO `t_industry` VALUES (491, 'S', '镁冶炼', 484, '3217');
INSERT INTO `t_industry` VALUES (492, 'S', '其他常用有色金属冶炼', 484, '3219');
INSERT INTO `t_industry` VALUES (493, 'M', '贵金属冶炼', 483, '322');
INSERT INTO `t_industry` VALUES (494, 'S', '金冶炼', 493, '3221');
INSERT INTO `t_industry` VALUES (495, 'S', '银冶炼', 493, '3222');
INSERT INTO `t_industry` VALUES (496, 'S', '其他贵金属冶炼', 493, '3229');
INSERT INTO `t_industry` VALUES (497, 'M', '稀有稀土金属冶炼', 483, '323');
INSERT INTO `t_industry` VALUES (498, 'S', '钨钼冶炼', 497, '3231');
INSERT INTO `t_industry` VALUES (499, 'S', '稀土金属冶炼', 497, '3232');
INSERT INTO `t_industry` VALUES (500, 'S', '其他稀有金属冶炼', 497, '3239');
INSERT INTO `t_industry` VALUES (501, 'M', '有色金属合金制造', 483, '324');
INSERT INTO `t_industry` VALUES (502, 'M', '有色金属铸造', 483, '325');
INSERT INTO `t_industry` VALUES (503, 'M', '有色金属压延加工', 483, '326');
INSERT INTO `t_industry` VALUES (504, 'S', '铜压延加工', 503, '3261');
INSERT INTO `t_industry` VALUES (505, 'S', '铝压延加工', 503, '3262');
INSERT INTO `t_industry` VALUES (506, 'S', '贵金属压延加工', 503, '3263');
INSERT INTO `t_industry` VALUES (507, 'S', '稀有稀土金属压延加工', 503, '3264');
INSERT INTO `t_industry` VALUES (508, 'S', '其他有色金属压延加工', 503, '3269');
INSERT INTO `t_industry` VALUES (509, 'L', '金属制品业', 132, '33');
INSERT INTO `t_industry` VALUES (510, 'M', '结构性金属制品制造', 509, '331');
INSERT INTO `t_industry` VALUES (511, 'S', '金属结构制造', 510, '3311');
INSERT INTO `t_industry` VALUES (512, 'S', '金属门窗制造', 510, '3312');
INSERT INTO `t_industry` VALUES (513, 'M', '金属工具制造', 509, '332');
INSERT INTO `t_industry` VALUES (514, 'S', '切削工具制造', 513, '3321');
INSERT INTO `t_industry` VALUES (515, 'S', '手工具制造', 513, '3322');
INSERT INTO `t_industry` VALUES (516, 'S', '农用及园林用金属工具制造', 513, '3323');
INSERT INTO `t_industry` VALUES (517, 'S', '刀剪及类似日用金属工具制造', 513, '3324');
INSERT INTO `t_industry` VALUES (518, 'S', '其他金属工具制造', 513, '3329');
INSERT INTO `t_industry` VALUES (519, 'M', '集装箱及金属包装容器制造', 509, '333');
INSERT INTO `t_industry` VALUES (520, 'S', '集装箱制造', 519, '3331');
INSERT INTO `t_industry` VALUES (521, 'S', '金属压力容器制造', 519, '3332');
INSERT INTO `t_industry` VALUES (522, 'S', '金属包装容器制造', 519, '3333');
INSERT INTO `t_industry` VALUES (523, 'M', '金属丝绳及其制品制造', 509, '334');
INSERT INTO `t_industry` VALUES (524, 'M', '建筑、安全用金属制品制造', 509, '335');
INSERT INTO `t_industry` VALUES (525, 'S', '建筑、家具用金属配件制造', 524, '3351');
INSERT INTO `t_industry` VALUES (526, 'S', '建筑装饰及水暖管道零件制造', 524, '3352');
INSERT INTO `t_industry` VALUES (527, 'S', '安全、消防用金属制品制造', 524, '3353');
INSERT INTO `t_industry` VALUES (528, 'S', '其他建筑、安全用金属制品制造', 524, '3359');
INSERT INTO `t_industry` VALUES (529, 'M', '金属表面处理及热处理加工', 509, '336');
INSERT INTO `t_industry` VALUES (530, 'M', '搪瓷制品制造', 509, '337');
INSERT INTO `t_industry` VALUES (531, 'S', '生产专用搪瓷制品制造', 530, '3371');
INSERT INTO `t_industry` VALUES (532, 'S', '建筑装饰搪瓷制品制造', 530, '3372');
INSERT INTO `t_industry` VALUES (533, 'S', '搪瓷卫生洁具制造', 530, '3373');
INSERT INTO `t_industry` VALUES (534, 'S', '搪瓷日用品及其他搪瓷制品制造', 530, '3379');
INSERT INTO `t_industry` VALUES (535, 'M', '金属制日用品制造', 509, '338');
INSERT INTO `t_industry` VALUES (536, 'S', '金属制厨房用器具制造', 535, '3381');
INSERT INTO `t_industry` VALUES (537, 'S', '金属制餐具和器皿制造', 535, '3382');
INSERT INTO `t_industry` VALUES (538, 'S', '金属制卫生器具制造', 535, '3383');
INSERT INTO `t_industry` VALUES (539, 'S', '其他金属制日用品制造', 535, '3389');
INSERT INTO `t_industry` VALUES (540, 'M', '其他金属制品制造', 509, '339');
INSERT INTO `t_industry` VALUES (541, 'S', '锻件及粉末冶金制品制造', 540, '3391');
INSERT INTO `t_industry` VALUES (542, 'S', '交通及公共管理用金属标牌制造', 540, '3392');
INSERT INTO `t_industry` VALUES (543, 'S', '其他未列明金属制品制造', 540, '3399');
INSERT INTO `t_industry` VALUES (544, 'L', '通用设备制造业', 132, '34');
INSERT INTO `t_industry` VALUES (545, 'M', '锅炉及原动设备制造', 544, '341');
INSERT INTO `t_industry` VALUES (546, 'S', '锅炉及辅助设备制造', 545, '3411');
INSERT INTO `t_industry` VALUES (547, 'S', '内燃机及配件制造', 545, '3412');
INSERT INTO `t_industry` VALUES (548, 'S', '汽轮机及辅机制造', 545, '3413');
INSERT INTO `t_industry` VALUES (549, 'S', '水轮机及辅机制造', 545, '3414');
INSERT INTO `t_industry` VALUES (550, 'S', '风能原动设备制造', 545, '3415');
INSERT INTO `t_industry` VALUES (551, 'S', '其他原动设备制造', 545, '3419');
INSERT INTO `t_industry` VALUES (552, 'M', '金属加工机械制造', 544, '342');
INSERT INTO `t_industry` VALUES (553, 'S', '金属切削机床制造', 552, '3421');
INSERT INTO `t_industry` VALUES (554, 'S', '金属成形机床制造', 552, '3422');
INSERT INTO `t_industry` VALUES (555, 'S', '铸造机械制造', 552, '3423');
INSERT INTO `t_industry` VALUES (556, 'S', '金属切割及焊接设备制造', 552, '3424');
INSERT INTO `t_industry` VALUES (557, 'S', '机床附件制造', 552, '3425');
INSERT INTO `t_industry` VALUES (558, 'S', '其他金属加工机械制造', 552, '3429');
INSERT INTO `t_industry` VALUES (559, 'M', '物料搬运设备制造', 544, '343');
INSERT INTO `t_industry` VALUES (560, 'S', '轻小型起重设备制造', 559, '3431');
INSERT INTO `t_industry` VALUES (561, 'S', '起重机制造', 559, '3432');
INSERT INTO `t_industry` VALUES (562, 'S', '生产专用车辆制造', 559, '3433');
INSERT INTO `t_industry` VALUES (563, 'S', '连续搬运设备制造', 559, '3434');
INSERT INTO `t_industry` VALUES (564, 'S', '电梯、自动扶梯及升降机制造', 559, '3435');
INSERT INTO `t_industry` VALUES (565, 'S', '其他物料搬运设备制造', 559, '3439');
INSERT INTO `t_industry` VALUES (566, 'M', '泵、阀门、压缩机及类似机械制造', 544, '344');
INSERT INTO `t_industry` VALUES (567, 'S', '泵及真空设备制造', 566, '3441');
INSERT INTO `t_industry` VALUES (568, 'S', '气体压缩机械制造', 566, '3442');
INSERT INTO `t_industry` VALUES (569, 'S', '阀门和旋塞制造', 566, '3443');
INSERT INTO `t_industry` VALUES (570, 'S', '液压和气压动力机械及元件制造', 566, '3444');
INSERT INTO `t_industry` VALUES (571, 'M', '轴承、齿轮和传动部件制造', 544, '345');
INSERT INTO `t_industry` VALUES (572, 'S', '轴承制造', 571, '3451');
INSERT INTO `t_industry` VALUES (573, 'S', '齿轮及齿轮减、变速箱制造', 571, '3452');
INSERT INTO `t_industry` VALUES (574, 'S', '其他传动部件制造', 571, '3459');
INSERT INTO `t_industry` VALUES (575, 'M', '烘炉、风机、衡器、包装等设备制造', 544, '346');
INSERT INTO `t_industry` VALUES (576, 'S', '烘炉、熔炉及电炉制造', 575, '3461');
INSERT INTO `t_industry` VALUES (577, 'S', '风机、风扇制造', 575, '3462');
INSERT INTO `t_industry` VALUES (578, 'S', '气体、液体分离及纯净设备制造', 575, '3463');
INSERT INTO `t_industry` VALUES (579, 'S', '制冷、空调设备制造', 575, '3464');
INSERT INTO `t_industry` VALUES (580, 'S', '风动和电动工具制造', 575, '3465');
INSERT INTO `t_industry` VALUES (581, 'S', '喷枪及类似器具制造', 575, '3466');
INSERT INTO `t_industry` VALUES (582, 'S', '衡器制造', 575, '3467');
INSERT INTO `t_industry` VALUES (583, 'S', '包装专用设备制造', 575, '3468');
INSERT INTO `t_industry` VALUES (584, 'M', '文化、办公用机械制造', 544, '347');
INSERT INTO `t_industry` VALUES (585, 'S', '电影机械制造', 584, '3471');
INSERT INTO `t_industry` VALUES (586, 'S', '幻灯及投影设备制造', 584, '3472');
INSERT INTO `t_industry` VALUES (587, 'S', '照相机及器材制造', 584, '3473');
INSERT INTO `t_industry` VALUES (588, 'S', '复印和胶印设备制造', 584, '3474');
INSERT INTO `t_industry` VALUES (589, 'S', '计算器及货币专用设备制造', 584, '3475');
INSERT INTO `t_industry` VALUES (590, 'S', '其他文化、办公用机械制造', 584, '3479');
INSERT INTO `t_industry` VALUES (591, 'M', '通用零部件制造', 544, '348');
INSERT INTO `t_industry` VALUES (592, 'S', '金属密封件制造', 591, '3481');
INSERT INTO `t_industry` VALUES (593, 'S', '紧固件制造', 591, '3482');
INSERT INTO `t_industry` VALUES (594, 'S', '弹簧制造', 591, '3483');
INSERT INTO `t_industry` VALUES (595, 'S', '机械零部件加工', 591, '3484');
INSERT INTO `t_industry` VALUES (596, 'S', '其他通用零部件制造', 591, '3489');
INSERT INTO `t_industry` VALUES (597, 'M', '其他通用设备制造业', 544, '349');
INSERT INTO `t_industry` VALUES (598, 'L', '专用设备制造业', 132, '35');
INSERT INTO `t_industry` VALUES (599, 'M', '采矿、冶金、建筑专用设备制造', 598, '351');
INSERT INTO `t_industry` VALUES (600, 'S', '矿山机械制造', 599, '3511');
INSERT INTO `t_industry` VALUES (601, 'S', '石油钻采专用设备制造', 599, '3512');
INSERT INTO `t_industry` VALUES (602, 'S', '建筑工程用机械制造', 599, '3513');
INSERT INTO `t_industry` VALUES (603, 'S', '海洋工程专用设备制造', 599, '3514');
INSERT INTO `t_industry` VALUES (604, 'S', '建筑材料生产专用机械制造', 599, '3515');
INSERT INTO `t_industry` VALUES (605, 'S', '冶金专用设备制造', 599, '3516');
INSERT INTO `t_industry` VALUES (606, 'M', '化工、木材、非金属加工专用设备制造', 598, '352');
INSERT INTO `t_industry` VALUES (607, 'S', '炼油、化工生产专用设备制造', 606, '3521');
INSERT INTO `t_industry` VALUES (608, 'S', '橡胶加工专用设备制造', 606, '3522');
INSERT INTO `t_industry` VALUES (609, 'S', '塑料加工专用设备制造', 606, '3523');
INSERT INTO `t_industry` VALUES (610, 'S', '木材加工机械制造', 606, '3524');
INSERT INTO `t_industry` VALUES (611, 'S', '模具制造', 606, '3525');
INSERT INTO `t_industry` VALUES (612, 'S', '其他非金属加工专用设备制造', 606, '3529');
INSERT INTO `t_industry` VALUES (613, 'M', '食品、饮料、烟草及饲料生产专用设备制造', 598, '353');
INSERT INTO `t_industry` VALUES (614, 'S', '食品、酒、饮料及茶生产专用设备制造', 613, '3531');
INSERT INTO `t_industry` VALUES (615, 'S', '农副食品加工专用设备制造', 613, '3532');
INSERT INTO `t_industry` VALUES (616, 'S', '烟草生产专用设备制造', 613, '3533');
INSERT INTO `t_industry` VALUES (617, 'S', '饲料生产专用设备制造', 613, '3534');
INSERT INTO `t_industry` VALUES (618, 'M', '印刷、制药、日化及日用品生产专用设备制造', 598, '354');
INSERT INTO `t_industry` VALUES (619, 'S', '制浆和造纸专用设备制造', 618, '3541');
INSERT INTO `t_industry` VALUES (620, 'S', '印刷专用设备制造', 618, '3542');
INSERT INTO `t_industry` VALUES (621, 'S', '日用化工专用设备制造', 618, '3543');
INSERT INTO `t_industry` VALUES (622, 'S', '制药专用设备制造', 618, '3544');
INSERT INTO `t_industry` VALUES (623, 'S', '照明器具生产专用设备制造', 618, '3545');
INSERT INTO `t_industry` VALUES (624, 'S', '玻璃、陶瓷和搪瓷制品生产专用设备制造', 618, '3546');
INSERT INTO `t_industry` VALUES (625, 'S', '其他日用品生产专用设备制造', 618, '3549');
INSERT INTO `t_industry` VALUES (626, 'M', '纺织、服装和皮革加工专用设备制造', 598, '355');
INSERT INTO `t_industry` VALUES (627, 'S', '纺织专用设备制造', 626, '3551');
INSERT INTO `t_industry` VALUES (628, 'S', '皮革、毛皮及其制品加工专用设备制造', 626, '3552');
INSERT INTO `t_industry` VALUES (629, 'S', '缝制机械制造', 626, '3553');
INSERT INTO `t_industry` VALUES (630, 'S', '洗涤机械制造', 626, '3554');
INSERT INTO `t_industry` VALUES (631, 'M', '电子和电工机械专用设备制造', 598, '356');
INSERT INTO `t_industry` VALUES (632, 'S', '电工机械专用设备制造', 631, '3561');
INSERT INTO `t_industry` VALUES (633, 'S', '电子工业专用设备制造', 631, '3562');
INSERT INTO `t_industry` VALUES (634, 'M', '农、林、牧、渔专用机械制造', 598, '357');
INSERT INTO `t_industry` VALUES (635, 'S', '拖拉机制造', 634, '3571');
INSERT INTO `t_industry` VALUES (636, 'S', '机械化农业及园艺机具制造', 634, '3572');
INSERT INTO `t_industry` VALUES (637, 'S', '营林及木竹采伐机械制造', 634, '3573');
INSERT INTO `t_industry` VALUES (638, 'S', '畜牧机械制造', 634, '3574');
INSERT INTO `t_industry` VALUES (639, 'S', '渔业机械制造', 634, '3575');
INSERT INTO `t_industry` VALUES (640, 'S', '农林牧渔机械配件制造', 634, '3576');
INSERT INTO `t_industry` VALUES (641, 'S', '棉花加工机械制造', 634, '3577');
INSERT INTO `t_industry` VALUES (642, 'S', '其他农、林、牧、渔业机械制造', 634, '3579');
INSERT INTO `t_industry` VALUES (643, 'M', '医疗仪器设备及器械制造', 598, '358');
INSERT INTO `t_industry` VALUES (644, 'S', '医疗诊断、监护及治疗设备制造', 643, '3581');
INSERT INTO `t_industry` VALUES (645, 'S', '口腔科用设备及器具制造', 643, '3582');
INSERT INTO `t_industry` VALUES (646, 'S', '医疗实验室及医用消毒设备和器具制造', 643, '3583');
INSERT INTO `t_industry` VALUES (647, 'S', '医疗、外科及兽医用器械制造', 643, '3584');
INSERT INTO `t_industry` VALUES (648, 'S', '机械治疗及病房护理设备制造', 643, '3585');
INSERT INTO `t_industry` VALUES (649, 'S', '假肢、人工器官及植（介）入器械制造', 643, '3586');
INSERT INTO `t_industry` VALUES (650, 'S', '其他医疗设备及器械制造', 643, '3589');
INSERT INTO `t_industry` VALUES (651, 'M', '环保、社会公共服务及其他专用设备制造', 598, '359');
INSERT INTO `t_industry` VALUES (652, 'S', '环境保护专用设备制造', 651, '3591');
INSERT INTO `t_industry` VALUES (653, 'S', '地质勘查专用设备制造', 651, '3592');
INSERT INTO `t_industry` VALUES (654, 'S', '邮政专用机械及器材制造', 651, '3593');
INSERT INTO `t_industry` VALUES (655, 'S', '商业、饮食、服务专用设备制造', 651, '3594');
INSERT INTO `t_industry` VALUES (656, 'S', '社会公共安全设备及器材制造', 651, '3595');
INSERT INTO `t_industry` VALUES (657, 'S', '交通安全、管制及类似专用设备制造', 651, '3596');
INSERT INTO `t_industry` VALUES (658, 'S', '水资源专用机械制造', 651, '3597');
INSERT INTO `t_industry` VALUES (659, 'S', '其他专用设备制造', 651, '3599');
INSERT INTO `t_industry` VALUES (660, 'L', '汽车制造业', 132, '36');
INSERT INTO `t_industry` VALUES (661, 'M', '汽车整车制造', 660, '361');
INSERT INTO `t_industry` VALUES (662, 'M', '改装汽车制造', 660, '362');
INSERT INTO `t_industry` VALUES (663, 'M', '低速载货汽车制造', 660, '363');
INSERT INTO `t_industry` VALUES (664, 'M', '电车制造', 660, '364');
INSERT INTO `t_industry` VALUES (665, 'M', '汽车车身、挂车制造', 660, '365');
INSERT INTO `t_industry` VALUES (666, 'M', '汽车零部件及配件制造', 660, '366');
INSERT INTO `t_industry` VALUES (667, 'L', '铁路、船舶、航空航天和其他运输设备制造业', 132, '37');
INSERT INTO `t_industry` VALUES (668, 'M', '铁路运输设备制造', 667, '371');
INSERT INTO `t_industry` VALUES (669, 'S', '铁路机车车辆及动车组制造', 668, '3711');
INSERT INTO `t_industry` VALUES (670, 'S', '窄轨机车车辆制造', 668, '3712');
INSERT INTO `t_industry` VALUES (671, 'S', '铁路机车车辆配件制造', 668, '3713');
INSERT INTO `t_industry` VALUES (672, 'S', '铁路专用设备及器材、配件制造', 668, '3714');
INSERT INTO `t_industry` VALUES (673, 'S', '其他铁路运输设备制造', 668, '3719');
INSERT INTO `t_industry` VALUES (674, 'M', '城市轨道交通设备制造', 667, '372');
INSERT INTO `t_industry` VALUES (675, 'M', '船舶及相关装置制造', 667, '373');
INSERT INTO `t_industry` VALUES (676, 'S', '金属船舶制造', 675, '3731');
INSERT INTO `t_industry` VALUES (677, 'S', '非金属船舶制造', 675, '3732');
INSERT INTO `t_industry` VALUES (678, 'S', '娱乐船和运动船制造', 675, '3733');
INSERT INTO `t_industry` VALUES (679, 'S', '船用配套设备制造', 675, '3734');
INSERT INTO `t_industry` VALUES (680, 'S', '船舶改装与拆除', 675, '3735');
INSERT INTO `t_industry` VALUES (681, 'S', '航标器材及其他相关装置制造', 675, '3739');
INSERT INTO `t_industry` VALUES (682, 'M', '航空、航天器及设备制造', 667, '374');
INSERT INTO `t_industry` VALUES (683, 'S', '飞机制造', 682, '3741');
INSERT INTO `t_industry` VALUES (684, 'S', '航天器制造', 682, '3742');
INSERT INTO `t_industry` VALUES (685, 'S', '航空、航天相关设备制造', 682, '3743');
INSERT INTO `t_industry` VALUES (686, 'S', '其他航空航天器制造', 682, '3749');
INSERT INTO `t_industry` VALUES (687, 'M', '摩托车制造', 667, '375');
INSERT INTO `t_industry` VALUES (688, 'S', '摩托车整车制造', 687, '3751');
INSERT INTO `t_industry` VALUES (689, 'S', '摩托车零部件及配件制造', 687, '3752');
INSERT INTO `t_industry` VALUES (690, 'M', '自行车制造', 667, '376');
INSERT INTO `t_industry` VALUES (691, 'S', '脚踏自行车及残疾人座车制造', 690, '3761');
INSERT INTO `t_industry` VALUES (692, 'S', '助动自行车制造', 690, '3762');
INSERT INTO `t_industry` VALUES (693, 'M', '非公路休闲车及零配件制造', 667, '377');
INSERT INTO `t_industry` VALUES (694, 'M', '潜水救捞及其他未列明运输设备制造', 667, '379');
INSERT INTO `t_industry` VALUES (695, 'S', '潜水及水下救捞装备制造', 694, '3791');
INSERT INTO `t_industry` VALUES (696, 'S', '其他未列明运输设备制造', 694, '3799');
INSERT INTO `t_industry` VALUES (697, 'L', '电气机械和器材制造业', 132, '38');
INSERT INTO `t_industry` VALUES (698, 'M', '电机制造', 697, '381');
INSERT INTO `t_industry` VALUES (699, 'S', '发电机及发电机组制造', 698, '3811');
INSERT INTO `t_industry` VALUES (700, 'S', '电动机制造', 698, '3812');
INSERT INTO `t_industry` VALUES (701, 'S', '微电机及其他电机制造', 698, '3819');
INSERT INTO `t_industry` VALUES (702, 'M', '输配电及控制设备制造', 697, '382');
INSERT INTO `t_industry` VALUES (703, 'S', '变压器、整流器和电感器制造', 702, '3821');
INSERT INTO `t_industry` VALUES (704, 'S', '电容器及其配套设备制造', 702, '3822');
INSERT INTO `t_industry` VALUES (705, 'S', '配电开关控制设备制造', 702, '3823');
INSERT INTO `t_industry` VALUES (706, 'S', '电力电子元器件制造', 702, '3824');
INSERT INTO `t_industry` VALUES (707, 'S', '光伏设备及元器件制造', 702, '3825');
INSERT INTO `t_industry` VALUES (708, 'S', '其他输配电及控制设备制造', 702, '3829');
INSERT INTO `t_industry` VALUES (709, 'M', '电线、电缆、光缆及电工器材制造', 697, '383');
INSERT INTO `t_industry` VALUES (710, 'S', '电线、电缆制造', 709, '3831');
INSERT INTO `t_industry` VALUES (711, 'S', '光纤、光缆制造', 709, '3832');
INSERT INTO `t_industry` VALUES (712, 'S', '绝缘制品制造', 709, '3833');
INSERT INTO `t_industry` VALUES (713, 'S', '其他电工器材制造', 709, '3839');
INSERT INTO `t_industry` VALUES (714, 'M', '电池制造', 697, '384');
INSERT INTO `t_industry` VALUES (715, 'S', '锂离子电池制造', 714, '3841');
INSERT INTO `t_industry` VALUES (716, 'S', '镍氢电池制造', 714, '3842');
INSERT INTO `t_industry` VALUES (717, 'S', '其他电池制造', 714, '3849');
INSERT INTO `t_industry` VALUES (718, 'M', '家用电力器具制造', 697, '385');
INSERT INTO `t_industry` VALUES (719, 'S', '家用制冷电器具制造', 718, '3851');
INSERT INTO `t_industry` VALUES (720, 'S', '家用空气调节器制造', 718, '3852');
INSERT INTO `t_industry` VALUES (721, 'S', '家用通风电器具制造', 718, '3853');
INSERT INTO `t_industry` VALUES (722, 'S', '家用厨房电器具制造', 718, '3854');
INSERT INTO `t_industry` VALUES (723, 'S', '家用清洁卫生电器具制造', 718, '3855');
INSERT INTO `t_industry` VALUES (724, 'S', '家用美容、保健电器具制造', 718, '3856');
INSERT INTO `t_industry` VALUES (725, 'S', '家用电力器具专用配件制造', 718, '3857');
INSERT INTO `t_industry` VALUES (726, 'S', '其他家用电力器具制造', 718, '3859');
INSERT INTO `t_industry` VALUES (727, 'M', '非电力家用器具制造', 697, '386');
INSERT INTO `t_industry` VALUES (728, 'S', '燃气、太阳能及类似能源家用器具制造', 727, '3861');
INSERT INTO `t_industry` VALUES (729, 'S', '其他非电力家用器具制造', 727, '3869');
INSERT INTO `t_industry` VALUES (730, 'M', '照明器具制造', 697, '387');
INSERT INTO `t_industry` VALUES (731, 'S', '电光源制造', 730, '3871');
INSERT INTO `t_industry` VALUES (732, 'S', '照明灯具制造', 730, '3872');
INSERT INTO `t_industry` VALUES (733, 'S', '灯用电器附件及其他照明器具制造', 730, '3879');
INSERT INTO `t_industry` VALUES (734, 'M', '其他电气机械及器材制造', 697, '389');
INSERT INTO `t_industry` VALUES (735, 'S', '电气信号设备装置制造', 734, '3891');
INSERT INTO `t_industry` VALUES (736, 'S', '其他未列明电气机械及器材制造', 734, '3899');
INSERT INTO `t_industry` VALUES (737, 'L', '计算机、通信和其他电子设备制造业', 132, '39');
INSERT INTO `t_industry` VALUES (738, 'M', '计算机制造', 737, '391');
INSERT INTO `t_industry` VALUES (739, 'S', '计算机整机制造', 738, '3911');
INSERT INTO `t_industry` VALUES (740, 'S', '计算机零部件制造', 738, '3912');
INSERT INTO `t_industry` VALUES (741, 'S', '计算机外围设备制造', 738, '3913');
INSERT INTO `t_industry` VALUES (742, 'S', '其他计算机制造', 738, '3919');
INSERT INTO `t_industry` VALUES (743, 'M', '通信设备制造', 737, '392');
INSERT INTO `t_industry` VALUES (744, 'S', '通信系统设备制造', 743, '3921');
INSERT INTO `t_industry` VALUES (745, 'S', '通信终端设备制造', 743, '3922');
INSERT INTO `t_industry` VALUES (746, 'M', '广播电视设备制造', 737, '393');
INSERT INTO `t_industry` VALUES (747, 'S', '广播电视节目制作及发射设备制造', 746, '3931');
INSERT INTO `t_industry` VALUES (748, 'S', '广播电视接收设备及器材制造', 746, '3932');
INSERT INTO `t_industry` VALUES (749, 'S', '应用电视设备及其他广播电视设备制造', 746, '3939');
INSERT INTO `t_industry` VALUES (750, 'M', '雷达及配套设备制造', 737, '394');
INSERT INTO `t_industry` VALUES (751, 'M', '视听设备制造', 737, '395');
INSERT INTO `t_industry` VALUES (752, 'S', '电视机制造', 751, '3951');
INSERT INTO `t_industry` VALUES (753, 'S', '音响设备制造', 751, '3952');
INSERT INTO `t_industry` VALUES (754, 'S', '影视录放设备制造', 751, '3953');
INSERT INTO `t_industry` VALUES (755, 'M', '电子器件制造', 737, '396');
INSERT INTO `t_industry` VALUES (756, 'S', '电子真空器件制造', 755, '3961');
INSERT INTO `t_industry` VALUES (757, 'S', '半导体分立器件制造', 755, '3962');
INSERT INTO `t_industry` VALUES (758, 'S', '集成电路制造', 755, '3963');
INSERT INTO `t_industry` VALUES (759, 'S', '光电子器件及其他电子器件制造', 755, '3969');
INSERT INTO `t_industry` VALUES (760, 'M', '电子元件制造', 737, '397');
INSERT INTO `t_industry` VALUES (761, 'S', '电子元件及组件制造', 760, '3971');
INSERT INTO `t_industry` VALUES (762, 'S', '印制电路板制造', 760, '3972');
INSERT INTO `t_industry` VALUES (763, 'M', '其他电子设备制造', 737, '399');
INSERT INTO `t_industry` VALUES (764, 'L', '仪器仪表制造业', 132, '40');
INSERT INTO `t_industry` VALUES (765, 'M', '通用仪器仪表制造', 764, '401');
INSERT INTO `t_industry` VALUES (766, 'S', '工业自动控制系统装置制造', 765, '4011');
INSERT INTO `t_industry` VALUES (767, 'S', '电工仪器仪表制造', 765, '4012');
INSERT INTO `t_industry` VALUES (768, 'S', '绘图、计算及测量仪器制造', 765, '4013');
INSERT INTO `t_industry` VALUES (769, 'S', '实验分析仪器制造', 765, '4014');
INSERT INTO `t_industry` VALUES (770, 'S', '试验机制造', 765, '4015');
INSERT INTO `t_industry` VALUES (771, 'S', '供应用仪表及其他通用仪器制造', 765, '4019');
INSERT INTO `t_industry` VALUES (772, 'M', '专用仪器仪表制造', 764, '402');
INSERT INTO `t_industry` VALUES (773, 'S', '环境监测专用仪器仪表制造', 772, '4021');
INSERT INTO `t_industry` VALUES (774, 'S', '运输设备及生产用计数仪表制造', 772, '4022');
INSERT INTO `t_industry` VALUES (775, 'S', '导航、气象及海洋专用仪器制造', 772, '4023');
INSERT INTO `t_industry` VALUES (776, 'S', '农林牧渔专用仪器仪表制造', 772, '4024');
INSERT INTO `t_industry` VALUES (777, 'S', '地质勘探和地震专用仪器制造', 772, '4025');
INSERT INTO `t_industry` VALUES (778, 'S', '教学专用仪器制造', 772, '4026');
INSERT INTO `t_industry` VALUES (779, 'S', '核子及核辐射测量仪器制造', 772, '4027');
INSERT INTO `t_industry` VALUES (780, 'S', '电子测量仪器制造', 772, '4028');
INSERT INTO `t_industry` VALUES (781, 'S', '其他专用仪器制造', 772, '4029');
INSERT INTO `t_industry` VALUES (782, 'M', '钟表与计时仪器制造', 764, '403');
INSERT INTO `t_industry` VALUES (783, 'M', '光学仪器及眼镜制造', 764, '404');
INSERT INTO `t_industry` VALUES (784, 'S', '光学仪器制造', 783, '4041');
INSERT INTO `t_industry` VALUES (785, 'S', '眼镜制造', 783, '4042');
INSERT INTO `t_industry` VALUES (786, 'M', '其他仪器仪表制造业', 764, '409');
INSERT INTO `t_industry` VALUES (787, 'L', '其他制造业', 132, '41');
INSERT INTO `t_industry` VALUES (788, 'M', '日用杂品制造', 787, '411');
INSERT INTO `t_industry` VALUES (789, 'S', '鬃毛加工、制刷及清扫工具制造', 788, '4111');
INSERT INTO `t_industry` VALUES (790, 'S', '其他日用杂品制造', 788, '4119');
INSERT INTO `t_industry` VALUES (791, 'M', '煤制品制造', 787, '412');
INSERT INTO `t_industry` VALUES (792, 'M', '核辐射加工', 787, '413');
INSERT INTO `t_industry` VALUES (793, 'M', '其他未列明制造业', 787, '419');
INSERT INTO `t_industry` VALUES (794, 'L', '废弃资源综合利用业', 132, '42');
INSERT INTO `t_industry` VALUES (795, 'M', '金属废料和碎屑加工处理', 794, '421');
INSERT INTO `t_industry` VALUES (796, 'M', '非金属废料和碎屑加工处理', 794, '422');
INSERT INTO `t_industry` VALUES (797, 'L', '金属制品、机械和设备修理业', 132, '43');
INSERT INTO `t_industry` VALUES (798, 'M', '金属制品修理', 797, '431');
INSERT INTO `t_industry` VALUES (799, 'M', '通用设备修理', 797, '432');
INSERT INTO `t_industry` VALUES (800, 'M', '专用设备修理', 797, '433');
INSERT INTO `t_industry` VALUES (801, 'M', '铁路、船舶、航空航天等运输设备修理', 797, '434');
INSERT INTO `t_industry` VALUES (802, 'S', '铁路运输设备修理', 801, '4341');
INSERT INTO `t_industry` VALUES (803, 'S', '船舶修理', 801, '4342');
INSERT INTO `t_industry` VALUES (804, 'S', '航空航天器修理', 801, '4343');
INSERT INTO `t_industry` VALUES (805, 'S', '其他运输设备修理', 801, '4349');
INSERT INTO `t_industry` VALUES (806, 'M', '电气设备修理', 797, '435');
INSERT INTO `t_industry` VALUES (807, 'M', '仪器仪表修理', 797, '436');
INSERT INTO `t_industry` VALUES (808, 'M', '其他机械和设备修理业', 797, '439');
INSERT INTO `t_industry` VALUES (809, 'X', '电力、热力、燃气及水生产和供应业', NULL, 'D');
INSERT INTO `t_industry` VALUES (810, 'L', '电力、热力生产和供应业', 809, '44');
INSERT INTO `t_industry` VALUES (811, 'M', '电力生产', 810, '441');
INSERT INTO `t_industry` VALUES (812, 'S', '火力发电', 811, '4411');
INSERT INTO `t_industry` VALUES (813, 'S', '水力发电', 811, '4412');
INSERT INTO `t_industry` VALUES (814, 'S', '核力发电', 811, '4413');
INSERT INTO `t_industry` VALUES (815, 'S', '风力发电', 811, '4414');
INSERT INTO `t_industry` VALUES (816, 'S', '太阳能发电', 811, '4415');
INSERT INTO `t_industry` VALUES (817, 'S', '其他电力生产', 811, '4419');
INSERT INTO `t_industry` VALUES (818, 'M', '电力供应', 810, '442');
INSERT INTO `t_industry` VALUES (819, 'M', '热力生产和供应', 810, '443');
INSERT INTO `t_industry` VALUES (820, 'L', '燃气生产和供应业', 809, '45');
INSERT INTO `t_industry` VALUES (821, 'M', '燃气生产和供应业', 820, '450');
INSERT INTO `t_industry` VALUES (822, 'L', '水的生产和供应业', 809, '46');
INSERT INTO `t_industry` VALUES (823, 'M', '自来水生产和供应', 822, '461');
INSERT INTO `t_industry` VALUES (824, 'M', '污水处理及其再生利用', 822, '462');
INSERT INTO `t_industry` VALUES (825, 'M', '其他水的处理、利用与分配', 822, '469');
INSERT INTO `t_industry` VALUES (826, 'X', '建筑业', NULL, 'E');
INSERT INTO `t_industry` VALUES (827, 'L', '房屋建筑业', 826, '47');
INSERT INTO `t_industry` VALUES (828, 'M', '房屋建筑业', 827, '470');
INSERT INTO `t_industry` VALUES (829, 'L', '土木工程建筑业', 826, '48');
INSERT INTO `t_industry` VALUES (830, 'M', '铁路、道路、隧道和桥梁工程建筑', 829, '481');
INSERT INTO `t_industry` VALUES (831, 'S', '铁路工程建筑', 830, '4811');
INSERT INTO `t_industry` VALUES (832, 'S', '公路工程建筑', 830, '4812');
INSERT INTO `t_industry` VALUES (833, 'S', '市政道路工程建筑', 830, '4813');
INSERT INTO `t_industry` VALUES (834, 'S', '其他道路、隧道和桥梁工程建筑', 830, '4819');
INSERT INTO `t_industry` VALUES (835, 'M', '水利和内河港口工程建筑', 829, '482');
INSERT INTO `t_industry` VALUES (836, 'S', '水源及供水设施工程建筑', 835, '4821');
INSERT INTO `t_industry` VALUES (837, 'S', '河湖治理及防洪设施工程建筑', 835, '4822');
INSERT INTO `t_industry` VALUES (838, 'S', '港口及航运设施工程建筑', 835, '4823');
INSERT INTO `t_industry` VALUES (839, 'M', '海洋工程建筑', 829, '483');
INSERT INTO `t_industry` VALUES (840, 'M', '工矿工程建筑', 829, '484');
INSERT INTO `t_industry` VALUES (841, 'M', '架线和管道工程建筑', 829, '485');
INSERT INTO `t_industry` VALUES (842, 'S', '架线及设备工程建筑', 841, '4851');
INSERT INTO `t_industry` VALUES (843, 'S', '管道工程建筑', 841, '4852');
INSERT INTO `t_industry` VALUES (844, 'M', '其他土木工程建筑', 829, '489');
INSERT INTO `t_industry` VALUES (845, 'L', '建筑安装业', 826, '49');
INSERT INTO `t_industry` VALUES (846, 'M', '电气安装', 845, '491');
INSERT INTO `t_industry` VALUES (847, 'M', '管道和设备安装', 845, '492');
INSERT INTO `t_industry` VALUES (848, 'M', '其他建筑安装业', 845, '499');
INSERT INTO `t_industry` VALUES (849, 'L', '建筑装饰和其他建筑业', 826, '50');
INSERT INTO `t_industry` VALUES (850, 'M', '建筑装饰业', 849, '501');
INSERT INTO `t_industry` VALUES (851, 'M', '工程准备活动', 849, '502');
INSERT INTO `t_industry` VALUES (852, 'S', '建筑物拆除活动', 851, '5021');
INSERT INTO `t_industry` VALUES (853, 'S', '其他工程准备活动', 851, '5029');
INSERT INTO `t_industry` VALUES (854, 'M', '提供施工设备服务', 849, '503');
INSERT INTO `t_industry` VALUES (855, 'M', '其他未列明建筑业', 849, '509');
INSERT INTO `t_industry` VALUES (856, 'X', '批发和零售业', NULL, 'F');
INSERT INTO `t_industry` VALUES (857, 'L', '批发业', 856, '51');
INSERT INTO `t_industry` VALUES (858, 'M', '农、林、牧产品批发', 857, '511');
INSERT INTO `t_industry` VALUES (859, 'S', '谷物、豆及薯类批发', 858, '5111');
INSERT INTO `t_industry` VALUES (860, 'S', '种子批发', 858, '5112');
INSERT INTO `t_industry` VALUES (861, 'S', '饲料批发', 858, '5113');
INSERT INTO `t_industry` VALUES (862, 'S', '棉、麻批发', 858, '5114');
INSERT INTO `t_industry` VALUES (863, 'S', '林业产品批发', 858, '5115');
INSERT INTO `t_industry` VALUES (864, 'S', '牲畜批发', 858, '5116');
INSERT INTO `t_industry` VALUES (865, 'S', '其他农牧产品批发', 858, '5119');
INSERT INTO `t_industry` VALUES (866, 'M', '食品、饮料及烟草制品批发', 857, '512');
INSERT INTO `t_industry` VALUES (867, 'S', '米、面制品及食用油批发', 866, '5121');
INSERT INTO `t_industry` VALUES (868, 'S', '糕点、糖果及糖批发', 866, '5122');
INSERT INTO `t_industry` VALUES (869, 'S', '果品、蔬菜批发', 866, '5123');
INSERT INTO `t_industry` VALUES (870, 'S', '肉、禽、蛋、奶及水产品批发', 866, '5124');
INSERT INTO `t_industry` VALUES (871, 'S', '盐及调味品批发', 866, '5125');
INSERT INTO `t_industry` VALUES (872, 'S', '营养和保健品批发', 866, '5126');
INSERT INTO `t_industry` VALUES (873, 'S', '酒、饮料及茶叶批发', 866, '5127');
INSERT INTO `t_industry` VALUES (874, 'S', '烟草制品批发', 866, '5128');
INSERT INTO `t_industry` VALUES (875, 'S', '其他食品批发', 866, '5129');
INSERT INTO `t_industry` VALUES (876, 'M', '纺织、服装及家庭用品批发', 857, '513');
INSERT INTO `t_industry` VALUES (877, 'S', '纺织品、针织品及原料批发', 876, '5131');
INSERT INTO `t_industry` VALUES (878, 'S', '服装批发', 876, '5132');
INSERT INTO `t_industry` VALUES (879, 'S', '鞋帽批发', 876, '5133');
INSERT INTO `t_industry` VALUES (880, 'S', '化妆品及卫生用品批发', 876, '5134');
INSERT INTO `t_industry` VALUES (881, 'S', '厨房、卫生间用具及日用杂货批发', 876, '5135');
INSERT INTO `t_industry` VALUES (882, 'S', '灯具、装饰物品批发', 876, '5136');
INSERT INTO `t_industry` VALUES (883, 'S', '家用电器批发', 876, '5137');
INSERT INTO `t_industry` VALUES (884, 'S', '其他家庭用品批发', 876, '5139');
INSERT INTO `t_industry` VALUES (885, 'M', '文化、体育用品及器材批发', 857, '514');
INSERT INTO `t_industry` VALUES (886, 'S', '文具用品批发', 885, '5141');
INSERT INTO `t_industry` VALUES (887, 'S', '体育用品及器材批发', 885, '5142');
INSERT INTO `t_industry` VALUES (888, 'S', '图书批发', 885, '5143');
INSERT INTO `t_industry` VALUES (889, 'S', '报刊批发', 885, '5144');
INSERT INTO `t_industry` VALUES (890, 'S', '音像制品及电子出版物批发', 885, '5145');
INSERT INTO `t_industry` VALUES (891, 'S', '首饰、工艺品及收藏品批发', 885, '5146');
INSERT INTO `t_industry` VALUES (892, 'S', '其他文化用品批发', 885, '5149');
INSERT INTO `t_industry` VALUES (893, 'M', '医药及医疗器材批发', 857, '515');
INSERT INTO `t_industry` VALUES (894, 'S', '西药批发', 893, '5151');
INSERT INTO `t_industry` VALUES (895, 'S', '中药批发', 893, '5152');
INSERT INTO `t_industry` VALUES (896, 'S', '医疗用品及器材批发', 893, '5153');
INSERT INTO `t_industry` VALUES (897, 'M', '矿产品、建材及化工产品批发', 857, '516');
INSERT INTO `t_industry` VALUES (898, 'S', '煤炭及制品批发', 897, '5161');
INSERT INTO `t_industry` VALUES (899, 'S', '石油及制品批发', 897, '5162');
INSERT INTO `t_industry` VALUES (900, 'S', '非金属矿及制品批发', 897, '5163');
INSERT INTO `t_industry` VALUES (901, 'S', '金属及金属矿批发', 897, '5164');
INSERT INTO `t_industry` VALUES (902, 'S', '建材批发', 897, '5165');
INSERT INTO `t_industry` VALUES (903, 'S', '化肥批发', 897, '5166');
INSERT INTO `t_industry` VALUES (904, 'S', '农药批发', 897, '5167');
INSERT INTO `t_industry` VALUES (905, 'S', '农用薄膜批发', 897, '5168');
INSERT INTO `t_industry` VALUES (906, 'S', '其他化工产品批发', 897, '5169');
INSERT INTO `t_industry` VALUES (907, 'M', '机械设备、五金产品及电子产品批发', 857, '517');
INSERT INTO `t_industry` VALUES (908, 'S', '农业机械批发', 907, '5171');
INSERT INTO `t_industry` VALUES (909, 'S', '汽车批发', 907, '5172');
INSERT INTO `t_industry` VALUES (910, 'S', '汽车零配件批发', 907, '5173');
INSERT INTO `t_industry` VALUES (911, 'S', '摩托车及零配件批发', 907, '5174');
INSERT INTO `t_industry` VALUES (912, 'S', '五金产品批发', 907, '5175');
INSERT INTO `t_industry` VALUES (913, 'S', '电气设备批发', 907, '5176');
INSERT INTO `t_industry` VALUES (914, 'S', '计算机、软件及辅助设备批发', 907, '5177');
INSERT INTO `t_industry` VALUES (915, 'S', '通讯及广播电视设备批发', 907, '5178');
INSERT INTO `t_industry` VALUES (916, 'S', '其他机械设备及电子产品批发', 907, '5179');
INSERT INTO `t_industry` VALUES (917, 'M', '贸易经纪与代理', 857, '518');
INSERT INTO `t_industry` VALUES (918, 'S', '贸易代理', 917, '5181');
INSERT INTO `t_industry` VALUES (919, 'S', '拍卖', 917, '5182');
INSERT INTO `t_industry` VALUES (920, 'S', '其他贸易经纪与代理', 917, '5189');
INSERT INTO `t_industry` VALUES (921, 'M', '其他批发业', 857, '519');
INSERT INTO `t_industry` VALUES (922, 'S', '再生物资回收与批发', 921, '5191');
INSERT INTO `t_industry` VALUES (923, 'S', '其他未列明批发业', 921, '5199');
INSERT INTO `t_industry` VALUES (924, 'L', '零售业', 856, '52');
INSERT INTO `t_industry` VALUES (925, 'M', '综合零售', 924, '521');
INSERT INTO `t_industry` VALUES (926, 'S', '百货零售', 925, '5211');
INSERT INTO `t_industry` VALUES (927, 'S', '超级市场零售', 925, '5212');
INSERT INTO `t_industry` VALUES (928, 'S', '其他综合零售', 925, '5219');
INSERT INTO `t_industry` VALUES (929, 'M', '食品、饮料及烟草制品专门零售', 924, '522');
INSERT INTO `t_industry` VALUES (930, 'S', '粮油零售', 929, '5221');
INSERT INTO `t_industry` VALUES (931, 'S', '糕点、面包零售', 929, '5222');
INSERT INTO `t_industry` VALUES (932, 'S', '果品、蔬菜零售', 929, '5223');
INSERT INTO `t_industry` VALUES (933, 'S', '肉、禽、蛋、奶及水产品零售', 929, '5224');
INSERT INTO `t_industry` VALUES (934, 'S', '营养和保健品零售', 929, '5225');
INSERT INTO `t_industry` VALUES (935, 'S', '酒、饮料及茶叶零售', 929, '5226');
INSERT INTO `t_industry` VALUES (936, 'S', '烟草制品零售', 929, '5227');
INSERT INTO `t_industry` VALUES (937, 'S', '其他食品零售', 929, '5229');
INSERT INTO `t_industry` VALUES (938, 'M', '纺织、服装及日用品专门零售', 924, '523');
INSERT INTO `t_industry` VALUES (939, 'S', '纺织品及针织品零售', 938, '5231');
INSERT INTO `t_industry` VALUES (940, 'S', '服装零售', 938, '5232');
INSERT INTO `t_industry` VALUES (941, 'S', '鞋帽零售', 938, '5233');
INSERT INTO `t_industry` VALUES (942, 'S', '化妆品及卫生用品零售', 938, '5234');
INSERT INTO `t_industry` VALUES (943, 'S', '钟表、眼镜零售', 938, '5235');
INSERT INTO `t_industry` VALUES (944, 'S', '箱、包零售', 938, '5236');
INSERT INTO `t_industry` VALUES (945, 'S', '厨房用具及日用杂品零售', 938, '5237');
INSERT INTO `t_industry` VALUES (946, 'S', '自行车零售', 938, '5238');
INSERT INTO `t_industry` VALUES (947, 'S', '其他日用品零售', 938, '5239');
INSERT INTO `t_industry` VALUES (948, 'M', '文化、体育用品及器材专门零售', 924, '524');
INSERT INTO `t_industry` VALUES (949, 'S', '文具用品零售', 948, '5241');
INSERT INTO `t_industry` VALUES (950, 'S', '体育用品及器材零售', 948, '5242');
INSERT INTO `t_industry` VALUES (951, 'S', '图书、报刊零售', 948, '5243');
INSERT INTO `t_industry` VALUES (952, 'S', '音像制品及电子出版物零售', 948, '5244');
INSERT INTO `t_industry` VALUES (953, 'S', '珠宝首饰零售', 948, '5245');
INSERT INTO `t_industry` VALUES (954, 'S', '工艺美术品及收藏品零售', 948, '5246');
INSERT INTO `t_industry` VALUES (955, 'S', '乐器零售', 948, '5247');
INSERT INTO `t_industry` VALUES (956, 'S', '照相器材零售', 948, '5248');
INSERT INTO `t_industry` VALUES (957, 'S', '其他文化用品零售', 948, '5249');
INSERT INTO `t_industry` VALUES (958, 'M', '医药及医疗器材专门零售', 924, '525');
INSERT INTO `t_industry` VALUES (959, 'S', '药品零售', 958, '5251');
INSERT INTO `t_industry` VALUES (960, 'S', '医疗用品及器材零售', 958, '5252');
INSERT INTO `t_industry` VALUES (961, 'M', '汽车、摩托车、零配件和燃料及其他动力销售', 924, '526');
INSERT INTO `t_industry` VALUES (962, 'S', '汽车新车零售', 961, '5261');
INSERT INTO `t_industry` VALUES (963, 'S', '汽车旧车零售', 961, '5262');
INSERT INTO `t_industry` VALUES (964, 'S', '汽车零配件零售', 961, '5263');
INSERT INTO `t_industry` VALUES (965, 'S', '机动车燃料零售', 961, '5264');
INSERT INTO `t_industry` VALUES (966, 'M', '家用电器及电子产品专门零售', 924, '527');
INSERT INTO `t_industry` VALUES (967, 'S', '家用视听设备零售', 966, '5271');
INSERT INTO `t_industry` VALUES (968, 'S', '日用家电设备零售', 966, '5272');
INSERT INTO `t_industry` VALUES (969, 'S', '计算机、软件及辅助设备零售', 966, '5273');
INSERT INTO `t_industry` VALUES (970, 'S', '通信设备零售', 966, '5274');
INSERT INTO `t_industry` VALUES (971, 'S', '其他电子产品零售', 966, '5279');
INSERT INTO `t_industry` VALUES (972, 'M', '五金、家具及室内装饰材料专门零售', 924, '528');
INSERT INTO `t_industry` VALUES (973, 'S', '五金零售', 972, '5281');
INSERT INTO `t_industry` VALUES (974, 'S', '灯具零售', 972, '5282');
INSERT INTO `t_industry` VALUES (975, 'S', '家具零售', 972, '5283');
INSERT INTO `t_industry` VALUES (976, 'S', '涂料零售', 972, '5284');
INSERT INTO `t_industry` VALUES (977, 'S', '卫生洁具零售', 972, '5285');
INSERT INTO `t_industry` VALUES (978, 'S', '木质装饰材料零售', 972, '5286');
INSERT INTO `t_industry` VALUES (979, 'S', '陶瓷、石材装饰材料零售', 972, '5287');
INSERT INTO `t_industry` VALUES (980, 'S', '其他室内装饰材料零售', 972, '5289');
INSERT INTO `t_industry` VALUES (981, 'M', '货摊、无店铺及其他零售业', 924, '529');
INSERT INTO `t_industry` VALUES (982, 'S', '货摊食品零售', 981, '5291');
INSERT INTO `t_industry` VALUES (983, 'S', '货摊纺织、服装及鞋零售', 981, '5292');
INSERT INTO `t_industry` VALUES (984, 'S', '货摊日用品零售', 981, '5293');
INSERT INTO `t_industry` VALUES (985, 'S', '互联网零售', 981, '5294');
INSERT INTO `t_industry` VALUES (986, 'S', '邮购及电视、电话零售', 981, '5295');
INSERT INTO `t_industry` VALUES (987, 'S', '旧货零售', 981, '5296');
INSERT INTO `t_industry` VALUES (988, 'S', '生活用燃料零售', 981, '5297');
INSERT INTO `t_industry` VALUES (989, 'S', '其他未列明零售业', 981, '5299');
INSERT INTO `t_industry` VALUES (990, 'X', '交通运输、仓储和邮政业', NULL, 'G');
INSERT INTO `t_industry` VALUES (991, 'L', '铁路运输业', 990, '53');
INSERT INTO `t_industry` VALUES (992, 'M', '铁路旅客运输', 991, '531');
INSERT INTO `t_industry` VALUES (993, 'M', '铁路货物运输', 991, '532');
INSERT INTO `t_industry` VALUES (994, 'M', '铁路运输辅助活动', 991, '533');
INSERT INTO `t_industry` VALUES (995, 'S', '客运火车站', 994, '5331');
INSERT INTO `t_industry` VALUES (996, 'S', '货运火车站', 994, '5332');
INSERT INTO `t_industry` VALUES (997, 'S', '其他铁路运输辅助活动', 994, '5339');
INSERT INTO `t_industry` VALUES (998, 'L', '道路运输业', 990, '54');
INSERT INTO `t_industry` VALUES (999, 'M', '城市公共交通运输', 998, '541');
INSERT INTO `t_industry` VALUES (1000, 'S', '公共电汽车客运', 999, '5411');
INSERT INTO `t_industry` VALUES (1001, 'S', '城市轨道交通', 999, '5412');
INSERT INTO `t_industry` VALUES (1002, 'S', '出租车客运', 999, '5413');
INSERT INTO `t_industry` VALUES (1003, 'S', '其他城市公共交通运输', 999, '5419');
INSERT INTO `t_industry` VALUES (1004, 'M', '公路旅客运输', 998, '542');
INSERT INTO `t_industry` VALUES (1005, 'M', '道路货物运输', 998, '543');
INSERT INTO `t_industry` VALUES (1006, 'M', '道路运输辅助活动', 998, '544');
INSERT INTO `t_industry` VALUES (1007, 'S', '客运汽车站', 1006, '5441');
INSERT INTO `t_industry` VALUES (1008, 'S', '公路管理与养护', 1006, '5442');
INSERT INTO `t_industry` VALUES (1009, 'S', '其他道路运输辅助活动', 1006, '5449');
INSERT INTO `t_industry` VALUES (1010, 'L', '水上运输业', 990, '55');
INSERT INTO `t_industry` VALUES (1011, 'M', '水上旅客运输', 1010, '551');
INSERT INTO `t_industry` VALUES (1012, 'S', '海洋旅客运输', 1011, '5511');
INSERT INTO `t_industry` VALUES (1013, 'S', '内河旅客运输', 1011, '5512');
INSERT INTO `t_industry` VALUES (1014, 'S', '客运轮渡运输', 1011, '5513');
INSERT INTO `t_industry` VALUES (1015, 'M', '水上货物运输', 1010, '552');
INSERT INTO `t_industry` VALUES (1016, 'S', '远洋货物运输', 1015, '5521');
INSERT INTO `t_industry` VALUES (1017, 'S', '沿海货物运输', 1015, '5522');
INSERT INTO `t_industry` VALUES (1018, 'S', '内河货物运输', 1015, '5523');
INSERT INTO `t_industry` VALUES (1019, 'M', '水上运输辅助活动', 1010, '553');
INSERT INTO `t_industry` VALUES (1020, 'S', '客运港口', 1019, '5531');
INSERT INTO `t_industry` VALUES (1021, 'S', '货运港口', 1019, '5532');
INSERT INTO `t_industry` VALUES (1022, 'S', '其他水上运输辅助活动', 1019, '5539');
INSERT INTO `t_industry` VALUES (1023, 'L', '航空运输业', 990, '56');
INSERT INTO `t_industry` VALUES (1024, 'M', '航空客货运输', 1023, '561');
INSERT INTO `t_industry` VALUES (1025, 'S', '航空旅客运输', 1024, '5611');
INSERT INTO `t_industry` VALUES (1026, 'S', '航空货物运输', 1024, '5612');
INSERT INTO `t_industry` VALUES (1027, 'M', '通用航空服务', 1023, '562');
INSERT INTO `t_industry` VALUES (1028, 'M', '航空运输辅助活动', 1023, '563');
INSERT INTO `t_industry` VALUES (1029, 'S', '机场', 1028, '5631');
INSERT INTO `t_industry` VALUES (1030, 'S', '空中交通管理', 1028, '5632');
INSERT INTO `t_industry` VALUES (1031, 'S', '其他航空运输辅助活动', 1028, '5639');
INSERT INTO `t_industry` VALUES (1032, 'L', '管道运输业', 990, '57');
INSERT INTO `t_industry` VALUES (1033, 'M', '管道运输业', 1032, '570');
INSERT INTO `t_industry` VALUES (1034, 'L', '装卸搬运和运输代理业', 990, '58');
INSERT INTO `t_industry` VALUES (1035, 'M', '装卸搬运', 1034, '581');
INSERT INTO `t_industry` VALUES (1036, 'M', '运输代理业', 1034, '582');
INSERT INTO `t_industry` VALUES (1037, 'S', '货物运输代理', 1036, '5821');
INSERT INTO `t_industry` VALUES (1038, 'S', '旅客票务代理', 1036, '5822');
INSERT INTO `t_industry` VALUES (1039, 'S', '其他运输代理业', 1036, '5829');
INSERT INTO `t_industry` VALUES (1040, 'L', '仓储业', 990, '59');
INSERT INTO `t_industry` VALUES (1041, 'M', '谷物、棉花等农产品仓储', 1040, '591');
INSERT INTO `t_industry` VALUES (1042, 'S', '谷物仓储', 1041, '5911');
INSERT INTO `t_industry` VALUES (1043, 'S', '棉花仓储', 1041, '5912');
INSERT INTO `t_industry` VALUES (1044, 'S', '其他农产品仓储', 1041, '5919');
INSERT INTO `t_industry` VALUES (1045, 'M', '其他仓储业', 1040, '599');
INSERT INTO `t_industry` VALUES (1046, 'L', '邮政业', 990, '60');
INSERT INTO `t_industry` VALUES (1047, 'M', '邮政基本服务', 1046, '601');
INSERT INTO `t_industry` VALUES (1048, 'M', '快递服务', 1046, '602');
INSERT INTO `t_industry` VALUES (1049, 'X', '住宿和餐饮业', NULL, 'H');
INSERT INTO `t_industry` VALUES (1050, 'L', '住宿业', 1049, '61');
INSERT INTO `t_industry` VALUES (1051, 'M', '旅游饭店', 1050, '611');
INSERT INTO `t_industry` VALUES (1052, 'M', '一般旅馆', 1050, '612');
INSERT INTO `t_industry` VALUES (1053, 'M', '其他住宿业', 1050, '619');
INSERT INTO `t_industry` VALUES (1054, 'L', '餐饮业', 1049, '62');
INSERT INTO `t_industry` VALUES (1055, 'M', '正餐服务', 1054, '621');
INSERT INTO `t_industry` VALUES (1056, 'M', '快餐服务', 1054, '622');
INSERT INTO `t_industry` VALUES (1057, 'M', '饮料及冷饮服务', 1054, '623');
INSERT INTO `t_industry` VALUES (1058, 'S', '茶馆服务', 1057, '6231');
INSERT INTO `t_industry` VALUES (1059, 'S', '咖啡馆服务', 1057, '6232');
INSERT INTO `t_industry` VALUES (1060, 'S', '酒吧服务', 1057, '6233');
INSERT INTO `t_industry` VALUES (1061, 'S', '其他饮料及冷饮服务', 1057, '6239');
INSERT INTO `t_industry` VALUES (1062, 'M', '其他餐饮业', 1054, '629');
INSERT INTO `t_industry` VALUES (1063, 'S', '小吃服务', 1062, '6291');
INSERT INTO `t_industry` VALUES (1064, 'S', '餐饮配送服务', 1062, '6292');
INSERT INTO `t_industry` VALUES (1065, 'S', '其他未列明餐饮业', 1062, '6299');
INSERT INTO `t_industry` VALUES (1066, 'X', '信息传输、软件和信息技术服务业', NULL, 'I');
INSERT INTO `t_industry` VALUES (1067, 'L', '电信、广播电视和卫星传输服务', 1066, '63');
INSERT INTO `t_industry` VALUES (1068, 'M', '电信', 1067, '631');
INSERT INTO `t_industry` VALUES (1069, 'S', '固定电信服务', 1068, '6311');
INSERT INTO `t_industry` VALUES (1070, 'S', '移动电信服务', 1068, '6312');
INSERT INTO `t_industry` VALUES (1071, 'S', '其他电信服务', 1068, '6319');
INSERT INTO `t_industry` VALUES (1072, 'M', '广播电视传输服务', 1067, '632');
INSERT INTO `t_industry` VALUES (1073, 'S', '有线广播电视传输服务', 1072, '6321');
INSERT INTO `t_industry` VALUES (1074, 'S', '无线广播电视传输服务', 1072, '6322');
INSERT INTO `t_industry` VALUES (1075, 'M', '卫星传输服务', 1067, '633');
INSERT INTO `t_industry` VALUES (1076, 'L', '互联网和相关服务', 1066, '64');
INSERT INTO `t_industry` VALUES (1077, 'M', '互联网接入及相关服务', 1076, '641');
INSERT INTO `t_industry` VALUES (1078, 'M', '互联网信息服务', 1076, '642');
INSERT INTO `t_industry` VALUES (1079, 'M', '其他互联网服务', 1076, '649');
INSERT INTO `t_industry` VALUES (1080, 'L', '软件和信息技术服务业', 1066, '65');
INSERT INTO `t_industry` VALUES (1081, 'M', '软件开发', 1080, '651');
INSERT INTO `t_industry` VALUES (1082, 'M', '信息系统集成服务', 1080, '652');
INSERT INTO `t_industry` VALUES (1083, 'M', '信息技术咨询服务', 1080, '653');
INSERT INTO `t_industry` VALUES (1084, 'M', '数据处理和存储服务', 1080, '654');
INSERT INTO `t_industry` VALUES (1085, 'M', '集成电路设计', 1080, '655');
INSERT INTO `t_industry` VALUES (1086, 'M', '其他信息技术服务业', 1080, '659');
INSERT INTO `t_industry` VALUES (1087, 'S', '数字内容服务', 1086, '6591');
INSERT INTO `t_industry` VALUES (1088, 'S', '呼叫中心', 1086, '6592');
INSERT INTO `t_industry` VALUES (1089, 'S', '其他未列明信息技术服务业', 1086, '6599');
INSERT INTO `t_industry` VALUES (1090, 'X', '金融业', NULL, 'J');
INSERT INTO `t_industry` VALUES (1091, 'L', '货币金融服务', 1090, '66');
INSERT INTO `t_industry` VALUES (1092, 'M', '中央银行服务', 1091, '661');
INSERT INTO `t_industry` VALUES (1093, 'M', '货币银行服务', 1091, '662');
INSERT INTO `t_industry` VALUES (1094, 'M', '非货币银行服务', 1091, '663');
INSERT INTO `t_industry` VALUES (1095, 'S', '金融租赁服务', 1094, '6631');
INSERT INTO `t_industry` VALUES (1096, 'S', '财务公司', 1094, '6632');
INSERT INTO `t_industry` VALUES (1097, 'S', '典当', 1094, '6633');
INSERT INTO `t_industry` VALUES (1098, 'S', '其他非货币银行服务', 1094, '6639');
INSERT INTO `t_industry` VALUES (1099, 'M', '银行监管服务', 1091, '664');
INSERT INTO `t_industry` VALUES (1100, 'L', '资本市场服务', 1090, '67');
INSERT INTO `t_industry` VALUES (1101, 'M', '证券市场服务', 1100, '671');
INSERT INTO `t_industry` VALUES (1102, 'S', '证券市场管理服务', 1101, '6711');
INSERT INTO `t_industry` VALUES (1103, 'S', '证券经纪交易服务', 1101, '6712');
INSERT INTO `t_industry` VALUES (1104, 'S', '基金管理服务', 1101, '6713');
INSERT INTO `t_industry` VALUES (1105, 'M', '期货市场服务', 1100, '672');
INSERT INTO `t_industry` VALUES (1106, 'S', '期货市场管理服务', 1105, '6721');
INSERT INTO `t_industry` VALUES (1107, 'S', '其他期货市场服务', 1105, '6729');
INSERT INTO `t_industry` VALUES (1108, 'M', '证券期货监管服务', 1100, '673');
INSERT INTO `t_industry` VALUES (1109, 'M', '资本投资服务', 1100, '674');
INSERT INTO `t_industry` VALUES (1110, 'M', '其他资本市场服务', 1100, '679');
INSERT INTO `t_industry` VALUES (1111, 'L', '保险业', 1090, '68');
INSERT INTO `t_industry` VALUES (1112, 'M', '人身保险', 1111, '681');
INSERT INTO `t_industry` VALUES (1113, 'S', '人寿保险', 1112, '6811');
INSERT INTO `t_industry` VALUES (1114, 'S', '健康和意外保险', 1112, '6812');
INSERT INTO `t_industry` VALUES (1115, 'M', '财产保险', 1111, '682');
INSERT INTO `t_industry` VALUES (1116, 'M', '再保险', 1111, '683');
INSERT INTO `t_industry` VALUES (1117, 'M', '养老金', 1111, '684');
INSERT INTO `t_industry` VALUES (1118, 'M', '保险经纪与代理服务', 1111, '685');
INSERT INTO `t_industry` VALUES (1119, 'M', '保险监管服务', 1111, '686');
INSERT INTO `t_industry` VALUES (1120, 'M', '其他保险活动', 1111, '689');
INSERT INTO `t_industry` VALUES (1121, 'S', '风险和损失评估', 1120, '6891');
INSERT INTO `t_industry` VALUES (1122, 'S', '其他未列明保险活动', 1120, '6899');
INSERT INTO `t_industry` VALUES (1123, 'L', '其他金融业', 1090, '69');
INSERT INTO `t_industry` VALUES (1124, 'M', '金融信托与管理服务', 1123, '691');
INSERT INTO `t_industry` VALUES (1125, 'M', '控股公司服务', 1123, '692');
INSERT INTO `t_industry` VALUES (1126, 'M', '非金融机构支付服务', 1123, '693');
INSERT INTO `t_industry` VALUES (1127, 'M', '金融信息服务', 1123, '694');
INSERT INTO `t_industry` VALUES (1128, 'M', '其他未列明金融业', 1123, '699');
INSERT INTO `t_industry` VALUES (1129, 'X', '房地产业', NULL, 'K');
INSERT INTO `t_industry` VALUES (1130, 'L', '房地产业', 1129, '70');
INSERT INTO `t_industry` VALUES (1131, 'M', '房地产开发经营', 1130, '701');
INSERT INTO `t_industry` VALUES (1132, 'M', '物业管理', 1130, '702');
INSERT INTO `t_industry` VALUES (1133, 'M', '房地产中介服务', 1130, '703');
INSERT INTO `t_industry` VALUES (1134, 'M', '自有房地产经营活动', 1130, '704');
INSERT INTO `t_industry` VALUES (1135, 'M', '其他房地产业', 1130, '709');
INSERT INTO `t_industry` VALUES (1136, 'X', '租赁和商务服务业', NULL, 'L');
INSERT INTO `t_industry` VALUES (1137, 'L', '租赁业', 1136, '71');
INSERT INTO `t_industry` VALUES (1138, 'M', '机械设备租赁', 1137, '711');
INSERT INTO `t_industry` VALUES (1139, 'S', '汽车租赁', 1138, '7111');
INSERT INTO `t_industry` VALUES (1140, 'S', '农业机械租赁', 1138, '7112');
INSERT INTO `t_industry` VALUES (1141, 'S', '建筑工程机械与设备租赁', 1138, '7113');
INSERT INTO `t_industry` VALUES (1142, 'S', '计算机及通讯设备租赁', 1138, '7114');
INSERT INTO `t_industry` VALUES (1143, 'S', '其他机械与设备租赁', 1138, '7119');
INSERT INTO `t_industry` VALUES (1144, 'M', '文化及日用品出租', 1137, '712');
INSERT INTO `t_industry` VALUES (1145, 'S', '娱乐及体育设备出租', 1144, '7121');
INSERT INTO `t_industry` VALUES (1146, 'S', '图书出租', 1144, '7122');
INSERT INTO `t_industry` VALUES (1147, 'S', '音像制品出租', 1144, '7123');
INSERT INTO `t_industry` VALUES (1148, 'S', '其他文化及日用品出租', 1144, '7129');
INSERT INTO `t_industry` VALUES (1149, 'L', '商务服务业', 1136, '72');
INSERT INTO `t_industry` VALUES (1150, 'M', '企业管理服务', 1149, '721');
INSERT INTO `t_industry` VALUES (1151, 'S', '企业总部管理', 1150, '7211');
INSERT INTO `t_industry` VALUES (1152, 'S', '投资与资产管理', 1150, '7212');
INSERT INTO `t_industry` VALUES (1153, 'S', '单位后勤管理服务', 1150, '7213');
INSERT INTO `t_industry` VALUES (1154, 'S', '其他企业管理服务', 1150, '7219');
INSERT INTO `t_industry` VALUES (1155, 'M', '法律服务', 1149, '722');
INSERT INTO `t_industry` VALUES (1156, 'S', '律师及相关法律服务', 1155, '7221');
INSERT INTO `t_industry` VALUES (1157, 'S', '公证服务', 1155, '7222');
INSERT INTO `t_industry` VALUES (1158, 'S', '其他法律服务', 1155, '7229');
INSERT INTO `t_industry` VALUES (1159, 'M', '咨询与调查', 1149, '723');
INSERT INTO `t_industry` VALUES (1160, 'S', '会计、审计及税务服务', 1159, '7231');
INSERT INTO `t_industry` VALUES (1161, 'S', '市场调查', 1159, '7232');
INSERT INTO `t_industry` VALUES (1162, 'S', '社会经济咨询', 1159, '7233');
INSERT INTO `t_industry` VALUES (1163, 'S', '其他专业咨询', 1159, '7239');
INSERT INTO `t_industry` VALUES (1164, 'M', '广告业', 1149, '724');
INSERT INTO `t_industry` VALUES (1165, 'M', '知识产权服务', 1149, '725');
INSERT INTO `t_industry` VALUES (1166, 'M', '人力资源服务', 1149, '726');
INSERT INTO `t_industry` VALUES (1167, 'S', '公共就业服务', 1166, '7261');
INSERT INTO `t_industry` VALUES (1168, 'S', '职业中介服务', 1166, '7262');
INSERT INTO `t_industry` VALUES (1169, 'S', '劳务派遣服务', 1166, '7263');
INSERT INTO `t_industry` VALUES (1170, 'S', '其他人力资源服务', 1166, '7269');
INSERT INTO `t_industry` VALUES (1171, 'M', '旅行社及相关服务', 1149, '727');
INSERT INTO `t_industry` VALUES (1172, 'S', '旅行社服务', 1171, '7271');
INSERT INTO `t_industry` VALUES (1173, 'S', '旅游管理服务', 1171, '7272');
INSERT INTO `t_industry` VALUES (1174, 'S', '其他旅行社相关服务', 1171, '7279');
INSERT INTO `t_industry` VALUES (1175, 'M', '安全保护服务', 1149, '728');
INSERT INTO `t_industry` VALUES (1176, 'S', '安全服务', 1175, '7281');
INSERT INTO `t_industry` VALUES (1177, 'S', '安全系统监控服务', 1175, '7282');
INSERT INTO `t_industry` VALUES (1178, 'S', '其他安全保护服务', 1175, '7289');
INSERT INTO `t_industry` VALUES (1179, 'M', '其他商务服务业', 1149, '729');
INSERT INTO `t_industry` VALUES (1180, 'S', '市场管理', 1179, '7291');
INSERT INTO `t_industry` VALUES (1181, 'S', '会议及展览服务', 1179, '7292');
INSERT INTO `t_industry` VALUES (1182, 'S', '包装服务', 1179, '7293');
INSERT INTO `t_industry` VALUES (1183, 'S', '办公服务', 1179, '7294');
INSERT INTO `t_industry` VALUES (1184, 'S', '信用服务', 1179, '7295');
INSERT INTO `t_industry` VALUES (1185, 'S', '担保服务', 1179, '7296');
INSERT INTO `t_industry` VALUES (1186, 'S', '其他未列明商务服务业', 1179, '7299');
INSERT INTO `t_industry` VALUES (1187, 'X', '科学研究和技术服务业', NULL, 'M');
INSERT INTO `t_industry` VALUES (1188, 'L', '研究和试验发展', 1187, '73');
INSERT INTO `t_industry` VALUES (1189, 'M', '自然科学研究和试验发展', 1188, '731');
INSERT INTO `t_industry` VALUES (1190, 'M', '工程和技术研究和试验发展', 1188, '732');
INSERT INTO `t_industry` VALUES (1191, 'M', '农业科学研究和试验发展', 1188, '733');
INSERT INTO `t_industry` VALUES (1192, 'M', '医学研究和试验发展', 1188, '734');
INSERT INTO `t_industry` VALUES (1193, 'M', '社会人文科学研究', 1188, '735');
INSERT INTO `t_industry` VALUES (1194, 'L', '专业技术服务业', 1187, '74');
INSERT INTO `t_industry` VALUES (1195, 'M', '气象服务', 1194, '741');
INSERT INTO `t_industry` VALUES (1196, 'M', '地震服务', 1194, '742');
INSERT INTO `t_industry` VALUES (1197, 'M', '海洋服务', 1194, '743');
INSERT INTO `t_industry` VALUES (1198, 'M', '测绘服务', 1194, '744');
INSERT INTO `t_industry` VALUES (1199, 'M', '质检技术服务', 1194, '745');
INSERT INTO `t_industry` VALUES (1200, 'M', '环境与生态监测', 1194, '746');
INSERT INTO `t_industry` VALUES (1201, 'S', '环境保护监测', 1200, '7461');
INSERT INTO `t_industry` VALUES (1202, 'S', '生态监测', 1200, '7462');
INSERT INTO `t_industry` VALUES (1203, 'M', '地质勘查', 1194, '747');
INSERT INTO `t_industry` VALUES (1204, 'S', '能源矿产地质勘查', 1203, '7471');
INSERT INTO `t_industry` VALUES (1205, 'S', '固体矿产地质勘查', 1203, '7472');
INSERT INTO `t_industry` VALUES (1206, 'S', '水、二氧化碳等矿产地质勘查', 1203, '7473');
INSERT INTO `t_industry` VALUES (1207, 'S', '基础地质勘查', 1203, '7474');
INSERT INTO `t_industry` VALUES (1208, 'S', '地质勘查技术服务', 1203, '7475');
INSERT INTO `t_industry` VALUES (1209, 'M', '工程技术', 1194, '748');
INSERT INTO `t_industry` VALUES (1210, 'S', '工程管理服务', 1209, '7481');
INSERT INTO `t_industry` VALUES (1211, 'S', '工程勘察设计', 1209, '7482');
INSERT INTO `t_industry` VALUES (1212, 'S', '规划管理', 1209, '7483');
INSERT INTO `t_industry` VALUES (1213, 'M', '其他专业技术服务业', 1194, '749');
INSERT INTO `t_industry` VALUES (1214, 'S', '专业化设计服务', 1213, '7491');
INSERT INTO `t_industry` VALUES (1215, 'S', '摄影扩印服务', 1213, '7492');
INSERT INTO `t_industry` VALUES (1216, 'S', '兽医服务', 1213, '7493');
INSERT INTO `t_industry` VALUES (1217, 'S', '其他未列明专业技术服务业', 1213, '7499');
INSERT INTO `t_industry` VALUES (1218, 'L', '科技推广和应用服务业', 1187, '75');
INSERT INTO `t_industry` VALUES (1219, 'M', '技术推广服务', 1218, '751');
INSERT INTO `t_industry` VALUES (1220, 'S', '农业技术推广服务', 1219, '7511');
INSERT INTO `t_industry` VALUES (1221, 'S', '生物技术推广服务', 1219, '7512');
INSERT INTO `t_industry` VALUES (1222, 'S', '新材料技术推广服务', 1219, '7513');
INSERT INTO `t_industry` VALUES (1223, 'S', '节能技术推广服务', 1219, '7514');
INSERT INTO `t_industry` VALUES (1224, 'S', '其他技术推广服务', 1219, '7519');
INSERT INTO `t_industry` VALUES (1225, 'M', '科技中介服务', 1218, '752');
INSERT INTO `t_industry` VALUES (1226, 'M', '其他科技推广和应用服务业', 1218, '759');
INSERT INTO `t_industry` VALUES (1227, 'X', '水利、环境和公共设施管理业', NULL, 'N');
INSERT INTO `t_industry` VALUES (1228, 'L', '水利管理业', 1227, '76');
INSERT INTO `t_industry` VALUES (1229, 'M', '防洪除涝设施管理', 1228, '761');
INSERT INTO `t_industry` VALUES (1230, 'M', '水资源管理', 1228, '762');
INSERT INTO `t_industry` VALUES (1231, 'M', '天然水收集与分配', 1228, '763');
INSERT INTO `t_industry` VALUES (1232, 'M', '水文服务', 1228, '764');
INSERT INTO `t_industry` VALUES (1233, 'M', '其他水利管理业', 1228, '769');
INSERT INTO `t_industry` VALUES (1234, 'L', '生态保护和环境治理业', 1227, '77');
INSERT INTO `t_industry` VALUES (1235, 'M', '生态保护', 1234, '771');
INSERT INTO `t_industry` VALUES (1236, 'S', '自然保护区管理', 1235, '7711');
INSERT INTO `t_industry` VALUES (1237, 'S', '野生动物保护', 1235, '7712');
INSERT INTO `t_industry` VALUES (1238, 'S', '野生植物保护', 1235, '7713');
INSERT INTO `t_industry` VALUES (1239, 'S', '其他自然保护', 1235, '7719');
INSERT INTO `t_industry` VALUES (1240, 'M', '环境治理业', 1234, '772');
INSERT INTO `t_industry` VALUES (1241, 'S', '水污染治理', 1240, '7721');
INSERT INTO `t_industry` VALUES (1242, 'S', '大气污染治理', 1240, '7722');
INSERT INTO `t_industry` VALUES (1243, 'S', '固体废物治理', 1240, '7723');
INSERT INTO `t_industry` VALUES (1244, 'S', '危险废物治理', 1240, '7724');
INSERT INTO `t_industry` VALUES (1245, 'S', '放射性废物治理', 1240, '7725');
INSERT INTO `t_industry` VALUES (1246, 'S', '其他污染治理', 1240, '7729');
INSERT INTO `t_industry` VALUES (1247, 'L', '公共设施管理业', 1227, '78');
INSERT INTO `t_industry` VALUES (1248, 'M', '市政设施管理', 1247, '781');
INSERT INTO `t_industry` VALUES (1249, 'M', '环境卫生管理', 1247, '782');
INSERT INTO `t_industry` VALUES (1250, 'M', '城乡市容管理', 1247, '783');
INSERT INTO `t_industry` VALUES (1251, 'M', '绿化管理', 1247, '784');
INSERT INTO `t_industry` VALUES (1252, 'M', '公园和游览景区管理', 1247, '785');
INSERT INTO `t_industry` VALUES (1253, 'S', '公园管理', 1252, '7851');
INSERT INTO `t_industry` VALUES (1254, 'S', '游览景区管理', 1252, '7852');
INSERT INTO `t_industry` VALUES (1255, 'X', '居民服务、修理和其他服务业', NULL, 'O');
INSERT INTO `t_industry` VALUES (1256, 'L', '居民服务业', 1255, '79');
INSERT INTO `t_industry` VALUES (1257, 'M', '家庭服务', 1256, '791');
INSERT INTO `t_industry` VALUES (1258, 'M', '托儿所服务', 1256, '792');
INSERT INTO `t_industry` VALUES (1259, 'M', '洗染服务', 1256, '793');
INSERT INTO `t_industry` VALUES (1260, 'M', '理发及美容服务', 1256, '794');
INSERT INTO `t_industry` VALUES (1261, 'M', '洗浴服务', 1256, '795');
INSERT INTO `t_industry` VALUES (1262, 'M', '保健服务', 1256, '796');
INSERT INTO `t_industry` VALUES (1263, 'M', '婚姻服务', 1256, '797');
INSERT INTO `t_industry` VALUES (1264, 'M', '殡葬服务', 1256, '798');
INSERT INTO `t_industry` VALUES (1265, 'M', '其他居民服务业', 1256, '799');
INSERT INTO `t_industry` VALUES (1266, 'L', '机动车、电子产品和日用产品修理业', 1255, '80');
INSERT INTO `t_industry` VALUES (1267, 'M', '汽车、摩托车修理与维护', 1266, '801');
INSERT INTO `t_industry` VALUES (1268, 'S', '汽车修理与维护', 1267, '8011');
INSERT INTO `t_industry` VALUES (1269, 'S', '摩托车修理与维护', 1267, '8012');
INSERT INTO `t_industry` VALUES (1270, 'M', '计算机和办公设备维修', 1266, '802');
INSERT INTO `t_industry` VALUES (1271, 'S', '计算机和辅助设备修理', 1270, '8021');
INSERT INTO `t_industry` VALUES (1272, 'S', '通讯设备修理', 1270, '8022');
INSERT INTO `t_industry` VALUES (1273, 'S', '其他办公设备维修', 1270, '8029');
INSERT INTO `t_industry` VALUES (1274, 'M', '家用电器修理', 1266, '803');
INSERT INTO `t_industry` VALUES (1275, 'S', '家用电子产品修理', 1274, '8031');
INSERT INTO `t_industry` VALUES (1276, 'S', '日用电器修理', 1274, '8032');
INSERT INTO `t_industry` VALUES (1277, 'M', '其他日用产品修理业', 1266, '809');
INSERT INTO `t_industry` VALUES (1278, 'S', '自行车修理', 1277, '8091');
INSERT INTO `t_industry` VALUES (1279, 'S', '鞋和皮革修理', 1277, '8092');
INSERT INTO `t_industry` VALUES (1280, 'S', '家具和相关物品修理', 1277, '8093');
INSERT INTO `t_industry` VALUES (1281, 'S', '其他未列明日用产品修理业', 1277, '8099');
INSERT INTO `t_industry` VALUES (1282, 'L', '其他服务业', 1255, '81');
INSERT INTO `t_industry` VALUES (1283, 'M', '清洁服务', 1282, '811');
INSERT INTO `t_industry` VALUES (1284, 'S', '建筑物清洁服务', 1283, '8111');
INSERT INTO `t_industry` VALUES (1285, 'S', '其他清洁服务', 1283, '8119');
INSERT INTO `t_industry` VALUES (1286, 'M', '其他未列明服务业', 1282, '819');
INSERT INTO `t_industry` VALUES (1287, 'X', '教育', NULL, 'P');
INSERT INTO `t_industry` VALUES (1288, 'L', '教育', 1287, '82');
INSERT INTO `t_industry` VALUES (1289, 'M', '学前教育', 1288, '821');
INSERT INTO `t_industry` VALUES (1290, 'M', '初等教育', 1288, '822');
INSERT INTO `t_industry` VALUES (1291, 'S', '普通小学教育', 1290, '8221');
INSERT INTO `t_industry` VALUES (1292, 'S', '成人小学教育', 1290, '8222');
INSERT INTO `t_industry` VALUES (1293, 'M', '中等教育', 1288, '823');
INSERT INTO `t_industry` VALUES (1294, 'S', '普通初中教育', 1293, '8231');
INSERT INTO `t_industry` VALUES (1295, 'S', '职业初中教育', 1293, '8232');
INSERT INTO `t_industry` VALUES (1296, 'S', '成人初中教育', 1293, '8233');
INSERT INTO `t_industry` VALUES (1297, 'S', '普通高中教育', 1293, '8234');
INSERT INTO `t_industry` VALUES (1298, 'S', '成人高中教育', 1293, '8235');
INSERT INTO `t_industry` VALUES (1299, 'S', '中等职业学校教育', 1293, '8236');
INSERT INTO `t_industry` VALUES (1300, 'M', '高等教育', 1288, '824');
INSERT INTO `t_industry` VALUES (1301, 'S', '普通高等教育', 1300, '8241');
INSERT INTO `t_industry` VALUES (1302, 'S', '成人高等教育', 1300, '8242');
INSERT INTO `t_industry` VALUES (1303, 'M', '特殊教育', 1288, '825');
INSERT INTO `t_industry` VALUES (1304, 'M', '技能培训、教育辅助及其他教育', 1288, '829');
INSERT INTO `t_industry` VALUES (1305, 'S', '职业技能培训', 1304, '8291');
INSERT INTO `t_industry` VALUES (1306, 'S', '体校及体育培训', 1304, '8292');
INSERT INTO `t_industry` VALUES (1307, 'S', '文化艺术培训', 1304, '8293');
INSERT INTO `t_industry` VALUES (1308, 'S', '教育辅助服务', 1304, '8294');
INSERT INTO `t_industry` VALUES (1309, 'S', '其他未列明教育', 1304, '8299');
INSERT INTO `t_industry` VALUES (1310, 'X', '卫生和社会工作', NULL, 'Q');
INSERT INTO `t_industry` VALUES (1311, 'L', '卫生', 1310, '83');
INSERT INTO `t_industry` VALUES (1312, 'M', '医院', 1311, '831');
INSERT INTO `t_industry` VALUES (1313, 'S', '综合医院', 1312, '8311');
INSERT INTO `t_industry` VALUES (1314, 'S', '中医医院', 1312, '8312');
INSERT INTO `t_industry` VALUES (1315, 'S', '中西医结合医院', 1312, '8313');
INSERT INTO `t_industry` VALUES (1316, 'S', '民族医院', 1312, '8314');
INSERT INTO `t_industry` VALUES (1317, 'S', '专科医院', 1312, '8315');
INSERT INTO `t_industry` VALUES (1318, 'S', '疗养院', 1312, '8316');
INSERT INTO `t_industry` VALUES (1319, 'M', '社区医疗与卫生院', 1311, '832');
INSERT INTO `t_industry` VALUES (1320, 'S', '社区卫生服务中心（站）', 1319, '8321');
INSERT INTO `t_industry` VALUES (1321, 'S', '街道卫生院', 1319, '8322');
INSERT INTO `t_industry` VALUES (1322, 'S', '乡镇卫生院', 1319, '8323');
INSERT INTO `t_industry` VALUES (1323, 'M', '门诊部（所）', 1311, '833');
INSERT INTO `t_industry` VALUES (1324, 'M', '计划生育技术服务活动', 1311, '834');
INSERT INTO `t_industry` VALUES (1325, 'M', '妇幼保健院（所、站）', 1311, '835');
INSERT INTO `t_industry` VALUES (1326, 'M', '专科疾病防治院（所、站）', 1311, '836');
INSERT INTO `t_industry` VALUES (1327, 'M', '疾病预防控制中心', 1311, '837');
INSERT INTO `t_industry` VALUES (1328, 'M', '其他卫生活动', 1311, '839');
INSERT INTO `t_industry` VALUES (1329, 'L', '社会工作', 1310, '84');
INSERT INTO `t_industry` VALUES (1330, 'M', '提供住宿社会工作', 1329, '841');
INSERT INTO `t_industry` VALUES (1331, 'S', '干部休养所', 1330, '8411');
INSERT INTO `t_industry` VALUES (1332, 'S', '护理机构服务', 1330, '8412');
INSERT INTO `t_industry` VALUES (1333, 'S', '精神康复服务', 1330, '8413');
INSERT INTO `t_industry` VALUES (1334, 'S', '老年人、残疾人养护服务', 1330, '8414');
INSERT INTO `t_industry` VALUES (1335, 'S', '孤残儿童收养和庇护服务', 1330, '8415');
INSERT INTO `t_industry` VALUES (1336, 'S', '其他提供住宿社会救助', 1330, '8419');
INSERT INTO `t_industry` VALUES (1337, 'M', '不提供住宿社会工作', 1329, '842');
INSERT INTO `t_industry` VALUES (1338, 'S', '社会看护与帮助服务', 1337, '8421');
INSERT INTO `t_industry` VALUES (1339, 'S', '其他不提供住宿社会工作', 1337, '8429');
INSERT INTO `t_industry` VALUES (1340, 'X', '文化、体育和娱乐业', NULL, 'R');
INSERT INTO `t_industry` VALUES (1341, 'L', '新闻和出版业', 1340, '85');
INSERT INTO `t_industry` VALUES (1342, 'M', '新闻业', 1341, '851');
INSERT INTO `t_industry` VALUES (1343, 'M', '出版业', 1341, '852');
INSERT INTO `t_industry` VALUES (1344, 'S', '图书出版', 1343, '8521');
INSERT INTO `t_industry` VALUES (1345, 'S', '报纸出版', 1343, '8522');
INSERT INTO `t_industry` VALUES (1346, 'S', '期刊出版', 1343, '8523');
INSERT INTO `t_industry` VALUES (1347, 'S', '音像制品出版', 1343, '8524');
INSERT INTO `t_industry` VALUES (1348, 'S', '电子出版物出版', 1343, '8525');
INSERT INTO `t_industry` VALUES (1349, 'S', '其他出版业', 1343, '8529');
INSERT INTO `t_industry` VALUES (1350, 'L', '广播、电视、电影和影视录音制作业', 1340, '86');
INSERT INTO `t_industry` VALUES (1351, 'M', '广播', 1350, '861');
INSERT INTO `t_industry` VALUES (1352, 'M', '电视', 1350, '862');
INSERT INTO `t_industry` VALUES (1353, 'M', '电影和影视节目制作', 1350, '863');
INSERT INTO `t_industry` VALUES (1354, 'M', '电影和影视节目发行', 1350, '864');
INSERT INTO `t_industry` VALUES (1355, 'M', '电影放映', 1350, '865');
INSERT INTO `t_industry` VALUES (1356, 'M', '录音制作', 1350, '866');
INSERT INTO `t_industry` VALUES (1357, 'L', '文化艺术业', 1340, '87');
INSERT INTO `t_industry` VALUES (1358, 'M', '文艺创作与表演', 1357, '871');
INSERT INTO `t_industry` VALUES (1359, 'M', '艺术表演场馆', 1357, '872');
INSERT INTO `t_industry` VALUES (1360, 'M', '图书馆与档案馆', 1357, '873');
INSERT INTO `t_industry` VALUES (1361, 'S', '图书馆', 1360, '8731');
INSERT INTO `t_industry` VALUES (1362, 'S', '档案馆', 1360, '8732');
INSERT INTO `t_industry` VALUES (1363, 'M', '文物及非物质文化遗产保护', 1357, '874');
INSERT INTO `t_industry` VALUES (1364, 'M', '博物馆', 1357, '875');
INSERT INTO `t_industry` VALUES (1365, 'M', '烈士陵园、纪念馆', 1357, '876');
INSERT INTO `t_industry` VALUES (1366, 'M', '群众文化活动', 1357, '877');
INSERT INTO `t_industry` VALUES (1367, 'M', '其他文化艺术业', 1357, '879');
INSERT INTO `t_industry` VALUES (1368, 'L', '体育', 1340, '88');
INSERT INTO `t_industry` VALUES (1369, 'M', '体育组织', 1368, '881');
INSERT INTO `t_industry` VALUES (1370, 'M', '体育场馆', 1368, '882');
INSERT INTO `t_industry` VALUES (1371, 'M', '休闲健身活动', 1368, '883');
INSERT INTO `t_industry` VALUES (1372, 'M', '其他体育', 1368, '889');
INSERT INTO `t_industry` VALUES (1373, 'L', '娱乐业', 1340, '89');
INSERT INTO `t_industry` VALUES (1374, 'M', '室内娱乐活动', 1373, '891');
INSERT INTO `t_industry` VALUES (1375, 'S', '歌舞厅娱乐活动', 1374, '8911');
INSERT INTO `t_industry` VALUES (1376, 'S', '电子游艺厅娱乐活动', 1374, '8912');
INSERT INTO `t_industry` VALUES (1377, 'S', '网吧活动', 1374, '8913');
INSERT INTO `t_industry` VALUES (1378, 'S', '其他室内娱乐活动', 1374, '8919');
INSERT INTO `t_industry` VALUES (1379, 'M', '游乐园', 1373, '892');
INSERT INTO `t_industry` VALUES (1380, 'M', '彩票活动', 1373, '893');
INSERT INTO `t_industry` VALUES (1381, 'M', '文化、娱乐、体育经纪代理', 1373, '894');
INSERT INTO `t_industry` VALUES (1382, 'S', '文化娱乐经纪人', 1381, '8941');
INSERT INTO `t_industry` VALUES (1383, 'S', '体育经纪人', 1381, '8942');
INSERT INTO `t_industry` VALUES (1384, 'S', '其他文化艺术经纪代理', 1381, '8949');
INSERT INTO `t_industry` VALUES (1385, 'M', '其他娱乐业', 1373, '899');
INSERT INTO `t_industry` VALUES (1386, 'X', '公共管理、社会保障和社会组织', NULL, 'S');
INSERT INTO `t_industry` VALUES (1387, 'L', '中国共产党机关', 1386, '90');
INSERT INTO `t_industry` VALUES (1388, 'M', '中国共产党机关', 1387, '900');
INSERT INTO `t_industry` VALUES (1389, 'L', '国家机构', 1386, '91');
INSERT INTO `t_industry` VALUES (1390, 'M', '国家权力机构', 1389, '911');
INSERT INTO `t_industry` VALUES (1391, 'M', '国家行政机构', 1389, '912');
INSERT INTO `t_industry` VALUES (1392, 'S', '综合事务管理机构', 1391, '9121');
INSERT INTO `t_industry` VALUES (1393, 'S', '对外事务管理机构', 1391, '9122');
INSERT INTO `t_industry` VALUES (1394, 'S', '公共安全管理机构', 1391, '9123');
INSERT INTO `t_industry` VALUES (1395, 'S', '社会事务管理机构', 1391, '9124');
INSERT INTO `t_industry` VALUES (1396, 'S', '经济事务管理机构', 1391, '9125');
INSERT INTO `t_industry` VALUES (1397, 'S', '行政监督检查机构', 1391, '9126');
INSERT INTO `t_industry` VALUES (1398, 'M', '人民法院和人民检察院', 1389, '913');
INSERT INTO `t_industry` VALUES (1399, 'S', '人民法院', 1398, '9131');
INSERT INTO `t_industry` VALUES (1400, 'S', '人民检察院', 1398, '9132');
INSERT INTO `t_industry` VALUES (1401, 'M', '其他国家机构', 1389, '919');
INSERT INTO `t_industry` VALUES (1402, 'L', '人民政协、民主党派', 1386, '92');
INSERT INTO `t_industry` VALUES (1403, 'M', '人民政协', 1402, '921');
INSERT INTO `t_industry` VALUES (1404, 'M', '民主党派', 1402, '922');
INSERT INTO `t_industry` VALUES (1405, 'L', '社会保障', 1386, '93');
INSERT INTO `t_industry` VALUES (1406, 'M', '社会保障', 1405, '930');
INSERT INTO `t_industry` VALUES (1407, 'L', '群众团体、社会团体和其他成员组织', 1386, '94');
INSERT INTO `t_industry` VALUES (1408, 'M', '群众团体', 1407, '941');
INSERT INTO `t_industry` VALUES (1409, 'S', '工会', 1408, '9411');
INSERT INTO `t_industry` VALUES (1410, 'S', '妇联', 1408, '9412');
INSERT INTO `t_industry` VALUES (1411, 'S', '共青团', 1408, '9413');
INSERT INTO `t_industry` VALUES (1412, 'S', '其他群众团体', 1408, '9419');
INSERT INTO `t_industry` VALUES (1413, 'M', '社会团体', 1407, '942');
INSERT INTO `t_industry` VALUES (1414, 'S', '专业性团体', 1413, '9421');
INSERT INTO `t_industry` VALUES (1415, 'S', '行业性团体', 1413, '9422');
INSERT INTO `t_industry` VALUES (1416, 'S', '其他社会团体', NULL, '9429');
INSERT INTO `t_industry` VALUES (1417, 'M', '基金会', 1407, '943');
INSERT INTO `t_industry` VALUES (1418, 'M', '宗教组织', 1407, '944');
INSERT INTO `t_industry` VALUES (1419, 'L', '基层群众自治组织', 1386, '95');
INSERT INTO `t_industry` VALUES (1420, 'M', '社区自治组织', 1419, '951');
INSERT INTO `t_industry` VALUES (1421, 'M', '村民自治组织', 1419, '952');
INSERT INTO `t_industry` VALUES (1422, 'X', '国际组织', NULL, 'T');
INSERT INTO `t_industry` VALUES (1423, 'L', '国际组织', NULL, '96');
INSERT INTO `t_industry` VALUES (1424, 'M', '国际组织', NULL, '960');

-- ----------------------------
-- Table structure for t_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `t_operation_log`;
CREATE TABLE `t_operation_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `org_id` bigint(20) NULL DEFAULT 0 COMMENT '组织id',
  `log_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志类型',
  `log_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志名称',
  `user_id` bigint(20) NULL DEFAULT NULL COMMENT '操作用户ID',
  `user_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作用户名称',
  `target_id` bigint(20) NULL DEFAULT NULL COMMENT '[未知]',
  `target_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '[未知]',
  `class_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作类名称',
  `method` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作方法名称',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '日志创建时间',
  `result` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作结果',
  `message` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '附带信息',
  `module` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '模块',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 318 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_operation_log
-- ----------------------------
INSERT INTO `t_operation_log` VALUES (1, 100000000000000010, 'BUSINESS_LOG', '平台新增 广告主的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'createAdvertiser', '2020-10-08 16:18:18', '成功', '{\"assistantId\":876708082437197830,\"comeFrom\":0,\"companyName\":\"大方文化传媒\",\"contactPhone\":\"13660456789\",\"id\":1,\"orgCode\":\"828785f725b044c4b196b3954b8f4f38\",\"orgId\":100000000000000061} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (2, 100000000000000010, 'BUSINESS_LOG', '平台新增 广告主的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'createAdvertiser', '2020-10-08 16:20:00', '成功', '{\"assistantId\":876708082437197830,\"city\":\"广州\",\"comeFrom\":0,\"companyName\":\"某某文化传媒公司\",\"contactName\":\"zhong\",\"contactPhone\":\"13800138001\",\"district\":\"天河区\",\"id\":2,\"lIndustry\":\"汽车制造业\",\"mIndustry\":\"汽车整车制造\",\"orgCode\":\"ff55569629644db981d340370db12bcf\",\"orgId\":100000000000000062,\"province\":\"广东\",\"xIndustry\":\"制造业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (3, 100000000000000010, 'BUSINESS_LOG', '广告主审核的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'passAdvertiser', '2020-10-08 16:21:28', '成功', '2 & \"REFUSE\" & ', '广告主');
INSERT INTO `t_operation_log` VALUES (4, 100000000000000010, 'BUSINESS_LOG', '增加子组织的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.org.api.crud.OrgEndpoint', 'createNodeChildren', '2020-10-08 16:28:25', '成功', '100000000000000010 & {\"bType\":\"SYSTEM\",\"createTime\":1602145704965,\"id\":100000000000000063,\"leftNum\":13,\"name\":\"商务部\",\"nodeLevel\":3,\"orgCode\":\"SW1001\",\"orgType\":4,\"pid\":100000000000000010,\"rightNum\":14,\"status\":\"NORMAL\",\"updateTime\":1602145704965} & ', '组织');
INSERT INTO `t_operation_log` VALUES (5, 100000000000000010, 'BUSINESS_LOG', '平台新增 广告主的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'createAdvertiser', '2020-10-08 16:32:19', '成功', '{\"assistantId\":876708082437197830,\"city\":\"北京\",\"comeFrom\":0,\"companyName\":\"某某科技有限公司\",\"contactName\":\"fei\",\"contactPhone\":\"13600000001\",\"district\":\"朝阳区\",\"id\":3,\"lIndustry\":\"资本市场服务\",\"mIndustry\":\"证券市场服务\",\"note\":\"金融行业\",\"orgCode\":\"1dfb6f5e543c44399eb325ccbc6ca87b\",\"orgId\":100000000000000064,\"province\":\"北京\",\"xIndustry\":\"金融业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (6, 100000000000000010, 'BUSINESS_LOG', '创建用户的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaUserEndpoint', 'createCinemaManager', '2020-10-08 16:33:10', '成功', '{\"account\":\" \",\"name\":\"S-店小二\",\"orgId\":100000000000000063,\"password\":\"111111\",\"phone\":\"13560126667\",\"roleIds\":[5]} & ', 'cinemaUser');
INSERT INTO `t_operation_log` VALUES (7, 100000000000000010, 'BUSINESS_LOG', '创建用户的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaUserEndpoint', 'createCinemaManager', '2020-10-08 16:33:43', '成功', '{\"account\":\" \",\"name\":\"商务部主管\",\"orgId\":100000000000000063,\"password\":\"111111\",\"phone\":\"13560126665\",\"roleIds\":[2]} & ', 'cinemaUser');
INSERT INTO `t_operation_log` VALUES (8, 100000000000000010, 'BUSINESS_LOG', '广告主审核的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'passAdvertiser', '2020-10-08 16:38:05', '成功', '1 & \"PASS\" & ', '广告主');
INSERT INTO `t_operation_log` VALUES (9, 100000000000000010, 'BUSINESS_LOG', '广告主审核的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'passAdvertiser', '2020-10-08 16:39:00', '成功', '3 & \"PASS\" & ', '广告主');
INSERT INTO `t_operation_log` VALUES (10, 100000000000000010, 'BUSINESS_LOG', 'create Cinema的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'createCinema', '2020-10-08 16:42:36', '成功', '{\"address\":\"广州市萝岗区万达广场\",\"assistantId\":876708082437197830,\"businessArea\":\"萝岗万达\",\"city\":\"广州\",\"cityLevel\":\"一线\",\"contact\":\"13600000000\",\"contactName\":\"黄斯葱\",\"district\":\"萝岗区\",\"id\":1,\"lineId\":1,\"lineName\":\"万达院线\",\"name\":\"广州万达影城\",\"orgCode\":\"edf51f6574a74c91a9c7e59aa78ad0c5\",\"orgId\":100000000000000066,\"province\":\"广东\",\"qualificationNumber\":\"2250\",\"roomNumber\":10,\"seatNumber\":350} & ', 'Cinema');
INSERT INTO `t_operation_log` VALUES (11, 100000000000000065, 'BUSINESS_LOG', '广告主修改自身信息的操作', 876708082437197838, '13560126123', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiserSelf', '2020-10-08 16:46:03', '成功', '{\"assistantId\":876708082437197832,\"balance\":0,\"businessLicenseProve\":\"attachments/c7aea9c8-09fe-419b-a03e-68ea2ad23094.png\",\"city\":\"北京\",\"comeFrom\":1,\"companyName\":\"水果广告有限公司\",\"contactPhone\":\"13560126123\",\"createTime\":1602146056000,\"district\":\"东城区\",\"id\":4,\"lIndustry\":\"农业\",\"loginTime\":1602146056000,\"mIndustry\":\"水果种植\",\"orgId\":100000000000000065,\"province\":\"北京\",\"status\":\"PENDING_APPROVAL\",\"updateTime\":1602146056000,\"xIndustry\":\"农、林、牧、渔业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (12, 100000000000000010, 'BUSINESS_LOG', 'create AdvertingMaterial的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertingMaterialEndpoint', 'createAdvertingMaterial', '2020-10-08 16:46:51', '成功', '{\"advertiserResourceUrl\":\"http://www.baiduyun.com\",\"id\":4,\"name\":\"广告素材\",\"orgId\":100000000000000010} & ', 'AdvertingMaterial');
INSERT INTO `t_operation_log` VALUES (13, 100000000000000010, 'BUSINESS_LOG', 'update AdvertingMaterial的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertingMaterialEndpoint', 'updateAdvertingMaterial', '2020-10-08 16:46:59', '成功', '4 & {\"advertiserResourcePassword\":\"aaa\",\"advertiserResourceUrl\":\"http://www.baiduyun.com\",\"createTime\":1602146811000,\"delFlag\":\"0\",\"id\":4,\"name\":\"广告素材\",\"orgId\":100000000000000010,\"updateTime\":1602146811000} & ', 'AdvertingMaterial');
INSERT INTO `t_operation_log` VALUES (14, 100000000000000010, 'BUSINESS_LOG', '更新组织的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.org.api.crud.OrgEndpoint', 'updateNode', '2020-10-08 16:54:15', '成功', '100000000000000010 & {\"bType\":\"SYSTEM\",\"createTime\":1600151003000,\"fullName\":\"星+智能营销云平台\",\"id\":100000000000000010,\"leftNum\":2,\"name\":\"星+智能营销云平台\",\"nodeLevel\":2,\"note\":\"总公司\",\"orgCode\":\"System\",\"orgType\":0,\"pid\":100000000000000001,\"rightNum\":21,\"status\":\"NORMAL\",\"updateTime\":1602146555000} & ', '组织');
INSERT INTO `t_operation_log` VALUES (15, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-08 16:56:07', '成功', '1 & {\"madeBy\":\"SYSTEM\",\"name\":\"广告主审批主管\",\"permIds\":[100000000000030010,100000000000030012,100000000000030042,100000000000030014,100000000000030044,100000000000030046,100000000000030018,100000000000030020,100000000000030047,100000000000030048,100000000000030050,100000000000310001,100000000000310002,100000000000030034,100000000000030036,100000000000030022,100000000000030024,100000000000030026,100000000000010001,100000000000030001,100000000000030052,100000000000030011,100000000000030043],\"roleCode\":\"102\",\"tips\":\"通过注册产生的广告主都会自动分配到此角色下\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (16, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-08 17:03:22', '成功', '1 & {\"madeBy\":\"SYSTEM\",\"name\":\"广告主审批主管\",\"permIds\":[100000000000030010,100000000000030012,100000000000030042,100000000000030014,100000000000030044,100000000000030046,100000000000030018,100000000000030020,100000000000030047,100000000000030048,100000000000030050,100000000000310001,100000000000310002,100000000000030034,100000000000030036,100000000000030022,100000000000030024,100000000000030026,100000000000010001,100000000000030001,100000000000030052,100000000000030011,100000000000030043,100000000000030015,100000000000030051,100000000000030035,100000000000030037,100000000000030053],\"roleCode\":\"102\",\"tips\":\"通过注册产生的广告主都会自动分配到此角色下\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (17, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-08 17:04:10', '成功', '2 & {\"madeBy\":\"SYSTEM\",\"name\":\"商务主管\",\"permIds\":[100000000000030010,100000000000030014,100000000000030018,100000000000030020,100000000000030048,100000000000030050,100000000000030047,100000000000030022,100000000000030026,100000000000010001,100000000000030001,100000000000030051,100000000000030034,100000000000030035,100000000000030036,100000000000030037,100000000000030053],\"roleCode\":\"105\",\"tips\":\"各个商务的管理人\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (18, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-08 17:05:40', '成功', '4 & {\"madeBy\":\"SYSTEM\",\"name\":\"商务\",\"permIds\":[100000000000030010,100000000000030014,100000000000030018,100000000000030020,100000000000030047,100000000000030048,100000000000030050,100000000000030022,100000000000030034,100000000000030036,100000000000030026,100000000000030051,100000000000030035,100000000000030037],\"roleCode\":\"106\",\"tips\":\"负责影院管理的角色\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (19, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-08 17:09:09', '成功', '3 & {\"madeBy\":\"SYSTEM\",\"name\":\"店小二主管\",\"permIds\":[100000000000030010,100000000000030012,100000000000030042,100000000000030043,100000000000030014,100000000000030044,100000000000030046,100000000000030018,100000000000310001,100000000000030022,100000000000030024,100000000000030026,100000000000010001,100000000000310002,100000000000030001,100000000000030011,100000000000030015,100000000000030052,100000000000310003,100000000000310004],\"roleCode\":\"103\",\"tips\":\"各个店小二的管理人\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (20, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-08 17:10:43', '成功', '5 & {\"madeBy\":\"SYSTEM\",\"name\":\"店小二\",\"permIds\":[100000000000310001,100000000000310002,100000000000030010,100000000000030012,100000000000030042,100000000000030014,100000000000030044,100000000000030046,100000000000030018,100000000000030022,100000000000030024,100000000000030026,100000000000030011,100000000000030043,100000000000030015,100000000000310003,100000000000310004],\"roleCode\":\"104\",\"tips\":\"复制广告主管理的角色\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (21, 100000000000000010, 'BUSINESS_LOG', '平台新增 广告主的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'createAdvertiser', '2020-10-08 17:15:44', '成功', '{\"assistantId\":876708082437197830,\"city\":\"北京\",\"comeFrom\":0,\"companyName\":\"水果广告有限公司\",\"contactName\":\"cary\",\"contactPhone\":\"18761398463\",\"district\":\"西城区\",\"id\":5,\"lIndustry\":\"资本市场服务\",\"mIndustry\":\"证券市场服务\",\"note\":\"123\",\"orgCode\":\"435f21997d4243c5bdfc33da034d40ee\",\"orgId\":100000000000000067,\"province\":\"北京\",\"xIndustry\":\"金融业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (22, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-08 17:17:21', '成功', '6 & {\"madeBy\":\"SYSTEM\",\"name\":\"平台管理员\",\"permIds\":[100000000000030001,100000000000030002,100000000000030003,100000000000010001,100000000000010002,100000000000010003,100000000000020001,100000000000020002,100000000000020003,100000000000030018,100000000000030019,100000000000030020,100000000000030021,100000000000030022,100000000000030023,100000000000030024,100000000000030025,100000000000310001,100000000000310002,100000000000310003,100000000000310004,100000000000030026,100000000000030027,100000000000030028,100000000000030029,100000000000030030,100000000000030031,100000000000030032,100000000000030033,100000000000030034,100000000000030035,100000000000030036,100000000000030037,100000000000030010,100000000000030012,100000000000030013,100000000000030042,100000000000030043,100000000000030014,100000000000030015,100000000000030016,100000000000030017,100000000000030044,100000000000030045,100000000000030046,100000000000030047,100000000000030048,100000000000030049,100000000000030050,100000000000030038,100000000000030039,100000000000030040,100000000000030041,100000000000011001,100000000000011002,100000000000011003],\"roleCode\":\"101\",\"tips\":\"平台管理员\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (23, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-08 17:17:31', '成功', '3 & {\"madeBy\":\"SYSTEM\",\"name\":\"店小二主管\",\"permIds\":[100000000000030010,100000000000030012,100000000000030042,100000000000030043,100000000000030014,100000000000030044,100000000000030046,100000000000030018,100000000000310001,100000000000030022,100000000000030024,100000000000030026,100000000000010001,100000000000310002,100000000000030001,100000000000030015,100000000000030052,100000000000310003,100000000000310004],\"roleCode\":\"103\",\"tips\":\"各个店小二的管理人\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (24, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-08 17:17:44', '成功', '5 & {\"madeBy\":\"SYSTEM\",\"name\":\"店小二\",\"permIds\":[100000000000310001,100000000000310002,100000000000030010,100000000000030012,100000000000030042,100000000000030014,100000000000030044,100000000000030046,100000000000030018,100000000000030022,100000000000030024,100000000000030026,100000000000030043,100000000000030015,100000000000310003,100000000000310004],\"roleCode\":\"104\",\"tips\":\"复制广告主管理的角色\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (25, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-08 17:19:05', '成功', '8 & {\"madeBy\":\"SYSTEM\",\"name\":\"广告主-审核后\",\"permIds\":[100000000000030010,100000000000030011,100000000000030012,100000000000030013,100000000000030043,100000000000030014,100000000000030045,100000000000030022,100000000000030023,100000000000030024,100000000000030025,100000000000030026,100000000000011001,100000000000030001,100000000000030002,100000000000030003,100000000000010001,100000000000010002,100000000000010003,100000000000020001,100000000000020002,100000000000020003],\"roleCode\":\"201\",\"tips\":\"广告主-审核后\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (26, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-08 17:21:59', '成功', '8 & {\"madeBy\":\"SYSTEM\",\"name\":\"广告主-审核后\",\"permIds\":[100000000000030010,100000000000030011,100000000000030012,100000000000030013,100000000000030043,100000000000030014,100000000000030045,100000000000030022,100000000000030023,100000000000030024,100000000000030025,100000000000030026,100000000000011001,100000000000030001,100000000000030002,100000000000030003,100000000000010001,100000000000010002,100000000000010003,100000000000020001,100000000000020002,100000000000020003],\"roleCode\":\"201\",\"tips\":\"广告主-审核后\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (27, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-08 17:23:46', '成功', '9 & {\"madeBy\":\"SYSTEM\",\"name\":\"影院管理人\",\"permIds\":[100000000000030018,100000000000030020,100000000000030049,100000000000030001,100000000000030002,100000000000030003,100000000000010001,100000000000010002,100000000000010003,100000000000020001,100000000000020002,100000000000020003,100000000000030026],\"roleCode\":\"301\",\"tips\":\"影院\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (28, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-08 17:24:05', '成功', '5 & {\"madeBy\":\"SYSTEM\",\"name\":\"店小二\",\"permIds\":[100000000000310001,100000000000310002,100000000000030010,100000000000030012,100000000000030042,100000000000030014,100000000000030044,100000000000030046,100000000000030018,100000000000030022,100000000000030024,100000000000030026,100000000000030043,100000000000030015,100000000000310003,100000000000310004],\"roleCode\":\"104\",\"tips\":\"复制广告主管理的角色\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (29, 100000000000000064, 'BUSINESS_LOG', 'create AdvertingMaterial的操作', 876708082437197835, '13600000001', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertingMaterialEndpoint', 'createAdvertingMaterial', '2020-10-08 17:26:00', '成功', '{\"advertiserResourceUrl\":\"http://www.baiduyun.com\",\"id\":5,\"name\":\"广告素材\",\"orgId\":100000000000000064} & ', 'AdvertingMaterial');
INSERT INTO `t_operation_log` VALUES (30, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-08 17:26:49', '成功', '6 & {\"madeBy\":\"SYSTEM\",\"name\":\"平台管理员\",\"permIds\":[100000000000030001,100000000000030002,100000000000030003,100000000000010001,100000000000010002,100000000000010003,100000000000020001,100000000000020002,100000000000020003,100000000000030018,100000000000030019,100000000000030020,100000000000030021,100000000000030022,100000000000030023,100000000000030024,100000000000030025,100000000000310001,100000000000310002,100000000000310003,100000000000310004,100000000000030026,100000000000030027,100000000000030028,100000000000030029,100000000000030030,100000000000030031,100000000000030032,100000000000030033,100000000000030034,100000000000030035,100000000000030036,100000000000030037,100000000000030010,100000000000030012,100000000000030013,100000000000030042,100000000000030043,100000000000030014,100000000000030015,100000000000030016,100000000000030017,100000000000030044,100000000000030045,100000000000030046,100000000000030047,100000000000030048,100000000000030049,100000000000030050,100000000000030038,100000000000030039,100000000000030040,100000000000030041,100000000000011001,100000000000011002,100000000000011003],\"roleCode\":\"101\",\"tips\":\"平台管理员\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (31, 100000000000000010, 'BUSINESS_LOG', '广告主审核的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'passAdvertiser', '2020-10-08 17:41:49', '成功', '4 & \"PASS\" & ', '广告主');
INSERT INTO `t_operation_log` VALUES (32, 100000000000000010, 'BUSINESS_LOG', '广告主审核的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'passAdvertiser', '2020-10-08 17:41:57', '成功', '5 & \"REFUSE\" & ', '广告主');
INSERT INTO `t_operation_log` VALUES (33, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-08 17:42:04', '成功', '5 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (34, 100000000000000010, 'BUSINESS_LOG', '平台新增 广告主的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'createAdvertiser', '2020-10-08 17:45:15', '成功', '{\"assistantId\":876708082437197830,\"city\":\"北京\",\"comeFrom\":0,\"companyName\":\"省广集团\",\"contactName\":\"jerry\",\"contactPhone\":\"18760398465\",\"district\":\"西城区\",\"id\":6,\"lIndustry\":\"石油和天然气开采业\",\"mIndustry\":\"天然气开采\",\"note\":\"123\",\"orgCode\":\"995352c4428247fbb6a13d71f6c22a60\",\"orgId\":100000000000000067,\"province\":\"北京\",\"xIndustry\":\"采矿业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (35, 100000000000000010, 'BUSINESS_LOG', '创建用户的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaUserEndpoint', 'createCinemaManager', '2020-10-09 09:42:10', '成功', '{\"account\":\" \",\"name\":\"影院管理人\",\"orgId\":100000000000000063,\"password\":\"111111\",\"phone\":\"13560126666\",\"roleIds\":[9]} & ', 'cinemaUser');
INSERT INTO `t_operation_log` VALUES (36, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197842, '13560126666', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-09 09:43:37', '成功', '3 & {\"advertingMaterialVOS\":[],\"advertingName\":\"理财广告\",\"advertiserId\":3,\"assistantId\":876708082437197830,\"budget\":0,\"cinemaAddress\":\"广州市萝岗区万达广场\",\"cinemaId\":1,\"cinemaName\":\"广州万达影城\",\"city\":\"广州\",\"contact\":\"13600000000\",\"contactName\":\"黄斯葱\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602150669000,\"duration\":\"15\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602432000000,\"id\":3,\"orgId\":100000000000000066,\"planId\":7,\"planNumber\":\"1314141036620156928\",\"planningOrderId\":5,\"releaseType\":\"BY_FILM\",\"roomNumber\":10,\"round\":6,\"status\":\"DELIVERED\",\"taskNumber\":\"1314141270494547968\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (37, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197842, '13560126666', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-09 09:43:50', '成功', '3 & {\"advertingMaterialVOS\":[],\"advertingName\":\"理财广告\",\"advertiserId\":3,\"assistantId\":876708082437197830,\"budget\":0,\"cinemaAddress\":\"广州市萝岗区万达广场\",\"cinemaId\":1,\"cinemaName\":\"广州万达影城\",\"city\":\"广州\",\"contact\":\"13600000000\",\"contactName\":\"黄斯葱\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602150669000,\"duration\":\"15\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602432000000,\"id\":3,\"orgId\":100000000000000066,\"planId\":7,\"planNumber\":\"1314141036620156928\",\"planningOrderId\":5,\"releaseType\":\"BY_FILM\",\"roomNumber\":6,\"round\":7,\"status\":\"DELIVERED\",\"taskNumber\":\"1314141270494547968\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (38, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197842, '13560126666', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-09 09:44:05', '成功', '3 & {\"advertingMaterialVOS\":[],\"advertingName\":\"理财广告\",\"advertiserId\":3,\"assistantId\":876708082437197830,\"budget\":0,\"cinemaAddress\":\"广州市萝岗区万达广场\",\"cinemaId\":1,\"cinemaName\":\"广州万达影城\",\"city\":\"广州\",\"contact\":\"13600000000\",\"contactName\":\"黄斯葱\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602150669000,\"duration\":\"15\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602432000000,\"id\":3,\"orgId\":100000000000000066,\"planId\":7,\"planNumber\":\"1314141036620156928\",\"planningOrderId\":5,\"releaseType\":\"BY_FILM\",\"roomNumber\":7,\"round\":8,\"status\":\"DELIVERED\",\"taskNumber\":\"1314141270494547968\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (39, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-09 09:47:11', '成功', '3 & {\"advertingMaterialVOS\":[],\"advertingName\":\"理财广告\",\"advertiserId\":3,\"assistantId\":876708082437197830,\"budget\":0,\"cinemaAddress\":\"广州市萝岗区万达广场\",\"cinemaId\":1,\"cinemaName\":\"广州万达影城\",\"city\":\"广州\",\"contact\":\"13600000000\",\"contactName\":\"黄斯葱\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602150669000,\"duration\":\"15\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602432000000,\"id\":3,\"orgId\":100000000000000066,\"planId\":7,\"planNumber\":\"1314141036620156928\",\"planningOrderId\":5,\"releaseType\":\"BY_FILM\",\"roomNumber\":6,\"round\":7,\"status\":\"DELIVERED\",\"taskNumber\":\"1314141270494547968\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (40, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-09 09:47:30', '成功', '3 & {\"advertingMaterialVOS\":[],\"advertingName\":\"理财广告\",\"advertiserId\":3,\"assistantId\":876708082437197830,\"budget\":0,\"cinemaAddress\":\"广州市萝岗区万达广场\",\"cinemaId\":1,\"cinemaName\":\"广州万达影城\",\"city\":\"广州\",\"contact\":\"13600000000\",\"contactName\":\"黄斯葱\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602150669000,\"duration\":\"15\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602432000000,\"id\":3,\"orgId\":100000000000000066,\"planId\":7,\"planNumber\":\"1314141036620156928\",\"planningOrderId\":5,\"releaseType\":\"BY_FILM\",\"roomNumber\":6,\"round\":7,\"status\":\"DELIVERED\",\"taskNumber\":\"1314141270494547968\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (41, 100000000000000010, 'BUSINESS_LOG', '平台新增 广告主的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'createAdvertiser', '2020-10-09 10:22:02', '成功', '{\"assistantId\":876708082437197830,\"city\":\"长春\",\"comeFrom\":0,\"companyName\":\"华为科技有限公司\",\"contactName\":\"王思\",\"contactPhone\":\"13600000022\",\"district\":\"朝阳区\",\"id\":7,\"lIndustry\":\"农业\",\"mIndustry\":\"谷物种植\",\"orgCode\":\"7a8b50afebbd4c909aa3eb5c4062467f\",\"orgId\":100000000000000068,\"province\":\"吉林\",\"xIndustry\":\"农、林、牧、渔业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (42, 100000000000000010, 'BUSINESS_LOG', '广告主审核的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'passAdvertiser', '2020-10-09 10:25:26', '成功', '7 & \"REFUSE\" & {\"advertiserId\":7,\"id\":1,\"note\":\"资料不全\",\"toStatus\":\"REFUSE\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (43, 100000000000000010, 'BUSINESS_LOG', '修改个人资料的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateInfo', '2020-10-09 10:34:00', '成功', '{\"account\":\"admin\",\"avatar\":\"\",\"birthday\":862761600000,\"createtime\":1602145057000,\"email\":\"admin10@kequandian.net\",\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197830,\"isAppUser\":0,\"name\":\"管理员\",\"passwordReset\":1,\"phone\":\"18200000003\",\"sex\":0,\"status\":1,\"version\":1} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (44, 100000000000000010, 'BUSINESS_LOG', '更新 广告主的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiser', '2020-10-09 10:51:35', '成功', '7 & {\"assistantId\":876708082437197830,\"balance\":0,\"city\":\"长春\",\"comeFrom\":0,\"companyName\":\"华为科技有限公司\",\"contactName\":\"王思\",\"contactPhone\":\"13600000022\",\"createTime\":1602210121000,\"district\":\"朝阳区\",\"id\":7,\"lIndustry\":\"农业\",\"loginTime\":1602210121000,\"mIndustry\":\"谷物种植\",\"orgId\":100000000000000068,\"province\":\"吉林\",\"status\":\"REFUSE\",\"updateTime\":1602210325000,\"xIndustry\":\"农、林、牧、渔业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (45, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-09 10:54:33', '成功', '3 & {\"advertingMaterialVOS\":[],\"advertingName\":\"理财广告\",\"advertiserId\":3,\"assistantId\":876708082437197830,\"budget\":0,\"cinemaAddress\":\"广州市萝岗区万达广场\",\"cinemaId\":1,\"cinemaName\":\"广州万达影城\",\"city\":\"广州\",\"contact\":\"13600000000\",\"contactName\":\"黄斯葱\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602150669000,\"duration\":\"15\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602432000000,\"id\":3,\"orgId\":100000000000000066,\"planId\":7,\"planNumber\":\"1314141036620156928\",\"planningOrderId\":5,\"releaseType\":\"BY_FILM\",\"reportFileName\":\"BOM单.docx\",\"reportFileUrl\":\"attachments/047a407b-7474-4a27-8227-862a8d470ffc.docx\",\"roomNumber\":7,\"round\":8,\"status\":\"TO_BE_VERIFY\",\"taskNumber\":\"1314141270494547968\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (46, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-09 11:00:45', '成功', '3 & {\"advertingMaterialVOS\":[],\"advertingName\":\"理财广告\",\"advertiserId\":3,\"assistantId\":876708082437197830,\"budget\":0,\"cinemaAddress\":\"广州市萝岗区万达广场\",\"cinemaId\":1,\"cinemaName\":\"广州万达影城\",\"city\":\"广州\",\"contact\":\"13600000000\",\"contactName\":\"黄斯葱\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602150669000,\"duration\":\"15\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602432000000,\"id\":3,\"orgId\":100000000000000066,\"planId\":7,\"planNumber\":\"1314141036620156928\",\"planningOrderId\":5,\"releaseType\":\"BY_FILM\",\"reportFileName\":\"BOM单.docx\",\"reportFileUrl\":\"attachments/047a407b-7474-4a27-8227-862a8d470ffc.docx\",\"roomNumber\":8,\"round\":6,\"status\":\"TO_BE_VERIFY\",\"taskNumber\":\"1314141270494547968\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (47, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-09 11:01:02', '成功', '3 & {\"advertingMaterialVOS\":[],\"advertingName\":\"理财广告\",\"advertiserId\":3,\"assistantId\":876708082437197830,\"budget\":0,\"cinemaAddress\":\"广州市萝岗区万达广场\",\"cinemaId\":1,\"cinemaName\":\"广州万达影城\",\"city\":\"广州\",\"contact\":\"13600000000\",\"contactName\":\"黄斯葱\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602150669000,\"duration\":\"15\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602432000000,\"id\":3,\"orgId\":100000000000000066,\"planId\":7,\"planNumber\":\"1314141036620156928\",\"planningOrderId\":5,\"releaseType\":\"BY_FILM\",\"reportFileName\":\"BOM单.docx\",\"reportFileUrl\":\"attachments/047a407b-7474-4a27-8227-862a8d470ffc.docx\",\"roomNumber\":8,\"round\":6,\"status\":\"TO_BE_VERIFY\",\"taskNumber\":\"1314141270494547968\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (48, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-09 11:05:20', '成功', '7 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (49, 100000000000000010, 'BUSINESS_LOG', '平台新增 广告主的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'createAdvertiser', '2020-10-09 11:05:37', '成功', '{\"assistantId\":876708082437197830,\"city\":\"石家庄\",\"comeFrom\":0,\"companyName\":\"华为科技有限公司\",\"contactName\":\"王思\",\"contactPhone\":\"13600000022\",\"district\":\"长安区\",\"id\":8,\"orgCode\":\"043b581a1f86479182d3ba425b72f48d\",\"orgId\":100000000000000068,\"province\":\"河北\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (50, 100000000000000010, 'BUSINESS_LOG', '广告主审核的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'passAdvertiser', '2020-10-09 11:05:43', '成功', '8 & \"REFUSE\" & {\"advertiserId\":8,\"id\":2,\"note\":\"不通过\",\"toStatus\":\"REFUSE\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (51, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-09 11:08:45', '成功', '3 & {\"advertingMaterialVOS\":[],\"advertingName\":\"理财广告\",\"advertiserId\":3,\"assistantId\":876708082437197830,\"budget\":0,\"cinemaAddress\":\"广州市萝岗区万达广场\",\"cinemaId\":1,\"cinemaName\":\"广州万达影城\",\"city\":\"广州\",\"contact\":\"13600000000\",\"contactName\":\"黄斯葱\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602150669000,\"duration\":\"15\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602432000000,\"id\":3,\"orgId\":100000000000000066,\"planId\":7,\"planNumber\":\"1314141036620156928\",\"planningOrderId\":5,\"releaseType\":\"BY_FILM\",\"reportFileName\":\"BOM单.docx\",\"reportFileUrl\":\"attachments/047a407b-7474-4a27-8227-862a8d470ffc.docx\",\"roomNumber\":8,\"round\":8,\"status\":\"TO_BE_VERIFY\",\"taskNumber\":\"1314141270494547968\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (52, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-09 11:08:57', '成功', '3 & {\"advertingMaterialVOS\":[],\"advertingName\":\"理财广告\",\"advertiserId\":3,\"assistantId\":876708082437197830,\"budget\":0,\"cinemaAddress\":\"广州市萝岗区万达广场\",\"cinemaId\":1,\"cinemaName\":\"广州万达影城\",\"city\":\"广州\",\"contact\":\"13600000000\",\"contactName\":\"黄斯葱\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602150669000,\"duration\":\"15\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602432000000,\"id\":3,\"orgId\":100000000000000066,\"planId\":7,\"planNumber\":\"1314141036620156928\",\"planningOrderId\":5,\"releaseType\":\"BY_FILM\",\"reportFileName\":\"BOM单.docx\",\"reportFileUrl\":\"attachments/047a407b-7474-4a27-8227-862a8d470ffc.docx\",\"roomNumber\":6,\"round\":7,\"status\":\"TO_BE_VERIFY\",\"taskNumber\":\"1314141270494547968\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (53, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-09 11:10:26', '成功', '3 & {\"advertingMaterialVOS\":[],\"advertingName\":\"理财广告\",\"advertiserId\":3,\"assistantId\":876708082437197830,\"budget\":0,\"cinemaAddress\":\"广州市萝岗区万达广场\",\"cinemaId\":1,\"cinemaName\":\"广州万达影城\",\"city\":\"广州\",\"contact\":\"13600000000\",\"contactName\":\"黄斯葱\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602150669000,\"duration\":\"15\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602432000000,\"id\":3,\"orgId\":100000000000000066,\"planId\":7,\"planNumber\":\"1314141036620156928\",\"planningOrderId\":5,\"releaseType\":\"BY_FILM\",\"reportFileName\":\"BOM单.docx\",\"reportFileUrl\":\"attachments/047a407b-7474-4a27-8227-862a8d470ffc.docx\",\"roomNumber\":7,\"round\":8,\"status\":\"TO_BE_VERIFY\",\"taskNumber\":\"1314141270494547968\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (54, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-09 11:12:47', '成功', '3 & {\"advertingMaterialVOS\":[],\"advertingName\":\"理财广告\",\"advertiserId\":3,\"assistantId\":876708082437197830,\"budget\":0,\"cinemaAddress\":\"广州市萝岗区万达广场\",\"cinemaId\":1,\"cinemaName\":\"广州万达影城\",\"city\":\"广州\",\"contact\":\"13600000000\",\"contactName\":\"黄斯葱\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602150669000,\"duration\":\"15\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602432000000,\"id\":3,\"orgId\":100000000000000066,\"planId\":7,\"planNumber\":\"1314141036620156928\",\"planningOrderId\":5,\"releaseType\":\"BY_FILM\",\"reportFileName\":\"BOM单.docx\",\"reportFileUrl\":\"attachments/047a407b-7474-4a27-8227-862a8d470ffc.docx\",\"roomNumber\":7,\"round\":8,\"status\":\"TO_BE_VERIFY\",\"taskNumber\":\"1314141270494547968\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (55, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197842, '13560126666', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-09 11:27:26', '成功', '3 & {\"advertingMaterialVOS\":[],\"advertingName\":\"理财广告\",\"advertiserId\":3,\"assistantId\":876708082437197830,\"budget\":0,\"cinemaAddress\":\"广州市萝岗区万达广场\",\"cinemaId\":1,\"cinemaName\":\"广州万达影城\",\"city\":\"广州\",\"contact\":\"13600000000\",\"contactName\":\"黄斯葱\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602150669000,\"duration\":\"15\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602432000000,\"id\":3,\"orgId\":100000000000000066,\"planId\":7,\"planNumber\":\"1314141036620156928\",\"planningOrderId\":5,\"releaseType\":\"BY_FILM\",\"reportFileName\":\"BOM单.docx\",\"reportFileUrl\":\"attachments/047a407b-7474-4a27-8227-862a8d470ffc.docx\",\"roomNumber\":7,\"round\":8,\"status\":\"TO_BE_VERIFY\",\"taskNumber\":\"1314141270494547968\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (56, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-09 11:29:45', '成功', '3 & {\"advertingMaterialVOS\":[],\"advertingName\":\"理财广告\",\"advertiserId\":3,\"assistantId\":876708082437197830,\"budget\":0,\"cinemaAddress\":\"广州市萝岗区万达广场\",\"cinemaId\":1,\"cinemaName\":\"广州万达影城\",\"city\":\"广州\",\"contact\":\"13600000000\",\"contactName\":\"黄斯葱\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602150669000,\"duration\":\"15\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602432000000,\"id\":3,\"orgId\":100000000000000066,\"planId\":7,\"planNumber\":\"1314141036620156928\",\"planningOrderId\":5,\"releaseType\":\"BY_FILM\",\"reportFileName\":\"BOM单.docx\",\"reportFileUrl\":\"attachments/047a407b-7474-4a27-8227-862a8d470ffc.docx\",\"roomNumber\":7,\"round\":6,\"status\":\"TO_BE_VERIFY\",\"taskNumber\":\"1314141270494547968\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (57, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-09 11:31:11', '成功', '3 & {\"advertingMaterialVOS\":[],\"advertingName\":\"理财广告\",\"advertiserId\":3,\"assistantId\":876708082437197830,\"budget\":0,\"cinemaAddress\":\"广州市萝岗区万达广场\",\"cinemaId\":1,\"cinemaName\":\"广州万达影城\",\"city\":\"广州\",\"contact\":\"13600000000\",\"contactName\":\"黄斯葱\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602150669000,\"duration\":\"15\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602432000000,\"id\":3,\"orgId\":100000000000000066,\"planId\":7,\"planNumber\":\"1314141036620156928\",\"planningOrderId\":5,\"releaseType\":\"BY_FILM\",\"reportFileName\":\"BOM单.docx\",\"reportFileUrl\":\"attachments/047a407b-7474-4a27-8227-862a8d470ffc.docx\",\"roomNumber\":8,\"round\":8,\"status\":\"TO_BE_VERIFY\",\"taskNumber\":\"1314141270494547968\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (58, 100000000000000069, 'BUSINESS_LOG', '广告主修改自身信息的操作', 876708082437197846, '13660123456', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiserSelf', '2020-10-09 11:43:05', '成功', '{\"assistantId\":0,\"balance\":0,\"city\":\"广州\",\"comeFrom\":1,\"companyName\":\"广州本田汽车\",\"contactPhone\":\"13660123456\",\"createTime\":1602214863000,\"district\":\"南沙区\",\"id\":9,\"loginTime\":1602214863000,\"orgId\":100000000000000069,\"province\":\"广东\",\"status\":\"PENDING_APPROVAL\",\"updateTime\":1602214863000} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (59, 100000000000000010, 'BUSINESS_LOG', '广告主审核的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'passAdvertiser', '2020-10-09 11:47:19', '成功', '9 & \"PASS\" & {\"advertiserId\":9,\"id\":3,\"status\":\"PASS\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (60, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-09 12:11:14', '成功', '3 & {\"advertingMaterialVOS\":[],\"advertingName\":\"理财广告\",\"advertiserId\":3,\"assistantId\":876708082437197830,\"budget\":0,\"cinemaAddress\":\"广州市萝岗区万达广场\",\"cinemaId\":1,\"cinemaName\":\"广州万达影城\",\"city\":\"广州\",\"contact\":\"13600000000\",\"contactName\":\"黄斯葱\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602150669000,\"duration\":\"15\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602432000000,\"id\":3,\"orgId\":100000000000000066,\"planId\":7,\"planNumber\":\"1314141036620156928\",\"planningOrderId\":5,\"releaseType\":\"BY_FILM\",\"reportFileName\":\"BOM单.docx\",\"reportFileUrl\":\"attachments/047a407b-7474-4a27-8227-862a8d470ffc.docx\",\"roomNumber\":8,\"round\":8,\"status\":\"TO_BE_VERIFY\",\"taskNumber\":\"1314141270494547968\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (61, 100000000000000010, 'BUSINESS_LOG', 'create BillingStrategy的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.BillingStrategyEndpoint', 'createBillingStrategy', '2020-10-09 12:13:01', '成功', '{\"boxOffice\":\"MORE_THAN_FIFTEEN_MILLION\",\"cityLevel\":\"TIER_1_CITY\",\"id\":1,\"name\":\"预算\",\"price\":300,\"releaseType\":\"BY_FILM\",\"retailPrice\":300,\"timeSlot\":\"IN_ONE_MINUTE\"} & ', 'BillingStrategy');
INSERT INTO `t_operation_log` VALUES (62, 100000000000000010, 'BUSINESS_LOG', 'update BillingStrategy的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.BillingStrategyEndpoint', 'updateBillingStrategy', '2020-10-09 12:13:16', '成功', '1 & {\"boxOffice\":\"MORE_THAN_FIFTEEN_MILLION\",\"cityLevel\":\"TIER_1_CITY\",\"createTime\":1602216780000,\"id\":1,\"name\":\"影片\",\"price\":300,\"releaseType\":\"BY_FILM\",\"retailPrice\":300,\"timeSlot\":\"IN_ONE_MINUTE\"} & ', 'BillingStrategy');
INSERT INTO `t_operation_log` VALUES (63, 100000000000000010, 'BUSINESS_LOG', 'create BillingStrategy的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.BillingStrategyEndpoint', 'createBillingStrategy', '2020-10-09 12:13:32', '成功', '{\"boxOffice\":\"MORE_THAN_FIFTEEN_MILLION\",\"cityLevel\":\"TIER_1_CITY\",\"id\":2,\"name\":\"场次\",\"price\":350,\"releaseType\":\"BY_ROUNDS\",\"retailPrice\":350,\"timeSlot\":\"IN_ONE_MINUTE\"} & ', 'BillingStrategy');
INSERT INTO `t_operation_log` VALUES (64, 100000000000000010, 'BUSINESS_LOG', '增加子组织的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.org.api.crud.OrgEndpoint', 'createNodeChildren', '2020-10-09 12:14:25', '成功', '100000000000000010 & {\"bType\":\"SYSTEM\",\"createTime\":1602216865321,\"id\":100000000000000070,\"leftNum\":27,\"name\":\"财务部\",\"nodeLevel\":3,\"orgCode\":\"CW2002\",\"orgType\":4,\"pid\":100000000000000010,\"rightNum\":28,\"status\":\"NORMAL\",\"updateTime\":1602216865321} & ', '组织');
INSERT INTO `t_operation_log` VALUES (65, 100000000000000010, 'BUSINESS_LOG', '更新组织的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.org.api.crud.OrgEndpoint', 'updateNode', '2020-10-09 12:14:59', '成功', '100000000000000070 & {\"bType\":\"SYSTEM\",\"createTime\":1602216865000,\"id\":100000000000000070,\"leftNum\":27,\"name\":\"客服部\",\"nodeLevel\":3,\"orgCode\":\"CW2002\",\"orgType\":4,\"pid\":100000000000000010,\"rightNum\":28,\"status\":\"NORMAL\",\"updateTime\":1602216865000} & ', '组织');
INSERT INTO `t_operation_log` VALUES (66, 100000000000000010, 'BUSINESS_LOG', '创建用户的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaUserEndpoint', 'createCinemaManager', '2020-10-09 12:20:01', '成功', '{\"account\":\" \",\"name\":\"客服部主管\",\"orgId\":100000000000000070,\"password\":\"111111\",\"phone\":\"13560126555\",\"roleIds\":[2]} & ', 'cinemaUser');
INSERT INTO `t_operation_log` VALUES (67, 100000000000000010, 'BUSINESS_LOG', '创建用户的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaUserEndpoint', 'createCinemaManager', '2020-10-09 12:21:08', '成功', '{\"account\":\" \",\"name\":\"S-店小二2号\",\"orgId\":100000000000000063,\"password\":\"111111\",\"phone\":\"15800254850\",\"roleIds\":[5]} & ', 'cinemaUser');
INSERT INTO `t_operation_log` VALUES (68, 100000000000000071, 'BUSINESS_LOG', '广告主修改自身信息的操作', 876708082437197849, '15019975480', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiserSelf', '2020-10-09 13:57:52', '成功', '{\"assistantId\":0,\"balance\":0,\"businessLicenseProve\":\"attachments/16ec3b2b-7853-46e1-a397-e95f2ba2574d.jpg\",\"city\":\"天津\",\"comeFrom\":1,\"companyName\":\"天津医药\",\"contactPhone\":\"15019975480\",\"createTime\":1602222868000,\"district\":\"和平区\",\"id\":10,\"loginTime\":1602222868000,\"orgId\":100000000000000071,\"province\":\"天津\",\"status\":\"PENDING_APPROVAL\",\"updateTime\":1602222868000} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (69, 100000000000000010, 'BUSINESS_LOG', 'create Cinema的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'createCinema', '2020-10-09 14:12:33', '成功', '{\"assistantId\":876708082437197837,\"city\":\"广州\",\"cityLevel\":\"一线\",\"contact\":\"13143376825\",\"contactName\":\"Hdij\",\"district\":\"越秀区\",\"id\":2,\"lineId\":7,\"lineName\":\"广州金逸珠江\",\"name\":\"广州飞影电影城\",\"orgCode\":\"fe05e74702b94661b878a2fdff719362\",\"orgId\":100000000000000072,\"province\":\"广东\",\"qualificationNumber\":\"1000101\",\"roomNumber\":8,\"seatNumber\":600} & ', 'Cinema');
INSERT INTO `t_operation_log` VALUES (70, 100000000000000010, 'BUSINESS_LOG', '创建用户的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaUserEndpoint', 'createCinemaManager', '2020-10-09 14:18:45', '成功', '{\"account\":\" \",\"name\":\"商务部店小二主管\",\"orgId\":100000000000000063,\"password\":\"111111\",\"phone\":\"13560126655\",\"roleIds\":[3]} & ', 'cinemaUser');
INSERT INTO `t_operation_log` VALUES (71, 100000000000000010, 'BUSINESS_LOG', '修改个人资料的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateInfo', '2020-10-09 14:19:28', '成功', '{\"account\":\"13560126667\",\"createtime\":1602145990000,\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197836,\"isAppUser\":0,\"name\":\"S-店小二er\",\"passwordReset\":0,\"phone\":\"13560126667\",\"sex\":0,\"status\":1,\"tenantOrgId\":100000000000000010} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (72, 100000000000000010, 'BUSINESS_LOG', '修改个人资料的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateInfo', '2020-10-09 14:19:48', '成功', '{\"account\":\"13560126667\",\"createtime\":1602145990000,\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197836,\"isAppUser\":0,\"name\":\"S-店小er\",\"passwordReset\":0,\"phone\":\"13560126667\",\"status\":1,\"tenantOrgId\":100000000000000010} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (73, 100000000000000010, 'BUSINESS_LOG', '修改个人资料的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateInfo', '2020-10-09 14:20:39', '成功', '{\"account\":\"13560126667\",\"createtime\":1602145990000,\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197836,\"isAppUser\":0,\"name\":\"S-店小二\",\"passwordReset\":0,\"phone\":\"13560126667\",\"status\":1,\"tenantOrgId\":100000000000000010} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (74, 100000000000000010, 'BUSINESS_LOG', '修改个人资料的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateInfo', '2020-10-09 14:21:21', '成功', '{\"account\":\"13560126667\",\"createtime\":1602145990000,\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197836,\"isAppUser\":0,\"name\":\"S-店小二2\",\"passwordReset\":0,\"phone\":\"13560126667\",\"status\":1,\"tenantOrgId\":100000000000000010} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (75, 100000000000000073, 'BUSINESS_LOG', '广告主修改自身信息的操作', 876708082437197852, '13422212814', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiserSelf', '2020-10-09 14:28:02', '成功', '{\"assistantId\":0,\"balance\":0,\"businessLicenseProve\":\"attachments/6d2193ae-cadf-4a29-ae0c-1ab7bc38d107.png\",\"city\":\"广州\",\"comeFrom\":1,\"companyName\":\"水果广告有限公司\",\"contactPhone\":\"13422212814\",\"createTime\":1602224835000,\"district\":\"越秀区\",\"id\":11,\"loginTime\":1602224835000,\"orgId\":100000000000000073,\"province\":\"广东\",\"status\":\"PENDING_APPROVAL\",\"updateTime\":1602224835000} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (76, 100000000000000010, 'BUSINESS_LOG', '更新 广告主的操作', 876708082437197851, '13560126655', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiser', '2020-10-09 14:29:54', '成功', '11 & {\"assistantId\":876708082437197848,\"balance\":0,\"businessLicenseProve\":\"attachments/6d2193ae-cadf-4a29-ae0c-1ab7bc38d107.png\",\"city\":\"广州\",\"comeFrom\":1,\"companyName\":\"水果广告有限公司\",\"contactName\":\"谢老板\",\"contactPhone\":\"13422212814\",\"createTime\":1602224835000,\"district\":\"越秀区\",\"id\":11,\"loginTime\":1602224835000,\"orgId\":100000000000000073,\"province\":\"广东\",\"status\":\"PENDING_APPROVAL\",\"updateTime\":1602224974000} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (77, 100000000000000010, 'BUSINESS_LOG', '创建用户的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaUserEndpoint', 'createCinemaManager', '2020-10-09 14:32:45', '成功', '{\"account\":\" \",\"name\":\"客服部店小二主管\",\"orgId\":100000000000000070,\"password\":\"111111\",\"phone\":\"13560125555\",\"roleIds\":[3]} & ', 'cinemaUser');
INSERT INTO `t_operation_log` VALUES (78, 100000000000000010, 'BUSINESS_LOG', '修改个人资料的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateInfo', '2020-10-09 14:34:33', '成功', '{\"account\":\"13560126667\",\"createtime\":1602145990000,\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197836,\"isAppUser\":0,\"name\":\"S-店小二2\",\"passwordReset\":0,\"phone\":\"13560126667\",\"status\":1,\"tenantOrgId\":100000000000000010} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (79, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-09 14:34:57', '成功', '10 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (80, 100000000000000010, 'BUSINESS_LOG', '修改用户的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateUser', '2020-10-09 14:36:43', '成功', '876708082437197836 & {\"account\":\"13560126667\",\"bUserType\":\"SYSTEM\",\"createtime\":1602145990000,\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197836,\"isAppUser\":0,\"name\":\"S-店小二\",\"orgId\":100000000000000063,\"password\":\"f6127fd3b307e1c54ba7d513f33b5e1a\",\"passwordReset\":0,\"phone\":\"13560126667\",\"roleIds\":[5],\"salt\":\"6kbb2\",\"status\":1,\"tenantOrgId\":100000000000000010,\"userType\":2} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (81, 100000000000000010, 'BUSINESS_LOG', '广告主审核的操作', 876708082437197851, '13560126655', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'passAdvertiser', '2020-10-09 14:38:12', '成功', '11 & \"PASS\" & {\"advertiserId\":11,\"id\":4,\"status\":\"PASS\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (82, 100000000000000074, 'BUSINESS_LOG', '广告主修改自身信息的操作', 876708082437197854, '13698566698', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiserSelf', '2020-10-09 14:50:27', '成功', '{\"assistantId\":0,\"balance\":0,\"businessLicenseProve\":\"attachments/88344416-ffff-44b3-aef4-3eb72cc2e1ac.png\",\"comeFrom\":1,\"companyName\":\"广告主1号有限公司\",\"contactPhone\":\"13698566698\",\"createTime\":1602226186000,\"id\":12,\"loginTime\":1602226186000,\"orgId\":100000000000000074,\"status\":\"PENDING_APPROVAL\",\"updateTime\":1602226186000} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (83, 100000000000000010, 'BUSINESS_LOG', '更新组织的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.org.api.crud.OrgEndpoint', 'updateNode', '2020-10-09 14:51:30', '成功', '100000000000000063 & {\"bType\":\"SYSTEM\",\"createTime\":1602145705000,\"id\":100000000000000063,\"leftNum\":31,\"name\":\"财物部\",\"nodeLevel\":3,\"orgCode\":\"SW1001\",\"orgType\":4,\"pid\":100000000000000010,\"rightNum\":32,\"status\":\"NORMAL\",\"updateTime\":1602226186000} & ', '组织');
INSERT INTO `t_operation_log` VALUES (84, 100000000000000010, 'BUSINESS_LOG', '更新组织的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.org.api.crud.OrgEndpoint', 'updateNode', '2020-10-09 14:52:31', '成功', '100000000000000063 & {\"bType\":\"SYSTEM\",\"createTime\":1602145705000,\"id\":100000000000000063,\"leftNum\":31,\"name\":\"销售部\",\"nodeLevel\":3,\"orgCode\":\"SW1001\",\"orgType\":4,\"pid\":100000000000000010,\"rightNum\":32,\"status\":\"NORMAL\",\"updateTime\":1602226186000} & ', '组织');
INSERT INTO `t_operation_log` VALUES (85, 100000000000000010, 'BUSINESS_LOG', '增加子组织的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.org.api.crud.OrgEndpoint', 'createNodeChildren', '2020-10-09 14:53:06', '成功', '100000000000000010 & {\"bType\":\"SYSTEM\",\"createTime\":1602226385560,\"id\":100000000000000075,\"leftNum\":35,\"name\":\"商务部\",\"nodeLevel\":3,\"orgType\":4,\"pid\":100000000000000010,\"rightNum\":36,\"status\":\"NORMAL\",\"updateTime\":1602226385560} & ', '组织');
INSERT INTO `t_operation_log` VALUES (86, 100000000000000010, 'BUSINESS_LOG', '修改用户的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateUser', '2020-10-09 14:53:19', '成功', '876708082437197837 & {\"account\":\"13560126665\",\"bUserType\":\"SYSTEM\",\"createtime\":1602146023000,\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197837,\"isAppUser\":0,\"name\":\"商务部主管\",\"orgId\":100000000000000075,\"password\":\"94fe8c2629062f7512a45fdb7f374b6b\",\"passwordReset\":0,\"phone\":\"13560126665\",\"roleIds\":[2],\"salt\":\"4cbvw\",\"status\":1,\"tenantOrgId\":100000000000000010,\"userType\":3} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (87, 100000000000000010, 'BUSINESS_LOG', '修改用户的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateUser', '2020-10-09 14:53:49', '成功', '876708082437197837 & {\"account\":\"13560126665\",\"bUserType\":\"SYSTEM\",\"createtime\":1602146023000,\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197837,\"isAppUser\":0,\"name\":\"商务部主管\",\"orgId\":100000000000000010,\"password\":\"94fe8c2629062f7512a45fdb7f374b6b\",\"passwordReset\":0,\"phone\":\"13560126665\",\"roleIds\":[2],\"salt\":\"4cbvw\",\"status\":1,\"tenantOrgId\":100000000000000010,\"userType\":3} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (88, 100000000000000010, 'BUSINESS_LOG', '删除组织的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.org.api.crud.OrgEndpoint', 'deleteNode', '2020-10-09 14:54:15', '成功', '100000000000000075 & ', '组织');
INSERT INTO `t_operation_log` VALUES (89, 100000000000000010, 'BUSINESS_LOG', '增加子组织的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.org.api.crud.OrgEndpoint', 'createNodeChildren', '2020-10-09 15:00:05', '成功', '100000000000000010 & {\"bType\":\"SYSTEM\",\"createTime\":1602226804480,\"id\":100000000000000075,\"leftNum\":35,\"name\":\"商务部\",\"nodeLevel\":3,\"orgType\":4,\"pid\":100000000000000010,\"rightNum\":36,\"status\":\"NORMAL\",\"updateTime\":1602226804480} & ', '组织');
INSERT INTO `t_operation_log` VALUES (90, 100000000000000010, 'BUSINESS_LOG', '修改用户的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateUser', '2020-10-09 15:00:22', '成功', '876708082437197837 & {\"account\":\"13560126665\",\"bUserType\":\"SYSTEM\",\"createtime\":1602146023000,\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197837,\"isAppUser\":0,\"name\":\"商务部主管\",\"orgId\":100000000000000075,\"password\":\"94fe8c2629062f7512a45fdb7f374b6b\",\"passwordReset\":0,\"phone\":\"13560126665\",\"roleIds\":[2],\"salt\":\"4cbvw\",\"status\":1,\"tenantOrgId\":100000000000000010,\"userType\":3} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (91, 100000000000000010, 'BUSINESS_LOG', '修改用户的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateUser', '2020-10-09 15:00:44', '成功', '876708082437197851 & {\"account\":\"13560126655\",\"bUserType\":\"SYSTEM\",\"createtime\":1602224325000,\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197851,\"isAppUser\":0,\"name\":\"销售部店小二主管\",\"orgId\":100000000000000063,\"password\":\"9f264d84c9ce003fce5fa6731559a470\",\"passwordReset\":0,\"phone\":\"13560126655\",\"roleIds\":[3],\"salt\":\"f7dhp\",\"status\":1,\"tenantOrgId\":100000000000000010,\"userType\":3} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (92, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-09 15:04:37', '成功', '4 & {\"madeBy\":\"SYSTEM\",\"name\":\"商务\",\"permIds\":[100000000000030010,100000000000030018,100000000000030020,100000000000030047,100000000000030048,100000000000030050,100000000000030022,100000000000030034,100000000000030036,100000000000030026,100000000000030051,100000000000030035,100000000000030037],\"roleCode\":\"106\",\"tips\":\"负责影院管理的角色\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (93, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-09 15:04:56', '成功', '2 & {\"madeBy\":\"SYSTEM\",\"name\":\"商务主管\",\"permIds\":[100000000000030010,100000000000030018,100000000000030020,100000000000030048,100000000000030050,100000000000030047,100000000000030022,100000000000030026,100000000000010001,100000000000030001,100000000000030051,100000000000030034,100000000000030035,100000000000030036,100000000000030037,100000000000030053],\"roleCode\":\"105\",\"tips\":\"各个商务的管理人\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (94, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-09 15:17:08', '成功', '2 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (95, 100000000000000010, 'BUSINESS_LOG', '平台新增 广告主的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'createAdvertiser', '2020-10-09 16:11:07', '成功', '{\"assistantId\":876708082437197830,\"city\":\"上海\",\"comeFrom\":0,\"companyName\":\"搜狗电脑公司\",\"contactName\":\"sougou\",\"contactPhone\":\"13800138003\",\"district\":\"徐汇区\",\"id\":13,\"lIndustry\":\"互联网和相关服务\",\"mIndustry\":\"互联网信息服务\",\"note\":\"互联网公司\",\"orgCode\":\"46f1be85d41343d59040e199f44de5e7\",\"orgId\":100000000000000076,\"province\":\"上海\",\"xIndustry\":\"信息传输、软件和信息技术服务业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (96, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-09 16:13:07', '成功', '13 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (97, 100000000000000010, 'BUSINESS_LOG', '平台新增 广告主的操作', 876708082437197848, '15800254850', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'createAdvertiser', '2020-10-09 16:13:13', '成功', '{\"assistantId\":876708082437197848,\"city\":\"北京\",\"comeFrom\":0,\"companyName\":\"饮料有限公司\",\"contactName\":\"李四\",\"contactPhone\":\"13560123363\",\"district\":\"东城区\",\"id\":14,\"lIndustry\":\"酒、饮料和精制茶制造业\",\"mIndustry\":\"饮料制造\",\"orgCode\":\"57869de972144c89b85f769583c410ff\",\"orgId\":100000000000000076,\"province\":\"北京\",\"xIndustry\":\"制造业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (98, 100000000000000010, 'BUSINESS_LOG', '平台新增 广告主的操作', 876708082437197851, '13560126655', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'createAdvertiser', '2020-10-09 16:14:16', '成功', '{\"assistantId\":876708082437197851,\"city\":\"上海\",\"comeFrom\":0,\"companyName\":\"搜狗电脑公司\",\"contactName\":\"sougou\",\"contactPhone\":\"13800138003\",\"district\":\"黄浦区\",\"id\":15,\"lIndustry\":\"互联网和相关服务\",\"mIndustry\":\"互联网信息服务\",\"note\":\"互联网服务行业\",\"orgCode\":\"025aa47d5de64351b09141814b08b81e\",\"orgId\":100000000000000077,\"province\":\"上海\",\"xIndustry\":\"信息传输、软件和信息技术服务业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (99, 100000000000000010, 'BUSINESS_LOG', '广告主审核的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'passAdvertiser', '2020-10-09 16:15:11', '成功', '15 & \"PASS\" & {\"advertiserId\":15,\"id\":5,\"status\":\"PASS\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (100, 100000000000000010, 'BUSINESS_LOG', '平台新增 广告主的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'createAdvertiser', '2020-10-09 16:20:38', '成功', '{\"assistantId\":876708082437197830,\"comeFrom\":0,\"companyName\":\"测试翻页效果\",\"contactPhone\":\"13122223333\",\"id\":16,\"orgCode\":\"840db2bd3cc94935b4ce6f733421c229\",\"orgId\":100000000000000078} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (101, 100000000000000010, 'BUSINESS_LOG', '修改个人资料的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateInfo', '2020-10-09 16:27:43', '成功', '{\"account\":\"admin\",\"avatar\":\"[]\",\"birthday\":862761600000,\"createtime\":1602145057000,\"email\":\"admin10@kequandian.net\",\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197830,\"isAppUser\":0,\"name\":\"管理员\",\"passwordReset\":1,\"phone\":\"18200000003\",\"sex\":0,\"status\":1,\"version\":1} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (102, 100000000000000077, 'BUSINESS_LOG', 'create AdvertingMaterial的操作', 876708082437197857, '13800138003', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertingMaterialEndpoint', 'createAdvertingMaterial', '2020-10-09 16:33:43', '成功', '{\"advertiserResourceUrl\":\"http://www.baiduyun.com\",\"id\":6,\"name\":\"广告\",\"orgId\":100000000000000077} & ', 'AdvertingMaterial');
INSERT INTO `t_operation_log` VALUES (103, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-09 16:37:13', '成功', '3 & {\"advertingMaterialVOS\":[],\"advertingName\":\"理财广告\",\"advertiserId\":3,\"assistantId\":876708082437197830,\"budget\":0,\"cinemaAddress\":\"广州市萝岗区万达广场\",\"cinemaId\":1,\"cinemaName\":\"广州万达影城\",\"city\":\"广州\",\"contact\":\"13600000000\",\"contactName\":\"黄斯葱\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602150669000,\"duration\":\"15\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602432000000,\"id\":3,\"orgId\":100000000000000066,\"planId\":7,\"planNumber\":\"1314141036620156928\",\"planningOrderId\":5,\"releaseType\":\"BY_FILM\",\"reportFileName\":\"BOM单.docx\",\"reportFileUrl\":\"attachments/047a407b-7474-4a27-8227-862a8d470ffc.docx\",\"roomNumber\":7,\"round\":7,\"status\":\"REJECTED\",\"taskNumber\":\"1314141270494547968\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (104, 100000000000000073, 'BUSINESS_LOG', 'create AdvertingMaterial的操作', 876708082437197852, '13422212814', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertingMaterialEndpoint', 'createAdvertingMaterial', '2020-10-09 17:12:37', '成功', '{\"advertiserResourceUrl\":\"http://www.baiduyun.com\",\"id\":7,\"name\":\"广告\",\"orgId\":100000000000000073} & ', 'AdvertingMaterial');
INSERT INTO `t_operation_log` VALUES (105, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-09 18:25:24', '成功', '5 & {\"advertingMaterialVOS\":[],\"advertingName\":\"中文\",\"advertiserId\":15,\"assistantId\":876708082437197837,\"budget\":0,\"cinemaId\":2,\"cinemaName\":\"广州飞影电影城\",\"city\":\"广州\",\"contact\":\"13143376825\",\"contactName\":\"Hdij\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602236178000,\"duration\":\"45\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602518400000,\"id\":5,\"orgId\":100000000000000072,\"planId\":20,\"planNumber\":\"1314499228562755584\",\"planningOrderId\":7,\"releaseType\":\"BY_FILM\",\"roomNumber\":6,\"round\":6,\"status\":\"TO_BE_DELIVER\",\"taskNumber\":\"1314499924058050560\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (106, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-09 18:27:47', '成功', '5 & {\"advertingMaterialVOS\":[],\"advertingName\":\"中文\",\"advertiserId\":15,\"assistantId\":876708082437197837,\"budget\":0,\"cinemaId\":2,\"cinemaName\":\"广州飞影电影城\",\"city\":\"广州\",\"contact\":\"13143376825\",\"contactName\":\"Hdij\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602236178000,\"duration\":\"45\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602518400000,\"id\":5,\"orgId\":100000000000000072,\"planId\":20,\"planNumber\":\"1314499228562755584\",\"planningOrderId\":7,\"releaseType\":\"BY_FILM\",\"roomNumber\":6,\"round\":6,\"status\":\"TO_BE_DELIVER\",\"taskNumber\":\"1314499924058050560\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (107, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-09 18:28:21', '成功', '5 & {\"advertingMaterialVOS\":[],\"advertingName\":\"中文\",\"advertiserId\":15,\"assistantId\":876708082437197837,\"budget\":0,\"cinemaId\":2,\"cinemaName\":\"广州飞影电影城\",\"city\":\"广州\",\"contact\":\"13143376825\",\"contactName\":\"Hdij\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602236178000,\"duration\":\"45\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602518400000,\"id\":5,\"orgId\":100000000000000072,\"planId\":20,\"planNumber\":\"1314499228562755584\",\"planningOrderId\":7,\"releaseType\":\"BY_FILM\",\"roomNumber\":6,\"round\":6,\"status\":\"TO_BE_DELIVER\",\"taskNumber\":\"1314499924058050560\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (108, 100000000000000010, 'BUSINESS_LOG', 'update Cinema的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'updateCinema', '2020-10-09 19:15:10', '成功', '2 & {\"assistantId\":876708082437197837,\"city\":\"广州\",\"cityLevel\":\"一线\",\"contact\":\"13143376825\",\"contactName\":\"Hdij\",\"createTime\":1602223952000,\"district\":\"越秀区\",\"id\":2,\"lineId\":7,\"lineName\":\"广州金逸珠江\",\"name\":\"广州飞影电影城\",\"orgId\":100000000000000072,\"province\":\"广东\",\"qualificationNumber\":\"1000101\",\"roomNumber\":12,\"seatNumber\":600,\"ticket\":0,\"updateTime\":1602223952000} & ', 'Cinema');
INSERT INTO `t_operation_log` VALUES (109, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-09 19:16:44', '成功', '6 & {\"advertingMaterialVOS\":[],\"advertingName\":\"广告\",\"advertiserId\":15,\"assistantId\":876708082437197837,\"budget\":0,\"cinemaId\":2,\"cinemaName\":\"广州飞影电影城\",\"city\":\"广州\",\"contact\":\"13143376825\",\"contactName\":\"Hdij\",\"createTime\":1602242124000,\"duration\":\"15\",\"filmEndDate\":1603382400000,\"filmStartDate\":1603209600000,\"id\":6,\"orgId\":100000000000000072,\"planId\":21,\"planNumber\":\"1314524161200230400\",\"planningOrderId\":8,\"releaseType\":\"BY_ROUNDS\",\"reportFileName\":\"BOM单.docx\",\"reportFileUrl\":\"/attachments/6ee8d7ab-19d8-499c-ab34-acbe4ad824d4.docx\",\"roomNumber\":12,\"round\":6,\"status\":\"TO_BE_VERIFY\",\"taskNumber\":\"1314524860482981888\",\"timeSlot\":\"AFTER_THREE_MINUTES\",\"type\":\"SCENES\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (110, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-09 19:16:48', '成功', '6 & {\"advertingMaterialVOS\":[],\"advertingName\":\"广告\",\"advertiserId\":15,\"assistantId\":876708082437197837,\"budget\":0,\"cinemaId\":2,\"cinemaName\":\"广州飞影电影城\",\"city\":\"广州\",\"contact\":\"13143376825\",\"contactName\":\"Hdij\",\"createTime\":1602242124000,\"duration\":\"15\",\"filmEndDate\":1603382400000,\"filmStartDate\":1603209600000,\"id\":6,\"orgId\":100000000000000072,\"planId\":21,\"planNumber\":\"1314524161200230400\",\"planningOrderId\":8,\"releaseType\":\"BY_ROUNDS\",\"reportFileName\":\"BOM单.docx\",\"reportFileUrl\":\"/attachments/6ee8d7ab-19d8-499c-ab34-acbe4ad824d4.docx\",\"roomNumber\":13,\"round\":6,\"status\":\"TO_BE_VERIFY\",\"taskNumber\":\"1314524860482981888\",\"timeSlot\":\"AFTER_THREE_MINUTES\",\"type\":\"SCENES\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (111, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-09 19:19:26', '成功', '4 & {\"madeBy\":\"SYSTEM\",\"name\":\"商务\",\"permIds\":[100000000000030018,100000000000030020,100000000000030047,100000000000030048,100000000000030050,100000000000030022,100000000000030034,100000000000030036,100000000000030026,100000000000030051,100000000000030035,100000000000030037],\"roleCode\":\"106\",\"tips\":\"负责影院管理的角色\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (112, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-09 19:19:34', '成功', '2 & {\"madeBy\":\"SYSTEM\",\"name\":\"商务主管\",\"permIds\":[100000000000030018,100000000000030020,100000000000030048,100000000000030050,100000000000030047,100000000000030022,100000000000030026,100000000000010001,100000000000030001,100000000000030051,100000000000030034,100000000000030035,100000000000030036,100000000000030037,100000000000030053],\"roleCode\":\"105\",\"tips\":\"各个商务的管理人\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (113, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-09 19:27:32', '成功', '6 & {\"madeBy\":\"SYSTEM\",\"name\":\"平台管理员\",\"permIds\":[100000000000030001,100000000000030002,100000000000030003,100000000000010001,100000000000010002,100000000000010003,100000000000020001,100000000000020002,100000000000020003,100000000000030018,100000000000030019,100000000000030020,100000000000030021,100000000000030022,100000000000030024,100000000000310001,100000000000310002,100000000000310003,100000000000310004,100000000000030026,100000000000030027,100000000000030028,100000000000030029,100000000000030030,100000000000030031,100000000000030032,100000000000030033,100000000000030034,100000000000030035,100000000000030036,100000000000030037,100000000000030010,100000000000030012,100000000000030013,100000000000030042,100000000000030043,100000000000030014,100000000000030015,100000000000030016,100000000000030017,100000000000030044,100000000000030045,100000000000030046,100000000000030047,100000000000030048,100000000000030049,100000000000030050,100000000000030038,100000000000030039,100000000000030040,100000000000030041,100000000000011001,100000000000011002,100000000000011003],\"roleCode\":\"101\",\"tips\":\"平台管理员\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (114, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-09 19:47:53', '成功', '4 & {\"madeBy\":\"SYSTEM\",\"name\":\"商务\",\"permIds\":[100000000000030018,100000000000030020,100000000000030047,100000000000030048,100000000000030050,100000000000030034,100000000000030036,100000000000030026,100000000000030051,100000000000030035,100000000000030037],\"roleCode\":\"106\",\"tips\":\"负责影院管理的角色\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (115, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-09 19:48:05', '成功', '2 & {\"madeBy\":\"SYSTEM\",\"name\":\"商务主管\",\"permIds\":[100000000000030018,100000000000030020,100000000000030048,100000000000030050,100000000000030047,100000000000030026,100000000000010001,100000000000030001,100000000000030051,100000000000030034,100000000000030035,100000000000030036,100000000000030037,100000000000030053],\"roleCode\":\"105\",\"tips\":\"各个商务的管理人\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (116, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-10 09:20:35', '成功', '5 & {\"advertingMaterialVOS\":[],\"advertingName\":\"中文\",\"advertiserId\":15,\"assistantId\":876708082437197837,\"budget\":0,\"cinemaId\":2,\"cinemaName\":\"广州飞影电影城\",\"city\":\"广州\",\"contact\":\"13143376825\",\"contactName\":\"Hdij\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602236178000,\"duration\":\"45\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602518400000,\"id\":5,\"orgId\":100000000000000072,\"planId\":20,\"planNumber\":\"1314499228562755584\",\"planningOrderId\":7,\"releaseType\":\"BY_FILM\",\"roomNumber\":6,\"round\":5,\"status\":\"TO_BE_DELIVER\",\"taskNumber\":\"1314499924058050560\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (117, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-10 09:23:49', '成功', '5 & {\"advertingMaterialVOS\":[],\"advertingName\":\"中文\",\"advertiserId\":15,\"assistantId\":876708082437197837,\"budget\":0,\"cinemaId\":2,\"cinemaName\":\"广州飞影电影城\",\"city\":\"广州\",\"contact\":\"13143376825\",\"contactName\":\"Hdij\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602236178000,\"duration\":\"45\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602518400000,\"id\":5,\"orgId\":100000000000000072,\"planId\":20,\"planNumber\":\"1314499228562755584\",\"planningOrderId\":7,\"releaseType\":\"BY_FILM\",\"roomNumber\":8,\"round\":5,\"status\":\"TO_BE_DELIVER\",\"taskNumber\":\"1314499924058050560\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (118, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-10 09:24:07', '成功', '5 & {\"advertingMaterialVOS\":[],\"advertingName\":\"中文\",\"advertiserId\":15,\"assistantId\":876708082437197837,\"budget\":0,\"cinemaId\":2,\"cinemaName\":\"广州飞影电影城\",\"city\":\"广州\",\"contact\":\"13143376825\",\"contactName\":\"Hdij\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602236178000,\"duration\":\"45\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602518400000,\"id\":5,\"orgId\":100000000000000072,\"planId\":20,\"planNumber\":\"1314499228562755584\",\"planningOrderId\":7,\"releaseType\":\"BY_FILM\",\"roomNumber\":8,\"round\":5,\"status\":\"TO_BE_DELIVER\",\"taskNumber\":\"1314499924058050560\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (119, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-10 09:25:27', '成功', '5 & {\"advertingMaterialVOS\":[],\"advertingName\":\"中文\",\"advertiserId\":15,\"assistantId\":876708082437197837,\"budget\":0,\"cinemaId\":2,\"cinemaName\":\"广州飞影电影城\",\"city\":\"广州\",\"contact\":\"13143376825\",\"contactName\":\"Hdij\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602236178000,\"duration\":\"45\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602518400000,\"id\":5,\"orgId\":100000000000000072,\"planId\":20,\"planNumber\":\"1314499228562755584\",\"planningOrderId\":7,\"releaseType\":\"BY_FILM\",\"roomNumber\":8,\"round\":5,\"status\":\"TO_BE_DELIVER\",\"taskNumber\":\"1314499924058050560\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (120, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-10 09:26:17', '成功', '5 & {\"advertingMaterialVOS\":[],\"advertingName\":\"中文\",\"advertiserId\":15,\"assistantId\":876708082437197837,\"budget\":0,\"cinemaId\":2,\"cinemaName\":\"广州飞影电影城\",\"city\":\"广州\",\"contact\":\"13143376825\",\"contactName\":\"Hdij\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602236178000,\"duration\":\"45\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602518400000,\"id\":5,\"orgId\":100000000000000072,\"planId\":20,\"planNumber\":\"1314499228562755584\",\"planningOrderId\":7,\"releaseType\":\"BY_FILM\",\"roomNumber\":8,\"round\":5,\"status\":\"TO_BE_DELIVER\",\"taskNumber\":\"1314499924058050560\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (121, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-10 09:38:15', '成功', '5 & {\"advertingMaterialVOS\":[],\"advertingName\":\"中文\",\"advertiserId\":15,\"assistantId\":876708082437197837,\"budget\":0,\"cinemaId\":2,\"cinemaName\":\"广州飞影电影城\",\"city\":\"广州\",\"contact\":\"13143376825\",\"contactName\":\"Hdij\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602236178000,\"duration\":\"45\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602518400000,\"id\":5,\"orgId\":100000000000000072,\"planId\":20,\"planNumber\":\"1314499228562755584\",\"planningOrderId\":7,\"releaseType\":\"BY_FILM\",\"roomNumber\":7,\"round\":5,\"status\":\"TO_BE_DELIVER\",\"taskNumber\":\"1314499924058050560\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (122, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-10 09:38:38', '成功', '5 & {\"advertingMaterialVOS\":[],\"advertingName\":\"中文\",\"advertiserId\":15,\"assistantId\":876708082437197837,\"budget\":0,\"cinemaId\":2,\"cinemaName\":\"广州飞影电影城\",\"city\":\"广州\",\"contact\":\"13143376825\",\"contactName\":\"Hdij\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602236178000,\"duration\":\"45\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602518400000,\"id\":5,\"orgId\":100000000000000072,\"planId\":20,\"planNumber\":\"1314499228562755584\",\"planningOrderId\":7,\"releaseType\":\"BY_FILM\",\"roomNumber\":8,\"round\":5,\"status\":\"TO_BE_DELIVER\",\"taskNumber\":\"1314499924058050560\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (123, 100000000000000079, 'BUSINESS_LOG', '广告主修改自身信息的操作', 876708082437197859, '15019975480', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiserSelf', '2020-10-10 09:39:17', '成功', '{\"assistantId\":0,\"balance\":0,\"businessLicenseProve\":\"/attachments/1621eaf6-4225-41dc-8088-ae996f4a6f96.jpg\",\"city\":\"天津\",\"comeFrom\":1,\"companyName\":\"天津制药\",\"contactPhone\":\"15019975480\",\"createTime\":1602293909000,\"district\":\"和平区\",\"id\":17,\"loginTime\":1602293909000,\"orgId\":100000000000000079,\"province\":\"天津\",\"status\":\"PENDING_APPROVAL\",\"updateTime\":1602293909000} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (124, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-10 09:39:18', '成功', '5 & {\"advertingMaterialVOS\":[],\"advertingName\":\"中文\",\"advertiserId\":15,\"assistantId\":876708082437197837,\"budget\":0,\"cinemaId\":2,\"cinemaName\":\"广州飞影电影城\",\"city\":\"广州\",\"contact\":\"13143376825\",\"contactName\":\"Hdij\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602236178000,\"duration\":\"45\",\"filmEndDate\":1602777600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1602518400000,\"id\":5,\"orgId\":100000000000000072,\"planId\":20,\"planNumber\":\"1314499228562755584\",\"planningOrderId\":7,\"releaseType\":\"BY_FILM\",\"roomNumber\":9,\"round\":5,\"status\":\"TO_BE_DELIVER\",\"taskNumber\":\"1314499924058050560\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (125, 100000000000000010, 'BUSINESS_LOG', '广告主审核的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'passAdvertiser', '2020-10-10 09:39:58', '成功', '17 & \"REFUSE\" & {\"advertiserId\":17,\"id\":6,\"note\":\"2112\",\"status\":\"REFUSE\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (126, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-10 09:40:10', '成功', '17 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (127, 100000000000000010, 'BUSINESS_LOG', '删除用户的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'deleteUser', '2020-10-10 10:20:10', '成功', '876708082437197832 & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (128, 100000000000000010, 'BUSINESS_LOG', '修改个人资料的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateInfo', '2020-10-10 10:22:47', '成功', '{\"account\":\"admin\",\"avatar\":\"[{\\\"url\\\":\\\"/attachments/da34220f-bbf5-4a54-b50c-84c9d414fbc8.jpg\\\"}]\",\"birthday\":862761600000,\"createtime\":1602145057000,\"email\":\"admin10@kequandian.net\",\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197830,\"isAppUser\":0,\"name\":\"管理员\",\"passwordReset\":1,\"phone\":\"18200000003\",\"sex\":0,\"status\":1,\"version\":1} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (129, 100000000000000010, 'BUSINESS_LOG', '修改个人资料的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateInfo', '2020-10-10 10:23:41', '成功', '{\"account\":\"admin\",\"avatar\":\"/attachments/9079b223-bc2e-4529-b9b0-537788d6b4f1.jpg\",\"birthday\":862761600000,\"createtime\":1602145057000,\"email\":\"admin10@kequandian.net\",\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197830,\"isAppUser\":0,\"name\":\"管理员\",\"passwordReset\":1,\"phone\":\"18200000003\",\"sex\":0,\"status\":1,\"version\":1} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (130, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-10 10:26:01', '成功', '8 & {\"advertingMaterialVOS\":[],\"advertingName\":\"场次\",\"advertiserId\":3,\"assistantId\":876708082437197837,\"budget\":0,\"cinemaId\":2,\"cinemaName\":\"广州飞影电影城\",\"city\":\"广州\",\"contact\":\"13143376825\",\"contactName\":\"Hdij\",\"createTime\":1602296240000,\"duration\":\"15\",\"filmEndDate\":1603382400000,\"filmStartDate\":1603123200000,\"id\":8,\"orgId\":100000000000000072,\"planId\":26,\"planNumber\":\"1314751225064984576\",\"planningOrderId\":10,\"releaseType\":\"BY_ROUNDS\",\"roomNumber\":9,\"round\":8,\"status\":\"TO_BE_DELIVER\",\"taskNumber\":\"1314751838314172416\",\"timeSlot\":\"IN_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (131, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-10 10:26:07', '成功', '8 & {\"advertingMaterialVOS\":[],\"advertingName\":\"场次\",\"advertiserId\":3,\"assistantId\":876708082437197837,\"budget\":0,\"cinemaId\":2,\"cinemaName\":\"广州飞影电影城\",\"city\":\"广州\",\"contact\":\"13143376825\",\"contactName\":\"Hdij\",\"createTime\":1602296240000,\"duration\":\"15\",\"filmEndDate\":1603382400000,\"filmStartDate\":1603123200000,\"id\":8,\"orgId\":100000000000000072,\"planId\":26,\"planNumber\":\"1314751225064984576\",\"planningOrderId\":10,\"releaseType\":\"BY_ROUNDS\",\"roomNumber\":8,\"round\":8,\"status\":\"TO_BE_DELIVER\",\"taskNumber\":\"1314751838314172416\",\"timeSlot\":\"IN_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (132, 100000000000000010, 'BUSINESS_LOG', '修改个人资料的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateInfo', '2020-10-10 10:47:12', '成功', '{\"account\":\"admin\",\"avatar\":\"/attachments/cf4e5204-60ac-42ea-9720-13a86898b2af.jpg\",\"birthday\":862761600000,\"createtime\":1602145057000,\"email\":\"admin10@kequandian.net\",\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197830,\"isAppUser\":0,\"name\":\"管理员\",\"passwordReset\":1,\"phone\":\"18200000003\",\"sex\":0,\"status\":1,\"version\":1} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (133, 100000000000000010, 'BUSINESS_LOG', 'create Cinema的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'createCinema', '2020-10-10 10:49:44', '成功', '{\"address\":\"天河区珠江新城马场路36号太阳新天地购物中心8楼\",\"assistantId\":876708082437197837,\"businessArea\":\"珠江新城\",\"city\":\"广州\",\"cityLevel\":\"一线\",\"contact\":\"13560000000\",\"contactName\":\"ZY\",\"district\":\"天河区\",\"id\":3,\"lineId\":5,\"lineName\":\"中影数字\",\"name\":\"中影国际影城（太阳新天地店）\",\"note\":\"影院设有4个大3D数字豪华影厅、2个标准数字豪华影厅，超过1000位座席。拥有都市浪漫色彩及国际名师设计的电影文化沙龙展厅和电影礼品专柜，装修风格与艺术品位相得益彰，放映设施高端，力求给每位观众带来全方位、立体化的视听、娱乐、奢华新感受。\",\"orgCode\":\"205ea30941044ef2a0d085b22a275cf7\",\"orgId\":100000000000000079,\"province\":\"广东\",\"qualificationNumber\":\"1003\",\"roomNumber\":6,\"seatNumber\":1000} & ', 'Cinema');
INSERT INTO `t_operation_log` VALUES (134, 100000000000000010, 'BUSINESS_LOG', 'create Cinema的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'createCinema', '2020-10-10 10:51:45', '成功', '{\"address\":\"\",\"assistantId\":876708082437197830,\"businessArea\":\"商圈\",\"city\":\"武汉\",\"cityLevel\":\"二线\",\"contact\":\"15012236523\",\"contactName\":\"臧先生\",\"district\":\"武昌区\",\"id\":4,\"lineId\":22,\"lineName\":\"武汉天河影业\",\"name\":\"武汉百瑞景天河影城\",\"orgCode\":\"9df33cf29cdc460a8a241d0ce5a4ee65\",\"orgId\":100000000000000080,\"province\":\"湖北\",\"qualificationNumber\":\"45124512512885\",\"roomNumber\":4,\"seatNumber\":1000} & ', 'Cinema');
INSERT INTO `t_operation_log` VALUES (135, 100000000000000010, 'BUSINESS_LOG', 'update Cinema的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'updateCinema', '2020-10-10 10:52:12', '成功', '4 & {\"address\":\"武汉市武昌区宝通寺路38号瑞景\",\"assistantId\":876708082437197830,\"businessArea\":\"商圈\",\"city\":\"武汉\",\"cityLevel\":\"二线\",\"contact\":\"15012236523\",\"contactName\":\"臧先生\",\"createTime\":1602298305000,\"district\":\"武昌区\",\"id\":4,\"lineId\":22,\"lineName\":\"武汉天河影业\",\"name\":\"武汉百瑞景天河影城\",\"note\":\"武汉市武昌区宝通寺路38号瑞景\",\"orgId\":100000000000000080,\"province\":\"湖北\",\"qualificationNumber\":\"45124512512885\",\"roomNumber\":4,\"seatNumber\":1000,\"ticket\":0,\"updateTime\":1602298305000} & ', 'Cinema');
INSERT INTO `t_operation_log` VALUES (136, 100000000000000010, 'BUSINESS_LOG', '创建用户的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaUserEndpoint', 'createCinemaManager', '2020-10-10 10:55:46', '成功', '{\"account\":\" \",\"avatar\":\"[]\",\"name\":\"商务\",\"orgId\":100000000000000075,\"password\":\"111111\",\"phone\":\"15019975481\",\"roleIds\":[4],\"sex\":0} & ', 'cinemaUser');
INSERT INTO `t_operation_log` VALUES (137, 100000000000000081, 'BUSINESS_LOG', '广告主修改自身信息的操作', 876708082437197863, '15019975480', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiserSelf', '2020-10-10 11:05:32', '成功', '{\"assistantId\":0,\"balance\":0,\"businessLicenseProve\":\"/attachments/1ec1e95a-49dc-48d3-a4d6-f63fc3dafd56.jpg\",\"city\":\"天津\",\"comeFrom\":1,\"companyName\":\"天津制药\",\"contactPhone\":\"15019975480\",\"createTime\":1602299091000,\"district\":\"和平区\",\"id\":18,\"loginTime\":1602299091000,\"orgId\":100000000000000081,\"province\":\"天津\",\"status\":\"PENDING_APPROVAL\",\"updateTime\":1602299091000} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (138, 100000000000000081, 'BUSINESS_LOG', '修改个人资料的操作', 876708082437197863, '15019975480', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateInfo', '2020-10-10 11:05:54', '成功', '{\"account\":\"15019975480\",\"avatar\":\"/attachments/537e4655-511f-446a-b370-3481d4e51af4.jpg\",\"createtime\":1602299091000,\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197863,\"isAppUser\":0,\"name\":\"广告主用户\",\"passwordReset\":1,\"phone\":\"15019975480\",\"status\":1,\"tenantOrgId\":100000000000000081} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (139, 100000000000000010, 'BUSINESS_LOG', '修改用户的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateUser', '2020-10-10 11:08:52', '成功', '876708082437197836 & {\"account\":\"13560126667\",\"avatar\":\"[{\\\"url\\\":\\\"/attachments/e400dfa9-3450-4ebf-8a3b-9a3167217129.jpg\\\"}]\",\"bUserType\":\"SYSTEM\",\"createtime\":1602145990000,\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197836,\"isAppUser\":0,\"name\":\"S-店小二\",\"orgId\":100000000000000063,\"password\":\"f6127fd3b307e1c54ba7d513f33b5e1a\",\"passwordReset\":0,\"phone\":\"13560126667\",\"roleIds\":[5],\"salt\":\"6kbb2\",\"status\":1,\"tenantOrgId\":100000000000000010,\"userType\":2} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (140, 100000000000000010, 'BUSINESS_LOG', '广告主审核的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'passAdvertiser', '2020-10-10 11:13:02', '成功', '18 & \"PASS\" & {\"advertiserId\":18,\"id\":7,\"status\":\"PASS\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (141, 100000000000000010, 'BUSINESS_LOG', 'create Cinema的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'createCinema', '2020-10-10 11:59:01', '成功', '{\"assistantId\":876708082437197830,\"city\":\"北京\",\"cityLevel\":\"一线\",\"contact\":\"12\",\"contactName\":\"21\",\"district\":\"西城区\",\"id\":5,\"lineId\":34,\"lineName\":\"江西星河\",\"name\":\"12\",\"orgCode\":\"80dcaf5d9ff8476bbf1da0d2dd52605d\",\"orgId\":100000000000000082,\"province\":\"北京\",\"qualificationNumber\":\"12\",\"roomNumber\":12,\"seatNumber\":12} & ', 'Cinema');
INSERT INTO `t_operation_log` VALUES (142, 100000000000000010, 'BUSINESS_LOG', 'delete Cinema的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'deleteCinema', '2020-10-10 11:59:04', '成功', '5 & ', 'Cinema');
INSERT INTO `t_operation_log` VALUES (143, 100000000000000010, 'BUSINESS_LOG', '修改用户的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateUser', '2020-10-10 12:03:47', '成功', '876708082437197830 & {\"account\":\"admin\",\"avatar\":\"/attachments/cf4e5204-60ac-42ea-9720-13a86898b2af.jpg\",\"bUserType\":\"SYSTEM\",\"birthday\":862848000000,\"createtime\":1602145057000,\"email\":\"admin10@kequandian.net\",\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197830,\"isAppUser\":0,\"name\":\"管理员\",\"orgId\":100000000000000010,\"password\":\"b5106d36993ba6afd2b5b99e3e46e1af\",\"passwordReset\":1,\"phone\":\"18200000003\",\"roleIds\":[6],\"salt\":\"p683b\",\"sex\":0,\"status\":1,\"userType\":101,\"version\":1} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (144, 100000000000000010, 'BUSINESS_LOG', '修改用户的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateUser', '2020-10-10 12:05:35', '成功', '876708082437197830 & {\"account\":\"admin\",\"avatar\":\"/attachments/cf4e5204-60ac-42ea-9720-13a86898b2af.jpg\",\"bUserType\":\"SYSTEM\",\"birthday\":862848000000,\"createtime\":1602145057000,\"email\":\"admin10@kequandian.net\",\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197830,\"isAppUser\":0,\"name\":\"管理员\",\"orgId\":100000000000000010,\"password\":\"b5106d36993ba6afd2b5b99e3e46e1af\",\"passwordReset\":1,\"phone\":\"18200000003\",\"roleIds\":[6],\"salt\":\"p683b\",\"sex\":0,\"status\":1,\"userType\":101,\"version\":1} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (145, 100000000000000010, 'BUSINESS_LOG', 'create Cinema的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'createCinema', '2020-10-10 12:14:37', '成功', '{\"address\":\"黄浦区\",\"assistantId\":876708082437197830,\"businessArea\":\"萝岗万达\",\"city\":\"广州\",\"cityLevel\":\"一线\",\"contact\":\"18620909958\",\"contactName\":\"gou\",\"district\":\"黄埔区\",\"id\":6,\"lineId\":2,\"lineName\":\"广东大地\",\"name\":\"大地影院\",\"note\":\"111\",\"orgCode\":\"7511df1da93847b1b6090bb95085fcbf\",\"orgId\":100000000000000082,\"province\":\"广东\",\"qualificationNumber\":\"1003\",\"roomNumber\":8,\"seatNumber\":800} & ', 'Cinema');
INSERT INTO `t_operation_log` VALUES (146, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-10 15:14:59', '成功', '23 & {\"advertingMaterialVOS\":[],\"advertingName\":\"测试test\",\"advertiserId\":15,\"assistantId\":876708082437197862,\"budget\":0,\"cinemaAddress\":\"黄浦区\",\"cinemaId\":6,\"cinemaName\":\"大地影院\",\"city\":\"广州\",\"contact\":\"18620909958\",\"contactName\":\"gou\",\"createTime\":1602313659000,\"duration\":\"30\",\"filmEndDate\":1602777600000,\"filmStartDate\":1602432000000,\"id\":23,\"orgId\":100000000000000082,\"planId\":33,\"planNumber\":\"1314822938947620864\",\"planningOrderId\":20,\"releaseType\":\"BY_ROUNDS\",\"reportFileName\":\"PMC计划单.docx\",\"reportFileUrl\":\"/attachments/d09d2d5a-310d-4642-8e30-3ff8de44aaf4.docx\",\"roomNumber\":7,\"round\":7,\"status\":\"TO_BE_VERIFY\",\"taskNumber\":\"1314824900044787712\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (147, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-10 15:15:15', '成功', '23 & {\"advertingMaterialVOS\":[],\"advertingName\":\"测试test\",\"advertiserId\":15,\"assistantId\":876708082437197862,\"budget\":0,\"cinemaAddress\":\"黄浦区\",\"cinemaId\":6,\"cinemaName\":\"大地影院\",\"city\":\"广州\",\"contact\":\"18620909958\",\"contactName\":\"gou\",\"createTime\":1602313659000,\"duration\":\"30\",\"filmEndDate\":1602777600000,\"filmStartDate\":1602432000000,\"id\":23,\"orgId\":100000000000000082,\"planId\":33,\"planNumber\":\"1314822938947620864\",\"planningOrderId\":20,\"releaseType\":\"BY_ROUNDS\",\"reportFileName\":\"PMC计划单.docx\",\"reportFileUrl\":\"/attachments/d09d2d5a-310d-4642-8e30-3ff8de44aaf4.docx\",\"roomNumber\":7,\"round\":7,\"status\":\"TO_BE_VERIFY\",\"taskNumber\":\"1314824900044787712\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (148, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-10 15:16:18', '成功', '16 & {\"advertingMaterialVOS\":[],\"advertingName\":\"药片广告\",\"advertiserId\":18,\"assistantId\":876708082437197862,\"budget\":0,\"cinemaAddress\":\"武汉市武昌区宝通寺路38号瑞景\",\"cinemaId\":4,\"cinemaName\":\"武汉百瑞景天河影城\",\"city\":\"武汉\",\"contact\":\"15012236523\",\"contactName\":\"臧先生\",\"createTime\":1602299654000,\"duration\":\"30\",\"filmEndDate\":1603468800000,\"filmStartDate\":1602864000000,\"id\":16,\"orgId\":100000000000000080,\"planId\":29,\"planNumber\":\"1314766094967377920\",\"planningOrderId\":16,\"releaseType\":\"BY_ROUNDS\",\"roomNumber\":6,\"round\":5,\"status\":\"DELIVERED\",\"taskNumber\":\"1314766160180416512\",\"timeSlot\":\"IN_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (149, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-10 15:17:10', '成功', '16 & {\"advertingMaterialVOS\":[],\"advertingName\":\"药片广告\",\"advertiserId\":18,\"assistantId\":876708082437197862,\"budget\":0,\"cinemaAddress\":\"武汉市武昌区宝通寺路38号瑞景\",\"cinemaId\":4,\"cinemaName\":\"武汉百瑞景天河影城\",\"city\":\"武汉\",\"contact\":\"15012236523\",\"contactName\":\"臧先生\",\"createTime\":1602299654000,\"duration\":\"30\",\"filmEndDate\":1603468800000,\"filmStartDate\":1602864000000,\"id\":16,\"orgId\":100000000000000080,\"planId\":29,\"planNumber\":\"1314766094967377920\",\"planningOrderId\":16,\"releaseType\":\"BY_ROUNDS\",\"roomNumber\":7,\"round\":5,\"status\":\"DELIVERED\",\"taskNumber\":\"1314766160180416512\",\"timeSlot\":\"IN_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (150, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-10 15:17:33', '成功', '16 & {\"advertingMaterialVOS\":[],\"advertingName\":\"药片广告\",\"advertiserId\":18,\"assistantId\":876708082437197862,\"budget\":0,\"cinemaAddress\":\"武汉市武昌区宝通寺路38号瑞景\",\"cinemaId\":4,\"cinemaName\":\"武汉百瑞景天河影城\",\"city\":\"武汉\",\"contact\":\"15012236523\",\"contactName\":\"臧先生\",\"createTime\":1602299654000,\"duration\":\"30\",\"filmEndDate\":1603468800000,\"filmStartDate\":1602864000000,\"id\":16,\"orgId\":100000000000000080,\"planId\":29,\"planNumber\":\"1314766094967377920\",\"planningOrderId\":16,\"releaseType\":\"BY_ROUNDS\",\"roomNumber\":8,\"round\":5,\"status\":\"DELIVERED\",\"taskNumber\":\"1314766160180416512\",\"timeSlot\":\"IN_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (151, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-10 15:17:56', '成功', '16 & {\"advertingMaterialVOS\":[],\"advertingName\":\"药片广告\",\"advertiserId\":18,\"assistantId\":876708082437197862,\"budget\":0,\"cinemaAddress\":\"武汉市武昌区宝通寺路38号瑞景\",\"cinemaId\":4,\"cinemaName\":\"武汉百瑞景天河影城\",\"city\":\"武汉\",\"contact\":\"15012236523\",\"contactName\":\"臧先生\",\"createTime\":1602299654000,\"duration\":\"30\",\"filmEndDate\":1603468800000,\"filmStartDate\":1602864000000,\"id\":16,\"orgId\":100000000000000080,\"planId\":29,\"planNumber\":\"1314766094967377920\",\"planningOrderId\":16,\"releaseType\":\"BY_ROUNDS\",\"roomNumber\":7,\"round\":5,\"status\":\"DELIVERED\",\"taskNumber\":\"1314766160180416512\",\"timeSlot\":\"IN_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (152, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-10 15:19:53', '成功', '16 & {\"advertingMaterialVOS\":[],\"advertingName\":\"药片广告\",\"advertiserId\":18,\"assistantId\":876708082437197862,\"budget\":0,\"cinemaAddress\":\"武汉市武昌区宝通寺路38号瑞景\",\"cinemaId\":4,\"cinemaName\":\"武汉百瑞景天河影城\",\"city\":\"武汉\",\"contact\":\"15012236523\",\"contactName\":\"臧先生\",\"createTime\":1602299654000,\"duration\":\"30\",\"filmEndDate\":1603468800000,\"filmStartDate\":1602864000000,\"id\":16,\"orgId\":100000000000000080,\"planId\":29,\"planNumber\":\"1314766094967377920\",\"planningOrderId\":16,\"releaseType\":\"BY_ROUNDS\",\"roomNumber\":8,\"round\":12,\"status\":\"DELIVERED\",\"taskNumber\":\"1314766160180416512\",\"timeSlot\":\"IN_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (153, 100000000000000082, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197865, '18620909958', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-10 15:20:43', '成功', '23 & {\"advertingMaterialVOS\":[],\"advertingName\":\"测试test\",\"advertiserId\":15,\"assistantId\":876708082437197862,\"budget\":0,\"cinemaAddress\":\"黄浦区\",\"cinemaId\":6,\"cinemaName\":\"大地影院\",\"city\":\"广州\",\"contact\":\"18620909958\",\"contactName\":\"gou\",\"createTime\":1602313659000,\"duration\":\"30\",\"filmEndDate\":1602777600000,\"filmStartDate\":1602432000000,\"id\":23,\"orgId\":100000000000000082,\"planId\":33,\"planNumber\":\"1314822938947620864\",\"planningOrderId\":20,\"releaseType\":\"BY_ROUNDS\",\"reportFileName\":\"PMC计划单.docx\",\"reportFileUrl\":\"/attachments/d09d2d5a-310d-4642-8e30-3ff8de44aaf4.docx\",\"roomNumber\":7,\"round\":7,\"status\":\"REJECTED\",\"taskNumber\":\"1314824900044787712\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (154, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-10 15:21:50', '成功', '16 & {\"advertingMaterialVOS\":[],\"advertingName\":\"药片广告\",\"advertiserId\":18,\"assistantId\":876708082437197862,\"budget\":0,\"cinemaAddress\":\"武汉市武昌区宝通寺路38号瑞景\",\"cinemaId\":4,\"cinemaName\":\"武汉百瑞景天河影城\",\"city\":\"武汉\",\"contact\":\"15012236523\",\"contactName\":\"臧先生\",\"createTime\":1602299654000,\"duration\":\"30\",\"filmEndDate\":1603468800000,\"filmStartDate\":1602864000000,\"id\":16,\"orgId\":100000000000000080,\"planId\":29,\"planNumber\":\"1314766094967377920\",\"planningOrderId\":16,\"releaseType\":\"BY_ROUNDS\",\"roomNumber\":6,\"round\":5,\"status\":\"DELIVERED\",\"taskNumber\":\"1314766160180416512\",\"timeSlot\":\"IN_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (155, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-10 15:22:20', '成功', '16 & {\"advertingMaterialVOS\":[],\"advertingName\":\"药片广告\",\"advertiserId\":18,\"assistantId\":876708082437197862,\"budget\":0,\"cinemaAddress\":\"武汉市武昌区宝通寺路38号瑞景\",\"cinemaId\":4,\"cinemaName\":\"武汉百瑞景天河影城\",\"city\":\"武汉\",\"contact\":\"15012236523\",\"contactName\":\"臧先生\",\"createTime\":1602299654000,\"duration\":\"30\",\"filmEndDate\":1603468800000,\"filmStartDate\":1602864000000,\"id\":16,\"orgId\":100000000000000080,\"planId\":29,\"planNumber\":\"1314766094967377920\",\"planningOrderId\":16,\"releaseType\":\"BY_ROUNDS\",\"roomNumber\":6,\"round\":5,\"status\":\"DELIVERED\",\"taskNumber\":\"1314766160180416512\",\"timeSlot\":\"IN_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (156, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-10 15:24:51', '成功', '23 & {\"advertingMaterialVOS\":[],\"advertingName\":\"测试test\",\"advertiserId\":15,\"assistantId\":876708082437197862,\"budget\":0,\"cinemaAddress\":\"黄浦区\",\"cinemaId\":6,\"cinemaName\":\"大地影院\",\"city\":\"广州\",\"contact\":\"18620909958\",\"contactName\":\"gou\",\"createTime\":1602313659000,\"duration\":\"30\",\"filmEndDate\":1602777600000,\"filmStartDate\":1602432000000,\"id\":23,\"orgId\":100000000000000082,\"planId\":33,\"planNumber\":\"1314822938947620864\",\"planningOrderId\":20,\"releaseType\":\"BY_ROUNDS\",\"reportFileName\":\"PMC计划单.docx\",\"reportFileUrl\":\"/attachments/d09d2d5a-310d-4642-8e30-3ff8de44aaf4.docx\",\"roomNumber\":9,\"round\":7,\"status\":\"REJECTED\",\"taskNumber\":\"1314824900044787712\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (157, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197837, '13560126665', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-10 15:34:58', '成功', '23 & {\"advertingMaterialVOS\":[{\"advertiserResourceUrl\":\"http://www.baiduyun.com\",\"delFlag\":\"0\",\"materialId\":5,\"materialName\":\"广告素材\"},{\"advertiserResourceUrl\":\"http://www.baiduyun.com\",\"delFlag\":\"0\",\"materialId\":6,\"materialName\":\"广告\"}],\"advertingName\":\"测试test\",\"advertiserId\":15,\"assistantId\":876708082437197862,\"budget\":0,\"cinemaAddress\":\"黄浦区\",\"cinemaId\":6,\"cinemaName\":\"大地影院\",\"city\":\"广州\",\"contact\":\"18620909958\",\"contactName\":\"gou\",\"createTime\":1602313659000,\"duration\":\"30\",\"endAlarm\":\"0\",\"filmEndDate\":1602777600000,\"filmStartDate\":1602432000000,\"id\":23,\"orgId\":100000000000000082,\"planId\":33,\"planNumber\":\"1314822938947620864\",\"planningOrderId\":20,\"releaseType\":\"BY_ROUNDS\",\"reportFileName\":\"PMC计划单.docx\",\"reportFileUrl\":\"/attachments/d09d2d5a-310d-4642-8e30-3ff8de44aaf4.docx\",\"roomNumber\":6,\"round\":7,\"startAlarm\":\"0\",\"status\":\"REJECTED\",\"taskNumber\":\"1314824900044787712\",\"timeSlot\":\"AFTER_ONE_MINUTE\",\"type\":\"SCREEN\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (158, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-10 16:57:55', '成功', '5 & {\"madeBy\":\"SYSTEM\",\"name\":\"店小二\",\"permIds\":[100000000000310001,100000000000310002,100000000000030010,100000000000030012,100000000000030042,100000000000030014,100000000000030044,100000000000030018,100000000000030022,100000000000030024,100000000000030026,100000000000030043,100000000000030015,100000000000310003,100000000000310004],\"roleCode\":\"104\",\"tips\":\"复制广告主管理的角色\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (159, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-10 16:58:03', '成功', '3 & {\"madeBy\":\"SYSTEM\",\"name\":\"店小二主管\",\"permIds\":[100000000000030010,100000000000030012,100000000000030042,100000000000030043,100000000000030014,100000000000030044,100000000000030018,100000000000310001,100000000000030022,100000000000030024,100000000000030026,100000000000010001,100000000000310002,100000000000030001,100000000000030015,100000000000030052,100000000000310003,100000000000310004],\"roleCode\":\"103\",\"tips\":\"各个店小二的管理人\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (160, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-10 17:34:56', '成功', '3 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (161, 100000000000000010, 'BUSINESS_LOG', '平台新增 广告主的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'createAdvertiser', '2020-10-10 17:42:21', '成功', '{\"assistantId\":876708082437197830,\"city\":\"深圳\",\"comeFrom\":0,\"companyName\":\"Tuber有限公司\",\"contactName\":\"tuber\",\"contactPhone\":\"13600000002\",\"district\":\"南山区\",\"id\":21,\"lIndustry\":\"互联网和相关服务\",\"mIndustry\":\"互联网信息服务\",\"note\":\"浏览器服务\",\"orgCode\":\"b93af03435db4777bc5206388342edbf\",\"orgId\":100000000000000085,\"province\":\"广东\",\"xIndustry\":\"信息传输、软件和信息技术服务业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (162, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-10 17:43:35', '成功', '21 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (163, 100000000000000010, 'BUSINESS_LOG', '平台新增 广告主的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'createAdvertiser', '2020-10-10 17:45:32', '成功', '{\"assistantId\":876708082437197836,\"city\":\"深圳\",\"comeFrom\":0,\"companyName\":\"Tuber有限公司\",\"contactName\":\"tuber\",\"contactPhone\":\"13600000002\",\"district\":\"龙岗区\",\"id\":22,\"lIndustry\":\"互联网和相关服务\",\"mIndustry\":\"互联网信息服务\",\"note\":\"公司主要产品有浏览器，网页等服务\",\"orgCode\":\"710ea43c37894f209ef0efb250420417\",\"orgId\":100000000000000085,\"province\":\"广东\",\"xIndustry\":\"信息传输、软件和信息技术服务业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (164, 100000000000000010, 'BUSINESS_LOG', '广告主审核的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'passAdvertiser', '2020-10-10 17:45:51', '成功', '22 & \"PASS\" & {\"advertiserId\":22,\"id\":8,\"status\":\"PASS\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (165, 100000000000000085, 'BUSINESS_LOG', 'create AdvertingMaterial的操作', 876708082437197871, '13600000002', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertingMaterialEndpoint', 'createAdvertingMaterial', '2020-10-10 17:46:37', '成功', '{\"advertiserResourcePassword\":\"111111\",\"advertiserResourceUrl\":\"http://www.baiduyun.com\",\"id\":8,\"name\":\"速速\",\"orgId\":100000000000000085} & ', 'AdvertingMaterial');
INSERT INTO `t_operation_log` VALUES (166, 100000000000000085, 'BUSINESS_LOG', 'create AdvertingMaterial的操作', 876708082437197871, '13600000002', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertingMaterialEndpoint', 'createAdvertingMaterial', '2020-10-10 17:48:27', '成功', '{\"advertiserResourceUrl\":\"http://www.aliyun.com\",\"id\":9,\"name\":\"阿里云\",\"orgId\":100000000000000085} & ', 'AdvertingMaterial');
INSERT INTO `t_operation_log` VALUES (167, 100000000000000085, 'BUSINESS_LOG', 'create AdvertingMaterial的操作', 876708082437197871, '13600000002', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertingMaterialEndpoint', 'createAdvertingMaterial', '2020-10-10 17:48:52', '成功', '{\"advertiserResourceUrl\":\"http://www.Tencentyun.com\",\"id\":10,\"name\":\"腾讯云\",\"orgId\":100000000000000085} & ', 'AdvertingMaterial');
INSERT INTO `t_operation_log` VALUES (168, 100000000000000085, 'BUSINESS_LOG', 'update AdvertingMaterial的操作', 876708082437197871, '13600000002', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertingMaterialEndpoint', 'updateAdvertingMaterial', '2020-10-10 17:48:58', '成功', '9 & {\"advertiserResourcePassword\":\"111111\",\"advertiserResourceUrl\":\"http://www.aliyun.com\",\"createTime\":1602323307000,\"delFlag\":\"0\",\"id\":9,\"name\":\"阿里云\",\"orgId\":100000000000000085,\"updateTime\":1602323307000} & ', 'AdvertingMaterial');
INSERT INTO `t_operation_log` VALUES (169, 100000000000000010, 'BUSINESS_LOG', '平台新增 广告主的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'createAdvertiser', '2020-10-12 12:02:29', '成功', '{\"assistantId\":876708082437197830,\"city\":\"北京\",\"comeFrom\":0,\"companyName\":\"华为科技有限公司\",\"contactName\":\"王思\",\"contactPhone\":\"13600000011\",\"district\":\"东城区\",\"id\":23,\"lIndustry\":\"农业\",\"mIndustry\":\"谷物种植\",\"orgCode\":\"96895c4812884942b47894458a70db71\",\"orgId\":100000000000000086,\"province\":\"北京\",\"xIndustry\":\"农、林、牧、渔业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (170, 100000000000000010, 'BUSINESS_LOG', '广告主审核的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'passAdvertiser', '2020-10-12 12:07:20', '成功', '23 & \"REFUSE\" & {\"advertiserId\":23,\"id\":9,\"note\":\"不通过\\n\",\"status\":\"REFUSE\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (171, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-12 12:07:29', '成功', '23 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (172, 100000000000000085, 'BUSINESS_LOG', '广告主修改自身信息的操作', 876708082437197871, '13600000002', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiserSelf', '2020-10-12 14:30:08', '成功', '{\"assistantId\":876708082437197836,\"balance\":0,\"businessLicenseProve\":\"/attachments/676e8ec5-b6ad-4290-8bbe-cdd822043ab6.jpg\",\"city\":\"深圳\",\"comeFrom\":0,\"companyName\":\"Tuber有限公司\",\"contactName\":\"tuber\",\"contactPhone\":\"13600000002\",\"createTime\":1602323131000,\"district\":\"龙岗区\",\"id\":22,\"lIndustry\":\"互联网和相关服务\",\"loginTime\":1602323131000,\"mIndustry\":\"互联网信息服务\",\"note\":\"公司主要产品有浏览器，网页等服务\",\"orgId\":100000000000000085,\"province\":\"广东\",\"status\":\"PASS\",\"updateTime\":1602323150000,\"xIndustry\":\"信息传输、软件和信息技术服务业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (173, 100000000000000010, 'BUSINESS_LOG', '修改个人资料的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateInfo', '2020-10-12 17:00:02', '成功', '{\"account\":\"13560126667\",\"avatar\":\"[{\\\"url\\\":\\\"/attachments/e400dfa9-3450-4ebf-8a3b-9a3167217129.jpg\\\"}]\",\"createtime\":1602145990000,\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197836,\"isAppUser\":0,\"name\":\"S-店小二\",\"passwordReset\":0,\"phone\":\"13560126667\",\"status\":1,\"tenantOrgId\":100000000000000010} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (174, 100000000000000010, 'BUSINESS_LOG', '修改个人资料的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateInfo', '2020-10-12 17:00:26', '成功', '{\"account\":\"13560126667\",\"avatar\":\"[{\\\"url\\\":\\\"/attachments/e400dfa9-3450-4ebf-8a3b-9a3167217129.jpg\\\"}]\",\"createtime\":1602145990000,\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197836,\"isAppUser\":0,\"name\":\"S-店小二\",\"passwordReset\":0,\"phone\":\"13560126667\",\"status\":1,\"tenantOrgId\":100000000000000010} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (175, 100000000000000010, 'BUSINESS_LOG', '修改个人资料的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateInfo', '2020-10-12 17:00:41', '成功', '{\"account\":\"13560126667\",\"avatar\":\"[{\\\"url\\\":\\\"/attachments/e400dfa9-3450-4ebf-8a3b-9a3167217129.jpg\\\"}]\",\"createtime\":1602145990000,\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197836,\"isAppUser\":0,\"name\":\"S-店小二\",\"passwordReset\":0,\"phone\":\"13560126667\",\"sex\":0,\"status\":1,\"tenantOrgId\":100000000000000010} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (176, 100000000000000010, 'BUSINESS_LOG', '修改个人资料的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateInfo', '2020-10-12 17:01:00', '成功', '{\"account\":\"13560126667\",\"avatar\":\"/attachments/e9f29576-fc1e-4738-bf99-07bd3ed04006.jpg\",\"createtime\":1602145990000,\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197836,\"isAppUser\":0,\"name\":\"S-店小二\",\"passwordReset\":0,\"phone\":\"13560126667\",\"sex\":0,\"status\":1,\"tenantOrgId\":100000000000000010} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (177, 100000000000000010, 'BUSINESS_LOG', 'update AdvertingMaterial的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertingMaterialEndpoint', 'updateAdvertingMaterial', '2020-10-12 17:42:20', '成功', '8 & {\"advertiserResourcePassword\":\"111111\",\"advertiserResourceUrl\":\"http://www.baiduyun.com\",\"anotherResourceUrl\":\"http://www.Tencentyun.com\",\"createTime\":1602323197000,\"delFlag\":\"0\",\"id\":8,\"name\":\"速速\",\"orgId\":100000000000000085,\"updateTime\":1602323197000} & ', 'AdvertingMaterial');
INSERT INTO `t_operation_log` VALUES (178, 100000000000000069, 'BUSINESS_LOG', '广告主修改自身信息的操作', 876708082437197846, '13660123456', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiserSelf', '2020-10-13 09:38:58', '成功', '{\"assistantId\":876708082437197836,\"balance\":0,\"businessLicenseProve\":\"/attachments/566571ec-fa14-4ec6-85c1-81ab8f39be79.jpg\",\"city\":\"广州\",\"comeFrom\":1,\"companyName\":\"广州本田汽车\",\"contactPhone\":\"13660123456\",\"createTime\":1602214863000,\"district\":\"南沙区\",\"id\":9,\"loginTime\":1602214863000,\"orgId\":100000000000000069,\"province\":\"广东\",\"status\":\"PASS\",\"updateTime\":1602215239000} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (179, 100000000000000085, 'BUSINESS_LOG', '广告主修改自身信息的操作', 876708082437197871, '13600000002', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiserSelf', '2020-10-13 10:54:26', '成功', '{\"assistantId\":876708082437197836,\"balance\":0,\"businessLicenseProve\":\"/attachments/676e8ec5-b6ad-4290-8bbe-cdd822043ab6.jpg\",\"city\":\"深圳\",\"comeFrom\":0,\"companyName\":\"Tuber有限公司\",\"contactName\":\"tuber\",\"contactPhone\":\"13600000002\",\"createTime\":1602323131000,\"district\":\"龙岗区\",\"id\":22,\"lIndustry\":\"互联网和相关服务\",\"loginTime\":1602323131000,\"mIndustry\":\"互联网信息服务\",\"note\":\"公司主要产品有浏览器，网页等服务\",\"orgId\":100000000000000085,\"province\":\"广东\",\"status\":\"PASS\",\"updateTime\":1602323150000,\"xIndustry\":\"信息传输、软件和信息技术服务业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (180, 100000000000000085, 'BUSINESS_LOG', '广告主修改自身信息的操作', 876708082437197871, '13600000002', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiserSelf', '2020-10-13 10:55:01', '成功', '{\"assistantId\":876708082437197836,\"balance\":0,\"businessLicenseProve\":\"/attachments/4bd497ce-2c4e-429a-af07-628b9442a348.jpg\",\"city\":\"深圳\",\"comeFrom\":0,\"companyName\":\"Tuber有限公司\",\"contactName\":\"tuber\",\"contactPhone\":\"13600000002\",\"createTime\":1602323131000,\"district\":\"龙岗区\",\"id\":22,\"lIndustry\":\"互联网和相关服务\",\"loginTime\":1602323131000,\"mIndustry\":\"互联网信息服务\",\"note\":\"公司主要产品有浏览器，网页等服务\",\"orgId\":100000000000000085,\"province\":\"广东\",\"status\":\"PASS\",\"updateTime\":1602323150000,\"xIndustry\":\"信息传输、软件和信息技术服务业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (181, 100000000000000085, 'BUSINESS_LOG', '广告主修改自身信息的操作', 876708082437197871, '13600000002', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiserSelf', '2020-10-13 10:55:05', '成功', '{\"assistantId\":876708082437197836,\"balance\":0,\"businessLicenseProve\":\"/attachments/5319a5c1-c11a-423f-9618-5aa5521a3bd1.jpg\",\"city\":\"深圳\",\"comeFrom\":0,\"companyName\":\"Tuber有限公司\",\"contactName\":\"tuber\",\"contactPhone\":\"13600000002\",\"createTime\":1602323131000,\"district\":\"龙岗区\",\"id\":22,\"lIndustry\":\"互联网和相关服务\",\"loginTime\":1602323131000,\"mIndustry\":\"互联网信息服务\",\"note\":\"公司主要产品有浏览器，网页等服务\",\"orgId\":100000000000000085,\"province\":\"广东\",\"status\":\"PASS\",\"updateTime\":1602323150000,\"xIndustry\":\"信息传输、软件和信息技术服务业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (182, 100000000000000073, 'BUSINESS_LOG', '广告主修改自身信息的操作', 876708082437197852, '13422212814', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiserSelf', '2020-10-13 11:40:21', '成功', '{\"assistantId\":876708082437197848,\"balance\":0,\"businessLicenseProve\":\"/attachments/a4b90952-4c36-4621-8b34-3ee7a9c1a4fe.png\",\"city\":\"广州\",\"comeFrom\":1,\"companyName\":\"水果广告有限公司\",\"contactName\":\"谢老板\",\"contactPhone\":\"13422212814\",\"createTime\":1602224835000,\"district\":\"越秀区\",\"id\":11,\"loginTime\":1602224835000,\"orgId\":100000000000000073,\"province\":\"广东\",\"status\":\"PASS\",\"updateTime\":1602225491000} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (183, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197862, '15019975481', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-13 12:17:56', '成功', '26 & {\"advertingMaterialVOS\":[{\"advertiserResourceUrl\":\"http://www.Tencentyun.com\",\"delFlag\":\"0\",\"materialId\":10,\"materialName\":\"腾讯云\"}],\"advertingName\":\"查看\",\"advertiserId\":22,\"assistantId\":876708082437197862,\"budget\":0,\"cinemaAddress\":\"武汉市武昌区宝通寺路38号瑞景\",\"cinemaId\":4,\"cinemaName\":\"武汉百瑞景天河影城\",\"city\":\"武汉\",\"contact\":\"15012236523\",\"contactName\":\"臧先生\",\"cover\":\"https://p1.meituan.net/movie/988ab3d3a50f51f31d090e84da88d5ae3461853.jpg@464w_644h_1e_1c\",\"createTime\":1602560991000,\"duration\":\"30\",\"endAlarm\":\"0\",\"filmEndDate\":1604419200000,\"filmId\":3,\"filmName\":\"夺冠\",\"filmStartDate\":1604160000000,\"id\":26,\"orgId\":100000000000000080,\"planId\":39,\"planNumber\":\"1315849008987639808\",\"planningOrderId\":23,\"releaseType\":\"BY_FILM\",\"roomNumber\":6,\"round\":6,\"startAlarm\":\"0\",\"status\":\"TO_BE_DELIVER\",\"taskNumber\":\"1315862283481649152\",\"timeSlot\":\"AFTER_ONE_MINUTE\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (184, 100000000000000010, 'BUSINESS_LOG', '修改个人资料的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateInfo', '2020-10-13 13:36:53', '成功', '{\"account\":\"admin\",\"avatar\":\"/attachments/46c3e971-f69e-4b41-bc9a-026fef677a5a.jpg\",\"birthday\":862761600000,\"createtime\":1602145057000,\"email\":\"admin10@kequandian.net\",\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197830,\"isAppUser\":0,\"name\":\"管理员\",\"passwordReset\":1,\"phone\":\"18200000003\",\"sex\":0,\"status\":1,\"version\":1} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (185, 100000000000000010, 'BUSINESS_LOG', 'create BillingStrategy的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.BillingStrategyEndpoint', 'createBillingStrategy', '2020-10-13 14:25:14', '成功', '{\"id\":3,\"name\":\"默认策略\",\"price\":100} & ', 'BillingStrategy');
INSERT INTO `t_operation_log` VALUES (186, 100000000000000010, 'BUSINESS_LOG', '平台新增 广告主的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'createAdvertiser', '2020-10-13 14:28:24', '成功', '{\"address\":\"北京-北京-东城区\",\"assistantId\":876708082437197830,\"city\":\"北京\",\"comeFrom\":0,\"companyName\":\"省广\",\"contactName\":\"王思\",\"contactPhone\":\"13611111111\",\"district\":\"东城区\",\"id\":24,\"lIndustry\":\"农业\",\"mIndustry\":\"谷物种植\",\"orgCode\":\"6e106be35a934151a7844ddbacadb53a\",\"orgId\":100000000000000086,\"password\":\"123456\",\"province\":\"北京\",\"xIndustry\":\"农、林、牧、渔业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (187, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-13 14:29:18', '成功', '24 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (188, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-13 16:32:24', '成功', '24 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (189, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-13 16:32:31', '成功', '24 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (190, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-13 17:16:48', '成功', '6 & {\"madeBy\":\"SYSTEM\",\"name\":\"平台管理员\",\"permIds\":[100000000000030001,100000000000030002,100000000000030003,100000000000010001,100000000000010002,100000000000010003,100000000000020001,100000000000020002,100000000000020003,100000000000030018,100000000000030019,100000000000030020,100000000000030021,100000000000030022,100000000000030024,100000000000310001,100000000000310002,100000000000310003,100000000000310004,100000000000030026,100000000000030027,100000000000030028,100000000000030029,100000000000030030,100000000000030031,100000000000030032,100000000000030033,100000000000030034,100000000000030035,100000000000030036,100000000000030037,100000000000030010,100000000000030012,100000000000030013,100000000000030042,100000000000030043,100000000000030014,100000000000030015,100000000000030016,100000000000030017,100000000000030044,100000000000030045,100000000000030046,100000000000030047,100000000000030048,100000000000030049,100000000000030050,100000000000030038,100000000000030039,100000000000030040,100000000000030041,100000000000011001,100000000000011002,100000000000011003,100000000000030051],\"roleCode\":\"101\",\"tips\":\"平台管理员\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (191, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-13 17:20:11', '成功', '18 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (192, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-13 17:20:16', '成功', '18 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (193, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-13 17:20:52', '成功', '24 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (194, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-13 17:21:07', '成功', '24 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (195, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-13 17:22:48', '成功', '15 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (196, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-13 17:22:53', '成功', '15 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (197, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-14 10:19:18', '成功', '24 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (198, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-14 10:19:30', '成功', '24 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (199, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-14 10:20:27', '成功', '6 & {\"madeBy\":\"SYSTEM\",\"name\":\"平台管理员\",\"permIds\":[100000000000030001,100000000000030002,100000000000030003,100000000000010001,100000000000010002,100000000000010003,100000000000020001,100000000000020002,100000000000020003,100000000000030018,100000000000030019,100000000000030020,100000000000030022,100000000000030024,100000000000310001,100000000000310002,100000000000310004,100000000000030026,100000000000030027,100000000000030028,100000000000030029,100000000000030030,100000000000030031,100000000000030032,100000000000030033,100000000000030034,100000000000030035,100000000000030036,100000000000030037,100000000000030010,100000000000030012,100000000000030042,100000000000030043,100000000000030014,100000000000030015,100000000000030016,100000000000030044,100000000000030045,100000000000030046,100000000000030047,100000000000030048,100000000000030049,100000000000030050,100000000000030038,100000000000030039,100000000000030040,100000000000030041,100000000000011001,100000000000011002,100000000000011003,100000000000030051,100000000000310003],\"roleCode\":\"101\",\"tips\":\"平台管理员\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (200, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-14 10:20:34', '成功', '24 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (201, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-14 10:21:01', '成功', '15 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (202, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-14 10:21:20', '成功', '15 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (203, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-14 15:05:36', '成功', '24 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (204, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-14 15:05:42', '成功', '24 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (205, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-14 15:06:25', '成功', '24 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (206, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-14 15:09:09', '成功', '24 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (207, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-14 15:10:28', '成功', '24 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (208, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-14 15:12:31', '成功', '24 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (209, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-14 15:13:01', '成功', '24 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (210, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-14 15:13:05', '成功', '24 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (211, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-14 15:23:19', '成功', '24 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (212, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-14 15:23:25', '成功', '24 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (213, 100000000000000010, 'BUSINESS_LOG', '平台新增 广告主的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'createAdvertiser', '2020-10-14 15:58:52', '成功', '{\"assistantId\":876708082437197830,\"comeFrom\":0,\"companyName\":\"test\",\"contactPhone\":\"13011112222\",\"id\":25,\"orgCode\":\"f08ba5fbdfbb457bb4224b56f71efc37\",\"orgId\":100000000000000087,\"password\":\"111111\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (214, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-14 16:20:49', '成功', '9 & {\"madeBy\":\"SYSTEM\",\"name\":\"影院管理人\",\"permIds\":[100000000000030018,100000000000030020,100000000000030049,100000000000030001,100000000000030002,100000000000030003,100000000000010001,100000000000010002,100000000000010003,100000000000030026],\"roleCode\":\"301\",\"tips\":\"影院\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (215, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-14 16:44:25', '成功', '9 & {\"madeBy\":\"SYSTEM\",\"name\":\"影院管理人\",\"permIds\":[100000000000030018,100000000000030020,100000000000030049,100000000000030001,100000000000030002,100000000000030003,100000000000010001,100000000000010002,100000000000010003,100000000000030026],\"roleCode\":\"301\",\"tips\":\"影院\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (216, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-14 16:48:29', '成功', '24 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (217, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-14 16:48:35', '成功', '24 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (218, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-14 17:27:19', '成功', '5 & {\"madeBy\":\"SYSTEM\",\"name\":\"店小二\",\"permIds\":[100000000000310001,100000000000310002,100000000000030010,100000000000030012,100000000000030042,100000000000030014,100000000000030044,100000000000030018,100000000000030022,100000000000030024,100000000000030026,100000000000030043,100000000000030015,100000000000310003,100000000000310004,100000000000030045],\"roleCode\":\"104\",\"tips\":\"复制广告主管理的角色\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (219, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-14 17:27:30', '成功', '8 & {\"madeBy\":\"SYSTEM\",\"name\":\"广告主-审核后\",\"permIds\":[100000000000030010,100000000000030011,100000000000030012,100000000000030013,100000000000030043,100000000000030014,100000000000030022,100000000000030023,100000000000030024,100000000000030025,100000000000030026,100000000000011001,100000000000030001,100000000000030002,100000000000030003,100000000000010001,100000000000010002,100000000000010003,100000000000020001,100000000000020002,100000000000020003],\"roleCode\":\"201\",\"tips\":\"广告主-审核后\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (220, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-14 18:18:19', '成功', '9 & {\"madeBy\":\"SYSTEM\",\"name\":\"影院管理人\",\"permIds\":[100000000000030018,100000000000030020,100000000000030049,100000000000030001,100000000000030002,100000000000030003,100000000000010001,100000000000010002,100000000000010003,100000000000030026,100000000000020001,100000000000020002,100000000000020003],\"roleCode\":\"301\",\"tips\":\"影院\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (221, 100000000000000010, 'BUSINESS_LOG', '广告主审核的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'passAdvertiser', '2020-10-16 09:52:14', '成功', '26 & \"PASS\" & {\"advertiserId\":26,\"id\":10,\"status\":\"PASS\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (222, 100000000000000078, 'BUSINESS_LOG', '广告主修改自身信息的操作', 876708082437197858, '13122223333', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiserSelf', '2020-10-16 10:06:22', '成功', '{\"assistantId\":876708082437197830,\"balance\":0,\"businessLicenseProve\":\"/attachments/689048cf-181c-4a15-be5e-38feaf82954f.jpg\",\"comeFrom\":0,\"companyName\":\"测试翻页效果\",\"contactPhone\":\"13122223333\",\"createTime\":1602231638000,\"id\":16,\"loginTime\":1602231638000,\"orgId\":100000000000000078,\"status\":\"PENDING_APPROVAL\",\"updateTime\":1602231638000} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (223, 100000000000000073, 'BUSINESS_LOG', 'create AdvertingMaterial的操作', 876708082437197852, '13422212814', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertingMaterialEndpoint', 'createAdvertingMaterial', '2020-10-16 10:15:17', '成功', '{\"advertiserResourcePassword\":\"111111\",\"advertiserResourceUrl\":\"http://www.Tencentyun.com\",\"id\":11,\"name\":\"素材\",\"orgId\":100000000000000073} & ', 'AdvertingMaterial');
INSERT INTO `t_operation_log` VALUES (224, 100000000000000010, 'BUSINESS_LOG', '平台新增 广告主的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'createAdvertiser', '2020-10-16 10:44:28', '成功', '{\"address\":\"上海-上海-黄浦区\",\"assistantId\":876708082437197836,\"city\":\"上海\",\"comeFrom\":0,\"companyName\":\"苦科技有限公司\",\"contactName\":\"ku\",\"contactPhone\":\"13600000001\",\"district\":\"黄浦区\",\"id\":27,\"lIndustry\":\"房地产业\",\"mIndustry\":\"房地产中介服务\",\"note\":\"经营房产销售、出租、二手房买卖交易等\",\"orgCode\":\"fddeec84069e4a18934d7dd7c9a3eabb\",\"orgId\":100000000000000088,\"password\":\"111111\",\"province\":\"上海\",\"xIndustry\":\"房地产业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (225, 100000000000000010, 'BUSINESS_LOG', '广告主审核的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'passAdvertiser', '2020-10-16 10:50:31', '成功', '27 & \"PASS\" & {\"advertiserId\":27,\"id\":11,\"status\":\"PASS\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (226, 100000000000000088, 'BUSINESS_LOG', 'create AdvertingMaterial的操作', 876708082437197885, '13600000001', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertingMaterialEndpoint', 'createAdvertingMaterial', '2020-10-16 11:28:06', '成功', '{\"advertiserResourcePassword\":\"111111\",\"advertiserResourceUrl\":\"http://www.baiduyun.com\",\"id\":12,\"name\":\"素材\",\"orgId\":100000000000000088} & ', 'AdvertingMaterial');
INSERT INTO `t_operation_log` VALUES (227, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-16 11:39:47', '成功', '27 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (228, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-16 11:39:54', '成功', '27 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (229, 100000000000000010, 'BUSINESS_LOG', 'create Cinema的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'createCinema', '2020-10-16 15:03:55', '成功', '{\"address\":\"天河区 中山大道西1138号合生骏景广场三楼\",\"assistantId\":876708082437197830,\"businessArea\":\"天河区棠下\",\"city\":\"广州\",\"cityLevel\":\"A2\",\"contact\":\"13560000001\",\"contactName\":\"hayi\",\"district\":\"天河区\",\"id\":7,\"lineId\":7,\"lineName\":\"广州金逸珠江\",\"name\":\"哈艺时尚影城(合生骏景店)\",\"orgCode\":\"6bc94044a1834caf8888f494e122c741\",\"orgId\":100000000000000089,\"password\":\"123456\",\"province\":\"广东\",\"qualificationNumber\":\"82\",\"roomNumber\":9,\"seatNumber\":621} & ', 'Cinema');
INSERT INTO `t_operation_log` VALUES (230, 100000000000000082, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197865, '18620909958', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-16 15:09:11', '成功', '31 & {\"advertingMaterialVOS\":[{\"advertiserResourcePassword\":\"111111\",\"advertiserResourceUrl\":\"http://www.baiduyun.com\",\"delFlag\":\"0\",\"materialId\":12,\"materialName\":\"素材\"}],\"advertingName\":\"广告场次\",\"advertiserId\":27,\"assistantId\":876708082437197862,\"budget\":14700.00,\"cinemaAddress\":\"黄浦区\",\"cinemaId\":6,\"cinemaName\":\"大地影院\",\"city\":\"广州\",\"contact\":\"18620909958\",\"contactName\":\"gou\",\"createTime\":1602819804000,\"duration\":\"30\",\"endAlarm\":\"0\",\"filmEndDate\":1603555200000,\"filmStartDate\":1603296000000,\"id\":31,\"orgId\":100000000000000082,\"planId\":45,\"planNumber\":\"1316944099504427008\",\"planningOrderId\":29,\"releaseType\":\"BY_ROUNDS\",\"reportFileName\":\"BOM单.docx\",\"reportFileUrl\":\"/attachments/85374973-32c3-4be8-afe9-313c10bc7c9d.docx\",\"roomNumber\":7,\"round\":7,\"startAlarm\":\"0\",\"status\":\"TO_BE_VERIFY\",\"taskNumber\":\"1316947824969125888\",\"timeSlot\":\"AFTER_THREE_MINUTES\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (231, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-16 15:40:22', '成功', '8 & {\"madeBy\":\"SYSTEM\",\"name\":\"广告主-审核后\",\"permIds\":[100000000000030010,100000000000030011,100000000000030012,100000000000030013,100000000000030043,100000000000030014,100000000000030022,100000000000030023,100000000000030024,100000000000030025,100000000000030026,100000000000011001,100000000000030001,100000000000030002,100000000000030003,100000000000010001,100000000000010002,100000000000010003,100000000000020001,100000000000020002,100000000000020003],\"roleCode\":\"201\",\"tips\":\"广告主-审核后\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (232, 100000000000000010, 'BUSINESS_LOG', '平台新增 广告主的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'createAdvertiser', '2020-10-16 16:10:02', '成功', '{\"address\":\"广东-深圳-南山区\",\"assistantId\":876708082437197836,\"city\":\"深圳\",\"comeFrom\":0,\"companyName\":\"Tuber有限公司\",\"contactName\":\"tuber\",\"contactPhone\":\"13800138001\",\"district\":\"南山区\",\"id\":1,\"lIndustry\":\"批发业\",\"mIndustry\":\"食品、饮料及烟草制品批发\",\"note\":\"经营食品、饮料批发\",\"orgCode\":\"1ca8d7df8afb4bb7a7542c1ada277aac\",\"orgId\":100000000000000090,\"password\":\"111111\",\"province\":\"广东\",\"xIndustry\":\"批发和零售业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (233, 100000000000000010, 'BUSINESS_LOG', '广告主审核的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'passAdvertiser', '2020-10-16 16:11:23', '成功', '1 & \"PASS\" & {\"advertiserId\":1,\"id\":1,\"status\":\"PASS\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (234, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-16 16:11:27', '成功', '1 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (235, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-16 16:11:36', '成功', '1 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (236, 100000000000000090, 'BUSINESS_LOG', 'create AdvertingMaterial的操作', 876708082437197889, '13800138001', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertingMaterialEndpoint', 'createAdvertingMaterial', '2020-10-16 16:12:10', '成功', '{\"advertiserResourcePassword\":\"111111\",\"advertiserResourceUrl\":\"http://www.baiduyun.com\",\"id\":13,\"name\":\"广告\",\"orgId\":100000000000000090} & ', 'AdvertingMaterial');
INSERT INTO `t_operation_log` VALUES (237, 100000000000000090, 'BUSINESS_LOG', 'create AdvertingMaterial的操作', 876708082437197889, '13800138001', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertingMaterialEndpoint', 'createAdvertingMaterial', '2020-10-16 16:12:19', '成功', '{\"advertiserResourcePassword\":\"123456\",\"advertiserResourceUrl\":\"http://www.Tencentyun.com\",\"id\":14,\"name\":\"素材\",\"orgId\":100000000000000090} & ', 'AdvertingMaterial');
INSERT INTO `t_operation_log` VALUES (238, 100000000000000010, 'BUSINESS_LOG', '平台新增 广告主的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'createAdvertiser', '2020-10-16 18:00:25', '成功', '{\"address\":\"天津-天津-河东区\",\"assistantId\":876708082437197830,\"city\":\"天津\",\"comeFrom\":0,\"companyName\":\"省广\",\"contactName\":\"tuber\",\"contactPhone\":\"13800138002\",\"district\":\"河东区\",\"id\":3,\"lIndustry\":\"石油和天然气开采业\",\"mIndustry\":\"天然气开采\",\"orgCode\":\"911d9c7438044d3b865d7c365398b40f\",\"orgId\":100000000000000092,\"password\":\"111111\",\"province\":\"天津\",\"xIndustry\":\"采矿业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (239, 100000000000000010, 'BUSINESS_LOG', '广告主审核的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'passAdvertiser', '2020-10-16 18:00:49', '成功', '3 & \"REFUSE\" & {\"advertiserId\":3,\"id\":2,\"note\":\"资料不全，请重新提交\",\"status\":\"REFUSE\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (240, 100000000000000010, 'BUSINESS_LOG', '更新 广告主的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiser', '2020-10-16 18:29:46', '成功', '3 & {\"address\":\"天津-天津-河东区\",\"assistantId\":876708082437197830,\"balance\":0,\"city\":\"天津\",\"comeFrom\":0,\"companyName\":\"省广\",\"contactName\":\"tuber\",\"contactPhone\":\"13800138002\",\"createTime\":1602842425000,\"district\":\"河东区\",\"id\":3,\"lIndustry\":\"石油和天然气开采业\",\"loginTime\":1602842425000,\"mIndustry\":\"天然气开采\",\"orgId\":100000000000000092,\"province\":\"天津\",\"status\":\"REFUSE\",\"updateTime\":1602842448000,\"xIndustry\":\"采矿业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (241, 100000000000000092, 'BUSINESS_LOG', '广告主修改自身信息的操作', 876708082437197891, '13800138002', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiserSelf', '2020-10-16 18:32:03', '成功', '{\"address\":\"天津-天津-河东区\",\"assistantId\":876708082437197830,\"balance\":0,\"city\":\"天津\",\"comeFrom\":0,\"companyName\":\"省广\",\"contactName\":\"tuber\",\"contactPhone\":\"13800138002\",\"createTime\":1602842425000,\"district\":\"河东区\",\"id\":3,\"lIndustry\":\"石油和天然气开采业\",\"loginTime\":1602842425000,\"mIndustry\":\"天然气开采\",\"orgId\":100000000000000092,\"province\":\"天津\",\"status\":\"REFUSE\",\"updateTime\":1602842448000,\"xIndustry\":\"采矿业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (242, 100000000000000010, 'BUSINESS_LOG', 'delete AdvertingMaterial的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertingMaterialEndpoint', 'deleteAdvertingMaterial', '2020-10-17 10:00:30', '成功', '11 & ', 'AdvertingMaterial');
INSERT INTO `t_operation_log` VALUES (243, 100000000000000010, 'BUSINESS_LOG', 'delete AdvertingMaterial的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertingMaterialEndpoint', 'deleteAdvertingMaterial', '2020-10-17 10:00:38', '成功', '6 & ', 'AdvertingMaterial');
INSERT INTO `t_operation_log` VALUES (244, 100000000000000010, 'BUSINESS_LOG', 'create Cinema的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'createCinema', '2020-10-17 10:10:16', '成功', '{\"address\":\"广州市海珠区宝岗大道498号广百新一城6楼\",\"assistantId\":876708082437197830,\"businessArea\":\"广州海珠区江南西广百新一城\",\"city\":\"广州\",\"cityLevel\":\"TIER_2_CITY\",\"contact\":\"13560126671\",\"contactName\":\"sougou\",\"district\":\"海珠区\",\"id\":2,\"lineId\":2,\"lineName\":\"广东大地\",\"name\":\"UME国际影城\",\"note\":\"电影院,广百新一城,UME,江南西,电影,团购,3D,新一城,广百\",\"orgCode\":\"5f2308e667d24d03b1336c73d36a4bd3\",\"orgId\":100000000000000093,\"password\":\"111111\",\"province\":\"广东\",\"qualificationNumber\":\"00123\",\"roomNumber\":9,\"seatNumber\":623} & ', 'Cinema');
INSERT INTO `t_operation_log` VALUES (245, 100000000000000010, 'BUSINESS_LOG', 'update Cinema的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'updateCinema', '2020-10-17 10:55:32', '成功', '2 & {\"address\":\"广州市海珠区宝岗大道498号广百新一城6楼\",\"assistantId\":876708082437197830,\"businessArea\":\"广州海珠区江南西广百新一城\",\"city\":\"广州\",\"cityLevel\":\"TIER_1_CITY\",\"contact\":\"13560126671\",\"contactName\":\"sougou\",\"createTime\":1602900615000,\"district\":\"海珠区\",\"id\":2,\"lineId\":2,\"lineName\":\"广东大地\",\"name\":\"UME国际影城\",\"note\":\"电影院,广百新一城,UME,江南西,电影,团购,3D,新一城,广百\",\"orgId\":100000000000000093,\"province\":\"广东\",\"qualificationNumber\":\"00123\",\"roomNumber\":9,\"seatNumber\":623,\"ticket\":0,\"updateTime\":1602900615000} & ', 'Cinema');
INSERT INTO `t_operation_log` VALUES (246, 100000000000000010, 'BUSINESS_LOG', 'update Cinema的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'updateCinema', '2020-10-17 10:55:38', '成功', '2 & {\"address\":\"广州市海珠区宝岗大道498号广百新一城6楼\",\"assistantId\":876708082437197830,\"businessArea\":\"广州海珠区江南西广百新一城\",\"city\":\"广州\",\"cityLevel\":\"TIER_2_CITY\",\"contact\":\"13560126671\",\"contactName\":\"sougou\",\"createTime\":1602900615000,\"district\":\"海珠区\",\"id\":2,\"lineId\":2,\"lineName\":\"广东大地\",\"name\":\"UME国际影城\",\"note\":\"电影院,广百新一城,UME,江南西,电影,团购,3D,新一城,广百\",\"orgId\":100000000000000093,\"province\":\"广东\",\"qualificationNumber\":\"00123\",\"roomNumber\":9,\"seatNumber\":623,\"ticket\":0,\"updateTime\":1602900615000} & ', 'Cinema');
INSERT INTO `t_operation_log` VALUES (247, 100000000000000092, 'BUSINESS_LOG', '广告主修改自身信息的操作', 876708082437197891, '13800138002', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiserSelf', '2020-10-17 11:19:29', '成功', '{\"address\":\"天津-天津-河东区\",\"assistantId\":876708082437197830,\"balance\":0,\"city\":\"厦门\",\"comeFrom\":0,\"companyName\":\"广省集团\",\"contactName\":\"tuber\",\"contactPhone\":\"13800138002\",\"createTime\":1602842425000,\"district\":\"思明区\",\"id\":3,\"lIndustry\":\"石油和天然气开采业\",\"loginTime\":1602842425000,\"mIndustry\":\"天然气开采\",\"orgId\":100000000000000092,\"province\":\"福建\",\"status\":\"REFUSE\",\"updateTime\":1602842448000,\"xIndustry\":\"采矿业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (248, 100000000000000092, 'BUSINESS_LOG', '广告主修改自身信息的操作', 876708082437197891, '13800138002', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiserSelf', '2020-10-17 11:21:17', '成功', '{\"address\":\"天津-天津-河东区\",\"assistantId\":876708082437197830,\"balance\":0,\"city\":\"厦门\",\"comeFrom\":0,\"companyName\":\"广省集团\",\"contactName\":\"tuber\",\"contactPhone\":\"13800138002\",\"createTime\":1602842425000,\"district\":\"思明区\",\"id\":3,\"lIndustry\":\"石油和天然气开采业\",\"loginTime\":1602842425000,\"mIndustry\":\"天然气开采\",\"orgId\":100000000000000092,\"province\":\"福建\",\"status\":\"REFUSE\",\"updateTime\":1602842448000,\"xIndustry\":\"采矿业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (249, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197862, '15019975481', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-17 11:26:11', '成功', '34 & {\"advertingMaterialVOS\":[{\"advertiserResourcePassword\":\"111111\",\"advertiserResourceUrl\":\"http://www.baiduyun.com\",\"delFlag\":\"0\",\"materialId\":13,\"materialName\":\"广告\"},{\"advertiserResourcePassword\":\"123456\",\"advertiserResourceUrl\":\"http://www.Tencentyun.com\",\"delFlag\":\"0\",\"materialId\":14,\"materialName\":\"素材\"}],\"advertingName\":\"百岁山饮用水\",\"advertiserId\":1,\"assistantId\":876708082437197862,\"budget\":64800.00,\"cinemaAddress\":\"广州市海珠区宝岗大道498号广百新一城6楼\",\"cinemaId\":2,\"cinemaName\":\"UME国际影城\",\"city\":\"广州\",\"contact\":\"13560126671\",\"contactName\":\"sougou\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602904631000,\"duration\":\"45\",\"endAlarm\":\"0\",\"filmEndDate\":1605110400000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1604332800000,\"id\":34,\"orgId\":100000000000000093,\"planId\":49,\"planNumber\":\"1317302392223567872\",\"planningOrderId\":31,\"releaseType\":\"BY_FILM\",\"roomNumber\":9,\"round\":8,\"startAlarm\":\"0\",\"status\":\"DELIVERED\",\"taskNumber\":\"1317303618847772672\",\"timeSlot\":\"AFTER_THREE_MINUTES\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (250, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197862, '15019975481', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-17 11:27:09', '成功', '34 & {\"advertingMaterialVOS\":[{\"advertiserResourcePassword\":\"111111\",\"advertiserResourceUrl\":\"http://www.baiduyun.com\",\"delFlag\":\"0\",\"materialId\":13,\"materialName\":\"广告\"},{\"advertiserResourcePassword\":\"123456\",\"advertiserResourceUrl\":\"http://www.Tencentyun.com\",\"delFlag\":\"0\",\"materialId\":14,\"materialName\":\"素材\"}],\"advertingName\":\"百岁山饮用水\",\"advertiserId\":1,\"assistantId\":876708082437197862,\"budget\":57600.00,\"cinemaAddress\":\"广州市海珠区宝岗大道498号广百新一城6楼\",\"cinemaId\":2,\"cinemaName\":\"UME国际影城\",\"city\":\"广州\",\"contact\":\"13560126671\",\"contactName\":\"sougou\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602904631000,\"duration\":\"45\",\"endAlarm\":\"0\",\"filmEndDate\":1604505600000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1603814400000,\"id\":34,\"orgId\":100000000000000093,\"planId\":49,\"planNumber\":\"1317302392223567872\",\"planningOrderId\":31,\"releaseType\":\"BY_FILM\",\"roomNumber\":9,\"round\":8,\"startAlarm\":\"0\",\"status\":\"DELIVERED\",\"taskNumber\":\"1317303618847772672\",\"timeSlot\":\"AFTER_THREE_MINUTES\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (251, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197862, '15019975481', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-17 11:27:43', '成功', '33 & {\"advertingMaterialVOS\":[{\"advertiserResourcePassword\":\"111111\",\"advertiserResourceUrl\":\"http://www.baiduyun.com\",\"delFlag\":\"0\",\"materialId\":13,\"materialName\":\"广告\"},{\"advertiserResourcePassword\":\"123456\",\"advertiserResourceUrl\":\"http://www.Tencentyun.com\",\"delFlag\":\"0\",\"materialId\":14,\"materialName\":\"素材\"}],\"advertingName\":\"百岁山饮用水\",\"advertiserId\":1,\"assistantId\":876708082437197862,\"budget\":44100.00,\"cinemaAddress\":\"广东省广州市白云区\",\"cinemaId\":1,\"cinemaName\":\"广东大地电影院（白云）\",\"city\":\"广州\",\"contact\":\"13560439016\",\"contactName\":\"zhangs\",\"cover\":\"https://p0.meituan.net/movie/88dff6a7d97c6a91a125cece93ba72411017894.jpg@464w_644h_1e_1c\",\"createTime\":1602904631000,\"duration\":\"45\",\"endAlarm\":\"0\",\"filmEndDate\":1605110400000,\"filmId\":4,\"filmName\":\"西游记真假美猴王\",\"filmStartDate\":1604332800000,\"id\":33,\"orgId\":100000000000000070,\"planId\":49,\"planNumber\":\"1317302392223567872\",\"planningOrderId\":31,\"releaseType\":\"BY_FILM\",\"roomNumber\":7,\"round\":7,\"startAlarm\":\"0\",\"status\":\"ABOLISHED\",\"taskNumber\":\"1317303618784858112\",\"timeSlot\":\"AFTER_THREE_MINUTES\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (252, 100000000000000010, 'BUSINESS_LOG', 'delete Cinema的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'deleteCinema', '2020-10-17 12:10:17', '成功', '1 & ', 'Cinema');
INSERT INTO `t_operation_log` VALUES (253, 100000000000000010, 'BUSINESS_LOG', 'create Cinema的操作', 876708082437197862, '15019975481', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'createCinema', '2020-10-17 12:20:24', '成功', '{\"address\":\"佛山禅城区华远东路63号兆阳广场4层\",\"assistantId\":876708082437197862,\"businessArea\":\"佛山禅城\",\"city\":\"佛山\",\"cityLevel\":\"TIER_3_CITY\",\"contact\":\"13560126672\",\"contactName\":\"朝阳\",\"district\":\"禅城区\",\"id\":766985300982366209,\"lineId\":6,\"lineName\":\"中影星美\",\"name\":\"保利国际影城佛山兆阳店\",\"note\":\"影城按照国家五星级标准建造，是目前佛山地区规模最大的现代影城。\",\"orgCode\":\"e62ded2fdd8d4d979e519689b09c77a1\",\"orgId\":100000000000000094,\"password\":\"111111\",\"province\":\"广东\",\"qualificationNumber\":\"8.3\",\"roomNumber\":9,\"seatNumber\":845} & ', 'Cinema');
INSERT INTO `t_operation_log` VALUES (254, 100000000000000010, 'BUSINESS_LOG', 'create Cinema的操作', 876708082437197862, '15019975481', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'createCinema', '2020-10-17 12:26:20', '成功', '{\"address\":\"龙岗区布吉地铁站A出口对面龙珠商城5楼\",\"assistantId\":876708082437197862,\"businessArea\":\"深圳市龙岗区布吉地铁站附近\",\"city\":\"深圳\",\"cityLevel\":\"TIER_2_CITY\",\"contact\":\"13560126673\",\"contactName\":\"nanfang\",\"district\":\"龙岗区\",\"id\":766985300982366210,\"lineId\":4,\"lineName\":\"中影南方新干线\",\"name\":\"中影南方影城布吉店\",\"note\":\"中影南方影城布吉店立属于中影南方品牌直营投资，全程按超五星级标准配置。该影城地处深圳市龙岗区布吉街道，交通极其便利，多条公交线路直接抵达，影院设有6个影厅（共627个豪华座位）。 影院具有的设备优势：1，采用高保真同轴音响；2，美国版的专用豪华皮椅；3，国际标准的4K放映机；4，超轻便的3D眼镜 中影南方影城将高水准的科技与人性化的服务融入了每一个细节，它给电影消费者带来的是不仅仅是影片自身内容的观感，同时还是影城环境、电影文化等全方位的超级享受。\",\"orgCode\":\"194650ada0be479eabfe019b3b0e28c7\",\"orgId\":100000000000000095,\"password\":\"111111\",\"province\":\"广东\",\"qualificationNumber\":\"85\",\"roomNumber\":6,\"seatNumber\":627} & ', 'Cinema');
INSERT INTO `t_operation_log` VALUES (255, 100000000000000010, 'BUSINESS_LOG', 'delete Cinema的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'deleteCinema', '2020-10-17 12:59:41', '成功', '2 & ', 'Cinema');
INSERT INTO `t_operation_log` VALUES (256, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-17 15:44:38', '成功', '2 & {\"madeBy\":\"SYSTEM\",\"name\":\"商务主管\",\"permIds\":[100000000000030018,100000000000030020,100000000000030048,100000000000030050,100000000000030047,100000000000030026,100000000000010001,100000000000030001,100000000000030051,100000000000030034,100000000000030035,100000000000030036,100000000000030037,100000000000030053,100000000000030049],\"roleCode\":\"105\",\"tips\":\"各个商务的管理人\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (257, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-17 15:44:46', '成功', '4 & {\"madeBy\":\"SYSTEM\",\"name\":\"商务\",\"permIds\":[100000000000030018,100000000000030020,100000000000030047,100000000000030048,100000000000030050,100000000000030034,100000000000030036,100000000000030026,100000000000030051,100000000000030035,100000000000030037,100000000000030049],\"roleCode\":\"106\",\"tips\":\"负责影院管理的角色\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (258, 100000000000000010, 'BUSINESS_LOG', 'update BillingStrategy的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.BillingStrategyEndpoint', 'updateBillingStrategy', '2020-10-17 16:51:02', '成功', '2 & {\"boxOffice\":\"MORE_THAN_FIFTEEN_MILLION\",\"cityLevel\":\"TIER_2_CITY\",\"createTime\":1602216811000,\"id\":2,\"name\":\"场次\",\"price\":350,\"releaseType\":\"BY_ROUNDS\",\"retailPrice\":350,\"timeSlot\":\"IN_ONE_MINUTE\"} & ', 'BillingStrategy');
INSERT INTO `t_operation_log` VALUES (259, 100000000000000010, 'BUSINESS_LOG', 'update BillingStrategy的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.BillingStrategyEndpoint', 'updateBillingStrategy', '2020-10-17 16:51:13', '成功', '2 & {\"boxOffice\":\"MORE_THAN_FIFTEEN_MILLION\",\"cityLevel\":\"TIER_1_CITY\",\"createTime\":1602216811000,\"id\":2,\"name\":\"场次\",\"price\":350,\"releaseType\":\"BY_ROUNDS\",\"retailPrice\":350,\"timeSlot\":\"IN_ONE_MINUTE\"} & ', 'BillingStrategy');
INSERT INTO `t_operation_log` VALUES (260, 100000000000000010, 'BUSINESS_LOG', 'update BillingStrategy的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.BillingStrategyEndpoint', 'updateBillingStrategy', '2020-10-17 16:51:21', '成功', '1 & {\"boxOffice\":\"MORE_THAN_FIFTEEN_MILLION\",\"cityLevel\":\"TIER_2_CITY\",\"createTime\":1602216780000,\"id\":1,\"name\":\"影片\",\"price\":300,\"releaseType\":\"BY_FILM\",\"retailPrice\":300,\"timeSlot\":\"IN_ONE_MINUTE\"} & ', 'BillingStrategy');
INSERT INTO `t_operation_log` VALUES (261, 100000000000000092, 'BUSINESS_LOG', '广告主修改自身信息的操作', 876708082437197891, '13800138002', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiserSelf', '2020-10-17 16:56:51', '成功', '{\"address\":\"天津-天津-河东区\",\"assistantId\":876708082437197830,\"balance\":0,\"city\":\"厦门\",\"comeFrom\":0,\"companyName\":\"广省集团\",\"contactName\":\"tuber\",\"contactPhone\":\"13800138002\",\"createTime\":1602842425000,\"district\":\"思明区\",\"id\":3,\"lIndustry\":\"石油和天然气开采业\",\"loginTime\":1602842425000,\"mIndustry\":\"天然气开采\",\"orgId\":100000000000000092,\"province\":\"福建\",\"status\":\"REFUSE\",\"updateTime\":1602842448000,\"xIndustry\":\"采矿业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (262, 100000000000000092, 'BUSINESS_LOG', '广告主修改自身信息的操作', 876708082437197891, '13800138002', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiserSelf', '2020-10-17 17:05:20', '成功', '{\"address\":\"天津-天津-河东区\",\"assistantId\":876708082437197830,\"balance\":0,\"city\":\"厦门\",\"comeFrom\":0,\"companyName\":\"广省集团\",\"contactName\":\"tuber\",\"contactPhone\":\"13800138002\",\"createTime\":1602842425000,\"district\":\"思明区\",\"id\":3,\"lIndustry\":\"石油和天然气开采业\",\"loginTime\":1602842425000,\"mIndustry\":\"天然气开采\",\"orgId\":100000000000000092,\"province\":\"福建\",\"status\":\"PENDING_APPROVAL\",\"updateTime\":1602842448000,\"xIndustry\":\"采矿业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (263, 100000000000000010, 'BUSINESS_LOG', '广告主审核的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'passAdvertiser', '2020-10-17 17:06:40', '成功', '3 & \"REFUSE\" & {\"advertiserId\":3,\"id\":3,\"note\":\"不通过\",\"status\":\"REFUSE\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (264, 100000000000000092, 'BUSINESS_LOG', '广告主修改自身信息的操作', 876708082437197891, '13800138002', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiserSelf', '2020-10-17 17:06:55', '成功', '{\"address\":\"天津-天津-河东区\",\"assistantId\":876708082437197830,\"balance\":0,\"city\":\"厦门\",\"comeFrom\":0,\"companyName\":\"广省集团\",\"contactName\":\"tuber\",\"contactPhone\":\"13800138002\",\"createTime\":1602842425000,\"district\":\"思明区\",\"id\":3,\"lIndustry\":\"石油和天然气开采业\",\"loginTime\":1602842425000,\"mIndustry\":\"天然气开采\",\"orgId\":100000000000000092,\"province\":\"福建\",\"status\":\"PENDING_APPROVAL\",\"updateTime\":1602925600000,\"xIndustry\":\"采矿业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (265, 100000000000000010, 'BUSINESS_LOG', '给所有导入的影院分配账号的操作', 876708082437197862, '15019975481', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'setImportCinemaUser', '2020-10-17 17:09:38', '成功', '', '影院');
INSERT INTO `t_operation_log` VALUES (266, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197862, '15019975481', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-17 17:19:12', '成功', '35 & {\"advertingMaterialVOS\":[{\"advertiserResourcePassword\":\"123456\",\"advertiserResourceUrl\":\"http://www.Tencentyun.com\",\"delFlag\":\"0\",\"materialId\":14,\"materialName\":\"素材\"}],\"advertingName\":\"测\",\"advertiserId\":1,\"assistantId\":876708082437197862,\"budget\":7200.00,\"cinemaAddress\":\"龙岗区布吉地铁站A出口对面龙珠商城5楼\",\"cinemaId\":766985300982366210,\"cinemaName\":\"中影南方影城布吉店\",\"city\":\"深圳\",\"contact\":\"13560126673\",\"contactName\":\"nanfang\",\"cover\":\"https://p1.meituan.net/movie/988ab3d3a50f51f31d090e84da88d5ae3461853.jpg@464w_644h_1e_1c\",\"createTime\":1602926319000,\"duration\":\"30\",\"endAlarm\":\"0\",\"filmEndDate\":1604160000000,\"filmId\":3,\"filmName\":\"夺冠\",\"filmStartDate\":1603987200000,\"id\":35,\"orgId\":100000000000000095,\"planId\":50,\"planNumber\":\"1317394436090630144\",\"planningOrderId\":32,\"releaseType\":\"BY_FILM\",\"roomNumber\":6,\"round\":6,\"startAlarm\":\"0\",\"status\":\"TO_BE_DELIVER\",\"taskNumber\":\"1317394583172288512\",\"timeSlot\":\"AFTER_ONE_MINUTE\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (267, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197862, '15019975481', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-17 17:19:25', '成功', '35 & {\"advertingMaterialVOS\":[{\"advertiserResourcePassword\":\"123456\",\"advertiserResourceUrl\":\"http://www.Tencentyun.com\",\"delFlag\":\"0\",\"materialId\":14,\"materialName\":\"素材\"}],\"advertingName\":\"测\",\"advertiserId\":1,\"assistantId\":876708082437197862,\"budget\":9800.00,\"cinemaAddress\":\"龙岗区布吉地铁站A出口对面龙珠商城5楼\",\"cinemaId\":766985300982366210,\"cinemaName\":\"中影南方影城布吉店\",\"city\":\"深圳\",\"contact\":\"13560126673\",\"contactName\":\"nanfang\",\"cover\":\"https://p1.meituan.net/movie/988ab3d3a50f51f31d090e84da88d5ae3461853.jpg@464w_644h_1e_1c\",\"createTime\":1602926319000,\"duration\":\"30\",\"endAlarm\":\"0\",\"filmEndDate\":1604160000000,\"filmId\":3,\"filmName\":\"夺冠\",\"filmStartDate\":1603987200000,\"id\":35,\"orgId\":100000000000000095,\"planId\":50,\"planNumber\":\"1317394436090630144\",\"planningOrderId\":32,\"releaseType\":\"BY_FILM\",\"roomNumber\":7,\"round\":7,\"startAlarm\":\"0\",\"status\":\"DELIVERED\",\"taskNumber\":\"1317394583172288512\",\"timeSlot\":\"AFTER_ONE_MINUTE\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (268, 100000000000000010, 'BUSINESS_LOG', 'update FilmSchedule的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.FilmScheduleEndpoint', 'updateFilmSchedule', '2020-10-19 10:19:44', '成功', '766605978794721280 & {\"createTime\":1602814708000,\"filmEndTime\":1607616000000,\"filmName\":\"一点就到家\",\"filmStartTime\":1605024000000,\"id\":766605978794721280,\"manufactureAreas\":\"中国大陆\",\"producer\":\"阿里巴巴影业(北京)有限公司\",\"updateTime\":1602814708000} & ', 'FilmSchedule');
INSERT INTO `t_operation_log` VALUES (269, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197862, '15019975481', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-19 11:27:43', '成功', '37 & {\"advertingMaterialVOS\":[{\"advertiserResourcePassword\":\"123456\",\"advertiserResourceUrl\":\"http://www.Tencentyun.com\",\"delFlag\":\"0\",\"materialId\":14,\"materialName\":\"素材\"},{\"advertiserResourcePassword\":\"111111\",\"advertiserResourceUrl\":\"http://www.baiduyun.com\",\"assistantResourceUrl\":\"http://www.baiduyun.com\",\"delFlag\":\"0\",\"materialId\":13,\"materialName\":\"广告\"}],\"advertingName\":\"shouji\",\"advertiserId\":1,\"assistantId\":876708082437197862,\"budget\":7200.00,\"cinemaId\":767073150625120256,\"cinemaName\":\"北京金逸朝阳影城\",\"city\":\"北京\",\"contact\":\"13560126669\",\"contactName\":\"张三\",\"createTime\":1603077735000,\"duration\":\"30\",\"endAlarm\":\"0\",\"filmEndDate\":1604073600000,\"filmStartDate\":1603900800000,\"id\":37,\"planId\":53,\"planNumber\":\"1318023965641412608\",\"planningOrderId\":33,\"releaseType\":\"BY_ROUNDS\",\"roomNumber\":6,\"round\":6,\"startAlarm\":\"0\",\"status\":\"DELIVERED\",\"taskNumber\":\"1318029665830572032\",\"timeSlot\":\"AFTER_ONE_MINUTE\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (270, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-19 12:12:37', '成功', '1 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (271, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-19 12:13:05', '成功', '1 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (272, 100000000000000090, 'BUSINESS_LOG', '修改个人资料的操作', 876708082437197889, '13800138001', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateInfo', '2020-10-19 12:13:32', '成功', '{\"account\":\"13800138001\",\"avatar\":\"/attachments/b1c4412a-3734-4df5-9479-14b19471cb6a.jpg\",\"createtime\":1602835802000,\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197889,\"isAppUser\":0,\"name\":\"广告主用户\",\"passwordReset\":1,\"phone\":\"13800138001\",\"status\":1,\"tenantOrgId\":100000000000000090} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (273, 100000000000000090, 'BUSINESS_LOG', '修改个人资料的操作', 876708082437197889, '13800138001', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateInfo', '2020-10-19 12:14:41', '成功', '{\"account\":\"13800138001\",\"avatar\":\"\",\"createtime\":1602835802000,\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197889,\"isAppUser\":0,\"name\":\"广告主用户\",\"passwordReset\":1,\"phone\":\"13800138001\",\"status\":1,\"tenantOrgId\":100000000000000090} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (274, 100000000000000090, 'BUSINESS_LOG', '修改个人资料的操作', 876708082437197889, '13800138001', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'updateInfo', '2020-10-19 12:14:47', '成功', '{\"account\":\"13800138001\",\"avatar\":\"\",\"createtime\":1602835802000,\"emailValidated\":0,\"extraUserType\":0,\"id\":876708082437197889,\"isAppUser\":0,\"name\":\"广告主用户\",\"passwordReset\":1,\"phone\":\"13800138001\",\"status\":1,\"tenantOrgId\":100000000000000090} & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (275, 100000000000000010, 'BUSINESS_LOG', 'update FilmSchedule的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.FilmScheduleEndpoint', 'updateFilmSchedule', '2020-10-19 12:34:45', '成功', '766605978794721280 & {\"createTime\":1602814708000,\"filmEndTime\":1607616000000,\"filmName\":\"一点就到家\",\"filmStartTime\":1605024000000,\"id\":766605978794721280,\"manufactureAreas\":\"中国大陆\",\"producer\":\"阿里巴巴影业(北京)有限公司\",\"updateTime\":1602814708000} & ', 'FilmSchedule');
INSERT INTO `t_operation_log` VALUES (276, 100000000000000094, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197893, '13560126672', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-19 15:34:16', '成功', '40 & {\"advertingMaterialVOS\":[{\"advertiserResourcePassword\":\"111111\",\"advertiserResourceUrl\":\"http://www.baiduyun.com\",\"assistantResourceUrl\":\"http://www.baiduyun.com\",\"delFlag\":\"0\",\"materialId\":13,\"materialName\":\"广告\"}],\"advertingName\":\"test\",\"advertiserId\":1,\"assistantId\":876708082437197862,\"budget\":9800.00,\"cinemaAddress\":\"佛山禅城区华远东路63号兆阳广场4层\",\"cinemaId\":766985300982366209,\"cinemaName\":\"保利国际影城佛山兆阳店\",\"city\":\"佛山\",\"contact\":\"13560126672\",\"contactName\":\"朝阳\",\"createTime\":1603092776000,\"duration\":\"30\",\"endAlarm\":\"0\",\"filmEndDate\":1604073600000,\"filmStartDate\":1603900800000,\"id\":40,\"orgId\":100000000000000094,\"planId\":54,\"planNumber\":\"1318087390081978368\",\"planningOrderId\":35,\"releaseType\":\"BY_ROUNDS\",\"roomNumber\":7,\"round\":7,\"startAlarm\":\"0\",\"status\":\"DELIVERED\",\"taskNumber\":\"1318092754777149440\",\"timeSlot\":\"IN_ONE_MINUTE\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (277, 100000000000000010, 'BUSINESS_LOG', 'delete AdvertingMaterial的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertingMaterialEndpoint', 'deleteAdvertingMaterial', '2020-10-19 16:31:10', '成功', '5 & ', 'AdvertingMaterial');
INSERT INTO `t_operation_log` VALUES (278, 100000000000000010, 'BUSINESS_LOG', '平台新增 广告主的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'createAdvertiser', '2020-10-19 16:34:03', '成功', '{\"address\":\"北京-北京-东城区\",\"assistantId\":876708082437197830,\"city\":\"北京\",\"comeFrom\":0,\"companyName\":\"某某科技有限公司\",\"contactName\":\"黄斯丛\",\"contactPhone\":\"13800138004\",\"district\":\"东城区\",\"id\":4,\"lIndustry\":\"教育\",\"mIndustry\":\"中等教育\",\"note\":\"教育方面\",\"orgCode\":\"0e01cec943e44a5888cf04f0af6cb65b\",\"orgId\":100000000000000109,\"password\":\"111111\",\"province\":\"北京\",\"xIndustry\":\"教育\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (279, 100000000000000010, 'BUSINESS_LOG', '更新 广告主的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiser', '2020-10-19 16:34:23', '成功', '4 & {\"address\":\"北京-北京-东城区\",\"assistantId\":876708082437197830,\"balance\":0,\"city\":\"北京\",\"comeFrom\":0,\"companyName\":\"某某科技有限公司\",\"contactName\":\"黄斯丛\",\"contactPhone\":\"13800138004\",\"createTime\":1603096443000,\"district\":\"东城区\",\"id\":4,\"lIndustry\":\"教育\",\"loginTime\":1603096443000,\"mIndustry\":\"中等教育\",\"note\":\"专注教育方面\",\"orgId\":100000000000000109,\"province\":\"北京\",\"status\":\"PENDING_APPROVAL\",\"updateTime\":1603096443000,\"xIndustry\":\"教育\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (280, 100000000000000010, 'BUSINESS_LOG', 'update FilmSchedule的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.FilmScheduleEndpoint', 'updateFilmSchedule', '2020-10-19 16:48:27', '成功', '766605978790526976 & {\"createTime\":1602814708000,\"filmEndTime\":1606665600000,\"filmName\":\"我和我的家乡\",\"filmStartTime\":1603123200000,\"id\":766605978790526976,\"manufactureAreas\":\"中国大陆\",\"producer\":\"中国电影股份有限公司\",\"updateTime\":1602814708000} & ', 'FilmSchedule');
INSERT INTO `t_operation_log` VALUES (281, 100000000000000010, 'BUSINESS_LOG', '广告主审核的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'passAdvertiser', '2020-10-19 16:52:48', '成功', '4 & \"REFUSE\" & {\"advertiserId\":4,\"id\":4,\"note\":\"资料不全，请重新提交\",\"status\":\"REFUSE\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (282, 100000000000000010, 'BUSINESS_LOG', '广告主审核的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'passAdvertiser', '2020-10-19 16:52:49', '成功', '4 & \"REFUSE\" & {\"advertiserId\":4,\"id\":5,\"note\":\"资料不全，请重新提交\",\"status\":\"REFUSE\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (283, 100000000000000109, 'BUSINESS_LOG', '广告主修改自身信息的操作', 876708082437197909, '13800138004', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiserSelf', '2020-10-19 17:02:50', '成功', '{\"address\":\"北京-北京-东城区\",\"assistantId\":876708082437197836,\"balance\":0,\"city\":\"北京\",\"comeFrom\":0,\"companyName\":\"某某科技有限公司\",\"contactName\":\"黄斯丛\",\"contactPhone\":\"13800138004\",\"createTime\":1603096443000,\"district\":\"东城区\",\"id\":4,\"lIndustry\":\"教育\",\"loginTime\":1603096443000,\"mIndustry\":\"中等教育\",\"note\":\"专注教育方面\",\"orgId\":100000000000000109,\"province\":\"北京\",\"status\":\"PENDING_APPROVAL\",\"updateTime\":1603097568000,\"xIndustry\":\"教育\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (284, 100000000000000109, 'BUSINESS_LOG', '广告主修改自身信息的操作', 876708082437197909, '13800138004', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiserSelf', '2020-10-19 17:03:03', '成功', '{\"address\":\"北京-北京-东城区\",\"assistantId\":876708082437197836,\"balance\":0,\"city\":\"北京\",\"comeFrom\":0,\"companyName\":\"某某科技有限公司\",\"contactName\":\"黄斯丛\",\"contactPhone\":\"13800138004\",\"createTime\":1603096443000,\"district\":\"东城区\",\"id\":4,\"lIndustry\":\"教育\",\"loginTime\":1603096443000,\"mIndustry\":\"中等教育\",\"note\":\"专注教育方面\",\"orgId\":100000000000000109,\"province\":\"北京\",\"status\":\"PENDING_APPROVAL\",\"updateTime\":1603097568000,\"xIndustry\":\"教育\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (285, 100000000000000010, 'BUSINESS_LOG', '更新角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'updateRole', '2020-10-19 17:08:59', '成功', '6 & {\"madeBy\":\"SYSTEM\",\"name\":\"平台管理员\",\"permIds\":[100000000000030001,100000000000030002,100000000000030003,100000000000010001,100000000000010002,100000000000010003,100000000000020001,100000000000020002,100000000000020003,100000000000030018,100000000000030019,100000000000030020,100000000000030022,100000000000030024,100000000000310001,100000000000310002,100000000000310004,100000000000030026,100000000000030027,100000000000030028,100000000000030029,100000000000030030,100000000000030031,100000000000030032,100000000000030033,100000000000030034,100000000000030035,100000000000030036,100000000000030037,100000000000030010,100000000000030012,100000000000030042,100000000000030043,100000000000030014,100000000000030015,100000000000030016,100000000000030044,100000000000030045,100000000000030046,100000000000030047,100000000000030048,100000000000030049,100000000000030050,100000000000030038,100000000000030039,100000000000030040,100000000000030041,100000000000011001,100000000000011002,100000000000011003,100000000000030051,100000000000310003,100000000000030052],\"roleCode\":\"101\",\"tips\":\"平台管理员\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (286, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-19 17:24:50', '成功', '1 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (287, 100000000000000010, 'BUSINESS_LOG', 'delete Advertiser的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'deleteAdvertiser', '2020-10-19 17:24:53', '成功', '1 & ', 'Advertiser');
INSERT INTO `t_operation_log` VALUES (288, 100000000000000010, 'BUSINESS_LOG', '广告主审核的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'passAdvertiser', '2020-10-19 17:38:42', '成功', '4 & \"REFUSE\" & {\"advertiserId\":4,\"id\":6,\"note\":\"还是资料不全，再次重新提交吧\",\"status\":\"REFUSE\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (289, 100000000000000109, 'BUSINESS_LOG', '广告主修改自身信息的操作', 876708082437197909, '13800138004', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiserSelf', '2020-10-19 17:39:09', '成功', '{\"address\":\"北京-北京-东城区\",\"assistantId\":876708082437197836,\"balance\":0,\"city\":\"北京\",\"comeFrom\":0,\"companyName\":\"某某科技有限公司\",\"contactName\":\"黄斯丛\",\"contactPhone\":\"13800138004\",\"createTime\":1603096443000,\"district\":\"东城区\",\"id\":4,\"lIndustry\":\"教育\",\"loginTime\":1603096443000,\"mIndustry\":\"中等教育\",\"note\":\"专注教育方面\",\"orgId\":100000000000000109,\"province\":\"北京\",\"status\":\"PENDING_APPROVAL\",\"updateTime\":1603100322000,\"xIndustry\":\"教育\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (290, 100000000000000010, 'BUSINESS_LOG', '广告主审核的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'passAdvertiser', '2020-10-19 17:41:41', '成功', '4 & \"PASS\" & {\"advertiserId\":4,\"id\":7,\"status\":\"PASS\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (291, 100000000000000010, 'BUSINESS_LOG', 'update FilmSchedule的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.FilmScheduleEndpoint', 'updateFilmSchedule', '2020-10-19 17:44:43', '成功', '766605978790526976 & {\"cover\":\"/attachments/bfdd62cc-c400-40c8-a20c-2fbcdbabf741.jpg\",\"createTime\":1602814708000,\"filmEndTime\":1606665600000,\"filmName\":\"我和我的家乡\",\"filmStartTime\":1603123200000,\"id\":766605978790526976,\"manufactureAreas\":\"中国大陆\",\"producer\":\"中国电影股份有限公司\",\"updateTime\":1602814708000} & ', 'FilmSchedule');
INSERT INTO `t_operation_log` VALUES (292, 100000000000000010, 'BUSINESS_LOG', 'update FilmSchedule的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.FilmScheduleEndpoint', 'updateFilmSchedule', '2020-10-19 17:45:22', '成功', '766605978794721280 & {\"cover\":\"/attachments/c77f760e-eeec-4efa-8428-df26fe15e300.jpg\",\"createTime\":1602814708000,\"filmEndTime\":1607616000000,\"filmName\":\"一点就到家\",\"filmStartTime\":1605024000000,\"id\":766605978794721280,\"manufactureAreas\":\"中国大陆\",\"producer\":\"阿里巴巴影业(北京)有限公司\",\"updateTime\":1602814708000} & ', 'FilmSchedule');
INSERT INTO `t_operation_log` VALUES (293, 100000000000000010, 'BUSINESS_LOG', 'update FilmSchedule的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.FilmScheduleEndpoint', 'updateFilmSchedule', '2020-10-19 17:47:23', '成功', '757647750186663939 & {\"cover\":\"/attachments/8d7e777a-33ef-4f9a-b62d-d139be14c86f.jpg\",\"createTime\":1600678900000,\"filmEndTime\":1602115200000,\"filmName\":\"蓝色防线\",\"filmStartTime\":1600300800000,\"id\":757647750186663939,\"manufactureAreas\":\"中国大陆\",\"producer\":\"河南电影电视制作集团有限公司\",\"updateTime\":1600678900000} & ', 'FilmSchedule');
INSERT INTO `t_operation_log` VALUES (294, 100000000000000010, 'BUSINESS_LOG', 'update FilmSchedule的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.FilmScheduleEndpoint', 'updateFilmSchedule', '2020-10-19 17:47:44', '成功', '757647750182469632 & {\"cover\":\"/attachments/1965a9c0-dc0a-48b2-bd55-2a763d5c13f3.jpg\",\"createTime\":1600678900000,\"filmEndTime\":1603521681000,\"filmName\":\"八百\",\"filmStartTime\":1597939200000,\"id\":757647750182469632,\"manufactureAreas\":\"中国大陆\",\"producer\":\"华谊兄弟电影有限公司\",\"updateTime\":1600738995000} & ', 'FilmSchedule');
INSERT INTO `t_operation_log` VALUES (295, 100000000000000095, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197894, '13560126673', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-19 17:53:35', '成功', '42 & {\"advertingMaterialVOS\":[{\"advertiserResourcePassword\":\"123456\",\"advertiserResourceUrl\":\"http://www.Tencentyun.com\",\"delFlag\":\"0\",\"materialId\":14,\"materialName\":\"素材\"}],\"advertingName\":\"水\",\"advertiserId\":4,\"assistantId\":876708082437197862,\"budget\":4200.00,\"cinemaAddress\":\"龙岗区布吉地铁站A出口对面龙珠商城5楼\",\"cinemaId\":766985300982366210,\"cinemaName\":\"中影南方影城布吉店\",\"city\":\"深圳\",\"contact\":\"13560126673\",\"contactName\":\"nanfang\",\"createTime\":1603099171000,\"duration\":\"15\",\"endAlarm\":\"0\",\"filmEndDate\":1604505600000,\"filmStartDate\":1604419200000,\"id\":42,\"orgId\":100000000000000095,\"planId\":56,\"planNumber\":\"1318119509965541376\",\"planningOrderId\":37,\"releaseType\":\"BY_ROUNDS\",\"roomNumber\":6,\"round\":7,\"startAlarm\":\"0\",\"status\":\"DELIVERED\",\"taskNumber\":\"1318119575895805952\",\"timeSlot\":\"AFTER_THREE_MINUTES\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (296, 100000000000000109, 'BUSINESS_LOG', 'create AdvertingMaterial的操作', 876708082437197909, '13800138004', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertingMaterialEndpoint', 'createAdvertingMaterial', '2020-10-20 10:36:09', '成功', '{\"advertiserResourcePassword\":\"111111\",\"advertiserResourceUrl\":\"http://www.baiduyun.com\",\"id\":15,\"name\":\"toufang\",\"orgId\":100000000000000109} & ', 'AdvertingMaterial');
INSERT INTO `t_operation_log` VALUES (297, 100000000000000010, 'BUSINESS_LOG', 'update FilmSchedule的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.FilmScheduleEndpoint', 'updateFilmSchedule', '2020-10-20 10:38:49', '成功', '766605978794721280 & {\"cover\":\"/attachments/9968b312-2ee3-4148-b660-9a5d7c90aa0b.jpg\",\"createTime\":1602814708000,\"filmEndTime\":1607616000000,\"filmName\":\"一点就到家\",\"filmStartTime\":1605024000000,\"id\":766605978794721280,\"manufactureAreas\":\"中国大陆\",\"producer\":\"阿里巴巴影业(北京)有限公司\",\"updateTime\":1602814708000} & ', 'FilmSchedule');
INSERT INTO `t_operation_log` VALUES (298, 100000000000000010, 'BUSINESS_LOG', '平台新增 广告主的操作', 876708082437197836, '13560126667', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'createAdvertiser', '2020-10-20 15:56:13', '成功', '{\"address\":\"山西-太原-小店区\",\"assistantId\":876708082437197836,\"city\":\"太原\",\"comeFrom\":0,\"companyName\":\"华为科技有限公司\",\"contactName\":\"王思11\",\"contactPhone\":\"13600000010\",\"district\":\"小店区\",\"id\":5,\"lIndustry\":\"房屋建筑业\",\"mIndustry\":\"房屋建筑业\",\"note\":\"123456\",\"orgCode\":\"f78c746b83184a5993935886fadcff66\",\"orgId\":100000000000000111,\"password\":\"111111\",\"province\":\"山西\",\"xIndustry\":\"建筑业\"} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (299, 100000000000000010, 'BUSINESS_LOG', '更新 广告主的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiser', '2020-10-20 15:59:16', '成功', '2 & {\"address\":\"江苏-南京-玄武区\",\"assistantId\":0,\"balance\":0,\"city\":\"南京\",\"comeFrom\":1,\"companyName\":\"总组织\",\"contactPhone\":\"13660878929\",\"createTime\":1602837201000,\"district\":\"玄武区\",\"id\":2,\"loginTime\":1602837201000,\"orgId\":100000000000000091,\"province\":\"江苏\",\"status\":\"PENDING_APPROVAL\",\"updateTime\":1602837201000} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (300, 100000000000000010, 'BUSINESS_LOG', '更新 广告主的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiser', '2020-10-20 15:59:39', '成功', '2 & {\"address\":\"江苏-南京-玄武区\",\"assistantId\":0,\"balance\":0,\"city\":\"南京\",\"comeFrom\":1,\"companyName\":\"总组织\",\"contactName\":\"nanjing\",\"contactPhone\":\"13660878929\",\"createTime\":1602837201000,\"district\":\"玄武区\",\"id\":2,\"loginTime\":1602837201000,\"orgId\":100000000000000091,\"province\":\"江苏\",\"status\":\"PENDING_APPROVAL\",\"updateTime\":1602837201000} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (301, 100000000000000010, 'BUSINESS_LOG', '添加新的角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'saveRole', '2020-10-20 16:51:26', '成功', '{\"name\":\"财务\",\"permIds\":[100000000000030046,100000000000030014],\"tips\":\"专门用于结算的角色\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (302, 100000000000000010, 'BUSINESS_LOG', '更新 广告主的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.AdvertiserEndpoint', 'updateAdvertiser', '2020-10-20 17:46:25', '成功', '2 & {\"address\":\"江苏-南京-玄武区\",\"assistantId\":0,\"balance\":0,\"city\":\"南京\",\"comeFrom\":1,\"companyName\":\"jianpan有限公司\",\"contactName\":\"nanjing\",\"contactPhone\":\"13660878929\",\"createTime\":1602837201000,\"district\":\"玄武区\",\"id\":2,\"loginTime\":1602837201000,\"orgId\":100000000000000091,\"province\":\"江苏\",\"status\":\"PENDING_APPROVAL\",\"updateTime\":1602837201000} & ', '广告主');
INSERT INTO `t_operation_log` VALUES (303, 100000000000000010, 'BUSINESS_LOG', 'update OrderTask的操作', 876708082437197862, '15019975481', NULL, NULL, 'com.jfeat.am.module.cinema.api.OrderTaskEndpoint', 'updateOrderTask', '2020-10-21 10:12:48', '成功', '47 & {\"advertingMaterialVOS\":[{\"advertiserResourcePassword\":\"111111\",\"advertiserResourceUrl\":\"http://www.baiduyun.com\",\"assistantResourceUrl\":\"http://www.baiduyun.com\",\"delFlag\":\"0\",\"materialId\":15,\"materialName\":\"toufang\",\"note\":\"123456\"}],\"advertingName\":\"12345\",\"advertiserId\":4,\"assistantId\":876708082437197862,\"budget\":18900.00,\"cinemaAddress\":\"佛山禅城区华远东路63号兆阳广场4层\",\"cinemaId\":766985300982366209,\"cinemaName\":\"保利国际影城佛山兆阳店\",\"city\":\"佛山\",\"contact\":\"13560126672\",\"contactName\":\"朝阳\",\"createTime\":1603246323000,\"duration\":\"15\",\"endAlarm\":\"0\",\"filmEndDate\":1604102400000,\"filmStartDate\":1603843200000,\"id\":47,\"orgId\":100000000000000094,\"planId\":59,\"planNumber\":\"1318736619834052608\",\"planningOrderId\":40,\"releaseType\":\"BY_ROUNDS\",\"roomNumber\":9,\"round\":7,\"startAlarm\":\"0\",\"status\":\"DELIVERED\",\"taskNumber\":\"1318736777737015296\",\"timeSlot\":\"AFTER_THREE_MINUTES\"} & ', 'OrderTask');
INSERT INTO `t_operation_log` VALUES (304, 100000000000000010, 'BUSINESS_LOG', '添加新的角色的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.perm.api.SysRoleEndpoint', 'saveRole', '2020-10-21 11:15:21', '成功', '{\"name\":\"运营\",\"permIds\":[100000000000011001,100000000000011002,100000000000011003,100000000000030001,100000000000030002,100000000000030003,100000000000010001,100000000000010002,100000000000010003,100000000000020001,100000000000020002,100000000000020003,100000000000030010,100000000000030014,100000000000030018,100000000000030022,100000000000310001,100000000000030038,100000000000030026,100000000000030030,100000000000030034],\"tips\":\"负责系统的运营工作\"} & ', '角色');
INSERT INTO `t_operation_log` VALUES (305, 100000000000000010, 'BUSINESS_LOG', '创建用户的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaUserEndpoint', 'createCinemaManager', '2020-10-21 11:17:07', '成功', '{\"account\":\" \",\"name\":\"财务\",\"orgId\":100000000000000010,\"password\":\"111111\",\"phone\":\"13560126668\",\"roleIds\":[876708082437197827]} & ', 'cinemaUser');
INSERT INTO `t_operation_log` VALUES (306, 100000000000000010, 'BUSINESS_LOG', '创建用户的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaUserEndpoint', 'createCinemaManager', '2020-10-21 11:17:57', '成功', '{\"account\":\" \",\"name\":\"运营\",\"orgId\":100000000000000010,\"password\":\"111111\",\"phone\":\"13560126656\",\"roleIds\":[876708082437197828]} & ', 'cinemaUser');
INSERT INTO `t_operation_log` VALUES (307, 100000000000000010, 'BUSINESS_LOG', '删除用户的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'deleteUser', '2020-10-21 11:21:50', '成功', '876708082437197917 & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (308, 100000000000000010, 'BUSINESS_LOG', '删除用户的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.uaas.system.api.AdminUserEndpoint', 'deleteUser', '2020-10-21 11:21:58', '成功', '876708082437197914 & ', '用户模块');
INSERT INTO `t_operation_log` VALUES (309, 100000000000000010, 'BUSINESS_LOG', 'create Cinema的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'createCinema', '2020-10-21 14:50:41', '成功', '{\"address\":\"黄埔区飞晟二街6号301房（地铁6号线香雪站E出口）\",\"assistantId\":876708082437197830,\"businessArea\":\"广州萝岗香雪\",\"city\":\"广州\",\"contact\":\"13600000110\",\"contactName\":\"莫\",\"district\":\"萝岗区\",\"id\":767074636809633794,\"lineId\":5,\"lineName\":\"中影数字\",\"name\":\"中数华昇巨幕影城(萝岗店)\",\"orgCode\":\"795cfc84f77e4e85b00d58d2aaa06171\",\"orgId\":100000000000000114,\"password\":\"111111\",\"province\":\"广东\",\"qualificationNumber\":\"0202\",\"roomNumber\":6,\"seatNumber\":568} & ', 'Cinema');
INSERT INTO `t_operation_log` VALUES (310, 100000000000000010, 'BUSINESS_LOG', '创建用户的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaUserEndpoint', 'createCinemaManager', '2020-10-21 15:43:34', '成功', '{\"account\":\" \",\"name\":\"财务\",\"orgId\":100000000000000010,\"password\":\"111111\",\"phone\":\"13560126668\",\"roleIds\":[876708082437197827]} & ', 'cinemaUser');
INSERT INTO `t_operation_log` VALUES (311, 100000000000000010, 'BUSINESS_LOG', '给所有导入的影院分配账号的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'setImportCinemaUser', '2020-10-22 10:50:57', '成功', '', '影院');
INSERT INTO `t_operation_log` VALUES (312, 100000000000000010, 'BUSINESS_LOG', '给所有导入的影院分配账号的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'setImportCinemaUser', '2020-10-22 11:52:28', '成功', '', '影院');
INSERT INTO `t_operation_log` VALUES (313, 100000000000000010, 'BUSINESS_LOG', 'update FilmSchedule的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.FilmScheduleEndpoint', 'updateFilmSchedule', '2020-10-22 14:21:15', '成功', '768798851258646528 & {\"createTime\":1603337529000,\"filmEndTime\":1604016000000,\"filmName\":\"哪吒\",\"filmStartTime\":1601424000000,\"id\":768798851258646528,\"manufactureAreas\":\"中国大陆\",\"producer\":\"腾讯影业\",\"updateTime\":1603337529000} & ', 'FilmSchedule');
INSERT INTO `t_operation_log` VALUES (314, 100000000000000010, 'BUSINESS_LOG', '给所有导入的影院分配账号的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'setImportCinemaUser', '2020-10-22 16:51:10', '成功', '', '影院');
INSERT INTO `t_operation_log` VALUES (315, 100000000000000010, 'BUSINESS_LOG', '给所有导入的影院分配账号的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'setImportCinemaUser', '2020-10-30 17:10:27', '成功', '', '影院');
INSERT INTO `t_operation_log` VALUES (316, 100000000000000010, 'BUSINESS_LOG', '修改影院登录电话的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'changePhone', '2020-11-03 16:53:48', '成功', '766985300982366210 & {\"phone\":\"13560126674\"} & ', '影院');
INSERT INTO `t_operation_log` VALUES (317, 100000000000000010, 'BUSINESS_LOG', '修改影院登录电话的操作', 876708082437197830, 'admin', NULL, NULL, 'com.jfeat.am.module.cinema.api.CinemaEndpoint', 'changePhone', '2020-11-03 16:54:43', '成功', '766985300982366210 & {\"phone\":\"13560126674\"} & ', '影院');

-- ----------------------------
-- Table structure for t_org_user_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_org_user_relation`;
CREATE TABLE `t_org_user_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` bigint(20) NOT NULL COMMENT '员工ID',
  `org_position` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位(职称)',
  `org_id` bigint(20) NOT NULL COMMENT '组织id',
  `position_id` bigint(20) NOT NULL COMMENT '职位id',
  `is_leader` smallint(6) NOT NULL DEFAULT 0 COMMENT '是否是管理员',
  `is_primary` smallint(6) NOT NULL DEFAULT 0 COMMENT '是否为主要的',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`, `org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 78 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_org_user_relation
-- ----------------------------
INSERT INTO `t_org_user_relation` VALUES (16, 876708082437197833, '职员', 100000000000000061, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (17, 876708082437197834, '职员', 100000000000000062, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (18, 876708082437197835, '职员', 100000000000000064, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (19, 876708082437197836, '职员', 100000000000000063, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (20, 876708082437197837, '职员', 100000000000000063, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (21, 876708082437197838, '职员', 100000000000000065, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (22, 876708082437197839, '职员', 100000000000000066, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (23, 876708082437197840, '职员', 100000000000000067, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (24, 876708082437197841, '职员', 100000000000000067, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (25, 876708082437197842, '职员', 100000000000000063, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (26, 876708082437197844, '职员', 100000000000000068, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (27, 876708082437197845, '职员', 100000000000000068, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (28, 876708082437197846, '职员', 100000000000000069, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (29, 876708082437197847, '职员', 100000000000000070, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (30, 876708082437197848, '职员', 100000000000000063, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (31, 876708082437197849, '职员', 100000000000000071, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (32, 876708082437197850, '职员', 100000000000000072, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (33, 876708082437197851, '职员', 100000000000000063, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (34, 876708082437197852, '职员', 100000000000000073, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (35, 876708082437197853, '职员', 100000000000000070, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (36, 876708082437197854, '职员', 100000000000000074, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (37, 876708082437197855, '职员', 100000000000000076, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (38, 876708082437197856, '职员', 100000000000000076, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (39, 876708082437197857, '职员', 100000000000000077, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (40, 876708082437197858, '职员', 100000000000000078, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (41, 876708082437197859, '职员', 100000000000000079, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (42, 876708082437197860, '职员', 100000000000000079, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (43, 876708082437197861, '职员', 100000000000000080, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (44, 876708082437197862, '职员', 100000000000000075, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (45, 876708082437197863, '职员', 100000000000000081, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (46, 876708082437197864, '职员', 100000000000000082, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (47, 876708082437197865, '职员', 100000000000000082, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (48, 876708082437197866, '职员', 100000000000000083, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (49, 876708082437197869, '职员', 100000000000000084, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (50, 876708082437197870, '职员', 100000000000000085, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (51, 876708082437197871, '职员', 100000000000000085, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (52, 876708082437197872, '职员', 100000000000000086, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (53, 876708082437197873, '职员', 100000000000000086, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (54, 876708082437197882, '职员', 100000000000000087, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (55, 876708082437197885, '职员', 100000000000000088, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (56, 876708082437197888, '职员', 100000000000000089, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (57, 876708082437197889, '职员', 100000000000000090, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (58, 876708082437197890, '职员', 100000000000000091, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (59, 876708082437197891, '职员', 100000000000000092, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (60, 876708082437197892, '职员', 100000000000000093, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (61, 876708082437197893, '职员', 100000000000000094, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (62, 876708082437197894, '职员', 100000000000000095, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (63, 876708082437197895, '职员', 100000000000000096, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (64, 876708082437197896, '职员', 100000000000000097, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (65, 876708082437197909, '职员', 100000000000000109, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (66, 876708082437197911, '职员', 100000000000000111, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (67, 876708082437197912, '职员', 100000000000000112, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (70, 876708082437197918, '职员', 100000000000000114, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (71, 876708082437197919, '职员', 100000000000000010, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (72, 876708082437197920, '职员', 100000000000000117, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (73, 876708082437197921, '职员', 100000000000000118, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (74, 876708082437197922, '职员', 100000000000000119, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (75, 876708082437197923, '职员', 100000000000000120, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (76, 876708082437197924, '职员', 100000000000000121, 1, 0, 1);
INSERT INTO `t_org_user_relation` VALUES (77, 876708082437197925, '职员', 100000000000000122, 1, 0, 1);

-- ----------------------------
-- Table structure for t_schedule
-- ----------------------------
DROP TABLE IF EXISTS `t_schedule`;
CREATE TABLE `t_schedule`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '涓婚敭id',
  `order_num` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '搴忓彿',
  `film` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '褰辩墖',
  `cover` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `show_date` datetime NULL DEFAULT NULL COMMENT '涓婃槧鏃ユ湡',
  `zone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鍦板尯',
  `producer` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '鍑哄搧鏂�',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 765979612378300420 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_schedule
-- ----------------------------
INSERT INTO `t_schedule` VALUES (765979612378300416, '1.0', '半条棉被', NULL, '2020-09-05 00:00:00', '中国', '潇湘电影集团有限公司');
INSERT INTO `t_schedule` VALUES (765979612378300417, '2.0', '谁说我们不会爱2', NULL, '2020-09-04 00:00:00', '中国', '基石国际传媒(北京)有限公司');
INSERT INTO `t_schedule` VALUES (765979612378300418, '3.0', '假面饭店', NULL, '2020-09-04 00:00:00', '日本', '日本富士电视台');
INSERT INTO `t_schedule` VALUES (765979612378300419, '4.0', '半条被子', NULL, '2020-09-05 00:00:00', '中国', '美国华纳兄弟影片公司');

-- ----------------------------
-- Table structure for t_server_org
-- ----------------------------
DROP TABLE IF EXISTS `t_server_org`;
CREATE TABLE `t_server_org`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `server_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '域名',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT '部门 id ',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，可理解为注册时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `server_name`(`server_name`, `org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_server_org
-- ----------------------------

-- ----------------------------
-- Table structure for t_stock_images
-- ----------------------------
DROP TABLE IF EXISTS `t_stock_images`;
CREATE TABLE `t_stock_images`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'images address',
  `stock_id` bigint(20) NOT NULL COMMENT 'owner id',
  `stock_type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'owner type:like product/member and etc...',
  `image_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'owner type:like product/member and etc...',
  `image_note` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'owner type:like product/member and etc...',
  `is_primary` smallint(5) NULL DEFAULT 0 COMMENT 'is primary,0 means not ,1 means primary ',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'upload time',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `url`(`url`, `stock_id`, `stock_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_stock_images
-- ----------------------------

-- ----------------------------
-- Table structure for t_stock_tag
-- ----------------------------
DROP TABLE IF EXISTS `t_stock_tag`;
CREATE TABLE `t_stock_tag`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'tag name',
  `sort_order` smallint(6) NOT NULL DEFAULT 1 COMMENT 'sort value',
  `tag_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'tag type: like product or member or article and etc...',
  `is_primary` smallint(5) NULL DEFAULT 0 COMMENT 'is primary,0 means not ,1 means primary ',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tag_name`(`tag_name`, `tag_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_stock_tag
-- ----------------------------

-- ----------------------------
-- Table structure for t_stock_tag_relation
-- ----------------------------
DROP TABLE IF EXISTS `t_stock_tag_relation`;
CREATE TABLE `t_stock_tag_relation`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) NOT NULL COMMENT 'tag name',
  `stock_id` bigint(20) NOT NULL COMMENT 'tag value',
  `stock_type` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'type: like product or member or article and etc...',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'create time',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `tag_id`(`tag_id`, `stock_id`, `stock_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_stock_tag_relation
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_org
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_org`;
CREATE TABLE `t_sys_org`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '父部门id',
  `name` varchar(60) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '部门名称',
  `org_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门编号',
  `full_name` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门全称',
  `node_level` int(11) NOT NULL DEFAULT 0 COMMENT '所在层级 (0,1,2)',
  `left_num` int(11) NOT NULL DEFAULT 1 COMMENT '左下标',
  `right_num` int(11) NOT NULL DEFAULT 2 COMMENT '右下标',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '部门描述',
  `status` varchar(26) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'NORMAL' COMMENT '状态',
  `org_type` smallint(6) NOT NULL DEFAULT 0 COMMENT '默认 org_type = 1 时信息为租户，非租户 org_type = 0 ,platform org_type = 2',
  `b_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'SYSTEM' COMMENT '默认为系统平台为 SYSTEM    用户组织为 USER ',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `org_code`(`org_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100000000000000125 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_org
-- ----------------------------
INSERT INTO `t_sys_org` VALUES (100000000000000001, NULL, '可圈点科技有限公司 ', 'platform', '广州可圈点信息科技有限公司', 1, 1, 128, '总公司', 'NORMAL', 0, 'SYSTEM', '2020-09-15 14:23:23', '2020-10-30 17:10:27');
INSERT INTO `t_sys_org` VALUES (100000000000000010, 100000000000000001, '星+智能营销云平台', 'System', '星+智能营销云平台', 2, 2, 127, '总公司', 'NORMAL', 0, 'SYSTEM', '2020-09-15 14:23:23', '2020-10-30 17:10:27');
INSERT INTO `t_sys_org` VALUES (100000000000000040, 100000000000000010, '广告主 ', 'Advertiser', '广告主', 3, 3, 50, '总公司', 'NORMAL', 0, 'USER', '2020-09-15 14:23:23', '2020-10-20 17:44:30');
INSERT INTO `t_sys_org` VALUES (100000000000000050, 100000000000000010, '各大影院 ', 'Cinema', '各大影院', 3, 51, 120, '总公司', 'NORMAL', 0, 'USER', '2020-09-15 14:23:23', '2020-10-30 17:10:27');
INSERT INTO `t_sys_org` VALUES (100000000000000060, 100000000000000010, '各大院线', 'CinemaLine', '各大院线', 3, 121, 122, '总公司', 'NORMAL', 0, 'USER', '2020-09-15 14:23:23', '2020-10-30 17:10:27');
INSERT INTO `t_sys_org` VALUES (100000000000000061, 100000000000000040, '大方文化传媒', '828785f725b044c4b196b3954b8f4f38', '大方文化传媒', 4, 4, 5, NULL, 'NORMAL', 0, 'USER', '2020-10-08 16:18:18', '2020-10-08 16:18:18');
INSERT INTO `t_sys_org` VALUES (100000000000000063, 100000000000000010, '销售部', 'SW1001', NULL, 3, 123, 124, NULL, 'NORMAL', 4, 'SYSTEM', '2020-10-08 16:28:25', '2020-10-30 17:10:27');
INSERT INTO `t_sys_org` VALUES (100000000000000065, 100000000000000040, '13560126123', 'e9ca410b2ad94aa8a05f415a78151a1e', '13560126123', 4, 6, 7, NULL, 'NORMAL', 0, 'USER', '2020-10-08 16:34:16', '2020-10-10 17:34:55');
INSERT INTO `t_sys_org` VALUES (100000000000000066, 100000000000000050, '广州万达影城', 'edf51f6574a74c91a9c7e59aa78ad0c5', '广州万达影城', 4, 52, 53, NULL, 'NORMAL', 0, 'USER', '2020-10-08 16:42:36', '2020-10-20 17:44:30');
INSERT INTO `t_sys_org` VALUES (100000000000000067, 100000000000000040, '省广集团', '995352c4428247fbb6a13d71f6c22a60', '省广集团', 4, 8, 9, '123', 'NORMAL', 0, 'USER', '2020-10-08 17:45:15', '2020-10-10 17:34:55');
INSERT INTO `t_sys_org` VALUES (100000000000000068, 100000000000000040, '华为科技有限公司', '043b581a1f86479182d3ba425b72f48d', '华为科技有限公司', 4, 10, 11, NULL, 'NORMAL', 0, 'USER', '2020-10-09 11:05:36', '2020-10-10 17:34:55');
INSERT INTO `t_sys_org` VALUES (100000000000000069, 100000000000000040, '13660123456', '562481771747492aa2b646ad972c4991', '13660123456', 4, 12, 13, NULL, 'NORMAL', 0, 'USER', '2020-10-09 11:41:03', '2020-10-10 17:34:55');
INSERT INTO `t_sys_org` VALUES (100000000000000072, 100000000000000050, '广州飞影电影城', 'fe05e74702b94661b878a2fdff719362', '广州飞影电影城', 4, 54, 55, NULL, 'NORMAL', 0, 'USER', '2020-10-09 14:12:33', '2020-10-20 17:44:30');
INSERT INTO `t_sys_org` VALUES (100000000000000073, 100000000000000040, '13400000', '37c8478fb51d4af1a5abaef914f82f00', '13400000', 4, 14, 15, NULL, 'NORMAL', 0, 'USER', '2020-10-09 14:27:15', '2020-10-20 17:42:53');
INSERT INTO `t_sys_org` VALUES (100000000000000074, 100000000000000040, '13698566698', 'd4f32adf047f4ec28a65106df8414cd7', '13698566698', 4, 16, 17, NULL, 'NORMAL', 0, 'USER', '2020-10-09 14:49:47', '2020-10-10 17:34:55');
INSERT INTO `t_sys_org` VALUES (100000000000000075, 100000000000000010, '商务部', NULL, NULL, 3, 125, 126, NULL, 'NORMAL', 4, 'SYSTEM', '2020-10-09 15:00:04', '2020-10-30 17:10:27');
INSERT INTO `t_sys_org` VALUES (100000000000000076, 100000000000000040, '饮料有限公司', '57869de972144c89b85f769583c410ff', '饮料有限公司', 4, 18, 19, NULL, 'NORMAL', 0, 'USER', '2020-10-09 16:13:13', '2020-10-10 17:34:55');
INSERT INTO `t_sys_org` VALUES (100000000000000077, 100000000000000040, '搜狗电脑公司', '025aa47d5de64351b09141814b08b81e', '搜狗电脑公司', 4, 20, 21, '互联网服务行业', 'NORMAL', 0, 'USER', '2020-10-09 16:14:16', '2020-10-10 17:34:55');
INSERT INTO `t_sys_org` VALUES (100000000000000078, 100000000000000040, '测试翻页效果', '840db2bd3cc94935b4ce6f733421c229', '测试翻页效果', 4, 22, 23, NULL, 'NORMAL', 0, 'USER', '2020-10-09 16:20:38', '2020-10-10 17:34:55');
INSERT INTO `t_sys_org` VALUES (100000000000000079, 100000000000000050, '中影国际影城（太阳新天地店）', '205ea30941044ef2a0d085b22a275cf7', '中影国际影城（太阳新天地店）', 4, 56, 57, '影院设有4个大3D数字豪华影厅、2个标准数字豪华影厅，超过1000位座席。拥有都市浪漫色彩及国际名师设计的电影文化沙龙展厅和电影礼品专柜，装修风格与艺术品位相得益彰，放映设施高端，力求给每位观众带来全方位、立体化的视听、娱乐、奢华新感受。', 'NORMAL', 0, 'USER', '2020-10-10 10:49:44', '2020-10-20 17:44:30');
INSERT INTO `t_sys_org` VALUES (100000000000000080, 100000000000000050, '武汉百瑞景天河影城', '9df33cf29cdc460a8a241d0ce5a4ee65', '武汉百瑞景天河影城', 4, 58, 59, NULL, 'NORMAL', 0, 'USER', '2020-10-10 10:51:45', '2020-10-20 17:44:30');
INSERT INTO `t_sys_org` VALUES (100000000000000081, 100000000000000040, '15019975480', '73420d0c028947b08259ceab161eaf75', '15019975480', 4, 24, 25, NULL, 'NORMAL', 0, 'USER', '2020-10-10 11:04:51', '2020-10-10 17:34:55');
INSERT INTO `t_sys_org` VALUES (100000000000000082, 100000000000000050, '大地影院', '7511df1da93847b1b6090bb95085fcbf', '大地影院', 4, 60, 61, '111', 'NORMAL', 0, 'USER', '2020-10-10 12:14:37', '2020-10-20 17:44:30');
INSERT INTO `t_sys_org` VALUES (100000000000000083, 100000000000000040, '15019975480', '0ed644a2054445248b755089dacb71b9', '15019975480', 4, 26, 27, NULL, 'NORMAL', 0, 'USER', '2020-10-10 16:29:43', '2020-10-10 17:34:55');
INSERT INTO `t_sys_org` VALUES (100000000000000084, 100000000000000040, '15019975411', '5455917dbe21491694ef54c65925abe3', '15019975411', 4, 28, 29, NULL, 'NORMAL', 0, 'USER', '2020-10-10 16:49:11', '2020-10-10 17:34:55');
INSERT INTO `t_sys_org` VALUES (100000000000000085, 100000000000000040, 'Tuber有限公司', '710ea43c37894f209ef0efb250420417', 'Tuber有限公司', 4, 30, 31, '公司主要产品有浏览器，网页等服务', 'NORMAL', 0, 'USER', '2020-10-10 17:45:32', '2020-10-10 17:45:32');
INSERT INTO `t_sys_org` VALUES (100000000000000086, 100000000000000040, '省广', '6e106be35a934151a7844ddbacadb53a', '省广', 4, 32, 33, NULL, 'NORMAL', 0, 'USER', '2020-10-13 14:28:23', '2020-10-13 14:28:23');
INSERT INTO `t_sys_org` VALUES (100000000000000087, 100000000000000040, 'test', 'f08ba5fbdfbb457bb4224b56f71efc37', 'test', 4, 34, 35, NULL, 'NORMAL', 0, 'USER', '2020-10-14 15:58:51', '2020-10-14 15:58:51');
INSERT INTO `t_sys_org` VALUES (100000000000000088, 100000000000000040, '苦科技有限公司', 'fddeec84069e4a18934d7dd7c9a3eabb', '苦科技有限公司', 4, 36, 37, '经营房产销售、出租、二手房买卖交易等', 'NORMAL', 0, 'USER', '2020-10-16 10:44:27', '2020-10-16 10:44:27');
INSERT INTO `t_sys_org` VALUES (100000000000000089, 100000000000000050, '哈艺时尚影城(合生骏景店)', '6bc94044a1834caf8888f494e122c741', '哈艺时尚影城(合生骏景店)', 4, 62, 63, NULL, 'NORMAL', 0, 'USER', '2020-10-16 15:03:55', '2020-10-20 17:44:30');
INSERT INTO `t_sys_org` VALUES (100000000000000090, 100000000000000040, 'Tuber有限公司', '1ca8d7df8afb4bb7a7542c1ada277aac', 'Tuber有限公司', 4, 38, 39, '经营食品、饮料批发', 'NORMAL', 0, 'USER', '2020-10-16 16:10:02', '2020-10-16 16:10:02');
INSERT INTO `t_sys_org` VALUES (100000000000000091, 100000000000000040, '总组织', '1e8e098ca8ba493998f0ad40ed2e54b4', '总组织', 4, 40, 41, NULL, 'NORMAL', 0, 'USER', '2020-10-16 16:33:21', '2020-10-16 16:33:21');
INSERT INTO `t_sys_org` VALUES (100000000000000092, 100000000000000040, '省广', '911d9c7438044d3b865d7c365398b40f', '省广', 4, 42, 43, NULL, 'NORMAL', 0, 'USER', '2020-10-16 18:00:25', '2020-10-16 18:00:25');
INSERT INTO `t_sys_org` VALUES (100000000000000094, 100000000000000050, '保利国际影城佛山兆阳店', 'e62ded2fdd8d4d979e519689b09c77a1', '保利国际影城佛山兆阳店', 4, 64, 65, '影城按照国家五星级标准建造，是目前佛山地区规模最大的现代影城。', 'NORMAL', 0, 'USER', '2020-10-17 12:20:23', '2020-10-20 17:44:30');
INSERT INTO `t_sys_org` VALUES (100000000000000095, 100000000000000050, '中影南方影城布吉店', '194650ada0be479eabfe019b3b0e28c7', '中影南方影城布吉店', 4, 66, 67, '中影南方影城布吉店立属于中影南方品牌直营投资，全程按超五星级标准配置。该影城地处深圳市龙岗区布吉街道，交通极其便利，多条公交线路直接抵达，影院设有6个影厅（共627个豪华座位）。 影院具有的设备优势：1，采用高保真同轴音响；2，美国版的专用豪华皮椅；3，国际标准的4K放映机；4，超轻便的3D眼镜 中影南方影城将高水准的科技与人性化的服务融入了每一个细节，它给电影消费者带来的是不仅仅是影片自身内容的观感，同时还是影城环境、电影文化等全方位的超级享受。', 'NORMAL', 0, 'USER', '2020-10-17 12:26:20', '2020-10-20 17:44:30');
INSERT INTO `t_sys_org` VALUES (100000000000000096, 100000000000000050, '北京金逸朝阳影城', '5abf80596f674df48172cb08272916d0', '北京金逸朝阳影城', 4, 68, 69, NULL, 'NORMAL', 0, 'USER', '2020-10-17 17:09:37', '2020-10-20 17:44:30');
INSERT INTO `t_sys_org` VALUES (100000000000000097, 100000000000000050, '北京希杰星星国际影城有限公司将台分店', '1d2ff472df964ee091eea2ebc07c876a', '北京希杰星星国际影城有限公司将台分店', 4, 70, 71, NULL, 'NORMAL', 0, 'USER', '2020-10-17 17:09:38', '2020-10-20 17:44:30');
INSERT INTO `t_sys_org` VALUES (100000000000000098, 100000000000000050, '北京金逸朝阳影城', '372418f1e2ad4b85a94efea9f294c687', '北京金逸朝阳影城', 4, 72, 73, NULL, 'NORMAL', 0, 'USER', '2020-10-19 12:36:06', '2020-10-20 17:44:30');
INSERT INTO `t_sys_org` VALUES (100000000000000099, 100000000000000050, '北京金逸朝阳影城', '097b8c14423748a7ad977545418958d5', '北京金逸朝阳影城', 4, 74, 75, NULL, 'NORMAL', 0, 'USER', '2020-10-19 12:37:58', '2020-10-20 17:44:30');
INSERT INTO `t_sys_org` VALUES (100000000000000100, 100000000000000050, '北京金逸朝阳影城', '203a31d0f61840c0a19a9e3d2f845387', '北京金逸朝阳影城', 4, 76, 77, NULL, 'NORMAL', 0, 'USER', '2020-10-19 14:24:06', '2020-10-20 17:44:30');
INSERT INTO `t_sys_org` VALUES (100000000000000101, 100000000000000050, '北京金逸朝阳影城', '0a637a77a9b24bb9a2f605cbbee006e5', '北京金逸朝阳影城', 4, 78, 79, NULL, 'NORMAL', 0, 'USER', '2020-10-19 14:37:28', '2020-10-20 17:44:30');
INSERT INTO `t_sys_org` VALUES (100000000000000102, 100000000000000050, '北京金逸朝阳影城', '29fce3f569f24713a1b54f64d76c2641', '北京金逸朝阳影城', 4, 80, 81, NULL, 'NORMAL', 0, 'USER', '2020-10-19 14:40:30', '2020-10-20 17:44:30');
INSERT INTO `t_sys_org` VALUES (100000000000000103, 100000000000000050, '北京金逸朝阳影城', 'c08cef33fc354aefb13254b9362a8061', '北京金逸朝阳影城', 4, 82, 83, NULL, 'NORMAL', 0, 'USER', '2020-10-19 14:44:40', '2020-10-20 17:44:30');
INSERT INTO `t_sys_org` VALUES (100000000000000104, 100000000000000050, '北京金逸朝阳影城', 'b6a3daf1341a4394b0c0d41b01c22eb6', '北京金逸朝阳影城', 4, 84, 85, NULL, 'NORMAL', 0, 'USER', '2020-10-19 14:47:07', '2020-10-20 17:44:30');
INSERT INTO `t_sys_org` VALUES (100000000000000105, 100000000000000050, '北京金逸朝阳影城', 'da0a8fe7ecd74920b8cf8687ec658900', '北京金逸朝阳影城', 4, 86, 87, NULL, 'NORMAL', 0, 'USER', '2020-10-19 14:53:57', '2020-10-20 17:44:30');
INSERT INTO `t_sys_org` VALUES (100000000000000106, 100000000000000050, '北京金逸朝阳影城', '34be01457e0941318672b7ee83e57bae', '北京金逸朝阳影城', 4, 88, 89, NULL, 'NORMAL', 0, 'USER', '2020-10-19 14:54:03', '2020-10-20 17:44:30');
INSERT INTO `t_sys_org` VALUES (100000000000000107, 100000000000000050, '北京金逸朝阳影城', '658de8ff82c74ecfa852b64a3575a91b', '北京金逸朝阳影城', 4, 90, 91, NULL, 'NORMAL', 0, 'USER', '2020-10-19 15:18:54', '2020-10-20 17:44:30');
INSERT INTO `t_sys_org` VALUES (100000000000000108, 100000000000000050, '北京金逸朝阳影城', '60e59ddd3b0f4cabbc95933f474a32ec', '北京金逸朝阳影城', 4, 92, 93, NULL, 'NORMAL', 0, 'USER', '2020-10-19 15:57:52', '2020-10-20 17:44:30');
INSERT INTO `t_sys_org` VALUES (100000000000000109, 100000000000000040, '某某科技有限公司', '0e01cec943e44a5888cf04f0af6cb65b', '某某科技有限公司', 4, 44, 45, '教育方面', 'NORMAL', 0, 'USER', '2020-10-19 16:34:03', '2020-10-19 16:34:03');
INSERT INTO `t_sys_org` VALUES (100000000000000110, 100000000000000050, '北京金逸朝阳影城', '267bc87df12b46f8a50790672503131c', '北京金逸朝阳影城', 4, 94, 95, NULL, 'NORMAL', 0, 'USER', '2020-10-19 16:42:10', '2020-10-20 17:44:30');
INSERT INTO `t_sys_org` VALUES (100000000000000111, 100000000000000040, '华为科技有限公司', 'f78c746b83184a5993935886fadcff66', '华为科技有限公司', 4, 46, 47, '123456', 'NORMAL', 0, 'USER', '2020-10-20 15:56:13', '2020-10-20 15:56:13');
INSERT INTO `t_sys_org` VALUES (100000000000000112, 100000000000000040, '总组织', '3ab6d02b999c483282d13a24bd3771c3', '总组织', 4, 48, 49, NULL, 'NORMAL', 0, 'USER', '2020-10-20 17:44:31', '2020-10-20 17:44:31');
INSERT INTO `t_sys_org` VALUES (100000000000000113, 100000000000000050, '北京金逸朝阳影城', 'fc4b778abcd7458db4433fb2076435d9', '北京金逸朝阳影城', 4, 96, 97, NULL, 'NORMAL', 0, 'USER', '2020-10-21 09:32:46', '2020-10-21 09:32:46');
INSERT INTO `t_sys_org` VALUES (100000000000000114, 100000000000000050, '中数华昇巨幕影城(萝岗店)', '795cfc84f77e4e85b00d58d2aaa06171', '中数华昇巨幕影城(萝岗店)', 4, 98, 99, NULL, 'NORMAL', 0, 'USER', '2020-10-21 14:50:40', '2020-10-21 14:50:40');
INSERT INTO `t_sys_org` VALUES (100000000000000115, 100000000000000050, '北京金逸朝阳影城', '1876fe3a23364cc18b96dd6e689252f1', '北京金逸朝阳影城', 4, 100, 101, NULL, 'NORMAL', 0, 'USER', '2020-10-22 10:50:56', '2020-10-22 10:50:56');
INSERT INTO `t_sys_org` VALUES (100000000000000116, 100000000000000050, '北京希杰星星国际影城有限公司将台分店', '8808bfccf6fd47189e2d980efd8e8105', '北京希杰星星国际影城有限公司将台分店', 4, 102, 103, NULL, 'NORMAL', 0, 'USER', '2020-10-22 10:50:56', '2020-10-22 10:50:56');
INSERT INTO `t_sys_org` VALUES (100000000000000117, 100000000000000050, '北京金逸电影城海淀影城', 'a355f5922ad74ef59a0079ba762c2965', '北京金逸电影城海淀影城', 4, 104, 105, NULL, 'NORMAL', 0, 'USER', '2020-10-22 10:50:56', '2020-10-22 10:50:56');
INSERT INTO `t_sys_org` VALUES (100000000000000118, 100000000000000050, '北京博纳汇鑫', '893fc61b10af403d92708137a7b8081f', '北京博纳汇鑫', 4, 106, 107, NULL, 'NORMAL', 0, 'USER', '2020-10-22 10:50:57', '2020-10-22 10:50:57');
INSERT INTO `t_sys_org` VALUES (100000000000000119, 100000000000000050, '深圳海岸影城', '3a0fa9a95b8e494cb8c8a524b0e5f96b', '深圳海岸影城', 4, 108, 109, NULL, 'NORMAL', 0, 'USER', '2020-10-22 11:52:28', '2020-10-22 11:52:28');
INSERT INTO `t_sys_org` VALUES (100000000000000120, 100000000000000050, '太平洋影城·深圳京基百纳店', '68455562fc9c4d189e8bc5485d235aa5', '太平洋影城·深圳京基百纳店', 4, 110, 111, NULL, 'NORMAL', 0, 'USER', '2020-10-22 11:52:28', '2020-10-22 11:52:28');
INSERT INTO `t_sys_org` VALUES (100000000000000121, 100000000000000050, '广州飞扬电影城正佳店', '068b4590f4a642229dd9fc62d13d1179', '广州飞扬电影城正佳店', 4, 112, 113, NULL, 'NORMAL', 0, 'USER', '2020-10-30 17:10:27', '2020-10-30 17:10:27');
INSERT INTO `t_sys_org` VALUES (100000000000000122, 100000000000000050, '北京金逸影城朝阳大悦城店', 'd47ce4b81c324b85b7b829d3c28c21a1', '北京金逸影城朝阳大悦城店', 4, 114, 115, NULL, 'NORMAL', 0, 'USER', '2020-10-30 17:10:27', '2020-10-30 17:10:27');
INSERT INTO `t_sys_org` VALUES (100000000000000123, 100000000000000050, '广州飞扬电影城', 'b7ffb3c433e647afb36c3f3011d30360', '广州飞扬电影城', 4, 116, 117, NULL, 'NORMAL', 0, 'USER', '2020-10-30 17:10:27', '2020-10-30 17:10:27');
INSERT INTO `t_sys_org` VALUES (100000000000000124, 100000000000000050, '北京金逸朝阳大店', '1cff377e2bb94b9bb786cdbeae8f5e04', '北京金逸朝阳大店', 4, 118, 119, NULL, 'NORMAL', 0, 'USER', '2020-10-30 17:10:27', '2020-10-30 17:10:27');

-- ----------------------------
-- Table structure for t_sys_position
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_position`;
CREATE TABLE `t_sys_position`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位名称',
  `pos_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位代码',
  `org_id` bigint(20) NOT NULL COMMENT '职位所属部门id',
  `note` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '职位描述',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_position
-- ----------------------------

-- ----------------------------
-- Table structure for t_sys_user
-- ----------------------------
DROP TABLE IF EXISTS `t_sys_user`;
CREATE TABLE `t_sys_user`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
  `account` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '账号(登录账号)',
  `org_id` bigint(20) NULL DEFAULT NULL COMMENT '部门 id ',
  `openid` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '第三方授权ID',
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码MD5值',
  `salt` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '盐值',
  `name` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `birthday` datetime NULL DEFAULT NULL COMMENT '生日',
  `sex` int(11) NULL DEFAULT NULL COMMENT '性别',
  `email` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `email_validated` smallint(6) NOT NULL DEFAULT 0 COMMENT '邮箱是否验证，默认 0-未验证,1-验证',
  `phone` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电话',
  `status` int(11) NULL DEFAULT 1 COMMENT '状态',
  `createtime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间，可理解为注册时间',
  `version` int(11) NULL DEFAULT NULL COMMENT '版本',
  `delete_flag` int(11) NOT NULL DEFAULT 1 COMMENT '逻辑删除字段',
  `is_app_user` int(11) NOT NULL DEFAULT 0 COMMENT '是否为APP 用户 ,已过时',
  `password_reset` int(11) NOT NULL DEFAULT 0 COMMENT '重置密码',
  `user_type` int(11) NULL DEFAULT 0 COMMENT '用户类型 0-默认-平台用户(传统用户，隔离在租户下) 1-组织管理人 2-个人用户 3-个人组织用户 101-管理员（租户管理员 自动跳过权限检查） 102-观察者用户 所有看的权限',
  `tenant_org_id` bigint(20) NULL DEFAULT NULL COMMENT '租户id',
  `extra_user_type` int(11) NULL DEFAULT 0 COMMENT '可以有多种隔离方式的用户类型 1-测试用户（自动分配所有权限只适用于测试用户） 2-运维人员',
  `b_user_type` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'SYSTEM' COMMENT '用户类型 用于区分平台的还是用户自己的',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE,
  UNIQUE INDEX `account`(`account`, `org_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 876708082437197926 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sys_user
-- ----------------------------
INSERT INTO `t_sys_user` VALUES (876708082437197827, '', 'admin', 100000000000000001, NULL, 'b5106d36993ba6afd2b5b99e3e46e1af', 'p683b', '管理员', '1997-05-05 00:00:00', 2, 'admin@kequandian.net', 0, '18200000000', 1, '2020-10-08 16:17:37', 1, 1, 0, 1, 101, NULL, 0, 'SYSTEM');
INSERT INTO `t_sys_user` VALUES (876708082437197829, '', 'inspector', 100000000000000001, NULL, 'cf9bfbe6278fa75794d517a0e36d9263', 'ixki5', '观察者', '1997-05-05 00:00:00', 2, 'inspector@kequandian.net', 0, '18200000001', 1, '2020-10-08 16:17:37', 1, 1, 0, 1, 102, NULL, 0, 'SYSTEM');
INSERT INTO `t_sys_user` VALUES (876708082437197830, '/attachments/cf4e5204-60ac-42ea-9720-13a86898b2af.jpg', 'admin', 100000000000000010, NULL, 'b5106d36993ba6afd2b5b99e3e46e1af', 'p683b', '管理员', '1997-05-05 00:00:00', 0, 'admin10@kequandian.net', 0, '18200000003', 1, '2020-10-08 16:17:37', 1, 1, 0, 1, 101, NULL, 0, 'SYSTEM');
INSERT INTO `t_sys_user` VALUES (876708082437197831, '', 'inspector', 100000000000000010, NULL, 'cf9bfbe6278fa75794d517a0e36d9263', 'ixki5', '观察者', '1997-05-05 00:00:00', 2, 'inspector10@kequandian.net', 0, '18200000004', 1, '2020-10-08 16:17:37', 1, 1, 0, 1, 102, NULL, 0, 'SYSTEM');
INSERT INTO `t_sys_user` VALUES (876708082437197832, NULL, 'manager', 100000000000000010, NULL, 'b5106d36993ba6afd2b5b99e3e46e1af', 'p683b', '广告主审批主管', NULL, NULL, NULL, 0, '181', 1, '2020-09-14 18:52:35', 1, 1, 0, 0, 1, NULL, 0, 'SYSTEM');
INSERT INTO `t_sys_user` VALUES (876708082437197833, NULL, '13660456789', 100000000000000061, NULL, '47143e7a8d842c53a05dfb5b3aa5b24b', 'f7o24', '广告主用户', NULL, NULL, NULL, 0, '13660456789', 1, '2020-10-08 16:18:18', NULL, 1, 0, 0, 1, 100000000000000061, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197834, NULL, '13800138001', NULL, NULL, 'a343927e5903f3066441f6f0bbc7d92a', '4yd4s', '广告主用户', NULL, NULL, NULL, 0, NULL, 1, '2020-10-08 16:20:00', NULL, 0, 0, 0, 1, 100000000000000062, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197835, NULL, '13600000001', NULL, NULL, 'dd7631ebbb8ccfb9a97fa2e984a24d85', 'ndt77', '广告主用户', NULL, NULL, NULL, 0, NULL, 1, '2020-10-08 16:32:18', NULL, 0, 0, 0, 1, 100000000000000064, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197836, '[{\"url\":\"/attachments/e400dfa9-3450-4ebf-8a3b-9a3167217129.jpg\"}]', '13560126667', 100000000000000063, NULL, 'f6127fd3b307e1c54ba7d513f33b5e1a', '6kbb2', 'S-店小二', NULL, NULL, NULL, 0, '13560126667', 1, '2020-10-08 16:33:10', NULL, 1, 0, 0, 2, 100000000000000010, 0, 'SYSTEM');
INSERT INTO `t_sys_user` VALUES (876708082437197837, NULL, '13560126665', 100000000000000075, NULL, '94fe8c2629062f7512a45fdb7f374b6b', '4cbvw', '商务部主管', NULL, NULL, NULL, 0, '13560126665', 1, '2020-10-08 16:33:43', NULL, 1, 0, 0, 3, 100000000000000010, 0, 'SYSTEM');
INSERT INTO `t_sys_user` VALUES (876708082437197838, NULL, '13560126123', 100000000000000065, NULL, '8165b1e983e0e6d5ffe8545fa2e0be5b', '6o323', '广告主用户', NULL, NULL, NULL, 0, '13560126123', 1, '2020-10-08 16:34:16', NULL, 1, 0, 0, 1, 100000000000000065, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197839, NULL, '13600000000', 100000000000000066, NULL, 'dbb73af3cf2651ae55f67949fdae0639', '1sa1r', '影院用户', NULL, NULL, NULL, 0, '13600000000', 1, '2020-10-08 16:42:36', NULL, 1, 0, 0, 1, 100000000000000066, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197840, NULL, '18761398463', NULL, NULL, '4b0bcd3415358150e996decb04496d1f', 'fybew', '广告主用户', NULL, NULL, NULL, 0, NULL, 1, '2020-10-08 17:15:44', NULL, 0, 0, 0, 1, 100000000000000067, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197841, NULL, '18760398465', 100000000000000067, NULL, 'c0e526b61f7217fcb6aa75858f46ff38', 'ckpk0', '广告主用户', NULL, NULL, NULL, 0, '18760398465', 1, '2020-10-08 17:45:15', NULL, 1, 0, 0, 1, 100000000000000067, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197842, NULL, '13560126666', 100000000000000063, NULL, 'a4c0e70f23279f0940dfcda2157265c3', 'e6pbe', '影院管理人', NULL, NULL, NULL, 0, '13560126666', 1, '2020-10-09 09:42:10', NULL, 1, 0, 0, 1, 100000000000000010, 0, 'SYSTEM');
INSERT INTO `t_sys_user` VALUES (876708082437197844, NULL, '13600000022', NULL, NULL, '018d7d7fced28858da810becbe679ac3', '670my', '广告主用户', NULL, NULL, NULL, 0, NULL, 1, '2020-10-09 10:22:02', NULL, 0, 0, 0, 1, 100000000000000068, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197845, NULL, '13600000022', 100000000000000068, NULL, '7ae62d8f51df0a206d6c0ff7705f9270', 'vg8tq', '广告主用户', NULL, NULL, NULL, 0, '13600000022', 1, '2020-10-09 11:05:37', NULL, 1, 0, 0, 1, 100000000000000068, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197846, NULL, '13660123456', 100000000000000069, NULL, '146c2ef11b051dbb9bd709693957c52b', 'yj2z3', '广告主用户', NULL, NULL, NULL, 0, '13660123456', 1, '2020-10-09 11:41:04', NULL, 1, 0, 0, 1, 100000000000000069, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197847, NULL, '13560126555', 100000000000000070, NULL, '4ec9c65fc862656e3b43ec07b187e325', 'xrf83', '客服部主管', NULL, NULL, NULL, 0, '13560126555', 1, '2020-10-09 12:20:01', NULL, 0, 0, 0, 3, 100000000000000010, 0, 'SYSTEM');
INSERT INTO `t_sys_user` VALUES (876708082437197848, NULL, '15800254850', 100000000000000063, NULL, 'd1dbee07cadf01bd77c6624137ab1936', 'tfwbk', 'S-店小二2号', NULL, NULL, NULL, 0, '15800254850', 1, '2020-10-09 12:21:08', NULL, 1, 0, 0, 2, 100000000000000010, 0, 'SYSTEM');
INSERT INTO `t_sys_user` VALUES (876708082437197849, NULL, '15019975480', NULL, NULL, 'e95af50d278d9552ea3a621c3d78b968', 'ac486', '广告主用户', NULL, NULL, NULL, 0, NULL, 1, '2020-10-09 13:54:29', NULL, 0, 0, 0, 1, 100000000000000071, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197850, NULL, '13143376825', 100000000000000072, NULL, '3fd5b47f1cf94fd563e38e1dee45f2d8', '2v3q1', '影院用户', NULL, NULL, NULL, 0, '13143376825', 1, '2020-10-09 14:12:33', NULL, 1, 0, 0, 1, 100000000000000072, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197851, NULL, '13560126655', 100000000000000063, NULL, '9f264d84c9ce003fce5fa6731559a470', 'f7dhp', '销售部店小二主管', NULL, NULL, NULL, 0, '13560126655', 1, '2020-10-09 14:18:45', NULL, 1, 0, 0, 3, 100000000000000010, 0, 'SYSTEM');
INSERT INTO `t_sys_user` VALUES (876708082437197853, NULL, '13560125555', 100000000000000070, NULL, '812e9a1717673a1e6abac6e63ec9cc8a', 'pwccv', '客服部店小二主管', NULL, NULL, NULL, 0, '13560125555', 1, '2020-10-09 14:32:45', NULL, 0, 0, 0, 3, 100000000000000010, 0, 'SYSTEM');
INSERT INTO `t_sys_user` VALUES (876708082437197854, NULL, '13698566698', 100000000000000074, NULL, 'a2dac147f78c62b1c24ef457440c2d04', 'frrow', '广告主用户', NULL, NULL, NULL, 0, '13698566698', 1, '2020-10-09 14:49:47', NULL, 1, 0, 0, 1, 100000000000000074, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197855, NULL, '13800138003', NULL, NULL, '5a424e026f39ec98e3b1cd8f2779871c', '3bv4z', '广告主用户', NULL, NULL, NULL, 0, NULL, 1, '2020-10-09 16:11:06', NULL, 0, 0, 0, 1, 100000000000000076, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197856, NULL, '13560123363', 100000000000000076, NULL, 'b1f85c202127e46474b661cade60f372', 'mghvc', '广告主用户', NULL, NULL, NULL, 0, '13560123363', 1, '2020-10-09 16:13:13', NULL, 1, 0, 0, 1, 100000000000000076, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197857, NULL, '13800138003', 100000000000000077, NULL, '67f9126b3418f279e090908d6a423213', 'n5gc9', '广告主用户', NULL, NULL, NULL, 0, '13800138003', 1, '2020-10-09 16:14:16', NULL, 1, 0, 0, 1, 100000000000000077, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197858, NULL, '13122223333', 100000000000000078, NULL, '6c8fb82718a3d9b642ae0ef7ccdbd92c', '88bfc', '广告主用户', NULL, NULL, NULL, 0, '13122223333', 1, '2020-10-09 16:20:38', NULL, 1, 0, 0, 1, 100000000000000078, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197859, NULL, '15019975480', NULL, NULL, 'dce25c5612c8c4820900a62ec951d63e', 'xrov1', '广告主用户', NULL, NULL, NULL, 0, NULL, 1, '2020-10-10 09:38:29', NULL, 0, 0, 0, 1, 100000000000000079, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197860, NULL, '13560000000', 100000000000000079, NULL, '0a53796d33f75691631aaf59fa761e9a', '16oun', '影院用户', NULL, NULL, NULL, 0, '13560000000', 1, '2020-10-10 10:49:44', NULL, 1, 0, 0, 1, 100000000000000079, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197861, NULL, '15012236523', 100000000000000080, NULL, 'ef38c2917698f86f46debf742ffa97cb', 'vti7y', '影院用户', NULL, NULL, NULL, 0, '15012236523', 1, '2020-10-10 10:51:45', NULL, 1, 0, 0, 1, 100000000000000080, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197862, NULL, '15019975481', 100000000000000075, NULL, '8941955f8dab161a5346b103efea81ad', 'vlt22', '商务', NULL, NULL, NULL, 0, '15019975481', 1, '2020-10-10 10:55:45', NULL, 1, 0, 0, 2, 100000000000000010, 0, 'SYSTEM');
INSERT INTO `t_sys_user` VALUES (876708082437197863, '/attachments/537e4655-511f-446a-b370-3481d4e51af4.jpg', '15019975485', 100000000000000081, NULL, 'e335dc8e3859eab8f14c7c4aafa93eed', 'u09qf', '广告主用户', NULL, NULL, NULL, 0, '15019975485', 1, '2020-10-10 11:04:51', NULL, 1, 0, 1, 1, 100000000000000081, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197864, NULL, '12', NULL, NULL, '6905b67ebc4e007b853bf6b9023d5f57', 'j54pb', '影院用户', NULL, NULL, NULL, 0, NULL, 1, '2020-10-10 11:59:00', NULL, 0, 0, 0, 1, 100000000000000082, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197865, NULL, '18620909958', 100000000000000082, NULL, 'e0d6dde8ecfa02ffaa644f85ca91b718', 'uwls0', '影院用户', NULL, NULL, NULL, 0, '18620909958', 1, '2020-10-10 12:14:37', NULL, 1, 0, 0, 1, 100000000000000082, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197866, NULL, '15019975480', 100000000000000083, NULL, 'aa250079189e74076bfc974af846978d', 'a9iaq', '广告主用户', NULL, NULL, NULL, 0, '15019975480', 1, '2020-10-10 16:29:43', NULL, 1, 0, 0, 1, 100000000000000083, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197869, NULL, '15019975411', 100000000000000084, NULL, '06901cff40ee3989d89ea8fb606a2c74', 'k8t5c', '广告主用户', NULL, NULL, NULL, 0, '15019975411', 1, '2020-10-10 16:49:11', NULL, 1, 0, 0, 1, 100000000000000084, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197870, NULL, '13600000002', NULL, NULL, '3dc093aa54f303a122cb1f34ce95a806', 'st91n', '广告主用户', NULL, NULL, NULL, 0, NULL, 1, '2020-10-10 17:42:21', NULL, 0, 0, 0, 1, 100000000000000085, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197871, NULL, '13600000002', 100000000000000085, NULL, 'f2c932603426645cf42c2427b7597e76', 'xj9pu', '广告主用户', NULL, NULL, NULL, 0, '13600000002', 1, '2020-10-10 17:45:32', NULL, 1, 0, 0, 1, 100000000000000085, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197872, NULL, '13600000011', NULL, NULL, '576a60c7652861b2f604148e0af41589', 'xou7b', '广告主用户', NULL, NULL, NULL, 0, NULL, 1, '2020-10-12 12:02:28', NULL, 0, 0, 0, 1, 100000000000000086, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197873, NULL, '13611111111', NULL, NULL, '31bbabbdd5472c08c50c7c9b4f735cad', 'ibopx', '广告主用户', NULL, NULL, NULL, 0, NULL, 1, '2020-10-13 14:28:24', NULL, 0, 0, 0, 1, 100000000000000086, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197882, NULL, '13011112222', 100000000000000087, NULL, '2b2318b2412b7155955ee02dac49ee2f', '9x9q7', '广告主用户', NULL, NULL, NULL, 0, '13011112222', 1, '2020-10-14 15:58:51', NULL, 1, 0, 0, 1, 100000000000000087, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197885, NULL, '13600000001', 100000000000000088, NULL, '1a707ed29be77d1a0b88774f4126d1bf', 'l5f1f', '广告主用户', NULL, NULL, NULL, 0, '13600000001', 1, '2020-10-16 10:44:27', NULL, 1, 0, 0, 1, 100000000000000088, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197888, NULL, '13560000001', 100000000000000089, NULL, '184af1066940a10b0d2c472213888dad', 'f93vr', '影院用户', NULL, NULL, NULL, 0, '13560000001', 1, '2020-10-16 15:03:55', NULL, 1, 0, 0, 1, 100000000000000089, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197889, '', '13800138001', 100000000000000090, NULL, 'ce76be8bc90d202b3c268a4caaf1fe26', '7kwkk', '广告主用户', NULL, NULL, NULL, 0, '13800138001', 1, '2020-10-16 16:10:02', NULL, 1, 0, 1, 1, 100000000000000090, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197890, NULL, '13660878929', 100000000000000091, NULL, '17da23bd7a0d1ca3d7f19c5397234247', 'vkzh3', '广告主用户', NULL, NULL, NULL, 0, '13660878929', 1, '2020-10-16 16:33:21', NULL, 1, 0, 0, 1, 100000000000000091, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197891, NULL, '13800138002', 100000000000000092, NULL, '7f89597730398112022ab8ce30aa6644', 'ublhu', '广告主用户', NULL, NULL, NULL, 0, '13800138002', 1, '2020-10-16 18:00:25', NULL, 1, 0, 0, 1, 100000000000000092, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197892, NULL, '13560126671', 100000000000000093, NULL, 'f6960447aab733eab3a5e548b3c06eb4', 'hi9zw', '影院用户', NULL, NULL, NULL, 0, '13560126671', 1, '2020-10-17 10:10:15', NULL, 0, 0, 0, 1, 100000000000000093, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197893, NULL, '13560126672', 100000000000000094, NULL, '582279a70ec0018ef0485e97c9ff36bc', '2bh1i', '影院用户', NULL, NULL, NULL, 0, '13560126672', 1, '2020-10-17 12:20:24', NULL, 1, 0, 0, 1, 100000000000000094, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197894, NULL, '13560126673', 100000000000000095, NULL, '36561e3ac74763218bdb244026caba0a', '9et83', '影院用户', NULL, NULL, NULL, 0, '13560126674', 1, '2020-10-17 12:26:20', NULL, 1, 0, 0, 1, 100000000000000095, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197895, NULL, '13560126669', 100000000000000115, NULL, 'fa23d738b9a8f6ea184e27c75c329ca8', 'k1wym', '影院用户', NULL, NULL, NULL, 0, '13560126669', 1, '2020-10-17 17:09:38', NULL, 1, 0, 0, 1, 100000000000000115, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197896, NULL, '13560126670', 100000000000000116, NULL, '129270753572878141ee1a5772135d21', 'jxi96', '影院用户', NULL, NULL, NULL, 0, '13560126670', 1, '2020-10-17 17:09:38', NULL, 1, 0, 0, 1, 100000000000000116, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197909, NULL, '13800138004', 100000000000000109, NULL, 'b6cf0dcd455d1a6e62adfb17edb21bae', 'irx53', '广告主用户', NULL, NULL, NULL, 0, '13800138004', 1, '2020-10-19 16:34:03', NULL, 1, 0, 0, 1, 100000000000000109, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197911, NULL, '13600000010', 100000000000000111, NULL, '4c987cc0274b6800da39fd92f58968da', 'okvvu', '广告主用户', NULL, NULL, NULL, 0, '13600000010', 1, '2020-10-20 15:56:13', NULL, 1, 0, 0, 1, 100000000000000111, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197912, NULL, '13422212814', 100000000000000112, NULL, '6ebaade2ff521e2e907fed3f86d5eec2', '45f7h', '广告主用户', NULL, NULL, NULL, 0, '13422212814', 1, '2020-10-20 17:44:31', NULL, 1, 0, 0, 1, 100000000000000112, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197914, NULL, '13560126668', NULL, NULL, 'bed574439b6ddfd70c069acff93b6940', '9w5i3', '财务', NULL, NULL, NULL, 0, NULL, 1, '2020-10-21 11:17:07', NULL, 0, 0, 0, 1, 100000000000000010, 0, 'SYSTEM');
INSERT INTO `t_sys_user` VALUES (876708082437197917, NULL, '13560126656', NULL, NULL, '027c74873a67302274cdd35a0da376cc', '5oe5v', '运营', NULL, NULL, NULL, 0, NULL, 1, '2020-10-21 11:17:57', NULL, 0, 0, 0, 1, 100000000000000010, 0, 'SYSTEM');
INSERT INTO `t_sys_user` VALUES (876708082437197918, NULL, '13600000110', 100000000000000114, NULL, '14ff41aded0981016cfd1c90f2ed61ac', '0iytq', '影院用户', NULL, NULL, NULL, 0, '13600000110', 1, '2020-10-21 14:50:40', NULL, 1, 0, 0, 1, 100000000000000114, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197919, NULL, '13560126668', 100000000000000010, NULL, '42600eea41a4387793140f143561b1d9', 'vtr9l', '财务', NULL, NULL, NULL, 0, '13560126668', 1, '2020-10-21 15:43:33', NULL, 1, 0, 0, 1, 100000000000000010, 0, 'SYSTEM');
INSERT INTO `t_sys_user` VALUES (876708082437197920, NULL, '13565987789', 100000000000000117, NULL, '92bf6183cf242623a9ec1fc30e537928', 'moniv', '影院用户', NULL, NULL, NULL, 0, '13565987789', 1, '2020-10-22 10:50:56', NULL, 1, 0, 0, 1, 100000000000000117, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197921, NULL, '13565987790', 100000000000000118, NULL, 'b917063737faa568a805e13a31ca981f', 'teykw', '影院用户', NULL, NULL, NULL, 0, '13565987790', 1, '2020-10-22 10:50:57', NULL, 1, 0, 0, 1, 100000000000000118, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197922, NULL, '13413413413', 100000000000000119, NULL, 'cf381a5e6cf6b1ea14f46e44b141751c', '551my', '影院用户', NULL, NULL, NULL, 0, '13413413413', 1, '2020-10-22 11:52:28', NULL, 1, 0, 0, 1, 100000000000000119, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197923, NULL, '13413413414', 100000000000000120, NULL, '53115cf9af29b7fe9cc0624e0239e4e1', 'fltb3', '影院用户', NULL, NULL, NULL, 0, '13413413414', 1, '2020-10-22 11:52:28', NULL, 1, 0, 0, 1, 100000000000000120, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197924, NULL, '13434173891', 100000000000000123, NULL, '63a5d714503e667164f12c4355b34183', '56o00', '影院用户', NULL, NULL, NULL, 0, '13434173891', 1, '2020-10-30 17:10:27', NULL, 1, 0, 0, 1, 100000000000000123, 0, 'USER');
INSERT INTO `t_sys_user` VALUES (876708082437197925, NULL, '13810458817', 100000000000000124, NULL, '1adcebbfe0c8f864a2bff9b893b93097', 'ylxg8', '影院用户', NULL, NULL, NULL, 0, '13810458817', 1, '2020-10-30 17:10:27', NULL, 1, 0, 0, 1, 100000000000000124, 0, 'USER');

-- ----------------------------
-- Table structure for t_tenant
-- ----------------------------
DROP TABLE IF EXISTS `t_tenant`;
CREATE TABLE `t_tenant`  (
  `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '租户名',
  `org_id` bigint(11) NOT NULL COMMENT 'orgId',
  `app_id` bigint(20) NULL DEFAULT NULL COMMENT 'appId',
  `domain` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '域名',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 -> 停用, 1-> 启动',
  `start_time` datetime NULL DEFAULT NULL COMMENT '上次启动的时间',
  `logo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户标志',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '租户标题',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tenant
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL,
  `id` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('张三', 1);

-- ----------------------------
-- Procedure structure for test
-- ----------------------------
DROP PROCEDURE IF EXISTS `test`;
delimiter ;;
CREATE PROCEDURE `test`()
begin   
declare total int default 3;  
declare lid int ; 
declare icode VARCHAR(200) ;  
declare tpid int ;  
declare _first int ;  
set _first = 0 ; 

 select count(*) into total  from t_industry where type = 'S';  
 WHILE  total >1 DO   
   
  SELECT id into lid  FROM t_industry where type = 'S' limit _first ,1;  
  SELECT `code` into icode  FROM t_industry where type = 'S' limit _first ,1; 

	set icode = left(icode,LENGTH(icode)-1);
	SELECT id into tpid  FROM t_industry where type = 'M' and `code` = icode  ; 
	update t_industry set pid = tpid where id = lid ;
  set total = total - 1 ;  
  set _first = _first + 1 ;  
  select tpid,lid,_first,icode;  
 end while ;  
end
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
