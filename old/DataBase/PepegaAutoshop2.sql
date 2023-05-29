-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema pepega_autoshop
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema pepega_autoshop
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `pepega_autoshop` DEFAULT CHARACTER SET utf8 ;
USE `pepega_autoshop` ;

-- -----------------------------------------------------
-- Table `pepega_autoshop`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pepega_autoshop`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(15) NULL,
  `Apellido1` VARCHAR(15) NULL,
  `Apellido2` VARCHAR(15) NULL,
  `Direccion` VARCHAR(75) NULL,
  `Telefono` VARCHAR(12) NULL,
  `RFC` VARCHAR(20) NULL,
  `Correo` VARCHAR(65) NULL,
  `codigoPostal` VARCHAR(10) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepega_autoshop`.`Vehiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pepega_autoshop`.`Vehiculo` (
  `Placa` VARCHAR(7) NOT NULL,
  `Marca` VARCHAR(15) NULL,
  `Modelo` VARCHAR(45) NULL,
  `Año` VARCHAR(45) NULL,
  `Color` VARCHAR(45) NULL,
  `idCliente` INT NOT NULL,
  `Estado` VARCHAR(10) NULL,
  PRIMARY KEY (`Placa`),
  INDEX `ClienteVehiculo_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `ClienteVehiculo`
    FOREIGN KEY (`idCliente`)
    REFERENCES `pepega_autoshop`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepega_autoshop`.`Promociones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pepega_autoshop`.`Promociones` (
  `idPromo` INT NOT NULL AUTO_INCREMENT,
  `FechaInicio` DATE NULL,
  `FechaFin` DATE NULL,
  `Descuento` INT NULL,
  `Descripcion` VARCHAR(50) NULL,
  PRIMARY KEY (`idPromo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepega_autoshop`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pepega_autoshop`.`Departamento` (
  `idDepartamento` INT NOT NULL AUTO_INCREMENT,
  `NombreDepartamento` VARCHAR(70) NULL,
  `idSupervisor` VARCHAR(20) NULL,
  PRIMARY KEY (`idDepartamento`),
  INDEX `SupervisorDepa_idx` (`idSupervisor` ASC) VISIBLE,
  CONSTRAINT `SupervisorDepa`
    FOREIGN KEY (`idSupervisor`)
    REFERENCES `pepega_autoshop`.`Empleado` (`CURP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepega_autoshop`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pepega_autoshop`.`Empleado` (
  `CURP` VARCHAR(20) NOT NULL,
  `Nombre` VARCHAR(15) NULL,
  `Apellido1` VARCHAR(15) NULL,
  `Apellido2` VARCHAR(15) NULL,
  `Salario` VARCHAR(10) NULL,
  `idDepartamento` INT NOT NULL,
  PRIMARY KEY (`CURP`),
  INDEX `DepartamentoEmp_idx` (`idDepartamento` ASC) VISIBLE,
  CONSTRAINT `DepartamentoEmp`
    FOREIGN KEY (`idDepartamento`)
    REFERENCES `pepega_autoshop`.`Departamento` (`idDepartamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepega_autoshop`.`Venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pepega_autoshop`.`Venta` (
  `idCliente` INT NOT NULL,
  `idVenta` INT NOT NULL AUTO_INCREMENT,
  `Fecha` DATE NULL,
  `Total` VARCHAR(15) NULL,
  PRIMARY KEY (`idVenta`),
  INDEX `ClienteVenta_idx` (`idCliente` ASC) VISIBLE,
  CONSTRAINT `ClienteVenta`
    FOREIGN KEY (`idCliente`)
    REFERENCES `pepega_autoshop`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepega_autoshop`.`Trabajo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pepega_autoshop`.`Trabajo` (
  `idTrabajo` INT NOT NULL,
  `idVehiculo` VARCHAR(7) NULL,
  `CostoParticular` VARCHAR(10) NULL,
  `idPromo` INT NULL,
  `idVenta` INT NULL,
  `idEmpleadoS` VARCHAR(20) NULL,
  PRIMARY KEY (`idTrabajo`),
  INDEX `VehiculoTrabajo_idx` (`idVehiculo` ASC) VISIBLE,
  INDEX `PromoTrabajo_idx` (`idPromo` ASC) VISIBLE,
  INDEX `VentaTrabajo_idx` (`idVenta` ASC) VISIBLE,
  INDEX `EmpleadoTrabajo_idx` (`idEmpleadoS` ASC) VISIBLE,
  CONSTRAINT `VehiculoTrabajo`
    FOREIGN KEY (`idVehiculo`)
    REFERENCES `pepega_autoshop`.`Vehiculo` (`Placa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PromoTrabajo`
    FOREIGN KEY (`idPromo`)
    REFERENCES `pepega_autoshop`.`Promociones` (`idPromo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `VentaTrabajo`
    FOREIGN KEY (`idVenta`)
    REFERENCES `pepega_autoshop`.`Venta` (`idVenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `EmpleadoTrabajo`
    FOREIGN KEY (`idEmpleadoS`)
    REFERENCES `pepega_autoshop`.`Empleado` (`CURP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepega_autoshop`.`TrabajoIndividual`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pepega_autoshop`.`TrabajoIndividual` (
  `idEmpeadoR` VARCHAR(20) NULL,
  `idTrabajo` INT NULL,
  `idTrabajoIndividual` INT NOT NULL AUTO_INCREMENT,
  `Descripcion` VARCHAR(255) NULL,
  `Garantia` INT NULL,
  `Fecha` DATE NULL,
  INDEX `TrabajoTI_idx` (`idTrabajo` ASC) VISIBLE,
  PRIMARY KEY (`idTrabajoIndividual`),
  CONSTRAINT `EmpeadoTI`
    FOREIGN KEY (`idEmpeadoR`)
    REFERENCES `pepega_autoshop`.`Empleado` (`CURP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `TrabajoTI`
    FOREIGN KEY (`idTrabajo`)
    REFERENCES `pepega_autoshop`.`Trabajo` (`idTrabajo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepega_autoshop`.`Refacciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pepega_autoshop`.`Refacciones` (
  `idProducto` INT NOT NULL AUTO_INCREMENT,
  `NombreProducto` VARCHAR(15) NULL,
  `Clase` VARCHAR(10) NULL,
  `Inventario` VARCHAR(5) NULL,
  `PrecioUnitario` VARCHAR(15) NULL,
  `Descripcion` VARCHAR(255) NULL,
  PRIMARY KEY (`idProducto`),
  INDEX `Precio` (`PrecioUnitario` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepega_autoshop`.`VentaIndividual`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pepega_autoshop`.`VentaIndividual` (
  `idProducto` INT NOT NULL,
  `idVenta` INT NOT NULL,
  `Cantidad` VARCHAR(45) NULL,
  `idPromo` INT NULL,
  `Precio` VARCHAR(15) NULL,
  INDEX `ProductoVI_idx` (`idProducto` ASC) VISIBLE,
  INDEX `VentaVI_idx` (`idVenta` ASC) VISIBLE,
  INDEX `PromoVI_idx` (`idPromo` ASC) VISIBLE,
  INDEX `PrecioUnitarioVI_idx` (`Precio` ASC) VISIBLE,
  PRIMARY KEY (`idProducto`, `idVenta`),
  CONSTRAINT `ProductoVI`
    FOREIGN KEY (`idProducto`)
    REFERENCES `pepega_autoshop`.`Refacciones` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `VentaVI`
    FOREIGN KEY (`idVenta`)
    REFERENCES `pepega_autoshop`.`Venta` (`idVenta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PromoVI`
    FOREIGN KEY (`idPromo`)
    REFERENCES `pepega_autoshop`.`Promociones` (`idPromo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `PrecioUnitarioVI`
    FOREIGN KEY (`Precio`)
    REFERENCES `pepega_autoshop`.`Refacciones` (`PrecioUnitario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepega_autoshop`.`Garantia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pepega_autoshop`.`Garantia` (
  `idGarantia` INT NOT NULL AUTO_INCREMENT,
  `idTrabajo` INT NULL,
  `FechaInicio` DATE NULL,
  `FechaFin` DATE NULL,
  `Aplicada` TINYINT NULL,
  `Descripcion` VARCHAR(255) NULL,
  PRIMARY KEY (`idGarantia`),
  INDEX `TrabajoGarantia_idx` (`idTrabajo` ASC) VISIBLE,
  CONSTRAINT `TrabajoGarantia`
    FOREIGN KEY (`idTrabajo`)
    REFERENCES `pepega_autoshop`.`Trabajo` (`idTrabajo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepega_autoshop`.`HistorialRef`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pepega_autoshop`.`HistorialRef` (
  `idProducto` INT NOT NULL,
  `FechaInicio` DATE NOT NULL,
  `fechaEliminacion` DATE NOT NULL,
  `idAutorizador` VARCHAR(20) NULL,
  `nuevoPrecio` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`idProducto`, `nuevoPrecio`, `FechaInicio`, `fechaEliminacion`),
  CONSTRAINT `ProductoHistorial`
    FOREIGN KEY (`idProducto`)
    REFERENCES `pepega_autoshop`.`Refacciones` (`idProducto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `pepega_autoshop`.`Diagnostico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `pepega_autoshop`.`Diagnostico` (
  `Placa` VARCHAR(7) NOT NULL,
  `idTrabajo` INT NULL,
  `Descripcion` VARCHAR(255) NULL,
  PRIMARY KEY (`Placa`),
  INDEX `TrabajoDiagnostico_idx` (`idTrabajo` ASC) VISIBLE,
  CONSTRAINT `TrabajoDiagnostico`
    FOREIGN KEY (`idTrabajo`)
    REFERENCES `pepega_autoshop`.`Trabajo` (`idTrabajo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
