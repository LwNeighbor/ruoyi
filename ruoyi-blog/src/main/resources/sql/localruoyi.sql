/*
 Navicat Premium Data Transfer

 Source Server         : localmysql
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : localruoyi

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 07/12/2018 21:53:34
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `blob_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cron_expression` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time_zone_id` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `entry_id` varchar(95) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `job_class_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_durable` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_update_data` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `requests_recovery` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.ScheduleJob', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F7372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720020636F6D2E72756F79692E636F6D6D6F6E2E626173652E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000133740001317800);
INSERT INTO `qrtz_job_details` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', NULL, 'com.ruoyi.quartz.util.ScheduleJob', '0', '1', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F7372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720020636F6D2E72756F79692E636F6D6D6F6E2E626173652E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D73740002727974000133740001317800);

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `lock_name` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('RuoyiScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `instance_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('RuoyiScheduler', '9LBRYD8WIWWY7SA1543741871671', 1543742326422, 15000);

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `str_prop_1` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_2` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `str_prop_3` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `int_prop_1` int(11) NULL DEFAULT NULL,
  `int_prop_2` int(11) NULL DEFAULT NULL,
  `long_prop_1` bigint(20) NULL DEFAULT NULL,
  `long_prop_2` bigint(20) NULL DEFAULT NULL,
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL,
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL,
  `bool_prop_1` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bool_prop_2` varchar(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `job_group` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `next_fire_time` bigint(13) NULL DEFAULT NULL,
  `prev_fire_time` bigint(13) NULL DEFAULT NULL,
  `priority` int(11) NULL DEFAULT NULL,
  `trigger_state` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `trigger_type` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) NULL DEFAULT NULL,
  `calendar_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `misfire_instr` smallint(2) NULL DEFAULT NULL,
  `job_data` blob NULL,
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', '__TASK_CLASS_NAME__1', 'DEFAULT', NULL, 1543673680000, -1, 5, 'PAUSED', 'CRON', 1543673680000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F7372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720020636F6D2E72756F79692E636F6D6D6F6E2E626173652E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000133740001317800);
INSERT INTO `qrtz_triggers` VALUES ('RuoyiScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', '__TASK_CLASS_NAME__2', 'DEFAULT', NULL, 1543673680000, -1, 5, 'PAUSED', 'CRON', 1543673680000, 0, NULL, 2, 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F7372001E636F6D2E72756F79692E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720020636F6D2E72756F79692E636F6D6D6F6E2E626173652E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D73740002727974000133740001317800);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-default', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '默认 skin-default、蓝色 skin-blue、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '初始化密码 123456');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '若依科技', 0, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '深圳总公司', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '研发部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 27 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES (11, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES (12, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES (13, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES (14, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (15, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES (16, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES (17, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES (18, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES (19, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES (20, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES (21, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES (22, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES (23, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES (24, 8, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES (25, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES (26, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (6, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (8, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (9, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法参数',
  `cron_expression` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, 'ryTask', '系统默认（无参）', 'ryNoParams', '', '0/10 * * * * ?', '3', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES (2, 'ryTask', '系统默认（有参）', 'ryParams', 'ry', '0/20 * * * * ?', '3', '1', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法参数',
  `job_message` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-01 22:14:58');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-02 00:26:08');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(4) NULL DEFAULT 0 COMMENT '显示顺序',
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1057 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, '#', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, '/system/dept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, '/system/post', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, '/system/config', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, '/system/notice', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, '#', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, '/monitor/job', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 3, '/monitor/server', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES (113, '表单构建', 3, 1, '/tool/build', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES (114, '代码生成', 3, 2, '/tool/gen', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES (115, '系统接口', 3, 3, '/tool/swagger', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1005, '重置密码', 100, 6, '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1006, '角色查询', 101, 1, '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1007, '角色新增', 101, 2, '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1008, '角色修改', 101, 3, '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1009, '角色删除', 101, 4, '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1010, '角色导出', 101, 5, '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1011, '菜单查询', 102, 1, '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1012, '菜单新增', 102, 2, '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1013, '菜单修改', 102, 3, '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1014, '菜单删除', 102, 4, '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1015, '部门查询', 103, 1, '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1016, '部门新增', 103, 2, '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1017, '部门修改', 103, 3, '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1018, '部门删除', 103, 4, '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1019, '岗位查询', 104, 1, '#', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1020, '岗位新增', 104, 2, '#', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1021, '岗位修改', 104, 3, '#', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1022, '岗位删除', 104, 4, '#', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1023, '岗位导出', 104, 5, '#', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1024, '字典查询', 105, 1, '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1025, '字典新增', 105, 2, '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1026, '字典修改', 105, 3, '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1027, '字典删除', 105, 4, '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1028, '字典导出', 105, 5, '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1029, '参数查询', 106, 1, '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1030, '参数新增', 106, 2, '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1031, '参数修改', 106, 3, '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1032, '参数删除', 106, 4, '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1033, '参数导出', 106, 5, '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1034, '公告查询', 107, 1, '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1035, '公告新增', 107, 2, '#', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1036, '公告修改', 107, 3, '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1037, '公告删除', 107, 4, '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1038, '操作查询', 500, 1, '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1039, '操作删除', 500, 2, '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1040, '详细信息', 500, 3, '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 4, '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1045, '在线查询', 109, 1, '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1046, '批量强退', 109, 2, '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1047, '单条强退', 109, 3, '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1048, '任务查询', 110, 1, '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1049, '任务新增', 110, 2, '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1050, '任务修改', 110, 3, '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1051, '任务删除', 110, 4, '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1052, '状态修改', 110, 5, '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1053, '任务详细', 110, 6, '#', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 7, '#', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 114, 1, '#', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES (1056, '生成代码', 114, 2, '#', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `status` int(1) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES (2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `dept_id` int(11) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '盐加密',
  `status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2018-12-02 00:26:09', 'admin', '2018-03-16 11:33:00', 'ry', '2018-12-02 00:26:08', '管理员');
INSERT INTO `sys_user` VALUES (2, 105, 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '8e6d98b90472783cc73c17047ddccf36', '222222', '0', '0', '127.0.0.1', '2018-03-16 11:33:00', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '测试员');

-- ----------------------------
-- Table structure for sys_user_online
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online`  (
  `sessionId` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime(0) NULL DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime(0) NULL DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) NULL DEFAULT 0 COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '在线用户记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `post_id` int(11) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (2, 2);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

-- ----------------------------
-- Table structure for t_attach
-- ----------------------------
DROP TABLE IF EXISTS `t_attach`;
CREATE TABLE `t_attach`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `fname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `ftype` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `fkey` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `author_id` int(10) NULL DEFAULT NULL,
  `created` int(10) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_attach
-- ----------------------------
INSERT INTO `t_attach` VALUES (1, '1.jpeg', 'image', '/upload/2017/06/t93vgdj6o8irgo87ds56u0ou0s.jpeg', 1, 1496816096);

-- ----------------------------
-- Table structure for t_comments
-- ----------------------------
DROP TABLE IF EXISTS `t_comments`;
CREATE TABLE `t_comments`  (
  `coid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `cid` int(10) UNSIGNED NULL DEFAULT 0,
  `created` int(10) UNSIGNED NULL DEFAULT 0,
  `author` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author_id` int(10) UNSIGNED NULL DEFAULT 0,
  `owner_id` int(10) UNSIGNED NULL DEFAULT 0,
  `mail` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `agent` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'comment',
  `status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'approved',
  `parent` int(10) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`coid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  INDEX `created`(`created`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comments
-- ----------------------------
INSERT INTO `t_comments` VALUES (1, 6, 1497672195, 'tzs', 0, 1, '101011@gmail.com', 'http://juejin.im', '0:0:0:0:0:0:0:1', NULL, '棒棒哒，厉害了', 'comment', 'approved', 0);
INSERT INTO `t_comments` VALUES (2, 6, 1497672339, 'tzs', 0, 1, '101011@gmail.com', 'http://juejin.im', '0:0:0:0:0:0:0:1', NULL, '再次评论，看看效果', 'comment', 'approved', 0);
INSERT INTO `t_comments` VALUES (3, 5, 1497676424, 'tzs', 0, 1, '101011@gmail.com', 'http://juejin.im', '0:0:0:0:0:0:0:1', NULL, 'vswfwfwfw', 'comment', 'approved', 0);

-- ----------------------------
-- Table structure for t_contents
-- ----------------------------
DROP TABLE IF EXISTS `t_contents`;
CREATE TABLE `t_contents`  (
  `cid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `slug` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created` int(10) UNSIGNED NULL DEFAULT 0,
  `modified` int(10) UNSIGNED NULL DEFAULT 0,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容文字',
  `author_id` int(10) UNSIGNED NULL DEFAULT 0,
  `type` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'post',
  `status` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'publish',
  `tags` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `categories` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `hits` int(10) UNSIGNED NULL DEFAULT 0,
  `comments_num` int(10) UNSIGNED NULL DEFAULT 0,
  `allow_comment` tinyint(1) NULL DEFAULT 1,
  `allow_ping` tinyint(1) NULL DEFAULT 1,
  `allow_feed` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`cid`) USING BTREE,
  UNIQUE INDEX `slug`(`slug`) USING BTREE,
  INDEX `created`(`created`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_contents
-- ----------------------------
INSERT INTO `t_contents` VALUES (1, 'about my blog', 'about', 1487853610, 1497324440, '## Blog\r\n\r\n[Blog](https://github.com/zhisheng17/blog)  fork from [My Blog](https://github.com/ZHENFENG13/My-Blog) , 该作者是在 [Tale](https://github.com/otale/tale) 博客系统基础上进行修改的。\r\n\r\n`Tale` 使用了轻量级 mvc 框架 `Blade` 开发，默认主题使用了漂亮的 `pinghsu` 。\r\n\r\n`My-Blog` 使用的是 Docker + SpringBoot + Mybatis + thymeleaf 打造的一个个人博客模板。\r\n\r\n***\r\n\r\n[Blog](https://github.com/zhisheng17/blog)  在  [My Blog](https://github.com/ZHENFENG13/My-Blog)  的基础上去除了 Docker，采用的是 SpringBoot + Mybatis + thymeleaf  + MySQL 搭建的一个博客，其中在原来作者的基础上优化了。\r\n\r\n## 开源协议\r\n\r\n[MIT](./LICENSE)\r\n\r\n## 感谢\r\n\r\n[ZHENFENG13](https://github.com/ZHENFENG13)\r\n\r\n[otale](https://github.com/otale)\r\n', 1, 'page', 'publish', NULL, NULL, 48, 0, 1, 1, 1);
INSERT INTO `t_contents` VALUES (3, '《Java 多线程编程核心技术》学习笔记及总结', 'Java-Thread', 1497322995, 1497323171, '## 第一章 —— Java 多线程技能\r\n\r\n线程技术点：\r\n\r\n+ 线程的启动\r\n+ 如何使线程暂停\r\n+ 如何使线程停止\r\n+ 线程的优先级\r\n+ 线程安全相关问题\r\n<!-- more -->\r\n### 进程和线程的概念及多线程的优点\r\n\r\n进程：比如我们电脑运行的 QQ.exe 程序，是操作系统管理的基本运行单元\r\n\r\n线程：在进程中独立运行的子任务，比如 QQ.exe 进程中就有很多线程在运行，下载文件线程、发送消息线程、语音线程、视频线程等。\r\n\r\n多线程优点：我们电脑可以同时操作不同的软件，边听着歌，敲着代码，查看 pdf 文档，浏览网页等，CPU 在这些任务之间不停的切换，切换非常快，所以我们就觉得他们是在同时运行的。\r\n\r\n### 使用多线程\r\n\r\n#### 继承 Thread 类\r\n\r\nJDK 源码注释（Thread.java）如下：\r\n\r\n```java\r\nOne is to declare a class to be a subclass(子类) of <code>Thread</code>. This subclass should override the <code>run</code> method of class <code>Thread</code>. An instance of the subclass can then be allocated and started. For example, a thread that computes primes\r\nlarger than a stated value could be written as follows:\r\n//继承 Thread 类\r\nclass PrimeThread extends Thread {\r\n         long minPrime;\r\n         PrimeThread(long minPrime) {\r\n          this.minPrime = minPrime;\r\n         }\r\n\r\n         public void run() {\r\n             // compute primes larger than minPrime\r\n             重写 Thread 类的 run 方法\r\n          }\r\n     }\r\n\r\nThe following code would then create a thread and start it running:\r\n//开启线程\r\n    PrimeThread p = new PrimeThread(143);\r\n    p.start();\r\n```\r\n\r\n#### 实现 Runnable 接口\r\n\r\nJDK 源码注释（Thread.java）如下：\r\n\r\n```java\r\nThe other way to create a thread is to declare a class that implements the <code>Runnable</code> interface. That class then implements the <code>run</code> method. An instance of the class can then be allocated, passed as an argument when creating\r\n<code>Thread</code>, and started. The same example in this other style looks like the following:\r\n//实现 Runnable 接口\r\n    class PrimeRun implements Runnable {\r\n        long minPrime;\r\n        PrimeRun(long minPrime) {\r\n            this.minPrime = minPrime;\r\n         }\r\n\r\n         public void run() {\r\n            // compute primes larger than minPrime\r\n            //重写 run 方法\r\n        }\r\n    }\r\n\r\nThe following code would then create a thread and start it running:\r\n//开启线程\r\n     PrimeRun p = new PrimeRun(143);\r\n     new Thread(p).start();\r\n```\r\n\r\n\r\n\r\n### currentThread() 方法\r\n\r\n该方法返回代码段正在被哪个线程调用的信息。\r\n\r\n### isAlive() 方法\r\n\r\n判断当前线程是否处于活动状态（已经启动但未终止）\r\n\r\n### sleep() 方法\r\n\r\n在指定的毫秒数内让当前“正在执行的线程（this.currentThread() 返回的线程）”休眠（暂停执行）。\r\n\r\n### getId() 方法\r\n\r\n获取线程的唯一标识\r\n\r\n### 停止线程\r\n\r\n可以使用 <del>Thread.stop()</del> 方法，但最好不要用，因为这个方法是不安全的，已经弃用作废了。\r\n\r\n大多数停止一个线程是使用 Thread.interrupt() 方法\r\n\r\n#### 判断线程是否是停止状态\r\n\r\n+    interrupted()\r\n```java\r\n     //测试当前线程是否已经中断了，这个线程的中断状态会被这个方法清除。\r\n     //换句话说，如果连续两次调用了这个方法，第二次调用的时候将会返回 false ，\r\n     public static boolean interrupted() {\r\n             return currentThread().isInterrupted(true);\r\n     }\r\n```\r\n\r\n+    isInterrupted()\r\n\r\n```java\r\n        //测试线程是否已经中断了，线程的状态不会受这个方法的影响\r\n        //线程中断被忽略，因为线程处于中断下不处于活动状态的线程由此返回false的方法反映出来\r\n         public boolean isInterrupted() {\r\n                return isInterrupted(false);\r\n        }\r\n        /**\r\n     * Tests if some Thread has been interrupted.  The interrupted state\r\n     * is reset or not based on the value of ClearInterrupted that is\r\n     * passed.\r\n     */\r\n     private native boolean isInterrupted(boolean ClearInterrupted);\r\n```\r\n\r\n#### 在沉睡中停止\r\n\r\n```java\r\npublic class MyThread2 extends Thread\r\n{\r\n    @Override\r\n    public void run() {\r\n        try {\r\n            System.out.println(\"run start\");\r\n            Thread.sleep(20000);\r\n            System.out.println(\"run end\");\r\n        } catch (InterruptedException e) {\r\n            System.out.println(\"run catch \"+this.isInterrupted());\r\n            e.printStackTrace();\r\n        }\r\n    }\r\n    public static void main(String[] args) {\r\n        try {\r\n            MyThread2 t2 = new MyThread2();\r\n            t2.start();\r\n            Thread.sleep(200);\r\n            t2.interrupt();\r\n        } catch (InterruptedException e) {\r\n            System.out.println(\"main catch\");\r\n            e.printStackTrace();\r\n        }\r\n        System.out.println(\"main end\");\r\n    }\r\n}\r\n```\r\n\r\n运行结果：\r\n\r\n```java\r\nrun start\r\nmain end\r\nrun catch false\r\njava.lang.InterruptedException: sleep interrupted\r\n	at java.lang.Thread.sleep(Native Method)\r\n	at com.zhisheng.thread.thread1.MyThread2.run(MyThread2.java:12)\r\n```\r\n\r\n从运行结果来看，如果在 sleep 状态下停止某一线程，会进入 catch 语句，并清除停止状态值，使之变成 false。\r\n\r\n#### 在停止中沉睡\r\n\r\n```java\r\npublic class MyThread3 extends Thread\r\n{\r\n    @Override\r\n    public void run() {\r\n        try {\r\n            System.out.println(\"run start\");\r\n            Thread.sleep(20000);\r\n            System.out.println(\"run end\");\r\n        } catch (InterruptedException e) {\r\n            System.out.println(\"run catch \"+this.isInterrupted());\r\n            e.printStackTrace();\r\n        }\r\n    }\r\n    public static void main(String[] args) {\r\n            MyThread3 t3 = new MyThread3();\r\n            t3.start();\r\n            t3.interrupt();\r\n    }\r\n}\r\n```\r\n\r\n运行结果：\r\n\r\n```java\r\nrun start\r\nrun catch false\r\njava.lang.InterruptedException: sleep interrupted\r\n	at java.lang.Thread.sleep(Native Method)\r\n	at com.zhisheng.thread.thread1.MyThread3.run(MyThread3.java:12)\r\n```\r\n\r\n#### 能停止的线程 —— 暴力停止\r\n\r\n使用 stop() 方法停止线程\r\n\r\n### 暂停线程\r\n\r\n可使用 suspend 方法暂停线程，使用 resume() 方法恢复线程的执行。\r\n\r\n#### suspend 和 resume 方法的使用\r\n\r\n```java\r\npublic class MyThread4 extends Thread\r\n{\r\n    private int i;\r\n    public int getI() {\r\n        return i;\r\n    }\r\n    public void setI(int i) {\r\n        this.i = i;\r\n    }\r\n    @Override\r\n    public void run() {\r\n        while (true) {\r\n            i++;\r\n        }\r\n    }\r\n    public static void main(String[] args) throws InterruptedException {\r\n        MyThread4 t4 = new MyThread4();\r\n        t4.start();\r\n        System.out.println(\"A----- \" + System.currentTimeMillis() + \" ---- \" + t4.getI());\r\n        Thread.sleep(2000);\r\n        System.out.println(\"A----- \" + System.currentTimeMillis() + \" ---- \" + t4.getI());\r\n        t4.suspend();\r\n        Thread.sleep(2000);\r\n        t4.resume();\r\n        System.out.println(\"B----- \" + System.currentTimeMillis() + \" ---- \" + t4.getI());\r\n        Thread.sleep(2000);\r\n        System.out.println(\"B----- \" + System.currentTimeMillis() + \" ---- \" + t4.getI());\r\n    }\r\n}\r\n```\r\n\r\n从运行结果来看，线程的确能够暂停和恢复。\r\n\r\n但是 suspend 和 resume 方法的缺点就是：**不同步**，因为线程的暂停导致数据的不同步。\r\n\r\n### yield 方法\r\n\r\n```java\r\n/**\r\n     * A hint to the scheduler that the current thread is willing to yield\r\n     * its current use of a processor. The scheduler is free to ignore this\r\n     * hint.\r\n     *\r\n     * <p> Yield is a heuristic attempt to improve relative progression\r\n     * between threads that would otherwise over-utilise a CPU. Its use\r\n     * should be combined with detailed profiling and benchmarking to\r\n     * ensure that it actually has the desired effect.\r\n     *\r\n     * <p> It is rarely appropriate to use this method. It may be useful\r\n     * for debugging or testing purposes, where it may help to reproduce\r\n     * bugs due to race conditions. It may also be useful when designing\r\n     * concurrency control constructs such as the ones in the\r\n     * {@link java.util.concurrent.locks} package.\r\n     */\r\n    //暂停当前正在执行的线程对象，并执行其他线程。暂停的时间不确定。\r\n    public static native void yield();\r\n```\r\n\r\n```java\r\npublic class MyThread5 extends Thread\r\n{\r\n    @Override\r\n    public void run() {\r\n        double start = System.currentTimeMillis();\r\n        for (int i = 0; i < 200000; i++) {\r\n            //yield();//暂停的时间不确定\r\n            i++;\r\n        }\r\n        double end = System.currentTimeMillis();\r\n        System.out.println(\"time is \"+(end - start));\r\n    }\r\n    public static void main(String[] args) {\r\n        MyThread5  t5 = new MyThread5();\r\n        t5.start();\r\n    }\r\n}\r\n```\r\n\r\n### 线程的优先级\r\n\r\n设置优先级的方法：setPriority() 方法\r\n\r\n```java\r\npublic final void setPriority(int newPriority) {\r\n        ThreadGroup g;\r\n        checkAccess();\r\n        if (newPriority > MAX_PRIORITY || newPriority < MIN_PRIORITY) {\r\n            throw new IllegalArgumentException();\r\n        }\r\n        if((g = getThreadGroup()) != null) {\r\n            if (newPriority > g.getMaxPriority()) {\r\n                newPriority = g.getMaxPriority();\r\n            }\r\n            setPriority0(priority = newPriority);\r\n        }\r\n    }\r\n```\r\n\r\n不一定优先级高的线程就先执行。\r\n\r\n### 守护线程\r\n\r\n当进程中不存在非守护线程了，则守护线程自动销毁。垃圾回收线程就是典型的守护线程，当进程中没有非守护线程了，则垃圾回收线程也就没有存在的必要了，自动销毁。\r\n\r\n```java\r\n /**\r\n     * Marks this thread as either a {@linkplain #isDaemon daemon} thread\r\n     * or a user thread. The Java Virtual Machine exits when the only\r\n     * threads running are all daemon threads.\r\n     *\r\n     * <p> This method must be invoked before the thread is started.\r\n     *\r\n     * @param  on\r\n     *         if {@code true}, marks this thread as a daemon thread\r\n     * @throws  IllegalThreadStateException\r\n     *          if this thread is {@linkplain #isAlive alive}\r\n     * @throws  SecurityException\r\n     *          if {@link #checkAccess} determines that the current\r\n     *          thread cannot modify this thread\r\n     */\r\n    public final void setDaemon(boolean on) {\r\n        checkAccess();\r\n        if (isAlive()) {\r\n            throw new IllegalThreadStateException();\r\n        }\r\n        daemon = on;\r\n    }\r\n```\r\n\r\n\r\n\r\n\r\n\r\n## 第二章 —— 对象及变量的并发访问\r\n\r\n技术点：\r\n\r\n+ synchronized 对象监视器为 Object 时的使用\r\n+ synchronized 对象监视器为 Class 时的使用\r\n+ 非线程安全是如何出现的\r\n+ 关键字 volatile 的主要作用\r\n+ 关键字 volatile 与 synchronized 的区别及使用情况\r\n\r\n### synchronized 同步方法\r\n\r\n#### 方法内的变量为线程安全\r\n\r\n“非线程安全”问题存在于“实例变量”中，如果是方法内部的私有变量，则不存在“非线程安全”问题，所得结果也就是“线程安全”了。\r\n\r\n#### 实例变量非线程安全\r\n\r\n如果多线程共同访问一个对象中的实例变量，则有可能出现“非线程安全”问题。\r\n\r\n在两个线程访问同一个对象中的同步方法时一定是线程安全的。\r\n\r\n#### 脏读\r\n\r\n发生脏读的情况是在读取实例变量时，此值已经被其他线程更改过了。\r\n\r\n如下例子就可以说明，如果不加 synchronized 关键字在 setValue 和 getValue 方法上，就会出现数据脏读。\r\n\r\n```java\r\nclass VarName\r\n{\r\n    private String userName = \"A\";\r\n    private String password = \"AA\";\r\n    synchronized public void setValue(String userName, String password) {\r\n        try {\r\n            this.userName = userName;\r\n            Thread.sleep(500);\r\n            this.password = password;\r\n            System.out.println(\"setValue method Thread name is :  \" + Thread.currentThread().getName() + \" userName = \" + userName + \" password = \" + password);\r\n        } catch (InterruptedException e) {\r\n            e.printStackTrace();\r\n        }\r\n    }\r\n    //synchronized\r\n    public void getValue() {\r\n        System.out.println(\"getValue method Thread name is :  \" + Thread.currentThread().getName() + \" userName = \" + userName + \" password = \" + password);\r\n    }\r\n}\r\n\r\nclass Thread1 extends Thread\r\n{\r\n    private VarName varName;\r\n    public Thread1(VarName varName) {\r\n        this.varName = varName;\r\n    }\r\n    @Override\r\n    public void run() {\r\n        varName.setValue(\"B\", \"BB\");\r\n    }\r\n}\r\n\r\npublic class Test\r\n{\r\n    public static void main(String[] args) throws InterruptedException {\r\n        VarName v = new VarName();\r\n        Thread1 thread1 = new Thread1(v);\r\n        thread1.start();\r\n        Thread.sleep(200);//打印结果受睡眠时间的影响\r\n        v.getValue();\r\n    }\r\n}\r\n```\r\n\r\n#### synchronized 锁重入\r\n\r\n关键字 synchronized 拥有锁重入的功能，也就是在使用 synchronized 时，当一个线程得到一个对象锁后，再次请求此对象锁是可以再次得到该对象的锁的。这也证明了在一个 synchronized 方法/块的内部调用本类的其他 synchronized 方法/块时，是永远可以得到锁的。\r\n\r\n```java\r\nclass Service\r\n{\r\n    synchronized public void service1() {\r\n        System.out.println(\"service 1\");\r\n        service2();\r\n    }\r\n    synchronized public void service2() {\r\n        System.out.println(\"service 2\");\r\n        service3();\r\n    }\r\n    synchronized public void service3() {\r\n        System.out.println(\"service 3\");\r\n    }\r\n}\r\n\r\nclass Thread2 extends Thread\r\n{\r\n    @Override\r\n    public void run() {\r\n        Service s = new Service();\r\n        s.service1();\r\n    }\r\n}\r\n\r\npublic class Test2\r\n{\r\n    public static void main(String[] args) {\r\n        Thread2 t2 = new Thread2();\r\n        t2.start();\r\n    }\r\n}\r\n```\r\n\r\n运行结果：\r\n\r\n```\r\nservice 1\r\nservice 2\r\nservice 3\r\n```\r\n\r\n#### 同步不具有继承性\r\n\r\n同步不可以继承。\r\n\r\n### synchronized 同步语句块\r\n\r\n#### synchronized 代码块间的同步性\r\n\r\n当一个线程访问 object 的一个 synchronized(this) 同步代码块时，其他线程对同一个 object 中所有其他 synchronized(this) 同步代码块的访问将被阻塞，这说明 synchronized 使用的 “对象监视器” 是一个。\r\n\r\n#### 将任意对象作为对象监视器\r\n\r\n多个线程调用同一个对象中的不同名称的 synchronized 同步方法或者 synchronized(this) 同步代码块时，调用的效果就是按顺序执行，也就是同步的，阻塞的。\r\n\r\n#### 静态同步 synchronized 方法与  synchronized(class) 代码块\r\n\r\n关键字 synchronized 还可以应用在 static 静态方法上，如果这样写就是对当前的 *.java 文件对应的 Class 类进行加锁。而 synchronized 关键字加到非 static 静态方法上就是给对象加锁。\r\n\r\n#### 多线程的死锁\r\n\r\n\r\n\r\n### volatile 关键字\r\n\r\n作用：使变量在多个线程间可见。\r\n\r\n通过使用 volatile 关键字，强制的从公共内存中读取变量的值。使用 volatile 关键字增加了实例变量在多个线程之间的可见性，但 volatile 关键字最致命的缺点就是不支持原子性。\r\n\r\n关键字 synchronized 和 volatile 比较：\r\n\r\n+ 关键字 volatile 是线程同步的轻量实现，所以 volatile 性能肯定要比 synchronized 要好，并且 volatile 只能修饰于变量，而 synchronized 可以修饰方法，以及代码块。\r\n\r\n+ 多线程访问 volatile 不会发生阻塞，而 synchronized 会出现阻塞。\r\n\r\n+ volatile 能保证数据的可见性，但不能保证原子性；而 synchronized 可以保证原子性，也可以间接保证可见性，因为它会将私有内存和公有内存中的数据做同步。\r\n\r\n+ 关键字 volatile 解决的是变量在多个线程之间的可见性；而 synchronized 关键字解决的是多个线程之间访问资源的同步性。\r\n\r\n  ​\r\n\r\n\r\n\r\n## 第三章 —— 线程间通信\r\n\r\n技术点：\r\n\r\n+ 使用 wait/notify 实现线程间的通信\r\n+ 生产者/消费者模式的实现\r\n+ 方法 join 的使用\r\n+ ThreadLocal 类的使用\r\n\r\n\r\n### 等待/通知机制\r\n\r\nwait 使线程停止运行，notify 使停止的线程继续运行。\r\n\r\n关键字 synchronized 可以将任何一个 Object 对象作为同步对象看待，而 Java 为每个 Object 都实现了 wait() 和 notify() 方法，他们必须用在被 synchronized 同步的 Object 的临界区内。通过调用 wait 方法可以使处于临界区内的线程进入等待状态，同时释放被同步对象的锁。而 notify 操作可以唤醒一个因调用了 wait 方法而处于阻塞状态的线程，使其进入就绪状态。被重新唤醒的线程会试图重新获得临界区的控制权，继续执行临界区内 wait 之后的代码。\r\n\r\nwait 方法可以使调用该方法的线程释放共享资源的锁，从运行状态退出，进入等待状态，直到再次被唤醒。\r\n\r\nnotify() 方法可以随机唤醒等待对列中等待同一共享资源的一个线程，并使该线程退出等待状态，进入可运行状态。\r\n\r\nnotifyAll() 方法可以随机唤醒等待对列中等待同一共享资源的所有线程，并使这些线程退出等待状态，进入可运行状态。\r\n\r\n#### 线程状态示意图：\r\n\r\n![](http://ohfk1r827.bkt.clouddn.com/thread-state.jpg)\r\n\r\n+ 新创建一个线程对象后，在调用它的 start() 方法，系统会为此线程分配 CPU 资源，使其处于 Runnable（可运行）状态，如果线程抢占到 CPU 资源，此线程就会处于 Running （运行）状态\r\n\r\n+ Runnable 和 Running 状态之间可以相互切换，因为线程有可能运行一段时间后，有其他优先级高的线程抢占了 CPU 资源，此时线程就从 Running 状态变成了 Runnable 状态。\r\n\r\n  线程进入 Runnable 状态有如下几种情况：\r\n\r\n  + 调用 sleep() 方法后经过的时间超过了指定的休眠时间\r\n  + 线程调用的阻塞 IO 已经返回，阻塞方法执行完毕\r\n  + 线程成功的获得了试图同步的监视器\r\n  + 线程正在等待某个通知，其他线程发出了通知\r\n  + 处于挂状态的线程调用了 resume 恢复方法\r\n\r\n+ Blocked 是阻塞的意思，例如线程遇到一个 IO 操作，此时 CPU 处于空闲状态，可能会转而把 CPU 时间片分配给其他线程，这时也可以称为 “暂停”状态。Blocked 状态结束之后，进入 Runnable 状态，等待系统重新分配资源。\r\n\r\n  出现阻塞状态的有如下几种情况：\r\n\r\n  + 线程调用 sleep 方法，主动放弃占用的处理器资源\r\n  + 线程调用了阻塞式 IO 方法，在该方法返回之前，该线程被阻塞\r\n  + 线程试图获得一个同步监视器，但该同步监视器正在被其他线程所持有\r\n  + 线程等待某个通知\r\n  + 程序调用了 suspend 方法将该线程挂起\r\n\r\n+ run 方法运行结束后进入销毁阶段，整个线程执行完毕。\r\n\r\n#### 生产者/消费者模式实现\r\n\r\n一个生产者，一个消费者\r\n\r\n存储值对象：\r\n\r\n```java\r\npackage com.zhisheng.thread.thread5;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/3.\r\n * 存储值对象\r\n */\r\npublic class ValueObject\r\n{\r\n    public static String value = \"\";\r\n}\r\n```\r\n\r\n生产者：\r\n\r\n```java\r\npackage com.zhisheng.thread.thread5;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/3.\r\n * 生产者\r\n */\r\npublic class Product\r\n{\r\n    private String lock;\r\n\r\n    public Product(String lock) {\r\n        this.lock = lock;\r\n    }\r\n\r\n    public void setValue() {\r\n        synchronized (lock) {\r\n            if (!ValueObject.value.equals(\"\")) {\r\n                try {\r\n                    lock.wait();\r\n                } catch (InterruptedException e) {\r\n                    e.printStackTrace();\r\n                }\r\n            }\r\n            String value = System.currentTimeMillis() + \"_\" + System.nanoTime();\r\n            System.out.println(\"生产者 set 的值是：\" + value);\r\n            ValueObject.value = value;\r\n            lock.notify();\r\n        }\r\n    }\r\n}\r\n```\r\n\r\n消费者：\r\n\r\n```java\r\npackage com.zhisheng.thread.thread5;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/3.\r\n * 消费者\r\n */\r\npublic class Resume\r\n{\r\n    private String lock;\r\n\r\n    public Resume(String lock) {\r\n        this.lock = lock;\r\n    }\r\n\r\n    public void getValue() {\r\n        synchronized (lock) {\r\n            if (ValueObject.value.equals(\"\")) {\r\n                try {\r\n                    lock.wait();\r\n                } catch (InterruptedException e) {\r\n                    e.printStackTrace();\r\n                }\r\n            }\r\n            System.out.println(\"消费者 get 的值：\" + ValueObject.value);\r\n            ValueObject.value = \"\";\r\n            lock.notify();\r\n        }\r\n    }\r\n}\r\n```\r\n\r\n生产者线程：\r\n\r\n```java\r\npackage com.zhisheng.thread.thread5;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/3.\r\n * 生产者线程\r\n */\r\npublic class ProductThread extends Thread\r\n{\r\n    private Product p;\r\n\r\n    public ProductThread(Product p) {\r\n        this.p = p;\r\n    }\r\n\r\n    @Override\r\n    public void run() {\r\n        while (true) {\r\n            p.setValue();\r\n        }\r\n    }\r\n}\r\n```\r\n\r\n消费者线程：\r\n\r\n```java\r\npackage com.zhisheng.thread.thread5;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/3.\r\n * 消费者线程\r\n */\r\npublic class ResumeThread extends Thread\r\n{\r\n    private Resume r;\r\n\r\n    public ResumeThread(Resume r) {\r\n        this.r = r;\r\n    }\r\n\r\n    @Override\r\n    public void run() {\r\n        while (true) {\r\n            r.getValue();\r\n        }\r\n    }\r\n}\r\n```\r\n\r\n主函数：\r\n\r\n```java\r\npackage com.zhisheng.thread.thread5;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/3.\r\n * 一个生产者一个消费者测试\r\n */\r\npublic class Test\r\n{\r\n    public static void main(String[] args) {\r\n        String str = new String(\"\");\r\n        Product p = new Product(str);\r\n        Resume r = new Resume(str);;\r\n        ProductThread pt = new ProductThread(p);\r\n        ResumeThread rt = new ResumeThread(r);\r\n        pt.start();\r\n        rt.start();\r\n    }\r\n}\r\n```\r\n\r\n题目：创建20个线程，其中10个线程是将数据备份到数据库A，另外10个线程将数据备份到数据库B中去，并且备份数据库A和备份数据库B是交叉进行的。\r\n\r\n工具类：\r\n\r\n```java\r\npackage com.zhisheng.thread.thread6;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/3.\r\n * 创建20个线程，其中10个线程是将数据备份到数据库A，另外10个线程将数据备份到数据库B中去，并且\r\n * 备份数据库A和备份数据库B是交叉进行的\r\n */\r\npublic class DBTools\r\n{\r\n    volatile private boolean prevIsA = false;\r\n\r\n    //确保A备份先进行\r\n    synchronized public void backA() {\r\n        while (prevIsA == true) {\r\n            try {\r\n                wait();\r\n            } catch (InterruptedException e) {\r\n                e.printStackTrace();\r\n            }\r\n        }\r\n        for (int i = 0; i < 5; i++) {\r\n            System.out.println(\"AAAAA\");\r\n        }\r\n        prevIsA = true;\r\n        notifyAll();\r\n    }\r\n\r\n    synchronized public void backB() {\r\n        while (prevIsA == false) {\r\n            try {\r\n                wait();\r\n            } catch (InterruptedException e) {\r\n                e.printStackTrace();\r\n            }\r\n        }\r\n        for (int i = 0; i < 5; i++) {\r\n            System.out.println(\"BBBBB\");\r\n        }\r\n        prevIsA = false;\r\n        notifyAll();\r\n    }\r\n}\r\n```\r\n\r\n备份A先线程：\r\n\r\n```java\r\npackage com.zhisheng.thread.thread6;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/3.\r\n */\r\npublic class ThreadA extends Thread\r\n{\r\n    private DBTools dbTools;\r\n\r\n    public ThreadA(DBTools dbTools) {\r\n        this.dbTools = dbTools;\r\n    }\r\n\r\n    @Override\r\n    public void run() {\r\n        dbTools.backA();\r\n    }\r\n}\r\n```\r\n\r\n备份B线程：\r\n\r\n```java\r\npackage com.zhisheng.thread.thread6;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/3.\r\n */\r\npublic class ThreadB extends Thread\r\n{\r\n    private DBTools dbTools;\r\n\r\n    public ThreadB(DBTools dbTools) {\r\n        this.dbTools = dbTools;\r\n    }\r\n\r\n    @Override\r\n    public void run() {\r\n        dbTools.backB();\r\n    }\r\n}\r\n```\r\n\r\n测试：\r\n\r\n```java\r\npackage com.zhisheng.thread.thread6;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/3.\r\n */\r\npublic class Test\r\n{\r\n    public static void main(String[] args) {\r\n        DBTools dbTools = new DBTools();\r\n        for (int i = 0; i < 20; i++) {\r\n            ThreadB tb = new ThreadB(dbTools);\r\n            tb.start();\r\n            ThreadA ta = new ThreadA(dbTools);\r\n            ta.start();\r\n        }\r\n    }\r\n}\r\n```\r\n\r\n\r\n\r\n### Join 方法的使用\r\n\r\n作用：等待线程对象销毁\r\n\r\njoin 方法具有使线程排队运行的作用，有些类似同步的运行效果。join 与 synchronized 的区别是：join 在内部使用 wait() 方法进行等待，而 synchronized 关键字使用的是 “对象监视器” 原理做为同步。\r\n\r\n在 join 过程中，如果当前线程对象被中断，则当前线程出现异常。\r\n\r\n方法 join(long) 中的参数是设定等待的时间。\r\n\r\n```java\r\n/**\r\n     * 等待该线程终止的时间最长为 millis 毫秒。超时为 0 意味着要一直等下去。\r\n     * Waits at most {@code millis} milliseconds for this thread to\r\n     * die. A timeout of {@code 0} means to wait forever.\r\n     *\r\n     * <p> This implementation uses a loop of {@code this.wait} calls\r\n     * conditioned on {@code this.isAlive}. As a thread terminates the\r\n     * {@code this.notifyAll} method is invoked. It is recommended that\r\n     * applications not use {@code wait}, {@code notify}, or\r\n     * {@code notifyAll} on {@code Thread} instances.\r\n     *\r\n     * @param  millis\r\n     *         the time to wait in milliseconds\r\n     *\r\n     * @throws  IllegalArgumentException\r\n     *          if the value of {@code millis} is negative\r\n     *\r\n     * @throws  InterruptedException\r\n     *          if any thread has interrupted the current thread. The\r\n     *          <i>interrupted status</i> of the current thread is\r\n     *          cleared when this exception is thrown.\r\n     */\r\n    public final synchronized void join(long millis)\r\n    throws InterruptedException {\r\n        long base = System.currentTimeMillis();\r\n        long now = 0;\r\n        if (millis < 0) {\r\n            throw new IllegalArgumentException(\"timeout value is negative\");\r\n        if (millis == 0) {\r\n            while (isAlive()) {\r\n                wait(0);\r\n            }\r\n        } else {\r\n            while (isAlive()) {\r\n                long delay = millis - now;\r\n                if (delay <= 0) {\r\n                    break;\r\n                }\r\n                wait(delay);\r\n                now = System.currentTimeMillis() - base;\r\n            }\r\n        }\r\n    }\r\n```\r\n\r\n### 类  ThreadLocal  的使用\r\n\r\n该类提供了线程局部 (thread-local) 变量。这些变量不同于它们的普通对应物，因为访问某个变量（通过其 get 或\r\nset 方法）的每个线程都有自己的局部变量，它独立于变量的初始化副本。ThreadLocal 实例通常是类中的\r\nprivate static 字段，它们希望将状态与某一个线程（例如，用户 ID 或事务 ID）相关联。\r\n\r\n#### get() 方法\r\n\r\n```java\r\npublic T get() {\r\n        Thread t = Thread.currentThread();\r\n        ThreadLocalMap map = getMap(t);\r\n        if (map != null) {\r\n            ThreadLocalMap.Entry e = map.getEntry(this);\r\n            if (e != null) {\r\n                @SuppressWarnings(\"unchecked\")\r\n                T result = (T)e.value;\r\n                return result;\r\n            }\r\n        }\r\n        return setInitialValue();\r\n    }\r\n```\r\n\r\n返回此线程局部变量的当前线程副本中的值。如果变量没有用于当前线程的值，则先将其初始化为调用 initialValue() 方法返回的值。\r\n\r\n### InheritableThreadLocal 类的使用\r\n\r\n该类扩展了 ThreadLocal，为子线程提供从父线程那里继承的值：在创建子线程时，子线程会接收所有可继承的线程局部变量的初始值，以获得父线程所具有的值。通常，子线程的值与父线程的值是一致的；但是，通过重写这个类中的 childValue 方法，子线程的值可以作为父线程值的一个任意函数。\r\n\r\n当必须将变量（如用户 ID 和 事务 ID）中维护的每线程属性（per-thread-attribute）自动传送给创建的所有子线程时，应尽可能地采用可继承的线程局部变量，而不是采用普通的线程局部变量。\r\n\r\n\r\n\r\n## 第四章 ——  Lock 的使用\r\n\r\n### 使用 ReentrantLock 类\r\n\r\n一个可重入的互斥锁 Lock，它具有与使用 `synchronized` 方法和语句所访问的隐式监视器锁相同的一些基本行为和语义，但功能更强大。\r\n\r\n`ReentrantLock` 将由最近成功获得锁，并且还没有释放该锁的线程所*拥有*。当锁没有被另一个线程所拥有时，调用 `lock` 的线程将成功获取该锁并返回。如果当前线程已经拥有该锁，此方法将立即返回。可以使用 `isHeldByCurrentThread()`和 `getHoldCount()`方法来检查此情况是否发生。\r\n\r\n此类的构造方法接受一个可选的*公平* 参数。当设置为 `true` 时，在多个线程的争用下，这些锁倾向于将访问权授予等待时间最长的线程。否则此锁将无法保证任何特定访问顺序。与采用默认设置（使用不公平锁）相比，使用公平锁的程序在许多线程访问时表现为很低的总体吞吐量（即速度很慢，常常极其慢），但是在获得锁和保证锁分配的均衡性时差异较小。不过要注意的是，公平锁不能保证线程调度的公平性。因此，使用公平锁的众多线程中的一员可能获得多倍的成功机会，这种情况发生在其他活动线程没有被处理并且目前并未持有锁时。还要注意的是，未定时的 `tryLock`方法并没有使用公平设置。因为即使其他线程正在等待，只要该锁是可用的，此方法就可以获得成功。\r\n\r\n建议*总是* 立即实践，使用 `lock` 块来调用 `try`，在之前/之后的构造中，最典型的代码如下：\r\n\r\n```java\r\nclass X {\r\n   private final ReentrantLock lock = new ReentrantLock();\r\n   // ...\r\n\r\n   public void m() {\r\n     lock.lock();  // block until condition holds\r\n     try {\r\n       // ... method body\r\n     } finally {\r\n       lock.unlock()\r\n     }\r\n   }\r\n }\r\n```\r\n\r\n### Condition\r\n\r\nCondition 将 Object 监视器方法（wait、notify 和 notifyAll）分解成截然不同的对象，以便通过将这些对象与任意 Lock 实现组合使用，为每个对象提供多个等待 set（wait-set）。其中，Lock 替代了 synchronized 方法和语句的使用，Condition 替代了 Object 监视器方法的使用。\r\n\r\n假定有一个绑定的缓冲区，它支持 put 和 take 方法。如果试图在空的缓冲区上执行 take 操作，则在某一个项变得可用之前，线程将一直阻塞；如果试图在满的缓冲区上执行 put 操作，则在有空间变得可用之前，线程将一直阻塞。我们喜欢在单独的等待 set 中保存 put 线程和 take 线程，这样就可以在缓冲区中的项或空间变得可用时利用最佳规划，一次只通知一个线程。可以使用两个 Condition 实例来做到这一点。\r\n\r\n```java\r\nclass BoundedBuffer {\r\n   final Lock lock = new ReentrantLock();\r\n   final Condition notFull  = lock.newCondition();\r\n   final Condition notEmpty = lock.newCondition();\r\n\r\n   final Object[] items = new Object[100];\r\n   int putptr, takeptr, count;\r\n\r\n   public void put(Object x) throws InterruptedException {\r\n     lock.lock();\r\n     try {\r\n       while (count == items.length)\r\n         notFull.await();\r\n       items[putptr] = x;\r\n       if (++putptr == items.length) putptr = 0;\r\n       ++count;\r\n       notEmpty.signal();\r\n     } finally {\r\n       lock.unlock();\r\n     }\r\n   }\r\n\r\n   public Object take() throws InterruptedException {\r\n     lock.lock();\r\n     try {\r\n       while (count == 0)\r\n         notEmpty.await();\r\n       Object x = items[takeptr];\r\n       if (++takeptr == items.length) takeptr = 0;\r\n       --count;\r\n       notFull.signal();\r\n       return x;\r\n     } finally {\r\n       lock.unlock();\r\n     }\r\n   }\r\n }\r\n```\r\n\r\n### 正确使用 Condition 实现等待/通知\r\n\r\nMyService.java\r\n\r\n```java\r\npackage com.zhisheng.thread.Thread9;\r\n\r\nimport java.util.concurrent.locks.Condition;\r\nimport java.util.concurrent.locks.Lock;\r\nimport java.util.concurrent.locks.ReentrantLock;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/4.\r\n */\r\npublic class MyService\r\n{\r\n    private Lock lock = new ReentrantLock();\r\n    private Condition condition = lock.newCondition();\r\n\r\n    public void await() {\r\n        lock.lock();\r\n        try {\r\n            System.out.println(\"await A\");\r\n            condition.await();//使当前执行的线程处于等待状态 waiting\r\n            System.out.println(\"await B\");\r\n        } catch (InterruptedException e) {\r\n            e.printStackTrace();\r\n        }finally {\r\n            lock.unlock();\r\n            System.out.println(\"释放锁\");\r\n        }\r\n    }\r\n\r\n    public void signal() {\r\n        lock.lock();\r\n        System.out.println(\"signal A\");\r\n        condition.signal();\r\n        System.out.println(\"signal B\");\r\n        lock.unlock();\r\n    }\r\n}\r\n```\r\n\r\nThreadA.java\r\n\r\n```java\r\npackage com.zhisheng.thread.Thread9;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/4.\r\n */\r\npublic class ThreadA extends Thread\r\n{\r\n    private MyService service;\r\n\r\n    public ThreadA(MyService service) {\r\n        this.service = service;\r\n    }\r\n\r\n    @Override\r\n    public void run() {\r\n        service.await();\r\n    }\r\n}\r\n```\r\n\r\nTest.java\r\n\r\n```java\r\npackage com.zhisheng.thread.Thread9;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/4.\r\n */\r\npublic class Test\r\n{\r\n    public static void main(String[] args) throws InterruptedException {\r\n        MyService service = new MyService();\r\n        ThreadA ta = new ThreadA(service);\r\n        ta.start();\r\n        Thread.sleep(5000);\r\n        service.signal();\r\n    }\r\n}\r\n```\r\n\r\n运行结果：\r\n\r\n```java\r\nawait A\r\nsignal A\r\nsignal B\r\nawait B\r\n释放锁\r\n```\r\n\r\nObject 类中的 wait() 方法相当于 Condition 类中 await() 方法\r\n\r\nObject 类中的 wait(long time) 方法相当于 Condition 类中 await(long time, TimeUnit unit) 方法\r\n\r\nObject 类中的 notify() 方法相当于 Condition 类中 signal() 方法\r\n\r\nObject 类中的 notifyAll() 方法相当于 Condition 类中 signalAll() 方法\r\n\r\n\r\n\r\n题目：实现生产者与消费者  一对一交替打印\r\n\r\nMyService.java\r\n\r\n```java\r\npackage com.zhisheng.thread.thread10;\r\n\r\nimport java.util.concurrent.locks.Condition;\r\nimport java.util.concurrent.locks.Lock;\r\nimport java.util.concurrent.locks.ReentrantLock;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/4.\r\n * 实现生产者与消费者  一对一·交替打印\r\n */\r\npublic class MyService\r\n{\r\n    private Lock lock = new ReentrantLock();\r\n    private Condition condition = lock.newCondition();\r\n    private  boolean flag = false;\r\n\r\n    public void setValue() {\r\n        lock.lock();\r\n        while (flag == true) {\r\n            try {\r\n                condition.await();\r\n            } catch (InterruptedException e) {\r\n                e.printStackTrace();\r\n            }\r\n        }\r\n        System.out.println(\"SetValue  AAAAAA\");\r\n        flag = true;\r\n        condition.signal();\r\n        lock.unlock();\r\n    }\r\n\r\n    public void getValue() {\r\n        lock.lock();\r\n        while (flag == false) {\r\n            try {\r\n                condition.await();\r\n            } catch (InterruptedException e) {\r\n                e.printStackTrace();\r\n            }\r\n        }\r\n        System.out.println(\"GetValue BBBB\");\r\n        flag = false;\r\n        condition.signal();\r\n        lock.unlock();\r\n    }\r\n}\r\n```\r\n\r\nThreadA.java\r\n\r\n```java\r\npackage com.zhisheng.thread.thread10;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/4.\r\n */\r\npublic class ThreadA extends Thread\r\n{\r\n    private MyService service;\r\n\r\n    public ThreadA(MyService service) {\r\n        this.service = service;\r\n    }\r\n\r\n    @Override\r\n    public void run() {\r\n        for (int i = 0; i < Integer.MAX_VALUE; i++) {\r\n            service.setValue();\r\n        }\r\n    }\r\n}\r\n```\r\n\r\nThreadB.java\r\n\r\n```java\r\npackage com.zhisheng.thread.thread10;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/4.\r\n */\r\npublic class ThreadB extends Thread\r\n{\r\n    private MyService service;\r\n\r\n    public ThreadB(MyService service) {\r\n        this.service = service;\r\n    }\r\n\r\n    @Override\r\n    public void run() {\r\n        for (int i = 0; i < Integer.MAX_VALUE; i++) {\r\n            service.getValue();\r\n        }\r\n    }\r\n}\r\n```\r\n\r\nTest.java\r\n\r\n```java\r\npackage com.zhisheng.thread.thread10;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/4.\r\n */\r\npublic class Test\r\n{\r\n    public static void main(String[] args) {\r\n        MyService service = new MyService();\r\n        ThreadA ta = new ThreadA(service);\r\n        ThreadB tb = new ThreadB(service);\r\n        ta.start();\r\n        tb.start();\r\n    }\r\n}\r\n```\r\n\r\n\r\n\r\ngetHoldCount() 查询当前线程保持此锁定的个数，也就是调用 lock() 的方法\r\n\r\ngetQueueLength() 返回正等待获取此锁定的线程估计数\r\n\r\ngetWaitQueueLength() 返回等待与此锁定相关的给定条件 Condition 的线程估计数\r\n\r\nhasQueuedThread() 查询指定的线程是否正在等待获取此锁定\r\n\r\nhasQueuedThreads() 查询是否有线程正在等待获取此锁定\r\n\r\nhasWaiters() 查询是否有线程正在等待与此锁定有关的 condition 条件\r\n\r\nisFair() 判断是否是公平锁（默认下 ReentrantLock类使用的是非公平锁）\r\n\r\nisHeldByCurrentThread() 查询当前线程是否保持此锁定\r\n\r\nisLocked() 查询此锁定是否由任意线程保持\r\n\r\nlockInterruptibly() 如果当前线程未被中断，则获取锁定，如果已经被中断则出现异常\r\n\r\ntryLock() 仅在调用时锁定未被另一个线程保持的情况下，才获取该锁定\r\n\r\ntryLock(long time, TimeUtil util) 如果锁定在给定的等待时间内没有被另一个线程保持，且当前线程未被中断，则获取该锁定。\r\n\r\n### 使用 ReentrantReadWriteLock 类\r\n\r\n读写互斥：\r\n\r\nMyService.java\r\n\r\n```java\r\npackage com.zhisheng.thread.Thread11;\r\n\r\nimport java.util.concurrent.locks.ReentrantReadWriteLock;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/4.\r\n */\r\npublic class MyService\r\n{\r\n    private ReentrantReadWriteLock lock = new ReentrantReadWriteLock();\r\n\r\n    public void read() {\r\n        lock.readLock().lock();\r\n        System.out.println(Thread.currentThread().getName() + \" Read AAA  \" + System.currentTimeMillis());\r\n        try {\r\n            Thread.sleep(10000);\r\n        } catch (InterruptedException e) {\r\n            e.printStackTrace();\r\n        }\r\n        lock.readLock().unlock();\r\n    }\r\n\r\n    public void write() {\r\n        lock.writeLock().lock();\r\n        System.out.println(Thread.currentThread().getName() + \" write BBB \" + System.currentTimeMillis());\r\n        try {\r\n            Thread.sleep(10000);\r\n        } catch (InterruptedException e) {\r\n            e.printStackTrace();\r\n        }\r\n        lock.writeLock().unlock();\r\n    }\r\n}\r\n```\r\n\r\nThreadA.java\r\n\r\n```java\r\npackage com.zhisheng.thread.Thread11;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/4.\r\n */\r\npublic class ThreadA extends Thread\r\n{\r\n    private MyService service;\r\n\r\n    public ThreadA(MyService service) {\r\n        this.service = service;\r\n    }\r\n\r\n    @Override\r\n    public void run() {\r\n        service.read();\r\n    }\r\n}\r\n```\r\n\r\nThreadB.java\r\n\r\n```java\r\npackage com.zhisheng.thread.Thread11;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/4.\r\n */\r\npublic class ThreadB extends Thread\r\n{\r\n    private MyService service;\r\n\r\n    public ThreadB(MyService service) {\r\n        this.service = service;\r\n    }\r\n\r\n    @Override\r\n    public void run() {\r\n        service.write();\r\n    }\r\n}\r\n```\r\n\r\nTest.java\r\n\r\n```java\r\npackage com.zhisheng.thread.Thread11;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/4.\r\n */\r\npublic class Test\r\n{\r\n    public static void main(String[] args) throws InterruptedException {\r\n        MyService service = new MyService();\r\n        ThreadA ta = new ThreadA(service);\r\n        ta.setName(\"A\");\r\n        ta.start();\r\n        Thread.sleep(1000);\r\n        ThreadB tb = new ThreadB(service);\r\n        tb.setName(\"B\");\r\n        tb.start();\r\n    }\r\n}\r\n```\r\n\r\n运行结果：\r\n\r\n```\r\nA Read AAA  1496556770402\r\nB write BBB 1496556780402\r\n```\r\n\r\n\r\n\r\n\r\n\r\n## 第六章 —— 单例模式与多线程\r\n\r\n推荐文章 [《深入浅出单实例Singleton设计模式》](http://blog.csdn.net/tzs_1041218129/article/details/51246419)\r\n\r\n### 立即加载模式 / “饿汉模式”\r\n\r\n立即加载：使用类的时候已经将对象创建完毕，new 实例化\r\n\r\n```java\r\npublic class MyObject\r\n{\r\n    private static MyObject object = new MyObject();\r\n    private MyObject() {\r\n    }\r\n    public static MyObject getInstance() {\r\n        return object;\r\n    }\r\n}\r\n```\r\n\r\n### 延迟加载 / “ 懒汉模式 ”\r\n\r\n就是在调用 get 的时候实例才被创建。在 get() 方法中进行 new 实例化。\r\n\r\n```java\r\npublic class MyObject\r\n{\r\n    private  static  MyObject object;\r\n    private MyObject() {\r\n    }\r\n    public static MyObject getInstance() {\r\n        if (object != null) {\r\n        } else {\r\n            object = new MyObject();\r\n        }\r\n        return object;\r\n    }\r\n}\r\n```\r\n\r\n使用 DCL 双重检查锁，解决“懒汉模式”遇到的多线程问题\r\n\r\n```java\r\npublic class MyObject\r\n{\r\n    private  volatile static  MyObject object;\r\n    private MyObject() {\r\n    }\r\n    //synchronized\r\n    public static MyObject getInstance() {\r\n        if (object != null) {\r\n        } else {\r\n            synchronized (MyObject.class) {\r\n                if (object == null) {\r\n                    object = new MyObject();\r\n                }\r\n            }\r\n        }\r\n        return object;\r\n    }\r\n}\r\n```\r\n\r\n### 使用静态内部类实现单例模式\r\n\r\n```java\r\npublic class MyObject\r\n{\r\n    private static class MyObjectHandler\r\n    {\r\n        private static MyObject object = new MyObject();\r\n    }\r\n    private MyObject() {\r\n    }\r\n    public static MyObject getInstance() {\r\n        return MyObjectHandler.object;\r\n    }\r\n}\r\n```\r\n\r\n### 序列化与反序列化的单例模式实现\r\n\r\nMyObject.java\r\n\r\n```java\r\npackage com.zhisheng.thread.thread15;\r\n\r\nimport java.io.ObjectStreamException;\r\nimport java.io.Serializable;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/4.\r\n */\r\npublic class MyObject implements Serializable\r\n{\r\n    private static final long serialVersionUID =  888L;\r\n    private static class MyObjectHandler\r\n    {\r\n        private static final MyObject object = new MyObject();\r\n    }\r\n    private MyObject() {\r\n    }\r\n    public static  MyObject getInstance() {\r\n        return MyObjectHandler.object;\r\n    }\r\n    protected Object readResolve() throws ObjectStreamException {\r\n        System.out.println(\"调用了readResolve方法！\");\r\n        return MyObjectHandler.object;\r\n    }\r\n}\r\n```\r\n\r\nSaveAndRead.java\r\n\r\n```java\r\npackage com.zhisheng.thread.thread15;\r\n\r\nimport java.io.*;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/4.\r\n */\r\npublic class SaveAndRead\r\n{\r\n    public static void main(String[] args) {\r\n        try {\r\n            MyObject object = MyObject.getInstance();\r\n            FileOutputStream fos = new FileOutputStream(new File(\"fos.txt\"));\r\n            ObjectOutputStream oos = new ObjectOutputStream(fos);\r\n            oos.writeObject(object);\r\n            oos.close();\r\n            fos.close();\r\n            System.out.println(object.hashCode());\r\n        } catch (FileNotFoundException e) {\r\n            e.printStackTrace();\r\n        } catch (IOException e) {\r\n            e.printStackTrace();\r\n        }\r\n\r\n        try {\r\n            FileInputStream fis = new FileInputStream(new File(\"fos.txt\"));\r\n            ObjectInputStream ois = new ObjectInputStream(fis);\r\n            MyObject o = (MyObject) ois.readObject();\r\n            ois.close();\r\n            fis.close();\r\n            System.out.println(o.hashCode());\r\n        } catch (FileNotFoundException e) {\r\n            e.printStackTrace();\r\n        } catch (IOException e) {\r\n            e.printStackTrace();\r\n        } catch (ClassNotFoundException e) {\r\n            e.printStackTrace();\r\n        }\r\n    }\r\n}\r\n```\r\n\r\n这里主要要指出 MyObject.java 中 readResolve 方法\r\n\r\n```java\r\n protected Object readResolve() throws ObjectStreamException {\r\n        System.out.println(\"调用了readResolve方法！\");\r\n        return MyObjectHandler.object;\r\n    }\r\n```\r\n\r\n方法 readResolve 允许 class 在反序列化返回对象前替换、解析在流中读出来的对象。实现 readResolve 方法，一个 class 可以直接控制反序化返回的类型和对象引用。\r\n\r\n方法 readResolve 会在 ObjectInputStream 已经读取一个对象并在准备返回前调用。ObjectInputStream 会检查对象的 class 是否定义了 readResolve 方法。如果定义了，将由 readResolve 方法指定返回的对象。返回对象的类型一定要是兼容的，否则会抛出 ClassCastException 。\r\n\r\n### 使用 static 代码块实现单例模式\r\n\r\n```java\r\npackage com.zhisheng.thread.thread16;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/4.\r\n */\r\npublic class MyObject\r\n{\r\n    private static MyObject instance = null;\r\n    private MyObject() {\r\n    }\r\n    static {\r\n        instance = new MyObject();\r\n    }\r\n    public static MyObject getInstance() {\r\n        return instance;\r\n    }\r\n}\r\n```\r\n\r\nThreadA.java\r\n\r\n```java\r\npackage com.zhisheng.thread.thread16;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/4.\r\n */\r\npublic class ThreadA extends Thread\r\n{\r\n    @Override\r\n    public void run() {\r\n        for (int i = 0; i < 5; i++) {\r\n            System.out.println(MyObject.getInstance().hashCode());\r\n        }\r\n    }\r\n}\r\n```\r\n\r\nTest.java\r\n\r\n```java\r\npackage com.zhisheng.thread.thread16;\r\n\r\n/**\r\n * Created by 10412 on 2017/6/4.\r\n */\r\npublic class Test\r\n{\r\n    public static void main(String[] args) {\r\n        ThreadA ta1 = new ThreadA();\r\n        ThreadA ta2 = new ThreadA();\r\n        ThreadA ta3 = new ThreadA();\r\n        ta1.start();\r\n        ta2.start();\r\n        ta3.start();\r\n    }\r\n}\r\n```\r\n\r\n### 使用枚举数据类型实现单例模式\r\n\r\n在使用枚举类时，构造方法会被自动调用，也可以应用这个特性实现单例模式。\r\n\r\n```java\r\npublic class MyObject {\r\n    private enum MyEnumSingleton{\r\n        INSTANCE;\r\n        private Resource resource;\r\n        private MyEnumSingleton(){\r\n            resource = new Resource();\r\n        }\r\n        public Resource getResource(){\r\n            return resource;\r\n        }\r\n    }\r\n    public static Resource getResource(){\r\n        return MyEnumSingleton.INSTANCE.getResource();\r\n    }\r\n}\r\n```\r\n\r\n测试：\r\n\r\n```java\r\nimport test.MyObject;\r\n\r\npublic class Run {\r\n    class MyThread extends Thread {\r\n        @Override\r\n        public void run() {\r\n            for (int i = 0; i < 5; i++) {\r\n                System.out.println(MyObject.getResource().hashCode());\r\n            }\r\n        }\r\n    }\r\n    public static void main(String[] args) {\r\n        Run.MyThread t1 = new Run().new MyThread();\r\n        Run.MyThread t2 = new Run().new MyThread();\r\n        Run.MyThread t3 = new Run().new MyThread();\r\n        t1.start();\r\n        t2.start();\r\n        t3.start();\r\n\r\n    }\r\n}\r\n```\r\n\r\n这里再推荐一篇 stackoverflow 上的一个问题回答： [What is an efficient way to implement a singleton pattern in Java?](https://stackoverflow.com/questions/70689/what-is-an-efficient-way-to-implement-a-singleton-pattern-in-java)\r\n\r\n\r\n\r\n## 总结\r\n\r\n本篇文章是我读 《Java多线程编程核心技术》 的笔记及自己的一些总结，觉得不错，欢迎点赞和转发。\r\n\r\n\r\n', 1, 'post', 'publish', 'Java', 'Java', 18, 0, 1, 1, 1);
INSERT INTO `t_contents` VALUES (4, 'HashMap、Hashtable、HashSet 和 ConcurrentHashMap 的比较', 'HashMap-HashTable', 1497323623, 1497323623, 'HashMap 和 Hashtable 的比较是 Java 面试中的常见问题，用来考验程序员是否能够正确使用集合类以及是否可以随机应变使用多种思路解决问题。HashMap 的工作原理、ArrayList 与 Vector 的比较以及这个问题是有关 Java 集合框架的最经典的问题。Hashtable 是个过时的集合类，存在于 Java API 中很久了。在 Java 4 中被重写了，实现了 Map 接口，所以自此以后也成了 Java 集合框架中的一部分。Hashtable 和 HashMap 在 Java 面试中相当容易被问到，甚至成为了集合框架面试题中最常被考的问题，所以在参加任何 Java 面试之前，都不要忘了准备这一题。\r\n<!-- more -->\r\n这篇文章中，我们不仅将会看到 HashMap 和 Hashtable 的区别，还将看到它们之间的相似之处。\r\n\r\n### HashMap 和 Hashtable 的区别\r\n\r\nHashMap 和 Hashtable 都实现了 Map 接口，但决定用哪一个之前先要弄清楚它们之间的分别。主要的区别有：线程安全性，同步 (synchronization)，以及速度。\r\n\r\n1. HashMap 几乎可以等价于 Hashtable，除了 HashMap 是非 synchronized 的，并可以接受 null(HashMap 可以接受为 null 的键值 (key) 和值 (value)，而 Hashtable 则不行)。\r\n2. HashMap 是非 synchronized，而 Hashtable 是 synchronized，这意味着 Hashtable 是线程安全的，多个线程可以共享一个 Hashtable；而如果没有正确的同步的话，多个线程是不能共享 HashMap 的。Java 5 提供了 ConcurrentHashMap，它是 HashTable 的替代，比 HashTable 的扩展性更好。\r\n3. 另一个区别是 HashMap 的迭代器 (Iterator) 是 fail-fast 迭代器，而 Hashtable 的 enumerator 迭代器不是 fail-fast 的。所以当有其它线程改变了 HashMap 的结构（增加或者移除元素），将会抛出ConcurrentModificationException，但迭代器本身的 remove() 方法移除元素则不会抛出ConcurrentModificationException 异常。但这并不是一个一定发生的行为，要看 JVM。这条同样也是Enumeration 和 Iterato r的区别。\r\n4. 由于 Hashtable 是线程安全的也是 synchronized，所以在单线程环境下它比 HashMap 要慢。如果你不需要同步，只需要单一线程，那么使用 HashMap 性能要好过 Hashtable。\r\n5. HashMap 不能保证随着时间的推移 Map 中的元素次序是不变的。\r\n\r\n### 要注意的一些重要术语：\r\n\r\n1) sychronized 意味着在一次仅有一个线程能够更改 Hashtable。就是说任何线程要更新 Hashtable 时要首先获得同步锁，其它线程要等到同步锁被释放之后才能再次获得同步锁更新 Hashtable。\r\n\r\n2) Fail-safe 和 iterator 迭代器相关。如果某个集合对象创建了 Iterator 或者 ListIterator，然后其它的线程试图“结构上”更改集合对象，将会抛出 ConcurrentModificationException 异常。但其它线程可以通过 set() 方法更改集合对象是允许的，因为这并没有从“结构上”更改集合。但是假如已经从结构上进行了更改，再调用 set() 方法，将会抛出 IllegalArgumentException 异常。\r\n\r\n3) 结构上的更改指的是删除或者插入一个元素，这样会影响到 map 的结构。\r\n\r\n### 我们能否让 HashMap 同步？\r\n\r\nHashMap 可以通过下面的语句进行同步：\r\nMap m = Collections.synchronizeMap(hashMap);\r\n\r\n### 结论\r\n\r\nHashtable 和 HashMap 有几个主要的不同：线程安全以及速度。仅在你需要完全的线程安全的时候使用Hashtable，而如果你使用 Java 5 或以上的话，请使用 ConcurrentHashMap 吧。\r\n\r\n转载自：[HashMap和Hashtable的区别](http://www.importnew.com/7010.html)\r\n\r\n***\r\n\r\n关于 HashMap 线程不安全这一点，《Java并发编程的艺术》一书中是这样说的：\r\n\r\n> HashMap 在并发执行 put 操作时会引起死循环，导致 CPU 利用率接近 100%。因为多线程会导致 HashMap 的 Node 链表形成环形数据结构，一旦形成环形数据结构，Node 的 next 节点永远不为空，就会在获取 Node 时产生死循环。\r\n\r\n原因：\r\n\r\n+ [疫苗：JAVA HASHMAP的死循环 —— 酷壳](http://coolshell.cn/articles/9606.html)\r\n+ [HashMap在java并发中如何发生死循环](http://firezhfox.iteye.com/blog/2241043)\r\n+ [How does a HashMap work in JAVA](http://coding-geek.com/how-does-a-hashmap-work-in-java/)\r\n\r\n***\r\n\r\n下面的是自己有道云笔记中记录的：\r\n\r\n**HashMap ， HashTable 和 HashSet 区别**\r\n\r\n1.  关于 HashMap 的一些说法：\r\n\r\na)  HashMap 实际上是一个“链表散列”的数据结构，即数组和链表的结合体。HashMap 的底层结构是一个数组，数组中的每一项是一条链表。\r\n\r\nb)  HashMap 的实例有俩个参数影响其性能： “初始容量” 和 装填因子。\r\n\r\nc)  HashMap 实现不同步，线程不安全。  HashTable 线程安全\r\n\r\nd)  HashMap 中的 key-value 都是存储在 Entry 中的。\r\n\r\ne)  HashMap 可以存 null 键和 null 值，不保证元素的顺序恒久不变，它的底层使用的是数组和链表，通过hashCode() 方法和 equals 方法保证键的唯一性\r\n\r\nf)  解决冲突主要有三种方法：定址法，拉链法，再散列法。HashMap 是采用拉链法解决哈希冲突的。\r\n\r\n注： 链表法是将相同 hash 值的对象组成一个链表放在 hash 值对应的槽位；\r\n\r\n用开放定址法解决冲突的做法是：当冲突发生时，使用某种探查(亦称探测)技术在散列表中形成一个探查(测)序列。 沿此序列逐个单元地查找，直到找到给定 的关键字，或者碰到一个开放的地址(即该地址单元为空)为止（若要插入，在探查到开放的地址，则可将待插入的新结点存人该地址单元）。\r\n\r\n拉链法解决冲突的做法是： 将所有关键字为同义词的结点链接在同一个单链表中 。若选定的散列表长度为m，则可将散列表定义为一个由m个头指针组成的指针数 组T[0..m-1]。凡是散列地址为i的结点，均插入到以T[i]为头指针的单链表中。T中各分量的初值均应为空指针。在拉链法中，装填因子α可以大于1，但一般均取α≤1。拉链法适合未规定元素的大小。\r\n\r\n   \r\n\r\n2.  Hashtable 和 HashMap 的区别：\r\n\r\na)   继承不同。\r\n\r\n public class Hashtable extends Dictionary implements Map\r\n\r\npublic class HashMap extends  AbstractMap implements Map\r\n\r\nb)  Hashtable 中的方法是同步的，而 HashMap 中的方法在缺省情况下是非同步的。在多线程并发的环境下，可以直接使用 Hashtable，但是要使用 HashMap 的话就要自己增加同步处理了。\r\n\r\nc)  Hashtable 中， key 和 value 都不允许出现 null 值。 在 HashMap 中， null 可以作为键，这样的键只有一个；可以有一个或多个键所对应的值为 null 。当 get() 方法返回 null 值时，即可以表示 HashMap 中没有该键，也可以表示该键所对应的值为 null 。因此，在 HashMap 中不能由 get() 方法来判断 HashMap 中是否存在某个键， 而应该用 containsKey() 方法来判断。\r\n\r\nd)  两个遍历方式的内部实现上不同。Hashtable、HashMap 都使用了Iterator。而由于历史原因，Hashtable还使用了 Enumeration 的方式 。\r\n\r\ne)  哈希值的使用不同，HashTable 直接使用对象的 hashCode。而 HashMap 重新计算 hash 值。\r\n\r\nf)  Hashtable 和 HashMap 它们两个内部实现方式的数组的初始大小和扩容的方式。HashTable 中 hash 数组默认大小是11，增加的方式是 old*2+1。HashMap 中 hash 数组的默认大小是 16，而且一定是2的指数。\r\n\r\n注：  HashSet 子类依靠 hashCode() 和 equal() 方法来区分重复元素。\r\n\r\nHashSet 内部使用 Map 保存数据，即将 HashSet 的数据作为 Map 的 key 值保存，这也是 HashSet 中元素不能重复的原因。而 Map 中保存 key 值的,会去判断当前 Map 中是否含有该 Key 对象，内部是先通过 key 的hashCode, 确定有相同的 hashCode 之后，再通过 equals 方法判断是否相同。\r\n\r\n***\r\n\r\n《HashMap 的工作原理》\r\n\r\nHashMap的工作原理是近年来常见的Java面试题。几乎每个Java程序员都知道HashMap，都知道哪里要用HashMap，知道 Hashtable和HashMap之间的区别，那么为何这道面试题如此特殊呢？是因为这道题考察的深度很深。这题经常出现在高级或中高级面试中。投资银行更喜欢问这个问题，甚至会要求你实现HashMap来考察你的编程能力。ConcurrentHashMap和其它同步集合的引入让这道题变得更加复杂。让我们开始探索的旅程吧！\r\n\r\n### 先来些简单的问题\r\n\r\n**“你用过HashMap吗？” “什么是HashMap？你为什么用到它？”**\r\n\r\n几乎每个人都会回答“是的”，然后回答HashMap的一些特性，譬如HashMap可以接受null键值和值，而Hashtable则不能；HashMap是非synchronized;HashMap很快；以及HashMap储存的是键值对等等。这显示出你已经用过HashMap，而且对它相当的熟悉。但是面试官来个急转直下，从此刻开始问出一些刁钻的问题，关于HashMap的更多基础的细节。面试官可能会问出下面的问题：\r\n\r\n**“你知道HashMap的工作原理吗？” “你知道HashMap的get()方法的工作原理吗？”**\r\n\r\n你也许会回答“我没有详查标准的Java API，你可以看看Java源代码或者Open JDK。”“我可以用Google找到答案。”\r\n\r\n但一些面试者可能可以给出答案，“HashMap是基于hashing的原理，我们使用put(key, value)存储对象到HashMap中，使用get(key)从HashMap中获取对象。当我们给put()方法传递键和值时，我们先对键调用hashCode()方法，返回的hashCode用于找到bucket位置来储存Entry对象。”这里关键点在于指出，HashMap是在bucket中储存键对象和值对象，作为Map.Entry。这一点有助于理解获取对象的逻辑。如果你没有意识到这一点，或者错误的认为仅仅只在bucket中存储值的话，你将不会回答如何从HashMap中获取对象的逻辑。这个答案相当的正确，也显示出面试者确实知道hashing以及HashMap的工作原理。但是这仅仅是故事的开始，当面试官加入一些Java程序员每天要碰到的实际场景的时候，错误的答案频现。下个问题可能是关于HashMap中的碰撞探测(collision detection)以及碰撞的解决方法：\r\n\r\n**“当两个对象的hashcode相同会发生什么？”** \r\n\r\n从这里开始，真正的困惑开始了，一些面试者会回答因为hashcode相同，所以两个对象是相等的，HashMap将会抛出异常，或者不会存储它们。然后面试官可能会提醒他们有equals()和hashCode()两个方法，并告诉他们两个对象就算hashcode相同，但是它们可能并不相等。一些面试者可能就此放弃，而另外一些还能继续挺进，他们回答“因为hashcode相同，所以它们的bucket位置相同，‘碰撞’会发生。因为HashMap使用链表存储对象，这个Entry(包含有键值对的Map.Entry对象)会存储在链表中。”这个答案非常的合理，虽然有很多种处理碰撞的方法，这种方法是最简单的，也正是HashMap的处理方法。但故事还没有完结，面试官会继续问：\r\n\r\n**“如果两个键的hashcode相同，你如何获取值对象？”**\r\n\r\n 面试者会回答：当我们调用get()方法，HashMap会使用键对象的hashcode找到bucket位置，然后获取值对象。面试官提醒他如果有两个值对象储存在同一个bucket，他给出答案:将会遍历链表直到找到值对象。面试官会问因为你并没有值对象去比较，你是如何确定确定找到值对象的？除非面试者直到HashMap在链表中存储的是键值对，否则他们不可能回答出这一题。\r\n\r\n其中一些记得这个重要知识点的面试者会说，找到bucket位置之后，会调用keys.equals()方法去找到链表中正确的节点，最终找到要找的值对象。完美的答案！\r\n\r\n许多情况下，面试者会在这个环节中出错，因为他们混淆了hashCode()和equals()方法。因为在此之前hashCode()屡屡出现，而equals()方法仅仅在获取值对象的时候才出现。一些优秀的开发者会指出使用不可变的、声明作final的对象，并且采用合适的equals()和hashCode()方法的话，将会减少碰撞的发生，提高效率。不可变性使得能够缓存不同键的hashcode，这将提高整个获取对象的速度，使用String，Interger这样的wrapper类作为键是非常好的选择。\r\n\r\n如果你认为到这里已经完结了，那么听到下面这个问题的时候，你会大吃一惊。\r\n\r\n**“如果HashMap的大小超过了负载因子(load factor)定义的容量，怎么办？”**\r\n\r\n除非你真正知道HashMap的工作原理，否则你将回答不出这道题。默认的负载因子大小为0.75，也就是说，当一个map填满了75%的bucket时候，和其它集合类(如ArrayList等)一样，将会创建原来HashMap大小的两倍的bucket数组，来重新调整map的大小，并将原来的对象放入新的bucket数组中。这个过程叫作rehashing，因为它调用hash方法找到新的bucket位置。\r\n\r\n如果你能够回答这道问题，下面的问题来了：\r\n\r\n**“你了解重新调整HashMap大小存在什么问题吗？”**\r\n\r\n你可能回答不上来，这时面试官会提醒你当多线程的情况下，可能产生条件竞争(race condition)。\r\n\r\n当重新调整HashMap大小的时候，确实存在条件竞争，因为如果两个线程都发现HashMap需要重新调整大小了，它们会同时试着调整大小。在调整大小的过程中，存储在链表中的元素的次序会反过来，因为移动到新的bucket位置的时候，HashMap并不会将元素放在链表的尾部，而是放在头部，这是为了避免尾部遍历(tail traversing)。如果条件竞争发生了，那么就死循环了。这个时候，你可以质问面试官，为什么这么奇怪，要在多线程的环境下使用HashMap呢？：）\r\n\r\n热心的读者贡献了更多的关于HashMap的问题：\r\n\r\n1. **为什么String, Interger这样的wrapper类适合作为键？** \r\n\r\n   String, Interger这样的wrapper类作为HashMap的键是再适合不过了，而且String最为常用。因为String是不可变的，也是final的，而且已经重写了equals()和hashCode()方法了。其他的wrapper类也有这个特点。不可变性是必要的，因为为了要计算hashCode()，就要防止键值改变，如果键值在放入时和获取时返回不同的hashcode的话，那么就不能从HashMap中找到你想要的对象。不可变性还有其他的优点如线程安全。如果你可以仅仅通过将某个field声明成final就能保证hashCode是不变的，那么请这么做吧。因为获取对象的时候要用到equals()和hashCode()方法，那么键对象正确的重写这两个方法是非常重要的。如果两个不相等的对象返回不同的hashcode的话，那么碰撞的几率就会小些，这样就能提高HashMap的性能。\r\n\r\n2. **我们可以使用自定义的对象作为键吗？** \r\n\r\n   这是前一个问题的延伸。当然你可能使用任何对象作为键，只要它遵守了equals()和hashCode()方法的定义规则，并且当对象插入到Map中之后将不会再改变了。如果这个自定义对象时不可变的，那么它已经满足了作为键的条件，因为当它创建之后就已经不能改变了。\r\n\r\n3. **我们可以使用CocurrentHashMap来代替Hashtable吗？**\r\n\r\n   这是另外一个很热门的面试题，因为ConcurrentHashMap越来越多人用了。我们知道Hashtable是synchronized的，但是ConcurrentHashMap同步性能更好，因为它仅仅根据同步级别对map的一部分进行上锁。ConcurrentHashMap当然可以代替HashTable，但是HashTable提供更强的线程安全性。看看 [这篇博客](http://javarevisited.blogspot.sg/2011/04/difference-between-concurrenthashmap.html) 查看Hashtable和ConcurrentHashMap的区别。\r\n\r\n我个人很喜欢这个问题，因为这个问题的深度和广度，也不直接的涉及到不同的概念。让我们再来看看这些问题设计哪些知识点：\r\n\r\n- hashing的概念\r\n- HashMap中解决碰撞的方法\r\n- equals()和hashCode()的应用，以及它们在HashMap中的重要性\r\n- 不可变对象的好处\r\n- HashMap多线程的条件竞争\r\n- 重新调整HashMap的大小\r\n\r\n### 总结\r\n\r\n#### HashMap的工作原理\r\n\r\nHashMap基于hashing原理，我们通过put()和get()方法储存和获取对象。当我们将键值对传递给put()方法时，它调用键对象的hashCode()方法来计算hashcode，让后找到bucket位置来储存值对象。当获取对象时，通过键对象的equals()方法找到正确的键值对，然后返回值对象。HashMap使用链表来解决碰撞问题，当发生碰撞了，对象将会储存在链表的下一个节点中。 HashMap在每个链表节点中储存键值对对象。\r\n\r\n当两个不同的键对象的hashcode相同时会发生什么？ 它们会储存在同一个bucket位置的链表中。键对象的equals()方法用来找到键值对。\r\n\r\n因为HashMap的好处非常多，我曾经在电子商务的应用中使用HashMap作为缓存。因为金融领域非常多的运用Java，也出于性能的考虑，我们会经常用到HashMap和ConcurrentHashMap。你可以查看更多的关于HashMap的文章:\r\n\r\n- [HashMap和Hashtable的区别](http://www.importnew.com/7010.html)\r\n- [HashMap和HashSet的区别](http://www.importnew.com/6931.html)\r\n\r\n转载自：[HashMap的工作原理](http://www.importnew.com/7099.html)\r\n\r\n***\r\n\r\n其他的 HashMap 学习资料：\r\n\r\n+ [jdk7中HashMap知识点整理](https://segmentfault.com/a/1190000003617333)\r\n+ [HashMap源码分析（四）put-jdk8-红黑树的引入](http://blog.csdn.net/q291611265/article/details/46797557)\r\n+ [JDK7与JDK8中HashMap的实现](https://my.oschina.net/hosee/blog/618953)\r\n+ [JDK1.8HashMap原理和源码分析(java面试收藏)](https://wenku.baidu.com/view/6e1035943968011ca30091cd.html)\r\n+ [谈谈ConcurrentHashMap1.7和1.8的不同实现](http://www.jianshu.com/p/e694f1e868ec)\r\n+ [jdk1.8的HashMap和ConcurrentHashMap](https://my.oschina.net/pingpangkuangmo/blog/817973)\r\n+ [ConcurrentHashMap源码分析（JDK8版本）](http://blog.csdn.net/u010723709/article/details/48007881)\r\n\r\n***\r\n\r\n### 最后\r\n\r\n谢谢阅读，如果可以的话欢迎大家转发和点赞。如需转载注明[原地址](www.54tianzhisheng.cn/2017/06/10/HashMap-Hashtable/)就行。\r\n\r\n群 528776268 欢迎各位大牛进群一起讨论。\r\n\r\n![](http://ohfk1r827.bkt.clouddn.com/1473414112000.png)', 1, 'post', 'publish', 'Java,HashMap,HashTable,HashSet,ConcurrentHashMap', 'Java', 12, 0, 1, 1, 1);
INSERT INTO `t_contents` VALUES (5, 'Pyspider框架 —— Python爬虫实战之爬取 V2EX 网站帖子', 'Pyspider-v2ex', 1497323771, 1497323835, '**背景：**\r\n\r\n**PySpider**：一个国人编写的强大的网络爬虫系统并带有强大的WebUI。采用Python语言编写，分布式架构，支持多种数据库后端，强大的WebUI支持脚本编辑器，任务监视器，项目管理器以及结果查看器。在线示例： **http://demo.pyspider.org/**\r\n\r\n**官方文档： http://docs.pyspider.org/en/latest/** \r\n\r\n**Github :  https://github.com/binux/pyspider** \r\n\r\n本文爬虫代码 Github 地址：**https://github.com/zhisheng17/Python-Projects/blob/master/v2ex/V2EX.py**\r\n\r\n<!-- more -->\r\n\r\n***\r\n\r\n说了这么多，我们还是来看正文吧！\r\n\r\n**前提:** 你已经安装好了Pyspider 和 MySQL-python（保存数据）\r\n\r\n如果你还没安装的话，请看看我的前一篇文章，防止你也走弯路。\r\n\r\n1. [**Pyspider 框架学习时走过的一些坑**](http://blog.csdn.net/tzs_1041218129/article/details/52877949)\r\n\r\n2. [**HTTP 599: SSL certificate problem: unable to get local issuer certificate错误**](http://blog.csdn.net/tzs_1041218129/article/details/52853465)\r\n\r\n我所遇到的一些错误：\r\n\r\n![这里写图片描述](http://img.blog.csdn.net/20161022201123063)\r\n\r\n\r\n首先，**本爬虫目标**：使用 Pyspider 框架爬取 [V2EX](www.v2ex.com) 网站的帖子中的问题和内容，然后将爬取的数据保存在本地。\r\n\r\nV2EX 中大部分的帖子查看是不需要登录的，当然也有些帖子是需要登陆后才能够查看的。（因为后来爬取的时候发现一直 error ，查看具体原因后才知道是需要登录的才可以查看那些帖子的）所以我觉得没必要用到 Cookie，当然如果你非得要登录，那也很简单，简单地方法就是添加你登录后的 cookie 了。\r\n\r\n我们在 https://www.v2ex.com/ 扫了一遍，发现并没有一个列表能包含所有的帖子，只能退而求其次，通过抓取分类下的所有的标签列表页，来遍历所有的帖子： https://www.v2ex.com/?tab=tech 然后是 https://www.v2ex.com/go/programmer  最后每个帖子的详情地址是 （举例）： https://www.v2ex.com/t/314683#reply1\r\n\r\n\r\n\r\n**创建一个项目**\r\n\r\n在 pyspider 的 dashboard 的右下角，点击 “Create” 按钮\r\n\r\n![这里写图片描述](http://img.blog.csdn.net/20161022193415047)\r\n\r\n替换 on_start 函数的 self.crawl 的 URL：\r\n\r\n```\r\n@every(minutes=24 * 60)\r\n    def on_start(self):\r\n        self.crawl(\'https://www.v2ex.com/\', callback=self.index_page, validate_cert=False)\r\n```\r\n\r\n> + self.crawl 告诉 pyspider 抓取指定页面，然后使用 callback 函数对结果进行解析。\r\n> + @every) 修饰器，表示 on_start 每天会执行一次，这样就能抓到最新的帖子了。\r\n> + validate_cert=False 一定要这样，否则会报 HTTP 599: SSL certificate problem: unable to get local issuer certificate错误\r\n\r\n**首页：**\r\n\r\n点击绿色的 run 执行，你会看到 follows 上面有一个红色的 1，切换到 follows 面板，点击绿色的播放按钮：\r\n\r\n![这里写图片描述](http://img.blog.csdn.net/20161022194343052)\r\n\r\n![这里写图片描述](http://img.blog.csdn.net/20161022194412365)\r\n\r\n第二张截图一开始是出现这个问题了，解决办法看前面写的文章，后来问题就不再会出现了。\r\n\r\n<br>\r\n**Tab 列表页 : **\r\n\r\n![这里写图片描述](http://img.blog.csdn.net/20161022194637692)\r\n\r\n在 tab 列表页 中，我们需要提取出所有的主题列表页 的 URL。你可能已经发现了，sample handler 已经提取了非常多大的 URL\r\n\r\n代码：\r\n```\r\n@config(age=10 * 24 * 60 * 60)\r\n    def index_page(self, response):\r\n        for each in response.doc(\'a[href^=\"https://www.v2ex.com/?tab=\"]\').items():\r\n            self.crawl(each.attr.href, callback=self.tab_page, validate_cert=False)\r\n```\r\n\r\n> + 由于帖子列表页和 tab列表页长的并不一样，在这里新建了一个 callback 为 self.tab_page\r\n> + @config(age=10 * 24 * 60 * 60) 在这表示我们认为 10 天内页面有效，不会再次进行更新抓取\r\n\r\n\r\n**Go列表页 : **\r\n\r\n![这里写图片描述](http://img.blog.csdn.net/20161022195235290)\r\n\r\n代码：\r\n\r\n```\r\n@config(age=10 * 24 * 60 * 60)\r\n    def tab_page(self, response):\r\n        for each in response.doc(\'a[href^=\"https://www.v2ex.com/go/\"]\').items():\r\n            self.crawl(each.attr.href, callback=self.board_page, validate_cert=False)\r\n```\r\n\r\n**帖子详情页（T）:**\r\n\r\n![这里写图片描述](http://img.blog.csdn.net/20161022200023793)\r\n\r\n你可以看到结果里面出现了一些reply的东西，对于这些我们是可以不需要的，我们可以去掉。\r\n\r\n同时我们还需要让他自己实现自动翻页功能。\r\n\r\n代码：\r\n```\r\n@config(age=10 * 24 * 60 * 60)\r\n    def board_page(self, response):\r\n        for each in response.doc(\'a[href^=\"https://www.v2ex.com/t/\"]\').items():\r\n            url = each.attr.href\r\n            if url.find(\'#reply\')>0:\r\n                url = url[0:url.find(\'#\')]\r\n            self.crawl(url, callback=self.detail_page, validate_cert=False)\r\n        for each in response.doc(\'a.page_normal\').items():\r\n            self.crawl(each.attr.href, callback=self.board_page, validate_cert=False) #实现自动翻页功能\r\n```\r\n\r\n去掉后的运行截图：\r\n\r\n![这里写图片描述](http://img.blog.csdn.net/20161022200324719)\r\n\r\n实现自动翻页后的截图：\r\n\r\n![这里写图片描述](http://img.blog.csdn.net/20161022201355970)\r\n\r\n此时我们已经可以匹配了所有的帖子的 url 了。\r\n\r\n点击每个帖子后面的按钮就可以查看帖子具体详情了。\r\n\r\n![这里写图片描述](http://img.blog.csdn.net/20161022200539973)\r\n\r\n代码：\r\n\r\n```\r\n@config(priority=2)\r\n    def detail_page(self, response):\r\n        title = response.doc(\'h1\').text()\r\n        content = response.doc(\'div.topic_content\').html().replace(\'\"\', \'\\\\\"\')\r\n        self.add_question(title, content)  #插入数据库\r\n        return {\r\n            \"url\": response.url,\r\n            \"title\": title,\r\n            \"content\": content,\r\n        }\r\n```\r\n\r\n插入数据库的话，需要我们在之前定义一个add_question函数。\r\n\r\n```\r\n#连接数据库\r\ndef __init__(self):\r\n        self.db = MySQLdb.connect(\'localhost\', \'root\', \'root\', \'wenda\', charset=\'utf8\')\r\n\r\n    def add_question(self, title, content):\r\n        try:\r\n            cursor = self.db.cursor()\r\n            sql = \'insert into question(title, content, user_id, created_date, comment_count) values (\"%s\",\"%s\",%d, %s, 0)\' % (title, content, random.randint(1, 10) , \'now()\');   #插入数据库的SQL语句\r\n            print sql\r\n            cursor.execute(sql)\r\n            print cursor.lastrowid\r\n            self.db.commit()\r\n        except Exception, e:\r\n            print e\r\n            self.db.rollback()\r\n```\r\n\r\n查看爬虫运行结果：\r\n\r\n![这里写图片描述](http://img.blog.csdn.net/20161022201700801)\r\n\r\n> 1. 先debug下，再调成running。pyspider框架在windows下的bug\r\n> 2. 设置跑的速度，建议不要跑的太快，否则很容易被发现是爬虫的，人家就会把你的IP给封掉的\r\n> 3. 查看运行工作\r\n> 4. 查看爬取下来的内容\r\n\r\n![这里写图片描述](http://img.blog.csdn.net/20161022202033227)\r\n\r\n![这里写图片描述](http://img.blog.csdn.net/20161022202048258)\r\n\r\n然后再本地数据库GUI软件上查询下就可以看到数据已经保存到本地了。\r\n\r\n自己需要用的话就可以导入出来了。\r\n\r\n在开头我就告诉大家爬虫的代码了，如果详细的看看那个project，你就会找到我上传的爬取数据了。（仅供学习使用，切勿商用！）\r\n\r\n当然你还会看到其他的爬虫代码的了，如果你觉得不错可以给个 Star，或者你也感兴趣的话，你可以fork我的项目，和我一起学习，这个项目长期更新下去。\r\n\r\n**最后：**\r\n\r\n代码：\r\n\r\n```\r\n# created by 10412\r\n# !/usr/bin/env python\r\n# -*- encoding: utf-8 -*-\r\n# Created on 2016-10-20 20:43:00\r\n# Project: V2EX\r\n\r\nfrom pyspider.libs.base_handler import *\r\n\r\nimport re\r\nimport random\r\nimport MySQLdb\r\n\r\nclass Handler(BaseHandler):\r\n    crawl_config = {\r\n    }\r\n\r\n    def __init__(self):\r\n        self.db = MySQLdb.connect(\'localhost\', \'root\', \'root\', \'wenda\', charset=\'utf8\')\r\n\r\n    def add_question(self, title, content):\r\n        try:\r\n            cursor = self.db.cursor()\r\n            sql = \'insert into question(title, content, user_id, created_date, comment_count) values (\"%s\",\"%s\",%d, %s, 0)\' % (title, content, random.randint(1, 10) , \'now()\');\r\n            print sql\r\n            cursor.execute(sql)\r\n            print cursor.lastrowid\r\n            self.db.commit()\r\n        except Exception, e:\r\n            print e\r\n            self.db.rollback()\r\n\r\n\r\n    @every(minutes=24 * 60)\r\n    def on_start(self):\r\n        self.crawl(\'https://www.v2ex.com/\', callback=self.index_page, validate_cert=False)\r\n\r\n    @config(age=10 * 24 * 60 * 60)\r\n    def index_page(self, response):\r\n        for each in response.doc(\'a[href^=\"https://www.v2ex.com/?tab=\"]\').items():\r\n            self.crawl(each.attr.href, callback=self.tab_page, validate_cert=False)\r\n\r\n\r\n    @config(age=10 * 24 * 60 * 60)\r\n    def tab_page(self, response):\r\n        for each in response.doc(\'a[href^=\"https://www.v2ex.com/go/\"]\').items():\r\n            self.crawl(each.attr.href, callback=self.board_page, validate_cert=False)\r\n\r\n\r\n    @config(age=10 * 24 * 60 * 60)\r\n    def board_page(self, response):\r\n        for each in response.doc(\'a[href^=\"https://www.v2ex.com/t/\"]\').items():\r\n            url = each.attr.href\r\n            if url.find(\'#reply\')>0:\r\n                url = url[0:url.find(\'#\')]\r\n            self.crawl(url, callback=self.detail_page, validate_cert=False)\r\n        for each in response.doc(\'a.page_normal\').items():\r\n            self.crawl(each.attr.href, callback=self.board_page, validate_cert=False)\r\n\r\n\r\n    @config(priority=2)\r\n    def detail_page(self, response):\r\n        title = response.doc(\'h1\').text()\r\n        content = response.doc(\'div.topic_content\').html().replace(\'\"\', \'\\\\\"\')\r\n        self.add_question(title, content)  #插入数据库\r\n        return {\r\n            \"url\": response.url,\r\n            \"title\": title,\r\n            \"content\": content,\r\n        }\r\n\r\n\r\n\r\n```', 1, 'post', 'publish', 'Pyspider,Python,爬虫', 'Python', 28, 1, 1, 1, 1);
INSERT INTO `t_contents` VALUES (6, '《疯狂 Java 突破程序员基本功的 16 课》 读书笔记', 'Java-16-lession', 1497325618, 1497325636, '## 第 1 课 —— 数组与内存控制\r\n\r\n### 数组初始化\r\n\r\n数组初始化之后，该数组的长度是不可变的（可通过数组的 length 属性访问数组的长度）。Java 中的数组必须经过初始化（为数组对象的元素分配内存空间，并为每个数组元素指定初始值）才可使用。\r\n\r\n数组初始化的形式：\r\n\r\n+ 静态初始化：初始化时由程序员显示的指定每个数组的初始值，系统决定数组长度。\r\n+ 动态初始化：初始化时程序员只指定数组的长度，系统为数组元素分配初始值。\r\n\r\n<!-- more -->\r\n### 使用数组\r\n\r\n数组元素就是变量：例如 int[] 数组元素相当于 int 类型的变量\r\n\r\n当通过索引来使用数组元素时（访问数组元素的值、为数组元素赋值），将该数组元素当成普通变量使用即可。\r\n\r\n\r\n\r\n## 第 2 课 —— 对象与内存的控制\r\n\r\nJava 内存管理分为：内存分配和内存回收。\r\n\r\n> + 内存分配：创建 Java 对象时 JVM 为该对象在堆内存中所分配的内存空间。\r\n> + 内存回收：当 Java 对象失去引用，变成垃圾，JVM 的垃圾回收机制自动清理该对象，并回收内存\r\n\r\n### 实例变量 和 类变量\r\n\r\n#### 局部变量\r\n\r\n特点：作用时间短，存储在方法的栈内存中\r\n\r\n种类：\r\n\r\n+ 形参：方法签名中定义的局部变量，由方法调用者负责为其赋值，随方法结束而消亡\r\n+ 方法内的局部变量：方法内定义的局部变量，必须在方法内对其进行显示初始化，从初始化后开始生效，随方法结束而消亡\r\n+ 代码块内的局部变量：在代码块中定义的局部变量，必须在代码块中进行显示初始化，从初始化后开始生效，随代码块结束而消亡\r\n\r\n#### 成员变量\r\n\r\n类体内定义的变量，如果该成员变量没有使用 static 修饰，那该成员变量又被称为非静态变量或实例变量，如果使用 static 修饰，则该成员变量又可被称为静态变量或类变量。\r\n\r\n#### 实例变量和类变量的属性\r\n\r\n使用 static 修饰的成员变量是类变量，属于该类本身，没有使用 static 修饰的成员变量是实例变量，属于该类的实例，在同一个类中，每一个类只对应一个 Class 对象，但每个类可以创建多个对象。\r\n\r\n由于同一个 JVM 内的每个类只对应一个 CLass 对象，因此同一个 JVM 内的一个类的类变量只需要一块内存空间；但对于实例变量而言，该类每创建一次实例，就需要为该实例变量分配一块内存空间。也就是说，程序中创建了几个实例，实例变量就需要几块内存空间。\r\n\r\n这里我想到一道面试题目：\r\n\r\n```java\r\npublic class A{\r\n  {\r\n    System.out.println(\"我是代码块\");\r\n  }\r\n  static{\r\n    System.out.println(\"我是静态代码块\");\r\n  }\r\n  public static void main(String[] args) {\r\n        A a = new A();\r\n        A a1 = new A();\r\n    }\r\n}\r\n```\r\n\r\n结果：\r\n\r\n```\r\n我是静态代码块\r\n我是代码块\r\n我是代码块\r\n```\r\n\r\n静态代码块只执行一次，而代码块每创建一个实例，就会打印一次。\r\n\r\n#### 实例变量的初始化时机\r\n\r\n程序可在3个地方对实例变量执行初始化：\r\n\r\n+ 定义实例变量时指定初始值\r\n+ 非静态初始化块中对实例变量指定初始值\r\n+ 构造器中对实例变量指定初始值\r\n\r\n上面第一种和第二种方式比第三种方式更早执行，但第一、二种方式的执行顺序与他们在源程序中的排列顺序相同。\r\n\r\n同样在上面那个代码上加上一个变量 weight 的成员变量，我们来验证下上面的初始化顺序：\r\n\r\n1、`定义实例变量指定初始值` 在 `非静态初始化块对实例变量指定初始值` 之后:\r\n\r\n```java\r\npublic class A{\r\n    {\r\n        weight = 2.1;\r\n        System.out.println(\"我是代码块\");\r\n    }\r\n    double weight = 2.0;\r\n    static{\r\n        System.out.println(\"我是静态代码块\");\r\n    }\r\n    public static void main(String[] args) {\r\n        A a = new A();\r\n        A a1 = new A();\r\n        System.out.println(a.weight);\r\n    }\r\n}\r\n```\r\n\r\n结果是：\r\n\r\n```\r\n我是静态代码块\r\n我是代码块\r\n我是代码块\r\n2.0\r\n```\r\n\r\n2、`定义实例变量指定初始值` 在 `非静态初始化块对实例变量指定初始值` 之前:\r\n\r\n```java\r\npublic class A{\r\n	double weight = 2.0;\r\n    {\r\n        weight = 2.1;\r\n        System.out.println(\"我是代码块\");\r\n    }\r\n    static{\r\n        System.out.println(\"我是静态代码块\");\r\n    }\r\n    public static void main(String[] args) {\r\n        A a = new A();\r\n        A a1 = new A();\r\n        System.out.println(a.weight);\r\n    }\r\n}\r\n```\r\n\r\n结果为：\r\n\r\n```\r\n我是静态代码块\r\n我是代码块\r\n我是代码块\r\n2.1\r\n```\r\n\r\n大家有没有觉得很奇怪？\r\n\r\n我来好好说清楚下：\r\n\r\n> 定义实例变量时指定的初始值、初始代码块中为实例变量指定初始值的语句的地位是平等的，当经过编译器处理后，他们都将会被提取到构造器中。也就是说，这条语句 `double weight = 2.0;` 实际上会被分成如下 2 次执行：\r\n>\r\n> + `double weight;` : 创建 Java 对象时系统根据该语句为该对象分配内存。\r\n> + `weight = 2.1;` : 这条语句将会被提取到 Java 类的构造器中执行。\r\n\r\n只说原理，大家肯定不怎么信，那么还有拿出源码来，这样才有信服能力的吗？是不？\r\n\r\n这里我直接使用软件将代码的字节码文件反编译过来，看看里面是怎样的组成？\r\n\r\n第一个代码的反编译源码如下：\r\n\r\n```java\r\npublic class A\r\n{\r\n  double weight;\r\n  public A()\r\n  {\r\n    this.weight = 2.1D;\r\n    System.out.println(\"我是代码块\");\r\n    this.weight = 2.0D;\r\n  }\r\n  static\r\n  {\r\n    System.out.println(\"我是静态代码块\");\r\n  }\r\n  public static void main(String[] args)\r\n  {\r\n    A a = new A();\r\n    A a1 = new A();\r\n    System.out.println(a.weight);\r\n  }\r\n}\r\n```\r\n\r\n第二个代码反编译源码如下：\r\n\r\n```java\r\npublic class A\r\n{\r\n  double weight;\r\n  public A()\r\n  {\r\n    this.weight = 2.0D;\r\n    this.weight = 2.1D;\r\n    System.out.println(\"我是代码块\");\r\n  }\r\n  static\r\n  {\r\n    System.out.println(\"我是静态代码块\");\r\n  }\r\n  public static void main(String[] args)\r\n  {\r\n    A a = new A();\r\n    A a1 = new A();\r\n    System.out.println(a.weight);\r\n  }\r\n}\r\n```\r\n\r\n这下子满意了吧！\r\n\r\n通过反编译的源码可以看到该类定义的 weight 实例变量时不再有初始值，为 weight 指定初始值的代码也被提到了构造器中去了，但是我们也可以发现之前规则也是满足的。\r\n\r\n他们的赋值语句都被合并到构造器中，在合并过程中，定义的变量语句转换得到的赋值语句，初始代码块中的语句都转换得到的赋值语句，总是位于构造器的所有语句之前，合并后，两种赋值语句的顺序也保持了它们在 Java 源代码中的顺序。\r\n\r\n大致过程应该了解了吧？如果还不怎么清楚的，建议还是自己将怎个过程在自己的电脑上操作一遍，毕竟光看不练假把式。\r\n\r\n#### 类变量的初始化时机\r\n\r\nJVM 对每一个 Java 类只初始化一次，因此 Java 程序每运行一次，系统只为类变量分配一次内存空间，执行一次初始化。程序可在两个地方对类变量执行初始化：\r\n\r\n+ 定义类变量时指定初始值\r\n+ 静态初始化代码块中对类变量指定初始值\r\n\r\n这两种方式的执行顺序与它们在源代码中的排列顺序相同。\r\n\r\n还是用上面那个示例，我们在其基础上加个被 static 修饰的变量 height：\r\n\r\n1、`定义类变量时指定初始值` 在 `静态初始化代码块中对类变量指定初始值` 之后：\r\n\r\n```java\r\npublic class A{\r\n    double weight = 2.0;\r\n    {\r\n        weight = 2.1;\r\n        System.out.println(\"我是代码块\");\r\n    }\r\n    static{\r\n        height = 10.1;\r\n        System.out.println(\"我是静态代码块\");\r\n    }\r\n    static double height = 10.0;\r\n    public static void main(String[] args) {\r\n        A a = new A();\r\n        A a1 = new A();\r\n        System.out.println(a.weight);\r\n        System.out.println(height);\r\n    }\r\n}\r\n```\r\n\r\n运行结果：\r\n\r\n```\r\n我是静态代码块\r\n我是代码块\r\n我是代码块\r\n2.1\r\n10.0\r\n```\r\n\r\n2、`定义类变量时指定初始值` 在 `静态初始化代码块中对类变量指定初始值` 之前：\r\n\r\n```java\r\npublic class A{\r\n    static double height = 10.0;\r\n    double weight = 2.0;\r\n    {\r\n        weight = 2.1;\r\n        System.out.println(\"我是代码块\");\r\n    }\r\n    static{\r\n        height = 10.1;\r\n        System.out.println(\"我是静态代码块\");\r\n    }\r\n    public static void main(String[] args) {\r\n        A a = new A();\r\n        A a1 = new A();\r\n        System.out.println(a.weight);\r\n        System.out.println(height);\r\n    }\r\n}\r\n```\r\n\r\n运行结果：\r\n\r\n```\r\n我是静态代码块\r\n我是代码块\r\n我是代码块\r\n2.1\r\n10.1\r\n```\r\n\r\n其运行结果正如我们预料，但是我们还是看看反编译后的代码吧！\r\n\r\n第一种情况下反编译的代码：\r\n\r\n```java\r\npublic class A\r\n{\r\n  double weight;\r\n  public A()\r\n  {\r\n    this.weight = 2.0D;\r\n\r\n    this.weight = 2.1D;\r\n    System.out.println(\"我是代码块\");\r\n  }\r\n  static\r\n  {\r\n    System.out.println(\"我是静态代码块\");\r\n  }\r\n  static double height = 10.0D;\r\n  public static void main(String[] args)\r\n  {\r\n    A a = new A();\r\n    A a1 = new A();\r\n    System.out.println(a.weight);\r\n    System.out.println(height);\r\n  }\r\n}\r\n```\r\n\r\n第二种情况下反编译的代码：\r\n\r\n```java\r\npublic class A\r\n{\r\n  static double height = 10.0D;\r\n  double weight;\r\n  public A()\r\n  {\r\n    this.weight = 2.0D;\r\n\r\n    this.weight = 2.1D;\r\n    System.out.println(\"我是代码块\");\r\n  }\r\n  static\r\n  {\r\n    height = 10.1D;\r\n    System.out.println(\"我是静态代码块\");\r\n  }\r\n  public static void main(String[] args)\r\n  {\r\n    A a = new A();\r\n    A a1 = new A();\r\n    System.out.println(a.weight);\r\n    System.out.println(height);\r\n  }\r\n}\r\n```\r\n\r\n通过反编译源码，可以看到第一种情况下(`定义类变量时指定初始值` 在 `静态初始化代码块中对类变量指定初始值` 之后):\r\n\r\n我们在 **静态初始化代码块中对类变量指定初始值** 已经不存在了，只有一个类变量指定的初始值 `static double height = 10.0D;` , 而在第二种情况下（`定义类变量时指定初始值` 在 `静态初始化代码块中对类变量指定初始值` 之前）和之前的源代码顺序是一样的，没啥区别。\r\n\r\n上面的代码中充分的展示了类变量的两种初始化方式 ：每次运行该程序时，系统会为 A 类执行初始化，先为所有类变量分配内存空间，再按照源代码中的排列顺序执行静态初始代码块中所指定的初始值和定义类变量时所指定的初始值。\r\n\r\n###  父类构造器\r\n\r\n当创建任何 Java 对象时，程序总会先依次调用每个父类非静态初始化代码块、父类构造器（总是从 Object 开始）执行初始化，最后才调用本类的非静态初始化代码块、构造器执行初始化。\r\n\r\n#### 隐式调用和显示调用\r\n\r\n当调用某个类的构造器来创建 Java 对象时，系统总会先调用父类的非静态初始化代码块进行初始化。这个调用是隐式执行的，而且父类的静态初始化代码块总是会被执行。接着会调用父类的一个或多个构造器执行初始化，这个调用既可以是通过 super 进行显示调用，也可以是隐式调用。\r\n\r\n当所有父类的非静态初始代码块、构造器依次调用完成后，系统调用本类的非静态代码块、构造器执行初始化，最后返回本类的实例。至于调用父类的哪个构造器执行初始化，分以下几种情况：\r\n\r\n+ 子类构造器执行体的第一行代码使用 super 显式调用父类构造器，系统将根据 super 调用里传入的实参列表来确定调用父类的哪个构造器；\r\n+ 子类构造器执行体的第一行代码使用 this 显式调用本类中的重载构造器，系统将根据 this 调用里传入的实参列表来确定奔雷的另一个构造器（执行本类中另一个构造器时即进入第一种情况）；\r\n+ 子类构造器中既没有 super 调用，也没有 this 调用，系统将会在执行子类构造器之前，隐式调用父类无参构造器。\r\n\r\n注：super 和 this 必须在构造器的第一行，且不能同时存在。\r\n\r\n推荐一篇博客：[Java初始化顺序](http://www.cnblogs.com/miniwiki/archive/2011/03/25/1995615.html) 文章从无继承和继承两种情况下分析了 Java 初始化的顺序。\r\n\r\n\r\n#### 访问子类对象的实例变量\r\n\r\n\r\n\r\n#### 调用被子类重写的方法\r\n\r\n\r\n\r\n### 父子实例的内存控制\r\n\r\n#### 继承成员变量和继承方法的区别\r\n\r\n方法的行为总是表现出它们实际类型的行为；实例变量的值总是表现出声明这些变量所用类型的行为。\r\n\r\n#### 内存中的子类实例\r\n\r\n\r\n\r\n#### 父、子类的类变量\r\n\r\n\r\n\r\n### final 修饰符\r\n\r\nfinal 可以修饰变量、方法、类。\r\n\r\n+ 修饰变量，变量被赋初始值之后，不能够对他在进行修改\r\n+ 修饰方法，不能够被重写\r\n+ 修饰类，不能够被继承\r\n\r\nfinal 修饰的实例变量只能在如下位置指定初始值：\r\n\r\n+ 定义 final 实例变量时指定初始值\r\n+ 在非静态代码块中为 final 实例变量指定初始值\r\n+ 在构造器中为 final 实例变量指定初始值\r\n\r\nfinal 修饰的类变量只能在如下位置指定初始值：\r\n\r\n+ 定义 final 类变量时指定初始值\r\n+ 在静态代码块中为 final 类变量指定初始值\r\n\r\n\r\n\r\n## 第 3 课 —— 常见 Java 集合的实现细节\r\n\r\nJava 集合框架类图：\r\n\r\n![](http://ohfk1r827.bkt.clouddn.com/Java%E9%9B%86%E5%90%88%E6%A1%86%E6%9E%B6%E7%B1%BB%E5%9B%BE.jpg)\r\n\r\n### Set 和 Map\r\n\r\nSet 代表一种集合元素无序、集合元素不可重复的集合，Map 则代表一种由多个 key-value 对组合的集合，Map 集合类似于传统的关联数组。\r\n\r\n#### Set 和 Map 的关系\r\n\r\n1、Map 集合中的 key 不能重复且没有顺序。将这些 key 组合起来就是一个 Set 集合。所以有一个 `Set<k> keySet()` 方法来返回所有 key 组成的 Set 集合。\r\n\r\n2、Set 也可以转换成 Map。（在 Set 中将 每一对 key 和 value 存放在一起）\r\n\r\n#### HashMap 和 HashSet\r\n\r\nHashSet：系统采用 Hash 算法决定集合元素的存储位置。（基于 HashMap 实现的）\r\n\r\nHashMap：系统将 value 当成 key 的附属，系统根据 Hash 算法决定 key 的存储位置。\r\n\r\nHashSet 的绝大部分方法都是通过调用 HashMap 的方法实现的，因此 HashSet 和 HashMap 两个集合在实现本质上是相同的。\r\n\r\n#### TreeMap 和 TreeSet\r\n\r\nTreeSet 底层使用 TreeMap 来包含 Set 集合中的所有元素。\r\n\r\nTreeMap 采用的是一种“红黑树”的排序二叉树来保存 Map 中每个 Entry —— 每个 Entry 都被当成 “红黑树” 的一个节点对待。\r\n\r\n### Map 和 List\r\n\r\n#### Map 的 values() 方法\r\n\r\n不管是 HashMap 还是 TreeMap ，它们的 values() 方法都可以返回其所有 value 组成的 Collection 集合，其实是一个不存储元素的 Collection 集合，当程序遍历 Collection 集合时，实际上就是遍历 Map 对象的 value。\r\n\r\nHashMap 和 TreeMap 的 values() 方法并未把 Map 中的 values 重新组合成一个包含元素的集合对象，这样就可以降低系统内存开销。\r\n\r\n#### Map 和 List 的关系\r\n\r\n底层实现很相似；用法上很相似。\r\n\r\n+ Map 接口提供 get(K key) 方法允许 Map 对象根据 key 来取得 value；\r\n+ List 接口提供了 get(int index) 方法允许 List 对象根据元素索引来取得 value；\r\n\r\n### ArrayList 和 LinkedList\r\n\r\nList 集合的实现类，主要有 ArrayList 、Vector 和 LinkedList。\r\n\r\n+ **ArrayList **是一个可改变大小的数组.当更多的元素加入到 ArrayList 中时, 其大小将会动态地增长.  内部的元素可以直接通过 get 与 set 方法进行访问, 因为 ArrayList 本质上就是一个数组.\r\n+ **LinkedList **是一个双链表, 在添加和删除元素时具有比 ArrayList 更好的性能. 但在 get 与 set 方面弱于ArrayList. 当然, 这些对比都是指数据量很大或者操作很频繁的情况下的对比, 如果数据和运算量很小,那么对比将失去意义.\r\n+ **Vector **和 ArrayList 类似, 但属于强同步类。如果你的程序本身是线程安全的(thread-safe,没有在多个线程之间共享同一个集合/对象),那么使用 ArrayList 是更好的选择。\r\n\r\nVector 和 ArrayList 在更多元素添加进来时会请求更大的空间。Vector 每次请求其大小的双倍空间，而 ArrayList每次对 size 增长 50%.\r\n\r\n而 LinkedList 还实现了 Queue 接口, 该接口比 List 提供了更多的方法,包括 offer(), peek(), poll()等.\r\n\r\n注意: 默认情况下 ArrayList 的初始容量非常小, 所以如果可以预估数据量的话, 分配一个较大的初始值属于最佳实践, 这样可以减少调整大小的开销。\r\n\r\nArrayList与LinkedList性能对比\r\n\r\n时间复杂度对比如下:\r\n\r\n![](http://www.programcreek.com/wp-content/uploads/2013/03/arraylist-vs-linkedlist-complexity.png)\r\n\r\nLinkedList 更适用于:\r\n\r\n+ 没有大规模的随机读取\r\n+ 大量的增加/删除操作\r\n\r\n### Iterator 迭代器\r\n\r\n是一个迭代器接口，专门用于迭代各种 Collection 集合，包括 Set  集合和 List 集合。\r\n\r\n\r\n\r\n## 第 4 课 —— Java 的内存回收\r\n\r\n### Java 引用的种类\r\n\r\n#### 对象在内存中的状态\r\n\r\nJVM 垃圾回收机制，是否回收一个对象的标准在于：是否还有引用变量引用该对象？只要有引用变量引用该对象，垃圾回收机制就不会回收它。\r\n\r\nJava 语言对对象的引用有：\r\n\r\n+ 强引用\r\n+ 软引用\r\n+ 弱引用\r\n+ 虚引用\r\n\r\n#### 强引用\r\n\r\n程序创建一个对象，并把这个对象赋给一个引用变量，这个引用变量就是强引用。当一个对象被一个或者一个以上的强引用变量所引用时，它处于可达状态，它是不会被系统的垃圾回收机制回收。\r\n\r\n#### 软引用\r\n\r\n软引用需要通过 SoftReference 类来实现，当一个对象只具有软引用时，它有可能会被垃圾回收机制回收。对于只有软引用的对象而言，当系统内存空间足够时，它不会被系统回收，程序也可使用该对象；当系统内存空间不足时，系统将会回收它。\r\n\r\n#### 弱引用\r\n\r\n弱引用和软引用有点相似，区别在于弱引用所引用对象的生存期更短。\r\n\r\n#### 虚引用\r\n\r\n虚引用主要用于跟踪对象被垃圾回收的状态，虚引用不能单独使用，虚引用必须和引用队列联合使用。\r\n\r\n### Java 的内存泄漏\r\n\r\nArrayList.java 中的 remove 方法\r\n\r\n```java\r\npublic E remove(int index) {\r\n        rangeCheck(index);\r\n        modCount++;\r\n        E oldValue = elementData(index);\r\n        int numMoved = size - index - 1;\r\n        if (numMoved > 0)\r\n            System.arraycopy(elementData, index+1, elementData, index,\r\n                             numMoved);\r\n        elementData[--size] = null; // clear to let GC do its work\r\n        return oldValue;\r\n    }\r\n```\r\n\r\n其中 `elementData[--size] = null; // clear to let GC do its work` 语句是清除数组元素的引用，避免内存的泄漏，如果没有这句的话，那么就是只有两个作用：\r\n\r\n+ 修饰 Stack 的属性，也就是将值减 1；\r\n+ 返回索引为 size -1 的值。\r\n\r\n### 垃圾回收机制\r\n\r\n+ 跟踪并监控每个 Java 对象，当某个对象处于不可达状态时，回收该对象所占用的内存。\r\n+ 清理内存分配，回收过程中产生的内存碎片。\r\n\r\n#### 垃圾回收的基本算法\r\n\r\n对于一个垃圾回收器的设计算法来说，大概有如下几个设计：\r\n\r\n+ 串行回收 和 并行回收\r\n\r\n  > 串行回收：不管系统有多少个 CPU，始终使用一个 CPU 来执行垃圾回收操作\r\n  >\r\n  > 并行回收：把整个回收工作拆分成多部分，每个部分由一个 CPU 负责，从而让多个 CPU 并行回收\r\n\r\n+ 并发执行 和 应用程序停止\r\n\r\n+ 压缩 和 不压缩 和 复制\r\n\r\n  > + 复制：将堆内分成两个相同的空间，从根开始访问每一个关联的可达对象，将空间A的可达对象全部复制到空间B，然后一次性回收整个空间A。\r\n  > + 标记清除：也就是 不压缩 的回收方式。垃圾回收器先从根开始访问所有可达对象，将它们标记为可达状态，然后再遍历一次整个内存区域，把所有没有标记为可达的对象进行回收处理。\r\n  > + 标记压缩：这是压缩方式，这种方式充分利用上述两种算法的优点，垃圾回收器先从根开始访问所有可达对象，将他们标记为可达状态，接下来垃圾回收器会将这些活动对象搬迁在一起，这个过程叫做内存压缩，然后垃圾回收机制再次回收那些不可达对象所占用的内存空间，这样就避免了回收产生的内存碎片。\r\n\r\n#### 堆内存的分代回收\r\n\r\n1、Young 代\r\n\r\n2、Old 代\r\n\r\n3、Permanent 代\r\n\r\n### 内存管理小技巧\r\n\r\n+ 尽量使用直接量\r\n+ 使用 StringBuilder 和 StringBuffer 进行字符串拼接\r\n+ 尽早释放无用对象的引用\r\n+ 尽量少用静态变量\r\n+ 避免在经常调用的方法、循环中创建 Java 对象\r\n+ 缓存经常使用的对象\r\n+ 尽量不要使用 finalize 方法\r\n+ 考虑使用 SoftReference\r\n\r\n\r\n\r\n## 第 5 课 —— 表达式中的陷阱\r\n\r\n### 关于字符串的陷阱\r\n\r\n#### JVM 对字符串的处理\r\n\r\n`String java = new String(\"Java\")` 这句创建了两个字符串对象，一个是 “Java” 这个直接量对应的字符串对象，另外一个是 new String() 构造器返回的字符串对象。\r\n\r\nJava 程序中创建对象的方法：\r\n\r\n+ 通过 new 调用构造器创建 Java 对象\r\n+ 通过 Class 对象的 newInstance() 方法调用构造器创建 Java 对象\r\n+ 通过 Java 的反序列化机制从 IO 流中恢复 Java 对象\r\n+ 通过 Java 对象提供的 clone() 方法复制一个新的 Java 对象\r\n+ 对于字符串以及 Byte、Short、Int、Long、Character、Float、Double 和 Boolean 这些基本类型的包装类\r\n+ 直接量的方式来创建 Java 对象  Integer in = 5；\r\n+ 通过简单的算法表达式，连接运算来创建 Java 对象 String str = \"a\" + \"b\"; （如果这个字符串表达式的值在编译时确定下来，那么 JVM 会在编译时计算该字符串变量的值，并让它指向字符串池中对应的字符串。如果这些算法表达式都是字符串直接量、整数直接量，没有变量和方法参与，那么就可以在编译期就可以确定字符串的值；如果使用了变量、调用了方法，那么只有等到运行时才能确定字符串表达式的值；如果字符串连接运算所有的变量都可执行 “宏替换”（使用 final 修饰的变量），那在编译时期也能确定字符串连接表达式的值）\r\n\r\n对于 Java 程序的字符直接量，JVM 会使用一个字符串池来保护它们；当第一次使用某个字符串直接量时，JVM 会将它放入字符串池进行缓存。在一般的情况下，字符串池中的字符串对象不会被垃圾回收器回收，当程序再次需要使用该字符串时，无需重新创建一个新的字符串，而是直接让引用变量指向字符串池中已有的字符串。\r\n\r\n#### 不可变的字符串\r\n\r\nString 类是一个不可变类，当一个 String 对象创建完成后，该 String 类里包含的字符序列就被固定下来，以后永远不能修改。\r\n\r\n如果程序需要一个字符序列会发生改变的字符串，那么建议使用 StringBuilder （效率比 StringBuffer 高）\r\n\r\n#### 字符串比较\r\n\r\n如果要比较两个字符串是否相同，用 == 进行判断就行，但如果要判断两个字符串所包含的字符序列是否相同，则应该用 String 重写过的 equals() 方法进行比较。\r\n\r\n```java\r\npublic boolean equals(Object anObject) {\r\n        //如果两个字符串相同\r\n        if (this == anObject) {\r\n            return true;\r\n        }\r\n        //如果anObject是String类型\r\n        if (anObject instanceof String) {\r\n            String anotherString = (String)anObject;\r\n            //n代表字符串的长度\r\n            int n = value.length;\r\n            //如果两个字符串长度相等\r\n            if (n == anotherString.value.length) {\r\n                //获取当前字符串、anotherString底层封装的字符数组\r\n                char v1[] = value;\r\n                char v2[] = anotherString.value;\r\n                int i = 0;\r\n                //逐一比较v1 和 v2数组中的每个字符\r\n                while (n-- != 0) {\r\n                    if (v1[i] != v2[i])\r\n                        return false;\r\n                    i++;\r\n                }\r\n                return true;\r\n            }\r\n        }\r\n        return false;\r\n    }\r\n```\r\n\r\n还可以使用 String 提供的 compareTo() 方法返回两个字符串的大小\r\n\r\n```java\r\npublic int compareTo(String anotherString) {\r\n        int len1 = value.length;\r\n        int len2 = anotherString.value.length;\r\n        int lim = Math.min(len1, len2);\r\n        char v1[] = value;\r\n        char v2[] = anotherString.value;\r\n\r\n        int k = 0;\r\n        while (k < lim) {\r\n            char c1 = v1[k];\r\n            char c2 = v2[k];\r\n            if (c1 != c2) {\r\n                return c1 - c2;\r\n            }\r\n            k++;\r\n        }\r\n        return len1 - len2;\r\n    }\r\n```\r\n\r\n### 表达式类型的陷阱\r\n\r\n#### 表达式类型的自动提升\r\n\r\n+ 所有 byte、short、char类型将被提升到 int 类型参与运算\r\n\r\n+ 整个算术表达式的数据类型自动提升到与表达式中最高等级操作数同样的类型，操作数的等级排列如下：char -> int -> long ->float -> double\r\n\r\n  byte -> short -> int -> long ->float -> double\r\n\r\n#### 复合赋值运算符的陷阱\r\n\r\nJava 语言允许所有的双目运算符和 = 一起结合组成复合赋值运算符，如 +=、-=、*=、/=、%= 、&= 等，复合赋值运算符包含了一个隐式的类型转换。\r\n\r\n```java\r\n//下面这两条语句不等价\r\na = a + 5;		//\r\na += 5;			//实际上等价于 a = (a的类型) (a + 5);\r\n```\r\n\r\n复合赋值运算符会自动的将它计算的结果值强制转换为其左侧变量的类型。\r\n\r\n### 输入法导致的陷阱\r\n\r\n### 注释的字符必须合法\r\n\r\n### 转义字符的陷阱\r\n\r\n+ 慎用字符的 Unicode 转义形式\r\n+ 中止行注释的转义字符\r\n\r\n### 泛型可能引起的错误\r\n\r\n#### 原始类型变量的赋值\r\n\r\n+ 当程序把一个原始类型的变量赋给一个带有泛型信息的变量时，总是可以通过编译（只是会提示警告信息）\r\n+ 当程序试图访问带泛型声明的集合的集合元素时，编译器总是把集合元素当成泛型类型处理（它并不关心集合里集合元素的实际类型）\r\n+ 当程序试图访问带泛型声明的集合的集合元素时，JVM会遍历每个集合元素自动执行强制转型，如果集合元素的实际类型与集合所带的泛型信息不匹配，运行时将引发 ClassCastException\r\n\r\n#### 原始类型带来的擦除\r\n\r\n当把一个具有泛型信息的对象赋给另一个没有泛型信息的变量时，所有在尖括号之间的类型信息都会丢弃。\r\n\r\n#### 创建泛型数组的陷阱\r\n\r\nJava 中不允许创建泛型数组\r\n\r\n### 正则表达式的陷阱\r\n\r\n有些符号本身就是正则表达式，我们需要对符号做转义运算。\r\n\r\n### 多线程的陷阱\r\n\r\n#### 不要调用 run 方法\r\n\r\n开启线程是用 start() 方法，而不是 run() 方法。\r\n\r\n#### 静态的同步方法\r\n\r\n对于同步代码块而言，程序必须显式为它指定同步监视器；对于同步非静态方法而言，该方法的同步监视器是 this —— 即调用该方法的 Java 对象；对于静态的同步方法而言，该方法的同步监视器不是 this，而是该类本身。\r\n\r\n\r\n\r\n\r\n\r\n## 第 6 课 —— 流程控制的陷阱\r\n\r\n### switch 语句陷阱\r\n\r\nbreak 语句不要忘记写\r\n\r\nswitch 的表达式类型：\r\n\r\n+ byte\r\n+ short\r\n+ int\r\n+ char\r\n+ enum\r\n+ String （Jdk 1.7 以后有 String）\r\n\r\n### 标签引起的陷阱\r\n\r\nJava 中的标签通常是和循环中的 break 和 continue 结合使用，让 break 直接终止标签所标识的循环，让 continue 语句忽略标签所标识的循环的剩下语句。\r\n\r\n。。\r\n\r\n\r\n\r\n## 第 7 课 —— 面向对象的陷阱\r\n\r\n### instanceof  运算符的陷阱\r\n\r\ninstanceof 它用于判断前面的对象是否是后面的类或其子类、实现类的实例。如果是返回 true，否则返回 false。\r\n\r\ninstanceof 运算符前面操作数的编译时类型必须是：\r\n\r\n+ 要么与后面的类相同\r\n+ 要么是后面类的父类\r\n+ 要么是后面类型的子类\r\n\r\n\r\n### 构造器陷阱\r\n\r\n构造器是 Java 中每个类都会提供的一个“特殊方法”。构造器负责对 Java 对象执行初始化操作，不管是定义实例变量时指定的初始值，还是在非静态初始化代码块中所做的操作，实际上都会被提取到构造器中执行。\r\n\r\n构造器不能声明返回值类型，也不能使用void声明构造器没有返回值。\r\n\r\n#### 构造器创建对象吗\r\n\r\n构造器并不会创建 Java 对象，构造器只是负责执行初始化，在构造器执行之前，Java 对象所需要的内存空间，是由 new 关键字申请出来的。绝大部分时候，程序使用 new 关键字为一个 Java 对象申请空间之后，都需要使用构造器为这个对象执行初始化，但在某些时候，程序创建 Java 对象无需调用构造器，如下：\r\n\r\n+ 使用反序列化的方式恢复 Java 对象\r\n+ 使用 clone 方法复制 Java 对象\r\n\r\n```java\r\npackage com.zhisheng.test;\r\n\r\nimport java.io.*;\r\n\r\n/**\r\n * Created by 10412 on 2017/5/31.\r\n */\r\nclass Wolf implements Serializable\r\n{\r\n    private String name;\r\n\r\n    public Wolf(String name) {\r\n        System.out.println(\"调用了有参构造方法\");\r\n        this.name = name;\r\n    }\r\n\r\n    @Override\r\n    public boolean equals(Object o) {\r\n        if (this == o) return true;\r\n        if (o == null || getClass() != o.getClass()) return false;\r\n\r\n        Wolf wolf = (Wolf) o;\r\n\r\n        return name != null ? name.equals(wolf.name) : wolf.name == null;\r\n\r\n    }\r\n\r\n    @Override\r\n    public int hashCode() {\r\n        return name != null ? name.hashCode() : 0;\r\n    }\r\n}\r\n\r\npublic class SerializableTest\r\n{\r\n    public static void main(String[] args) {\r\n        Wolf w = new Wolf(\"灰太狼\");\r\n        System.out.println(\"对象创建完成\");\r\n        Wolf w2 = null;\r\n        ObjectInputStream ois = null;\r\n        ObjectOutputStream oos = null;\r\n        try {\r\n            //创建输出对象流\r\n            oos = new ObjectOutputStream(new FileOutputStream(\"a.bin\"));\r\n            //创建输入对象流\r\n            ois = new ObjectInputStream(new FileInputStream(\"a.bin\"));\r\n            //序列输出java 对象\r\n            oos.writeObject(w);\r\n            oos.flush();\r\n            //反序列化恢复java对象\r\n            w2 = (Wolf) ois.readObject();\r\n            System.out.println(w);\r\n            System.out.println(w2);\r\n            //两个对象的实例变量值完全相等，输出true\r\n            System.out.println(w.equals(w2));\r\n            //两个对象不同，输出false\r\n            System.out.println(w == w2);\r\n        } catch (IOException e) {\r\n            e.printStackTrace();\r\n        } catch (ClassNotFoundException e) {\r\n            e.printStackTrace();\r\n        }finally {\r\n            if (ois!=null)\r\n                try {\r\n                    ois.close();\r\n                } catch (IOException e) {\r\n                    e.printStackTrace();\r\n                }\r\n            if (oos!=null)\r\n                try {\r\n                    oos.close();\r\n                } catch (IOException e) {\r\n                    e.printStackTrace();\r\n                }\r\n        }\r\n\r\n    }\r\n}\r\n```\r\n\r\n程序运行结果：\r\n\r\n```java\r\n调用了有参构造方法\r\n对象创建完成\r\ncom.zhisheng.test.Wolf@1b15382\r\ncom.zhisheng.test.Wolf@1b15382\r\ntrue\r\nfalse\r\n```\r\n\r\n正如结果所示：创建 Wolf 对象时，程序调用了相应的构造器来对该对象执行初始化；当程序通过反序列化机制恢复 Java 对象时，系统无需在调用构造器来进行初始化。通过反序列化恢复出来的 Wolf 对象和原来的 Wolf 对象具有完全相同的实例变量值，但系统会产生两个对象。\r\n\r\n#### 无限递归构造器\r\n\r\n```java\r\npublic class ConstrutionTest\r\n{\r\n    ConstrutionTest ct;\r\n    {\r\n        ct = new ConstrutionTest();\r\n    }\r\n    public ConstrutionTest() {\r\n        System.out.println(\"无参构造器\");\r\n    }\r\n    public static void main(String[] args) {\r\n        ConstrutionTest ct = new ConstrutionTest();\r\n    }\r\n}\r\n```\r\n\r\n运行结果抛出异常 `java.lang.StackOverflowError`\r\n\r\n因为不管定义实例变量时指定的初始值，还是在非静态初始化代码块中执行的初始化操作，最终都将提取到构造器中执行，因为代码中递归调用了类的构造器，最终导致出现 `java.lang.StackOverflowError` 异常。\r\n\r\n### 到底调用哪个重载方法\r\n\r\n1、第一阶段 JVM 将会选取所有可获得并匹配调用的方法或者构造器\r\n\r\n2、第二个阶段决定到底要调用哪个方法，此时 JVM 会在第一阶段所选取的方法或者构造器中再次选取最精确匹配的那一个。\r\n\r\n```java\r\npublic class OverrideTest\r\n{\r\n    public void info(Object obj, int a) {\r\n        System.out.println(\"obj 参数\" + obj);\r\n        System.out.println(\"整型参数 \" + a);\r\n    }\r\n\r\n    public void info(Object[] obj, double a) {\r\n        System.out.println(\"obj 参数\" + obj);\r\n        System.out.println(\"整型参数 \" + a);\r\n    }\r\n\r\n    public static void main(String[] args) {\r\n        OverrideTest o = new OverrideTest();\r\n        o.info(null, 5);\r\n    }\r\n}\r\n```\r\n\r\n报错如下：\r\n\r\n```\r\nError:(20, 10) java: 对info的引用不明确\r\n  com.zhisheng.test.OverrideTest 中的方法 info(java.lang.Object,int) 和 com.zhisheng.test.OverrideTest 中的方法 info(java.lang.Object[],double) 都匹配\r\n```\r\n\r\n在这种复杂的条件下，JVM 无法判断哪个方法更匹配实际调用，将会导致程序编译错误。\r\n\r\n### 方法重写的陷阱\r\n\r\n无法重写父类 private 方法。如果子类有一个与父类 private 方法具有相同方法名、相同形参列表、相同返回值类型的方法，依然不是重写，只是子类定义了一个与父类相同的方法。\r\n\r\n### static 关键字\r\n\r\nstatic 可以修饰类中定义的成员：field、方法、内部类、初始化代码块、内部枚举类\r\n\r\n#### 静态方法属于类\r\n\r\n被 static 修饰的成员（field、方法、内部类、初始化块、内部枚举类）属于类本身，而不是单个的 Java 对象。静态方法也是属于类。\r\n\r\n\r\n\r\n## 第 8 课 —— 异常捕捉的陷阱\r\n\r\n### 正确关闭资源的方式\r\n\r\n+ 使用 finally 块来保证回收，保证关闭操作总是会被执行\r\n+ 关闭每个资源之前首先保证引用该资源的引用变量不为 null\r\n+ 为每个物理资源单独使用 try .. catch 块关闭资源，保证关闭资源时引发的异常不会影响其他资源的关闭。\r\n\r\n### finally 块陷阱\r\n\r\nfinally 执行顺序，看我以前写的一篇文章[《深度探究Java 中 finally 语句块》](http://www.54tianzhisheng.cn/2017/03/28/%E6%B7%B1%E5%BA%A6%E6%8E%A2%E7%A9%B6Java%20%E4%B8%AD%20finally%20%E8%AF%AD%E5%8F%A5%E5%9D%97/)。\r\n\r\n### catch 块用法\r\n\r\n在 try 块后使用 catch 块来捕获多个异常时，程序应该小心多个 catch 块之间的顺序：捕获父类异常的 catch 块都应该排在捕获子类异常的 catch 块之后（先处理小异常，再处理大异常），否则出现编译错误。\r\n\r\n### 继承得到的异常\r\n\r\n子类重写父类方法时，不能声明抛出比父类方法类型更多、范围更大的异常。\r\n\r\n\r\n二叉树性质：\r\n\r\n+ 二叉树第 i 层上的节点数目至多为 2 ^(i - 1)   (i >= 1)\r\n\r\n+ 深度为 k 的二叉树至多有 2 ^ k - 1 个节点\r\n\r\n+ 在任何一颗二叉树中，如果其叶子结点的数量为 n0，度为 2 的子节点数量为 n2，则 n0 = n2 + 1\r\n\r\n+ 具有 n 个节点的完全二叉树的深度为 log n   +  1   (log 的底为 2)\r\n\r\n+ 对于一棵有 n 个节点的完全二叉树的节点按层自左向右编号，则对任一编号为 i 的节点有如下性质：\r\n\r\n  当 i == 1 时，节点 i 是二叉树的根；若 i > 1 时，则节点的父节点是 i/2\r\n\r\n  当 2i <= n，则节点 i 有左孩子，左孩子的编号是 2i，否则，节点无左孩子，并且是叶子结点\r\n\r\n  若 2i + 1 <= n ，则节点 i 有右孩子，右孩子的编号是 2i + 1；否则，节点无右孩子。\r\n\r\n+ 对于一颗 n 个节点的完全二叉树的节点按层自左向右编号，1 ~ n/2 范围的节点都是有孩子节点的非叶子结点，其余的节点全部都是叶子结点。编号为 n/2 的节点有可能只有左节点，也可能既有左节点，又有右节点。\r\n\r\n\r\n\r\n### 选择排序\r\n\r\n#### 直接选择排序\r\n\r\n需要经过 n - 1 趟比较\r\n\r\n第一趟比较：程序将记录定位在第一个数据上，拿第一个数据依次和它后面的每个数据进行比较，如果第一个数据大于后面某个数据，交换它们。。依此类推，经过第一趟比较，这组数据中最小的数据被选出来，它被排在第一位。\r\n\r\n第二趟比较：程序将记录定位在第二个数据上，拿第二个数据依次和它后面每个数据进行比较，如果第二个数据大于后面某个数据，交换它们。。依次类推，经过第二趟比较，这组数据中第二小的数据被选出，它排在第二位\r\n\r\n。。\r\n\r\n按此规则一共进行 n-1 趟比较，这组数据中第 n - 1小（第二大）的数据被选出，被排在第 n -1 位（倒数第一位）；剩下的就是最大的数据，它排在最后。\r\n\r\n直接选择排序的优点就是算法简单，容易实现，缺点就是每趟只能确定一个元素，n个数组需要进行 n-1 趟比较。\r\n\r\n#### 堆排序\r\n\r\n+ 建堆\r\n+ 拿堆的根节点和最后一个节点交换\r\n\r\n### 交换排序\r\n\r\n#### 冒泡排序\r\n\r\n第一趟：依次比较0和1，1和2，2和3 ... n-2 和 n - 1 索引的元素，如果发现第一个数据大于后一个数据，交换它们，经过第一趟，最大的元素排到了最后。\r\n\r\n第二趟：依次比较0和1，1和2，2和3 ... n-3 和 n - 2 索引的元素，如果发现第一个数据大于后一个数据，交换它们，经过第二趟，第二大的元素排到了倒数第二位\r\n\r\n。。\r\n\r\n第 n -1 趟：依次比较0和1元素，如果发现第一个数据大于后一个数据，交换它们，经过第 n - 1 趟，第二小的元素排到了第二位。\r\n\r\n#### 快速排序\r\n\r\n从待排的数据序列中任取一个数据作为分界值，所有比它小的数据元素一律放在左边，所有比他大的元素一律放在右边，这样一趟下来，该序列就分成了两个子序列，接下来对两个子序列进行递归，直到每个子序列只剩一个，排序完成。\r\n\r\n### 插入排序\r\n\r\n#### 直接插入排序\r\n\r\n依次将待排序的数据元素按其关键字值的大小插入前面的有序序列。\r\n\r\n#### 折半插入排序\r\n\r\n当第 i - 1 趟需要将第 i 个元素插入前面的 0 ~ i -1 个元素序列中时：\r\n\r\n+ 计算 0 ~ i - 1 索引的中间点，也就是用 i 索引处的元素和 （0 + i - 1）/2 索引处的元素进行比较，如果 i 索引处的元素大，就直接在 （（0 + i - 1）/2 ） ~ （i - 1）后半个范围内进行搜索，反之在前半个范围搜索。\r\n+ 重复上面步骤\r\n+ 确定第 i 个元素的插入位置，就将该位置的后面所有元素整体后移一位，然后将第 i 个元素放入该位置。\r\n', 1, 'post', 'publish', 'Java', 'Java', 18, 2, 1, 1, 1);
INSERT INTO `t_contents` VALUES (7, '初入RabbitMQ', NULL, 1543943613, 1543943613, '# 明确概念\r\n* Broker: 消息队列服务器实体\r\n* Exchange: 消息交换机,它指定消息按什么规则,路由到那个队列\r\n* Queue: 消息队列载体,每个消息都会被投入到一个或多个队列\r\n* Binding: 绑定. 他的作用就是吧exchange和queue按照路由规则绑定起来\r\n* Routing Key: 路由关键字,exchange根据这个关键字进行消息投递\r\n* vHost: 虚拟主机,一个broker里可以开设多个vhost,用作不同用户的权限分离\r\n* producer: 消息生产者,就是投递消息的程序\r\n* consumer: 消息消费者,就是接受消息的程序\r\n* channel: 消息通道,在客户端的每个链接里,可建立多个channel,每个channel代表一个回话任务\r\n\r\n# 几个模式\r\n## 队列模式 (direct)\r\n>需要将一个队列绑定到交换机上.要求该消息与一个特定的路由键完全匹配.\r\n```\r\n/**\r\n*声明一个队列,指定交换机,路由key,和消息\r\n*/\r\n@Component\r\npublic class DirectProducer{\r\n    @Autowired\r\n    private RabbitTemplate rabbitTemplate;\r\n\r\n    public void directHello(){\r\n        String context = \"hello ....\";\r\n\r\n        rabbitTemplate.convertAndSend(\"direct_exchange\",\"hello\",context);\r\n    }\r\n}\r\n```\r\n```\r\n@Component\r\n@RabbitListener(bindings = @QueueBinding(\r\n        value = @Queue(value = \"dict_queue\",autoDelete = \"false\"),\r\n        exchange = @Exchange(value = \"direct_exchange\",type = ExchangeTypes.DIRECT),\r\n        //key = \"hi\" ---> 需要键完全匹配 为 hello,才会受到消息,这样是收不到的\r\n        key=\"hello\"\r\n\r\n    )\r\n)\r\npublic class DirectReceiver {\r\n\r\n    @RabbitHandler\r\n    public void receive(String message){\r\n        System.out.println(\"Receive: \" + message);\r\n    }\r\n}\r\n```\r\n## 发布订阅模式(Fanout). \r\n>将消息路由到所有与它绑定的Queue中\r\n```\r\n/**\r\n * 路由模式. 匹配指定的键的消息才能被处理\r\n */\r\n@Component\r\npublic class DirectProducer {\r\n\r\n    @Autowired\r\n    private RabbitTemplate rabbitTemplate;\r\n\r\n    public void directHello(){\r\n\r\n        String context = \"direct...\";\r\n\r\n        rabbitTemplate.convertAndSend(\"direct_exchange\",\"hello\",context);\r\n\r\n    }\r\n\r\n}\r\n```\r\n```\r\n/**\r\n * 发布订阅模式\r\n */\r\n@Component\r\n@RabbitListener(bindings = @QueueBinding(\r\n        value = @Queue(value = \"faA\",autoDelete = \"false\"),\r\n        exchange = @Exchange(value = \"faExchange\",type = ExchangeTypes.FANOUT)\r\n    )\r\n)\r\npublic class FanoutReceiver {\r\n\r\n    @RabbitHandler\r\n    public void receiver(String message){\r\n        System.out.println(\"Re1 : \"+message);\r\n    }\r\n}\r\n```\r\n```\r\n@Component\r\n@RabbitListener(bindings = @QueueBinding(\r\n        value = @Queue(value = \"faB\",autoDelete = \"false\"),\r\n        exchange = @Exchange(value = \"faExchange\",type = ExchangeTypes.FANOUT)\r\n    )\r\n)\r\npublic class FanoutReceiver2{\r\n    @RabbitHandler\r\n    public void receiver2(String message){\r\n        System.out.println(\"faB....\"+message);\r\n    }\r\n\r\n}\r\n```\r\n>注意. 发布订阅模式, 只需要绑定到相同的交换机上就可以同时发消息,但是消费端需要不同的队列,如果队列相同,则只会发一条\r\n\r\n## ', 1, 'post', 'draft', 'RabbitMQ', 'RabbitMQ', 2, 0, 1, 1, 1);

-- ----------------------------
-- Table structure for t_logs
-- ----------------------------
DROP TABLE IF EXISTS `t_logs`;
CREATE TABLE `t_logs`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `action` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `data` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `author_id` int(10) NULL DEFAULT NULL,
  `ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 37 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_logs
-- ----------------------------
INSERT INTO `t_logs` VALUES (1, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1496815277);
INSERT INTO `t_logs` VALUES (2, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1496815280);
INSERT INTO `t_logs` VALUES (3, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1496815318);
INSERT INTO `t_logs` VALUES (4, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1496815398);
INSERT INTO `t_logs` VALUES (5, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1496815482);
INSERT INTO `t_logs` VALUES (6, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1496815492);
INSERT INTO `t_logs` VALUES (7, '保存系统设置', '{\"site_keywords\":\"Blog\",\"site_description\":\"SpringBoot+Mybatis+thymeleaf 搭建的 Java 博客系统\",\"site_title\":\"Blog\",\"site_theme\":\"default\",\"allow_install\":\"\"}', 1, '0:0:0:0:0:0:0:1', 1496815955);
INSERT INTO `t_logs` VALUES (8, '保存系统设置', '{\"site_keywords\":\"Blog\",\"site_description\":\"SpringBoot+Mybatis+thymeleaf 搭建的 Java 博客系统\",\"site_title\":\"Blog\",\"site_theme\":\"default\",\"allow_install\":\"\"}', 1, '0:0:0:0:0:0:0:1', 1496815964);
INSERT INTO `t_logs` VALUES (9, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1496989015);
INSERT INTO `t_logs` VALUES (10, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1496989366);
INSERT INTO `t_logs` VALUES (11, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1497317863);
INSERT INTO `t_logs` VALUES (12, '保存系统设置', '{\"social_zhihu\":\"https://www.zhihu.com/people/tian-zhisheng/activities\",\"social_github\":\"https://github.com/zhisheng17\",\"social_twitter\":\"\",\"social_weibo\":\"\"}', 1, '0:0:0:0:0:0:0:1', 1497318696);
INSERT INTO `t_logs` VALUES (13, '修改个人信息', '{\"uid\":1,\"email\":\"1041218129@qq.com\",\"screenName\":\"admin\"}', 1, '0:0:0:0:0:0:0:1', 1497319220);
INSERT INTO `t_logs` VALUES (14, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1497319856);
INSERT INTO `t_logs` VALUES (15, '登录后台', NULL, 1, '127.0.0.1', 1497321561);
INSERT INTO `t_logs` VALUES (16, '登录后台', NULL, 1, '127.0.0.1', 1497322738);
INSERT INTO `t_logs` VALUES (17, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1497323446);
INSERT INTO `t_logs` VALUES (18, '删除文章', '2', 1, '0:0:0:0:0:0:0:1', 1497323495);
INSERT INTO `t_logs` VALUES (19, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1497427641);
INSERT INTO `t_logs` VALUES (20, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1497428250);
INSERT INTO `t_logs` VALUES (21, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1497428290);
INSERT INTO `t_logs` VALUES (22, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1497428556);
INSERT INTO `t_logs` VALUES (23, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1497674581);
INSERT INTO `t_logs` VALUES (24, '修改个人信息', '{\"uid\":1,\"email\":\"1041218129@qq.com\",\"screenName\":\"admin\"}', 1, '0:0:0:0:0:0:0:1', 1497674690);
INSERT INTO `t_logs` VALUES (25, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1497676623);
INSERT INTO `t_logs` VALUES (26, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1497683817);
INSERT INTO `t_logs` VALUES (27, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1497685128);
INSERT INTO `t_logs` VALUES (28, '登录后台', NULL, 1, '127.0.0.1', 1497689032);
INSERT INTO `t_logs` VALUES (29, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1543680104);
INSERT INTO `t_logs` VALUES (30, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1543681283);
INSERT INTO `t_logs` VALUES (31, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1543681292);
INSERT INTO `t_logs` VALUES (32, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1543937931);
INSERT INTO `t_logs` VALUES (33, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1543937935);
INSERT INTO `t_logs` VALUES (34, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1543942633);
INSERT INTO `t_logs` VALUES (35, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1543942636);
INSERT INTO `t_logs` VALUES (36, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1544100439);
INSERT INTO `t_logs` VALUES (37, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1544186877);
INSERT INTO `t_logs` VALUES (38, '登录后台', NULL, 1, '0:0:0:0:0:0:0:1', 1544187260);

-- ----------------------------
-- Table structure for t_metas
-- ----------------------------
DROP TABLE IF EXISTS `t_metas`;
CREATE TABLE `t_metas`  (
  `mid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `slug` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int(10) UNSIGNED NULL DEFAULT 0,
  `parent` int(10) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`mid`) USING BTREE,
  INDEX `slug`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_metas
-- ----------------------------
INSERT INTO `t_metas` VALUES (1, 'default', NULL, 'category', NULL, 0, 0);
INSERT INTO `t_metas` VALUES (6, 'my github', 'https://github.com/zhisheng17', 'link', 'http://www.54tianzhisheng.cn/img/avatar.png', 1, 0);
INSERT INTO `t_metas` VALUES (7, 'my website', 'http://www.54tianzhisheng.cn', 'link', 'http://www.54tianzhisheng.cn/img/avatar.png', 0, 0);
INSERT INTO `t_metas` VALUES (8, '随笔', '随笔', 'tag', NULL, 0, 0);
INSERT INTO `t_metas` VALUES (9, 'Java', 'Java', 'tag', NULL, 0, 0);
INSERT INTO `t_metas` VALUES (10, 'Java', 'Java', 'category', '有关Java的博客', 0, 0);
INSERT INTO `t_metas` VALUES (11, 'HashMap', 'HashMap', 'tag', NULL, 0, 0);
INSERT INTO `t_metas` VALUES (12, 'HashTable', 'HashTable', 'tag', NULL, 0, 0);
INSERT INTO `t_metas` VALUES (13, 'HashSet', 'HashSet', 'tag', NULL, 0, 0);
INSERT INTO `t_metas` VALUES (14, 'ConcurrentHashMap', 'ConcurrentHashMap', 'tag', NULL, 0, 0);
INSERT INTO `t_metas` VALUES (15, 'Pyspider', 'Pyspider', 'tag', NULL, 0, 0);
INSERT INTO `t_metas` VALUES (16, 'Python', 'Python', 'tag', NULL, 0, 0);
INSERT INTO `t_metas` VALUES (17, '爬虫', '爬虫', 'tag', NULL, 0, 0);
INSERT INTO `t_metas` VALUES (19, 'Python', 'Python', 'category', '有关Python的博客', 0, 0);
INSERT INTO `t_metas` VALUES (20, '随笔', NULL, 'category', NULL, 0, 0);
INSERT INTO `t_metas` VALUES (21, 'RabbitMQ', NULL, 'category', NULL, 0, 0);
INSERT INTO `t_metas` VALUES (22, 'RabbitMQ', 'RabbitMQ', 'tag', NULL, 0, 0);

-- ----------------------------
-- Table structure for t_options
-- ----------------------------
DROP TABLE IF EXISTS `t_options`;
CREATE TABLE `t_options`  (
  `name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_options
-- ----------------------------
INSERT INTO `t_options` VALUES ('allow_install', '', '');
INSERT INTO `t_options` VALUES ('site_description', 'SpringBoot+Mybatis+thymeleaf 搭建的 Java 博客系统', NULL);
INSERT INTO `t_options` VALUES ('site_keywords', 'Blog', NULL);
INSERT INTO `t_options` VALUES ('site_theme', 'default', NULL);
INSERT INTO `t_options` VALUES ('site_title', 'Blog', '');
INSERT INTO `t_options` VALUES ('social_github', 'https://github.com/zhisheng17', NULL);
INSERT INTO `t_options` VALUES ('social_twitter', '', NULL);
INSERT INTO `t_options` VALUES ('social_weibo', '', NULL);
INSERT INTO `t_options` VALUES ('social_zhihu', 'https://www.zhihu.com/people/tian-zhisheng/activities', NULL);

-- ----------------------------
-- Table structure for t_relationships
-- ----------------------------
DROP TABLE IF EXISTS `t_relationships`;
CREATE TABLE `t_relationships`  (
  `cid` int(10) UNSIGNED NOT NULL,
  `mid` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`cid`, `mid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_relationships
-- ----------------------------
INSERT INTO `t_relationships` VALUES (3, 9);
INSERT INTO `t_relationships` VALUES (3, 10);
INSERT INTO `t_relationships` VALUES (4, 9);
INSERT INTO `t_relationships` VALUES (4, 10);
INSERT INTO `t_relationships` VALUES (4, 11);
INSERT INTO `t_relationships` VALUES (4, 12);
INSERT INTO `t_relationships` VALUES (4, 13);
INSERT INTO `t_relationships` VALUES (4, 14);
INSERT INTO `t_relationships` VALUES (5, 1);
INSERT INTO `t_relationships` VALUES (5, 15);
INSERT INTO `t_relationships` VALUES (5, 16);
INSERT INTO `t_relationships` VALUES (5, 17);
INSERT INTO `t_relationships` VALUES (6, 9);
INSERT INTO `t_relationships` VALUES (6, 10);
INSERT INTO `t_relationships` VALUES (7, 21);
INSERT INTO `t_relationships` VALUES (7, 22);

-- ----------------------------
-- Table structure for t_users
-- ----------------------------
DROP TABLE IF EXISTS `t_users`;
CREATE TABLE `t_users`  (
  `uid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `home_url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `screen_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created` int(10) UNSIGNED NULL DEFAULT 0,
  `activated` int(10) UNSIGNED NULL DEFAULT 0,
  `logged` int(10) UNSIGNED NULL DEFAULT 0,
  `group_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'visitor',
  PRIMARY KEY (`uid`) USING BTREE,
  UNIQUE INDEX `name`(`username`) USING BTREE,
  UNIQUE INDEX `mail`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_users
-- ----------------------------
INSERT INTO `t_users` VALUES (1, 'admin', 'a66abb5684c45962d887564f08346e8d', '1041218129@qq.com', NULL, 'admin', 1490756162, 0, 0, 'visitor');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `age` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
