



-- ---
-- Globals
-- ---

-- SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
-- SET FOREIGN_KEY_CHECKS=0;

-- ---
-- Table 'user'
-- 
-- ---

DROP TABLE IF EXISTS `user`;
		
CREATE TABLE `user` (
  `user_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `active` ENUM('0','1') NOT NULL,
  `username` VARCHAR(255) NOT NULL,
  `pass` VARCHAR(40) NOT NULL,
  `rank_id` INTEGER(11) NOT NULL,
  PRIMARY KEY (`user_id`)
);

-- ---
-- Table 'project'
-- 
-- ---

DROP TABLE IF EXISTS `project`;
		
CREATE TABLE `project` (
  `project_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `project_name` VARCHAR(255) NOT NULL,
  `user_id` INTEGER(11) NOT NULL,
  `status_id` INTEGER(11) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `description` MEDIUMTEXT NOT NULL,
  `active` ENUM('0','1') NOT NULL,
  PRIMARY KEY (`project_id`)
);

-- ---
-- Table 'task'
-- 
-- ---

DROP TABLE IF EXISTS `task`;
		
CREATE TABLE `task` (
  `task_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `task_name` VARCHAR(255) NOT NULL,
  `description` MEDIUMTEXT NOT NULL,
  `project_id` INTEGER(11) NOT NULL,
  `status_id` INTEGER(11) NOT NULL,
  PRIMARY KEY (`task_id`)
);

-- ---
-- Table 'comment'
-- 
-- ---

DROP TABLE IF EXISTS `comment`;
		
CREATE TABLE `comment` (
  `comment_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `comment_text` VARCHAR(255) NOT NULL,
  `user_id` INTEGER(11) NOT NULL,
  `project_id` INTEGER(11) NOT NULL,
  `date_time` DATETIME NOT NULL,
  `active` ENUM('0','1') NOT NULL,
  PRIMARY KEY (`comment_id`)
);

-- ---
-- Table 'rank'
-- 
-- ---

DROP TABLE IF EXISTS `rank`;
		
CREATE TABLE `rank` (
  `rank_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `rank_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`rank_id`)
);

-- ---
-- Table 'status'
-- 
-- ---

DROP TABLE IF EXISTS `status`;
		
CREATE TABLE `status` (
  `status_id` INTEGER(11) NOT NULL AUTO_INCREMENT,
  `status_title` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`status_id`)
);

-- ---
-- Table 'task_user'
-- 
-- ---

DROP TABLE IF EXISTS `task_user`;
		
CREATE TABLE `task_user` (
  `task_id` INTEGER(11) NOT NULL,
  `user_id` INTEGER(11) NOT NULL
);

-- ---
-- Foreign Keys 
-- ---

ALTER TABLE `user` ADD FOREIGN KEY (rank_id) REFERENCES `rank` (`rank_id`);
ALTER TABLE `project` ADD FOREIGN KEY (user_id) REFERENCES `user` (`user_id`);
ALTER TABLE `project` ADD FOREIGN KEY (status_id) REFERENCES `status` (`status_id`);
ALTER TABLE `task` ADD FOREIGN KEY (project_id) REFERENCES `project` (`project_id`);
ALTER TABLE `task` ADD FOREIGN KEY (status_id) REFERENCES `status` (`status_id`);
ALTER TABLE `comment` ADD FOREIGN KEY (user_id) REFERENCES `user` (`user_id`);
ALTER TABLE `comment` ADD FOREIGN KEY (project_id) REFERENCES `project` (`project_id`);
ALTER TABLE `task_user` ADD FOREIGN KEY (task_id) REFERENCES `task` (`task_id`);
ALTER TABLE `task_user` ADD FOREIGN KEY (user_id) REFERENCES `user` (`user_id`);

-- ---
-- Table Properties
-- ---

-- ALTER TABLE `user` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `project` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `task` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `comment` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `rank` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `status` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
-- ALTER TABLE `task_user` ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ---
-- Test Data
-- ---

-- INSERT INTO `user` (`user_id`,`first_name`,`last_name`,`email`,`active`,`username`,`pass`,`rank_id`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `project` (`project_id`,`project_name`,`user_id`,`status_id`,`start_date`,`end_date`,`description`,`active`) VALUES
-- ('','','','','','','','');
-- INSERT INTO `task` (`task_id`,`task_name`,`description`,`project_id`,`status_id`) VALUES
-- ('','','','','');
-- INSERT INTO `comment` (`comment_id`,`comment_text`,`user_id`,`project_id`,`date_time`,`active`) VALUES
-- ('','','','','','');
-- INSERT INTO `rank` (`rank_id`,`rank_name`) VALUES
-- ('','');
-- INSERT INTO `status` (`status_id`,`status_title`) VALUES
-- ('','');
-- INSERT INTO `task_user` (`task_id`,`user_id`) VALUES
-- ('','');

