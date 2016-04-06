/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_mysql
 Source Server Version : 50163
 Source Host           : localhost
 Source Database       : lidongchengsay

 Target Server Version : 50163
 File Encoding         : utf-8

 Date: 04/06/2016 17:34:10 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

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
INSERT INTO `field` VALUES ('1', 'wodedata', '33333', '1'), ('2', 'wodedata', '233', '2'), ('3', 'wodedata', '233', '3'), ('4', 'wodedata', '233', '4'), ('5', '<!--\r\n<div class=\"row\">\r\n            <div class=\"col-md-4\">\r\n                <h4 class=\"logo\">Spring abc</h4>\r\n                <p class=\"\">\r\n                    向<a href=\"https://pivotal.io/terms-of-use\" target=\"_blank\">Spring 的开发者</a>致敬，积极寻求探索革新之道，改变软件工程世界。这里是专注<a target=\"_blank\" href=\"http://spring.io/\">Spring</a>的中文社区：你可以讨论<a target=\"_blank\" href=\"http://spring.io/\">Spring</a>的话题和查询一系列的<a target=\"_blank\" href=\"http://spring.io/\">Spring</a>文章/资料/教程，有任何跟<a target=\"_blank\" href=\"http://spring.io/projects\">Spring</a>相关的看法见解，都可以在此发表\r\n</p><p>\r\n<strong>Build Up Your Enterprise !</strong>\r\n</p>\r\n                <p></p>\r\n                \r\n            </div>\r\n            <div class=\"col-md-2\">\r\n                <h5>学习资料</h5>\r\n                <ul class=\"list-unstyled\">\r\n                   <li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n                </ul>\r\n            </div>\r\n            <div class=\"col-md-2\">\r\n                <h5>话题讨论</h5>\r\n                <ul class=\"list-unstyled\">\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n                </ul>\r\n            </div>\r\n            <div class=\"col-md-4\">\r\n                <h5>友情链接</h5>\r\n                <div class=\"row\">\r\n                    <div class=\"col-md-6\">\r\n                        <ul class=\"list-unstyled\">\r\n <li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n<li><a href=\"http://spring.io/\" target=\"_blank\">Spring.io</a></li>\r\n                        </ul>\r\n                    </div>\r\n                    <div class=\"col-md-6\">\r\n                        <ul class=\"list-unstyled\">\r\n   <li><a href=\"https://github.com/zh-h/Spring-abc\" target=\"_blank\">GitHub</a></li>\r\n   <li><a href=\"http://spring-abc.xyz/docs.html\" target=\"_blank\">文档</a></li>\r\n                        </ul>\r\n                    </div>\r\n                </div>\r\n            </div>\r\n        </div>\r\n-->', '233', '6'), ('6', 'wodedata,自由技术人社区', '233', '7'), ('7', '<script></script>', '233', '8'), ('8', '<!--\r\n<div class=\"panel-body\">\r\n	  \r\n	  <a href=\"http://www.oneapm.com/ci/docker.html?utm_source=golangtc&utm_medium=logo&utm_term=docker&utm_content=logolink&utm_campaign=NovAds&from=maadfiNoxj\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/oneapm-4.png\" width=\"100%\"></a>\r\n	  \r\n	  <a href=\"http://www.51idc.com/activity/ACCloudHK.html\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/51idc-5.png\" width=\"100%\"></a>\r\n	  \r\n	  <a href=\"https://www.teambition.com/?utm_source=golangtc&utm_medium=banner\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/Teambition-Banner-2.jpg\" width=\"100%\"></a>\r\n	  \r\n	  <a href=\"http://click.aliyun.com/m/1621/\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/aliyun-c7.jpg\" width=\"100%\"></a>\r\n	  \r\n	  <a href=\"http://www.jiankongbao.com/new_docker/?ref=golangtc\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/jiankongbao-7.png\" width=\"100%\"></a>\r\n	  \r\n	  <a href=\"http://www.ucloud.cn/site/active/tic.html?utm_source=cost&utm_campaign=Golang%E7%A4%BE%E5%8C%BA&utm_medium=display&utm_content=tic\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/ucloud-2.jpg\" width=\"100%\"></a>\r\n	  \r\n	</div>\r\n\r\n-->', '233', '9'), ('9', '<!--\r\n<div class=\"panel-body\">\r\n	  \r\n	  <a href=\"http://www.oneapm.com/ci/docker.html?utm_source=golangtc&utm_medium=logo&utm_term=docker&utm_content=logolink&utm_campaign=NovAds&from=maadfiNoxj\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/oneapm-4.png\" width=\"100%\"></a>\r\n	  \r\n	  <a href=\"http://www.51idc.com/activity/ACCloudHK.html\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/51idc-5.png\" width=\"100%\"></a>\r\n	  \r\n	  <a href=\"https://www.teambition.com/?utm_source=golangtc&utm_medium=banner\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/Teambition-Banner-2.jpg\" width=\"100%\"></a>\r\n	  \r\n	  <a href=\"http://click.aliyun.com/m/1621/\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/aliyun-c7.jpg\" width=\"100%\"></a>\r\n	  \r\n	  <a href=\"http://www.jiankongbao.com/new_docker/?ref=golangtc\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/jiankongbao-7.png\" width=\"100%\"></a>\r\n	  \r\n	  <a href=\"http://www.ucloud.cn/site/active/tic.html?utm_source=cost&utm_campaign=Golang%E7%A4%BE%E5%8C%BA&utm_medium=display&utm_content=tic\" target=\"_blank\"><img src=\"http://77fkk5.com1.z0.glb.clouddn.com/bar/ucloud-2.jpg\" width=\"100%\"></a>\r\n	  \r\n	</div>\r\n-->', '233', '10'), ('10', 'wodedata的公告', '233', '11'), ('11', '欢迎来到wodedata!', '233', '12'), ('12', 'tipc_signup', '233', '13'), ('13', '<ul style=\"margin-top: 0px;\">\r\n            <li><span class=\"f13\">主题标题</span><div class=\"sep10\"></div>\r\n            请在标题中描述内容要点。如果一件事情在标题的长度内就已经可以说清楚，那就没有必要写正文了。\r\n            <div class=\"sep10\"></div>\r\n            </li>\r\n            <li><div class=\"fr\" style=\"margin-top: -5px; margin-right: 5px;\"><span class=\"f13\">正文</span><div class=\"sep10\"></div>\r\n            可以在正文中为你要发布的主题添加更多细节。 支持 <span style=\"font-family: Consolas, \'Panic Sans\', mono\"><a href=\"https://help.github.com/articles/github-flavored-markdown\" target=\"_blank\">GitHub Flavored Markdown</a></span> 文本标记语法。\r\n            <div class=\"sep10\"></div>\r\n            在正式提交之前，你可以点击“preview”来查看 Markdown 正文的实际渲染效果。\r\n             <div class=\"sep10\"></div>\r\n             你可以点击“upload” 选择需要的图片后上传后点击插入按钮，插入md的图片标签。\r\n            <div class=\"sep10\"></div>\r\n            </li>\r\n            <li><span class=\"f13\">选择节点</span><div class=\"sep10\"></div>\r\n            请为你的主题选择一个节点。恰当的归类会让你发布的信息更加有用。\r\n            <div class=\"sep10\"></div>\r\n          	如果有必要，管理员会帮助迁移节点\r\n            </li>\r\n           <li><span class=\"f13\">选择节点</span><div class=\"sep10\"></div>\r\n            请为你的主题选择一个节点。恰当的归类会让你发布的信息更加有用。\r\n            <div class=\"sep10\"></div>\r\n          	如果有必要，管理员会帮助迁移节点\r\n            </li>\r\n        </ul>', '233', '14'), ('14', 'tipc_signup', '233', '15'), ('15', '233', '233', '16'), ('16', '233', '233', '17'), ('17', '233', '233', '18'), ('19', '<li class=\"\"><a href=\"/\">话题</a></li>\r\n<li class=\"\"><a href=\"/nodes\">节点</a></li>\r\n<li><a href=\"/users/\" >播客</a></li>\r\n<li><a href=\"http://www.tudou.com/home/rootls\" >Videos</a></li>\r\n<li class=\"\"><a href=\"/docs.html\">文档</a></li>\r\n<li><a href=\"http://wodedata.com\" target=\"_blank\">wodedata.com</a></li>', '233', '5'), ('20', 'admin', 'sfsf', '19');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
INSERT INTO `node` VALUES ('1', null, '这是李东成说的毛时代', '1', '毛时代', '0', '1'), ('2', null, '李东成说之潜伏下的军统', '0', '潜伏下的军统', '0', '1'), ('3', null, '李东成说之解密中共五大野战军', '0', '五大野战军', '0', '1'), ('4', null, '李东成说之奇葩说民国', '0', '奇葩说民国', '0', '1'), ('5', null, '李东成说之晚清那些人和事', '0', '晚清那些人和事', '0', '1'), ('25', null, '天方夜谈之听我来聊聊技术', '3', '听我来聊聊技术', '0', '2'), ('26', null, '天方夜谈之都说说有哪些好用的App', '1', '都说说有哪些好用的App', '0', '2');
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
INSERT INTO `notification` VALUES ('1', '0', '1', '1', '回复');
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
INSERT INTO `section` VALUES ('1', '李东成说', '0'), ('2', '天方夜谈', '0');
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
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `topic`
-- ----------------------------
BEGIN;
INSERT INTO `topic` VALUES ('1', null, '0', '李东成说毛时代第1集', '2016-03-20 21:36:11', null, null, null, '0', '0', '0', '李东成说毛时代第1集', null, '32', '1', '1', null, null), ('19', null, '0', '# 标题\r\n----------\r\n\r\n## 子标题 ##\r\n\r\n```\r\n这里填写文本内容...\r\n这里填写文本内容...\r\n这里填写文本内容...\r\n这里填写文本内容...\r\n\r\n```\r\n\r\n\r\n----------\r\n\r\n\r\n[我的data首页](http://wodedata.com)\r\n\r\n**打赏开发者: **\r\n\r\n![图片描述](http://7xrtnb.com1.z0.glb.clouddn.com/images%2Fme%2Fwechat_payme.jpg)', '2016-03-28 14:15:22', null, null, null, '0', '0', '0', 'aaabbbcccdddeeefffggghhhiiijjjkkkmmmnnnllloooppp', null, '7', '25', '1', null, null), ('20', null, '0', '# 标题\r\n----------\r\n\r\n## 子标题 ##\r\n\r\n```\r\naaaaaaaaaaaa\r\n\r\n这里填写文本内容...\r\n这里填写文本内容...\r\n这里填写文本内容...\r\n这里填写文本内容...\r\n\r\n```\r\n\r\n\r\n----------\r\n\r\n\r\n[我的data首页](http://wodedata.com)\r\n                     \r\n                            \r\n                            \r\n                            \r\n                            \r\n                            ', '2016-03-28 15:10:43', null, null, null, '0', '0', '0', '上传文件测试....', null, '42', '25', '1', null, null), ('21', null, '1', '# 好用的App有很多\r\n----------\r\n\r\n## 子标题 ##\r\n\r\n```\r\n这里填写文本内容...\r\n这里填写文本内容...\r\n这里填写文本内容...\r\n这里填写文本内容...\r\n\r\n```\r\n\r\n\r\n----------\r\n\r\n\r\n![2016-04-04-3a0b4fc6-8173-4e5a-811c-197ef942f723](http://7xrzeb.com1.z0.glb.clouddn.com/2016-04-04-3a0b4fc6-8173-4e5a-811c-197ef942f723)\r\n\r\n\r\n\r\n', '2016-04-04 23:42:06', null, null, null, '0', '0', '0', '好用的App有很多....', null, '3', '26', '1', null, null), ('22', null, '0', '# 整风运动的风和雨\r\n----------\r\n\r\n## 整风运动的风和雨 ##\r\n\r\n```\r\n整风运动的风和雨\r\n这里填写文本内容...\r\n这里填写文本内容...\r\n这里填写文本内容...\r\n这里填写文本内容...\r\n\r\n```\r\n\r\n\r\n----------\r\n\r\n\r\n[我的data首页](http://wodedata.com)\r\n\r\n**打赏开发者: **\r\n\r\n![图片描述](http://7xrtnb.com1.z0.glb.clouddn.com/images%2Fme%2Fwechat_payme.jpg)', '2016-04-06 02:27:55', null, null, null, '0', '0', '0', '整风运动的风和雨', null, '1', '1', '1', 'undefined', 'undefined'), ('23', null, '0', '# 潜伏下的军统蛮有意思的\r\n----------\r\n新修改了图片和音频。。。\r\n再修改了图片和音频。。。\r\n\r\n## 潜伏下的军统蛮有意思的。。。。 ##\r\n\r\n```\r\n这里填写文本内容...\r\n这里填写文本内容...\r\n这里填写文本内容...\r\n这里填写文本内容...\r\n\r\n```\r\n\r\n\r\n----------\r\n\r\n\r\n[我的data首页](http://wodedata.com)\r\n\r\n', '2016-04-06 03:21:23', null, null, null, '0', '0', '0', '潜伏下的军统蛮有意思的', null, '51', '2', '1', 'http://7xrzeb.com1.z0.glb.clouddn.com/2016-04-06-b344ac89-692b-46ef-9e0b-b1707c48725c', 'http://7xrzeb.com1.z0.glb.clouddn.com/2016-04-06-c8c269e5-253c-4e2e-8bbc-bb1815ca9779');
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
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `up_fileinfo`
-- ----------------------------
BEGIN;
INSERT INTO `up_fileinfo` VALUES ('99', 'ABirdInAHeavyStorm.jpg', 'image/jpeg', '373270', 'http://7xrzeb.com1.z0.glb.clouddn.com/2016-04-06-b344ac89-692b-46ef-9e0b-b1707c48725c', '2016-04-06-b344ac89-692b-46ef-9e0b-b1707c48725c', 'Fo_3GRZpFklubvBfoVIv3uK_Zrga', '2016-04-06 17:30:40', '1', '2', '23'), ('100', 'WantASingle.mp3', 'audio/mp3', '3193246', 'http://7xrzeb.com1.z0.glb.clouddn.com/2016-04-06-c8c269e5-253c-4e2e-8bbc-bb1815ca9779', '2016-04-06-c8c269e5-253c-4e2e-8bbc-bb1815ca9779', 'FvKz0_ybgyUST_CTxb8hCl2zzedc', '2016-04-06 17:32:21', '1', '2', '23');
COMMIT;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', 'http://7xrtnb.com1.z0.glb.clouddn.com/images%2Flogo%2Fwodedata180x180.png', null, null, '2016-03-20 16:46:19', null, 'luowei@wodedata.com', null, null, null, 'luowei', '0', 'ab8bbd7e77282a0367ffbb1cd2603132', '0', 'admin', null, null, null, null, 'luowei'), ('2', 'http://7xrtnb.com1.z0.glb.clouddn.com/images%2Flogo%2Fwodedata180x180.png', null, null, '2016-03-20 18:02:39', null, 'admin@wodedata.com', null, null, null, 'admin', '1', '6eb67c74e9cb2b80630e4ac10c4b4635', '0', 'admin', null, null, null, null, 'admin');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
