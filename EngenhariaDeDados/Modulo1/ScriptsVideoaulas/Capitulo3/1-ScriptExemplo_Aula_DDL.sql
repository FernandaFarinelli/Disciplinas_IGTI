/*
Script prática linguagem DML
Curso bootcamp de Engenheiro de Dados IGTI
Professora: Fernanda Farinelli
*/


-- CREATE DATABASE livraria;
-- CREATE DATABASE IF NOT EXIST livraria;

USE livraria;

CREATE TABLE autor (
  `idautor` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `email` varchar(50) NULL,
  `datanascimento` date NULL,
  `paisnascimento` varchar(50),
  PRIMARY KEY (`idautor`)
);

CREATE TABLE `autoria` (
  `id_livro` int NOT NULL,
  `idautor` int NOT NULL,
  PRIMARY KEY (`id_livro`,`idautor`),
  KEY `fk_autoria_autor` (`idautor`),
  KEY `fk_autoria_livro` (`id_livro`),
  CONSTRAINT `fk_autoria_autor` FOREIGN KEY (`idautor`) REFERENCES `autor` (`idautor`),
  CONSTRAINT `fk_autoria_livro` FOREIGN KEY (`id_livro`) REFERENCES `livro` (`id_livro`)
);

CREATE TABLE `genero` (
  `idgenero` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(100) NOT NULL,
  PRIMARY KEY (`idgenero`)
);

CREATE TABLE `cliente` (
  `idcliente` int NOT NULL AUTO_INCREMENT,
  `nomecliente` varchar(150) NOT NULL,
  `dddtelefone` varchar(3) DEFAULT NULL,
  `telefone` varchar(15) DEFAULT NULL,
  `datacadastro` date NOT NULL,
  `endereco` varchar(100) DEFAULT NULL,
  `cidade`  varchar(45) NULL,
  PRIMARY KEY (`idcliente`),
  CONSTRAINT `fk_cliente_cidade` FOREIGN KEY (`cidade`) REFERENCES `cidade` (`codigo_cidade`)  
);

/*
CREATE TABLE `editora` (
  `codigo_editora` int NOT NULL AUTO_INCREMENT,
  `nome_editora` varchar(100) NOT NULL,
  `telefone` varchar(45) NULL,
  `codigo_cidade` varchar(45) NULL,
  PRIMARY KEY (`codigo_editora`)
);
*/


ALTER TABLE `livraria`.`autor` 
DROP COLUMN `datanascimento`,
ADD COLUMN `biografia` TEXT NULL;

ALTER TABLE `livro` 
ADD COLUMN `idioma` varchar(20) NULL AFTER `codigo_editora`,
ADD COLUMN `idgenero` int NULL AFTER `idioma`,
ADD COLUMN `preco` float NULL AFTER `idgenero`,
ADD INDEX `fk_livro_genero` (`idgenero` ASC);

ALTER TABLE `livraria`.`livro` 
ADD CONSTRAINT `fk_livro_genero`
  FOREIGN KEY (`idgenero`)
  REFERENCES `livraria`.`genero` (`idgenero`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `livraria`.`editora` 
MODIFY COLUMN `nomeeditora` VARCHAR(150) NOT NULL ;  
  
ALTER TABLE `livraria`.`editora` 
CHANGE COLUMN `nomeeditora` `nome_editora` VARCHAR(150) NOT NULL ,
CHANGE COLUMN `telefone` `telefone` VARCHAR(15) NULL ;

ALTER TABLE `livraria`.`cliente` 
ADD COLUMN cpfcliente VARCHAR(20) NULL,
ADD UNIQUE INDEX `CPF_UNIQUE` (`cpfcliente` ASC);

ALTER TABLE `livraria`.`editora` 
ADD COLUMN `CNPJ` VARCHAR(20) NULL,
ADD UNIQUE INDEX `CNPJ_UNIQUE` (`CNPJ` ASC) VISIBLE;

ALTER TABLE `livraria`.`editora` 
ADD COLUMN  `codigo_cidade`  varchar(45) NULL;

ALTER TABLE `livraria`.`editora` 
DROP COLUMN `CNPJ`;

ALTER TABLE `livraria`.`editora` 
DROP COLUMN `cidade`;


CREATE TABLE funcionario (
  `id_func` int NOT NULL AUTO_INCREMENT,
  `nome_func` varchar(255) NOT NULL,
  `nascimento` date NOT NULL,
  `salario` decimal(10,2) DEFAULT NULL,
  `depto` int DEFAULT NULL,  
  `CPF_func` varchar(11) DEFAULT NULL,
  `idade` int unsigned NOT NULL,
  `sexo` char(1) DEFAULT NULL,
  `estado_civil` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_func`)
);

DROP TABLE `funcionario`;

CREATE INDEX `cliente_DataCadastro_idx` ON `cliente` (`datacadastro`) ;

CREATE INDEX `cliente_cidade_idx` ON `cliente` (`cidade` DESC) ;
 
ALTER TABLE `cliente` DROP INDEX `cliente_cidade_idx`;

CREATE VIEW `cidade_mg_vw` AS
	SELECT *
	FROM cidade
	WHERE codigo_estado_ibge = 31;

DROP VIEW `cidade_MG_vw`;  






