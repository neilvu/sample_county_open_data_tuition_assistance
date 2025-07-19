-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema moco_tuition_assistance
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `moco_tuition_assistance` ;

-- -----------------------------------------------------
-- Schema moco_tuition_assistance
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `moco_tuition_assistance` DEFAULT CHARACTER SET utf8 ;
USE `moco_tuition_assistance` ;

-- -----------------------------------------------------
-- Table `moco_tuition_assistance`.`School_Direct_Info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moco_tuition_assistance`.`School_Direct_Info` ;

CREATE TABLE IF NOT EXISTS `moco_tuition_assistance`.`School_Direct_Info` (
  `sch_info_id` INT NOT NULL,
  `Institution_Name` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`sch_info_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moco_tuition_assistance`.`Course_Info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moco_tuition_assistance`.`Course_Info` ;

CREATE TABLE IF NOT EXISTS `moco_tuition_assistance`.`Course_Info` (
  `course_id` INT NOT NULL,
  `Course_Title` VARCHAR(300) NOT NULL,
  `Course_Descrp` TEXT(100000) NOT NULL,
  PRIMARY KEY (`course_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moco_tuition_assistance`.`Department_Info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moco_tuition_assistance`.`Department_Info` ;

CREATE TABLE IF NOT EXISTS `moco_tuition_assistance`.`Department_Info` (
  `dept_id` INT NOT NULL,
  `Department_Name` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`dept_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moco_tuition_assistance`.`Applicant_Info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moco_tuition_assistance`.`Applicant_Info` ;

CREATE TABLE IF NOT EXISTS `moco_tuition_assistance`.`Applicant_Info` (
  `emp_id` INT NOT NULL,
  `sch_info_id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `Degree` VARCHAR(100) NOT NULL,
  `Major` VARCHAR(100) NOT NULL,
  `Cost` FLOAT NOT NULL,
  PRIMARY KEY (`emp_id`),
  INDEX `fk_sch_info_id_idx` (`sch_info_id` ASC) VISIBLE,
  INDEX `fk_course_id_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `fk_course_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `moco_tuition_assistance`.`Course_Info` (`course_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_sch_info_id`
    FOREIGN KEY (`sch_info_id`)
    REFERENCES `moco_tuition_assistance`.`School_Direct_Info` (`sch_info_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `moco_tuition_assistance`.`Employee_Info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `moco_tuition_assistance`.`Employee_Info` ;

CREATE TABLE IF NOT EXISTS `moco_tuition_assistance`.`Employee_Info` (
  `emp_id` INT NOT NULL,
  `dept_id` INT NOT NULL,
  PRIMARY KEY (`emp_id`, `dept_id`),
  INDEX `fk_dept_id_idx` (`dept_id` ASC) VISIBLE,
  CONSTRAINT `fk_emp_id`
    FOREIGN KEY (`emp_id`)
    REFERENCES `moco_tuition_assistance`.`Applicant_Info` (`emp_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_dept_id`
    FOREIGN KEY (`dept_id`)
    REFERENCES `moco_tuition_assistance`.`Department_Info` (`dept_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
