/*
Navicat MySQL Data Transfer

Source Server         : 192.168.2.6(root)
Source Server Version : 50559
Source Host           : 192.168.2.6:3306
Source Database       : waf

Target Server Type    : MYSQL
Target Server Version : 50559
File Encoding         : 65001

Date: 2022-05-19 14:41:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for rules
-- ----------------------------
DROP TABLE IF EXISTS `rules`;
CREATE TABLE `rules` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rule_type` varchar(25) NOT NULL,
  `rule_item` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rules
-- ----------------------------
INSERT INTO `rules` VALUES ('4', 'args', '\\.\\./');
INSERT INTO `rules` VALUES ('5', 'args', '\\:\\$');
INSERT INTO `rules` VALUES ('6', 'args', '\\$\\{');
INSERT INTO `rules` VALUES ('7', 'args', 'select.+(from|limit)');
INSERT INTO `rules` VALUES ('8', 'args', '(?:(union(.*?)select))');
INSERT INTO `rules` VALUES ('9', 'args', 'having|rongjitest');
INSERT INTO `rules` VALUES ('10', 'args', 'sleep\\((\\s*)(\\d*)(\\s*)\\)');
INSERT INTO `rules` VALUES ('11', 'args', 'benchmark\\((.*)\\,(.*)\\)');
INSERT INTO `rules` VALUES ('12', 'args', 'base64_decode\\(');
INSERT INTO `rules` VALUES ('13', 'args', '(?:from\\W+information_schema\\W)');
INSERT INTO `rules` VALUES ('14', 'args', '(?:(?:current_)user|database|schema|connection_id)\\s*\\(');
INSERT INTO `rules` VALUES ('15', 'args', '(?:etc\\/\\W*passwd)');
INSERT INTO `rules` VALUES ('16', 'args', 'into(\\s+)+(?:dump|out)file\\s*');
INSERT INTO `rules` VALUES ('17', 'args', 'group\\s+by.+\\(');
INSERT INTO `rules` VALUES ('18', 'args', 'xwork.MethodAccessor');
INSERT INTO `rules` VALUES ('19', 'args', '(?:define|eval|file_get_contents|include|require|require_once|shell_exec|phpinfo|system|passthru|preg_\\w+|execute|echo|print|print_r|var_dump|(fp)open|alert|showmodaldialog)\\(');
INSERT INTO `rules` VALUES ('20', 'args', 'xwork\\.MethodAccessor');
INSERT INTO `rules` VALUES ('21', 'args', '(gopher|doc|php|glob|file|phar|zlib|ftp|ldap|dict|ogg|data)\\:\\/');
INSERT INTO `rules` VALUES ('22', 'args', 'java\\.lang');
INSERT INTO `rules` VALUES ('23', 'args', '\\$_(GET|post|cookie|session|env|phplib|GLOBALS|SERVER)\\[');
INSERT INTO `rules` VALUES ('24', 'args', '\\<(iframe|script|body|img|layer|div|meta|style|base|object|input)');
INSERT INTO `rules` VALUES ('25', 'args', '(onmouseover|onerror|onload)\\=');
INSERT INTO `rules` VALUES ('26', 'cookie', '\\.\\./');
INSERT INTO `rules` VALUES ('27', 'cookie', '\\:\\$');
INSERT INTO `rules` VALUES ('28', 'cookie', '\\$\\{');
INSERT INTO `rules` VALUES ('29', 'cookie', 'select.+(from|limit)');
INSERT INTO `rules` VALUES ('30', 'cookie', '(?:(union(.*?)select))');
INSERT INTO `rules` VALUES ('31', 'cookie', 'having|rongjitest');
INSERT INTO `rules` VALUES ('32', 'cookie', 'sleep\\((\\s*)(\\d*)(\\s*)\\)');
INSERT INTO `rules` VALUES ('33', 'cookie', 'benchmark\\((.*)\\,(.*)\\)');
INSERT INTO `rules` VALUES ('34', 'cookie', 'base64_decode\\(');
INSERT INTO `rules` VALUES ('35', 'cookie', '(?:from\\W+information_schema\\W)');
INSERT INTO `rules` VALUES ('36', 'cookie', '(?:(?:current_)user|database|schema|connection_id)\\s*\\(');
INSERT INTO `rules` VALUES ('37', 'cookie', '(?:etc\\/\\W*passwd)');
INSERT INTO `rules` VALUES ('38', 'cookie', 'into(\\s+)+(?:dump|out)file\\s*');
INSERT INTO `rules` VALUES ('39', 'cookie', 'group\\s+by.+\\(');
INSERT INTO `rules` VALUES ('40', 'cookie', 'xwork.MethodAccessor');
INSERT INTO `rules` VALUES ('41', 'cookie', '(?:define|eval|file_get_contents|include|require|require_once|shell_exec|phpinfo|system|passthru|preg_\\w+|execute|echo|print|print_r|var_dump|(fp)open|alert|showmodaldialog)\\(');
INSERT INTO `rules` VALUES ('42', 'cookie', 'xwork\\.MethodAccessor');
INSERT INTO `rules` VALUES ('43', 'cookie', '(gopher|doc|php|glob|file|phar|zlib|ftp|ldap|dict|ogg|data)\\:\\/');
INSERT INTO `rules` VALUES ('44', 'cookie', 'java\\.lang');
INSERT INTO `rules` VALUES ('45', 'cookie', '\\$_(GET|post|cookie|files|session|env|phplib|GLOBALS|SERVER)\\[');
INSERT INTO `rules` VALUES ('46', 'post', '\\.\\./');
INSERT INTO `rules` VALUES ('47', 'post', 'select.+(from|limit)');
INSERT INTO `rules` VALUES ('48', 'post', '(?:(union(.*?)select))');
INSERT INTO `rules` VALUES ('49', 'post', 'having|rongjitest');
INSERT INTO `rules` VALUES ('50', 'post', 'sleep\\((\\s*)(\\d*)(\\s*)\\)');
INSERT INTO `rules` VALUES ('51', 'post', 'benchmark\\((.*)\\,(.*)\\)');
INSERT INTO `rules` VALUES ('52', 'post', 'base64_decode\\(');
INSERT INTO `rules` VALUES ('53', 'post', '(?:from\\W+information_schema\\W)');
INSERT INTO `rules` VALUES ('54', 'post', '(?:(?:current_)user|database|schema|connection_id)\\s*\\(');
INSERT INTO `rules` VALUES ('55', 'post', '(?:etc\\/\\W*passwd)');
INSERT INTO `rules` VALUES ('56', 'post', 'into(\\s+)+(?:dump|out)file\\s*');
INSERT INTO `rules` VALUES ('57', 'post', 'group\\s+by.+\\(');
INSERT INTO `rules` VALUES ('58', 'post', 'xwork.MethodAccessor');
INSERT INTO `rules` VALUES ('59', 'post', '(?:define|eval|file_get_contents|include|require|require_once|shell_exec|phpinfo|system|passthru|preg_\\w+|execute|echo|print|print_r|var_dump|(fp)open|alert|showmodaldialog)\\(');
INSERT INTO `rules` VALUES ('60', 'post', 'xwork\\.MethodAccessor');
INSERT INTO `rules` VALUES ('61', 'post', '(gopher|doc|php|glob|file|phar|zlib|ftp|ldap|dict|ogg|data)\\:\\/');
INSERT INTO `rules` VALUES ('62', 'post', 'java\\.lang');
INSERT INTO `rules` VALUES ('63', 'post', '\\$_(GET|post|cookie|files|session|env|phplib|GLOBALS|SERVER)\\[');
INSERT INTO `rules` VALUES ('64', 'post', '\\<(iframe|script|body|img|layer|div|meta|style|base|object|input)');
INSERT INTO `rules` VALUES ('65', 'post', '(onmouseover|onerror|onload)\\=');
INSERT INTO `rules` VALUES ('66', 'url', '\\.(htaccess|bash_history)');
INSERT INTO `rules` VALUES ('67', 'url', '\\.(bak|inc|old|mdb|sql|backup|java|class|tgz|gz|tar|zip)$');
INSERT INTO `rules` VALUES ('68', 'url', '(phpmyadmin|jmx-console|admin-console|jmxinvokerservlet)');
INSERT INTO `rules` VALUES ('69', 'url', 'java\\.lang');
INSERT INTO `rules` VALUES ('70', 'url', '\\.(svn|git|sql|bak)\\/');
INSERT INTO `rules` VALUES ('71', 'url', '/(attachments|upimg|images|css|uploadfiles|html|uploads|templets|static|template|data|inc|forumdata|upload|includes|cache|avatar)/(\\\\w+).(php|jsp)');
INSERT INTO `rules` VALUES ('72', 'useragent', '(HTTrack|harvest|audit|dirbuster|pangolin|nmap|sqln|-scan|hydra|Parser|libwww|BBBike|sqlmap|w3af|owasp|Nikto|fimap|havij|PycURL|zmeu|BabyKrokodil|netsparker|httperf|bench)');
INSERT INTO `rules` VALUES ('73', 'whiteUrl', '/ftpxhoo/index.php');
INSERT INTO `rules` VALUES ('76', 'blackip', '205.155.74.83');
INSERT INTO `rules` VALUES ('77', 'blackip', '36.5.219.176');
INSERT INTO `rules` VALUES ('78', 'blackip', '112.220.133.212');
INSERT INTO `rules` VALUES ('79', 'blackip', '178.62.216.69');
INSERT INTO `rules` VALUES ('80', 'blackip', '103.210.237.21');
INSERT INTO `rules` VALUES ('81', 'blackip', '192.151.197.146');
INSERT INTO `rules` VALUES ('84', 'whiteip', '10.10.255.254');
INSERT INTO `rules` VALUES ('85', 'blackip', '149.28.225.84');
INSERT INTO `rules` VALUES ('86', 'blackip', '185.191.171.37');
INSERT INTO `rules` VALUES ('87', 'blackip', '45.116.120.4');
INSERT INTO `rules` VALUES ('88', 'blackip', '49.89.2.101');
INSERT INTO `rules` VALUES ('90', 'whiteip', '61.128.209.118');
INSERT INTO `rules` VALUES ('91', 'whiteip', '222.180.210.250');
INSERT INTO `rules` VALUES ('92', 'blackip', '154.16.168.99');
INSERT INTO `rules` VALUES ('93', 'blackip', '45.207.39.117');
INSERT INTO `rules` VALUES ('94', 'blackip', '31.19.90.225');
INSERT INTO `rules` VALUES ('95', 'blackip', '192.151.197.147');
INSERT INTO `rules` VALUES ('96', 'blackip', '46.105.101.5');
INSERT INTO `rules` VALUES ('97', 'blackip', '112.124.111.155');

-- ----------------------------
-- Table structure for site
-- ----------------------------
DROP TABLE IF EXISTS `site`;
CREATE TABLE `site` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `site_name` varchar(255) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `backend_addr` text,
  `ssl` varchar(10) NOT NULL DEFAULT 'off',
  `debug_level` varchar(10) NOT NULL DEFAULT 'error',
  `last_change` datetime DEFAULT NULL,
  `version` int(11) DEFAULT '1',
  `unreal_addr` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UQE_site_site_name` (`site_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of site
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'xieyuhua', 'fb7adc8a8d38318dec0161bf5e4a3489');

-- ----------------------------
-- Table structure for waf_log
-- ----------------------------
DROP TABLE IF EXISTS `waf_log`;
CREATE TABLE `waf_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_ip` varchar(100) DEFAULT NULL,
  `local_time` varchar(100) DEFAULT NULL,
  `server_name` varchar(100) DEFAULT NULL,
  `user_agent` varchar(200) DEFAULT NULL,
  `attack_type` varchar(200) DEFAULT NULL,
  `req_url` text,
  `req_data` text,
  `area` varchar(200) DEFAULT NULL,
  `rule_tag` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2625 DEFAULT CHARSET=utf8 COMMENT='拦截日志';

-- ----------------------------
-- Records of waf_log
-- ----------------------------
INSERT INTO `waf_log` VALUES ('1311', '61.151.178.164', '2022-05-07 18:08:44', 'min.azmks.com', 'Mozilla/5.0 (Linux; Android 6.0.1; OPPO R9s Build/MMB29M) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/37.0.0.0 Mobile MQQBrowser/6.9 TBS/036906 Safari/537.36 MicroMessenger/6.5.4.1000 Ne', '黑名单ip', '-', '_', '中国上海上海电信', '_');