/*
 Navicat Premium Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 80400
 Source Host           : localhost:3306
 Source Schema         : my_db

 Target Server Type    : MySQL
 Target Server Version : 80400
 File Encoding         : 65001

 Date: 01/01/2025 19:40:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for transaction
-- ----------------------------
DROP TABLE IF EXISTS `transaction`;
CREATE TABLE `transaction`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '消费记录id',
  `userId` bigint NOT NULL COMMENT '会员ID',
  `amount` decimal(10, 2) NOT NULL COMMENT '消费金额',
  `transactionDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL COMMENT '消费描述',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_memberId`(`userId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1016 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '消费记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of transaction
-- ----------------------------
INSERT INTO `transaction` VALUES (1, 1850893537785413633, 88.55, '2024-05-05 11:11:17', 'A query is used to extract data from the database in a readable format according                    ', '2007-03-21 19:28:39', '2009-09-28 21:48:46', 0);
INSERT INTO `transaction` VALUES (2, 1850893537785413633, 74.31, '2017-02-08 17:14:47', 'Navicat Monitor can be installed on any local computer or virtual machine and does                  ', '2022-12-13 20:49:38', '2013-07-28 10:58:39', 0);
INSERT INTO `transaction` VALUES (3, 1872918850270760961, 29.97, '2005-02-17 19:43:31', 'The reason why a great man is great is that he resolves to be a great man.', '2011-01-05 14:55:34', '2008-02-23 20:49:26', 0);
INSERT INTO `transaction` VALUES (4, 1850893537785413633, 74.76, '2002-11-06 00:01:53', 'Always keep your eyes open. Keep watching. Because whatever you see can inspire you.', '2013-03-17 13:12:25', '2012-04-23 11:03:06', 0);
INSERT INTO `transaction` VALUES (5, 1850893537785413633, 1.12, '2002-10-01 14:30:17', 'HTTP Tunneling is a method for connecting to a server that uses the same protocol                   ', '2001-02-12 02:48:19', '2005-02-12 00:47:06', 0);
INSERT INTO `transaction` VALUES (6, 1872918850270760961, 19.56, '2019-06-01 20:49:54', 'It wasn’t raining when Noah built the ark. It can also manage cloud databases such                ', '2003-07-07 16:22:37', '2022-04-03 19:48:20', 0);
INSERT INTO `transaction` VALUES (7, 1872918850270760961, 17.54, '2022-04-09 18:07:52', 'All journeys have secret destinations of which the traveler is unaware.                             ', '2010-02-26 04:09:18', '2000-08-06 05:28:18', 0);
INSERT INTO `transaction` VALUES (8, 1872918850270760961, 28.55, '2013-08-23 16:34:02', 'It provides strong authentication and secure encrypted communications between two                   ', '2024-11-03 11:54:47', '2007-11-04 21:43:25', 0);
INSERT INTO `transaction` VALUES (9, 1872918850270760961, 64.52, '2018-11-16 12:23:19', 'Secure SHell (SSH) is a program to log in into another computer over a network, execute             ', '2008-08-23 22:34:59', '2022-07-05 05:06:35', 0);
INSERT INTO `transaction` VALUES (10, 1850893537785413633, 97.50, '2005-05-22 05:48:44', 'It provides strong authentication and secure encrypted communications between two                   ', '2012-07-09 01:37:29', '2018-02-01 18:12:10', 0);
INSERT INTO `transaction` VALUES (11, 1872918850270760961, 63.90, '2004-08-21 12:45:03', 'Navicat provides powerful tools for working with queries: Query Editor for editing                  ', '2009-04-30 20:07:50', '2011-06-07 11:44:29', 0);
INSERT INTO `transaction` VALUES (12, 1872918850270760961, 77.34, '2018-11-11 07:51:12', 'SQL Editor allows you to create and edit SQL text, prepare and execute selected queries.', '2020-04-16 21:28:18', '2020-09-10 11:18:08', 0);
INSERT INTO `transaction` VALUES (13, 1850893537785413633, 86.37, '2024-12-24 10:18:18', 'I will greet this day with love in my heart. Actually it is just in an idea when                    ', '2024-01-21 03:46:02', '2003-07-13 14:27:09', 0);
INSERT INTO `transaction` VALUES (14, 1850893537785413633, 61.71, '2018-12-25 20:01:50', 'To successfully establish a new connection to local/remote server - no matter via                   ', '2010-03-03 14:32:51', '2023-12-19 10:40:45', 0);
INSERT INTO `transaction` VALUES (15, 1872918850270760961, 7.68, '2007-12-30 23:05:56', 'In the middle of winter I at last discovered that there was in me an invincible summer.             ', '2011-10-28 20:46:20', '2018-12-03 05:16:59', 0);
INSERT INTO `transaction` VALUES (16, 1872918850270760961, 46.59, '2016-12-21 01:13:21', 'If it scares you, it might be a good thing to try.', '2023-10-02 18:55:55', '2015-03-19 01:42:42', 0);
INSERT INTO `transaction` VALUES (17, 1850893537785413633, 42.27, '2012-03-09 07:33:24', 'To connect to a database or schema, simply double-click it in the pane.                             ', '2004-06-09 20:31:53', '2017-07-27 11:24:35', 0);
INSERT INTO `transaction` VALUES (18, 1850893537785413633, 88.82, '2021-06-09 00:19:51', 'Sometimes you win, sometimes you learn.', '2017-06-13 08:20:13', '2002-12-10 16:14:36', 0);
INSERT INTO `transaction` VALUES (19, 1872918850270760961, 71.11, '2013-12-27 21:58:55', 'To successfully establish a new connection to local/remote server - no matter via                   ', '2022-08-21 03:03:53', '2006-10-08 17:23:52', 0);
INSERT INTO `transaction` VALUES (20, 1872918850270760961, 35.77, '2011-09-30 17:11:21', 'Creativity is intelligence having fun. The Navigation pane employs tree structure                   ', '2006-06-10 03:48:34', '2005-01-26 16:04:00', 0);
INSERT INTO `transaction` VALUES (21, 1872918850270760961, 90.27, '2013-04-22 14:29:33', 'Export Wizard allows you to export data from tables, collections, views, or query                   ', '2018-11-06 03:15:56', '2020-02-11 13:17:15', 0);
INSERT INTO `transaction` VALUES (22, 1850893537785413633, 35.35, '2007-05-21 22:51:19', 'To open a query using an external editor, control-click it and select Open with External            ', '2008-01-26 20:05:00', '2004-05-03 16:42:21', 0);
INSERT INTO `transaction` VALUES (23, 1850893537785413633, 4.60, '2017-02-02 13:20:40', 'If you wait, all that happens is you get older. The On Startup feature allows you                   ', '2004-06-11 03:19:51', '2021-02-13 09:55:17', 0);
INSERT INTO `transaction` VALUES (24, 1850893537785413633, 5.23, '2005-11-09 14:33:28', 'You can select any connections, objects or projects, and then select the corresponding              ', '2009-02-08 01:04:10', '2004-11-25 17:29:19', 0);
INSERT INTO `transaction` VALUES (25, 1850893537785413633, 37.21, '2022-01-28 15:03:19', 'Import Wizard allows you to import data to tables/collections from CSV, TXT, XML, DBF and more.', '2010-02-07 13:11:30', '2004-11-21 10:52:58', 0);
INSERT INTO `transaction` VALUES (26, 1872918850270760961, 54.82, '2008-06-24 05:45:45', 'I may not have gone where I intended to go, but I think I have ended up where I needed to be.', '2021-02-09 01:33:20', '2007-04-19 09:10:05', 0);
INSERT INTO `transaction` VALUES (27, 1872918850270760961, 28.02, '2023-11-04 05:21:52', 'The Synchronize to Database function will give you a full picture of all database differences.', '2015-08-29 13:58:53', '2002-02-24 19:58:44', 0);
INSERT INTO `transaction` VALUES (28, 1872918850270760961, 66.57, '2024-06-19 07:02:39', 'All journeys have secret destinations of which the traveler is unaware.', '2005-08-02 17:15:51', '2007-11-05 21:18:50', 0);
INSERT INTO `transaction` VALUES (29, 1850893537785413633, 86.11, '2011-06-22 15:15:54', 'Navicat Cloud could not connect and access your databases. By which it means, it                    ', '2014-11-25 11:27:56', '2016-01-20 06:50:43', 0);
INSERT INTO `transaction` VALUES (30, 1850893537785413633, 74.52, '2015-03-08 07:32:23', 'Navicat provides powerful tools for working with queries: Query Editor for editing                  ', '2024-09-30 09:44:29', '2024-08-20 21:13:23', 0);
INSERT INTO `transaction` VALUES (31, 1850893537785413633, 58.12, '2007-05-28 22:08:05', 'The reason why a great man is great is that he resolves to be a great man.', '2007-04-07 00:58:58', '2015-11-30 20:39:50', 0);
INSERT INTO `transaction` VALUES (32, 1850893537785413633, 41.05, '2018-12-13 13:40:27', 'To clear or reload various internal caches, flush tables, or acquire locks, control-click           ', '2008-10-17 13:00:53', '2008-03-01 14:26:04', 0);
INSERT INTO `transaction` VALUES (33, 1850893537785413633, 65.60, '2008-10-02 19:45:55', 'HTTP Tunneling is a method for connecting to a server that uses the same protocol                   ', '2020-02-09 09:52:17', '2005-12-29 13:43:49', 0);
INSERT INTO `transaction` VALUES (34, 1872918850270760961, 69.28, '2013-07-06 01:52:18', 'The Synchronize to Database function will give you a full picture of all database differences.', '2014-04-07 05:29:29', '2024-01-12 19:38:01', 0);
INSERT INTO `transaction` VALUES (35, 1872918850270760961, 53.63, '2006-09-15 09:46:29', 'The Navigation pane employs tree structure which allows you to take action upon the                 ', '2012-01-05 07:41:05', '2003-08-12 00:24:26', 0);
INSERT INTO `transaction` VALUES (36, 1872918850270760961, 96.86, '2019-03-21 03:52:59', 'Secure Sockets Layer(SSL) is a protocol for transmitting private documents via the Internet.', '2012-07-22 16:33:36', '2021-07-13 20:51:37', 0);
INSERT INTO `transaction` VALUES (37, 1850893537785413633, 58.65, '2001-03-16 03:31:54', 'The repository database can be an existing MySQL, MariaDB, PostgreSQL, SQL Server,                  ', '2006-11-25 15:03:44', '2001-04-30 04:17:25', 0);
INSERT INTO `transaction` VALUES (38, 1850893537785413633, 83.81, '2008-11-30 03:57:23', 'The past has no power over the present moment. To successfully establish a new connection           ', '2022-04-17 22:24:04', '2022-11-19 06:32:28', 0);
INSERT INTO `transaction` VALUES (39, 1872918850270760961, 48.76, '2003-04-13 10:04:21', 'Success consists of going from failure to failure without loss of enthusiasm.', '2023-08-01 19:17:51', '2020-01-12 21:09:44', 0);
INSERT INTO `transaction` VALUES (40, 1872918850270760961, 91.59, '2008-01-25 12:21:41', 'Typically, it is employed as an encrypted version of Telnet. The On Startup feature                 ', '2009-05-22 00:38:19', '2017-09-15 21:21:55', 0);
INSERT INTO `transaction` VALUES (41, 1850893537785413633, 30.02, '2016-01-19 15:48:39', 'Anyone who has never made a mistake has never tried anything new.', '2024-02-03 23:34:06', '2024-05-28 16:39:09', 0);
INSERT INTO `transaction` VALUES (42, 1872918850270760961, 51.36, '2021-05-24 18:38:57', 'The On Startup feature allows you to control what tabs appear when you launch Navicat.', '2011-09-07 10:02:42', '2014-06-14 15:29:49', 0);
INSERT INTO `transaction` VALUES (43, 1850893537785413633, 10.09, '2012-08-31 00:31:25', 'Navicat Monitor requires a repository to store alerts and metrics for historical analysis.', '2007-12-29 17:35:58', '2009-05-06 15:28:37', 0);
INSERT INTO `transaction` VALUES (44, 1850893537785413633, 22.85, '2022-07-15 22:13:34', 'In other words, Navicat provides the ability for data in different databases and/or                 ', '2020-05-31 05:08:42', '2015-01-31 01:00:00', 0);
INSERT INTO `transaction` VALUES (45, 1850893537785413633, 5.57, '2007-10-06 22:45:50', 'Difficult circumstances serve as a textbook of life for people. Such sessions are                   ', '2011-12-19 12:41:47', '2010-07-01 14:51:08', 0);
INSERT INTO `transaction` VALUES (46, 1872918850270760961, 53.43, '2002-11-26 18:43:15', 'You cannot save people, you can just love them. Navicat Cloud provides a cloud service              ', '2010-08-30 22:08:49', '2024-05-30 08:12:38', 0);
INSERT INTO `transaction` VALUES (47, 1850893537785413633, 37.39, '2009-01-20 15:54:30', 'I may not have gone where I intended to go, but I think I have ended up where I needed to be.', '2024-06-22 12:20:04', '2012-12-21 19:15:47', 0);
INSERT INTO `transaction` VALUES (48, 1850893537785413633, 24.47, '2006-10-22 21:17:46', 'It can also manage cloud databases such as Amazon Redshift, Amazon RDS, Alibaba Cloud.              ', '2023-08-27 12:29:36', '2009-08-05 06:26:15', 0);
INSERT INTO `transaction` VALUES (49, 1872918850270760961, 20.34, '2001-09-03 15:41:07', 'A comfort zone is a beautiful place, but nothing ever grows there.', '2022-03-23 10:47:16', '2006-05-14 06:47:48', 0);
INSERT INTO `transaction` VALUES (50, 1850893537785413633, 14.15, '2008-06-09 14:20:21', 'Navicat Cloud could not connect and access your databases. By which it means, it                    ', '2013-07-30 12:18:52', '2003-12-05 23:30:41', 0);
INSERT INTO `transaction` VALUES (51, 1850893537785413633, 40.56, '2022-07-15 00:41:40', 'The On Startup feature allows you to control what tabs appear when you launch Navicat.', '2021-06-08 05:24:10', '2022-08-14 12:12:56', 0);
INSERT INTO `transaction` VALUES (52, 1872918850270760961, 2.84, '2005-12-06 00:56:57', 'The Main Window consists of several toolbars and panes for you to work on connections,              ', '2011-06-10 03:30:06', '2004-09-07 07:33:46', 0);
INSERT INTO `transaction` VALUES (53, 1872918850270760961, 83.18, '2010-12-19 08:50:05', 'Navicat provides a wide range advanced features, such as compelling code editing                    ', '2004-07-17 10:17:20', '2006-11-12 03:39:11', 0);
INSERT INTO `transaction` VALUES (54, 1872918850270760961, 47.11, '2000-04-08 02:09:25', 'Success consists of going from failure to failure without loss of enthusiasm.', '2018-11-24 13:48:46', '2008-01-19 14:47:20', 0);
INSERT INTO `transaction` VALUES (55, 1872918850270760961, 33.08, '2020-05-14 23:45:50', 'Anyone who has ever made anything of importance was disciplined. Actually it is just                ', '2016-10-27 19:06:40', '2009-03-12 22:31:42', 0);
INSERT INTO `transaction` VALUES (56, 1850893537785413633, 47.74, '2014-03-12 02:37:47', 'All the Navicat Cloud objects are located under different projects. You can share                   ', '2009-09-01 03:44:17', '2006-10-21 13:59:05', 0);
INSERT INTO `transaction` VALUES (57, 1872918850270760961, 38.70, '2016-10-29 14:09:19', 'With its well-designed Graphical User Interface(GUI), Navicat lets you quickly and                  ', '2023-12-05 10:51:05', '2021-12-01 20:30:38', 0);
INSERT INTO `transaction` VALUES (58, 1850893537785413633, 39.71, '2020-10-16 09:00:09', 'SSH serves to prevent such vulnerabilities and allows you to access a remote server\'s               ', '2023-02-19 17:04:15', '2010-10-28 02:33:46', 0);
INSERT INTO `transaction` VALUES (59, 1850893537785413633, 10.49, '2003-04-16 04:07:47', 'If you wait, all that happens is you get older.', '2009-12-10 18:41:22', '2004-11-12 21:40:42', 0);
INSERT INTO `transaction` VALUES (60, 1872918850270760961, 52.26, '2000-05-07 20:27:14', 'The Main Window consists of several toolbars and panes for you to work on connections,              ', '2019-05-05 18:30:06', '2011-10-13 15:34:48', 0);
INSERT INTO `transaction` VALUES (61, 1872918850270760961, 94.41, '2019-12-29 04:38:46', 'How we spend our days is, of course, how we spend our lives. It is used while your                  ', '2020-08-20 18:05:04', '2005-12-28 00:09:12', 0);
INSERT INTO `transaction` VALUES (62, 1850893537785413633, 3.03, '2017-12-15 14:27:02', 'SQL Editor allows you to create and edit SQL text, prepare and execute selected queries.', '2017-04-06 08:14:37', '2018-06-21 21:28:34', 0);
INSERT INTO `transaction` VALUES (63, 1872918850270760961, 23.40, '2024-01-26 09:18:49', 'To clear or reload various internal caches, flush tables, or acquire locks, control-click           ', '2022-05-03 12:14:31', '2002-10-21 16:13:33', 0);
INSERT INTO `transaction` VALUES (64, 1850893537785413633, 59.62, '2001-06-11 14:58:59', 'How we spend our days is, of course, how we spend our lives. Import Wizard allows                   ', '2016-04-10 14:09:03', '2022-01-28 23:02:18', 0);
INSERT INTO `transaction` VALUES (65, 1850893537785413633, 72.41, '2016-04-07 15:03:47', 'To successfully establish a new connection to local/remote server - no matter via                   ', '2018-10-09 14:37:28', '2021-02-19 09:07:26', 0);
INSERT INTO `transaction` VALUES (66, 1850893537785413633, 93.93, '2011-03-06 08:10:55', 'You can select any connections, objects or projects, and then select the corresponding              ', '2009-08-05 13:03:19', '2013-11-11 10:53:17', 0);
INSERT INTO `transaction` VALUES (67, 1872918850270760961, 52.10, '2002-08-04 02:28:44', 'How we spend our days is, of course, how we spend our lives. The Information Pane                   ', '2012-11-13 15:30:01', '2003-10-17 22:08:42', 0);
INSERT INTO `transaction` VALUES (68, 1872918850270760961, 27.65, '2002-04-10 20:55:30', 'Navicat allows you to transfer data from one database and/or schema to another with                 ', '2011-03-14 21:37:19', '2024-08-01 15:19:17', 0);
INSERT INTO `transaction` VALUES (69, 1850893537785413633, 59.15, '2003-03-18 01:18:31', 'If the plan doesn’t work, change the plan, but never the goal. The Navigation pane                ', '2017-02-16 03:56:37', '2014-09-18 18:27:54', 0);
INSERT INTO `transaction` VALUES (70, 1850893537785413633, 8.66, '2023-10-30 14:09:07', 'Navicat authorizes you to make connection to remote servers running on different                    ', '2007-06-05 02:40:25', '2007-02-12 03:30:38', 0);
INSERT INTO `transaction` VALUES (71, 1850893537785413633, 53.22, '2002-09-06 07:38:08', 'In the middle of winter I at last discovered that there was in me an invincible summer.', '2001-01-02 21:12:17', '2006-01-19 13:18:34', 0);
INSERT INTO `transaction` VALUES (72, 1872918850270760961, 66.32, '2010-05-05 15:42:08', 'Remember that failure is an event, not a person. Sometimes you win, sometimes you learn.', '2015-02-07 10:51:51', '2012-09-14 16:49:01', 0);
INSERT INTO `transaction` VALUES (73, 1872918850270760961, 85.79, '2009-09-30 19:06:34', 'To successfully establish a new connection to local/remote server - no matter via                   ', '2002-04-26 15:50:09', '2009-05-16 00:44:58', 0);
INSERT INTO `transaction` VALUES (74, 1850893537785413633, 54.36, '2019-05-16 23:47:39', 'To connect to a database or schema, simply double-click it in the pane.                             ', '2011-02-23 09:44:05', '2014-10-24 06:39:35', 0);
INSERT INTO `transaction` VALUES (75, 1872918850270760961, 68.52, '2016-08-14 15:37:51', 'You can select any connections, objects or projects, and then select the corresponding              ', '2020-11-03 11:51:49', '2012-06-29 23:55:16', 0);
INSERT INTO `transaction` VALUES (76, 1872918850270760961, 3.74, '2007-07-15 01:30:36', 'Actually it is just in an idea when feel oneself can achieve and cannot achieve.', '2019-07-25 20:17:46', '2011-07-11 15:16:11', 0);
INSERT INTO `transaction` VALUES (77, 1872918850270760961, 92.59, '2006-09-30 19:51:22', 'Remember that failure is an event, not a person. The Information Pane shows the detailed            ', '2023-10-28 00:52:05', '2012-09-27 18:48:23', 0);
INSERT INTO `transaction` VALUES (78, 1850893537785413633, 75.49, '2023-07-14 19:40:13', 'All the Navicat Cloud objects are located under different projects. You can share                   ', '2000-05-20 17:39:30', '2021-10-14 17:44:18', 0);
INSERT INTO `transaction` VALUES (79, 1850893537785413633, 39.95, '2001-02-14 17:36:26', 'Navicat Cloud provides a cloud service for synchronizing connections, queries, model                ', '2014-07-14 20:45:25', '2010-08-08 13:45:35', 0);
INSERT INTO `transaction` VALUES (80, 1872918850270760961, 94.99, '2011-02-10 14:52:49', 'To get a secure connection, the first thing you need to do is to install OpenSSL                    ', '2016-10-20 13:57:17', '2008-12-04 01:27:12', 0);
INSERT INTO `transaction` VALUES (81, 1850893537785413633, 94.41, '2022-11-11 20:44:46', 'Secure Sockets Layer(SSL) is a protocol for transmitting private documents via the Internet.', '2023-06-02 03:15:01', '2006-06-18 18:51:35', 0);
INSERT INTO `transaction` VALUES (82, 1872918850270760961, 99.06, '2016-11-17 23:24:34', 'In a Telnet session, all communications, including username and password, are transmitted           ', '2004-03-19 00:04:50', '2001-11-25 03:14:20', 0);
INSERT INTO `transaction` VALUES (83, 1850893537785413633, 59.81, '2007-08-17 06:40:49', 'Export Wizard allows you to export data from tables, collections, views, or query                   ', '2007-09-25 06:21:23', '2022-12-10 17:32:42', 0);
INSERT INTO `transaction` VALUES (84, 1850893537785413633, 78.75, '2013-03-21 03:59:56', 'Import Wizard allows you to import data to tables/collections from CSV, TXT, XML, DBF and more.', '2014-07-26 02:59:12', '2005-06-21 19:09:08', 0);
INSERT INTO `transaction` VALUES (85, 1872918850270760961, 73.13, '2010-06-01 20:37:27', 'In other words, Navicat provides the ability for data in different databases and/or                 ', '2016-08-28 10:12:24', '2010-01-02 17:21:03', 0);
INSERT INTO `transaction` VALUES (86, 1872918850270760961, 35.22, '2007-08-08 12:00:12', 'To get a secure connection, the first thing you need to do is to install OpenSSL                    ', '2021-06-30 20:57:06', '2014-03-10 19:09:19', 0);
INSERT INTO `transaction` VALUES (87, 1872918850270760961, 92.59, '2014-08-05 09:03:51', 'Navicat allows you to transfer data from one database and/or schema to another with                 ', '2014-10-30 05:25:19', '2020-08-16 06:36:02', 0);
INSERT INTO `transaction` VALUES (88, 1872918850270760961, 3.83, '2004-01-19 09:32:16', 'Navicat Monitor is a safe, simple and agentless remote server monitoring tool that                  ', '2019-09-04 11:15:49', '2023-01-30 19:54:40', 0);
INSERT INTO `transaction` VALUES (89, 1872918850270760961, 23.92, '2018-03-19 19:33:49', 'It provides strong authentication and secure encrypted communications between two                   ', '2016-09-19 12:24:38', '2001-05-22 00:09:22', 0);
INSERT INTO `transaction` VALUES (90, 1850893537785413633, 76.39, '2012-07-20 15:19:30', 'HTTP Tunneling is a method for connecting to a server that uses the same protocol                   ', '2014-01-10 10:25:11', '2005-05-20 15:28:39', 0);
INSERT INTO `transaction` VALUES (91, 1850893537785413633, 68.42, '2004-09-15 23:06:37', 'Navicat Data Modeler is a powerful and cost-effective database design tool which                    ', '2010-09-02 17:30:48', '2002-03-19 09:38:20', 0);
INSERT INTO `transaction` VALUES (92, 1872918850270760961, 73.76, '2018-05-16 11:03:48', 'The Navigation pane employs tree structure which allows you to take action upon the                 ', '2021-12-24 17:06:24', '2007-01-31 16:23:26', 0);
INSERT INTO `transaction` VALUES (93, 1850893537785413633, 72.23, '2019-05-23 10:36:26', 'If it scares you, it might be a good thing to try. SSH serves to prevent such vulnerabilities       ', '2019-06-11 06:23:10', '2014-04-09 08:25:50', 0);
INSERT INTO `transaction` VALUES (94, 1850893537785413633, 8.04, '2014-03-12 15:48:12', 'A query is used to extract data from the database in a readable format according                    ', '2018-08-26 11:15:23', '2000-11-05 22:50:47', 0);
INSERT INTO `transaction` VALUES (95, 1872918850270760961, 9.96, '2000-05-26 17:52:13', 'Optimism is the one quality more associated with success and happiness than any other.', '2021-04-05 10:24:30', '2024-07-24 01:24:27', 0);
INSERT INTO `transaction` VALUES (96, 1872918850270760961, 7.18, '2013-10-07 07:30:23', 'Navicat Monitor can be installed on any local computer or virtual machine and does                  ', '2020-05-31 14:35:33', '2011-11-28 23:27:06', 0);
INSERT INTO `transaction` VALUES (97, 1872918850270760961, 86.06, '2021-06-01 04:50:08', 'The Main Window consists of several toolbars and panes for you to work on connections,              ', '2004-03-02 10:45:11', '2016-01-17 14:22:33', 0);
INSERT INTO `transaction` VALUES (98, 1850893537785413633, 1.89, '2011-02-20 10:07:30', 'The first step is as good as half over. The repository database can be an existing                  ', '2024-08-13 03:05:28', '2014-01-29 04:59:35', 0);
INSERT INTO `transaction` VALUES (99, 1850893537785413633, 68.53, '2012-06-09 22:31:12', 'Success consists of going from failure to failure without loss of enthusiasm.', '2022-04-01 04:18:57', '2006-11-29 04:58:26', 0);
INSERT INTO `transaction` VALUES (100, 1872918850270760961, 0.06, '2002-07-23 18:45:34', 'Anyone who has never made a mistake has never tried anything new.', '2023-03-11 20:59:45', '2010-01-15 05:04:58', 0);
INSERT INTO `transaction` VALUES (1015, 1872918850270760961, 22.11, '2024-12-31 13:47:33', 'heihei', '2024-12-31 13:47:33', '2024-12-31 13:47:33', 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userAccount` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `userPassword` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `unionId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '微信开放平台id',
  `mpOpenId` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '公众号openId',
  `userName` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `userAvatar` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户头像',
  `userProfile` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '用户简介',
  `userRole` varchar(256) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user' COMMENT '用户角色：user/admin/ban',
  `createTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updateTime` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `isDelete` tinyint NOT NULL DEFAULT 0 COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_unionId`(`unionId` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1872918850270760962 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1847249512427786242, 'cmefh', 'zhangyunbo2004', NULL, NULL, 'zyb', NULL, NULL, 'admin', '2024-10-18 20:12:58', '2024-12-27 17:31:09', 0);
INSERT INTO `user` VALUES (1850893537785413633, 'cmefh2', 'zhangyunbo20042', NULL, NULL, 'zyb2', NULL, NULL, 'user', '2024-10-28 21:33:02', '2024-12-27 17:31:09', 0);
INSERT INTO `user` VALUES (1872918850270760961, 'cmefh3', 'zhangyunbo20043', NULL, NULL, 'zyb3', NULL, NULL, 'user', '2024-12-28 16:13:45', '2024-12-28 16:13:45', 0);

SET FOREIGN_KEY_CHECKS = 1;
