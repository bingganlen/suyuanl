/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : shuyuan

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-03-12 16:02:02
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dept
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dept_id` int(11) DEFAULT '0' COMMENT '部门id  默认0未分组',
  `dept_name` varchar(30) DEFAULT NULL COMMENT '部门、分组名称',
  `company` varchar(30) DEFAULT NULL COMMENT '企业',
  `num_emp_count` int(11) DEFAULT NULL,
  `admin_user_id` int(11) DEFAULT NULL COMMENT '部门管理员ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dept
-- ----------------------------
INSERT INTO `dept` VALUES ('1', '0', '未分组', null, null, null);
INSERT INTO `dept` VALUES ('2', '3', '研发部', null, null, null);
INSERT INTO `dept` VALUES ('3', '4', '后勤部', null, null, null);
INSERT INTO `dept` VALUES ('4', '5', '人事部', null, null, null);

-- ----------------------------
-- Table structure for dervice_status_his
-- ----------------------------
DROP TABLE IF EXISTS `dervice_status_his`;
CREATE TABLE `dervice_status_his` (
  `id` int(11) NOT NULL,
  `device_id` int(11) DEFAULT NULL COMMENT '设备id',
  `power` float(11,0) DEFAULT NULL COMMENT '设备电压',
  `record_time` datetime DEFAULT NULL COMMENT 'record_time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备状态历史';

-- ----------------------------
-- Records of dervice_status_his
-- ----------------------------

-- ----------------------------
-- Table structure for device
-- ----------------------------
DROP TABLE IF EXISTS `device`;
CREATE TABLE `device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dev_id` bigint(20) NOT NULL COMMENT '设备ID_终端绑定用',
  `video` int(11) DEFAULT NULL COMMENT '设备名称',
  `d_image` varchar(500) DEFAULT NULL COMMENT '设备图 URL相对路径',
  `d_detail` text COMMENT '设备详情',
  `d_ip` varchar(200) DEFAULT NULL COMMENT '链接摄像头等用的',
  `device_ip` varchar(20) DEFAULT NULL COMMENT '设备的IP地址',
  `d_status` int(6) DEFAULT NULL COMMENT '设备状态 1-启动 2-下架 3-删除',
  `nickname` varchar(50) DEFAULT NULL COMMENT '设备别名',
  `dev_type` varchar(255) DEFAULT NULL COMMENT '设备类型',
  `csq` int(4) DEFAULT NULL COMMENT '信号强度',
  `create_time` datetime DEFAULT NULL COMMENT '设备添加时间',
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='终端管理';

-- ----------------------------
-- Records of device
-- ----------------------------
INSERT INTO `device` VALUES ('1', '100000213', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `device` VALUES ('2', '100000214', null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `device` VALUES ('3', '100000215', null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for device_config_his
-- ----------------------------
DROP TABLE IF EXISTS `device_config_his`;
CREATE TABLE `device_config_his` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `config_identifier` varchar(20) DEFAULT NULL COMMENT '配置标识符',
  `device_id` bigint(20) DEFAULT NULL,
  `data_upload_interval` int(11) NOT NULL COMMENT '数据上传间隔  min',
  `data_samp_interval` int(11) DEFAULT NULL COMMENT '数据采集间隔min',
  `is_enable_locate` int(1) DEFAULT '1' COMMENT '定位功能  开启1  关闭0',
  `config_time` datetime DEFAULT NULL COMMENT '配置时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='终端配置';

-- ----------------------------
-- Records of device_config_his
-- ----------------------------

-- ----------------------------
-- Table structure for device_record_his
-- ----------------------------
DROP TABLE IF EXISTS `device_record_his`;
CREATE TABLE `device_record_his` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dev_id` bigint(20) DEFAULT NULL,
  `video` int(11) DEFAULT NULL COMMENT '存在设备',
  `light` int(11) DEFAULT '0' COMMENT '光照  lux',
  `rain` int(11) DEFAULT '0' COMMENT '33     日降雨量3.3 mm',
  `air_temp` int(11) DEFAULT NULL COMMENT '空气温度  236   23.6 度',
  `air_humi` int(11) DEFAULT NULL COMMENT '空气湿度  384    38.4',
  `soil_temp` int(11) DEFAULT NULL COMMENT '土壤温度272    27.2度',
  `soil_humi` int(11) DEFAULT NULL COMMENT '土壤湿度275  27.5',
  `soil_electric` int(4) DEFAULT NULL COMMENT '土壤电导率  122 uS/cm   与光照不用除10',
  `soil_salt` int(11) DEFAULT NULL COMMENT '土壤盐分  69 mg/L',
  `air_pressure` int(11) DEFAULT NULL COMMENT '空气气压',
  `wind_speed` int(4) DEFAULT NULL COMMENT '风速',
  `wind` int(4) DEFAULT NULL COMMENT '风向',
  `longtitude` int(11) DEFAULT NULL COMMENT '经度',
  `latitude` int(11) DEFAULT NULL COMMENT '纬度',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`,`update_time`)
) ENGINE=InnoDB AUTO_INCREMENT=890 DEFAULT CHARSET=utf8 COMMENT='设备的历史记录';

-- ----------------------------
-- Records of device_record_his
-- ----------------------------
INSERT INTO `device_record_his` VALUES ('1', '100000213', null, '1459', '33', '236', '384', '275', '273', '122', '69', null, null, null, null, null, '2019-02-20 17:02:39', '2019-02-21 17:02:43');
INSERT INTO `device_record_his` VALUES ('2', '100000214', null, '1569', '44', '146', '262', '353', '423', '110', '60', null, null, null, null, null, '2019-02-22 10:14:01', '2019-02-22 10:14:09');
INSERT INTO `device_record_his` VALUES ('4', '100000215', null, '1560', '44', '146', '262', '353', '423', '59', '110', null, null, null, null, null, '2019-02-21 09:16:23', '2019-02-21 09:16:23');
INSERT INTO `device_record_his` VALUES ('5', '100000215', null, '1560', '44', '146', '262', '353', '423', '59', '110', null, null, null, null, null, '2019-02-21 09:20:00', '2019-02-21 09:20:00');
INSERT INTO `device_record_his` VALUES ('6', '100000213', null, '1569', '44', '146', '262', '353', '423', '110', '60', null, null, null, null, null, '2019-02-21 09:23:41', '2019-02-21 09:23:41');
INSERT INTO `device_record_his` VALUES ('7', '100000213', null, '1560', '39', '146', '263', '300', '434', '59', '111', null, null, null, null, null, '2019-02-18 09:30:20', '2019-02-21 09:30:20');
INSERT INTO `device_record_his` VALUES ('8', '100000213', null, '1569', '44', '146', '262', '353', '423', '110', '60', null, null, null, null, null, '2019-02-17 09:34:24', '2019-02-21 09:34:24');
INSERT INTO `device_record_his` VALUES ('9', '100000213', null, '2016', '11', '245', '262', '465', '455', '54', '15', null, null, null, null, null, '2019-02-16 09:34:57', '2019-02-21 09:44:57');
INSERT INTO `device_record_his` VALUES ('10', '100000213', null, '899', '0', '240', '300', '353', '423', '110', '60', null, null, null, null, null, '2019-02-15 09:33:19', '2019-02-21 09:53:23');
INSERT INTO `device_record_his` VALUES ('11', '100000213', null, '933', '21', '263', '323', '280', '412', '111', '56', null, null, null, null, null, '2019-02-14 09:33:43', '2019-02-21 09:54:43');
INSERT INTO `device_record_his` VALUES ('12', '100000214', null, '1432', '21', '35', '453', '351', '533', '136', '45', null, null, null, null, null, '2019-02-21 10:18:03', '2019-02-22 10:18:10');
INSERT INTO `device_record_his` VALUES ('13', '100000214', null, '1465', '33', '33', '534', '455', '323', '102', '55', null, null, null, null, null, '2019-02-20 10:19:12', '2019-02-22 10:19:21');
INSERT INTO `device_record_his` VALUES ('14', '100000214', null, '1456', '45', '245', '262', '353', '434', '54', '132', null, null, null, null, null, '2019-02-19 10:21:47', '2019-02-22 10:21:47');
INSERT INTO `device_record_his` VALUES ('15', '100000214', null, '1456', '45', '245', '262', '353', '434', '54', '132', null, null, null, null, null, '2019-02-18 10:22:32', '2019-02-22 10:22:32');
INSERT INTO `device_record_his` VALUES ('16', '100000214', null, '1222', '10', '245', '100', '190', '360', '55', '145', null, null, null, null, null, '2019-02-17 10:24:35', '2019-02-22 10:24:35');
INSERT INTO `device_record_his` VALUES ('17', '100000214', null, '1222', '10', '245', '100', '190', '360', '55', '145', null, null, null, null, null, '2019-02-16 10:24:43', '2019-02-22 10:24:43');
INSERT INTO `device_record_his` VALUES ('18', '100000213', null, '1240', '0', '164', '110', '110', '102', '121', '45', null, null, null, null, null, '2019-02-22 11:11:36', '2019-02-22 11:11:48');
INSERT INTO `device_record_his` VALUES ('19', '100000213', null, '1690', '0', '213', '154', '453', '345', '41', '99', null, null, null, null, null, '2019-02-23 09:13:29', '2019-02-23 09:13:31');
INSERT INTO `device_record_his` VALUES ('20', '100000213', null, '2033', '0', '141', '241', '299', '304', '56', '45', null, null, null, null, null, '2019-02-24 08:49:26', '2019-02-25 08:49:36');
INSERT INTO `device_record_his` VALUES ('21', '100000213', null, '2013', '0', '242', '121', '425', '423', '113', '69', null, null, null, null, null, '2019-02-25 08:50:34', '2019-02-25 08:50:36');
INSERT INTO `device_record_his` VALUES ('22', '100000213', null, '998', '45', '146', '262', '353', '423', '59', '110', null, null, null, null, null, '2019-02-27 10:12:13', '2019-02-28 10:12:18');
INSERT INTO `device_record_his` VALUES ('23', '100000213', null, '1222', '10', '146', '353', '323', '304', '55', '44', null, null, null, null, null, '2019-02-28 13:32:45', '2019-03-06 13:32:51');
INSERT INTO `device_record_his` VALUES ('24', '100000213', null, '38047', '0', '228', '799', '238', '346', '146', '89', null, null, null, null, null, '2019-03-01 15:00:02', '2019-03-01 15:00:02');
INSERT INTO `device_record_his` VALUES ('25', '100000213', null, '21217', '0', '221', '827', '240', '338', '146', '89', null, null, null, null, null, '2019-03-01 16:00:01', '2019-03-01 16:00:01');
INSERT INTO `device_record_his` VALUES ('26', '100000213', null, '10621', '0', '214', '853', '237', '340', '144', '88', null, null, null, null, null, '2019-03-01 17:00:01', '2019-03-01 17:00:01');
INSERT INTO `device_record_his` VALUES ('27', '100000213', null, '3025', '0', '210', '880', '232', '339', '143', '88', null, null, null, null, null, '2019-03-01 18:00:01', '2019-03-01 18:00:01');
INSERT INTO `device_record_his` VALUES ('28', '100000213', null, '14141', '0', '206', '932', '216', '342', '141', '90', null, null, null, null, null, '2019-03-02 09:00:01', '2019-03-02 09:00:01');
INSERT INTO `device_record_his` VALUES ('29', '100000213', null, '23399', '0', '217', '877', '221', '342', '143', '90', null, null, null, null, null, '2019-03-02 10:00:01', '2019-03-02 10:00:01');
INSERT INTO `device_record_his` VALUES ('30', '100000213', null, '28288', '0', '224', '848', '229', '340', '145', '90', null, null, null, null, null, '2019-03-02 11:00:01', '2019-03-02 11:00:01');
INSERT INTO `device_record_his` VALUES ('31', '100000213', null, '25652', '0', '210', '755', '199', '364', '124', '82', null, null, null, null, null, '2019-03-04 10:00:01', '2019-03-04 10:00:01');
INSERT INTO `device_record_his` VALUES ('32', '100000213', null, '30600', '0', '222', '719', '211', '358', '126', '81', null, null, null, null, null, '2019-03-04 11:00:01', '2019-03-04 11:00:01');
INSERT INTO `device_record_his` VALUES ('33', '100000213', null, '54531', '0', '227', '704', '222', '358', '129', '81', null, null, null, null, null, '2019-03-04 12:00:00', '2019-03-04 12:00:00');
INSERT INTO `device_record_his` VALUES ('34', '100000213', null, '26548', '0', '226', '725', '234', '357', '132', '81', null, null, null, null, null, '2019-03-04 13:00:00', '2019-03-04 13:00:00');
INSERT INTO `device_record_his` VALUES ('35', '100000213', null, '17835', '0', '217', '775', '239', '354', '133', '81', null, null, null, null, null, '2019-03-04 14:00:00', '2019-03-04 14:00:00');
INSERT INTO `device_record_his` VALUES ('36', '100000213', null, '12007', '0', '209', '790', '238', '357', '132', '81', null, null, null, null, null, '2019-03-04 15:00:00', '2019-03-04 15:00:00');
INSERT INTO `device_record_his` VALUES ('37', '100000213', null, '5314', '0', '207', '812', '235', '357', '132', '81', null, null, null, null, null, '2019-03-04 16:00:01', '2019-03-04 16:00:01');
INSERT INTO `device_record_his` VALUES ('38', '100000213', null, '8170', '0', '205', '824', '230', '358', '131', '81', null, null, null, null, null, '2019-03-04 17:00:00', '2019-03-04 17:00:00');
INSERT INTO `device_record_his` VALUES ('39', '100000213', null, '6945', '8', '207', '984', '203', '372', '45', '29', null, null, null, null, null, '2019-03-05 09:00:02', '2019-03-05 09:00:02');
INSERT INTO `device_record_his` VALUES ('40', '100000213', null, '10149', '8', '225', '933', '212', '369', '47', '30', null, null, null, null, null, '2019-03-05 10:00:01', '2019-03-05 10:00:01');
INSERT INTO `device_record_his` VALUES ('41', '100000213', null, '32268', '8', '241', '855', '223', '366', '49', '30', null, null, null, null, null, '2019-03-05 11:00:01', '2019-03-05 11:00:01');
INSERT INTO `device_record_his` VALUES ('42', '100000213', null, '16394', '8', '247', '820', '235', '366', '52', '32', null, null, null, null, null, '2019-03-05 12:00:00', '2019-03-05 12:00:00');
INSERT INTO `device_record_his` VALUES ('43', '100000213', null, '33027', '8', '253', '811', '239', '362', '53', '32', null, null, null, null, null, '2019-03-05 13:00:00', '2019-03-05 13:00:00');
INSERT INTO `device_record_his` VALUES ('44', '100000213', null, '17446', '8', '250', '792', '247', '366', '56', '33', null, null, null, null, null, '2019-03-05 14:00:01', '2019-03-05 14:00:01');
INSERT INTO `device_record_his` VALUES ('45', '100000213', null, '13502', '8', '246', '810', '251', '361', '57', '34', null, null, null, null, null, '2019-03-05 15:00:00', '2019-03-05 15:00:00');
INSERT INTO `device_record_his` VALUES ('46', '100000213', null, '17452', '8', '245', '820', '251', '362', '58', '34', null, null, null, null, null, '2019-03-05 16:00:01', '2019-03-05 16:00:01');
INSERT INTO `device_record_his` VALUES ('47', '100000213', null, '6234', '8', '240', '872', '250', '363', '59', '35', null, null, null, null, null, '2019-03-05 17:00:01', '2019-03-05 17:00:01');
INSERT INTO `device_record_his` VALUES ('48', '100000213', null, '3102', '8', '236', '879', '246', '362', '60', '36', null, null, null, null, null, '2019-03-05 18:00:02', '2019-03-05 18:00:02');
INSERT INTO `device_record_his` VALUES ('49', '100000213', null, '6880', '18', '193', '989', '209', '371', '62', '40', null, null, null, null, null, '2019-03-06 10:00:01', '2019-03-06 10:00:01');
INSERT INTO `device_record_his` VALUES ('50', '100000213', null, '5923', '28', '198', '970', '210', '374', '61', '39', null, null, null, null, null, '2019-03-06 11:00:01', '2019-03-06 11:00:01');
INSERT INTO `device_record_his` VALUES ('51', '100000213', null, '11625', '150', '188', '996', '201', '377', '43', '28', null, null, null, null, null, '2019-03-06 12:10:02', '2019-03-06 14:10:02');
INSERT INTO `device_record_his` VALUES ('52', '100000213', null, '11332', '150', '189', '995', '202', '377', '42', '27', null, null, null, null, null, '2019-03-06 14:11:01', '2019-03-06 14:11:01');
INSERT INTO `device_record_his` VALUES ('53', '100000213', null, '7866', '162', '190', '979', '204', '376', '38', '24', null, null, null, null, null, '2019-03-06 15:00:00', '2019-03-06 15:00:00');
INSERT INTO `device_record_his` VALUES ('54', '100000213', null, '3413', '164', '191', '986', '204', '380', '40', '26', null, null, null, null, null, '2019-03-06 16:00:01', '2019-03-06 16:00:01');
INSERT INTO `device_record_his` VALUES ('55', '100000213', null, '1530', '164', '191', '978', '205', '378', '41', '26', null, null, null, null, null, '2019-03-06 17:00:01', '2019-03-06 17:00:01');
INSERT INTO `device_record_his` VALUES ('56', '100000213', null, '520', '164', '184', '977', '204', '374', '41', '26', null, null, null, null, null, '2019-03-06 18:00:01', '2019-03-06 18:00:01');
INSERT INTO `device_record_his` VALUES ('57', '100000213', null, '3598', '56', '147', '986', '161', '385', '36', '25', null, null, null, null, null, '2019-03-07 09:00:01', '2019-03-07 09:00:01');
INSERT INTO `device_record_his` VALUES ('58', '100000213', null, '2331', '56', '153', '957', '162', '384', '37', '26', null, null, null, null, null, '2019-03-07 10:00:01', '2019-03-07 10:00:01');
INSERT INTO `device_record_his` VALUES ('59', '100000213', null, '2039', '56', '153', '962', '166', '384', '37', '26', null, null, null, null, null, '2019-03-07 11:00:02', '2019-03-07 11:00:02');
INSERT INTO `device_record_his` VALUES ('60', '100000213', null, '3491', '78', '151', '978', '163', '384', '35', '25', null, null, null, null, null, '2019-03-07 12:00:00', '2019-03-07 12:00:00');
INSERT INTO `device_record_his` VALUES ('61', '100000213', null, '6909', '88', '154', '977', '163', '386', '36', '25', null, null, null, null, null, '2019-03-07 13:00:00', '2019-03-07 13:00:00');
INSERT INTO `device_record_his` VALUES ('62', '100000213', null, '8153', '90', '160', '973', '166', '380', '36', '25', null, null, null, null, null, '2019-03-07 14:00:01', '2019-03-07 14:00:01');
INSERT INTO `device_record_his` VALUES ('63', '100000213', null, '9354', '114', '158', '978', '169', '384', '36', '25', null, null, null, null, null, '2019-03-07 15:00:01', '2019-03-07 15:00:01');
INSERT INTO `device_record_his` VALUES ('64', '100000213', null, '4549', '114', '154', '971', '170', '384', '36', '25', null, null, null, null, null, '2019-03-07 16:00:01', '2019-03-07 16:00:01');
INSERT INTO `device_record_his` VALUES ('65', '100000213', null, '2391', '128', '149', '976', '165', '386', '35', '25', null, null, null, null, null, '2019-03-07 17:00:01', '2019-03-07 17:00:01');
INSERT INTO `device_record_his` VALUES ('66', '100000213', null, '951', '142', '151', '974', '164', '384', '35', '25', null, null, null, null, null, '2019-03-07 18:00:01', '2019-03-07 18:00:01');
INSERT INTO `device_record_his` VALUES ('67', '100000213', null, '2373', '0', '154', '956', '160', '389', '28', '20', null, null, null, null, null, '2019-03-08 09:00:01', '2019-03-08 09:00:01');
INSERT INTO `device_record_his` VALUES ('68', '100000213', null, '7967', '0', '157', '946', '163', '389', '29', '20', null, null, null, null, null, '2019-03-08 10:00:00', '2019-03-08 10:00:00');
INSERT INTO `device_record_his` VALUES ('69', '100000213', null, '5463', '0', '162', '930', '167', '388', '29', '20', null, null, null, null, null, '2019-03-08 11:00:01', '2019-03-08 11:00:01');
INSERT INTO `device_record_his` VALUES ('70', '100000213', null, '8661', '0', '163', '933', '169', '389', '30', '21', null, null, null, null, null, '2019-03-08 12:00:01', '2019-03-08 12:00:01');
INSERT INTO `device_record_his` VALUES ('71', '100000213', null, '4495', '0', '166', '926', '173', '391', '29', '20', null, null, null, null, null, '2019-03-08 13:00:01', '2019-03-08 13:00:01');
INSERT INTO `device_record_his` VALUES ('72', '100000213', null, '6144', '0', '165', '946', '173', '388', '31', '21', null, null, null, null, null, '2019-03-08 14:00:03', '2019-03-08 14:00:03');
INSERT INTO `device_record_his` VALUES ('73', '100000213', null, '2690', '0', '161', '976', '174', '387', '31', '21', null, null, null, null, null, '2019-03-08 15:00:07', '2019-03-08 15:00:07');
INSERT INTO `device_record_his` VALUES ('74', '100000213', null, '2899', '2', '160', '989', '174', '391', '31', '21', null, null, null, null, null, '2019-03-08 16:00:01', '2019-03-08 16:00:01');
INSERT INTO `device_record_his` VALUES ('75', '100000213', null, '951', '4', '161', '976', '172', '386', '32', '22', null, null, null, null, null, '2019-03-08 17:00:04', '2019-03-08 17:00:04');
INSERT INTO `device_record_his` VALUES ('76', '100000213', null, '216', '4', '156', '989', '171', '388', '32', '22', null, null, null, null, null, '2019-03-08 18:00:01', '2019-03-08 18:00:01');
INSERT INTO `device_record_his` VALUES ('77', '100000213', null, '3873', '0', '164', '991', '174', '391', '37', '25', null, null, null, null, null, '2019-03-09 10:00:02', '2019-03-09 10:00:02');
INSERT INTO `device_record_his` VALUES ('78', '100000213', null, '5039', '0', '158', '997', '175', '392', '37', '25', null, null, null, null, null, '2019-03-09 11:00:01', '2019-03-09 11:00:01');
INSERT INTO `device_record_his` VALUES ('79', '100000213', null, '5523', '0', '162', '997', '173', '389', '37', '26', null, null, null, null, null, '2019-03-09 12:00:01', '2019-03-09 12:00:01');
INSERT INTO `device_record_his` VALUES ('80', '100000213', null, '7131', '0', '164', '984', '174', '388', '38', '26', null, null, null, null, null, '2019-03-09 13:00:01', '2019-03-09 13:00:01');
INSERT INTO `device_record_his` VALUES ('81', '100000213', null, '17787', '0', '155', '857', '153', '391', '37', '27', null, null, null, null, null, '2019-03-11 09:54:02', '2019-03-11 09:54:02');
INSERT INTO `device_record_his` VALUES ('82', '100000213', null, '19281', '0', '155', '871', '153', '395', '37', '27', null, null, null, null, null, '2019-03-11 09:55:01', '2019-03-11 09:55:01');
INSERT INTO `device_record_his` VALUES ('83', '100000213', null, '19974', '0', '156', '859', '153', '395', '37', '27', null, null, null, null, null, '2019-03-11 09:56:01', '2019-03-11 09:56:01');
INSERT INTO `device_record_his` VALUES ('84', '100000213', null, '19831', '0', '157', '862', '153', '395', '37', '27', null, null, null, null, null, '2019-03-11 09:57:01', '2019-03-11 09:57:01');
INSERT INTO `device_record_his` VALUES ('85', '100000213', null, '19155', '0', '158', '863', '153', '394', '37', '27', null, null, null, null, null, '2019-03-11 09:58:01', '2019-03-11 09:58:01');
INSERT INTO `device_record_his` VALUES ('86', '100000213', null, '18289', '0', '158', '855', '153', '393', '37', '27', null, null, null, null, null, '2019-03-11 09:59:01', '2019-03-11 09:59:01');
INSERT INTO `device_record_his` VALUES ('87', '100000213', null, '18026', '0', '159', '854', '154', '393', '38', '27', null, null, null, null, null, '2019-03-11 10:00:01', '2019-03-11 10:00:01');
INSERT INTO `device_record_his` VALUES ('88', '100000213', null, '18038', '0', '160', '848', '154', '393', '37', '27', null, null, null, null, null, '2019-03-11 10:01:02', '2019-03-11 10:01:02');
INSERT INTO `device_record_his` VALUES ('89', '100000213', null, '18695', '0', '160', '843', '153', '394', '37', '27', null, null, null, null, null, '2019-03-11 10:02:01', '2019-03-11 10:02:01');
INSERT INTO `device_record_his` VALUES ('90', '100000213', null, '19102', '0', '161', '846', '154', '395', '37', '27', null, null, null, null, null, '2019-03-11 10:03:00', '2019-03-11 10:03:00');
INSERT INTO `device_record_his` VALUES ('91', '100000213', null, '19024', '0', '162', '844', '155', '395', '37', '27', null, null, null, null, null, '2019-03-11 10:04:00', '2019-03-11 10:04:00');
INSERT INTO `device_record_his` VALUES ('92', '100000213', null, '19359', '0', '162', '843', '154', '393', '37', '27', null, null, null, null, null, '2019-03-11 10:05:00', '2019-03-11 10:05:00');
INSERT INTO `device_record_his` VALUES ('93', '100000213', null, '20279', '0', '161', '835', '154', '393', '37', '27', null, null, null, null, null, '2019-03-11 10:06:00', '2019-03-11 10:06:00');
INSERT INTO `device_record_his` VALUES ('94', '100000213', null, '21020', '0', '161', '837', '154', '393', '37', '27', null, null, null, null, null, '2019-03-11 10:07:01', '2019-03-11 10:07:01');
INSERT INTO `device_record_his` VALUES ('95', '100000213', null, '20847', '0', '160', '839', '154', '392', '37', '27', null, null, null, null, null, '2019-03-11 10:08:01', '2019-03-11 10:08:01');
INSERT INTO `device_record_his` VALUES ('96', '100000213', null, '19675', '0', '160', '837', '154', '393', '37', '27', null, null, null, null, null, '2019-03-11 10:09:01', '2019-03-11 10:09:01');
INSERT INTO `device_record_his` VALUES ('97', '100000213', null, '19197', '0', '160', '836', '155', '394', '37', '27', null, null, null, null, null, '2019-03-11 10:10:01', '2019-03-11 10:10:01');
INSERT INTO `device_record_his` VALUES ('98', '100000213', null, '19197', '0', '159', '829', '154', '394', '37', '27', null, null, null, null, null, '2019-03-11 10:11:01', '2019-03-11 10:11:01');
INSERT INTO `device_record_his` VALUES ('99', '100000213', null, '19239', '0', '159', '838', '155', '393', '37', '27', null, null, null, null, null, '2019-03-11 10:12:02', '2019-03-11 10:12:02');
INSERT INTO `device_record_his` VALUES ('100', '100000213', null, '19191', '0', '161', '842', '155', '393', '37', '27', null, null, null, null, null, '2019-03-11 10:13:01', '2019-03-11 10:13:01');
INSERT INTO `device_record_his` VALUES ('101', '100000213', null, '19030', '0', '161', '833', '155', '393', '37', '27', null, null, null, null, null, '2019-03-11 10:14:01', '2019-03-11 10:14:01');
INSERT INTO `device_record_his` VALUES ('102', '100000213', null, '19562', '0', '160', '829', '155', '393', '37', '27', null, null, null, null, null, '2019-03-11 10:15:01', '2019-03-11 10:15:01');
INSERT INTO `device_record_his` VALUES ('103', '100000213', null, '20333', '0', '158', '833', '156', '393', '37', '27', null, null, null, null, null, '2019-03-11 10:16:01', '2019-03-11 10:16:01');
INSERT INTO `device_record_his` VALUES ('104', '100000213', null, '21660', '0', '160', '833', '156', '392', '37', '27', null, null, null, null, null, '2019-03-11 10:17:01', '2019-03-11 10:17:01');
INSERT INTO `device_record_his` VALUES ('105', '100000213', null, '22998', '0', '160', '832', '156', '393', '38', '27', null, null, null, null, null, '2019-03-11 10:18:00', '2019-03-11 10:18:00');
INSERT INTO `device_record_his` VALUES ('106', '100000213', null, '24660', '0', '161', '829', '156', '393', '37', '27', null, null, null, null, null, '2019-03-11 10:19:00', '2019-03-11 10:19:00');
INSERT INTO `device_record_his` VALUES ('107', '100000213', null, '25114', '0', '162', '828', '156', '394', '37', '27', null, null, null, null, null, '2019-03-11 10:20:00', '2019-03-11 10:20:00');
INSERT INTO `device_record_his` VALUES ('108', '100000213', null, '25084', '0', '161', '826', '157', '394', '37', '26', null, null, null, null, null, '2019-03-11 10:21:00', '2019-03-11 10:21:00');
INSERT INTO `device_record_his` VALUES ('109', '100000213', null, '24409', '0', '160', '822', '156', '394', '37', '27', null, null, null, null, null, '2019-03-11 10:22:01', '2019-03-11 10:22:01');
INSERT INTO `device_record_his` VALUES ('110', '100000213', null, '24445', '0', '162', '825', '157', '393', '38', '27', null, null, null, null, null, '2019-03-11 10:23:01', '2019-03-11 10:23:01');
INSERT INTO `device_record_his` VALUES ('111', '100000213', null, '25012', '0', '163', '820', '157', '394', '37', '26', null, null, null, null, null, '2019-03-11 10:24:00', '2019-03-11 10:24:00');
INSERT INTO `device_record_his` VALUES ('112', '100000213', null, '25562', '0', '163', '822', '157', '392', '38', '27', null, null, null, null, null, '2019-03-11 10:25:01', '2019-03-11 10:25:01');
INSERT INTO `device_record_his` VALUES ('113', '100000213', null, '26291', '0', '163', '817', '157', '393', '37', '26', null, null, null, null, null, '2019-03-11 10:26:01', '2019-03-11 10:26:01');
INSERT INTO `device_record_his` VALUES ('114', '100000213', null, '25491', '0', '163', '823', '157', '393', '38', '27', null, null, null, null, null, '2019-03-11 10:27:00', '2019-03-11 10:27:00');
INSERT INTO `device_record_his` VALUES ('115', '100000213', null, '25084', '0', '165', '823', '157', '392', '37', '26', null, null, null, null, null, '2019-03-11 10:28:00', '2019-03-11 10:28:00');
INSERT INTO `device_record_his` VALUES ('116', '100000213', null, '24570', '0', '165', '819', '157', '393', '37', '26', null, null, null, null, null, '2019-03-11 10:29:00', '2019-03-11 10:29:00');
INSERT INTO `device_record_his` VALUES ('117', '100000213', null, '24008', '0', '164', '820', '157', '391', '38', '27', null, null, null, null, null, '2019-03-11 10:30:00', '2019-03-11 10:30:00');
INSERT INTO `device_record_his` VALUES ('118', '100000213', null, '23913', '0', '162', '825', '157', '392', '37', '26', null, null, null, null, null, '2019-03-11 10:31:00', '2019-03-11 10:31:00');
INSERT INTO `device_record_his` VALUES ('119', '100000213', null, '24176', '0', '163', '820', '158', '393', '38', '27', null, null, null, null, null, '2019-03-11 10:32:01', '2019-03-11 10:32:01');
INSERT INTO `device_record_his` VALUES ('120', '100000213', null, '24277', '0', '163', '822', '158', '393', '37', '26', null, null, null, null, null, '2019-03-11 10:33:01', '2019-03-11 10:33:01');
INSERT INTO `device_record_his` VALUES ('121', '100000213', null, '24726', '0', '163', '825', '158', '393', '37', '26', null, null, null, null, null, '2019-03-11 10:34:01', '2019-03-11 10:34:01');
INSERT INTO `device_record_his` VALUES ('122', '100000213', null, '26602', '0', '166', '821', '158', '392', '37', '26', null, null, null, null, null, '2019-03-11 10:35:01', '2019-03-11 10:35:01');
INSERT INTO `device_record_his` VALUES ('123', '100000213', null, '24941', '0', '167', '814', '158', '392', '38', '27', null, null, null, null, null, '2019-03-11 10:36:01', '2019-03-11 10:36:01');
INSERT INTO `device_record_his` VALUES ('124', '100000213', null, '24821', '0', '167', '806', '158', '391', '37', '26', null, null, null, null, null, '2019-03-11 10:37:01', '2019-03-11 10:37:01');
INSERT INTO `device_record_his` VALUES ('125', '100000213', null, '25144', '0', '166', '819', '158', '393', '37', '26', null, null, null, null, null, '2019-03-11 10:38:00', '2019-03-11 10:38:00');
INSERT INTO `device_record_his` VALUES ('126', '100000213', null, '25353', '0', '167', '810', '158', '392', '38', '27', null, null, null, null, null, '2019-03-11 10:39:00', '2019-03-11 10:39:00');
INSERT INTO `device_record_his` VALUES ('127', '100000213', null, '25592', '0', '167', '814', '159', '392', '37', '26', null, null, null, null, null, '2019-03-11 10:40:01', '2019-03-11 10:40:01');
INSERT INTO `device_record_his` VALUES ('128', '100000213', null, '25963', '0', '167', '812', '159', '395', '37', '26', null, null, null, null, null, '2019-03-11 10:41:00', '2019-03-11 10:41:00');
INSERT INTO `device_record_his` VALUES ('129', '100000213', null, '27050', '0', '168', '800', '159', '394', '38', '27', null, null, null, null, null, '2019-03-11 10:42:00', '2019-03-11 10:42:00');
INSERT INTO `device_record_his` VALUES ('130', '100000213', null, '26273', '0', '168', '810', '159', '392', '38', '27', null, null, null, null, null, '2019-03-11 10:43:01', '2019-03-11 10:43:01');
INSERT INTO `device_record_his` VALUES ('131', '100000213', null, '27086', '0', '169', '818', '160', '389', '37', '26', null, null, null, null, null, '2019-03-11 10:44:00', '2019-03-11 10:44:00');
INSERT INTO `device_record_his` VALUES ('132', '100000213', null, '26566', '0', '170', '807', '159', '393', '38', '27', null, null, null, null, null, '2019-03-11 10:45:00', '2019-03-11 10:45:00');
INSERT INTO `device_record_his` VALUES ('133', '100000213', null, '27254', '0', '170', '819', '159', '393', '38', '27', null, null, null, null, null, '2019-03-11 10:46:01', '2019-03-11 10:46:01');
INSERT INTO `device_record_his` VALUES ('134', '100000213', null, '26841', '0', '169', '794', '160', '396', '38', '27', null, null, null, null, null, '2019-03-11 10:47:01', '2019-03-11 10:47:01');
INSERT INTO `device_record_his` VALUES ('135', '100000213', null, '26566', '0', '168', '808', '160', '394', '38', '27', null, null, null, null, null, '2019-03-11 10:48:01', '2019-03-11 10:48:01');
INSERT INTO `device_record_his` VALUES ('136', '100000213', null, '26973', '0', '170', '818', '160', '391', '38', '27', null, null, null, null, null, '2019-03-11 10:49:01', '2019-03-11 10:49:01');
INSERT INTO `device_record_his` VALUES ('137', '100000213', null, '26859', '0', '170', '801', '160', '395', '37', '26', null, null, null, null, null, '2019-03-11 10:50:01', '2019-03-11 10:50:01');
INSERT INTO `device_record_his` VALUES ('138', '100000213', null, '26728', '0', '168', '798', '160', '396', '38', '27', null, null, null, null, null, '2019-03-11 10:51:00', '2019-03-11 10:51:00');
INSERT INTO `device_record_his` VALUES ('139', '100000213', null, '31144', '0', '176', '773', '169', '389', '38', '26', null, null, null, null, null, '2019-03-11 11:38:01', '2019-03-11 11:38:01');
INSERT INTO `device_record_his` VALUES ('140', '100000213', null, '31001', '0', '176', '763', '168', '389', '38', '27', null, null, null, null, null, '2019-03-11 11:39:01', '2019-03-11 11:39:01');
INSERT INTO `device_record_his` VALUES ('141', '100000213', null, '32447', '0', '178', '765', '168', '387', '38', '27', null, null, null, null, null, '2019-03-11 11:40:01', '2019-03-11 11:40:01');
INSERT INTO `device_record_his` VALUES ('142', '100000213', null, '30648', '0', '175', '752', '168', '385', '38', '27', null, null, null, null, null, '2019-03-11 11:41:01', '2019-03-11 11:41:01');
INSERT INTO `device_record_his` VALUES ('143', '100000213', null, '30463', '0', '176', '762', '168', '388', '38', '27', null, null, null, null, null, '2019-03-11 11:42:01', '2019-03-11 11:42:01');
INSERT INTO `device_record_his` VALUES ('144', '100000213', null, '30146', '0', '177', '760', '168', '389', '38', '27', null, null, null, null, null, '2019-03-11 11:43:01', '2019-03-11 11:43:01');
INSERT INTO `device_record_his` VALUES ('145', '100000213', null, '29758', '0', '179', '759', '168', '392', '38', '27', null, null, null, null, null, '2019-03-11 11:44:01', '2019-03-11 11:44:01');
INSERT INTO `device_record_his` VALUES ('146', '100000213', null, '29788', '0', '175', '761', '168', '390', '38', '27', null, null, null, null, null, '2019-03-11 11:45:01', '2019-03-11 11:45:01');
INSERT INTO `device_record_his` VALUES ('147', '100000213', null, '30015', '0', '175', '752', '169', '387', '38', '26', null, null, null, null, null, '2019-03-11 11:46:01', '2019-03-11 11:46:01');
INSERT INTO `device_record_his` VALUES ('148', '100000213', null, '30361', '0', '177', '758', '169', '388', '38', '26', null, null, null, null, null, '2019-03-11 11:47:01', '2019-03-11 11:47:01');
INSERT INTO `device_record_his` VALUES ('149', '100000213', null, '30887', '0', '175', '749', '169', '391', '38', '26', null, null, null, null, null, '2019-03-11 11:48:00', '2019-03-11 11:48:00');
INSERT INTO `device_record_his` VALUES ('150', '100000213', null, '31258', '0', '176', '756', '169', '385', '38', '26', null, null, null, null, null, '2019-03-11 11:49:01', '2019-03-11 11:49:01');
INSERT INTO `device_record_his` VALUES ('151', '100000213', null, '33272', '0', '178', '754', '169', '391', '38', '26', null, null, null, null, null, '2019-03-11 11:50:01', '2019-03-11 11:50:01');
INSERT INTO `device_record_his` VALUES ('152', '100000213', null, '32991', '0', '178', '753', '169', '389', '38', '26', null, null, null, null, null, '2019-03-11 11:51:01', '2019-03-11 11:51:01');
INSERT INTO `device_record_his` VALUES ('153', '100000213', null, '33529', '0', '175', '746', '170', '387', '38', '26', null, null, null, null, null, '2019-03-11 11:52:01', '2019-03-11 11:52:01');
INSERT INTO `device_record_his` VALUES ('154', '100000213', null, '39960', '0', '177', '760', '169', '391', '38', '26', null, null, null, null, null, '2019-03-11 11:53:01', '2019-03-11 11:53:01');
INSERT INTO `device_record_his` VALUES ('155', '100000213', null, '37043', '0', '177', '743', '170', '391', '38', '26', null, null, null, null, null, '2019-03-11 11:54:01', '2019-03-11 11:54:01');
INSERT INTO `device_record_his` VALUES ('156', '100000213', null, '35023', '0', '177', '760', '170', '386', '38', '26', null, null, null, null, null, '2019-03-11 11:55:00', '2019-03-11 11:55:00');
INSERT INTO `device_record_his` VALUES ('157', '100000213', null, '34635', '0', '177', '741', '170', '389', '39', '27', null, null, null, null, null, '2019-03-11 11:56:01', '2019-03-11 11:56:01');
INSERT INTO `device_record_his` VALUES ('158', '100000213', null, '35567', '0', '178', '750', '170', '391', '38', '26', null, null, null, null, null, '2019-03-11 11:57:01', '2019-03-11 11:57:01');
INSERT INTO `device_record_his` VALUES ('159', '100000213', null, '43331', '0', '179', '748', '170', '391', '38', '26', null, null, null, null, null, '2019-03-11 11:58:01', '2019-03-11 11:58:01');
INSERT INTO `device_record_his` VALUES ('160', '100000213', null, '40390', '0', '183', '747', '171', '392', '38', '26', null, null, null, null, null, '2019-03-11 11:59:01', '2019-03-11 11:59:01');
INSERT INTO `device_record_his` VALUES ('161', '100000213', null, '38448', '0', '182', '743', '171', '390', '38', '26', null, null, null, null, null, '2019-03-11 12:00:01', '2019-03-11 12:00:01');
INSERT INTO `device_record_his` VALUES ('162', '100000213', null, '38914', '0', '180', '743', '171', '389', '39', '27', null, null, null, null, null, '2019-03-11 12:01:01', '2019-03-11 12:01:01');
INSERT INTO `device_record_his` VALUES ('163', '100000213', null, '39446', '0', '182', '754', '171', '388', '38', '26', null, null, null, null, null, '2019-03-11 12:02:02', '2019-03-11 12:02:02');
INSERT INTO `device_record_his` VALUES ('164', '100000213', null, '35734', '0', '183', '760', '171', '387', '38', '26', null, null, null, null, null, '2019-03-11 12:03:01', '2019-03-11 12:03:01');
INSERT INTO `device_record_his` VALUES ('165', '100000213', null, '35453', '0', '184', '746', '172', '388', '38', '26', null, null, null, null, null, '2019-03-11 12:04:01', '2019-03-11 12:04:01');
INSERT INTO `device_record_his` VALUES ('166', '100000213', null, '36147', '0', '186', '744', '171', '388', '38', '26', null, null, null, null, null, '2019-03-11 12:05:01', '2019-03-11 12:05:01');
INSERT INTO `device_record_his` VALUES ('167', '100000213', null, '35854', '0', '184', '738', '172', '388', '39', '27', null, null, null, null, null, '2019-03-11 12:06:01', '2019-03-11 12:06:01');
INSERT INTO `device_record_his` VALUES ('168', '100000213', null, '35310', '0', '184', '742', '171', '385', '38', '26', null, null, null, null, null, '2019-03-11 12:07:00', '2019-03-11 12:07:00');
INSERT INTO `device_record_his` VALUES ('169', '100000213', null, '37378', '0', '182', '738', '172', '390', '38', '26', null, null, null, null, null, '2019-03-11 12:08:01', '2019-03-11 12:08:01');
INSERT INTO `device_record_his` VALUES ('170', '100000213', null, '38179', '0', '180', '746', '172', '391', '39', '27', null, null, null, null, null, '2019-03-11 12:09:01', '2019-03-11 12:09:01');
INSERT INTO `device_record_his` VALUES ('171', '100000213', null, '38352', '0', '181', '740', '172', '387', '38', '26', null, null, null, null, null, '2019-03-11 12:10:01', '2019-03-11 12:10:01');
INSERT INTO `device_record_his` VALUES ('172', '100000213', null, '38836', '0', '184', '750', '173', '389', '38', '26', null, null, null, null, null, '2019-03-11 12:11:00', '2019-03-11 12:11:00');
INSERT INTO `device_record_his` VALUES ('173', '100000213', null, '41197', '0', '185', '746', '172', '383', '38', '26', null, null, null, null, null, '2019-03-11 12:12:01', '2019-03-11 12:12:01');
INSERT INTO `device_record_his` VALUES ('174', '100000213', null, '41197', '0', '186', '748', '172', '384', '39', '27', null, null, null, null, null, '2019-03-11 12:13:00', '2019-03-11 12:13:00');
INSERT INTO `device_record_his` VALUES ('175', '100000213', null, '38645', '0', '185', '761', '173', '382', '38', '26', null, null, null, null, null, '2019-03-11 12:14:01', '2019-03-11 12:14:01');
INSERT INTO `device_record_his` VALUES ('176', '100000213', null, '47699', '0', '185', '763', '172', '387', '39', '27', null, null, null, null, null, '2019-03-11 12:15:01', '2019-03-11 12:15:01');
INSERT INTO `device_record_his` VALUES ('177', '100000213', null, '45745', '0', '186', '755', '173', '387', '39', '27', null, null, null, null, null, '2019-03-11 12:16:01', '2019-03-11 12:16:01');
INSERT INTO `device_record_his` VALUES ('178', '100000213', null, '37193', '0', '186', '742', '173', '387', '38', '26', null, null, null, null, null, '2019-03-11 12:17:01', '2019-03-11 12:17:01');
INSERT INTO `device_record_his` VALUES ('179', '100000213', null, '38011', '0', '186', '725', '174', '383', '38', '26', null, null, null, null, null, '2019-03-11 12:18:01', '2019-03-11 12:18:01');
INSERT INTO `device_record_his` VALUES ('180', '100000213', null, '38041', '0', '185', '731', '174', '384', '38', '26', null, null, null, null, null, '2019-03-11 12:19:02', '2019-03-11 12:19:02');
INSERT INTO `device_record_his` VALUES ('181', '100000213', null, '44663', '0', '186', '746', '174', '392', '39', '27', null, null, null, null, null, '2019-03-11 12:20:01', '2019-03-11 12:20:01');
INSERT INTO `device_record_his` VALUES ('182', '100000213', null, '38502', '0', '186', '751', '174', '382', '38', '26', null, null, null, null, null, '2019-03-11 12:21:01', '2019-03-11 12:21:01');
INSERT INTO `device_record_his` VALUES ('183', '100000213', null, '37629', '0', '184', '755', '174', '392', '39', '27', null, null, null, null, null, '2019-03-11 12:22:01', '2019-03-11 12:22:01');
INSERT INTO `device_record_his` VALUES ('184', '100000213', null, '38651', '0', '185', '750', '174', '390', '38', '26', null, null, null, null, null, '2019-03-11 12:23:01', '2019-03-11 12:23:01');
INSERT INTO `device_record_his` VALUES ('185', '100000213', null, '35740', '0', '184', '756', '174', '386', '37', '25', null, null, null, null, null, '2019-03-11 12:24:01', '2019-03-11 12:24:01');
INSERT INTO `device_record_his` VALUES ('186', '100000213', null, '37605', '0', '185', '758', '175', '387', '39', '27', null, null, null, null, null, '2019-03-11 12:25:00', '2019-03-11 12:25:00');
INSERT INTO `device_record_his` VALUES ('187', '100000213', null, '33212', '0', '186', '746', '175', '385', '39', '27', null, null, null, null, null, '2019-03-11 12:26:01', '2019-03-11 12:26:01');
INSERT INTO `device_record_his` VALUES ('188', '100000213', null, '35890', '0', '185', '751', '175', '386', '39', '27', null, null, null, null, null, '2019-03-11 12:27:00', '2019-03-11 12:27:00');
INSERT INTO `device_record_his` VALUES ('189', '100000213', null, '38233', '0', '187', '729', '175', '391', '38', '26', null, null, null, null, null, '2019-03-11 12:28:01', '2019-03-11 12:28:01');
INSERT INTO `device_record_his` VALUES ('190', '100000213', null, '46761', '0', '187', '739', '175', '389', '39', '27', null, null, null, null, null, '2019-03-11 12:29:01', '2019-03-11 12:29:01');
INSERT INTO `device_record_his` VALUES ('191', '100000213', null, '40563', '0', '188', '753', '175', '390', '39', '27', null, null, null, null, null, '2019-03-11 12:30:01', '2019-03-11 12:30:01');
INSERT INTO `device_record_his` VALUES ('192', '100000213', null, '43791', '0', '187', '751', '176', '391', '39', '27', null, null, null, null, null, '2019-03-11 12:31:01', '2019-03-11 12:31:01');
INSERT INTO `device_record_his` VALUES ('193', '100000213', null, '45763', '0', '189', '747', '176', '386', '38', '26', null, null, null, null, null, '2019-03-11 12:32:01', '2019-03-11 12:32:01');
INSERT INTO `device_record_his` VALUES ('194', '100000213', null, '43133', '0', '191', '728', '176', '382', '39', '27', null, null, null, null, null, '2019-03-11 12:33:01', '2019-03-11 12:33:01');
INSERT INTO `device_record_his` VALUES ('195', '100000213', null, '45213', '0', '190', '726', '176', '384', '39', '27', null, null, null, null, null, '2019-03-11 12:34:01', '2019-03-11 12:34:01');
INSERT INTO `device_record_his` VALUES ('196', '100000213', null, '47251', '0', '194', '730', '176', '390', '39', '27', null, null, null, null, null, '2019-03-11 12:35:01', '2019-03-11 12:35:01');
INSERT INTO `device_record_his` VALUES ('197', '100000213', null, '47687', '0', '197', '710', '176', '380', '39', '27', null, null, null, null, null, '2019-03-11 12:36:01', '2019-03-11 12:36:01');
INSERT INTO `device_record_his` VALUES ('198', '100000213', null, '47843', '0', '198', '705', '176', '387', '39', '27', null, null, null, null, null, '2019-03-11 12:37:01', '2019-03-11 12:37:01');
INSERT INTO `device_record_his` VALUES ('199', '100000213', null, '46713', '0', '197', '709', '177', '383', '39', '27', null, null, null, null, null, '2019-03-11 12:38:01', '2019-03-11 12:38:01');
INSERT INTO `device_record_his` VALUES ('200', '100000213', null, '46737', '0', '191', '714', '176', '391', '39', '27', null, null, null, null, null, '2019-03-11 12:39:01', '2019-03-11 12:39:01');
INSERT INTO `device_record_his` VALUES ('201', '100000213', null, '46014', '0', '190', '719', '176', '389', '39', '27', null, null, null, null, null, '2019-03-11 12:40:01', '2019-03-11 12:40:01');
INSERT INTO `device_record_his` VALUES ('202', '100000213', null, '44884', '0', '191', '740', '177', '392', '39', '27', null, null, null, null, null, '2019-03-11 12:41:00', '2019-03-11 12:41:00');
INSERT INTO `device_record_his` VALUES ('203', '100000213', null, '45416', '0', '193', '736', '177', '392', '39', '27', null, null, null, null, null, '2019-03-11 12:42:01', '2019-03-11 12:42:01');
INSERT INTO `device_record_his` VALUES ('204', '100000213', null, '45918', '0', '192', '706', '177', '388', '39', '27', null, null, null, null, null, '2019-03-11 12:43:01', '2019-03-11 12:43:01');
INSERT INTO `device_record_his` VALUES ('205', '100000213', null, '46821', '0', '193', '716', '177', '382', '38', '26', null, null, null, null, null, '2019-03-11 12:44:00', '2019-03-11 12:44:00');
INSERT INTO `device_record_his` VALUES ('206', '100000213', null, '46576', '0', '193', '711', '177', '391', '39', '27', null, null, null, null, null, '2019-03-11 12:45:01', '2019-03-11 12:45:01');
INSERT INTO `device_record_his` VALUES ('207', '100000213', null, '46719', '0', '195', '694', '178', '386', '39', '27', null, null, null, null, null, '2019-03-11 12:46:01', '2019-03-11 12:46:01');
INSERT INTO `device_record_his` VALUES ('208', '100000213', null, '46809', '0', '194', '709', '178', '380', '39', '27', null, null, null, null, null, '2019-03-11 12:47:01', '2019-03-11 12:47:01');
INSERT INTO `device_record_his` VALUES ('209', '100000213', null, '46456', '0', '194', '724', '177', '388', '39', '27', null, null, null, null, null, '2019-03-11 12:48:01', '2019-03-11 12:48:01');
INSERT INTO `device_record_his` VALUES ('210', '100000213', null, '46905', '0', '195', '726', '178', '378', '39', '27', null, null, null, null, null, '2019-03-11 12:49:01', '2019-03-11 12:49:01');
INSERT INTO `device_record_his` VALUES ('211', '100000213', null, '46134', '0', '195', '700', '178', '385', '39', '27', null, null, null, null, null, '2019-03-11 12:50:02', '2019-03-11 12:50:02');
INSERT INTO `device_record_his` VALUES ('212', '100000213', null, '46295', '0', '195', '709', '178', '382', '39', '27', null, null, null, null, null, '2019-03-11 12:51:02', '2019-03-11 12:51:02');
INSERT INTO `device_record_his` VALUES ('213', '100000213', null, '45512', '0', '197', '706', '178', '391', '38', '26', null, null, null, null, null, '2019-03-11 12:52:01', '2019-03-11 12:52:01');
INSERT INTO `device_record_his` VALUES ('214', '100000213', null, '45655', '0', '197', '709', '178', '384', '39', '27', null, null, null, null, null, '2019-03-11 12:53:01', '2019-03-11 12:53:01');
INSERT INTO `device_record_his` VALUES ('215', '100000213', null, '44831', '0', '199', '714', '178', '382', '38', '26', null, null, null, null, null, '2019-03-11 12:54:01', '2019-03-11 12:54:01');
INSERT INTO `device_record_his` VALUES ('216', '100000213', null, '43976', '0', '201', '695', '178', '391', '39', '27', null, null, null, null, null, '2019-03-11 12:55:01', '2019-03-11 12:55:01');
INSERT INTO `device_record_his` VALUES ('217', '100000213', null, '44054', '0', '198', '686', '177', '381', '39', '27', null, null, null, null, null, '2019-03-11 12:56:01', '2019-03-11 12:56:01');
INSERT INTO `device_record_his` VALUES ('218', '100000213', null, '44191', '0', '201', '690', '178', '389', '39', '27', null, null, null, null, null, '2019-03-11 12:57:01', '2019-03-11 12:57:01');
INSERT INTO `device_record_his` VALUES ('219', '100000213', null, '42464', '0', '196', '702', '179', '390', '39', '27', null, null, null, null, null, '2019-03-11 12:58:01', '2019-03-11 12:58:01');
INSERT INTO `device_record_his` VALUES ('220', '100000213', null, '43151', '0', '197', '698', '179', '390', '39', '27', null, null, null, null, null, '2019-03-11 12:59:01', '2019-03-11 12:59:01');
INSERT INTO `device_record_his` VALUES ('221', '100000213', null, '42070', '0', '195', '692', '179', '378', '39', '27', null, null, null, null, null, '2019-03-11 13:00:01', '2019-03-11 13:00:01');
INSERT INTO `device_record_his` VALUES ('222', '100000213', null, '42225', '0', '198', '684', '179', '378', '39', '27', null, null, null, null, null, '2019-03-11 13:01:01', '2019-03-11 13:01:01');
INSERT INTO `device_record_his` VALUES ('223', '100000213', null, '41514', '0', '199', '690', '179', '384', '39', '27', null, null, null, null, null, '2019-03-11 13:02:01', '2019-03-11 13:02:01');
INSERT INTO `device_record_his` VALUES ('224', '100000213', null, '41382', '0', '197', '689', '179', '385', '39', '27', null, null, null, null, null, '2019-03-11 13:03:01', '2019-03-11 13:03:01');
INSERT INTO `device_record_his` VALUES ('225', '100000213', null, '40456', '0', '197', '695', '180', '377', '39', '26', null, null, null, null, null, '2019-03-11 13:04:01', '2019-03-11 13:04:01');
INSERT INTO `device_record_his` VALUES ('226', '100000213', null, '40611', '0', '200', '703', '179', '390', '39', '27', null, null, null, null, null, '2019-03-11 13:05:01', '2019-03-11 13:05:01');
INSERT INTO `device_record_his` VALUES ('227', '100000213', null, '39296', '0', '203', '684', '179', '390', '39', '27', null, null, null, null, null, '2019-03-11 13:06:02', '2019-03-11 13:06:02');
INSERT INTO `device_record_his` VALUES ('228', '100000213', null, '40115', '0', '200', '684', '179', '381', '39', '27', null, null, null, null, null, '2019-03-11 13:07:01', '2019-03-11 13:07:01');
INSERT INTO `device_record_his` VALUES ('229', '100000213', null, '39458', '0', '199', '686', '179', '385', '39', '27', null, null, null, null, null, '2019-03-11 13:08:01', '2019-03-11 13:08:01');
INSERT INTO `device_record_his` VALUES ('230', '100000213', null, '39201', '0', '199', '695', '180', '390', '39', '26', null, null, null, null, null, '2019-03-11 13:09:01', '2019-03-11 13:09:01');
INSERT INTO `device_record_his` VALUES ('231', '100000213', null, '38197', '0', '200', '685', '180', '378', '39', '26', null, null, null, null, null, '2019-03-11 13:10:01', '2019-03-11 13:10:01');
INSERT INTO `device_record_his` VALUES ('232', '100000213', null, '38430', '0', '198', '687', '180', '388', '39', '26', null, null, null, null, null, '2019-03-11 13:11:01', '2019-03-11 13:11:01');
INSERT INTO `device_record_his` VALUES ('233', '100000213', null, '38304', '0', '199', '684', '180', '387', '39', '26', null, null, null, null, null, '2019-03-11 13:12:01', '2019-03-11 13:12:01');
INSERT INTO `device_record_his` VALUES ('234', '100000213', null, '37731', '0', '202', '690', '181', '384', '39', '26', null, null, null, null, null, '2019-03-11 13:13:01', '2019-03-11 13:13:01');
INSERT INTO `device_record_his` VALUES ('235', '100000213', null, '37928', '0', '201', '687', '181', '388', '39', '26', null, null, null, null, null, '2019-03-11 13:14:01', '2019-03-11 13:14:01');
INSERT INTO `device_record_his` VALUES ('236', '100000213', null, '37593', '0', '204', '683', '180', '379', '38', '26', null, null, null, null, null, '2019-03-11 13:15:01', '2019-03-11 13:15:01');
INSERT INTO `device_record_his` VALUES ('237', '100000213', null, '37497', '0', '202', '680', '180', '379', '39', '26', null, null, null, null, null, '2019-03-11 13:16:02', '2019-03-11 13:16:02');
INSERT INTO `device_record_his` VALUES ('238', '100000213', null, '37462', '0', '204', '679', '180', '389', '39', '26', null, null, null, null, null, '2019-03-11 13:17:02', '2019-03-11 13:17:02');
INSERT INTO `device_record_his` VALUES ('239', '100000213', null, '37778', '0', '204', '679', '181', '387', '39', '26', null, null, null, null, null, '2019-03-11 13:18:01', '2019-03-11 13:18:01');
INSERT INTO `device_record_his` VALUES ('240', '100000213', null, '36989', '0', '204', '678', '181', '391', '39', '26', null, null, null, null, null, '2019-03-11 13:19:01', '2019-03-11 13:19:01');
INSERT INTO `device_record_his` VALUES ('241', '100000213', null, '37324', '0', '205', '682', '181', '389', '39', '26', null, null, null, null, null, '2019-03-11 13:20:02', '2019-03-11 13:20:02');
INSERT INTO `device_record_his` VALUES ('242', '100000213', null, '37312', '0', '208', '667', '181', '376', '39', '26', null, null, null, null, null, '2019-03-11 13:21:01', '2019-03-11 13:21:01');
INSERT INTO `device_record_his` VALUES ('243', '100000213', null, '37127', '0', '205', '671', '181', '376', '38', '26', null, null, null, null, null, '2019-03-11 13:22:01', '2019-03-11 13:22:01');
INSERT INTO `device_record_his` VALUES ('244', '100000213', null, '38095', '0', '208', '672', '182', '377', '39', '26', null, null, null, null, null, '2019-03-11 13:23:01', '2019-03-11 13:23:01');
INSERT INTO `device_record_his` VALUES ('245', '100000213', null, '37288', '0', '208', '663', '182', '382', '39', '26', null, null, null, null, null, '2019-03-11 13:24:01', '2019-03-11 13:24:01');
INSERT INTO `device_record_his` VALUES ('246', '100000213', null, '37874', '0', '209', '666', '182', '387', '39', '26', null, null, null, null, null, '2019-03-11 13:25:01', '2019-03-11 13:25:01');
INSERT INTO `device_record_his` VALUES ('247', '100000213', null, '37258', '0', '204', '664', '182', '376', '38', '26', null, null, null, null, null, '2019-03-11 13:26:01', '2019-03-11 13:26:01');
INSERT INTO `device_record_his` VALUES ('248', '100000213', null, '37354', '0', '204', '672', '182', '387', '38', '26', null, null, null, null, null, '2019-03-11 13:27:01', '2019-03-11 13:27:01');
INSERT INTO `device_record_his` VALUES ('249', '100000213', null, '37820', '0', '201', '675', '182', '385', '39', '26', null, null, null, null, null, '2019-03-11 13:28:01', '2019-03-11 13:28:01');
INSERT INTO `device_record_his` VALUES ('250', '100000213', null, '37653', '0', '201', '682', '182', '378', '39', '26', null, null, null, null, null, '2019-03-11 13:29:01', '2019-03-11 13:29:01');
INSERT INTO `device_record_his` VALUES ('251', '100000213', null, '37288', '0', '204', '672', '182', '385', '39', '26', null, null, null, null, null, '2019-03-11 13:30:01', '2019-03-11 13:30:01');
INSERT INTO `device_record_his` VALUES ('252', '100000213', null, '37115', '0', '208', '657', '183', '384', '39', '26', null, null, null, null, null, '2019-03-11 13:31:02', '2019-03-11 13:31:02');
INSERT INTO `device_record_his` VALUES ('253', '100000213', null, '36834', '0', '208', '653', '183', '379', '39', '26', null, null, null, null, null, '2019-03-11 13:32:01', '2019-03-11 13:32:01');
INSERT INTO `device_record_his` VALUES ('254', '100000213', null, '37013', '0', '211', '651', '182', '380', '39', '26', null, null, null, null, null, '2019-03-11 13:33:01', '2019-03-11 13:33:01');
INSERT INTO `device_record_his` VALUES ('255', '100000213', null, '36422', '0', '211', '644', '183', '383', '39', '26', null, null, null, null, null, '2019-03-11 13:34:01', '2019-03-11 13:34:01');
INSERT INTO `device_record_his` VALUES ('256', '100000213', null, '36236', '0', '212', '642', '183', '385', '38', '26', null, null, null, null, null, '2019-03-11 13:35:01', '2019-03-11 13:35:01');
INSERT INTO `device_record_his` VALUES ('257', '100000213', null, '35734', '0', '212', '631', '183', '384', '39', '26', null, null, null, null, null, '2019-03-11 13:36:01', '2019-03-11 13:36:01');
INSERT INTO `device_record_his` VALUES ('258', '100000213', null, '35208', '0', '207', '642', '183', '388', '39', '26', null, null, null, null, null, '2019-03-11 13:37:01', '2019-03-11 13:37:01');
INSERT INTO `device_record_his` VALUES ('259', '100000213', null, '35011', '0', '208', '645', '183', '377', '38', '26', null, null, null, null, null, '2019-03-11 13:38:01', '2019-03-11 13:38:01');
INSERT INTO `device_record_his` VALUES ('260', '100000213', null, '34910', '0', '210', '636', '184', '386', '39', '26', null, null, null, null, null, '2019-03-11 13:39:01', '2019-03-11 13:39:01');
INSERT INTO `device_record_his` VALUES ('261', '100000213', null, '34868', '0', '210', '642', '184', '376', '39', '26', null, null, null, null, null, '2019-03-11 13:40:01', '2019-03-11 13:40:01');
INSERT INTO `device_record_his` VALUES ('262', '100000213', null, '34736', '0', '207', '648', '183', '388', '39', '26', null, null, null, null, null, '2019-03-11 13:41:01', '2019-03-11 13:41:01');
INSERT INTO `device_record_his` VALUES ('263', '100000213', null, '34623', '0', '204', '653', '184', '388', '39', '26', null, null, null, null, null, '2019-03-11 13:42:01', '2019-03-11 13:42:01');
INSERT INTO `device_record_his` VALUES ('264', '100000213', null, '34163', '0', '204', '644', '184', '388', '39', '26', null, null, null, null, null, '2019-03-11 13:43:01', '2019-03-11 13:43:01');
INSERT INTO `device_record_his` VALUES ('265', '100000213', null, '34503', '0', '207', '651', '184', '378', '39', '26', null, null, null, null, null, '2019-03-11 13:44:01', '2019-03-11 13:44:01');
INSERT INTO `device_record_his` VALUES ('266', '100000213', null, '34330', '0', '209', '645', '184', '388', '39', '26', null, null, null, null, null, '2019-03-11 13:45:01', '2019-03-11 13:45:01');
INSERT INTO `device_record_his` VALUES ('267', '100000213', null, '34342', '0', '211', '643', '184', '378', '39', '26', null, null, null, null, null, '2019-03-11 13:46:01', '2019-03-11 13:46:01');
INSERT INTO `device_record_his` VALUES ('268', '100000213', null, '34276', '0', '215', '634', '184', '389', '39', '26', null, null, null, null, null, '2019-03-11 13:47:01', '2019-03-11 13:47:01');
INSERT INTO `device_record_his` VALUES ('269', '100000213', null, '34192', '0', '216', '621', '185', '384', '39', '26', null, null, null, null, null, '2019-03-11 13:48:01', '2019-03-11 13:48:01');
INSERT INTO `device_record_his` VALUES ('270', '100000213', null, '34163', '0', '218', '623', '184', '382', '39', '26', null, null, null, null, null, '2019-03-11 13:49:01', '2019-03-11 13:49:01');
INSERT INTO `device_record_his` VALUES ('271', '100000213', null, '34186', '0', '217', '605', '185', '385', '39', '26', null, null, null, null, null, '2019-03-11 13:50:02', '2019-03-11 13:50:02');
INSERT INTO `device_record_his` VALUES ('272', '100000213', null, '34503', '0', '218', '628', '187', '383', '40', '27', null, null, null, null, null, '2019-03-11 13:51:02', '2019-03-11 13:51:02');
INSERT INTO `device_record_his` VALUES ('273', '100000213', null, '34635', '0', '218', '611', '186', '374', '39', '26', null, null, null, null, null, '2019-03-11 13:52:01', '2019-03-11 13:52:01');
INSERT INTO `device_record_his` VALUES ('274', '100000213', null, '34808', '0', '218', '619', '186', '380', '39', '26', null, null, null, null, null, '2019-03-11 13:53:01', '2019-03-11 13:53:01');
INSERT INTO `device_record_his` VALUES ('275', '100000213', null, '35077', '0', '217', '614', '186', '382', '39', '26', null, null, null, null, null, '2019-03-11 13:54:01', '2019-03-11 13:54:01');
INSERT INTO `device_record_his` VALUES ('276', '100000213', null, '35489', '0', '215', '621', '187', '377', '39', '26', null, null, null, null, null, '2019-03-11 13:55:01', '2019-03-11 13:55:01');
INSERT INTO `device_record_his` VALUES ('277', '100000213', null, '35944', '0', '217', '631', '187', '382', '39', '26', null, null, null, null, null, '2019-03-11 13:56:01', '2019-03-11 13:56:01');
INSERT INTO `device_record_his` VALUES ('278', '100000213', null, '36715', '0', '220', '612', '187', '382', '39', '26', null, null, null, null, null, '2019-03-11 13:57:01', '2019-03-11 13:57:01');
INSERT INTO `device_record_his` VALUES ('279', '100000213', null, '37127', '0', '220', '608', '188', '377', '39', '26', null, null, null, null, null, '2019-03-11 13:58:01', '2019-03-11 13:58:01');
INSERT INTO `device_record_his` VALUES ('280', '100000213', null, '37683', '0', '218', '611', '188', '377', '40', '27', null, null, null, null, null, '2019-03-11 13:59:00', '2019-03-11 13:59:00');
INSERT INTO `device_record_his` VALUES ('281', '100000213', null, '38113', '0', '218', '621', '188', '378', '40', '27', null, null, null, null, null, '2019-03-11 14:00:01', '2019-03-11 14:00:01');
INSERT INTO `device_record_his` VALUES ('282', '100000213', null, '39255', '0', '216', '615', '190', '378', '40', '27', null, null, null, null, null, '2019-03-11 14:01:01', '2019-03-11 14:01:01');
INSERT INTO `device_record_his` VALUES ('283', '100000213', null, '39733', '0', '215', '621', '190', '378', '39', '26', null, null, null, null, null, '2019-03-11 14:02:01', '2019-03-11 14:02:01');
INSERT INTO `device_record_his` VALUES ('284', '100000213', null, '40516', '0', '215', '619', '189', '378', '40', '27', null, null, null, null, null, '2019-03-11 14:03:01', '2019-03-11 14:03:01');
INSERT INTO `device_record_his` VALUES ('285', '100000213', null, '41048', '0', '214', '621', '190', '377', '40', '27', null, null, null, null, null, '2019-03-11 14:04:01', '2019-03-11 14:04:01');
INSERT INTO `device_record_his` VALUES ('286', '100000213', null, '41484', '0', '216', '621', '190', '380', '40', '27', null, null, null, null, null, '2019-03-11 14:05:01', '2019-03-11 14:05:01');
INSERT INTO `device_record_his` VALUES ('287', '100000213', null, '41962', '0', '214', '629', '191', '378', '40', '27', null, null, null, null, null, '2019-03-11 14:06:01', '2019-03-11 14:06:01');
INSERT INTO `device_record_his` VALUES ('288', '100000213', null, '42870', '0', '215', '619', '191', '380', '40', '27', null, null, null, null, null, '2019-03-11 14:07:01', '2019-03-11 14:07:01');
INSERT INTO `device_record_his` VALUES ('289', '100000213', null, '43366', '0', '205', '639', '191', '377', '40', '27', null, null, null, null, null, '2019-03-11 14:08:01', '2019-03-11 14:08:01');
INSERT INTO `device_record_his` VALUES ('290', '100000213', null, '43504', '0', '208', '649', '192', '377', '40', '26', null, null, null, null, null, '2019-03-11 14:09:01', '2019-03-11 14:09:01');
INSERT INTO `device_record_his` VALUES ('291', '100000213', null, '44012', '0', '212', '640', '192', '375', '40', '26', null, null, null, null, null, '2019-03-11 14:10:01', '2019-03-11 14:10:01');
INSERT INTO `device_record_his` VALUES ('292', '100000213', null, '44143', '0', '213', '651', '193', '374', '40', '26', null, null, null, null, null, '2019-03-11 14:11:01', '2019-03-11 14:11:01');
INSERT INTO `device_record_his` VALUES ('293', '100000213', null, '44317', '0', '212', '629', '193', '375', '40', '26', null, null, null, null, null, '2019-03-11 14:12:01', '2019-03-11 14:12:01');
INSERT INTO `device_record_his` VALUES ('294', '100000213', null, '43785', '0', '214', '632', '193', '376', '40', '26', null, null, null, null, null, '2019-03-11 14:13:01', '2019-03-11 14:13:01');
INSERT INTO `device_record_his` VALUES ('295', '100000213', null, '43719', '0', '218', '630', '194', '374', '40', '26', null, null, null, null, null, '2019-03-11 14:14:01', '2019-03-11 14:14:01');
INSERT INTO `device_record_his` VALUES ('296', '100000213', null, '44245', '0', '221', '636', '193', '378', '41', '27', null, null, null, null, null, '2019-03-11 14:15:01', '2019-03-11 14:15:01');
INSERT INTO `device_record_his` VALUES ('297', '100000213', null, '44179', '0', '225', '631', '194', '372', '40', '26', null, null, null, null, null, '2019-03-11 14:16:00', '2019-03-11 14:16:00');
INSERT INTO `device_record_his` VALUES ('298', '100000213', null, '43839', '0', '225', '615', '194', '374', '40', '26', null, null, null, null, null, '2019-03-11 14:17:00', '2019-03-11 14:17:00');
INSERT INTO `device_record_his` VALUES ('299', '100000213', null, '44119', '0', '225', '616', '195', '378', '41', '27', null, null, null, null, null, '2019-03-11 14:18:01', '2019-03-11 14:18:01');
INSERT INTO `device_record_his` VALUES ('300', '100000213', null, '45207', '0', '222', '620', '195', '377', '40', '26', null, null, null, null, null, '2019-03-11 14:19:01', '2019-03-11 14:19:01');
INSERT INTO `device_record_his` VALUES ('301', '100000213', null, '45398', '0', '220', '623', '195', '380', '40', '26', null, null, null, null, null, '2019-03-11 14:20:02', '2019-03-11 14:20:02');
INSERT INTO `device_record_his` VALUES ('302', '100000213', null, '45106', '0', '220', '619', '195', '377', '41', '27', null, null, null, null, null, '2019-03-11 14:21:01', '2019-03-11 14:21:01');
INSERT INTO `device_record_his` VALUES ('303', '100000213', null, '44663', '0', '220', '618', '196', '375', '40', '26', null, null, null, null, null, '2019-03-11 14:22:00', '2019-03-11 14:22:00');
INSERT INTO `device_record_his` VALUES ('304', '100000213', null, '45004', '0', '220', '615', '196', '376', '40', '26', null, null, null, null, null, '2019-03-11 14:23:01', '2019-03-11 14:23:01');
INSERT INTO `device_record_his` VALUES ('305', '100000213', null, '45118', '0', '220', '615', '196', '375', '40', '26', null, null, null, null, null, '2019-03-11 14:24:01', '2019-03-11 14:24:01');
INSERT INTO `device_record_his` VALUES ('306', '100000213', null, '44460', '0', '217', '621', '196', '377', '41', '27', null, null, null, null, null, '2019-03-11 14:25:01', '2019-03-11 14:25:01');
INSERT INTO `device_record_his` VALUES ('307', '100000213', null, '43289', '0', '216', '635', '196', '376', '40', '26', null, null, null, null, null, '2019-03-11 14:26:00', '2019-03-11 14:26:00');
INSERT INTO `device_record_his` VALUES ('308', '100000213', null, '43600', '0', '214', '634', '197', '376', '41', '27', null, null, null, null, null, '2019-03-11 14:27:01', '2019-03-11 14:27:01');
INSERT INTO `device_record_his` VALUES ('309', '100000213', null, '43809', '0', '216', '642', '197', '376', '41', '27', null, null, null, null, null, '2019-03-11 14:28:01', '2019-03-11 14:28:01');
INSERT INTO `device_record_his` VALUES ('310', '100000213', null, '44149', '0', '218', '630', '198', '376', '40', '26', null, null, null, null, null, '2019-03-11 14:29:01', '2019-03-11 14:29:01');
INSERT INTO `device_record_his` VALUES ('311', '100000213', null, '43910', '0', '220', '632', '197', '376', '40', '26', null, null, null, null, null, '2019-03-11 14:30:01', '2019-03-11 14:30:01');
INSERT INTO `device_record_his` VALUES ('312', '100000213', null, '43695', '0', '222', '624', '198', '378', '40', '26', null, null, null, null, null, '2019-03-11 14:31:01', '2019-03-11 14:31:01');
INSERT INTO `device_record_his` VALUES ('313', '100000213', null, '43151', '0', '224', '624', '197', '375', '40', '26', null, null, null, null, null, '2019-03-11 14:32:01', '2019-03-11 14:32:01');
INSERT INTO `device_record_his` VALUES ('314', '100000213', null, '43528', '0', '224', '618', '198', '376', '40', '26', null, null, null, null, null, '2019-03-11 14:33:01', '2019-03-11 14:33:01');
INSERT INTO `device_record_his` VALUES ('315', '100000213', null, '42739', '0', '222', '622', '198', '374', '40', '26', null, null, null, null, null, '2019-03-11 14:34:01', '2019-03-11 14:34:01');
INSERT INTO `device_record_his` VALUES ('316', '100000213', null, '42978', '0', '218', '621', '199', '374', '41', '27', null, null, null, null, null, '2019-03-11 14:35:01', '2019-03-11 14:35:01');
INSERT INTO `device_record_his` VALUES ('317', '100000213', null, '43062', '0', '218', '621', '198', '374', '40', '26', null, null, null, null, null, '2019-03-11 14:36:01', '2019-03-11 14:36:01');
INSERT INTO `device_record_his` VALUES ('318', '100000213', null, '43235', '0', '220', '624', '199', '376', '40', '26', null, null, null, null, null, '2019-03-11 14:37:01', '2019-03-11 14:37:01');
INSERT INTO `device_record_his` VALUES ('319', '100000213', null, '44873', '0', '222', '631', '199', '377', '41', '27', null, null, null, null, null, '2019-03-11 14:38:01', '2019-03-11 14:38:01');
INSERT INTO `device_record_his` VALUES ('320', '100000213', null, '45064', '0', '224', '614', '199', '373', '40', '26', null, null, null, null, null, '2019-03-11 14:39:01', '2019-03-11 14:39:01');
INSERT INTO `device_record_his` VALUES ('321', '100000213', null, '44167', '0', '224', '623', '199', '378', '40', '26', null, null, null, null, null, '2019-03-11 14:40:01', '2019-03-11 14:40:01');
INSERT INTO `device_record_his` VALUES ('322', '100000213', null, '42817', '0', '226', '614', '199', '373', '40', '26', null, null, null, null, null, '2019-03-11 14:41:01', '2019-03-11 14:41:01');
INSERT INTO `device_record_his` VALUES ('323', '100000213', null, '42518', '0', '231', '612', '199', '377', '40', '26', null, null, null, null, null, '2019-03-11 14:42:01', '2019-03-11 14:42:01');
INSERT INTO `device_record_his` VALUES ('324', '100000213', null, '42476', '0', '234', '597', '199', '376', '40', '26', null, null, null, null, null, '2019-03-11 14:43:00', '2019-03-11 14:43:00');
INSERT INTO `device_record_his` VALUES ('325', '100000213', null, '43253', '0', '235', '597', '199', '377', '40', '26', null, null, null, null, null, '2019-03-11 14:44:01', '2019-03-11 14:44:01');
INSERT INTO `device_record_his` VALUES ('326', '100000213', null, '44006', '0', '228', '598', '199', '375', '41', '27', null, null, null, null, null, '2019-03-11 14:45:01', '2019-03-11 14:45:01');
INSERT INTO `device_record_his` VALUES ('327', '100000213', null, '44185', '0', '229', '601', '199', '374', '40', '26', null, null, null, null, null, '2019-03-11 14:46:01', '2019-03-11 14:46:01');
INSERT INTO `device_record_his` VALUES ('328', '100000213', null, '43851', '0', '227', '605', '199', '375', '41', '27', null, null, null, null, null, '2019-03-11 14:47:01', '2019-03-11 14:47:01');
INSERT INTO `device_record_his` VALUES ('329', '100000213', null, '43229', '0', '226', '609', '199', '373', '41', '27', null, null, null, null, null, '2019-03-11 14:48:01', '2019-03-11 14:48:01');
INSERT INTO `device_record_his` VALUES ('330', '100000213', null, '43259', '0', '223', '609', '200', '374', '41', '27', null, null, null, null, null, '2019-03-11 14:49:01', '2019-03-11 14:49:01');
INSERT INTO `device_record_his` VALUES ('331', '100000213', null, '42589', '0', '225', '619', '200', '375', '40', '26', null, null, null, null, null, '2019-03-11 14:50:01', '2019-03-11 14:50:01');
INSERT INTO `device_record_his` VALUES ('332', '100000213', null, '42924', '0', '225', '613', '200', '372', '41', '27', null, null, null, null, null, '2019-03-11 14:51:01', '2019-03-11 14:51:01');
INSERT INTO `device_record_his` VALUES ('333', '100000213', null, '42799', '0', '223', '618', '200', '379', '40', '26', null, null, null, null, null, '2019-03-11 14:52:01', '2019-03-11 14:52:01');
INSERT INTO `device_record_his` VALUES ('334', '100000213', null, '42482', '0', '225', '604', '200', '374', '41', '27', null, null, null, null, null, '2019-03-11 14:53:00', '2019-03-11 14:53:00');
INSERT INTO `device_record_his` VALUES ('335', '100000213', null, '41030', '0', '225', '606', '201', '378', '40', '26', null, null, null, null, null, '2019-03-11 14:54:01', '2019-03-11 14:54:01');
INSERT INTO `device_record_his` VALUES ('336', '100000213', null, '40396', '0', '227', '597', '200', '373', '41', '27', null, null, null, null, null, '2019-03-11 14:55:00', '2019-03-11 14:55:00');
INSERT INTO `device_record_his` VALUES ('337', '100000213', null, '39918', '0', '224', '606', '201', '378', '40', '26', null, null, null, null, null, '2019-03-11 14:56:01', '2019-03-11 14:56:01');
INSERT INTO `device_record_his` VALUES ('338', '100000213', null, '40277', '0', '225', '603', '201', '374', '40', '26', null, null, null, null, null, '2019-03-11 14:57:00', '2019-03-11 14:57:00');
INSERT INTO `device_record_his` VALUES ('339', '100000213', null, '40504', '0', '227', '605', '201', '376', '41', '27', null, null, null, null, null, '2019-03-11 14:58:01', '2019-03-11 14:58:01');
INSERT INTO `device_record_his` VALUES ('340', '100000213', null, '40677', '0', '228', '599', '201', '374', '40', '26', null, null, null, null, null, '2019-03-11 14:59:01', '2019-03-11 14:59:01');
INSERT INTO `device_record_his` VALUES ('341', '100000213', null, '25251', '0', '221', '583', '203', '370', '40', '26', null, null, null, null, null, '2019-03-11 16:22:02', '2019-03-11 16:22:02');
INSERT INTO `device_record_his` VALUES ('342', '100000213', null, '24732', '0', '218', '597', '203', '376', '40', '26', null, null, null, null, null, '2019-03-11 16:23:01', '2019-03-11 16:23:01');
INSERT INTO `device_record_his` VALUES ('343', '100000213', null, '24128', '0', '216', '604', '203', '377', '40', '26', null, null, null, null, null, '2019-03-11 16:24:01', '2019-03-11 16:24:01');
INSERT INTO `device_record_his` VALUES ('344', '100000213', null, '23560', '0', '218', '599', '203', '375', '40', '26', null, null, null, null, null, '2019-03-11 16:25:01', '2019-03-11 16:25:01');
INSERT INTO `device_record_his` VALUES ('345', '100000213', null, '23441', '0', '216', '589', '202', '374', '40', '26', null, null, null, null, null, '2019-03-11 16:26:04', '2019-03-11 16:26:04');
INSERT INTO `device_record_his` VALUES ('346', '100000213', null, '23124', '0', '217', '588', '203', '374', '40', '26', null, null, null, null, null, '2019-03-11 16:27:01', '2019-03-11 16:27:01');
INSERT INTO `device_record_his` VALUES ('347', '100000213', null, '22867', '0', '217', '587', '202', '373', '40', '26', null, null, null, null, null, '2019-03-11 16:28:01', '2019-03-11 16:28:01');
INSERT INTO `device_record_his` VALUES ('348', '100000213', null, '22694', '0', '215', '589', '203', '370', '40', '26', null, null, null, null, null, '2019-03-11 16:29:01', '2019-03-11 16:29:01');
INSERT INTO `device_record_his` VALUES ('349', '100000213', null, '22580', '0', '215', '593', '203', '369', '40', '26', null, null, null, null, null, '2019-03-11 16:30:01', '2019-03-11 16:30:01');
INSERT INTO `device_record_his` VALUES ('350', '100000213', null, '22263', '0', '214', '593', '203', '376', '40', '26', null, null, null, null, null, '2019-03-11 16:31:01', '2019-03-11 16:31:01');
INSERT INTO `device_record_his` VALUES ('351', '100000213', null, '22191', '0', '213', '598', '203', '374', '40', '26', null, null, null, null, null, '2019-03-11 16:32:01', '2019-03-11 16:32:01');
INSERT INTO `device_record_his` VALUES ('352', '100000213', null, '21982', '0', '215', '592', '202', '368', '40', '26', null, null, null, null, null, '2019-03-11 16:33:01', '2019-03-11 16:33:01');
INSERT INTO `device_record_his` VALUES ('353', '100000213', null, '21642', '0', '212', '601', '203', '374', '40', '26', null, null, null, null, null, '2019-03-11 16:34:01', '2019-03-11 16:34:01');
INSERT INTO `device_record_his` VALUES ('354', '100000213', null, '21253', '0', '214', '600', '203', '373', '40', '26', null, null, null, null, null, '2019-03-11 16:35:00', '2019-03-11 16:35:00');
INSERT INTO `device_record_his` VALUES ('355', '100000213', null, '20930', '0', '213', '599', '203', '375', '40', '26', null, null, null, null, null, '2019-03-11 16:36:01', '2019-03-11 16:36:01');
INSERT INTO `device_record_his` VALUES ('356', '100000213', null, '20548', '0', '214', '596', '203', '373', '40', '26', null, null, null, null, null, '2019-03-11 16:37:01', '2019-03-11 16:37:01');
INSERT INTO `device_record_his` VALUES ('357', '100000213', null, '20243', '0', '216', '597', '203', '370', '40', '26', null, null, null, null, null, '2019-03-11 16:38:01', '2019-03-11 16:38:01');
INSERT INTO `device_record_his` VALUES ('358', '100000213', null, '19944', '0', '217', '590', '203', '372', '40', '26', null, null, null, null, null, '2019-03-11 16:39:01', '2019-03-11 16:39:01');
INSERT INTO `device_record_his` VALUES ('359', '100000213', null, '19663', '0', '218', '594', '203', '370', '41', '27', null, null, null, null, null, '2019-03-11 16:40:01', '2019-03-11 16:40:01');
INSERT INTO `device_record_his` VALUES ('360', '100000213', null, '19335', '0', '216', '593', '202', '373', '40', '26', null, null, null, null, null, '2019-03-11 16:41:01', '2019-03-11 16:41:01');
INSERT INTO `device_record_his` VALUES ('361', '100000213', null, '19143', '0', '216', '602', '202', '370', '40', '26', null, null, null, null, null, '2019-03-11 16:42:01', '2019-03-11 16:42:01');
INSERT INTO `device_record_his` VALUES ('362', '100000213', null, '18809', '0', '216', '599', '203', '374', '40', '26', null, null, null, null, null, '2019-03-11 16:43:01', '2019-03-11 16:43:01');
INSERT INTO `device_record_his` VALUES ('363', '100000213', null, '18492', '0', '218', '595', '202', '376', '40', '26', null, null, null, null, null, '2019-03-11 16:44:01', '2019-03-11 16:44:01');
INSERT INTO `device_record_his` VALUES ('364', '100000213', null, '18277', '0', '219', '592', '202', '374', '40', '26', null, null, null, null, null, '2019-03-11 16:45:01', '2019-03-11 16:45:01');
INSERT INTO `device_record_his` VALUES ('365', '100000213', null, '18008', '0', '219', '594', '202', '373', '40', '26', null, null, null, null, null, '2019-03-11 16:46:01', '2019-03-11 16:46:01');
INSERT INTO `device_record_his` VALUES ('366', '100000213', null, '17739', '0', '217', '592', '202', '369', '40', '26', null, null, null, null, null, '2019-03-11 16:47:01', '2019-03-11 16:47:01');
INSERT INTO `device_record_his` VALUES ('367', '100000213', null, '17446', '0', '215', '598', '203', '376', '40', '26', null, null, null, null, null, '2019-03-11 16:48:01', '2019-03-11 16:48:01');
INSERT INTO `device_record_his` VALUES ('368', '100000213', null, '17135', '0', '215', '602', '202', '372', '40', '26', null, null, null, null, null, '2019-03-11 16:49:01', '2019-03-11 16:49:01');
INSERT INTO `device_record_his` VALUES ('369', '100000213', null, '16807', '0', '216', '601', '203', '371', '40', '26', null, null, null, null, null, '2019-03-11 16:50:01', '2019-03-11 16:50:01');
INSERT INTO `device_record_his` VALUES ('370', '100000213', null, '16574', '0', '216', '602', '202', '368', '40', '26', null, null, null, null, null, '2019-03-11 16:51:01', '2019-03-11 16:51:01');
INSERT INTO `device_record_his` VALUES ('371', '100000213', null, '16293', '0', '216', '603', '203', '374', '40', '26', null, null, null, null, null, '2019-03-11 16:52:01', '2019-03-11 16:52:01');
INSERT INTO `device_record_his` VALUES ('372', '100000213', null, '16048', '0', '215', '605', '202', '368', '41', '27', null, null, null, null, null, '2019-03-11 16:53:01', '2019-03-11 16:53:01');
INSERT INTO `device_record_his` VALUES ('373', '100000213', null, '15641', '0', '214', '607', '202', '376', '40', '26', null, null, null, null, null, '2019-03-11 16:54:01', '2019-03-11 16:54:01');
INSERT INTO `device_record_his` VALUES ('374', '100000213', null, '15444', '0', '215', '603', '202', '373', '40', '26', null, null, null, null, null, '2019-03-11 16:55:01', '2019-03-11 16:55:01');
INSERT INTO `device_record_his` VALUES ('375', '100000213', null, '15205', '0', '215', '600', '202', '368', '40', '26', null, null, null, null, null, '2019-03-11 16:56:01', '2019-03-11 16:56:01');
INSERT INTO `device_record_his` VALUES ('376', '100000213', null, '15026', '0', '216', '602', '202', '369', '40', '26', null, null, null, null, null, '2019-03-11 16:57:00', '2019-03-11 16:57:00');
INSERT INTO `device_record_his` VALUES ('377', '100000213', null, '14787', '0', '216', '601', '202', '376', '40', '26', null, null, null, null, null, '2019-03-11 16:58:01', '2019-03-11 16:58:01');
INSERT INTO `device_record_his` VALUES ('378', '100000213', null, '14583', '0', '215', '604', '202', '371', '40', '26', null, null, null, null, null, '2019-03-11 16:59:01', '2019-03-11 16:59:01');
INSERT INTO `device_record_his` VALUES ('379', '100000213', null, '14380', '0', '215', '604', '202', '376', '40', '26', null, null, null, null, null, '2019-03-11 17:00:01', '2019-03-11 17:00:01');
INSERT INTO `device_record_his` VALUES ('380', '100000213', null, '14039', '0', '215', '596', '202', '373', '41', '27', null, null, null, null, null, '2019-03-11 17:01:01', '2019-03-11 17:01:01');
INSERT INTO `device_record_his` VALUES ('381', '100000213', null, '13860', '0', '215', '602', '202', '372', '40', '26', null, null, null, null, null, '2019-03-11 17:02:03', '2019-03-11 17:02:03');
INSERT INTO `device_record_his` VALUES ('382', '100000213', null, '13621', '0', '215', '598', '202', '368', '40', '26', null, null, null, null, null, '2019-03-11 17:03:01', '2019-03-11 17:03:01');
INSERT INTO `device_record_his` VALUES ('383', '100000213', null, '13376', '0', '217', '598', '202', '374', '41', '27', null, null, null, null, null, '2019-03-11 17:04:01', '2019-03-11 17:04:01');
INSERT INTO `device_record_his` VALUES ('384', '100000213', null, '13197', '0', '218', '595', '202', '374', '40', '26', null, null, null, null, null, '2019-03-11 17:05:01', '2019-03-11 17:05:01');
INSERT INTO `device_record_his` VALUES ('385', '100000213', null, '12952', '0', '217', '596', '202', '373', '40', '26', null, null, null, null, null, '2019-03-11 17:06:01', '2019-03-11 17:06:01');
INSERT INTO `device_record_his` VALUES ('386', '100000213', null, '12641', '0', '216', '600', '202', '375', '40', '26', null, null, null, null, null, '2019-03-11 17:07:01', '2019-03-11 17:07:01');
INSERT INTO `device_record_his` VALUES ('387', '100000213', null, '12372', '0', '214', '607', '202', '370', '40', '26', null, null, null, null, null, '2019-03-11 17:08:01', '2019-03-11 17:08:01');
INSERT INTO `device_record_his` VALUES ('388', '100000213', null, '12139', '0', '214', '611', '202', '372', '40', '26', null, null, null, null, null, '2019-03-11 17:09:01', '2019-03-11 17:09:01');
INSERT INTO `device_record_his` VALUES ('389', '100000213', null, '11948', '0', '212', '612', '202', '369', '40', '26', null, null, null, null, null, '2019-03-11 17:10:01', '2019-03-11 17:10:01');
INSERT INTO `device_record_his` VALUES ('390', '100000213', null, '11667', '0', '210', '627', '202', '374', '40', '26', null, null, null, null, null, '2019-03-11 17:11:01', '2019-03-11 17:11:01');
INSERT INTO `device_record_his` VALUES ('391', '100000213', null, '11422', '0', '212', '626', '202', '375', '40', '26', null, null, null, null, null, '2019-03-11 17:12:00', '2019-03-11 17:12:00');
INSERT INTO `device_record_his` VALUES ('392', '100000213', null, '11236', '0', '213', '622', '202', '375', '40', '26', null, null, null, null, null, '2019-03-11 17:13:01', '2019-03-11 17:13:01');
INSERT INTO `device_record_his` VALUES ('393', '100000213', null, '11027', '0', '212', '622', '202', '375', '40', '26', null, null, null, null, null, '2019-03-11 17:14:01', '2019-03-11 17:14:01');
INSERT INTO `device_record_his` VALUES ('394', '100000213', null, '10824', '0', '211', '626', '202', '369', '39', '25', null, null, null, null, null, '2019-03-11 17:15:01', '2019-03-11 17:15:01');
INSERT INTO `device_record_his` VALUES ('395', '100000213', null, '10663', '0', '211', '632', '202', '375', '40', '26', null, null, null, null, null, '2019-03-11 17:16:01', '2019-03-11 17:16:01');
INSERT INTO `device_record_his` VALUES ('396', '100000213', null, '10448', '0', '213', '624', '202', '374', '40', '26', null, null, null, null, null, '2019-03-11 17:17:01', '2019-03-11 17:17:01');
INSERT INTO `device_record_his` VALUES ('397', '100000213', null, '10191', '0', '214', '624', '202', '373', '40', '26', null, null, null, null, null, '2019-03-11 17:18:01', '2019-03-11 17:18:01');
INSERT INTO `device_record_his` VALUES ('398', '100000213', null, '9928', '0', '214', '620', '201', '373', '40', '26', null, null, null, null, null, '2019-03-11 17:19:01', '2019-03-11 17:19:01');
INSERT INTO `device_record_his` VALUES ('399', '100000213', null, '9689', '0', '211', '629', '202', '373', '40', '26', null, null, null, null, null, '2019-03-11 17:20:01', '2019-03-11 17:20:01');
INSERT INTO `device_record_his` VALUES ('400', '100000213', null, '9545', '0', '211', '628', '202', '373', '40', '26', null, null, null, null, null, '2019-03-11 17:21:01', '2019-03-11 17:21:01');
INSERT INTO `device_record_his` VALUES ('401', '100000213', null, '9336', '0', '211', '631', '201', '373', '40', '26', null, null, null, null, null, '2019-03-11 17:22:01', '2019-03-11 17:22:01');
INSERT INTO `device_record_his` VALUES ('402', '100000213', null, '9121', '0', '212', '629', '202', '371', '40', '26', null, null, null, null, null, '2019-03-11 17:23:04', '2019-03-11 17:23:04');
INSERT INTO `device_record_his` VALUES ('403', '100000213', null, '8846', '0', '211', '629', '202', '370', '40', '26', null, null, null, null, null, '2019-03-11 17:24:01', '2019-03-11 17:24:01');
INSERT INTO `device_record_his` VALUES ('404', '100000213', null, '8678', '0', '209', '633', '202', '376', '40', '26', null, null, null, null, null, '2019-03-11 17:25:04', '2019-03-11 17:25:04');
INSERT INTO `device_record_his` VALUES ('405', '100000213', null, '8505', '0', '210', '641', '201', '372', '40', '26', null, null, null, null, null, '2019-03-11 17:26:01', '2019-03-11 17:26:01');
INSERT INTO `device_record_his` VALUES ('406', '100000213', null, '8314', '0', '210', '635', '202', '376', '40', '26', null, null, null, null, null, '2019-03-11 17:27:01', '2019-03-11 17:27:01');
INSERT INTO `device_record_his` VALUES ('407', '100000213', null, '8147', '0', '210', '637', '201', '370', '40', '26', null, null, null, null, null, '2019-03-11 17:28:01', '2019-03-11 17:28:01');
INSERT INTO `device_record_his` VALUES ('408', '100000213', null, '7902', '0', '211', '636', '201', '374', '40', '26', null, null, null, null, null, '2019-03-11 17:29:01', '2019-03-11 17:29:01');
INSERT INTO `device_record_his` VALUES ('409', '100000213', null, '7686', '0', '210', '635', '202', '367', '40', '26', null, null, null, null, null, '2019-03-11 17:30:01', '2019-03-11 17:30:01');
INSERT INTO `device_record_his` VALUES ('410', '100000213', null, '7513', '0', '211', '630', '202', '376', '40', '26', null, null, null, null, null, '2019-03-11 17:31:01', '2019-03-11 17:31:01');
INSERT INTO `device_record_his` VALUES ('411', '100000213', null, '7310', '0', '211', '630', '201', '374', '40', '26', null, null, null, null, null, '2019-03-11 17:32:01', '2019-03-11 17:32:01');
INSERT INTO `device_record_his` VALUES ('412', '100000213', null, '7137', '0', '210', '630', '201', '370', '40', '26', null, null, null, null, null, '2019-03-11 17:33:01', '2019-03-11 17:33:01');
INSERT INTO `device_record_his` VALUES ('413', '100000213', null, '6939', '0', '209', '630', '201', '369', '40', '26', null, null, null, null, null, '2019-03-11 17:34:01', '2019-03-11 17:34:01');
INSERT INTO `device_record_his` VALUES ('414', '100000213', null, '6742', '0', '208', '632', '201', '371', '40', '26', null, null, null, null, null, '2019-03-11 17:35:10', '2019-03-11 17:35:10');
INSERT INTO `device_record_his` VALUES ('415', '100000213', null, '6611', '0', '209', '638', '202', '366', '41', '27', null, null, null, null, null, '2019-03-11 17:36:01', '2019-03-11 17:36:01');
INSERT INTO `device_record_his` VALUES ('416', '100000213', null, '6455', '0', '209', '637', '201', '365', '40', '26', null, null, null, null, null, '2019-03-11 17:37:01', '2019-03-11 17:37:01');
INSERT INTO `device_record_his` VALUES ('417', '100000213', null, '6282', '0', '209', '639', '201', '378', '40', '26', null, null, null, null, null, '2019-03-11 17:38:01', '2019-03-11 17:38:01');
INSERT INTO `device_record_his` VALUES ('418', '100000213', null, '6138', '0', '209', '641', '201', '371', '40', '26', null, null, null, null, null, '2019-03-11 17:39:01', '2019-03-11 17:39:01');
INSERT INTO `device_record_his` VALUES ('419', '100000213', null, '5977', '0', '209', '638', '202', '377', '40', '26', null, null, null, null, null, '2019-03-11 17:40:01', '2019-03-11 17:40:01');
INSERT INTO `device_record_his` VALUES ('420', '100000213', null, '5810', '0', '208', '637', '201', '379', '40', '26', null, null, null, null, null, '2019-03-11 17:41:03', '2019-03-11 17:41:03');
INSERT INTO `device_record_his` VALUES ('421', '100000213', null, '5660', '0', '209', '637', '201', '377', '40', '26', null, null, null, null, null, '2019-03-11 17:42:04', '2019-03-11 17:42:04');
INSERT INTO `device_record_his` VALUES ('422', '100000213', null, '5487', '0', '208', '639', '201', '375', '40', '26', null, null, null, null, null, '2019-03-11 17:43:01', '2019-03-11 17:43:01');
INSERT INTO `device_record_his` VALUES ('423', '100000213', null, '5350', '0', '208', '636', '201', '370', '40', '26', null, null, null, null, null, '2019-03-11 17:44:01', '2019-03-11 17:44:01');
INSERT INTO `device_record_his` VALUES ('424', '100000213', null, '5176', '0', '207', '643', '201', '369', '40', '26', null, null, null, null, null, '2019-03-11 17:45:04', '2019-03-11 17:45:04');
INSERT INTO `device_record_his` VALUES ('425', '100000213', null, '5033', '0', '208', '644', '202', '377', '41', '27', null, null, null, null, null, '2019-03-11 17:46:01', '2019-03-11 17:46:01');
INSERT INTO `device_record_his` VALUES ('426', '100000213', null, '4883', '0', '208', '642', '201', '377', '40', '26', null, null, null, null, null, '2019-03-11 17:47:01', '2019-03-11 17:47:01');
INSERT INTO `device_record_his` VALUES ('427', '100000213', null, '4728', '0', '208', '641', '202', '372', '40', '26', null, null, null, null, null, '2019-03-11 17:48:01', '2019-03-11 17:48:01');
INSERT INTO `device_record_his` VALUES ('428', '100000213', null, '4602', '0', '208', '641', '201', '369', '40', '26', null, null, null, null, null, '2019-03-11 17:49:01', '2019-03-11 17:49:01');
INSERT INTO `device_record_his` VALUES ('429', '100000213', null, '4447', '0', '208', '645', '201', '368', '40', '26', null, null, null, null, null, '2019-03-11 17:50:01', '2019-03-11 17:50:01');
INSERT INTO `device_record_his` VALUES ('430', '100000213', null, '4328', '0', '208', '643', '201', '377', '40', '26', null, null, null, null, null, '2019-03-11 17:51:01', '2019-03-11 17:51:01');
INSERT INTO `device_record_his` VALUES ('431', '100000213', null, '4184', '0', '208', '646', '201', '371', '40', '26', null, null, null, null, null, '2019-03-11 17:52:00', '2019-03-11 17:52:00');
INSERT INTO `device_record_his` VALUES ('432', '100000213', null, '4053', '0', '207', '644', '200', '369', '40', '26', null, null, null, null, null, '2019-03-11 17:53:01', '2019-03-11 17:53:01');
INSERT INTO `device_record_his` VALUES ('433', '100000213', null, '3939', '0', '207', '645', '201', '379', '40', '26', null, null, null, null, null, '2019-03-11 17:54:00', '2019-03-11 17:54:00');
INSERT INTO `device_record_his` VALUES ('434', '100000213', null, '3802', '0', '207', '646', '200', '366', '40', '26', null, null, null, null, null, '2019-03-11 17:55:01', '2019-03-11 17:55:01');
INSERT INTO `device_record_his` VALUES ('435', '100000213', null, '3694', '0', '207', '650', '201', '369', '40', '26', null, null, null, null, null, '2019-03-11 17:56:01', '2019-03-11 17:56:01');
INSERT INTO `device_record_his` VALUES ('436', '100000213', null, '3580', '0', '207', '642', '201', '379', '40', '26', null, null, null, null, null, '2019-03-11 17:57:01', '2019-03-11 17:57:01');
INSERT INTO `device_record_his` VALUES ('437', '100000213', null, '3461', '0', '207', '641', '201', '378', '41', '27', null, null, null, null, null, '2019-03-11 17:58:01', '2019-03-11 17:58:01');
INSERT INTO `device_record_his` VALUES ('438', '100000213', null, '3365', '0', '208', '638', '200', '376', '40', '26', null, null, null, null, null, '2019-03-11 17:59:01', '2019-03-11 17:59:01');
INSERT INTO `device_record_his` VALUES ('439', '100000213', null, '3240', '0', '207', '642', '201', '363', '41', '27', null, null, null, null, null, '2019-03-11 18:00:01', '2019-03-11 18:00:01');
INSERT INTO `device_record_his` VALUES ('440', '100000213', null, '3120', '0', '207', '643', '201', '368', '41', '27', null, null, null, null, null, '2019-03-11 18:01:01', '2019-03-11 18:01:01');
INSERT INTO `device_record_his` VALUES ('441', '100000213', null, '3001', '0', '206', '647', '201', '369', '40', '26', null, null, null, null, null, '2019-03-11 18:02:01', '2019-03-11 18:02:01');
INSERT INTO `device_record_his` VALUES ('442', '100000213', null, '2869', '0', '206', '650', '201', '374', '41', '27', null, null, null, null, null, '2019-03-11 18:03:01', '2019-03-11 18:03:01');
INSERT INTO `device_record_his` VALUES ('443', '100000213', null, '2762', '0', '206', '651', '201', '379', '40', '26', null, null, null, null, null, '2019-03-11 18:04:01', '2019-03-11 18:04:01');
INSERT INTO `device_record_his` VALUES ('444', '100000213', null, '2642', '0', '206', '654', '200', '367', '39', '25', null, null, null, null, null, '2019-03-11 18:05:01', '2019-03-11 18:05:01');
INSERT INTO `device_record_his` VALUES ('445', '100000213', null, '2541', '0', '206', '655', '200', '372', '40', '26', null, null, null, null, null, '2019-03-11 18:06:00', '2019-03-11 18:06:00');
INSERT INTO `device_record_his` VALUES ('446', '100000213', null, '2427', '0', '206', '658', '199', '378', '40', '26', null, null, null, null, null, '2019-03-11 18:07:01', '2019-03-11 18:07:01');
INSERT INTO `device_record_his` VALUES ('447', '100000213', null, '2313', '0', '205', '659', '200', '376', '40', '26', null, null, null, null, null, '2019-03-11 18:08:01', '2019-03-11 18:08:01');
INSERT INTO `device_record_his` VALUES ('448', '100000213', null, '2218', '0', '205', '660', '199', '368', '40', '26', null, null, null, null, null, '2019-03-11 18:09:01', '2019-03-11 18:09:01');
INSERT INTO `device_record_his` VALUES ('449', '100000213', null, '2110', '0', '204', '663', '199', '370', '40', '26', null, null, null, null, null, '2019-03-11 18:10:02', '2019-03-11 18:10:02');
INSERT INTO `device_record_his` VALUES ('450', '100000213', null, '2027', '0', '204', '655', '200', '367', '40', '26', null, null, null, null, null, '2019-03-11 18:11:01', '2019-03-11 18:11:01');
INSERT INTO `device_record_his` VALUES ('451', '100000213', null, '1931', '0', '204', '655', '199', '379', '40', '26', null, null, null, null, null, '2019-03-11 18:12:01', '2019-03-11 18:12:01');
INSERT INTO `device_record_his` VALUES ('452', '100000213', null, '1835', '0', '204', '658', '201', '371', '40', '26', null, null, null, null, null, '2019-03-11 18:13:01', '2019-03-11 18:13:01');
INSERT INTO `device_record_his` VALUES ('453', '100000213', null, '1746', '0', '204', '662', '199', '372', '40', '26', null, null, null, null, null, '2019-03-11 18:14:00', '2019-03-11 18:14:00');
INSERT INTO `device_record_his` VALUES ('454', '100000213', null, '1656', '0', '204', '664', '199', '374', '40', '26', null, null, null, null, null, '2019-03-11 18:15:01', '2019-03-11 18:15:01');
INSERT INTO `device_record_his` VALUES ('455', '100000213', null, '1578', '0', '204', '657', '199', '368', '40', '26', null, null, null, null, null, '2019-03-11 18:16:01', '2019-03-11 18:16:01');
INSERT INTO `device_record_his` VALUES ('456', '100000213', null, '1489', '0', '203', '655', '199', '380', '40', '26', null, null, null, null, null, '2019-03-11 18:17:01', '2019-03-11 18:17:01');
INSERT INTO `device_record_his` VALUES ('457', '100000213', null, '1405', '0', '202', '657', '199', '370', '39', '25', null, null, null, null, null, '2019-03-11 18:18:01', '2019-03-11 18:18:01');
INSERT INTO `device_record_his` VALUES ('458', '100000213', null, '1321', '0', '202', '662', '199', '378', '41', '27', null, null, null, null, null, '2019-03-11 18:19:00', '2019-03-11 18:19:00');
INSERT INTO `device_record_his` VALUES ('459', '100000213', null, '1226', '0', '202', '666', '199', '372', '40', '26', null, null, null, null, null, '2019-03-11 18:20:01', '2019-03-11 18:20:01');
INSERT INTO `device_record_his` VALUES ('460', '100000213', null, '1142', '0', '202', '669', '198', '379', '40', '26', null, null, null, null, null, '2019-03-11 18:21:01', '2019-03-11 18:21:01');
INSERT INTO `device_record_his` VALUES ('461', '100000213', null, '1070', '0', '202', '669', '199', '378', '40', '26', null, null, null, null, null, '2019-03-11 18:22:01', '2019-03-11 18:22:01');
INSERT INTO `device_record_his` VALUES ('462', '100000213', null, '987', '0', '202', '671', '199', '368', '40', '26', null, null, null, null, null, '2019-03-11 18:23:01', '2019-03-11 18:23:01');
INSERT INTO `device_record_his` VALUES ('463', '100000213', null, '921', '0', '201', '671', '199', '379', '39', '25', null, null, null, null, null, '2019-03-11 18:24:01', '2019-03-11 18:24:01');
INSERT INTO `device_record_his` VALUES ('464', '100000213', null, '26393', '0', '219', '708', '164', '374', '38', '27', null, null, null, null, null, '2019-03-12 08:56:02', '2019-03-12 08:56:02');
INSERT INTO `device_record_his` VALUES ('465', '100000213', null, '26722', '0', '222', '707', '164', '382', '38', '27', null, null, null, null, null, '2019-03-12 08:57:01', '2019-03-12 08:57:01');
INSERT INTO `device_record_his` VALUES ('466', '100000213', null, '26626', '0', '221', '720', '165', '381', '38', '27', null, null, null, null, null, '2019-03-12 08:58:01', '2019-03-12 08:58:01');
INSERT INTO `device_record_his` VALUES ('467', '100000213', null, '26716', '0', '221', '727', '165', '379', '38', '27', null, null, null, null, null, '2019-03-12 08:59:01', '2019-03-12 08:59:01');
INSERT INTO `device_record_his` VALUES ('468', '100000213', null, '27236', '0', '223', '719', '164', '377', '38', '27', null, null, null, null, null, '2019-03-12 09:00:01', '2019-03-12 09:00:01');
INSERT INTO `device_record_his` VALUES ('469', '100000213', null, '27194', '0', '224', '715', '165', '378', '38', '27', null, null, null, null, null, '2019-03-12 09:01:01', '2019-03-12 09:01:01');
INSERT INTO `device_record_his` VALUES ('470', '100000213', null, '27714', '0', '222', '716', '166', '377', '38', '27', null, null, null, null, null, '2019-03-12 09:02:00', '2019-03-12 09:02:00');
INSERT INTO `device_record_his` VALUES ('471', '100000213', null, '27630', '0', '220', '733', '165', '379', '38', '27', null, null, null, null, null, '2019-03-12 09:03:01', '2019-03-12 09:03:01');
INSERT INTO `device_record_his` VALUES ('472', '100000213', null, '27809', '0', '218', '738', '165', '377', '38', '27', null, null, null, null, null, '2019-03-12 09:04:01', '2019-03-12 09:04:01');
INSERT INTO `device_record_his` VALUES ('473', '100000213', null, '28060', '0', '219', '741', '166', '376', '38', '27', null, null, null, null, null, '2019-03-12 09:05:01', '2019-03-12 09:05:01');
INSERT INTO `device_record_his` VALUES ('474', '100000213', null, '28311', '0', '220', '738', '165', '381', '38', '27', null, null, null, null, null, '2019-03-12 09:06:01', '2019-03-12 09:06:01');
INSERT INTO `device_record_his` VALUES ('475', '100000213', null, '28258', '0', '222', '729', '166', '380', '38', '27', null, null, null, null, null, '2019-03-12 09:07:01', '2019-03-12 09:07:01');
INSERT INTO `device_record_his` VALUES ('476', '100000213', null, '28885', '0', '222', '729', '166', '375', '38', '27', null, null, null, null, null, '2019-03-12 09:08:01', '2019-03-12 09:08:01');
INSERT INTO `device_record_his` VALUES ('477', '100000213', null, '29256', '0', '223', '727', '166', '381', '38', '27', null, null, null, null, null, '2019-03-12 09:09:01', '2019-03-12 09:09:01');
INSERT INTO `device_record_his` VALUES ('478', '100000213', null, '29339', '0', '225', '722', '167', '374', '38', '27', null, null, null, null, null, '2019-03-12 09:10:01', '2019-03-12 09:10:01');
INSERT INTO `device_record_his` VALUES ('479', '100000213', null, '29537', '0', '224', '718', '166', '377', '38', '27', null, null, null, null, null, '2019-03-12 09:11:10', '2019-03-12 09:11:10');
INSERT INTO `device_record_his` VALUES ('480', '100000213', null, '29513', '0', '223', '724', '167', '377', '38', '27', null, null, null, null, null, '2019-03-12 09:12:01', '2019-03-12 09:12:01');
INSERT INTO `device_record_his` VALUES ('481', '100000213', null, '29973', '0', '223', '724', '167', '377', '38', '27', null, null, null, null, null, '2019-03-12 09:13:01', '2019-03-12 09:13:01');
INSERT INTO `device_record_his` VALUES ('482', '100000213', null, '30146', '0', '222', '719', '167', '377', '38', '27', null, null, null, null, null, '2019-03-12 09:14:01', '2019-03-12 09:14:01');
INSERT INTO `device_record_his` VALUES ('483', '100000213', null, '30236', '0', '221', '726', '167', '379', '38', '27', null, null, null, null, null, '2019-03-12 09:15:01', '2019-03-12 09:15:01');
INSERT INTO `device_record_his` VALUES ('484', '100000213', null, '30332', '0', '223', '725', '167', '378', '38', '27', null, null, null, null, null, '2019-03-12 09:16:01', '2019-03-12 09:16:01');
INSERT INTO `device_record_his` VALUES ('485', '100000213', null, '30332', '0', '222', '733', '167', '381', '38', '27', null, null, null, null, null, '2019-03-12 09:17:01', '2019-03-12 09:17:01');
INSERT INTO `device_record_his` VALUES ('486', '100000213', null, '30732', '0', '223', '725', '168', '374', '38', '27', null, null, null, null, null, '2019-03-12 09:18:01', '2019-03-12 09:18:01');
INSERT INTO `device_record_his` VALUES ('487', '100000213', null, '31228', '0', '224', '717', '168', '378', '38', '27', null, null, null, null, null, '2019-03-12 09:19:01', '2019-03-12 09:19:01');
INSERT INTO `device_record_his` VALUES ('488', '100000213', null, '31413', '0', '225', '717', '168', '381', '38', '27', null, null, null, null, null, '2019-03-12 09:20:01', '2019-03-12 09:20:01');
INSERT INTO `device_record_his` VALUES ('489', '100000213', null, '31533', '0', '226', '713', '168', '379', '38', '27', null, null, null, null, null, '2019-03-12 09:21:02', '2019-03-12 09:21:02');
INSERT INTO `device_record_his` VALUES ('490', '100000213', null, '31682', '0', '226', '709', '170', '374', '38', '26', null, null, null, null, null, '2019-03-12 09:22:00', '2019-03-12 09:22:00');
INSERT INTO `device_record_his` VALUES ('491', '100000213', null, '31784', '0', '229', '704', '168', '380', '38', '27', null, null, null, null, null, '2019-03-12 09:23:01', '2019-03-12 09:23:01');
INSERT INTO `device_record_his` VALUES ('492', '100000213', null, '32698', '0', '230', '699', '169', '375', '39', '27', null, null, null, null, null, '2019-03-12 09:24:01', '2019-03-12 09:24:01');
INSERT INTO `device_record_his` VALUES ('493', '100000213', null, '33015', '0', '233', '691', '169', '379', '39', '27', null, null, null, null, null, '2019-03-12 09:25:02', '2019-03-12 09:25:02');
INSERT INTO `device_record_his` VALUES ('494', '100000213', null, '33260', '0', '234', '677', '169', '379', '38', '26', null, null, null, null, null, '2019-03-12 09:26:01', '2019-03-12 09:26:01');
INSERT INTO `device_record_his` VALUES ('495', '100000213', null, '33517', '0', '234', '683', '169', '380', '38', '26', null, null, null, null, null, '2019-03-12 09:27:01', '2019-03-12 09:27:01');
INSERT INTO `device_record_his` VALUES ('496', '100000213', null, '33051', '0', '232', '687', '170', '380', '38', '26', null, null, null, null, null, '2019-03-12 09:28:01', '2019-03-12 09:28:01');
INSERT INTO `device_record_his` VALUES ('497', '100000213', null, '33218', '0', '230', '689', '169', '376', '39', '27', null, null, null, null, null, '2019-03-12 09:29:01', '2019-03-12 09:29:01');
INSERT INTO `device_record_his` VALUES ('498', '100000213', null, '33798', '0', '229', '694', '169', '375', '38', '26', null, null, null, null, null, '2019-03-12 09:30:01', '2019-03-12 09:30:01');
INSERT INTO `device_record_his` VALUES ('499', '100000213', null, '33607', '0', '231', '691', '170', '375', '38', '26', null, null, null, null, null, '2019-03-12 09:31:01', '2019-03-12 09:31:01');
INSERT INTO `device_record_his` VALUES ('500', '100000213', null, '33660', '0', '230', '689', '170', '375', '38', '26', null, null, null, null, null, '2019-03-12 09:32:01', '2019-03-12 09:32:01');
INSERT INTO `device_record_his` VALUES ('501', '100000213', null, '34163', '0', '230', '684', '170', '373', '39', '27', null, null, null, null, null, '2019-03-12 09:33:01', '2019-03-12 09:33:01');
INSERT INTO `device_record_his` VALUES ('502', '100000213', null, '35185', '0', '232', '672', '171', '381', '39', '27', null, null, null, null, null, '2019-03-12 09:34:01', '2019-03-12 09:34:01');
INSERT INTO `device_record_his` VALUES ('503', '100000213', null, '35752', '0', '231', '679', '171', '375', '38', '26', null, null, null, null, null, '2019-03-12 09:35:01', '2019-03-12 09:35:01');
INSERT INTO `device_record_his` VALUES ('504', '100000213', null, '35675', '0', '236', '666', '171', '382', '39', '27', null, null, null, null, null, '2019-03-12 09:36:01', '2019-03-12 09:36:01');
INSERT INTO `device_record_his` VALUES ('505', '100000213', null, '35836', '0', '236', '656', '171', '378', '39', '27', null, null, null, null, null, '2019-03-12 09:37:01', '2019-03-12 09:37:01');
INSERT INTO `device_record_his` VALUES ('506', '100000213', null, '36344', '0', '237', '657', '171', '376', '39', '27', null, null, null, null, null, '2019-03-12 09:38:01', '2019-03-12 09:38:01');
INSERT INTO `device_record_his` VALUES ('507', '100000213', null, '36786', '0', '234', '651', '172', '381', '39', '27', null, null, null, null, null, '2019-03-12 09:39:00', '2019-03-12 09:39:00');
INSERT INTO `device_record_his` VALUES ('508', '100000213', null, '36123', '0', '233', '661', '172', '380', '39', '27', null, null, null, null, null, '2019-03-12 09:40:00', '2019-03-12 09:40:00');
INSERT INTO `device_record_his` VALUES ('509', '100000213', null, '36972', '0', '235', '653', '172', '373', '38', '26', null, null, null, null, null, '2019-03-12 09:41:01', '2019-03-12 09:41:01');
INSERT INTO `device_record_his` VALUES ('510', '100000213', null, '36673', '0', '235', '635', '172', '382', '38', '26', null, null, null, null, null, '2019-03-12 09:42:01', '2019-03-12 09:42:01');
INSERT INTO `device_record_his` VALUES ('511', '100000213', null, '35220', '0', '230', '654', '172', '383', '39', '27', null, null, null, null, null, '2019-03-12 09:43:01', '2019-03-12 09:43:01');
INSERT INTO `device_record_his` VALUES ('512', '100000213', null, '35244', '0', '231', '649', '172', '370', '39', '27', null, null, null, null, null, '2019-03-12 09:44:01', '2019-03-12 09:44:01');
INSERT INTO `device_record_his` VALUES ('513', '100000213', null, '37432', '0', '233', '638', '173', '380', '39', '27', null, null, null, null, null, '2019-03-12 09:45:01', '2019-03-12 09:45:01');
INSERT INTO `device_record_his` VALUES ('514', '100000213', null, '38645', '0', '234', '625', '173', '380', '39', '27', null, null, null, null, null, '2019-03-12 09:46:01', '2019-03-12 09:46:01');
INSERT INTO `device_record_his` VALUES ('515', '100000213', null, '39494', '0', '236', '620', '174', '379', '39', '27', null, null, null, null, null, '2019-03-12 09:47:01', '2019-03-12 09:47:01');
INSERT INTO `device_record_his` VALUES ('516', '100000213', null, '39458', '0', '235', '615', '174', '382', '39', '27', null, null, null, null, null, '2019-03-12 09:48:01', '2019-03-12 09:48:01');
INSERT INTO `device_record_his` VALUES ('517', '100000213', null, '39368', '0', '234', '603', '174', '375', '39', '27', null, null, null, null, null, '2019-03-12 09:49:01', '2019-03-12 09:49:01');
INSERT INTO `device_record_his` VALUES ('518', '100000213', null, '39416', '0', '227', '621', '174', '372', '39', '27', null, null, null, null, null, '2019-03-12 09:50:01', '2019-03-12 09:50:01');
INSERT INTO `device_record_his` VALUES ('519', '100000213', null, '40008', '0', '225', '629', '175', '373', '39', '27', null, null, null, null, null, '2019-03-12 09:51:01', '2019-03-12 09:51:01');
INSERT INTO `device_record_his` VALUES ('520', '100000213', null, '40271', '0', '224', '642', '174', '381', '39', '27', null, null, null, null, null, '2019-03-12 09:52:01', '2019-03-12 09:52:01');
INSERT INTO `device_record_his` VALUES ('521', '100000213', null, '39954', '0', '228', '630', '175', '370', '39', '27', null, null, null, null, null, '2019-03-12 09:53:02', '2019-03-12 09:53:02');
INSERT INTO `device_record_his` VALUES ('522', '100000213', null, '39589', '0', '219', '630', '175', '376', '39', '27', null, null, null, null, null, '2019-03-12 09:54:02', '2019-03-12 09:54:02');
INSERT INTO `device_record_his` VALUES ('523', '100000213', null, '40791', '0', '217', '643', '175', '382', '39', '27', null, null, null, null, null, '2019-03-12 09:55:01', '2019-03-12 09:55:01');
INSERT INTO `device_record_his` VALUES ('524', '100000213', null, '40522', '0', '221', '635', '175', '378', '39', '27', null, null, null, null, null, '2019-03-12 09:56:01', '2019-03-12 09:56:01');
INSERT INTO `device_record_his` VALUES ('525', '100000213', null, '41795', '0', '223', '628', '176', '372', '39', '27', null, null, null, null, null, '2019-03-12 09:58:01', '2019-03-12 09:58:01');
INSERT INTO `device_record_his` VALUES ('526', '100000213', null, '41281', '0', '228', '620', '176', '378', '39', '27', null, null, null, null, null, '2019-03-12 09:59:01', '2019-03-12 09:59:01');
INSERT INTO `device_record_his` VALUES ('527', '100000213', null, '41472', '0', '227', '623', '176', '374', '39', '27', null, null, null, null, null, '2019-03-12 10:00:01', '2019-03-12 10:00:01');
INSERT INTO `device_record_his` VALUES ('528', '100000213', null, '41161', '0', '229', '618', '177', '370', '39', '27', null, null, null, null, null, '2019-03-12 10:01:01', '2019-03-12 10:01:01');
INSERT INTO `device_record_his` VALUES ('529', '100000213', null, '41621', '0', '229', '617', '177', '377', '39', '27', null, null, null, null, null, '2019-03-12 10:02:01', '2019-03-12 10:02:01');
INSERT INTO `device_record_his` VALUES ('530', '100000213', null, '41747', '0', '225', '628', '177', '381', '39', '27', null, null, null, null, null, '2019-03-12 10:03:02', '2019-03-12 10:03:02');
INSERT INTO `device_record_his` VALUES ('531', '100000213', null, '42434', '0', '224', '632', '178', '370', '39', '27', null, null, null, null, null, '2019-03-12 10:04:01', '2019-03-12 10:04:01');
INSERT INTO `device_record_his` VALUES ('532', '100000213', null, '42667', '0', '227', '626', '177', '373', '39', '27', null, null, null, null, null, '2019-03-12 10:05:01', '2019-03-12 10:05:01');
INSERT INTO `device_record_his` VALUES ('533', '100000213', null, '42554', '0', '225', '627', '178', '371', '39', '27', null, null, null, null, null, '2019-03-12 10:06:01', '2019-03-12 10:06:01');
INSERT INTO `device_record_his` VALUES ('534', '100000213', null, '43414', '0', '226', '624', '178', '378', '39', '27', null, null, null, null, null, '2019-03-12 10:07:01', '2019-03-12 10:07:01');
INSERT INTO `device_record_his` VALUES ('535', '100000213', null, '43301', '0', '226', '623', '178', '371', '39', '27', null, null, null, null, null, '2019-03-12 10:08:01', '2019-03-12 10:08:01');
INSERT INTO `device_record_his` VALUES ('536', '100000213', null, '42972', '0', '226', '610', '178', '373', '39', '27', null, null, null, null, null, '2019-03-12 10:09:01', '2019-03-12 10:09:01');
INSERT INTO `device_record_his` VALUES ('537', '100000213', null, '43205', '0', '225', '614', '179', '378', '39', '27', null, null, null, null, null, '2019-03-12 10:10:01', '2019-03-12 10:10:01');
INSERT INTO `device_record_his` VALUES ('538', '100000213', null, '43839', '0', '227', '618', '179', '371', '39', '27', null, null, null, null, null, '2019-03-12 10:11:01', '2019-03-12 10:11:01');
INSERT INTO `device_record_his` VALUES ('539', '100000213', null, '44323', '0', '229', '596', '178', '380', '40', '27', null, null, null, null, null, '2019-03-12 10:12:01', '2019-03-12 10:12:01');
INSERT INTO `device_record_his` VALUES ('540', '100000213', null, '44114', '0', '222', '611', '179', '370', '39', '27', null, null, null, null, null, '2019-03-12 10:13:01', '2019-03-12 10:13:01');
INSERT INTO `device_record_his` VALUES ('541', '100000213', null, '45130', '0', '217', '624', '179', '375', '39', '27', null, null, null, null, null, '2019-03-12 10:14:01', '2019-03-12 10:14:01');
INSERT INTO `device_record_his` VALUES ('542', '100000213', null, '45100', '0', '216', '630', '180', '380', '39', '26', null, null, null, null, null, '2019-03-12 10:15:01', '2019-03-12 10:15:01');
INSERT INTO `device_record_his` VALUES ('543', '100000213', null, '45135', '0', '217', '627', '180', '378', '39', '26', null, null, null, null, null, '2019-03-12 10:16:01', '2019-03-12 10:16:01');
INSERT INTO `device_record_his` VALUES ('544', '100000213', null, '45004', '0', '213', '613', '180', '373', '40', '27', null, null, null, null, null, '2019-03-12 10:17:01', '2019-03-12 10:17:01');
INSERT INTO `device_record_his` VALUES ('545', '100000213', null, '44795', '0', '209', '646', '180', '372', '39', '26', null, null, null, null, null, '2019-03-12 10:18:01', '2019-03-12 10:18:01');
INSERT INTO `device_record_his` VALUES ('546', '100000213', null, '44956', '0', '209', '646', '180', '380', '40', '27', null, null, null, null, null, '2019-03-12 10:19:01', '2019-03-12 10:19:01');
INSERT INTO `device_record_his` VALUES ('547', '100000213', null, '45237', '0', '213', '641', '180', '370', '39', '26', null, null, null, null, null, '2019-03-12 10:20:01', '2019-03-12 10:20:01');
INSERT INTO `device_record_his` VALUES ('548', '100000213', null, '45291', '0', '216', '633', '181', '374', '39', '26', null, null, null, null, null, '2019-03-12 10:21:01', '2019-03-12 10:21:01');
INSERT INTO `device_record_his` VALUES ('549', '100000213', null, '45225', '0', '214', '631', '182', '376', '40', '27', null, null, null, null, null, '2019-03-12 10:22:01', '2019-03-12 10:22:01');
INSERT INTO `device_record_his` VALUES ('550', '100000213', null, '44896', '0', '212', '642', '181', '370', '39', '26', null, null, null, null, null, '2019-03-12 10:23:01', '2019-03-12 10:23:01');
INSERT INTO `device_record_his` VALUES ('551', '100000213', null, '44932', '0', '214', '645', '181', '378', '39', '26', null, null, null, null, null, '2019-03-12 10:24:01', '2019-03-12 10:24:01');
INSERT INTO `device_record_his` VALUES ('552', '100000213', null, '45877', '0', '216', '635', '182', '380', '39', '26', null, null, null, null, null, '2019-03-12 10:25:01', '2019-03-12 10:25:01');
INSERT INTO `device_record_his` VALUES ('553', '100000213', null, '46468', '0', '214', '637', '182', '371', '39', '26', null, null, null, null, null, '2019-03-12 10:26:01', '2019-03-12 10:26:01');
INSERT INTO `device_record_his` VALUES ('554', '100000213', null, '46648', '0', '218', '633', '182', '370', '40', '27', null, null, null, null, null, '2019-03-12 10:27:01', '2019-03-12 10:27:01');
INSERT INTO `device_record_his` VALUES ('555', '100000213', null, '46809', '0', '221', '624', '183', '370', '40', '27', null, null, null, null, null, '2019-03-12 10:28:01', '2019-03-12 10:28:01');
INSERT INTO `device_record_his` VALUES ('556', '100000213', null, '46486', '0', '215', '637', '183', '376', '40', '27', null, null, null, null, null, '2019-03-12 10:29:01', '2019-03-12 10:29:01');
INSERT INTO `device_record_his` VALUES ('557', '100000213', null, '46689', '0', '216', '640', '183', '378', '39', '26', null, null, null, null, null, '2019-03-12 10:30:01', '2019-03-12 10:30:01');
INSERT INTO `device_record_his` VALUES ('558', '100000213', null, '46498', '0', '219', '640', '183', '369', '40', '27', null, null, null, null, null, '2019-03-12 10:31:01', '2019-03-12 10:31:01');
INSERT INTO `device_record_his` VALUES ('559', '100000213', null, '46648', '0', '217', '643', '183', '377', '40', '27', null, null, null, null, null, '2019-03-12 10:32:01', '2019-03-12 10:32:01');
INSERT INTO `device_record_his` VALUES ('560', '100000213', null, '46982', '0', '214', '657', '183', '369', '40', '27', null, null, null, null, null, '2019-03-12 10:33:01', '2019-03-12 10:33:01');
INSERT INTO `device_record_his` VALUES ('561', '100000213', null, '46857', '0', '216', '658', '184', '375', '40', '27', null, null, null, null, null, '2019-03-12 10:34:01', '2019-03-12 10:34:01');
INSERT INTO `device_record_his` VALUES ('562', '100000213', null, '46701', '0', '217', '651', '184', '376', '40', '27', null, null, null, null, null, '2019-03-12 10:35:01', '2019-03-12 10:35:01');
INSERT INTO `device_record_his` VALUES ('563', '100000213', null, '45990', '0', '220', '644', '184', '375', '40', '27', null, null, null, null, null, '2019-03-12 10:36:01', '2019-03-12 10:36:01');
INSERT INTO `device_record_his` VALUES ('564', '100000213', null, '46994', '0', '218', '646', '185', '368', '40', '27', null, null, null, null, null, '2019-03-12 10:37:01', '2019-03-12 10:37:01');
INSERT INTO `device_record_his` VALUES ('565', '100000213', null, '47986', '0', '211', '666', '184', '375', '40', '27', null, null, null, null, null, '2019-03-12 10:38:01', '2019-03-12 10:38:01');
INSERT INTO `device_record_his` VALUES ('566', '100000213', null, '47556', '0', '214', '667', '184', '372', '40', '27', null, null, null, null, null, '2019-03-12 10:39:01', '2019-03-12 10:39:01');
INSERT INTO `device_record_his` VALUES ('567', '100000213', null, '47992', '0', '217', '658', '184', '376', '40', '27', null, null, null, null, null, '2019-03-12 10:40:01', '2019-03-12 10:40:01');
INSERT INTO `device_record_his` VALUES ('568', '100000213', null, '48512', '0', '220', '646', '184', '375', '40', '27', null, null, null, null, null, '2019-03-12 10:41:01', '2019-03-12 10:41:01');
INSERT INTO `device_record_his` VALUES ('569', '100000213', null, '47950', '0', '218', '645', '186', '372', '40', '27', null, null, null, null, null, '2019-03-12 10:42:01', '2019-03-12 10:42:01');
INSERT INTO `device_record_his` VALUES ('570', '100000213', null, '48130', '0', '215', '661', '185', '375', '41', '28', null, null, null, null, null, '2019-03-12 10:43:01', '2019-03-12 10:43:01');
INSERT INTO `device_record_his` VALUES ('571', '100000213', null, '48363', '0', '217', '653', '185', '373', '40', '27', null, null, null, null, null, '2019-03-12 10:44:01', '2019-03-12 10:44:01');
INSERT INTO `device_record_his` VALUES ('572', '100000213', null, '49241', '0', '221', '638', '186', '373', '40', '27', null, null, null, null, null, '2019-03-12 10:45:01', '2019-03-12 10:45:01');
INSERT INTO `device_record_his` VALUES ('573', '100000213', null, '49014', '0', '222', '634', '186', '372', '40', '27', null, null, null, null, null, '2019-03-12 10:46:00', '2019-03-12 10:46:00');
INSERT INTO `device_record_his` VALUES ('574', '100000213', null, '49074', '0', '224', '631', '186', '374', '40', '27', null, null, null, null, null, '2019-03-12 10:47:11', '2019-03-12 10:47:11');
INSERT INTO `device_record_his` VALUES ('575', '100000213', null, '49409', '0', '224', '619', '186', '372', '40', '27', null, null, null, null, null, '2019-03-12 10:48:01', '2019-03-12 10:48:01');
INSERT INTO `device_record_his` VALUES ('576', '100000213', null, '49600', '0', '224', '619', '187', '373', '41', '27', null, null, null, null, null, '2019-03-12 10:49:01', '2019-03-12 10:49:01');
INSERT INTO `device_record_his` VALUES ('577', '100000213', null, '49684', '0', '224', '610', '187', '377', '40', '27', null, null, null, null, null, '2019-03-12 10:50:01', '2019-03-12 10:50:01');
INSERT INTO `device_record_his` VALUES ('578', '100000213', null, '49379', '0', '225', '616', '187', '376', '40', '27', null, null, null, null, null, '2019-03-12 10:51:01', '2019-03-12 10:51:01');
INSERT INTO `device_record_his` VALUES ('579', '100000213', null, '49492', '0', '215', '633', '187', '369', '41', '27', null, null, null, null, null, '2019-03-12 10:52:01', '2019-03-12 10:52:01');
INSERT INTO `device_record_his` VALUES ('580', '100000213', null, '49451', '0', '210', '657', '187', '373', '40', '27', null, null, null, null, null, '2019-03-12 10:53:01', '2019-03-12 10:53:01');
INSERT INTO `device_record_his` VALUES ('581', '100000213', null, '49588', '0', '214', '656', '187', '372', '40', '27', null, null, null, null, null, '2019-03-12 10:54:01', '2019-03-12 10:54:01');
INSERT INTO `device_record_his` VALUES ('582', '100000213', null, '49265', '0', '212', '653', '187', '373', '40', '27', null, null, null, null, null, '2019-03-12 10:55:01', '2019-03-12 10:55:01');
INSERT INTO `device_record_his` VALUES ('583', '100000213', null, '49672', '0', '214', '658', '187', '368', '40', '27', null, null, null, null, null, '2019-03-12 10:56:01', '2019-03-12 10:56:01');
INSERT INTO `device_record_his` VALUES ('584', '100000213', null, '49678', '0', '215', '644', '187', '371', '41', '27', null, null, null, null, null, '2019-03-12 10:57:01', '2019-03-12 10:57:01');
INSERT INTO `device_record_his` VALUES ('585', '100000213', null, '49887', '0', '211', '654', '188', '369', '40', '27', null, null, null, null, null, '2019-03-12 10:58:01', '2019-03-12 10:58:01');
INSERT INTO `device_record_his` VALUES ('586', '100000213', null, '50413', '0', '214', '660', '188', '373', '40', '27', null, null, null, null, null, '2019-03-12 10:59:01', '2019-03-12 10:59:01');
INSERT INTO `device_record_his` VALUES ('587', '100000213', null, '50622', '0', '214', '651', '188', '370', '41', '27', null, null, null, null, null, '2019-03-12 11:00:01', '2019-03-12 11:00:01');
INSERT INTO `device_record_his` VALUES ('588', '100000213', null, '50771', '0', '214', '651', '189', '370', '41', '27', null, null, null, null, null, '2019-03-12 11:01:02', '2019-03-12 11:01:02');
INSERT INTO `device_record_his` VALUES ('589', '100000213', null, '50688', '0', '215', '646', '188', '372', '40', '27', null, null, null, null, null, '2019-03-12 11:02:00', '2019-03-12 11:02:00');
INSERT INTO `device_record_his` VALUES ('590', '100000213', null, '50652', '0', '214', '650', '189', '369', '41', '27', null, null, null, null, null, '2019-03-12 11:03:01', '2019-03-12 11:03:01');
INSERT INTO `device_record_his` VALUES ('591', '100000213', null, '51130', '0', '215', '646', '189', '371', '40', '27', null, null, null, null, null, '2019-03-12 11:04:00', '2019-03-12 11:04:00');
INSERT INTO `device_record_his` VALUES ('592', '100000213', null, '51309', '0', '219', '635', '190', '371', '40', '27', null, null, null, null, null, '2019-03-12 11:05:01', '2019-03-12 11:05:01');
INSERT INTO `device_record_his` VALUES ('593', '100000213', null, '51548', '0', '222', '629', '189', '369', '41', '27', null, null, null, null, null, '2019-03-12 11:06:01', '2019-03-12 11:06:01');
INSERT INTO `device_record_his` VALUES ('594', '100000213', null, '51656', '0', '221', '625', '190', '374', '41', '27', null, null, null, null, null, '2019-03-12 11:07:01', '2019-03-12 11:07:01');
INSERT INTO `device_record_his` VALUES ('595', '100000213', null, '51680', '0', '221', '613', '189', '372', '40', '27', null, null, null, null, null, '2019-03-12 11:08:01', '2019-03-12 11:08:01');
INSERT INTO `device_record_his` VALUES ('596', '100000213', null, '51656', '0', '220', '614', '191', '370', '40', '27', null, null, null, null, null, '2019-03-12 11:09:01', '2019-03-12 11:09:01');
INSERT INTO `device_record_his` VALUES ('597', '100000213', null, '52188', '0', '220', '620', '190', '370', '40', '27', null, null, null, null, null, '2019-03-12 11:10:01', '2019-03-12 11:10:01');
INSERT INTO `device_record_his` VALUES ('598', '100000213', null, '52134', '0', '219', '621', '190', '370', '40', '27', null, null, null, null, null, '2019-03-12 11:11:01', '2019-03-12 11:11:01');
INSERT INTO `device_record_his` VALUES ('599', '100000213', null, '52260', '0', '219', '614', '190', '372', '41', '27', null, null, null, null, null, '2019-03-12 11:12:01', '2019-03-12 11:12:01');
INSERT INTO `device_record_his` VALUES ('600', '100000213', null, '52283', '0', '217', '620', '190', '371', '40', '27', null, null, null, null, null, '2019-03-12 11:13:01', '2019-03-12 11:13:01');
INSERT INTO `device_record_his` VALUES ('601', '100000213', null, '52254', '0', '219', '615', '191', '371', '40', '27', null, null, null, null, null, '2019-03-12 11:14:00', '2019-03-12 11:14:00');
INSERT INTO `device_record_his` VALUES ('602', '100000213', null, '52367', '0', '218', '614', '191', '375', '41', '27', null, null, null, null, null, '2019-03-12 11:15:01', '2019-03-12 11:15:01');
INSERT INTO `device_record_his` VALUES ('603', '100000213', null, '52445', '0', '216', '626', '191', '372', '41', '27', null, null, null, null, null, '2019-03-12 11:16:01', '2019-03-12 11:16:01');
INSERT INTO `device_record_his` VALUES ('604', '100000213', null, '52445', '0', '216', '625', '191', '374', '41', '27', null, null, null, null, null, '2019-03-12 11:17:01', '2019-03-12 11:17:01');
INSERT INTO `device_record_his` VALUES ('605', '100000213', null, '52774', '0', '217', '626', '192', '370', '40', '26', null, null, null, null, null, '2019-03-12 11:18:01', '2019-03-12 11:18:01');
INSERT INTO `device_record_his` VALUES ('606', '100000213', null, '52845', '0', '217', '629', '191', '372', '40', '27', null, null, null, null, null, '2019-03-12 11:19:01', '2019-03-12 11:19:01');
INSERT INTO `device_record_his` VALUES ('607', '100000213', null, '53120', '0', '217', '636', '192', '371', '40', '26', null, null, null, null, null, '2019-03-12 11:20:01', '2019-03-12 11:20:01');
INSERT INTO `device_record_his` VALUES ('608', '100000213', null, '53586', '0', '219', '628', '192', '370', '41', '27', null, null, null, null, null, '2019-03-12 11:21:00', '2019-03-12 11:21:00');
INSERT INTO `device_record_his` VALUES ('609', '100000213', null, '53198', '0', '220', '615', '192', '375', '41', '27', null, null, null, null, null, '2019-03-12 11:22:01', '2019-03-12 11:22:01');
INSERT INTO `device_record_his` VALUES ('610', '100000213', null, '53449', '0', '221', '607', '192', '372', '41', '27', null, null, null, null, null, '2019-03-12 11:23:01', '2019-03-12 11:23:01');
INSERT INTO `device_record_his` VALUES ('611', '100000213', null, '53885', '0', '220', '616', '192', '375', '41', '27', null, null, null, null, null, '2019-03-12 11:24:01', '2019-03-12 11:24:01');
INSERT INTO `device_record_his` VALUES ('612', '100000213', null, '53682', '0', '221', '617', '192', '370', '41', '27', null, null, null, null, null, '2019-03-12 11:25:01', '2019-03-12 11:25:01');
INSERT INTO `device_record_his` VALUES ('613', '100000213', null, '54047', '0', '220', '616', '193', '371', '41', '27', null, null, null, null, null, '2019-03-12 11:26:01', '2019-03-12 11:26:01');
INSERT INTO `device_record_his` VALUES ('614', '100000213', null, '54256', '0', '223', '617', '192', '370', '40', '26', null, null, null, null, null, '2019-03-12 11:27:01', '2019-03-12 11:27:01');
INSERT INTO `device_record_his` VALUES ('615', '100000213', null, '54465', '0', '225', '604', '193', '371', '41', '27', null, null, null, null, null, '2019-03-12 11:28:01', '2019-03-12 11:28:01');
INSERT INTO `device_record_his` VALUES ('616', '100000213', null, '54525', '0', '223', '610', '193', '371', '41', '27', null, null, null, null, null, '2019-03-12 11:29:01', '2019-03-12 11:29:01');
INSERT INTO `device_record_his` VALUES ('617', '100000213', null, '54829', '0', '224', '610', '193', '372', '41', '27', null, null, null, null, null, '2019-03-12 11:30:01', '2019-03-12 11:30:01');
INSERT INTO `device_record_his` VALUES ('618', '100000213', null, '54644', '0', '223', '616', '193', '372', '41', '27', null, null, null, null, null, '2019-03-12 11:31:01', '2019-03-12 11:31:01');
INSERT INTO `device_record_his` VALUES ('619', '100000213', null, '54513', '0', '224', '610', '193', '370', '41', '27', null, null, null, null, null, '2019-03-12 11:32:01', '2019-03-12 11:32:01');
INSERT INTO `device_record_his` VALUES ('620', '100000213', null, '54435', '0', '223', '615', '193', '374', '41', '27', null, null, null, null, null, '2019-03-12 11:33:01', '2019-03-12 11:33:01');
INSERT INTO `device_record_his` VALUES ('621', '100000213', null, '54393', '0', '221', '623', '194', '370', '41', '27', null, null, null, null, null, '2019-03-12 11:34:01', '2019-03-12 11:34:01');
INSERT INTO `device_record_his` VALUES ('622', '100000213', null, '54578', '0', '223', '615', '194', '370', '42', '28', null, null, null, null, null, '2019-03-12 11:35:01', '2019-03-12 11:35:01');
INSERT INTO `device_record_his` VALUES ('623', '100000213', null, '54417', '0', '225', '613', '194', '370', '41', '27', null, null, null, null, null, '2019-03-12 11:36:01', '2019-03-12 11:36:01');
INSERT INTO `device_record_his` VALUES ('624', '100000213', null, '54531', '0', '222', '615', '194', '371', '41', '27', null, null, null, null, null, '2019-03-12 11:37:01', '2019-03-12 11:37:01');
INSERT INTO `device_record_his` VALUES ('625', '100000213', null, '54453', '0', '219', '634', '195', '374', '41', '27', null, null, null, null, null, '2019-03-12 11:38:01', '2019-03-12 11:38:01');
INSERT INTO `device_record_his` VALUES ('626', '100000213', null, '54471', '0', '215', '638', '194', '371', '41', '27', null, null, null, null, null, '2019-03-12 11:39:01', '2019-03-12 11:39:01');
INSERT INTO `device_record_his` VALUES ('627', '100000213', null, '54447', '0', '213', '646', '194', '373', '41', '27', null, null, null, null, null, '2019-03-12 11:40:01', '2019-03-12 11:40:01');
INSERT INTO `device_record_his` VALUES ('628', '100000213', null, '54764', '0', '217', '639', '195', '369', '42', '28', null, null, null, null, null, '2019-03-12 11:41:01', '2019-03-12 11:41:01');
INSERT INTO `device_record_his` VALUES ('629', '100000213', null, '54758', '0', '220', '623', '195', '374', '41', '27', null, null, null, null, null, '2019-03-12 11:42:01', '2019-03-12 11:42:01');
INSERT INTO `device_record_his` VALUES ('630', '100000213', null, '54931', '0', '218', '630', '195', '373', '41', '27', null, null, null, null, null, '2019-03-12 11:43:01', '2019-03-12 11:43:01');
INSERT INTO `device_record_his` VALUES ('631', '100000213', null, '55003', '0', '218', '643', '195', '370', '41', '27', null, null, null, null, null, '2019-03-12 11:44:01', '2019-03-12 11:44:01');
INSERT INTO `device_record_his` VALUES ('632', '100000213', null, '54859', '0', '217', '648', '195', '375', '41', '27', null, null, null, null, null, '2019-03-12 11:45:01', '2019-03-12 11:45:01');
INSERT INTO `device_record_his` VALUES ('633', '100000213', null, '54973', '0', '217', '640', '196', '373', '41', '27', null, null, null, null, null, '2019-03-12 11:46:01', '2019-03-12 11:46:01');
INSERT INTO `device_record_his` VALUES ('634', '100000213', null, '55230', '0', '220', '636', '196', '375', '41', '27', null, null, null, null, null, '2019-03-12 11:47:03', '2019-03-12 11:47:03');
INSERT INTO `device_record_his` VALUES ('635', '100000213', null, '55140', '0', '224', '625', '196', '370', '41', '27', null, null, null, null, null, '2019-03-12 11:48:01', '2019-03-12 11:48:01');
INSERT INTO `device_record_his` VALUES ('636', '100000213', null, '55445', '0', '227', '608', '196', '370', '41', '27', null, null, null, null, null, '2019-03-12 11:49:00', '2019-03-12 11:49:00');
INSERT INTO `device_record_his` VALUES ('637', '100000213', null, '56055', '0', '224', '609', '197', '372', '41', '27', null, null, null, null, null, '2019-03-12 11:50:01', '2019-03-12 11:50:01');
INSERT INTO `device_record_his` VALUES ('638', '100000213', null, '56318', '0', '221', '630', '196', '369', '41', '27', null, null, null, null, null, '2019-03-12 11:51:01', '2019-03-12 11:51:01');
INSERT INTO `device_record_his` VALUES ('639', '100000213', null, '56557', '0', '225', '620', '196', '370', '41', '27', null, null, null, null, null, '2019-03-12 11:52:01', '2019-03-12 11:52:01');
INSERT INTO `device_record_his` VALUES ('640', '100000213', null, '56545', '0', '225', '613', '196', '372', '41', '27', null, null, null, null, null, '2019-03-12 11:53:01', '2019-03-12 11:53:01');
INSERT INTO `device_record_his` VALUES ('641', '100000213', null, '56724', '0', '227', '605', '196', '369', '42', '28', null, null, null, null, null, '2019-03-12 11:54:01', '2019-03-12 11:54:01');
INSERT INTO `device_record_his` VALUES ('642', '100000213', null, '56300', '0', '230', '605', '197', '370', '41', '27', null, null, null, null, null, '2019-03-12 11:55:01', '2019-03-12 11:55:01');
INSERT INTO `device_record_his` VALUES ('643', '100000213', null, '56061', '0', '228', '609', '197', '370', '41', '27', null, null, null, null, null, '2019-03-12 11:56:01', '2019-03-12 11:56:01');
INSERT INTO `device_record_his` VALUES ('644', '100000213', null, '56049', '0', '231', '609', '197', '369', '42', '28', null, null, null, null, null, '2019-03-12 11:57:03', '2019-03-12 11:57:03');
INSERT INTO `device_record_his` VALUES ('645', '100000213', null, '56371', '0', '235', '600', '197', '372', '41', '27', null, null, null, null, null, '2019-03-12 11:58:01', '2019-03-12 11:58:01');
INSERT INTO `device_record_his` VALUES ('646', '100000213', null, '56467', '0', '235', '594', '197', '370', '41', '27', null, null, null, null, null, '2019-03-12 11:59:01', '2019-03-12 11:59:01');
INSERT INTO `device_record_his` VALUES ('647', '100000213', null, '56425', '0', '232', '602', '197', '368', '41', '27', null, null, null, null, null, '2019-03-12 12:00:01', '2019-03-12 12:00:01');
INSERT INTO `device_record_his` VALUES ('648', '100000213', null, '56401', '0', '226', '624', '197', '372', '41', '27', null, null, null, null, null, '2019-03-12 12:01:01', '2019-03-12 12:01:01');
INSERT INTO `device_record_his` VALUES ('649', '100000213', null, '56258', '0', '224', '634', '197', '372', '41', '27', null, null, null, null, null, '2019-03-12 12:02:01', '2019-03-12 12:02:01');
INSERT INTO `device_record_his` VALUES ('650', '100000213', null, '55935', '0', '221', '641', '198', '372', '41', '27', null, null, null, null, null, '2019-03-12 12:03:01', '2019-03-12 12:03:01');
INSERT INTO `device_record_his` VALUES ('651', '100000213', null, '55959', '0', '225', '634', '198', '370', '41', '27', null, null, null, null, null, '2019-03-12 12:04:01', '2019-03-12 12:04:01');
INSERT INTO `device_record_his` VALUES ('652', '100000213', null, '55589', '0', '227', '629', '198', '371', '42', '27', null, null, null, null, null, '2019-03-12 12:05:01', '2019-03-12 12:05:01');
INSERT INTO `device_record_his` VALUES ('653', '100000213', null, '55565', '0', '216', '648', '198', '369', '42', '27', null, null, null, null, null, '2019-03-12 12:06:01', '2019-03-12 12:06:01');
INSERT INTO `device_record_his` VALUES ('654', '100000213', null, '55039', '0', '215', '656', '199', '372', '42', '27', null, null, null, null, null, '2019-03-12 12:07:01', '2019-03-12 12:07:01');
INSERT INTO `device_record_his` VALUES ('655', '100000213', null, '55493', '0', '217', '656', '198', '369', '41', '27', null, null, null, null, null, '2019-03-12 12:08:00', '2019-03-12 12:08:00');
INSERT INTO `device_record_his` VALUES ('656', '100000213', null, '55577', '0', '217', '655', '199', '369', '42', '27', null, null, null, null, null, '2019-03-12 12:09:01', '2019-03-12 12:09:01');
INSERT INTO `device_record_his` VALUES ('657', '100000213', null, '55481', '0', '223', '643', '199', '371', '42', '27', null, null, null, null, null, '2019-03-12 12:10:01', '2019-03-12 12:10:01');
INSERT INTO `device_record_his` VALUES ('658', '100000213', null, '54704', '0', '225', '637', '198', '371', '42', '27', null, null, null, null, null, '2019-03-12 12:11:01', '2019-03-12 12:11:01');
INSERT INTO `device_record_his` VALUES ('659', '100000213', null, '54549', '0', '225', '635', '199', '370', '41', '27', null, null, null, null, null, '2019-03-12 12:12:01', '2019-03-12 12:12:01');
INSERT INTO `device_record_his` VALUES ('660', '100000213', null, '55045', '0', '222', '638', '199', '370', '41', '27', null, null, null, null, null, '2019-03-12 12:13:01', '2019-03-12 12:13:01');
INSERT INTO `device_record_his` VALUES ('661', '100000213', null, '55798', '0', '225', '638', '199', '370', '42', '27', null, null, null, null, null, '2019-03-12 12:14:01', '2019-03-12 12:14:01');
INSERT INTO `device_record_his` VALUES ('662', '100000213', null, '55224', '0', '219', '644', '200', '369', '41', '27', null, null, null, null, null, '2019-03-12 12:15:01', '2019-03-12 12:15:01');
INSERT INTO `device_record_his` VALUES ('663', '100000213', null, '54925', '0', '219', '651', '199', '372', '42', '27', null, null, null, null, null, '2019-03-12 12:16:01', '2019-03-12 12:16:01');
INSERT INTO `device_record_his` VALUES ('664', '100000213', null, '53162', '0', '217', '649', '200', '371', '42', '27', null, null, null, null, null, '2019-03-12 12:17:01', '2019-03-12 12:17:01');
INSERT INTO `device_record_his` VALUES ('665', '100000213', null, '53688', '0', '219', '651', '199', '372', '42', '27', null, null, null, null, null, '2019-03-12 12:18:01', '2019-03-12 12:18:01');
INSERT INTO `device_record_his` VALUES ('666', '100000213', null, '55242', '0', '223', '642', '200', '370', '43', '28', null, null, null, null, null, '2019-03-12 12:19:01', '2019-03-12 12:19:01');
INSERT INTO `device_record_his` VALUES ('667', '100000213', null, '54818', '0', '217', '648', '201', '369', '42', '27', null, null, null, null, null, '2019-03-12 12:20:01', '2019-03-12 12:20:01');
INSERT INTO `device_record_his` VALUES ('668', '100000213', null, '53628', '0', '217', '649', '200', '372', '42', '27', null, null, null, null, null, '2019-03-12 12:21:01', '2019-03-12 12:21:01');
INSERT INTO `device_record_his` VALUES ('669', '100000213', null, '55021', '0', '222', '644', '200', '369', '42', '27', null, null, null, null, null, '2019-03-12 12:22:01', '2019-03-12 12:22:01');
INSERT INTO `device_record_his` VALUES ('670', '100000213', null, '54262', '0', '223', '642', '201', '371', '41', '27', null, null, null, null, null, '2019-03-12 12:23:01', '2019-03-12 12:23:01');
INSERT INTO `device_record_his` VALUES ('671', '100000213', null, '54459', '0', '227', '633', '201', '370', '42', '27', null, null, null, null, null, '2019-03-12 12:24:01', '2019-03-12 12:24:01');
INSERT INTO `device_record_his` VALUES ('672', '100000213', null, '54608', '0', '232', '617', '201', '370', '42', '27', null, null, null, null, null, '2019-03-12 12:25:01', '2019-03-12 12:25:01');
INSERT INTO `device_record_his` VALUES ('673', '100000213', null, '54590', '0', '235', '609', '201', '370', '42', '27', null, null, null, null, null, '2019-03-12 12:26:01', '2019-03-12 12:26:01');
INSERT INTO `device_record_his` VALUES ('674', '100000213', null, '54250', '0', '237', '598', '201', '371', '42', '27', null, null, null, null, null, '2019-03-12 12:27:01', '2019-03-12 12:27:01');
INSERT INTO `device_record_his` VALUES ('675', '100000213', null, '54572', '0', '239', '594', '201', '370', '42', '27', null, null, null, null, null, '2019-03-12 12:28:01', '2019-03-12 12:28:01');
INSERT INTO `device_record_his` VALUES ('676', '100000213', null, '53485', '0', '240', '586', '202', '369', '42', '27', null, null, null, null, null, '2019-03-12 12:29:01', '2019-03-12 12:29:01');
INSERT INTO `device_record_his` VALUES ('677', '100000213', null, '54011', '0', '239', '591', '201', '370', '42', '27', null, null, null, null, null, '2019-03-12 12:30:01', '2019-03-12 12:30:01');
INSERT INTO `device_record_his` VALUES ('678', '100000213', null, '54136', '0', '238', '591', '202', '370', '42', '27', null, null, null, null, null, '2019-03-12 12:31:01', '2019-03-12 12:31:01');
INSERT INTO `device_record_his` VALUES ('679', '100000213', null, '54035', '0', '240', '584', '202', '369', '42', '27', null, null, null, null, null, '2019-03-12 12:32:01', '2019-03-12 12:32:01');
INSERT INTO `device_record_his` VALUES ('680', '100000213', null, '54112', '0', '238', '579', '202', '370', '42', '27', null, null, null, null, null, '2019-03-12 12:33:01', '2019-03-12 12:33:01');
INSERT INTO `device_record_his` VALUES ('681', '100000213', null, '53497', '0', '239', '582', '202', '371', '43', '28', null, null, null, null, null, '2019-03-12 12:34:01', '2019-03-12 12:34:01');
INSERT INTO `device_record_his` VALUES ('682', '100000213', null, '53120', '0', '240', '581', '202', '371', '43', '28', null, null, null, null, null, '2019-03-12 12:35:01', '2019-03-12 12:35:01');
INSERT INTO `device_record_his` VALUES ('683', '100000213', null, '52893', '0', '240', '573', '202', '369', '42', '27', null, null, null, null, null, '2019-03-12 12:36:00', '2019-03-12 12:36:00');
INSERT INTO `device_record_his` VALUES ('684', '100000213', null, '52206', '0', '229', '599', '203', '370', '42', '27', null, null, null, null, null, '2019-03-12 12:37:01', '2019-03-12 12:37:01');
INSERT INTO `device_record_his` VALUES ('685', '100000213', null, '52582', '0', '229', '610', '202', '370', '42', '27', null, null, null, null, null, '2019-03-12 12:38:01', '2019-03-12 12:38:01');
INSERT INTO `device_record_his` VALUES ('686', '100000213', null, '52277', '0', '234', '599', '203', '370', '42', '27', null, null, null, null, null, '2019-03-12 12:39:01', '2019-03-12 12:39:01');
INSERT INTO `device_record_his` VALUES ('687', '100000213', null, '51734', '0', '239', '594', '204', '369', '42', '27', null, null, null, null, null, '2019-03-12 12:40:01', '2019-03-12 12:40:01');
INSERT INTO `device_record_his` VALUES ('688', '100000213', null, '51985', '0', '233', '582', '203', '370', '42', '27', null, null, null, null, null, '2019-03-12 12:41:01', '2019-03-12 12:41:01');
INSERT INTO `device_record_his` VALUES ('689', '100000213', null, '51423', '0', '227', '614', '203', '370', '43', '28', null, null, null, null, null, '2019-03-12 12:42:01', '2019-03-12 12:42:01');
INSERT INTO `device_record_his` VALUES ('690', '100000213', null, '51381', '0', '228', '609', '203', '369', '43', '28', null, null, null, null, null, '2019-03-12 12:43:01', '2019-03-12 12:43:01');
INSERT INTO `device_record_his` VALUES ('691', '100000213', null, '50580', '0', '225', '608', '204', '371', '43', '28', null, null, null, null, null, '2019-03-12 12:44:01', '2019-03-12 12:44:01');
INSERT INTO `device_record_his` VALUES ('692', '100000213', null, '49899', '0', '225', '613', '204', '370', '42', '27', null, null, null, null, null, '2019-03-12 12:45:00', '2019-03-12 12:45:00');
INSERT INTO `device_record_his` VALUES ('693', '100000213', null, '49809', '0', '223', '628', '204', '370', '43', '28', null, null, null, null, null, '2019-03-12 12:46:01', '2019-03-12 12:46:01');
INSERT INTO `device_record_his` VALUES ('694', '100000213', null, '49020', '0', '221', '625', '204', '370', '43', '28', null, null, null, null, null, '2019-03-12 12:47:01', '2019-03-12 12:47:01');
INSERT INTO `device_record_his` VALUES ('695', '100000213', null, '48010', '0', '226', '611', '204', '370', '43', '28', null, null, null, null, null, '2019-03-12 12:48:01', '2019-03-12 12:48:01');
INSERT INTO `device_record_his` VALUES ('696', '100000213', null, '47281', '0', '232', '602', '204', '370', '42', '27', null, null, null, null, null, '2019-03-12 12:49:01', '2019-03-12 12:49:01');
INSERT INTO `device_record_his` VALUES ('697', '100000213', null, '46845', '0', '230', '602', '204', '369', '43', '28', null, null, null, null, null, '2019-03-12 12:50:01', '2019-03-12 12:50:01');
INSERT INTO `device_record_his` VALUES ('698', '100000213', null, '45434', '0', '233', '590', '205', '369', '43', '28', null, null, null, null, null, '2019-03-12 12:51:01', '2019-03-12 12:51:01');
INSERT INTO `device_record_his` VALUES ('699', '100000213', null, '44986', '0', '236', '580', '204', '370', '43', '28', null, null, null, null, null, '2019-03-12 12:52:01', '2019-03-12 12:52:01');
INSERT INTO `device_record_his` VALUES ('700', '100000213', null, '44580', '0', '238', '579', '206', '369', '43', '28', null, null, null, null, null, '2019-03-12 12:53:01', '2019-03-12 12:53:01');
INSERT INTO `device_record_his` VALUES ('701', '100000213', null, '43922', '0', '237', '581', '205', '369', '42', '27', null, null, null, null, null, '2019-03-12 12:54:01', '2019-03-12 12:54:01');
INSERT INTO `device_record_his` VALUES ('702', '100000213', null, '42763', '0', '240', '578', '206', '368', '43', '28', null, null, null, null, null, '2019-03-12 12:55:01', '2019-03-12 12:55:01');
INSERT INTO `device_record_his` VALUES ('703', '100000213', null, '42703', '0', '242', '569', '205', '368', '42', '27', null, null, null, null, null, '2019-03-12 12:56:01', '2019-03-12 12:56:01');
INSERT INTO `device_record_his` VALUES ('704', '100000213', null, '41310', '0', '245', '562', '205', '370', '43', '28', null, null, null, null, null, '2019-03-12 12:57:01', '2019-03-12 12:57:01');
INSERT INTO `device_record_his` VALUES ('705', '100000213', null, '41065', '0', '247', '560', '204', '369', '43', '28', null, null, null, null, null, '2019-03-12 12:58:01', '2019-03-12 12:58:01');
INSERT INTO `device_record_his` VALUES ('706', '100000213', null, '40814', '0', '249', '556', '206', '370', '43', '28', null, null, null, null, null, '2019-03-12 12:59:01', '2019-03-12 12:59:01');
INSERT INTO `device_record_his` VALUES ('707', '100000213', null, '39577', '0', '249', '556', '206', '370', '43', '28', null, null, null, null, null, '2019-03-12 13:00:01', '2019-03-12 13:00:01');
INSERT INTO `device_record_his` VALUES ('708', '100000213', null, '39165', '0', '249', '553', '206', '369', '43', '28', null, null, null, null, null, '2019-03-12 13:01:02', '2019-03-12 13:01:02');
INSERT INTO `device_record_his` VALUES ('709', '100000213', null, '38083', '0', '246', '552', '206', '368', '42', '27', null, null, null, null, null, '2019-03-12 13:02:01', '2019-03-12 13:02:01');
INSERT INTO `device_record_his` VALUES ('710', '100000213', null, '37922', '0', '240', '560', '207', '371', '42', '27', null, null, null, null, null, '2019-03-12 13:03:01', '2019-03-12 13:03:01');
INSERT INTO `device_record_his` VALUES ('711', '100000213', null, '37468', '0', '233', '581', '206', '369', '43', '28', null, null, null, null, null, '2019-03-12 13:04:01', '2019-03-12 13:04:01');
INSERT INTO `device_record_his` VALUES ('712', '100000213', null, '37444', '0', '236', '578', '206', '369', '43', '28', null, null, null, null, null, '2019-03-12 13:05:00', '2019-03-12 13:05:00');
INSERT INTO `device_record_his` VALUES ('713', '100000213', null, '36989', '0', '235', '578', '207', '370', '42', '27', null, null, null, null, null, '2019-03-12 13:06:01', '2019-03-12 13:06:01');
INSERT INTO `device_record_his` VALUES ('714', '100000213', null, '35908', '0', '237', '581', '205', '368', '43', '28', null, null, null, null, null, '2019-03-12 13:07:01', '2019-03-12 13:07:01');
INSERT INTO `device_record_his` VALUES ('715', '100000213', null, '35752', '0', '238', '575', '207', '368', '43', '28', null, null, null, null, null, '2019-03-12 13:08:01', '2019-03-12 13:08:01');
INSERT INTO `device_record_his` VALUES ('716', '100000213', null, '34216', '0', '240', '575', '207', '370', '43', '28', null, null, null, null, null, '2019-03-12 13:09:01', '2019-03-12 13:09:01');
INSERT INTO `device_record_his` VALUES ('717', '100000213', null, '35370', '0', '239', '575', '207', '366', '43', '28', null, null, null, null, null, '2019-03-12 13:10:01', '2019-03-12 13:10:01');
INSERT INTO `device_record_his` VALUES ('718', '100000213', null, '35585', '0', '242', '566', '207', '365', '43', '28', null, null, null, null, null, '2019-03-12 13:11:01', '2019-03-12 13:11:01');
INSERT INTO `device_record_his` VALUES ('719', '100000213', null, '35250', '0', '243', '567', '208', '369', '43', '28', null, null, null, null, null, '2019-03-12 13:12:01', '2019-03-12 13:12:01');
INSERT INTO `device_record_his` VALUES ('720', '100000213', null, '35244', '0', '242', '569', '208', '367', '43', '28', null, null, null, null, null, '2019-03-12 13:13:01', '2019-03-12 13:13:01');
INSERT INTO `device_record_his` VALUES ('721', '100000213', null, '35495', '0', '245', '568', '208', '368', '43', '28', null, null, null, null, null, '2019-03-12 13:14:01', '2019-03-12 13:14:01');
INSERT INTO `device_record_his` VALUES ('722', '100000213', null, '31043', '0', '243', '569', '208', '368', '43', '28', null, null, null, null, null, '2019-03-12 13:15:01', '2019-03-12 13:15:01');
INSERT INTO `device_record_his` VALUES ('723', '100000213', null, '30349', '0', '239', '580', '208', '367', '43', '28', null, null, null, null, null, '2019-03-12 13:16:01', '2019-03-12 13:16:01');
INSERT INTO `device_record_his` VALUES ('724', '100000213', null, '26483', '0', '238', '582', '208', '369', '43', '28', null, null, null, null, null, '2019-03-12 13:17:01', '2019-03-12 13:17:01');
INSERT INTO `device_record_his` VALUES ('725', '100000213', null, '32483', '0', '239', '578', '208', '370', '43', '28', null, null, null, null, null, '2019-03-12 13:18:02', '2019-03-12 13:18:02');
INSERT INTO `device_record_his` VALUES ('726', '100000213', null, '35274', '0', '244', '570', '208', '370', '43', '28', null, null, null, null, null, '2019-03-12 13:19:00', '2019-03-12 13:19:00');
INSERT INTO `device_record_his` VALUES ('727', '100000213', null, '36195', '0', '245', '568', '208', '369', '43', '28', null, null, null, null, null, '2019-03-12 13:20:00', '2019-03-12 13:20:00');
INSERT INTO `device_record_his` VALUES ('728', '100000213', null, '36272', '0', '247', '567', '209', '369', '43', '27', null, null, null, null, null, '2019-03-12 13:21:01', '2019-03-12 13:21:01');
INSERT INTO `device_record_his` VALUES ('729', '100000213', null, '36392', '0', '242', '572', '208', '368', '43', '28', null, null, null, null, null, '2019-03-12 13:22:01', '2019-03-12 13:22:01');
INSERT INTO `device_record_his` VALUES ('730', '100000213', null, '37109', '0', '243', '562', '209', '367', '43', '27', null, null, null, null, null, '2019-03-12 13:23:01', '2019-03-12 13:23:01');
INSERT INTO `device_record_his` VALUES ('731', '100000213', null, '37175', '0', '244', '551', '209', '368', '43', '27', null, null, null, null, null, '2019-03-12 13:24:01', '2019-03-12 13:24:01');
INSERT INTO `device_record_his` VALUES ('732', '100000213', null, '37252', '0', '245', '552', '209', '368', '43', '27', null, null, null, null, null, '2019-03-12 13:25:01', '2019-03-12 13:25:01');
INSERT INTO `device_record_his` VALUES ('733', '100000213', null, '38053', '0', '243', '555', '209', '364', '43', '27', null, null, null, null, null, '2019-03-12 13:26:01', '2019-03-12 13:26:01');
INSERT INTO `device_record_his` VALUES ('734', '100000213', null, '38083', '0', '241', '558', '210', '369', '43', '27', null, null, null, null, null, '2019-03-12 13:27:01', '2019-03-12 13:27:01');
INSERT INTO `device_record_his` VALUES ('735', '100000213', null, '38334', '0', '243', '555', '210', '369', '43', '27', null, null, null, null, null, '2019-03-12 13:28:01', '2019-03-12 13:28:01');
INSERT INTO `device_record_his` VALUES ('736', '100000213', null, '38472', '0', '244', '559', '209', '366', '43', '27', null, null, null, null, null, '2019-03-12 13:29:01', '2019-03-12 13:29:01');
INSERT INTO `device_record_his` VALUES ('737', '100000213', null, '36607', '0', '246', '560', '211', '367', '43', '27', null, null, null, null, null, '2019-03-12 13:30:01', '2019-03-12 13:30:01');
INSERT INTO `device_record_his` VALUES ('738', '100000213', null, '34808', '0', '247', '555', '210', '368', '43', '27', null, null, null, null, null, '2019-03-12 13:31:01', '2019-03-12 13:31:01');
INSERT INTO `device_record_his` VALUES ('739', '100000213', null, '35782', '0', '250', '548', '211', '367', '43', '27', null, null, null, null, null, '2019-03-12 13:32:01', '2019-03-12 13:32:01');
INSERT INTO `device_record_his` VALUES ('740', '100000213', null, '34975', '0', '250', '550', '210', '369', '44', '28', null, null, null, null, null, '2019-03-12 13:33:00', '2019-03-12 13:33:00');
INSERT INTO `device_record_his` VALUES ('741', '100000213', null, '35997', '0', '250', '546', '210', '368', '43', '27', null, null, null, null, null, '2019-03-12 13:34:01', '2019-03-12 13:34:01');
INSERT INTO `device_record_his` VALUES ('742', '100000213', null, '35149', '0', '247', '557', '211', '368', '44', '28', null, null, null, null, null, '2019-03-12 13:35:01', '2019-03-12 13:35:01');
INSERT INTO `device_record_his` VALUES ('743', '100000213', null, '34013', '0', '242', '580', '211', '369', '43', '27', null, null, null, null, null, '2019-03-12 13:36:01', '2019-03-12 13:36:01');
INSERT INTO `device_record_his` VALUES ('744', '100000213', null, '32650', '0', '239', '589', '211', '367', '43', '27', null, null, null, null, null, '2019-03-12 13:37:01', '2019-03-12 13:37:01');
INSERT INTO `device_record_his` VALUES ('745', '100000213', null, '26154', '0', '234', '596', '212', '369', '43', '27', null, null, null, null, null, '2019-03-12 13:38:01', '2019-03-12 13:38:01');
INSERT INTO `device_record_his` VALUES ('746', '100000213', null, '31383', '0', '238', '590', '211', '365', '43', '27', null, null, null, null, null, '2019-03-12 13:39:01', '2019-03-12 13:39:01');
INSERT INTO `device_record_his` VALUES ('747', '100000213', null, '24743', '0', '236', '581', '211', '367', '43', '27', null, null, null, null, null, '2019-03-12 13:40:01', '2019-03-12 13:40:01');
INSERT INTO `device_record_his` VALUES ('748', '100000213', null, '29041', '0', '234', '595', '211', '368', '44', '28', null, null, null, null, null, '2019-03-12 13:41:01', '2019-03-12 13:41:01');
INSERT INTO `device_record_his` VALUES ('749', '100000213', null, '30606', '0', '233', '585', '211', '367', '43', '27', null, null, null, null, null, '2019-03-12 13:42:01', '2019-03-12 13:42:01');
INSERT INTO `device_record_his` VALUES ('750', '100000213', null, '30738', '0', '230', '603', '211', '369', '43', '27', null, null, null, null, null, '2019-03-12 13:43:01', '2019-03-12 13:43:01');
INSERT INTO `device_record_his` VALUES ('751', '100000213', null, '25222', '0', '230', '600', '212', '368', '43', '27', null, null, null, null, null, '2019-03-12 13:44:01', '2019-03-12 13:44:01');
INSERT INTO `device_record_his` VALUES ('752', '100000213', null, '27714', '0', '229', '603', '212', '367', '43', '27', null, null, null, null, null, '2019-03-12 13:45:01', '2019-03-12 13:45:01');
INSERT INTO `device_record_his` VALUES ('753', '100000213', null, '30314', '0', '233', '593', '213', '369', '43', '27', null, null, null, null, null, '2019-03-12 13:46:01', '2019-03-12 13:46:01');
INSERT INTO `device_record_his` VALUES ('754', '100000213', null, '30176', '0', '235', '588', '212', '367', '43', '27', null, null, null, null, null, '2019-03-12 13:47:01', '2019-03-12 13:47:01');
INSERT INTO `device_record_his` VALUES ('755', '100000213', null, '30128', '0', '239', '573', '213', '369', '43', '27', null, null, null, null, null, '2019-03-12 13:48:01', '2019-03-12 13:48:01');
INSERT INTO `device_record_his` VALUES ('756', '100000213', null, '22383', '0', '240', '575', '213', '369', '43', '27', null, null, null, null, null, '2019-03-12 13:49:01', '2019-03-12 13:49:01');
INSERT INTO `device_record_his` VALUES ('757', '100000213', null, '22777', '0', '240', '578', '213', '368', '43', '27', null, null, null, null, null, '2019-03-12 13:50:01', '2019-03-12 13:50:01');
INSERT INTO `device_record_his` VALUES ('758', '100000213', null, '23088', '0', '240', '582', '213', '364', '43', '27', null, null, null, null, null, '2019-03-12 13:51:01', '2019-03-12 13:51:01');
INSERT INTO `device_record_his` VALUES ('759', '100000213', null, '32656', '0', '239', '587', '214', '368', '44', '28', null, null, null, null, null, '2019-03-12 13:52:01', '2019-03-12 13:52:01');
INSERT INTO `device_record_his` VALUES ('760', '100000213', null, '33923', '0', '241', '573', '214', '368', '43', '27', null, null, null, null, null, '2019-03-12 13:53:01', '2019-03-12 13:53:01');
INSERT INTO `device_record_his` VALUES ('761', '100000213', null, '34784', '0', '242', '569', '214', '367', '44', '28', null, null, null, null, null, '2019-03-12 13:54:01', '2019-03-12 13:54:01');
INSERT INTO `device_record_his` VALUES ('762', '100000213', null, '35890', '0', '245', '567', '214', '366', '43', '27', null, null, null, null, null, '2019-03-12 13:55:01', '2019-03-12 13:55:01');
INSERT INTO `device_record_his` VALUES ('763', '100000213', null, '37001', '0', '245', '561', '214', '361', '44', '28', null, null, null, null, null, '2019-03-12 13:56:01', '2019-03-12 13:56:01');
INSERT INTO `device_record_his` VALUES ('764', '100000213', null, '37581', '0', '244', '560', '215', '363', '44', '28', null, null, null, null, null, '2019-03-12 13:57:01', '2019-03-12 13:57:01');
INSERT INTO `device_record_his` VALUES ('765', '100000213', null, '38741', '0', '244', '556', '215', '366', '44', '28', null, null, null, null, null, '2019-03-12 13:58:01', '2019-03-12 13:58:01');
INSERT INTO `device_record_his` VALUES ('766', '100000213', null, '40241', '0', '246', '568', '215', '365', '43', '27', null, null, null, null, null, '2019-03-12 13:59:01', '2019-03-12 13:59:01');
INSERT INTO `device_record_his` VALUES ('767', '100000213', null, '41567', '0', '250', '551', '216', '365', '44', '28', null, null, null, null, null, '2019-03-12 14:00:01', '2019-03-12 14:00:01');
INSERT INTO `device_record_his` VALUES ('768', '100000213', null, '42685', '0', '252', '548', '216', '362', '44', '28', null, null, null, null, null, '2019-03-12 14:01:01', '2019-03-12 14:01:01');
INSERT INTO `device_record_his` VALUES ('769', '100000213', null, '44012', '0', '254', '546', '216', '365', '45', '28', null, null, null, null, null, '2019-03-12 14:02:01', '2019-03-12 14:02:01');
INSERT INTO `device_record_his` VALUES ('770', '100000213', null, '45536', '0', '255', '543', '218', '363', '45', '28', null, null, null, null, null, '2019-03-12 14:03:01', '2019-03-12 14:03:01');
INSERT INTO `device_record_his` VALUES ('771', '100000213', null, '45064', '0', '255', '538', '218', '362', '44', '28', null, null, null, null, null, '2019-03-12 14:04:01', '2019-03-12 14:04:01');
INSERT INTO `device_record_his` VALUES ('772', '100000213', null, '40217', '0', '251', '548', '218', '360', '45', '28', null, null, null, null, null, '2019-03-12 14:05:00', '2019-03-12 14:05:00');
INSERT INTO `device_record_his` VALUES ('773', '100000213', null, '47311', '0', '244', '564', '219', '360', '44', '28', null, null, null, null, null, '2019-03-12 14:06:01', '2019-03-12 14:06:01');
INSERT INTO `device_record_his` VALUES ('774', '100000213', null, '47849', '0', '240', '576', '219', '362', '45', '28', null, null, null, null, null, '2019-03-12 14:07:01', '2019-03-12 14:07:01');
INSERT INTO `device_record_his` VALUES ('775', '100000213', null, '47520', '0', '230', '594', '219', '366', '45', '28', null, null, null, null, null, '2019-03-12 14:08:01', '2019-03-12 14:08:01');
INSERT INTO `device_record_his` VALUES ('776', '100000213', null, '49259', '0', '235', '596', '220', '360', '45', '28', null, null, null, null, null, '2019-03-12 14:09:01', '2019-03-12 14:09:01');
INSERT INTO `device_record_his` VALUES ('777', '100000213', null, '49349', '0', '234', '581', '221', '360', '45', '28', null, null, null, null, null, '2019-03-12 14:10:01', '2019-03-12 14:10:01');
INSERT INTO `device_record_his` VALUES ('778', '100000213', null, '49128', '0', '234', '585', '221', '361', '45', '28', null, null, null, null, null, '2019-03-12 14:11:01', '2019-03-12 14:11:01');
INSERT INTO `device_record_his` VALUES ('779', '100000213', null, '50030', '0', '238', '585', '222', '364', '45', '28', null, null, null, null, null, '2019-03-12 14:12:01', '2019-03-12 14:12:01');
INSERT INTO `device_record_his` VALUES ('780', '100000213', null, '50395', '0', '235', '594', '222', '365', '45', '28', null, null, null, null, null, '2019-03-12 14:13:01', '2019-03-12 14:13:01');
INSERT INTO `device_record_his` VALUES ('781', '100000213', null, '50383', '0', '235', '594', '223', '364', '45', '28', null, null, null, null, null, '2019-03-12 14:14:01', '2019-03-12 14:14:01');
INSERT INTO `device_record_his` VALUES ('782', '100000213', null, '49803', '0', '239', '584', '223', '359', '46', '29', null, null, null, null, null, '2019-03-12 14:15:01', '2019-03-12 14:15:01');
INSERT INTO `device_record_his` VALUES ('783', '100000213', null, '50114', '0', '243', '581', '223', '363', '45', '28', null, null, null, null, null, '2019-03-12 14:16:03', '2019-03-12 14:16:03');
INSERT INTO `device_record_his` VALUES ('784', '100000213', null, '49504', '0', '246', '572', '223', '358', '46', '29', null, null, null, null, null, '2019-03-12 14:17:01', '2019-03-12 14:17:01');
INSERT INTO `device_record_his` VALUES ('785', '100000213', null, '48674', '0', '248', '567', '224', '362', '45', '28', null, null, null, null, null, '2019-03-12 14:18:01', '2019-03-12 14:18:01');
INSERT INTO `device_record_his` VALUES ('786', '100000213', null, '49702', '0', '249', '562', '224', '363', '45', '28', null, null, null, null, null, '2019-03-12 14:19:01', '2019-03-12 14:19:01');
INSERT INTO `device_record_his` VALUES ('787', '100000213', null, '50281', '0', '241', '582', '225', '359', '45', '28', null, null, null, null, null, '2019-03-12 14:20:01', '2019-03-12 14:20:01');
INSERT INTO `device_record_his` VALUES ('788', '100000213', null, '49941', '0', '236', '589', '225', '362', '46', '28', null, null, null, null, null, '2019-03-12 14:21:01', '2019-03-12 14:21:01');
INSERT INTO `device_record_his` VALUES ('789', '100000213', null, '49092', '0', '237', '591', '226', '362', '46', '28', null, null, null, null, null, '2019-03-12 14:22:01', '2019-03-12 14:22:01');
INSERT INTO `device_record_his` VALUES ('790', '100000213', null, '49152', '0', '237', '585', '226', '359', '45', '28', null, null, null, null, null, '2019-03-12 14:23:01', '2019-03-12 14:23:01');
INSERT INTO `device_record_his` VALUES ('791', '100000213', null, '48100', '0', '228', '603', '226', '360', '46', '28', null, null, null, null, null, '2019-03-12 14:24:01', '2019-03-12 14:24:01');
INSERT INTO `device_record_his` VALUES ('792', '100000213', null, '47179', '0', '232', '607', '226', '359', '45', '28', null, null, null, null, null, '2019-03-12 14:25:01', '2019-03-12 14:25:01');
INSERT INTO `device_record_his` VALUES ('793', '100000213', null, '45691', '0', '236', '592', '226', '364', '46', '28', null, null, null, null, null, '2019-03-12 14:26:01', '2019-03-12 14:26:01');
INSERT INTO `device_record_his` VALUES ('794', '100000213', null, '48417', '0', '237', '594', '228', '363', '46', '28', null, null, null, null, null, '2019-03-12 14:27:01', '2019-03-12 14:27:01');
INSERT INTO `device_record_his` VALUES ('795', '100000213', null, '49773', '0', '239', '586', '227', '362', '45', '28', null, null, null, null, null, '2019-03-12 14:28:01', '2019-03-12 14:28:01');
INSERT INTO `device_record_his` VALUES ('796', '100000213', null, '48984', '0', '239', '583', '227', '364', '45', '28', null, null, null, null, null, '2019-03-12 14:29:01', '2019-03-12 14:29:01');
INSERT INTO `device_record_his` VALUES ('797', '100000213', null, '47281', '0', '239', '581', '227', '362', '45', '28', null, null, null, null, null, '2019-03-12 14:30:01', '2019-03-12 14:30:01');
INSERT INTO `device_record_his` VALUES ('798', '100000213', null, '48614', '0', '233', '596', '228', '365', '46', '28', null, null, null, null, null, '2019-03-12 14:31:01', '2019-03-12 14:31:01');
INSERT INTO `device_record_his` VALUES ('799', '100000213', null, '48225', '0', '231', '602', '228', '362', '45', '28', null, null, null, null, null, '2019-03-12 14:32:01', '2019-03-12 14:32:01');
INSERT INTO `device_record_his` VALUES ('800', '100000213', null, '47179', '0', '235', '596', '228', '360', '45', '28', null, null, null, null, null, '2019-03-12 14:33:01', '2019-03-12 14:33:01');
INSERT INTO `device_record_his` VALUES ('801', '100000213', null, '31067', '0', '236', '587', '228', '362', '45', '28', null, null, null, null, null, '2019-03-12 14:34:01', '2019-03-12 14:34:01');
INSERT INTO `device_record_his` VALUES ('802', '100000213', null, '23190', '0', '233', '585', '228', '359', '45', '28', null, null, null, null, null, '2019-03-12 14:35:01', '2019-03-12 14:35:01');
INSERT INTO `device_record_his` VALUES ('803', '100000213', null, '46952', '0', '234', '587', '229', '364', '45', '28', null, null, null, null, null, '2019-03-12 14:36:01', '2019-03-12 14:36:01');
INSERT INTO `device_record_his` VALUES ('804', '100000213', null, '47968', '0', '235', '584', '229', '361', '45', '28', null, null, null, null, null, '2019-03-12 14:37:01', '2019-03-12 14:37:01');
INSERT INTO `device_record_his` VALUES ('805', '100000213', null, '50030', '0', '237', '577', '229', '365', '45', '28', null, null, null, null, null, '2019-03-12 14:38:01', '2019-03-12 14:38:01');
INSERT INTO `device_record_his` VALUES ('806', '100000213', null, '49779', '0', '237', '576', '229', '365', '45', '28', null, null, null, null, null, '2019-03-12 14:39:01', '2019-03-12 14:39:01');
INSERT INTO `device_record_his` VALUES ('807', '100000213', null, '49510', '0', '237', '569', '229', '360', '46', '28', null, null, null, null, null, '2019-03-12 14:40:03', '2019-03-12 14:40:03');
INSERT INTO `device_record_his` VALUES ('808', '100000213', null, '48339', '0', '239', '572', '229', '363', '45', '28', null, null, null, null, null, '2019-03-12 14:41:01', '2019-03-12 14:41:01');
INSERT INTO `device_record_his` VALUES ('809', '100000213', null, '46307', '0', '239', '573', '229', '362', '45', '28', null, null, null, null, null, '2019-03-12 14:42:01', '2019-03-12 14:42:01');
INSERT INTO `device_record_his` VALUES ('810', '100000213', null, '46821', '0', '238', '572', '229', '363', '45', '28', null, null, null, null, null, '2019-03-12 14:43:01', '2019-03-12 14:43:01');
INSERT INTO `device_record_his` VALUES ('811', '100000213', null, '48632', '0', '234', '589', '229', '364', '45', '28', null, null, null, null, null, '2019-03-12 14:44:01', '2019-03-12 14:44:01');
INSERT INTO `device_record_his` VALUES ('812', '100000213', null, '48327', '0', '237', '575', '229', '363', '45', '28', null, null, null, null, null, '2019-03-12 14:45:01', '2019-03-12 14:45:01');
INSERT INTO `device_record_his` VALUES ('813', '100000213', null, '48172', '0', '239', '562', '229', '364', '44', '27', null, null, null, null, null, '2019-03-12 14:46:01', '2019-03-12 14:46:01');
INSERT INTO `device_record_his` VALUES ('814', '100000213', null, '47377', '0', '238', '573', '230', '361', '45', '28', null, null, null, null, null, '2019-03-12 14:47:01', '2019-03-12 14:47:01');
INSERT INTO `device_record_his` VALUES ('815', '100000213', null, '48004', '0', '241', '566', '229', '363', '45', '28', null, null, null, null, null, '2019-03-12 14:48:01', '2019-03-12 14:48:01');
INSERT INTO `device_record_his` VALUES ('816', '100000213', null, '47156', '0', '237', '569', '229', '362', '45', '28', null, null, null, null, null, '2019-03-12 14:49:01', '2019-03-12 14:49:01');
INSERT INTO `device_record_his` VALUES ('817', '100000213', null, '44102', '0', '237', '579', '230', '363', '45', '28', null, null, null, null, null, '2019-03-12 14:50:01', '2019-03-12 14:50:01');
INSERT INTO `device_record_his` VALUES ('818', '100000213', null, '46893', '0', '238', '570', '230', '362', '46', '28', null, null, null, null, null, '2019-03-12 14:51:01', '2019-03-12 14:51:01');
INSERT INTO `device_record_his` VALUES ('819', '100000213', null, '46259', '0', '237', '578', '230', '363', '46', '28', null, null, null, null, null, '2019-03-12 14:52:01', '2019-03-12 14:52:01');
INSERT INTO `device_record_his` VALUES ('820', '100000213', null, '47132', '0', '239', '573', '230', '363', '45', '28', null, null, null, null, null, '2019-03-12 14:53:01', '2019-03-12 14:53:01');
INSERT INTO `device_record_his` VALUES ('821', '100000213', null, '48680', '0', '238', '572', '230', '364', '45', '28', null, null, null, null, null, '2019-03-12 14:54:01', '2019-03-12 14:54:01');
INSERT INTO `device_record_his` VALUES ('822', '100000213', null, '47992', '0', '237', '574', '229', '365', '45', '28', null, null, null, null, null, '2019-03-12 14:55:01', '2019-03-12 14:55:01');
INSERT INTO `device_record_his` VALUES ('823', '100000213', null, '47138', '0', '237', '575', '230', '363', '46', '28', null, null, null, null, null, '2019-03-12 14:56:01', '2019-03-12 14:56:01');
INSERT INTO `device_record_his` VALUES ('824', '100000213', null, '47335', '0', '239', '570', '229', '364', '45', '28', null, null, null, null, null, '2019-03-12 14:57:01', '2019-03-12 14:57:01');
INSERT INTO `device_record_his` VALUES ('825', '100000213', null, '46355', '0', '240', '570', '229', '360', '45', '28', null, null, null, null, null, '2019-03-12 14:58:01', '2019-03-12 14:58:01');
INSERT INTO `device_record_his` VALUES ('826', '100000213', null, '46827', '0', '241', '573', '230', '363', '46', '28', null, null, null, null, null, '2019-03-12 14:59:01', '2019-03-12 14:59:01');
INSERT INTO `device_record_his` VALUES ('827', '100000213', null, '47825', '0', '242', '569', '230', '363', '45', '28', null, null, null, null, null, '2019-03-12 15:00:01', '2019-03-12 15:00:01');
INSERT INTO `device_record_his` VALUES ('828', '100000213', null, '47490', '0', '244', '562', '230', '364', '46', '28', null, null, null, null, null, '2019-03-12 15:01:01', '2019-03-12 15:01:01');
INSERT INTO `device_record_his` VALUES ('829', '100000213', null, '46922', '0', '246', '556', '229', '364', '45', '28', null, null, null, null, null, '2019-03-12 15:02:01', '2019-03-12 15:02:01');
INSERT INTO `device_record_his` VALUES ('830', '100000213', null, '46349', '0', '249', '551', '229', '361', '45', '28', null, null, null, null, null, '2019-03-12 15:03:01', '2019-03-12 15:03:01');
INSERT INTO `device_record_his` VALUES ('831', '100000213', null, '45697', '0', '246', '564', '229', '362', '45', '28', null, null, null, null, null, '2019-03-12 15:04:02', '2019-03-12 15:04:02');
INSERT INTO `device_record_his` VALUES ('832', '100000213', null, '45835', '0', '249', '562', '229', '363', '45', '28', null, null, null, null, null, '2019-03-12 15:05:01', '2019-03-12 15:05:01');
INSERT INTO `device_record_his` VALUES ('833', '100000213', null, '46618', '0', '252', '553', '230', '364', '46', '28', null, null, null, null, null, '2019-03-12 15:06:01', '2019-03-12 15:06:01');
INSERT INTO `device_record_his` VALUES ('834', '100000213', null, '45626', '0', '249', '553', '230', '366', '45', '28', null, null, null, null, null, '2019-03-12 15:07:01', '2019-03-12 15:07:01');
INSERT INTO `device_record_his` VALUES ('835', '100000213', null, '45327', '0', '245', '564', '229', '367', '45', '28', null, null, null, null, null, '2019-03-12 15:08:01', '2019-03-12 15:08:01');
INSERT INTO `device_record_his` VALUES ('836', '100000213', null, '45387', '0', '243', '577', '229', '360', '45', '28', null, null, null, null, null, '2019-03-12 15:09:01', '2019-03-12 15:09:01');
INSERT INTO `device_record_his` VALUES ('837', '100000213', null, '44508', '0', '240', '588', '229', '364', '45', '28', null, null, null, null, null, '2019-03-12 15:10:01', '2019-03-12 15:10:01');
INSERT INTO `device_record_his` VALUES ('838', '100000213', null, '43163', '0', '238', '591', '230', '360', '46', '28', null, null, null, null, null, '2019-03-12 15:11:01', '2019-03-12 15:11:01');
INSERT INTO `device_record_his` VALUES ('839', '100000213', null, '42064', '0', '237', '595', '230', '361', '45', '28', null, null, null, null, null, '2019-03-12 15:12:01', '2019-03-12 15:12:01');
INSERT INTO `device_record_his` VALUES ('840', '100000213', null, '42619', '0', '241', '580', '229', '362', '45', '28', null, null, null, null, null, '2019-03-12 15:13:01', '2019-03-12 15:13:01');
INSERT INTO `device_record_his` VALUES ('841', '100000213', null, '42578', '0', '242', '573', '229', '364', '46', '28', null, null, null, null, null, '2019-03-12 15:14:01', '2019-03-12 15:14:01');
INSERT INTO `device_record_his` VALUES ('842', '100000213', null, '43426', '0', '245', '570', '229', '361', '45', '28', null, null, null, null, null, '2019-03-12 15:15:01', '2019-03-12 15:15:01');
INSERT INTO `device_record_his` VALUES ('843', '100000213', null, '43002', '0', '247', '563', '229', '363', '45', '28', null, null, null, null, null, '2019-03-12 15:16:01', '2019-03-12 15:16:01');
INSERT INTO `device_record_his` VALUES ('844', '100000213', null, '42530', '0', '243', '568', '229', '363', '45', '28', null, null, null, null, null, '2019-03-12 15:17:00', '2019-03-12 15:17:00');
INSERT INTO `device_record_his` VALUES ('845', '100000213', null, '43187', '0', '241', '578', '229', '362', '45', '28', null, null, null, null, null, '2019-03-12 15:18:01', '2019-03-12 15:18:01');
INSERT INTO `device_record_his` VALUES ('846', '100000213', null, '43074', '0', '242', '578', '229', '365', '45', '28', null, null, null, null, null, '2019-03-12 15:19:01', '2019-03-12 15:19:01');
INSERT INTO `device_record_his` VALUES ('847', '100000213', null, '42709', '0', '243', '570', '230', '364', '45', '28', null, null, null, null, null, '2019-03-12 15:20:01', '2019-03-12 15:20:01');
INSERT INTO `device_record_his` VALUES ('848', '100000213', null, '42733', '0', '244', '557', '229', '364', '45', '28', null, null, null, null, null, '2019-03-12 15:21:01', '2019-03-12 15:21:01');
INSERT INTO `device_record_his` VALUES ('849', '100000213', null, '41573', '0', '243', '558', '229', '365', '45', '28', null, null, null, null, null, '2019-03-12 15:22:01', '2019-03-12 15:22:01');
INSERT INTO `device_record_his` VALUES ('850', '100000213', null, '42338', '0', '243', '567', '229', '364', '46', '28', null, null, null, null, null, '2019-03-12 15:23:01', '2019-03-12 15:23:01');
INSERT INTO `device_record_his` VALUES ('851', '100000213', null, '43109', '0', '244', '571', '229', '366', '45', '28', null, null, null, null, null, '2019-03-12 15:24:01', '2019-03-12 15:24:01');
INSERT INTO `device_record_his` VALUES ('852', '100000213', null, '42153', '0', '244', '572', '229', '365', '45', '28', null, null, null, null, null, '2019-03-12 15:25:02', '2019-03-12 15:25:02');
INSERT INTO `device_record_his` VALUES ('853', '100000213', null, '41305', '0', '237', '581', '229', '365', '45', '28', null, null, null, null, null, '2019-03-12 15:26:01', '2019-03-12 15:26:01');
INSERT INTO `device_record_his` VALUES ('854', '100000213', null, '41424', '0', '236', '594', '229', '365', '45', '28', null, null, null, null, null, '2019-03-12 15:27:01', '2019-03-12 15:27:01');
INSERT INTO `device_record_his` VALUES ('855', '100000213', null, '40802', '0', '233', '596', '229', '366', '45', '28', null, null, null, null, null, '2019-03-12 15:28:01', '2019-03-12 15:28:01');
INSERT INTO `device_record_his` VALUES ('856', '100000213', null, '40719', '0', '237', '594', '229', '364', '45', '28', null, null, null, null, null, '2019-03-12 15:29:01', '2019-03-12 15:29:01');
INSERT INTO `device_record_his` VALUES ('857', '100000213', null, '40808', '0', '234', '599', '229', '361', '46', '28', null, null, null, null, null, '2019-03-12 15:30:01', '2019-03-12 15:30:01');
INSERT INTO `device_record_his` VALUES ('858', '100000213', null, '40892', '0', '240', '582', '229', '365', '46', '28', null, null, null, null, null, '2019-03-12 15:31:01', '2019-03-12 15:31:01');
INSERT INTO `device_record_his` VALUES ('859', '100000213', null, '40946', '0', '242', '566', '229', '366', '45', '28', null, null, null, null, null, '2019-03-12 15:32:01', '2019-03-12 15:32:01');
INSERT INTO `device_record_his` VALUES ('860', '100000213', null, '40133', '0', '244', '566', '229', '361', '45', '28', null, null, null, null, null, '2019-03-12 15:33:01', '2019-03-12 15:33:01');
INSERT INTO `device_record_his` VALUES ('861', '100000213', null, '40043', '0', '245', '569', '229', '365', '46', '28', null, null, null, null, null, '2019-03-12 15:34:01', '2019-03-12 15:34:01');
INSERT INTO `device_record_his` VALUES ('862', '100000213', null, '40318', '0', '242', '551', '229', '360', '45', '28', null, null, null, null, null, '2019-03-12 15:35:01', '2019-03-12 15:35:01');
INSERT INTO `device_record_his` VALUES ('863', '100000213', null, '41083', '0', '241', '543', '229', '363', '45', '28', null, null, null, null, null, '2019-03-12 15:36:00', '2019-03-12 15:36:00');
INSERT INTO `device_record_his` VALUES ('864', '100000213', null, '41454', '0', '240', '544', '229', '362', '45', '28', null, null, null, null, null, '2019-03-12 15:37:01', '2019-03-12 15:37:01');
INSERT INTO `device_record_his` VALUES ('865', '100000213', null, '40432', '0', '238', '559', '229', '365', '45', '28', null, null, null, null, null, '2019-03-12 15:38:01', '2019-03-12 15:38:01');
INSERT INTO `device_record_his` VALUES ('866', '100000213', null, '39553', '0', '241', '557', '229', '364', '45', '28', null, null, null, null, null, '2019-03-12 15:39:02', '2019-03-12 15:39:02');
INSERT INTO `device_record_his` VALUES ('867', '100000213', null, '39547', '0', '242', '563', '229', '365', '45', '28', null, null, null, null, null, '2019-03-12 15:40:01', '2019-03-12 15:40:01');
INSERT INTO `device_record_his` VALUES ('868', '100000213', null, '39882', '0', '241', '559', '229', '363', '45', '28', null, null, null, null, null, '2019-03-12 15:41:01', '2019-03-12 15:41:01');
INSERT INTO `device_record_his` VALUES ('869', '100000213', null, '39667', '0', '239', '566', '228', '365', '45', '28', null, null, null, null, null, '2019-03-12 15:42:01', '2019-03-12 15:42:01');
INSERT INTO `device_record_his` VALUES ('870', '100000213', null, '38974', '0', '236', '576', '229', '365', '45', '28', null, null, null, null, null, '2019-03-12 15:43:01', '2019-03-12 15:43:01');
INSERT INTO `device_record_his` VALUES ('871', '100000213', null, '38854', '0', '236', '584', '229', '362', '46', '28', null, null, null, null, null, '2019-03-12 15:44:01', '2019-03-12 15:44:01');
INSERT INTO `device_record_his` VALUES ('872', '100000213', null, '38782', '0', '237', '583', '229', '366', '45', '28', null, null, null, null, null, '2019-03-12 15:45:01', '2019-03-12 15:45:01');
INSERT INTO `device_record_his` VALUES ('873', '100000213', null, '38699', '0', '239', '581', '228', '362', '45', '28', null, null, null, null, null, '2019-03-12 15:46:01', '2019-03-12 15:46:01');
INSERT INTO `device_record_his` VALUES ('874', '100000213', null, '38382', '0', '239', '576', '229', '362', '45', '28', null, null, null, null, null, '2019-03-12 15:47:01', '2019-03-12 15:47:01');
INSERT INTO `device_record_his` VALUES ('875', '100000213', null, '37270', '0', '237', '582', '229', '364', '45', '28', null, null, null, null, null, '2019-03-12 15:48:01', '2019-03-12 15:48:01');
INSERT INTO `device_record_his` VALUES ('876', '100000213', null, '36613', '0', '240', '577', '228', '365', '45', '28', null, null, null, null, null, '2019-03-12 15:49:01', '2019-03-12 15:49:01');
INSERT INTO `device_record_his` VALUES ('877', '100000213', null, '35890', '0', '237', '571', '228', '364', '45', '28', null, null, null, null, null, '2019-03-12 15:50:01', '2019-03-12 15:50:01');
INSERT INTO `device_record_his` VALUES ('878', '100000213', null, '35495', '0', '238', '576', '229', '360', '45', '28', null, null, null, null, null, '2019-03-12 15:51:02', '2019-03-12 15:51:02');
INSERT INTO `device_record_his` VALUES ('879', '100000213', null, '35017', '0', '235', '574', '229', '365', '45', '28', null, null, null, null, null, '2019-03-12 15:52:01', '2019-03-12 15:52:01');
INSERT INTO `device_record_his` VALUES ('880', '100000213', null, '34951', '0', '232', '591', '229', '366', '45', '28', null, null, null, null, null, '2019-03-12 15:53:01', '2019-03-12 15:53:01');
INSERT INTO `device_record_his` VALUES ('881', '100000213', null, '34527', '0', '234', '592', '228', '363', '45', '28', null, null, null, null, null, '2019-03-12 15:54:01', '2019-03-12 15:54:01');
INSERT INTO `device_record_his` VALUES ('882', '100000213', null, '34169', '0', '235', '592', '228', '362', '45', '28', null, null, null, null, null, '2019-03-12 15:55:01', '2019-03-12 15:55:01');
INSERT INTO `device_record_his` VALUES ('883', '100000213', null, '35304', '0', '235', '591', '228', '363', '45', '28', null, null, null, null, null, '2019-03-12 15:56:01', '2019-03-12 15:56:01');
INSERT INTO `device_record_his` VALUES ('884', '100000213', null, '34957', '0', '239', '587', '228', '363', '45', '28', null, null, null, null, null, '2019-03-12 15:57:01', '2019-03-12 15:57:01');
INSERT INTO `device_record_his` VALUES ('885', '100000213', null, '34910', '0', '237', '589', '229', '363', '45', '28', null, null, null, null, null, '2019-03-12 15:58:01', '2019-03-12 15:58:01');
INSERT INTO `device_record_his` VALUES ('886', '100000213', null, '33876', '0', '231', '607', '228', '362', '45', '28', null, null, null, null, null, '2019-03-12 15:59:01', '2019-03-12 15:59:01');
INSERT INTO `device_record_his` VALUES ('887', '100000213', null, '33499', '0', '226', '604', '228', '363', '46', '28', null, null, null, null, null, '2019-03-12 16:00:01', '2019-03-12 16:00:01');
INSERT INTO `device_record_his` VALUES ('888', '100000213', null, '33039', '0', '226', '605', '228', '365', '45', '28', null, null, null, null, null, '2019-03-12 16:01:01', '2019-03-12 16:01:01');
INSERT INTO `device_record_his` VALUES ('889', '100000213', null, '33529', '0', '223', '615', '228', '364', '45', '28', null, null, null, null, null, '2019-03-12 16:02:01', '2019-03-12 16:02:01');

-- ----------------------------
-- Table structure for device_record_his_avg
-- ----------------------------
DROP TABLE IF EXISTS `device_record_his_avg`;
CREATE TABLE `device_record_his_avg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dev_id` bigint(20) DEFAULT NULL,
  `video` varchar(11) DEFAULT NULL COMMENT '存在设备',
  `light` double(11,0) DEFAULT '0' COMMENT '光照  lux',
  `rain` double(11,0) DEFAULT '0' COMMENT '33     日降雨量3.3 mm',
  `air_temp` double(11,0) DEFAULT NULL COMMENT '空气温度  236   23.6 度',
  `air_humi` double(11,0) DEFAULT NULL COMMENT '空气湿度  384    38.4',
  `soil_temp` double(11,0) DEFAULT NULL COMMENT '土壤温度272    27.2度',
  `soil_humi` double(11,0) DEFAULT NULL COMMENT '土壤湿度275  27.5',
  `soil_electric` double(4,0) DEFAULT NULL COMMENT '土壤电导率  122 uS/cm   与光照不用除10',
  `soil_salt` double(11,0) DEFAULT NULL COMMENT '土壤盐分  69 mg/L',
  `air_pressure` double(11,0) DEFAULT NULL COMMENT '空气气压',
  `wind_speed` double(4,0) DEFAULT NULL COMMENT '风速',
  `wind` varchar(4) DEFAULT NULL COMMENT '风向',
  `create_time` date DEFAULT NULL,
  `update_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='设备的历史记录日平均值';

-- ----------------------------
-- Records of device_record_his_avg
-- ----------------------------
INSERT INTO `device_record_his_avg` VALUES ('1', '100000213', null, '1459', '33', '236', '384', '275', '273', '122', '69', null, null, null, '2019-02-27', null);
INSERT INTO `device_record_his_avg` VALUES ('2', '100000213', null, '1560', '39', '146', '263', '300', '434', '59', '111', null, null, null, '2019-02-28', null);
INSERT INTO `device_record_his_avg` VALUES ('3', '100000213', null, '1560', '44', '146', '262', '353', '423', '59', '110', null, null, null, '2019-03-01', null);
INSERT INTO `device_record_his_avg` VALUES ('4', '100000213', null, '1222', '10', '245', '100', '190', '360', '55', '145', null, null, null, '2019-03-02', null);
INSERT INTO `device_record_his_avg` VALUES ('5', '100000213', null, '1560', '44', '146', '262', '353', '423', '59', '110', null, null, null, '2019-03-03', null);
INSERT INTO `device_record_his_avg` VALUES ('6', '100000213', null, '1459', '33', '236', '384', '275', '273', '122', '69', null, null, null, '2019-03-04', null);
INSERT INTO `device_record_his_avg` VALUES ('7', '100000213', null, '15651', '80', '239', '857', '235', '364', '53', '32', null, null, null, '2019-03-05', null);

-- ----------------------------
-- Table structure for device_user
-- ----------------------------
DROP TABLE IF EXISTS `device_user`;
CREATE TABLE `device_user` (
  `id` int(11) DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_user
-- ----------------------------
INSERT INTO `device_user` VALUES ('1001', '100000213');
INSERT INTO `device_user` VALUES ('1001', '100000214');
INSERT INTO `device_user` VALUES ('1001', '100000215');
INSERT INTO `device_user` VALUES ('1020', '100000206');

-- ----------------------------
-- Table structure for device_warning
-- ----------------------------
DROP TABLE IF EXISTS `device_warning`;
CREATE TABLE `device_warning` (
  `id` int(11) NOT NULL,
  `dev_id` bigint(20) DEFAULT NULL COMMENT '设备id',
  `check_light` char(1) NOT NULL DEFAULT '1' COMMENT '选中光照  是否激活 默认1激活',
  `light_max_warning` int(11) DEFAULT NULL COMMENT '光照强度最大值报警',
  `light_min_warning` int(11) DEFAULT NULL COMMENT '光照强度最小值报警',
  `rain_max_warning` int(11) DEFAULT NULL COMMENT '降雨量最大值报警',
  `rain_min_warning` int(11) DEFAULT NULL COMMENT '降雨量最小值报警',
  `check_air_temp` char(1) NOT NULL DEFAULT '1',
  `air_temp_max_warning` int(11) DEFAULT NULL COMMENT '空气温度最大值报警',
  `air_temp_min_warning` int(11) DEFAULT NULL COMMENT '空气温度最小值报警',
  `check_air_humi` char(1) NOT NULL DEFAULT '1',
  `air_humi_max_warning` int(11) DEFAULT NULL COMMENT '空气湿度最大值报警',
  `air_humi_min_warning` int(11) DEFAULT NULL COMMENT '空气湿度最小值报警',
  `check_soil_temp` char(1) NOT NULL DEFAULT '1',
  `soil_temp_max_warning` int(11) DEFAULT NULL COMMENT '土壤温度最大值报警',
  `soil_temp_min_warning` int(11) DEFAULT NULL COMMENT '土壤温度最小值报警',
  `check_soil_humi` char(1) NOT NULL DEFAULT '1',
  `soil_humi_max_warning` int(11) DEFAULT NULL COMMENT '土壤湿度最大值报警',
  `soil_humi_min_warning` int(11) DEFAULT NULL COMMENT '土壤湿度最小值报警',
  `check_soil_electric` char(1) NOT NULL DEFAULT '1',
  `soil_electric_max_warning` int(11) DEFAULT NULL COMMENT '土壤电导率最大值报警',
  `soil_electric_min_warning` int(11) DEFAULT NULL COMMENT '土壤电导率最小值报警',
  `check_soil_salt` char(1) NOT NULL DEFAULT '1',
  `soil_salt_max_warning` int(11) DEFAULT NULL COMMENT '土壤盐分最大值报警',
  `soil_salt_min_warning` int(11) DEFAULT NULL COMMENT '土壤盐分最小值报警',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='报警';

-- ----------------------------
-- Records of device_warning
-- ----------------------------

-- ----------------------------
-- Table structure for device_warning_record_his
-- ----------------------------
DROP TABLE IF EXISTS `device_warning_record_his`;
CREATE TABLE `device_warning_record_his` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `devId` varchar(11) DEFAULT NULL COMMENT '设备',
  `warning` varchar(10) DEFAULT NULL COMMENT '报警类型',
  `create_time` datetime DEFAULT NULL COMMENT '报警时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_warning_record_his
-- ----------------------------

-- ----------------------------
-- Table structure for mounting
-- ----------------------------
DROP TABLE IF EXISTS `mounting`;
CREATE TABLE `mounting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `device_id` int(11) DEFAULT NULL COMMENT '设备id',
  `mounting_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备挂载的传感器表';

-- ----------------------------
-- Records of mounting
-- ----------------------------

-- ----------------------------
-- Table structure for permission
-- ----------------------------
DROP TABLE IF EXISTS `permission`;
CREATE TABLE `permission` (
  `id` int(4) NOT NULL COMMENT '权限id',
  `p_Name` varchar(20) DEFAULT NULL COMMENT '权限名称',
  `detail` varchar(100) DEFAULT NULL COMMENT '权限说明',
  `status` int(4) DEFAULT '1' COMMENT '状态，1：正常，0：冻结',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of permission
-- ----------------------------
INSERT INTO `permission` VALUES ('1', '浏览实时视频', 'view', null);
INSERT INTO `permission` VALUES ('2', '浏览实时数据历史数据', 'viewdata', null);
INSERT INTO `permission` VALUES ('3', '远程控制', 'add', null);
INSERT INTO `permission` VALUES ('4', '添加修改删除二三级用户', 'edit', null);

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(4) NOT NULL COMMENT '角色id',
  `roleName` varchar(10) DEFAULT NULL COMMENT '角色名称',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员');
INSERT INTO `role` VALUES ('2', '管理员用户');
INSERT INTO `role` VALUES ('3', '普通用户');

-- ----------------------------
-- Table structure for role_permission
-- ----------------------------
DROP TABLE IF EXISTS `role_permission`;
CREATE TABLE `role_permission` (
  `roleid` int(4) DEFAULT NULL COMMENT '角色id',
  `p_id` int(4) DEFAULT NULL COMMENT '权限id',
  KEY `permissionid` (`p_id`),
  KEY `role_permissionid` (`roleid`),
  CONSTRAINT `permissionid` FOREIGN KEY (`p_id`) REFERENCES `permission` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `role_permissionid` FOREIGN KEY (`roleid`) REFERENCES `role` (`role_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_permission
-- ----------------------------
INSERT INTO `role_permission` VALUES ('1', '1');
INSERT INTO `role_permission` VALUES ('1', '2');
INSERT INTO `role_permission` VALUES ('1', '3');
INSERT INTO `role_permission` VALUES ('1', '4');
INSERT INTO `role_permission` VALUES ('2', '1');
INSERT INTO `role_permission` VALUES ('2', '2');
INSERT INTO `role_permission` VALUES ('2', '3');
INSERT INTO `role_permission` VALUES ('3', '1');
INSERT INTO `role_permission` VALUES ('3', '2');

-- ----------------------------
-- Table structure for tbl_emp
-- ----------------------------
DROP TABLE IF EXISTS `tbl_emp`;
CREATE TABLE `tbl_emp` (
  `emp_id` int(11) NOT NULL COMMENT '职工id',
  `emp_name` varchar(50) DEFAULT NULL,
  `gender` char(1) DEFAULT '0' COMMENT '男0女1',
  `email` varchar(50) DEFAULT NULL,
  `d_id` int(11) DEFAULT '0' COMMENT '部门编号',
  PRIMARY KEY (`emp_id`),
  KEY `deptid` (`d_id`),
  KEY `emp_name` (`emp_name`),
  KEY `emp_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tbl_emp
-- ----------------------------
INSERT INTO `tbl_emp` VALUES ('1001', 'admin', 'M', 'e123456@qq.com', '4');
INSERT INTO `tbl_emp` VALUES ('1020', 'jun', '0', 'megain@megain.com', '3');

-- ----------------------------
-- Table structure for update_terminal
-- ----------------------------
DROP TABLE IF EXISTS `update_terminal`;
CREATE TABLE `update_terminal` (
  `up_id` bigint(50) NOT NULL COMMENT '可升级更新的设备ID',
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `up_status` int(4) DEFAULT NULL COMMENT '状态1-已更新  2-可更新 3-删除',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`up_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='固件远程升级';

-- ----------------------------
-- Records of update_terminal
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户表id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '用户密码，MD5加密',
  `email` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `question` varchar(100) DEFAULT NULL COMMENT '找回密码问题',
  `answer` varchar(100) DEFAULT NULL COMMENT '找回密码答案',
  `status` int(4) DEFAULT '1' COMMENT '''状态，1：正常，0：冻结状态，2：删除',
  `dept_id` int(11) DEFAULT NULL COMMENT '组织编号',
  `role_id` int(4) NOT NULL COMMENT '角色1-普通用户,2-管理员，3-超级用户',
  `d_id` int(11) DEFAULT NULL COMMENT '所属组织编号   -1无部门，≥1有部门',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '最后一次更新时间',
  `login_time` datetime DEFAULT NULL COMMENT '登录时间',
  `last_login_time` datetime DEFAULT NULL COMMENT '最后登录时间',
  `num_admin_devices` int(11) DEFAULT NULL COMMENT '用户拥有管理员权限的设备数',
  `num_watch_device` int(11) DEFAULT NULL COMMENT '用户可以浏览的设备数',
  `gender` char(1) DEFAULT '0' COMMENT '性别，0男，1女',
  `dep_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_name_unique` (`username`) USING BTREE,
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=1036 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1001', 'admin', 'V10BYZ3949NB59BNNV56V057A20A883V', 'e123456@qq.com', '1323456789', '问题', '答案', '1', '0', '1', null, '2019-02-20 17:28:11', '2019-02-20 17:28:11', '2019-02-20 17:28:11', '2019-02-20 17:28:11', null, null, '0', '0');
INSERT INTO `user` VALUES ('1020', 'jun', 'V10BYZ3949NB59BNNV56V057A20A883V', 'megain@megain.com', '13434568765', '好问题', '没答案', '1', '3', '1', null, '2019-01-18 11:13:44', '2019-01-18 11:13:51', '2019-01-18 11:13:53', '2019-01-18 11:13:56', null, null, '0', null);
INSERT INTO `user` VALUES ('1033', 'junhao', 'V10BYZ3949NB59BNNV56V057A20A883V', 'email@163.com', '12345678911', null, null, '1', '0', '3', null, '2019-01-22 14:22:23', '2019-01-22 14:22:23', '2019-01-22 14:22:23', '2019-01-22 14:22:23', null, null, '0', null);
INSERT INTO `user` VALUES ('1034', 'xungui', '21232A297B57B5B743894B0V4B801AZ3', 'email@163.com', '12345678911', null, null, '1', '0', '3', null, '2019-01-22 14:25:16', '2019-01-22 14:25:16', '2019-01-22 14:25:16', '2019-01-22 14:25:16', null, null, '0', null);
INSERT INTO `user` VALUES ('1035', 'jun1', 'V10BYZ3949NB59BNNV56V057A20A883V', 'emailemail@163.com', '12345678911', null, null, null, '3', '3', null, '2019-02-20 17:07:24', '2019-02-20 17:07:24', '2019-02-20 17:07:24', '2019-02-20 17:07:24', null, null, null, null);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `userid` int(11) NOT NULL COMMENT '用户id',
  `roleid` int(4) NOT NULL COMMENT '角色id',
  KEY `userid` (`userid`),
  KEY `roleid` (`roleid`),
  CONSTRAINT `roleid` FOREIGN KEY (`roleid`) REFERENCES `role` (`role_id`) ON UPDATE CASCADE,
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `user` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1001', '1');

-- ----------------------------
-- Table structure for user_watch_device
-- ----------------------------
DROP TABLE IF EXISTS `user_watch_device`;
CREATE TABLE `user_watch_device` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `is_admin` int(1) DEFAULT '0' COMMENT '0不是管理员，1管理员(一个设备一个管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_watch_device
-- ----------------------------
