CREATE DATABASE IF NOT EXISTS `Test`;
USE `Test`;

DROP TABLE IF EXISTS `questions`;
DROP TABLE IF EXISTS `numOfAuc`;
DROP TABLE IF EXISTS `archive`;
DROP TABLE IF EXISTS `bids`;
DROP TABLE IF EXISTS `cars`;
DROP TABLE IF EXISTS `users`;

CREATE TABLE users(
`username` varchar(30) NOT NULL DEFAULT '',
`password` varchar(30) NOT NULL , 
`custrep` integer NOT NULL , 
primary key(`username`));
LOCK TABLES `users` WRITE;
INSERT INTO `users` VALUES ('Usernames' , 'passwords', 1);
UNLOCK TABLES;


CREATE TABLE cars(
`id` varchar(30)NOT NULL,
`type` varchar(30) NOT NULL,
`name` varchar(100),
`user` varchar(30),
`manufact` varchar(30) NOT NULL , 
`year` varchar(30) NOT NULL , 
`color` varchar(30) NOT NULL , 
`mileage` varchar(30) NOT NULL,
`price` varchar(30) NOT NULL,
`date` datetime NOT NULL,
primary key(`id`),
FOREIGN KEY (user) REFERENCES users(username));
LOCK TABLES `cars` WRITE;
UNLOCK TABLES;

CREATE TABLE bids(
`bidid` varchar(30) NOT NULL DEFAULT '',
`id` varchar(30) NOT NULL DEFAULT '',
`user` varchar(30) NOT NULL , 
`amount` integer NOT NULL , 
`inc` varchar(30) , 
`ceil` varchar(30) , 
primary key(`bidid`),
FOREIGN KEY (user) REFERENCES users(username),
FOREIGN KEY (id) REFERENCES cars(id));
LOCK TABLES `bids` WRITE;
UNLOCK TABLES;

CREATE TABLE archive(
`user` varchar(30) NOT NULL DEFAULT '',
`seller` varchar(30) ,
`aname` varchar(100),
`bidid` varchar(30),
`vid` varchar(30)NOT NULL,
`type` varchar(30) , 
`date` datetime NOT NULL , 
`amount` integer NOT NULL , 
`win` integer NOT NULL , 
primary key(`bidid`,`vid`,`win`,`amount`),
FOREIGN KEY (bidid) REFERENCES bids(bidid),
FOREIGN KEY (seller) REFERENCES cars(user),
FOREIGN KEY (vid) REFERENCES cars(id),
FOREIGN KEY (user) REFERENCES users(username));
LOCK TABLES `bids` WRITE;
UNLOCK TABLES;

CREATE TABLE numOfAuc(
`amount` integer NOT NULL ,
primary key(`amount`));
LOCK TABLES `numOfAuc` WRITE;
UNLOCK TABLES;


CREATE TABLE questions(
`username` varchar(30) NOT NULL DEFAULT '',
`question` varchar(200) NOT NULL , 
`answer` varchar(200) , 
`uanswer` varchar(30) , 
primary key(`username`,`question`),
FOREIGN KEY (username) REFERENCES users(username));
LOCK TABLES `questions` WRITE;
UNLOCK TABLES;


