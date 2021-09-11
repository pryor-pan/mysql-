/*
Navicat MySQL Data Transfer

Source Server         : mySQL
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : db_book

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2021-05-19 20:37:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_book
-- ----------------------------
DROP TABLE IF EXISTS `t_book`;
CREATE TABLE `t_book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookName` varchar(20) DEFAULT NULL,
  `author` varchar(20) DEFAULT NULL,
  `sex` varchar(10) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `bookTypeId` int(11) DEFAULT NULL,
  `bookDesc` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `bookTypeId` (`bookTypeId`),
  CONSTRAINT `t_book_ibfk_1` FOREIGN KEY (`bookTypeId`) REFERENCES `t_booktype` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_book
-- ----------------------------
INSERT INTO `t_book` VALUES ('1', 'java编程', '张三', '女', '99', '1', '基础java编程教材');
INSERT INTO `t_book` VALUES ('3', '山海经', '不详', '男', '59', '4', '描述中国神话的古老奇书');
INSERT INTO `t_book` VALUES ('4', '青少年植物百科全书', '李白', '男', '39.9', '7', '讲小植物的');
INSERT INTO `t_book` VALUES ('5', '动物世界', '黑魔仙小月', '女', '29.9', '7', '讲小动物的');
INSERT INTO `t_book` VALUES ('6', 'Python程序设计', '杨年华', '男', '69', '1', '讲Python的书');
INSERT INTO `t_book` VALUES ('7', '社会经济学', '杨彩丽', '女', '89', '5', '讲社会经济的');

-- ----------------------------
-- Table structure for t_booktype
-- ----------------------------
DROP TABLE IF EXISTS `t_booktype`;
CREATE TABLE `t_booktype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookTypeName` varchar(20) DEFAULT NULL,
  `bookTypeDesc` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_booktype
-- ----------------------------
INSERT INTO `t_booktype` VALUES ('1', '计算机类', '计算机相关图书');
INSERT INTO `t_booktype` VALUES ('4', '古典文学', '世界古典文学书籍');
INSERT INTO `t_booktype` VALUES ('5', '社会科学', '社会科学');
INSERT INTO `t_booktype` VALUES ('6', '哲学', '老马克思');
INSERT INTO `t_booktype` VALUES ('7', '自然科学', '达尔文起飞');
INSERT INTO `t_booktype` VALUES ('8', '综合性图书', '说白了就乱七八糟的东西全在这儿了');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', '1234', '1234');
