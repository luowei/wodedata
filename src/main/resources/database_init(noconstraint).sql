/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50711
 Source Host           : localhost
 Source Database       : lidongchengsay

 Target Server Type    : MySQL
 Target Server Version : 50711
 File Encoding         : utf-8

 Date: 04/10/2016 05:53:31 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- 导出 lidongchengsay 的数据库结构
CREATE DATABASE IF NOT EXISTS `lidongchengsay` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `lidongchengsay`;

-- ----------------------------
--  Table structure for `collection`
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_at` datetime DEFAULT NULL,
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` mediumtext NOT NULL,
  `create_at` datetime NOT NULL,
  `floor` bigint(20) NOT NULL,
  `like_count` bigint(20) NOT NULL,
  `status` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `comment`
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES ('1', 'aaaaaaaaabbbbbb', '2016-04-05 00:05:43', '1', '1', '0', '21', '1');
COMMIT;

-- ----------------------------
--  Table structure for `comment_user`
-- ----------------------------
DROP TABLE IF EXISTS `comment_user`;
CREATE TABLE `comment_user` (
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`comment_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `comment_user`
-- ----------------------------
BEGIN;
INSERT INTO `comment_user` VALUES ('1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `field`
-- ----------------------------
DROP TABLE IF EXISTS `field`;
CREATE TABLE `field` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` mediumtext NOT NULL,
  `meta` varchar(255) NOT NULL,
  `property_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `field`
-- ----------------------------
BEGIN;
INSERT INTO `field` VALUES ('1', '李东成说', '33333', '1'), ('2', '李东成说', '233', '2'), ('3', '李东成说', '233', '3'), ('4', '31010402051168', '233', '4'), ('5', '<!--\r\n<div class=\"row\">\r\n            <div class=\"col-md-4\">\r\n                <h4 class=\"logo\">Spring abc</h4>\r\n                <p class=\"\">\r\n                    向<a href=\"https://pivotal.io/terms-of-use\" target=\"_blank\">Spring 的开发者</a>致敬，积极寻求探索革新之道，改变软件工程世界。这里是专注<a target=\"_blank\" href=\"http://spring.io/\">Spring</a>的中文社区：你可以讨论<a target=\"_blank\" href=\"http://spring.io/\">Spring</a>的话题和查询一系列的<a target=\"_blank\" href=\"http://spring.io/\">Spring</a>文章/资料/教程，有任何跟<a target=\"_blank\" href=\"http://spring.io/projects\">Spring</a>相关的看法见解，都可以在此发表\r\n</p><p>\r\n<strong>Build Up Your Enterprise !</strong>\r\n</p>\r\n                <p></p>\r\n                \r\n            </div>\r\n            <div class=\"col-md-2\">\r\n                <h5>学习资料</h5>\r\n                <ul class=\"list-unstyled\">\r\n                   <li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n                </ul>\r\n            </div>\r\n            <div class=\"col-md-2\">\r\n                <h5>话题讨论</h5>\r\n                <ul class=\"list-unstyled\">\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n                </ul>\r\n            </div>\r\n            <div class=\"col-md-4\">\r\n                <h5>友情链接</h5>\r\n                <div class=\"row\">\r\n                    <div class=\"col-md-6\">\r\n                        <ul class=\"list-unstyled\">\r\n <li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n                        </ul>\r\n                    </div>\r\n                    <div class=\"col-md-6\">\r\n                        <ul class=\"list-unstyled\">\r\n   <li><a href=\"https://github.com/zh-h/Spring-abc\" target=\"_blank\">GitHub</a></li>\r\n   <li><a href=\"http://spring-abc.xyz/docs.html\" target=\"_blank\">文档</a></li>\r\n                        </ul>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n-->', '233', '6'), ('6', '李东成说，李东成说的社区', '233', '7'), ('7', '<script></script>', '233', '8'), ('8', '<!--\r\n<div class=\"panel-body\">\r\n	  \r\n	  <a href=\"http://www.oneapm.com/ci/docker.html?utm_source=golangtc&utm_medium=logo&utm_term=docker&utm_content=logolink&utm_campaign=NovAds&from=maadfiNoxj\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/oneapm-4.png\" width=\"100%\"></a>\r\n	  \r\n	  <a href=\"http://www.51idc.com/activity/ACCloudHK.html\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/51idc-5.png\" width=\"100%\"></a>\r\n	  \r\n	  <a href=\"https://www.teambition.com/?utm_source=golangtc&utm_medium=banner\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/Teambition-Banner-2.jpg\" width=\"100%\"></a>\r\n	  \r\n	  <a href=\"http://click.aliyun.com/m/1621/\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/aliyun-c7.jpg\" width=\"100%\"></a>\r\n	  \r\n	  <a href=\"http://www.jiankongbao.com/new_docker/?ref=golangtc\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/jiankongbao-7.png\" width=\"100%\"></a>\r\n	  \r\n	  <a href=\"http://www.ucloud.cn/site/active/tic.html?utm_source=cost&utm_campaign=Golang%E7%A4%BE%E5%8C%BA&utm_medium=display&utm_content=tic\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/ucloud-2.jpg\" width=\"100%\"></a>\r\n	  \r\n	</div>\r\n\r\n-->', '233', '9'), ('9', '<!--\r\n<div class=\"panel-body\">\r\n	  \r\n	  <a href=\"http://www.oneapm.com/ci/docker.html?utm_source=golangtc&utm_medium=logo&utm_term=docker&utm_content=logolink&utm_campaign=NovAds&from=maadfiNoxj\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/oneapm-4.png\" width=\"100%\"></a>\r\n	  \r\n	  <a href=\"http://www.51idc.com/activity/ACCloudHK.html\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/51idc-5.png\" width=\"100%\"></a>\r\n	  \r\n	  <a href=\"https://www.teambition.com/?utm_source=golangtc&utm_medium=banner\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/Teambition-Banner-2.jpg\" width=\"100%\"></a>\r\n	  \r\n	  <a href=\"http://click.aliyun.com/m/1621/\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/aliyun-c7.jpg\" width=\"100%\"></a>\r\n	  \r\n	  <a href=\"http://www.jiankongbao.com/new_docker/?ref=golangtc\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/jiankongbao-7.png\" width=\"100%\"></a>\r\n	  \r\n	  <a href=\"http://www.ucloud.cn/site/active/tic.html?utm_source=cost&utm_campaign=Golang%E7%A4%BE%E5%8C%BA&utm_medium=display&utm_content=tic\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/ucloud-2.jpg\" width=\"100%\"></a>\r\n	  \r\n	</div>\r\n-->', '233', '10'), ('10', '李东成说的社区刚建，还有诸多不完善之处。欢迎各位有识之士、有志之士能多多支持,多多建意。', '233', '11'), ('11', '欢迎来到李东成说!', '233', '12'), ('12', 'tipc_signup', '233', '13'), ('13', '<ul style=\"margin-top: 0px;\">\r\n            <li><span class=\"f13\">主题标题</span><div class=\"sep10\"></div>\r\n            请在标题中描述内容要点。如果一件事情在标题的长度内就已经可以说清楚，那就没有必要写正文了。\r\n            <div class=\"sep10\"></div>\r\n            </li>\r\n            <li><div class=\"fr\" style=\"margin-top: -5px; margin-right: 5px;\"><span class=\"f13\">正文</span><div class=\"sep10\"></div>\r\n            可以在正文中为你要发布的主题添加更多细节。 支持 <span style=\"font-family: Consolas, \'Panic Sans\', mono\"><a href=\"https://help.github.com/articles/github-flavored-markdown\" target=\"_blank\">GitHub Flavored Markdown</a></span> 文本标记语法。\r\n            <div class=\"sep10\"></div>\r\n            在正式提交之前，你可以点击“preview”来查看 Markdown 正文的实际渲染效果。\r\n             <div class=\"sep10\"></div>\r\n             你可以点击“upload” 选择需要的图片后上传后点击插入按钮，插入md的图片标签。\r\n            <div class=\"sep10\"></div>\r\n            </li>\r\n            <li><span class=\"f13\">选择节点</span><div class=\"sep10\"></div>\r\n            请为你的主题选择一个节点。恰当的归类会让你发布的信息更加有用。\r\n            <div class=\"sep10\"></div>\r\n          	如果有必要，管理员会帮助迁移节点\r\n            </li>\r\n           <li><span class=\"f13\">选择节点</span><div class=\"sep10\"></div>\r\n            请为你的主题选择一个节点。恰当的归类会让你发布的信息更加有用。\r\n            <div class=\"sep10\"></div>\r\n          	如果有必要，管理员会帮助迁移节点\r\n            </li>\r\n        </ul>', '233', '14'), ('14', 'tipc_signup', '233', '15'), ('15', '233', '233', '16'), ('16', '233', '233', '17'), ('17', '233', '233', '18'), ('19', '<li class=\"\"><a href=\"/\">话题</a></li>\r\n<li class=\"\"><a href=\"/nodes\">专辑</a></li>\r\n<li><a href=\"http://wodedata.com\" >开发者网站</a></li>\r\n<!--\r\n<li><a href=\"/users/\" >播客</a></li>\r\n<li><a href=\"http://www.tudou.com/home/rootls\" >Videos</a></li>\r\n<li class=\"\"><a href=\"/docs.html\">文档</a></li>\r\n<li><a href=\"http://wodedata.com\" target=\"_blank\">wodedata.com</a></li>\r\n-->', '233', '5'), ('20', 'admin', 'sfsf', '19');
COMMIT;

-- ----------------------------
--  Table structure for `focus`
-- ----------------------------
DROP TABLE IF EXISTS `focus`;
CREATE TABLE `focus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_at` datetime NOT NULL,
  `node_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `follow`
-- ----------------------------
DROP TABLE IF EXISTS `follow`;
CREATE TABLE `follow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_at` datetime NOT NULL,
  `follower_id` int(11) NOT NULL,
  `following_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `node`
-- ----------------------------
DROP TABLE IF EXISTS `node`;
CREATE TABLE `node` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `topic_count` bigint(20) DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `section_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_fwigxdmj6bsrpcmhcgpmlsirh` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `node`
-- ----------------------------
BEGIN;
INSERT INTO `node` VALUES ('1', null, '这是李东成说的毛时代', '4', '毛时代', '0', '1'), ('2', null, '李东成说之潜伏下的军统', '0', '潜伏下的军统', '0', '1'), ('3', null, '李东成说之解密中共五大野战军', '0', '五大野战军', '0', '1'), ('4', null, '李东成说之奇葩说民国', '0', '奇葩说民国', '0', '1'), ('5', null, '李东成说之晚清那些人和事', '0', '晚清那些人和事', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `notification`
-- ----------------------------
DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` int(11) NOT NULL DEFAULT '0',
  `comment_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `notification`
-- ----------------------------
BEGIN;
INSERT INTO `notification` VALUES ('1', '1', '1', '1', '回复');
COMMIT;

-- ----------------------------
--  Table structure for `page`
-- ----------------------------
DROP TABLE IF EXISTS `page`;
CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` longtext NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `url` varchar(255) NOT NULL,
  `view_count` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_f6ctahf1jnokrtpp5wblm0shb` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `page`
-- ----------------------------
BEGIN;
INSERT INTO `page` VALUES ('1', '# wodedata 社区\r\n\r\n```\r\n呵呵哒\r\n\r\n```', null, 'about', null, 'about', '1'), ('2', '# Comming soon !', '2015-12-08 21:08:05', 'Videos', null, 'videos', '1'), ('3', '# 这是文档', '2015-12-15 21:37:58', '相关文档', null, 'docs', '1');
COMMIT;

-- ----------------------------
--  Table structure for `property`
-- ----------------------------
DROP TABLE IF EXISTS `property`;
CREATE TABLE `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `property`
-- ----------------------------
BEGIN;
INSERT INTO `property` VALUES ('1', 'site_name', 'site_name'), ('2', 'site_description', 'site_description'), ('3', 'site_keywords', 'site_keywords'), ('4', 'site_ICP', 'site_ICP'), ('5', 'nav_main', 'nav_main'), ('6', 'nav_footer', 'nav_footer'), ('7', 'footer_description', 'footer_description'), ('8', 'footer_script', 'footer_script'), ('9', 'ad_side', 'ad_side'), ('10', 'ad_inner', 'ad_inner'), ('11', 'tip_notic', 'tip_notic'), ('12', 'tip_welcome', 'tip_welcome'), ('13', 'tip_signup', 'tip_signup'), ('14', 'tip_topic', 'tip_topic'), ('15', 'tip_comment', 'tip_comment'), ('16', 'limit_edit', 'limit_edit'), ('17', 'limit_delete', 'limit_delete'), ('18', 'limit_comment', 'limit_comment'), ('19', 'comment_edit', 'comment_edit');
COMMIT;

-- ----------------------------
--  Table structure for `section`
-- ----------------------------
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_rwqtt5x96oahjdtqt20vxu4um` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `section`
-- ----------------------------
BEGIN;
INSERT INTO `section` VALUES ('1', '李东成说', '0');
COMMIT;

-- ----------------------------
--  Table structure for `topic`
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `collecton_id` int(11) DEFAULT NULL,
  `comment_count` bigint(20) unsigned DEFAULT '0',
  `content` longtext NOT NULL,
  `create_at` datetime DEFAULT NULL,
  `last_comment_at` datetime DEFAULT NULL,
  `last_comment_user` tinyblob,
  `last_comment_user_id` int(11) DEFAULT NULL,
  `like_count` bigint(20) unsigned DEFAULT '0',
  `score` bigint(20) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `update_at` datetime DEFAULT NULL,
  `view_count` bigint(20) unsigned DEFAULT '0',
  `node_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `preImage` varchar(255) DEFAULT NULL,
  `preAudio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `topic`
-- ----------------------------
BEGIN;
INSERT INTO `topic` VALUES ('24', null, '0', '### 寂寞的宁都会议\r\n----------\r\n\r\n**宁都会议介绍** \r\n\r\n```\r\n　　1932年10月3日，在极其严峻的气氛中，苏区中央局会议在江西宁都小源召开。小源山林茂密，风景优美，有很多地主庄园，江西省军区司令部作战室为了防空，就驻扎在这里。作战室里的中央局会议，气氛十分凝重，随着批判加温，大家说话声一句比一句高，头发有些凌乱的毛泽东沉默不语，这一段时间经常低烧的他，一支接一支抽着烟，有时还不断咳嗽几声。周恩来解开上衣的扣子，不时地看看窗外，脸上显出不安的表情。\r\n\r\n　　在这次会议上，毛泽东被解除在红军中的领导职务。这不是孤立的、偶然的，围绕宁都会议和解除毛泽东军权，台前幕后发生了许多事情。\r\n\r\n```\r\n', '2016-04-10 05:02:11', null, null, null, '0', '0', '0', '寂寞的宁都会议', null, '9', '1', '4', 'http://7xrzeb.com1.z0.glb.clouddn.com/001.%E5%AF%82%E5%AF%9E%E7%9A%84%E5%AE%81%E9%83%BD%E4%BC%9A%E8%AE%AE.jpg', 'http://7xrzeb.com1.z0.glb.clouddn.com/001.%E5%AF%82%E5%AF%9E%E7%9A%84%E5%AE%81%E9%83%BD%E4%BC%9A%E8%AE%AE.mp3'), ('25', null, '0', '### 毛周之怨\r\n----------\r\n\r\n**既有不满，又无法分开** \r\n\r\n```\r\n　　“共生”可能是描述他们两人关系的最适当的词了。毛和周在工作作风和性格上很不相同，但两人在三十七年信任和互相依赖的基础上，相辅相成地进行着合作。他(周恩来)的无私的献身精神，使他成为毛的不可缺少的“另一个我”。\r\n\r\n　　这是两位领导中国人民深刻改变了中国社会面貌的伟人。他们的出身和文化性格相异，他们走上革命道路，选择终生信仰的过程也不尽相同。但他们都是二十世纪的文化精英和时代精神的体现者。他们并肩奋斗，相互辉映，一同走过了半个多世纪的艰难途程，为中国人民的解放和建设事业做出了划时代的贡献，带来深远的历史影响。\r\n\r\n```\r\n', '2016-04-10 05:15:41', null, null, null, '0', '0', '0', '毛周之怨', null, '15', '1', '4', 'http://7xrzeb.com1.z0.glb.clouddn.com/002.%E6%AF%9B%E5%91%A8%E4%B9%8B%E6%80%A8.jpg', 'http://7xrzeb.com1.z0.glb.clouddn.com/002.%E6%AF%9B%E5%91%A8%E4%B9%8B%E6%80%A8.mp3');
COMMIT;

-- ----------------------------
--  Table structure for `up_fileinfo`
-- ----------------------------
DROP TABLE IF EXISTS `up_fileinfo`;
CREATE TABLE `up_fileinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileName` varchar(255) NOT NULL,
  `fileType` varchar(255) NOT NULL,
  `fileSize` bigint(20) NOT NULL,
  `url` varchar(512) DEFAULT NULL,
  `fileKey` varchar(255) DEFAULT NULL,
  `fileHash` varchar(255) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `section_id` int(11) DEFAULT NULL,
  `node_id` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `comment_count` bigint(20) DEFAULT NULL,
  `company` varchar(255) DEFAULT NULL,
  `create_at` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `github` varchar(255) DEFAULT NULL,
  `home_page` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `nick` varchar(255) DEFAULT NULL,
  `number` bigint(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `points` bigint(20) NOT NULL,
  `role` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `topic_count` bigint(20) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `update_at` datetime DEFAULT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`),
  UNIQUE KEY `UK_ob8kqyqqgmefl0aco34akdtpe` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', 'http://7xrtnb.com1.z0.glb.clouddn.com/wodedata180x180.png', null, null, '2016-03-20 16:46:19', null, 'luowei@wodedata.com', null, null, null, 'luowei', '0', 'ab8bbd7e77282a0367ffbb1cd2603132', '0', 'admin', null, null, null, null, 'luowei'), ('2', 'http://7xrtnb.com1.z0.glb.clouddn.com/wodedata180x180.png', null, null, '2016-03-20 18:02:39', null, 'admin@wodedata.com', null, null, null, 'admin', '1', '6eb67c74e9cb2b80630e4ac10c4b4635', '0', 'admin', null, null, null, null, 'admin'), ('4', 'http://7xrtnb.com1.z0.glb.clouddn.com/lidongcheng180x180.png', null, null, '2016-04-09 01:11:19', null, 'lidongcheng@wodedata.com', null, null, null, 'lidongcheng', '2', '60d175585a4e8d1be572aa84a25aa22c', '0', 'editor', null, null, null, null, 'lidongcheng'), ('5', 'http://7xrtnb.com1.z0.glb.clouddn.com/wodedata180x180.png', null, null, '2016-04-09 02:59:04', null, 'abc123@wodedata.com', null, null, null, 'abc123', '3', '7ff2af0c05b01ec2456c6b143d48181a', '0', 'menber', null, null, null, null, 'abc123');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
