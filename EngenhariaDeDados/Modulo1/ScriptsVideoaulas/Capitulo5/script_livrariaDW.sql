-- MySQL Workbench Forward Engineering

-- -----------------------------------------------------
-- Schema livrariadw
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema livrariadw
-- -----------------------------------------------------
DROP SCHEMA `livrariadw`;
CREATE SCHEMA IF NOT EXISTS `livrariadw`;
USE `livrariadw` ;

-- -----------------------------------------------------
-- Table `livrariadw`.`dim_tempo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livrariadw`.`dim_tempo` (
  `id_dim_tempo` INT NOT NULL AUTO_INCREMENT,
  `ano` INT NOT NULL,
  PRIMARY KEY (`id_dim_tempo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `livrariadw`.`dim_livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livrariadw`.`dim_livro` (
  `id_dim_livro` INT NOT NULL AUTO_INCREMENT,
  `titulo_livro` VARCHAR(45) NOT NULL,
  `id_livro` INT NOT NULL,
  PRIMARY KEY (`id_dim_livro`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `livrariadw`.`dim_editora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livrariadw`.`dim_editora` (
  `id_dim_editora` INT NOT NULL AUTO_INCREMENT,
  `nome_editora` VARCHAR(45) NOT NULL,
  `codigo_editora` INT NOT NULL,
  PRIMARY KEY (`id_dim_editora`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `livrariadw`.`dim_estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livrariadw`.`dim_estado` (
  `id_dim_estado` INT NOT NULL AUTO_INCREMENT,
  `nome_estado` VARCHAR(45) NOT NULL,
  `sigla_estado` CHAR(2) NOT NULL,
  `codigo_estado_IBGE` INT NOT NULL,
  PRIMARY KEY (`id_dim_estado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `livrariadw`.`dim_cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livrariadw`.`dim_cidade` (
  `id_dim_cidade` INT NOT NULL AUTO_INCREMENT,
  `nome_cidade` VARCHAR(150) NOT NULL,
  `id_dim_estado` INT NULL,
  `codigo_cidade` VARCHAR(45) NOT NULL,
  `codigo_estado_IBGE` INT NOT NULL,
  PRIMARY KEY (`id_dim_cidade`),
  CONSTRAINT `fk_dim_cidade_dim_estado`
    FOREIGN KEY (`id_dim_estado`)
    REFERENCES `livrariadw`.`dim_estado` (`id_dim_estado`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_dim_cidade_dim_estado_idx` ON `livrariadw`.`dim_cidade` (`id_dim_estado` ASC) ;


-- -----------------------------------------------------
-- Table `livrariadw`.`fato_edicao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livrariadw`.`fato_edicao` (
  `id_dim_tempo` INT NOT NULL,
  `id_dim_editora` INT NOT NULL,
  `id_dim_cidade` INT NOT NULL,
  `id_dim_livro` INT NOT NULL,
  `qtde_editada` INT NULL,
  PRIMARY KEY (`id_dim_tempo`, `id_dim_editora`, `id_dim_cidade`, `id_dim_livro`),
  CONSTRAINT `fk_edicao_dim_tempo1`
    FOREIGN KEY (`id_dim_tempo`)
    REFERENCES `livrariadw`.`dim_tempo` (`id_dim_tempo`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_edicao_dim_editora1`
    FOREIGN KEY (`id_dim_editora`)
    REFERENCES `livrariadw`.`dim_editora` (`id_dim_editora`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_edicao_dim_cidade1`
    FOREIGN KEY (`id_dim_cidade`)
    REFERENCES `livrariadw`.`dim_cidade` (`id_dim_cidade`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_edicao_dim_livro1`
    FOREIGN KEY (`id_dim_livro`)
    REFERENCES `livrariadw`.`dim_livro` (`id_dim_livro`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE INDEX `fk_edicao_dim_tempo1_idx` ON `livrariadw`.`fato_edicao` (`id_dim_tempo` ASC) ;

CREATE INDEX `fk_edicao_dim_editora1_idx` ON `livrariadw`.`fato_edicao` (`id_dim_editora` ASC) ;

CREATE INDEX `fk_edicao_dim_cidade1_idx` ON `livrariadw`.`fato_edicao` (`id_dim_cidade` ASC) ;

CREATE INDEX `fk_edicao_dim_livro1_idx` ON `livrariadw`.`fato_edicao` (`id_dim_livro` ASC) ;

CREATE TABLE `livrariadw`.`temp_fato_edicao` (
  `id_livro` int NOT NULL DEFAULT '0',
  `ano_edicao` int NOT NULL,
  `codigo_editora` int NOT NULL DEFAULT '0',
  `codigo_cidade` varchar(45) NOT NULL,
  `qtde` bigint NOT NULL DEFAULT '0',
  `id_dim_livro` int DEFAULT NULL,
  `id_dim_tempo` int DEFAULT NULL,
  `id_dim_editora` int DEFAULT NULL,
  `id_dim_cidade` int DEFAULT NULL,
  `id_temp` int DEFAULT NULL
);
