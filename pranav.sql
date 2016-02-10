-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.26-log - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.3.0.4996
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for data
CREATE DATABASE IF NOT EXISTS `data` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `data`;


-- Dumping structure for table data.classroom
CREATE TABLE IF NOT EXISTS `classroom` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Year2` varchar(255) DEFAULT NULL,
  `Name2` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_jg88d0eca4arkqlvg0ukqodgw` (`Year2`),
  UNIQUE KEY `UK_ngtc8ihcwu5lei3p44toj4o6l` (`Name2`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- Dumping data for table data.classroom: ~8 rows (approximately)
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
INSERT INTO `classroom` (`id`, `Year2`, `Name2`) VALUES
	(5, 'pranav', 'adsas'),
	(16, 'hjjjj', 'jjjj'),
	(23, 'dfgdfgfg', 'dfgdfg'),
	(41, 'jkhjkhjk', 'hjkhjkhjkhjkhjkhjk'),
	(42, 'rtyrty', 'rtytryrtyry'),
	(43, 'kjl', 'jkljkl'),
	(44, 'jkljk', 'ljkljkljklkjl'),
	(46, 'wdadaw', 'dawdawdawd');
/*!40000 ALTER TABLE `classroom` ENABLE KEYS */;


-- Dumping structure for table data.classroom_teacher_id
CREATE TABLE IF NOT EXISTS `classroom_teacher_id` (
  `t_id` int(11) NOT NULL,
  `idx_teacher` int(11) NOT NULL,
  `elt` int(11) NOT NULL,
  PRIMARY KEY (`t_id`,`idx_teacher`),
  KEY `FK8adrpabfr7kv2aefdxmhtbb4` (`elt`),
  CONSTRAINT `FK8adrpabfr7kv2aefdxmhtbb4` FOREIGN KEY (`elt`) REFERENCES `teacher` (`Id`),
  CONSTRAINT `FKkaclxra4mvvo8vlo4x1cov7i6` FOREIGN KEY (`t_id`) REFERENCES `classroom` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table data.classroom_teacher_id: ~0 rows (approximately)
/*!40000 ALTER TABLE `classroom_teacher_id` DISABLE KEYS */;
/*!40000 ALTER TABLE `classroom_teacher_id` ENABLE KEYS */;


-- Dumping structure for table data.course
CREATE TABLE IF NOT EXISTS `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `CourseName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table data.course: ~4 rows (approximately)
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` (`id`, `CourseName`) VALUES
	(1, 'Java'),
	(2, 'DotNet'),
	(3, 'VB'),
	(4, NULL);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;


-- Dumping structure for table data.course_grade_id
CREATE TABLE IF NOT EXISTS `course_grade_id` (
  `grade1_id` int(11) NOT NULL,
  `grade1_idx` int(11) NOT NULL,
  `elt` int(11) NOT NULL,
  PRIMARY KEY (`grade1_id`,`grade1_idx`),
  KEY `FKef2lic5n03km5k9uqaw7802o6` (`elt`),
  CONSTRAINT `FKef2lic5n03km5k9uqaw7802o6` FOREIGN KEY (`elt`) REFERENCES `grade` (`id`),
  CONSTRAINT `FKqexdpwgp1hvp5xdkxqgem7od1` FOREIGN KEY (`grade1_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table data.course_grade_id: ~3 rows (approximately)
/*!40000 ALTER TABLE `course_grade_id` DISABLE KEYS */;
INSERT INTO `course_grade_id` (`grade1_id`, `grade1_idx`, `elt`) VALUES
	(4, 0, 1),
	(4, 1, 2),
	(4, 2, 3);
/*!40000 ALTER TABLE `course_grade_id` ENABLE KEYS */;


-- Dumping structure for table data.exam
CREATE TABLE IF NOT EXISTS `exam` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Exam_name` varchar(255) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table data.exam: ~0 rows (approximately)
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` (`Id`, `Exam_name`, `Date`) VALUES
	(1, 'maths', '1993-06-27 00:00:00');
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;


-- Dumping structure for table data.exam_result
CREATE TABLE IF NOT EXISTS `exam_result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Marks` varchar(255) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `course_idx` int(11) DEFAULT NULL,
  `Std1_id` int(11) DEFAULT NULL,
  `Std_idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKteyr0pw19dfd1kpcyrl526mgy` (`course_id`),
  KEY `FKnctav2ldu5i518rjeqj4wnm40` (`Std1_id`),
  CONSTRAINT `FKnctav2ldu5i518rjeqj4wnm40` FOREIGN KEY (`Std1_id`) REFERENCES `student` (`id`),
  CONSTRAINT `FKteyr0pw19dfd1kpcyrl526mgy` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table data.exam_result: ~0 rows (approximately)
/*!40000 ALTER TABLE `exam_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam_result` ENABLE KEYS */;


-- Dumping structure for table data.grade
CREATE TABLE IF NOT EXISTS `grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Name` varchar(255) DEFAULT NULL,
  `Desc2` varchar(255) DEFAULT NULL,
  `classroom_id` int(11) DEFAULT NULL,
  `cr_idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKd8vpsmoxsa2iec9ol8u48bkty` (`classroom_id`),
  CONSTRAINT `FKd8vpsmoxsa2iec9ol8u48bkty` FOREIGN KEY (`classroom_id`) REFERENCES `classroom` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Dumping data for table data.grade: ~3 rows (approximately)
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` (`id`, `Name`, `Desc2`, `classroom_id`, `cr_idx`) VALUES
	(1, 'Grade A', 'fantastic', NULL, NULL),
	(2, 'Grade B', 'average', NULL, NULL),
	(3, 'Grade C', 'Poor', NULL, NULL);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;


-- Dumping structure for table data.notification
CREATE TABLE IF NOT EXISTS `notification` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Student_Id` int(11) DEFAULT NULL,
  `user_Id` int(11) DEFAULT NULL,
  `Remarks` varchar(255) DEFAULT NULL,
  `Noti_date` date DEFAULT NULL,
  `Noto_read` bit(1) DEFAULT NULL,
  `Noti_id` int(11) DEFAULT NULL,
  `noti_idx` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `FK5987wqr62iloc9jc1e2u2kyfo` (`Student_Id`),
  KEY `FKopcwhhmc5dqc62fqg7mih4sie` (`user_Id`),
  KEY `FKret17p0pfx9tl4p5kogqa1ffa` (`Noti_id`),
  CONSTRAINT `FK5987wqr62iloc9jc1e2u2kyfo` FOREIGN KEY (`Student_Id`) REFERENCES `student` (`id`),
  CONSTRAINT `FKopcwhhmc5dqc62fqg7mih4sie` FOREIGN KEY (`user_Id`) REFERENCES `user` (`Id`),
  CONSTRAINT `FKret17p0pfx9tl4p5kogqa1ffa` FOREIGN KEY (`Noti_id`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8;

-- Dumping data for table data.notification: ~1 rows (approximately)
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` (`Id`, `Student_Id`, `user_Id`, `Remarks`, `Noti_date`, `Noto_read`, `Noti_id`, `noti_idx`) VALUES
	(146, NULL, NULL, NULL, NULL, b'0', 9, 0);
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;


-- Dumping structure for table data.parent
CREATE TABLE IF NOT EXISTS `parent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ParentName` varchar(255) DEFAULT NULL,
  `ParentLastName` varchar(255) DEFAULT NULL,
  `Phone` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table data.parent: ~0 rows (approximately)
/*!40000 ALTER TABLE `parent` DISABLE KEYS */;
INSERT INTO `parent` (`id`, `ParentName`, `ParentLastName`, `Phone`, `Email`) VALUES
	(1, 'Rajesh', 'Gandharva', '9426420084', 'pranavgandharva@gmail.com');
/*!40000 ALTER TABLE `parent` ENABLE KEYS */;


-- Dumping structure for table data.register
CREATE TABLE IF NOT EXISTS `register` (
  `userName` int(11) DEFAULT NULL,
  `userPass` int(11) DEFAULT NULL,
  `userEmail` varchar(50) DEFAULT NULL,
  `userCountry` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table data.register: ~0 rows (approximately)
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
/*!40000 ALTER TABLE `register` ENABLE KEYS */;


-- Dumping structure for table data.student
CREATE TABLE IF NOT EXISTS `student` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `Firstname` varchar(255) DEFAULT NULL,
  `Lastname` varchar(255) DEFAULT NULL,
  `phn` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Attendance` varchar(255) DEFAULT NULL,
  `EnrollmentNumber` int(11) DEFAULT NULL,
  `Photo` varchar(255) DEFAULT NULL,
  `stud_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_ngp3pugd427ws077lv5c4xup3` (`EnrollmentNumber`),
  KEY `FK5itjlfh1ot7ou1d7ksocn4fmj` (`stud_id`),
  CONSTRAINT `FK5itjlfh1ot7ou1d7ksocn4fmj` FOREIGN KEY (`stud_id`) REFERENCES `classroom` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table data.student: ~7 rows (approximately)
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` (`id`, `Firstname`, `Lastname`, `phn`, `Email`, `Attendance`, `EnrollmentNumber`, `Photo`, `stud_id`) VALUES
	(1, 'pranav', 'gandharva', '740523', 'sdf', '100%', 1, '1.jpg', 44),
	(2, 'harsh', 'panchal', '54', 'sdsad', '100%', 2, '2.jpg', 44),
	(3, 'shwetra', 'patel', '', '', '', 3, '3.jpg', 16),
	(7, 'Aman', 'Bhat', '154', 'sdfs', '100%', 4, '4.jpg', 44),
	(8, 'Rao', 'seee', '4587', 'sdsd', '60', 5, '5.jpg', 42),
	(9, 'Rom', 'sdf', '48', 'sdf', '70', 6, '6.jpg', 43),
	(10, 'Rjk', 'popo', '65', 'sd', '200%', 7, '7.jpg', 5);
/*!40000 ALTER TABLE `student` ENABLE KEYS */;


-- Dumping structure for table data.teacher
CREATE TABLE IF NOT EXISTS `teacher` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Phno` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Dumping data for table data.teacher: ~8 rows (approximately)
/*!40000 ALTER TABLE `teacher` DISABLE KEYS */;
INSERT INTO `teacher` (`Id`, `FirstName`, `LastName`, `Phno`, `Email`) VALUES
	(1, 'suns', 'sinhs', '7450', 'asx'),
	(2, 'sanj', 'mahotra', '7450', 'ssxxss'),
	(3, 'prc', 'singh', '7550', 'lkj'),
	(4, 'Rk', 'lnkj', '84562', 'juy'),
	(5, 'Rj', 'ksapo', '815', 'xdcdscx'),
	(6, 'zx', 'zx', 'zx', 'ds'),
	(7, 'harsh+', '', '', ''),
	(8, 'shwera', '', '', ',bbkgk'),
	(9, 'kumar', 'gandharvsa', '879854', 'jo'),
	(10, 'Yash', 'jani', '484', 'asdfadf');
/*!40000 ALTER TABLE `teacher` ENABLE KEYS */;


-- Dumping structure for table data.user
CREATE TABLE IF NOT EXISTS `user` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `UserName` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `UserType` int(11) DEFAULT NULL,
  `studentId` int(11) DEFAULT NULL,
  `teacherId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `UK_2kfqph8p32as27o2t65i3iesr` (`studentId`),
  UNIQUE KEY `UK_648cuo8y5b7ie69d5ex02ve58` (`teacherId`),
  CONSTRAINT `FK2kg7mrso375bnia6ru6qppysx` FOREIGN KEY (`teacherId`) REFERENCES `teacher` (`Id`),
  CONSTRAINT `FK488j4m2okdb07veoc44f0euuv` FOREIGN KEY (`studentId`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table data.user: ~2 rows (approximately)
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`Id`, `UserName`, `Password`, `UserType`, `studentId`, `teacherId`) VALUES
	(1, 'pranav', '1234', 0, 1, 8);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
