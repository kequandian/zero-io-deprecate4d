SET FOREIGN_KEY_CHECKS=0;

DROP TABLE IF EXISTS `t_front_page`;
CREATE TABLE `t_front_page`(
`id` BIGINT(20)  auto_increment,
`count` VARCHAR(50) NOT NULL COMMENT'前端传的唯一数值',
`title` VARCHAR(50) NOT NULL COMMENT '标题',
`page_descrip` VARCHAR(255) COMMENT '页面描述',
`content` JSON DEFAULT NULL COMMENT '页面配置json数据',
`appid` VARCHAR(50) DEFAULT 'DEFAULT' COMMENT 'appid',
`json_name` VARCHAR(255) NOT NULL COMMENT 'json文件名',
`json_path` VARCHAR(255) NOT NULL COMMENT 'json文件路径',
`create_time` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
PRIMARY KEY(`id`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;