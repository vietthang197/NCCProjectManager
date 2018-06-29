-- MySQL Script generated by MySQL Workbench
-- Tue Jun 19 16:41:59 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ncc
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ncc
-- -----------------------------------------------------
CREATE DATABASE `ncc` ;
USE `ncc` ;

-- -----------------------------------------------------
-- Table `ncc`.`project`
-- -----------------------------------------------------
CREATE TABLE `ncc`.`project` (
  `project_id` INT NOT NULL AUTO_INCREMENT,
  `projectName` VARCHAR(45) NOT NULL,
  `customer` VARCHAR(45) NOT NULL,
  `PM` VARCHAR(45) NOT NULL,
  `technology` VARCHAR(45) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NOT NULL DEFAULT 'running',
  `notes` VARCHAR(45) NULL,
  PRIMARY KEY (`project_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ncc`.`user`
-- -----------------------------------------------------
CREATE TABLE `ncc`.`user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `role` VARCHAR(45) NOT NULL,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


create table `ncc`.`user_info`(
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `job` VARCHAR(45) NOT NULL,
   PRIMARY KEY (`user_id`),
   INDEX `user_key_idx` (`user_id` ASC),
  CONSTRAINT `user_key`
    FOREIGN KEY (`user_id`)
    REFERENCES `ncc`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `ncc`.`log time sheet`
-- -----------------------------------------------------
CREATE TABLE `ncc`.`log_time_sheet` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `project_id` INT NOT NULL,
  `role`VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `hours` INT NOT NULL,
  `user_id` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  `date` DATETIME NULL,
  PRIMARY KEY (`id`, `user_id`, `project_id`),
  INDEX `uer_key_idx` (`user_id` ASC),
  INDEX `fk_log time sheet_project1_idx` (`project_id` ASC),
  CONSTRAINT `log_user_key`
    FOREIGN KEY (`user_id`)
    REFERENCES `ncc`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `fk_log time sheet_project1`
    FOREIGN KEY (`project_id`)
    REFERENCES `ncc`.`project` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ncc`.`relation`
-- -----------------------------------------------------
CREATE TABLE `ncc`.`relation` (
  `user_id` INT NOT NULL,
  `project_id` INT NOT NULL,
  PRIMARY KEY (`user_id`,`project_id`),
  INDEX `proj_key_idx` (`project_id` ASC),
  CONSTRAINT `rela_user_key`
    FOREIGN KEY (`user_id`)
    REFERENCES `ncc`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
  CONSTRAINT `rela_proj_key`
    FOREIGN KEY (`project_id`)
    REFERENCES `ncc`.`project` (`project_id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;


INSERT INTO `ncc`.`user` (`id`, `role`, `username`, `password`) VALUES ('1', 'ROLE_ADMIN', 'admin@gmail.com', '12345678');
INSERT INTO `ncc`.`user` (`role`, `username`, `password`) VALUES ('ROLE_USER', 'user1@gmail.com', '12345678');
INSERT INTO `ncc`.`user` (`role`, `username`, `password`) VALUES ('ROLE_USER', 'user2@gmail.com', '12345678');
INSERT INTO `ncc`.`user` (`role`, `username`, `password`) VALUES ('ROLE_USER', 'user3@gmail.com', '12345678');
INSERT INTO `ncc`.`user` (`role`, `username`, `password`) VALUES ('ROLE_USER', 'user4@gmail.com', '12345678');
INSERT INTO `ncc`.`user` (`role`, `username`, `password`) VALUES ('ROLE_USER', 'user5@gmail.com', '12345678');
INSERT INTO `ncc`.`user` (`role`, `username`, `password`) VALUES ('ROLE_USER', 'user6@gmail.com', '12345678');
INSERT INTO `ncc`.`user` (`role`, `username`, `password`) VALUES ('ROLE_USER', 'user7@gmail.com', '12345678');

INSERT INTO `ncc`.`project` (`project_id`, `projectName`, `customer`, `PM`, `technology`, `description`, `status`, `notes`) VALUES ('1', 'Change the world ', 'Donald Trump', 'user1@gmail.com', 'Java', 'make america great again', 'running', 'make asdasda');
INSERT INTO `ncc`.`project` (`project_id`, `projectName`, `customer`, `PM`, `technology`, `description`, `status`, `notes`) VALUES ('2', 'Impossible mission', 'Nam sida', 'user2@gmail.com', 'C++', 'giup anh Thien kiem nguoi yeu', 'failed', 'too hard');

INSERT INTO `ncc`.`relation` (`user_id`, `project_id`) VALUES ('2', '1');
INSERT INTO `ncc`.`relation` (`user_id`, `project_id`) VALUES ('6', '1');
INSERT INTO `ncc`.`relation` (`user_id`, `project_id`) VALUES ('4', '1');
INSERT INTO `ncc`.`relation` (`user_id`, `project_id`) VALUES ('5', '1');
INSERT INTO `ncc`.`relation` (`user_id`, `project_id`) VALUES ('3', '2');
INSERT INTO `ncc`.`relation` (`user_id`, `project_id`) VALUES ('7', '2');
INSERT INTO `ncc`.`relation` (`user_id`, `project_id`) VALUES ('5', '2');
INSERT INTO `ncc`.`relation` (`user_id`, `project_id`) VALUES ('8', '2');

INSERT INTO `ncc`.`log_time_sheet` (`id`, `project_id`, `role`, `type`, `hours`, `user_id`, `description`, `date`) VALUES ('1', '1', 'DEV', 'task', '8', '4', 't built the nuclear rocket', '2018/6/18');
INSERT INTO `ncc`.`log_time_sheet` (`project_id`, `role`, `type`, `hours`, `user_id`, `description`, `date`) VALUES ('2', 'Tester', 'task', '8', '8', 'too many bug', '2018/6/28');

INSERT INTO `ncc`.`user_info` (`user_id`, `job`) VALUES ('2', 'PM');
INSERT INTO `ncc`.`user_info` (`user_id`, `job`) VALUES ('3', 'PM');
INSERT INTO `ncc`.`user_info` (`user_id`, `job`) VALUES ('4', 'DEV');
INSERT INTO `ncc`.`user_info` (`user_id`, `job`) VALUES ('5', 'Tester');
INSERT INTO `ncc`.`user_info` (`user_id`, `job`) VALUES ('6', 'HR');
INSERT INTO `ncc`.`user_info` (`user_id`, `job`) VALUES ('7', 'DEv');
INSERT INTO `ncc`.`user_info` (`user_id`, `job`) VALUES ('8', 'Tester');
