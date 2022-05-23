-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.3.22-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for preschooldb
DROP SCHEMA IF EXISTS `preschooldb`;
CREATE DATABASE IF NOT EXISTS `preschooldb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `preschooldb`;

-- Dumping structure for table preschooldb.account
CREATE TABLE IF NOT EXISTS `account` (
  `account_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL DEFAULT '',
  `password` CHAR(64) NOT NULL DEFAULT '',
  `account_first_name` varchar(50) NOT NULL DEFAULT '',
  `account_last_name` varchar(50) NOT NULL DEFAULT '',
  `account_address` varchar(100) NOT NULL DEFAULT '',
  `account_city` varchar(20) NOT NULL DEFAULT '',
  `account_province` varchar(20) NOT NULL DEFAULT '',
  `account_postal_code` varchar(8) NOT NULL DEFAULT '',
  `account_phone_number` varchar(20) NOT NULL DEFAULT '',
  `work_phone_number` varchar(20),
  `cellphone_number` varchar(20),   
  `account_type` char(1) NOT NULL DEFAULT '',
  `relation_to_child` varchar(20),
  `account_status` TINYINT(1) NOT NULL DEFAULT 1,
  `activate_account_uuid` VARCHAR(50),
  `reset_password_uuid` VARCHAR(50),
  `creation_date` DATE NULL DEFAULT NULL,
  `last_login_date` DATE NULL DEFAULT NULL,
  `salt` CHAR(64) NOT NULL DEFAULT '',
  CHECK ((account_type = 'S') OR (account_type = 'G') OR (account_type = 'A')),
  PRIMARY KEY (`account_id`),
  CONSTRAINT account_email_unique UNIQUE (email)
);

ALTER TABLE account AUTO_INCREMENT=52382;

INSERT INTO `account` (`email`,`password`,`account_first_name`,`account_last_name`,`account_address`,`account_city`,`account_province`, `account_postal_code`, `account_phone_number`, `work_phone_number`, `cellphone_number`, `account_type`, creation_date, salt)
VALUES ('parklandpreschoolteam@gmail.com', '9328cf33549e378c1982c6b61f7fcb431e9ac8c9afba8511c3ba0dbaf4193dc6', 'Nicky', 'McDowell', '123 Calgary St', 'Calgary', 'AB', 'A1A2B2', '1234567891', '1234567892', '1234567893', 'A', curdate(), 'NeZRJMuFfiSQjZ+CpNH1Z23fI7X7EEUWTC/4x7Cv9P0=');

INSERT INTO `account` (`email`,`password`,`account_first_name`,`account_last_name`,`account_address`,`account_city`,`account_province`, `account_postal_code`, `account_phone_number`,`account_type`, creation_date, salt)
VALUES ('staff@gmail.com', '9328cf33549e378c1982c6b61f7fcb431e9ac8c9afba8511c3ba0dbaf4193dc6', 'Staff', 'Staff', '123 Fake St', 'Calgary', 'AB', 'T1T1T1', '1234567891', 'S', curdate(), 'NeZRJMuFfiSQjZ+CpNH1Z23fI7X7EEUWTC/4x7Cv9P0=');

INSERT INTO `account` (`email`,`password`,`account_first_name`,`account_last_name`,`account_address`,`account_city`,`account_province`, `account_postal_code`, `account_phone_number`, `work_phone_number`, `cellphone_number`, `account_type`, `relation_to_child`, creation_date, salt)
VALUES ('cprg352sait+guardian@gmail.com', '9328cf33549e378c1982c6b61f7fcb431e9ac8c9afba8511c3ba0dbaf4193dc6', 'Chris', 'Spencer', '123 Main St', 'Calgary', 'AB', 'T1T1T1', '1234567891', '1234567892', '1234567893', 'G', 'Father', curdate(), 'NeZRJMuFfiSQjZ+CpNH1Z23fI7X7EEUWTC/4x7Cv9P0=');

INSERT INTO `account` (`email`,`password`,`account_first_name`,`account_last_name`,`account_address`,`account_city`,`account_province`, `account_postal_code`, `account_phone_number`,`account_type`, `relation_to_child`, `work_phone_number`, `cellphone_number`, creation_date, salt)
VALUES ('cprg352sait+jane@gmail.com', '9328cf33549e378c1982c6b61f7fcb431e9ac8c9afba8511c3ba0dbaf4193dc6', 'Jane', 'Harrison', '123 Main St', 'Calgary', 'AB', 'T1T1T1', '1234567891', 'G', 'MOTHER', '1234567891', '1234567891', curdate(), 'NeZRJMuFfiSQjZ+CpNH1Z23fI7X7EEUWTC/4x7Cv9P0=');

-- Dumping data for table preschooldb.account: ~0 rows (approximately)
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
/*!40000 ALTER TABLE `account` ENABLE KEYS */;

-- Dumping structure for table preschooldb.child
CREATE TABLE IF NOT EXISTS `child` (
  `child_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` int(10) unsigned NOT NULL,
  `child_birthdate` date NOT NULL,
  `child_gender` char(1) NOT NULL DEFAULT '',
  `child_first_name` varchar(50) NOT NULL DEFAULT '',
  `child_last_name` varchar(50) NOT NULL DEFAULT '',
  `child_phone_number` varchar(20) DEFAULT NULL,
  `child_address` varchar(100) NOT NULL DEFAULT '',
  `child_city` varchar(20) NOT NULL DEFAULT '',
  `child_province` varchar(20) NOT NULL DEFAULT '',
  `child_postal_code` varchar(8) NOT NULL DEFAULT '',
  `doctor` varchar(50) NOT NULL DEFAULT '',
  `clinic` varchar(100) NOT NULL DEFAULT '',
  `immunization_updated` tinyint(1) NOT NULL DEFAULT 0,
  `had_chicken_pox` tinyint(1) NOT NULL DEFAULT 0,
  `medical_phone_number` varchar(20) NOT NULL DEFAULT '',
  `healthcare_num` varchar(10) NOT NULL DEFAULT '',
  `allergy` varchar(100) NOT NULL DEFAULT '',
  `medical_conditions` varchar(100),
  `medications` TINYINT(1) DEFAULT 0,
  CHECK ((child_gender = 'M') OR (child_gender = 'F') OR (child_gender = 'N')),
  PRIMARY KEY (`child_id`),
  -- KEY `fk_child_account` (`account_id`),
  CONSTRAINT `fk_child_account` FOREIGN KEY (`account`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
ALTER TABLE child AUTO_INCREMENT=92439;

-- Dumping data for table preschooldb.child: ~0 rows (approximately)
/*!40000 ALTER TABLE `child` DISABLE KEYS */;
/*!40000 ALTER TABLE `child` ENABLE KEYS */;

-- Dumping structure for table preschooldb.authorized_pickup
CREATE TABLE IF NOT EXISTS `authorized_pickup` (
  `authorized_pickup_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `child` int(10) unsigned NOT NULL,
  `authorized_first_name` varchar(50) NOT NULL DEFAULT '',
  `authorized_last_name` varchar(50) NOT NULL DEFAULT '',
  `authorized_phone_number` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`authorized_pickup_id`),
 -- KEY `fk_authorized_pickup_child` (`child_id`),
  CONSTRAINT `fk_authorized_pickup_child` FOREIGN KEY (`child`) REFERENCES `child` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Dumping data for table preschooldb.authorized_pickup: ~0 rows (approximately)
/*!40000 ALTER TABLE `authorized_pickup` DISABLE KEYS */;
/*!40000 ALTER TABLE `authorized_pickup` ENABLE KEYS */;

-- Dumping structure for table preschooldb.backup
-- CREATE TABLE IF NOT EXISTS `backup` (
--   `backup_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--   `filepath` varchar(200) NOT NULL DEFAULT '',
--   `date` date DEFAULT NULL,
--   `full_backup` tinyint(1) NOT NULL DEFAULT 0,
--   PRIMARY KEY (`backup_id`)
-- );

-- Dumping data for table preschooldb.backup: ~0 rows (approximately)
-- /*!40000 ALTER TABLE `backup` DISABLE KEYS */;
-- /*!40000 ALTER TABLE `backup` ENABLE KEYS */;

-- Dumping structure for table preschooldb.classroom
CREATE TABLE IF NOT EXISTS `classroom` (
  `classroom_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `account` int(10) unsigned DEFAULT NULL,
  `capacity` int(10) unsigned DEFAULT NULL,
  `start_date` DATETIME DEFAULT NULL,
  `end_date` DATETIME DEFAULT NULL,
  `enrolled` int(10) unsigned DEFAULT NULL,
  `age_group` int(1) NOT NULL,
  `year` int(10) unsigned DEFAULT NULL,
  `cost_per_month` double(8, 2),
  `days` VARCHAR(3) NOT NULL DEFAULT '',
  `description` varchar(30),
  CHECK ((age_group = 3) OR (age_group = 4) OR (age_group = 5)),
  PRIMARY KEY (`classroom_id`),
  -- KEY `fk_classroom_account` (`account_id`),
  CONSTRAINT `fk_classroom_account` FOREIGN KEY (`account`) REFERENCES `account` (`account_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

--  ALTER TABLE classroom 
--  ADD CONSTRAINT `fk_waitlist_clss_id` 
--  FOREIGN KEY (waitlist_class_id) REFERENCES `classroom` (classroom_id);

-- Dumping data for table preschooldb.classroom: ~0 rows (approximately)
/*!40000 ALTER TABLE `classroom` DISABLE KEYS */;
/*!40000 ALTER TABLE `classroom` ENABLE KEYS */;

-- Dumping structure for table preschooldb.emergency_contact
CREATE TABLE IF NOT EXISTS `emergency_contact` (
  `emergency_contact_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `child` int(10) unsigned NOT NULL,
  `relation_to_child` varchar(20) DEFAULT NULL,
  `emergency_first_name` varchar(50) DEFAULT NULL,
  `emergency_last_name` varchar(50) DEFAULT NULL,
  `home_phone_number` varchar(20) NOT NULL DEFAULT '',
  `work_phone_number` varchar(20),
  `cellphone_number` varchar(20),  
  `emergency_address` varchar(100) DEFAULT NULL,
  `emergency_city` varchar(20) DEFAULT NULL,
  `emergency_province` varchar(20) DEFAULT NULL,
  `emergency_postal_code` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`emergency_contact_id`),
  -- KEY `fk_emergency_account` (`account_id`),
  CONSTRAINT `fk_emergency_account` FOREIGN KEY (`child`) REFERENCES `child` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Dumping data for table preschooldb.emergency_contact: ~0 rows (approximately)
/*!40000 ALTER TABLE `emergency_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `emergency_contact` ENABLE KEYS */;

-- Dumping structure for table preschooldb.registration
CREATE TABLE IF NOT EXISTS `registration` (
  `registration_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `child` int(10) unsigned NOT NULL,
  `classroom` int(10) unsigned DEFAULT NULL,
  `registration_active` tinyint(1) NOT NULL DEFAULT 0,
  `registration_status` char(1) NOT NULL DEFAULT '',
  `registration_date` date DEFAULT NULL,
  `safety_sig_date_stamp` date DEFAULT NULL,
  `outdoor_sig_date_stamp` date DEFAULT NULL,
  `sick_sig_date_stamp` date DEFAULT NULL,
  `discipline_sig_date_stamp` date DEFAULT NULL,
  `is_fully_paid` tinyint(1) NOT NULL DEFAULT 0,
  CHECK ((registration_status = 'W') OR (registration_status = 'R') OR (registration_status = 'P') OR (registration_status = 'D') OR (registration_status = 'N')),
  PRIMARY KEY (`registration_id`),
  -- KEY `fk_registration_child` (`child_id`),
  -- KEY `fk_registration_classroom` (`classroom_id`),
  CONSTRAINT `fk_registration_child` FOREIGN KEY (`child`) REFERENCES `child` (`child_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_registration_classroom` FOREIGN KEY (`classroom`) REFERENCES `classroom` (`classroom_id`) ON DELETE CASCADE ON UPDATE CASCADE
);

ALTER TABLE account AUTO_INCREMENT=10000;

-- Dumping data for table preschooldb.registration: ~0 rows (approximately)
/*!40000 ALTER TABLE `registration` DISABLE KEYS */;
/*!40000 ALTER TABLE `registration` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `payment_details` (
  `payment_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` varchar(20),
  `payee` varchar(50),
  `payer` varchar(50),
  `registration` int(10) unsigned NOT NULL,
  `payment_status` char(1) NOT NULL DEFAULT 'N',
  `payment_subtotal` double(8,2) NOT NULL DEFAULT 0.00,
  `payment_total` double(8,2) NOT NULL DEFAULT 0.00,
  `payment_date` date DEFAULT NULL,
  `payment_month` varchar(20) NOT NULL DEFAULT '',
  `payment_description` varchar(50),
  `payment_method` varchar(10),
  CHECK ((payment_status = 'N') OR (payment_status = 'P')),
  PRIMARY KEY (`payment_id`),
  -- KEY `fk_payment_registration_payment` (`registration_id`),
  CONSTRAINT `fk_registration_payment` FOREIGN KEY (`registration`) REFERENCES `registration` (`registration_id`) ON DELETE CASCADE ON UPDATE CASCADE
);
ALTER TABLE payment_details AUTO_INCREMENT=1000;

INSERT INTO `child` (`account`, `child_birthdate`, `child_gender`, `child_first_name`, `child_last_name`, `child_phone_number`, `child_address`, `child_city`, `child_province`, `child_postal_code`, `healthcare_num`)
VALUES(52384, STR_TO_DATE("August 10 2017", "%M %d %Y"), 'M', 'John', 'Spencer', '4033537891', '123 Main St', 'Calgary', 'AB', 'A1A2B2', 1234567891);

UPDATE child 
set doctor = 'Ruth Rice',
clinic = 'Healthy Path Clinic',
medical_phone_number = '4031234567',
allergy = 'Peanut butter allergy',
had_chicken_pox = 1
where child_id = 92439;

INSERT INTO `child` (`account`, `child_birthdate`, `child_gender`, `child_first_name`, `child_last_name`, `child_phone_number`, `child_address`, `child_city`, `child_province`, `child_postal_code`, `doctor`, `clinic`, `medical_phone_number`, `healthcare_num`, `allergy`, `medical_conditions`)
VALUES(52384, STR_TO_DATE("August 10 2017", "%M %d %Y"), 'M', 'Billy', 'Spencer', '4033537891', '123 Main St', 'Calgary', 'AB', 'A1A2B2', 'Dr.House', 'TV show Hospital', 4034038888, 1234567891, 'Peanuts', 'Super mutant powers. Can talk to turtles.');

INSERT INTO `child` (`account`, `child_birthdate`, `child_gender`, `child_first_name`, `child_last_name`, `child_phone_number`, `child_address`, `child_city`, `child_province`, `child_postal_code`, `healthcare_num`)
VALUES(52384, STR_TO_DATE("August 10 2017", "%M %d %Y"), 'F', 'Lisa', 'Spencer', '4033537891', '123 Main St', 'Calgary', 'AB', 'A1A2B2', 1234567891);

INSERT INTO `child` (`account`, `child_birthdate`, `child_gender`, `child_first_name`, `child_last_name`, `child_phone_number`, `child_address`, `child_city`, `child_province`, `child_postal_code`, `healthcare_num`)
VALUES(52385, STR_TO_DATE("January 10 2017", "%M %d %Y"), 'M', 'Curtis', 'Harrison', '4033537891', '123 Main St', 'Calgary', 'AB', 'A1A2B2', 1234567891);

UPDATE child 
set doctor = 'Richard Britton',
clinic = 'Healthy Path Clinic',
medical_phone_number = '4031234567',
allergy = 'asthma'
where child_id = 92442;

INSERT INTO emergency_contact (child, relation_to_child, emergency_first_name, emergency_last_name, home_phone_number, work_phone_number, cellphone_number, emergency_address, emergency_city, emergency_province, emergency_postal_code) 
VALUES (92442, 'FATHER', 'Stuart', 'Harrison', '4031234567', '4031234567', '4034567123', '132 Fake St', 'Calgary', 'AB', 'A1A2B2');
 
INSERT INTO `classroom` (`account`, `capacity`, `start_date`, `end_date`, `enrolled`, `age_group`, `year`, `cost_per_month`, `days`, `description`)
VALUES (52382, 15, curdate(), DATE_ADD(curdate(), INTERVAL 10 MONTH), 1, 4, 2021, 170, 'TTh', '4 year old class');

INSERT INTO `classroom` (`account`, `capacity`, `start_date`, `end_date`, `enrolled`, `age_group`, `year`, `cost_per_month`, `days`, `description`)
VALUES (52382, 15, curdate(), DATE_ADD(curdate(), INTERVAL 10 MONTH), 15, 3, 2021, 200, 'MWF', '3 year old class');

INSERT INTO `classroom` (`account`, `capacity`, `start_date`, `end_date`, `enrolled`, `age_group`, `year`, `cost_per_month`, `days`, `description`)
VALUES (52382, 15, curdate(), DATE_ADD(curdate(), INTERVAL 10 MONTH), 1, 3, 2021, 200, 'TTh', '3 year old class');

INSERT INTO registration (child, classroom, registration_active, registration_status, registration_date, discipline_sig_date_stamp, safety_sig_date_stamp, outdoor_sig_date_stamp, sick_sig_date_stamp) 
VALUES (92439, 2, true, 'P', curdate(), curdate(), curdate(), curdate(), curdate());

INSERT INTO registration (child, classroom, registration_active, registration_status, registration_date, discipline_sig_date_stamp, safety_sig_date_stamp, outdoor_sig_date_stamp, sick_sig_date_stamp) 
VALUES (92440, 2, true, 'P', curdate(), curdate(), curdate(), curdate(), curdate());

INSERT INTO registration (child, classroom, registration_active, registration_status, registration_date, discipline_sig_date_stamp, safety_sig_date_stamp, outdoor_sig_date_stamp, sick_sig_date_stamp) 
VALUES (92441, 2, true, 'P', curdate(), curdate(), curdate(), curdate(), curdate());

INSERT INTO registration (child, classroom, registration_active, registration_status, registration_date, discipline_sig_date_stamp, safety_sig_date_stamp, outdoor_sig_date_stamp, sick_sig_date_stamp) 
VALUES (92441, 3, true, 'R', curdate(), curdate(), curdate(), curdate(), curdate());

INSERT INTO emergency_contact (child, relation_to_child, emergency_first_name, emergency_last_name, home_phone_number, work_phone_number, cellphone_number, emergency_address, emergency_city, emergency_province, emergency_postal_code) 
VALUES (92439, 'Mother', 'Gaill', 'Spencer', '4031234567', '4031234567', '4034567123', '132 Fake St', 'Calgary', 'AB', 'A1A2B2');

INSERT INTO emergency_contact (child, relation_to_child, emergency_first_name, emergency_last_name, home_phone_number, work_phone_number, cellphone_number, emergency_address, emergency_city, emergency_province, emergency_postal_code) 
VALUES (92439, 'grandma', 'Alice', 'Newman', '4031234567', '4031234567', '4034567123', '132 Fake St', 'Calgary', 'AB', 'A1A2B2');

INSERT INTO emergency_contact (child, emergency_first_name, emergency_last_name, home_phone_number, emergency_address) 
VALUES (92439, 'Susie', 'Spencer', '4031234567', '132 Fake St');

INSERT INTO emergency_contact (child, relation_to_child, emergency_first_name, emergency_last_name, home_phone_number, work_phone_number, cellphone_number, emergency_address, emergency_city, emergency_province, emergency_postal_code) 
VALUES (92440, 'Mother', 'Gail', 'Spencer', '4031234567', '4031234567', '4034567123', '132 Fake St', 'Calgary', 'AB', 'A1A2B2');

INSERT INTO emergency_contact (child, relation_to_child, emergency_first_name, emergency_last_name, home_phone_number, work_phone_number, cellphone_number, emergency_address, emergency_city, emergency_province, emergency_postal_code) 
VALUES (92440, 'grandma', 'Alice', 'Newman', '4031234567', '4031234567', '4034567123', '132 Fake St', 'Calgary', 'AB', 'A1A2B2');

INSERT INTO emergency_contact (child, emergency_first_name, emergency_last_name, home_phone_number, emergency_address) 
VALUES (92440, 'Susie', 'Spencer', '4031234567', '132 Fake St');

INSERT INTO emergency_contact (child, relation_to_child, emergency_first_name, emergency_last_name, home_phone_number, work_phone_number, cellphone_number, emergency_address, emergency_city, emergency_province, emergency_postal_code) 
VALUES (92441, 'Mother', 'Gail', 'Spencer', '4031234567', '4031234567', '4034567123', '132 Fake St', 'Calgary', 'AB', 'A1A2B2');

INSERT INTO emergency_contact (child, relation_to_child, emergency_first_name, emergency_last_name, home_phone_number, work_phone_number, cellphone_number, emergency_address, emergency_city, emergency_province, emergency_postal_code) 
VALUES (92441, 'grandma', 'Alice', 'Newman', '4031234567', '4031234567', '4034567123', '132 Fake St', 'Calgary', 'AB', 'A1A2B2');

INSERT INTO emergency_contact (child, emergency_first_name, emergency_last_name, home_phone_number, emergency_address) 
VALUES (92441, 'Susie', 'Spencer', '4031234567', '132 Fake St');

INSERT INTO emergency_contact (child, relation_to_child, emergency_first_name, emergency_last_name, home_phone_number, work_phone_number, cellphone_number, emergency_address, emergency_city, emergency_province, emergency_postal_code) 
VALUES (92442, 'Grandma', 'Victor', 'Harrison', '4031234567', '4031234567', '4034567123', '132 Fake St', 'Calgary', 'AB', 'A1A2B2');

INSERT INTO emergency_contact (child, emergency_first_name, emergency_last_name, home_phone_number, emergency_address) 
VALUES (92442, 'Anne', 'Harrison', '4031234567', '132 Fake St');

INSERT INTO authorized_pickup (child, authorized_first_name, authorized_last_name) 
VALUES (92442, 'Anne', 'Harrison');

INSERT INTO authorized_pickup (child, authorized_first_name, authorized_last_name) 
VALUES (92442, 'Bruce', 'Harrison');

INSERT INTO authorized_pickup (child, authorized_first_name, authorized_last_name, authorized_phone_number) 
VALUES (92439, 'Jack', 'Garett', '4031234567');

INSERT INTO authorized_pickup (child, authorized_first_name, authorized_last_name, authorized_phone_number) 
VALUES (92439, 'Donna', 'Livingston', '4031234567');

INSERT INTO authorized_pickup (child, authorized_first_name, authorized_last_name, authorized_phone_number) 
VALUES (92440, 'Jack', 'Garett', '4031234567');

INSERT INTO authorized_pickup (child, authorized_first_name, authorized_last_name, authorized_phone_number) 
VALUES (92440, 'Donna', 'Livingston', '4031234567');

INSERT INTO authorized_pickup (child, authorized_first_name, authorized_last_name, authorized_phone_number) 
VALUES (92439, 'Donna', 'Livingston', '4031234567');

INSERT INTO authorized_pickup (child, authorized_first_name, authorized_last_name, authorized_phone_number) 
VALUES (92441, 'Jack', 'Garett', '4031234567');

INSERT INTO authorized_pickup (child, authorized_first_name, authorized_last_name, authorized_phone_number) 
VALUES (92441, 'Donna', 'Livingston', '4031234567');

INSERT INTO payment_details (invoice_id, payee, payer, registration, payment_status, payment_subtotal, payment_total, payment_date, payment_month, payment_description, payment_method) 
VALUES ('NEW100000', '', NULL, 1, 'P', 45.0, 45.0, '2021-01-27', 'January 2021', 'registration fee', 'PayPal');

INSERT INTO payment_details (invoice_id, payee, payer, registration, payment_status, payment_subtotal, payment_total, payment_date, payment_month, payment_description, payment_method) 
VALUES ('NEW100001', '', NULL, 2, 'N', 45.0, 45.0, '2021-01-20', 'January 2021', 'registration fee', 'Not Paid');

INSERT INTO payment_details (invoice_id, payee, payer, registration, payment_status, payment_subtotal, payment_total, payment_date, payment_month, payment_description, payment_method) 
VALUES ('NEW100002', '', NULL, 1, 'P', 170, 170, '2021-02-02', 'February 2021', 'monthly fee', 'PayPal');

INSERT INTO payment_details (invoice_id, payee, payer, registration, payment_status, payment_subtotal, payment_total, payment_date, payment_month, payment_description, payment_method) 
VALUES ('NEW100003', '', NULL, 1, 'N', 170, 170, '2021-03-02', 'March 2021', 'monthly fee', 'Not Paid');


-- Dumping data for table preschooldb.payment_details: ~0 rows (approximately)
/*!40000 ALTER TABLE `payment_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_details` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
