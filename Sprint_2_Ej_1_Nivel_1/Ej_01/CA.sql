SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Cul dAmpolla
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Cul dAmpolla` ;

-- -----------------------------------------------------
-- Schema Cul dAmpolla
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Cul dAmpolla` DEFAULT CHARACTER SET utf8 ;
USE `Cul dAmpolla` ;

-- -----------------------------------------------------
-- Table `Cul dAmpolla`.`Proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul dAmpolla`.`Proveedores` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(60) NOT NULL,
  `ciudad` VARCHAR(30) NOT NULL,
  `pais` VARCHAR(30) NOT NULL,
  `telefono` INT(9) NOT NULL,
  `fax` VARCHAR(50) NULL,
  `nif` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul dAmpolla`.`Gafas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul dAmpolla`.`Gafas` (
  `idGafa` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(30) NOT NULL,
  `graduacion` FLOAT NULL,
  `montura` ENUM('flotante', 'pasta', 'metalica') NOT NULL,
  `colorMontura` VARCHAR(20) NULL,
  `colorCristal` VARCHAR(20) NULL,
  `precio` FLOAT NOT NULL,
  `idProveedor` INT NOT NULL,
  PRIMARY KEY (`idGafa`),
  CONSTRAINT `idProveedor`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `Cul dAmpolla`.`Proveedores` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `id_idx` ON `Cul dAmpolla`.`Gafas` (`idProveedor` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Cul dAmpolla`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul dAmpolla`.`Clientes` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(45) NULL,
  `telefono` INT(9) NOT NULL,
  `email` VARCHAR(45) NULL,
  `fecha_registro` DATE NOT NULL,
  `recomendado` INT NULL,
  PRIMARY KEY (`idCliente`),
  CONSTRAINT `recomendado`
    FOREIGN KEY (`recomendado`)
    REFERENCES `Cul dAmpolla`.`Clientes` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `recomendado_idx` ON `Cul dAmpolla`.`Clientes` (`recomendado` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `Cul dAmpolla`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul dAmpolla`.`Empleado` (
  `idEmpleado` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idEmpleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Cul dAmpolla`.`Ventas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Cul dAmpolla`.`Ventas` (
  `idVentas` INT NOT NULL AUTO_INCREMENT,
  `empleado` INT NOT NULL,
  `cliente` INT NOT NULL,
  `gafa` INT NOT NULL,
  PRIMARY KEY (`idVentas`),
  CONSTRAINT `empleado`
    FOREIGN KEY (`empleado`)
    REFERENCES `Cul dAmpolla`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cliente`
    FOREIGN KEY (`cliente`)
    REFERENCES `Cul dAmpolla`.`Clientes` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `gafa`
    FOREIGN KEY (`gafa`)
    REFERENCES `Cul dAmpolla`.`Gafas` (`idGafa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `empleado_idx` ON `Cul dAmpolla`.`Ventas` (`empleado` ASC) VISIBLE;

CREATE INDEX `cliente_idx` ON `Cul dAmpolla`.`Ventas` (`cliente` ASC) VISIBLE;

CREATE INDEX `gafa_idx` ON `Cul dAmpolla`.`Ventas` (`gafa` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
