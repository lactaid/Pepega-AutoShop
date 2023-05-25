-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Pepega AutoShop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Pepega AutoShop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Pepega AutoShop` DEFAULT CHARACTER SET utf8 ;
USE `Pepega AutoShop` ;

-- -----------------------------------------------------
-- Table `Pepega AutoShop`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pepega AutoShop`.`Clientes` (
  `idCliente` VARCHAR(10) NOT NULL,
  `Nombre` VARCHAR(15) NULL,
  `Apellido1` VARCHAR(15) NULL,
  `Apellido2` VARCHAR(15) NULL,
  `Direccion` VARCHAR(30) NULL,
  `Telefono` VARCHAR(12) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pepega AutoShop`.`Vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pepega AutoShop`.`Vehiculo` (
  `idVehiculo` VARCHAR(10) NOT NULL,
  `Marca` VARCHAR(15) NULL,
  `Modelo` VARCHAR(45) NULL,
  `Año` VARCHAR(45) NULL,
  `Color` VARCHAR(45) NULL,
  `idCliente` VARCHAR(10) NOT NULL,
  `Estado` VARCHAR(10) NULL,
  PRIMARY KEY (`idVehiculo`),
  INDEX `ClienteVehiculo_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `ClienteVehiculo`
    FOREIGN KEY (`idCliente`)
    REFERENCES `Pepega AutoShop`.`Clientes` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pepega AutoShop`.`Promociones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pepega AutoShop`.`Promociones` (
  `idPromo` VARCHAR(10) NOT NULL,
  `FechaInicio` DATE NULL,
  `FechaFin` DATE NULL,
  `Descuento` INT NULL,
  `Descripcion` VARCHAR(50) NULL,
  PRIMARY KEY (`idPromo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pepega AutoShop`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pepega AutoShop`.`Departamento` (
  `idDepartamento` VARCHAR(10) NOT NULL,
  `dniSupervisor` INT NULL,
  PRIMARY KEY (`idDepartamento`),
  INDEX `SupervisorDepa_idx` (`dniSupervisor` ASC) VISIBLE,
  CONSTRAINT `SupervisorDepa`
    FOREIGN KEY (`dniSupervisor`)
    REFERENCES `Pepega AutoShop`.`Empleado` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pepega AutoShop`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pepega AutoShop`.`Empleado` (
  `dni` INT NOT NULL,
  `Nombre` VARCHAR(15) NULL,
  `Apellido1` VARCHAR(15) NULL,
  `Apellido2` VARCHAR(15) NULL,
  `idDepartamento` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`dni`),
  INDEX `DepartamentoEmp_idx` (`idDepartamento` ASC) VISIBLE,
  CONSTRAINT `DepartamentoEmp`
    FOREIGN KEY (`idDepartamento`)
    REFERENCES `Pepega AutoShop`.`Departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pepega AutoShop`.`Venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pepega AutoShop`.`Venta` (
  `idCliente` VARCHAR(10) NOT NULL,
  `idVenta` VARCHAR(10) NOT NULL,
  `Fecha` DATE NULL,
  `Total` VARCHAR(8) NULL,
  PRIMARY KEY (`idVenta`),
  INDEX `ClienteVenta_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `ClienteVenta`
    FOREIGN KEY (`idCliente`)
    REFERENCES `Pepega AutoShop`.`Clientes` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pepega AutoShop`.`Trabajo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pepega AutoShop`.`Trabajo` (
  `idTrabajo` VARCHAR(10) NOT NULL,
  `idVehiculo` VARCHAR(10) NULL,
  `CostoParticular` VARCHAR(8) NULL,
  `idPromo` VARCHAR(10) NULL,
  `idVenta` VARCHAR(10) NULL,
  PRIMARY KEY (`idTrabajo`),
  INDEX `VehiculoTrabajo_idx` (`idVehiculo` ASC) VISIBLE,
  INDEX `PromoTrabajo_idx` (`idPromo` ASC) VISIBLE,
  INDEX `VentaTrabajo_idx` (`idVenta` ASC) VISIBLE,
  CONSTRAINT `VehiculoTrabajo`
    FOREIGN KEY (`idVehiculo`)
    REFERENCES `Pepega AutoShop`.`Vehiculo` (`idVehiculo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PromoTrabajo`
    FOREIGN KEY (`idPromo`)
    REFERENCES `Pepega AutoShop`.`Promociones` (`idPromo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `VentaTrabajo`
    FOREIGN KEY (`idVenta`)
    REFERENCES `Pepega AutoShop`.`Venta` (`idVenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pepega AutoShop`.`TrabajoIndividual`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pepega AutoShop`.`TrabajoIndividual` (
  `idEmpeadoR` INT NULL,
  `idTrabajo` VARCHAR(45) NULL,
  `idTrabajoIndividual` VARCHAR(10) NOT NULL,
  `Descripcion` VARCHAR(50) NULL,
  INDEX `TrabajoTI_idx` (`idTrabajo` ASC) VISIBLE,
  PRIMARY KEY (`idTrabajoIndividual`),
  CONSTRAINT `EmpeadoTI`
    FOREIGN KEY (`idEmpeadoR`)
    REFERENCES `Pepega AutoShop`.`Empleado` (`dni`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TrabajoTI`
    FOREIGN KEY (`idTrabajo`)
    REFERENCES `Pepega AutoShop`.`Trabajo` (`idTrabajo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pepega AutoShop`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pepega AutoShop`.`Producto` (
  `idProducto` VARCHAR(10) NOT NULL,
  `NombreProducto` VARCHAR(15) NULL,
  `Clase` VARCHAR(10) NULL,
  `Inventario` VARCHAR(5) NULL,
  `PrecioUnitario` VARCHAR(8) NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `Precio` (`PrecioUnitario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pepega AutoShop`.`VentaIndividual`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Pepega AutoShop`.`VentaIndividual` (
  `idProducto` VARCHAR(10) NOT NULL,
  `idVenta` VARCHAR(10) NOT NULL,
  `Cantidad` VARCHAR(45) NULL,
  `idPromo` VARCHAR(10) NULL,
  `Precio` VARCHAR(8) NULL,
  INDEX `ProductoVI_idx` (`idProducto` ASC) VISIBLE,
  INDEX `VentaVI_idx` (`idVenta` ASC) VISIBLE,
  INDEX `PromoVI_idx` (`idPromo` ASC) VISIBLE,
  INDEX `PrecioUnitarioVI_idx` (`Precio` ASC) VISIBLE,
  PRIMARY KEY (`idProducto`, `idVenta`),
  CONSTRAINT `ProductoVI`
    FOREIGN KEY (`idProducto`)
    REFERENCES `Pepega AutoShop`.`Producto` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `VentaVI`
    FOREIGN KEY (`idVenta`)
    REFERENCES `Pepega AutoShop`.`Venta` (`idVenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PromoVI`
    FOREIGN KEY (`idPromo`)
    REFERENCES `Pepega AutoShop`.`Promociones` (`idPromo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PrecioUnitarioVI`
    FOREIGN KEY (`Precio`)
    REFERENCES `Pepega AutoShop`.`Producto` (`PrecioUnitario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
