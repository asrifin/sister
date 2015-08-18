/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50620
Source Host           : localhost:3306
Source Database       : sister_siadu

Target Server Type    : MYSQL
Target Server Version : 50620
File Encoding         : 65001

Date: 2015-08-18 17:51:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for modul_hrd
-- ----------------------------
DROP TABLE IF EXISTS `modul_hrd`;
CREATE TABLE `modul_hrd` (
  `id` tinyint(11) NOT NULL AUTO_INCREMENT,
  `modul` varchar(30) NOT NULL DEFAULT '',
  `isi` text NOT NULL,
  `setup` varchar(50) NOT NULL DEFAULT '',
  `posisi` tinyint(2) NOT NULL DEFAULT '0',
  `published` int(1) NOT NULL DEFAULT '0',
  `ordering` int(5) NOT NULL DEFAULT '0',
  `type` enum('block','module') NOT NULL DEFAULT 'module',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of modul_hrd
-- ----------------------------
INSERT INTO `modul_hrd` VALUES ('1', 'Terbaru', 'mod/news/terakhir.php', '', '1', '1', '3', 'module');
INSERT INTO `modul_hrd` VALUES ('2', 'Statistik Situs', 'mod/statistik/stat.php', '', '1', '1', '6', 'module');
INSERT INTO `modul_hrd` VALUES ('3', 'Polling', 'mod/polling/polling.php', '', '1', '0', '99', 'module');
INSERT INTO `modul_hrd` VALUES ('4', 'Kalender', 'mod/calendar/calendar.php', '', '1', '0', '100', 'module');
INSERT INTO `modul_hrd` VALUES ('5', 'Pesan Singkat', 'mod/shoutbox/shoutboxview.php', '', '1', '1', '99', 'module');
INSERT INTO `modul_hrd` VALUES ('6', 'Random Links', 'mod/random_link/randomlink.php', '', '1', '0', '100', 'module');
INSERT INTO `modul_hrd` VALUES ('7', 'Top Download', 'mod/top_download/topdl.php', '', '1', '0', '99', 'module');
INSERT INTO `modul_hrd` VALUES ('8', 'Login', 'mod/login/login.php', '', '1', '0', '99', 'module');
INSERT INTO `modul_hrd` VALUES ('10', 'ip logs', 'mod/phpids/ids.php', '', '1', '0', '99', 'module');
INSERT INTO `modul_hrd` VALUES ('17', 'Social Widget', 'mod/socialwidget/socialwidget.php', '', '1', '0', '99', 'module');
INSERT INTO `modul_hrd` VALUES ('18', 'Follow Us', 'mod/socialurl/socialurl.php', '', '1', '0', '99', 'module');
INSERT INTO `modul_hrd` VALUES ('22', 'Follow Kami di Twitter', '<script type=\"text/javascript\" charset=\"utf-8\" src=\"http://widgets.twimg.com/j/2/widget.js\"></script>\r\n<script type=\"text/javascript\">\r\nnew TWTR.Widget({\r\n  version: 2,\r\n  type: \'profile\',\r\n  rpp: 4,\r\n  interval: 30000,\r\n  width: 300,\r\n  height: 250,\r\n  theme: {\r\n    shell: {\r\n      background: \'#1E7DC1\',\r\n      color: \'#ffffff\'\r\n    },\r\n    tweets: {\r\n      background: \'#ffffff\',\r\n      color: \'#333333\',\r\n      links: \'#eb0707\'\r\n    }\r\n  },\r\n  features: {\r\n    scrollbar: true,\r\n    loop: false,\r\n    live: false,\r\n    behavior: \'default\'\r\n  }\r\n}).render().setUser(\'ppikomkutisari\').start();\r\n</script>', '', '1', '0', '99', 'block');
INSERT INTO `modul_hrd` VALUES ('29', 'Apa itu RWD', '<div align=\"center\">\r\n<a href=\"#\"><img src=\"images/rwd-kecil.jpg\"></a>\r\n</div>', '', '1', '1', '5', 'block');
INSERT INTO `modul_hrd` VALUES ('31', 'Pencarian', 'mod/pencarian/pencarian.php', '', '1', '1', '1', 'module');
INSERT INTO `modul_hrd` VALUES ('32', 'Terpopuler', 'mod/news/terpopuler.php', '', '1', '1', '2', 'module');
