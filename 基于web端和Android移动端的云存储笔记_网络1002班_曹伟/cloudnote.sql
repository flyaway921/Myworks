/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50067
Source Host           : localhost:3306
Source Database       : cloudnote

Target Server Type    : MYSQL
Target Server Version : 50067
File Encoding         : 65001

Date: 2013-03-03 12:02:40
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `advice`
-- ----------------------------
DROP TABLE IF EXISTS `advice`;
CREATE TABLE `advice` (
  `adviceid` int(11) NOT NULL auto_increment,
  `advice` varchar(255) default NULL,
  PRIMARY KEY  (`adviceid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of advice
-- ----------------------------
INSERT INTO `advice` VALUES ('1', '退热贴');
INSERT INTO `advice` VALUES ('2', '四十四舒服手动阀阿斯蒂芬阿斯蒂芬地方规定发给');
INSERT INTO `advice` VALUES ('3', '啦啦啦啦啦');

-- ----------------------------
-- Table structure for `note`
-- ----------------------------
DROP TABLE IF EXISTS `note`;
CREATE TABLE `note` (
  `noteid` int(11) NOT NULL auto_increment,
  `title` varchar(255) default NULL,
  `content` varchar(255) default NULL,
  `time` varchar(255) default NULL,
  `username` varchar(255) default NULL,
  PRIMARY KEY  (`noteid`),
  KEY `foreignkey` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of note
-- ----------------------------
INSERT INTO `note` VALUES ('204', '欢迎使用阿飞的蝶云笔记', '本作品由阿飞的蝶团队倾情创作。团队成员分别为：应君、曹伟、孙杭献，作品初衷用做于随时记录学习、日常事务。作品尚不完美，存在一定漏洞。如发现问题请及时联系我们。', '', 'cqf111');
INSERT INTO `note` VALUES ('206', '4266', '4566', '2013-03-02 23:20:57', '');
INSERT INTO `note` VALUES ('207', '我们', '   我能想到最浪漫的事就是和你一起慢慢变老。。。。。。', '2013-03-02 23:22:00', 'cqf111');
INSERT INTO `note` VALUES ('208', '1268', '2685', '2013-03-02 23:22:31', '');
INSERT INTO `note` VALUES ('209', '42655', '1111111', '2013-03-02 23:23:38', '');
INSERT INTO `note` VALUES ('211', '聚聚', '老鹿，手机端=已修改', '2013-03-03 09:54:24', '123');
INSERT INTO `note` VALUES ('217', 'JJ', 'la', '2013-03-02 23:50:47', '007');
INSERT INTO `note` VALUES ('220', '123', '123', '2013-03-03 00:14:55', '123456');
INSERT INTO `note` VALUES ('221', '欢迎使用阿飞的蝶云笔记', '本作品由阿飞的蝶团队倾情创作。团队成员分别为：应君、曹伟、孙杭献，作品初衷用做于随时记录学习、日常事务。作品尚不完美，存在一定漏洞。如发现问题请及时联系我们。', '', '005');
INSERT INTO `note` VALUES ('222', '欢迎使用阿飞的蝶云笔记', '本作品由阿飞的蝶团队倾情创作。团队成员分别为：应君、曹伟、孙杭献，作品初衷用做于随时记录学习、日常事务。作品尚不完美，存在一定漏洞。如发现问题请及时联系我们。', '', 'null');
INSERT INTO `note` VALUES ('223', '云笔记', '欢迎使用云笔记～', '2013-03-03 09:26:24', '258');
INSERT INTO `note` VALUES ('224', '你好', '你好', '2013-03-03 09:31:48', '123');
INSERT INTO `note` VALUES ('225', '我要起床了3333', '我要起床了', '2013-03-03 10:01:05', '123');
INSERT INTO `note` VALUES ('226', '欢迎使用阿飞的蝶云笔记', '本作品由阿飞的蝶团队倾情创作。团队成员分别为：应君、曹伟、孙杭献，作品初衷用做于随时记录学习、日常事务。作品尚不完美，存在一定漏洞。如发现问题请及时联系我们。', '', 'username2');
INSERT INTO `note` VALUES ('227', '第一个笔记', '这是我们的内容', '2013-03-03 10:10:48', 'username2');
INSERT INTO `note` VALUES ('229', '这是我的第一个笔记', '这是我的内容', '2013-03-03 10:16:22', 'username3');
INSERT INTO `note` VALUES ('230', '这是我的第二个笔记', '是内容能手机端', '2013-03-03 10:24:46', 'username3');
INSERT INTO `note` VALUES ('241', '欢迎使用阿飞的蝶云笔记', '本作品由阿飞的蝶团队倾情创作。团队成员分别为：应君、曹伟、孙杭献，作品初衷用做于随时记录学习、日常事务。作品尚不完美，存在一定漏洞。如发现问题请及时联系我们。', '', 'username01');
INSERT INTO `note` VALUES ('242', '这是我的第一个笔记', '这是内容', '2013-03-03 11:01:05', 'username01');
INSERT INTO `note` VALUES ('243', '这是我的第二个笔记', '内容', '2013-03-03 11:01:23', 'username01');
INSERT INTO `note` VALUES ('265', '阿飞的碟 团队', '团队成员：  曹伟，应君，孙杭献', '2013-03-03 11:58:05', 'caowei');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` int(11) NOT NULL auto_increment,
  `username` varchar(255) default NULL,
  `password` varchar(255) default NULL,
  `mail` varchar(255) default NULL,
  PRIMARY KEY  (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=gb2312;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('11', '提款机', 'w', 'fvg@vgf.dff');
INSERT INTO `user` VALUES ('12', '哈佛', 'q', 'vjhh@xgg.sdg');
INSERT INTO `user` VALUES ('13', '123', '123', '曹你大爷的成功没@tmd.com');
INSERT INTO `user` VALUES ('14', '123456', '123', 'dhy@ghd.dgj');
INSERT INTO `user` VALUES ('15', 'as11d', 'asddddd', 'yhh');
INSERT INTO `user` VALUES ('16', 'a1sd', 'asddddd', 'yhh');
INSERT INTO `user` VALUES ('17', '回来啦', 'q', 'cgghh@dff.cgh');
INSERT INTO `user` VALUES ('18', 'as1111d', 'asddddd', 'yhh');
INSERT INTO `user` VALUES ('19', 'as121d', 'asddddd', 'yhh');
INSERT INTO `user` VALUES ('20', '他妈', 'q', 'fhfs@gf.cg');
INSERT INTO `user` VALUES ('21', '007', '007', 'gd@ff.com');
INSERT INTO `user` VALUES ('22', '12', 'q', 'dty@af.dgh');
INSERT INTO `user` VALUES ('23', '147', '147', 'dfyy@gfd.fgh');
INSERT INTO `user` VALUES ('24', '1234', '1234', '123456@126.com');
INSERT INTO `user` VALUES ('25', 'aaa', 'aaa', 'sas@q.com');
INSERT INTO `user` VALUES ('26', 'qwe', '123', 'dggg@gfg.fgg');
INSERT INTO `user` VALUES ('27', 'qw', 'q', 'dyy@fyg.gu');
INSERT INTO `user` VALUES ('28', 'po', 'p', 'dghfg@fgdg.fhu');
INSERT INTO `user` VALUES ('29', 'as', '123', 'dugss@dgfg.chg');
INSERT INTO `user` VALUES ('30', 'df', '1', '13555@86.536');
INSERT INTO `user` VALUES ('31', 'g', '123', 'dog@gg.dh');
INSERT INTO `user` VALUES ('32', 'username', 'username', 'usermail@hotmail.com');
INSERT INTO `user` VALUES ('33', '111', '111', 'g@f.com');
INSERT INTO `user` VALUES ('34', 'qqq', 'qqq', '562145686@QQ.COM');
INSERT INTO `user` VALUES ('35', '006', '006', 'asdf@qq.com');
INSERT INTO `user` VALUES ('36', 'cqf111', 'cqf111', '11111111@qq.com');
INSERT INTO `user` VALUES ('37', '258', '258', 'dhjh@hhf.dhh');
INSERT INTO `user` VALUES ('38', '005', '005', '123@qq.com');
INSERT INTO `user` VALUES ('39', 'null', 'null', 'null');
INSERT INTO `user` VALUES ('40', 'username2', '123', 'ldjj@123.com');
INSERT INTO `user` VALUES ('41', 'username3', '123', 'mail@qq.com');
INSERT INTO `user` VALUES ('42', 'username01', '123', 'sss@mail.com');
INSERT INTO `user` VALUES ('43', 'caowei', '123', 'yun@mail.com');
