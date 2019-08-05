/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.7.17-log : Database - db_call
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_call` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `db_call`;

/*Table structure for table `t_a_client` */

DROP TABLE IF EXISTS `t_a_client`;

CREATE TABLE `t_a_client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `address` varchar(11) NOT NULL,
  `age` int(11) NOT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `phone` varchar(11) NOT NULL,
  `pwd` varchar(30) NOT NULL,
  `sex` int(11) NOT NULL,
  `true_name` varchar(30) NOT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `t_a_client` */

insert  into `t_a_client`(`id`,`address`,`age`,`create_date_time`,`name`,`phone`,`pwd`,`sex`,`true_name`,`state`) values (3,'河北省武安',18,'2019-08-05 16:04:05','18120400','19975260360','18120400',2,'小红',1),(4,'河北省邯郸',18,'2019-08-05 16:05:26','18120401','19975260370','18120401',1,'小明',2),(5,'Beijing',18,'2019-08-05 17:09:46','18120402','19975260380','123456',1,'Mike',1),(7,'hangzhou',18,'2019-08-06 00:23:46','1','13811111111','123456',1,'Jack',1),(8,'Hangzhou',18,'2019-08-06 00:48:41','2','13888888888','123456',2,'Nancy',1),(9,'Hangzhou',18,'2019-08-06 01:19:49','3','13833333333','123456',2,'Helen',1),(10,'Hangzhou',18,'2019-08-06 01:25:06','4','13844444444','123456',1,'Patrick',2);

/*Table structure for table `t_a_role` */

DROP TABLE IF EXISTS `t_a_role`;

CREATE TABLE `t_a_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `order_no` int(11) NOT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `update_date_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `t_a_role` */

insert  into `t_a_role`(`id`,`create_date_time`,`name`,`order_no`,`remark`,`update_date_time`) values (3,'2019-02-20 11:35:54','管理员',1,NULL,'2019-06-05 23:19:19'),(4,'2019-07-04 23:52:50','普通角色',2,'','2019-07-04 23:52:56');

/*Table structure for table `t_a_user` */

DROP TABLE IF EXISTS `t_a_user`;

CREATE TABLE `t_a_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `order_no` int(11) NOT NULL,
  `pwd` varchar(200) NOT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `true_name` varchar(200) NOT NULL,
  `update_date_time` datetime DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `image_url` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK76cs7cu4h4y8vc1vd4qyw36rt` (`role_id`),
  CONSTRAINT `FK76cs7cu4h4y8vc1vd4qyw36rt` FOREIGN KEY (`role_id`) REFERENCES `t_a_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_a_user` */

insert  into `t_a_user`(`id`,`create_date_time`,`name`,`order_no`,`pwd`,`remark`,`true_name`,`update_date_time`,`role_id`,`image_url`) values (1,'2019-02-18 08:40:27','admin',1,'ba61ce8fa1e3725876e6363c76043c8d',NULL,'陈豪','2019-07-04 23:53:30',3,'/static/upload_image/user_cover/20190608/20190608170739.jpg');

/*Table structure for table `t_call_record` */

DROP TABLE IF EXISTS `t_call_record`;

CREATE TABLE `t_call_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `initiator_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) DEFAULT NULL,
  `phone1` varchar(30) DEFAULT NULL,
  `phone2` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKglvk6n8odd9vb69tiyij0ddck` (`initiator_id`),
  KEY `FKjllddg047psc41vu9k4lr4d9h` (`receiver_id`),
  CONSTRAINT `FKglvk6n8odd9vb69tiyij0ddck` FOREIGN KEY (`initiator_id`) REFERENCES `t_a_client` (`id`),
  CONSTRAINT `FKjllddg047psc41vu9k4lr4d9h` FOREIGN KEY (`receiver_id`) REFERENCES `t_a_client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

/*Data for the table `t_call_record` */

insert  into `t_call_record`(`id`,`create_date_time`,`initiator_id`,`receiver_id`,`phone1`,`phone2`) values (7,'2019-08-05 16:05:43',4,3,'19975260370','19975260360'),(8,'2019-08-05 17:10:17',5,4,'19975260380','19975260370'),(9,'2019-08-05 17:21:23',3,4,'19975260360','19975260370'),(10,'2019-08-05 22:10:18',3,4,'19975260360','19975260370'),(11,'2019-08-05 22:20:45',3,5,'19975260360','19975260380'),(12,'2019-08-05 23:09:27',3,5,'19975260360','19975260380'),(13,'2019-08-05 23:21:08',3,5,'19975260360','19975260380'),(14,'2019-08-06 00:28:04',7,5,'13811111111','19975260380'),(15,'2019-08-06 00:49:18',8,5,'13888888888','19975260380'),(16,'2019-08-06 01:20:29',9,7,'13833333333','13811111111'),(17,'2019-08-06 01:26:27',10,7,'13844444444','13811111111');

/*Table structure for table `t_config` */

DROP TABLE IF EXISTS `t_config`;

CREATE TABLE `t_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `web_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_config` */

insert  into `t_config`(`id`,`web_name`) values (1,'CallManagementSystem');

/*Table structure for table `t_contacts` */

DROP TABLE IF EXISTS `t_contacts`;

CREATE TABLE `t_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `create_date_time` datetime DEFAULT NULL,
  `phone` varchar(11) NOT NULL,
  `true_name` varchar(11) NOT NULL,
  `create_client_id` int(11) DEFAULT NULL,
  `address` varchar(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKktp6x3x3iela7y9x1nn9ne7cw` (`create_client_id`),
  CONSTRAINT `FKktp6x3x3iela7y9x1nn9ne7cw` FOREIGN KEY (`create_client_id`) REFERENCES `t_a_client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

/*Data for the table `t_contacts` */

insert  into `t_contacts`(`id`,`create_date_time`,`phone`,`true_name`,`create_client_id`,`address`) values (5,'2019-08-05 16:07:07','19975260360','小红',4,'河北省武安'),(9,'2019-08-05 17:17:10','19975260380','Mike',4,'Beijing'),(13,'2019-08-06 00:51:23','13888888888','Nancy',5,'Hangzhou'),(14,'2019-08-06 01:26:51','13811111111','Jack',10,'Beijing'),(15,'2019-08-06 01:27:44','13844444444','Patrick',7,'Hanzghou');

/*Table structure for table `t_menu` */

DROP TABLE IF EXISTS `t_menu`;

CREATE TABLE `t_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `div_id` varchar(50) DEFAULT NULL,
  `icon` varchar(100) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `p_id` int(11) DEFAULT NULL,
  `permissions` varchar(100) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `url` varchar(200) DEFAULT NULL,
  `order_no` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

/*Data for the table `t_menu` */

insert  into `t_menu`(`id`,`div_id`,`icon`,`name`,`p_id`,`permissions`,`state`,`type`,`url`,`order_no`) values (1,'','','基本维护',-1,'',0,0,'',1),(2,'user_manage','&#xe67a;','用户管理',1,'用户管理',1,1,'/houtai/user/manage',1),(3,'','','Function',-1,'',0,0,'',2),(4,'trial','&#xe67a;','Complaint management ',3,'申诉管理',1,0,'/houtai/trial/manage',1),(5,'role_manage','&#xe67a;','角色管理',1,'角色管理',1,0,'/houtai/role/manage',2),(6,'menu_manage','&#xe67a;','菜单管理',1,'菜单管理',1,0,'/houtai/menu/manage?pId=-1',3),(7,'user','&#xe67a;','User management\r\n',3,'注册用户管理',1,0,'/houtai/client/manage',2),(8,'lunbo','&#xe67a;','Bulletin management',3,'公告管理',1,0,'/houtai/notice/manage',3),(9,'link','&#xe67a;','友情链接',3,'友情链接',1,0,'/houtai/link/manage',4),(10,'config','&#xe67a;','网站配置',1,'网站配置',1,0,'/houtai/config/manage',4);

/*Table structure for table `t_notice` */

DROP TABLE IF EXISTS `t_notice`;

CREATE TABLE `t_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(100) DEFAULT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `t_notice` */

insert  into `t_notice`(`id`,`content`,`create_date_time`,`title`) values (1,'The system is maintaining','2019-08-06 01:30:29','Maintaining');

/*Table structure for table `t_role_menu` */

DROP TABLE IF EXISTS `t_role_menu`;

CREATE TABLE `t_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhayg4ib6v7h1wyeyxhq6xlddq` (`menu_id`),
  KEY `FKsonb0rbt2u99hbrqqvv3r0wse` (`role_id`),
  CONSTRAINT `FKhayg4ib6v7h1wyeyxhq6xlddq` FOREIGN KEY (`menu_id`) REFERENCES `t_menu` (`id`),
  CONSTRAINT `FKsonb0rbt2u99hbrqqvv3r0wse` FOREIGN KEY (`role_id`) REFERENCES `t_a_role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

/*Data for the table `t_role_menu` */

insert  into `t_role_menu`(`id`,`menu_id`,`role_id`) values (69,3,3),(70,4,3),(71,7,3),(72,8,3);

/*Table structure for table `t_trial` */

DROP TABLE IF EXISTS `t_trial`;

CREATE TABLE `t_trial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(30) DEFAULT NULL,
  `create_date_time` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `applicant_id` int(11) DEFAULT NULL,
  `call_record_id` int(11) DEFAULT NULL,
  `remark` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKj05foseb1epu80egpnhkllefr` (`applicant_id`),
  KEY `FK2wj84cw98f4fkjrbg79cgq25i` (`call_record_id`),
  CONSTRAINT `FK2wj84cw98f4fkjrbg79cgq25i` FOREIGN KEY (`call_record_id`) REFERENCES `t_call_record` (`id`),
  CONSTRAINT `FKj05foseb1epu80egpnhkllefr` FOREIGN KEY (`applicant_id`) REFERENCES `t_a_client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `t_trial` */

insert  into `t_trial`(`id`,`content`,`create_date_time`,`state`,`applicant_id`,`call_record_id`,`remark`) values (3,'他骚扰我','2019-08-05 16:10:27',1,3,7,'Successful'),(4,'He','2019-08-05 17:15:30',1,4,8,'successful'),(5,'Harrassing Phone','2019-08-06 00:51:44',1,5,15,'Successfully'),(6,'Harrassing Phone','2019-08-06 01:28:05',1,7,17,'Successfully');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
