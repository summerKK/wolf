/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : wolf

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-03-17 10:27:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '',
  `content` text,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', 'summer', 'summer', null, null);
INSERT INTO `blog` VALUES ('2', 'summer', 'summer', null, null);
INSERT INTO `blog` VALUES ('3', 'Danny', 'summer', null, null);
INSERT INTO `blog` VALUES ('4', 'Danny', 'summer', null, null);
INSERT INTO `blog` VALUES ('5', 'hello', 'world', '1489646177', '1489646177');

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', '1489643942');
INSERT INTO `migration` VALUES ('m130524_201442_init', '1489643948');
INSERT INTO `migration` VALUES ('m170316_055548_create_blog_table', '1489643948');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'summer', 'Xpi7NmnDroFTPuXKxyID2dwjpOS79E1p', '$2y$13$88.Pop2aphcy3/Ip8mvHkugq7w50jwcwZ52bVWaUQN849j7/gDl1e', null, 'summer@qq.com', '10', '1489644227', '1489644227');
INSERT INTO `user` VALUES ('2', 'sunny', 'NpGxGxHc4fUuNqLayrAnzh3ay3ojFBE0', '$2y$13$bMb8PCogwghjBwsxmfttWuGY8R6doGLwFaulh.5aKw5frRF8NFv5.', null, 'ummer@qq.com', '10', '1489656218', '1489656218');

-- ----------------------------
-- Table structure for user_backend
-- ----------------------------
DROP TABLE IF EXISTS `user_backend`;
CREATE TABLE `user_backend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user_backend
-- ----------------------------
INSERT INTO `user_backend` VALUES ('1', 'summer', 'tCEc09hOAn0RW40vHQjV9-VMn9XAlyLU', '$2y$13$zG4YlmlEi7EEm5u5l.vXzuRopY.IspFjGPwlGZWye8.p.JkJV0gT6', 'summer@qq.com', '2017-03-16 17:09:23', '2017-03-16 17:09:23');
INSERT INTO `user_backend` VALUES ('3', 'su', 'tCEc09hOAn0RW40vHQjV9-VMn9XAlyLU', '$2y$13$zG4YlmlEi7EEm5u5l.vXzuRopY.IspFjGPwlGZWye8.p.JkJV0gT6', 'summerr@qq.com', '2017-03-16 17:09:23', '2017-03-16 17:09:23');
