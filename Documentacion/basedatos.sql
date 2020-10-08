-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

DROP SCHEMA IF EXISTS HOSPITAL;
CREATE SCHEMA IF NOT EXISTS HOSPITAL;
USE HOSPITAL;

-- -----------------------------------------------------
-- Table PACIENTE
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS PACIENTE (
  codigo VARCHAR(100) NOT NULL,
  nombre VARCHAR(100) NOT NULL,
  sexo VARCHAR(45) NOT NULL,
  fecha_nacimiento DATE NOT NULL,
  dpi VARCHAR(13) NOT NULL,
  telefono VARCHAR(13) NOT NULL,
  peso VARCHAR(45) NOT NULL,
  sangre VARCHAR(45) NOT NULL,
  correo VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  PRIMARY KEY (codigo));


-- -----------------------------------------------------
-- Table MEDICO
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS MEDICO (
  `codigo` VARCHAR(100) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `colegiado` VARCHAR(45) NOT NULL,
  `DPI` VARCHAR(13) NOT NULL,
  `telefono` VARCHAR(13) NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  `hora_entrada` TIME NOT NULL,
  `hora_salida` TIME NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`codigo`));


-- -----------------------------------------------------
-- Table ADMIN
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS ADMINISTRADOR (
  `codigo` VARCHAR(100) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `DPI` VARCHAR(13) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`codigo`));


-- -----------------------------------------------------
-- Table ESPECIALIDAD
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS ESPECIALIDAD (
  `nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`nombre`));


-- -----------------------------------------------------
-- Table CONSULTA
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS CONSULTA (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `costo` DOUBLE NOT NULL,
  `ESPECIALIDAD_nombre` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`codigo`,`ESPECIALIDAD_nombre`),
    FOREIGN KEY (`ESPECIALIDAD_nombre`)
    REFERENCES ESPECIALIDAD (`nombre`));


-- -----------------------------------------------------
-- Table CITA_MEDICA
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS CITA_MEDICA (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `PACIENTE_codigo` VARCHAR(30) NOT NULL,
  `MEDICO_codigo` VARCHAR(100) NOT NULL,
  `CONSULTA_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`,`fecha`,`hora`,`MEDICO_codigo`),
    FOREIGN KEY (`PACIENTE_codigo`)
    REFERENCES PACIENTE (`codigo`),
    FOREIGN KEY (`MEDICO_codigo`)
    REFERENCES MEDICO (`codigo`),
    FOREIGN KEY (`CONSULTA_codigo`)
    REFERENCES  CONSULTA (`codigo`));


-- -----------------------------------------------------
-- Table EXAMEN
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS EXAMEN (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(100) NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  `orden` TINYINT NOT NULL,
  `costo` DOUBLE NOT NULL,
  `tipo_archivo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`));
    

-- -----------------------------------------------------
-- Table LABORATORISTA
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS LABORATORISTA (
  `codigo` VARCHAR(100) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `registro` VARCHAR(45) NOT NULL,
  `DPI` VARCHAR(13) NOT NULL,
  `telefono` VARCHAR(13) NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `EXAMEN_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`),
  FOREIGN KEY (`EXAMEN_codigo`)
  REFERENCES EXAMEN (`codigo`));



-- -----------------------------------------------------
-- Table CITA_EXAMEN
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS CITA_EXAMEN (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `orden_medico` LONGBLOB,
  `PACIENTE_codigo` VARCHAR(30) NOT NULL,
  `EXAMEN_codigo` INT NOT NULL,
  `LABORATORISTA_codigo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`codigo`),
    FOREIGN KEY (`PACIENTE_codigo`)
    REFERENCES PACIENTE (`codigo`),
    FOREIGN KEY (`LABORATORISTA_codigo`)
    REFERENCES LABORATORISTA (`codigo`));


-- -----------------------------------------------------
-- Table INFORME_CONSULTA
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS INFORME_CONSULTA (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(300) NOT NULL,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `CONSULTA_codigo` INT NOT NULL,
  `PACIENTE_codigo` VARCHAR(30) NOT NULL,
  `MEDICO_codigo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`codigo`),
    FOREIGN KEY (`CONSULTA_codigo`)
    REFERENCES CONSULTA (`codigo`),
    FOREIGN KEY (`PACIENTE_codigo`)
    REFERENCES PACIENTE (`codigo`),
    FOREIGN KEY (`MEDICO_codigo`)
    REFERENCES MEDICO (`codigo`));


-- -----------------------------------------------------
-- Table INFORME_EXAMEN
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS INFORME_EXAMEN (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(300) NOT NULL,
  `fecha` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `EXAMEN_codigo` INT NOT NULL,
  `PACIENTE_codigo` VARCHAR(30) NOT NULL,
  `LABORATORISTA_codigo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`codigo`),
    FOREIGN KEY (`EXAMEN_codigo`)
    REFERENCES EXAMEN (`codigo`),
    FOREIGN KEY (`PACIENTE_codigo`)
    REFERENCES PACIENTE (`codigo`),
    FOREIGN KEY (`LABORATORISTA_codigo`)
    REFERENCES LABORATORISTA (`codigo`));



-- -----------------------------------------------------
-- Table ESPECIALIZACION
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS ESPECIALIZACION (
  `ESPECIALIDAD_nombre` VARCHAR(100) NOT NULL,
  `MEDICO_codigo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`ESPECIALIDAD_nombre`, `MEDICO_codigo`),
    FOREIGN KEY (`ESPECIALIDAD_nombre`)
    REFERENCES ESPECIALIDAD (`nombre`),
    FOREIGN KEY (`MEDICO_codigo`)
    REFERENCES MEDICO (`codigo`));


-- -----------------------------------------------------
-- Table ORDEN_EXAMEN
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS ORDEN_EXAMEN (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `descripcion` VARCHAR(300) NOT NULL,
  `PACIENTE_codigo` VARCHAR(30) NOT NULL,
  `MEDICO_codigo` VARCHAR(100) NOT NULL,
  `EXAMEN_codigo` INT NOT NULL,
  PRIMARY KEY (`codigo`),
    FOREIGN KEY (`PACIENTE_codigo`)
    REFERENCES PACIENTE (`codigo`),
    FOREIGN KEY (`MEDICO_codigo`)
    REFERENCES MEDICO (`codigo`),
    FOREIGN KEY (`EXAMEN_codigo`)
    REFERENCES EXAMEN (`codigo`));




-- -----------------------------------------------------
-- Table DIAS_TRABAJO
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS DIAS_TRABAJO (
  `codigo` INT NOT NULL AUTO_INCREMENT,
  `dia` VARCHAR(45) NOT NULL,
  `LABORATORISTA_codigo` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`codigo`),
    FOREIGN KEY (`LABORATORISTA_codigo`)
    REFERENCES LABORATORISTA (`codigo`));
