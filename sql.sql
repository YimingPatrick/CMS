/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.7.17-log : Database - db_pet_manage
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_pet_manage` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_pet_manage`;

/*Table structure for table `t_config` */

DROP TABLE IF EXISTS `t_config`;

CREATE TABLE `t_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain_name` varchar(100) DEFAULT NULL,
  `web_site` varchar(200) DEFAULT NULL,
  `headStr` text,
  `layuiStr` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_config` */

insert  into `t_config`(`id`,`domain_name`,`web_site`,`headStr`,`layuiStr`) values (1,'宠物管理系统','http://www.###.com','<!-- 强制  高速模式 渲染网页    -->\n<meta NAME=”renderer” content=”webkit”>\n<!-- 强制  高速模式 渲染网页    -->\n\n<link href=\"/static/favicon.ico\" rel=\"shortcut icon\" />\n\n<!--添加  jq  支持加载-->\n<script	src=\"/static/easy-ui/jquery.min.js\"></script>\n<!--添加  jq  支持加载-->','<!--添加 layui  支持加载-->\n<link rel=\"stylesheet\"	href=\"/static/layui-v2.2.5/layui/css/layui.css\">\n<script	src=\"/static/layui-v2.2.5/layui/layui.js\"></script>\n<!--添加 layui  支持加载-->');

/*Table structure for table `t_jiyang` */

DROP TABLE IF EXISTS `t_jiyang`;

CREATE TABLE `t_jiyang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `petTypeId` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `character_` varchar(100) DEFAULT NULL,
  `healthy` int(11) DEFAULT NULL,
  `createUserId` int(11) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  `selectUserId` int(11) DEFAULT NULL,
  `selectDateTime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_jiyang` */

/*Table structure for table `t_pet` */

DROP TABLE IF EXISTS `t_pet`;

CREATE TABLE `t_pet` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `petTypeId` int(11) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `healthy` int(11) DEFAULT NULL,
  `yimiao` int(5) DEFAULT NULL,
  `character_` varchar(10) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `shopId` int(11) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  `selectUserId` int(11) DEFAULT NULL,
  `selectDateTime` datetime DEFAULT NULL,
  `buyState` int(5) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_pet` */

/*Table structure for table `t_shop` */

DROP TABLE IF EXISTS `t_shop`;

CREATE TABLE `t_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `orderNo` int(11) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Data for the table `t_shop` */

insert  into `t_shop`(`id`,`name`,`address`,`orderNo`,`createDateTime`) values (1,'小明的店','中国路',1,'2018-10-07 18:00:02'),(2,'杂货店','中兴路',2,'2018-10-08 09:18:51');

/*Table structure for table `t_tree` */

DROP TABLE IF EXISTS `t_tree`;

CREATE TABLE `t_tree` (
  `id` int(11) DEFAULT NULL,
  `text` varchar(46) DEFAULT NULL,
  `father` int(11) DEFAULT NULL,
  `url` varchar(500) DEFAULT NULL,
  `state` varchar(46) DEFAULT NULL,
  `iconCls` varchar(46) DEFAULT NULL,
  `permissions` varchar(100) DEFAULT NULL,
  `dd_id` varchar(46) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_tree` */

insert  into `t_tree`(`id`,`text`,`father`,`url`,`state`,`iconCls`,`permissions`,`dd_id`) values (6,'信息管理',-1,NULL,'close',NULL,NULL,NULL),(61010,'门店管理',6,'/houtai/shop/manage','opend','&#xe63c;',NULL,'shop'),(61013,'出售的宠物管理',6,'/houtai/pet/manage','opend','&#xe612;',NULL,'pet'),(61015,'我的领养的',6,'/houtai/jiyang/my','opend','&#xe612;',NULL,'my_pet'),(61014,'寄养市场',6,'/houtai/jiyang/shop','opend','&#xe612;',NULL,'jiyang_shop'),(61006,'用户管理',6,'/houtai/user/manage','opend','&#xe612;',NULL,'user'),(61011,'宠物类型管理',6,'/houtai/type/manage','opend','&#xe612;',NULL,'type'),(61017,'出售中的宠物',6,'/houtai/pet/shop','opend','&#xe612;',NULL,'shop'),(61020,'我购买的宠物',6,'/houtai/pet/buy','opend','&#xe612;',NULL,'buy');

/*Table structure for table `t_type` */

DROP TABLE IF EXISTS `t_type`;

CREATE TABLE `t_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `t_type` */

insert  into `t_type`(`id`,`name`) values (1,'小狗'),(2,'小猫'),(3,'水族'),(5,'飞禽');

/*Table structure for table `t_user` */

DROP TABLE IF EXISTS `t_user`;

CREATE TABLE `t_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num_` varchar(60) DEFAULT NULL,
  `trueName` varchar(60) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `sex_` varchar(10) DEFAULT NULL,
  `menuIds` varchar(100) DEFAULT NULL,
  `createDateTime` datetime DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `type` int(5) DEFAULT NULL,
  `sfz` varchar(200) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `weiyi` (`num_`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `t_user` */

insert  into `t_user`(`id`,`num_`,`trueName`,`phone`,`sex_`,`menuIds`,`createDateTime`,`password`,`remark`,`type`,`sfz`,`address`) values (9,'admin','管理员','18337537555','男','6,61006,61010,61011,61013','2018-06-23 15:50:59','0680d00353f3555fe7c01f11ed89bf8b','2',1,'1','address!!');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
