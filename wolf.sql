/*
Navicat MySQL Data Transfer

Source Server         : 本地连接
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : wolf

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2017-03-21 17:35:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `auth_assignment`;
CREATE TABLE `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_assignment
-- ----------------------------
INSERT INTO `auth_assignment` VALUES ('博客管理', '1', '1489760074');
INSERT INTO `auth_assignment` VALUES ('权限管理', '1', '1489768184');
INSERT INTO `auth_assignment` VALUES ('管理员权限', '1', '1489768183');

-- ----------------------------
-- Table structure for auth_item
-- ----------------------------
DROP TABLE IF EXISTS `auth_item`;
CREATE TABLE `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` smallint(6) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`),
  CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item
-- ----------------------------
INSERT INTO `auth_item` VALUES ('/*', '2', null, null, null, '1489771080', '1489771080');
INSERT INTO `auth_item` VALUES ('/admin/*', '2', null, null, null, '1489767907', '1489767907');
INSERT INTO `auth_item` VALUES ('/admin/assignment/*', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/assignment/assign', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/assignment/index', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/assignment/revoke', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/assignment/view', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/default/*', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/default/index', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/menu/*', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/menu/create', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/menu/delete', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/menu/index', '2', null, null, null, '1489769955', '1489769955');
INSERT INTO `auth_item` VALUES ('/admin/menu/update', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/menu/view', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/permission/*', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/permission/assign', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/permission/create', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/permission/delete', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/permission/index', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/permission/remove', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/permission/update', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/permission/view', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/role/*', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/role/assign', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/role/create', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/role/delete', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/role/index', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/role/remove', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/role/update', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/role/view', '2', null, null, null, '1489771077', '1489771077');
INSERT INTO `auth_item` VALUES ('/admin/route/*', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/route/assign', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/route/create', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/route/index', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/route/refresh', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/route/remove', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/rule/*', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/rule/create', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/rule/delete', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/rule/index', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/rule/update', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/rule/view', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/user/*', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/user/activate', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/user/change-password', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/user/delete', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/user/index', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/user/login', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/user/logout', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/user/request-password-reset', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/user/reset-password', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/user/signup', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/admin/user/view', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/blog/*', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/blog/create', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/blog/delete', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/blog/index', '2', '博客列表', null, null, '1489760074', '1489760074');
INSERT INTO `auth_item` VALUES ('/blog/update', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/blog/view', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/category/*', '2', null, null, null, '1489835477', '1489835477');
INSERT INTO `auth_item` VALUES ('/category/create', '2', null, null, null, '1489835477', '1489835477');
INSERT INTO `auth_item` VALUES ('/category/delete', '2', null, null, null, '1489835477', '1489835477');
INSERT INTO `auth_item` VALUES ('/category/index', '2', null, null, null, '1489835477', '1489835477');
INSERT INTO `auth_item` VALUES ('/category/update', '2', null, null, null, '1489835477', '1489835477');
INSERT INTO `auth_item` VALUES ('/category/view', '2', null, null, null, '1489835477', '1489835477');
INSERT INTO `auth_item` VALUES ('/debug/*', '2', null, null, null, '1489769190', '1489769190');
INSERT INTO `auth_item` VALUES ('/debug/default/*', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/debug/default/db-explain', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/debug/default/download-mail', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/debug/default/index', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/debug/default/toolbar', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/debug/default/view', '2', null, null, null, '1489771078', '1489771078');
INSERT INTO `auth_item` VALUES ('/gii/*', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/gii/default/*', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/gii/default/action', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/gii/default/diff', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/gii/default/index', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/gii/default/preview', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/gii/default/view', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/post/create', '2', null, null, null, '1489762310', '1489762310');
INSERT INTO `auth_item` VALUES ('/post/delete', '2', null, null, null, '1489762312', '1489762312');
INSERT INTO `auth_item` VALUES ('/post/update', '2', null, null, null, '1489762310', '1489762310');
INSERT INTO `auth_item` VALUES ('/post/view', '2', null, null, null, '1489762310', '1489762310');
INSERT INTO `auth_item` VALUES ('/rbac/*', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/rbac/init', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/rbac/init2', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/site/*', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/site/captcha', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/site/error', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/site/index', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/site/login', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/site/logout', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/user-backend/*', '2', null, null, null, '1489771080', '1489771080');
INSERT INTO `auth_item` VALUES ('/user-backend/create', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/user-backend/delete', '2', null, null, null, '1489771080', '1489771080');
INSERT INTO `auth_item` VALUES ('/user-backend/index', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('/user-backend/signup', '2', null, null, null, '1489771080', '1489771080');
INSERT INTO `auth_item` VALUES ('/user-backend/update', '2', null, null, null, '1489771080', '1489771080');
INSERT INTO `auth_item` VALUES ('/user-backend/view', '2', null, null, null, '1489771079', '1489771079');
INSERT INTO `auth_item` VALUES ('博客管理', '1', null, null, null, '1489760074', '1489760074');
INSERT INTO `auth_item` VALUES ('权限管理', '2', '权限管理', null, null, '1489767986', '1489767986');
INSERT INTO `auth_item` VALUES ('管理员权限', '1', '网站最高权限', null, null, '1489768091', '1489768091');

-- ----------------------------
-- Table structure for auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `auth_item_child`;
CREATE TABLE `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_item_child
-- ----------------------------
INSERT INTO `auth_item_child` VALUES ('权限管理', '/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/assignment/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/assignment/assign');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/assignment/index');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/assignment/revoke');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/assignment/view');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/default/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/default/index');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/menu/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/menu/create');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/menu/delete');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/menu/index');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/menu/update');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/menu/view');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/permission/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/permission/assign');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/permission/create');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/permission/delete');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/permission/index');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/permission/remove');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/permission/update');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/permission/view');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/role/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/role/assign');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/role/create');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/role/delete');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/role/index');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/role/remove');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/role/update');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/role/view');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/route/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/route/assign');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/route/create');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/route/index');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/route/refresh');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/route/remove');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/rule/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/rule/create');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/rule/delete');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/rule/index');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/rule/update');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/rule/view');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/user/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/user/activate');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/user/change-password');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/user/delete');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/user/index');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/user/login');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/user/logout');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/user/request-password-reset');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/user/reset-password');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/user/signup');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/admin/user/view');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/blog/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/blog/create');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/blog/delete');
INSERT INTO `auth_item_child` VALUES ('博客管理', '/blog/index');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/blog/index');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/blog/update');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/blog/view');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/category/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/category/create');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/category/delete');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/category/index');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/category/update');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/category/view');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/debug/*');
INSERT INTO `auth_item_child` VALUES ('管理员权限', '/debug/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/debug/default/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/debug/default/db-explain');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/debug/default/download-mail');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/debug/default/index');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/debug/default/toolbar');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/debug/default/view');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/gii/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/gii/default/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/gii/default/action');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/gii/default/diff');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/gii/default/index');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/gii/default/preview');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/gii/default/view');
INSERT INTO `auth_item_child` VALUES ('博客管理', '/post/create');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/post/create');
INSERT INTO `auth_item_child` VALUES ('博客管理', '/post/delete');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/post/delete');
INSERT INTO `auth_item_child` VALUES ('博客管理', '/post/update');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/post/update');
INSERT INTO `auth_item_child` VALUES ('博客管理', '/post/view');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/post/view');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/rbac/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/rbac/init');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/rbac/init2');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/site/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/site/captcha');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/site/error');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/site/index');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/site/login');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/site/logout');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/user-backend/*');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/user-backend/create');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/user-backend/delete');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/user-backend/index');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/user-backend/signup');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/user-backend/update');
INSERT INTO `auth_item_child` VALUES ('权限管理', '/user-backend/view');
INSERT INTO `auth_item_child` VALUES ('管理员权限', '博客管理');
INSERT INTO `auth_item_child` VALUES ('管理员权限', '权限管理');

-- ----------------------------
-- Table structure for auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `auth_rule`;
CREATE TABLE `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` blob,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of auth_rule
-- ----------------------------

-- ----------------------------
-- Table structure for blog
-- ----------------------------
DROP TABLE IF EXISTS `blog`;
CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL DEFAULT '' COMMENT '标题',
  `content` text NOT NULL COMMENT '内容',
  `views` int(11) NOT NULL DEFAULT '0' COMMENT '点击量',
  `is_delete` tinyint(4) NOT NULL DEFAULT '1' COMMENT '是否删除 1未删除 2已删除',
  `created_at` datetime NOT NULL COMMENT '添加时间',
  `updated_at` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of blog
-- ----------------------------
INSERT INTO `blog` VALUES ('1', 'summer', 'summer', '11', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `blog` VALUES ('2', 'summer', 'summer', '12', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `blog` VALUES ('3', 'summer', 'summer', '12', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `blog` VALUES ('4', 'summer', 'summer', '1212', '2', '0000-00-00 00:00:00', '0000-00-00 00:00:00');
INSERT INTO `blog` VALUES ('5', 'summer', 'summer', '123', '1', '2017-03-21 13:24:01', '2017-03-21 13:24:01');

-- ----------------------------
-- Table structure for blog_category
-- ----------------------------
DROP TABLE IF EXISTS `blog_category`;
CREATE TABLE `blog_category` (
  `blog_id` int(11) NOT NULL COMMENT '文章ID',
  `category_id` int(11) NOT NULL COMMENT '栏目ID',
  KEY `blog_id` (`blog_id`),
  KEY `category_id` (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章-栏目关联表';

-- ----------------------------
-- Records of blog_category
-- ----------------------------
INSERT INTO `blog_category` VALUES ('1', '1');
INSERT INTO `blog_category` VALUES ('1', '1');
INSERT INTO `blog_category` VALUES ('3', '1');
INSERT INTO `blog_category` VALUES ('3', '2');
INSERT INTO `blog_category` VALUES ('4', '2');
INSERT INTO `blog_category` VALUES ('5', '1');
INSERT INTO `blog_category` VALUES ('5', '2');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '栏目ID',
  `name` varchar(20) NOT NULL DEFAULT '' COMMENT '栏目名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='栏目枚举表';

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'summer');
INSERT INTO `category` VALUES ('2', 'danny');

-- ----------------------------
-- Table structure for menu
-- ----------------------------
DROP TABLE IF EXISTS `menu`;
CREATE TABLE `menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL,
  `parent` int(11) DEFAULT NULL,
  `route` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`),
  KEY `parent` (`parent`),
  CONSTRAINT `menu_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu
-- ----------------------------
INSERT INTO `menu` VALUES ('12', 'Same tools', null, null, '5', 0x7B2269636F6E223A202266612066612D7368617265222C202276697369626C65223A20747275657D);
INSERT INTO `menu` VALUES ('13', 'Gii', '12', '/gii/default/index', null, 0x7B2269636F6E223A202266612066612D66696C652D636F64652D6F222C202276697369626C65223A20747275657D);
INSERT INTO `menu` VALUES ('14', 'Debug', '12', '/debug/default/index', null, 0x7B2269636F6E223A202266612066612D64617368626F617264222C202276697369626C65223A20747275657D);
INSERT INTO `menu` VALUES ('15', '菜单管理', null, null, '1', null);
INSERT INTO `menu` VALUES ('16', '创建菜单', '15', '/admin/menu/create', null, null);
INSERT INTO `menu` VALUES ('17', '菜单列表', '15', '/admin/menu/index', '1', null);
INSERT INTO `menu` VALUES ('18', '权限管理', null, null, null, null);
INSERT INTO `menu` VALUES ('19', '权限列表', '18', '/admin/permission/index', null, null);
INSERT INTO `menu` VALUES ('20', '创建权限', '18', '/admin/permission/create', null, null);
INSERT INTO `menu` VALUES ('21', '路由列表', '18', '/admin/route/index', null, null);
INSERT INTO `menu` VALUES ('22', '角色列表', '18', '/admin/role/index', null, null);
INSERT INTO `menu` VALUES ('23', '文章管理', null, null, null, null);
INSERT INTO `menu` VALUES ('24', '栏目管理', '23', '/category/index', null, null);

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
INSERT INTO `migration` VALUES ('m140506_102106_rbac_init', '1489750049');
INSERT INTO `migration` VALUES ('m140602_111327_create_menu_table', '1489768852');

-- ----------------------------
-- Table structure for test
-- ----------------------------
DROP TABLE IF EXISTS `test`;
CREATE TABLE `test` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of test
-- ----------------------------

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
