-- ----------------------------
-- Table structure for st_statistics_meta
-- ----------------------------
DROP TABLE IF EXISTS `t_product`;
CREATE TABLE `t_product`
(
    `id`    bigint(20) NOT NULL AUTO_INCREMENT,
    `name`  varchar(80)   NOT NULL COMMENT '产品名称',
    `price` decimal(6, 2) NOT NULL COMMENT '产品价格',
    PRIMARY KEY (`id`)
);

-- ----------------------------
-- Table structure for st_statistics_meta
-- ----------------------------
DROP TABLE IF EXISTS `st_statistics_meta`;
CREATE TABLE `st_statistics_meta`
(
    `id`         bigint(20) NOT NULL AUTO_INCREMENT,
    `field`      varchar(80) NOT NULL COMMENT '数据指标唯一标识符',
    `query_sql`  text COMMENT '实时查询sql',
    `percent`    smallint(6) DEFAULT '0' COMMENT '是否显示为百分比',
    `icon`       varchar(255) DEFAULT NULL COMMENT '图标路径',
    `title`      varchar(30)  DEFAULT NULL COMMENT '图表标题',
    `type`       varchar(50)  DEFAULT NULL COMMENT '字段类型',
    `search`     varchar(255) DEFAULT NULL COMMENT '搜索字段',
    `permission` varchar(50)  DEFAULT NULL COMMENT '权限',
    `layout`     varchar(26)  DEFAULT NULL,
    `span`       int(11) DEFAULT NULL,
    `chart`      varchar(50)  DEFAULT NULL,
    `pattern`    varchar(30)  DEFAULT NULL,
    `tips`       text,
    `menu_id`    bigint(20) DEFAULT NULL,
    `perm_id`    bigint(20) DEFAULT NULL,
    PRIMARY KEY (`id`)
);