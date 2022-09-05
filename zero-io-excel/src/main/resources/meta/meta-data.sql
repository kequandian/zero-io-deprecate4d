SET
FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Records of t_product
-- ----------------------------
INSERT INTO `t_product`
VALUES ('1', '碧丽雅水漾美肌润养面膜28ml/片*6片/盒', 56.00);
INSERT INTO `t_product`
VALUES ('2', '碧丽雅净澈水润沐浴露600ml/瓶*4瓶/箱', 118.00);

-- ----------------------------
-- Records of st_statistics_meta
-- ----------------------------
INSERT INTO `st_statistics_meta`
VALUES (6, 'productReport', 'select name as 产品, price as 价格 from t_product', 0, '', '', 'S,S,D', '产品', null, null, null,
        null, null, null, null, null);
