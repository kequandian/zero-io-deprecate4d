SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ca_advertiser
-- ----------------------------
DROP TABLE IF EXISTS `ca_advertiser`;
CREATE TABLE `ca_advertiser`
(
    `id`                     bigint(20) NOT NULL AUTO_INCREMENT,
    `company_name`           varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '广告主名',
    `contact_name`           varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '联系人名字',
    `contact_phone`          varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系人电话',
    `contact_id`             bigint(20) NULL DEFAULT NULL COMMENT '联系人id  有id的话按id的信息来 为空按照上面的字段为主',
    `balance`                decimal(10, 2) NULL DEFAULT 0.00 COMMENT '金额',
    `come_from`              int(10) NULL DEFAULT 0 COMMENT '来源 0-系统创建 1-用户注册',
    `status`                 varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'PENDING_APPROVAL' COMMENT '状态   PASS-已审核 PENDING_APPROVAL-待审核 REFUSE-已拒绝',
    `address`                varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在地区',
    `assistant_id`           bigint(20) NULL DEFAULT NULL COMMENT '店小二id',
    `org_id`                 bigint(20) NULL DEFAULT NULL,
    `province`               varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在省',
    `city`                   varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在城市',
    `district`               varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '市区',
    `id_card`                varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证',
    `id_card_url`            varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证图片',
    `id_card_back_url`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证图片',
    `business_license_prove` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照资质证明',
    `business_license_phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '营业执照照片',
    `industry`               varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在行业',
    `x_industry`             varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在行业 x行业',
    `l_industry`             varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在行业 l大分类',
    `m_industry`             varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '所在行业 m中分类',
    `login_time`             datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近登录时间',
    `create_time`            datetime NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time`            datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `note`                   text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明 备注',
    `avatar`                 varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像',
    PRIMARY KEY (`id`) USING BTREE,
    UNIQUE INDEX `contact_phone`(`contact_phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '广告主表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ca_advertiser
-- ----------------------------
INSERT INTO `ca_advertiser`
VALUES (1, '大地影院', '林某', '18219300257', NULL, 0.00, 0, 'PENDING_APPROVAL', '广州', NULL, NULL, NULL, NULL, NULL, NULL,
        NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2021-04-26 11:34:29', '2021-04-26 11:34:29',
        '2021-04-26 11:34:29', NULL, NULL);



-- ----------------------------
-- Table structure for ca_adverting_plan
-- ----------------------------
DROP TABLE IF EXISTS `ca_adverting_plan`;
CREATE TABLE `ca_adverting_plan`
(
    `id`                 bigint(20) NOT NULL AUTO_INCREMENT,
    `org_id`             bigint(20) DEFAULT NULL COMMENT '所属组织ID',
    `org_tag`            varchar(100)   DEFAULT NULL COMMENT '组织标志',
    `film_id`            bigint(20) DEFAULT NULL COMMENT '影片id(可以为空)',
    `advertiser_id`      bigint(20) NOT NULL COMMENT '广告主id',
    `assistant_id`       bigint(20) NOT NULL COMMENT '店小二id',
    `plan_number`        varchar(50)  NOT NULL COMMENT '计划编号',
    `name`               varchar(255) NOT NULL COMMENT '广告名称',
    `budget`             decimal(10, 2) DEFAULT NULL COMMENT '广告预算',
    `time_slot`          varchar(255)   DEFAULT NULL COMMENT '广告播放时间段（一分钟内、1-3分钟、3分钟后）',
    `release_type`       varchar(50)    DEFAULT NULL COMMENT '广告投放类型(贴片， 按场次)',
    `release_start_time` datetime       DEFAULT NULL COMMENT '投放开始日期',
    `release_end_time`   datetime       DEFAULT NULL COMMENT '投放结束日期',
    `type`               varchar(50)    DEFAULT NULL COMMENT '广告类型',
    `duration`           smallint(6) DEFAULT NULL COMMENT '广告时长',
    `district`           varchar(255)   DEFAULT NULL COMMENT '已选区域',
    `create_time`        datetime       DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
    `update_time`        datetime       DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `apply_time`         datetime       DEFAULT NULL COMMENT '申请时间',
    `note`               text COMMENT '说明 备注',
    `status`             varchar(50)  NOT NULL COMMENT '广告计划状态（待审核、已审核、已下单、已拒绝）',
    `reason`             text COMMENT '拒绝原因',
    PRIMARY KEY (`id`),
    UNIQUE KEY `org_id` (`org_id`,`plan_number`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ca_adverting_plan
-- ----------------------------
INSERT INTO `ca_adverting_plan`
VALUES ('5', '100000000000000064', null, '7', '3', '876708082437197836', '1314125947087228928', '七龙珠', null,
        'IN_ONE_MINUTE', 'BY_FILM', '2020-10-09 00:00:00', '2020-10-16 00:00:00', 'SCREEN', '30', null,
        '2020-09-02 16:50:15', '2020-10-23 17:31:22', '2020-10-08 16:50:47', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('6', '100000000000000064', null, '2', '3', '876708082437197836', '1314140301014732800', '手机广告', null,
        'IN_ONE_MINUTE', 'BY_FILM', '2020-10-09 00:00:00', '2020-10-16 00:00:00', 'SCREEN', '30', null,
        '2020-10-08 17:47:17', '2020-10-10 10:39:21', '2020-10-10 10:39:12', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('7', '100000000000000064', null, '4', '3', '876708082437197836', '1314141036620156928', '理财广告', null,
        'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-12 00:00:00', '2020-10-16 00:00:00', 'SCREEN', '15', null,
        '2020-10-08 17:50:13', '2020-10-08 17:51:09', '2020-10-08 17:50:46', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('15', '100000000000000077', null, null, '15', '876708082437197836', '1314479862106427392', 'admin', null,
        'AFTER_THREE_MINUTES', 'BY_ROUNDS', '2020-10-12 00:00:00', '2020-10-15 00:00:00', 'SCREEN', '15', null,
        '2020-10-09 16:16:35', '2020-10-09 16:16:35', null, null, 'TO_BE_REVIEWED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('16', '100000000000000077', null, '3', '15', '876708082437197836', '1314481784414670848', '店小二主管', null,
        'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-12 00:00:00', '2020-10-14 00:00:00', 'SCENES', '30', null,
        '2020-10-09 16:24:13', '2020-10-09 16:24:13', null, null, 'TO_BE_REVIEWED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('17', '100000000000000077', null, '6', '15', '876708082437197836', '1314482888753942528', '店小二', null,
        'IN_ONE_MINUTE', 'BY_FILM', '2020-10-14 00:00:00', '2020-10-16 00:00:00', 'SCENES', '30', null,
        '2020-10-09 16:28:37', '2020-10-10 10:42:17', '2020-10-10 10:42:16', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('18', '100000000000000077', null, null, '15', '876708082437197836', '1314484274933665792', '广告主', null,
        'AFTER_THREE_MINUTES', 'BY_ROUNDS', '2020-10-21 00:00:00', '2020-10-23 00:00:00', 'SCENES', '30', null,
        '2020-10-09 16:34:07', '2020-10-10 10:36:56', '2020-10-10 10:36:44', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('19', '100000000000000073', null, null, '11', '876708082437197848', '1314494040154181632', '短信', null,
        'AFTER_THREE_MINUTES', 'BY_ROUNDS', '2020-10-13 00:00:00', '2020-10-15 00:00:00', 'SCREEN', '15', null,
        '2020-10-09 17:12:55', '2020-10-09 17:15:35', '2020-10-09 17:15:24', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('20', '100000000000000077', null, '4', '15', '876708082437197836', '1314499228562755584', '中文', null,
        'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-13 00:00:00', '2020-10-16 00:00:00', 'SCREEN', '45', null,
        '2020-10-09 17:33:32', '2020-10-09 17:36:18', '2020-10-09 17:36:11', null, 'ORDER_PLACED', '资料不明确，请重新修改再提交\n');
INSERT INTO `ca_adverting_plan`
VALUES ('21', '100000000000000077', null, null, '15', '876708082437197836', '1314524161200230400', '广告', null,
        'AFTER_THREE_MINUTES', 'BY_ROUNDS', '2020-10-21 00:00:00', '2020-10-23 00:00:00', 'SCENES', '15', null,
        '2020-10-09 19:12:37', '2020-10-09 19:15:24', '2020-10-09 19:15:22', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('24', '100000000000000064', null, '3', '3', '876708082437197836', '1314742795306668032', '家装', null,
        'IN_ONE_MINUTE', 'BY_FILM', '2020-10-21 00:00:00', '2020-10-23 00:00:00', 'SCENES', '30', null,
        '2020-10-10 09:41:23', '2020-10-10 10:18:35', '2020-10-10 10:18:30', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('25', '100000000000000077', null, '3', '15', '876708082437197836', '1314744089199120384', '汽车广告', null,
        'IN_ONE_MINUTE', 'BY_FILM', '2020-10-21 00:00:00', '2020-10-31 00:00:00', 'SCREEN', '45', null,
        '2020-10-10 09:46:32', '2020-10-10 09:47:01', '2020-10-10 09:46:48', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('26', '100000000000000064', null, null, '3', '876708082437197836', '1314751225064984576', '场次', null,
        'IN_ONE_MINUTE', 'BY_ROUNDS', '2020-10-20 00:00:00', '2020-10-23 00:00:00', 'SCREEN', '15', null,
        '2020-10-10 10:14:53', '2020-10-10 10:17:20', '2020-10-10 10:17:17', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('27', '100000000000000077', null, '7', '15', '876708082437197836', '1314751565780881408', '七龙珠', null,
        'IN_ONE_MINUTE', 'BY_FILM', '2020-10-11 00:00:00', '2020-10-16 00:00:00', 'SCREEN', '30', null,
        '2020-10-10 10:16:14', '2020-10-10 10:17:40', '2020-10-10 10:17:36', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('28', '100000000000000069', null, null, '9', '876708082437197836', '1314758353645342720', '汽广告', null,
        'AFTER_THREE_MINUTES', 'BY_ROUNDS', '2020-10-11 00:00:00', '2020-10-18 00:00:00', 'SCREEN', '15', null,
        '2020-10-10 10:43:13', '2020-10-10 10:43:52', null, null, 'ABOLISHED', '不通过');
INSERT INTO `ca_adverting_plan`
VALUES ('29', '100000000000000081', null, null, '18', '876708082437197848', '1314766094967377920', '药片广告', null,
        'IN_ONE_MINUTE', 'BY_ROUNDS', '2020-10-17 00:00:00', '2020-10-24 00:00:00', 'SCREEN', '30', null,
        '2020-10-10 11:13:58', '2020-10-10 11:14:14', '2020-10-10 11:14:12', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('30', '100000000000000064', null, '6', '3', '876708082437197836', '1314784270639828992', '怡宝广告', null,
        'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-11 00:00:00', '2020-10-12 00:00:00', 'SCREEN', '30', null,
        '2020-10-10 12:26:12', '2020-10-10 12:26:38', '2020-10-10 12:26:36', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('31', '100000000000000064', null, null, '3', '876708082437197836', '1314785612036968448', '怡宝', null,
        'IN_ONE_MINUTE', 'BY_ROUNDS', '2020-10-11 00:00:00', '2020-10-12 00:00:00', 'SCENES', '15', null,
        '2020-10-10 12:31:32', '2020-10-10 12:31:48', '2020-10-10 12:31:47', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('32', '100000000000000074', null, '6', '12', '876708082437197848', '1314817801722138624', '龙珠GT', null,
        'IN_ONE_MINUTE', 'BY_FILM', '2020-10-11 00:00:00', '2020-10-23 00:00:00', 'SCREEN', '30', null,
        '2020-10-10 14:39:26', '2020-10-10 14:40:16', '2020-10-10 14:40:13', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('33', '100000000000000077', null, null, '15', '876708082437197836', '1314822938947620864', '测试test', null,
        'AFTER_ONE_MINUTE', 'BY_ROUNDS', '2020-10-12 00:00:00', '2020-10-16 00:00:00', 'SCREEN', '30', null,
        '2020-10-10 14:59:51', '2020-10-10 15:07:39', '2020-10-10 15:07:14', null, 'ORDER_PLACED', '订单太多，不通过');
INSERT INTO `ca_adverting_plan`
VALUES ('34', '100000000000000085', null, '4', '22', '876708082437197836', '1314866746880036864', '饮用水广告', null,
        'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-22 00:00:00', '2020-10-31 00:00:00', 'SCREEN', '60', null,
        '2020-10-10 17:53:56', '2020-10-10 17:53:56', null, null, 'TO_BE_REVIEWED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('35', '100000000000000085', null, '2', '22', '876708082437197836', '1315555480600449024', '添加', null,
        'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-13 00:00:00', '2020-10-17 00:00:00', 'SCREEN', '30', null,
        '2020-10-12 15:30:43', '2020-10-12 15:33:28', null, null, 'REVIEW_REJECTED', '计划填写有误，请重新填写');
INSERT INTO `ca_adverting_plan`
VALUES ('36', '100000000000000085', null, '7', '22', '876708082437197836', '1315555906703986688', '广告拒绝测试', null,
        'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-13 00:00:00', '2020-11-09 00:00:00', 'SCREEN', '15', null,
        '2020-10-12 15:32:24', '2020-10-12 15:36:50', '2020-10-12 15:36:50', null, 'REVIEW_APPROVED', '不合法广告');
INSERT INTO `ca_adverting_plan`
VALUES ('37', '100000000000000085', null, null, '22', '876708082437197836', '1315558914611351552', 'test', null,
        'AFTER_ONE_MINUTE', 'BY_ROUNDS', '2020-10-13 00:00:00', '2020-10-24 00:00:00', 'SCENES', '30', null,
        '2020-09-01 15:44:21', '2020-10-21 11:51:43', '2020-10-12 15:46:36', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('38', '100000000000000085', null, null, '22', '876708082437197836', '1315837846652850176', '详情', null,
        'AFTER_THREE_MINUTES', 'BY_ROUNDS', '2020-10-21 00:00:00', '2020-10-24 00:00:00', null, '30', null,
        '2020-10-13 10:12:44', '2020-10-13 11:50:38', null, null, 'REVIEW_REJECTED', '拒绝你');
INSERT INTO `ca_adverting_plan`
VALUES ('39', '100000000000000085', null, '3', '22', '876708082437197836', '1315849008987639808', '查看', '0.00',
        'AFTER_ONE_MINUTE', 'BY_FILM', '2020-11-01 00:00:00', '2020-11-04 00:00:00', null, '30', null,
        '2020-10-13 10:57:05', '2020-10-13 11:49:50', '2020-10-13 11:49:32', null, 'ORDER_PLACED', '重新填写\n');
INSERT INTO `ca_adverting_plan`
VALUES ('40', '100000000000000073', null, '7', '11', '876708082437197848', '1315854322013179904', '榴莲广告', null,
        'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-14 00:00:00', '2020-11-11 00:00:00', null, '15', null,
        '2020-10-13 11:18:12', '2020-10-13 12:31:38', '2020-10-13 12:31:30', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('41', '100000000000000073', null, '7', '11', '876708082437197848', '1315901516816715776', '山竹', null,
        'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-14 00:00:00', '2020-11-11 00:00:00', null, '15', null,
        '2020-10-13 14:25:44', '2020-10-13 14:25:55', '2020-10-13 14:25:52', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('42', '100000000000000073', null, '7', '11', '876708082437197848', '1315936697535565824', '水蜜桃', null,
        'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-14 00:00:00', '2020-11-10 00:00:00', null, '15', null,
        '2020-10-13 16:45:32', '2020-10-13 16:45:32', null, null, 'TO_BE_REVIEWED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('43', '100000000000000073', null, '3', '11', '876708082437197848', '1315937651794251776', '香橙广告', null,
        'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-14 00:00:00', '2020-11-10 00:00:00', null, '15', null,
        '2020-10-13 16:49:19', '2020-10-13 17:03:41', '2020-10-13 17:03:38', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('44', '100000000000000085', null, '4', '22', '876708082437197836', '1316211096159391744', '广告素材', null,
        'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-23 00:00:00', '2020-10-25 00:00:00', null, '30', null,
        '2020-10-14 10:55:54', '2020-10-14 11:42:36', '2020-10-14 11:42:17', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('45', '100000000000000088', null, null, '27', '876708082437197836', '1316944099504427008', '广告场次', '14700.00',
        'AFTER_THREE_MINUTES', 'BY_ROUNDS', '2020-10-22 00:00:00', '2020-10-25 00:00:00', null, '30', null,
        '2020-10-16 11:28:35', '2020-10-16 11:43:23', '2020-10-16 11:29:00', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('46', '100000000000000090', null, null, '1', '876708082437197836', '1317015630892896256', '水果', null,
        'AFTER_THREE_MINUTES', 'BY_ROUNDS', '2020-10-21 00:00:00', '2020-10-24 00:00:00', null, '30', null,
        '2020-10-16 16:12:50', '2020-10-16 18:42:10', '2020-10-16 18:41:53', null, 'ORDER_PLACED', '拒绝不通过');
INSERT INTO `ca_adverting_plan`
VALUES ('47', '100000000000000090', null, null, '1', '876708082437197836', '1317018141569716224', '场次', null,
        'AFTER_THREE_MINUTES', 'BY_ROUNDS', '2020-10-23 00:00:00', '2020-10-31 00:00:00', null, '15', null,
        '2020-10-16 16:22:48', '2020-10-16 16:22:48', null, null, 'TO_BE_REVIEWED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('48', '100000000000000090', null, null, '1', '876708082437197836', '1317043073162809344', '没素材', null,
        'IN_ONE_MINUTE', 'BY_ROUNDS', '2020-10-21 00:00:00', '2020-10-23 00:00:00', null, '15', null,
        '2020-10-16 18:01:52', '2020-10-16 18:03:38', null, null, 'TO_BE_REVIEWED', '计划有误');
INSERT INTO `ca_adverting_plan`
VALUES ('50', '100000000000000090', null, '3', '1', '876708082437197836', '1317394436090630144', '测', '9800.00',
        'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-30 00:00:00', '2020-11-01 00:00:00', null, '30', null,
        '2020-10-17 17:18:04', '2020-10-17 17:18:39', '2020-10-17 17:18:37', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('51', '100000000000000090', null, '2', '1', '876708082437197836', '1317410134363869184', '预算', null,
        'AFTER_THREE_MINUTES', 'BY_FILM', '2020-10-30 00:00:00', '2020-11-04 00:00:00', null, '30', null,
        '2020-10-17 18:20:27', '2020-10-19 15:14:00', '2020-10-17 18:20:32', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('52', '1', null, '2', '1', '876708082437197836', '1317410134363869184', '测试', null, null, null, null, null,
        null, null, null, '2019-10-15 10:11:02', '2020-10-19 10:11:27', null, null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('53', '100000000000000090', null, null, '1', '876708082437197836', '1318023965641412608', 'shouji', '16200.00',
        'AFTER_ONE_MINUTE', 'BY_ROUNDS', '2020-10-29 00:00:00', '2020-10-31 00:00:00', null, '30', null,
        '2020-10-19 10:59:35', '2020-10-19 11:22:15', '2020-10-19 11:00:39', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('54', '100000000000000090', null, null, '1', '876708082437197836', '1318087390081978368', 'test', '9800.00',
        'IN_ONE_MINUTE', 'BY_ROUNDS', '2020-10-29 00:00:00', '2020-10-31 00:00:00', null, '30', null,
        '2020-10-19 15:11:37', '2020-10-19 15:32:56', '2020-10-19 15:32:54', null, 'ORDER_PLACED', '审核不通过');
INSERT INTO `ca_adverting_plan`
VALUES ('55', '100000000000000090', null, null, '1', '876708082437197836', '1318093841747808256', '不通过', null,
        'AFTER_ONE_MINUTE', 'BY_ROUNDS', '2020-10-23 00:00:00', '2020-10-30 00:00:00', null, '15', null,
        '2020-10-19 15:37:15', '2020-10-19 15:37:22', '2020-10-19 15:37:21', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('56', '100000000000000109', null, null, '4', '876708082437197836', '1318119509965541376', '水', '4200.00',
        'AFTER_THREE_MINUTES', 'BY_ROUNDS', '2020-11-04 00:00:00', '2020-11-05 00:00:00', null, '15', null,
        '2020-10-19 17:19:15', '2020-10-19 17:19:31', '2020-10-19 17:19:29', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('57', '100000000000000109', null, '766966176415744004', '4', '876708082437197836', '1318381715252711424', '贴片',
        '36000.00', 'AFTER_ONE_MINUTE', 'BY_FILM', '2020-10-23 00:00:00', '2020-10-31 00:00:00', null, '45', null,
        '2020-10-20 10:41:09', '2020-10-20 11:38:22', '2020-10-20 11:38:20', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('58', '100000000000000109', null, null, '4', '876708082437197836', '1318460323262500864', '全部', '18000.00',
        'IN_ONE_MINUTE', 'BY_ROUNDS', '2020-10-25 08:00:00', '2020-10-31 08:00:00', null, '15', null,
        '2020-10-20 15:53:31', '2020-10-20 15:57:01', '2020-10-20 15:56:59', null, 'ORDER_PLACED', '长文本');
INSERT INTO `ca_adverting_plan`
VALUES ('59', '100000000000000109', null, null, '4', '876708082437197836', '1318736619834052608', '12345', '18900.00',
        'AFTER_THREE_MINUTES', 'BY_ROUNDS', '2020-10-28 08:00:00', '2020-10-31 08:00:00', null, '15', null,
        '2020-10-21 10:11:25', '2020-10-21 10:12:03', '2020-10-21 10:12:02', null, 'ORDER_PLACED', null);
INSERT INTO `ca_adverting_plan`
VALUES ('60', '100000000000000109', null, '6', '4', '876708082437197836', '1319095162353356800', '执行中', null,
        'AFTER_THREE_MINUTES', 'BY_FILM', '2020-10-29 08:00:00', '2020-11-03 08:00:00', null, '30', null,
        '2020-10-22 09:56:09', '2020-10-22 09:57:47', '2020-10-22 09:57:46', null, 'ORDER_PLACED', null);




