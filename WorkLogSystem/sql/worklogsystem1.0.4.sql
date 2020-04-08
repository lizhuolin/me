/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50712
Source Host           : localhost:3306
Source Database       : worklogsystem

Target Server Type    : MYSQL
Target Server Version : 50712
File Encoding         : 65001

Date: 2016-04-15 15:48:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tbl_changelog
-- ----------------------------
DROP TABLE IF EXISTS `tbl_changelog`;
CREATE TABLE `tbl_changelog` (
  `changelog_id` varchar(36) NOT NULL,
  `changelog_content` text NOT NULL,
  `changelog_type` int(11) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `changelog_remaks` varchar(200) DEFAULT NULL,
  `data_status` int(11) DEFAULT NULL,
  `changelog_time` datetime DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `company_id` varchar(36) NOT NULL,
  `changelog_model` varchar(200) NOT NULL,
  PRIMARY KEY (`changelog_id`),
  KEY `FK_TBL_CHAN_REFERENCE_TBL_USER` (`user_id`),
  KEY `FKD3DA56537A125536` (`company_id`),
  CONSTRAINT `FKD3DA56537A125536` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`company_id`),
  CONSTRAINT `FK_TBL_CHAN_REFERENCE_TBL_USER` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tbl_changelog
-- ----------------------------
INSERT INTO `tbl_changelog` VALUES ('402881b0540f759801540fb5b2530004', '2016-04-13', '0', '1', null, '1', '2016-04-13 21:00:46', '2016-04-13 21:00:46', '0', '个人日志');
INSERT INTO `tbl_changelog` VALUES ('402881b05412ae23015412af60d50002', '2016-04-14', '0', '1', null, '1', '2016-04-14 10:52:44', '2016-04-14 10:52:44', '0', '个人日志');
INSERT INTO `tbl_changelog` VALUES ('402881b0541437cb0154144441d60001', 'test1', '0', '1', null, '1', '2016-04-14 18:14:58', '2016-04-14 18:14:58', '0', '项目');
INSERT INTO `tbl_changelog` VALUES ('402881b0541437cb015414455aed0002', '超级管理员,', '0', '1', null, '1', '2016-04-14 18:16:10', '2016-04-14 18:16:10', '0', '项目人员');
INSERT INTO `tbl_changelog` VALUES ('402881b0541437cb01541445bb0a0004', 'test1', '0', '1', null, '1', '2016-04-14 18:16:34', '2016-04-14 18:16:34', '0', '子项目');
INSERT INTO `tbl_changelog` VALUES ('402881b0541437cb015414468d740006', 'test1', '0', '1', null, '1', '2016-04-14 18:17:28', '2016-04-14 18:17:28', '0', '项目计划');
INSERT INTO `tbl_changelog` VALUES ('402881b0541447a20154144a064f0002', 'test1', '1', '1', null, '1', '2016-04-14 18:21:16', '2016-04-14 18:21:16', '0', '项目计划');
INSERT INTO `tbl_changelog` VALUES ('402881b0541447a20154144b16410003', 'test1', '1', '1', null, '1', '2016-04-14 18:22:25', '2016-04-14 18:22:25', '0', '项目计划');
INSERT INTO `tbl_changelog` VALUES ('402881b054145c160154147ede590001', 'test1', '0', '402881b2541383770154139141b20002', null, '1', '2016-04-14 19:18:59', '2016-04-14 19:18:59', '402881b254138377015413910afa0000', '角色');
INSERT INTO `tbl_changelog` VALUES ('402881b054145c160154147efb2e0003', '402881b2541383770154139141b20002', '0', '402881b2541383770154139141b20002', null, '1', '2016-04-14 19:19:06', '2016-04-14 19:19:06', '402881b254138377015413910afa0000', '角色');
INSERT INTO `tbl_changelog` VALUES ('402881b254124bcd0154124df16c0001', 'fwerfwerew', '0', '1', null, '1', '2016-04-14 09:06:18', '2016-04-14 09:06:18', '0', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b25412504f01541253db500001', 'fwerfwerew', '1', '1', null, '1', '2016-04-14 09:12:46', '2016-04-14 09:12:46', '0', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b25412504f015412551a6b0002', 'fwerfwerew', '1', '1', null, '1', '2016-04-14 09:14:07', '2016-04-14 09:14:07', '0', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b25412504f01541255a0fb0004', 'fwewer', '0', '1', null, '1', '2016-04-14 09:14:42', '2016-04-14 09:14:42', '0', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b25412504f01541263c3960005', 'fwerfwerew', '1', '402881b25412504f015412537b830000', null, '1', '2016-04-14 09:30:08', '2016-04-14 09:30:08', '402881b254124bcd0154124df06f0000', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b25412504f0154126405ef0006', 'fwerfwerew', '1', '402881b25412504f015412537b830000', null, '1', '2016-04-14 09:30:25', '2016-04-14 09:30:25', '402881b254124bcd0154124df06f0000', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b25412504f01541264e4e70007', 'fwerfwerew', '1', '402881b25412504f015412537b830000', null, '1', '2016-04-14 09:31:22', '2016-04-14 09:31:22', '402881b254124bcd0154124df06f0000', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b25412504f0154126590870008', 'fwerfwerew', '1', '1', null, '1', '2016-04-14 09:32:06', '2016-04-14 09:32:06', '0', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b254127cb90154127ce4130000', 'fwewer,', '2', '1', null, '1', '2016-04-14 09:57:35', '2016-04-14 09:57:35', '0', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b254127cb9015412923d240001', 'test3', '1', '1', null, '1', '2016-04-14 10:20:54', '2016-04-14 10:20:54', '0', '任务');
INSERT INTO `tbl_changelog` VALUES ('402881b254127cb901541292a6850002', 'test3,', '2', '1', null, '1', '2016-04-14 10:21:21', '2016-04-14 10:21:21', '0', '任务');
INSERT INTO `tbl_changelog` VALUES ('402881b254127cb901541293bfca0003', '15684354454', '1', '1', null, '1', '2016-04-14 10:22:33', '2016-04-14 10:22:33', '0', '角色');
INSERT INTO `tbl_changelog` VALUES ('402881b254127cb9015412948a370004', '15684354454', '1', '1', null, '1', '2016-04-14 10:23:25', '2016-04-14 10:23:25', '0', '用户');
INSERT INTO `tbl_changelog` VALUES ('402881b254127cb90154129522ac0005', '15684354454,', '2', '1', null, '1', '2016-04-14 10:24:04', '2016-04-14 10:24:04', '0', '用户');
INSERT INTO `tbl_changelog` VALUES ('402881b254127cb9015412960ad50007', 'ewrew', '0', '1', null, '1', '2016-04-14 10:25:03', '2016-04-14 10:25:03', '0', '部门');
INSERT INTO `tbl_changelog` VALUES ('402881b254127cb90154129636d60008', 'ewrew', '1', '1', null, '1', '2016-04-14 10:25:14', '2016-04-14 10:25:14', '0', '部门');
INSERT INTO `tbl_changelog` VALUES ('402881b254127cb90154129656120009', 'ewrew,', '2', '1', null, '1', '2016-04-14 10:25:22', '2016-04-14 10:25:22', '0', '部门');
INSERT INTO `tbl_changelog` VALUES ('402881b2541297ad01541297d75a0000', 'werew', '1', '1', null, '1', '2016-04-14 10:27:01', '2016-04-14 10:27:01', '0', '公告');
INSERT INTO `tbl_changelog` VALUES ('402881b2541297ad0154129809bc0002', 'dfefwe', '0', '1', null, '1', '2016-04-14 10:27:14', '2016-04-14 10:27:14', '0', '公告');
INSERT INTO `tbl_changelog` VALUES ('402881b2541297ad01541298274b0003', 'dfefwe,', '2', '1', null, '1', '2016-04-14 10:27:22', '2016-04-14 10:27:22', '0', '公告');
INSERT INTO `tbl_changelog` VALUES ('402881b254129da40154129f0f5e0000', 'fwewer', '1', '1', null, '1', '2016-04-14 10:34:54', '2016-04-14 10:34:54', '0', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b25412b1d0015412b2cd490001', '1545656565656,', '2', '1', null, '1', '2016-04-14 10:56:28', '2016-04-14 10:56:28', '0', '用户');
INSERT INTO `tbl_changelog` VALUES ('402881b25412b9d8015412c9986d0002', 'werew', '1', '1', null, '1', '2016-04-14 11:21:22', '2016-04-14 11:21:22', '0', '公告');
INSERT INTO `tbl_changelog` VALUES ('402881b25412b9d8015412d5f7280004', '粉我认为', '0', '1', null, '1', '2016-04-14 11:34:52', '2016-04-14 11:34:52', '0', '公告');
INSERT INTO `tbl_changelog` VALUES ('402881b25412dbd3015412dfc43e0000', 'fwewer', '1', '1', null, '1', '2016-04-14 11:45:35', '2016-04-14 11:45:35', '0', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b25412dbd3015412e046210001', 'fwewer', '1', '1', null, '1', '2016-04-14 11:46:08', '2016-04-14 11:46:08', '0', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b25412dbd3015412e0957f0002', 'fwewer', '1', '1', null, '1', '2016-04-14 11:46:28', '2016-04-14 11:46:28', '0', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b25412e102015412e171800000', 'fwewer', '1', '1', null, '1', '2016-04-14 11:47:25', '2016-04-14 11:47:25', '0', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b25412e102015412e321000002', '服务让我', '0', '1', null, '1', '2016-04-14 11:49:15', '2016-04-14 11:49:15', '0', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b25412e102015412e4e30b0004', 'fwewer', '1', '1', null, '1', '2016-04-14 11:51:10', '2016-04-14 11:51:10', '0', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b25412e8d8015412e9885c0001', '我人人', '0', '1', null, '1', '2016-04-14 11:56:15', '2016-04-14 11:56:15', '0', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b25412e8d8015412ea0ae80003', '我人人', '1', '1', null, '1', '2016-04-14 11:56:48', '2016-04-14 11:56:48', '0', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b25412e8d8015412efddeb0004', 'fjiew,', '2', '1', null, '1', '2016-04-14 12:03:10', '2016-04-14 12:03:10', '0', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b25412e8d8015412f00ac20005', 'fwewer,', '2', '1', null, '1', '2016-04-14 12:03:21', '2016-04-14 12:03:21', '0', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b25412e8d801541351d3570007', '阿凡达', '0', '1', null, '1', '2016-04-14 13:50:10', '2016-04-14 13:50:10', '0', '公告');
INSERT INTO `tbl_changelog` VALUES ('402881b25412e8d801541352bee60008', '我人人', '1', '1', null, '1', '2016-04-14 13:51:10', '2016-04-14 13:51:10', '0', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b25413623a0154136486430000', '阿凡达', '1', '1', null, '1', '2016-04-14 14:10:35', '2016-04-14 14:10:35', '0', '公告');
INSERT INTO `tbl_changelog` VALUES ('402881b25413784301541379f55c0001', '分文未', '0', '1', null, '1', '2016-04-14 14:34:00', '2016-04-14 14:34:00', '0', '公告');
INSERT INTO `tbl_changelog` VALUES ('402881b254138377015413910b460001', '范围而问问', '0', '1', null, '1', '2016-04-14 14:59:13', '2016-04-14 14:59:13', '0', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b25413837701541397d9020003', '范围而问问', '1', '1', null, '1', '2016-04-14 15:06:39', '2016-04-14 15:06:39', '0', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b25413837701541398bcd00005', '发文日', '0', '1', null, '1', '2016-04-14 15:07:37', '2016-04-14 15:07:37', '0', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b2541383770154139f3f720006', '范围而问问', '1', '1', null, '1', '2016-04-14 15:14:44', '2016-04-14 15:14:44', '0', '公司');
INSERT INTO `tbl_changelog` VALUES ('402881b254138377015413bb50c80008', '范围而', '0', '1', null, '1', '2016-04-14 15:45:23', '2016-04-14 15:45:23', '0', '公告');
INSERT INTO `tbl_changelog` VALUES ('402881b254138377015413bb70e6000a', '范围而', '0', '1', null, '1', '2016-04-14 15:45:31', '2016-04-14 15:45:31', '0', '公告');
INSERT INTO `tbl_changelog` VALUES ('402881b25413f37e015414300ac80001', '粉我认为', '0', '1', null, '1', '2016-04-14 17:52:53', '2016-04-14 17:52:53', '0', '公告');
INSERT INTO `tbl_changelog` VALUES ('402881b25413f37e015414325c790002', 'test111', '1', '1', null, '1', '2016-04-14 17:55:25', '2016-04-14 17:55:25', '0', '公告');
INSERT INTO `tbl_changelog` VALUES ('402881b25413f37e015414349ce60003', 'test111', '1', '1', null, '1', '2016-04-14 17:57:52', '2016-04-14 17:57:52', '0', '公告');
INSERT INTO `tbl_changelog` VALUES ('402881b254143adc0154143f245b0001', '范围而', '0', '1', null, '1', '2016-04-14 18:09:23', '2016-04-14 18:09:23', '0', '公告');
INSERT INTO `tbl_changelog` VALUES ('402881b254143adc015414422eba0002', 'test111', '1', '1', null, '1', '2016-04-14 18:12:42', '2016-04-14 18:12:42', '0', '公告');
INSERT INTO `tbl_changelog` VALUES ('402881b254143adc01541444a4fb0003', '股份突然他人', '1', '1', null, '1', '2016-04-14 18:15:23', '2016-04-14 18:15:23', '0', '公告');
INSERT INTO `tbl_changelog` VALUES ('402881b254143adc015414451cb00004', '范围而', '1', '1', null, '1', '2016-04-14 18:15:54', '2016-04-14 18:15:54', '0', '公告');
INSERT INTO `tbl_changelog` VALUES ('402881b254143adc015414453d2e0005', '范围而', '1', '1', null, '1', '2016-04-14 18:16:02', '2016-04-14 18:16:02', '0', '公告');
INSERT INTO `tbl_changelog` VALUES ('402881b254143adc0154144562470006', '分文未', '1', '1', null, '1', '2016-04-14 18:16:12', '2016-04-14 18:16:12', '0', '公告');
INSERT INTO `tbl_changelog` VALUES ('402881b254143adc0154144709840007', '阿凡达', '1', '1', null, '1', '2016-04-14 18:18:00', '2016-04-14 18:18:00', '0', '公告');
INSERT INTO `tbl_changelog` VALUES ('402881b254143adc0154145cffff0008', '范围而,test111,股份突然他人,', '2', '1', null, '1', '2016-04-14 18:41:59', '2016-04-14 18:41:59', '0', '公告');
INSERT INTO `tbl_changelog` VALUES ('402881b254143adc0154145d16eb0009', '范围而,范围而,', '2', '1', null, '1', '2016-04-14 18:42:05', '2016-04-14 18:42:05', '0', '公告');
INSERT INTO `tbl_changelog` VALUES ('402881b25418d83b015418df4d6f0000', '18473743432', '1', '402881b25412e8d8015412e9d1040002', null, '1', '2016-04-15 15:42:48', '2016-04-15 15:42:48', '402881b25412e8d8015412e987b20000', '用户');
INSERT INTO `tbl_changelog` VALUES ('402881b25418d83b015418e0179e0001', '18473743432', '1', '402881b25412e8d8015412e9d1040002', null, '1', '2016-04-15 15:43:40', '2016-04-15 15:43:40', '402881b25412e8d8015412e987b20000', '用户');
INSERT INTO `tbl_changelog` VALUES ('402881b25418d83b015418e0b0a10002', '152478545258', '1', '402881b25412e102015412e3a99d0003', null, '1', '2016-04-15 15:44:19', '2016-04-15 15:44:19', '402881b25412e102015412e31de10001', '用户');
INSERT INTO `tbl_changelog` VALUES ('402881b45414084701541412779b0004', 'test2', '1', '1', null, '1', '2016-04-14 17:20:35', '2016-04-14 17:20:35', '0', '任务');
INSERT INTO `tbl_changelog` VALUES ('4028b88154189efe015418a088170000', 'gsAdmin', '1', '1', null, '1', '2016-04-15 14:34:14', '2016-04-15 14:34:14', '0', '用户');
INSERT INTO `tbl_changelog` VALUES ('4028b88154189efe015418a13a330002', 'test', '0', '402881b254129c220154129c77290000', null, '1', '2016-04-15 14:35:00', '2016-04-15 14:35:00', '402881b254124bcd0154124df06f0000', '项目');
INSERT INTO `tbl_changelog` VALUES ('4028b88154189efe015418a1c1910003', 'test', '1', '1', null, '1', '2016-04-15 14:35:35', '2016-04-15 14:35:35', '0', '项目');
INSERT INTO `tbl_changelog` VALUES ('4028b88154189efe015418a22ecc0004', 'test', '1', '1', null, '1', '2016-04-15 14:36:03', '2016-04-15 14:36:03', '0', '项目');
INSERT INTO `tbl_changelog` VALUES ('4028b88154189efe015418a7644c0005', 'test', '1', '1', null, '1', '2016-04-15 14:41:44', '2016-04-15 14:41:44', '0', '项目');
INSERT INTO `tbl_changelog` VALUES ('4028b88154189efe015418a86d860007', 'testsd', '0', '402881b254129c220154129c77290000', null, '1', '2016-04-15 14:42:52', '2016-04-15 14:42:52', '402881b254124bcd0154124df06f0000', '项目');
INSERT INTO `tbl_changelog` VALUES ('4028b88154189efe015418a92ff70008', 'test', '1', '1', null, '1', '2016-04-15 14:43:42', '2016-04-15 14:43:42', '0', '项目');
INSERT INTO `tbl_changelog` VALUES ('4028b88154189efe015418af183f0009', 'tested', '1', '1', null, '1', '2016-04-15 14:50:09', '2016-04-15 14:50:09', '0', '项目');

-- ----------------------------
-- Table structure for tbl_company
-- ----------------------------
DROP TABLE IF EXISTS `tbl_company`;
CREATE TABLE `tbl_company` (
  `company_id` varchar(36) NOT NULL,
  `company_name` varchar(64) NOT NULL,
  `company_mobile` varchar(32) NOT NULL,
  `company_adress` varchar(200) NOT NULL,
  `isVerification` tinyint(1) NOT NULL,
  `charter` varchar(200) NOT NULL,
  `company_admin` varchar(36) NOT NULL,
  `data_status` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `company_type` varchar(36) DEFAULT NULL,
  `company_introduction` text,
  `company_logo` varchar(200) DEFAULT NULL,
  `company_admin_id` varchar(36) DEFAULT NULL,
  `isFreeze` bit(1) NOT NULL,
  `idcard` varchar(18) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`company_id`),
  UNIQUE KEY `company_admin_id` (`company_admin_id`),
  KEY `FK4DD404FC4C0EAA3C` (`company_admin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tbl_company
-- ----------------------------
INSERT INTO `tbl_company` VALUES ('0', '普波', '1', '1', '1', 'upload/955e642e-03f2-40a5-9aaf-e38e82f49cb2.bmp', '1', '1', '2016-03-25 15:37:45', '1', '                1\r\n        \r\n        ', 'upload/7770e7bd-6297-4f75-bf7c-2434cb1936ce.bmp', null, '\0', null, null);
INSERT INTO `tbl_company` VALUES ('402881b254124bcd0154124df06f0000', 'fwerfwerew', '15684354454', '2', '1', 'upload/company/1bbcbf0b78934a4eac01d79b1b1dfbf4.png', '3', '0', '2016-04-14 09:06:18', '', '', '', null, '\0', '383789988989933333', 'erwerw@qq.com');
INSERT INTO `tbl_company` VALUES ('402881b25412504f01541255a09e0003', 'fwewer', '1545656565656', 'fsafd', '1', 'upload/company/f0e7594415274e90a868528856e52a4e.png', 'tr', '0', '2016-04-14 09:14:42', 'wrewr', '', '', null, '\0', '143454656565655555', '43@qq.com');
INSERT INTO `tbl_company` VALUES ('402881b25412b9d8015412ba6d900000', 'fjiew', '9282552553', 'wer', '0', 'upload/company/dfee0d1d10c641c3bd1d92d8ede92634.png', 'ew', '0', '2016-04-14 11:04:48', '', '', '', null, '', '349543543543543444', 'e2@qq.com');
INSERT INTO `tbl_company` VALUES ('402881b25412e102015412e31de10001', '服务让我', '152478545258', '问问', '1', 'upload/company/91a1fda83ef74d6cb4da47b0df775fa0.png', '粉我认为', '1', '2016-04-14 11:49:14', '', '', '', '402881b25412e102015412e3a99d0003', '\0', '235435435534434234', '肺胃热@qq.com');
INSERT INTO `tbl_company` VALUES ('402881b25412e8d8015412e987b20000', '我人人', '18473743432', ' 反而', '1', 'upload/company/2356c431183b4339ad52600ef1a2f2d2.png', '范德萨发', '1', '2016-04-14 11:56:13', '', '', '', '402881b25412e8d8015412e9d1040002', '\0', '563345756746544444', '34@qq.com');
INSERT INTO `tbl_company` VALUES ('402881b254138377015413910afa0000', '范围而问问', '1645643433434', '份额为', '1', 'upload/company/dfc62ec1dd624eb8ac5710aa6aadb5db.png', '肺胃热', '1', '2016-04-14 14:59:13', '', '', '', '402881b2541383770154139141b20002', '\0', '546435435455544544', '33@qq.com');
INSERT INTO `tbl_company` VALUES ('402881b25413837701541398bc150004', '发文日', '14343435454', '而我', '0', 'upload/company/7b0fa7227cb2409ab03eb89e2f58285e.png', '认为', '1', '2016-04-14 15:07:37', '', '', '', '', '\0', '234656545543444444', '221@qq.com');

-- ----------------------------
-- Table structure for tbl_dept
-- ----------------------------
DROP TABLE IF EXISTS `tbl_dept`;
CREATE TABLE `tbl_dept` (
  `dept_id` varchar(32) NOT NULL,
  `dept_name` varchar(32) NOT NULL,
  `dept_decription` varchar(200) DEFAULT NULL,
  `company_id` varchar(32) NOT NULL,
  `manager_id` varchar(36) DEFAULT NULL,
  `data_status` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `manager` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`dept_id`),
  KEY `FK_TBL_DEPT_REFERENCE_TBL_COMP` (`company_id`),
  KEY `FKFE01E2638D279C` (`manager_id`),
  CONSTRAINT `FKFE01E2638D279C` FOREIGN KEY (`manager_id`) REFERENCES `tbl_user` (`user_id`),
  CONSTRAINT `FK_TBL_DEPT_REFERENCE_TBL_COMP` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tbl_dept
-- ----------------------------
INSERT INTO `tbl_dept` VALUES ('402881b254127cb9015412960a8f0006', 'ewrew', 'fewrew', '0', '1', '0', '2016-04-14 10:25:03', null);

-- ----------------------------
-- Table structure for tbl_log
-- ----------------------------
DROP TABLE IF EXISTS `tbl_log`;
CREATE TABLE `tbl_log` (
  `log_id` varchar(36) NOT NULL,
  `log_MSG` varchar(200) NOT NULL,
  `log_picture` varchar(200) DEFAULT NULL,
  `com_time` int(11) DEFAULT NULL,
  `user_id` varchar(36) NOT NULL,
  `data_status` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `log_progress` varchar(10) DEFAULT NULL,
  `log_creater_id` varchar(36) DEFAULT NULL,
  `company_id` varchar(36) NOT NULL,
  `log_Time` date NOT NULL,
  PRIMARY KEY (`log_id`),
  KEY `FK_TBL_LOG_REFERENCE_TBL_USER` (`user_id`),
  KEY `FKA5AC83437A125536` (`company_id`),
  CONSTRAINT `FKA5AC83437A125536` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`company_id`),
  CONSTRAINT `FK_TBL_LOG_REFERENCE_TBL_USER` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tbl_log
-- ----------------------------
INSERT INTO `tbl_log` VALUES ('402881b0540f759801540fb5b1fc0003', '12121212120', '', '0', '1', '1', '2016-04-13 21:00:46', null, null, '0', '2016-04-13');
INSERT INTO `tbl_log` VALUES ('402881b05412ae23015412af5ffe0000', '21321', '', '1', '402881b25412504f015412537b830000', '1', '2016-04-14 10:52:43', null, null, '0', '2016-04-14');

-- ----------------------------
-- Table structure for tbl_log_detail
-- ----------------------------
DROP TABLE IF EXISTS `tbl_log_detail`;
CREATE TABLE `tbl_log_detail` (
  `log_detail_id` varchar(36) NOT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `task_id` varchar(36) DEFAULT NULL,
  `log_time` int(2) DEFAULT NULL,
  `log_id` varchar(36) NOT NULL,
  PRIMARY KEY (`log_detail_id`),
  KEY `task_id` (`task_id`),
  KEY `log_id` (`log_id`),
  KEY `project_id` (`project_id`),
  CONSTRAINT `tbl_log_detail_ibfk_1` FOREIGN KEY (`task_id`) REFERENCES `tbl_task` (`task_id`),
  CONSTRAINT `tbl_log_detail_ibfk_2` FOREIGN KEY (`log_id`) REFERENCES `tbl_log` (`log_id`),
  CONSTRAINT `tbl_log_detail_ibfk_3` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tbl_log_detail
-- ----------------------------
INSERT INTO `tbl_log_detail` VALUES ('402881b05412ae23015412af60920001', null, '402881b054127328015412748ab30000', '1', '402881b05412ae23015412af5ffe0000');

-- ----------------------------
-- Table structure for tbl_notice
-- ----------------------------
DROP TABLE IF EXISTS `tbl_notice`;
CREATE TABLE `tbl_notice` (
  `notice_id` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `company_id` varchar(36) NOT NULL,
  `notice_createtime` datetime DEFAULT NULL,
  `notice_msg` text,
  `data_status` int(11) DEFAULT NULL,
  `notice_creater_id` varchar(36) DEFAULT NULL,
  `notice_title` varchar(30) NOT NULL,
  `notice_introduction` varchar(200) NOT NULL,
  `notice_level` int(11) DEFAULT NULL,
  `notice_type` int(11) DEFAULT NULL,
  `notice_start_time` date DEFAULT NULL,
  `notice_end_time` date DEFAULT NULL,
  `notice_time` datetime DEFAULT NULL,
  `image` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`notice_id`),
  KEY `FK_TBL_NOTI_REFERENCE_TBL_USER` (`user_id`),
  KEY `FK_TBL_NOTI_REFERENCE_TBL_COMP` (`company_id`),
  CONSTRAINT `FK_TBL_NOTI_REFERENCE_TBL_COMP` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`company_id`),
  CONSTRAINT `FK_TBL_NOTI_REFERENCE_TBL_USER` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tbl_notice
-- ----------------------------
INSERT INTO `tbl_notice` VALUES ('402881b15412866f015413e51b900000', '1', '0', '2016-04-14 16:31:02', '<p>股份而非</p>', '0', '超级管理员', '股份突然他人', '个惹人', null, null, null, null, null, 'upload/notice/7a6285477ecc40f0b5f1d9b8919d989c.png');
INSERT INTO `tbl_notice` VALUES ('402881b25412e8d801541351d3120006', '1', '0', '2016-04-14 13:50:10', '<p>费大幅度发地方</p>', '1', '超级管理员', '阿凡达', '放大', null, null, '2016-04-05', '2016-04-06', null, 'upload/notice/55df3ca75b834a9c94e0aa8df4f10227.jpg');
INSERT INTO `tbl_notice` VALUES ('402881b25413784301541379f48a0000', '1', '0', '2016-04-14 14:34:00', '<p>让我去人人</p>', '1', '超级管理员', '分文未', '玩儿完任务', null, null, '2016-04-08', '2016-04-20', null, 'upload/notice/63ce31b667a34ba78e05e20168e13e9d.jpg');
INSERT INTO `tbl_notice` VALUES ('402881b254138377015413bb50820007', '1', '0', '2016-04-14 15:45:23', '<p>额外热温热污染物</p>', '0', '超级管理员', '范围而', '大二', null, null, null, null, null, 'upload/notice/a9f2a38e91ec447aa3d96dcec56765df.jpg');
INSERT INTO `tbl_notice` VALUES ('402881b254138377015413bb708a0009', '1', '0', '2016-04-14 15:45:31', '<p>额外热舞惹人</p>', '0', '超级管理员', '范围而', '玩儿', null, null, null, null, null, 'upload/notice/b8c7e3b753ce4c66904662e2accefc7f.jpg');
INSERT INTO `tbl_notice` VALUES ('402881b25413f37e015414300a5b0000', '1', '0', '2016-04-14 17:52:53', '<p><img src=\"http://localhost:8080/WorkLogSystem//upload/ueditor/image/20160414/1460627870014089759.png\" title=\"1460627870014089759.png\" alt=\"in_img.png\"/></p>', '0', '超级管理员', 'test111', '', null, null, null, null, null, 'upload/notice/74ebe6ed641645e28431d946a88a42c1.png');
INSERT INTO `tbl_notice` VALUES ('402881b254143adc0154143f23d10000', '1', '0', '2016-04-14 18:09:22', '<p>方为人人</p>', '0', '超级管理员', '范围而', '范围而', null, null, null, null, null, 'upload/notice/a9b37f4cc1b740a6b925de535c301614.png');

-- ----------------------------
-- Table structure for tbl_plan
-- ----------------------------
DROP TABLE IF EXISTS `tbl_plan`;
CREATE TABLE `tbl_plan` (
  `plan_id` varchar(36) NOT NULL,
  `plan_endTime` datetime NOT NULL,
  `plan_realEndTime` datetime DEFAULT NULL,
  `plan_realStartTime` datetime DEFAULT NULL,
  `plan_msg` mediumtext,
  `plan_time` int(11) DEFAULT NULL,
  `plan_class` int(11) DEFAULT NULL,
  `plan_realTime` int(11) DEFAULT NULL,
  `plan_progress` int(11) DEFAULT NULL,
  `data_status` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `project_id` varchar(36) NOT NULL,
  `plan_remarks` varchar(200) DEFAULT NULL,
  `project_child_real_id` varchar(36) NOT NULL,
  `plan_target` varchar(40) DEFAULT NULL,
  `project_progress` varchar(20) NOT NULL,
  `plan_name` varchar(32) NOT NULL,
  `plan_status` int(11) NOT NULL,
  `plan_creater_id` varchar(36) DEFAULT NULL,
  `plan_createTime` datetime NOT NULL,
  `plan_manager_id` varchar(36) NOT NULL,
  `plan_startTime` datetime NOT NULL,
  PRIMARY KEY (`plan_id`),
  KEY `FK_TBL_PLAN_REFERENCE_TBL_PROJ1` (`project_id`),
  KEY `FK_TBL_PLAN_REFERENCE_TBL_PROJ2` (`project_child_real_id`),
  KEY `FKFE5AB0A8BF58E72` (`plan_manager_id`),
  KEY `FKFE5AB0A48E6EE89` (`plan_creater_id`),
  CONSTRAINT `FKFE5AB0A48E6EE89` FOREIGN KEY (`plan_creater_id`) REFERENCES `tbl_user` (`user_id`),
  CONSTRAINT `FKFE5AB0A8BF58E72` FOREIGN KEY (`plan_manager_id`) REFERENCES `tbl_user` (`user_id`),
  CONSTRAINT `FK_TBL_PLAN_REFERENCE_TBL_PROJ1` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`project_id`),
  CONSTRAINT `FK_TBL_PLAN_REFERENCE_TBL_PROJ2` FOREIGN KEY (`project_child_real_id`) REFERENCES `tbl_project_child` (`project_child_real_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tbl_plan
-- ----------------------------
INSERT INTO `tbl_plan` VALUES ('402881b0541437cb015414468d140005', '2016-04-01 18:17:00', '2016-04-29 18:17:21', '2016-04-01 18:17:24', 'test1', '0', '0', null, null, '1', '2016-04-14 18:17:28', '402881b0541437cb0154144441250000', 'test1', '402881b0541437cb01541445bab20003', 'test1', '30', 'test1', '1', '1', '2016-04-14 18:17:28', '1', '2016-04-01 18:17:00');

-- ----------------------------
-- Table structure for tbl_plan_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_plan_user`;
CREATE TABLE `tbl_plan_user` (
  `user_id` varchar(36) NOT NULL,
  `plan_id` varchar(36) NOT NULL,
  PRIMARY KEY (`user_id`,`plan_id`),
  KEY `FK_TBL_PLAN_REFERENCE_TBL_PLAN` (`plan_id`),
  CONSTRAINT `FK_TBL_PLAN_REFERENCE_TBL_PLAN` FOREIGN KEY (`plan_id`) REFERENCES `tbl_plan` (`plan_id`),
  CONSTRAINT `FK_TBL_PLAN_REFERENCE_TBL_USER` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tbl_plan_user
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_privilege
-- ----------------------------
DROP TABLE IF EXISTS `tbl_privilege`;
CREATE TABLE `tbl_privilege` (
  `privilege_id` varchar(36) NOT NULL,
  `privilege_name` varchar(36) NOT NULL,
  `privilege_description` varchar(200) DEFAULT NULL,
  `parent_privilege_id` varchar(36) DEFAULT NULL,
  `data_status` int(1) NOT NULL,
  `code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`privilege_id`),
  KEY `FK1F179B708B1F472B` (`parent_privilege_id`),
  CONSTRAINT `FK1F179B708B1F472B` FOREIGN KEY (`parent_privilege_id`) REFERENCES `tbl_privilege` (`privilege_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tbl_privilege
-- ----------------------------
INSERT INTO `tbl_privilege` VALUES ('0', '一级菜单', '', null, '1', '');
INSERT INTO `tbl_privilege` VALUES ('1', '项目管理', '管理项目的功能', '0', '1', 'project');
INSERT INTO `tbl_privilege` VALUES ('1-1', '项目列表', '', '1', '1', 'project_show');
INSERT INTO `tbl_privilege` VALUES ('1-2', '项目新增', '项目新增', '1', '1', 'project_add');
INSERT INTO `tbl_privilege` VALUES ('1-3', '项目编辑', '项目编辑', '1', '1', 'project_edit');
INSERT INTO `tbl_privilege` VALUES ('1-4', '项目成员', '查看项目成员', '1', '1', 'project_manager');
INSERT INTO `tbl_privilege` VALUES ('1-5', '项目删除', '删除项目', '1', '1', 'project_delete');
INSERT INTO `tbl_privilege` VALUES ('1-6', '项目计划', '查看项目计划', '1', '1', 'project_getplan');
INSERT INTO `tbl_privilege` VALUES ('1-7', '定时报告', '查看定时报告', '1', '1', 'project_timeReport');
INSERT INTO `tbl_privilege` VALUES ('1-8', '统计分析', '查看统计分析', '1', '1', 'project_analysis');
INSERT INTO `tbl_privilege` VALUES ('10', '操作日志', null, '0', '1', 'changelog');
INSERT INTO `tbl_privilege` VALUES ('10-1', '操作日志查看', null, '10', '1', 'changelog_show');
INSERT INTO `tbl_privilege` VALUES ('2', '公司管理', '公司管理', '0', '1', 'company');
INSERT INTO `tbl_privilege` VALUES ('2-1', '公司列表', null, '2', '1', 'company_show');
INSERT INTO `tbl_privilege` VALUES ('2-2', '添加公司', '添加公司', '2', '1', 'company_add');
INSERT INTO `tbl_privilege` VALUES ('2-3', '编辑公司', '编辑公司', '2', '1', 'company_edit');
INSERT INTO `tbl_privilege` VALUES ('2-4', '审核公司', null, '2', '1', 'company_audit');
INSERT INTO `tbl_privilege` VALUES ('2-5', '删除公司', '删除公司', '2', '1', 'company_delete');
INSERT INTO `tbl_privilege` VALUES ('2-6', '冻结公司', '冻结公司公司', '2', '1', 'company_freeze');
INSERT INTO `tbl_privilege` VALUES ('2-7', '解冻公司', '解冻公司', '2', '1', 'company_notfreeze');
INSERT INTO `tbl_privilege` VALUES ('3', '用户管理', '', '0', '1', 'user');
INSERT INTO `tbl_privilege` VALUES ('3-1', '用户列表', null, '3', '1', 'user_show');
INSERT INTO `tbl_privilege` VALUES ('3-2', '用户新增', null, '3', '1', 'user_add');
INSERT INTO `tbl_privilege` VALUES ('3-3', '用户编辑', null, '3', '1', 'user_edit');
INSERT INTO `tbl_privilege` VALUES ('3-4', '用户删除', null, '3', '1', 'user_delete');
INSERT INTO `tbl_privilege` VALUES ('4', '部门管理', null, '0', '1', 'dept');
INSERT INTO `tbl_privilege` VALUES ('4-1', '部门列表', null, '4', '1', 'dept_show');
INSERT INTO `tbl_privilege` VALUES ('4-2', '部门新增', null, '4', '1', 'dept_add');
INSERT INTO `tbl_privilege` VALUES ('4-3', '部门编辑', null, '4', '1', 'dept_edit');
INSERT INTO `tbl_privilege` VALUES ('4-4', '部门删除', null, '4', '1', 'dept_delete');
INSERT INTO `tbl_privilege` VALUES ('5', '角色管理', null, '0', '1', 'role');
INSERT INTO `tbl_privilege` VALUES ('5-1', '角色列表', null, '5', '1', 'role_show');
INSERT INTO `tbl_privilege` VALUES ('5-2', '角色新增', null, '5', '1', 'role_add');
INSERT INTO `tbl_privilege` VALUES ('5-3', '角色编辑', null, '5', '1', 'role_edit');
INSERT INTO `tbl_privilege` VALUES ('5-4', '角色删除', null, '5', '1', 'role_delete');
INSERT INTO `tbl_privilege` VALUES ('6', '公告管理', null, '0', '1', 'notice');
INSERT INTO `tbl_privilege` VALUES ('6-1', '公告列表', null, '6', '1', 'notice_show');
INSERT INTO `tbl_privilege` VALUES ('6-2', '公告新增', null, '6', '1', 'notice_add');
INSERT INTO `tbl_privilege` VALUES ('6-3', '公告编辑', null, '6', '1', 'notice_edit');
INSERT INTO `tbl_privilege` VALUES ('6-4', '公告删除', null, '6', '1', 'notice_delete');
INSERT INTO `tbl_privilege` VALUES ('7', '个人日志管理', null, '0', '1', 'log');
INSERT INTO `tbl_privilege` VALUES ('7-1', '个人日志列表', null, '7', '1', 'log_show');
INSERT INTO `tbl_privilege` VALUES ('7-2', '个人日志新增', null, '7', '1', 'log_add');
INSERT INTO `tbl_privilege` VALUES ('7-3', '个人日志编辑', null, '7', '1', 'log_edit');
INSERT INTO `tbl_privilege` VALUES ('7-4', '个人日志删除', null, '7', '1', 'log_delete');
INSERT INTO `tbl_privilege` VALUES ('8', '任务管理', null, '0', '1', 'task');
INSERT INTO `tbl_privilege` VALUES ('8-1', '任务列表', null, '8', '1', 'task_show');
INSERT INTO `tbl_privilege` VALUES ('8-2', '任务新增', null, '8', '1', 'task_add');
INSERT INTO `tbl_privilege` VALUES ('8-3', '任务编辑', null, '8', '1', 'task_edit');
INSERT INTO `tbl_privilege` VALUES ('8-4', '任务删除', null, '8', '1', 'task_delete');
INSERT INTO `tbl_privilege` VALUES ('9', '权限管理', null, '8', '1', 'privilege');

-- ----------------------------
-- Table structure for tbl_project
-- ----------------------------
DROP TABLE IF EXISTS `tbl_project`;
CREATE TABLE `tbl_project` (
  `project_id` varchar(36) NOT NULL,
  `company_id` varchar(36) NOT NULL,
  `project_progress` varchar(36) NOT NULL,
  `project_StartTime` datetime NOT NULL,
  `project_endTime` datetime DEFAULT NULL,
  `project_realStartTime` datetime DEFAULT NULL,
  `project_realEndTime` datetime DEFAULT NULL,
  `project_target` varchar(36) DEFAULT NULL,
  `project_status` int(11) NOT NULL,
  `data_status` int(11) NOT NULL,
  `project_remaks` text,
  `project_name` varchar(32) NOT NULL,
  `project_creater_id` varchar(36) DEFAULT NULL,
  `project_manager_id` varchar(36) NOT NULL,
  `project_manager` varchar(20) DEFAULT NULL,
  `project_realTime` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`project_id`),
  KEY `FK_TBL_PROJ_REFERENCE_TBL_COMP` (`company_id`),
  KEY `FK2BD1398C598D899` (`project_creater_id`),
  KEY `FK2BD13988A77882` (`project_manager_id`),
  CONSTRAINT `FK2BD13988A77882` FOREIGN KEY (`project_manager_id`) REFERENCES `tbl_user` (`user_id`),
  CONSTRAINT `FK2BD1398C598D899` FOREIGN KEY (`project_creater_id`) REFERENCES `tbl_user` (`user_id`),
  CONSTRAINT `FK_TBL_PROJ_REFERENCE_TBL_COMP` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tbl_project
-- ----------------------------
INSERT INTO `tbl_project` VALUES ('402881b0541437cb0154144441250000', '0', '0', '2016-04-14 18:14:00', '2016-04-14 18:14:00', '2016-04-14 18:14:49', '2016-04-14 18:14:55', 'test1', '0', '1', 'test1', 'test1', '1', '1', null, null, '2016-04-14 18:14:58');
INSERT INTO `tbl_project` VALUES ('4028b88154189efe015418a137fb0001', '402881b254124bcd0154124df06f0000', '0', '2016-04-15 14:34:00', '2016-04-15 14:34:00', '2016-04-15 14:34:52', null, 'sdfsdf', '0', '1', '地方机构代付dfgdfg', 'test', '402881b254129c220154129c77290000', '402881b254129c220154129c77290000', null, null, '2016-04-15 14:34:59');
INSERT INTO `tbl_project` VALUES ('4028b88154189efe015418a86d760006', '402881b254124bcd0154124df06f0000', '0', '2016-04-15 14:42:00', '2016-04-15 14:42:00', null, null, 'fdgd', '0', '1', 'dfgsdf', 'tested', '402881b254129c220154129c77290000', '402881b254129c220154129c77290000', null, null, '2016-04-15 14:42:52');

-- ----------------------------
-- Table structure for tbl_project_child
-- ----------------------------
DROP TABLE IF EXISTS `tbl_project_child`;
CREATE TABLE `tbl_project_child` (
  `project_child_id` varchar(36) DEFAULT NULL,
  `project_father_id` varchar(36) DEFAULT NULL,
  `project_name` varchar(36) NOT NULL,
  `project_level` int(11) DEFAULT NULL,
  `project_id` varchar(36) NOT NULL,
  `project_child_starttime` datetime NOT NULL,
  `project_child_endtime` datetime NOT NULL,
  `project_child_target` varchar(500) NOT NULL,
  `project_child_status` int(11) NOT NULL,
  `project_child_realendtime` datetime DEFAULT NULL,
  `data_status` int(11) NOT NULL,
  `crete_time` datetime NOT NULL,
  `project_child_real_id` varchar(36) NOT NULL,
  `task_priority` int(11) DEFAULT NULL,
  `project_child_realstarttime` datetime DEFAULT NULL,
  `plan_time` int(11) DEFAULT NULL,
  `real_time` int(11) DEFAULT NULL,
  `responsible_id` varchar(36) NOT NULL,
  `project_progress` varchar(10) DEFAULT NULL,
  `creater_id` varchar(36) NOT NULL,
  PRIMARY KEY (`project_child_real_id`),
  KEY `FK_TBL_PROJ_REFERENCE_TBL_PROJ` (`project_id`),
  KEY `FK67D659B5C07E87B3` (`creater_id`),
  KEY `FK67D659B56156BFB3` (`responsible_id`),
  CONSTRAINT `FK67D659B56156BFB3` FOREIGN KEY (`responsible_id`) REFERENCES `tbl_user` (`user_id`),
  CONSTRAINT `FK67D659B5C07E87B3` FOREIGN KEY (`creater_id`) REFERENCES `tbl_user` (`user_id`),
  CONSTRAINT `FK_TBL_PROJ_REFERENCE_TBL_PROJ` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tbl_project_child
-- ----------------------------
INSERT INTO `tbl_project_child` VALUES (null, null, 'test1', '0', '402881b0541437cb0154144441250000', '2016-04-14 18:16:00', '2016-04-14 18:16:00', 'test1', '0', '2016-04-14 18:16:27', '1', '2016-04-14 18:16:34', '402881b0541437cb01541445bab20003', null, '2016-04-14 18:16:24', '1', null, '1', '0', '1');

-- ----------------------------
-- Table structure for tbl_records
-- ----------------------------
DROP TABLE IF EXISTS `tbl_records`;
CREATE TABLE `tbl_records` (
  `recode_id` varchar(36) NOT NULL,
  `recode_msg` text,
  `recode_operate` datetime DEFAULT NULL,
  `data_status` int(11) NOT NULL,
  `project_id` varchar(36) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `plan_id` varchar(36) NOT NULL,
  `project_child_real_id` varchar(36) NOT NULL,
  `change_id` varchar(36) NOT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`recode_id`),
  KEY `FK_TBL_RECO_REFERENCE_TBL_PLAN` (`plan_id`),
  KEY `FK_TBL_RECO_REFERENCE_TBL_PROJ3` (`project_id`),
  KEY `FK_TBL_RECO_REFERENCE_TBL_PROJ4` (`project_child_real_id`),
  CONSTRAINT `FK_TBL_RECO_REFERENCE_TBL_PLAN` FOREIGN KEY (`plan_id`) REFERENCES `tbl_plan` (`plan_id`),
  CONSTRAINT `FK_TBL_RECO_REFERENCE_TBL_PROJ3` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`project_id`),
  CONSTRAINT `FK_TBL_RECO_REFERENCE_TBL_PROJ4` FOREIGN KEY (`project_child_real_id`) REFERENCES `tbl_project_child` (`project_child_real_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tbl_records
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_reportwarn
-- ----------------------------
DROP TABLE IF EXISTS `tbl_reportwarn`;
CREATE TABLE `tbl_reportwarn` (
  `reportwarn_id` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `data_status` int(11) DEFAULT NULL,
  `task_id` varchar(36) DEFAULT NULL,
  `plan_id` varchar(36) DEFAULT NULL,
  `log_id` varchar(36) DEFAULT NULL,
  `type` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`reportwarn_id`),
  KEY `FK_TBL_REPO_REFERENCE_TBL_USER` (`user_id`),
  KEY `FK99A620DB13335C7E` (`task_id`),
  KEY `FK99A620DB5161C9FE` (`plan_id`),
  KEY `FK99A620DB2543B9D6` (`log_id`),
  CONSTRAINT `FK99A620DB13335C7E` FOREIGN KEY (`task_id`) REFERENCES `tbl_task` (`task_id`),
  CONSTRAINT `FK99A620DB2543B9D6` FOREIGN KEY (`log_id`) REFERENCES `tbl_log` (`log_id`),
  CONSTRAINT `FK99A620DB5161C9FE` FOREIGN KEY (`plan_id`) REFERENCES `tbl_plan` (`plan_id`),
  CONSTRAINT `FK_TBL_REPO_REFERENCE_TBL_USER` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tbl_reportwarn
-- ----------------------------
INSERT INTO `tbl_reportwarn` VALUES ('402881b0541447a20154144c8aee0004', '402881b2541383770154139141b20002', '2016-04-14 18:24:01', '1', '402881b054127328015412748ab30000', null, null, '0');
INSERT INTO `tbl_reportwarn` VALUES ('402881b0541447a20154144c8aee0005', '1', '2016-04-14 18:24:01', '1', null, null, '402881b0540f759801540fb5b1fc0003', '2');
INSERT INTO `tbl_reportwarn` VALUES ('402881b0541447a20154144e7de50006', '1', '2016-04-14 18:26:08', '1', '402881b054127328015412748ab30000', null, null, '0');
INSERT INTO `tbl_reportwarn` VALUES ('402881b0541447a20154144e7de50007', '1', '2016-04-14 18:26:08', '1', null, '402881b0541437cb015414468d140005', null, '1');
INSERT INTO `tbl_reportwarn` VALUES ('402881b0541447a20154144e7de50008', '1', '2016-04-14 18:26:08', '1', null, null, '402881b0540f759801540fb5b1fc0003', '2');
INSERT INTO `tbl_reportwarn` VALUES ('402881b0541447a20154144f513f0009', '1', '2016-04-14 18:27:03', '1', '402881b054127328015412748ab30000', null, null, '0');
INSERT INTO `tbl_reportwarn` VALUES ('402881b0541447a20154144f513f000a', '1', '2016-04-14 18:27:03', '1', null, '402881b0541437cb015414468d140005', null, '1');
INSERT INTO `tbl_reportwarn` VALUES ('402881b0541447a20154144f5141000b', '1', '2016-04-14 18:27:03', '1', null, null, '402881b0540f759801540fb5b1fc0003', '2');
INSERT INTO `tbl_reportwarn` VALUES ('402881b0541447a2015414503017000c', '1', '2016-04-14 18:28:00', '1', '402881b054127328015412748ab30000', null, null, '0');
INSERT INTO `tbl_reportwarn` VALUES ('402881b0541447a2015414503017000d', '1', '2016-04-14 18:28:00', '1', null, '402881b0541437cb015414468d140005', null, '1');
INSERT INTO `tbl_reportwarn` VALUES ('402881b0541447a2015414503017000e', '1', '2016-04-14 18:28:00', '1', null, null, '402881b0540f759801540fb5b1fc0003', '2');
INSERT INTO `tbl_reportwarn` VALUES ('402881b0541447a2015414511a4f000f', '1', '2016-04-14 18:29:00', '1', '402881b054127328015412748ab30000', null, null, '0');
INSERT INTO `tbl_reportwarn` VALUES ('402881b0541447a2015414511a4f0010', '1', '2016-04-14 18:29:00', '1', null, '402881b0541437cb015414468d140005', null, '1');
INSERT INTO `tbl_reportwarn` VALUES ('402881b0541447a2015414511a4f0011', '1', '2016-04-14 18:29:00', '1', null, null, '402881b0540f759801540fb5b1fc0003', '2');
INSERT INTO `tbl_reportwarn` VALUES ('402881b454141a6d015414520549000c', '1', '2016-04-14 18:30:00', '1', '402881b054127328015412748ab30000', null, null, '0');
INSERT INTO `tbl_reportwarn` VALUES ('402881b454141a6d015414520549000d', '1', '2016-04-14 18:30:00', '1', null, null, '402881b0540f759801540fb5b1fc0003', '2');
INSERT INTO `tbl_reportwarn` VALUES ('402881b454141a6d0154145b2d15000e', '1', '2016-04-14 18:40:00', '1', '402881b054127328015412748ab30000', null, null, '0');
INSERT INTO `tbl_reportwarn` VALUES ('402881b454141a6d0154145b2d15000f', '1', '2016-04-14 18:40:00', '1', null, null, '402881b0540f759801540fb5b1fc0003', '2');
INSERT INTO `tbl_reportwarn` VALUES ('402881b454141a6d0154146454940010', '1', '2016-04-14 18:50:00', '1', '402881b054127328015412748ab30000', null, null, '0');
INSERT INTO `tbl_reportwarn` VALUES ('402881b454141a6d0154146454940011', '1', '2016-04-14 18:50:00', '1', null, null, '402881b0540f759801540fb5b1fc0003', '2');
INSERT INTO `tbl_reportwarn` VALUES ('402881b454141a6d0154146d7c6a0012', '1', '2016-04-14 19:00:00', '1', '402881b054127328015412748ab30000', null, null, '0');
INSERT INTO `tbl_reportwarn` VALUES ('402881b454141a6d0154146d7c6a0013', '1', '2016-04-14 19:00:00', '1', null, null, '402881b0540f759801540fb5b1fc0003', '2');
INSERT INTO `tbl_reportwarn` VALUES ('402881b454141a6d01541476a4400014', '1', '2016-04-14 19:10:00', '1', '402881b054127328015412748ab30000', null, null, '0');
INSERT INTO `tbl_reportwarn` VALUES ('402881b454141a6d01541476a4400015', '1', '2016-04-14 19:10:00', '1', null, null, '402881b0540f759801540fb5b1fc0003', '2');
INSERT INTO `tbl_reportwarn` VALUES ('402881b454141a6d0154147fcc160016', '1', '2016-04-14 19:20:00', '1', '402881b054127328015412748ab30000', null, null, '0');
INSERT INTO `tbl_reportwarn` VALUES ('402881b454141a6d0154147fcc160017', '1', '2016-04-14 19:20:00', '1', null, null, '402881b0540f759801540fb5b1fc0003', '2');
INSERT INTO `tbl_reportwarn` VALUES ('4028b8815413964401541448dd470026', '1', '2016-04-14 18:20:00', '1', '402881b054127328015412748ab30000', null, null, '0');
INSERT INTO `tbl_reportwarn` VALUES ('4028b8815413964401541448dd470027', '1', '2016-04-14 18:20:00', '1', null, null, '402881b0540f759801540fb5b1fc0003', '2');
INSERT INTO `tbl_reportwarn` VALUES ('4028b881541396440154145205130028', '1', '2016-04-14 18:30:00', '1', '402881b054127328015412748ab30000', null, null, '0');
INSERT INTO `tbl_reportwarn` VALUES ('4028b881541396440154145205130029', '1', '2016-04-14 18:30:00', '1', null, null, '402881b0540f759801540fb5b1fc0003', '2');
INSERT INTO `tbl_reportwarn` VALUES ('4028b881541396440154145b2cc6002a', '1', '2016-04-14 18:40:00', '1', '402881b054127328015412748ab30000', null, null, '0');
INSERT INTO `tbl_reportwarn` VALUES ('4028b881541396440154145b2cc6002b', '1', '2016-04-14 18:40:00', '1', null, null, '402881b0540f759801540fb5b1fc0003', '2');
INSERT INTO `tbl_reportwarn` VALUES ('4028b8815413964401541464549c002c', '1', '2016-04-14 18:50:00', '1', '402881b054127328015412748ab30000', null, null, '0');
INSERT INTO `tbl_reportwarn` VALUES ('4028b8815413964401541464549c002d', '1', '2016-04-14 18:50:00', '1', null, null, '402881b0540f759801540fb5b1fc0003', '2');
INSERT INTO `tbl_reportwarn` VALUES ('4028b881541396440154146d7c40002e', '1', '2016-04-14 19:00:00', '1', '402881b054127328015412748ab30000', null, null, '0');
INSERT INTO `tbl_reportwarn` VALUES ('4028b881541396440154146d7c40002f', '1', '2016-04-14 19:00:00', '1', null, null, '402881b0540f759801540fb5b1fc0003', '2');
INSERT INTO `tbl_reportwarn` VALUES ('4028b8815413964401541476a3fe0030', '1', '2016-04-14 19:10:00', '1', '402881b054127328015412748ab30000', null, null, '0');
INSERT INTO `tbl_reportwarn` VALUES ('4028b8815413964401541476a3fe0031', '1', '2016-04-14 19:10:00', '1', null, null, '402881b0540f759801540fb5b1fc0003', '2');
INSERT INTO `tbl_reportwarn` VALUES ('4028b881541396440154147fcbec0032', '1', '2016-04-14 19:20:00', '1', '402881b054127328015412748ab30000', null, null, '0');
INSERT INTO `tbl_reportwarn` VALUES ('4028b881541396440154147fcbec0033', '1', '2016-04-14 19:20:00', '1', null, null, '402881b0540f759801540fb5b1fc0003', '2');

-- ----------------------------
-- Table structure for tbl_role
-- ----------------------------
DROP TABLE IF EXISTS `tbl_role`;
CREATE TABLE `tbl_role` (
  `role_id` varchar(36) NOT NULL,
  `role_name` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL,
  `company_id` varchar(36) NOT NULL,
  `data_status` int(11) NOT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `is_effect` varchar(1) NOT NULL,
  `data_privilege` varchar(1) NOT NULL,
  PRIMARY KEY (`role_id`),
  KEY `FK_TBL_ROLE_REFERENCE_TBL_COMP` (`company_id`),
  CONSTRAINT `FK_TBL_ROLE_REFERENCE_TBL_COMP` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tbl_role
-- ----------------------------
INSERT INTO `tbl_role` VALUES ('0', '超级管理员', '拥有所有权限。', '0', '1', '2016-03-21 09:26:23', '1', '1');
INSERT INTO `tbl_role` VALUES ('1', '公司管理员', '公司的管理人员，拥有部分权限。', '0', '1', '2016-03-21 10:05:09', '1', '1');
INSERT INTO `tbl_role` VALUES ('2', '平台用户', '普通的平台用户，管理人员，拥有部分权限。', '0', '1', '2016-03-21 10:05:22', '1', '1');
INSERT INTO `tbl_role` VALUES ('3', '公司用户', '', '0', '1', '2016-03-29 12:15:30', '0', '0');
INSERT INTO `tbl_role` VALUES ('402881b054145c160154147eddb90000', 'test1', '321321', '402881b254138377015413910afa0000', '1', '2016-04-14 19:18:59', '1', '0');
INSERT INTO `tbl_role` VALUES ('402881b054145c160154147efaa40002', '402881b2541383770154139141b20002', '402881b2541383770154139141b20002', '402881b254138377015413910afa0000', '1', '2016-04-14 19:19:06', '1', '0');

-- ----------------------------
-- Table structure for tbl_role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `tbl_role_privilege`;
CREATE TABLE `tbl_role_privilege` (
  `privilege_id` varchar(36) NOT NULL,
  `role_id` varchar(36) NOT NULL,
  PRIMARY KEY (`privilege_id`,`role_id`),
  KEY `FK_TBL_ROLE_REFERENCE_TBL_ROLE` (`role_id`),
  CONSTRAINT `FK_TBL_ROLE_REFERENCE_TBL_PRIV` FOREIGN KEY (`privilege_id`) REFERENCES `tbl_privilege` (`privilege_id`),
  CONSTRAINT `FK_TBL_ROLE_REFERENCE_TBL_ROLE` FOREIGN KEY (`role_id`) REFERENCES `tbl_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tbl_role_privilege
-- ----------------------------
INSERT INTO `tbl_role_privilege` VALUES ('1', '0');
INSERT INTO `tbl_role_privilege` VALUES ('1-1', '0');
INSERT INTO `tbl_role_privilege` VALUES ('1-2', '0');
INSERT INTO `tbl_role_privilege` VALUES ('1-3', '0');
INSERT INTO `tbl_role_privilege` VALUES ('1-4', '0');
INSERT INTO `tbl_role_privilege` VALUES ('1-5', '0');
INSERT INTO `tbl_role_privilege` VALUES ('1-6', '0');
INSERT INTO `tbl_role_privilege` VALUES ('1-7', '0');
INSERT INTO `tbl_role_privilege` VALUES ('1-8', '0');
INSERT INTO `tbl_role_privilege` VALUES ('10', '0');
INSERT INTO `tbl_role_privilege` VALUES ('10-1', '0');
INSERT INTO `tbl_role_privilege` VALUES ('2', '0');
INSERT INTO `tbl_role_privilege` VALUES ('2-1', '0');
INSERT INTO `tbl_role_privilege` VALUES ('2-2', '0');
INSERT INTO `tbl_role_privilege` VALUES ('2-3', '0');
INSERT INTO `tbl_role_privilege` VALUES ('2-4', '0');
INSERT INTO `tbl_role_privilege` VALUES ('2-5', '0');
INSERT INTO `tbl_role_privilege` VALUES ('2-6', '0');
INSERT INTO `tbl_role_privilege` VALUES ('2-7', '0');
INSERT INTO `tbl_role_privilege` VALUES ('3', '0');
INSERT INTO `tbl_role_privilege` VALUES ('3-1', '0');
INSERT INTO `tbl_role_privilege` VALUES ('3-2', '0');
INSERT INTO `tbl_role_privilege` VALUES ('3-3', '0');
INSERT INTO `tbl_role_privilege` VALUES ('3-4', '0');
INSERT INTO `tbl_role_privilege` VALUES ('4', '0');
INSERT INTO `tbl_role_privilege` VALUES ('4-1', '0');
INSERT INTO `tbl_role_privilege` VALUES ('4-2', '0');
INSERT INTO `tbl_role_privilege` VALUES ('4-3', '0');
INSERT INTO `tbl_role_privilege` VALUES ('4-4', '0');
INSERT INTO `tbl_role_privilege` VALUES ('5', '0');
INSERT INTO `tbl_role_privilege` VALUES ('5-1', '0');
INSERT INTO `tbl_role_privilege` VALUES ('5-2', '0');
INSERT INTO `tbl_role_privilege` VALUES ('5-3', '0');
INSERT INTO `tbl_role_privilege` VALUES ('5-4', '0');
INSERT INTO `tbl_role_privilege` VALUES ('6', '0');
INSERT INTO `tbl_role_privilege` VALUES ('6-1', '0');
INSERT INTO `tbl_role_privilege` VALUES ('6-2', '0');
INSERT INTO `tbl_role_privilege` VALUES ('6-3', '0');
INSERT INTO `tbl_role_privilege` VALUES ('6-4', '0');
INSERT INTO `tbl_role_privilege` VALUES ('7', '0');
INSERT INTO `tbl_role_privilege` VALUES ('7-1', '0');
INSERT INTO `tbl_role_privilege` VALUES ('7-2', '0');
INSERT INTO `tbl_role_privilege` VALUES ('7-3', '0');
INSERT INTO `tbl_role_privilege` VALUES ('7-4', '0');
INSERT INTO `tbl_role_privilege` VALUES ('8', '0');
INSERT INTO `tbl_role_privilege` VALUES ('8-1', '0');
INSERT INTO `tbl_role_privilege` VALUES ('8-2', '0');
INSERT INTO `tbl_role_privilege` VALUES ('8-3', '0');
INSERT INTO `tbl_role_privilege` VALUES ('8-4', '0');
INSERT INTO `tbl_role_privilege` VALUES ('9', '0');
INSERT INTO `tbl_role_privilege` VALUES ('1', '1');
INSERT INTO `tbl_role_privilege` VALUES ('1-1', '1');
INSERT INTO `tbl_role_privilege` VALUES ('1-2', '1');
INSERT INTO `tbl_role_privilege` VALUES ('1-3', '1');
INSERT INTO `tbl_role_privilege` VALUES ('1-4', '1');
INSERT INTO `tbl_role_privilege` VALUES ('1-5', '1');
INSERT INTO `tbl_role_privilege` VALUES ('1-6', '1');
INSERT INTO `tbl_role_privilege` VALUES ('1-7', '1');
INSERT INTO `tbl_role_privilege` VALUES ('1-8', '1');
INSERT INTO `tbl_role_privilege` VALUES ('10', '1');
INSERT INTO `tbl_role_privilege` VALUES ('10-1', '1');
INSERT INTO `tbl_role_privilege` VALUES ('2', '1');
INSERT INTO `tbl_role_privilege` VALUES ('2-1', '1');
INSERT INTO `tbl_role_privilege` VALUES ('2-3', '1');
INSERT INTO `tbl_role_privilege` VALUES ('3', '1');
INSERT INTO `tbl_role_privilege` VALUES ('3-1', '1');
INSERT INTO `tbl_role_privilege` VALUES ('3-2', '1');
INSERT INTO `tbl_role_privilege` VALUES ('3-3', '1');
INSERT INTO `tbl_role_privilege` VALUES ('3-4', '1');
INSERT INTO `tbl_role_privilege` VALUES ('4', '1');
INSERT INTO `tbl_role_privilege` VALUES ('4-1', '1');
INSERT INTO `tbl_role_privilege` VALUES ('4-2', '1');
INSERT INTO `tbl_role_privilege` VALUES ('4-3', '1');
INSERT INTO `tbl_role_privilege` VALUES ('4-4', '1');
INSERT INTO `tbl_role_privilege` VALUES ('5', '1');
INSERT INTO `tbl_role_privilege` VALUES ('5-1', '1');
INSERT INTO `tbl_role_privilege` VALUES ('5-2', '1');
INSERT INTO `tbl_role_privilege` VALUES ('5-3', '1');
INSERT INTO `tbl_role_privilege` VALUES ('5-4', '1');
INSERT INTO `tbl_role_privilege` VALUES ('6', '1');
INSERT INTO `tbl_role_privilege` VALUES ('6-1', '1');
INSERT INTO `tbl_role_privilege` VALUES ('6-2', '1');
INSERT INTO `tbl_role_privilege` VALUES ('6-3', '1');
INSERT INTO `tbl_role_privilege` VALUES ('6-4', '1');
INSERT INTO `tbl_role_privilege` VALUES ('7', '1');
INSERT INTO `tbl_role_privilege` VALUES ('7-1', '1');
INSERT INTO `tbl_role_privilege` VALUES ('7-2', '1');
INSERT INTO `tbl_role_privilege` VALUES ('7-3', '1');
INSERT INTO `tbl_role_privilege` VALUES ('7-4', '1');
INSERT INTO `tbl_role_privilege` VALUES ('8', '1');
INSERT INTO `tbl_role_privilege` VALUES ('8-1', '1');
INSERT INTO `tbl_role_privilege` VALUES ('8-2', '1');
INSERT INTO `tbl_role_privilege` VALUES ('8-3', '1');
INSERT INTO `tbl_role_privilege` VALUES ('8-4', '1');
INSERT INTO `tbl_role_privilege` VALUES ('9', '1');
INSERT INTO `tbl_role_privilege` VALUES ('6', '3');
INSERT INTO `tbl_role_privilege` VALUES ('6-1', '3');
INSERT INTO `tbl_role_privilege` VALUES ('6-2', '3');
INSERT INTO `tbl_role_privilege` VALUES ('6-3', '3');
INSERT INTO `tbl_role_privilege` VALUES ('6-4', '3');
INSERT INTO `tbl_role_privilege` VALUES ('7', '3');
INSERT INTO `tbl_role_privilege` VALUES ('7-1', '3');
INSERT INTO `tbl_role_privilege` VALUES ('7-2', '3');
INSERT INTO `tbl_role_privilege` VALUES ('7-3', '3');
INSERT INTO `tbl_role_privilege` VALUES ('7-4', '3');
INSERT INTO `tbl_role_privilege` VALUES ('8', '3');
INSERT INTO `tbl_role_privilege` VALUES ('8-1', '3');
INSERT INTO `tbl_role_privilege` VALUES ('8-2', '3');
INSERT INTO `tbl_role_privilege` VALUES ('8-3', '3');
INSERT INTO `tbl_role_privilege` VALUES ('8-4', '3');
INSERT INTO `tbl_role_privilege` VALUES ('9', '3');

-- ----------------------------
-- Table structure for tbl_task
-- ----------------------------
DROP TABLE IF EXISTS `tbl_task`;
CREATE TABLE `tbl_task` (
  `task_id` varchar(36) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `task_MSG` text NOT NULL,
  `task_startTime` datetime NOT NULL,
  `task_endTime` datetime DEFAULT NULL,
  `company_id` varchar(36) DEFAULT NULL,
  `data_status` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  `task_remaks` text NOT NULL,
  `task_level` int(11) DEFAULT NULL,
  `task_time` int(11) DEFAULT NULL,
  `task_target` varchar(100) DEFAULT NULL,
  `is_push` tinyint(1) unsigned DEFAULT NULL,
  `task_progress` varchar(5) DEFAULT NULL,
  `creater_user_id` varchar(36) DEFAULT NULL,
  `task_responsible_id` varchar(36) NOT NULL,
  `task_creater_id` varchar(36) DEFAULT NULL,
  `task_realStartTime` datetime DEFAULT NULL,
  `task_realEndTime` datetime DEFAULT NULL,
  `task_desc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`task_id`),
  KEY `FK_TBL_TASK_REFERENCE_TBL_USER` (`user_id`),
  KEY `FKFE755667A125536` (`company_id`),
  KEY `FKFE755662A523E75` (`creater_user_id`),
  KEY `FKFE75566EA849DAD` (`task_responsible_id`),
  CONSTRAINT `FKFE755667A125536` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`company_id`),
  CONSTRAINT `FKFE75566EA849DAD` FOREIGN KEY (`task_responsible_id`) REFERENCES `tbl_user` (`user_id`),
  CONSTRAINT `FK_TBL_TASK_REFERENCE_TBL_USER` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`),
  CONSTRAINT `FK_TBL_TASK_REFERENCE_TBL_USER1` FOREIGN KEY (`creater_user_id`) REFERENCES `tbl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tbl_task
-- ----------------------------
INSERT INTO `tbl_task` VALUES ('402881b054127328015412748ab30000', null, 'test1', '2016-04-06 00:00:00', '2016-04-21 00:00:00', '0', '1', '2016-04-14 09:48:28', 'test1', '1', '1', 'test1', '1', '0%', '1', '1', null, '2016-04-14 00:00:00', null, 'test1tyujhtgfhyjkgyuki it');
INSERT INTO `tbl_task` VALUES ('402881b05412732801541274e3440001', null, 'test2', '2016-04-15 00:00:00', '2016-04-15 00:00:00', '0', '1', '2016-04-14 09:48:50', 'test2ertgert 沃', '0', '1', 'test2', '0', '10%', '1', '1', null, '2016-04-21 00:00:00', '2016-04-01 00:00:00', 'test2');
INSERT INTO `tbl_task` VALUES ('402881b05412732801541275d8a40002', null, 'test3', '2016-04-11 00:00:00', '2016-04-22 00:00:00', '0', '1', '2016-04-14 09:49:53', 'test3tyutryutru', '0', '1', 'test3', '0', '100%', '1', '1', null, '2016-04-15 00:00:00', '2016-04-23 00:00:00', 'test3');
INSERT INTO `tbl_task` VALUES ('402881b45412742d01541279cb400000', null, 'test3', '2016-04-20 00:00:00', '2016-04-26 00:00:00', '0', '0', '2016-04-14 09:54:12', 'test3', '0', '652', 'test3', '1', '0%', '1', '1', null, null, null, 'test3');

-- ----------------------------
-- Table structure for tbl_tease
-- ----------------------------
DROP TABLE IF EXISTS `tbl_tease`;
CREATE TABLE `tbl_tease` (
  `tease_id` varchar(36) NOT NULL,
  `tease_title` varchar(50) DEFAULT NULL,
  `tease_content` text,
  `tease_part` varchar(50) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `company_id` varchar(36) DEFAULT NULL,
  `data_status` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`tease_id`),
  KEY `fk_user_tease` (`user_id`),
  KEY `fk_company_tease` (`company_id`),
  CONSTRAINT `fk_company_tease` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`company_id`),
  CONSTRAINT `fk_user_tease` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tbl_tease
-- ----------------------------
INSERT INTO `tbl_tease` VALUES ('402881b0541894a20154189c84710000', '111', ' 1111', '1111', '1', '0', '1', '2016-04-15 14:29:51');

-- ----------------------------
-- Table structure for tbl_timereport
-- ----------------------------
DROP TABLE IF EXISTS `tbl_timereport`;
CREATE TABLE `tbl_timereport` (
  `timereport_id` varchar(36) NOT NULL,
  `project_progress` varchar(36) NOT NULL,
  `project_StartTime` date NOT NULL,
  `project_endTime` date DEFAULT NULL,
  `project_realEndTime` date DEFAULT NULL,
  `project_target` varchar(36) DEFAULT NULL,
  `project_status` int(11) NOT NULL,
  `project_remaks` text,
  `project_name` varchar(32) NOT NULL,
  `project_manager` varchar(20) DEFAULT NULL,
  `company_id` varchar(36) DEFAULT NULL,
  `project_realStartTime` datetime DEFAULT NULL,
  `project_realTime` datetime DEFAULT NULL,
  `createTime` datetime NOT NULL,
  PRIMARY KEY (`timereport_id`),
  KEY `FK_TBL_TIME_REFERENCE_TBL_COMP` (`company_id`),
  CONSTRAINT `FK_TBL_TIME_REFERENCE_TBL_COMP` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tbl_timereport
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_user
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user`;
CREATE TABLE `tbl_user` (
  `user_id` varchar(36) NOT NULL,
  `dept_id` varchar(36) DEFAULT NULL,
  `company_id` varchar(36) NOT NULL,
  `name` varchar(64) NOT NULL,
  `image` varchar(200) DEFAULT NULL,
  `username` varchar(64) NOT NULL,
  `password` varchar(128) NOT NULL,
  `mobile` varchar(20) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `last_login_time` datetime DEFAULT NULL,
  `isUserPlatform` tinyint(1) NOT NULL,
  `data_status` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `weichat` varchar(20) DEFAULT NULL,
  `sex` smallint(6) DEFAULT NULL,
  `idcard` varchar(18) DEFAULT NULL,
  `user_type` varchar(1) DEFAULT NULL,
  `token` varchar(50) DEFAULT NULL,
  `openId` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  KEY `FK_TBL_USER_REFERENCE_TBL_COMP` (`company_id`),
  KEY `FKFE80BACCB75A47E` (`dept_id`),
  CONSTRAINT `FK_TBL_USER_REFERENCE_TBL_COMP` FOREIGN KEY (`company_id`) REFERENCES `tbl_company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tbl_user
-- ----------------------------
INSERT INTO `tbl_user` VALUES ('1', '', '0', '超级管理员', 'upload/user/aa5a07f5b0fc4f5fbcc1043b6cee9ff3.png', 'ptAdmin', 'e10adc3949ba59abbe56e057f20f883e', '12331233213', '123456@qq.com', null, '2016-04-15 15:39:01', '1', '1', '2016-03-25 19:09:05', '', '0', '123456789012345678', '2', null, null);
INSERT INTO `tbl_user` VALUES ('402881b25412504f015412537b830000', null, '402881b254124bcd0154124df06f0000', 'fwerr', '', '15684354454', '6eb27a0e38fc9014734d02391d6252b8', '15684354454', 'erwerw@qq.com', null, null, '0', '0', '2016-04-14 09:12:21', '', null, '383789988989933333', '2', null, null);
INSERT INTO `tbl_user` VALUES ('402881b254129c220154129c77290000', null, '402881b254124bcd0154124df06f0000', 'kjjg', '', 'gsAdmin', 'e10adc3949ba59abbe56e057f20f883e', '15684354454', 'erwerw@qq.com', null, null, '0', '1', '2016-04-14 10:32:04', '', '0', '383789988989933333', '2', null, null);
INSERT INTO `tbl_user` VALUES ('402881b254129c220154129ca18c0001', null, '402881b25412504f01541255a09e0003', 'tr', null, '1545656565656', '813125bf362bb95e8114505344dafcc1', '1545656565656', '43@qq.com', null, null, '0', '0', '2016-04-14 10:32:15', null, null, '143454656565655555', '1', null, null);
INSERT INTO `tbl_user` VALUES ('402881b25412b1d0015412b297e10000', null, '402881b25412504f01541255a09e0003', 'tr', null, '1545656565656', '813125bf362bb95e8114505344dafcc1', '1545656565656', '43@qq.com', null, null, '0', '1', '2016-04-14 10:56:14', null, null, '143454656565655555', '1', null, null);
INSERT INTO `tbl_user` VALUES ('402881b25412b9d8015412ba7e370001', null, '402881b25412b9d8015412ba6d900000', 'ew', null, '9282552553', 'c240aa5e02e0f6af1ec0be859db3b47c', '9282552553', 'e2@qq.com', null, null, '0', '1', '2016-04-14 11:04:52', null, null, '349543543543543444', '1', null, null);
INSERT INTO `tbl_user` VALUES ('402881b25412e102015412e3a99d0003', null, '402881b25412e102015412e31de10001', '粉我认为', '', '152478545258', '8e9990d52fd3334a51426b03a74da559', '152478545258', '肺胃热@qq.com', null, null, '0', '1', '2016-04-14 11:49:50', '', null, '235435435534434234', '3', null, null);
INSERT INTO `tbl_user` VALUES ('402881b25412e8d8015412e9d1040002', null, '402881b25412e8d8015412e987b20000', '范德萨发', '', '18473743432', '587d099d1ff850bb7a61f679c9ba5346', '18473743432', '34@qq.com', null, null, '0', '1', '2016-04-14 11:56:33', '', null, '563345756746544444', '3', null, null);
INSERT INTO `tbl_user` VALUES ('402881b2541383770154139141b20002', null, '402881b254138377015413910afa0000', '肺胃热', null, '1645643433434', 'b94ce05bc6736280da8bb52b41b4bdb9', '1645643433434', '33@qq.com', null, null, '0', '1', '2016-04-14 14:59:27', null, null, '546435435455544544', '1', null, null);

-- ----------------------------
-- Table structure for tbl_user_privilege
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_privilege`;
CREATE TABLE `tbl_user_privilege` (
  `privilege_id` varchar(36) DEFAULT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  KEY `FK_TBL_PRIV_REFERENCE_TBL_PRIV` (`privilege_id`),
  KEY `FK_TBL_PRIV_REFERENCE_TBL_USER` (`user_id`),
  CONSTRAINT `FK_TBL_PRIV_REFERENCE_TBL_PRIV` FOREIGN KEY (`privilege_id`) REFERENCES `tbl_privilege` (`privilege_id`),
  CONSTRAINT `FK_TBL_PRIV_REFERENCE_TBL_USER` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tbl_user_privilege
-- ----------------------------

-- ----------------------------
-- Table structure for tbl_user_project
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_project`;
CREATE TABLE `tbl_user_project` (
  `project_id` varchar(36) NOT NULL,
  `user_id` varchar(36) NOT NULL,
  PRIMARY KEY (`project_id`,`user_id`),
  KEY `FK_TBL_USER_REFERENCE_TBL_USER` (`user_id`),
  CONSTRAINT `FK_TBL_USER_REFERENCE_TBL_PROJ` FOREIGN KEY (`project_id`) REFERENCES `tbl_project` (`project_id`),
  CONSTRAINT `FK_TBL_USER_REFERENCE_TBL_USER` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tbl_user_project
-- ----------------------------
INSERT INTO `tbl_user_project` VALUES ('402881b0541437cb0154144441250000', '1');

-- ----------------------------
-- Table structure for tbl_user_role
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_role`;
CREATE TABLE `tbl_user_role` (
  `user_id` varchar(36) NOT NULL,
  `role_id` varchar(36) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `FK91589929C0E4AADE` (`role_id`),
  KEY `FK91589929660F6EBE` (`user_id`),
  CONSTRAINT `FK91589929660F6EBE` FOREIGN KEY (`user_id`) REFERENCES `tbl_user` (`user_id`),
  CONSTRAINT `FK91589929C0E4AADE` FOREIGN KEY (`role_id`) REFERENCES `tbl_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tbl_user_role
-- ----------------------------
INSERT INTO `tbl_user_role` VALUES ('1', '0');
INSERT INTO `tbl_user_role` VALUES ('402881b25412504f015412537b830000', '1');
INSERT INTO `tbl_user_role` VALUES ('402881b254129c220154129c77290000', '1');
INSERT INTO `tbl_user_role` VALUES ('402881b254129c220154129ca18c0001', '1');
INSERT INTO `tbl_user_role` VALUES ('402881b25412b1d0015412b297e10000', '1');
INSERT INTO `tbl_user_role` VALUES ('402881b25412b9d8015412ba7e370001', '1');
INSERT INTO `tbl_user_role` VALUES ('402881b25412e102015412e3a99d0003', '1');
INSERT INTO `tbl_user_role` VALUES ('402881b25412e8d8015412e9d1040002', '1');
INSERT INTO `tbl_user_role` VALUES ('402881b2541383770154139141b20002', '1');

-- ----------------------------
-- Table structure for tbl_user_task
-- ----------------------------
DROP TABLE IF EXISTS `tbl_user_task`;
CREATE TABLE `tbl_user_task` (
  `user_id` varchar(36) NOT NULL,
  `task_id` varchar(36) NOT NULL,
  PRIMARY KEY (`user_id`,`task_id`),
  KEY `FK_TBL_USER_REFERENCE_TBL_TASK` (`task_id`),
  CONSTRAINT `FK_TBL_USER_REFERENCE_TBL_TASK` FOREIGN KEY (`task_id`) REFERENCES `tbl_task` (`task_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of tbl_user_task
-- ----------------------------
