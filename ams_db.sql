/*
 Navicat Premium Data Transfer

 Source Server         : MySQL PHP - 7.4.11
 Source Server Type    : MySQL
 Source Server Version : 100414
 Source Host           : localhost:3306
 Source Schema         : ams_db

 Target Server Type    : MySQL
 Target Server Version : 100414
 File Encoding         : 65001

 Date: 03/03/2021 19:33:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for r_asset_library
-- ----------------------------
DROP TABLE IF EXISTS `r_asset_library`;
CREATE TABLE `r_asset_library`  (
  `al_id` int NOT NULL AUTO_INCREMENT,
  `al_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `al_description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `unit_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`al_id`) USING BTREE,
  INDEX `unit_id`(`unit_id`) USING BTREE,
  INDEX `category_id`(`category_id`) USING BTREE,
  CONSTRAINT `r_asset_library_ibfk_1` FOREIGN KEY (`unit_id`) REFERENCES `r_unit` (`unit_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `r_asset_library_ibfk_2` FOREIGN KEY (`category_id`) REFERENCES `r_category` (`category_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_asset_library
-- ----------------------------
INSERT INTO `r_asset_library` VALUES (1, 'Technology', 'Technology', 1, 1);
INSERT INTO `r_asset_library` VALUES (2, 'Bundle Supplies', '', 3, 2);
INSERT INTO `r_asset_library` VALUES (5, 'Piece Supplies', NULL, 1, 2);

-- ----------------------------
-- Table structure for r_assets
-- ----------------------------
DROP TABLE IF EXISTS `r_assets`;
CREATE TABLE `r_assets`  (
  `asset_id` int NOT NULL AUTO_INCREMENT,
  `asset_description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `asset_status` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `acquisition_type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `availability` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `disposal_status` int NULL DEFAULT NULL,
  `al_id` int NULL DEFAULT NULL,
  `urs_id` int NULL DEFAULT NULL,
  `date_acquired` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`asset_id`) USING BTREE,
  INDEX `al_id`(`al_id`) USING BTREE,
  INDEX `urs_id`(`urs_id`) USING BTREE,
  CONSTRAINT `r_assets_ibfk_1` FOREIGN KEY (`al_id`) REFERENCES `r_asset_library` (`al_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `r_assets_ibfk_2` FOREIGN KEY (`urs_id`) REFERENCES `t_request_summary` (`urs_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_assets
-- ----------------------------
INSERT INTO `r_assets` VALUES (1, 'Monitor', NULL, 'Donation', NULL, NULL, 1, NULL, '2021-03-01 11:55:29');
INSERT INTO `r_assets` VALUES (2, 'Mouse', NULL, 'Procurement', NULL, NULL, 1, NULL, '2021-03-01 14:42:51');
INSERT INTO `r_assets` VALUES (3, 'Keyboard', NULL, 'Procurement', NULL, NULL, 1, NULL, '2021-03-01 14:43:33');
INSERT INTO `r_assets` VALUES (4, 'System Unit', NULL, 'Donation', NULL, NULL, 1, NULL, '2021-02-01 14:46:10');
INSERT INTO `r_assets` VALUES (5, 'Pencil', NULL, 'Procurement', NULL, NULL, 2, NULL, '2021-03-01 14:46:49');
INSERT INTO `r_assets` VALUES (6, 'Notebook', NULL, 'Procurement', NULL, NULL, 2, NULL, '2021-03-01 14:47:37');
INSERT INTO `r_assets` VALUES (7, 'Bond Papers', NULL, 'Procurement', NULL, NULL, 2, NULL, '2021-03-01 14:47:31');
INSERT INTO `r_assets` VALUES (8, 'Ballpen', NULL, 'Sponsorship', NULL, NULL, 2, NULL, '2021-03-01 14:48:56');
INSERT INTO `r_assets` VALUES (9, 'Alcohol', NULL, 'Sponsorship', NULL, NULL, 2, NULL, '2021-03-01 14:50:09');
INSERT INTO `r_assets` VALUES (10, 'Lan Cables', NULL, 'Procurement', NULL, NULL, 1, NULL, '2021-03-01 14:51:38');
INSERT INTO `r_assets` VALUES (11, 'External Drive Storage', NULL, 'Procurement', NULL, NULL, 1, NULL, '2021-03-01 14:52:21');
INSERT INTO `r_assets` VALUES (12, 'Whiteboard Marker', NULL, 'Procurement', NULL, NULL, 2, NULL, '2021-03-01 14:52:36');
INSERT INTO `r_assets` VALUES (13, 'Whiteboard', NULL, 'Donation', NULL, NULL, 2, NULL, '2021-03-01 14:52:49');
INSERT INTO `r_assets` VALUES (14, 'Printer Ink', NULL, 'Procurement', NULL, NULL, 5, NULL, '2021-03-01 14:53:24');
INSERT INTO `r_assets` VALUES (15, 'Printer', NULL, 'Donation', NULL, NULL, 5, NULL, '2021-03-01 15:42:31');
INSERT INTO `r_assets` VALUES (17, 'Tables', NULL, 'Donation', NULL, NULL, 5, NULL, '2021-03-01 15:42:46');
INSERT INTO `r_assets` VALUES (18, 'Air humidifier', NULL, 'Other', NULL, NULL, 5, NULL, '2021-03-03 18:05:10');

-- ----------------------------
-- Table structure for r_category
-- ----------------------------
DROP TABLE IF EXISTS `r_category`;
CREATE TABLE `r_category`  (
  `category_id` int NOT NULL AUTO_INCREMENT,
  `category_name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_category
-- ----------------------------
INSERT INTO `r_category` VALUES (1, 'Technology');
INSERT INTO `r_category` VALUES (2, 'Office Supplies');

-- ----------------------------
-- Table structure for r_department
-- ----------------------------
DROP TABLE IF EXISTS `r_department`;
CREATE TABLE `r_department`  (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `department_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`department_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_department
-- ----------------------------
INSERT INTO `r_department` VALUES (1, 'DEPT-001', 'IT');
INSERT INTO `r_department` VALUES (2, 'DEPT-002', 'Human Resource');
INSERT INTO `r_department` VALUES (3, 'DEPT-003', 'Customer Service');
INSERT INTO `r_department` VALUES (4, 'DEPT-004', 'Sales');

-- ----------------------------
-- Table structure for r_employee_profile
-- ----------------------------
DROP TABLE IF EXISTS `r_employee_profile`;
CREATE TABLE `r_employee_profile`  (
  `emp_id` int NOT NULL AUTO_INCREMENT,
  `gw_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `emp_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `department_id` int NOT NULL,
  PRIMARY KEY (`emp_id`) USING BTREE,
  INDEX `department_id`(`department_id`) USING BTREE,
  CONSTRAINT `r_employee_profile_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `r_department` (`department_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_employee_profile
-- ----------------------------
INSERT INTO `r_employee_profile` VALUES (1, 'john', 'John Doe', 1);
INSERT INTO `r_employee_profile` VALUES (2, 'john01', 'John Pierce', 2);
INSERT INTO `r_employee_profile` VALUES (3, 'marie', 'Marie Therese', 3);
INSERT INTO `r_employee_profile` VALUES (4, 'steve', 'Steven Fox', 4);

-- ----------------------------
-- Table structure for r_unit
-- ----------------------------
DROP TABLE IF EXISTS `r_unit`;
CREATE TABLE `r_unit`  (
  `unit_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`unit_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_unit
-- ----------------------------
INSERT INTO `r_unit` VALUES (1, 'Piece');
INSERT INTO `r_unit` VALUES (2, 'Pack');
INSERT INTO `r_unit` VALUES (3, 'Bundle');
INSERT INTO `r_unit` VALUES (4, 'Bag');

-- ----------------------------
-- Table structure for r_user_log
-- ----------------------------
DROP TABLE IF EXISTS `r_user_log`;
CREATE TABLE `r_user_log`  (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `gw_id` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `log_type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `message` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of r_user_log
-- ----------------------------

-- ----------------------------
-- Table structure for t_damage_report
-- ----------------------------
DROP TABLE IF EXISTS `t_damage_report`;
CREATE TABLE `t_damage_report`  (
  `dr_id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int NOT NULL,
  `dr_no` int NOT NULL,
  `reason` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date_reported` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`dr_id`) USING BTREE,
  INDEX `asset_id`(`asset_id`) USING BTREE,
  CONSTRAINT `t_damage_report_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `r_assets` (`asset_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_damage_report
-- ----------------------------

-- ----------------------------
-- Table structure for t_disposal
-- ----------------------------
DROP TABLE IF EXISTS `t_disposal`;
CREATE TABLE `t_disposal`  (
  `disposal_id` int NOT NULL AUTO_INCREMENT,
  `disposal_type` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `remarks` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date_disposed` datetime(0) NULL DEFAULT NULL,
  `location_id` int NULL DEFAULT NULL,
  `asset_id` int NOT NULL,
  PRIMARY KEY (`disposal_id`) USING BTREE,
  INDEX `location_id`(`location_id`) USING BTREE,
  INDEX `fk_asset_id`(`asset_id`) USING BTREE,
  CONSTRAINT `t_disposal_ibfk_1` FOREIGN KEY (`location_id`) REFERENCES `t_disposal_location` (`location_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `fk_asset_id` FOREIGN KEY (`asset_id`) REFERENCES `r_assets` (`asset_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_disposal
-- ----------------------------
INSERT INTO `t_disposal` VALUES (1, 'Donation', NULL, '2020-01-01 16:42:12', NULL, 1);
INSERT INTO `t_disposal` VALUES (2, 'Donation', NULL, '2020-01-15 16:42:12', NULL, 1);
INSERT INTO `t_disposal` VALUES (3, 'Donation', NULL, '2020-02-12 16:42:12', NULL, 2);
INSERT INTO `t_disposal` VALUES (4, 'Donation', NULL, '2020-03-15 16:42:12', NULL, 2);
INSERT INTO `t_disposal` VALUES (5, 'Donation', NULL, '2021-05-21 16:44:22', NULL, 3);

-- ----------------------------
-- Table structure for t_disposal_location
-- ----------------------------
DROP TABLE IF EXISTS `t_disposal_location`;
CREATE TABLE `t_disposal_location`  (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `location_code` varchar(25) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `location_description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`location_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_disposal_location
-- ----------------------------
INSERT INTO `t_disposal_location` VALUES (1, 'LWGF', 'Lower Ground Floor');

-- ----------------------------
-- Table structure for t_inspection
-- ----------------------------
DROP TABLE IF EXISTS `t_inspection`;
CREATE TABLE `t_inspection`  (
  `ins_id` int NOT NULL AUTO_INCREMENT,
  `dr_id` int NOT NULL,
  `inspection_status` int NULL DEFAULT NULL,
  `evaluation` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date_inspected` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ins_id`) USING BTREE,
  INDEX `dr_id`(`dr_id`) USING BTREE,
  CONSTRAINT `t_inspection_ibfk_1` FOREIGN KEY (`dr_id`) REFERENCES `t_damage_report` (`dr_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_inspection
-- ----------------------------

-- ----------------------------
-- Table structure for t_release
-- ----------------------------
DROP TABLE IF EXISTS `t_release`;
CREATE TABLE `t_release`  (
  `release_id` int NOT NULL AUTO_INCREMENT,
  `request_id` int NOT NULL,
  `release_status` int NULL DEFAULT NULL,
  `remarks` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date_released` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`release_id`) USING BTREE,
  INDEX `request_id`(`request_id`) USING BTREE,
  CONSTRAINT `t_release_ibfk_1` FOREIGN KEY (`request_id`) REFERENCES `t_request` (`request_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_release
-- ----------------------------

-- ----------------------------
-- Table structure for t_request
-- ----------------------------
DROP TABLE IF EXISTS `t_request`;
CREATE TABLE `t_request`  (
  `request_id` int NOT NULL AUTO_INCREMENT,
  `asset_id` int NOT NULL,
  `quantity` int NULL DEFAULT NULL,
  `request_status` int NULL DEFAULT NULL,
  `date_approved` datetime(0) NULL DEFAULT NULL,
  `date_rejected` datetime(0) NULL DEFAULT NULL,
  `emp_id` int NOT NULL,
  PRIMARY KEY (`request_id`) USING BTREE,
  INDEX `asset_id`(`asset_id`) USING BTREE,
  INDEX `emp_id`(`emp_id`) USING BTREE,
  CONSTRAINT `t_request_ibfk_1` FOREIGN KEY (`asset_id`) REFERENCES `r_assets` (`asset_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_request_ibfk_2` FOREIGN KEY (`emp_id`) REFERENCES `r_employee_profile` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_request
-- ----------------------------
INSERT INTO `t_request` VALUES (1, 1, 3, NULL, NULL, NULL, 1);
INSERT INTO `t_request` VALUES (2, 1, 3, NULL, NULL, NULL, 2);
INSERT INTO `t_request` VALUES (3, 1, 2, NULL, NULL, NULL, 3);
INSERT INTO `t_request` VALUES (4, 1, 2, NULL, NULL, NULL, 4);
INSERT INTO `t_request` VALUES (6, 2, 1, NULL, NULL, NULL, 1);
INSERT INTO `t_request` VALUES (7, 2, 1, NULL, NULL, NULL, 2);
INSERT INTO `t_request` VALUES (8, 2, 1, NULL, NULL, NULL, 3);
INSERT INTO `t_request` VALUES (9, 2, 1, NULL, NULL, NULL, 4);
INSERT INTO `t_request` VALUES (10, 3, 1, NULL, NULL, NULL, 1);
INSERT INTO `t_request` VALUES (11, 3, 1, NULL, NULL, NULL, 2);
INSERT INTO `t_request` VALUES (12, 3, 1, NULL, NULL, NULL, 3);
INSERT INTO `t_request` VALUES (13, 3, 1, NULL, NULL, NULL, 4);
INSERT INTO `t_request` VALUES (14, 4, 1, NULL, NULL, NULL, 1);
INSERT INTO `t_request` VALUES (15, 4, 1, NULL, NULL, NULL, 2);
INSERT INTO `t_request` VALUES (16, 4, 1, NULL, NULL, NULL, 3);
INSERT INTO `t_request` VALUES (17, 4, 1, NULL, NULL, NULL, 4);
INSERT INTO `t_request` VALUES (18, 5, 100, NULL, NULL, NULL, 2);
INSERT INTO `t_request` VALUES (19, 5, 21, NULL, NULL, NULL, 4);
INSERT INTO `t_request` VALUES (20, 6, 10, NULL, NULL, NULL, 3);
INSERT INTO `t_request` VALUES (21, 6, 50, NULL, NULL, NULL, 3);

-- ----------------------------
-- Table structure for t_request_summary
-- ----------------------------
DROP TABLE IF EXISTS `t_request_summary`;
CREATE TABLE `t_request_summary`  (
  `urs_id` int NOT NULL AUTO_INCREMENT,
  `request_no` int NULL DEFAULT NULL,
  `purpose` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `date_requested` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`urs_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_request_summary
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
