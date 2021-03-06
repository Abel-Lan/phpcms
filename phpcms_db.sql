/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : phpcms_db

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2021-03-21 01:02:48
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for v9_admin
-- ----------------------------
DROP TABLE IF EXISTS `v9_admin`;
CREATE TABLE `v9_admin` (
  `userid` mediumint(6) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `roleid` smallint(5) DEFAULT '0',
  `encrypt` varchar(6) DEFAULT NULL,
  `lastloginip` varchar(15) DEFAULT NULL,
  `lastlogintime` int(10) unsigned DEFAULT '0',
  `email` varchar(40) DEFAULT NULL,
  `realname` varchar(50) NOT NULL DEFAULT '',
  `card` varchar(255) NOT NULL,
  `lang` varchar(6) NOT NULL,
  PRIMARY KEY (`userid`),
  KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_admin
-- ----------------------------
INSERT INTO `v9_admin` VALUES ('1', 'admin', '1fbc5f794fad2e23436ec74b827ea890', '1', 'DaINMc', '127.0.0.1', '1553100531', '1215551519@qq.com', '', '', '');

-- ----------------------------
-- Table structure for v9_admin_panel
-- ----------------------------
DROP TABLE IF EXISTS `v9_admin_panel`;
CREATE TABLE `v9_admin_panel` (
  `menuid` mediumint(8) unsigned NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(32) DEFAULT NULL,
  `url` char(255) DEFAULT NULL,
  `datetime` int(10) unsigned DEFAULT '0',
  UNIQUE KEY `userid` (`menuid`,`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_admin_panel
-- ----------------------------

-- ----------------------------
-- Table structure for v9_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `v9_admin_role`;
CREATE TABLE `v9_admin_role` (
  `roleid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `rolename` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`roleid`),
  KEY `listorder` (`listorder`),
  KEY `disabled` (`disabled`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_admin_role
-- ----------------------------
INSERT INTO `v9_admin_role` VALUES ('1', '???????????????', '???????????????', '0', '0');
INSERT INTO `v9_admin_role` VALUES ('2', '???????????????', '???????????????', '0', '0');
INSERT INTO `v9_admin_role` VALUES ('3', '????????????', '????????????', '1', '0');
INSERT INTO `v9_admin_role` VALUES ('4', '??????', '??????', '5', '0');
INSERT INTO `v9_admin_role` VALUES ('5', '??????', '??????', '1', '0');
INSERT INTO `v9_admin_role` VALUES ('7', '????????????', '????????????', '0', '0');

-- ----------------------------
-- Table structure for v9_admin_role_priv
-- ----------------------------
DROP TABLE IF EXISTS `v9_admin_role_priv`;
CREATE TABLE `v9_admin_role_priv` (
  `roleid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(30) NOT NULL DEFAULT '',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `roleid` (`roleid`,`m`,`c`,`a`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_admin_role_priv
-- ----------------------------

-- ----------------------------
-- Table structure for v9_announce
-- ----------------------------
DROP TABLE IF EXISTS `v9_announce`;
CREATE TABLE `v9_announce` (
  `aid` smallint(4) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `content` text NOT NULL,
  `starttime` date NOT NULL DEFAULT '1000-01-01',
  `endtime` date NOT NULL DEFAULT '1000-01-01',
  `username` varchar(40) NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` smallint(5) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `style` char(15) NOT NULL,
  `show_template` char(30) NOT NULL,
  PRIMARY KEY (`aid`),
  KEY `siteid` (`siteid`,`passed`,`endtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_announce
-- ----------------------------

-- ----------------------------
-- Table structure for v9_attachment
-- ----------------------------
DROP TABLE IF EXISTS `v9_attachment`;
CREATE TABLE `v9_attachment` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `module` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `filename` char(50) NOT NULL,
  `filepath` char(200) NOT NULL,
  `filesize` int(10) unsigned NOT NULL DEFAULT '0',
  `fileext` char(10) NOT NULL,
  `isimage` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isthumb` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `uploadtime` int(10) unsigned NOT NULL DEFAULT '0',
  `uploadip` char(15) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `authcode` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`aid`),
  KEY `authcode` (`authcode`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for v9_attachment_index
-- ----------------------------
DROP TABLE IF EXISTS `v9_attachment_index`;
CREATE TABLE `v9_attachment_index` (
  `keyid` char(30) NOT NULL,
  `aid` char(10) NOT NULL,
  KEY `keyid` (`keyid`),
  KEY `aid` (`aid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_attachment_index
-- ----------------------------

-- ----------------------------
-- Table structure for v9_badword
-- ----------------------------
DROP TABLE IF EXISTS `v9_badword`;
CREATE TABLE `v9_badword` (
  `badid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `badword` char(20) NOT NULL,
  `level` tinyint(5) NOT NULL DEFAULT '1',
  `replaceword` char(20) NOT NULL DEFAULT '0',
  `lastusetime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`badid`),
  UNIQUE KEY `badword` (`badword`),
  KEY `usetimes` (`replaceword`,`listorder`),
  KEY `hits` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_badword
-- ----------------------------

-- ----------------------------
-- Table structure for v9_block
-- ----------------------------
DROP TABLE IF EXISTS `v9_block`;
CREATE TABLE `v9_block` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `name` char(50) DEFAULT NULL,
  `pos` char(30) DEFAULT NULL,
  `type` tinyint(1) DEFAULT '0',
  `data` text,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `pos` (`pos`),
  KEY `type` (`type`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_block
-- ----------------------------

-- ----------------------------
-- Table structure for v9_block_history
-- ----------------------------
DROP TABLE IF EXISTS `v9_block_history`;
CREATE TABLE `v9_block_history` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `blockid` int(10) unsigned DEFAULT '0',
  `data` text,
  `creat_at` int(10) unsigned DEFAULT '0',
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_block_history
-- ----------------------------

-- ----------------------------
-- Table structure for v9_block_priv
-- ----------------------------
DROP TABLE IF EXISTS `v9_block_priv`;
CREATE TABLE `v9_block_priv` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `siteid` smallint(5) unsigned DEFAULT '0',
  `blockid` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `blockid` (`blockid`),
  KEY `roleid` (`roleid`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_block_priv
-- ----------------------------

-- ----------------------------
-- Table structure for v9_cache
-- ----------------------------
DROP TABLE IF EXISTS `v9_cache`;
CREATE TABLE `v9_cache` (
  `filename` char(50) NOT NULL,
  `path` char(50) NOT NULL,
  `data` mediumtext NOT NULL,
  PRIMARY KEY (`filename`,`path`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_cache
-- ----------------------------
INSERT INTO `v9_cache` VALUES ('mood_program.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    1 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'??????\',\n      \'pic\' => \'mood/a1.gif\',\n    ),\n    2 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'??????\',\n      \'pic\' => \'mood/a2.gif\',\n    ),\n    3 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'??????\',\n      \'pic\' => \'mood/a3.gif\',\n    ),\n    4 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'??????\',\n      \'pic\' => \'mood/a4.gif\',\n    ),\n    5 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'??????\',\n      \'pic\' => \'mood/a5.gif\',\n    ),\n    6 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'??????\',\n      \'pic\' => \'mood/a6.gif\',\n    ),\n    7 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'??????\',\n      \'pic\' => \'mood/a7.gif\',\n    ),\n    8 => \n    array (\n      \'use\' => \'1\',\n      \'name\' => \'??????\',\n      \'pic\' => \'mood/a8.gif\',\n    ),\n    9 => \n    array (\n      \'use\' => NULL,\n      \'name\' => \'\',\n      \'pic\' => \'\',\n    ),\n    10 => \n    array (\n      \'use\' => NULL,\n      \'name\' => \'\',\n      \'pic\' => \'\',\n    ),\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES ('category_content.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \'1\',\n  2 => \'1\',\n  3 => \'1\',\n  4 => \'1\',\n  5 => \'1\',\n);\n?>');
INSERT INTO `v9_cache` VALUES ('category_content_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'catid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'0\',\n    \'arrparentid\' => \'0\',\n    \'child\' => \'1\',\n    \'arrchildid\' => \'1,2,3,5,162\',\n    \'catname\' => \'????????????\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'\',\n    \'catdir\' => \'about\',\n    \'url\' => \'/html/about/\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'1\\\',\n  \\\'template_list\\\' => \\\'default\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'1\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'1\',\n    \'ismenu\' => \'0\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'wangzhanjieshao\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  2 => \n  array (\n    \'catid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'1\',\n    \'arrparentid\' => \'0,1\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'2\',\n    \'catname\' => \'????????????\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'about/\',\n    \'catdir\' => \'aboutus\',\n    \'url\' => \'/html/about/aboutus/\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'1\\\',\n  \\\'template_list\\\' => \\\'default\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'????????????\\\',\n  \\\'meta_keywords\\\' => \\\'????????????\\\',\n  \\\'meta_description\\\' => \\\'????????????\\\',\n  \\\'category_ruleid\\\' => \\\'1\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'1\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'guanyuwomen\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  3 => \n  array (\n    \'catid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'1\',\n    \'arrparentid\' => \'0,1\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'3\',\n    \'catname\' => \'????????????\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'about/\',\n    \'catdir\' => \'contactus\',\n    \'url\' => \'/html/about/contactus/\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'1\\\',\n  \\\'template_list\\\' => \\\'default\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'????????????\\\',\n  \\\'meta_keywords\\\' => \\\'????????????\\\',\n  \\\'meta_description\\\' => \\\'????????????\\\',\n  \\\'category_ruleid\\\' => \\\'1\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'2\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'lianxifangshi\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  4 => \n  array (\n    \'catid\' => \'4\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'1\',\n    \'arrparentid\' => \'0,1\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'4\',\n    \'catname\' => \'????????????\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'about/\',\n    \'catdir\' => \'copyright\',\n    \'url\' => \'http://test.phpcms.cn/index.php?m=content&c=index&a=lists&catid=4\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'0\\\',\n  \\\'template_list\\\' => \\\'default\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'????????????\\\',\n  \\\'meta_keywords\\\' => \\\'????????????\\\',\n  \\\'meta_description\\\' => \\\'????????????\\\',\n  \\\'category_ruleid\\\' => \\\'6\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'3\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'banquanshengming\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'0\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'6\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n  5 => \n  array (\n    \'catid\' => \'5\',\n    \'siteid\' => \'1\',\n    \'type\' => \'1\',\n    \'modelid\' => \'0\',\n    \'parentid\' => \'1\',\n    \'arrparentid\' => \'0,1\',\n    \'child\' => \'0\',\n    \'arrchildid\' => \'5\',\n    \'catname\' => \'????????????\',\n    \'style\' => \'\',\n    \'image\' => \'\',\n    \'description\' => \'\',\n    \'parentdir\' => \'about/\',\n    \'catdir\' => \'hr\',\n    \'url\' => \'/html/about/hr/\',\n    \'items\' => \'0\',\n    \'hits\' => \'0\',\n    \'setting\' => \'array (\n  \\\'ishtml\\\' => \\\'1\\\',\n  \\\'template_list\\\' => \\\'default\\\',\n  \\\'page_template\\\' => \\\'page\\\',\n  \\\'meta_title\\\' => \\\'\\\',\n  \\\'meta_keywords\\\' => \\\'\\\',\n  \\\'meta_description\\\' => \\\'\\\',\n  \\\'category_ruleid\\\' => \\\'1\\\',\n  \\\'show_ruleid\\\' => \\\'\\\',\n  \\\'repeatchargedays\\\' => \\\'1\\\',\n)\',\n    \'listorder\' => \'4\',\n    \'ismenu\' => \'1\',\n    \'sethtml\' => \'0\',\n    \'letter\' => \'zhaopinxinxi\',\n    \'usable_type\' => \'\',\n    \'create_to_html_root\' => NULL,\n    \'ishtml\' => \'1\',\n    \'content_ishtml\' => NULL,\n    \'category_ruleid\' => \'1\',\n    \'show_ruleid\' => \'\',\n    \'workflowid\' => NULL,\n    \'isdomain\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES ('sitelist.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'siteid\' => \'1\',\n    \'name\' => \'????????????\',\n    \'dirname\' => \'\',\n    \'domain\' => \'http://phpcms.com/\',\n    \'site_title\' => \'PHPCMS?????????\',\n    \'keywords\' => \'PHPCMS?????????\',\n    \'description\' => \'PHPCMS?????????\',\n    \'release_point\' => \'\',\n    \'default_style\' => \'default\',\n    \'template\' => \'default\',\n    \'setting\' => \'array (\n  \\\'upload_maxsize\\\' => \\\'2048\\\',\n  \\\'upload_allowext\\\' => \\\'jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\\\',\n  \\\'watermark_enable\\\' => \\\'1\\\',\n  \\\'watermark_minwidth\\\' => \\\'300\\\',\n  \\\'watermark_minheight\\\' => \\\'300\\\',\n  \\\'watermark_img\\\' => \\\'/statics/images/water/mark.png\\\',\n  \\\'watermark_pct\\\' => \\\'85\\\',\n  \\\'watermark_quality\\\' => \\\'80\\\',\n  \\\'watermark_pos\\\' => \\\'9\\\',\n)\',\n    \'uuid\' => \'\',\n    \'url\' => \'http://phpcms.com/\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES ('downservers.cache.php', 'caches_commons/caches_data/', '<?php\nreturn NULL;\n?>');
INSERT INTO `v9_cache` VALUES ('badword.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES ('ipbanned.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES ('keylink.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES ('position.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  2 => \n  array (\n    \'posid\' => \'2\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'??????????????????\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'4\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  1 => \n  array (\n    \'posid\' => \'1\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'?????????????????????\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'1\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  16 => \n  array (\n    \'posid\' => \'16\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'????????????????????????\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  15 => \n  array (\n    \'posid\' => \'15\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'????????????????????????\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  14 => \n  array (\n    \'posid\' => \'14\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'?????????????????????\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  12 => \n  array (\n    \'posid\' => \'12\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'??????????????????\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  10 => \n  array (\n    \'posid\' => \'10\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'??????????????????\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  9 => \n  array (\n    \'posid\' => \'9\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'??????????????????\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  8 => \n  array (\n    \'posid\' => \'8\',\n    \'modelid\' => \'30\',\n    \'catid\' => \'54\',\n    \'name\' => \'???????????????????????????\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  5 => \n  array (\n    \'posid\' => \'5\',\n    \'modelid\' => \'69\',\n    \'catid\' => \'0\',\n    \'name\' => \'????????????\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  13 => \n  array (\n    \'posid\' => \'13\',\n    \'modelid\' => \'82\',\n    \'catid\' => \'0\',\n    \'name\' => \'??????????????????\',\n    \'maxnum\' => \'20\',\n    \'extention\' => NULL,\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n  17 => \n  array (\n    \'posid\' => \'17\',\n    \'modelid\' => \'0\',\n    \'catid\' => \'0\',\n    \'name\' => \'????????????????????????\',\n    \'maxnum\' => \'20\',\n    \'extention\' => \'\',\n    \'listorder\' => \'0\',\n    \'siteid\' => \'1\',\n    \'thumb\' => \'\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES ('role_siteid.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES ('role.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \'???????????????\',\n  2 => \'???????????????\',\n  3 => \'????????????\',\n  4 => \'??????\',\n  5 => \'??????\',\n  7 => \'????????????\',\n);\n?>');
INSERT INTO `v9_cache` VALUES ('urlrules_detail.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'urlruleid\' => \'1\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n    \'example\' => \'news/china/1000.html\',\n  ),\n  6 => \n  array (\n    \'urlruleid\' => \'6\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=lists&catid=1&page=1\',\n  ),\n  11 => \n  array (\n    \'urlruleid\' => \'11\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'2010/catdir_0720/1_2.html\',\n  ),\n  12 => \n  array (\n    \'urlruleid\' => \'12\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'1\',\n    \'urlrule\' => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n    \'example\' => \'it/product/2010/0720/1_2.html\',\n  ),\n  16 => \n  array (\n    \'urlruleid\' => \'16\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n    \'example\' => \'index.php?m=content&c=index&a=show&catid=1&id=1\',\n  ),\n  17 => \n  array (\n    \'urlruleid\' => \'17\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'show-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'show-1-2-1.html\',\n  ),\n  18 => \n  array (\n    \'urlruleid\' => \'18\',\n    \'module\' => \'content\',\n    \'file\' => \'show\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'content-{$catid}-{$id}-{$page}.html\',\n    \'example\' => \'content-1-2-1.html\',\n  ),\n  30 => \n  array (\n    \'urlruleid\' => \'30\',\n    \'module\' => \'content\',\n    \'file\' => \'category\',\n    \'ishtml\' => \'0\',\n    \'urlrule\' => \'list-{$catid}-{$page}.html\',\n    \'example\' => \'list-1-1.html\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES ('urlrules.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \'{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html\',\n  6 => \'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}\',\n  11 => \'{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html\',\n  12 => \'{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html\',\n  16 => \'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}\',\n  17 => \'show-{$catid}-{$id}-{$page}.html\',\n  18 => \'content-{$catid}-{$id}-{$page}.html\',\n  30 => \'list-{$catid}-{$page}.html\',\n);\n?>');
INSERT INTO `v9_cache` VALUES ('modules.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  \'admin\' => \n  array (\n    \'module\' => \'admin\',\n    \'name\' => \'admin\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'admin_email\\\' => \\\'phpcms@phpcms.cn\\\',\n  \\\'adminaccessip\\\' => \\\'0\\\',\n  \\\'maxloginfailedtimes\\\' => \\\'8\\\',\n  \\\'maxiplockedtime\\\' => \\\'15\\\',\n  \\\'minrefreshtime\\\' => \\\'2\\\',\n  \\\'mail_type\\\' => \\\'1\\\',\n  \\\'mail_server\\\' => \\\'smtp.qq.com\\\',\n  \\\'mail_port\\\' => \\\'25\\\',\n  \\\'mail_user\\\' => \\\'phpcms.cn@foxmail.com\\\',\n  \\\'mail_auth\\\' => \\\'1\\\',\n  \\\'mail_from\\\' => \\\'phpcms.cn@foxmail.com\\\',\n  \\\'mail_password\\\' => \\\'\\\',\n  \\\'errorlog_size\\\' => \\\'20\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-10-18\',\n    \'updatedate\' => \'2010-10-18\',\n  ),\n  \'member\' => \n  array (\n    \'module\' => \'member\',\n    \'name\' => \'??????\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'allowregister\\\' => \\\'1\\\',\n  \\\'choosemodel\\\' => \\\'1\\\',\n  \\\'enablemailcheck\\\' => \\\'0\\\',\n  \\\'registerverify\\\' => \\\'0\\\',\n  \\\'showapppoint\\\' => \\\'0\\\',\n  \\\'rmb_point_rate\\\' => \\\'10\\\',\n  \\\'defualtpoint\\\' => \\\'0\\\',\n  \\\'defualtamount\\\' => \\\'0\\\',\n  \\\'showregprotocol\\\' => \\\'0\\\',\n  \\\'regprotocol\\\' => \\\'		 ?????????????????????phpcms??????\r\n?????????????????????????????????????????????????????????????????????????????? \r\n1?????????????????????????????????\r\n??????phpcms???????????????????????????????????????phpcms?????????phpcms????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? ???????????????????????????phpcms?????????????????????????????????????????????\r\n2??? phpcms????????????\r\n??????phpcms?????????????????????????????????????????????????????????????????????????????????????????????????????????BBS??????????????????\r\n????????????????????? \r\n??????1)??????????????????????????????????????????????????????????????????????????????????????? \r\n??????2)????????????????????????????????????????????????????????????????????????\r\n????????????????????? \r\n??????1)???????????????????????????????????????????????? \r\n??????2)??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? \r\n??????3)????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????phpcms??????????????????????????????????????????????????????????????????phpcms???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????\r\n3??? ?????????????????????\r\n??????phpcms???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? ?????????????????????????????????????????????????????????????????????\r\n4??? ????????????\r\n??????phpcms??????????????????????????????????????????????????????????????????phpcms???????????????????????????????????????????????????????????????????????????\r\n5??? ??????????????????\r\n?????????????????????????????????phpcms??? ???????????????phpcms???????????????????????????????????????????????????????????????????????????????????????phpcms????????????????????????????????????????????????????????????????????????????????? \r\n??????1)?????????????????????????????????????????????????????? \r\n??????2)????????????phpcms????????????????????? \r\n??????3)??????????????????????????????????????????????????????????????????????????? \r\n??????4)?????????????????????????????? \r\n6???????????????????????????????????????\r\n??????????????????????????????phpcms????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????phpcms???\r\n7??? ????????????\r\n??????????????????????????????????????????????????????????????????????????? ?????? \r\n??????phpcms????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????phpcms????????????????????????????????????????????????????????????????????????????????????????????????????????? \r\n8???????????????\r\n??????phpcms???????????????????????????????????????????????????????????????????????????\r\n9??? ????????????????????????????????? \r\n???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????phpcms?????????????????????????????????????????????????????????????????????\r\n10??????????????? \r\n????????????????????????????????????????????????????????????????????? \r\n??????1)?????????????????????????????????????????????????????????????????????????????? \r\n??????2)??????????????????????????????????????? \r\n??????3)????????????????????????????????? \r\n??????4)????????????BBS??????????????????????????????????????????????????? \r\n??????5)???????????????????????????????????????????????????????????????????????????\r\n??????6)????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????\r\n??????7)????????????????????????????????????????????????????????? \r\n?????????1??????????????????????????????????????????????????????????????????\r\n?????????2????????????????????????????????????????????????????????????\r\n?????????3????????????????????????????????????????????????\r\n?????????4???????????????????????????????????????????????????????????????\r\n?????????5?????????????????????????????????????????????????????????????????????\r\n?????????6????????????????????????????????????????????????????????????????????????????????????????????????\r\n?????????7?????????????????????????????????????????????????????????????????????????????????????????????\r\n?????????8?????????????????????????????????\r\n?????????9????????????????????????????????????????????????\r\n?????????10?????????????????????????????????\r\n???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????phpcms??????????????????????????????\r\n11???????????????????????????\r\n??????phpcms???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????phpcms????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????phpcms???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????\r\n12?????????????????????\r\n?????????????????????phpcms?????????????????????????????????????????????phpcms????????????????????????????????????\r\n13????????????\r\n????????????????????????????????????phpcms?????????????????????????????????????????????????????????????????????????????????????????????????????????????????? \\\',\n  \\\'registerverifymessage\\\' => \\\' ?????????????????????phpcms???????????????????????????????????????????????????????????????????????????{click}\r\n????????????????????????????????????{url}\\\',\n  \\\'forgetpassword\\\' => \\\' phpcms??????????????????????????????????????????????????????????????????{click}\r\n????????????????????????????????????{url}\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'pay\' => \n  array (\n    \'module\' => \'pay\',\n    \'name\' => \'??????\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'digg\' => \n  array (\n    \'module\' => \'digg\',\n    \'name\' => \'?????????\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'special\' => \n  array (\n    \'module\' => \'special\',\n    \'name\' => \'??????\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'content\' => \n  array (\n    \'module\' => \'content\',\n    \'name\' => \'????????????\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'search\' => \n  array (\n    \'module\' => \'search\',\n    \'name\' => \'????????????\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  \\\'fulltextenble\\\' => \\\'1\\\',\n  \\\'relationenble\\\' => \\\'1\\\',\n  \\\'suggestenable\\\' => \\\'1\\\',\n  \\\'sphinxenable\\\' => \\\'0\\\',\n  \\\'sphinxhost\\\' => \\\'10.228.134.102\\\',\n  \\\'sphinxport\\\' => \\\'9312\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'scan\' => \n  array (\n    \'module\' => \'scan\',\n    \'name\' => \'????????????\',\n    \'url\' => \'scan\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'attachment\' => \n  array (\n    \'module\' => \'attachment\',\n    \'name\' => \'??????\',\n    \'url\' => \'attachment\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'block\' => \n  array (\n    \'module\' => \'block\',\n    \'name\' => \'??????\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'collection\' => \n  array (\n    \'module\' => \'collection\',\n    \'name\' => \'????????????\',\n    \'url\' => \'collection\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'dbsource\' => \n  array (\n    \'module\' => \'dbsource\',\n    \'name\' => \'?????????\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'template\' => \n  array (\n    \'module\' => \'template\',\n    \'name\' => \'????????????\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'release\' => \n  array (\n    \'module\' => \'release\',\n    \'name\' => \'?????????\',\n    \'url\' => \'\',\n    \'iscore\' => \'1\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-01\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'video\' => \n  array (\n    \'module\' => \'video\',\n    \'name\' => \'?????????\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2012-09-28\',\n    \'updatedate\' => \'2012-09-28\',\n  ),\n  \'announce\' => \n  array (\n    \'module\' => \'announce\',\n    \'name\' => \'??????\',\n    \'url\' => \'announce/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'??????\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2019-03-21\',\n    \'updatedate\' => \'2019-03-21\',\n  ),\n  \'comment\' => \n  array (\n    \'module\' => \'comment\',\n    \'name\' => \'??????\',\n    \'url\' => \'comment/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'??????\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2019-03-21\',\n    \'updatedate\' => \'2019-03-21\',\n  ),\n  \'link\' => \n  array (\n    \'module\' => \'link\',\n    \'name\' => \'????????????\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\n  1 => \n  array (\n    \\\'is_post\\\' => \\\'1\\\',\n    \\\'enablecheckcode\\\' => \\\'0\\\',\n  ),\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'vote\' => \n  array (\n    \'module\' => \'vote\',\n    \'name\' => \'??????\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'array (\r\n  1 => \r\n  array (\r\n    \\\'default_style\\\' => \\\'default\\\',\r\n    \\\'vote_tp_template\\\' => \\\'vote_tp\\\',\r\n    \\\'allowguest\\\' => \\\'1\\\',\r\n    \\\'enabled\\\' => \\\'1\\\',\r\n    \\\'interval\\\' => \\\'1\\\',\r\n    \\\'credit\\\' => \\\'1\\\',\r\n  ),\r\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'message\' => \n  array (\n    \'module\' => \'message\',\n    \'name\' => \'?????????\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-09-06\',\n    \'updatedate\' => \'2010-09-06\',\n  ),\n  \'mood\' => \n  array (\n    \'module\' => \'mood\',\n    \'name\' => \'????????????\',\n    \'url\' => \'mood/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'????????????\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2019-03-21\',\n    \'updatedate\' => \'2019-03-21\',\n  ),\n  \'poster\' => \n  array (\n    \'module\' => \'poster\',\n    \'name\' => \'????????????\',\n    \'url\' => \'poster/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'????????????\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2019-03-21\',\n    \'updatedate\' => \'2019-03-21\',\n  ),\n  \'formguide\' => \n  array (\n    \'module\' => \'formguide\',\n    \'name\' => \'????????????\',\n    \'url\' => \'formguide/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'formguide\',\n    \'setting\' => \'array (\n  \\\'allowmultisubmit\\\' => \\\'1\\\',\n  \\\'interval\\\' => \\\'30\\\',\n  \\\'allowunreg\\\' => \\\'0\\\',\n  \\\'mailmessage\\\' => \\\'????????????????????????????????????????????????????????????\\\',\n)\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2010-10-20\',\n    \'updatedate\' => \'2010-10-20\',\n  ),\n  \'wap\' => \n  array (\n    \'module\' => \'wap\',\n    \'name\' => \'????????????\',\n    \'url\' => \'wap/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'????????????\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2019-03-21\',\n    \'updatedate\' => \'2019-03-21\',\n  ),\n  \'upgrade\' => \n  array (\n    \'module\' => \'upgrade\',\n    \'name\' => \'????????????\',\n    \'url\' => \'\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2011-05-18\',\n    \'updatedate\' => \'2011-05-18\',\n  ),\n  \'tag\' => \n  array (\n    \'module\' => \'tag\',\n    \'name\' => \'????????????\',\n    \'url\' => \'tag/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'????????????\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2019-03-21\',\n    \'updatedate\' => \'2019-03-21\',\n  ),\n  \'sms\' => \n  array (\n    \'module\' => \'sms\',\n    \'name\' => \'????????????\',\n    \'url\' => \'sms/\',\n    \'iscore\' => \'0\',\n    \'version\' => \'1.0\',\n    \'description\' => \'????????????\',\n    \'setting\' => \'\',\n    \'listorder\' => \'0\',\n    \'disabled\' => \'0\',\n    \'installdate\' => \'2011-09-02\',\n    \'updatedate\' => \'2011-09-02\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES ('model.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'modelid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'name\' => \'????????????\',\n    \'description\' => \'\',\n    \'tablename\' => \'news\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category\',\n    \'list_template\' => \'list\',\n    \'show_template\' => \'show\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  2 => \n  array (\n    \'modelid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'name\' => \'????????????\',\n    \'description\' => \'\',\n    \'tablename\' => \'download\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_download\',\n    \'list_template\' => \'list_download\',\n    \'show_template\' => \'show_download\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  3 => \n  array (\n    \'modelid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'name\' => \'????????????\',\n    \'description\' => \'\',\n    \'tablename\' => \'picture\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_picture\',\n    \'list_template\' => \'list_picture\',\n    \'show_template\' => \'show_picture\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n  11 => \n  array (\n    \'modelid\' => \'11\',\n    \'siteid\' => \'1\',\n    \'name\' => \'????????????\',\n    \'description\' => \'\',\n    \'tablename\' => \'video\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'default\',\n    \'category_template\' => \'category_video\',\n    \'list_template\' => \'list_video\',\n    \'show_template\' => \'show_video\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES ('workflow_1.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  1 => \n  array (\n    \'workflowid\' => \'1\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'1\',\n    \'workname\' => \'????????????\',\n    \'description\' => \'????????????\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  2 => \n  array (\n    \'workflowid\' => \'2\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'2\',\n    \'workname\' => \'????????????\',\n    \'description\' => \'????????????\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  3 => \n  array (\n    \'workflowid\' => \'3\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'3\',\n    \'workname\' => \'????????????\',\n    \'description\' => \'????????????\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n  4 => \n  array (\n    \'workflowid\' => \'4\',\n    \'siteid\' => \'1\',\n    \'steps\' => \'4\',\n    \'workname\' => \'????????????\',\n    \'description\' => \'????????????\',\n    \'setting\' => \'\',\n    \'flag\' => \'0\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES ('member_model.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  10 => \n  array (\n    \'modelid\' => \'10\',\n    \'siteid\' => \'1\',\n    \'name\' => \'????????????\',\n    \'description\' => \'????????????\',\n    \'tablename\' => \'member_detail\',\n    \'setting\' => \'\',\n    \'addtime\' => \'0\',\n    \'items\' => \'0\',\n    \'enablesearch\' => \'1\',\n    \'disabled\' => \'0\',\n    \'default_style\' => \'\',\n    \'category_template\' => \'\',\n    \'list_template\' => \'\',\n    \'show_template\' => \'\',\n    \'js_template\' => \'\',\n    \'admin_list_template\' => \'\',\n    \'member_add_template\' => \'\',\n    \'member_list_template\' => \'\',\n    \'sort\' => \'0\',\n    \'type\' => \'2\',\n  ),\n);\n?>');
INSERT INTO `v9_cache` VALUES ('special.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n);\n?>');
INSERT INTO `v9_cache` VALUES ('common.cache.php', 'caches_commons/caches_data/', '<?php\nreturn array (\n  \'admin_email\' => \'phpcms@phpcms.cn\',\n  \'adminaccessip\' => \'0\',\n  \'maxloginfailedtimes\' => \'8\',\n  \'maxiplockedtime\' => \'15\',\n  \'minrefreshtime\' => \'2\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.qq.com\',\n  \'mail_port\' => \'25\',\n  \'mail_user\' => \'phpcms.cn@foxmail.com\',\n  \'mail_auth\' => \'1\',\n  \'mail_from\' => \'phpcms.cn@foxmail.com\',\n  \'mail_password\' => \'\',\n  \'errorlog_size\' => \'20\',\n);\n?>');

-- ----------------------------
-- Table structure for v9_category
-- ----------------------------
DROP TABLE IF EXISTS `v9_category`;
CREATE TABLE `v9_category` (
  `catid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `arrparentid` varchar(255) NOT NULL,
  `child` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `arrchildid` mediumtext NOT NULL,
  `catname` varchar(30) NOT NULL,
  `style` varchar(5) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` mediumtext NOT NULL,
  `parentdir` varchar(100) NOT NULL,
  `catdir` varchar(30) NOT NULL,
  `url` varchar(100) NOT NULL,
  `items` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `hits` int(10) unsigned NOT NULL DEFAULT '0',
  `setting` mediumtext NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ismenu` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `sethtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `letter` varchar(30) NOT NULL,
  `usable_type` varchar(255) NOT NULL,
  PRIMARY KEY (`catid`),
  KEY `module` (`module`,`parentid`,`listorder`,`catid`),
  KEY `siteid` (`siteid`,`type`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_category
-- ----------------------------
INSERT INTO `v9_category` VALUES ('1', '1', 'content', '1', '0', '0', '0', '1', '1,2,3,5,162', '????????????', '', '', '', '', 'about', '/html/about/', '0', '0', 'array (\n  \'ishtml\' => \'1\',\n  \'template_list\' => \'default\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'1\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '1', '0', '0', 'wangzhanjieshao', '');
INSERT INTO `v9_category` VALUES ('2', '1', 'content', '1', '0', '1', '0,1', '0', '2', '????????????', '', '', '', 'about/', 'aboutus', '/html/about/aboutus/', '0', '0', 'array (\n  \'ishtml\' => \'1\',\n  \'template_list\' => \'default\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'????????????\',\n  \'meta_keywords\' => \'????????????\',\n  \'meta_description\' => \'????????????\',\n  \'category_ruleid\' => \'1\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '1', '1', '0', 'guanyuwomen', '');
INSERT INTO `v9_category` VALUES ('3', '1', 'content', '1', '0', '1', '0,1', '0', '3', '????????????', '', '', '', 'about/', 'contactus', '/html/about/contactus/', '0', '0', 'array (\n  \'ishtml\' => \'1\',\n  \'template_list\' => \'default\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'????????????\',\n  \'meta_keywords\' => \'????????????\',\n  \'meta_description\' => \'????????????\',\n  \'category_ruleid\' => \'1\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '2', '1', '0', 'lianxifangshi', '');
INSERT INTO `v9_category` VALUES ('4', '1', 'content', '1', '0', '1', '0,1', '0', '4', '????????????', '', '', '', 'about/', 'copyright', 'http://test.phpcms.cn/index.php?m=content&c=index&a=lists&catid=4', '0', '0', 'array (\n  \'ishtml\' => \'0\',\n  \'template_list\' => \'default\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'????????????\',\n  \'meta_keywords\' => \'????????????\',\n  \'meta_description\' => \'????????????\',\n  \'category_ruleid\' => \'6\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '3', '1', '0', 'banquanshengming', '');
INSERT INTO `v9_category` VALUES ('5', '1', 'content', '1', '0', '1', '0,1', '0', '5', '????????????', '', '', '', 'about/', 'hr', '/html/about/hr/', '0', '0', 'array (\n  \'ishtml\' => \'1\',\n  \'template_list\' => \'default\',\n  \'page_template\' => \'page\',\n  \'meta_title\' => \'\',\n  \'meta_keywords\' => \'\',\n  \'meta_description\' => \'\',\n  \'category_ruleid\' => \'1\',\n  \'show_ruleid\' => \'\',\n  \'repeatchargedays\' => \'1\',\n)', '4', '1', '0', 'zhaopinxinxi', '');
INSERT INTO `v9_category` VALUES ('6', '1', 'content', 1, 0, 1, '0,1', 0, '6', '??????-?????????', '', '', '', 'about/', 'photos', '/index.php?m=content&c=index&a=lists&catid=6', 0, 0, '{\"ishtml\":\"0\",\"template_list\":\"default\",\"page_template\":\"page_photo_show\",\"meta_title\":\"?????????\",\"meta_keywords\":\"?????????\",\"meta_description\":\"?????????\",\"category_ruleid\":\"6\",\"show_ruleid\":\"\",\"repeatchargedays\":\"1\"}', 6, 1, 0, 'xiangce', '');

-- ----------------------------
-- Table structure for v9_category_priv
-- ----------------------------
DROP TABLE IF EXISTS `v9_category_priv`;
CREATE TABLE `v9_category_priv` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `roleid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `is_admin` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `action` char(30) NOT NULL,
  KEY `catid` (`catid`,`roleid`,`is_admin`,`action`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_category_priv
-- ----------------------------

-- ----------------------------
-- Table structure for v9_collection_content
-- ----------------------------
DROP TABLE IF EXISTS `v9_collection_content`;
CREATE TABLE `v9_collection_content` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` mediumint(5) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL,
  `title` char(100) NOT NULL,
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `nodeid` (`nodeid`,`siteid`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_collection_content
-- ----------------------------

-- ----------------------------
-- Table structure for v9_collection_history
-- ----------------------------
DROP TABLE IF EXISTS `v9_collection_history`;
CREATE TABLE `v9_collection_history` (
  `md5` char(32) NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`md5`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_collection_history
-- ----------------------------

-- ----------------------------
-- Table structure for v9_collection_node
-- ----------------------------
DROP TABLE IF EXISTS `v9_collection_node`;
CREATE TABLE `v9_collection_node` (
  `nodeid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sourcecharset` varchar(8) NOT NULL,
  `sourcetype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlpage` text NOT NULL,
  `pagesize_start` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `pagesize_end` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `page_base` char(255) NOT NULL,
  `par_num` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `url_contain` char(100) NOT NULL,
  `url_except` char(100) NOT NULL,
  `url_start` char(100) NOT NULL DEFAULT '',
  `url_end` char(100) NOT NULL DEFAULT '',
  `title_rule` char(100) NOT NULL,
  `title_html_rule` text NOT NULL,
  `author_rule` char(100) NOT NULL,
  `author_html_rule` text NOT NULL,
  `comeform_rule` char(100) NOT NULL,
  `comeform_html_rule` text NOT NULL,
  `time_rule` char(100) NOT NULL,
  `time_html_rule` text NOT NULL,
  `content_rule` char(100) NOT NULL,
  `content_html_rule` text NOT NULL,
  `content_page_start` char(100) NOT NULL,
  `content_page_end` char(100) NOT NULL,
  `content_page_rule` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_page` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `content_nextpage` char(100) NOT NULL,
  `down_attachment` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `watermark` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `coll_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `customize_config` text NOT NULL,
  PRIMARY KEY (`nodeid`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_collection_node
-- ----------------------------

-- ----------------------------
-- Table structure for v9_collection_program
-- ----------------------------
DROP TABLE IF EXISTS `v9_collection_program`;
CREATE TABLE `v9_collection_program` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `nodeid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `catid` int(10) unsigned NOT NULL DEFAULT '0',
  `config` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `nodeid` (`nodeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_collection_program
-- ----------------------------

-- ----------------------------
-- Table structure for v9_comment
-- ----------------------------
DROP TABLE IF EXISTS `v9_comment`;
CREATE TABLE `v9_comment` (
  `commentid` char(30) NOT NULL,
  `siteid` smallint(5) NOT NULL DEFAULT '0',
  `title` char(255) NOT NULL,
  `url` char(255) NOT NULL,
  `total` int(8) unsigned DEFAULT '0',
  `square` mediumint(8) unsigned DEFAULT '0',
  `anti` mediumint(8) unsigned DEFAULT '0',
  `neutral` mediumint(8) unsigned DEFAULT '0',
  `display_type` tinyint(1) DEFAULT '0',
  `tableid` mediumint(8) unsigned DEFAULT '0',
  `lastupdate` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`commentid`),
  KEY `lastupdate` (`lastupdate`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_comment
-- ----------------------------

-- ----------------------------
-- Table structure for v9_comment_check
-- ----------------------------
DROP TABLE IF EXISTS `v9_comment_check`;
CREATE TABLE `v9_comment_check` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `comment_data_id` int(10) DEFAULT '0' COMMENT '??????ID???',
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '??????ID',
  `tableid` mediumint(8) DEFAULT '0' COMMENT '???????????????ID',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `comment_data_id` (`comment_data_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_comment_check
-- ----------------------------

-- ----------------------------
-- Table structure for v9_comment_data_1
-- ----------------------------
DROP TABLE IF EXISTS `v9_comment_data_1`;
CREATE TABLE `v9_comment_data_1` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '??????ID',
  `commentid` char(30) NOT NULL DEFAULT '' COMMENT '??????ID???',
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '??????ID',
  `userid` int(10) unsigned DEFAULT '0' COMMENT '??????ID',
  `username` varchar(20) DEFAULT NULL COMMENT '?????????',
  `creat_at` int(10) DEFAULT NULL COMMENT '????????????',
  `ip` varchar(15) DEFAULT NULL COMMENT '??????IP??????',
  `status` tinyint(1) DEFAULT '0' COMMENT '????????????{0:?????????,-1:???????????????,1:????????????}',
  `content` text COMMENT '????????????',
  `direction` tinyint(1) DEFAULT '0' COMMENT '????????????{0:?????????,1:??????,2:??????,3:??????}',
  `support` mediumint(8) unsigned DEFAULT '0' COMMENT '?????????',
  `reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '???????????????',
  PRIMARY KEY (`id`),
  KEY `commentid` (`commentid`),
  KEY `direction` (`direction`),
  KEY `siteid` (`siteid`),
  KEY `support` (`support`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_comment_data_1
-- ----------------------------

-- ----------------------------
-- Table structure for v9_comment_setting
-- ----------------------------
DROP TABLE IF EXISTS `v9_comment_setting`;
CREATE TABLE `v9_comment_setting` (
  `siteid` smallint(5) NOT NULL DEFAULT '0' COMMENT '??????ID',
  `guest` tinyint(1) DEFAULT '0' COMMENT '????????????????????????',
  `check` tinyint(1) DEFAULT '0' COMMENT '??????????????????',
  `code` tinyint(1) DEFAULT '0' COMMENT '?????????????????????',
  `add_point` tinyint(3) unsigned DEFAULT '0' COMMENT '??????????????????',
  `del_point` tinyint(3) unsigned DEFAULT '0' COMMENT '??????????????????',
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_comment_setting
-- ----------------------------
INSERT INTO `v9_comment_setting` VALUES ('1', '0', '0', '0', '0', '0');

-- ----------------------------
-- Table structure for v9_comment_table
-- ----------------------------
DROP TABLE IF EXISTS `v9_comment_table`;
CREATE TABLE `v9_comment_table` (
  `tableid` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '???ID???',
  `total` int(10) unsigned DEFAULT '0' COMMENT '????????????',
  `creat_at` int(10) DEFAULT '0' COMMENT '????????????',
  PRIMARY KEY (`tableid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_comment_table
-- ----------------------------
INSERT INTO `v9_comment_table` VALUES ('1', '0', '0');

-- ----------------------------
-- Table structure for v9_content_check
-- ----------------------------
DROP TABLE IF EXISTS `v9_content_check`;
CREATE TABLE `v9_content_check` (
  `checkid` char(15) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  KEY `username` (`username`),
  KEY `checkid` (`checkid`),
  KEY `status` (`status`,`inputtime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_content_check
-- ----------------------------

-- ----------------------------
-- Table structure for v9_copyfrom
-- ----------------------------
DROP TABLE IF EXISTS `v9_copyfrom`;
CREATE TABLE `v9_copyfrom` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `sitename` varchar(30) NOT NULL,
  `siteurl` varchar(100) NOT NULL,
  `thumb` varchar(100) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_copyfrom
-- ----------------------------

-- ----------------------------
-- Table structure for v9_datacall
-- ----------------------------
DROP TABLE IF EXISTS `v9_datacall`;
CREATE TABLE `v9_datacall` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` char(40) DEFAULT NULL,
  `dis_type` tinyint(1) unsigned DEFAULT '0',
  `type` tinyint(1) DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `action` char(20) DEFAULT NULL,
  `data` text,
  `template` text,
  `cache` mediumint(8) DEFAULT NULL,
  `num` smallint(6) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_datacall
-- ----------------------------

-- ----------------------------
-- Table structure for v9_dbsource
-- ----------------------------
DROP TABLE IF EXISTS `v9_dbsource`;
CREATE TABLE `v9_dbsource` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL,
  `host` varchar(20) NOT NULL,
  `port` int(5) NOT NULL DEFAULT '3306',
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `dbname` varchar(50) NOT NULL,
  `dbtablepre` varchar(30) NOT NULL,
  `charset` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_dbsource
-- ----------------------------

-- ----------------------------
-- Table structure for v9_download
-- ----------------------------
DROP TABLE IF EXISTS `v9_download`;
CREATE TABLE `v9_download` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `systems` varchar(100) NOT NULL DEFAULT 'Win2000/WinXP/Win2003',
  `copytype` varchar(15) NOT NULL DEFAULT '',
  `language` varchar(10) NOT NULL DEFAULT '',
  `classtype` varchar(20) NOT NULL DEFAULT '',
  `version` varchar(20) NOT NULL DEFAULT '',
  `filesize` varchar(10) NOT NULL DEFAULT 'Unkown',
  `stars` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_download
-- ----------------------------

-- ----------------------------
-- Table structure for v9_download_data
-- ----------------------------
DROP TABLE IF EXISTS `v9_download_data`;
CREATE TABLE `v9_download_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `downfiles` mediumtext NOT NULL,
  `downfile` varchar(255) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_download_data
-- ----------------------------

-- ----------------------------
-- Table structure for v9_downservers
-- ----------------------------
DROP TABLE IF EXISTS `v9_downservers`;
CREATE TABLE `v9_downservers` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `sitename` varchar(100) DEFAULT NULL,
  `siteurl` varchar(255) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_downservers
-- ----------------------------

-- ----------------------------
-- Table structure for v9_extend_setting
-- ----------------------------
DROP TABLE IF EXISTS `v9_extend_setting`;
CREATE TABLE `v9_extend_setting` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `key` char(30) NOT NULL,
  `data` mediumtext,
  PRIMARY KEY (`id`),
  KEY `key` (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_extend_setting
-- ----------------------------

-- ----------------------------
-- Table structure for v9_favorite
-- ----------------------------
DROP TABLE IF EXISTS `v9_favorite`;
CREATE TABLE `v9_favorite` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` char(100) NOT NULL,
  `url` char(100) NOT NULL,
  `adddate` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_favorite
-- ----------------------------

-- ----------------------------
-- Table structure for v9_hits
-- ----------------------------
DROP TABLE IF EXISTS `v9_hits`;
CREATE TABLE `v9_hits` (
  `hitsid` char(30) NOT NULL,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `views` int(10) unsigned NOT NULL DEFAULT '0',
  `yesterdayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `dayviews` int(10) unsigned NOT NULL DEFAULT '0',
  `weekviews` int(10) unsigned NOT NULL DEFAULT '0',
  `monthviews` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`hitsid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_hits
-- ----------------------------

-- ----------------------------
-- Table structure for v9_ipbanned
-- ----------------------------
DROP TABLE IF EXISTS `v9_ipbanned`;
CREATE TABLE `v9_ipbanned` (
  `ipbannedid` smallint(5) NOT NULL AUTO_INCREMENT,
  `ip` char(15) NOT NULL,
  `expires` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`ipbannedid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_ipbanned
-- ----------------------------

-- ----------------------------
-- Table structure for v9_keylink
-- ----------------------------
DROP TABLE IF EXISTS `v9_keylink`;
CREATE TABLE `v9_keylink` (
  `keylinkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `word` char(40) NOT NULL,
  `url` char(100) NOT NULL,
  PRIMARY KEY (`keylinkid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_keylink
-- ----------------------------

-- ----------------------------
-- Table structure for v9_keyword
-- ----------------------------
DROP TABLE IF EXISTS `v9_keyword`;
CREATE TABLE `v9_keyword` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `keyword` char(100) NOT NULL,
  `pinyin` char(100) NOT NULL,
  `videonum` int(11) NOT NULL DEFAULT '0',
  `searchnums` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `keyword` (`keyword`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_keyword
-- ----------------------------

-- ----------------------------
-- Table structure for v9_keyword_data
-- ----------------------------
DROP TABLE IF EXISTS `v9_keyword_data`;
CREATE TABLE `v9_keyword_data` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tagid` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `contentid` char(30) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tagid` (`tagid`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_keyword_data
-- ----------------------------

-- ----------------------------
-- Table structure for v9_link
-- ----------------------------
DROP TABLE IF EXISTS `v9_link`;
CREATE TABLE `v9_link` (
  `linkid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `linktype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `logo` varchar(255) NOT NULL DEFAULT '',
  `introduce` text NOT NULL,
  `username` varchar(30) NOT NULL DEFAULT '',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `passed` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkid`),
  KEY `typeid` (`typeid`,`passed`,`listorder`,`linkid`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_link
-- ----------------------------
INSERT INTO `v9_link` VALUES ('1', '1', '0', '1', 'PHPCMS', 'http://www.phpcms.cn', 'http://www.phpcms.cn/images/logo_88_31.gif', '', '', '0', '0', '1', '1553097824');
INSERT INTO `v9_link` VALUES ('2', '1', '0', '1', '????????????', 'http://www.sdo.com', 'http://www.snda.com/cn/logo/comp_logo_sdo.gif', '', '', '0', '0', '1', '1553097824');

-- ----------------------------
-- Table structure for v9_linkage
-- ----------------------------
DROP TABLE IF EXISTS `v9_linkage`;
CREATE TABLE `v9_linkage` (
  `linkageid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `style` varchar(35) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `child` tinyint(1) NOT NULL,
  `arrchildid` mediumtext NOT NULL,
  `keyid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) DEFAULT NULL,
  `setting` varchar(255) DEFAULT NULL,
  `siteid` smallint(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`linkageid`,`keyid`),
  KEY `parentid` (`parentid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=3360 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_linkage
-- ----------------------------
INSERT INTO `v9_linkage` VALUES ('1', '??????', '1', '0', '0', '', '0', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('4', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('5', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('6', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('7', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('8', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('9', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('10', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('11', '????????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('12', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('13', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('14', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('15', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('16', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('17', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('18', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('19', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('20', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('21', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('22', '??????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('23', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('24', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('25', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('26', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('27', '??????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('28', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('29', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('30', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('31', '??????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('32', '??????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('33', '?????????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('34', '??????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('35', '??????', '0', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('36', '?????????', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('37', '?????????', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('38', '?????????', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('39', '?????????', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('40', '?????????', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('41', '????????????', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('42', '?????????', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('43', '????????????', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('44', '?????????', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('45', '?????????', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('46', '?????????', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('47', '?????????', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('48', '?????????', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('49', '?????????', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('50', '?????????', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('51', '?????????', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('52', '?????????', '0', '2', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('53', '?????????', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('54', '?????????', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('55', '?????????', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('56', '?????????', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('57', '?????????', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('58', '?????????', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('59', '?????????', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('60', '?????????', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('61', '?????????', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('62', '?????????', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('63', '?????????', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('64', '?????????', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('65', '????????????', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('66', '?????????', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('67', '?????????', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('68', '?????????', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('69', '?????????', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('70', '?????????', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('71', '?????????', '0', '3', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('72', '?????????', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('73', '?????????', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('74', '?????????', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('75', '?????????', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('76', '?????????', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('77', '?????????', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('78', '?????????', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('79', '?????????', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('80', '?????????', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('81', '?????????', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('82', '?????????', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('83', '?????????', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('84', '?????????', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('85', '?????????', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('86', '?????????', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('87', '?????????', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('88', '?????????', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('89', '??????', '0', '4', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('90', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('91', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('92', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('93', '????????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('94', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('95', '????????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('96', '????????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('97', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('98', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('99', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('100', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('101', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('102', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('103', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('104', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('105', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('106', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('107', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('108', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('109', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('110', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('111', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('112', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('113', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('114', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('115', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('116', '??????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('117', '??????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('118', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('119', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('120', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('121', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('122', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('123', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('124', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('125', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('126', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('127', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('128', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('129', '?????????', '0', '5', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('130', '????????????', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('131', '?????????', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('132', '????????????', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('133', '?????????', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('134', '?????????', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('135', '?????????', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('136', '????????????', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('137', '?????????', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('138', '?????????', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('139', '?????????', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('140', '?????????', '0', '6', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('141', '?????????', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('142', '?????????', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('143', '?????????', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('144', '?????????', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('145', '?????????', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('146', '?????????', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('147', '?????????', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('148', '?????????', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('149', '?????????', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('150', '?????????', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('151', '?????????', '0', '7', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('152', '???????????????', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('153', '?????????', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('154', '?????????', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('155', '?????????', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('156', '?????????', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('157', '???????????????', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('158', '???????????????', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('159', '???????????????', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('160', '???????????????', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('161', '?????????', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('162', '???????????????', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('163', '????????????', '0', '8', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('164', '?????????', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('165', '?????????', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('166', '?????????', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('167', '?????????', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('168', '?????????', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('169', '?????????', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('170', '?????????', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('171', '?????????', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('172', '?????????', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('173', '?????????', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('174', '?????????', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('175', '?????????', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('176', '?????????', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('177', '????????????', '0', '9', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('178', '?????????', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('179', '?????????', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('180', '?????????', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('181', '?????????', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('182', '?????????', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('183', '?????????', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('184', '?????????', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('185', '?????????', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('186', '??????', '0', '10', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('187', '????????????', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('188', '???????????????', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('189', '?????????', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('190', '?????????', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('191', '????????????', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('192', '?????????', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('193', '?????????', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('194', '????????????', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('195', '????????????', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('196', '????????????', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('197', '?????????', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('198', '?????????', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('199', '??????????????????', '0', '11', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('200', '?????????', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('201', '?????????', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('202', '?????????', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('203', '?????????', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('204', '?????????', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('205', '?????????', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('206', '????????????', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('207', '?????????', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('208', '?????????', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('209', '?????????', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('210', '?????????', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('211', '?????????', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('212', '?????????', '0', '12', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('213', '?????????', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('214', '?????????', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('215', '?????????', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('216', '?????????', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('217', '?????????', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('218', '?????????', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('219', '?????????', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('220', '?????????', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('221', '?????????', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('222', '?????????', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('223', '?????????', '0', '13', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('224', '?????????', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('225', '?????????', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('226', '?????????', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('227', '?????????', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('228', '????????????', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('229', '?????????', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('230', '?????????', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('231', '?????????', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('232', '?????????', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('233', '?????????', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('234', '?????????', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('235', '?????????', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('236', '?????????', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('237', '?????????', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('238', '?????????', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('239', '?????????', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('240', '?????????', '0', '14', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('241', '?????????', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('242', '?????????', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('243', '?????????', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('244', '?????????', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('245', '?????????', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('246', '?????????', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('247', '?????????', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('248', '?????????', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('249', '?????????', '0', '15', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('250', '?????????', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('251', '????????????', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('252', '?????????', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('253', '?????????', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('254', '?????????', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('255', '?????????', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('256', '?????????', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('257', '?????????', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('258', '?????????', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('259', '?????????', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('260', '?????????', '0', '16', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('261', '?????????', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('262', '?????????', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('263', '?????????', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('264', '?????????', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('265', '?????????', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('266', '?????????', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('267', '?????????', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('268', '?????????', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('269', '?????????', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('270', '?????????', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('271', '?????????', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('272', '?????????', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('273', '?????????', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('274', '?????????', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('275', '?????????', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('276', '?????????', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('277', '?????????', '0', '17', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('278', '?????????', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('279', '?????????', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('280', '?????????', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('281', '????????????', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('282', '?????????', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('283', '?????????', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('284', '?????????', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('285', '?????????', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('286', '?????????', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('287', '?????????', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('288', '?????????', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('289', '????????????', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('290', '?????????', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('291', '?????????', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('292', '?????????', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('293', '?????????', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('294', '????????????', '0', '18', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('295', '?????????', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('296', '?????????', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('297', '?????????', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('298', '?????????', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('299', '?????????', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('300', '?????????', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('301', '?????????', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('302', '?????????', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('303', '?????????', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('304', '?????????', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('305', '?????????', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('306', '?????????', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('307', '??????????????????????????????', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('308', '?????????', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('309', '?????????', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('310', '?????????', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('311', '???????????????', '0', '19', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('312', '?????????', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('313', '?????????', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('314', '?????????', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('315', '?????????', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('316', '?????????', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('317', '?????????', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('318', '?????????', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('319', '????????????', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('320', '?????????', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('321', '?????????', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('322', '?????????', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('323', '?????????', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('324', '?????????', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('325', '??????????????????????????????', '0', '20', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('326', '?????????', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('327', '?????????', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('328', '?????????', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('329', '?????????', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('330', '?????????', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('331', '?????????', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('332', '?????????', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('333', '?????????', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('334', '?????????', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('335', '?????????', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('336', '?????????', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('337', '?????????', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('338', '?????????', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('339', '?????????', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('340', '?????????', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('341', '?????????', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('342', '?????????', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('343', '?????????', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('344', '?????????', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('345', '?????????', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('346', '?????????', '0', '21', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('347', '?????????', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('348', '?????????', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('349', '?????????', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('350', '?????????', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('351', '?????????', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('352', '????????????', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('353', '?????????', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('354', '?????????', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('355', '?????????', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('356', '?????????', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('357', '?????????', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('358', '?????????', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('359', '?????????', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('360', '?????????', '0', '22', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('361', '?????????', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('362', '?????????', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('363', '????????????', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('364', '?????????', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('365', '?????????', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('366', '?????????', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('367', '?????????', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('368', '?????????', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('369', '?????????', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('370', '?????????', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('371', '?????????', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('372', '?????????', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('373', '?????????????????????', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('374', '?????????????????????', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('375', '?????????????????????', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('376', '?????????????????????', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('377', '???????????????????????????', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('378', '???????????????????????????', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('379', '????????????', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('380', '????????????', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('381', '?????????????????????????????????', '0', '23', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('382', '?????????', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('383', '?????????', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('384', '????????????', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('385', '?????????', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('386', '?????????', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('387', '?????????', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('388', '?????????', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('389', '?????????', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('390', '?????????', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('391', '?????????', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('392', '?????????', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('393', '?????????', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('394', '?????????', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('395', '?????????', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('396', '?????????', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('397', '?????????', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('398', '?????????', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('399', '?????????', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('400', '?????????', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('401', '?????????', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('402', '?????????', '0', '24', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('403', '?????????', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('404', '????????????', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('405', '?????????', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('406', '?????????', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('407', '????????????', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('408', '????????????', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('409', '????????????', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('410', '????????????', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('411', '?????????', '0', '25', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('412', '?????????', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('413', '?????????', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('414', '?????????', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('415', '?????????', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('416', '?????????', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('417', '?????????', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('418', '?????????', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('419', '?????????', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('420', '?????????', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('421', '?????????', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('422', '?????????', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('423', '????????????', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('424', '??????', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('425', '??????', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('426', '??????', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('427', '??????', '0', '26', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('428', '?????????', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('429', '??????', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('430', '??????', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('431', '?????????', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('432', '??????', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('433', '??????', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('434', '??????', '0', '27', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('435', '?????????', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('436', '?????????', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('437', '?????????', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('438', '?????????', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('439', '?????????', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('440', '?????????', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('441', '?????????', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('442', '?????????', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('443', '?????????', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('444', '?????????', '0', '28', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('445', '?????????', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('446', '????????????', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('447', '?????????', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('448', '?????????', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('449', '?????????', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('450', '?????????', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('451', '?????????', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('452', '?????????', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('453', '?????????', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('454', '?????????', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('455', '?????????', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('456', '?????????', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('457', '?????????', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('458', '??????', '0', '29', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('459', '?????????', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('460', '????????????', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('461', '??????', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('462', '?????????', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('463', '?????????', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('464', '?????????', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('465', '?????????', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('466', '?????????', '0', '30', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('467', '?????????', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('468', '????????????', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('469', '?????????', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('470', '?????????', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('471', '?????????', '0', '31', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('472', '???????????????', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('473', '???????????????', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('474', '???????????????', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('475', '????????????', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('476', '?????????', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('477', '?????????', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('478', '???????????????', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('479', '???????????????', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('480', '?????????????????????????????????', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('481', '????????????', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('482', '????????????', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('483', '?????????', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('484', '????????????', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('485', '???????????????', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('486', '????????????', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('487', '????????????', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('488', '???????????????', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('489', '????????????', '0', '32', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('490', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('491', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('492', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('493', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('494', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('495', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('496', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('497', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('498', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('499', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('500', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('501', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('502', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('503', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('504', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('505', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('506', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('507', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('508', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('509', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('510', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('511', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('512', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('513', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('514', '?????????', '0', '33', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('515', '?????????', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('516', '??????', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('517', '??????', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('518', '?????????', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('519', '????????????', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('520', '?????????', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('521', '????????????', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('522', '????????????', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('523', '????????????', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('524', '?????????', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('525', '?????????', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('526', '??????', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('527', '?????????', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('528', '?????????', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('529', '?????????', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('530', '?????????', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('531', '?????????', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('532', '?????????', '0', '34', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('533', '???????????????', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('534', '?????????????????????', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('535', '?????????', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('536', '????????????', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('537', '????????????', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('538', '????????????', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('539', '??????????????????', '0', '35', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('540', '?????????', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('541', '?????????', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('542', '?????????', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('543', '?????????', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('544', '????????????', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('545', '?????????', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('546', '?????????', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('547', '?????????', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('548', '?????????', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('549', '?????????', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('550', '?????????', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('551', '?????????', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('552', '?????????', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('553', '?????????', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('554', '?????????', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('555', '?????????', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('556', '?????????', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('557', '??????', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('558', '?????????', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('559', '?????????', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('560', '?????????', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('561', '?????????', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('562', '?????????', '0', '130', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('563', '?????????', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('564', '?????????', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('565', '?????????', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('566', '?????????', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('567', '?????????', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('568', '?????????', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('569', '??????', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('570', '?????????', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('571', '?????????', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('572', '?????????', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('573', '?????????', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('574', '?????????', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('575', '?????????', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('576', '?????????', '0', '131', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('577', '?????????', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('578', '????????????', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('579', '????????????', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('580', '?????????', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('581', '?????????', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('582', '?????????', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('583', '?????????', '0', '132', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('584', '?????????', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('585', '?????????', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('586', '?????????', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('587', '????????????', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('588', '?????????', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('589', '?????????', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('590', '?????????', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('591', '?????????', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('592', '??????', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('593', '??????', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('594', '?????????', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('595', '?????????', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('596', '??????', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('597', '?????????', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('598', '?????????', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('599', '?????????', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('600', '??????', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('601', '?????????', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('602', '?????????', '0', '133', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('603', '?????????', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('604', '?????????', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('605', '?????????', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('606', '?????????', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('607', '?????????', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('608', '?????????', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('609', '?????????', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('610', '??????', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('611', '?????????', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('612', '?????????', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('613', '?????????', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('614', '?????????', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('615', '?????????', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('616', '?????????', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('617', '??????', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('618', '?????????', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('619', '?????????', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('620', '?????????', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('621', '?????????', '0', '134', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('622', '?????????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('623', '?????????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('624', '?????????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('625', '?????????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('626', '?????????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('627', '?????????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('628', '?????????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('629', '?????????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('630', '?????????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('631', '??????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('632', '?????????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('633', '?????????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('634', '?????????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('635', '?????????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('636', '?????????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('637', '??????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('638', '?????????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('639', '??????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('640', '?????????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('641', '?????????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('642', '??????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('643', '?????????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('644', '?????????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('645', '?????????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('646', '????????????', '0', '135', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('647', '?????????', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('648', '?????????', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('649', '?????????', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('650', '????????????', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('651', '?????????', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('652', '?????????', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('653', '?????????', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('654', '?????????', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('655', '?????????', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('656', '??????', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('657', '?????????', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('658', '?????????', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('659', '?????????', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('660', '?????????', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('661', '?????????', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('662', '?????????', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('663', '?????????', '0', '136', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('664', '?????????', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('665', '?????????', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('666', '??????????????????', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('667', '?????????', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('668', '?????????', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('669', '?????????', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('670', '?????????', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('671', '?????????', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('672', '?????????', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('673', '?????????', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('674', '?????????', '0', '137', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('675', '?????????', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('676', '?????????', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('677', '??????', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('678', '??????', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('679', '?????????', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('680', '?????????', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('681', '?????????', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('682', '?????????', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('683', '?????????', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('684', '?????????', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('685', '??????', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('686', '?????????', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('687', '?????????', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('688', '?????????', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('689', '?????????', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('690', '?????????', '0', '138', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('691', '?????????', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('692', '?????????', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('693', '?????????', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('694', '?????????', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('695', '?????????', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('696', '?????????', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('697', '?????????', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('698', '?????????', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('699', '?????????', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('700', '?????????', '0', '139', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('701', '?????????', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('702', '?????????', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('703', '?????????', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('704', '?????????', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('705', '?????????', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('706', '?????????', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('707', '?????????', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('708', '??????', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('709', '?????????', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('710', '?????????', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('711', '?????????', '0', '140', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('712', '?????????', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('713', '?????????', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('714', '????????????', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('715', '????????????', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('716', '????????????', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('717', '?????????', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('718', '?????????', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('719', '?????????', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('720', '?????????', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('721', '?????????', '0', '141', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('722', '??????', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('723', '??????', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('724', '?????????', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('725', '?????????', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('726', '?????????', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('727', '?????????', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('728', '?????????', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('729', '?????????', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('730', '?????????', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('731', '?????????', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('732', '?????????', '0', '142', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('733', '??????', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('734', '??????', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('735', '??????', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('736', '?????????', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('737', '??????', '0', '143', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('738', '??????', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('739', '??????', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('740', '?????????', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('741', '?????????', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('742', '?????????', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('743', '?????????', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('744', '?????????', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('745', '?????????', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('746', '?????????', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('747', '?????????', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('748', '??????', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('749', '?????????', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('750', '?????????', '0', '144', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('751', '??????', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('752', '?????????', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('753', '?????????', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('754', '?????????', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('755', '?????????', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('756', '?????????', '0', '145', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('757', '?????????', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('758', '?????????', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('759', '?????????', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('760', '??????', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('761', '?????????', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('762', '?????????', '0', '146', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('763', '?????????', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('764', '?????????', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('765', '?????????', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('766', '?????????', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('767', '?????????', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('768', '?????????', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('769', '?????????', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('770', '??????', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('771', '?????????', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('772', '?????????', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('773', '?????????', '0', '147', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('774', '?????????', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('775', '?????????', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('776', '?????????', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('777', '?????????', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('778', '?????????', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('779', '?????????', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('780', '??????', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('781', '?????????', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('782', '??????', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('783', '?????????', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('784', '?????????', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('785', '?????????', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('786', '?????????', '0', '148', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('787', '?????????', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('788', '?????????', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('789', '?????????', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('790', '??????', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('791', '?????????', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('792', '?????????', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('793', '?????????', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('794', '?????????', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('795', '?????????', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('796', '?????????', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('797', '?????????', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('798', '?????????', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('799', '?????????', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('800', '?????????', '0', '149', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('801', '?????????', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('802', '?????????', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('803', '?????????', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('804', '?????????', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('805', '?????????', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('806', '??????', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('807', '?????????', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('808', '?????????', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('809', '??????', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('810', '?????????', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('811', '?????????', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('812', '??????', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('813', '?????????', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('814', '??????', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('815', '?????????', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('816', '?????????', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('817', '?????????', '0', '150', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('818', '?????????', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('819', '?????????', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('820', '?????????', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('821', '??????', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('822', '??????', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('823', '?????????', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('824', '?????????', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('825', '??????', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('826', '?????????', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('827', '?????????', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('828', '?????????', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('829', '?????????', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('830', '?????????', '0', '151', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('831', '?????????', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('832', '?????????', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('833', '?????????', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('834', '?????????', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('835', '???????????????', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('836', '????????????', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('837', '???????????????', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('838', '????????????', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('839', '?????????', '0', '152', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('840', '?????????', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('841', '????????????', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('842', '?????????', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('843', '?????????', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('844', '????????????', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('845', '?????????', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('846', '???????????????', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('847', '?????????', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('848', '???????????????????????????', '0', '153', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('849', '????????????', '0', '154', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('850', '?????????', '0', '154', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('851', '?????????', '0', '154', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('852', '?????????', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('853', '????????????', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('854', '?????????', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('855', '??????????????????', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('856', '????????????', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('857', '????????????', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('858', '?????????', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('859', '???????????????', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('860', '????????????', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('861', '????????????', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('862', '?????????', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('863', '?????????', '0', '155', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('864', '????????????', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('865', '?????????????????????', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('866', '?????????????????????', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('867', '?????????', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('868', '?????????', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('869', '?????????', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('870', '????????????', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('871', '???????????????', '0', '156', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('872', '?????????', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('873', '????????????', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('874', '????????????', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('875', '???????????????', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('876', '????????????', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('877', '?????????', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('878', '?????????', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('879', '???????????????', '0', '157', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('880', '????????????', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('881', '?????????', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('882', '?????????????????????????????????', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('883', '??????????????????', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('884', '?????????????????????', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('885', '???????????????', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('886', '??????????????????', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('887', '??????????????????', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('888', '????????????', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('889', '????????????', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('890', '????????????', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('891', '???????????????', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('892', '?????????', '0', '158', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('893', '?????????', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('894', '?????????', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('895', '?????????', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('896', '???????????????', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('897', '???????????????', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('898', '???????????????', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('899', '????????????', '0', '159', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('900', '?????????', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('901', '?????????', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('902', '?????????', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('903', '?????????', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('904', '?????????', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('905', '?????????', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('906', '?????????????????????', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('907', '?????????????????????', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('908', '?????????????????????', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('909', '????????????', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('910', '?????????', '0', '160', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('911', '???????????????', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('912', '????????????', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('913', '?????????????????????', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('914', '?????????????????????', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('915', '????????????', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('916', '?????????', '0', '161', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('917', '???????????????', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('918', '???????????????', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('919', '????????????', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('920', '???????????????', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('921', '???????????????', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('922', '??????????????????', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('923', '??????????????????', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('924', '????????????', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('925', '?????????', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('926', '????????????', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('927', '?????????', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('928', '?????????', '0', '162', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('929', '???????????????', '0', '163', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('930', '???????????????', '0', '163', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('931', '????????????', '0', '163', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('932', '?????????', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('933', '?????????', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('934', '?????????', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('935', '?????????', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('936', '?????????', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('937', '????????????', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('938', '?????????', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('939', '????????????', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('940', '?????????', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('941', '?????????', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('942', '?????????', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('943', '?????????', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('944', '?????????', '0', '164', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('945', '?????????', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('946', '?????????', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('947', '????????????', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('948', '????????????', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('949', '????????????', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('950', '?????????', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('951', '?????????', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('952', '????????????', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('953', '????????????', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('954', '?????????', '0', '165', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('955', '?????????', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('956', '?????????', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('957', '?????????', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('958', '?????????', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('959', '?????????', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('960', '?????????????????????', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('961', '?????????', '0', '166', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('962', '?????????', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('963', '?????????', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('964', '?????????', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('965', '?????????', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('966', '?????????', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('967', '?????????????????????', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('968', '?????????????????????', '0', '167', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('969', '?????????', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('970', '?????????', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('971', '?????????', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('972', '?????????', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('973', '?????????????????????', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('974', '?????????????????????', '0', '168', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('975', '?????????', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('976', '?????????', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('977', '?????????', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('978', '?????????????????????', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('979', '?????????', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('980', '?????????', '0', '169', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('981', '?????????', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('982', '?????????', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('983', '?????????', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('984', '?????????', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('985', '??????', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('986', '?????????', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('987', '?????????', '0', '170', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('988', '?????????', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('989', '?????????', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('990', '????????????', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('991', '?????????', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('992', '?????????', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('993', '????????????', '0', '171', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('994', '?????????', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('995', '?????????', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('996', '?????????', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('997', '????????????', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('998', '?????????', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('999', '????????????????????????', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1000', '?????????', '0', '172', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1001', '?????????', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1002', '?????????', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1003', '?????????', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1004', '????????????', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1005', '????????????', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1006', '?????????', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1007', '?????????', '0', '173', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1008', '????????????', '0', '174', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1009', '????????????', '0', '174', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1010', '?????????', '0', '174', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1011', '?????????', '0', '174', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1012', '?????????', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1013', '?????????', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1014', '?????????', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1015', '?????????', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1016', '?????????', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1017', '????????????', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1018', '?????????', '0', '175', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1019', '?????????', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1020', '?????????', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1021', '?????????', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1022', '?????????', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1023', '?????????????????????????????????', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1024', '?????????', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1025', '?????????', '0', '176', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1026', '?????????', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1027', '?????????', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1028', '?????????', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1029', '?????????', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1030', '?????????', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1031', '?????????', '0', '177', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1032', '?????????', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1033', '?????????', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1034', '?????????', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1035', '?????????', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1036', '?????????', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1037', '?????????', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1038', '?????????', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1039', '?????????', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1040', '?????????', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1041', '?????????', '0', '178', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1042', '?????????', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1043', '?????????', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1044', '?????????', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1045', '?????????', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1046', '?????????', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1047', '?????????', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1048', '?????????', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1049', '?????????', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1050', '?????????', '0', '179', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1051', '?????????', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1052', '?????????', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1053', '?????????', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1054', '?????????????????????', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1055', '????????????', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1056', '?????????', '0', '180', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1057', '?????????', '0', '181', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1058', '?????????', '0', '181', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1059', '?????????', '0', '181', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1060', '?????????', '0', '181', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1061', '?????????', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1062', '????????????', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1063', '?????????', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1064', '?????????', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1065', '?????????', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1066', '????????????', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1067', '?????????', '0', '182', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1068', '????????????', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1069', '?????????', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1070', '?????????', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1071', '????????????????????????', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1072', '?????????', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1073', '?????????', '0', '183', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1074', '?????????', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1075', '?????????????????????????????????', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1076', '?????????', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1077', '?????????', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1078', '?????????', '0', '184', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1079', '?????????', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1080', '?????????', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1081', '?????????', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1082', '?????????', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1083', '?????????', '0', '185', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1084', '?????????', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1085', '?????????', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1086', '?????????', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1087', '?????????', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1088', '?????????', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1089', '?????????', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1090', '?????????', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1091', '?????????', '0', '186', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1092', '?????????', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1093', '?????????', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1094', '?????????', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1095', '?????????', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1096', '?????????', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1097', '?????????', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1098', '?????????', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1099', '?????????', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1100', '?????????', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1101', '?????????', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1102', '??????', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1103', '?????????', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1104', '?????????', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1105', '?????????', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1106', '?????????', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1107', '?????????', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1108', '?????????', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1109', '?????????', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1110', '?????????', '0', '187', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1111', '?????????', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1112', '?????????', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1113', '?????????', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1114', '????????????', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1115', '???????????????', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1116', '????????????', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1117', '????????????????????????', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1118', '?????????', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1119', '?????????', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1120', '?????????', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1121', '?????????', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1122', '?????????', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1123', '?????????', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1124', '?????????', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1125', '?????????', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1126', '?????????', '0', '188', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1127', '?????????', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1128', '?????????', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1129', '?????????', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1130', '?????????', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1131', '????????????', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1132', '?????????', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1133', '?????????', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1134', '?????????', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1135', '?????????', '0', '189', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1136', '?????????', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1137', '?????????', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1138', '?????????', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1139', '?????????', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1140', '?????????', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1141', '?????????', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1142', '?????????', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1143', '?????????', '0', '190', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1144', '?????????', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1145', '?????????', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1146', '????????????', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1147', '?????????', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1148', '?????????', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1149', '?????????', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1150', '?????????', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1151', '?????????', '0', '191', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1152', '????????????', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1153', '?????????', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1154', '????????????', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1155', '?????????', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1156', '?????????', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1157', '?????????', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1158', '?????????', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1159', '?????????', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1160', '??????????????????????????????', '0', '192', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1161', '?????????', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1162', '?????????', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1163', '?????????', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1164', '?????????', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1165', '?????????', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1166', '?????????', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1167', '?????????', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1168', '????????????', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1169', '?????????', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1170', '????????????', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1171', '????????????', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1172', '?????????', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1173', '????????????', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1174', '?????????', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1175', '????????????', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1176', '?????????', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1177', '?????????', '0', '193', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1178', '?????????', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1179', '?????????', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1180', '?????????', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1181', '?????????', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1182', '??????', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1183', '?????????', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1184', '?????????', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1185', '?????????', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1186', '?????????', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1187', '?????????', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1188', '?????????', '0', '194', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1189', '?????????', '0', '195', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1190', '?????????', '0', '195', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1191', '????????????', '0', '195', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1192', '?????????', '0', '195', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1193', '?????????', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1194', '?????????', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1195', '?????????', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1196', '?????????', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1197', '?????????', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1198', '?????????', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1199', '????????????', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1200', '?????????', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1201', '?????????', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1202', '?????????', '0', '196', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1203', '?????????', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1204', '?????????', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1205', '?????????', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1206', '?????????', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1207', '?????????', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1208', '???????????????', '0', '197', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1209', '?????????', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1210', '?????????', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1211', '?????????', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1212', '?????????', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1213', '?????????', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1214', '?????????', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1215', '?????????', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1216', '?????????', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1217', '?????????', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1218', '?????????', '0', '198', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1219', '?????????', '0', '199', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1220', '?????????', '0', '199', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1221', '?????????', '0', '199', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1222', '?????????', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1223', '?????????', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1224', '?????????', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1225', '?????????', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1226', '?????????', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1227', '?????????', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1228', '?????????', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1229', '?????????', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1230', '????????????', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1231', '?????????', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1232', '?????????', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1233', '?????????', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1234', '?????????', '0', '200', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1235', '?????????', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1236', '?????????', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1237', '?????????', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1238', '?????????', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1239', '?????????', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1240', '?????????', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1241', '?????????', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1242', '?????????', '0', '201', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1243', '?????????', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1244', '?????????', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1245', '?????????', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1246', '?????????', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1247', '?????????', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1248', '??????', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1249', '??????', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1250', '?????????', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1251', '?????????', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1252', '?????????', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1253', '?????????', '0', '202', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1254', '?????????', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1255', '?????????', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1256', '????????????', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1257', '?????????', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1258', '?????????', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1259', '?????????', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1260', '?????????', '0', '203', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1261', '?????????', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1262', '?????????', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1263', '?????????', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1264', '?????????', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1265', '?????????', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1266', '?????????', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1267', '?????????', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1268', '????????????', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1269', '?????????', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1270', '?????????', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1271', '?????????', '0', '204', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1272', '?????????', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1273', '?????????', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1274', '?????????', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1275', '?????????', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1276', '?????????', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1277', '?????????', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1278', '?????????', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1279', '?????????', '0', '205', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1280', '?????????', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1281', '?????????', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1282', '?????????', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1283', '?????????', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1284', '?????????', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1285', '?????????', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1286', '?????????', '0', '206', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1287', '?????????', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1288', '?????????', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1289', '?????????', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1290', '?????????', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1291', '?????????', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1292', '?????????', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1293', '?????????', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1294', '?????????', '0', '207', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1295', '?????????', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1296', '?????????', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1297', '?????????', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1298', '?????????', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1299', '?????????', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1300', '?????????', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1301', '?????????', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1302', '?????????', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1303', '?????????', '0', '208', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1304', '?????????', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1305', '?????????', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1306', '?????????', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1307', '?????????', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1308', '?????????', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1309', '?????????', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1310', '?????????', '0', '209', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1311', '?????????', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1312', '?????????', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1313', '?????????', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1314', '?????????', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1315', '?????????', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1316', '?????????', '0', '210', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1317', '?????????', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1318', '?????????', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1319', '?????????', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1320', '?????????', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1321', '?????????', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1322', '?????????', '0', '211', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1323', '?????????', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1324', '?????????', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1325', '?????????', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1326', '?????????', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1327', '?????????', '0', '212', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1328', '?????????', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1329', '?????????', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1330', '?????????', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1331', '?????????', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1332', '?????????', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1333', '?????????', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1334', '?????????', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1335', '?????????', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1336', '?????????', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1337', '?????????', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1338', '?????????', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1339', '?????????', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1340', '?????????', '0', '213', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1341', '?????????', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1342', '?????????', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1343', '?????????', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1344', '?????????', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1345', '?????????', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1346', '?????????', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1347', '?????????', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1348', '?????????', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1349', '?????????', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1350', '?????????', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1351', '?????????', '0', '214', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1352', '?????????', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1353', '?????????', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1354', '?????????', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1355', '?????????', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1356', '?????????', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1357', '?????????', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1358', '?????????', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1359', '?????????', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1360', '?????????', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1361', '?????????', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1362', '?????????', '0', '215', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1363', '?????????', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1364', '?????????', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1365', '?????????', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1366', '?????????', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1367', '?????????', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1368', '?????????', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1369', '?????????', '0', '216', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1370', '?????????', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1371', '?????????', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1372', '?????????', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1373', '?????????', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1374', '?????????', '0', '217', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1375', '?????????', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1376', '?????????', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1377', '?????????', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1378', '?????????', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1379', '?????????', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1380', '?????????', '0', '218', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1381', '?????????', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1382', '?????????', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1383', '?????????', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1384', '?????????', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1385', '?????????', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1386', '?????????', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1387', '?????????', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1388', '?????????', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1389', '?????????', '0', '219', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1390', '?????????', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1391', '?????????', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1392', '?????????', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1393', '?????????', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1394', '?????????', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1395', '?????????', '0', '220', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1396', '?????????', '0', '221', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1397', '?????????', '0', '221', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1398', '?????????', '0', '221', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1399', '?????????', '0', '221', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1400', '?????????', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1401', '?????????', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1402', '?????????', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1403', '?????????', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1404', '?????????', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1405', '?????????', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1406', '?????????', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1407', '?????????', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1408', '?????????', '0', '222', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1409', '?????????', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1410', '?????????', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1411', '?????????', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1412', '?????????', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1413', '?????????', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1414', '?????????', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1415', '?????????', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1416', '?????????????????????', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1417', '?????????', '0', '223', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1418', '?????????', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1419', '?????????', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1420', '?????????', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1421', '?????????', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1422', '?????????', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1423', '?????????', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1424', '?????????', '0', '224', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1425', '?????????', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1426', '?????????', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1427', '?????????', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1428', '?????????', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1429', '?????????', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1430', '?????????', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1431', '?????????', '0', '225', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1432', '????????????', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1433', '?????????', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1434', '?????????', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1435', '?????????', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1436', '?????????', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1437', '?????????', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1438', '?????????', '0', '226', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1439', '?????????', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1440', '????????????', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1441', '????????????', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1442', '????????????', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1443', '?????????', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1444', '?????????', '0', '227', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1445', '????????????', '0', '228', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1446', '?????????', '0', '228', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1447', '?????????', '0', '228', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1448', '?????????', '0', '228', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1449', '?????????', '0', '229', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1450', '?????????', '0', '229', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1451', '?????????', '0', '229', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1452', '?????????', '0', '229', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1453', '????????????', '0', '230', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1454', '????????????', '0', '230', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1455', '??????', '0', '230', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1456', '?????????', '0', '230', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1457', '?????????', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1458', '?????????', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1459', '?????????', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1460', '?????????', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1461', '?????????', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1462', '?????????', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1463', '?????????', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1464', '?????????', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1465', '?????????', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1466', '?????????', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1467', '?????????', '0', '231', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1468', '?????????', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1469', '?????????', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1470', '?????????', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1471', '??????', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1472', '?????????', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1473', '??????', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1474', '?????????', '0', '232', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1475', '?????????', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1476', '?????????', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1477', '?????????', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1478', '?????????', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1479', '?????????', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1480', '?????????', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1481', '?????????', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1482', '?????????', '0', '233', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1483', '?????????', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1484', '?????????', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1485', '?????????', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1486', '?????????', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1487', '?????????', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1488', '?????????', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1489', '?????????', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1490', '?????????', '0', '234', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1491', '?????????', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1492', '?????????', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1493', '??????', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1494', '?????????', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1495', '??????', '0', '235', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1496', '?????????', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1497', '?????????', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1498', '?????????', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1499', '?????????', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1500', '??????', '0', '236', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1501', '?????????', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1502', '?????????', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1503', '??????', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1504', '?????????', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1505', '?????????', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1506', '?????????', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1507', '?????????', '0', '237', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1508', '?????????', '0', '238', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1509', '?????????', '0', '238', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1510', '?????????', '0', '238', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1511', '?????????', '0', '238', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1512', '?????????', '0', '239', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1513', '?????????', '0', '239', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1514', '?????????', '0', '239', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1515', '?????????', '0', '239', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1516', '?????????', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1517', '?????????', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1518', '?????????', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1519', '??????', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1520', '?????????', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1521', '?????????', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1522', '?????????', '0', '240', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1523', '?????????', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1524', '?????????', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1525', '?????????', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1526', '?????????', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1527', '?????????', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1528', '?????????', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1529', '?????????', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1530', '?????????', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1531', '?????????', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1532', '?????????', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1533', '?????????', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1534', '?????????', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1535', '?????????', '0', '241', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1536', '?????????', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1537', '?????????', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1538', '?????????', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1539', '?????????', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1540', '?????????', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1541', '?????????', '0', '242', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1542', '?????????', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1543', '?????????', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1544', '?????????', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1545', '?????????', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1546', '?????????', '0', '243', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1547', '?????????', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1548', '?????????', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1549', '?????????', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1550', '?????????', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1551', '?????????', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1552', '?????????', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1553', '?????????', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1554', '??????', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1555', '?????????', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1556', '?????????', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1557', '?????????', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1558', '?????????', '0', '244', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1559', '?????????', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1560', '?????????', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1561', '?????????', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1562', '?????????', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1563', '?????????', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1564', '?????????', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1565', '?????????', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1566', '?????????', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1567', '?????????', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1568', '?????????', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1569', '?????????', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1570', '?????????', '0', '245', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1571', '?????????', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1572', '?????????', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1573', '?????????', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1574', '?????????', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1575', '?????????', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1576', '?????????', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1577', '?????????', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1578', '?????????', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1579', '?????????', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1580', '?????????', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1581', '?????????', '0', '246', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1582', '?????????', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1583', '?????????', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1584', '?????????', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1585', '?????????', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1586', '?????????', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1587', '?????????', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1588', '?????????', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1589', '????????????', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1590', '?????????', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1591', '?????????', '0', '247', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1592', '?????????', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1593', '?????????', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1594', '?????????', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1595', '?????????', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1596', '?????????', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1597', '?????????', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1598', '?????????', '0', '248', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1599', '?????????', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1600', '?????????', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1601', '?????????', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1602', '?????????', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1603', '?????????', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1604', '?????????', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1605', '?????????', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1606', '?????????', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1607', '?????????', '0', '249', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1608', '?????????', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1609', '?????????', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1610', '????????????', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1611', '?????????', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1612', '????????????', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1613', '?????????', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1614', '?????????', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1615', '?????????', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1616', '?????????', '0', '250', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1617', '?????????', '0', '251', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1618', '?????????', '0', '251', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1619', '?????????', '0', '251', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1620', '?????????', '0', '251', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1621', '?????????', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1622', '?????????', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1623', '?????????', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1624', '?????????', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1625', '?????????', '0', '252', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1626', '?????????', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1627', '?????????', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1628', '?????????', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1629', '?????????', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1630', '?????????', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1631', '?????????', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1632', '?????????', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1633', '?????????', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1634', '?????????', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1635', '?????????', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1636', '?????????', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1637', '?????????', '0', '253', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1638', '?????????', '0', '254', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1639', '?????????', '0', '254', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1640', '?????????', '0', '255', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1641', '?????????', '0', '255', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1642', '?????????', '0', '255', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1643', '?????????', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1644', '??????', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1645', '?????????', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1646', '?????????', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1647', '?????????', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1648', '?????????', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1649', '?????????', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1650', '?????????', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1651', '?????????', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1652', '?????????', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1653', '?????????', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1654', '?????????', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1655', '?????????', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1656', '?????????', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1657', '?????????', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1658', '?????????', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1659', '?????????', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1660', '?????????', '0', '256', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1661', '?????????', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1662', '?????????', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1663', '?????????', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1664', '?????????', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1665', '?????????', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1666', '?????????', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1667', '?????????', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1668', '?????????', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1669', '?????????', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1670', '?????????', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1671', '?????????', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1672', '?????????', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1673', '????????????', '0', '257', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1674', '?????????', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1675', '?????????', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1676', '?????????', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1677', '?????????', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1678', '?????????', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1679', '?????????', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1680', '?????????', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1681', '?????????', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1682', '?????????', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1683', '?????????', '0', '258', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1684', '?????????', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1685', '?????????', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1686', '?????????', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1687', '?????????', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1688', '?????????', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1689', '?????????', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1690', '?????????', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1691', '?????????', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1692', '?????????', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1693', '?????????', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1694', '?????????', '0', '259', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1695', '?????????', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1696', '?????????', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1697', '?????????', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1698', '?????????', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1699', '?????????', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1700', '?????????', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1701', '?????????', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1702', '?????????', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1703', '?????????', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1704', '?????????', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1705', '?????????', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1706', '?????????', '0', '260', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1707', '?????????', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1708', '?????????', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1709', '?????????', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1710', '?????????', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1711', '?????????', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1712', '?????????', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1713', '?????????', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1714', '?????????', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1715', '?????????', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1716', '?????????', '0', '261', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1717', '?????????', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1718', '?????????', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1719', '?????????', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1720', '?????????', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1721', '?????????', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1722', '?????????', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1723', '?????????', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1724', '?????????', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1725', '?????????', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1726', '?????????', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1727', '?????????', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1728', '?????????', '0', '262', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1729', '?????????', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1730', '?????????', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1731', '?????????', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1732', '?????????', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1733', '?????????', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1734', '?????????', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1735', '?????????', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1736', '?????????', '0', '263', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1737', '?????????', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1738', '?????????', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1739', '?????????', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1740', '????????????', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1741', '?????????', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1742', '?????????', '0', '264', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1743', '?????????', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1744', '?????????', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1745', '?????????', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1746', '?????????', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1747', '?????????', '0', '265', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1748', '?????????', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1749', '?????????', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1750', '?????????', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1751', '?????????', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1752', '?????????', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1753', '?????????', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1754', '?????????', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1755', '?????????', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1756', '?????????', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1757', '?????????', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1758', '?????????', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1759', '?????????', '0', '266', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1760', '?????????', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1761', '?????????', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1762', '?????????', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1763', '?????????', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1764', '?????????', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1765', '?????????', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1766', '?????????', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1767', '?????????', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1768', '?????????', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1769', '?????????', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1770', '?????????', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1771', '?????????', '0', '267', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1772', '?????????', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1773', '?????????', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1774', '?????????', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1775', '?????????', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1776', '?????????', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1777', '?????????', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1778', '?????????', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1779', '?????????', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1780', '?????????', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1781', '?????????', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1782', '?????????', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1783', '?????????', '0', '268', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1784', '?????????', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1785', '?????????', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1786', '?????????', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1787', '?????????', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1788', '?????????', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1789', '?????????', '0', '269', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1790', '?????????', '0', '270', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1791', '?????????', '0', '270', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1792', '?????????', '0', '270', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1793', '?????????', '0', '270', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1794', '?????????', '0', '271', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1795', '?????????', '0', '271', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1796', '?????????', '0', '271', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1797', '??????', '0', '271', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1798', '?????????', '0', '272', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1799', '?????????', '0', '272', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1800', '?????????', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1801', '?????????', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1802', '?????????', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1803', '?????????', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1804', '?????????', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1805', '?????????', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1806', '?????????', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1807', '??????', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1808', '?????????', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1809', '?????????', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1810', '?????????', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1811', '?????????', '0', '273', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1812', '?????????', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1813', '??????', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1814', '?????????', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1815', '?????????', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1816', '?????????', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1817', '?????????', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1818', '?????????', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1819', '?????????', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1820', '?????????', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1821', '?????????', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1822', '?????????', '0', '274', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1823', '????????????', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1824', '?????????', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1825', '??????', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1826', '?????????', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1827', '?????????', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1828', '??????', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1829', '?????????', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1830', '?????????', '0', '275', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1831', '?????????', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1832', '?????????', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1833', '?????????', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1834', '?????????', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1835', '?????????', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1836', '?????????', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1837', '?????????', '0', '276', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1838', '?????????', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1839', '??????', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1840', '??????', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1841', '?????????', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1842', '?????????', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1843', '?????????', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1844', '?????????', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1845', '?????????', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1846', '?????????', '0', '277', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1847', '?????????', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1848', '?????????', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1849', '???????????????', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1850', '?????????', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1851', '?????????', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1852', '?????????', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1853', '?????????', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1854', '?????????', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1855', '?????????', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1856', '?????????', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1857', '?????????', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1858', '?????????', '0', '278', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1859', '?????????', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1860', '???????????????', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1861', '?????????', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1862', '????????????', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1863', '?????????', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1864', '??????', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1865', '?????????', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1866', '?????????', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1867', '?????????', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1868', '?????????', '0', '279', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1869', '?????????', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1870', '?????????', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1871', '???????????????', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1872', '?????????', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1873', '?????????', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1874', '?????????', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1875', '?????????', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1876', '?????????', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1877', '?????????', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1878', '??????', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1879', '?????????', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1880', '?????????', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1881', '?????????', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1882', '?????????', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1883', '?????????', '0', '280', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1884', '?????????', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1885', '?????????', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1886', '?????????', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1887', '?????????', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1888', '?????????', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1889', '??????', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1890', '?????????', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1891', '??????', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1892', '?????????', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1893', '?????????', '0', '281', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1894', '?????????', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1895', '?????????', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1896', '?????????', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1897', '?????????', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1898', '?????????', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1899', '?????????', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1900', '??????', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1901', '?????????', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1902', '?????????', '0', '282', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1903', '?????????', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1904', '?????????', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1905', '?????????', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1906', '??????', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1907', '??????', '0', '283', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1908', '?????????', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1909', '?????????', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1910', '?????????', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1911', '?????????', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1912', '?????????', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1913', '?????????', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1914', '?????????', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1915', '?????????', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1916', '?????????', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1917', '?????????', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1918', '?????????', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1919', '?????????', '0', '284', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1920', '?????????', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1921', '?????????', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1922', '?????????', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1923', '?????????', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1924', '?????????', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1925', '?????????', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1926', '?????????', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1927', '??????', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1928', '?????????', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1929', '?????????', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1930', '?????????', '0', '285', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1931', '?????????', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1932', '?????????', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1933', '?????????', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1934', '??????', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1935', '?????????', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1936', '?????????', '0', '286', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1937', '?????????', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1938', '?????????', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1939', '?????????', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1940', '?????????', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1941', '?????????', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1942', '?????????', '0', '287', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1943', '?????????', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1944', '?????????', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1945', '?????????', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1946', '?????????', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1947', '?????????', '0', '288', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1948', '?????????', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1949', '?????????', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1950', '??????', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1951', '?????????', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1952', '?????????', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1953', '?????????', '0', '289', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1954', '?????????', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1955', '?????????', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1956', '?????????', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1957', '?????????', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1958', '?????????', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1959', '?????????', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1960', '?????????', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1961', '?????????', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1962', '?????????', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1963', '?????????', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1964', '?????????', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1965', '?????????', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1966', '?????????', '0', '290', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1967', '?????????', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1968', '?????????', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1969', '?????????', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1970', '??????', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1971', '?????????', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1972', '?????????', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1973', '?????????', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1974', '?????????', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1975', '?????????', '0', '291', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1976', '?????????', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1977', '?????????', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1978', '?????????', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1979', '?????????', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1980', '??????', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1981', '?????????', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1982', '?????????', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1983', '?????????', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1984', '?????????', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1985', '??????', '0', '292', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1986', '?????????', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1987', '?????????', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1988', '?????????', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1989', '?????????', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1990', '?????????', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1991', '?????????', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1992', '?????????', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1993', '?????????', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1994', '?????????', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1995', '?????????', '0', '293', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1996', '?????????', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1997', '?????????', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1998', '?????????', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('1999', '?????????', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2000', '?????????', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2001', '?????????', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2002', '?????????', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2003', '?????????', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2004', '?????????', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2005', '?????????', '0', '294', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2006', '?????????', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2007', '?????????', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2008', '?????????', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2009', '?????????', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2010', '?????????', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2011', '?????????', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2012', '?????????', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2013', '????????????', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2014', '?????????', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2015', '?????????', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2016', '?????????', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2017', '?????????', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2018', '?????????', '0', '295', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2019', '????????????', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2020', '????????????', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2021', '?????????', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2022', '?????????', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2023', '?????????', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2024', '?????????', '0', '296', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2025', '?????????', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2026', '?????????', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2027', '??????', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2028', '?????????', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2029', '?????????', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2030', '?????????', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2031', '??????', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2032', '????????????', '0', '297', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2033', '?????????', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2034', '????????????', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2035', '?????????', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2036', '?????????', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2037', '?????????', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2038', '?????????', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2039', '?????????', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2040', '?????????', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2041', '????????????????????????', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2042', '????????????????????????', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2043', '?????????', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2044', '?????????', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2045', '?????????', '0', '298', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2046', '?????????', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2047', '?????????', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2048', '?????????', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2049', '?????????', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2050', '?????????', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2051', '?????????', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2052', '????????????', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2053', '?????????', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2054', '?????????', '0', '299', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2055', '????????????', '0', '300', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2056', '?????????', '0', '300', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2057', '?????????', '0', '300', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2058', '?????????', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2059', '?????????', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2060', '?????????', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2061', '?????????', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2062', '?????????', '0', '301', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2063', '?????????', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2064', '?????????', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2065', '?????????', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2066', '?????????', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2067', '?????????', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2068', '?????????', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2069', '?????????', '0', '302', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2070', '?????????', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2071', '?????????', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2072', '?????????', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2073', '?????????', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2074', '?????????', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2075', '?????????', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2076', '?????????', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2077', '?????????', '0', '303', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2078', '?????????', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2079', '?????????', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2080', '?????????', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2081', '?????????', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2082', '?????????', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2083', '?????????', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2084', '?????????', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2085', '?????????', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2086', '?????????', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2087', '?????????', '0', '304', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2088', '?????????', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2089', '?????????', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2090', '?????????', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2091', '?????????', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2092', '?????????', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2093', '?????????', '0', '305', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2094', '?????????', '0', '306', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2095', '?????????', '0', '306', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2096', '?????????', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2097', '?????????', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2098', '?????????', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2099', '?????????', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2100', '?????????', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2101', '?????????', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2102', '?????????', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2103', '?????????', '0', '307', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2104', '?????????', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2105', '?????????', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2106', '?????????', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2107', '?????????', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2108', '?????????', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2109', '?????????', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2110', '?????????', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2111', '?????????', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2112', '?????????', '0', '312', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2113', '?????????', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2114', '?????????', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2115', '?????????', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2116', '?????????', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2117', '?????????', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2118', '??????', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2119', '?????????', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2120', '?????????', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2121', '?????????', '0', '313', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2122', '?????????', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2123', '?????????', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2124', '?????????', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2125', '?????????', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2126', '?????????', '0', '314', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2127', '?????????', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2128', '?????????', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2129', '?????????', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2130', '?????????', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2131', '?????????', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2132', '?????????', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2133', '?????????', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2134', '?????????', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2135', '?????????', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2136', '?????????', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2137', '?????????', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2138', '?????????', '0', '315', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2139', '?????????', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2140', '?????????', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2141', '?????????', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2142', '?????????', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2143', '?????????', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2144', '?????????', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2145', '?????????', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2146', '?????????', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2147', '?????????', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2148', '?????????', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2149', '?????????????????????', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2150', '?????????', '0', '316', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2151', '????????????', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2152', '?????????', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2153', '?????????', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2154', '?????????', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2155', '?????????', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2156', '?????????', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2157', '?????????', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2158', '?????????', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2159', '?????????', '0', '317', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2160', '?????????', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2161', '?????????', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2162', '?????????', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2163', '?????????', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2164', '??????', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2165', '?????????', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2166', '?????????', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2167', '?????????', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2168', '?????????', '0', '318', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2169', '?????????', '0', '319', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2170', '????????????', '0', '319', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2171', '?????????', '0', '319', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2172', '?????????', '0', '319', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2173', '?????????', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2174', '?????????', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2175', '??????', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2176', '?????????', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2177', '?????????', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2178', '?????????', '0', '320', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2179', '?????????', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2180', '?????????', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2181', '?????????', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2182', '?????????', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2183', '?????????', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2184', '?????????', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2185', '?????????', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2186', '?????????', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2187', '?????????', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2188', '?????????', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2189', '?????????', '0', '321', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2190', '?????????', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2191', '????????????', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2192', '?????????', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2193', '?????????', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2194', '?????????', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2195', '??????', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2196', '?????????', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2197', '?????????', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2198', '?????????', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2199', '?????????', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2200', '?????????????????????', '0', '322', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2201', '?????????', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2202', '?????????', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2203', '?????????', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2204', '?????????', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2205', '?????????', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2206', '?????????', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2207', '?????????????????????', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2208', '?????????????????????', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2209', '?????????????????????', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2210', '???????????????????????????', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2211', '?????????????????????', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2212', '?????????', '0', '323', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2213', '?????????', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2214', '?????????', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2215', '?????????', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2216', '????????????', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2217', '?????????', '0', '324', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2218', '?????????', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2219', '?????????', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2220', '?????????', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2221', '?????????', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2222', '?????????', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2223', '?????????', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2224', '?????????', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2225', '?????????', '0', '325', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2226', '?????????', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2227', '?????????', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2228', '?????????', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2229', '?????????', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2230', '?????????', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2231', '?????????', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2232', '?????????', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2233', '?????????', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2234', '?????????', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2235', '?????????', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2236', '?????????', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2237', '?????????', '0', '326', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2238', '?????????', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2239', '?????????', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2240', '?????????', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2241', '?????????', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2242', '?????????', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2243', '?????????', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2244', '?????????????????????', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2245', '?????????', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2246', '?????????', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2247', '?????????', '0', '327', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2248', '?????????', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2249', '?????????', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2250', '?????????', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2251', '?????????', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2252', '?????????', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2253', '?????????', '0', '328', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2254', '?????????', '0', '329', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2255', '?????????', '0', '329', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2256', '?????????', '0', '329', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2257', '?????????', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2258', '?????????', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2259', '?????????', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2260', '?????????', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2261', '?????????', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2262', '?????????', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2263', '?????????', '0', '330', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2264', '?????????', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2265', '?????????', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2266', '?????????', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2267', '?????????', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2268', '?????????', '0', '331', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2269', '?????????', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2270', '?????????', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2271', '?????????', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2272', '?????????', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2273', '?????????', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2274', '?????????', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2275', '?????????', '0', '332', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2276', '?????????', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2277', '?????????', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2278', '?????????', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2279', '?????????', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2280', '?????????', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2281', '?????????', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2282', '?????????', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2283', '?????????', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2284', '?????????', '0', '333', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2285', '?????????', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2286', '?????????', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2287', '?????????', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2288', '?????????', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2289', '?????????', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2290', '?????????', '0', '334', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2291', '?????????', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2292', '?????????', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2293', '?????????', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2294', '?????????', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2295', '?????????', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2296', '?????????', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2297', '?????????', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2298', '?????????', '0', '335', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2299', '?????????', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2300', '?????????', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2301', '?????????', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2302', '?????????', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2303', '?????????', '0', '336', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2304', '?????????', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2305', '??????', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2306', '?????????', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2307', '?????????', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2308', '?????????', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2309', '?????????', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2310', '?????????', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2311', '?????????', '0', '337', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2312', '??????', '0', '338', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2313', '?????????', '0', '338', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2314', '?????????', '0', '338', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2315', '?????????', '0', '338', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2316', '?????????', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2317', '?????????', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2318', '?????????', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2319', '?????????', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2320', '?????????', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2321', '?????????', '0', '339', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2322', '?????????', '0', '340', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2323', '?????????', '0', '340', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2324', '?????????', '0', '340', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2325', '?????????', '0', '340', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2326', '?????????', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2327', '?????????', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2328', '?????????', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2329', '???????????????????????????', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2330', '?????????????????????', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2331', '?????????', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2332', '?????????', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2333', '?????????', '0', '341', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2334', '?????????', '0', '344', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2335', '?????????', '0', '344', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2336', '?????????', '0', '344', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2337', '?????????', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2338', '?????????', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2339', '?????????', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2340', '?????????', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2341', '?????????', '0', '345', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2342', '?????????', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2343', '?????????', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2344', '?????????', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2345', '?????????', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2346', '?????????', '0', '346', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2347', '?????????', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2348', '?????????', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2349', '?????????', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2350', '????????????', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2351', '?????????', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2352', '?????????', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2353', '?????????', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2354', '?????????', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2355', '?????????', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2356', '?????????', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2357', '?????????', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2358', '??????', '0', '347', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2359', '?????????', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2360', '?????????', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2361', '?????????', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2362', '?????????', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2363', '?????????', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2364', '?????????', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2365', '?????????', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2366', '?????????', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2367', '?????????????????????', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2368', '?????????????????????', '0', '348', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2369', '?????????', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2370', '?????????', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2371', '?????????', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2372', '?????????', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2373', '?????????', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2374', '?????????', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2375', '?????????', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2376', '?????????', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2377', '?????????', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2378', '?????????', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2379', '?????????', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2380', '?????????', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2381', '?????????????????????', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2382', '?????????', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2383', '?????????', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2384', '?????????', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2385', '?????????????????????', '0', '349', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2386', '?????????', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2387', '?????????', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2388', '?????????', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2389', '?????????', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2390', '??????', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2391', '?????????', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2392', '?????????', '0', '350', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2393', '?????????', '0', '351', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2394', '?????????', '0', '351', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2395', '????????????', '0', '351', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2396', '?????????', '0', '351', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2397', '?????????', '0', '352', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2398', '?????????', '0', '352', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2399', '?????????', '0', '352', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2400', '?????????', '0', '352', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2401', '?????????', '0', '353', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2402', '?????????', '0', '353', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2403', '?????????', '0', '353', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2404', '?????????', '0', '353', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2405', '?????????', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2406', '?????????', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2407', '?????????', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2408', '?????????', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2409', '?????????', '0', '354', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2410', '?????????', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2411', '??????', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2412', '?????????', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2413', '?????????', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2414', '?????????', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2415', '?????????', '0', '355', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2416', '?????????', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2417', '?????????', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2418', '?????????', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2419', '?????????', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2420', '?????????', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2421', '?????????', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2422', '?????????', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2423', '?????????', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2424', '?????????', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2425', '?????????', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2426', '?????????', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2427', '?????????????????????', '0', '356', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2428', '?????????', '0', '357', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2429', '?????????', '0', '357', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2430', '?????????', '0', '357', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2431', '?????????????????????', '0', '357', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2432', '????????????', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2433', '?????????', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2434', '?????????', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2435', '?????????', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2436', '?????????', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2437', '????????????????????????', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2438', '????????????????????????', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2439', '?????????????????????', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2440', '?????????????????????', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2441', '?????????????????????', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2442', '?????????', '0', '358', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2443', '?????????', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2444', '?????????', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2445', '?????????', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2446', '?????????', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2447', '?????????????????????', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2448', '?????????', '0', '359', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2449', '?????????', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2450', '?????????', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2451', '?????????', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2452', '?????????', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2453', '?????????', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2454', '?????????', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2455', '?????????', '0', '360', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2456', '?????????', '0', '361', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2457', '?????????', '0', '361', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2458', '?????????', '0', '361', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2459', '?????????', '0', '361', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2460', '?????????', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2461', '?????????', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2462', '?????????', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2463', '?????????', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2464', '?????????', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2465', '????????????', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2466', '????????????', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2467', '?????????', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2468', '?????????', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2469', '?????????', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2470', '?????????', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2471', '??????', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2472', '?????????', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2473', '?????????', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2474', '?????????', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2475', '????????????', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2476', '?????????', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2477', '?????????', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2478', '?????????', '0', '382', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2479', '????????????', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2480', '?????????', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2481', '?????????', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2482', '?????????', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2483', '??????', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2484', '?????????', '0', '383', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2485', '??????', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2486', '??????', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2487', '?????????', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2488', '?????????', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2489', '?????????', '0', '384', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2490', '?????????', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2491', '?????????', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2492', '????????????', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2493', '??????', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2494', '?????????', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2495', '?????????', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2496', '?????????', '0', '385', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2497', '?????????', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2498', '?????????', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2499', '?????????', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2500', '?????????', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2501', '?????????', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2502', '?????????', '0', '386', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2503', '?????????', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2504', '?????????', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2505', '?????????', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2506', '?????????', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2507', '??????', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2508', '?????????', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2509', '?????????????????????', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2510', '?????????', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2511', '?????????', '0', '387', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2512', '?????????', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2513', '?????????', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2514', '?????????', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2515', '?????????', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2516', '?????????', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2517', '?????????', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2518', '?????????', '0', '388', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2519', '?????????', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2520', '?????????', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2521', '?????????', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2522', '?????????', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2523', '?????????', '0', '389', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2524', '?????????', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2525', '?????????', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2526', '?????????', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2527', '?????????', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2528', '?????????', '0', '390', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2529', '?????????', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2530', '?????????', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2531', '????????????', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2532', '????????????', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2533', '?????????', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2534', '?????????', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2535', '?????????', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2536', '?????????', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2537', '?????????????????????', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2538', '?????????????????????', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2539', '????????????', '0', '391', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2540', '?????????', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2541', '?????????', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2542', '?????????', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2543', '?????????', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2544', '?????????', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2545', '?????????', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2546', '?????????', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2547', '?????????', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2548', '?????????', '0', '392', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2549', '?????????', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2550', '?????????', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2551', '?????????', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2552', '?????????', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2553', '?????????', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2554', '?????????', '0', '393', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2555', '?????????', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2556', '?????????', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2557', '?????????', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2558', '?????????', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2559', '?????????', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2560', '??????', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2561', '??????', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2562', '?????????', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2563', '?????????', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2564', '?????????', '0', '394', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2565', '?????????', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2566', '?????????', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2567', '?????????', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2568', '?????????', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2569', '?????????', '0', '395', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2570', '?????????', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2571', '??????', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2572', '?????????', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2573', '?????????', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2574', '?????????', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2575', '??????', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2576', '?????????', '0', '396', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2577', '?????????', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2578', '?????????', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2579', '?????????', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2580', '?????????', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2581', '?????????', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2582', '?????????', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2583', '?????????', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2584', '?????????', '0', '397', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2585', '?????????', '0', '398', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2586', '?????????', '0', '398', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2587', '?????????', '0', '398', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2588', '?????????', '0', '398', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2589', '?????????', '0', '399', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2590', '?????????', '0', '399', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2591', '?????????', '0', '399', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2592', '?????????', '0', '399', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2593', '?????????', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2594', '??????', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2595', '??????', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2596', '?????????', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2597', '????????????', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2598', '?????????', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2599', '?????????', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2600', '?????????', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2601', '????????????', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2602', '?????????', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2603', '?????????', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2604', '????????????', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2605', '?????????', '0', '400', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2606', '?????????', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2607', '?????????', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2608', '?????????', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2609', '?????????', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2610', '?????????', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2611', '?????????', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2612', '?????????', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2613', '?????????', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2614', '?????????', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2615', '?????????', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2616', '?????????', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2617', '?????????', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2618', '?????????', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2619', '?????????', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2620', '?????????', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2621', '?????????', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2622', '?????????', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2623', '?????????', '0', '401', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2624', '?????????', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2625', '?????????????????????', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2626', '?????????', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2627', '?????????', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2628', '?????????', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2629', '?????????', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2630', '?????????', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2631', '?????????', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2632', '?????????', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2633', '?????????', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2634', '?????????', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2635', '?????????', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2636', '?????????', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2637', '?????????', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2638', '?????????', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2639', '?????????', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2640', '?????????', '0', '402', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2641', '?????????', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2642', '?????????', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2643', '?????????', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2644', '?????????', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2645', '?????????', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2646', '?????????', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2647', '?????????', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2648', '?????????', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2649', '?????????', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2650', '?????????', '0', '403', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2651', '?????????', '0', '404', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2652', '????????????', '0', '404', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2653', '?????????', '0', '404', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2654', '??????', '0', '404', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2655', '????????????', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2656', '?????????', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2657', '?????????', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2658', '?????????', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2659', '?????????', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2660', '?????????', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2661', '??????????????????????????????', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2662', '??????????????????????????????', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2663', '?????????', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2664', '?????????', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2665', '?????????', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2666', '?????????', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2667', '?????????', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2668', '?????????', '0', '405', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2669', '?????????', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2670', '?????????', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2671', '?????????', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2672', '??????????????????????????????', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2673', '??????????????????????????????', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2674', '??????????????????????????????', '0', '406', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2675', '?????????', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2676', '?????????', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2677', '?????????????????????', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2678', '?????????', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2679', '?????????', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2680', '??????????????????????????????', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2681', '?????????', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2682', '????????????????????????', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2683', '?????????????????????', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2684', '????????????', '0', '407', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2685', '?????????', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2686', '?????????', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2687', '?????????', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2688', '?????????', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2689', '?????????', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2690', '?????????', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2691', '?????????', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2692', '?????????', '0', '408', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2693', '?????????', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2694', '?????????', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2695', '?????????', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2696', '?????????', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2697', '?????????', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2698', '?????????', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2699', '?????????????????????????????????', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2700', '?????????', '0', '409', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2701', '?????????', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2702', '?????????', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2703', '?????????', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2704', '?????????', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2705', '?????????', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2706', '?????????', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2707', '?????????', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2708', '?????????', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2709', '?????????', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2710', '?????????', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2711', '?????????', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2712', '?????????', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2713', '?????????', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2714', '?????????', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2715', '?????????', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2716', '?????????', '0', '410', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2717', '?????????', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2718', '?????????', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2719', '?????????', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2720', '?????????', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2721', '?????????', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2722', '?????????', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2723', '?????????', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2724', '?????????', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2725', '?????????', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2726', '?????????', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2727', '?????????', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2728', '?????????????????????', '0', '411', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2729', '?????????', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2730', '?????????', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2731', '?????????', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2732', '?????????', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2733', '?????????', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2734', '?????????', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2735', '?????????', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2736', '?????????', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2737', '?????????', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2738', '?????????????????????', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2739', '?????????', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2740', '???????????????????????????', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2741', '???????????????????????????', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2742', '?????????', '0', '412', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2743', '?????????', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2744', '?????????', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2745', '?????????', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2746', '?????????', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2747', '?????????', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2748', '?????????', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2749', '?????????', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2750', '?????????', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2751', '?????????', '0', '413', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2752', '?????????', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2753', '?????????', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2754', '?????????', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2755', '?????????', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2756', '?????????', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2757', '?????????', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2758', '?????????????????????', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2759', '???????????????????????????', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2760', '????????????????????????????????????', '0', '414', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2761', '?????????', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2762', '?????????', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2763', '?????????', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2764', '?????????', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2765', '?????????', '0', '415', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2766', '?????????', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2767', '?????????', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2768', '?????????', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2769', '?????????', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2770', '?????????', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2771', '?????????', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2772', '?????????', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2773', '?????????', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2774', '?????????', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2775', '?????????', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2776', '?????????', '0', '416', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2777', '?????????', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2778', '????????????????????????', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2779', '?????????', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2780', '?????????', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2781', '?????????????????????', '0', '417', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2782', '?????????', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2783', '??????????????????????????????', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2784', '????????????????????????', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2785', '?????????????????????', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2786', '???????????????????????????', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2787', '???????????????????????????????????????', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2788', '??????????????????????????????', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2789', '????????????????????????????????????', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2790', '????????????????????????', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2791', '?????????????????????', '0', '418', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2792', '?????????', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2793', '?????????', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2794', '??????', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2795', '?????????', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2796', '?????????', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2797', '?????????????????????????????????????????????', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2798', '???????????????????????????', '0', '419', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2799', '?????????????????????', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2800', '?????????', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2801', '?????????', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2802', '?????????', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2803', '?????????', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2804', '?????????', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2805', '?????????', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2806', '?????????', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2807', '?????????', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2808', '?????????', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2809', '?????????', '0', '420', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2810', '?????????', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2811', '?????????', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2812', '?????????', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2813', '?????????????????????', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2814', '?????????', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2815', '?????????', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2816', '?????????', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2817', '?????????', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2818', '?????????', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2819', '?????????', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2820', '?????????????????????????????????', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2821', '?????????', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2822', '?????????????????????', '0', '421', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2823', '?????????', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2824', '?????????', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2825', '?????????', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2826', '????????????', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2827', '?????????', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2828', '?????????', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2829', '?????????', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2830', '?????????', '0', '422', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2831', '?????????', '0', '423', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2832', '?????????', '0', '423', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2833', '?????????', '0', '423', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2834', '?????????', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2835', '?????????????????????', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2836', '?????????', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2837', '?????????', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2838', '?????????', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2839', '?????????????????????', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2840', '???????????????????????????', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2841', '?????????', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2842', '?????????', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2843', '?????????', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2844', '?????????', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2845', '?????????', '0', '424', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2846', '?????????', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2847', '?????????', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2848', '?????????', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2849', '?????????', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2850', '?????????', '0', '425', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2851', '?????????', '0', '426', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2852', '?????????', '0', '426', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2853', '??????????????????????????????', '0', '426', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2854', '??????????????????????????????', '0', '426', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2855', '???????????????', '0', '427', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2856', '?????????', '0', '427', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2857', '????????????????????????', '0', '427', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2858', '?????????', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2859', '?????????', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2860', '?????????', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2861', '?????????', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2862', '?????????', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2863', '???????????????', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2864', '?????????', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2865', '???????????????', '0', '428', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2866', '?????????', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2867', '?????????', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2868', '?????????', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2869', '????????????', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2870', '?????????', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2871', '?????????', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2872', '?????????', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2873', '?????????', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2874', '?????????', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2875', '?????????', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2876', '?????????', '0', '429', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2877', '?????????', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2878', '?????????', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2879', '?????????', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2880', '?????????', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2881', '?????????', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2882', '?????????', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2883', '?????????', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2884', '?????????', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2885', '?????????', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2886', '?????????', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2887', '?????????', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2888', '????????????', '0', '430', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2889', '????????????', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2890', '????????????', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2891', '?????????', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2892', '?????????', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2893', '?????????', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2894', '?????????', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2895', '?????????', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2896', '????????????', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2897', '?????????', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2898', '?????????', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2899', '?????????', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2900', '?????????', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2901', '?????????', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2902', '?????????', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2903', '?????????', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2904', '????????????', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2905', '?????????', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2906', '?????????', '0', '431', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2907', '?????????', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2908', '?????????', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2909', '?????????', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2910', '?????????', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2911', '?????????', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2912', '?????????', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2913', '??????', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2914', '?????????', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2915', '?????????', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2916', '?????????', '0', '432', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2917', '?????????', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2918', '?????????', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2919', '?????????', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2920', '?????????', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2921', '?????????', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2922', '?????????', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2923', '?????????', '0', '433', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2924', '?????????', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2925', '???????????????', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2926', '?????????', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2927', '?????????', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2928', '?????????', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2929', '?????????', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2930', '??????', '0', '434', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2931', '?????????', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2932', '?????????', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2933', '?????????', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2934', '?????????', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2935', '?????????', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2936', '?????????', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2937', '?????????', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2938', '?????????', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2939', '?????????', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2940', '?????????', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2941', '?????????', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2942', '??????', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2943', '?????????', '0', '435', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2944', '?????????', '0', '436', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2945', '?????????', '0', '436', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2946', '?????????', '0', '436', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2947', '?????????', '0', '436', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2948', '?????????', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2949', '?????????', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2950', '?????????', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2951', '?????????', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2952', '?????????', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2953', '?????????', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2954', '??????', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2955', '??????', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2956', '?????????', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2957', '?????????', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2958', '??????', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2959', '?????????', '0', '437', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2960', '?????????', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2961', '?????????', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2962', '?????????', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2963', '?????????', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2964', '?????????', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2965', '??????', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2966', '?????????', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2967', '?????????', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2968', '??????', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2969', '?????????', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2970', '?????????', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2971', '?????????', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2972', '?????????', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2973', '?????????', '0', '438', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2974', '?????????', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2975', '??????', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2976', '?????????', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2977', '?????????', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2978', '?????????', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2979', '?????????', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2980', '?????????', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2981', '?????????', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2982', '?????????', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2983', '?????????', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2984', '?????????', '0', '439', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2985', '?????????', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2986', '?????????', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2987', '?????????', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2988', '?????????', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2989', '?????????', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2990', '?????????', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2991', '?????????', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2992', '?????????', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2993', '??????', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2994', '?????????', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2995', '?????????', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2996', '?????????', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2997', '?????????', '0', '440', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2998', '?????????', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('2999', '?????????', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3000', '?????????', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3001', '??????', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3002', '?????????', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3003', '??????', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3004', '?????????', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3005', '?????????', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3006', '?????????', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3007', '?????????', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3008', '?????????', '0', '441', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3009', '?????????', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3010', '?????????', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3011', '?????????', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3012', '?????????', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3013', '?????????', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3014', '?????????', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3015', '?????????', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3016', '?????????', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3017', '??????', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3018', '?????????', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3019', '?????????', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3020', '?????????', '0', '442', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3021', '?????????', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3022', '?????????', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3023', '?????????', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3024', '?????????', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3025', '?????????', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3026', '?????????', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3027', '?????????', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3028', '?????????', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3029', '?????????', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3030', '?????????', '0', '443', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3031', '?????????', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3032', '?????????', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3033', '?????????', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3034', '?????????', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3035', '?????????', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3036', '?????????', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3037', '?????????', '0', '444', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3038', '?????????', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3039', '????????????', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3040', '?????????', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3041', '?????????', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3042', '?????????', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3043', '?????????', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3044', '?????????', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3045', '?????????', '0', '445', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3046', '?????????', '0', '447', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3047', '?????????', '0', '447', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3048', '?????????', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3049', '?????????', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3050', '?????????', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3051', '?????????', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3052', '?????????', '0', '448', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3053', '?????????', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3054', '?????????', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3055', '?????????', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3056', '?????????', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3057', '?????????', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3058', '?????????', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3059', '????????????????????????', '0', '449', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3060', '?????????', '0', '450', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3061', '?????????', '0', '450', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3062', '?????????', '0', '450', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3063', '?????????????????????', '0', '450', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3064', '?????????', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3065', '????????????????????????', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3066', '?????????', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3067', '?????????', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3068', '?????????', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3069', '?????????', '0', '451', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3070', '?????????', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3071', '?????????', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3072', '?????????', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3073', '?????????', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3074', '?????????', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3075', '?????????', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3076', '?????????', '0', '452', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3077', '?????????', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3078', '?????????', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3079', '?????????', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3080', '????????????????????????', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3081', '??????????????????????????????', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3082', '?????????', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3083', '?????????', '0', '453', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3084', '?????????', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3085', '?????????', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3086', '??????', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3087', '?????????', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3088', '?????????', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3089', '?????????', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3090', '??????', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3091', '?????????', '0', '454', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3092', '?????????', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3093', '?????????', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3094', '?????????', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3095', '?????????', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3096', '?????????', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3097', '??????', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3098', '??????', '0', '455', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3099', '?????????', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3100', '??????', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3101', '??????', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3102', '?????????', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3103', '??????', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3104', '?????????', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3105', '??????', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3106', '??????', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3107', '?????????', '0', '456', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3108', '?????????', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3109', '?????????', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3110', '?????????', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3111', '?????????', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3112', '?????????', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3113', '?????????', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3114', '??????????????????', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3115', '?????????????????????????????????????????????', '0', '457', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3116', '?????????', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3117', '?????????', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3118', '?????????', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3119', '?????????', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3120', '?????????', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3121', '?????????', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3122', '?????????', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3123', '?????????', '0', '458', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3124', '?????????', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3125', '?????????', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3126', '?????????', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3127', '?????????', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3128', '???????????????????????????', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3129', '?????????', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3130', '?????????', '0', '459', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3131', '?????????', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3132', '???????????????????????????', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3133', '?????????', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3134', '?????????????????????', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3135', '?????????????????????', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3136', '????????????????????????', '0', '460', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3137', '?????????????????????', '0', '461', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3138', '?????????', '0', '461', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3139', '?????????', '0', '461', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3140', '?????????', '0', '461', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3141', '?????????', '0', '462', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3142', '?????????', '0', '462', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3143', '?????????', '0', '462', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3144', '????????????????????????', '0', '462', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3145', '?????????', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3146', '?????????', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3147', '?????????', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3148', '?????????', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3149', '?????????', '0', '463', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3150', '?????????', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3151', '?????????', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3152', '?????????', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3153', '?????????', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3154', '?????????', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3155', '?????????', '0', '464', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3156', '?????????', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3157', '?????????', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3158', '?????????', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3159', '?????????', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3160', '?????????', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3161', '????????????', '0', '465', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3162', '????????????', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3163', '????????????', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3164', '?????????', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3165', '?????????', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3166', '?????????', '0', '466', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3167', '?????????', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3168', '?????????', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3169', '?????????', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3170', '?????????', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3171', '?????????', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3172', '?????????', '0', '467', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3173', '????????????', '0', '468', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3174', '?????????', '0', '468', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3175', '?????????', '0', '468', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3176', '?????????', '0', '469', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3177', '?????????', '0', '469', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3178', '?????????', '0', '469', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3179', '????????????', '0', '469', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3180', '?????????', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3181', '?????????', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3182', '?????????', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3183', '?????????', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3184', '?????????', '0', '470', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3185', '????????????', '0', '471', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3186', '?????????', '0', '471', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3187', '?????????', '0', '471', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3188', '?????????', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3189', '???????????????', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3190', '?????????', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3191', '????????????', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3192', '????????????', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3193', '????????????', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3194', '?????????', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3195', '???????????????', '0', '472', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3196', '????????????', '0', '473', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3197', '???????????????', '0', '473', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3198', '????????????', '0', '473', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3199', '????????????', '0', '473', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3200', '????????????', '0', '474', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3201', '?????????', '0', '474', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3202', '????????????', '0', '474', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3203', '?????????', '0', '475', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3204', '???????????????????????????', '0', '475', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3205', '?????????', '0', '475', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3206', '?????????', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3207', '?????????', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3208', '?????????', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3209', '????????????', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3210', '????????????', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3211', '?????????', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3212', '???????????????', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3213', '????????????????????????', '0', '476', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3214', '?????????', '0', '477', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3215', '?????????', '0', '477', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3216', '?????????', '0', '477', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3217', '????????????', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3218', '?????????', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3219', '?????????', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3220', '?????????', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3221', '?????????', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3222', '?????????????????????', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3223', '?????????', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3224', '?????????', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3225', '?????????', '0', '478', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3226', '????????????', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3227', '?????????', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3228', '?????????', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3229', '?????????', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3230', '?????????', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3231', '?????????', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3232', '?????????', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3233', '????????????', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3234', '?????????', '0', '479', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3235', '????????????', '0', '480', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3236', '????????????', '0', '480', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3237', '????????????', '0', '480', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3238', '?????????', '0', '480', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3239', '?????????', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3240', '?????????', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3241', '?????????', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3242', '????????????', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3243', '?????????', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3244', '?????????', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3245', '?????????', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3246', '????????????', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3247', '????????????', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3248', '?????????', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3249', '?????????', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3250', '?????????????????????????????????', '0', '481', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3251', '?????????', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3252', '?????????', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3253', '?????????', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3254', '?????????', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3255', '?????????', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3256', '?????????', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3257', '?????????', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3258', '?????????', '0', '482', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3259', '?????????', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3260', '?????????', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3261', '?????????', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3262', '???????????????????????????', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3263', '?????????', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3264', '?????????', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3265', '?????????', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3266', '?????????', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3267', '????????????', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3268', '????????????', '0', '483', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3269', '?????????', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3270', '?????????', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3271', '?????????', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3272', '?????????', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3273', '?????????', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3274', '?????????', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3275', '??????????????????????????????', '0', '484', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3276', '????????????', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3277', '????????????', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3278', '?????????', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3279', '?????????', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3280', '????????????', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3281', '?????????', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3282', '????????????', '0', '485', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3358', '?????????', '', '0', '0', '', '1', '0', '', null, '0');
INSERT INTO `v9_linkage` VALUES ('3359', '?????????', '', '3358', '0', '', '1', '0', '', null, '0');

-- ----------------------------
-- Table structure for v9_log
-- ----------------------------
DROP TABLE IF EXISTS `v9_log`;
CREATE TABLE `v9_log` (
  `logid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `field` varchar(15) NOT NULL,
  `value` int(10) unsigned NOT NULL DEFAULT '0',
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `action` varchar(20) NOT NULL,
  `querystring` varchar(255) NOT NULL,
  `data` mediumtext NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `ip` varchar(15) NOT NULL,
  `time` datetime NOT NULL DEFAULT '1000-01-01 00:00:00',
  PRIMARY KEY (`logid`),
  KEY `module` (`module`,`file`,`action`),
  KEY `username` (`username`,`action`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_log
-- ----------------------------
INSERT INTO `v9_log` VALUES ('1', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2019-03-21 00:04:04');
INSERT INTO `v9_log` VALUES ('2', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2019-03-21 00:04:04');
INSERT INTO `v9_log` VALUES ('3', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2019-03-21 00:07:23');
INSERT INTO `v9_log` VALUES ('4', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2019-03-21 00:07:25');
INSERT INTO `v9_log` VALUES ('5', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2019-03-21 00:10:40');
INSERT INTO `v9_log` VALUES ('6', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2019-03-21 00:10:48');
INSERT INTO `v9_log` VALUES ('7', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2019-03-21 00:11:20');
INSERT INTO `v9_log` VALUES ('8', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2019-03-21 00:11:27');
INSERT INTO `v9_log` VALUES ('9', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2019-03-21 00:13:03');
INSERT INTO `v9_log` VALUES ('10', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2019-03-21 00:13:05');
INSERT INTO `v9_log` VALUES ('11', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2019-03-21 00:15:31');
INSERT INTO `v9_log` VALUES ('12', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2019-03-21 00:20:19');
INSERT INTO `v9_log` VALUES ('13', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2019-03-21 00:20:22');
INSERT INTO `v9_log` VALUES ('14', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2019-03-21 00:21:47');
INSERT INTO `v9_log` VALUES ('15', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2019-03-21 00:22:23');
INSERT INTO `v9_log` VALUES ('16', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2019-03-21 00:22:24');
INSERT INTO `v9_log` VALUES ('17', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2019-03-21 00:42:03');
INSERT INTO `v9_log` VALUES ('18', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2019-03-21 00:47:24');
INSERT INTO `v9_log` VALUES ('19', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2019-03-21 00:48:40');
INSERT INTO `v9_log` VALUES ('20', '', '0', 'admin', '', 'index', '?m=admin&c=index&a=login', '', '0', '', '127.0.0.1', '2019-03-21 00:48:51');

-- ----------------------------
-- Table structure for v9_member
-- ----------------------------
DROP TABLE IF EXISTS `v9_member`;
CREATE TABLE `v9_member` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `phpssouid` mediumint(8) unsigned NOT NULL,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `regip` char(15) NOT NULL DEFAULT '',
  `lastip` char(15) NOT NULL DEFAULT '',
  `loginnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `email` char(32) NOT NULL DEFAULT '',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `areaid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `message` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islock` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `vip` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `overduedate` int(10) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `connectid` char(40) NOT NULL DEFAULT '',
  `from` char(10) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20)),
  KEY `phpssouid` (`phpssouid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_member
-- ----------------------------

-- ----------------------------
-- Table structure for v9_member_detail
-- ----------------------------
DROP TABLE IF EXISTS `v9_member_detail`;
CREATE TABLE `v9_member_detail` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `birthday` date DEFAULT NULL,
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_member_detail
-- ----------------------------

-- ----------------------------
-- Table structure for v9_member_group
-- ----------------------------
DROP TABLE IF EXISTS `v9_member_group`;
CREATE TABLE `v9_member_group` (
  `groupid` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(15) NOT NULL,
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `starnum` tinyint(2) unsigned NOT NULL,
  `point` smallint(6) unsigned NOT NULL,
  `allowmessage` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowvisit` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpost` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowpostverify` tinyint(1) unsigned NOT NULL,
  `allowsearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allowupgrade` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowsendmessage` tinyint(1) unsigned NOT NULL,
  `allowpostnum` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowattachment` tinyint(1) NOT NULL,
  `price_y` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_m` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `price_d` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `icon` char(30) NOT NULL,
  `usernamecolor` char(7) NOT NULL,
  `description` char(100) NOT NULL,
  `sort` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`groupid`),
  KEY `disabled` (`disabled`),
  KEY `listorder` (`sort`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_member_group
-- ----------------------------
INSERT INTO `v9_member_group` VALUES ('8', '??????', '1', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '', '', '', '0', '0');
INSERT INTO `v9_member_group` VALUES ('2', '????????????', '1', '1', '50', '100', '1', '1', '0', '0', '0', '1', '0', '0', '50.00', '10.00', '1.00', '', '', '', '2', '0');
INSERT INTO `v9_member_group` VALUES ('6', '????????????', '1', '2', '100', '150', '0', '1', '0', '0', '1', '1', '0', '0', '300.00', '30.00', '1.00', '', '', '', '6', '0');
INSERT INTO `v9_member_group` VALUES ('4', '????????????', '1', '3', '150', '500', '1', '1', '0', '1', '1', '1', '0', '0', '500.00', '60.00', '1.00', '', '', '', '4', '0');
INSERT INTO `v9_member_group` VALUES ('5', '????????????', '1', '5', '300', '999', '1', '1', '0', '1', '1', '1', '0', '0', '360.00', '90.00', '5.00', '', '', '', '5', '0');
INSERT INTO `v9_member_group` VALUES ('1', '????????????', '1', '0', '0', '0', '1', '1', '0', '1', '0', '0', '0', '0', '0.00', '0.00', '0.00', '', '', '0', '0', '0');
INSERT INTO `v9_member_group` VALUES ('7', '????????????', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0.00', '0.00', '0.00', 'images/group/vip.jpg', '#000000', '', '7', '0');

-- ----------------------------
-- Table structure for v9_member_menu
-- ----------------------------
DROP TABLE IF EXISTS `v9_member_menu`;
CREATE TABLE `v9_member_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `isurl` enum('1','0') NOT NULL DEFAULT '0',
  `url` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_member_menu
-- ----------------------------
INSERT INTO `v9_member_menu` VALUES ('1', 'member_init', '0', 'member', 'index', 'init', 't=0', '0', '1', '', '');
INSERT INTO `v9_member_menu` VALUES ('2', 'account_manage', '0', 'member', 'index', 'account_manage', 't=1', '0', '1', '', '');
INSERT INTO `v9_member_menu` VALUES ('3', 'favorite', '0', 'member', 'index', 'favorite', 't=2', '0', '1', '', '');

-- ----------------------------
-- Table structure for v9_member_verify
-- ----------------------------
DROP TABLE IF EXISTS `v9_member_verify`;
CREATE TABLE `v9_member_verify` (
  `userid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) NOT NULL,
  `nickname` char(20) NOT NULL,
  `regdate` int(10) unsigned NOT NULL,
  `regip` char(15) NOT NULL,
  `email` char(32) NOT NULL,
  `modelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `point` smallint(5) unsigned NOT NULL DEFAULT '0',
  `amount` decimal(8,2) unsigned NOT NULL DEFAULT '0.00',
  `modelinfo` char(255) NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `siteid` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `message` char(100) DEFAULT NULL,
  `mobile` char(11) NOT NULL DEFAULT '',
  PRIMARY KEY (`userid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`(20))
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_member_verify
-- ----------------------------

-- ----------------------------
-- Table structure for v9_member_vip
-- ----------------------------
DROP TABLE IF EXISTS `v9_member_vip`;
CREATE TABLE `v9_member_vip` (
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_member_vip
-- ----------------------------

-- ----------------------------
-- Table structure for v9_menu
-- ----------------------------
DROP TABLE IF EXISTS `v9_menu`;
CREATE TABLE `v9_menu` (
  `id` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(40) NOT NULL DEFAULT '',
  `parentid` smallint(6) NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL DEFAULT '',
  `c` char(20) NOT NULL DEFAULT '',
  `a` char(20) NOT NULL DEFAULT '',
  `data` char(100) NOT NULL DEFAULT '',
  `listorder` smallint(6) unsigned NOT NULL DEFAULT '0',
  `display` enum('1','0') NOT NULL DEFAULT '1',
  `project1` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project2` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project3` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project4` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `project5` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `listorder` (`listorder`),
  KEY `parentid` (`parentid`),
  KEY `module` (`m`,`c`,`a`)
) ENGINE=MyISAM AUTO_INCREMENT=1669 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_menu
-- ----------------------------
INSERT INTO `v9_menu` VALUES ('1', 'sys_setting', '0', 'admin', 'setting', 'init', '', '1', '1', '0', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('2', 'module', '0', 'admin', 'module', 'init', '', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('872', 'sync_release_point', '873', 'release', 'index', 'init', '', '3', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('4', 'content', '0', 'content', 'content', 'init', '', '4', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('5', 'members', '0', 'member', 'member', 'init', '', '5', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('6', 'userinterface', '0', 'template', 'style', 'init', '', '6', '1', '0', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('30', 'correlative_setting', '1', 'admin', 'admin', 'admin', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('31', 'menu_manage', '977', 'admin', 'menu', 'init', '', '8', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('32', 'posid_manage', '975', 'admin', 'position', 'init', '', '7', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('29', 'module_list', '2', 'admin', 'module', '', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('82', 'module_manage', '2', 'admin', 'module', '', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('10', 'panel', '0', 'admin', 'index', 'public_main', '', '0', '1', '0', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('35', 'menu_add', '31', 'admin', 'menu', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('826', 'template_manager', '6', '', '', '', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('54', 'admin_manage', '49', 'admin', 'admin_manage', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('43', 'category_manage', '975', 'admin', 'category', 'init', 'module=admin', '4', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('42', 'add_category', '43', 'admin', 'category', 'add', 's=0', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('44', 'edit_category', '43', 'admin', 'category', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('45', 'badword_manage', '977', 'admin', 'badword', 'init', '', '10', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('46', 'posid_add', '32', 'admin', 'position', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('49', 'admin_setting', '1', 'admin', '', '', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('50', 'role_manage', '49', 'admin', 'role', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('51', 'role_add', '50', 'admin', 'role', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('52', 'category_cache', '43', 'admin', 'category', 'public_cache', 'module=admin', '4', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('55', 'manage_member', '5', 'member', 'member', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('58', 'admin_add', '54', 'admin', 'admin_manage', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('59', 'model_manage', '975', 'content', 'sitemodel', 'init', '', '5', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('64', 'site_management', '30', 'admin', 'site', 'init', '', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('81', 'member_add', '72', 'member', 'member', 'add', '', '2', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('62', 'add_model', '59', 'content', 'sitemodel', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('65', 'release_point_management', '30', 'admin', 'release_point', 'init', '', '3', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('66', 'badword_export', '45', 'admin', 'badword', 'export', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('67', 'add_site', '64', 'admin', 'site', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('68', 'badword_import', '45', 'admin', 'badword', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('812', 'member_group_manage', '76', 'member', 'member_group', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('74', 'member_verify', '55', 'member', 'member_verify', 'manage', 's=0', '3', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('76', 'manage_member_group', '5', 'member', 'member_group', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('77', 'manage_member_model', '5', 'member', 'member_model', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('78', 'member_group_add', '812', 'member', 'member_group', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('79', 'member_model_add', '813', 'member', 'member_model', 'add', '', '1', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('80', 'member_model_import', '77', 'member', 'member_model', 'import', '', '2', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('72', 'member_manage', '55', 'member', 'member', 'manage', '', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('813', 'member_model_manage', '77', 'member', 'member_model', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('814', 'site_edit', '64', 'admin', 'site', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('815', 'site_del', '64', 'admin', 'site', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('816', 'release_point_add', '65', 'admin', 'release_point', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('817', 'release_point_del', '65', 'admin', 'release_point', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('818', 'release_point_edit', '65', 'admin', 'release_point', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('821', 'content_publish', '4', 'content', 'content', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('822', 'content_manage', '821', 'content', 'content', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('867', 'linkage', '977', 'admin', 'linkage', 'init', '', '13', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('827', 'template_style', '826', 'template', 'style', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('828', 'import_style', '827', 'template', 'style', 'import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('831', 'template_export', '827', 'template', 'style', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('830', 'template_file', '827', 'template', 'file', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('832', 'template_onoff', '827', 'template', 'style', 'disable', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('833', 'template_updatename', '827', 'template', 'style', 'updatename', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('834', 'member_lock', '72', 'member', 'member', 'lock', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('835', 'member_unlock', '72', 'member', 'member', 'unlock', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('836', 'member_move', '72', 'member', 'member', 'move', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('837', 'member_delete', '72', 'member', 'member', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('842', 'verify_ignore', '74', 'member', 'member_verify', 'manage', 's=2', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('839', 'member_setting', '55', 'member', 'member_setting', 'manage', '', '4', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('841', 'verify_pass', '74', 'member', 'member_verify', 'manage', 's=1', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('843', 'verify_delete', '74', 'member', 'member_verify', 'manage', 's=3', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('844', 'verify_deny', '74', 'member', 'member_verify', 'manage', 's=4', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('845', 'never_pass', '74', 'member', 'member_verify', 'manage', 's=5', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('846', 'template_file_list', '827', 'template', 'file', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('847', 'template_file_edit', '827', 'template', 'file', 'edit_file', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('848', 'file_add_file', '827', 'template', 'file', 'add_file', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('850', 'listorder', '76', 'member', 'member_group', 'sort', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('852', 'priv_setting', '50', 'admin', 'role', 'priv_setting', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('853', 'role_priv', '50', 'admin', 'role', 'role_priv', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('857', 'attachment_manage', '821', 'attachment', 'manage', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('868', 'special', '821', 'special', 'special', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('869', 'template_editor', '827', 'template', 'file', 'edit_file', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('870', 'template_visualization', '827', 'template', 'file', 'visualization', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('871', 'pc_tag_edit', '827', 'template', 'file', 'edit_pc_tag', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('873', 'release_manage', '4', 'release', 'html', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('874', 'type_manage', '975', 'content', 'type_manage', 'init', '', '6', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('875', 'add_type', '874', 'content', 'type_manage', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('876', 'linkageadd', '867', 'admin', 'linkage', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('877', 'failure_list', '872', 'release', 'index', 'failed', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('879', 'member_search', '72', 'member', 'member', 'search', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('880', 'queue_del', '872', 'release', 'index', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('881', 'member_model_delete', '813', 'member', 'member_model', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('882', 'member_model_edit', '813', 'member', 'member_model', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('885', 'workflow', '977', 'content', 'workflow', 'init', '', '15', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('888', 'add_workflow', '885', 'content', 'workflow', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('889', 'member_modelfield_add', '813', 'member', 'member_modelfield', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('890', 'member_modelfield_edit', '813', 'member', 'member_modelfield', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('891', 'member_modelfield_delete', '813', 'member', 'member_modelfield', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('892', 'member_modelfield_manage', '813', 'member', 'member_modelfield', 'manage', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('895', 'sitemodel_import', '59', 'content', 'sitemodel', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('896', 'pay', '29', 'pay', 'payment', 'pay_list', 's=3', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('897', 'payments', '896', 'pay', 'payment', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('898', 'paylist', '896', 'pay', 'payment', 'pay_list', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('899', 'add_content', '822', 'content', 'content', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('900', 'modify_deposit', '896', 'pay', 'payment', 'modify_deposit', 's=1', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('901', 'check_content', '822', 'content', 'content', 'pass', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('902', 'dbsource', '29', 'dbsource', 'data', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('905', 'create_content_html', '873', 'content', 'create_html', 'show', '', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('904', 'external_data_sources', '902', 'dbsource', 'dbsource_admin', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('906', 'update_urls', '873', 'content', 'create_html', 'update_urls', '', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('960', 'node_add', '957', 'collection', 'node', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('909', 'fulltext_search', '29', 'search', 'search_type', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('910', 'manage_type', '909', 'search', 'search_type', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('911', 'search_setting', '909', 'search', 'search_admin', 'setting', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('912', 'createindex', '909', 'search', 'search_admin', 'createindex', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('913', 'add_search_type', '909', 'search', 'search_type', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('914', 'database_toos', '977', 'admin', 'database', 'export', '', '6', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('915', 'database_export', '914', 'admin', 'database', 'export', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('916', 'database_import', '914', 'admin', 'database', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('917', 'dbsource_add', '902', 'dbsource', 'dbsource_admin', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('918', 'dbsource_edit', '902', 'dbsource', 'dbsource_admin', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('919', 'dbsource_del', '902', 'dbsource', 'dbsource_admin', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('920', 'dbsource_data_add', '902', 'dbsource', 'data', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('921', 'dbsource_data_edit', '902', 'dbsource', 'data', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('922', 'dbsource_data_del', '902', 'dbsource', 'data', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('926', 'add_special', '868', 'special', 'special', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('927', 'edit_special', '868', 'special', 'special', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('928', 'special_list', '868', 'special', 'special', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('929', 'special_elite', '868', 'special', 'special', 'elite', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('930', 'delete_special', '868', 'special', 'special', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('931', 'badword_add', '45', 'admin', 'badword', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('932', 'badword_edit', '45', 'admin', 'badword', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('933', 'badword_delete', '45', 'admin', 'badword', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('934', 'special_listorder', '868', 'special', 'special', 'listorder', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('935', 'special_content_list', '868', 'special', 'content', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('936', 'special_content_add', '935', 'special', 'content', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('937', 'special_content_list', '935', 'special', 'content', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('938', 'special_content_edit', '935', 'special', 'content', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('939', 'special_content_delete', '935', 'special', 'content', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('940', 'special_content_listorder', '935', 'special', 'content', 'listorder', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('941', 'special_content_import', '935', 'special', 'special', 'import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('942', 'history_version', '827', 'template', 'template_bak', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('943', 'restore_version', '827', 'template', 'template_bak', 'restore', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('944', 'del_history_version', '827', 'template', 'template_bak', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('945', 'block', '821', 'block', 'block_admin', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('946', 'block_add', '945', 'block', 'block_admin', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('950', 'block_edit', '945', 'block', 'block_admin', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('951', 'block_del', '945', 'block', 'block_admin', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('952', 'block_update', '945', 'block', 'block_admin', 'block_update', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('953', 'block_restore', '945', 'block', 'block_admin', 'history_restore', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('954', 'history_del', '945', 'block', 'block_admin', 'history_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('978', 'urlrule_manage', '977', 'admin', 'urlrule', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('957', 'collection_node', '821', 'collection', 'node', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('979', 'safe_config', '30', 'admin', 'setting', 'init', '&tab=2', '11', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('959', 'basic_config', '30', 'admin', 'setting', 'init', '', '10', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('961', 'position_edit', '32', 'admin', 'position', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('962', 'collection_node_edit', '957', 'collection', 'node', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('963', 'collection_node_delete', '957', 'collection', 'node', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('990', 'col_url_list', '957', 'collection', 'node', 'col_url_list', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('965', 'collection_node_publish', '957', 'collection', 'node', 'publist', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('966', 'collection_node_import', '957', 'collection', 'node', 'node_import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('967', 'collection_node_export', '957', 'collection', 'node', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('968', 'collection_node_collection_content', '957', 'collection', 'node', 'col_content', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('969', 'googlesitemap', '977', 'admin', 'googlesitemap', 'set', '', '11', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('970', 'admininfo', '10', 'admin', 'admin_manage', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('971', 'editpwd', '970', 'admin', 'admin_manage', 'public_edit_pwd', '', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('972', 'editinfo', '970', 'admin', 'admin_manage', 'public_edit_info', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('973', 'keylink', '977', 'admin', 'keylink', 'init', '', '12', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('974', 'add_keylink', '973', 'admin', 'keylink', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('975', 'content_settings', '4', 'content', 'content_settings', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('7', 'extend', '0', 'admin', 'extend', 'init_extend', '', '7', '1', '0', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('977', 'extend_all', '7', 'admin', 'extend_all', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('980', 'sso_config', '30', 'admin', 'setting', 'init', '&tab=3', '12', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('981', 'email_config', '30', 'admin', 'setting', 'init', '&tab=4', '13', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('982', 'module_manage', '82', 'admin', 'module', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('983', 'ipbanned', '977', 'admin', 'ipbanned', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('984', 'add_ipbanned', '983', 'admin', 'ipbanned', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('993', 'collection_content_import', '957', 'collection', 'node', 'import', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('991', 'copy_node', '957', 'collection', 'node', 'copy', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('992', 'content_del', '957', 'collection', 'node', 'content_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('989', 'downsites', '977', 'admin', 'downservers', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('994', 'import_program_add', '957', 'collection', 'node', 'import_program_add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('995', 'import_program_del', '957', 'collection', 'node', 'import_program_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('996', 'import_content', '957', 'collection', 'node', 'import_content', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('997', 'log', '977', 'admin', 'log', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('998', 'add_page', '43', 'admin', 'category', 'add', 's=1', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('999', 'add_cat_link', '43', 'admin', 'category', 'add', 's=2', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1000', 'count_items', '43', 'admin', 'category', 'count_items', '', '5', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1001', 'cache_all', '977', 'admin', 'cache_all', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1002', 'create_list_html', '873', 'content', 'create_html', 'category', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1003', 'create_html_quick', '10', 'content', 'create_html_opt', 'index', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1004', 'create_index', '1003', 'content', 'create_html', 'public_index', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1005', 'scan', '977', 'scan', 'index', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1006', 'scan_report', '1005', 'scan', 'index', 'scan_report', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1007', 'md5_creat', '1005', 'scan', 'index', 'md5_creat', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1008', 'album_import', '868', 'special', 'album', 'import', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('8', 'phpsso', '0', 'admin', 'phpsso', 'menu', '', '7', '1', '0', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1011', 'edit_content', '822', 'content', 'content', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1012', 'push_to_special', '822', 'content', 'push', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1023', 'delete_log', '997', 'admin', 'log', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1024', 'delete_ip', '983', 'admin', 'ipbanned', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1026', 'delete_keylink', '973', 'admin', 'keylink', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1027', 'edit_keylink', '973', 'admin', 'keylink', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1034', 'operation_pass', '74', 'member', 'member_verify', 'pass', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1035', 'operation_delete', '74', 'member', 'member_verify', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1039', 'operation_ignore', '74', 'member', 'member_verify', 'ignore', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1038', 'settingsave', '30', 'admin', 'setting', 'save', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1040', 'admin_edit', '54', 'admin', 'admin_manage', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1041', 'operation_reject', '74', 'member', 'member_verify', 'reject', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1042', 'admin_delete', '54', 'admin', 'admin_manage', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1043', 'card', '54', 'admin', 'admin_manage', 'card', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1044', 'creat_card', '54', 'admin', 'admin_manage', 'creat_card', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1045', 'remove_card', '54', 'admin', 'admin_manage', 'remove_card', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1049', 'member_group_edit', '812', 'member', 'member_group', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1048', 'member_edit', '72', 'member', 'member', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1050', 'role_edit', '50', 'admin', 'role', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1051', 'member_group_delete', '812', 'member', 'member_group', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1052', 'member_manage', '50', 'admin', 'role', 'member_manage', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1053', 'role_delete', '50', 'admin', 'role', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1054', 'member_model_export', '77', 'member', 'member_model', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1055', 'member_model_sort', '77', 'member', 'member_model', 'sort', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1056', 'member_model_move', '77', 'member', 'member_model', 'move', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1057', 'payment_add', '897', 'pay', 'payment', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1058', 'payment_delete', '897', 'pay', 'payment', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1059', 'payment_edit', '897', 'pay', 'payment', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1060', 'spend_record', '896', 'pay', 'spend', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1061', 'pay_stat', '896', 'pay', 'payment', 'pay_stat', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1062', 'fields_manage', '59', 'content', 'sitemodel_field', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1063', 'edit_model_content', '59', 'content', 'sitemodel', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1064', 'disabled_model', '59', 'content', 'sitemodel', 'disabled', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1065', 'delete_model', '59', 'content', 'sitemodel', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1066', 'export_model', '59', 'content', 'sitemodel', 'export', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1067', 'delete', '874', 'content', 'type_manage', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1068', 'edit', '874', 'content', 'type_manage', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1069', 'add_urlrule', '978', 'admin', 'urlrule', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1070', 'edit_urlrule', '978', 'admin', 'urlrule', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1071', 'delete_urlrule', '978', 'admin', 'urlrule', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1072', 'edit_menu', '31', 'admin', 'menu', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1073', 'delete_menu', '31', 'admin', 'menu', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1074', 'edit_workflow', '885', 'content', 'workflow', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1075', 'delete_workflow', '885', 'content', 'workflow', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1076', 'creat_html', '868', 'special', 'special', 'html', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1093', 'connect_config', '30', 'admin', 'setting', 'init', '&tab=5', '14', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1102', 'view_modelinfo', '74', 'member', 'member_verify', 'modelinfo', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1202', 'create_special_list', '868', 'special', 'special', 'create_special_list', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1240', 'view_memberlinfo', '72', 'member', 'member', 'memberinfo', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1239', 'copyfrom_manage', '977', 'admin', 'copyfrom', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1241', 'move_content', '822', 'content', 'content', 'remove', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1242', 'poster_template', '56', 'poster', 'space', 'poster_template', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1243', 'create_index', '873', 'content', 'create_html', 'public_index', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1244', 'add_othors', '822', 'content', 'content', 'add_othors', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1295', 'attachment_manager_dir', '857', 'attachment', 'manage', 'dir', '', '2', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1296', 'attachment_manager_db', '857', 'attachment', 'manage', 'init', '', '1', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1346', 'attachment_address_replace', '857', 'attachment', 'address', 'init', '', '3', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1347', 'attachment_address_update', '857', 'attachment', 'address', 'update', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1348', 'delete_content', '822', 'content', 'content', 'delete', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1349', 'member_menu_manage', '977', 'member', 'member_menu', 'manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1350', 'member_menu_add', '1349', 'member', 'member_menu', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1351', 'member_menu_edit', '1349', 'member', 'member_menu', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1352', 'member_menu_delete', '1349', 'member', 'member_menu', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1353', 'batch_show', '822', 'content', 'create_html', 'batch_show', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1354', 'pay_delete', '898', 'pay', 'payment', 'pay_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1355', 'pay_cancel', '898', 'pay', 'payment', 'pay_cancel', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1356', 'discount', '898', 'pay', 'payment', 'discount', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1360', 'category_batch_edit', '43', 'admin', 'category', 'batch_edit', '', '6', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1500', 'listorder', '822', 'content', 'content', 'listorder', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1501', 'a_clean_data', '873', 'content', 'content', 'clear_data', '', '0', '1', '0', '0', '0', '0', '0');
INSERT INTO `v9_menu` VALUES ('9', 'video', '0', 'video', 'video', 'init', '', '11', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1589', 'video', '9', 'video', 'video', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1583', 'sub_delete', '1589', 'video', 'video', 'sub_del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1582', 'subscribe_manage', '1589', 'video', 'video', 'subscribe_list', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1581', 'video_open', '1589', 'video', 'video', 'open', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1592', 'complete_info', '1581', 'video', 'video', 'complete_info', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1591', 'video_inputinfo', '1581', 'video', 'video', 'open', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1577', 'video_manage', '1589', 'video', 'video', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1590', 'player_manage', '1589', 'video', 'player', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1585', 'import_ku6_video', '1589', 'video', 'video', 'import_ku6video', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1579', 'video_edit', '1589', 'video', 'video', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1580', 'video_delete', '1589', 'video', 'video', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1578', 'video_upload', '1589', 'video', 'video', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1593', 'video_stat', '1589', 'video', 'stat', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1586', 'video_store', '1589', 'video', 'video', 'video2content', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1594', 'announce', '29', 'announce', 'admin_announce', 'init', 's=1', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1595', 'announce_add', '1594', 'announce', 'admin_announce', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1596', 'edit_announce', '1594', 'announce', 'admin_announce', 'edit', 's=1', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1597', 'check_announce', '1594', 'announce', 'admin_announce', 'init', 's=2', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1598', 'overdue', '1594', 'announce', 'admin_announce', 'init', 's=3', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1599', 'del_announce', '1594', 'announce', 'admin_announce', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1600', 'comment', '29', 'comment', 'comment_admin', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1601', 'comment_manage', '821', 'comment', 'comment_admin', 'listinfo', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1602', 'comment_check', '1601', 'comment', 'check', 'checks', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1603', 'comment_list', '1600', 'comment', 'comment_admin', 'lists', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1604', 'link', '29', 'link', 'link', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1605', 'add_link', '1604', 'link', 'link', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1606', 'edit_link', '1604', 'link', 'link', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1607', 'delete_link', '1604', 'link', 'link', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1608', 'link_setting', '1604', 'link', 'link', 'setting', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1609', 'add_type', '1604', 'link', 'link', 'add_type', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1610', 'list_type', '1604', 'link', 'link', 'list_type', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1611', 'check_register', '1604', 'link', 'link', 'check_register', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1612', 'vote', '29', 'vote', 'vote', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1613', 'add_vote', '1612', 'vote', 'vote', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1614', 'edit_vote', '1612', 'vote', 'vote', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1615', 'delete_vote', '1612', 'vote', 'vote', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1616', 'vote_setting', '1612', 'vote', 'vote', 'setting', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1617', 'statistics_vote', '1612', 'vote', 'vote', 'statistics', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1618', 'statistics_userlist', '1612', 'vote', 'vote', 'statistics_userlist', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1619', 'create_js', '1612', 'vote', 'vote', 'create_js', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1620', 'message', '29', 'message', 'message', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1621', 'send_one', '1620', 'message', 'message', 'send_one', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1622', 'delete_message', '1620', 'message', 'message', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1623', 'message_send', '1620', 'message', 'message', 'message_send', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1624', 'message_group_manage', '1620', 'message', 'message', 'message_group_manage', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1625', 'mood', '29', 'mood', 'mood_admin', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1626', 'mood_setting', '1625', 'mood', 'mood_admin', 'setting', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1627', 'poster', '29', 'poster', 'space', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1628', 'add_space', '1627', 'poster', 'space', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1629', 'edit_space', '1627', 'poster', 'space', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1630', 'del_space', '1627', 'poster', 'space', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1631', 'poster_list', '1627', 'poster', 'poster', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1632', 'add_poster', '1627', 'poster', 'poster', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1633', 'edit_poster', '1627', 'poster', 'poster', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1634', 'del_poster', '1627', 'poster', 'poster', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1635', 'poster_stat', '1627', 'poster', 'poster', 'stat', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1636', 'poster_setting', '1627', 'poster', 'space', 'setting', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1637', 'create_poster_js', '1627', 'poster', 'space', 'create_js', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1638', 'poster_template', '1627', 'poster', 'space', 'poster_template', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1639', 'formguide', '29', 'formguide', 'formguide', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1640', 'formguide_add', '1639', 'formguide', 'formguide', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1641', 'formguide_edit', '1639', 'formguide', 'formguide', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1642', 'form_info_list', '1639', 'formguide', 'formguide_info', 'init', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1643', 'formguide_disabled', '1639', 'formguide', 'formguide', 'disabled', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1644', 'formguide_delete', '1639', 'formguide', 'formguide', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1645', 'formguide_stat', '1639', 'formguide', 'formguide', 'stat', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1646', 'add_public_field', '1639', 'formguide', 'formguide_field', 'add', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1647', 'list_public_field', '1639', 'formguide', 'formguide_field', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1648', 'module_setting', '1639', 'formguide', 'formguide', 'setting', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1649', 'wap', '29', 'wap', 'wap_admin', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1650', 'wap_add', '1649', 'wap', 'wap_admin', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1651', 'wap_edit', '1649', 'wap', 'wap_admin', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1652', 'wap_delete', '1649', 'wap', 'wap_admin', 'delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1653', 'wap_type_manage', '1649', 'wap', 'wap_admin', 'type_manage', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1654', 'wap_type_edit', '1649', 'wap', 'wap_admin', 'type_edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1655', 'wap_type_delete', '1649', 'wap', 'wap_admin', 'type_delete', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1656', 'upgrade', '977', 'upgrade', 'index', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1657', 'checkfile', '1656', 'upgrade', 'index', 'checkfile', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1658', 'tag', '826', 'tag', 'tag', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1659', 'add_tag', '1658', 'tag', 'tag', 'add', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1660', 'edit_tag', '1658', 'tag', 'tag', 'edit', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1661', 'delete_tag', '1658', 'tag', 'tag', 'del', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1662', 'tag_lists', '1658', 'tag', 'tag', 'lists', '', '0', '0', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1663', 'sms', '29', 'sms', 'sms', 'init', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1664', 'sms_setting', '1663', 'sms', 'sms', 'sms_setting', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1665', 'sms_pay_history', '1663', 'sms', 'sms', 'sms_pay_history', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1666', 'sms_buy_history', '1663', 'sms', 'sms', 'sms_buy_history', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1667', 'sms_api', '1663', 'sms', 'sms', 'sms_api', '', '0', '1', '1', '1', '1', '1', '1');
INSERT INTO `v9_menu` VALUES ('1668', 'sms_sent', '1663', 'sms', 'sms', 'sms_sent', '', '0', '1', '1', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for v9_message
-- ----------------------------
DROP TABLE IF EXISTS `v9_message`;
CREATE TABLE `v9_message` (
  `messageid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `send_from_id` char(30) NOT NULL DEFAULT '0',
  `send_to_id` char(30) NOT NULL DEFAULT '0',
  `folder` enum('all','inbox','outbox') NOT NULL,
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `message_time` int(10) unsigned NOT NULL DEFAULT '0',
  `subject` char(80) DEFAULT NULL,
  `content` text NOT NULL,
  `replyid` int(10) unsigned NOT NULL DEFAULT '0',
  `del_type` tinyint(1) unsigned DEFAULT '0',
  PRIMARY KEY (`messageid`),
  KEY `msgtoid` (`send_to_id`,`folder`),
  KEY `replyid` (`replyid`),
  KEY `folder` (`send_from_id`,`folder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_message
-- ----------------------------

-- ----------------------------
-- Table structure for v9_message_data
-- ----------------------------
DROP TABLE IF EXISTS `v9_message_data`;
CREATE TABLE `v9_message_data` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) NOT NULL,
  `group_message_id` int(5) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `message` (`userid`,`group_message_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_message_data
-- ----------------------------

-- ----------------------------
-- Table structure for v9_message_group
-- ----------------------------
DROP TABLE IF EXISTS `v9_message_group`;
CREATE TABLE `v9_message_group` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupid` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '?????????id',
  `subject` char(80) DEFAULT NULL,
  `content` text NOT NULL COMMENT '??????',
  `inputtime` int(10) unsigned DEFAULT '0',
  `status` tinyint(2) unsigned DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_message_group
-- ----------------------------

-- ----------------------------
-- Table structure for v9_model
-- ----------------------------
DROP TABLE IF EXISTS `v9_model`;
CREATE TABLE `v9_model` (
  `modelid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `description` char(100) NOT NULL,
  `tablename` char(20) NOT NULL,
  `setting` text NOT NULL,
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `items` smallint(5) unsigned NOT NULL DEFAULT '0',
  `enablesearch` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `default_style` char(30) NOT NULL,
  `category_template` char(30) NOT NULL,
  `list_template` char(30) NOT NULL,
  `show_template` char(30) NOT NULL,
  `js_template` varchar(30) NOT NULL,
  `admin_list_template` char(30) NOT NULL,
  `member_add_template` varchar(30) NOT NULL,
  `member_list_template` varchar(30) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `type` tinyint(1) NOT NULL,
  PRIMARY KEY (`modelid`),
  KEY `type` (`type`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_model
-- ----------------------------
INSERT INTO `v9_model` VALUES ('1', '1', '????????????', '', 'news', '', '0', '0', '1', '0', 'default', 'category', 'list', 'show', '', '', '', '', '0', '0');
INSERT INTO `v9_model` VALUES ('2', '1', '????????????', '', 'download', '', '0', '0', '1', '0', 'default', 'category_download', 'list_download', 'show_download', '', '', '', '', '0', '0');
INSERT INTO `v9_model` VALUES ('3', '1', '????????????', '', 'picture', '', '0', '0', '1', '0', 'default', 'category_picture', 'list_picture', 'show_picture', '', '', '', '', '0', '0');
INSERT INTO `v9_model` VALUES ('10', '1', '????????????', '????????????', 'member_detail', '', '0', '0', '1', '0', '', '', '', '', '', '', '', '', '0', '2');
INSERT INTO `v9_model` VALUES ('11', '1', '????????????', '', 'video', '', '0', '0', '1', '0', 'default', 'category_video', 'list_video', 'show_video', '', '', '', '', '0', '0');
INSERT INTO `v9_model` VALUES ('12', '1', '?????????', '', 'photos', '{\"enabletime\":\"0\",\"starttime\":\"1504108800\",\"endtime\":\"\",\"sendmail\":\"0\",\"mails\":\"\",\"allowmultisubmit\":\"1\",\"allowunreg\":\"1\"}', '1504108800', '0', '1', '0', 'default', '', '', 'show_upload_case', 'show_js', '', '', '', '0', '3');

-- ----------------------------
-- Table structure for v9_model_field
-- ----------------------------
DROP TABLE IF EXISTS `v9_model_field`;
CREATE TABLE `v9_model_field` (
  `fieldid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field` varchar(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `tips` text NOT NULL,
  `css` varchar(30) NOT NULL,
  `minlength` int(10) unsigned NOT NULL DEFAULT '0',
  `maxlength` int(10) unsigned NOT NULL DEFAULT '0',
  `pattern` varchar(255) NOT NULL,
  `errortips` varchar(255) NOT NULL,
  `formtype` varchar(20) NOT NULL,
  `setting` mediumtext NOT NULL,
  `formattribute` varchar(255) NOT NULL,
  `unsetgroupids` varchar(255) NOT NULL,
  `unsetroleids` varchar(255) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issystem` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isunique` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isbase` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `issearch` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isfulltext` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isposition` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isomnipotent` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`fieldid`),
  KEY `modelid` (`modelid`,`disabled`),
  KEY `field` (`field`,`modelid`)
) ENGINE=MyISAM AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_model_field
-- ----------------------------
INSERT INTO `v9_model_field` VALUES ('1', '1', '1', 'catid', '??????', '', '', '1', '6', '/^[0-9]{1,6}$/', '???????????????', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `v9_model_field` VALUES ('2', '1', '1', 'typeid', '??????', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `v9_model_field` VALUES ('3', '1', '1', 'title', '??????', '', 'inputtitle', '1', '80', '', '???????????????', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `v9_model_field` VALUES ('4', '1', '1', 'thumb', '?????????', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `v9_model_field` VALUES ('5', '1', '1', 'keywords', '?????????', '????????????????????????????????????,?????????', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `v9_model_field` VALUES ('6', '1', '1', 'description', '??????', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `v9_model_field` VALUES ('7', '1', '1', 'updatetime', '????????????', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `v9_model_field` VALUES ('8', '1', '1', 'content', '??????', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>??????????????????</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">?????????????????????\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>?????????????????????</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">???????????????????????????\r\n</div>', '', '1', '999999', '', '??????????????????', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `v9_model_field` VALUES ('9', '1', '1', 'voteid', '????????????', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'text\\\' name=\\\'info[voteid]\\\' id=\\\'voteid\\\' value=\\\'{FIELD_VALUE}\\\' size=\\\'3\\\'> \r\n<input type=\\\'button\\\' value=\"??????????????????\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=vote&c=vote&a=public_get_votelist&from_api=1\\\',\\\'??????????????????\\\')\" class=\"button\">\r\n<input type=\\\'button\\\' value=\"????????????\" onclick=\"omnipotent(\\\'addvote\\\',\\\'?m=vote&c=vote&a=add&from_api=1\\\',\\\'????????????\\\',0)\" class=\"button\">\',\n  \'fieldtype\' => \'mediumint\',\n  \'minnumber\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '1', '0', '21', '0', '0');
INSERT INTO `v9_model_field` VALUES ('10', '1', '1', 'pages', '????????????', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '0', '0');
INSERT INTO `v9_model_field` VALUES ('11', '1', '1', 'inputtime', '????????????', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `v9_model_field` VALUES ('12', '1', '1', 'posids', '?????????', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `v9_model_field` VALUES ('13', '1', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `v9_model_field` VALUES ('14', '1', '1', 'listorder', '??????', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `v9_model_field` VALUES ('15', '1', '1', 'status', '??????', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `v9_model_field` VALUES ('16', '1', '1', 'template', '???????????????', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `v9_model_field` VALUES ('17', '1', '1', 'groupids_view', '????????????', '', '', '0', '0', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `v9_model_field` VALUES ('18', '1', '1', 'readpoint', '????????????', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `v9_model_field` VALUES ('19', '1', '1', 'relation', '????????????', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"????????????\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'??????????????????\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"????????????\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `v9_model_field` VALUES ('20', '1', '1', 'allow_comment', '????????????', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'????????????|1\r\n???????????????|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `v9_model_field` VALUES ('21', '1', '1', 'copyfrom', '??????', '', '', '0', '100', '', '', 'copyfrom', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '0', '0');
INSERT INTO `v9_model_field` VALUES ('80', '1', '1', 'username', '?????????', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `v9_model_field` VALUES ('22', '2', '1', 'catid', '??????', '', '', '1', '6', '/^[0-9]{1,6}$/', '???????????????', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `v9_model_field` VALUES ('23', '2', '1', 'typeid', '??????', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '1', '0');
INSERT INTO `v9_model_field` VALUES ('24', '2', '1', 'title', '??????', '', 'inputtitle', '1', '80', '', '???????????????', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `v9_model_field` VALUES ('25', '2', '1', 'keywords', '?????????', '????????????????????????????????????,?????????', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `v9_model_field` VALUES ('26', '2', '1', 'description', '??????', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `v9_model_field` VALUES ('27', '2', '1', 'updatetime', '????????????', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `v9_model_field` VALUES ('28', '2', '1', 'content', '??????', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>??????????????????</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">?????????????????????\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>?????????????????????</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">???????????????????????????\r\n</div>', '', '1', '999999', '', '??????????????????', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `v9_model_field` VALUES ('29', '2', '1', 'thumb', '?????????', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `v9_model_field` VALUES ('30', '2', '1', 'relation', '????????????', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"????????????\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'??????????????????\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"????????????\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `v9_model_field` VALUES ('31', '2', '1', 'pages', '????????????', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '1', '0');
INSERT INTO `v9_model_field` VALUES ('32', '2', '1', 'inputtime', '????????????', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `v9_model_field` VALUES ('33', '2', '1', 'posids', '?????????', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `v9_model_field` VALUES ('34', '2', '1', 'groupids_view', '????????????', '', '', '0', '0', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `v9_model_field` VALUES ('35', '2', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `v9_model_field` VALUES ('36', '2', '1', 'listorder', '??????', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `v9_model_field` VALUES ('37', '2', '1', 'template', '???????????????', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `v9_model_field` VALUES ('38', '2', '1', 'allow_comment', '????????????', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'????????????|1\r\n???????????????|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `v9_model_field` VALUES ('39', '2', '1', 'status', '??????', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `v9_model_field` VALUES ('40', '2', '1', 'readpoint', '????????????', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `v9_model_field` VALUES ('41', '2', '1', 'username', '?????????', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `v9_model_field` VALUES ('42', '2', '1', 'downfiles', '????????????', '', '', '0', '0', '', '', 'downfiles', 'array (\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'10\',\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '0', '0');
INSERT INTO `v9_model_field` VALUES ('43', '2', '1', 'downfile', '????????????', '', '', '0', '0', '', '', 'downfile', 'array (\n  \'downloadlink\' => \'1\',\n  \'downloadtype\' => \'1\',\n  \'upload_allowext\' => \'rar|zip\',\n  \'isselectimage\' => \'0\',\n  \'upload_number\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '9', '0', '0');
INSERT INTO `v9_model_field` VALUES ('44', '2', '1', 'systems', '????????????', '<select name=\'selectSystem\' onchange=\"ChangeInput(this,document.myform.systems,\'/\')\">\r\n	<option value=\'WinXP\'>WinXP</option>\r\n	<option value=\'Vista\'>Windows 7</option>\r\n	<option value=\'Win2000\'>Win2000</option>\r\n	<option value=\'Win2003\'>Win2003</option>\r\n	<option value=\'Unix\'>Unix</option>\r\n	<option value=\'Linux\'>Linux</option>\r\n	<option value=\'MacOS\'>MacOS</option>\r\n</select>', '', '0', '100', '', '', 'text', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'Win2000/WinXP/Win2003\',\n  \'ispassword\' => \'0\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '0', '14', '0', '0');
INSERT INTO `v9_model_field` VALUES ('45', '2', '1', 'copytype', '??????????????????', '', '', '0', '15', '', '', 'box', 'array (\n  \'options\' => \'?????????|?????????\r\n?????????|?????????\r\n?????????|?????????\r\n?????????|?????????\r\n?????????|?????????\r\n?????????|?????????\r\n?????????|?????????\r\nOEM???|OEM???\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'?????????\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '12', '0', '0');
INSERT INTO `v9_model_field` VALUES ('46', '2', '1', 'language', '????????????', '', '', '0', '16', '', '', 'box', 'array (\n  \'options\' => \'??????|??????\r\n????????????|????????????\r\n????????????|????????????\r\n????????????|????????????\r\n????????????|????????????\r\n????????????|????????????\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'????????????\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '13', '0', '0');
INSERT INTO `v9_model_field` VALUES ('47', '2', '1', 'classtype', '????????????', '', '', '0', '20', '', '', 'box', 'array (\n  \'options\' => \'????????????|????????????\r\n????????????|????????????\r\n????????????|????????????\r\n????????????|????????????\r\n??????|??????\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'????????????\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '17', '0', '0');
INSERT INTO `v9_model_field` VALUES ('48', '2', '1', 'version', '?????????', '', '', '0', '20', '', '', 'text', 'array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'\',\n  \'ispassword\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `v9_model_field` VALUES ('49', '2', '1', 'filesize', '????????????', '', '', '0', '10', '', '', 'text', 'array (\n  \'size\' => \'10\',\n  \'defaultvalue\' => \'??????\',\n  \'ispassword\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '1', '0', '14', '0', '0');
INSERT INTO `v9_model_field` VALUES ('50', '2', '1', 'stars', '????????????', '', '', '0', '20', '', '', 'box', 'array (\n  \'options\' => \'???????????????|???????????????\r\n???????????????|???????????????\r\n???????????????|???????????????\r\n???????????????|???????????????\r\n???????????????|???????????????\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'cols\' => \'5\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'default_select_value\' => \'???????????????\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '17', '0', '0');
INSERT INTO `v9_model_field` VALUES ('51', '3', '1', 'allow_comment', '????????????', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'????????????|1\r\n???????????????|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `v9_model_field` VALUES ('52', '3', '1', 'template', '???????????????', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `v9_model_field` VALUES ('53', '3', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `v9_model_field` VALUES ('54', '3', '1', 'listorder', '??????', '', '', '0', '6', '', '', 'number', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `v9_model_field` VALUES ('55', '3', '1', 'posids', '?????????', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `v9_model_field` VALUES ('56', '3', '1', 'groupids_view', '????????????', '', '', '0', '0', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `v9_model_field` VALUES ('57', '3', '1', 'inputtime', '????????????', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `v9_model_field` VALUES ('58', '3', '1', 'pages', '????????????', '', '', '0', '0', '', '', 'pages', '', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '0', '0');
INSERT INTO `v9_model_field` VALUES ('59', '3', '1', 'relation', '????????????', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"????????????\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'??????????????????\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"????????????\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `v9_model_field` VALUES ('60', '3', '1', 'thumb', '?????????', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `v9_model_field` VALUES ('61', '3', '1', 'content', '??????', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>??????????????????</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">?????????????????????\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>?????????????????????</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">???????????????????????????\r\n</div>', '', '0', '999999', '', '', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'1\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `v9_model_field` VALUES ('62', '3', '1', 'updatetime', '????????????', '', '', '0', '0', '', '', 'datetime', 'array (\r\n  \'dateformat\' => \'int\',\r\n  \'format\' => \'Y-m-d H:i:s\',\r\n  \'defaulttype\' => \'1\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `v9_model_field` VALUES ('63', '3', '1', 'description', '??????', '', '', '0', '255', '', '', 'textarea', 'array (\r\n  \'width\' => \'98\',\r\n  \'height\' => \'46\',\r\n  \'defaultvalue\' => \'\',\r\n  \'enablehtml\' => \'0\',\r\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `v9_model_field` VALUES ('64', '3', '1', 'title', '??????', '', 'inputtitle', '1', '80', '', '???????????????', 'title', '', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `v9_model_field` VALUES ('65', '3', '1', 'keywords', '?????????', '????????????????????????????????????,?????????', '', '0', '40', '', '', 'keyword', 'array (\r\n  \'size\' => \'100\',\r\n  \'defaultvalue\' => \'\',\r\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `v9_model_field` VALUES ('66', '3', '1', 'typeid', '??????', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `v9_model_field` VALUES ('67', '3', '1', 'catid', '??????', '', '', '1', '6', '/^[0-9]{1,6}$/', '???????????????', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `v9_model_field` VALUES ('68', '3', '1', 'status', '??????', '', '', '0', '2', '', '', 'box', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `v9_model_field` VALUES ('69', '3', '1', 'readpoint', '????????????', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `v9_model_field` VALUES ('70', '3', '1', 'username', '?????????', '', '', '0', '20', '', '', 'text', '', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `v9_model_field` VALUES ('71', '3', '1', 'pictureurls', '??????', '', '', '0', '0', '', '', 'images', 'array (\n  \'upload_allowext\' => \'gif|jpg|jpeg|png|bmp\',\n  \'isselectimage\' => \'1\',\n  \'upload_number\' => \'50\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '15', '0', '0');
INSERT INTO `v9_model_field` VALUES ('72', '3', '1', 'copyfrom', '??????', '', '', '0', '0', '', '', 'copyfrom', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '0', '0');
INSERT INTO `v9_model_field` VALUES ('73', '1', '1', 'islink', '????????????', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '0', '0', '1', '0', '0', '30', '0', '0');
INSERT INTO `v9_model_field` VALUES ('74', '2', '1', 'islink', '????????????', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '0', '0', '1', '0', '0', '30', '0', '0');
INSERT INTO `v9_model_field` VALUES ('75', '3', '1', 'islink', '????????????', '', '', '0', '0', '', '', 'islink', '', '', '', '', '0', '1', '0', '0', '0', '1', '0', '0', '30', '0', '0');
INSERT INTO `v9_model_field` VALUES ('83', '10', '1', 'birthday', '??????', '', '', '0', '0', '', '??????????????????', 'datetime', 'array (\n  \'fieldtype\' => \'date\',\n  \'format\' => \'Y-m-d\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '1', '1', '0', '0', '0', '0');
INSERT INTO `v9_model_field` VALUES ('84', '11', '1', 'catid', '??????', '', '', '1', '6', '/^[0-9]{1,6}$/', '???????????????', 'catid', 'array (\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '0', '0', '1', '0', '0');
INSERT INTO `v9_model_field` VALUES ('85', '11', '1', 'typeid', '??????', '', '', '0', '0', '', '', 'typeid', 'array (\n  \'minnumber\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '0', '1', '0', '1', '1', '1', '0', '0', '2', '0', '0');
INSERT INTO `v9_model_field` VALUES ('86', '11', '1', 'title', '??????', '', 'inputtitle', '1', '80', '', '???????????????', 'title', 'array (\n)', '', '', '', '0', '1', '0', '1', '1', '1', '1', '1', '4', '0', '0');
INSERT INTO `v9_model_field` VALUES ('87', '11', '1', 'keywords', '?????????', '????????????????????????????????????,?????????', '', '0', '40', '', '', 'keyword', 'array (\n  \'size\' => \'100\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '1', '0', '1', '1', '1', '1', '0', '7', '0', '0');
INSERT INTO `v9_model_field` VALUES ('88', '11', '1', 'description', '??????', '', '', '0', '255', '', '', 'textarea', 'array (\n  \'width\' => \'98\',\n  \'height\' => \'46\',\n  \'defaultvalue\' => \'\',\n  \'enablehtml\' => \'0\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '1', '1', '10', '0', '0');
INSERT INTO `v9_model_field` VALUES ('89', '11', '1', 'updatetime', '????????????', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'dateformat\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'1\',\n  \'defaultvalue\' => \'\',\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '12', '0', '0');
INSERT INTO `v9_model_field` VALUES ('90', '11', '1', 'content', '??????', '<div class=\"content_attr\"><label><input name=\"add_introduce\" type=\"checkbox\"  value=\"1\" checked>??????????????????</label><input type=\"text\" name=\"introcude_length\" value=\"200\" size=\"3\">?????????????????????\r\n<label><input type=\'checkbox\' name=\'auto_thumb\' value=\"1\" checked>?????????????????????</label><input type=\"text\" name=\"auto_thumb_no\" value=\"1\" size=\"2\" class=\"\">???????????????????????????\r\n</div>', '', '0', '999999', '', '??????????????????', 'editor', 'array (\n  \'toolbar\' => \'full\',\n  \'defaultvalue\' => \'\',\n  \'enablekeylink\' => \'1\',\n  \'replacenum\' => \'2\',\n  \'link_mode\' => \'0\',\n  \'enablesaveimage\' => \'1\',\n  \'height\' => \'\',\n  \'disabled_page\' => \'0\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '1', '0', '13', '0', '0');
INSERT INTO `v9_model_field` VALUES ('91', '11', '1', 'thumb', '?????????', '', '', '0', '100', '', '', 'image', 'array (\n  \'size\' => \'50\',\n  \'defaultvalue\' => \'\',\n  \'show_type\' => \'1\',\n  \'upload_maxsize\' => \'1024\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|png|bmp\',\n  \'watermark\' => \'0\',\n  \'isselectimage\' => \'1\',\n  \'images_width\' => \'\',\n  \'images_height\' => \'\',\n)', '', '', '', '0', '1', '0', '0', '0', '1', '0', '1', '14', '0', '0');
INSERT INTO `v9_model_field` VALUES ('92', '11', '1', 'relation', '????????????', '', '', '0', '0', '', '', 'omnipotent', 'array (\n  \'formtext\' => \'<input type=\\\'hidden\\\' name=\\\'info[relation]\\\' id=\\\'relation\\\' value=\\\'{FIELD_VALUE}\\\' style=\\\'50\\\' >\r\n<ul class=\"list-dot\" id=\"relation_text\"></ul>\r\n<div>\r\n<input type=\\\'button\\\' value=\"????????????\" onclick=\"omnipotent(\\\'selectid\\\',\\\'?m=content&c=content&a=public_relationlist&modelid={MODELID}\\\',\\\'??????????????????\\\',1)\" class=\"button\" style=\"width:66px;\">\r\n<span class=\"edit_content\">\r\n<input type=\\\'button\\\' value=\"????????????\" onclick=\"show_relation({MODELID},{ID})\" class=\"button\" style=\"width:66px;\">\r\n</span>\r\n</div>\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n)', '', '2,6,4,5,1,17,18,7', '', '0', '0', '0', '0', '0', '0', '1', '0', '15', '0', '0');
INSERT INTO `v9_model_field` VALUES ('93', '11', '1', 'pages', '????????????', '', '', '0', '0', '', '', 'pages', 'array (\n)', '', '-99', '-99', '0', '0', '0', '1', '0', '0', '0', '0', '16', '0', '0');
INSERT INTO `v9_model_field` VALUES ('94', '11', '1', 'inputtime', '????????????', '', '', '0', '0', '', '', 'datetime', 'array (\n  \'fieldtype\' => \'int\',\n  \'format\' => \'Y-m-d H:i:s\',\n  \'defaulttype\' => \'0\',\n)', '', '', '', '0', '1', '0', '0', '0', '0', '0', '1', '17', '0', '0');
INSERT INTO `v9_model_field` VALUES ('95', '11', '1', 'posids', '?????????', '', '', '0', '0', '', '', 'posid', 'array (\n  \'cols\' => \'4\',\n  \'width\' => \'125\',\n)', '', '', '', '0', '1', '0', '1', '0', '0', '0', '0', '18', '0', '0');
INSERT INTO `v9_model_field` VALUES ('96', '11', '1', 'groupids_view', '????????????', '', '', '0', '100', '', '', 'groupid', 'array (\n  \'groupids\' => \'\',\n)', '', '', '', '0', '0', '0', '1', '0', '0', '0', '0', '19', '0', '0');
INSERT INTO `v9_model_field` VALUES ('97', '11', '1', 'url', 'URL', '', '', '0', '100', '', '', 'text', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '50', '0', '0');
INSERT INTO `v9_model_field` VALUES ('98', '11', '1', 'listorder', '??????', '', '', '0', '6', '', '', 'number', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '51', '0', '0');
INSERT INTO `v9_model_field` VALUES ('99', '11', '1', 'template', '???????????????', '', '', '0', '30', '', '', 'template', 'array (\n  \'size\' => \'\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '53', '0', '0');
INSERT INTO `v9_model_field` VALUES ('100', '11', '1', 'allow_comment', '????????????', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'????????????|1\r\n???????????????|0\',\n  \'boxtype\' => \'radio\',\n  \'fieldtype\' => \'tinyint\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'88\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'0\',\n)', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '54', '0', '0');
INSERT INTO `v9_model_field` VALUES ('101', '11', '1', 'status', '??????', '', '', '0', '2', '', '', 'box', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `v9_model_field` VALUES ('102', '11', '1', 'readpoint', '????????????', '', '', '0', '5', '', '', 'readpoint', 'array (\n  \'minnumber\' => \'1\',\n  \'maxnumber\' => \'99999\',\n  \'decimaldigits\' => \'0\',\n  \'defaultvalue\' => \'\',\n)', '', '-99', '-99', '0', '0', '0', '0', '0', '0', '0', '0', '55', '0', '0');
INSERT INTO `v9_model_field` VALUES ('103', '11', '1', 'username', '?????????', '', '', '0', '20', '', '', 'text', 'array (\n)', '', '', '', '1', '1', '0', '1', '0', '0', '0', '0', '98', '0', '0');
INSERT INTO `v9_model_field` VALUES ('104', '11', '1', 'islink', '????????????', '', '', '0', '0', '', '', 'islink', 'array (\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '20', '0', '0');
INSERT INTO `v9_model_field` VALUES ('105', '11', '1', 'video', '????????????', '', '', '0', '0', '', '', 'video', 'array (\n  \'upload_allowext\' => \'flv|rm|mp4|rmv\',\n)', '', '', '', '0', '0', '0', '1', '0', '1', '0', '0', '8', '0', '0');
INSERT INTO `v9_model_field` VALUES ('106', '11', '1', 'vision', '??????', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'??????|1\r\n??????|2\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'0\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '9', '0', '0');
INSERT INTO `v9_model_field` VALUES ('107', '11', '1', 'video_category', '????????????', '', '', '0', '0', '', '', 'box', 'array (\n  \'options\' => \'??????|1\r\n??????|2\r\n??????|3\r\n??????|4\r\n??????|5\r\n??????|6\',\n  \'boxtype\' => \'select\',\n  \'fieldtype\' => \'varchar\',\n  \'minnumber\' => \'1\',\n  \'width\' => \'80\',\n  \'size\' => \'1\',\n  \'defaultvalue\' => \'1\',\n  \'outputtype\' => \'1\',\n  \'filtertype\' => \'1\',\n)', '', '', '', '0', '1', '0', '1', '0', '1', '0', '0', '9', '0', '0');
INSERT INTO `v9_model_field` VALUES ('111', '12', '1', 'uploader', '?????????', '', '', '0', '0', '', '', 'text', '{\"size\":\"22\",\"defaultvalue\":\"\",\"ispassword\":\"0\"}', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '0');
INSERT INTO `v9_model_field` VALUES ('108', '12', '1', 'date', '????????????', '', '', '1', '0', '', '', 'datetime', '{\"fieldtype\":\"date\",\"format\":\"Y-m-d H:i:s\",\"defaulttype\":\"0\"}', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '2', '0', '0');
INSERT INTO `v9_model_field` VALUES ('109', '12', '1', 'describle', '????????????', '', '', '1', '0', '', '', 'text', '{\"size\":\"\",\"defaultvalue\":\"\",\"ispassword\":\"0\"}', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '4', '0', '0');
INSERT INTO `v9_model_field` VALUES ('110', '12', '1', 'status', '????????????', '', '', '0', '0', '', '', 'box', '{\"options\":\"\\u5ba1\\u6838\\u4e2d|0\\r\\n\\u5ba1\\u6838\\u901a\\u8fc7|1\",\"boxtype\":\"radio\",\"fieldtype\":\"tinyint\",\"minnumber\":\"1\",\"cols\":\"2\",\"width\":\"80\",\"size\":\"1\",\"defaultvalue\":\"0\"}', '', '8', '', '0', '0', '0', '0', '0', '0', '0', '0', '5', '0', '0');
INSERT INTO `v9_model_field` VALUES ('112', '12', '1', 'img_address', '????????????', '', '', '1', '0', '', '', 'images', '{\"upload_allowext\":\"gif|jpg|jpeg|png|bmp\",\"isselectimage\":\"0\",\"upload_number\":\"10\"}', '', '', '', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0');

-- ----------------------------
-- Table structure for v9_module
-- ----------------------------
DROP TABLE IF EXISTS `v9_module`;
CREATE TABLE `v9_module` (
  `module` varchar(15) NOT NULL,
  `name` varchar(20) NOT NULL,
  `url` varchar(50) NOT NULL,
  `iscore` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `version` varchar(50) NOT NULL DEFAULT '',
  `description` varchar(255) NOT NULL,
  `setting` mediumtext NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `installdate` date NOT NULL DEFAULT '1000-01-01',
  `updatedate` date NOT NULL DEFAULT '1000-01-01',
  PRIMARY KEY (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_module
-- ----------------------------
INSERT INTO `v9_module` VALUES ('admin', 'admin', '', '1', '1.0', '', 'array (\n  \'admin_email\' => \'phpcms@phpcms.cn\',\n  \'adminaccessip\' => \'0\',\n  \'maxloginfailedtimes\' => \'8\',\n  \'maxiplockedtime\' => \'15\',\n  \'minrefreshtime\' => \'2\',\n  \'mail_type\' => \'1\',\n  \'mail_server\' => \'smtp.qq.com\',\n  \'mail_port\' => \'25\',\n  \'mail_user\' => \'phpcms.cn@foxmail.com\',\n  \'mail_auth\' => \'1\',\n  \'mail_from\' => \'phpcms.cn@foxmail.com\',\n  \'mail_password\' => \'\',\n  \'errorlog_size\' => \'20\',\n)', '0', '0', '2010-10-18', '2010-10-18');
INSERT INTO `v9_module` VALUES ('member', '??????', '', '1', '1.0', '', 'array (\n  \'allowregister\' => \'1\',\n  \'choosemodel\' => \'1\',\n  \'enablemailcheck\' => \'0\',\n  \'registerverify\' => \'0\',\n  \'showapppoint\' => \'0\',\n  \'rmb_point_rate\' => \'10\',\n  \'defualtpoint\' => \'0\',\n  \'defualtamount\' => \'0\',\n  \'showregprotocol\' => \'0\',\n  \'regprotocol\' => \'		 ?????????????????????phpcms??????\r\n?????????????????????????????????????????????????????????????????????????????? \r\n1?????????????????????????????????\r\n??????phpcms???????????????????????????????????????phpcms?????????phpcms????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? ???????????????????????????phpcms?????????????????????????????????????????????\r\n2??? phpcms????????????\r\n??????phpcms?????????????????????????????????????????????????????????????????????????????????????????????????????????BBS??????????????????\r\n????????????????????? \r\n??????1)??????????????????????????????????????????????????????????????????????????????????????? \r\n??????2)????????????????????????????????????????????????????????????????????????\r\n????????????????????? \r\n??????1)???????????????????????????????????????????????? \r\n??????2)??????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? \r\n??????3)????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????phpcms??????????????????????????????????????????????????????????????????phpcms???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????\r\n3??? ?????????????????????\r\n??????phpcms???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? ?????????????????????????????????????????????????????????????????????\r\n4??? ????????????\r\n??????phpcms??????????????????????????????????????????????????????????????????phpcms???????????????????????????????????????????????????????????????????????????\r\n5??? ??????????????????\r\n?????????????????????????????????phpcms??? ???????????????phpcms???????????????????????????????????????????????????????????????????????????????????????phpcms????????????????????????????????????????????????????????????????????????????????? \r\n??????1)?????????????????????????????????????????????????????? \r\n??????2)????????????phpcms????????????????????? \r\n??????3)??????????????????????????????????????????????????????????????????????????? \r\n??????4)?????????????????????????????? \r\n6???????????????????????????????????????\r\n??????????????????????????????phpcms????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????phpcms???\r\n7??? ????????????\r\n??????????????????????????????????????????????????????????????????????????? ?????? \r\n??????phpcms????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????phpcms????????????????????????????????????????????????????????????????????????????????????????????????????????? \r\n8???????????????\r\n??????phpcms???????????????????????????????????????????????????????????????????????????\r\n9??? ????????????????????????????????? \r\n???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????phpcms?????????????????????????????????????????????????????????????????????\r\n10??????????????? \r\n????????????????????????????????????????????????????????????????????? \r\n??????1)?????????????????????????????????????????????????????????????????????????????? \r\n??????2)??????????????????????????????????????? \r\n??????3)????????????????????????????????? \r\n??????4)????????????BBS??????????????????????????????????????????????????? \r\n??????5)???????????????????????????????????????????????????????????????????????????\r\n??????6)????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????\r\n??????7)????????????????????????????????????????????????????????? \r\n?????????1??????????????????????????????????????????????????????????????????\r\n?????????2????????????????????????????????????????????????????????????\r\n?????????3????????????????????????????????????????????????\r\n?????????4???????????????????????????????????????????????????????????????\r\n?????????5?????????????????????????????????????????????????????????????????????\r\n?????????6????????????????????????????????????????????????????????????????????????????????????????????????\r\n?????????7?????????????????????????????????????????????????????????????????????????????????????????????\r\n?????????8?????????????????????????????????\r\n?????????9????????????????????????????????????????????????\r\n?????????10?????????????????????????????????\r\n???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????? ????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????phpcms??????????????????????????????\r\n11???????????????????????????\r\n??????phpcms???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????phpcms????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????phpcms???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????\r\n12?????????????????????\r\n?????????????????????phpcms?????????????????????????????????????????????phpcms????????????????????????????????????\r\n13????????????\r\n????????????????????????????????????phpcms?????????????????????????????????????????????????????????????????????????????????????????????????????????????????? \',\n  \'registerverifymessage\' => \' ?????????????????????phpcms???????????????????????????????????????????????????????????????????????????{click}\r\n????????????????????????????????????{url}\',\n  \'forgetpassword\' => \' phpcms??????????????????????????????????????????????????????????????????{click}\r\n????????????????????????????????????{url}\',\n)', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `v9_module` VALUES ('pay', '??????', '', '1', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `v9_module` VALUES ('digg', '?????????', '', '0', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `v9_module` VALUES ('special', '??????', '', '0', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `v9_module` VALUES ('content', '????????????', '', '1', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `v9_module` VALUES ('search', '????????????', '', '0', '1.0', '', 'array (\n  \'fulltextenble\' => \'1\',\n  \'relationenble\' => \'1\',\n  \'suggestenable\' => \'1\',\n  \'sphinxenable\' => \'0\',\n  \'sphinxhost\' => \'10.228.134.102\',\n  \'sphinxport\' => \'9312\',\n)', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `v9_module` VALUES ('scan', '????????????', 'scan', '0', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `v9_module` VALUES ('attachment', '??????', 'attachment', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `v9_module` VALUES ('block', '??????', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `v9_module` VALUES ('collection', '????????????', 'collection', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `v9_module` VALUES ('dbsource', '?????????', '', '1', '', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `v9_module` VALUES ('template', '????????????', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `v9_module` VALUES ('release', '?????????', '', '1', '1.0', '', '', '0', '0', '2010-09-01', '2010-09-06');
INSERT INTO `v9_module` VALUES ('video', '?????????', '', '0', '1.0', '', '', '0', '0', '2012-09-28', '2012-09-28');
INSERT INTO `v9_module` VALUES ('announce', '??????', 'announce/', '0', '1.0', '??????', '', '0', '0', '2019-03-21', '2019-03-21');
INSERT INTO `v9_module` VALUES ('comment', '??????', 'comment/', '0', '1.0', '??????', '', '0', '0', '2019-03-21', '2019-03-21');
INSERT INTO `v9_module` VALUES ('link', '????????????', '', '0', '1.0', '', 'array (\n  1 => \n  array (\n    \'is_post\' => \'1\',\n    \'enablecheckcode\' => \'0\',\n  ),\n)', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `v9_module` VALUES ('vote', '??????', '', '0', '1.0', '', 'array (\r\n  1 => \r\n  array (\r\n    \'default_style\' => \'default\',\r\n    \'vote_tp_template\' => \'vote_tp\',\r\n    \'allowguest\' => \'1\',\r\n    \'enabled\' => \'1\',\r\n    \'interval\' => \'1\',\r\n    \'credit\' => \'1\',\r\n  ),\r\n)', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `v9_module` VALUES ('message', '?????????', '', '0', '1.0', '', '', '0', '0', '2010-09-06', '2010-09-06');
INSERT INTO `v9_module` VALUES ('mood', '????????????', 'mood/', '0', '1.0', '????????????', '', '0', '0', '2019-03-21', '2019-03-21');
INSERT INTO `v9_module` VALUES ('poster', '????????????', 'poster/', '0', '1.0', '????????????', '', '0', '0', '2019-03-21', '2019-03-21');
INSERT INTO `v9_module` VALUES ('formguide', '????????????', 'formguide/', '0', '1.0', 'formguide', 'array (\n  \'allowmultisubmit\' => \'1\',\n  \'interval\' => \'30\',\n  \'allowunreg\' => \'0\',\n  \'mailmessage\' => \'????????????????????????????????????????????????????????????\',\n)', '0', '0', '2010-10-20', '2010-10-20');
INSERT INTO `v9_module` VALUES ('wap', '????????????', 'wap/', '0', '1.0', '????????????', '', '0', '0', '2019-03-21', '2019-03-21');
INSERT INTO `v9_module` VALUES ('upgrade', '????????????', '', '0', '1.0', '', '', '0', '0', '2011-05-18', '2011-05-18');
INSERT INTO `v9_module` VALUES ('tag', '????????????', 'tag/', '0', '1.0', '????????????', '', '0', '0', '2019-03-21', '2019-03-21');
INSERT INTO `v9_module` VALUES ('sms', '????????????', 'sms/', '0', '1.0', '????????????', '', '0', '0', '2011-09-02', '2011-09-02');

-- ----------------------------
-- Table structure for v9_mood
-- ----------------------------
DROP TABLE IF EXISTS `v9_mood`;
CREATE TABLE `v9_mood` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `catid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '??????id',
  `siteid` mediumint(6) unsigned NOT NULL DEFAULT '0' COMMENT '??????ID',
  `contentid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '??????id',
  `total` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '??????',
  `n1` int(10) unsigned NOT NULL DEFAULT '0',
  `n2` int(10) unsigned NOT NULL DEFAULT '0',
  `n3` int(10) unsigned NOT NULL DEFAULT '0',
  `n4` int(10) unsigned NOT NULL DEFAULT '0',
  `n5` int(10) unsigned NOT NULL DEFAULT '0',
  `n6` int(10) unsigned NOT NULL DEFAULT '0',
  `n7` int(10) unsigned NOT NULL DEFAULT '0',
  `n8` int(10) unsigned NOT NULL DEFAULT '0',
  `n9` int(10) unsigned NOT NULL DEFAULT '0',
  `n10` int(10) unsigned NOT NULL DEFAULT '0',
  `lastupdate` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '??????????????????',
  PRIMARY KEY (`id`),
  KEY `total` (`total`),
  KEY `lastupdate` (`lastupdate`),
  KEY `catid` (`catid`,`siteid`,`contentid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_mood
-- ----------------------------

-- ----------------------------
-- Table structure for v9_news
-- ----------------------------
DROP TABLE IF EXISTS `v9_news`;
CREATE TABLE `v9_news` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` varchar(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` varchar(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_news
-- ----------------------------

-- ----------------------------
-- Table structure for v9_news_data
-- ----------------------------
DROP TABLE IF EXISTS `v9_news_data`;
CREATE TABLE `v9_news_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` mediumtext NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `voteid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `copyfrom` varchar(100) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_news_data
-- ----------------------------

-- ----------------------------
-- Table structure for v9_page
-- ----------------------------
DROP TABLE IF EXISTS `v9_page`;
CREATE TABLE `v9_page` (
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` varchar(160) NOT NULL,
  `style` varchar(24) NOT NULL,
  `keywords` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `template` varchar(30) NOT NULL,
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  KEY `catid` (`catid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_page
-- ----------------------------

-- ----------------------------
-- Table structure for v9_pay_account
-- ----------------------------
DROP TABLE IF EXISTS `v9_pay_account`;
CREATE TABLE `v9_pay_account` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `trade_sn` char(50) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `contactname` char(50) NOT NULL,
  `email` char(40) NOT NULL,
  `telephone` char(20) NOT NULL,
  `discount` float(8,2) NOT NULL DEFAULT '0.00',
  `money` char(8) NOT NULL,
  `quantity` int(8) unsigned NOT NULL DEFAULT '1',
  `addtime` int(10) NOT NULL DEFAULT '0',
  `paytime` int(10) NOT NULL DEFAULT '0',
  `usernote` char(255) NOT NULL,
  `pay_id` tinyint(3) NOT NULL,
  `pay_type` enum('offline','recharge','selfincome','online') NOT NULL DEFAULT 'recharge',
  `payment` char(90) NOT NULL,
  `type` tinyint(3) NOT NULL DEFAULT '1',
  `ip` char(15) NOT NULL DEFAULT '0.0.0.0',
  `status` enum('succ','failed','error','progress','timeout','cancel','waitting','unpay') NOT NULL DEFAULT 'unpay',
  `adminnote` char(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `trade_sn` (`trade_sn`,`money`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_pay_account
-- ----------------------------

-- ----------------------------
-- Table structure for v9_pay_payment
-- ----------------------------
DROP TABLE IF EXISTS `v9_pay_payment`;
CREATE TABLE `v9_pay_payment` (
  `pay_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `pay_name` varchar(120) NOT NULL,
  `pay_code` varchar(20) NOT NULL,
  `pay_desc` text NOT NULL,
  `pay_method` tinyint(1) DEFAULT NULL,
  `pay_fee` varchar(10) NOT NULL,
  `config` text NOT NULL,
  `is_cod` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `is_online` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `pay_order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `author` varchar(100) NOT NULL,
  `website` varchar(100) NOT NULL,
  `version` varchar(20) NOT NULL,
  PRIMARY KEY (`pay_id`),
  KEY `pay_code` (`pay_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_pay_payment
-- ----------------------------

-- ----------------------------
-- Table structure for v9_pay_spend
-- ----------------------------
DROP TABLE IF EXISTS `v9_pay_spend`;
CREATE TABLE `v9_pay_spend` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` int(10) unsigned NOT NULL DEFAULT '0',
  `username` varchar(20) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `logo` varchar(20) NOT NULL,
  `value` int(5) NOT NULL,
  `op_userid` int(10) unsigned NOT NULL DEFAULT '0',
  `op_username` char(20) NOT NULL,
  `msg` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `type` (`type`),
  KEY `creat_at` (`creat_at`),
  KEY `logo` (`logo`),
  KEY `userid` (`userid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_pay_spend
-- ----------------------------

-- ----------------------------
-- Table structure for v9_form_photos
-- ----------------------------
DROP TABLE IF EXISTS `v9_form_photos`;
CREATE TABLE `v9_form_photos` (
  `dataid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `userid` mediumint(8) unsigned NOT NULL,
  `username` varchar(20) NOT NULL,
  `datetime` int(10) unsigned NOT NULL,
  `ip` char(15) NOT NULL,
  `img_address` mediumtext NOT NULL,
  `date` date DEFAULT NULL,
  `describle` varchar(255) NOT NULL DEFAULT '',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `uploader` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`dataid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for v9_picture
-- ----------------------------
DROP TABLE IF EXISTS `v9_picture`;
CREATE TABLE `v9_picture` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_picture
-- ----------------------------

-- ----------------------------
-- Table structure for v9_picture_data
-- ----------------------------
DROP TABLE IF EXISTS `v9_picture_data`;
CREATE TABLE `v9_picture_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `pictureurls` mediumtext NOT NULL,
  `copyfrom` varchar(255) NOT NULL DEFAULT '',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_picture_data
-- ----------------------------

-- ----------------------------
-- Table structure for v9_position
-- ----------------------------
DROP TABLE IF EXISTS `v9_position`;
CREATE TABLE `v9_position` (
  `posid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `modelid` smallint(5) unsigned DEFAULT '0',
  `catid` smallint(5) unsigned DEFAULT '0',
  `name` char(30) NOT NULL DEFAULT '',
  `maxnum` smallint(5) NOT NULL DEFAULT '20',
  `extention` char(100) DEFAULT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` varchar(150) NOT NULL DEFAULT '',
  PRIMARY KEY (`posid`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_position
-- ----------------------------
INSERT INTO `v9_position` VALUES ('1', '0', '0', '?????????????????????', '20', null, '1', '1', '');
INSERT INTO `v9_position` VALUES ('2', '0', '0', '??????????????????', '20', null, '4', '1', '');
INSERT INTO `v9_position` VALUES ('13', '82', '0', '??????????????????', '20', null, '0', '1', '');
INSERT INTO `v9_position` VALUES ('5', '69', '0', '????????????', '20', null, '0', '1', '');
INSERT INTO `v9_position` VALUES ('8', '30', '54', '???????????????????????????', '20', null, '0', '1', '');
INSERT INTO `v9_position` VALUES ('9', '0', '0', '??????????????????', '20', null, '0', '1', '');
INSERT INTO `v9_position` VALUES ('10', '0', '0', '??????????????????', '20', null, '0', '1', '');
INSERT INTO `v9_position` VALUES ('12', '0', '0', '??????????????????', '20', null, '0', '1', '');
INSERT INTO `v9_position` VALUES ('14', '0', '0', '?????????????????????', '20', '', '0', '1', '');
INSERT INTO `v9_position` VALUES ('15', '0', '0', '????????????????????????', '20', '', '0', '1', '');
INSERT INTO `v9_position` VALUES ('16', '0', '0', '????????????????????????', '20', '', '0', '1', '');
INSERT INTO `v9_position` VALUES ('17', '0', '0', '????????????????????????', '20', '', '0', '1', '');

-- ----------------------------
-- Table structure for v9_position_data
-- ----------------------------
DROP TABLE IF EXISTS `v9_position_data`;
CREATE TABLE `v9_position_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `posid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(20) DEFAULT NULL,
  `modelid` smallint(6) unsigned DEFAULT '0',
  `thumb` tinyint(1) NOT NULL DEFAULT '0',
  `data` mediumtext,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `listorder` mediumint(8) DEFAULT '0',
  `expiration` int(10) NOT NULL,
  `extention` char(30) DEFAULT NULL,
  `synedit` tinyint(1) DEFAULT '0',
  KEY `posid` (`posid`),
  KEY `listorder` (`listorder`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_position_data
-- ----------------------------

-- ----------------------------
-- Table structure for v9_poster
-- ----------------------------
DROP TABLE IF EXISTS `v9_poster`;
CREATE TABLE `v9_poster` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` varchar(40) NOT NULL,
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` varchar(10) NOT NULL,
  `setting` text NOT NULL,
  `startdate` int(10) unsigned NOT NULL DEFAULT '0',
  `enddate` int(10) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `hits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `clicks` smallint(5) unsigned NOT NULL DEFAULT '0',
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `spaceid` (`spaceid`,`siteid`,`disabled`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_poster
-- ----------------------------
INSERT INTO `v9_poster` VALUES ('1', '1', 'banner', '1', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://phpcms.com/uploadfile/poster/2.png\',\n    \'alt\' => \'\',\n  ),\n)', '1285813808', '1446249600', '1285813833', '0', '1', '0', '0');
INSERT INTO `v9_poster` VALUES ('2', '1', 'phpcmsv9', '2', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://phpcms.com/statics/images/v9/ad_login.jpg\',\n    \'alt\' => \'phpcms??????????????????\',\n  ),\n)', '1285816298', '1446249600', '1285816310', '0', '1', '0', '0');
INSERT INTO `v9_poster` VALUES ('3', '1', 'phpcms????????????', '3', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://phpcms.com/uploadfile/poster/3.png\',\n    \'alt\' => \'phpcms??????\',\n  ),\n)', '1286504815', '1446249600', '1286504865', '0', '1', '0', '0');
INSERT INTO `v9_poster` VALUES ('4', '1', 'phpcms??????', '4', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://phpcms.com/uploadfile/poster/4.gif\',\n    \'alt\' => \'phpcms??????\',\n  ),\n)', '1286505141', '1446249600', '1286505178', '0', '0', '0', '0');
INSERT INTO `v9_poster` VALUES ('5', '1', 'phpcms??????', '5', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://phpcms.com/uploadfile/poster/5.gif\',\n    \'alt\' => \'??????\',\n  ),\n)', '1286509363', '1446249600', '1286509401', '0', '0', '0', '0');
INSERT INTO `v9_poster` VALUES ('6', '1', 'phpcms????????????1', '6', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://phpcms.com/uploadfile/poster/5.gif\',\n    \'alt\' => \'??????\',\n  ),\n)', '1286510183', '1446249600', '1286510227', '0', '0', '0', '0');
INSERT INTO `v9_poster` VALUES ('7', '1', 'phpcms????????????', '7', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://phpcms.com/uploadfile/poster/5.gif\',\n    \'alt\' => \'??????\',\n  ),\n)', '1286510314', '1446249600', '1286510341', '0', '0', '0', '0');
INSERT INTO `v9_poster` VALUES ('8', '1', 'phpcms?????????', '8', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://phpcms.com/uploadfile/poster/1.jpg\',\n    \'alt\' => \'?????????\',\n  ),\n)', '1286522084', '1446249600', '1286522125', '0', '0', '0', '0');
INSERT INTO `v9_poster` VALUES ('9', '1', 'phpcms v9??????', '9', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://phpcms.com/uploadfile/poster/4.gif\',\n    \'alt\' => \'\',\n  ),\n)', '1287041759', '1446249600', '1287041804', '0', '0', '0', '0');
INSERT INTO `v9_poster` VALUES ('10', '1', 'phpcms', '10', 'images', 'array (\n  1 => \n  array (\n    \'linkurl\' => \'http://www.phpcms.cn\',\n    \'imageurl\' => \'http://phpcms.com/uploadfile/poster/6.jpg\',\n    \'alt\' => \'phpcms??????\',\n  ),\n)', '1289270509', '1446249600', '1289270541', '1', '0', '0', '0');

-- ----------------------------
-- Table structure for v9_poster_201903
-- ----------------------------
DROP TABLE IF EXISTS `v9_poster_201903`;
CREATE TABLE `v9_poster_201903` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `spaceid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `area` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `referer` char(120) NOT NULL,
  `clicktime` int(10) unsigned NOT NULL DEFAULT '0',
  `type` tinyint(1) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`,`type`,`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_poster_201903
-- ----------------------------

-- ----------------------------
-- Table structure for v9_poster_space
-- ----------------------------
DROP TABLE IF EXISTS `v9_poster_space`;
CREATE TABLE `v9_poster_space` (
  `spaceid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(50) NOT NULL,
  `type` char(30) NOT NULL,
  `path` char(40) NOT NULL,
  `width` smallint(4) unsigned NOT NULL DEFAULT '0',
  `height` smallint(4) unsigned NOT NULL DEFAULT '0',
  `setting` char(100) NOT NULL,
  `description` char(100) NOT NULL,
  `items` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`spaceid`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_poster_space
-- ----------------------------
INSERT INTO `v9_poster_space` VALUES ('1', '1', '???????????????????????????', 'banner', 'poster_js/1.js', '430', '63', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `v9_poster_space` VALUES ('2', '1', '?????????????????????', 'banner', 'poster_js/2.js', '310', '304', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '??????????????????????????????????????????????????????', '1', '0');
INSERT INTO `v9_poster_space` VALUES ('3', '1', '??????????????????????????????', 'banner', 'poster_js/3.js', '249', '87', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `v9_poster_space` VALUES ('4', '1', '??????????????????????????????', 'banner', 'poster_js/4.js', '748', '91', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `v9_poster_space` VALUES ('5', '1', '???????????????????????????', 'banner', 'poster_js/5.js', '248', '162', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `v9_poster_space` VALUES ('6', '1', '???????????????????????????', 'banner', 'poster_js/6.js', '248', '162', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `v9_poster_space` VALUES ('7', '1', '???????????????????????????', 'banner', 'poster_js/7.js', '248', '162', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `v9_poster_space` VALUES ('8', '1', '??????????????????', 'banner', 'poster_js/8.js', '698', '80', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `v9_poster_space` VALUES ('9', '1', '?????????????????????????????????', 'banner', 'poster_js/12.js', '330', '50', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');
INSERT INTO `v9_poster_space` VALUES ('10', '1', '????????????????????????', 'banner', 'poster_js/10.js', '307', '60', 'array (\n  \'paddleft\' => \'\',\n  \'paddtop\' => \'\',\n)', '', '1', '0');

-- ----------------------------
-- Table structure for v9_queue
-- ----------------------------
DROP TABLE IF EXISTS `v9_queue`;
CREATE TABLE `v9_queue` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `type` char(5) DEFAULT NULL,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `path` varchar(100) DEFAULT NULL,
  `status1` tinyint(1) DEFAULT '0',
  `status2` tinyint(1) DEFAULT '0',
  `status3` tinyint(1) DEFAULT '0',
  `status4` tinyint(1) DEFAULT '0',
  `times` int(10) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `siteid` (`siteid`),
  KEY `times` (`times`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_queue
-- ----------------------------

-- ----------------------------
-- Table structure for v9_release_point
-- ----------------------------
DROP TABLE IF EXISTS `v9_release_point`;
CREATE TABLE `v9_release_point` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) DEFAULT NULL,
  `host` varchar(100) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  `port` varchar(10) DEFAULT '21',
  `pasv` tinyint(1) DEFAULT '0',
  `ssl` tinyint(1) DEFAULT '0',
  `path` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_release_point
-- ----------------------------

-- ----------------------------
-- Table structure for v9_search
-- ----------------------------
DROP TABLE IF EXISTS `v9_search`;
CREATE TABLE `v9_search` (
  `searchid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `adddate` int(10) unsigned NOT NULL,
  `data` text NOT NULL,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`searchid`),
  KEY `typeid` (`typeid`,`id`),
  KEY `siteid` (`siteid`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_search
-- ----------------------------

-- ----------------------------
-- Table structure for v9_search_keyword
-- ----------------------------
DROP TABLE IF EXISTS `v9_search_keyword`;
CREATE TABLE `v9_search_keyword` (
  `keyword` char(20) NOT NULL,
  `pinyin` char(20) NOT NULL,
  `searchnums` int(10) unsigned NOT NULL,
  `data` char(20) NOT NULL,
  UNIQUE KEY `keyword` (`keyword`),
  UNIQUE KEY `pinyin` (`pinyin`),
  FULLTEXT KEY `data` (`data`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_search_keyword
-- ----------------------------

-- ----------------------------
-- Table structure for v9_session
-- ----------------------------
DROP TABLE IF EXISTS `v9_session`;
CREATE TABLE `v9_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_session
-- ----------------------------
INSERT INTO `v9_session` VALUES ('n6bqoj8nt7ep7qllql2hlqqnl6', '1', '127.0.0.1', '1553101297', '1', '0', 'admin', 'index', 'public_session_life', 'code|s:5:\"6zf8c\";userid|s:1:\"1\";roleid|s:1:\"1\";pc_hash|s:6:\"rlmBrT\";lock_screen|i:0;');

-- ----------------------------
-- Table structure for v9_site
-- ----------------------------
DROP TABLE IF EXISTS `v9_site`;
CREATE TABLE `v9_site` (
  `siteid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) DEFAULT '',
  `dirname` char(255) DEFAULT '',
  `domain` char(255) DEFAULT '',
  `site_title` char(255) DEFAULT '',
  `keywords` char(255) DEFAULT '',
  `description` char(255) DEFAULT '',
  `release_point` text,
  `default_style` char(50) DEFAULT NULL,
  `template` text,
  `setting` mediumtext,
  `uuid` char(40) DEFAULT '',
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_site
-- ----------------------------
INSERT INTO `v9_site` VALUES ('1', '????????????', '', 'http://phpcms.com/', 'PHPCMS?????????', 'PHPCMS?????????', 'PHPCMS?????????', '', 'default', 'default', 'array (\n  \'upload_maxsize\' => \'2048\',\n  \'upload_allowext\' => \'jpg|jpeg|gif|bmp|png|doc|docx|xls|xlsx|ppt|pptx|pdf|txt|rar|zip|swf\',\n  \'watermark_enable\' => \'1\',\n  \'watermark_minwidth\' => \'300\',\n  \'watermark_minheight\' => \'300\',\n  \'watermark_img\' => \'/statics/images/water/mark.png\',\n  \'watermark_pct\' => \'85\',\n  \'watermark_quality\' => \'80\',\n  \'watermark_pos\' => \'9\',\n)', '0fc58789-4b30-11e9-9af4-f8cab8135c90');

-- ----------------------------
-- Table structure for v9_sms_report
-- ----------------------------
DROP TABLE IF EXISTS `v9_sms_report`;
CREATE TABLE `v9_sms_report` (
  `id` bigint(15) NOT NULL AUTO_INCREMENT,
  `mobile` varchar(11) NOT NULL,
  `posttime` int(10) unsigned NOT NULL DEFAULT '0',
  `id_code` varchar(10) NOT NULL,
  `msg` varchar(90) NOT NULL,
  `send_userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) NOT NULL DEFAULT '0',
  `return_id` varchar(30) NOT NULL,
  `ip` varchar(15) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mobile` (`mobile`,`posttime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_sms_report
-- ----------------------------

-- ----------------------------
-- Table structure for v9_special
-- ----------------------------
DROP TABLE IF EXISTS `v9_special`;
CREATE TABLE `v9_special` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `aid` int(10) unsigned NOT NULL DEFAULT '0',
  `title` char(60) NOT NULL,
  `typeids` char(100) NOT NULL,
  `thumb` char(100) NOT NULL,
  `banner` char(100) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ispage` tinyint(1) unsigned NOT NULL,
  `filename` char(40) NOT NULL,
  `pics` char(100) NOT NULL,
  `voteid` char(60) NOT NULL,
  `style` char(20) NOT NULL,
  `index_template` char(40) NOT NULL,
  `list_template` char(40) NOT NULL,
  `show_template` char(60) NOT NULL,
  `css` text NOT NULL,
  `username` char(40) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `createtime` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL,
  `elite` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `disabled` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isvideo` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `disabled` (`disabled`,`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_special
-- ----------------------------

-- ----------------------------
-- Table structure for v9_special_content
-- ----------------------------
DROP TABLE IF EXISTS `v9_special_content`;
CREATE TABLE `v9_special_content` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `specialid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `title` char(80) NOT NULL,
  `style` char(24) NOT NULL,
  `typeid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `thumb` char(100) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `url` char(100) NOT NULL,
  `curl` char(15) NOT NULL,
  `listorder` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `searchid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `isdata` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `videoid` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `specialid` (`specialid`,`typeid`,`isdata`),
  KEY `typeid` (`typeid`,`isdata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_special_content
-- ----------------------------

-- ----------------------------
-- Table structure for v9_special_c_data
-- ----------------------------
DROP TABLE IF EXISTS `v9_special_c_data`;
CREATE TABLE `v9_special_c_data` (
  `id` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `author` varchar(40) NOT NULL,
  `content` text NOT NULL,
  `paginationtype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `maxcharperpage` mediumint(6) unsigned NOT NULL DEFAULT '0',
  `style` char(20) NOT NULL,
  `show_template` varchar(30) NOT NULL,
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_special_c_data
-- ----------------------------

-- ----------------------------
-- Table structure for v9_sphinx_counter
-- ----------------------------
DROP TABLE IF EXISTS `v9_sphinx_counter`;
CREATE TABLE `v9_sphinx_counter` (
  `counter_id` int(11) unsigned NOT NULL,
  `max_doc_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`counter_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_sphinx_counter
-- ----------------------------

-- ----------------------------
-- Table structure for v9_sso_admin
-- ----------------------------
DROP TABLE IF EXISTS `v9_sso_admin`;
CREATE TABLE `v9_sso_admin` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL,
  `password` char(32) NOT NULL,
  `encrypt` char(6) DEFAULT NULL,
  `issuper` tinyint(1) DEFAULT '0',
  `lastlogin` int(10) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_sso_admin
-- ----------------------------
INSERT INTO `v9_sso_admin` VALUES ('1', 'admin', '7c9e4bf8c3565ea76343c589ec8e251e', 'u5bHLn', '1', '0', '');

-- ----------------------------
-- Table structure for v9_sso_applications
-- ----------------------------
DROP TABLE IF EXISTS `v9_sso_applications`;
CREATE TABLE `v9_sso_applications` (
  `appid` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(16) NOT NULL DEFAULT '',
  `name` char(20) NOT NULL DEFAULT '',
  `url` char(255) NOT NULL DEFAULT '',
  `authkey` char(255) NOT NULL DEFAULT '',
  `ip` char(15) NOT NULL DEFAULT '',
  `apifilename` char(30) NOT NULL DEFAULT 'phpsso.php',
  `charset` char(8) NOT NULL DEFAULT '',
  `synlogin` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`appid`),
  KEY `synlogin` (`synlogin`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_sso_applications
-- ----------------------------
INSERT INTO `v9_sso_applications` VALUES ('1', 'phpcms_v9', 'phpcms v9', 'http://phpcms.com/', 'ubdgbFRobEWL9D1pcR4UG2U5QDgckWzp', '', 'api.php?op=phpsso', 'utf-8', '1');

-- ----------------------------
-- Table structure for v9_sso_members
-- ----------------------------
DROP TABLE IF EXISTS `v9_sso_members`;
CREATE TABLE `v9_sso_members` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` char(20) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `random` char(8) NOT NULL DEFAULT '',
  `email` char(32) NOT NULL DEFAULT '',
  `regip` char(15) NOT NULL DEFAULT '',
  `regdate` int(10) unsigned NOT NULL DEFAULT '0',
  `lastip` char(15) NOT NULL DEFAULT '0',
  `lastdate` int(10) unsigned NOT NULL DEFAULT '0',
  `appname` char(15) NOT NULL,
  `type` enum('app','connect') DEFAULT NULL,
  `avatar` tinyint(1) NOT NULL DEFAULT '0',
  `ucuserid` mediumint(8) unsigned DEFAULT '0',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `username` (`username`),
  KEY `email` (`email`),
  KEY `ucuserid` (`ucuserid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_sso_members
-- ----------------------------

-- ----------------------------
-- Table structure for v9_sso_messagequeue
-- ----------------------------
DROP TABLE IF EXISTS `v9_sso_messagequeue`;
CREATE TABLE `v9_sso_messagequeue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `operation` char(32) NOT NULL,
  `succeed` tinyint(1) NOT NULL DEFAULT '0',
  `totalnum` smallint(6) unsigned NOT NULL DEFAULT '0',
  `noticedata` mediumtext NOT NULL,
  `dateline` int(10) unsigned NOT NULL DEFAULT '0',
  `appstatus` mediumtext,
  PRIMARY KEY (`id`),
  KEY `dateline` (`dateline`),
  KEY `succeed` (`succeed`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_sso_messagequeue
-- ----------------------------

-- ----------------------------
-- Table structure for v9_sso_session
-- ----------------------------
DROP TABLE IF EXISTS `v9_sso_session`;
CREATE TABLE `v9_sso_session` (
  `sessionid` char(32) NOT NULL,
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `lastvisit` int(10) unsigned NOT NULL DEFAULT '0',
  `roleid` tinyint(3) unsigned DEFAULT '0',
  `groupid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `m` char(20) NOT NULL,
  `c` char(20) NOT NULL,
  `a` char(20) NOT NULL,
  `data` char(255) NOT NULL,
  PRIMARY KEY (`sessionid`),
  KEY `lastvisit` (`lastvisit`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_sso_session
-- ----------------------------

-- ----------------------------
-- Table structure for v9_sso_settings
-- ----------------------------
DROP TABLE IF EXISTS `v9_sso_settings`;
CREATE TABLE `v9_sso_settings` (
  `name` varchar(32) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_sso_settings
-- ----------------------------
INSERT INTO `v9_sso_settings` VALUES ('denyemail', '');
INSERT INTO `v9_sso_settings` VALUES ('denyusername', '');
INSERT INTO `v9_sso_settings` VALUES ('creditrate', '');
INSERT INTO `v9_sso_settings` VALUES ('sp4', '');
INSERT INTO `v9_sso_settings` VALUES ('ucenter', '');

-- ----------------------------
-- Table structure for v9_tag
-- ----------------------------
DROP TABLE IF EXISTS `v9_tag`;
CREATE TABLE `v9_tag` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `tag` text NOT NULL,
  `name` char(40) NOT NULL,
  `type` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `module` char(20) NOT NULL,
  `action` char(20) NOT NULL,
  `data` text NOT NULL,
  `page` char(15) NOT NULL,
  `return` char(20) NOT NULL,
  `cache` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `num` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_tag
-- ----------------------------

-- ----------------------------
-- Table structure for v9_template_bak
-- ----------------------------
DROP TABLE IF EXISTS `v9_template_bak`;
CREATE TABLE `v9_template_bak` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `creat_at` int(10) unsigned DEFAULT '0',
  `fileid` char(50) DEFAULT NULL,
  `userid` mediumint(8) DEFAULT NULL,
  `username` char(20) DEFAULT NULL,
  `template` text,
  PRIMARY KEY (`id`),
  KEY `fileid` (`fileid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_template_bak
-- ----------------------------

-- ----------------------------
-- Table structure for v9_times
-- ----------------------------
DROP TABLE IF EXISTS `v9_times`;
CREATE TABLE `v9_times` (
  `username` char(40) NOT NULL,
  `ip` char(15) NOT NULL,
  `logintime` int(10) unsigned NOT NULL DEFAULT '0',
  `isadmin` tinyint(1) NOT NULL DEFAULT '0',
  `times` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`username`,`isadmin`)
) ENGINE=MEMORY DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_times
-- ----------------------------

-- ----------------------------
-- Table structure for v9_type
-- ----------------------------
DROP TABLE IF EXISTS `v9_type`;
CREATE TABLE `v9_type` (
  `typeid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `module` char(15) NOT NULL,
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL,
  `parentid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typedir` char(20) NOT NULL,
  `url` char(100) NOT NULL,
  `template` char(30) NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`typeid`),
  KEY `module` (`module`,`parentid`,`siteid`,`listorder`)
) ENGINE=MyISAM AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_type
-- ----------------------------
INSERT INTO `v9_type` VALUES ('52', '1', 'search', '0', '??????', '0', 'special', '', '', '4', '??????');
INSERT INTO `v9_type` VALUES ('1', '1', 'search', '1', '??????', '0', '', '', '', '1', '??????????????????');
INSERT INTO `v9_type` VALUES ('2', '1', 'search', '2', '??????', '0', '', '', '', '3', '??????????????????');
INSERT INTO `v9_type` VALUES ('3', '1', 'search', '3', '??????', '0', '', '', '', '2', '??????????????????');

-- ----------------------------
-- Table structure for v9_urlrule
-- ----------------------------
DROP TABLE IF EXISTS `v9_urlrule`;
CREATE TABLE `v9_urlrule` (
  `urlruleid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(15) NOT NULL,
  `file` varchar(20) NOT NULL,
  `ishtml` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `urlrule` varchar(255) NOT NULL,
  `example` varchar(255) NOT NULL,
  PRIMARY KEY (`urlruleid`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_urlrule
-- ----------------------------
INSERT INTO `v9_urlrule` VALUES ('1', 'content', 'category', '1', '{$categorydir}{$catdir}/index.html|{$categorydir}{$catdir}/{$page}.html', 'news/china/1000.html');
INSERT INTO `v9_urlrule` VALUES ('6', 'content', 'category', '0', 'index.php?m=content&c=index&a=lists&catid={$catid}|index.php?m=content&c=index&a=lists&catid={$catid}&page={$page}', 'index.php?m=content&c=index&a=lists&catid=1&page=1');
INSERT INTO `v9_urlrule` VALUES ('11', 'content', 'show', '1', '{$year}/{$catdir}_{$month}{$day}/{$id}.html|{$year}/{$catdir}_{$month}{$day}/{$id}_{$page}.html', '2010/catdir_0720/1_2.html');
INSERT INTO `v9_urlrule` VALUES ('12', 'content', 'show', '1', '{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}.html|{$categorydir}{$catdir}/{$year}/{$month}{$day}/{$id}_{$page}.html', 'it/product/2010/0720/1_2.html');
INSERT INTO `v9_urlrule` VALUES ('16', 'content', 'show', '0', 'index.php?m=content&c=index&a=show&catid={$catid}&id={$id}|index.php?m=content&c=index&a=show&catid={$catid}&id={$id}&page={$page}', 'index.php?m=content&c=index&a=show&catid=1&id=1');
INSERT INTO `v9_urlrule` VALUES ('17', 'content', 'show', '0', 'show-{$catid}-{$id}-{$page}.html', 'show-1-2-1.html');
INSERT INTO `v9_urlrule` VALUES ('18', 'content', 'show', '0', 'content-{$catid}-{$id}-{$page}.html', 'content-1-2-1.html');
INSERT INTO `v9_urlrule` VALUES ('30', 'content', 'category', '0', 'list-{$catid}-{$page}.html', 'list-1-1.html');

-- ----------------------------
-- Table structure for v9_video
-- ----------------------------
DROP TABLE IF EXISTS `v9_video`;
CREATE TABLE `v9_video` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `catid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `typeid` smallint(5) unsigned NOT NULL,
  `title` char(80) NOT NULL DEFAULT '',
  `style` char(24) NOT NULL DEFAULT '',
  `thumb` char(100) NOT NULL DEFAULT '',
  `keywords` char(40) NOT NULL DEFAULT '',
  `description` char(255) NOT NULL DEFAULT '',
  `posids` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `url` char(100) NOT NULL,
  `listorder` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(2) unsigned NOT NULL DEFAULT '1',
  `sysadd` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `islink` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `username` char(20) NOT NULL,
  `inputtime` int(10) unsigned NOT NULL DEFAULT '0',
  `updatetime` int(10) unsigned NOT NULL DEFAULT '0',
  `vision` varchar(255) NOT NULL DEFAULT '',
  `video_category` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `status` (`status`,`listorder`,`id`),
  KEY `listorder` (`catid`,`status`,`listorder`,`id`),
  KEY `catid` (`catid`,`status`,`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_video
-- ----------------------------

-- ----------------------------
-- Table structure for v9_video_content
-- ----------------------------
DROP TABLE IF EXISTS `v9_video_content`;
CREATE TABLE `v9_video_content` (
  `contentid` int(10) unsigned NOT NULL DEFAULT '0',
  `modelid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `videoid` int(10) unsigned NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  KEY `videoid` (`videoid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_video_content
-- ----------------------------

-- ----------------------------
-- Table structure for v9_video_data
-- ----------------------------
DROP TABLE IF EXISTS `v9_video_data`;
CREATE TABLE `v9_video_data` (
  `id` mediumint(8) unsigned DEFAULT '0',
  `content` text NOT NULL,
  `readpoint` smallint(5) unsigned NOT NULL DEFAULT '0',
  `groupids_view` varchar(100) NOT NULL,
  `paginationtype` tinyint(1) NOT NULL,
  `maxcharperpage` mediumint(6) NOT NULL,
  `template` varchar(30) NOT NULL,
  `paytype` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `allow_comment` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `relation` varchar(255) NOT NULL DEFAULT '',
  `video` tinyint(3) unsigned NOT NULL DEFAULT '0',
  KEY `id` (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_video_data
-- ----------------------------

-- ----------------------------
-- Table structure for v9_video_store
-- ----------------------------
DROP TABLE IF EXISTS `v9_video_store`;
CREATE TABLE `v9_video_store` (
  `videoid` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(60) NOT NULL,
  `vid` char(40) NOT NULL,
  `keywords` char(40) NOT NULL,
  `description` char(255) NOT NULL,
  `status` tinyint(3) NOT NULL DEFAULT '0',
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `userid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `picpath` char(120) NOT NULL,
  `size` char(20) NOT NULL,
  `timelen` mediumint(9) NOT NULL DEFAULT '0',
  `userupload` tinyint(1) NOT NULL DEFAULT '0',
  `channelid` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`videoid`),
  KEY `videoid` (`videoid`,`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_video_store
-- ----------------------------

-- ----------------------------
-- Table structure for v9_vote_data
-- ----------------------------
DROP TABLE IF EXISTS `v9_vote_data`;
CREATE TABLE `v9_vote_data` (
  `userid` mediumint(8) unsigned DEFAULT '0',
  `username` char(20) NOT NULL,
  `subjectid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `time` int(10) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL,
  `data` text NOT NULL,
  `userinfo` text NOT NULL,
  KEY `subjectid` (`subjectid`),
  KEY `userid` (`userid`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_vote_data
-- ----------------------------

-- ----------------------------
-- Table structure for v9_vote_option
-- ----------------------------
DROP TABLE IF EXISTS `v9_vote_option`;
CREATE TABLE `v9_vote_option` (
  `optionid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `subjectid` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `option` varchar(255) NOT NULL,
  `image` varchar(100) DEFAULT NULL,
  `listorder` tinyint(2) unsigned DEFAULT '0',
  PRIMARY KEY (`optionid`),
  KEY `subjectid` (`subjectid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_vote_option
-- ----------------------------

-- ----------------------------
-- Table structure for v9_vote_subject
-- ----------------------------
DROP TABLE IF EXISTS `v9_vote_subject`;
CREATE TABLE `v9_vote_subject` (
  `subjectid` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned DEFAULT '0',
  `subject` char(255) NOT NULL,
  `ismultiple` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `ischeckbox` tinyint(1) unsigned NOT NULL DEFAULT '0',
  `credit` smallint(5) unsigned NOT NULL DEFAULT '0',
  `addtime` int(10) unsigned NOT NULL DEFAULT '0',
  `fromdate` date NOT NULL DEFAULT '1000-01-01',
  `todate` date NOT NULL DEFAULT '1000-01-01',
  `interval` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `enabled` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `template` char(20) NOT NULL,
  `description` text NOT NULL,
  `listorder` smallint(5) unsigned NOT NULL DEFAULT '0',
  `allowguest` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `maxval` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `minval` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `allowview` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `optionnumber` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `votenumber` mediumint(8) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`subjectid`),
  KEY `enabled` (`enabled`),
  KEY `fromdate` (`fromdate`,`todate`),
  KEY `todate` (`todate`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_vote_subject
-- ----------------------------

-- ----------------------------
-- Table structure for v9_wap
-- ----------------------------
DROP TABLE IF EXISTS `v9_wap`;
CREATE TABLE `v9_wap` (
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '1',
  `sitename` char(30) NOT NULL,
  `logo` char(100) DEFAULT NULL,
  `domain` varchar(100) DEFAULT NULL,
  `setting` mediumtext,
  `status` tinyint(2) DEFAULT NULL,
  PRIMARY KEY (`siteid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_wap
-- ----------------------------
INSERT INTO `v9_wap` VALUES ('1', 'PHPCMS????????????', '/statics/images/wap/wlogo.gif', '', 'array (\n  \'listnum\' => \'10\',\n  \'thumb_w\' => \'220\',\n  \'thumb_h\' => \'0\',\n  \'c_num\' => \'1000\',\n  \'index_template\' => \'index\',\n  \'category_template\' => \'category\',\n  \'list_template\' => \'list\',\n  \'show_template\' => \'show\',\n)', '0');

-- ----------------------------
-- Table structure for v9_wap_type
-- ----------------------------
DROP TABLE IF EXISTS `v9_wap_type`;
CREATE TABLE `v9_wap_type` (
  `typeid` smallint(5) NOT NULL AUTO_INCREMENT,
  `cat` smallint(5) NOT NULL,
  `parentid` smallint(5) NOT NULL,
  `typename` varchar(30) NOT NULL,
  `siteid` smallint(5) NOT NULL,
  `listorder` smallint(5) DEFAULT '0',
  PRIMARY KEY (`typeid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_wap_type
-- ----------------------------

-- ----------------------------
-- Table structure for v9_workflow
-- ----------------------------
DROP TABLE IF EXISTS `v9_workflow`;
CREATE TABLE `v9_workflow` (
  `workflowid` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `siteid` smallint(5) unsigned NOT NULL DEFAULT '0',
  `steps` tinyint(1) unsigned NOT NULL DEFAULT '1',
  `workname` varchar(20) NOT NULL,
  `description` varchar(255) NOT NULL,
  `setting` text NOT NULL,
  `flag` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`workflowid`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of v9_workflow
-- ----------------------------
INSERT INTO `v9_workflow` VALUES ('1', '1', '1', '????????????', '????????????', '', '0');
INSERT INTO `v9_workflow` VALUES ('2', '1', '2', '????????????', '????????????', '', '0');
INSERT INTO `v9_workflow` VALUES ('3', '1', '3', '????????????', '????????????', '', '0');
INSERT INTO `v9_workflow` VALUES ('4', '1', '4', '????????????', '????????????', '', '0');
