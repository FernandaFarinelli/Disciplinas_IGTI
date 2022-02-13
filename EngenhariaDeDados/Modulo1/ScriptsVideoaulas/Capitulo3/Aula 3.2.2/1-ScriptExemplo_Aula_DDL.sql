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
  `idlivro` int NOT NULL,
  `idautor` int NOT NULL,
  PRIMARY KEY (`idlivro`,`idautor`),
  KEY `fk_autoria_autor` (`idautor`),
  KEY `fk_autoria_livro` (`idlivro`),
  CONSTRAINT `fk_autoria_autor` FOREIGN KEY (`idautor`) REFERENCES `autor` (`idautor`),
  CONSTRAINT `fk_autoria_livro` FOREIGN KEY (`idlivro`) REFERENCES `livro` (`idlivro`)
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
  CONSTRAINT `fk_cliente_cidade` FOREIGN KEY (`cidade`) REFERENCES `cidade` (`codigoIBGE`)  
);

ALTER TABLE `livraria`.`autor` 
DROP COLUMN `datanascimento`,
ADD COLUMN `biografia` TEXT NULL;

-- Comando adaptado ao modelo da aula 2.8.2
ALTER TABLE `livro` 
ADD COLUMN `idgenero` int NULL AFTER `idioma`,
ADD COLUMN `preco` float NULL AFTER `idgenero`,
ADD INDEX `fk_livro_genero` (`idgenero` ASC);

/*
-- Comando usado na aula 3.2.2
ALTER TABLE `livro` 
ADD COLUMN `idioma` varchar(20) NULL AFTER `codigo_editora`,
ADD COLUMN `idgenero` int NULL AFTER `idioma`,
ADD COLUMN `preco` float NULL AFTER `idgenero`,
ADD INDEX `fk_livro_genero` (`idgenero` ASC);
*/

-- Criar a tabela funcionario
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

-- Após a criação ou alteração das tabela, use o botão de refresh para visualizar as alterações

-- Criar chave estrangeira 
ALTER TABLE `livraria`.`livro` 
ADD CONSTRAINT `fk_livro_genero`
  FOREIGN KEY (`idgenero`)
  REFERENCES `livraria`.`genero` (`idgenero`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

-- Comando adaptado ao modelo da aula 2.8.2
ALTER TABLE `livraria`.`editora` 
CHANGE COLUMN `nome` `nomeeditora` VARCHAR(100) NOT NULL; -- renomear coluna nome para nomeeditora

-- Comando adaptado ao modelo da aula 2.8.2
ALTER TABLE `livraria`.`editora` 
MODIFY COLUMN `nomeeditora` VARCHAR(150) NOT NULL ;  -- altera o tamanho da coluna

-- Comando adaptado ao modelo da aula 2.8.2
ALTER TABLE `livraria`.`editora` 
CHANGE COLUMN `telefone` `telefone_editora` VARCHAR(15) NULL ;

ALTER TABLE `livraria`.`cliente` 
ADD COLUMN cpfcliente VARCHAR(20) NULL,
ADD UNIQUE INDEX `CPF_UNIQUE` (`cpfcliente` ASC);

-- Comando adaptado ao modelo da aula 2.8.2
ALTER TABLE `livraria`.`editora` 
MODIFY COLUMN `cnpj` VARCHAR(20) NULL,
ADD UNIQUE INDEX `CNPJ_UNIQUE` (`cnpj` ASC);

-- ALTER TABLE `livraria`.`editora` DROP COLUMN `CNPJ`;


-- Excluir a tabela funcionario
DROP TABLE `funcionario`;

-- Criar indices na tabela cliente
CREATE INDEX `cliente_DataCadastro_idx` ON `cliente` (`datacadastro`) ;
CREATE INDEX `cliente_cidade_idx` ON `cliente` (`cidade` DESC) ;
 
-- Excluir indice na tabela cliente
ALTER TABLE `cliente` DROP INDEX `cliente_cidade_idx`;

-- Comando adaptado ao modelo da aula 2.8.2
-- Criar view(visão) que possui apenas as cidade do estado de Minas Gerais
CREATE VIEW `cidade_mg_vw` AS
	SELECT *
	FROM cidade
	WHERE codigoestadoIBGE = 31;

-- Para conferir a view criar use o botão refresh
-- Após criar a view, consultea usando o comando a seguir
SELECT * FROM livraria.cidade_mg_vw;

-- Excluir a view(visão)
DROP VIEW `cidade_MG_vw`;  

-- Para recriar a view(visão) que possui apenas as cidade do estado de Minas Gerais
CREATE VIEW `cidade_mg_vw` AS
	SELECT *
	FROM cidade
	WHERE codigoestadoIBGE = 31;





