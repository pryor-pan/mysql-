/*
Navicat MySQL Data Transfer

Source Server         : mySQL
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : hotelmanagement

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2021-05-19 20:37:58
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for roomtable
-- ----------------------------
DROP TABLE IF EXISTS `roomtable`;
CREATE TABLE `roomtable` (
  `Rid` int(10) unsigned zerofill NOT NULL AUTO_INCREMENT,
  `Rtype` varchar(100) NOT NULL,
  `Rprice` decimal(60,0) NOT NULL,
  `State` int(10) NOT NULL,
  `Cname` varchar(100) DEFAULT NULL,
  `Cnumber` varchar(100) DEFAULT NULL,
  `Date` varchar(100) DEFAULT NULL,
  `Days` int(10) DEFAULT NULL,
  PRIMARY KEY (`Rid`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of roomtable
-- ----------------------------
INSERT INTO `roomtable` VALUES ('0000000101', '标准间', '199', '0', '', '', '', '0');
INSERT INTO `roomtable` VALUES ('0000000102', '标准间', '199', '1', '张三', '18366585415', '2020-4-12', '3');
INSERT INTO `roomtable` VALUES ('0000000103', '大床房', '299', '0', null, null, null, null);
INSERT INTO `roomtable` VALUES ('0000000104', '大床房', '299', '1', '李四', '13544562229', '2020-4-18', '1');
INSERT INTO `roomtable` VALUES ('0000000105', '大床房', '299', '0', null, null, null, null);
INSERT INTO `roomtable` VALUES ('0000000106', '豪华套间', '599', '1', '李刚', '18543662231', '2020-6-28', '7');
INSERT INTO `roomtable` VALUES ('0000000107', '豪华套间', '599', '0', null, null, null, null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `uname` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `role` int(10) NOT NULL,
  PRIMARY KEY (`uname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1111', '1111', '1');
INSERT INTO `users` VALUES ('2222', '2222', '0');
