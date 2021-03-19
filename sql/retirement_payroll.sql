/*
 Navicat Premium Data Transfer

 Source Server         : 互联网测试环境-192.168.80.158
 Source Server Type    : MySQL
 Source Server Version : 50731
 Source Host           : 192.168.80.158:3306
 Source Schema         : retirement_payroll

 Target Server Type    : MySQL
 Target Server Version : 50731
 File Encoding         : 65001

 Date: 19/03/2021 17:05:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for retirement_payroll
-- ----------------------------
DROP TABLE IF EXISTS `retirement_payroll`;
CREATE TABLE `retirement_payroll`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint(11) NULL DEFAULT NULL COMMENT '用户id',
  `identity_card` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `personnel_number` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '人员编号',
  `pay_date` date NULL DEFAULT NULL COMMENT '支付日期',
  `retirement_type_id` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '离退休分类id',
  `view` bigint(1) NULL DEFAULT 0 COMMENT '是否查看 1：已查看；0：未查看',
  `view_date` datetime(0) NULL DEFAULT NULL COMMENT '查看日期',
  `create_id` bigint(11) NULL DEFAULT NULL COMMENT '创建人id',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_id` bigint(11) NULL DEFAULT NULL COMMENT '修改人id',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改日期',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标志位 1删除 0未删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '离退休工资单管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of retirement_payroll
-- ----------------------------
INSERT INTO `retirement_payroll` VALUES (28618, NULL, '110102193512132726', '1404250061', '2014-06-06', 'c199fd5d58bd4fd990a951ce3ebe35bb', 1, NULL, NULL, '2021-03-05 01:12:11', NULL, NULL, 0);
INSERT INTO `retirement_payroll` VALUES (28619, NULL, '110108193806266023', '1404250062', '2014-06-03', 'c199fd5d58bd4fd990a951ce3ebe35bb', 0, NULL, NULL, '2021-03-05 01:12:12', NULL, NULL, 0);

-- ----------------------------
-- Table structure for retirement_payroll_item
-- ----------------------------
DROP TABLE IF EXISTS `retirement_payroll_item`;
CREATE TABLE `retirement_payroll_item`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `retirement_payroll_id` bigint(11) NOT NULL COMMENT '离退休工资单id',
  `pay_item` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付名称',
  `pay_result` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '支付金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7319221 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '离退休工资数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of retirement_payroll_item
-- ----------------------------
INSERT INTO `retirement_payroll_item` VALUES (1, 28618, '公积金', '2000');
INSERT INTO `retirement_payroll_item` VALUES (2, 28618, '退休工资', '50900');

-- ----------------------------
-- Table structure for retirement_type
-- ----------------------------
DROP TABLE IF EXISTS `retirement_type`;
CREATE TABLE `retirement_type`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `retirement_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '离退休工资分类名称',
  `default_flag` int(1) NULL DEFAULT NULL COMMENT '当前默认 1：当前默认',
  `create_id` bigint(11) NULL DEFAULT NULL COMMENT '创建id',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `del_flag` int(1) NULL DEFAULT 0 COMMENT '删除标志位 1删除 0未删除',
  `update_id` bigint(11) NULL DEFAULT NULL COMMENT '修改id',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '修改日期',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7319224 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '离退休分类表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of retirement_type
-- ----------------------------
INSERT INTO `retirement_type` VALUES (7319221, '离休', 1, 1, '2021-03-10 15:16:01', 0, 1, '2021-03-12 14:44:23');
INSERT INTO `retirement_type` VALUES (7319222, '企业退休', 0, 1, '2021-03-10 16:09:47', 0, NULL, NULL);
INSERT INTO `retirement_type` VALUES (7319223, '事业退休', 0, 1, '2021-03-10 16:10:06', 0, NULL, NULL);

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `request_desc` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求描述',
  `request_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求url',
  `request_method` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求方法',
  `request_ip` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求ip',
  `request_param` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求参数',
  `target_method` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '接口方法',
  `log_type` tinyint(1) NOT NULL COMMENT '1 请求日志 2:异常日志',
  `interface_type` tinyint(1) NOT NULL COMMENT '接口类型 1:后台日志 2:机构后台日志 3:web 端日志',
  `create_id` bigint(20) NULL DEFAULT NULL COMMENT '创建者id',
  `create_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '操作者',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `exception` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '异常日志',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志位 1删除 0未删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_del_flagAndinterface_type`(`del_flag`, `interface_type`) USING BTREE,
  INDEX `index_create_id`(`create_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 95 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (57, '', '/retirement/type/update', 'POST', '0:0:0:0:0:0:0:1', '[{\"delFlag\":0,\"id\":7319221,\"retirementName\":\"离休1\",\"updateDate\":1615531188644,\"updateId\":1}]', 'update', 1, 1, 1, NULL, '2021-03-12 14:39:51', NULL, 0);
INSERT INTO `sys_log` VALUES (56, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-12 14:11:58', NULL, 0);
INSERT INTO `sys_log` VALUES (54, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-11 18:36:54', NULL, 0);
INSERT INTO `sys_log` VALUES (55, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-12 09:17:11', NULL, 0);
INSERT INTO `sys_log` VALUES (53, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-11 17:59:00', NULL, 0);
INSERT INTO `sys_log` VALUES (52, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, 1, NULL, '2021-03-11 10:51:00', NULL, 0);
INSERT INTO `sys_log` VALUES (50, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-11 10:04:44', NULL, 0);
INSERT INTO `sys_log` VALUES (51, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-11 10:41:51', NULL, 0);
INSERT INTO `sys_log` VALUES (48, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-10 16:16:48', NULL, 0);
INSERT INTO `sys_log` VALUES (49, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-10 16:55:39', NULL, 0);
INSERT INTO `sys_log` VALUES (47, '离退休分类表-数据列表—分页', '/retirement/type/queryAll', 'POST', '0:0:0:0:0:0:0:1', '{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', 'queryAll', 2, 1, 1, NULL, '2021-03-10 15:56:56', 'nested exception is org.apache.ibatis.executor.ExecutorException: No constructor found in com.github.fashionbrot.core.entity.RetirementTypeEntity matching [java.lang.Long, java.lang.String, java.lang.Integer, java.lang.Long, java.sql.Timestamp, java.lang.Long, java.sql.Timestamp, java.lang.Integer]', 0);
INSERT INTO `sys_log` VALUES (46, '离退休分类表-数据列表—分页', '/retirement/type/queryAll', 'POST', '0:0:0:0:0:0:0:1', '{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', 'queryAll', 2, 1, 1, NULL, '2021-03-10 15:50:04', 'nested exception is org.apache.ibatis.executor.ExecutorException: No constructor found in com.github.fashionbrot.core.entity.RetirementTypeEntity matching [java.lang.Long, java.lang.String, java.lang.Integer, java.lang.Long, java.sql.Timestamp, java.lang.Long, java.sql.Timestamp, java.lang.Integer]', 0);
INSERT INTO `sys_log` VALUES (45, '离退休分类表-数据列表—分页', '/retirement/type/queryAll', 'POST', '0:0:0:0:0:0:0:1', '{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', 'queryAll', 2, 1, 1, NULL, '2021-03-10 15:49:51', 'nested exception is org.apache.ibatis.executor.ExecutorException: No constructor found in com.github.fashionbrot.core.entity.RetirementTypeEntity matching [java.lang.Long, java.lang.String, java.lang.Integer, java.lang.Long, java.sql.Timestamp, java.lang.Long, java.sql.Timestamp, java.lang.Integer]', 0);
INSERT INTO `sys_log` VALUES (44, '离退休分类表-数据列表—分页', '/retirement/type/queryAll', 'POST', '0:0:0:0:0:0:0:1', '{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', 'queryAll', 2, 1, 1, NULL, '2021-03-10 15:49:11', 'nested exception is org.apache.ibatis.executor.ExecutorException: No constructor found in com.github.fashionbrot.core.entity.RetirementTypeEntity matching [java.lang.Long, java.lang.String, java.lang.Integer, java.lang.Long, java.sql.Timestamp, java.lang.Long, java.sql.Timestamp, java.lang.Integer]', 0);
INSERT INTO `sys_log` VALUES (43, '离退休分类表-数据列表—分页', '/retirement/type/queryAll', 'POST', '0:0:0:0:0:0:0:1', '{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', 'queryAll', 2, 1, 1, NULL, '2021-03-10 15:47:30', 'nested exception is org.apache.ibatis.executor.ExecutorException: No constructor found in com.github.fashionbrot.core.entity.RetirementTypeEntity matching [java.lang.Long, java.lang.String, java.lang.Integer, java.lang.Long, java.sql.Timestamp, java.lang.Long, java.sql.Timestamp, java.lang.Integer]', 0);
INSERT INTO `sys_log` VALUES (42, '离退休分类表-数据列表—分页', '/retirement/type/queryAll', 'POST', '0:0:0:0:0:0:0:1', '{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', 'queryAll', 2, 1, 1, NULL, '2021-03-10 15:46:47', 'nested exception is org.apache.ibatis.executor.ExecutorException: No constructor found in com.github.fashionbrot.core.entity.RetirementTypeEntity matching [java.lang.Long, java.lang.String, java.lang.Integer, java.lang.Long, java.sql.Timestamp, java.lang.Long, java.sql.Timestamp, java.lang.Integer]', 0);
INSERT INTO `sys_log` VALUES (41, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-10 15:46:44', NULL, 0);
INSERT INTO `sys_log` VALUES (40, '离退休分类表-数据列表—分页', '/retirement/type/queryAll', 'POST', '0:0:0:0:0:0:0:1', '{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', 'queryAll', 2, 1, 1, NULL, '2021-03-10 15:17:33', 'nested exception is org.apache.ibatis.executor.ExecutorException: No constructor found in com.github.fashionbrot.core.entity.RetirementTypeEntity matching [java.lang.Long, java.lang.String, java.lang.Integer, java.lang.Long, java.sql.Timestamp, java.lang.Long, java.sql.Timestamp, java.lang.Integer]', 0);
INSERT INTO `sys_log` VALUES (39, '离退休分类表-数据列表—分页', '/retirement/type/queryAll', 'POST', '0:0:0:0:0:0:0:1', '{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', 'queryAll', 2, 1, 1, NULL, '2021-03-10 15:17:27', 'nested exception is org.apache.ibatis.executor.ExecutorException: No constructor found in com.github.fashionbrot.core.entity.RetirementTypeEntity matching [java.lang.Long, java.lang.String, java.lang.Integer, java.lang.Long, java.sql.Timestamp, java.lang.Long, java.sql.Timestamp, java.lang.Integer]', 0);
INSERT INTO `sys_log` VALUES (38, '离退休分类表-数据列表—分页', '/retirement/type/queryAll', 'POST', '0:0:0:0:0:0:0:1', '{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', 'queryAll', 2, 1, 1, NULL, '2021-03-10 15:16:01', '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'update_id\' in \'field list\'\r\n### The error may exist in com/github/fashionbrot/core/mapper/RetirementTypeMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT  id,retirement_name,default_flag,create_id,create_date,update_id,update_date,del_flag  FROM retirement_type  WHERE  del_flag=0 LIMIT ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'update_id\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'update_id\' in \'field list\'', 0);
INSERT INTO `sys_log` VALUES (36, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-10 15:13:52', NULL, 0);
INSERT INTO `sys_log` VALUES (37, '离退休分类表-新增', '/retirement/type/add', 'POST', '0:0:0:0:0:0:0:1', '{\"retirementName\":[\"离休\"]}', 'add', 2, 1, 1, NULL, '2021-03-10 15:14:31', '\r\n### Error updating database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'create_id\' in \'field list\'\r\n### The error may involve com.github.fashionbrot.core.mapper.RetirementTypeMapper.insert-Inline\r\n### The error occurred while setting parameters\r\n### SQL: INSERT INTO retirement_type  ( retirement_name, default_flag, create_id, create_date,   del_flag )  VALUES  ( ?, ?, ?, ?,   ? )\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'create_id\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'create_id\' in \'field list\'', 0);
INSERT INTO `sys_log` VALUES (35, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-10 14:26:40', NULL, 0);
INSERT INTO `sys_log` VALUES (34, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-10 14:13:56', NULL, 0);
INSERT INTO `sys_log` VALUES (58, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-12 14:44:09', NULL, 0);
INSERT INTO `sys_log` VALUES (59, '离退休分类表-修改离退休名称', '/retirement/type/update', 'POST', '0:0:0:0:0:0:0:1', '[{\"delFlag\":0,\"id\":7319221,\"retirementName\":\"离休\",\"updateDate\":1615531462505,\"updateId\":1}]', 'update', 1, 1, 1, NULL, '2021-03-12 14:44:25', NULL, 0);
INSERT INTO `sys_log` VALUES (60, '离退休分类表-修改当前默认', '/retirement/type/updateDefaultFlag', 'POST', '0:0:0:0:0:0:0:1', '{\"id\":[\"7319221\"]}', 'updateDefaultFlag', 1, 1, 1, NULL, '2021-03-12 14:53:40', NULL, 0);
INSERT INTO `sys_log` VALUES (61, '离退休分类表-根据id删除', '/retirement/type/deleteById', 'POST', '0:0:0:0:0:0:0:1', '{\"id\":[\"7319223\"]}', 'deleteById', 1, 1, 1, NULL, '2021-03-12 14:53:58', NULL, 0);
INSERT INTO `sys_log` VALUES (62, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-12 15:41:13', NULL, 0);
INSERT INTO `sys_log` VALUES (63, '离退休分类表-根据id删除', '/retirement/type/deleteById', 'POST', '0:0:0:0:0:0:0:1', '{\"id\":[\"7319221\"]}', 'deleteById', 2, 1, 1, NULL, '2021-03-12 15:41:27', '该数据作为当前默认，不能删除', 0);
INSERT INTO `sys_log` VALUES (64, '离退休分类表-根据id删除', '/retirement/type/deleteById', 'POST', '0:0:0:0:0:0:0:1', '{\"id\":[\"7319221\"]}', 'deleteById', 2, 1, 1, NULL, '2021-03-12 15:41:44', '该数据作为当前默认，不能删除', 0);
INSERT INTO `sys_log` VALUES (65, '离退休分类表-修改当前默认', '/retirement/type/updateDefaultFlag', 'POST', '0:0:0:0:0:0:0:1', '{\"id\":[\"7319223\"]}', 'updateDefaultFlag', 1, 1, 1, NULL, '2021-03-12 15:45:45', NULL, 0);
INSERT INTO `sys_log` VALUES (66, '离退休分类表-修改当前默认', '/retirement/type/updateDefaultFlag', 'POST', '0:0:0:0:0:0:0:1', '{\"id\":[\"7319221\"]}', 'updateDefaultFlag', 1, 1, 1, NULL, '2021-03-12 15:51:59', NULL, 0);
INSERT INTO `sys_log` VALUES (67, '离退休分类表-根据id删除', '/retirement/type/deleteById', 'POST', '0:0:0:0:0:0:0:1', '{\"id\":[\"7319221\"]}', 'deleteById', 2, 1, 1, NULL, '2021-03-12 15:52:05', '该数据作为当前默认，不能删除', 0);
INSERT INTO `sys_log` VALUES (68, '离退休分类表-修改当前默认', '/retirement/type/updateDefaultFlag', 'POST', '0:0:0:0:0:0:0:1', '{\"id\":[\"7319223\"]}', 'updateDefaultFlag', 1, 1, 1, NULL, '2021-03-12 15:52:07', NULL, 0);
INSERT INTO `sys_log` VALUES (69, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-12 16:22:14', NULL, 0);
INSERT INTO `sys_log` VALUES (70, '', '/system/menu/update', 'POST', '0:0:0:0:0:0:0:1', '[{\"active\":0,\"checked\":false,\"code\":\"retirement:payroll:index\",\"delFlag\":0,\"icon\":\"fa fa-envelope-open-o\",\"id\":51,\"isRefresh\":0,\"menuLevel\":2,\"menuName\":\"工资列表\",\"menuUrl\":\"/retirement/payroll/index\",\"open\":false,\"parentMenuId\":50,\"priority\":601,\"target\":\"menuItem\",\"updateDate\":1615537382815,\"updateId\":1,\"visible\":\"0\"}]', 'update', 1, 1, 1, NULL, '2021-03-12 16:23:03', NULL, 0);
INSERT INTO `sys_log` VALUES (71, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-18 10:15:30', NULL, 0);
INSERT INTO `sys_log` VALUES (72, '离退休工资管理-查询离退休人员列表', '/retirement/payroll/queryAll', 'POST', '0:0:0:0:0:0:0:1', '{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', 'queryAll', 2, 1, 1, NULL, '2021-03-18 10:18:21', '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'create_id\' in \'field list\'\r\n### The error may exist in com/github/fashionbrot/core/mapper/RetirementPayrollMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(0) from (SELECT  id,user_id,identity_card,personnel_number,pay_date,retirement_type_id,view,view_date,create_id,create_date,update_id,update_date,del_flag  FROM retirement_payroll  WHERE  del_flag=0) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'create_id\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'create_id\' in \'field list\'', 0);
INSERT INTO `sys_log` VALUES (73, '离退休工资管理-查询离退休人员列表', '/retirement/payroll/queryAll', 'POST', '0:0:0:0:0:0:0:1', '{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"]}', 'queryAll', 2, 1, 1, NULL, '2021-03-18 10:19:02', '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'create_id\' in \'field list\'\r\n### The error may exist in com/github/fashionbrot/core/mapper/RetirementPayrollMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: select count(0) from (SELECT  id,user_id,identity_card,personnel_number,pay_date,retirement_type_id,view,view_date,create_id,create_date,update_id,update_date,del_flag  FROM retirement_payroll  WHERE  del_flag=0) tmp_count\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'create_id\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'create_id\' in \'field list\'', 0);
INSERT INTO `sys_log` VALUES (74, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-18 11:04:50', NULL, 0);
INSERT INTO `sys_log` VALUES (75, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-18 11:17:04', NULL, 0);
INSERT INTO `sys_log` VALUES (76, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-18 14:08:34', NULL, 0);
INSERT INTO `sys_log` VALUES (77, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-18 15:04:48', NULL, 0);
INSERT INTO `sys_log` VALUES (78, '', '/retirement/payroll/index/payDetail', 'GET', '0:0:0:0:0:0:0:1', '{\"id\":[\"28618\"]}', 'payDetail', 2, 1, 1, NULL, '2021-03-18 15:06:23', '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'create_id\' in \'field list\'\r\n### The error may exist in com/github/fashionbrot/core/mapper/RetirementPayrollItemMapper.java (best guess)\r\n### The error may involve defaultParameterMap\r\n### The error occurred while setting parameters\r\n### SQL: SELECT  id,retirement_payroll_id,pay_item,pay_result,unit,create_id,create_date,update_id,update_date,del_flag  FROM retirement_payroll_item  WHERE  del_flag=0   AND retirement_payroll_id = ?\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'create_id\' in \'field list\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'create_id\' in \'field list\'', 0);
INSERT INTO `sys_log` VALUES (79, '', '/retirement/payroll/index/payDetail', 'GET', '0:0:0:0:0:0:0:1', '{\"id\":[\"28618\"]}', 'payDetail', 2, 1, 1, NULL, '2021-03-18 15:08:37', 'java.lang.NullPointerException <br/>	at com.github.fashionbrot.core.service.impl.RetirementPayrollServiceImpl.queryDetail(RetirementPayrollServiceImpl.java:61) <br/>	at com.github.fashionbrot.console.controller.RetirementPayrollController.payDetail(RetirementPayrollController.java:38) <br/>	at com.github.fashionbrot.console.controller.RetirementPayrollController$$FastClassBySpringCGLIB$$abb6508c.invoke(<generated>) <br/>	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218) <br/>	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749) <br/>	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163) <br/>	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88) <br/>	at com.github.fashionbrot.console.aop.BackStageAspect.around(BackStageAspect.java:72) <br/>	at sun.reflect.NativeMethodAccessorIm', 0);
INSERT INTO `sys_log` VALUES (80, '', '/retirement/payroll/index/payDetail', 'GET', '0:0:0:0:0:0:0:1', '{\"id\":[\"28618\"]}', 'payDetail', 2, 1, 1, NULL, '2021-03-18 15:09:23', 'java.lang.NullPointerException <br/>	at com.github.fashionbrot.core.service.impl.RetirementPayrollServiceImpl.queryDetail(RetirementPayrollServiceImpl.java:61) <br/>	at com.github.fashionbrot.console.controller.RetirementPayrollController.payDetail(RetirementPayrollController.java:38) <br/>	at com.github.fashionbrot.console.controller.RetirementPayrollController$$FastClassBySpringCGLIB$$abb6508c.invoke(<generated>) <br/>	at org.springframework.cglib.proxy.MethodProxy.invoke(MethodProxy.java:218) <br/>	at org.springframework.aop.framework.CglibAopProxy$CglibMethodInvocation.invokeJoinpoint(CglibAopProxy.java:749) <br/>	at org.springframework.aop.framework.ReflectiveMethodInvocation.proceed(ReflectiveMethodInvocation.java:163) <br/>	at org.springframework.aop.aspectj.MethodInvocationProceedingJoinPoint.proceed(MethodInvocationProceedingJoinPoint.java:88) <br/>	at com.github.fashionbrot.console.aop.BackStageAspect.around(BackStageAspect.java:72) <br/>	at sun.reflect.NativeMethodAccessorIm', 0);
INSERT INTO `sys_log` VALUES (81, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-18 15:41:28', NULL, 0);
INSERT INTO `sys_log` VALUES (82, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-18 16:11:53', NULL, 0);
INSERT INTO `sys_log` VALUES (83, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-18 16:42:01', NULL, 0);
INSERT INTO `sys_log` VALUES (84, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-18 17:18:15', NULL, 0);
INSERT INTO `sys_log` VALUES (85, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-19 09:03:10', NULL, 0);
INSERT INTO `sys_log` VALUES (86, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-19 09:38:59', NULL, 0);
INSERT INTO `sys_log` VALUES (87, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, 1, NULL, '2021-03-19 09:50:03', NULL, 0);
INSERT INTO `sys_log` VALUES (88, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-19 10:27:53', NULL, 0);
INSERT INTO `sys_log` VALUES (89, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-19 10:59:48', NULL, 0);
INSERT INTO `sys_log` VALUES (90, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-19 14:09:44', NULL, 0);
INSERT INTO `sys_log` VALUES (91, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-19 15:20:16', NULL, 0);
INSERT INTO `sys_log` VALUES (92, '离退休分类表-修改当前默认', '/retirement/type/updateDefaultFlag', 'POST', '0:0:0:0:0:0:0:1', '{\"id\":[\"7319221\"]}', 'updateDefaultFlag', 1, 1, 1, NULL, '2021-03-19 15:20:41', NULL, 0);
INSERT INTO `sys_log` VALUES (93, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-19 15:54:14', NULL, 0);
INSERT INTO `sys_log` VALUES (94, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-19 16:29:47', NULL, 0);

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `menu_name` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '菜单名称',
  `menu_level` int(3) UNSIGNED NOT NULL COMMENT '菜单级别',
  `menu_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单url',
  `parent_menu_id` bigint(11) UNSIGNED NULL DEFAULT 0 COMMENT '父菜单id',
  `priority` int(5) UNSIGNED NOT NULL COMMENT '显示优先级',
  `code` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限code',
  `target` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT 'menuItem' COMMENT '打开方式（menuItem页签 menuBlank新窗口）',
  `visible` tinyint(1) NULL DEFAULT 0 COMMENT '菜单状态（0显示 1隐藏）',
  `is_refresh` tinyint(1) NULL DEFAULT 1 COMMENT '是否刷新（0刷新 1不刷新）',
  `icon` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_id` bigint(11) NULL DEFAULT NULL COMMENT '创建者id',
  `create_date` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_id` bigint(11) NULL DEFAULT NULL COMMENT '最近更新者id',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '最近更新时间',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志位 1删除 0未删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 54 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '用户管理', 1, '', 0, 100, '', 'menuItem', 0, 1, 'fa fa-user', NULL, '2019-12-08 13:29:27', 1, '2021-02-24 13:43:17', 0);
INSERT INTO `sys_menu` VALUES (2, '用户列表', 2, '/system/user/index', 1, 101, 'system:user:index', 'menuItem', 0, 1, 'fa fa-user', NULL, '2019-12-08 13:29:49', 1, '2021-03-01 14:12:19', 0);
INSERT INTO `sys_menu` VALUES (3, '菜单管理', 1, '', 0, 200, '', 'menuItem', 0, 1, 'fa fa-reorder', NULL, '2019-12-08 14:20:46', 1, '2021-02-24 13:44:37', 0);
INSERT INTO `sys_menu` VALUES (4, '菜单列表', 2, '/system/menu/index', 3, 201, 'system:menu:index', 'menuItem', 0, 1, '#', NULL, '2019-12-08 14:21:08', 1, '2021-03-01 14:23:46', 0);
INSERT INTO `sys_menu` VALUES (8, '权限管理', 1, '', 0, 400, '', 'menuItem', 0, 1, 'fa fa-user-secret', NULL, '2019-12-08 15:56:09', 1, '2021-03-05 17:31:55', 0);
INSERT INTO `sys_menu` VALUES (9, '权限列表', 2, '/system/role/index', 8, 401, 'system:role:index', 'menuItem', 0, 1, '#', NULL, '2019-12-08 15:56:37', 1, '2021-03-01 14:24:06', 0);
INSERT INTO `sys_menu` VALUES (13, '用户列表-修改密码', 3, '', 2, 102, 'system:user:resetPwd', 'menuItem', 0, 1, '#', 1, '2020-09-12 21:43:55', 1, '2021-02-24 11:48:55', 0);
INSERT INTO `sys_menu` VALUES (14, '用户列表-新增用户', 3, '', 2, 103, 'system:user:add', 'menuItem', 0, 1, '#', 1, '2020-09-12 21:45:05', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (15, '用户列表-编辑用户', 3, '', 2, 104, 'system:user:edit', 'menuItem', 0, 1, '#', 1, '2020-09-12 21:45:41', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (16, '用户列表-删除用户', 3, '', 2, 105, 'system:user:del', 'menuItem', 0, 1, '#', 1, '2020-09-12 21:54:11', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (17, '用户列表-更新用户', 3, '', 2, 106, 'system:user:update', 'menuItem', 0, 1, '#', 1, '2020-09-12 21:55:55', 1, '2020-09-12 22:39:10', 0);
INSERT INTO `sys_menu` VALUES (18, '用户列表-查询全部', 3, '', 2, 107, 'system:user:page', 'menuItem', 0, 1, '#', 1, '2020-09-12 21:56:51', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (19, '菜单列表-新增', 3, '', 4, 202, 'system:menu:add', 'menuItem', 0, 1, '#', 1, '2020-09-12 22:34:05', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (20, '菜单列表-更新', 3, '', 4, 203, 'system:menu:update', 'menuItem', 0, 1, '#', 1, '2020-09-12 22:35:35', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (21, '菜单列表-删除', 3, '', 4, 204, 'system:menu:del', 'menuItem', 0, 1, '#', 1, '2020-09-12 22:36:17', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (22, '菜单列表-查看详情', 3, '', 4, 205, 'system:menu:info', 'menuItem', 0, 1, '#', 1, '2020-09-12 22:37:23', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (23, '菜单列表-分页列表', 3, '', 4, 206, 'system:menu:page', 'menuItem', 0, 1, '#', 1, '2020-09-12 22:37:59', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (34, '权限列表-列表分页', 3, '', 9, 402, 'system:role:page', 'menuItem', 0, 1, '#', 1, '2020-09-12 23:32:52', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (35, '权限列表-查看详情', 3, '', 9, 403, 'system:role:info', 'menuItem', 0, 1, '#', 1, '2020-09-12 23:33:24', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (36, '权限列表-新增', 3, '', 9, 404, 'system:role:add', 'menuItem', 0, 1, '#', 1, '2020-09-12 23:33:56', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (37, '权限列表-更新', 3, '', 9, 405, 'system:role:update', 'menuItem', 0, 1, '#', 1, '2020-09-12 23:34:24', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (38, '权限列表-删除', 3, '', 9, 406, 'system:role:del', 'menuItem', 0, 1, '#', 1, '2020-09-12 23:35:00', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (45, '日志管理', 1, '', 0, 500, '', 'menuItem', 0, 1, 'fa fa-pencil-square', 1, '2021-02-24 10:30:33', 1, '2021-02-24 10:32:27', 0);
INSERT INTO `sys_menu` VALUES (46, '日志列表', 2, '/system/log/index', 45, 501, 'system:log:index', 'menuItem', 0, 0, 'fa fa-pencil-square-o', 1, '2021-02-24 10:32:08', 1, '2021-03-01 14:38:33', 0);
INSERT INTO `sys_menu` VALUES (47, '日志-删除', 3, '', 46, 502, 'system:log:del', 'menuItem', 0, 1, '', 1, '2021-02-24 15:20:12', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (48, '日志-查看详情', 3, '', 46, 503, 'system:log:index:detail', 'menuItem', 0, 1, '', 1, '2021-02-24 15:20:41', 1, '2021-03-01 14:37:59', 0);
INSERT INTO `sys_menu` VALUES (49, '日志-数据分页', 3, '', 46, 504, 'system:log:page', 'menuItem', 0, 1, '', 1, '2021-03-01 14:47:05', NULL, NULL, 0);
INSERT INTO `sys_menu` VALUES (50, '工资信息', 1, '', 0, 600, '', 'menuItem', 0, 0, 'fa fa-envelope-open', 1, '2021-03-08 15:28:28', 1, '2021-03-08 15:29:57', 0);
INSERT INTO `sys_menu` VALUES (51, '工资列表', 2, '/retirement/payroll/index', 50, 601, 'retirement:payroll:index', 'menuItem', 0, 0, 'fa fa-envelope-open-o', 1, '2021-03-08 15:31:25', 1, '2021-03-12 16:23:03', 0);
INSERT INTO `sys_menu` VALUES (52, '工资导入', 2, '/retirement/type/index', 50, 602, 'retirement:type:index', 'menuItem', 0, 0, 'fa fa-file-excel-o', 1, '2021-03-08 17:00:16', 1, '2021-03-09 14:37:24', 0);
INSERT INTO `sys_menu` VALUES (53, '权限列表-新增', 3, '/retirement/type/insert', 52, 603, 'retirement:type:insert', 'menuItem', 0, 1, '', 1, '2021-03-09 16:33:17', NULL, NULL, 0);

-- ----------------------------
-- Table structure for sys_menu_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu_role_relation`;
CREATE TABLE `sys_menu_role_relation`  (
  `menu_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `create_id` bigint(11) NOT NULL COMMENT '创建者id',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单-角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu_role_relation
-- ----------------------------
INSERT INTO `sys_menu_role_relation` VALUES (1, 1, 1, 1, '2021-03-08 15:32:11');
INSERT INTO `sys_menu_role_relation` VALUES (2, 1, 2, 1, '2021-03-08 15:32:11');
INSERT INTO `sys_menu_role_relation` VALUES (13, 1, 3, 1, '2021-03-08 15:32:11');
INSERT INTO `sys_menu_role_relation` VALUES (14, 1, 4, 1, '2021-03-08 15:32:11');
INSERT INTO `sys_menu_role_relation` VALUES (15, 1, 5, 1, '2021-03-08 15:32:11');
INSERT INTO `sys_menu_role_relation` VALUES (16, 1, 6, 1, '2021-03-08 15:32:11');
INSERT INTO `sys_menu_role_relation` VALUES (17, 1, 7, 1, '2021-03-08 15:32:11');
INSERT INTO `sys_menu_role_relation` VALUES (18, 1, 8, 1, '2021-03-08 15:32:11');
INSERT INTO `sys_menu_role_relation` VALUES (3, 1, 9, 1, '2021-03-08 15:32:11');
INSERT INTO `sys_menu_role_relation` VALUES (4, 1, 10, 1, '2021-03-08 15:32:11');
INSERT INTO `sys_menu_role_relation` VALUES (19, 1, 11, 1, '2021-03-08 15:32:11');
INSERT INTO `sys_menu_role_relation` VALUES (20, 1, 12, 1, '2021-03-08 15:32:11');
INSERT INTO `sys_menu_role_relation` VALUES (21, 1, 13, 1, '2021-03-08 15:32:11');
INSERT INTO `sys_menu_role_relation` VALUES (22, 1, 14, 1, '2021-03-08 15:32:11');
INSERT INTO `sys_menu_role_relation` VALUES (23, 1, 15, 1, '2021-03-08 15:32:11');
INSERT INTO `sys_menu_role_relation` VALUES (8, 1, 16, 1, '2021-03-08 15:32:11');
INSERT INTO `sys_menu_role_relation` VALUES (9, 1, 17, 1, '2021-03-08 15:32:12');
INSERT INTO `sys_menu_role_relation` VALUES (34, 1, 18, 1, '2021-03-08 15:32:12');
INSERT INTO `sys_menu_role_relation` VALUES (35, 1, 19, 1, '2021-03-08 15:32:12');
INSERT INTO `sys_menu_role_relation` VALUES (36, 1, 20, 1, '2021-03-08 15:32:12');
INSERT INTO `sys_menu_role_relation` VALUES (37, 1, 21, 1, '2021-03-08 15:32:12');
INSERT INTO `sys_menu_role_relation` VALUES (38, 1, 22, 1, '2021-03-08 15:32:12');
INSERT INTO `sys_menu_role_relation` VALUES (45, 1, 23, 1, '2021-03-08 15:32:12');
INSERT INTO `sys_menu_role_relation` VALUES (46, 1, 24, 1, '2021-03-08 15:32:12');
INSERT INTO `sys_menu_role_relation` VALUES (47, 1, 25, 1, '2021-03-08 15:32:12');
INSERT INTO `sys_menu_role_relation` VALUES (48, 1, 26, 1, '2021-03-08 15:32:12');
INSERT INTO `sys_menu_role_relation` VALUES (49, 1, 27, 1, '2021-03-08 15:32:12');
INSERT INTO `sys_menu_role_relation` VALUES (50, 1, 28, 1, '2021-03-08 15:32:12');
INSERT INTO `sys_menu_role_relation` VALUES (51, 1, 29, 1, '2021-03-08 15:32:12');
INSERT INTO `sys_menu_role_relation` VALUES (50, 2, 30, 1, '2021-03-08 15:32:24');
INSERT INTO `sys_menu_role_relation` VALUES (51, 2, 31, 1, '2021-03-08 15:32:24');

-- ----------------------------
-- Table structure for sys_role_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_info`;
CREATE TABLE `sys_role_info`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `role_code` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色标识',
  `role_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '角色描述',
  `status` int(2) NOT NULL COMMENT '权限状态',
  `create_id` bigint(11) NOT NULL COMMENT '创建者id',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_id` bigint(11) NULL DEFAULT NULL COMMENT '最近更新者id',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '最近更新时间',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志位 1删除 0未删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_info
-- ----------------------------
INSERT INTO `sys_role_info` VALUES (1, NULL, '管理员', 1, 1, '2021-03-08 15:32:11', NULL, NULL, 0);
INSERT INTO `sys_role_info` VALUES (2, NULL, '普通员工', 1, 1, '2021-03-08 15:32:24', NULL, NULL, 0);

-- ----------------------------
-- Table structure for sys_user_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_info`;
CREATE TABLE `sys_user_info`  (
  `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增ID',
  `user_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `department` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门',
  `identity_card` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '身份证号',
  `real_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '真实姓名',
  `password` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '加密密码',
  `salt` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码加盐参数',
  `status` tinyint(2) NOT NULL COMMENT '用户状态',
  `super_admin` tinyint(1) NULL DEFAULT 0 COMMENT '是否是超级管理员 1超级 0普通',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_id` bigint(11) NOT NULL COMMENT '创建者id',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_id` bigint(11) NULL DEFAULT NULL COMMENT '最近更新者id',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '最近更新时间',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志位 1删除 0未删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_info
-- ----------------------------
INSERT INTO `sys_user_info` VALUES (1, 'admin', '电子所', NULL, '管理员', 'e984d05048ac07c56121fa2808894ddf', 'b09f050687cc631d9515d416d09b17e4', 1, 1, '2021-03-19 16:29:46', 1, '2020-09-11 23:40:18', 1, '2021-03-08 15:32:52', 0);

-- ----------------------------
-- Table structure for sys_user_role_relation
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role_relation`;
CREATE TABLE `sys_user_role_relation`  (
  `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `create_id` bigint(11) NOT NULL COMMENT '创建者id',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志位 1删除 0未删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户-角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role_relation
-- ----------------------------
INSERT INTO `sys_user_role_relation` VALUES (1, 1, 1, 1, '2021-03-08 15:32:52', 0);

SET FOREIGN_KEY_CHECKS = 1;
