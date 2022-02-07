-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema livraria
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema livraria
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `livraria` DEFAULT CHARACTER SET utf8 ;
USE `livraria` ;

-- -----------------------------------------------------
-- Table `livraria`.`autor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livraria`.`autor` (
  `idautor` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `paisnascimento` VARCHAR(50) NULL DEFAULT NULL,
  `biografia` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`idautor`));


-- -----------------------------------------------------
-- Table `livraria`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livraria`.`estado` (
  `codigo_estado_ibge` INT NOT NULL,
  `nome_estado` VARCHAR(50) NOT NULL,
  `sigla_estado` CHAR(2) NOT NULL,
  `regiao` VARCHAR(100) NULL DEFAULT NULL,
  PRIMARY KEY (`codigo_estado_ibge`),
  UNIQUE INDEX `sigla_idx` (`sigla_estado` ASC));


-- -----------------------------------------------------
-- Table `livraria`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livraria`.`cidade` (
  `codigo_cidade` VARCHAR(45) NOT NULL,
  `codigo_cidade_ibge` VARCHAR(10) NOT NULL,
  `nome_cidade` VARCHAR(150) NOT NULL,
  `codigo_estado_ibge` INT NOT NULL,
  PRIMARY KEY (`codigo_cidade`),
  INDEX `codigo_cidade_ibge_idx` (`codigo_cidade_ibge` ASC) ,
  INDEX `fk_cidade_estado_idx` (`codigo_estado_ibge` ASC) ,
  CONSTRAINT `fk_cidade_estado`
    FOREIGN KEY (`codigo_estado_ibge`)
    REFERENCES `livraria`.`estado` (`codigo_estado_ibge`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
;


-- -----------------------------------------------------
-- Table `livraria`.`editora`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livraria`.`editora` (
  `codigo_editora` INT NOT NULL AUTO_INCREMENT,
  `nome_editora` VARCHAR(150) NOT NULL,
  `telefone` VARCHAR(15) NULL DEFAULT NULL,
  `codigo_cidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo_editora`),
  INDEX `fk_editora_cidade1_idx` (`codigo_cidade` ASC) ,
  CONSTRAINT `fk_editora_cidade1`
    FOREIGN KEY (`codigo_cidade`)
    REFERENCES `livraria`.`cidade` (`codigo_cidade`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);


-- -----------------------------------------------------
-- Table `livraria`.`genero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livraria`.`genero` (
  `idgenero` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idgenero`));


-- -----------------------------------------------------
-- Table `livraria`.`livro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livraria`.`livro` (
  `id_livro` INT NOT NULL AUTO_INCREMENT,
  `titulo_livro` VARCHAR(100) NOT NULL,
  `numero_edicao` INT NOT NULL,
  `ano_edicao` INT NOT NULL,
  `codigo_editora` INT NOT NULL,
  `idioma` VARCHAR(20) NULL DEFAULT NULL,
  `idgenero` INT NULL DEFAULT NULL,
  `preco` FLOAT NULL DEFAULT NULL,
  PRIMARY KEY (`id_livro`),
  INDEX `fk_livro_editora1_idx` (`codigo_editora` ASC) ,
  INDEX `fk_livro_genero` (`idgenero` ASC) ,
  CONSTRAINT `fk_livro_editora1`
    FOREIGN KEY (`codigo_editora`)
    REFERENCES `livraria`.`editora` (`codigo_editora`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_livro_genero`
    FOREIGN KEY (`idgenero`)
    REFERENCES `livraria`.`genero` (`idgenero`));


-- -----------------------------------------------------
-- Table `livraria`.`autoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livraria`.`autoria` (
  `id_livro` INT NOT NULL,
  `idautor` INT NOT NULL,
  PRIMARY KEY (`id_livro`, `idautor`),
  INDEX `fk_autoria_autor` (`idautor` ASC) ,
  INDEX `fk_autoria_livro` (`id_livro` ASC) ,
  CONSTRAINT `fk_autoria_autor`
    FOREIGN KEY (`idautor`)
    REFERENCES `livraria`.`autor` (`idautor`),
  CONSTRAINT `fk_autoria_livro`
    FOREIGN KEY (`id_livro`)
    REFERENCES `livraria`.`livro` (`id_livro`));


-- -----------------------------------------------------
-- Table `livraria`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `livraria`.`cliente` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `nomecliente` VARCHAR(150) NOT NULL,
  `dddtelefone` VARCHAR(3) NULL DEFAULT NULL,
  `telefone` VARCHAR(15) NULL DEFAULT NULL,
  `datacadastro` DATE NOT NULL,
  `endereco` VARCHAR(100) NULL DEFAULT NULL,
  `cidade` VARCHAR(45) NULL DEFAULT NULL,
  `cpfcliente` VARCHAR(20) NULL DEFAULT NULL,
  PRIMARY KEY (`idcliente`),
  UNIQUE INDEX `CPF_UNIQUE` (`cpfcliente` ASC) ,
  INDEX `fk_cliente_cidade` (`cidade` ASC) ,
  INDEX `cliente_DataCadastro_idx` (`datacadastro` ASC) ,
  CONSTRAINT `fk_cliente_cidade`
    FOREIGN KEY (`cidade`)
    REFERENCES `livraria`.`cidade` (`codigo_cidade`));


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
