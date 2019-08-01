/*
 Navicat Premium Data Transfer

 Source Server         : 美文局域网mysql
 Source Server Type    : MySQL
 Source Server Version : 50561
 Source Host           : 192.168.0.112:3306
 Source Schema         : lzda

 Target Server Type    : MySQL
 Target Server Version : 50561
 File Encoding         : 65001

 Date: 01/08/2019 15:57:58
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for approve
-- ----------------------------
DROP TABLE IF EXISTS `approve`;
CREATE TABLE `approve`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `approver_id` int(11) NOT NULL COMMENT '审核人id，关联user表id',
  `approver_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '审核人姓名',
  `committer_id` int(11) NOT NULL COMMENT '申请提交人id，关联user表id',
  `committer_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申请人姓名',
  `applicant_id` int(11) NOT NULL COMMENT '填表人id，关联user表id',
  `applicant_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '填表人姓名',
  `status` int(1) NOT NULL COMMENT '档案审核状态:\r\n1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(2) NOT NULL COMMENT '档案类型：\r\n1个人基本情况报备\r\n2本人持有港澳情况登记表\r\n3本人持有护照情况登记表\r\n4本人婚姻情况\r\n5参加单位组织生活会情况登记表\r\n6操办宴席申请表\r\n7出国（境）情况登记表\r\n8可能影响公正执行职务报备表\r\n9离职交接情况登记表\r\n10配偶、子女及其配偶从业情况登记表\r\n11家人移居国（境）外的情况\r\n12家人连续在国（境）外工作、生活一年以上的情况\r\n13家人被司法机关追究刑事责任的情况\r\n14持有股票的情况\r\n15持有基金的情况\r\n16持有投资型保险的情况\r\n17在国（境）外的存款情况\r\n18在国（境）外的投资情况\r\n19个人认为需要报告的其他事项\r\n20子女与港澳以及台湾居民通婚的情况\r\n21涉警报备表\r\n22收入情况登记表\r\n23收受礼品登记表\r\n24在企业、中介组织和社会团体兼职\r\n25住房情况登记表\r\n26子女与外国人、无国籍人通婚的情况',
  `archive_id` int(11) NOT NULL COMMENT '档案id，关联对应档案表的id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `comments` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '审核意见',
  `last_step` int(1) NOT NULL DEFAULT 1 COMMENT '是否审核的最后一步：1是0否',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 251 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '档案审核表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_abroad_info
-- ----------------------------
DROP TABLE IF EXISTS `arc_abroad_info`;
CREATE TABLE `arc_abroad_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '具体事由',
  `begin_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开始时间',
  `end_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '结束时间',
  `destination` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '目的地',
  `approve_organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '批准单位',
  `fund_source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '资金来源',
  `goabroad_reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出国事由',
  `report` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出国情况报告',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 7 COMMENT '档案类型：出国（境）情况登记表，固定值7无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '出国情况登记表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_affect_business
-- ----------------------------
DROP TABLE IF EXISTS `arc_affect_business`;
CREATE TABLE `arc_affect_business`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  `relationship` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '与民警关系:家人 亲戚 朋友 同事',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '可能影响公正执行职务内容',
  `handle_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '处理情况',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 8 COMMENT '档案类型：可能影响公正执行职务报备表，固定值8无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `affect_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影响人姓名',
  `affect_organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '影响人单位',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '可能影响公正执行职务报备表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_banquet_apply
-- ----------------------------
DROP TABLE IF EXISTS `arc_banquet_apply`;
CREATE TABLE `arc_banquet_apply`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `reason` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '申报事由',
  `relatives_number` int(11) NOT NULL COMMENT '亲属人数',
  `friend_number` int(11) NOT NULL COMMENT '好友人数',
  `other_number` int(11) NOT NULL COMMENT '其他人数',
  `total_level` int(11) NOT NULL COMMENT '宴席标准(元)',
  `wine_level` int(11) NOT NULL COMMENT '酒水标准(元)',
  `cigarette_gift_level` int(11) NOT NULL COMMENT '香烟和礼物标准(元)',
  `vehicle_source` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆来源',
  `vehicle_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '车辆号码',
  `activity_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动时间',
  `activity_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '活动地点',
  `other_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他需要申报和说明的情况',
  `personal_apply` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '个人申请',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 6 COMMENT '档案类型：操办宴席申请表，固定值6无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操办宴席申请表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_basic_info
-- ----------------------------
DROP TABLE IF EXISTS `arc_basic_info`;
CREATE TABLE `arc_basic_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `avatar_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像url',
  `nation` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名族',
  `marital_status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '婚姻状况：未婚、已婚',
  `politic_face` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '政治面貌：党员 群众 团员',
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号码',
  `office_phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '办公电话',
  `education` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '学历',
  `gender` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别： 男 女',
  `birthday` date NOT NULL COMMENT '出生日期',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '现任职务',
  `job_position_level` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职级:1办事员2科员3副科级4副科职5正科级6正科职务7副处职',
  `job_position_time` date NOT NULL COMMENT '现任职务时间',
  `native_place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '籍贯',
  `identity_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证',
  `party_join_time` date NULL DEFAULT NULL COMMENT '入党时间',
  `home_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '家庭住址',
  `responsibility` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分管工作',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工作单位名称',
  `organization_id` int(11) NOT NULL COMMENT '工作单位id，关联organization表id',
  `work_experience` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '个人工作简历',
  `other_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他需要说明的情况',
  `archive_type` int(2) NOT NULL DEFAULT 1 COMMENT '档案类型：个人基本情况报备，固定值1无需填写',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '个人基本情况报备表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_family_abroad
-- ----------------------------
DROP TABLE IF EXISTS `arc_family_abroad`;
CREATE TABLE `arc_family_abroad`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `change_status` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有无变化',
  `family_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '家人姓名',
  `family_appellation` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '家人称谓',
  `to_country` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '移居国家',
  `to_city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '移居城市',
  `identification_number` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '移居类别：外国国籍 永久居留资格 长期居留许可',
  `time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '移居时间',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 11 COMMENT '档案类型：家人移居国外情况，固定值11无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '家人移居国外情况' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_family_abroad_investment
-- ----------------------------
DROP TABLE IF EXISTS `arc_family_abroad_investment`;
CREATE TABLE `arc_family_abroad_investment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `change_status` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有无此类情况：有此类情况，无此类情况',
  `family_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投资人姓名',
  `family_appellation` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投资人称谓',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投资地址',
  `currency` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '币种',
  `amount` int(11) NOT NULL COMMENT '金额',
  `investment_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '投资情况',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 18 COMMENT '档案类型：在国（境）外的投资情况，固定值18无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在国（境）外的投资情况' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_family_abroad_marriage
-- ----------------------------
DROP TABLE IF EXISTS `arc_family_abroad_marriage`;
CREATE TABLE `arc_family_abroad_marriage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `change_status` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有无变化:有变化、无变化',
  `family_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '子女姓名',
  `family_appellation` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '子女称谓',
  `partner_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配偶姓名',
  `partner_nation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配偶国籍',
  `partner_job` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配偶职务',
  `partner_org` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配偶单位',
  `time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登记时间',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 26 COMMENT '档案类型：子女与外国人、无国籍人通婚的情况，固定值26无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '子女与外国人、无国籍人通婚的情况' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_family_abroad_savings
-- ----------------------------
DROP TABLE IF EXISTS `arc_family_abroad_savings`;
CREATE TABLE `arc_family_abroad_savings`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `change_status` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有无此类情况：有此类情况，无此类情况',
  `family_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '存款人姓名',
  `family_appellation` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '存款人称谓',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '存款地址',
  `bank_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '开户银行',
  `currency` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '币种',
  `amount` int(11) NOT NULL COMMENT '金额',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 17 COMMENT '档案类型：在国（境）外的存款情况，固定值17无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在国（境）外的存款情况' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_family_criminal
-- ----------------------------
DROP TABLE IF EXISTS `arc_family_criminal`;
CREATE TABLE `arc_family_criminal`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `change_status` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有无变化',
  `family_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '家人姓名',
  `family_appellation` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '家人称谓',
  `time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '追究时间',
  `period` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '处理阶段:立案侦查、审查起诉、刑事审判、刑罚执行、执行完毕、其他',
  `reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '追究原因',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '处理结果',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 13 COMMENT '档案类型：家人被司法机关追究刑事责任的情况，固定值13无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '家人被司法机关追究刑事责任的情况' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_family_fund
-- ----------------------------
DROP TABLE IF EXISTS `arc_family_fund`;
CREATE TABLE `arc_family_fund`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `change_status` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有无此类情况：有此类情况，无此类情况',
  `family_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '持有人姓名',
  `family_appellation` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '持有人称谓',
  `fund_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '基金名称或代码',
  `fund_number` int(11) NOT NULL COMMENT '基金份额',
  `price` int(11) NOT NULL COMMENT '填报前一交易日净值',
  `total_price` int(11) NULL DEFAULT NULL COMMENT '填报前一交易日总市值',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 14 COMMENT '档案类型：持有基金的情况，固定值15无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '持有基金的情况' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_family_insurance
-- ----------------------------
DROP TABLE IF EXISTS `arc_family_insurance`;
CREATE TABLE `arc_family_insurance`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `change_status` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有无此类情况：有此类情况，无此类情况',
  `family_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '持有人姓名',
  `family_appellation` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '持有人称谓',
  `insurance_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保险产品名称',
  `insurance_number` int(11) NOT NULL COMMENT '保险单号',
  `company_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保险公司全称',
  `price` int(11) NOT NULL COMMENT '累积缴纳保费、投资资金',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 16 COMMENT '档案类型：持有投资型保险的情况，固定值16无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '持有投资型保险的情况' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_family_marriage
-- ----------------------------
DROP TABLE IF EXISTS `arc_family_marriage`;
CREATE TABLE `arc_family_marriage`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `change_status` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有无变化:有变化、无变化',
  `family_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '子女姓名',
  `family_appellation` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '子女称谓',
  `partner_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配偶姓名',
  `partner_area` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配偶所在地区',
  `partner_job` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配偶职务',
  `partner_org` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '配偶单位',
  `time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登记时间',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 20 COMMENT '档案类型：子女与港澳以及台湾居民通婚的情况，固定值20无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '子女与港澳以及台湾居民通婚的情况' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_family_society_rela
-- ----------------------------
DROP TABLE IF EXISTS `arc_family_society_rela`;
CREATE TABLE `arc_family_society_rela`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `basic_info_id` int(11) NOT NULL COMMENT '关联arc_basic_info表id',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `appellation` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '称谓',
  `politic_face` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '政治面貌：党员 群众 团员',
  `birthday` date NOT NULL COMMENT '出生日期',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工作单位',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '家庭主要成员及重要社会关系（关联arc_basic_info表）' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_family_stock
-- ----------------------------
DROP TABLE IF EXISTS `arc_family_stock`;
CREATE TABLE `arc_family_stock`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `change_status` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有无此类情况：有此类情况，无此类情况',
  `family_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '持有人姓名',
  `family_appellation` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '持有人称谓',
  `stock_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '股票名称或代码',
  `stock_number` int(11) NOT NULL COMMENT '持股数量',
  `price` int(11) NOT NULL COMMENT '填报前一交易日市值',
  `total_price` int(11) NULL DEFAULT NULL COMMENT '填报前一交易日总市值',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 14 COMMENT '档案类型：持有股票的情况，固定值14无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '持有股票的情况' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_family_workabroad
-- ----------------------------
DROP TABLE IF EXISTS `arc_family_workabroad`;
CREATE TABLE `arc_family_workabroad`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `change_status` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有无变化',
  `family_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '家人姓名',
  `family_appellation` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '家人称谓',
  `country` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所在国家(地区)',
  `city` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '所在城市',
  `time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '起始时间',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 11 COMMENT '档案类型：家人移居国外情况，固定值11无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '家人移居国外情况' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_gift_info
-- ----------------------------
DROP TABLE IF EXISTS `arc_gift_info`;
CREATE TABLE `arc_gift_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `gift_person_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '送礼人姓名',
  `gift_org` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '送礼人单位',
  `gift_job` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '送礼人职务',
  `gift_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '送礼时间',
  `gift_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '送礼地址',
  `gift_way` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '送礼方式',
  `gift_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '送礼事由',
  `gift_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '礼品名称',
  `gift_number` int(11) NOT NULL COMMENT '礼品数量',
  `gift_price` int(11) NOT NULL COMMENT '礼品折价(元)',
  `gift_money` int(11) NOT NULL COMMENT '礼金(元)',
  `gift_total` int(11) NOT NULL COMMENT '合计(元)',
  `gift_handle` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '处理情况:退还当事人、上缴分局、上缴单位、其他',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 23 COMMENT '档案类型：收受礼品登记表，固定值23无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收受礼品登记表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_hk_mo_info
-- ----------------------------
DROP TABLE IF EXISTS `arc_hk_mo_info`;
CREATE TABLE `arc_hk_mo_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `certificate_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件名称',
  `certificate_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '证件号码',
  `expiry_date` date NULL DEFAULT NULL COMMENT '有效期',
  `storekeeper` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保管者：单位保管 个人保管',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 2 COMMENT '档案类型：本人持有港澳情况登记表，固定值2无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '本人持有港澳通行证情况登记表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_house_info
-- ----------------------------
DROP TABLE IF EXISTS `arc_house_info`;
CREATE TABLE `arc_house_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房屋地址',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '房屋性质:福利房、商品房、自建房、集资建房',
  `owner` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '产权人',
  `area` int(11) NOT NULL COMMENT '建筑面积',
  `time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '购租时间',
  `public_funds` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '有无公款装修情况:有、无',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 25 COMMENT '档案类型：住房情况登记表，固定值25无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '住房情况登记表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_income_info
-- ----------------------------
DROP TABLE IF EXISTS `arc_income_info`;
CREATE TABLE `arc_income_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `last_year` int(11) NOT NULL COMMENT '上年度工资收入',
  `stock` int(11) NULL DEFAULT NULL COMMENT '从事股票、基金、理财产品收益所得（元',
  `award` int(11) NULL DEFAULT NULL COMMENT '各类奖金、津贴、补贴及福利费等（元）',
  `labour` int(11) NULL DEFAULT NULL COMMENT '从事咨询、讲学、写作、审稿、书画等劳务所得（元）',
  `other` int(11) NULL DEFAULT NULL COMMENT '其他',
  `total` int(11) NULL DEFAULT NULL COMMENT '合计',
  `personal_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '个人说明',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 22 COMMENT '档案类型：收入情况登记表，固定值22无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '收入情况登记表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_leaveoffice_handover
-- ----------------------------
DROP TABLE IF EXISTS `arc_leaveoffice_handover`;
CREATE TABLE `arc_leaveoffice_handover`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `during_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任职时间',
  `to_organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调往单位',
  `to_job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '调往职务',
  `document_handover` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公文资料是否移交',
  `office_handover` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '办公用具是否移交',
  `life_handover` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '生活用具是否移交',
  `debt` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '有无单位欠款',
  `other_handover` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他公物按规定移交情况',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 9 COMMENT '档案类型：离职交接情况登记表，固定值9无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '离职交接情况登记表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_loan
-- ----------------------------
DROP TABLE IF EXISTS `arc_loan`;
CREATE TABLE `arc_loan`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `politic_face` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '政治面貌',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `gender` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 27 COMMENT '档案类型：借贷（担保）登记表，固定值27无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '借贷（担保）登记表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_loan_rela
-- ----------------------------
DROP TABLE IF EXISTS `arc_loan_rela`;
CREATE TABLE `arc_loan_rela`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `loan_id` int(11) NOT NULL COMMENT '关联arc_loan表loan_id',
  `type` int(11) NOT NULL COMMENT '类型:1借出2借入3担保4经营活动',
  `creditor` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '债权人',
  `cbligor` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '债务人',
  `amount` int(11) NULL DEFAULT NULL COMMENT '金额',
  `time_limit` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '约定期限',
  `interest` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '约定年利率',
  `fund_source` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '资金来源',
  `enterprise_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业名称',
  `enterprise_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '企业类型：1独资2合伙',
  `profit` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '盈利情况',
  `rectify_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '整改情况',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_loan_id`(`loan_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 38 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '借贷（担保）情况，关联借贷（担保）登记表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_marriage_info
-- ----------------------------
DROP TABLE IF EXISTS `arc_marriage_info`;
CREATE TABLE `arc_marriage_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `marriage_status` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '婚姻现状：未婚 离婚 已婚 丧偶',
  `change_situation` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变化情况：有变化 无变化',
  `change_status` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有变化：结婚 离婚 丧偶 再婚',
  `change_date` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '变化时间',
  `change_reason` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '变化原因',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 4 COMMENT '档案类型：本人婚姻情况，固定值4无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '本人婚姻情况' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_organization_meeting
-- ----------------------------
DROP TABLE IF EXISTS `arc_organization_meeting`;
CREATE TABLE `arc_organization_meeting`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `meeting_subject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '会议议题',
  `meeting_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参与时间',
  `problem` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '查找问题',
  `rectify` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '整改措施',
  `party_opinion` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '党委意见',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 5 COMMENT '档案类型：参加单位组织生活会情况，固定值5无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参加单位组织生活会情况' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_part_time_job
-- ----------------------------
DROP TABLE IF EXISTS `arc_part_time_job`;
CREATE TABLE `arc_part_time_job`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `parttime_org` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '兼职单位',
  `parttime_org_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '兼职单位性质：国家机关、全民企业单位、全民事业单位、社会团体、集体企业、民办企业、外资企业',
  `parttime_job` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '兼任职务',
  `parttime_during` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '兼职时间',
  `parttime_salary` int(11) NOT NULL COMMENT '兼职取酬情况(元/年)',
  `approve_org` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '批准机关',
  `advice` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '情况说明以及本人意见',
  `handle` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '纠正处理情况',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 24 COMMENT '档案类型：在企业、中介组织和社会团体兼职，固定值24无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在企业、中介组织和社会团体兼职' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_passport_info
-- ----------------------------
DROP TABLE IF EXISTS `arc_passport_info`;
CREATE TABLE `arc_passport_info`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `passport_number` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '护照号',
  `grant_date` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '签发日期',
  `expiry_date` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效期',
  `storekeeper` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '保管者：单位保管 个人保管',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 3 COMMENT '档案类型：本人持有护照情况登记表，固定值3无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '本人持有护照况登记表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_personal_other
-- ----------------------------
DROP TABLE IF EXISTS `arc_personal_other`;
CREATE TABLE `arc_personal_other`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `other_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '需要报告的其他事项',
  `promise` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '承诺',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 19 COMMENT '档案类型：个人认为需要报告的其他事项，固定值19无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '个人认为需要报告的其他事项' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for arc_police_involve
-- ----------------------------
DROP TABLE IF EXISTS `arc_police_involve`;
CREATE TABLE `arc_police_involve`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '档案填写人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  `relationship` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '与警关系',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '涉警内容',
  `result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '处理情况',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `approve_status` int(1) NOT NULL DEFAULT 1 COMMENT '审核状态：1待单位负责人审核\r\n2单位负责人审核通过\r\n3单位负责人驳回\r\n4待纪委审核\r\n5纪委审核通过\r\n6纪委审核驳回',
  `archive_type` int(1) NOT NULL DEFAULT 21 COMMENT '档案类型：涉警报备表，固定值21无需填写',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `involved_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '涉警人姓名',
  `involved_organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '涉警人单位',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '涉警报备表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for attachment
-- ----------------------------
DROP TABLE IF EXISTS `attachment`;
CREATE TABLE `attachment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '附件url',
  `source_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关联id',
  `quick_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '缩略图url',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_source_id`(`source_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 139 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `type` int(1) NOT NULL COMMENT '类型：0菜单、1数据查看范围 ',
  `name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限名',
  `authflag` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '权限标识',
  `active` int(1) NOT NULL DEFAULT 1 COMMENT '是否有效，0：无效，1：有效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '权限表（关联role_auth表）' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of authority
-- ----------------------------
INSERT INTO `authority` VALUES (1, 0, '廉政审批', '廉政审批', 1, '2019-07-16 17:55:00');
INSERT INTO `authority` VALUES (2, 0, '奖励信息', '奖励信息', 1, '2019-07-16 17:59:28');
INSERT INTO `authority` VALUES (3, 0, '违惩信息', '违惩信息', 1, '2019-07-16 17:59:41');
INSERT INTO `authority` VALUES (4, 0, '上报管理', '上报管理', 1, '2019-07-16 18:00:01');
INSERT INTO `authority` VALUES (5, 0, '廉政报告', '廉政报告', 1, '2019-07-16 17:55:18');
INSERT INTO `authority` VALUES (6, 0, '统计', '统计', 1, '2019-07-16 18:00:26');
INSERT INTO `authority` VALUES (7, 0, '日志', '日志', 1, '2019-07-16 18:00:48');
INSERT INTO `authority` VALUES (8, 0, '用户管理', '用户管理', 1, '2019-07-16 18:01:30');
INSERT INTO `authority` VALUES (9, 1, '查看所有人', '查看所有人', 1, '2019-07-16 18:02:04');
INSERT INTO `authority` VALUES (10, 1, '能查看本单位', '能查看本单位', 1, '2019-07-16 18:03:03');
INSERT INTO `authority` VALUES (11, 1, '只能查看自己', '只能查看自己', 1, '2019-07-16 18:03:11');
INSERT INTO `authority` VALUES (12, 2, '上报管理新增', '上报管理新增', 1, '2019-07-25 11:11:28');
INSERT INTO `authority` VALUES (13, 2, '上报管理修改', '上报管理修改', 1, '2019-07-25 11:11:45');
INSERT INTO `authority` VALUES (14, 2, '上报管理删除', '上报管理删除', 1, '2019-07-25 11:11:55');
INSERT INTO `authority` VALUES (15, 2, '奖励信息新增', '奖励信息新增', 1, '2019-07-25 12:08:51');
INSERT INTO `authority` VALUES (16, 2, '奖励信息修改', '奖励信息修改', 1, '2019-07-25 12:09:06');
INSERT INTO `authority` VALUES (17, 2, '奖励信息删除', '奖励信息删除', 1, '2019-07-25 12:09:33');
INSERT INTO `authority` VALUES (18, 2, '违惩信息新增', '违惩信息新增', 1, '2019-07-25 18:18:04');
INSERT INTO `authority` VALUES (19, 2, '违惩信息修改', '违惩信息修改', 1, '2019-07-25 18:18:20');
INSERT INTO `authority` VALUES (20, 2, '违惩信息删除', '违惩信息删除', 1, '2019-07-25 18:18:33');
INSERT INTO `authority` VALUES (21, 0, '廉政预警', '廉政预警', 1, '2019-07-25 18:42:17');
INSERT INTO `authority` VALUES (22, 0, '廉政管理', '廉政管理', 1, '2019-07-25 19:01:18');

-- ----------------------------
-- Table structure for incorrupt_self_summary
-- ----------------------------
DROP TABLE IF EXISTS `incorrupt_self_summary`;
CREATE TABLE `incorrupt_self_summary`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `userId` int(11) NOT NULL COMMENT '用户id，关联user表id',
  `summary` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '廉政自律小结',
  `createTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for operate_log
-- ----------------------------
DROP TABLE IF EXISTS `operate_log`;
CREATE TABLE `operate_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `operator_id` int(11) NOT NULL COMMENT '操作人id，关联user表id',
  `operator_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人姓名',
  `operator_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作人真实ip',
  `archive_owner_id` int(11) NULL DEFAULT NULL COMMENT '表格拥有者id，关联user表id\r\n',
  `archive_owner_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格拥有者姓名',
  `owner_org` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '表格拥有者单位',
  `operate_object` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作对象：26类个人填报档案表、奖惩表、上报表、统计信息',
  `operate_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作类型：0查看1添加2修改3删除4提交审核5审核通过6审核驳回7上报',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1487 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `parent_id` int(11) NULL DEFAULT NULL COMMENT '父单位id',
  `active` int(1) NOT NULL DEFAULT 1 COMMENT '是否有效，0：无效，1：有效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of organization
-- ----------------------------
INSERT INTO `organization` VALUES (1, '江苏省淮安市公安局淮安分局', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (2, '江苏省淮安市公安局淮安分局指挥中心', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (3, '江苏省淮安市公安局淮安分局政治处', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (4, '江苏省淮安市公安局淮安分局警务督察大队', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (5, '江苏省淮安市公安局淮安分局单位内部安全保卫大队', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (6, '江苏省淮安市公安局淮安分局出入境管理大队', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (7, '江苏省淮安市公安局淮安分局法制大队', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (8, '江苏省淮安市公安局淮安分局信访科', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (9, '江苏省淮安市公安局淮安分局警务保障室', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (10, '江苏省淮安市公安局淮安分局刑事警察大队', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (11, '江苏省淮安市公安局淮安分局治安警察大队', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (12, '江苏省淮安市公安局淮安分局经济犯罪侦查大队', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (13, '江苏省淮安市公安局淮安分局交通警察大队', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (14, '江苏省淮安市公安局淮安分局国内安全保卫大队', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (15, '江苏省淮安市淮安区看守所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (16, '江苏省淮安市淮安区拘留所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (17, '江苏省淮安市公安局淮安分局巡特警大队', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (18, '江苏省淮安市公安局淮安分局城市管理办公室', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (19, '江苏省淮安市公安局淮安分局镇淮楼派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (20, '江苏省淮安市公安局淮安分局鱼市派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (21, '江苏省淮安市公安局淮安分局华亭派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (22, '江苏省淮安市公安局淮安分局河下派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (23, '江苏省淮安市公安局淮安分局板闸派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (24, '江苏省淮安市公安局淮安分局平桥派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (25, '江苏省淮安市公安局淮安分局上河派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (26, '江苏省淮安市公安局淮安分局建淮派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (27, '江苏省淮安市公安局淮安分局马甸派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (28, '江苏省淮安市公安局淮安分局朱桥派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (29, '江苏省淮安市公安局淮安分局溪河派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (30, '江苏省淮安市公安局淮安分局施河派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (31, '江苏省淮安市公安局淮安分局车桥派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (32, '江苏省淮安市公安局淮安分局泾口派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (33, '江苏省淮安市公安局淮安分局流均派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (34, '江苏省淮安市公安局淮安分局博里派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (35, '江苏省淮安市公安局淮安分局仇桥派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (36, '江苏省淮安市公安局淮安分局复兴派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (37, '江苏省淮安市公安局淮安分局苏嘴派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (38, '江苏省淮安市公安局淮安分局茭陵派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (39, '江苏省淮安市公安局淮安分局宋集派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (40, '江苏省淮安市公安局淮安分局钦工派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (41, '江苏省淮安市公安局淮安分局顺河派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (42, '江苏省淮安市公安局淮安分局季桥派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (43, '江苏省淮安市公安局淮安分局城东派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (44, '江苏省淮安市公安局淮安分局席桥派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (45, '江苏省淮安市公安局淮安分局三堡派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (46, '江苏省淮安市公安局淮安分局林集派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (47, '江苏省淮安市公安局淮安分局南闸派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (48, '江苏省淮安市公安局淮安分局白马湖派出所', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (49, '江苏省淮安市公安局淮安分局禁毒大队', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (50, '江苏省淮安市公安局淮安分局经济开发区治安管理办公室', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (51, '江苏省淮安市公安局淮安分局网络安全保卫大队', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (52, '江苏省淮安市公安局淮安分局技术侦察大队', NULL, 1, '2019-07-16 08:19:09');
INSERT INTO `organization` VALUES (53, '江苏省淮安市公安局淮安分局水上警察大队', NULL, 1, '2019-07-16 08:19:09');

-- ----------------------------
-- Table structure for pun_accountability
-- ----------------------------
DROP TABLE IF EXISTS `pun_accountability`;
CREATE TABLE `pun_accountability`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '被惩罚人id，关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '被惩罚人单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被违惩人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被惩罚人职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被惩罚人单位名称',
  `time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '问责时间',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '问责类型：诫勉谈话、书面检查、责令公开道歉、停止检查、引咎辞职、责令辞职、免职、辞退或解聘',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '问责内容',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `operator_id` int(11) NOT NULL COMMENT '填表人ID',
  `operator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '填表人',
  `attachment_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '附件id，一对多关联attachment',
  `punish_type` int(1) NOT NULL DEFAULT 2 COMMENT '违惩类型：2一般干部问责情况登记表',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '一般干部问责情况登记表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pun_gift
-- ----------------------------
DROP TABLE IF EXISTS `pun_gift`;
CREATE TABLE `pun_gift`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '被惩罚人id，关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '被惩罚人单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被违惩人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被惩罚人职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被惩罚人单位名称',
  `time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上缴时间',
  `gift_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上缴礼品名称',
  `amount` int(11) NOT NULL COMMENT '数量',
  `price` int(11) NOT NULL COMMENT '折价（元）',
  `money` int(11) NOT NULL COMMENT '上缴礼金（元）',
  `total` int(11) NOT NULL COMMENT '合计（元）',
  `gift_person_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '送礼人姓名',
  `gift_person_org` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '送礼人单位',
  `gift_person_job` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '送礼人职务',
  `gift_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '送礼时间',
  `gift_address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '送礼地点',
  `regist_org` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '接受登记部门',
  `handle_person_id` int(11) NULL DEFAULT NULL COMMENT '经手人id',
  `handle_person` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '经手人',
  `charge_person_id` int(11) NOT NULL COMMENT '负责人id',
  `charge_person` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '负责人',
  `handle_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '礼品处理情况',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `operator_id` int(11) NOT NULL COMMENT '填表人ID',
  `operator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '填表人',
  `attachment_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '附件id，一对多关联attachment',
  `punish_type` int(1) NOT NULL DEFAULT 3 COMMENT '违惩类型：3一般干部收受礼品（金）情况登记表',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '一般干部收受礼品（金）情况登记表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pun_notice
-- ----------------------------
DROP TABLE IF EXISTS `pun_notice`;
CREATE TABLE `pun_notice`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '被惩罚人id，关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '被惩罚人单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被违惩人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被惩罚人职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被惩罚人单位名称',
  `time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通报时间',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通报类型：分局通报、市局通报、省厅通报、其他部门通报',
  `handle_info` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '处理情况：通报批评、提醒谈话',
  `score` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '记分情况',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '通报内容',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `operator_id` int(11) NOT NULL COMMENT '填表人ID',
  `operator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '填表人',
  `attachment_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '附件id，一对多关联attachment',
  `punish_type` int(1) NOT NULL DEFAULT 5 COMMENT '违惩类型：5一般干部被通报情况登记表',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '一般干部被通报情况登记表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pun_report
-- ----------------------------
DROP TABLE IF EXISTS `pun_report`;
CREATE TABLE `pun_report`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '被惩罚人id，关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '被惩罚人单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被违惩人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被惩罚人职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被惩罚人单位名称',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '举报形式：写检举、电话举报、当面向有关人员举报、网上举报',
  `handle_org` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '受理部门',
  `time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '举报时间',
  `report_person_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '举报人',
  `contact` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '联系方式',
  `end_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '核实结束时间',
  `charge_person_id` int(11) NOT NULL COMMENT '负责人id',
  `charge_person` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '负责人姓名',
  `handle_dep` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '填表科室',
  `problem` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '反应主要问题',
  `result` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '核实结果',
  `hanlde_result` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '处理结果',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `operator_id` int(11) NOT NULL COMMENT '填表人ID',
  `operator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '填表人',
  `attachment_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '附件id，一对多关联attachment',
  `punish_type` int(1) NOT NULL DEFAULT 6 COMMENT '违惩类型：6一般干部被群众信访举报情况登记表',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '一般干部被群众信访举报情况登记表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pun_talk
-- ----------------------------
DROP TABLE IF EXISTS `pun_talk`;
CREATE TABLE `pun_talk`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '被惩罚人id，关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '被惩罚人单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被违惩人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被惩罚人职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被惩罚人单位名称',
  `time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '谈话时间',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '谈话类型',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地点',
  `talk_person_id` int(11) NOT NULL COMMENT '谈话人id',
  `talk_person_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '谈话人姓名',
  `talk_person_org` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '谈话人单位',
  `talk_person_job` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '谈话人职务',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '谈话内容',
  `talked_person_advice` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被谈话人意见',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `operator_id` int(11) NOT NULL COMMENT '填表人ID',
  `operator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '填表人',
  `attachment_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '附件id，一对多关联attachment',
  `punish_type` int(1) NOT NULL DEFAULT 4 COMMENT '违惩类型：4一般干部廉政谈话情况登记表',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '一般干部廉政谈话情况登记表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for pun_violation
-- ----------------------------
DROP TABLE IF EXISTS `pun_violation`;
CREATE TABLE `pun_violation`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '被惩罚人id，关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '被惩罚人单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被违惩人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被惩罚人职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被惩罚人单位名称',
  `birthday` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '出生年月',
  `gender` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别',
  `violation_level` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '违纪级别：政务处分 党纪处分 问责 违纪',
  `violation_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '违纪类型：见需求确认文档',
  `handle_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '处理情况',
  `violation_org` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '查处单位',
  `handle_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '处理时间',
  `operator_id` int(11) NOT NULL COMMENT '填表人ID',
  `operator` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '填表人',
  `mistake_fact` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主要错误事实',
  `handle_basis` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '处理依据',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `attachment_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '附件id，一对多关联attachment',
  `punish_type` int(1) NOT NULL DEFAULT 1 COMMENT '违惩类型：1一般干部违纪情况登记表',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '一般干部违纪情况登记表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for reward
-- ----------------------------
DROP TABLE IF EXISTS `reward`;
CREATE TABLE `reward`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(11) NOT NULL COMMENT '关联user表id',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `user_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '被表彰人姓名',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职务',
  `organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `reward_type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表彰类型：表彰、嘉奖、三等功、二等功、一等功、其他',
  `reward_time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表彰时间',
  `reward_organization` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表彰单位',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '表彰内容',
  `remark` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '备注',
  `attachment_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '附件uuid，关联附件表sourceId，默认0表示没有',
  `operator_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '操作者姓名',
  `operator_id` int(1) NOT NULL COMMENT '操作者id',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_user_id`(`user_id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 41 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '奖励信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `role_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名',
  `active` int(1) NOT NULL DEFAULT 1 COMMENT '是否有效，0：无效，1：有效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`role_name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表(关联user表)' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '普通用户', 1, '2019-07-01 15:16:34');
INSERT INTO `role` VALUES (2, '单位负责人', 1, '2019-07-01 15:16:34');
INSERT INTO `role` VALUES (3, '局领导', 1, '2019-07-01 15:16:34');
INSERT INTO `role` VALUES (4, '政治处领导', 1, '2019-07-02 09:00:52');
INSERT INTO `role` VALUES (5, '督察大队', 1, '2019-07-02 09:01:00');
INSERT INTO `role` VALUES (6, '纪委', 1, '2019-07-02 09:01:06');

-- ----------------------------
-- Table structure for role_auth
-- ----------------------------
DROP TABLE IF EXISTS `role_auth`;
CREATE TABLE `role_auth`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `aid` int(11) NOT NULL COMMENT '权限id',
  `rid` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 64 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色-权限多对多关联表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role_auth
-- ----------------------------
INSERT INTO `role_auth` VALUES (4, 1, 2);
INSERT INTO `role_auth` VALUES (5, 4, 2);
INSERT INTO `role_auth` VALUES (8, 10, 2);
INSERT INTO `role_auth` VALUES (9, 1, 6);
INSERT INTO `role_auth` VALUES (10, 2, 6);
INSERT INTO `role_auth` VALUES (11, 3, 6);
INSERT INTO `role_auth` VALUES (12, 4, 6);
INSERT INTO `role_auth` VALUES (13, 5, 6);
INSERT INTO `role_auth` VALUES (14, 6, 6);
INSERT INTO `role_auth` VALUES (15, 7, 6);
INSERT INTO `role_auth` VALUES (16, 8, 6);
INSERT INTO `role_auth` VALUES (17, 1, 5);
INSERT INTO `role_auth` VALUES (18, 2, 5);
INSERT INTO `role_auth` VALUES (19, 3, 5);
INSERT INTO `role_auth` VALUES (20, 4, 5);
INSERT INTO `role_auth` VALUES (21, 5, 5);
INSERT INTO `role_auth` VALUES (22, 6, 5);
INSERT INTO `role_auth` VALUES (23, 7, 5);
INSERT INTO `role_auth` VALUES (24, 8, 5);
INSERT INTO `role_auth` VALUES (27, 9, 3);
INSERT INTO `role_auth` VALUES (28, 2, 4);
INSERT INTO `role_auth` VALUES (31, 9, 4);
INSERT INTO `role_auth` VALUES (32, 9, 5);
INSERT INTO `role_auth` VALUES (33, 9, 6);
INSERT INTO `role_auth` VALUES (34, 12, 2);
INSERT INTO `role_auth` VALUES (35, 13, 2);
INSERT INTO `role_auth` VALUES (36, 14, 2);
INSERT INTO `role_auth` VALUES (37, 15, 4);
INSERT INTO `role_auth` VALUES (38, 16, 4);
INSERT INTO `role_auth` VALUES (39, 17, 4);
INSERT INTO `role_auth` VALUES (40, 2, 1);
INSERT INTO `role_auth` VALUES (41, 3, 1);
INSERT INTO `role_auth` VALUES (42, 2, 2);
INSERT INTO `role_auth` VALUES (43, 3, 2);
INSERT INTO `role_auth` VALUES (44, 3, 3);
INSERT INTO `role_auth` VALUES (45, 2, 3);
INSERT INTO `role_auth` VALUES (46, 3, 4);
INSERT INTO `role_auth` VALUES (47, 3, 4);
INSERT INTO `role_auth` VALUES (48, 18, 5);
INSERT INTO `role_auth` VALUES (49, 19, 5);
INSERT INTO `role_auth` VALUES (50, 20, 5);
INSERT INTO `role_auth` VALUES (51, 18, 6);
INSERT INTO `role_auth` VALUES (52, 19, 6);
INSERT INTO `role_auth` VALUES (53, 20, 6);
INSERT INTO `role_auth` VALUES (54, 21, 5);
INSERT INTO `role_auth` VALUES (55, 21, 6);
INSERT INTO `role_auth` VALUES (60, 11, 1);
INSERT INTO `role_auth` VALUES (61, 22, 2);
INSERT INTO `role_auth` VALUES (62, 22, 5);
INSERT INTO `role_auth` VALUES (63, 22, 6);

-- ----------------------------
-- Table structure for rpt_incorrupt
-- ----------------------------
DROP TABLE IF EXISTS `rpt_incorrupt`;
CREATE TABLE `rpt_incorrupt`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `committer_id` int(11) NOT NULL COMMENT '上报人id，关联user表id',
  `committer_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上报人姓名',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `organization_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `title` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '廉政信息表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rpt_responsibility_perform
-- ----------------------------
DROP TABLE IF EXISTS `rpt_responsibility_perform`;
CREATE TABLE `rpt_responsibility_perform`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `committer_id` int(11) NOT NULL COMMENT '上报人id，关联user表id',
  `committer_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上报人姓名',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `organization_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '时间',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地点',
  `participants` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '参加人员',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '内容',
  `attachment_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '附件id，一对多关联attachment',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '履责纪实表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rpt_responsibility_report
-- ----------------------------
DROP TABLE IF EXISTS `rpt_responsibility_report`;
CREATE TABLE `rpt_responsibility_report`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `committer_id` int(11) NOT NULL COMMENT '上报人id，关联user表id',
  `committer_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上报人姓名',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `organization_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `year` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '年份',
  `quarter` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '季度：第一二三四季度',
  `attachment_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '附件id，一对多关联attachment',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主体责任季度工单任务落实情况反馈表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rpt_responsibility_report_task
-- ----------------------------
DROP TABLE IF EXISTS `rpt_responsibility_report_task`;
CREATE TABLE `rpt_responsibility_report_task`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `responsibility_report_id` int(11) NOT NULL COMMENT '关联rpt_responsibility_report表id',
  `type` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工单类别：主体责任季度工单、第一责任人责任季度工单',
  `task_order` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务序号',
  `complete` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '是否完成',
  `complete_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '具体落实情况',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_responsibility_report_id`(`responsibility_report_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 66 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '主体责任季度工单表，关联主体责任主表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for rpt_team_thinking
-- ----------------------------
DROP TABLE IF EXISTS `rpt_team_thinking`;
CREATE TABLE `rpt_team_thinking`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `committer_id` int(11) NOT NULL COMMENT '上报人id，关联user表id',
  `committer_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '上报人姓名',
  `organization_id` int(11) NOT NULL COMMENT '单位id',
  `organization_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '单位名称',
  `time` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '月份',
  `ploice_number` int(11) NOT NULL COMMENT '民警人数',
  `party_number` int(11) NOT NULL COMMENT '党员人数',
  `obey_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '遵纪情况',
  `team_thinking_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '队伍思想状况',
  `team_advantage_problem` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '队伍特色亮点及存在问题',
  `main_measure` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主要措施',
  `other_info` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '其他情况',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '队伍思想状况表' ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `roleid` int(11) NOT NULL DEFAULT 1 COMMENT '角色id',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '220abc65f4a96bbc11f2fd2803fbd541' COMMENT '密码',
  `realname` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `gender` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '性别：男 女',
  `birthday` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出生日期',
  `identity_number` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '身份证',
  `organization_id` int(11) NOT NULL COMMENT '工作单位id，关联organization表id',
  `organization_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '工作单位名称，冗余以避免关联查询',
  `police_code` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '警号',
  `job_position` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '职位',
  `active` int(1) NOT NULL DEFAULT 1 COMMENT '是否有效：0无效1有效',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_roleid`(`roleid`) USING BTREE,
  INDEX `index_organization_id`(`organization_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 581 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 3, '220abc65f4a96bbc11f2fd2803fbd541', '王志勇', '男', '1963-07-10', '320828196307106419', 1, '江苏省淮安市公安局淮安分局', '084002', '政委、四级高级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (2, 1, '220abc65f4a96bbc11f2fd2803fbd541', '高鹤洪', '男', '1961-07-20', '320882196108180016', 1, '江苏省淮安市公安局淮安分局', '084015', '二级高级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (3, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈仿硕', '男', '1962-11-23', '320828196211230036', 1, '江苏省淮安市公安局淮安分局', '084018', '四级高级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (4, 3, '220abc65f4a96bbc11f2fd2803fbd541', '童云飞', '男', '1964-02-21', '320828196402212818', 1, '江苏省淮安市公安局淮安分局', '084003', '副局长、四级高级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (5, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李树成', '男', '1963-06-26', '320828196306260051', 1, '江苏省淮安市公安局淮安分局', '084019', '四级高级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (6, 1, '220abc65f4a96bbc11f2fd2803fbd541', '杨美洪', '男', '1963-04-18', '320803196304180018', 1, '江苏省淮安市公安局淮安分局', '084020', '一级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (7, 3, '220abc65f4a96bbc11f2fd2803fbd541', '王文红', '男', '1965-11-03', '320828196311030058', 1, '江苏省淮安市公安局淮安分局', '084004', '副局长、警务技术四级主任', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (8, 3, '220abc65f4a96bbc11f2fd2803fbd541', '潘如标', '男', '1966-07-26', '320828196608264410', 1, '江苏省淮安市公安局淮安分局', '084005', '副局长、一级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (9, 3, '220abc65f4a96bbc11f2fd2803fbd541', '王萍', '女', '1966-12-08', '320828196612080067', 1, '江苏省淮安市公安局淮安分局', '084006', '副政委、一级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (10, 3, '220abc65f4a96bbc11f2fd2803fbd541', '庄宝成', '男', '1966-08-19', '320828196608190052', 1, '江苏省淮安市公安局淮安分局', '084007', '副局长、二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (11, 1, '220abc65f4a96bbc11f2fd2803fbd541', '高凤美', '男', '1960-11-11', '320882196011110011', 1, '江苏省淮安市公安局淮安分局', '084017', '二级高级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (12, 1, '220abc65f4a96bbc11f2fd2803fbd541', '贺爱进', '男', '1959-10-09', '320828195910090015', 1, '江苏省淮安市公安局淮安分局', '084016', '四级高级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (13, 3, '220abc65f4a96bbc11f2fd2803fbd541', '贾金铭', '男', '1967-11-22', '320828196711220037', 1, '江苏省淮安市公安局淮安分局', '084009', '副局长、二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (14, 6, '220abc65f4a96bbc11f2fd2803fbd541', '王海鸿', '男', '1972-02-21', '320828197202212818', 1, '江苏省淮安市公安局淮安分局', '084008', '纪检组长、主任科员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (15, 2, '220abc65f4a96bbc11f2fd2803fbd541', '刘斌', '男', '1979-11-25', '320828197911250016', 1, '江苏省淮安市公安局淮安分局', '084010', '党委委员、治安警察大队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (16, 3, '220abc65f4a96bbc11f2fd2803fbd541', '陈明中', '男', '1965-11-29', '320811196511290535', 1, '江苏省淮安市公安局淮安分局', '084001', '副区长、党委书记、局长、督察长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (17, 1, '220abc65f4a96bbc11f2fd2803fbd541', '赵年超', '男', '1966-05-03', '320828196605030037', 2, '江苏省淮安市公安局淮安分局指挥中心', '084028', '副主任、警务技术二级主管', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (18, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王赣明', '女', '1965-07-19', '320828196507190029', 2, '江苏省淮安市公安局淮安分局指挥中心', '084103', '副主任、二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (19, 2, '220abc65f4a96bbc11f2fd2803fbd541', '仇绍峰', '男', '1980-10-14', '320882198010143419', 2, '江苏省淮安市公安局淮安分局指挥中心', '084125', '主任、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (20, 1, '220abc65f4a96bbc11f2fd2803fbd541', '朱士能', '男', '1974-02-27', '320502197402272516', 2, '江苏省淮安市公安局淮安分局指挥中心', '084472', '副教导员、警务技术三级主管', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (21, 1, '220abc65f4a96bbc11f2fd2803fbd541', '周时', '男', '1990-10-05', '320803199010054415', 2, '江苏省淮安市公安局淮安分局指挥中心', '084217', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (22, 1, '220abc65f4a96bbc11f2fd2803fbd541', '倪海军', '男', '1976-09-07', '320828197609071279', 2, '江苏省淮安市公安局淮安分局指挥中心', '084595', '所长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (23, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王紫薇', '女', '1995-12-29', '320882199512291643', 2, '江苏省淮安市公安局淮安分局指挥中心', '084682', '民警', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (24, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陶玲', '女', '1978-02-28', '320828197802286087', 2, '江苏省淮安市公安局淮安分局指挥中心', '084179', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (25, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陶昌俊', '男', '1989-02-08', '320882198902083212', 2, '江苏省淮安市公安局淮安分局指挥中心', '084285', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (26, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张桂林', '女', '1966-01-08', '320828196601085823', 2, '江苏省淮安市公安局淮安分局指挥中心', '084092', '科长、警务技术二级主管', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (27, 1, '220abc65f4a96bbc11f2fd2803fbd541', '石峰岚', '女', '1977-12-30', '320828197712300420', 2, '江苏省淮安市公安局淮安分局指挥中心', '084527', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (28, 1, '220abc65f4a96bbc11f2fd2803fbd541', '姜荣', '女', '1979-05-04', '320882197910044227', 2, '江苏省淮安市公安局淮安分局指挥中心', '084215', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (29, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李靓', '女', '1988-09-25', '320882198809250020', 2, '江苏省淮安市公安局淮安分局指挥中心', '084411', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (30, 1, '220abc65f4a96bbc11f2fd2803fbd541', '杜蕾', '女', '1977-01-23', '32088219770123004X', 2, '江苏省淮安市公安局淮安分局指挥中心', '084524', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (31, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘金元', '男', '1963-07-18', '320828196307181435', 2, '江苏省淮安市公安局淮安分局指挥中心', '084423', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (32, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王康', '男', '1988-09-16', '320804198809160018', 2, '江苏省淮安市公安局淮安分局指挥中心', '084237', '副科长、一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (33, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王玉生', '男', '1962-07-26', '320882196207260011', 2, '江苏省淮安市公安局淮安分局指挥中心', '084360', '四级高级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (34, 1, '220abc65f4a96bbc11f2fd2803fbd541', '阙秀娟', '女', '1976-08-28', '320828197608285048', 2, '江苏省淮安市公安局淮安分局指挥中心', '084590', '副科长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (35, 1, '220abc65f4a96bbc11f2fd2803fbd541', '颜海翔', '男', '1973-04-16', '320882197304168019', 2, '江苏省淮安市公安局淮安分局指挥中心', '084207', '科长、二级高级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (36, 1, '220abc65f4a96bbc11f2fd2803fbd541', '黄玉源', '男', '1989-06-03', '320911198906033415', 2, '江苏省淮安市公安局淮安分局指挥中心', '084220', '副主任、一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (37, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈学军', '男', '1980-02-24', '320882198002242214', 2, '江苏省淮安市公安局淮安分局指挥中心', '084276', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (38, 1, '220abc65f4a96bbc11f2fd2803fbd541', '魏子翔', '男', '1989-08-25', '320882198908250050', 2, '江苏省淮安市公安局淮安分局指挥中心', '084382', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (39, 1, '220abc65f4a96bbc11f2fd2803fbd541', '高连玲', '女', '1976-09-20', '320828197609204027', 2, '江苏省淮安市公安局淮安分局指挥中心', '084591', '副科长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (40, 1, '220abc65f4a96bbc11f2fd2803fbd541', '高畅', '女', '1980-01-07', '320882198001074626', 2, '江苏省淮安市公安局淮安分局指挥中心', '084224', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (41, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王祥仕', '男', '1974-10-18', '321023197410185813', 3, '江苏省淮安市公安局淮安分局政治处', '084522', '副主任、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (42, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈萍', '女', '1983-05-13', '320882198305132709', 3, '江苏省淮安市公安局淮安分局政治处', '084300', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (43, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李广国', '男', '1964-09-05', '320828196409052079', 3, '江苏省淮安市公安局淮安分局政治处', '084199', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (44, 2, '220abc65f4a96bbc11f2fd2803fbd541', '宋超', '男', '1975-08-19', '320828197508190615', 3, '江苏省淮安市公安局淮安分局政治处', '084526', '政治处主任、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (45, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张小平', '男', '1962-12-24', '32080319621224001X', 3, '江苏省淮安市公安局淮安分局政治处', '084518', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (46, 1, '220abc65f4a96bbc11f2fd2803fbd541', '解静', '女', '1976-07-17', '32082819760717002X', 3, '江苏省淮安市公安局淮安分局政治处', '084502', '科长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (47, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李万爱', '男', '1972-09-07', '320828197209073611', 3, '江苏省淮安市公安局淮安分局政治处', '084492', '副教导员、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (48, 4, '220abc65f4a96bbc11f2fd2803fbd541', '李冬冬', '男', '1985-12-06', '34122219851206031X', 3, '江苏省淮安市公安局淮安分局政治处', '084610', '科长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (49, 1, '220abc65f4a96bbc11f2fd2803fbd541', '孙修清', '女', '1992-04-13', '342501199204131788', 3, '江苏省淮安市公安局淮安分局政治处', '084307', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (50, 5, '220abc65f4a96bbc11f2fd2803fbd541', '徐洪芦', '男', '1977-05-19', '320828197705194615', 4, '江苏省淮安市公安局淮安分局警务督察大队', '084564', '大队长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (51, 5, '220abc65f4a96bbc11f2fd2803fbd541', '张德林', '男', '1975-03-27', '320882197503276418', 4, '江苏省淮安市公安局淮安分局警务督察大队', '084571', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (52, 1, '220abc65f4a96bbc11f2fd2803fbd541', '唐友成', '男', '1975-04-19', '32088219750419801X', 4, '江苏省淮安市公安局淮安分局警务督察大队', '084249', '科长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (53, 1, '220abc65f4a96bbc11f2fd2803fbd541', '成益东', '男', '1966-04-08', '320828196604080032', 4, '江苏省淮安市公安局淮安分局警务督察大队', '084074', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (54, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李文', '男', '1966-04-12', '320828196604124437', 4, '江苏省淮安市公安局淮安分局警务督察大队', '084071', '教导员、一级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (55, 1, '220abc65f4a96bbc11f2fd2803fbd541', '庞廷阳', '男', '1974-11-07', '320828197411070211', 4, '江苏省淮安市公安局淮安分局警务督察大队', '084539', '副教导员、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (56, 1, '220abc65f4a96bbc11f2fd2803fbd541', '薛良云', '女', '1968-12-24', '320828196812240029', 5, '江苏省淮安市公安局淮安分局单位内部安全保卫大队', '084173', '教导员、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (57, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陶源', '男', '1967-11-25', '320828196810253053', 5, '江苏省淮安市公安局淮安分局单位内部安全保卫大队', '084209', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (58, 2, '220abc65f4a96bbc11f2fd2803fbd541', '孙晓鸿', '男', '1973-10-29', '320828197310292034', 5, '江苏省淮安市公安局淮安分局单位内部安全保卫大队', '084488', '大队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (59, 1, '220abc65f4a96bbc11f2fd2803fbd541', '金定中', '男', '1961-02-28', '320882196102280219', 5, '江苏省淮安市公安局淮安分局单位内部安全保卫大队', '084450', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (60, 1, '220abc65f4a96bbc11f2fd2803fbd541', '杨宝才', '男', '1966-08-03', '320828196608030032', 5, '江苏省淮安市公安局淮安分局单位内部安全保卫大队', '084138', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (61, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈士猛', '男', '1974-07-04', '130826197407049518', 5, '江苏省淮安市公安局淮安分局单位内部安全保卫大队', '084145', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (62, 1, '220abc65f4a96bbc11f2fd2803fbd541', '施文林', '男', '1964-10-06', '320828196410067219', 5, '江苏省淮安市公安局淮安分局单位内部安全保卫大队', '084405', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (63, 1, '220abc65f4a96bbc11f2fd2803fbd541', '袁春卉', '女', '1979-01-01', '320828197901016621', 6, '江苏省淮安市公安局淮安分局出入境管理大队', '084175', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (64, 1, '220abc65f4a96bbc11f2fd2803fbd541', '章齐效', '男', '1963-06-28', '320828196306280079', 6, '江苏省淮安市公安局淮安分局出入境管理大队', '084062', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (65, 2, '220abc65f4a96bbc11f2fd2803fbd541', '杨志萍', '女', '1966-08-07', '320828196608074422', 6, '江苏省淮安市公安局淮安分局出入境管理大队', '084159', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (66, 1, '220abc65f4a96bbc11f2fd2803fbd541', '方庆能', '男', '1968-06-16', '320828196806161818', 6, '江苏省淮安市公安局淮安分局出入境管理大队', '084458', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (67, 1, '220abc65f4a96bbc11f2fd2803fbd541', '韩振国', '男', '1979-08-27', '320882197908273637', 6, '江苏省淮安市公安局淮安分局出入境管理大队', '084483', '副大队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (68, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张卫国', '男', '1975-01-18', '320828197501181257', 7, '江苏省淮安市公安局淮安分局法制大队', '084471', '副大队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (69, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王少东', '男', '1968-02-16', '320828196802160017', 7, '江苏省淮安市公安局淮安分局法制大队', '084067', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (70, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈雪亮', '男', '1978-08-23', '320828197808234018', 7, '江苏省淮安市公安局淮安分局法制大队', '084520', '副大队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (71, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈智洋', '男', '1986-02-02', '320882198602020017', 7, '江苏省淮安市公安局淮安分局法制大队', '084227', '副中队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (72, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈曦', '女', '1990-03-28', '320882199003280081', 7, '江苏省淮安市公安局淮安分局法制大队', '084119', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (73, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张寿国', '男', '1968-01-24', '320114196801240035', 7, '江苏省淮安市公安局淮安分局法制大队', '084073', '中队长、二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (74, 1, '220abc65f4a96bbc11f2fd2803fbd541', '宋炳亚', '男', '1980-03-28', '32088219800328001X', 7, '江苏省淮安市公安局淮安分局法制大队', '084239', '中队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (75, 1, '220abc65f4a96bbc11f2fd2803fbd541', '朱法芝', '男', '1986-07-26', '320882198607263472', 7, '江苏省淮安市公安局淮安分局法制大队', '084602', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (76, 1, '220abc65f4a96bbc11f2fd2803fbd541', '唐德银', '男', '1968-02-08', '320828196802080615', 7, '江苏省淮安市公安局淮安分局法制大队', '084161', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (77, 2, '220abc65f4a96bbc11f2fd2803fbd541', '朱洪辉', '男', '1978-01-27', '320828197801270219', 7, '江苏省淮安市公安局淮安分局法制大队', '084544', '大队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (78, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈文全', '男', '1973-09-14', '320828197309146435', 8, '江苏省淮安市公安局淮安分局信访科', '084397', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (79, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘俊', '男', '1963-12-01', '320882196310013211', 8, '江苏省淮安市公安局淮安分局信访科', '084438', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (80, 1, '220abc65f4a96bbc11f2fd2803fbd541', '任中林', '男', '1963-09-05', '320828196309050033', 9, '江苏省淮安市公安局淮安分局警务保障室', '084023', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (81, 1, '220abc65f4a96bbc11f2fd2803fbd541', '许建斌', '男', '1962-06-15', '320828196206150218', 9, '江苏省淮安市公安局淮安分局警务保障室', '084032', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (82, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈继', '男', '1960-10-10', '320828196010101617', 9, '江苏省淮安市公安局淮安分局警务保障室', '084106', '一级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (83, 1, '220abc65f4a96bbc11f2fd2803fbd541', '钱洪杰', '男', '1978-08-14', '320828197808143239', 9, '江苏省淮安市公安局淮安分局警务保障室', '084375', '主任、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (84, 1, '220abc65f4a96bbc11f2fd2803fbd541', '沈广年', '男', '1960-01-21', '320882196001210035', 9, '江苏省淮安市公安局淮安分局警务保障室', '084484', '一级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (85, 2, '220abc65f4a96bbc11f2fd2803fbd541', '蒋定永', '男', '1965-03-31', '320828196501130076', 9, '江苏省淮安市公安局淮安分局警务保障室', '084370', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (86, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李玉兰', '女', '1965-06-23', '320828196506230025', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084059', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (87, 2, '220abc65f4a96bbc11f2fd2803fbd541', '杜立雄', '男', '1975-11-11', '320828197511113418', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084545', '大队长、警务技术三级主管', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (88, 1, '220abc65f4a96bbc11f2fd2803fbd541', '汪登举', '男', '1972-03-11', '320828197203110012', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084476', '教导员、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (89, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李九龙', '男', '1988-03-06', '320921198803063411', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084281', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (90, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张洋高', '男', '1989-02-28', '320882198902285615', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084642', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (91, 1, '220abc65f4a96bbc11f2fd2803fbd541', '吴国平', '男', '1979-02-11', '320828197902116632', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084572', '警务技术三级主管', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (92, 1, '220abc65f4a96bbc11f2fd2803fbd541', '门凯', '男', '1990-11-21', '320882199011214850', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084094', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (93, 1, '220abc65f4a96bbc11f2fd2803fbd541', '裴彦雪', '男', '1966-01-18', '320828196601180011', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084068', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (94, 1, '220abc65f4a96bbc11f2fd2803fbd541', '许小辉', '男', '1980-11-15', '420102198011159512', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084653', '四级高级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (95, 1, '220abc65f4a96bbc11f2fd2803fbd541', '吴建国', '男', '1987-06-17', '320826198706170238', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084635', '副中队长、警务技术员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (96, 1, '220abc65f4a96bbc11f2fd2803fbd541', '卢小非', '男', '1979-09-04', '320882197909041811', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084246', '警务技术四级主管', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (97, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘爱坤', '男', '1979-03-05', '320828197903053039', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084166', '警务技术四级主管', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (98, 1, '220abc65f4a96bbc11f2fd2803fbd541', '邸云宝', '男', '1979-02-02', '342422197902024354', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084225', '警务技术四级主管', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (99, 1, '220abc65f4a96bbc11f2fd2803fbd541', '纪军', '男', '1989-08-11', '320882198908113099', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084305', '警务技术员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (100, 1, '220abc65f4a96bbc11f2fd2803fbd541', '曹蕊', '女', '1989-12-24', '230709198912240029', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084024', '警务技术员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (101, 1, '220abc65f4a96bbc11f2fd2803fbd541', '黄驰恒', '男', '1992-12-07', '320684199212075174', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084299', '警务技术员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (102, 1, '220abc65f4a96bbc11f2fd2803fbd541', '季中为', '男', '1994-03-10', '321282199403102215', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084306', '警务技术员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (103, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张朕', '男', '1994-11-24', '321322199411248977', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084684', '民警', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (104, 1, '220abc65f4a96bbc11f2fd2803fbd541', '鄢畅', '男', '1995-09-30', '340321199509301533', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084685', '民警', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (105, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李顺', '男', '1984-10-07', '340821198410071419', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084117', '中队长、警务技术四级主管', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (106, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘虎', '男', '1986-01-12', '320821198601122713', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084267', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (107, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张建明', '男', '1980-07-24', '320882198007240015', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084034', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (108, 1, '220abc65f4a96bbc11f2fd2803fbd541', '潘树红', '男', '1979-07-26', '320828197907263252', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084231', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (109, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王冠军', '男', '1984-11-10', '320882198411104218', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084525', '指导员、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (110, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘振', '男', '1987-05-18', '320704198705180019', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084413', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (111, 1, '220abc65f4a96bbc11f2fd2803fbd541', '支效群', '男', '1979-11-29', '320828197911294270', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084599', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (112, 1, '220abc65f4a96bbc11f2fd2803fbd541', '秦天柱', '男', '1986-09-13', '32082619860913661X', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084637', '副中队长、一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (113, 1, '220abc65f4a96bbc11f2fd2803fbd541', '周建国', '男', '1985-09-21', '320882198509211417', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084604', '副中队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (114, 1, '220abc65f4a96bbc11f2fd2803fbd541', '叶文剑', '男', '1987-05-20', '320830198705200030', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084277', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (115, 1, '220abc65f4a96bbc11f2fd2803fbd541', '房程', '男', '1992-01-17', '320882199201170617', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084233', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (116, 1, '220abc65f4a96bbc11f2fd2803fbd541', '赵子昂', '男', '1993-01-16', '320882199301160010', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084275', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (117, 1, '220abc65f4a96bbc11f2fd2803fbd541', '周春', '男', '1981-02-24', '320882198102241614', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084503', '中队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (118, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李学仲', '男', '1981-08-08', '342126198108089250', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084214', '警务技术四级主管', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (119, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张广永', '男', '1969-10-06', '320828196910062035', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084582', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (120, 1, '220abc65f4a96bbc11f2fd2803fbd541', '蒋正伟', '男', '1987-11-01', '320829198711011417', 10, '江苏省淮安市公安局淮安分局刑事警察大队', '084609', '副中队长、警务技术员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (121, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈顺明', '男', '1964-12-15', '320828196412151211', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084070', '一级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (122, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陶世琴', '女', '1968-01-09', '320828196801090061', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084048', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (123, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈峥嵘', '男', '1964-02-17', '320882196402170230', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084090', '四级高级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (124, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘翔', '男', '1963-10-02', '320828196310026719', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084060', '四级高级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (125, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈国栋', '男', '1965-12-31', '320828196612070053', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084082', '四级高级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (126, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王冬来', '男', '1970-12-10', '320828197012104058', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084386', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (127, 1, '220abc65f4a96bbc11f2fd2803fbd541', '朱从祥', '男', '1970-04-23', '32082819700423061X', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084380', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (128, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王玉洁', '女', '1969-06-18', '320828196906182042', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084026', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (129, 1, '220abc65f4a96bbc11f2fd2803fbd541', '徐长元', '男', '1969-12-23', '320828196912230039', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084236', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (130, 1, '220abc65f4a96bbc11f2fd2803fbd541', '丁元伦', '男', '1961-12-23', '320828196112232212', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084418', '一级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (131, 2, '220abc65f4a96bbc11f2fd2803fbd541', '王军', '男', '1967-10-04', '320882196710040219', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084367', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (132, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李凯', '男', '1966-09-12', '32082819660912003X', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084372', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (133, 1, '220abc65f4a96bbc11f2fd2803fbd541', '焦进', '男', '1966-04-19', '320882196604190010', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084505', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (134, 1, '220abc65f4a96bbc11f2fd2803fbd541', '赵定刚', '男', '1966-03-26', '320828196603260058', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084066', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (135, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王立富', '男', '1964-08-24', '320882196408244237', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084234', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (136, 1, '220abc65f4a96bbc11f2fd2803fbd541', '周金广', '男', '1969-10-27', '320882196910274837', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084460', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (137, 1, '220abc65f4a96bbc11f2fd2803fbd541', '何光群', '男', '1962-02-25', '320828196202250019', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084377', '一级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (138, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈建友', '男', '1972-07-04', '320722197207049518', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084168', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (139, 1, '220abc65f4a96bbc11f2fd2803fbd541', '黄斌', '男', '1976-06-22', '32082819760622003X', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084497', '副主任、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (140, 1, '220abc65f4a96bbc11f2fd2803fbd541', '顾玉龙', '男', '1965-06-25', '320828196506250237', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084147', '一级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (141, 1, '220abc65f4a96bbc11f2fd2803fbd541', '许立鸿', '男', '1966-10-24', '320828196610244611', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084245', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (142, 1, '220abc65f4a96bbc11f2fd2803fbd541', '朱学军', '男', '1967-08-23', '320882196708010213', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084192', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (143, 1, '220abc65f4a96bbc11f2fd2803fbd541', '顾萌', '男', '1959-07-27', '320828195907272555', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084455', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (144, 1, '220abc65f4a96bbc11f2fd2803fbd541', '杨学武', '男', '1961-04-08', '320882196104080018', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084556', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (145, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张红兵', '男', '1961-07-08', '320828196107080218', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084371', '一级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (146, 1, '220abc65f4a96bbc11f2fd2803fbd541', '纪以法', '男', '1966-10-12', '320828196709123617', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084086', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (147, 1, '220abc65f4a96bbc11f2fd2803fbd541', '朱洪元', '男', '1966-06-26', '320828196606260010', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084223', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (148, 1, '220abc65f4a96bbc11f2fd2803fbd541', '耿枭', '男', '1995-10-08', '321322199510081295', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084283', '警务技术员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (149, 1, '220abc65f4a96bbc11f2fd2803fbd541', '史桂华', '男', '1987-09-10', '320882198709103015', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084636', '主任、一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (150, 1, '220abc65f4a96bbc11f2fd2803fbd541', '杨泽中', '男', '1988-07-07', '320882198807070034', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084433', '副科长、一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (151, 1, '220abc65f4a96bbc11f2fd2803fbd541', '骆海平', '男', '1973-01-08', '320828197301080419', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084391', '科长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (152, 1, '220abc65f4a96bbc11f2fd2803fbd541', '徐金洪', '男', '1973-04-08', '320828197304083834', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084499', '科长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (153, 1, '220abc65f4a96bbc11f2fd2803fbd541', '顾杏如', '男', '1977-03-21', '320803197703210012', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084045', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (154, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王建国', '男', '1971-08-07', '320828197108070032', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084093', '科长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (155, 1, '220abc65f4a96bbc11f2fd2803fbd541', '杨默识', '男', '1966-08-14', '320828196608140012', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084365', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (156, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘曦', '男', '1984-12-08', '320882198412086218', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084470', '副科长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (157, 1, '220abc65f4a96bbc11f2fd2803fbd541', '孙权', '男', '1982-08-02', '320882198208022014', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084427', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (158, 1, '220abc65f4a96bbc11f2fd2803fbd541', '赵铭', '女', '1964-12-10', '32082819641210022X', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084120', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (159, 1, '220abc65f4a96bbc11f2fd2803fbd541', '董政', '男', '1977-08-30', '320828197708300014', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084511', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (160, 1, '220abc65f4a96bbc11f2fd2803fbd541', '胥军', '男', '1975-07-19', '410711197507199510', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084136', '副科长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (161, 1, '220abc65f4a96bbc11f2fd2803fbd541', '万艾华', '女', '1973-09-20', '320828197309200067', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084383', '科长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (162, 1, '220abc65f4a96bbc11f2fd2803fbd541', '邵从陆', '男', '1970-10-16', '32082819701016441X', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084394', '副科长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (163, 1, '220abc65f4a96bbc11f2fd2803fbd541', '蒋志亚', '男', '1971-10-07', '320828197110074411', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084498', '科长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (164, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李俊', '男', '1972-09-10', '320828197209100018', 11, '江苏省淮安市公安局淮安分局治安警察大队', '084387', '中队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (165, 1, '220abc65f4a96bbc11f2fd2803fbd541', '翟金荣', '男', '1966-03-06', '320828196603060013', 12, '江苏省淮安市公安局淮安分局经济犯罪侦查大队', '084063', '一级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (166, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李学锦', '男', '1962-08-20', '320828196208200039', 12, '江苏省淮安市公安局淮安分局经济犯罪侦查大队', '084222', '四级高级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (167, 1, '220abc65f4a96bbc11f2fd2803fbd541', '朱超', '男', '1965-02-28', '320828196502282012', 12, '江苏省淮安市公安局淮安分局经济犯罪侦查大队', '084457', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (168, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张晶卉', '女', '1977-02-06', '32088219770206002X', 12, '江苏省淮安市公安局淮安分局经济犯罪侦查大队', '084490', '副大队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (169, 1, '220abc65f4a96bbc11f2fd2803fbd541', '万红旗', '男', '1966-07-24', '320828196607240011', 12, '江苏省淮安市公安局淮安分局经济犯罪侦查大队', '084133', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (170, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张华', '男', '1967-04-20', '320828196704200038', 12, '江苏省淮安市公安局淮安分局经济犯罪侦查大队', '084219', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (171, 2, '220abc65f4a96bbc11f2fd2803fbd541', '邵新军', '男', '1968-10-18', '320828196810180050', 12, '江苏省淮安市公安局淮安分局经济犯罪侦查大队', '084208', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (172, 1, '220abc65f4a96bbc11f2fd2803fbd541', '梁祝亚', '男', '1966-11-10', '320828196611104311', 12, '江苏省淮安市公安局淮安分局经济犯罪侦查大队', '084255', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (173, 1, '220abc65f4a96bbc11f2fd2803fbd541', '赵培勤', '男', '1973-11-01', '320828197311014239', 12, '江苏省淮安市公安局淮安分局经济犯罪侦查大队', '084481', '教导员、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (174, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈倩', '女', '1992-04-18', '320803199204180065', 12, '江苏省淮安市公安局淮安分局经济犯罪侦查大队', '084288', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (175, 1, '220abc65f4a96bbc11f2fd2803fbd541', '谢观球', '男', '1965-11-10', '320828196511100655', 12, '江苏省淮安市公安局淮安分局经济犯罪侦查大队', '084102', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (176, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王少山', '男', '1974-04-09', '320828197404092818', 12, '江苏省淮安市公安局淮安分局经济犯罪侦查大队', '084475', '副中队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (177, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王浩', '男', '1972-12-16', '320828197212167010', 12, '江苏省淮安市公安局淮安分局经济犯罪侦查大队', '084513', '副中队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (178, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陶应军', '男', '1971-12-10', '320882197412103474', 12, '江苏省淮安市公安局淮安分局经济犯罪侦查大队', '084553', '中队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (179, 1, '220abc65f4a96bbc11f2fd2803fbd541', '邵端高', '男', '1973-08-23', '320828197308234417', 12, '江苏省淮安市公安局淮安分局经济犯罪侦查大队', '084477', '副中队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (180, 1, '220abc65f4a96bbc11f2fd2803fbd541', '宋冬庆', '男', '1978-10-14', '320828197810140619', 12, '江苏省淮安市公安局淮安分局经济犯罪侦查大队', '084523', '中队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (181, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘维亚', '男', '1961-10-24', '320828196104260213', 12, '江苏省淮安市公安局淮安分局经济犯罪侦查大队', '084368', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (182, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘玉良', '男', '1966-07-06', '32082819660706023X', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084311', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (183, 1, '220abc65f4a96bbc11f2fd2803fbd541', '戴玉林', '男', '1961-08-04', '32088219610804003X', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084158', '四级高级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (184, 1, '220abc65f4a96bbc11f2fd2803fbd541', '花国庆', '男', '1959-10-01', '320828195910010011', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084282', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (185, 1, '220abc65f4a96bbc11f2fd2803fbd541', '杨建军', '男', '1964-10-23', '320828196410230012', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084333', '一级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (186, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘汝生', '男', '1962-11-03', '320828196211030034', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084350', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (187, 2, '220abc65f4a96bbc11f2fd2803fbd541', '陶松', '男', '1969-12-22', '320802196912222115', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084534', '副大队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (188, 1, '220abc65f4a96bbc11f2fd2803fbd541', '韦骏', '男', '1966-05-01', '320828196607075618', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084202', '一级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (189, 1, '220abc65f4a96bbc11f2fd2803fbd541', '杨晨', '男', '1964-06-14', '320828196406140030', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084348', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (190, 1, '220abc65f4a96bbc11f2fd2803fbd541', '朱欣荣', '男', '1982-01-05', '320882198201055614', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084139', '副科长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (191, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈敏', '男', '1963-07-10', '320828196307100076', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084346', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (192, 1, '220abc65f4a96bbc11f2fd2803fbd541', '胡家旺', '男', '1963-04-20', '320828196304200215', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084310', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (193, 1, '220abc65f4a96bbc11f2fd2803fbd541', '许忠平', '男', '1963-05-16', '320828196305160411', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084096', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (194, 1, '220abc65f4a96bbc11f2fd2803fbd541', '黄志华', '男', '1962-05-27', '320828196205270015', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084353', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (195, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王建民', '男', '1970-03-02', '320828197012021834', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084389', '副大队长、区城管局副局长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (196, 1, '220abc65f4a96bbc11f2fd2803fbd541', '韩忠享', '男', '1960-09-08', '320828196009080038', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084325', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (197, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈永涛', '男', '1962-02-05', '32082819620205005X', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084327', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (198, 1, '220abc65f4a96bbc11f2fd2803fbd541', '夏寿璋', '男', '1972-07-03', '320828197207033237', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084531', '警务技术二级主管', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (199, 1, '220abc65f4a96bbc11f2fd2803fbd541', '蒋宏', '男', '1959-09-15', '320828195909150017', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084376', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (200, 1, '220abc65f4a96bbc11f2fd2803fbd541', '田纪飞', '男', '1965-12-21', '320828196512213619', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084468', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (201, 2, '220abc65f4a96bbc11f2fd2803fbd541', '李林峰', '男', '1965-08-07', '320882196508070019', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084041', '一级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (202, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李勇', '男', '1961-05-09', '320828196105090017', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084354', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (203, 1, '220abc65f4a96bbc11f2fd2803fbd541', '谢银春', '女', '1987-02-02', '320882198702020428', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084620', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (204, 2, '220abc65f4a96bbc11f2fd2803fbd541', '李大河', '男', '1970-09-25', '320828197009254215', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084384', '主任、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (205, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李国丹', '男', '1962-10-23', '320828196210230018', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084330', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (206, 1, '220abc65f4a96bbc11f2fd2803fbd541', '徐学富', '男', '1968-08-23', '320828196808232691', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084203', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (207, 1, '220abc65f4a96bbc11f2fd2803fbd541', '潘勇', '男', '1981-08-21', '320802198108210518', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084180', '副科长、警务技术四级主管', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (208, 1, '220abc65f4a96bbc11f2fd2803fbd541', '徐志龙', '男', '1965-02-12', '32082819650212361X', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084194', '警务技术二级主管', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (209, 2, '220abc65f4a96bbc11f2fd2803fbd541', '梁永政', '男', '1978-05-06', '320828197805062839', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084576', '科长、警务技术三级主管', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (210, 1, '220abc65f4a96bbc11f2fd2803fbd541', '时祥华', '男', '1975-08-21', '320828197608214813', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084480', '指导员、警务技术三级主管', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (211, 1, '220abc65f4a96bbc11f2fd2803fbd541', '姚春', '男', '1966-06-14', '320828196606140238', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084358', '警务技术二级主管', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (212, 1, '220abc65f4a96bbc11f2fd2803fbd541', '项建祥', '男', '1966-02-14', '420106196602144837', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084272', '警务技术二级主管', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (213, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王健', '男', '1986-03-10', '320882198603100019', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084407', '警务技术四级主管', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (214, 1, '220abc65f4a96bbc11f2fd2803fbd541', '孙大将', '男', '1989-12-21', '320882198912214415', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084170', '警务技术员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (215, 1, '220abc65f4a96bbc11f2fd2803fbd541', '黄健', '男', '1981-02-14', '320882198102148014', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084661', '警务技术三级主管', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (216, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王建成', '男', '1966-10-12', '320828196610120213', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084218', '一级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (217, 1, '220abc65f4a96bbc11f2fd2803fbd541', '孙锦淮', '男', '1963-06-03', '32082819630603023X', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084337', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (218, 1, '220abc65f4a96bbc11f2fd2803fbd541', '周仁宏', '男', '1966-08-08', '32082819660808003X', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084075', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (219, 1, '220abc65f4a96bbc11f2fd2803fbd541', '杨一青', '男', '1961-09-09', '320828196109090233', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084280', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (220, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张奎', '男', '1967-03-04', '320828196703040036', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084316', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (221, 1, '220abc65f4a96bbc11f2fd2803fbd541', '马骥', '男', '1963-02-18', '320828196302180257', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084343', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (222, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张志平', '男', '1959-08-01', '320828195908010215', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084315', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (223, 1, '220abc65f4a96bbc11f2fd2803fbd541', '耿安', '男', '1963-11-30', '32080219631130051X', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084266', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (224, 1, '220abc65f4a96bbc11f2fd2803fbd541', '周华', '女', '1967-03-06', '320828196703060248', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084091', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (225, 1, '220abc65f4a96bbc11f2fd2803fbd541', '石崇珠', '女', '1966-04-13', '320828196604130028', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084268', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (226, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李钦峰', '男', '1960-03-20', '320828196003200051', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084295', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (227, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王爱林', '男', '1960-01-26', '320882196001260016', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084584', '四级高级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (228, 1, '220abc65f4a96bbc11f2fd2803fbd541', '余波', '男', '1960-08-16', '320828196008160036', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084313', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (229, 1, '220abc65f4a96bbc11f2fd2803fbd541', '唐寅', '男', '1962-12-22', '320828196212220016', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084335', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (230, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈正喜', '男', '1961-12-17', '231027196102170811', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084244', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (231, 1, '220abc65f4a96bbc11f2fd2803fbd541', '鲍卫红', '男', '1961-02-22', '320828196102220031', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084334', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (232, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘金华', '男', '1962-05-05', '320828196205053897', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084412', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (233, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王旭东', '男', '1972-12-20', '320828197212201215', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084388', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (234, 1, '220abc65f4a96bbc11f2fd2803fbd541', '许建波', '男', '1962-04-27', '320828196103273610', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084464', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (235, 1, '220abc65f4a96bbc11f2fd2803fbd541', '崔永春', '男', '1975-03-05', '320828197503155634', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084486', '所长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (236, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘金坠', '男', '1972-03-19', '320828197203190657', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084541', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (237, 1, '220abc65f4a96bbc11f2fd2803fbd541', '丁爱兵', '男', '1967-06-04', '320828196706040015', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084341', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (238, 1, '220abc65f4a96bbc11f2fd2803fbd541', '黄玉贵', '男', '1968-08-10', '320882196808100013', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084374', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (239, 1, '220abc65f4a96bbc11f2fd2803fbd541', '夏宝湘', '男', '1973-10-13', '32082819731013305X', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084489', '教导员、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (240, 1, '220abc65f4a96bbc11f2fd2803fbd541', '胡镇军', '男', '1970-04-12', '320828197004120031', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084550', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (241, 1, '220abc65f4a96bbc11f2fd2803fbd541', '蒋连付', '男', '1977-11-28', '320828197711285636', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084570', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (242, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张贵奇', '男', '1969-03-20', '350583196903209514', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084294', '副中队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (243, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张凯', '男', '1989-11-27', '320882198911272015', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084512', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (244, 1, '220abc65f4a96bbc11f2fd2803fbd541', '潘家梁', '男', '1985-08-02', '320882198508024812', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084617', '副中队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (245, 1, '220abc65f4a96bbc11f2fd2803fbd541', '石亚洲', '男', '1987-08-09', '320829198708090855', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084465', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (246, 2, '220abc65f4a96bbc11f2fd2803fbd541', '费志国', '男', '1977-02-18', '320828197702187014', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084597', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (247, 1, '220abc65f4a96bbc11f2fd2803fbd541', '赵科', '男', '1963-09-16', '320803196509163430', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084441', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (248, 1, '220abc65f4a96bbc11f2fd2803fbd541', '邱谈和', '男', '1974-10-04', '370282197410049036', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084095', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (249, 1, '220abc65f4a96bbc11f2fd2803fbd541', '周雷', '男', '1980-10-24', '320882198010242513', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084210', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (250, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张超', '男', '1981-01-16', '320803198101165618', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084645', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (251, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王军', '男', '1980-03-02', '320828198003025838', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084666', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (252, 1, '220abc65f4a96bbc11f2fd2803fbd541', '朱长河', '男', '1964-05-12', '320828196405126739', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084101', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (253, 1, '220abc65f4a96bbc11f2fd2803fbd541', '赵毅', '男', '1986-12-10', '320882198612100213', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084623', '副中队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (254, 1, '220abc65f4a96bbc11f2fd2803fbd541', '徐继壮', '男', '1966-12-01', '320828196612021657', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084420', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (255, 1, '220abc65f4a96bbc11f2fd2803fbd541', '黄利民', '男', '1965-03-06', '320828196503061633', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084466', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (256, 1, '220abc65f4a96bbc11f2fd2803fbd541', '夏廷高', '男', '1963-02-22', '320828196302221696', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084447', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (257, 1, '220abc65f4a96bbc11f2fd2803fbd541', '鲍明华', '男', '1963-01-22', '320828196301220018', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084324', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (258, 1, '220abc65f4a96bbc11f2fd2803fbd541', '许象忠', '男', '1959-09-14', '320828195909140038', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084340', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (259, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘希来', '男', '1961-02-23', '320828196102231638', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084469', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (260, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张顺琪', '男', '1961-10-22', '320828196110220031', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084323', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (261, 1, '220abc65f4a96bbc11f2fd2803fbd541', '于正贵', '男', '1979-03-07', '320828197903073638', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084574', '指导员、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (262, 2, '220abc65f4a96bbc11f2fd2803fbd541', '李龙柱', '男', '1975-04-17', '320828197504170094', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084496', '中队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (263, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陆春龙', '男', '1979-09-12', '320828197909123632', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084646', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (264, 1, '220abc65f4a96bbc11f2fd2803fbd541', '任伟', '男', '1979-08-31', '320828197908310639', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084600', '指导员、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (265, 1, '220abc65f4a96bbc11f2fd2803fbd541', '卢顺河', '男', '1962-03-11', '320828196203110018', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084347', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (266, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张銮成', '男', '1970-10-03', '320882197010038016', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084366', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (267, 2, '220abc65f4a96bbc11f2fd2803fbd541', '季崇峰', '男', '1979-02-15', '320882198003198016', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084132', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (268, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张春', '男', '1975-04-09', '320803197504090011', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084628', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (269, 1, '220abc65f4a96bbc11f2fd2803fbd541', '卜崇俊', '男', '1970-05-08', '32082819700508583X', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084559', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (270, 1, '220abc65f4a96bbc11f2fd2803fbd541', '黄柏林', '男', '1961-10-31', '320828196110310213', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084355', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (271, 1, '220abc65f4a96bbc11f2fd2803fbd541', '严永琦', '男', '1976-07-01', '320828197607015230', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084557', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (272, 2, '220abc65f4a96bbc11f2fd2803fbd541', '高树能', '男', '1975-06-30', '32082819760930401X', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084495', '中队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (273, 1, '220abc65f4a96bbc11f2fd2803fbd541', '吴洪超', '男', '1978-07-10', '320882197807108018', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084047', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (274, 2, '220abc65f4a96bbc11f2fd2803fbd541', '徐兵', '男', '1974-04-20', '320828197404200014', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084482', '中队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (275, 1, '220abc65f4a96bbc11f2fd2803fbd541', '郑高明', '男', '1981-12-24', '320882198112240439', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084621', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (276, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张杰', '男', '1983-12-08', '320882198312080214', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084626', '副中队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (277, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘毅', '男', '1982-10-28', '320882198210280039', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084624', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (278, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈彦国', '男', '1960-07-19', '320828196007190014', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084317', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (279, 1, '220abc65f4a96bbc11f2fd2803fbd541', '马国华', '男', '1965-06-25', '320828196506250034', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084351', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (280, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张发生', '男', '1965-05-22', '320830196505220038', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084089', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (281, 1, '220abc65f4a96bbc11f2fd2803fbd541', '高松成', '男', '1977-07-17', '320828197707175813', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084561', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (282, 1, '220abc65f4a96bbc11f2fd2803fbd541', '鲍再国', '男', '1962-11-22', '320828196211220057', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084356', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (283, 1, '220abc65f4a96bbc11f2fd2803fbd541', '尹廷华', '男', '1972-09-23', '320882197209230013', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084332', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (284, 2, '220abc65f4a96bbc11f2fd2803fbd541', '倪殿启', '男', '1988-07-28', '320882198807282010', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084622', '中队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (285, 1, '220abc65f4a96bbc11f2fd2803fbd541', '冯玉环', '男', '1963-09-23', '320882196309234252', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084445', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (286, 1, '220abc65f4a96bbc11f2fd2803fbd541', '贾硕山', '男', '1976-08-27', '32082819760827383X', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084113', '二级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (287, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李洪飞', '男', '1967-12-04', '320828196712043810', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084463', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (288, 1, '220abc65f4a96bbc11f2fd2803fbd541', '尤长雷', '男', '1987-03-26', '321323198703265674', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084546', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (289, 1, '220abc65f4a96bbc11f2fd2803fbd541', '吴卫兵', '男', '1975-06-01', '320882197506018035', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084123', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (290, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陶春华', '男', '1973-01-30', '130682197301308518', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084422', '副中队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (291, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈勇', '男', '1969-04-03', '320828196904032817', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084516', '副中队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (292, 2, '220abc65f4a96bbc11f2fd2803fbd541', '李元超', '男', '1972-01-12', '32082819720112121X', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084453', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (293, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈诚', '男', '1984-07-12', '320882198407120012', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084619', '副中队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (294, 1, '220abc65f4a96bbc11f2fd2803fbd541', '孙银杉', '男', '1963-12-01', '320828196312010059', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084162', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (295, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈雪峰', '男', '1966-10-28', '320828196610280110', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084303', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (296, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李永胜', '男', '1963-09-28', '320828196309280090', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084328', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (297, 1, '220abc65f4a96bbc11f2fd2803fbd541', '黄继红', '男', '1971-09-07', '320882197109077816', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084087', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (298, 1, '220abc65f4a96bbc11f2fd2803fbd541', '邓月飞', '男', '1962-05-15', '320828196205150072', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084461', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (299, 1, '220abc65f4a96bbc11f2fd2803fbd541', '赵庆九', '男', '1969-03-08', '320828196903080032', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084551', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (300, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈鹤军', '男', '1963-02-05', '320828196302050014', 13, '江苏省淮安市公安局淮安分局交通警察大队', '084345', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (301, 1, '220abc65f4a96bbc11f2fd2803fbd541', '黄武', '男', '1960-10-08', '320828196010080019', 14, '江苏省淮安市公安局淮安分局国内安全保卫大队', '084448', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (302, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李仕扬', '男', '1966-03-02', '320114196605020035', 14, '江苏省淮安市公安局淮安分局国内安全保卫大队', '084042', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (303, 1, '220abc65f4a96bbc11f2fd2803fbd541', '史明标', '男', '1963-02-05', '320882196510053218', 14, '江苏省淮安市公安局淮安分局国内安全保卫大队', '084439', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (304, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王锦叶', '男', '1977-12-23', '32082819771223323X', 14, '江苏省淮安市公安局淮安分局国内安全保卫大队', '084554', '副大队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (305, 1, '220abc65f4a96bbc11f2fd2803fbd541', '何庆暹', '男', '1971-11-16', '320828197111162819', 14, '江苏省淮安市公安局淮安分局国内安全保卫大队', '084385', '副大队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (306, 1, '220abc65f4a96bbc11f2fd2803fbd541', '周语琨', '男', '1976-10-29', '320828197610290014', 14, '江苏省淮安市公安局淮安分局国内安全保卫大队', '084530', '副大队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (307, 2, '220abc65f4a96bbc11f2fd2803fbd541', '高年安', '男', '1968-01-14', '320803196801140017', 14, '江苏省淮安市公安局淮安分局国内安全保卫大队', '084027', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (308, 1, '220abc65f4a96bbc11f2fd2803fbd541', '于曦东', '男', '1979-03-04', '320882197903040017', 14, '江苏省淮安市公安局淮安分局国内安全保卫大队', '084537', '教导员、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (309, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张亚辉', '男', '1978-09-07', '320828197809070617', 14, '江苏省淮安市公安局淮安分局国内安全保卫大队', '084594', '办公室主任、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (310, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张文玉', '男', '1982-09-27', '320882198209272015', 14, '江苏省淮安市公安局淮安分局国内安全保卫大队', '084230', '副科长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (311, 1, '220abc65f4a96bbc11f2fd2803fbd541', '顾莹', '女', '1980-11-25', '320882198011250021', 14, '江苏省淮安市公安局淮安分局国内安全保卫大队', '084575', '科长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (312, 2, '220abc65f4a96bbc11f2fd2803fbd541', '龚旭东', '男', '1972-10-02', '320828197210026214', 15, '江苏省淮安市淮安区看守所', '084404', '所长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (313, 1, '220abc65f4a96bbc11f2fd2803fbd541', '薛良华', '男', '1965-06-27', '320828196507030236', 15, '江苏省淮安市淮安区看守所', '084259', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (314, 1, '220abc65f4a96bbc11f2fd2803fbd541', '金城', '男', '1962-08-10', '32088219620810001X', 15, '江苏省淮安市淮安区看守所', '084509', '一级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (315, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王加成', '男', '1968-09-09', '32082819680909055X', 15, '江苏省淮安市淮安区看守所', '084487', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (316, 1, '220abc65f4a96bbc11f2fd2803fbd541', '杨瑞', '男', '1961-03-23', '320882196210230032', 15, '江苏省淮安市淮安区看守所', '084493', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (317, 1, '220abc65f4a96bbc11f2fd2803fbd541', '郭涛', '男', '1961-01-13', '320828196105130218', 15, '江苏省淮安市淮安区看守所', '084449', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (318, 1, '220abc65f4a96bbc11f2fd2803fbd541', '郭俊龙', '男', '1964-07-12', '320882196407120216', 15, '江苏省淮安市淮安区看守所', '084585', '一级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (319, 1, '220abc65f4a96bbc11f2fd2803fbd541', '施维祥', '男', '1962-02-25', '320828196202250211', 15, '江苏省淮安市淮安区看守所', '084362', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (320, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李立东', '男', '1965-12-29', '320828196512291211', 15, '江苏省淮安市淮安区看守所', '084185', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (321, 1, '220abc65f4a96bbc11f2fd2803fbd541', '周国成', '男', '1963-08-20', '320828196305200057', 15, '江苏省淮安市淮安区看守所', '084369', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (322, 1, '220abc65f4a96bbc11f2fd2803fbd541', '江发林', '男', '1960-12-09', '320828196012092654', 15, '江苏省淮安市淮安区看守所', '084406', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (323, 1, '220abc65f4a96bbc11f2fd2803fbd541', '韩志猛', '男', '1973-07-01', '320882197307118017', 15, '江苏省淮安市淮安区看守所', '084581', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (324, 1, '220abc65f4a96bbc11f2fd2803fbd541', '靖正飞', '男', '1979-07-19', '320882197907191832', 15, '江苏省淮安市淮安区看守所', '084284', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (325, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王国年', '男', '1963-12-30', '320882196312300011', 15, '江苏省淮安市淮安区看守所', '084580', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (326, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王俊波', '男', '1959-10-06', '320828195910065637', 15, '江苏省淮安市淮安区看守所', '084429', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (327, 1, '220abc65f4a96bbc11f2fd2803fbd541', '宗旭', '男', '1981-03-20', '320882198103202211', 15, '江苏省淮安市淮安区看守所', '084501', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (328, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王玉海', '男', '1964-10-04', '320882196410040014', 15, '江苏省淮安市淮安区看守所', '084321', '四级高级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (329, 1, '220abc65f4a96bbc11f2fd2803fbd541', '史国伟', '男', '1978-03-05', '320828197803050017', 15, '江苏省淮安市淮安区看守所', '084462', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (330, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘超奇', '男', '1973-06-20', '320825197302200217', 15, '江苏省淮安市淮安区看守所', '084037', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (331, 1, '220abc65f4a96bbc11f2fd2803fbd541', '赵二国', '男', '1974-11-20', '320882197411208012', 15, '江苏省淮安市淮安区看守所', '084164', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (332, 1, '220abc65f4a96bbc11f2fd2803fbd541', '董汝山', '男', '1979-02-10', '320882197902107611', 15, '江苏省淮安市淮安区看守所', '084238', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (333, 1, '220abc65f4a96bbc11f2fd2803fbd541', '傅国强', '男', '1961-06-04', '32082819610604141X', 15, '江苏省淮安市淮安区看守所', '084417', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (334, 1, '220abc65f4a96bbc11f2fd2803fbd541', '赵永刚', '男', '1976-03-27', '320803197603270018', 15, '江苏省淮安市淮安区看守所', '084128', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (335, 1, '220abc65f4a96bbc11f2fd2803fbd541', '高端轩', '男', '1961-06-06', '320828196107063856', 15, '江苏省淮安市淮安区看守所', '084459', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (336, 1, '220abc65f4a96bbc11f2fd2803fbd541', '沈海进', '男', '1963-07-10', '320882196307105430', 15, '江苏省淮安市淮安区看守所', '084431', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (337, 1, '220abc65f4a96bbc11f2fd2803fbd541', '褚全生', '男', '1972-04-07', '320882197204078016', 15, '江苏省淮安市淮安区看守所', '084054', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (338, 1, '220abc65f4a96bbc11f2fd2803fbd541', '魏小从', '男', '1979-09-21', '320828197909212678', 16, '江苏省淮安市淮安区拘留所', '084577', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (339, 1, '220abc65f4a96bbc11f2fd2803fbd541', '郝伟', '男', '1981-08-03', '320882198108030017', 16, '江苏省淮安市淮安区拘留所', '084191', '指导员、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (340, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈旭生', '男', '1973-08-18', '32082819730818021X', 16, '江苏省淮安市淮安区拘留所', '084533', '所长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (341, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈才云', '男', '1965-04-24', '320828196504240019', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084320', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (342, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李勋', '男', '1977-01-18', '320828197701183855', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084178', '副所长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (343, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李晓明', '男', '1962-07-05', '320828196207050032', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084378', '四级高级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (344, 1, '220abc65f4a96bbc11f2fd2803fbd541', '方正俊', '男', '1961-08-24', '320828196108241810', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084409', '四级高级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (345, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘正军', '男', '1966-02-19', '320828196602193076', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084184', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (346, 1, '220abc65f4a96bbc11f2fd2803fbd541', '杨一莉', '女', '1973-01-14', '32082819730114024X', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084507', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (347, 1, '220abc65f4a96bbc11f2fd2803fbd541', '谷武', '男', '1963-07-16', '320882196307160018', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084583', '四级高级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (348, 2, '220abc65f4a96bbc11f2fd2803fbd541', '王学志', '男', '1975-11-14', '320828197511140651', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084529', '大队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (349, 1, '220abc65f4a96bbc11f2fd2803fbd541', '卢学仁', '男', '1969-08-24', '320882196908240013', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084319', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (350, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王庆', '男', '1975-01-15', '320882197501152817', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084549', '副大队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (351, 1, '220abc65f4a96bbc11f2fd2803fbd541', '卢广荣', '男', '1982-01-04', '320828198201042057', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084625', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (352, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李祥顺', '男', '1963-06-19', '320828196306190014', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084329', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (353, 1, '220abc65f4a96bbc11f2fd2803fbd541', '丁创杰', '男', '1966-12-18', '320828196612182557', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084076', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (354, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李荣富', '男', '1963-02-18', '320882196403180019', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084578', '一级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (355, 1, '220abc65f4a96bbc11f2fd2803fbd541', '任夕海', '男', '1975-06-02', '320828197502021431', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084390', '副中队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (356, 1, '220abc65f4a96bbc11f2fd2803fbd541', '卢宏', '男', '1966-11-08', '320828196611083274', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084039', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (357, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张力生', '男', '1973-08-22', '320882197308222633', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084338', '副中队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (358, 1, '220abc65f4a96bbc11f2fd2803fbd541', '严洪坤', '男', '1969-02-10', '320882197007100018', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084579', '副中队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (359, 1, '220abc65f4a96bbc11f2fd2803fbd541', '朱谦', '男', '1960-08-19', '320828196006190215', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084342', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (360, 1, '220abc65f4a96bbc11f2fd2803fbd541', '蔡从康', '男', '1975-02-13', '320882197502138013', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084131', '中队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (361, 1, '220abc65f4a96bbc11f2fd2803fbd541', '柴俊友', '男', '1969-03-02', '511501196903022254', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084165', '副中队长、四级高级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (362, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王金国', '男', '1972-11-17', '320882197211170013', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084188', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (363, 1, '220abc65f4a96bbc11f2fd2803fbd541', '孟繁裕', '男', '1966-05-08', '320882196605080016', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084212', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (364, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王开林', '男', '1963-09-16', '320828196309160638', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084326', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (365, 1, '220abc65f4a96bbc11f2fd2803fbd541', '苏淮兵', '男', '1962-05-18', '320828196301180212', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084352', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (366, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈雪松', '男', '1974-01-23', '320828197401230015', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084566', '副中队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (367, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张建武', '男', '1963-02-21', '320828196302210612', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084349', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (368, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王勇', '男', '1978-12-29', '320828197812292616', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084099', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (369, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王建山', '男', '1971-08-14', '350583197108149510', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084154', '指导员、二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (370, 1, '220abc65f4a96bbc11f2fd2803fbd541', '滕兵', '男', '1973-12-18', '320803197312180012', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084627', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (371, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈志明', '男', '1976-03-10', '320828197603100032', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084514', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (372, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李正国', '男', '1978-08-11', '320882197808118031', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084644', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (373, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张建文', '男', '1974-12-02', '220281197412029515', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084190', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (374, 1, '220abc65f4a96bbc11f2fd2803fbd541', '董树青', '男', '1974-11-01', '370702197411016514', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084122', '副中队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (375, 1, '220abc65f4a96bbc11f2fd2803fbd541', '徐忠志', '男', '1980-11-13', '320828198011133636', 17, '江苏省淮安市公安局淮安分局巡特警大队', '084157', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (376, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张凤美', '男', '1964-06-09', '320828196406090432', 18, '江苏省淮安市公安局淮安分局城市管理办公室', '084318', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (377, 2, '220abc65f4a96bbc11f2fd2803fbd541', '姬晓东', '男', '1961-11-26', '320828196111260035', 18, '江苏省淮安市公安局淮安分局城市管理办公室', '084344', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (378, 2, '220abc65f4a96bbc11f2fd2803fbd541', '丁连虎', '男', '1975-01-03', '320882197501037819', 19, '江苏省淮安市公安局淮安分局镇淮楼派出所', '084088', '所长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (379, 1, '220abc65f4a96bbc11f2fd2803fbd541', '汤跃淮', '男', '1964-01-09', '320882196404090234', 19, '江苏省淮安市公安局淮安分局镇淮楼派出所', '084451', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (380, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张彬', '男', '1990-08-23', '320882199008232070', 19, '江苏省淮安市公安局淮安分局镇淮楼派出所', '084030', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (381, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王宏魁', '男', '1976-11-03', '320828197611030038', 19, '江苏省淮安市公安局淮安分局镇淮楼派出所', '084504', '副队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (382, 1, '220abc65f4a96bbc11f2fd2803fbd541', '马军', '男', '1977-12-24', '320882197712240032', 19, '江苏省淮安市公安局淮安分局镇淮楼派出所', '084532', '副所长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (383, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王强', '男', '1983-10-09', '231024198310092010', 19, '江苏省淮安市公安局淮安分局镇淮楼派出所', '084124', '队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (384, 1, '220abc65f4a96bbc11f2fd2803fbd541', '郭会军', '男', '1975-09-15', '320828197509155811', 19, '江苏省淮安市公安局淮安分局镇淮楼派出所', '084565', '副所长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (385, 1, '220abc65f4a96bbc11f2fd2803fbd541', '钟小鹏', '男', '1980-08-10', '320882198008105616', 19, '江苏省淮安市公安局淮安分局镇淮楼派出所', '084510', '副队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (386, 1, '220abc65f4a96bbc11f2fd2803fbd541', '赵明胜', '男', '1971-09-13', '370682197109139050', 19, '江苏省淮安市公安局淮安分局镇淮楼派出所', '084443', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (387, 1, '220abc65f4a96bbc11f2fd2803fbd541', '魏玉标', '男', '1966-01-15', '320829196601150038', 19, '江苏省淮安市公安局淮安分局镇淮楼派出所', '084197', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (388, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王家宾', '男', '1984-12-18', '22072319841218103X', 19, '江苏省淮安市公安局淮安分局镇淮楼派出所', '084612', '副队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (389, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张磊', '男', '1981-05-07', '320882198105070419', 19, '江苏省淮安市公安局淮安分局镇淮楼派出所', '084647', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (390, 1, '220abc65f4a96bbc11f2fd2803fbd541', '徐畅', '女', '1995-08-12', '320803199508120029', 19, '江苏省淮安市公安局淮安分局镇淮楼派出所', '084669', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (391, 1, '220abc65f4a96bbc11f2fd2803fbd541', '江伟永', '男', '1979-06-23', '320811197907230031', 19, '江苏省淮安市公安局淮安分局镇淮楼派出所', '084678', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (392, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李树鹏', '男', '1986-06-03', '632122198606030036', 20, '江苏省淮安市公安局淮安分局鱼市派出所', '084108', '副队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (393, 1, '220abc65f4a96bbc11f2fd2803fbd541', '马晓虎', '男', '1986-07-26', '320882198607265013', 20, '江苏省淮安市公安局淮安分局鱼市派出所', '084608', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (394, 1, '220abc65f4a96bbc11f2fd2803fbd541', '周东海', '男', '1971-06-30', '320882197106300015', 20, '江苏省淮安市公安局淮安分局鱼市派出所', '084588', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (395, 1, '220abc65f4a96bbc11f2fd2803fbd541', '吕惠娟', '女', '1988-09-01', '320882198809016429', 20, '江苏省淮安市公安局淮安分局鱼市派出所', '084641', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (396, 1, '220abc65f4a96bbc11f2fd2803fbd541', '滕建军', '男', '1974-09-08', '320882197409088015', 20, '江苏省淮安市公安局淮安分局鱼市派出所', '084204', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (397, 1, '220abc65f4a96bbc11f2fd2803fbd541', '谷雨', '男', '1979-11-11', '32082819791111003X', 20, '江苏省淮安市公安局淮安分局鱼市派出所', '084134', '副所长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (398, 1, '220abc65f4a96bbc11f2fd2803fbd541', '高九贵', '男', '1973-10-13', '320882197310138019', 20, '江苏省淮安市公安局淮安分局鱼市派出所', '084121', '副所长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (399, 1, '220abc65f4a96bbc11f2fd2803fbd541', '谷锦', '男', '1979-01-03', '320803197901034216', 20, '江苏省淮安市公安局淮安分局鱼市派出所', '084142', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (400, 2, '220abc65f4a96bbc11f2fd2803fbd541', '李凡文', '男', '1970-10-20', '320828197010202594', 20, '江苏省淮安市公安局淮安分局鱼市派出所', '084381', '所长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (401, 1, '220abc65f4a96bbc11f2fd2803fbd541', '吉洪干', '男', '1972-11-30', '320828197311303815', 20, '江苏省淮安市公安局淮安分局鱼市派出所', '084568', '副队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (402, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张羽', '男', '1993-01-12', '320882199301120019', 20, '江苏省淮安市公安局淮安分局鱼市派出所', '084265', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (403, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘斌', '男', '1990-01-07', '320882199001075615', 20, '江苏省淮安市公安局淮安分局鱼市派出所', '084686', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (404, 1, '220abc65f4a96bbc11f2fd2803fbd541', '葛梦馨', '女', '1996-08-21', '320882199608210043', 21, '江苏省淮安市公安局淮安分局华亭派出所', '084683', '民警', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (405, 1, '220abc65f4a96bbc11f2fd2803fbd541', '任正东', '男', '1982-01-07', '320882198201072019', 22, '江苏省淮安市公安局淮安分局河下派出所', '084198', '队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (406, 1, '220abc65f4a96bbc11f2fd2803fbd541', '胡松', '男', '1976-04-13', '320114197604130018', 22, '江苏省淮安市公安局淮安分局河下派出所', '084542', '副所长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (407, 1, '220abc65f4a96bbc11f2fd2803fbd541', '章继军', '男', '1979-02-11', '320828197902110134', 22, '江苏省淮安市公安局淮安分局河下派出所', '084193', '副主任、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (408, 1, '220abc65f4a96bbc11f2fd2803fbd541', '魏东', '男', '1971-08-13', '320882197108138031', 22, '江苏省淮安市公安局淮安分局河下派出所', '084118', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (409, 1, '220abc65f4a96bbc11f2fd2803fbd541', '贾素红', '女', '1979-02-10', '320828197902104420', 22, '江苏省淮安市公安局淮安分局河下派出所', '084200', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (410, 1, '220abc65f4a96bbc11f2fd2803fbd541', '周玉能', '男', '1982-09-09', '320882198209094415', 22, '江苏省淮安市公安局淮安分局河下派出所', '084104', '副队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (411, 1, '220abc65f4a96bbc11f2fd2803fbd541', '黄碧涛', '男', '1986-12-29', '320882198612293430', 22, '江苏省淮安市公安局淮安分局河下派出所', '084201', '队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (412, 1, '220abc65f4a96bbc11f2fd2803fbd541', '朱萍', '女', '1965-12-25', '320828196612251022', 22, '江苏省淮安市公安局淮安分局河下派出所', '084167', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (413, 1, '220abc65f4a96bbc11f2fd2803fbd541', '胡小兵', '男', '1970-05-04', '320882197005040015', 22, '江苏省淮安市公安局淮安分局河下派出所', '084241', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (414, 2, '220abc65f4a96bbc11f2fd2803fbd541', '唐立志', '男', '1979-06-18', '320882197906182811', 22, '江苏省淮安市公安局淮安分局河下派出所', '084592', '所长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (415, 1, '220abc65f4a96bbc11f2fd2803fbd541', '余旭东', '男', '1972-10-01', '320722197210019512', 22, '江苏省淮安市公安局淮安分局河下派出所', '084156', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (416, 1, '220abc65f4a96bbc11f2fd2803fbd541', '汤培林', '男', '1983-05-16', '320882198305163898', 22, '江苏省淮安市公安局淮安分局河下派出所', '084116', '副所长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (417, 1, '220abc65f4a96bbc11f2fd2803fbd541', '朱宝珠', '男', '1962-10-10', '320828196210100213', 22, '江苏省淮安市公安局淮安分局河下派出所', '084363', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (418, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张海港', '男', '1992-06-22', '321323199206225510', 22, '江苏省淮安市公安局淮安分局河下派出所', '084287', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (419, 1, '220abc65f4a96bbc11f2fd2803fbd541', '袁浩', '男', '1976-05-19', '320828197605190019', 23, '江苏省淮安市公安局淮安分局板闸派出所', '084302', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (420, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈达志', '男', '1972-12-06', '132528197212065014', 23, '江苏省淮安市公安局淮安分局板闸派出所', '084205', '副所长、二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (421, 1, '220abc65f4a96bbc11f2fd2803fbd541', '贺渊', '男', '1987-08-28', '152726198708280056', 23, '江苏省淮安市公安局淮安分局板闸派出所', '084057', '副所长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (422, 1, '220abc65f4a96bbc11f2fd2803fbd541', '赵晔', '男', '1990-04-28', '320882199004280219', 23, '江苏省淮安市公安局淮安分局板闸派出所', '084035', '副主任、一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (423, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李亚兵', '男', '1972-09-26', '320828197209263677', 23, '江苏省淮安市公安局淮安分局板闸派出所', '084400', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (424, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈怀权', '男', '1981-09-20', '320882198109200639', 23, '江苏省淮安市公安局淮安分局板闸派出所', '084148', '副所长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (425, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张冰', '女', '1989-11-09', '320826198911090122', 23, '江苏省淮安市公安局淮安分局板闸派出所', '084640', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (426, 1, '220abc65f4a96bbc11f2fd2803fbd541', '牛伟', '男', '1990-04-18', '32088219900418485X', 23, '江苏省淮安市公安局淮安分局板闸派出所', '084151', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (427, 1, '220abc65f4a96bbc11f2fd2803fbd541', '许成用', '男', '1977-08-28', '320882197708288017', 23, '江苏省淮安市公安局淮安分局板闸派出所', '084262', '副队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (428, 2, '220abc65f4a96bbc11f2fd2803fbd541', '李兵', '男', '1980-08-13', '320882198008132614', 23, '江苏省淮安市公安局淮安分局板闸派出所', '084186', '所长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (429, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张旺平', '男', '1982-12-21', '320882198312212854', 23, '江苏省淮安市公安局淮安分局板闸派出所', '084240', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (430, 1, '220abc65f4a96bbc11f2fd2803fbd541', '姚超', '男', '1981-11-10', '320882198111100215', 23, '江苏省淮安市公安局淮安分局板闸派出所', '084606', '副主任、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (431, 1, '220abc65f4a96bbc11f2fd2803fbd541', '谭跃进', '男', '1982-07-28', '320882198207288013', 23, '江苏省淮安市公安局淮安分局板闸派出所', '084650', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (432, 1, '220abc65f4a96bbc11f2fd2803fbd541', '孙长', '男', '1994-06-12', '321322199406120012', 23, '江苏省淮安市公安局淮安分局板闸派出所', '084657', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (433, 1, '220abc65f4a96bbc11f2fd2803fbd541', '朱天鹏', '男', '1982-03-22', '320882198203223079', 24, '江苏省淮安市公安局淮安分局平桥派出所', '084025', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (434, 2, '220abc65f4a96bbc11f2fd2803fbd541', '陈大军', '男', '1974-03-01', '321102197403010533', 24, '江苏省淮安市公安局淮安分局平桥派出所', '084494', '副所长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (435, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张锦兵', '男', '1976-07-02', '320828197607021411', 24, '江苏省淮安市公安局淮安分局平桥派出所', '084269', '副队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (436, 1, '220abc65f4a96bbc11f2fd2803fbd541', '毛远航', '男', '1996-04-26', '320882199604264415', 24, '江苏省淮安市公安局淮安分局平桥派出所', '084681', '民警', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (437, 1, '220abc65f4a96bbc11f2fd2803fbd541', '赵国安', '男', '1966-02-03', '320828196602033611', 25, '江苏省淮安市公安局淮安分局上河派出所', '084442', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (438, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张从凯', '男', '1989-06-22', '320882198906224473', 25, '江苏省淮安市公安局淮安分局上河派出所', '084478', '主任、一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (439, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘飞', '男', '1995-10-22', '320811199510223537', 25, '江苏省淮安市公安局淮安分局上河派出所', '084671', '民警', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (440, 2, '220abc65f4a96bbc11f2fd2803fbd541', '蒋大为', '男', '1984-04-02', '320882198404025431', 26, '江苏省淮安市公安局淮安分局建淮派出所', '084301', '所长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (441, 1, '220abc65f4a96bbc11f2fd2803fbd541', '孙建设', '男', '1966-05-02', '320828196605024817', 26, '江苏省淮安市公安局淮安分局建淮派出所', '084242', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (442, 1, '220abc65f4a96bbc11f2fd2803fbd541', '朱明海', '男', '1989-09-11', '320882198909112418', 26, '江苏省淮安市公安局淮安分局建淮派出所', '084107', '副主任、一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (443, 1, '220abc65f4a96bbc11f2fd2803fbd541', '杨勇', '男', '1981-08-19', '320882198108191216', 26, '江苏省淮安市公安局淮安分局建淮派出所', '084649', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (444, 1, '220abc65f4a96bbc11f2fd2803fbd541', '邬登华', '男', '1979-02-19', '320828197902193056', 26, '江苏省淮安市公安局淮安分局建淮派出所', '084648', '副队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (445, 1, '220abc65f4a96bbc11f2fd2803fbd541', '严志', '男', '1977-02-20', '320882197702204839', 27, '江苏省淮安市公安局淮安分局马甸派出所', '084596', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (446, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张兵', '男', '1972-10-30', '320828197210304077', 27, '江苏省淮安市公安局淮安分局马甸派出所', '084050', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (447, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王秀国', '男', '1972-03-01', '320882197203148019', 27, '江苏省淮安市公安局淮安分局马甸派出所', '084130', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (448, 2, '220abc65f4a96bbc11f2fd2803fbd541', '朱坚', '男', '1980-11-27', '320882198011260019', 27, '江苏省淮安市公安局淮安分局马甸派出所', '084474', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (449, 2, '220abc65f4a96bbc11f2fd2803fbd541', '郭江', '男', '1978-09-16', '320828197809164031', 28, '江苏省淮安市公安局淮安分局朱桥派出所', '084040', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (450, 1, '220abc65f4a96bbc11f2fd2803fbd541', '乔昆', '男', '1973-07-12', '320828197307120215', 28, '江苏省淮安市公安局淮安分局朱桥派出所', '084536', '教导员、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (451, 1, '220abc65f4a96bbc11f2fd2803fbd541', '纪辉', '男', '1986-10-28', '320882198610280038', 28, '江苏省淮安市公安局淮安分局朱桥派出所', '084631', '副主任、一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (452, 1, '220abc65f4a96bbc11f2fd2803fbd541', '朱海涛', '男', '1979-02-27', '320882197902280019', 28, '江苏省淮安市公安局淮安分局朱桥派出所', '084652', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (453, 1, '220abc65f4a96bbc11f2fd2803fbd541', '胡建威', '男', '1996-07-05', '320882199607050017', 28, '江苏省淮安市公安局淮安分局朱桥派出所', '084675', '民警', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (454, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张亚明', '男', '1978-02-06', '320828197802060619', 29, '江苏省淮安市公安局淮安分局溪河派出所', '084428', '副所长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (455, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张龙华', '男', '1977-11-24', '320882197711243434', 29, '江苏省淮安市公安局淮安分局溪河派出所', '084560', '副所长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (456, 1, '220abc65f4a96bbc11f2fd2803fbd541', '庄跃华', '男', '1976-10-20', '320828197510202435', 29, '江苏省淮安市公安局淮安分局溪河派出所', '084181', '副队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (457, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王喆', '男', '1994-06-17', '320882199406170039', 29, '江苏省淮安市公安局淮安分局溪河派出所', '084667', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (458, 1, '220abc65f4a96bbc11f2fd2803fbd541', '费沛林', '男', '1969-01-16', '320882196901160010', 30, '江苏省淮安市公安局淮安分局施河派出所', '084331', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (459, 1, '220abc65f4a96bbc11f2fd2803fbd541', '许留高', '男', '1979-08-27', '320882197908275819', 30, '江苏省淮安市公安局淮安分局施河派出所', '084598', '副所长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (460, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张德富', '男', '1964-11-26', '320828196411262075', 30, '江苏省淮安市公安局淮安分局施河派出所', '084446', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (461, 2, '220abc65f4a96bbc11f2fd2803fbd541', '单复智', '男', '1973-11-18', '320828197311184676', 30, '江苏省淮安市公安局淮安分局施河派出所', '084552', '所长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (462, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈术', '男', '1995-11-09', '320882199511091631', 30, '江苏省淮安市公安局淮安分局施河派出所', '084679', '民警', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (463, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈恩兵', '男', '1973-04-27', '320828197304272811', 31, '江苏省淮安市公安局淮安分局车桥派出所', '084500', '副所长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (464, 2, '220abc65f4a96bbc11f2fd2803fbd541', '赵骏', '男', '1975-11-09', '320828197511090033', 31, '江苏省淮安市公安局淮安分局车桥派出所', '084569', '所长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (465, 1, '220abc65f4a96bbc11f2fd2803fbd541', '江存波', '男', '1966-07-15', '320828196607153014', 31, '江苏省淮安市公安局淮安分局车桥派出所', '084196', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (466, 1, '220abc65f4a96bbc11f2fd2803fbd541', '高廷杰', '男', '1989-09-18', '320882198909182811', 31, '江苏省淮安市公安局淮安分局车桥派出所', '084408', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (467, 1, '220abc65f4a96bbc11f2fd2803fbd541', '赵业剑', '男', '1989-12-09', '320882198912092438', 31, '江苏省淮安市公安局淮安分局车桥派出所', '084402', '副队长、一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (468, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘宇', '男', '1993-10-24', '320882199310244814', 31, '江苏省淮安市公安局淮安分局车桥派出所', '084680', '民警', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (469, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王栋', '男', '1991-02-18', '320882199102181273', 32, '江苏省淮安市公安局淮安分局泾口派出所', '084309', '副主任、一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (470, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘振明', '男', '1986-09-14', '32082619860914621X', 32, '江苏省淮安市公安局淮安分局泾口派出所', '084633', '队长、一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (471, 1, '220abc65f4a96bbc11f2fd2803fbd541', '管文武', '男', '1989-08-06', '320882198908062033', 32, '江苏省淮安市公安局淮安分局泾口派出所', '084452', '副主任、一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (472, 1, '220abc65f4a96bbc11f2fd2803fbd541', '门伟', '男', '1990-12-25', '320882199012254838', 32, '江苏省淮安市公安局淮安分局泾口派出所', '084643', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (473, 2, '220abc65f4a96bbc11f2fd2803fbd541', '高峰', '男', '1978-04-12', '32082819780412003X', 32, '江苏省淮安市公安局淮安分局泾口派出所', '084056', '副所长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (474, 1, '220abc65f4a96bbc11f2fd2803fbd541', '任杰', '男', '1989-12-22', '320882198912221615', 33, '江苏省淮安市公安局淮安分局流均派出所', '084033', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (475, 1, '220abc65f4a96bbc11f2fd2803fbd541', '余业峰', '男', '1989-10-24', '320882198910243095', 33, '江苏省淮安市公安局淮安分局流均派出所', '084339', '主任、一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (476, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘建璋', '男', '1979-08-20', '320882197908200032', 33, '江苏省淮安市公安局淮安分局流均派出所', '084528', '教导员、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (477, 2, '220abc65f4a96bbc11f2fd2803fbd541', '杨金浪', '男', '1981-02-04', '320882198102043810', 33, '江苏省淮安市公安局淮安分局流均派出所', '084160', '所长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (478, 2, '220abc65f4a96bbc11f2fd2803fbd541', '骆长帅', '男', '1983-01-20', '320882198301204613', 34, '江苏省淮安市公安局淮安分局博里派出所', '084176', '副所长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (479, 1, '220abc65f4a96bbc11f2fd2803fbd541', '仇长风', '男', '1965-11-04', '320828196511043419', 34, '江苏省淮安市公安局淮安分局博里派出所', '084440', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (480, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李海波', '男', '1980-10-27', '320882198010270610', 34, '江苏省淮安市公安局淮安分局博里派出所', '084036', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (481, 1, '220abc65f4a96bbc11f2fd2803fbd541', '潘志清', '男', '1995-05-28', '320882199505285835', 34, '江苏省淮安市公安局淮安分局博里派出所', '084665', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (482, 1, '220abc65f4a96bbc11f2fd2803fbd541', '郭强勇', '男', '1978-08-25', '320113197808259511', 35, '江苏省淮安市公安局淮安分局仇桥派出所', '084562', '二级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (483, 1, '220abc65f4a96bbc11f2fd2803fbd541', '祁学军', '男', '1974-08-09', '410522197408099010', 35, '江苏省淮安市公安局淮安分局仇桥派出所', '084140', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (484, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王志坚', '男', '1979-09-13', '320828197909134817', 35, '江苏省淮安市公安局淮安分局仇桥派出所', '084260', '副所长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (485, 1, '220abc65f4a96bbc11f2fd2803fbd541', '盛雷', '男', '1974-04-25', '320828197404251217', 35, '江苏省淮安市公安局淮安分局仇桥派出所', '084078', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (486, 2, '220abc65f4a96bbc11f2fd2803fbd541', '薛强', '男', '1975-04-28', '320828197504280058', 35, '江苏省淮安市公安局淮安分局仇桥派出所', '084517', '所长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (487, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张建华', '男', '1981-05-21', '320882198105212819', 36, '江苏省淮安市公安局淮安分局复兴派出所', '084150', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (488, 2, '220abc65f4a96bbc11f2fd2803fbd541', '武寿亮', '男', '1975-01-15', '320828197501150215', 36, '江苏省淮安市公安局淮安分局复兴派出所', '084521', '所长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (489, 1, '220abc65f4a96bbc11f2fd2803fbd541', '许中雷', '男', '1979-12-26', '320721197912264655', 36, '江苏省淮安市公安局淮安分局复兴派出所', '084081', '副队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (490, 1, '220abc65f4a96bbc11f2fd2803fbd541', '窦林波', '男', '1979-06-01', '371421197802147136', 36, '江苏省淮安市公安局淮安分局复兴派出所', '084031', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (491, 2, '220abc65f4a96bbc11f2fd2803fbd541', '张传亿', '男', '1975-07-10', '32082819750710325X', 37, '江苏省淮安市公安局淮安分局苏嘴派出所', '084573', '所长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (492, 1, '220abc65f4a96bbc11f2fd2803fbd541', '孙国庆', '男', '1986-12-19', '320826198612194212', 37, '江苏省淮安市公安局淮安分局苏嘴派出所', '084634', '队长、一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (493, 1, '220abc65f4a96bbc11f2fd2803fbd541', '林悰胤', '男', '1981-12-19', '320882198112190013', 37, '江苏省淮安市公安局淮安分局苏嘴派出所', '084364', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (494, 1, '220abc65f4a96bbc11f2fd2803fbd541', '吴坤', '男', '1991-12-09', '320882199112093437', 37, '江苏省淮安市公安局淮安分局苏嘴派出所', '084655', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (495, 2, '220abc65f4a96bbc11f2fd2803fbd541', '臧军', '男', '1981-09-30', '320882198109302619', 38, '江苏省淮安市公安局淮安分局茭陵派出所', '084247', '副所长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (496, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王东', '男', '1972-09-09', '320828197205301218', 38, '江苏省淮安市公安局淮安分局茭陵派出所', '084393', '副教导员、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (497, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李干生', '男', '1967-07-01', '320882196707010019', 38, '江苏省淮安市公安局淮安分局茭陵派出所', '084589', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (498, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张新海', '男', '1963-07-21', '320882196310144238', 38, '江苏省淮安市公安局淮安分局茭陵派出所', '084467', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (499, 1, '220abc65f4a96bbc11f2fd2803fbd541', '翟银波', '男', '1995-11-23', '320882199511232430', 38, '江苏省淮安市公安局淮安分局茭陵派出所', '084677', '民警', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (500, 2, '220abc65f4a96bbc11f2fd2803fbd541', '张剑锋', '男', '1981-10-16', '320882198211166617', 39, '江苏省淮安市公安局淮安分局宋集派出所', '084171', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (501, 1, '220abc65f4a96bbc11f2fd2803fbd541', '周国伟', '男', '1974-12-10', '140109197412108313', 39, '江苏省淮安市公安局淮安分局宋集派出所', '084630', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (502, 1, '220abc65f4a96bbc11f2fd2803fbd541', '徐小勇', '男', '1975-12-15', '50022719751215841X', 39, '江苏省淮安市公安局淮安分局宋集派出所', '084105', '副所长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (503, 1, '220abc65f4a96bbc11f2fd2803fbd541', '沈勇', '男', '1993-02-19', '32088219930219321X', 39, '江苏省淮安市公安局淮安分局宋集派出所', '084658', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (504, 1, '220abc65f4a96bbc11f2fd2803fbd541', '周健', '男', '1994-06-02', '320882199406022212', 39, '江苏省淮安市公安局淮安分局宋集派出所', '084664', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (505, 1, '220abc65f4a96bbc11f2fd2803fbd541', '潘辉', '男', '1996-09-10', '320882199609103653', 39, '江苏省淮安市公安局淮安分局宋集派出所', '084673', '民警', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (506, 1, '220abc65f4a96bbc11f2fd2803fbd541', '沙荣宇', '男', '1980-06-05', '320882198006056013', 40, '江苏省淮安市公安局淮安分局钦工派出所', '084314', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (507, 2, '220abc65f4a96bbc11f2fd2803fbd541', '杨学俊', '男', '1973-02-15', '320828197302153077', 40, '江苏省淮安市公安局淮安分局钦工派出所', '084479', '副所长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (508, 1, '220abc65f4a96bbc11f2fd2803fbd541', '孙桂尤', '男', '1982-01-08', '320882198201185515', 40, '江苏省淮安市公安局淮安分局钦工派出所', '084182', '副主任、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (509, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈杰', '男', '1982-04-11', '320882198204110017', 40, '江苏省淮安市公安局淮安分局钦工派出所', '084243', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (510, 1, '220abc65f4a96bbc11f2fd2803fbd541', '汤天宇', '男', '1994-07-06', '321322199407064438', 40, '江苏省淮安市公安局淮安分局钦工派出所', '084278', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (511, 1, '220abc65f4a96bbc11f2fd2803fbd541', '施宇', '男', '1996-01-20', '320882199601200213', 40, '江苏省淮安市公安局淮安分局钦工派出所', '084676', '民警', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (512, 2, '220abc65f4a96bbc11f2fd2803fbd541', '王波', '男', '1982-06-01', '320882198206012410', 41, '江苏省淮安市公安局淮安分局顺河派出所', '084232', '所长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (513, 1, '220abc65f4a96bbc11f2fd2803fbd541', '潘勇', '男', '1979-06-12', '320882197906120418', 41, '江苏省淮安市公安局淮安分局顺河派出所', '084079', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (514, 1, '220abc65f4a96bbc11f2fd2803fbd541', '孙锦黎', '男', '1965-08-13', '320882196508130018', 41, '江苏省淮安市公安局淮安分局顺河派出所', '084587', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (515, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘跃超', '男', '1990-11-15', '320721199011154634', 41, '江苏省淮安市公安局淮安分局顺河派出所', '084286', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (516, 1, '220abc65f4a96bbc11f2fd2803fbd541', '沈添', '男', '1994-02-06', '320882199402060035', 41, '江苏省淮安市公安局淮安分局顺河派出所', '084456', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (517, 2, '220abc65f4a96bbc11f2fd2803fbd541', '于成', '男', '1983-09-03', '320882198309032676', 42, '江苏省淮安市公安局淮安分局季桥派出所', '084248', '所长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (518, 1, '220abc65f4a96bbc11f2fd2803fbd541', '韩松', '男', '1983-01-10', '320882198301107215', 42, '江苏省淮安市公安局淮安分局季桥派出所', '084155', '教导员、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (519, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘雨', '男', '1981-03-22', '342225198103226614', 42, '江苏省淮安市公安局淮安分局季桥派出所', '084177', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (520, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘佳文', '男', '1995-02-28', '320882199502281855', 42, '江苏省淮安市公安局淮安分局季桥派出所', '084663', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (521, 1, '220abc65f4a96bbc11f2fd2803fbd541', '蔡瑞永', '男', '1995-01-08', '320802199501082510', 42, '江苏省淮安市公安局淮安分局季桥派出所', '084672', '民警', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (522, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈杰', '男', '1982-02-13', '320882198203130032', 43, '江苏省淮安市公安局淮安分局城东派出所', '084163', '副所长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (523, 1, '220abc65f4a96bbc11f2fd2803fbd541', '董健波', '男', '1985-02-04', '320882198502040010', 43, '江苏省淮安市公安局淮安分局城东派出所', '084601', '队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (524, 1, '220abc65f4a96bbc11f2fd2803fbd541', '唐洪波', '男', '1967-12-16', '320882196712163458', 43, '江苏省淮安市公安局淮安分局城东派出所', '084216', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (525, 1, '220abc65f4a96bbc11f2fd2803fbd541', '尚海', '男', '1973-12-02', '320828197312020016', 43, '江苏省淮安市公安局淮安分局城东派出所', '084543', '副所长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (526, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王国波', '男', '1974-02-20', '320882197402208053', 43, '江苏省淮安市公安局淮安分局城东派出所', '084298', '队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (527, 1, '220abc65f4a96bbc11f2fd2803fbd541', '刘长贵', '男', '1965-09-17', '320882196509170011', 43, '江苏省淮安市公安局淮安分局城东派出所', '084257', '一级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (528, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张万军', '男', '1966-02-16', '320828196602167230', 43, '江苏省淮安市公安局淮安分局城东派出所', '084379', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (529, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张轩', '男', '1981-01-07', '320882198101078018', 43, '江苏省淮安市公安局淮安分局城东派出所', '084292', '副主任、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (530, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李渊', '男', '1987-10-11', '622201198710110337', 43, '江苏省淮安市公安局淮安分局城东派出所', '084614', '副队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (531, 2, '220abc65f4a96bbc11f2fd2803fbd541', '张勇', '男', '1974-11-29', '320828197411291217', 43, '江苏省淮安市公安局淮安分局城东派出所', '084547', '教导员、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (532, 1, '220abc65f4a96bbc11f2fd2803fbd541', '赵焕文', '男', '1983-06-02', '320882198306026414', 43, '江苏省淮安市公安局淮安分局城东派出所', '084651', '四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (533, 1, '220abc65f4a96bbc11f2fd2803fbd541', '黄志立', '男', '1993-05-23', '320882199305232018', 43, '江苏省淮安市公安局淮安分局城东派出所', '084659', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (534, 1, '220abc65f4a96bbc11f2fd2803fbd541', '邓闯', '男', '1992-12-12', '320882199212124616', 43, '江苏省淮安市公安局淮安分局城东派出所', '084660', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (535, 1, '220abc65f4a96bbc11f2fd2803fbd541', '贾睿智', '男', '1988-04-10', '320882198804100015', 43, '江苏省淮安市公安局淮安分局城东派出所', '084662', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (536, 1, '220abc65f4a96bbc11f2fd2803fbd541', '马英杰', '男', '1983-05-19', '612129198305194011', 43, '江苏省淮安市公安局淮安分局城东派出所', '084189', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (537, 1, '220abc65f4a96bbc11f2fd2803fbd541', '姜磊', '男', '1987-06-26', '320826198706265819', 44, '江苏省淮安市公安局淮安分局席桥派出所', '084632', '主任、一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (538, 1, '220abc65f4a96bbc11f2fd2803fbd541', '高学青', '男', '1974-12-10', '320882197412108013', 44, '江苏省淮安市公安局淮安分局席桥派出所', '084629', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (539, 2, '220abc65f4a96bbc11f2fd2803fbd541', '王耀忠', '男', '1981-12-13', '320882198112135815', 44, '江苏省淮安市公安局淮安分局席桥派出所', '084226', '所长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (540, 1, '220abc65f4a96bbc11f2fd2803fbd541', '王凯东', '男', '1996-02-21', '320882199602215417', 44, '江苏省淮安市公安局淮安分局席桥派出所', '084670', '民警', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (541, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈明', '男', '1979-09-29', '320828197909290270', 45, '江苏省淮安市公安局淮安分局三堡派出所', '084593', '副教导员、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (542, 2, '220abc65f4a96bbc11f2fd2803fbd541', '陈军', '男', '1982-06-02', '320882198206020410', 45, '江苏省淮安市公安局淮安分局三堡派出所', '084206', '所长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (543, 1, '220abc65f4a96bbc11f2fd2803fbd541', '徐学俊', '男', '1973-05-23', '320381197305239815', 45, '江苏省淮安市公安局淮安分局三堡派出所', '084430', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (544, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陈汝俊', '男', '1972-02-26', '350321197202269033', 45, '江苏省淮安市公安局淮安分局三堡派出所', '084129', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (545, 1, '220abc65f4a96bbc11f2fd2803fbd541', '胡文龙', '男', '1996-04-16', '320882199604164019', 45, '江苏省淮安市公安局淮安分局三堡派出所', '084674', '民警', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (546, 2, '220abc65f4a96bbc11f2fd2803fbd541', '郭爱红', '男', '1970-01-20', '320828197001200036', 46, '江苏省淮安市公安局淮安分局林集派出所', '084399', '所长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (547, 1, '220abc65f4a96bbc11f2fd2803fbd541', '陶阳', '男', '1982-10-28', '320882198210286019', 46, '江苏省淮安市公安局淮安分局林集派出所', '084291', '副所长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (548, 1, '220abc65f4a96bbc11f2fd2803fbd541', '张朋鹏', '男', '1991-05-12', '320882199105121479', 46, '江苏省淮安市公安局淮安分局林集派出所', '084304', '副队长、一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (549, 1, '220abc65f4a96bbc11f2fd2803fbd541', '郭培', '男', '1981-11-20', '320882198111202617', 47, '江苏省淮安市公安局淮安分局南闸派出所', '084115', '副所长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (550, 2, '220abc65f4a96bbc11f2fd2803fbd541', '傅国鸿', '男', '1980-12-23', '320826198012230013', 47, '江苏省淮安市公安局淮安分局南闸派出所', '084126', '副所长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (551, 1, '220abc65f4a96bbc11f2fd2803fbd541', '叶万里', '男', '1986-09-11', '440281198609114532', 47, '江苏省淮安市公安局淮安分局南闸派出所', '084616', '队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (552, 1, '220abc65f4a96bbc11f2fd2803fbd541', '史锦武', '男', '1977-12-17', '320882197706178017', 47, '江苏省淮安市公安局淮安分局南闸派出所', '084567', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (553, 2, '220abc65f4a96bbc11f2fd2803fbd541', '周伟伟', '男', '1982-02-01', '321323198202010235', 48, '江苏省淮安市公安局淮安分局白马湖派出所', '084029', '科长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (554, 2, '220abc65f4a96bbc11f2fd2803fbd541', '曹开顺', '男', '1981-12-05', '320801198112050039', 48, '江苏省淮安市公安局淮安分局白马湖派出所', '084052', '所长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (555, 1, '220abc65f4a96bbc11f2fd2803fbd541', '高飞', '男', '1980-06-25', '32088219800725541X', 48, '江苏省淮安市公安局淮安分局白马湖派出所', '084261', '二级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (556, 1, '220abc65f4a96bbc11f2fd2803fbd541', '董梅艳', '男', '1976-09-01', '32082819760901141X', 48, '江苏省淮安市公安局淮安分局白马湖派出所', '084403', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (557, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李林林', '男', '1987-01-14', '32068319870114001X', 48, '江苏省淮安市公安局淮安分局白马湖派出所', '084263', '队长、一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (558, 2, '220abc65f4a96bbc11f2fd2803fbd541', '陈军', '男', '1972-02-07', '320882197202078039', 49, '江苏省淮安市公安局淮安分局禁毒大队', '084112', '大队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (559, 1, '220abc65f4a96bbc11f2fd2803fbd541', '贡丽华', '女', '1975-12-16', '320828197512161446', 49, '江苏省淮安市公安局淮安分局禁毒大队', '084473', '副大队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (560, 1, '220abc65f4a96bbc11f2fd2803fbd541', '梁辉', '男', '1977-06-20', '32082819770620001X', 49, '江苏省淮安市公安局淮安分局禁毒大队', '084563', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (561, 1, '220abc65f4a96bbc11f2fd2803fbd541', '汤军', '男', '1962-10-16', '32082819621016003X', 50, '江苏省淮安市公安局淮安分局经济开发区治安管理办公室', '084359', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (562, 1, '220abc65f4a96bbc11f2fd2803fbd541', '万力', '男', '1964-10-25', '320882196410250011', 50, '江苏省淮安市公安局淮安分局经济开发区治安管理办公室', '084508', '四级高级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (563, 2, '220abc65f4a96bbc11f2fd2803fbd541', '陶建忠', '男', '1969-12-05', '320828197012056412', 50, '江苏省淮安市公安局淮安分局经济开发区治安管理办公室', '084401', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (564, 2, '220abc65f4a96bbc11f2fd2803fbd541', '葛明全', '男', '1973-03-19', '320828197303190013', 51, '江苏省淮安市公安局淮安分局网络安全保卫大队', '084558', '大队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (565, 1, '220abc65f4a96bbc11f2fd2803fbd541', '胡建英', '男', '1967-08-07', '320828196708074016', 51, '江苏省淮安市公安局淮安分局网络安全保卫大队', '084235', '警务技术二级主管', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (566, 1, '220abc65f4a96bbc11f2fd2803fbd541', '梁永斌', '男', '1975-07-27', '320828197507272811', 51, '江苏省淮安市公安局淮安分局网络安全保卫大队', '084540', '副大队长、三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (567, 1, '220abc65f4a96bbc11f2fd2803fbd541', '潘立飞', '男', '1992-04-08', '320882199204082217', 51, '江苏省淮安市公安局淮安分局网络安全保卫大队', '084656', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (568, 1, '220abc65f4a96bbc11f2fd2803fbd541', '顾明', '男', '1988-12-16', '320882198812165011', 51, '江苏省淮安市公安局淮安分局网络安全保卫大队', '084603', '中队长、警务技术四级主管', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (569, 1, '220abc65f4a96bbc11f2fd2803fbd541', '谢志香', '男', '1966-07-19', '32082819660719641X', 51, '江苏省淮安市公安局淮安分局网络安全保卫大队', '084258', '警务技术二级主管', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (570, 1, '220abc65f4a96bbc11f2fd2803fbd541', '吴海波', '男', '1973-11-11', '320828197311110212', 51, '江苏省淮安市公安局淮安分局网络安全保卫大队', '084535', '副大队长、警务技术三级主管', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (571, 1, '220abc65f4a96bbc11f2fd2803fbd541', '咸梓烔', '男', '1990-03-02', '320882199003020036', 51, '江苏省淮安市公安局淮安分局网络安全保卫大队', '084519', '副中队长、警务技术员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (572, 2, '220abc65f4a96bbc11f2fd2803fbd541', '吴宏伟', '男', '1976-11-23', '320828197611236618', 52, '江苏省淮安市公安局淮安分局技术侦察大队', '084395', '大队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (573, 1, '220abc65f4a96bbc11f2fd2803fbd541', '沈永', '男', '1979-03-02', '320828197903022611', 52, '江苏省淮安市公安局淮安分局技术侦察大队', '084098', '三级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (574, 1, '220abc65f4a96bbc11f2fd2803fbd541', '乔亚民', '男', '1985-02-06', '640204198502061017', 52, '江苏省淮安市公安局淮安分局技术侦察大队', '084615', '副中队长、四级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (575, 1, '220abc65f4a96bbc11f2fd2803fbd541', '翟扬', '男', '1994-12-15', '320882199412150018', 52, '江苏省淮安市公安局淮安分局技术侦察大队', '084668', '一级警员', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (576, 1, '220abc65f4a96bbc11f2fd2803fbd541', '杨建敢', '男', '1967-01-10', '320828196701105211', 53, '江苏省淮安市公安局淮安分局水上警察大队', '084077', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (577, 1, '220abc65f4a96bbc11f2fd2803fbd541', '葛和标', '男', '1967-10-29', '320882196710293478', 53, '江苏省淮安市公安局淮安分局水上警察大队', '084083', '二级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (578, 1, '220abc65f4a96bbc11f2fd2803fbd541', '李正峰', '男', '1966-12-29', '320828196612290013', 53, '江苏省淮安市公安局淮安分局水上警察大队', '084069', '一级警长', 1, '2019-07-15 21:55:43');
INSERT INTO `user` VALUES (579, 2, '220abc65f4a96bbc11f2fd2803fbd541', '孙军', '男', '1970-10-26', '320828197011264818', 53, '江苏省淮安市公安局淮安分局水上警察大队', '084491', '大队长、三级警长', 1, '2019-07-15 21:55:43');

SET FOREIGN_KEY_CHECKS = 1;
