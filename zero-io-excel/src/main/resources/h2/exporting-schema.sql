--- https://segmentfault.com/a/1190000021877261

-- ----------------------------
-- Table structure for ca_advertiser
-- ----------------------------
DROP TABLE IF EXISTS `ca_advertiser`;
CREATE TABLE `ca_advertiser`
(
    `id`                     bigint(20) NOT NULL AUTO_INCREMENT,
    `company_name`           varchar(50) NULL DEFAULT NULL COMMENT '广告主名',
    `contact_name`           varchar(20) NULL DEFAULT NULL COMMENT '联系人名字',
    `contact_phone`          varchar(20) NOT NULL COMMENT '联系人电话',
    `contact_id`             bigint(20) NULL DEFAULT NULL COMMENT '联系人id  有id的话按id的信息来 为空按照上面的字段为主',
    `balance`                decimal(10, 2) NULL DEFAULT 0.00 COMMENT '金额',
    `come_from`              int(10) NULL DEFAULT 0 COMMENT '来源 0-系统创建 1-用户注册',
    `status`                 varchar(20) NULL DEFAULT 'PENDING_APPROVAL' COMMENT '状态   PASS-已审核 PENDING_APPROVAL-待审核 REFUSE-已拒绝',
    `address`                varchar(255) NULL DEFAULT NULL COMMENT '所在地区',
    `assistant_id`           bigint(20) NULL DEFAULT NULL COMMENT '店小二id',
    `org_id`                 bigint(20) NULL DEFAULT NULL,
    `province`               varchar(20) NULL DEFAULT NULL COMMENT '所在省',
    `city`                   varchar(20) NULL DEFAULT NULL COMMENT '所在城市',
    `district`               varchar(20) NULL DEFAULT NULL COMMENT '市区',
    `id_card`                varchar(20) NULL DEFAULT NULL COMMENT '身份证',
    `id_card_url`            varchar(255) NULL DEFAULT NULL COMMENT '身份证图片',
    `id_card_back_url`       varchar(255) NULL DEFAULT NULL COMMENT '身份证图片',
    `business_license_prove` varchar(255) NULL DEFAULT NULL COMMENT '营业执照资质证明',
    `business_license_phone` varchar(255) NULL DEFAULT NULL COMMENT '营业执照照片',

    `industry`               varchar(255) NULL DEFAULT NULL COMMENT '所在行业',
    `x_industry`             varchar(255) NULL DEFAULT NULL COMMENT '所在行业 x行业',
    `l_industry`             varchar(255) NULL DEFAULT NULL COMMENT '所在行业 l大分类',
    `m_industry`             varchar(255) NULL DEFAULT NULL COMMENT '所在行业 m中分类',
    `login_time`             datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '最近登录时间',
    `create_time`            datetime NULL DEFAULT CURRENT_TIMESTAMP,
    `note`                   text NULL COMMENT '说明 备注',
    `avatar`                 varchar(255) NULL DEFAULT NULL COMMENT '头像',
    PRIMARY KEY (`id`),
    UNIQUE (`contact_phone`)
);

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
    `apply_time`         datetime       DEFAULT NULL COMMENT '申请时间',
    `note`               text COMMENT '说明 备注',
    `status`             varchar(50)  NOT NULL COMMENT '广告计划状态（待审核、已审核、已下单、已拒绝）',
    `reason`             text COMMENT '拒绝原因',
    PRIMARY KEY (`id`),
    UNIQUE (`plan_number`)
);
