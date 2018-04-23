-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema RealFootball
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `RealFootball` ;

-- -----------------------------------------------------
-- Schema RealFootball
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `RealFootball` DEFAULT CHARACTER SET utf8 ;
USE `RealFootball` ;

-- -----------------------------------------------------
-- Table `Team`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Team` ;

CREATE TABLE IF NOT EXISTS `Team` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `team_name` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Player`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Player` ;

CREATE TABLE IF NOT EXISTS `Player` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `position` VARCHAR(20) NOT NULL,
  `number` INT NOT NULL,
  `team_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_idx` (`team_id` ASC),
  CONSTRAINT `fk`
    FOREIGN KEY (`team_id`)
    REFERENCES `Team` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Trophy`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Trophy` ;

CREATE TABLE IF NOT EXISTS `Trophy` (
  `team_id` INT NOT NULL,
  `champions_league` INT NULL DEFAULT 0,
  `league_titles` INT NULL DEFAULT 0,
  `league_cups` INT NULL DEFAULT 0,
  PRIMARY KEY (`team_id`),
  CONSTRAINT `fk_trophy`
    FOREIGN KEY (`team_id`)
    REFERENCES `Team` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO realfootball@localhost;
 DROP USER realfootball@localhost;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'realfootball'@'localhost' IDENTIFIED BY 'RSBsept2882?';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'realfootball'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Team`
-- -----------------------------------------------------
START TRANSACTION;
USE `RealFootball`;
INSERT INTO `Team` (`id`, `team_name`, `city`, `country`) VALUES (1, 'Chelsea FC', 'London', 'England');
INSERT INTO `Team` (`id`, `team_name`, `city`, `country`) VALUES (2, 'Liverpool FC', 'Liverpool', 'England');
INSERT INTO `Team` (`id`, `team_name`, `city`, `country`) VALUES (3, 'Bayern Munich', 'Munich', 'Germany');
INSERT INTO `Team` (`id`, `team_name`, `city`, `country`) VALUES (4, 'Juventus', 'Turin', 'Italy');
INSERT INTO `Team` (`id`, `team_name`, `city`, `country`) VALUES (5, 'Real Madrid', 'Madrid', 'Spain');

COMMIT;

-- -----------------------------------------------------
-- Data for table `Player`
-- -----------------------------------------------------
START TRANSACTION;
USE `RealFootball`;
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (1, 'Thibaut', 'Courtois', 'Keeper', 1, 1);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (2, 'Marcos', 'Alonso', 'Midfielder', 3, 1);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (3, 'Gary', 'Cahill', 'Defender', 24, 1);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (4, 'David', 'Luiz', 'Defender', 30, 1);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (5, 'Emerson', 'Palmieri', 'Defender', 33, 1);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (6, 'Davide', 'Zappacosta', 'Midfielder', 21, 1);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (7, 'Cesar', 'Azpilicueta', 'Defender', 28, 1);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (8, 'Andreas', 'Christensen', 'Defender', 27, 1);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (9, 'Victor', 'Moses', 'Midfielder', 15, 1);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (10, 'Antonio', 'Rudiger', 'Defender', 2, 1);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (11, 'Cesc', 'Fabregas', 'Midfielder', 4, 1);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (12, 'N\'Golo', 'Kante', 'Midfielder', 7, 1);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (13, 'Tiemoue', 'Bakayoko', 'Midfielder', 14, 1);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (14, 'Eden', 'Hazard', 'Midfielder', 10, 1);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (15, 'Pedro', 'Ledesma', 'Midfielder', 11, 1);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (16, 'Willian', 'da Silva', 'Midfielder', 22, 1);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (17, 'Alvaro', 'Morata', 'Striker', 9, 1);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (18, 'Olivier', 'Giroud', 'Striker', 18, 1);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (19, 'Simon', 'Mignolet', 'Keeper', 22, 2);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (20, 'Dejan', 'Lovren', 'Defender', 6, 2);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (21, 'James', 'Milner', 'Defender', 7, 2);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (22, 'Alberto', 'Moreno', 'Defender', 18, 2);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (23, 'Virgil', 'van Dijk', 'Defender', 4, 2);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (24, 'Emre', 'Can', 'Midfielder', 23, 2);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (25, 'Jordan', 'Henderson', 'Midfielder', 14, 2);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (26, 'Sadio', 'Mane', 'Midfielder', 19, 2);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (27, 'Roberto', 'Firmino', 'Striker', 9, 2);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (28, 'Mohamed', 'Salah', 'Striker', 11, 2);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (29, 'Adam', 'Lallana', 'Midfielder', 20, 2);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (30, 'Alex', 'Oxlade-Chamberlain', 'Midfielder', 21, 2);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (31, 'Dominic', 'Solanke', 'Striker', 29, 2);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (32, 'Georginio', 'Wijnaldum', 'Midfielder', 5, 2);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (33, 'Joel', 'Matip', 'Defender', 32, 2);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (34, 'Curtis', 'Jones', 'Midfielder', 48, 2);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (35, 'Nathaniel', 'Clyne', 'Defender', 2, 2);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (36, 'Danny', 'Ings', 'Striker', 28, 2);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (37, 'Manuel', 'Neuer', 'Keeper', 1, 3);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (38, 'David', 'Alaba', 'Defender', 27, 3);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (39, 'Jerome', 'Boateng', 'Defender', 17, 3);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (40, 'Mats', 'Hummels', 'Defender', 5, 3);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (41, 'Thiago', 'Alcantara', 'Midfielder', 6, 3);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (42, 'Thomas', 'Muller', 'Striker', 25, 3);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (43, 'Robert', 'Lewandowski', 'Striker', 9, 3);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (44, 'Arturo', 'Vidal', 'Midfielder', 23, 3);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (45, 'James', 'Rodriguez', 'Midfielder', 11, 3);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (46, 'Arjen', 'Robben', 'Midfielder', 10, 3);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (47, 'Franck', 'Ribery', 'Midfielder', 7, 3);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (48, 'Javi', 'Martinez', 'Midfielder', 8, 3);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (49, 'Joshua', 'Kimmich', 'Defender', 32, 3);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (50, 'Felix', 'Gotze', 'Defender', 20, 3);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (51, 'Niklas', 'Sule', 'Defender', 4, 3);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (52, 'Corentin', 'Tolisso', 'Midfielder', 24, 3);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (53, 'Kingsley', 'Coman', 'Midfielder', 29, 3);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (54, 'Juan', 'Bernat', 'Defender', 14, 3);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (55, 'Gianluigi', 'Buffon', 'Keeper', 1, 4);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (56, 'Andrea', 'Barzagli', 'Defender', 15, 4);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (57, 'Giorgio', 'Chiellini', 'Defender', 3, 4);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (58, 'Stephan', 'Lichtsteiner', 'Defender', 26, 4);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (59, 'Alex', 'Sandro', 'Defender', 12, 4);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (60, 'Medhi', 'Benatia', 'Defender', 4, 4);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (61, 'Juan', 'Cuadrado', 'Midfielder', 7, 4);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (62, 'Douglas', 'Costa', 'Midfielder', 11, 4);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (63, 'Sami', 'Khedira', 'Midfielder', 6, 4);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (64, 'Claudio', 'Marchisio', 'Midfielder', 8, 4);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (65, 'Blase', 'Matuidi', 'Midfielder', 14, 4);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (66, 'Mario', 'Mandzukic', 'Striker', 17, 4);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (67, 'Gonzalo', 'Higuain', 'Striker', 9, 4);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (68, 'Paulo', 'Dybala', 'Striker', 10, 4);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (69, 'Miralem', 'Pjanic', 'Midfielder', 5, 4);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (70, 'Kwadwo', 'Asamoah', 'Midfielder', 22, 4);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (71, 'Mattia', 'De Sciglio', 'Defender', 2, 4);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (72, 'Stefano', 'Sturaro', 'Midfielder', 27, 4);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (73, 'Keylor', 'Navas', 'Keeper', 1, 5);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (74, 'Dani', 'Carvajal', 'Defender', 2, 5);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (75, 'Sergio', 'Ramos', 'Defender', 4, 5);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (76, 'Raphael', 'Varane', 'Defender', 5, 5);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (77, 'Marcelo', 'da Silva', 'Defender', 12, 5);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (78, 'Marcos', 'Asensio', 'Midfielder', 20, 5);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (79, 'Carlos', 'Casemiro', 'Midfielder', 14, 5);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (80, 'Isco', 'Suarez', 'Midfielder', 22, 5);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (81, 'Toni', 'Kroos', 'Midfielder', 8, 5);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (82, 'Luka', 'Modric', 'Midfielder', 10, 5);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (83, 'Gareth', 'Bale', 'Striker', 11, 5);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (84, 'Karim', 'Benzema', 'Striker', 9, 5);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (85, 'Cristiano', 'Ronaldo', 'Striker', 7, 5);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (86, 'Lucas', 'Vazquez', 'Midfielder', 17, 5);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (87, 'Nacho', 'Iglesias', 'Defender', 6, 5);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (88, 'Alvaro', 'Tejero', 'Defender', 27, 5);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (89, 'Theo', 'Hernandez', 'Defender', 15, 5);
INSERT INTO `Player` (`id`, `first_name`, `last_name`, `position`, `number`, `team_id`) VALUES (90, 'Dani', 'Ceballos', 'Midfielder', 24, 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Trophy`
-- -----------------------------------------------------
START TRANSACTION;
USE `RealFootball`;
INSERT INTO `Trophy` (`team_id`, `champions_league`, `league_titles`, `league_cups`) VALUES (1, 1, 6, 12);
INSERT INTO `Trophy` (`team_id`, `champions_league`, `league_titles`, `league_cups`) VALUES (2, 5, 18, 15);
INSERT INTO `Trophy` (`team_id`, `champions_league`, `league_titles`, `league_cups`) VALUES (3, 5, 28, 24);
INSERT INTO `Trophy` (`team_id`, `champions_league`, `league_titles`, `league_cups`) VALUES (4, 2, 33, 19);
INSERT INTO `Trophy` (`team_id`, `champions_league`, `league_titles`, `league_cups`) VALUES (5, 12, 33, 29);

COMMIT;
