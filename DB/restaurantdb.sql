-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema restaurantdb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `restaurantdb` ;

-- -----------------------------------------------------
-- Schema restaurantdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `restaurantdb` DEFAULT CHARACTER SET utf8 ;
USE `restaurantdb` ;

-- -----------------------------------------------------
-- Table `restaurant`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `restaurant` ;

CREATE TABLE IF NOT EXISTS `restaurant` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `address` VARCHAR(200) NULL,
  `rating` INT NULL,
  `review` VARCHAR(2000) NULL,
  `visited` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS restaurantuser@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'restaurantuser'@'localhost' IDENTIFIED BY 'restaurantuser';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'restaurantuser'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `restaurant`
-- -----------------------------------------------------
START TRANSACTION;
USE `restaurantdb`;
INSERT INTO `restaurant` (`id`, `name`, `address`, `rating`, `review`, `visited`) VALUES (1, 'Yabby Hut', '3355 S Yarrow St E-131, Lakewood, CO 80227', 5, 'Best seafood boil in Denver, not better than the ones I had in Texas though.', 1);
INSERT INTO `restaurant` (`id`, `name`, `address`, `rating`, `review`, `visited`) VALUES (2, 'Gordon Ramsay Steak', '3655 S Las Vegas Blvd, Las Vegas, NV 89109', NULL, 'On my TODO list', 0);
INSERT INTO `restaurant` (`id`, `name`, `address`, `rating`, `review`, `visited`) VALUES (3, 'The Capital Grille', '1450 Larimer St, Denver, CO 80202', 4, 'Too expensive for what it is', 1);

COMMIT;

