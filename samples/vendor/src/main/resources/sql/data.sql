

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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




