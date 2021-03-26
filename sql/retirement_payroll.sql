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

 Date: 26/03/2021 15:35:21
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
) ENGINE = InnoDB AUTO_INCREMENT = 69117 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '离退休工资单管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of retirement_payroll
-- ----------------------------
INSERT INTO `retirement_payroll` VALUES (69116, 297, '00054', '2016-07-01', '7319221', 1, '2021-03-26 15:14:51', 1, '2021-03-25 17:20:57', 1, '2021-03-26 15:14:51', 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 7319249 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '离退休工资数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of retirement_payroll_item
-- ----------------------------
INSERT INTO `retirement_payroll_item` VALUES (7319235, 69116, '统筹支付', '1855.1');
INSERT INTO `retirement_payroll_item` VALUES (7319236, 69116, '院应付', '8337');
INSERT INTO `retirement_payroll_item` VALUES (7319237, 69116, '防暑降温费', '240');
INSERT INTO `retirement_payroll_item` VALUES (7319238, 69116, '电费', '2');
INSERT INTO `retirement_payroll_item` VALUES (7319239, 69116, '水费', '0');
INSERT INTO `retirement_payroll_item` VALUES (7319240, 69116, '房租', '0');
INSERT INTO `retirement_payroll_item` VALUES (7319241, 69116, '综合', '5');
INSERT INTO `retirement_payroll_item` VALUES (7319242, 69116, '卫视', '5');
INSERT INTO `retirement_payroll_item` VALUES (7319243, 69116, '卫生', '3');
INSERT INTO `retirement_payroll_item` VALUES (7319244, 69116, '物业总扣款', '15');
INSERT INTO `retirement_payroll_item` VALUES (7319245, 69116, '其他扣款', '0');
INSERT INTO `retirement_payroll_item` VALUES (7319246, 69116, '扣款合计', '15');
INSERT INTO `retirement_payroll_item` VALUES (7319247, 69116, '备用费用', '0');
INSERT INTO `retirement_payroll_item` VALUES (7319248, 69116, '实发合计', '8562');

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
) ENGINE = MyISAM AUTO_INCREMENT = 219 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (218, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-26 15:10:33', NULL, 0);
INSERT INTO `sys_log` VALUES (217, '', '/retirement/payroll/index/payDetail', 'GET', '0:0:0:0:0:0:0:1', '{\"id\":[\"69116\"]}', 'payDetail', 2, 1, 297, NULL, '2021-03-26 14:50:45', ' <br/>### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'FROM retirement_payroll rpr LEFT JOIN sys_user_info sui ON rpr.user_id = sui.id \' at line 1 <br/>### The error may exist in com/github/fashionbrot/core/mapper/RetirementPayrollMapper.java (best guess) <br/>### The error may involve com.github.fashionbrot.core.mapper.RetirementPayrollMapper.selectAllById-Inline <br/>### The error occurred while setting parameters <br/>### SQL: SELECT rpr.id,sui.department,sui.real_name AS realName,rpr.personnel_number AS personnelNumber,LEFT(rpr.pay_date, 7) AS payDate, FROM retirement_payroll rpr LEFT JOIN sys_user_info sui ON rpr.user_id = sui.id WHERE rpr.id=? <br/>### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL', 0);
INSERT INTO `sys_log` VALUES (215, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"110102192101252315\"],\"password\":[\"252315\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-26 14:46:59', NULL, 0);
INSERT INTO `sys_log` VALUES (216, '', '/retirement/payroll/index/payDetail', 'GET', '0:0:0:0:0:0:0:1', '{\"id\":[\"69116\"]}', 'payDetail', 2, 1, 297, NULL, '2021-03-26 14:50:35', ' <br/>### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'FROM retirement_payroll rpr LEFT JOIN sys_user_info sui ON rpr.user_id = sui.id \' at line 1 <br/>### The error may exist in com/github/fashionbrot/core/mapper/RetirementPayrollMapper.java (best guess) <br/>### The error may involve com.github.fashionbrot.core.mapper.RetirementPayrollMapper.selectAllById-Inline <br/>### The error occurred while setting parameters <br/>### SQL: SELECT rpr.id,sui.department,sui.real_name AS realName,rpr.personnel_number AS personnelNumber,LEFT(rpr.pay_date, 7) AS payDate, FROM retirement_payroll rpr LEFT JOIN sys_user_info sui ON rpr.user_id = sui.id WHERE rpr.id=? <br/>### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL', 0);
INSERT INTO `sys_log` VALUES (214, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-26 14:36:15', NULL, 0);
INSERT INTO `sys_log` VALUES (213, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"110102192101252315\"],\"password\":[\"252315\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-25 17:26:20', NULL, 0);
INSERT INTO `sys_log` VALUES (212, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-25 17:20:05', NULL, 0);
INSERT INTO `sys_log` VALUES (211, '离退休工资管理-查询离退休人员工资列表', '/retirement/payroll/queryAll', 'POST', '0:0:0:0:0:0:0:1', '{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"],\"deptId\":[\"\"],\"parentId\":[\"\"],\"department\":[\"\"],\"realName\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"]}', 'queryAll', 2, 1, 1, NULL, '2021-03-25 10:49:54', 'Invalid bound statement (not found): com.github.fashionbrot.core.mapper.RetirementPayrollMapper.selectAll', 0);
INSERT INTO `sys_log` VALUES (210, '离退休工资管理-查询离退休人员工资列表', '/retirement/payroll/queryAll', 'POST', '0:0:0:0:0:0:0:1', '{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"],\"deptId\":[\"\"],\"parentId\":[\"\"],\"department\":[\"\"],\"realName\":[\"\"],\"params[beginTime]\":[\"\"],\"params[endTime]\":[\"\"]}', 'queryAll', 2, 1, 1, NULL, '2021-03-25 10:46:56', 'Invalid bound statement (not found): com.github.fashionbrot.core.mapper.RetirementPayrollMapper.selectAll', 0);
INSERT INTO `sys_log` VALUES (209, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-25 10:46:38', NULL, 0);
INSERT INTO `sys_log` VALUES (208, '', '/system/user//queryAll', 'POST', '0:0:0:0:0:0:0:1', '{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"],\"deptId\":[\"\"],\"parentId\":[\"\"],\"identityCard\":[\"\"],\"realName\":[\"张三\"]}', 'queryAll', 2, 1, 1, NULL, '2021-03-25 10:01:53', '\r\n### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'张三\' in \'where clause\'\r\n### The error may exist in file [D:\\workspace\\retirement-pay\\core\\target\\classes\\com\\github\\fashionbrot\\core\\mapper\\xml\\UserInfoMapper.xml]\r\n### The error may involve com.github.fashionbrot.core.mapper.UserInfoMapper.queryAll-Inline\r\n### The error occurred while setting parameters\r\n### SQL: SELECT count(0) FROM sys_user_info a LEFT JOIN sys_user_role_relation b ON a.id = b.user_id LEFT JOIN sys_role_info c ON c.id = b.role_id WHERE a.del_flag = 0 AND a.real_name LIKE CONCAT(\'%\', 张三, \'%\')\r\n### Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'张三\' in \'where clause\'\n; bad SQL grammar []; nested exception is com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: Unknown column \'张三\' in \'where clause\'', 0);
INSERT INTO `sys_log` VALUES (207, '', '/system/user//queryAll', 'POST', '0:0:0:0:0:0:0:1', '{\"pageSize\":[\"10\"],\"pageNum\":[\"1\"],\"orderByColumn\":[\"createTime\"],\"isAsc\":[\"desc\"],\"deptId\":[\"\"],\"parentId\":[\"\"],\"identityCard\":[\"\"],\"realName\":[\"\"]}', 'queryAll', 2, 1, 1, NULL, '2021-03-25 09:56:00', ' <br/>### Error querying database.  Cause: com.mysql.jdbc.exceptions.jdbc4.MySQLSyntaxErrorException: You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near \'\'%\') <br/>              <br/>              <br/>                AND a.real_name like CONCAT(\'%\'\' at line 22 <br/>### The error may exist in file [D:\\workspace\\retirement-pay\\core\\target\\classes\\com\\github\\fashionbrot\\core\\mapper\\xml\\UserInfoMapper.xml] <br/>### The error may involve com.github.fashionbrot.core.mapper.UserInfoMapper.queryAll-Inline <br/>### The error occurred while setting parameters <br/>### SQL: select count(0) from (SELECT             a.super_admin,             a.id,             a.user_name,             a.real_name,             a.identity_card,             a.department,             a.`password`,             a.create_date,             a.`status`,             a.last_login_time,             a.update_date,             c.role_name,        ', 0);
INSERT INTO `sys_log` VALUES (206, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-25 09:55:52', NULL, 0);
INSERT INTO `sys_log` VALUES (205, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-25 09:23:30', NULL, 0);
INSERT INTO `sys_log` VALUES (204, '', '/system/user/doLogin', 'POST', '0:0:0:0:0:0:0:1', '{\"username\":[\"admin\"],\"password\":[\"admin123\"],\"rememberMe\":[\"false\"]}', 'login', 1, 1, NULL, NULL, '2021-03-25 08:51:47', NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 56 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单表' ROW_FORMAT = Dynamic;

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
INSERT INTO `sys_menu` VALUES (54, '权限列表-查看详情', 3, '/retirement/payroll/index/payDetail', 51, 604, 'system:payroll:index:detail', 'menuItem', 0, 1, '', 1, '2021-03-23 10:46:57', 1, '2021-03-23 10:47:17', 0);
INSERT INTO `sys_menu` VALUES (55, '修改密码', 3, '', 0, 701, 'system:user:resetPwd', 'menuItem', 0, 1, '', 1, '2021-03-24 09:06:54', NULL, NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 80 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '菜单-角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu_role_relation
-- ----------------------------
INSERT INTO `sys_menu_role_relation` VALUES (1, 1, 34, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (2, 1, 35, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (13, 1, 36, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (14, 1, 37, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (15, 1, 38, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (16, 1, 39, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (17, 1, 40, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (18, 1, 41, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (3, 1, 42, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (4, 1, 43, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (19, 1, 44, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (20, 1, 45, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (21, 1, 46, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (22, 1, 47, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (23, 1, 48, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (8, 1, 49, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (9, 1, 50, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (34, 1, 51, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (35, 1, 52, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (36, 1, 53, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (37, 1, 54, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (38, 1, 55, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (45, 1, 56, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (46, 1, 57, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (47, 1, 58, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (48, 1, 59, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (49, 1, 60, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (50, 1, 61, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (51, 1, 62, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (52, 1, 63, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (53, 1, 64, 1, '2021-03-22 15:56:16');
INSERT INTO `sys_menu_role_relation` VALUES (50, 2, 76, 1, '2021-03-24 09:07:12');
INSERT INTO `sys_menu_role_relation` VALUES (51, 2, 77, 1, '2021-03-24 09:07:12');
INSERT INTO `sys_menu_role_relation` VALUES (54, 2, 78, 1, '2021-03-24 09:07:12');
INSERT INTO `sys_menu_role_relation` VALUES (55, 2, 79, 1, '2021-03-24 09:07:12');

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
INSERT INTO `sys_role_info` VALUES (1, NULL, '管理员', 1, 1, '2021-03-08 15:32:11', 1, '2021-03-22 15:56:16', 0);
INSERT INTO `sys_role_info` VALUES (2, NULL, '普通员工', 1, 1, '2021-03-08 15:32:24', 1, '2021-03-24 09:07:12', 0);

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
  `status` tinyint(2) NOT NULL DEFAULT 1 COMMENT '用户状态',
  `super_admin` tinyint(1) NULL DEFAULT 0 COMMENT '是否是超级管理员 1超级 0普通',
  `last_login_time` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_id` bigint(11) NOT NULL COMMENT '创建者id',
  `create_date` datetime(0) NOT NULL COMMENT '创建时间',
  `update_id` bigint(11) NULL DEFAULT NULL COMMENT '最近更新者id',
  `update_date` datetime(0) NULL DEFAULT NULL COMMENT '最近更新时间',
  `del_flag` tinyint(1) NULL DEFAULT 0 COMMENT '删除标志位 1删除 0未删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `index_del_flag`(`del_flag`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 298 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_info
-- ----------------------------
INSERT INTO `sys_user_info` VALUES (1, 'admin', '电子所', 'admin', '管理员', 'e984d05048ac07c56121fa2808894ddf', 'b09f050687cc631d9515d416d09b17e4', 1, 1, '2021-03-26 15:10:32', 1, '2020-09-11 23:40:18', 1, '2021-03-08 15:32:52', 0);
INSERT INTO `sys_user_info` VALUES (297, '张宏勋', '标准所', '110102192101252315', '张宏勋', 'b8ea92f0a0b80707e4b71b27f511d536', '6b44747daf914082ef3b3871d9d21753', 1, 0, '2021-03-26 14:46:59', 1, '2021-03-25 17:20:57', NULL, NULL, 0);

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
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户-角色关系表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role_relation
-- ----------------------------
INSERT INTO `sys_user_role_relation` VALUES (1, 1, 1, 1, '2021-03-08 15:32:52', 0);
INSERT INTO `sys_user_role_relation` VALUES (11, 297, 2, 1, '2021-03-25 17:20:57', 0);

SET FOREIGN_KEY_CHECKS = 1;
