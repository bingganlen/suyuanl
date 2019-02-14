/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : shuyuan

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-02-14 17:13:44
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
  `id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='终端管理';

-- ----------------------------
-- Records of device
-- ----------------------------

-- ----------------------------
-- Table structure for deviceuser
-- ----------------------------
DROP TABLE IF EXISTS `deviceuser`;
CREATE TABLE `deviceuser` (
  `id` int(11) DEFAULT NULL,
  `device_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deviceuser
-- ----------------------------

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
  `light` int(11) DEFAULT NULL COMMENT '光照',
  `rain` int(11) DEFAULT NULL COMMENT '降雨量',
  `air_temp` int(11) DEFAULT NULL COMMENT '空气温度',
  `air_humi` int(11) DEFAULT NULL COMMENT '空气湿度',
  `soil_temp` int(11) DEFAULT NULL COMMENT '土壤温度',
  `soil_humi` int(11) DEFAULT NULL COMMENT '土壤湿度',
  `soil_electric` int(4) DEFAULT NULL COMMENT '土壤电导率',
  `soil_salt` int(11) DEFAULT NULL COMMENT '土壤盐分',
  `longtitude` int(11) DEFAULT NULL COMMENT '经度',
  `latitude` int(11) DEFAULT NULL COMMENT '纬度',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备的历史记录';

-- ----------------------------
-- Records of device_record_his
-- ----------------------------

-- ----------------------------
-- Table structure for device_warning
-- ----------------------------
DROP TABLE IF EXISTS `device_warning`;
CREATE TABLE `device_warning` (
  `id` int(11) NOT NULL,
  `dev_id` bigint(20) DEFAULT NULL COMMENT '设备id',
  `light_max_warning` int(11) DEFAULT NULL COMMENT '光照强度最大值报警',
  `light_min_warning` int(11) DEFAULT NULL COMMENT '光照强度最小值报警',
  `rain_max_warning` int(11) DEFAULT NULL COMMENT '降雨量最大值报警',
  `rain_min_warning` int(11) DEFAULT NULL COMMENT '降雨量最小值报警',
  `air_temp_max_warning` int(11) DEFAULT NULL COMMENT '空气温度最大值报警',
  `air_temp_min_warning` int(11) DEFAULT NULL COMMENT '空气温度最小值报警',
  `air_humi_max_warning` int(11) DEFAULT NULL COMMENT '空气湿度最大值报警',
  `air_humi_min_warning` int(11) DEFAULT NULL COMMENT '空气湿度最小值报警',
  `soil_temp_max_warning` int(11) DEFAULT NULL COMMENT '土壤温度最大值报警',
  `soil_temp_min_warning` int(11) DEFAULT NULL COMMENT '土壤温度最小值报警',
  `soil_humi_max_warning` int(11) DEFAULT NULL COMMENT '土壤湿度最大值报警',
  `soil_humi_min_warning` int(11) DEFAULT NULL COMMENT '土壤湿度最小值报警',
  `soil_electric_max_warning` int(11) DEFAULT NULL COMMENT '土壤电导率最大值报警',
  `soil_electric_min_warning` int(11) DEFAULT NULL COMMENT '土壤电导率最小值报警',
  `soil_salt_max_warning` int(11) DEFAULT NULL COMMENT '土壤盐分最大值报警',
  `soil_salt_min_warning` int(11) DEFAULT NULL COMMENT '土壤盐分最小值报警',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of device_warning
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
  `dept_id` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=1035 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1001', 'admin', 'Z33367701511N4A6020VZ61YVY352059', 'e123456@qq.com', '1323456789', '问题', '答案', '1', null, '1', null, '2019-01-23 09:25:01', '2019-01-23 09:25:01', '2019-01-23 09:25:01', '2019-01-23 09:25:01', null, null, '0', null);
INSERT INTO `user` VALUES ('1020', 'jun', '123456', 'megain@megain.com', '13434568765', '好问题', '没答案', '1', null, '1', null, '2019-01-18 11:13:44', '2019-01-18 11:13:51', '2019-01-18 11:13:53', '2019-01-18 11:13:56', null, null, '0', null);
INSERT INTO `user` VALUES ('1033', 'junhao', 'V10BYZ3949NB59BNNV56V057A20A883V', 'email@163.com', '12345678911', null, null, '1', null, '3', null, '2019-01-22 14:22:23', '2019-01-22 14:22:23', '2019-01-22 14:22:23', '2019-01-22 14:22:23', null, null, '0', null);
INSERT INTO `user` VALUES ('1034', 'xungui', '21232A297B57B5B743894B0V4B801AZ3', 'email@163.com', '12345678911', null, null, '1', null, '3', null, '2019-01-22 14:25:16', '2019-01-22 14:25:16', '2019-01-22 14:25:16', '2019-01-22 14:25:16', null, null, '0', null);

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
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `device_id` int(11) DEFAULT NULL,
  `is_admin` int(1) DEFAULT '0' COMMENT '0不是管理员，1管理员(一个设备一个管理员',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_watch_device
-- ----------------------------
