/*
Script prática linguagem DML
Curso bootcamp de Engenheiro de Dados IGTI
Professora: Fernanda Farinelli
*/

-- Inserir uma cidade localizada em um estado inexistente
-- O valor da chave estrangeira (codigo_estado_ibge) não existe na tabela cidade como chave primária

INSERT INTO livraria.cidade(codigo_cidade,codigo_cidade_ibge,nome_cidade,codigo_estado_ibge) 
VALUES ('1100015','00015','Alta Floresta D''Oeste',11);

SELECT * FROM estado;

-- Inserir o estado onde codigo_estado_ibge = 11

INSERT INTO estado(codigo_estado_ibge,nome_estado,sigla_estado,regiao) VALUES (11,'Rondónia','RO','Norte');

-- Inserir cidade para este estado
INSERT INTO livraria.cidade(codigo_cidade,codigo_cidade_ibge,nome_cidade,codigo_estado_ibge) 
VALUES ('1100015','00015','Alta Floresta D''Oeste',11);

-- Executar a carga de todas as cidades
-- Abrir arquivo "Script_carga_cidade.sql"
-- Executar todos os comandos

-- Inserir e Update dados

INSERT INTO `livraria`.`editora`(`codigo_editora`,`nome_editora`,`telefone`,`codigo_cidade`) 
VALUES (1,"Casa dos Espiritos",NULL,3550308);

INSERT INTO `livraria`.`editora`(`nome_editora`,`telefone`,`codigo_cidade`) 
VALUES ("Editora Lê","3145678952",3106200);

INSERT INTO `livraria`.`editora`(`nome_editora`,`telefone`,`codigo_cidade`) 
VALUES ("Moderna",NULL,3550308),("Objetiva","3199684562",3106200),("Manole","1124537859",4314902);

-- Com Erro
INSERT INTO `livraria`.`editora` VALUES ("Novo Conceito",NULL,1302603); -- Faltou informar o valor do ID

-- Sem Erro

INSERT INTO `livraria`.`editora` VALUES (6,"Novo Conceito",NULL,1302603);

INSERT INTO `livraria`.`editora`(`nome_editora`,`codigo_cidade`) VALUES ("Benvirá",5300108);

INSERT INTO `livraria`.`editora` VALUES (DEFAULT,"Scipione",NULL,5300108);

INSERT INTO `livraria`.`editora`(`nome_editora`,`telefone`,`codigo_cidade`) VALUES ("Atica",NULL,3550308);
INSERT INTO `livraria`.`editora`(`nome_editora`,`telefone`,`codigo_cidade`) VALUES ("Campus",NULL,3304557);
INSERT INTO `livraria`.`editora`(`nome_editora`,`telefone`,`codigo_cidade`) VALUES ("Objetiva","145263987",3304557);
INSERT INTO `livraria`.`editora`(`nome_editora`,`telefone`,`codigo_cidade`) VALUES ("Bookman","214578963",3304557);
INSERT INTO `livraria`.`editora` (`nome_editora`, `telefone`, `codigo_cidade`) VALUES (13,'Record', '124578256', '3550308');

SELECT * FROM editora;

UPDATE `livraria`.`editora` SET `nome_editora` = "Novatec" WHERE `codigo_editora` = 11;

UPDATE `livraria`.`editora` SET `nome_editora` = "Novatec ltda", `telefone` = NULL
WHERE `codigo_editora` = 11;

UPDATE `livraria`.`editora` SET `telefone` = "Não informado" WHERE `telefone` IS NULL;

DELETE FROM editora WHERE  codigo_editora = 11;


-- Inserir, Update e Delete dados sem informar a condição (WHERE)

UPDATE editora SET `telefone` = "Não informado";

DELETE FROM editora;


CREATE TABLE `area_conhecimento` (
  `id_area_conhecimento` int NOT NULL AUTO_INCREMENT,
  `dsc_area_conhecimento` varchar(100) NOT NULL,
  PRIMARY KEY (`id_area_conhecimento`)
);

INSERT INTO area_conhecimento (dsc_area_conhecimento) VALUES ('Espiritualismo'),('Infanto-Juvenil'),('Economia'), ('Medicina'), ('Romance');
INSERT INTO area_conhecimento (id_area_conhecimento, dsc_area_conhecimento) 
VALUES ('6', 'História'),('7', 'Ficção'),('8', 'Humor'),('9', 'Física'),(11,'História');


SELECT * FROM livraria.area_conhecimento;

UPDATE `livraria`.`area_conhecimento` SET `dsc_area_conhecimento` = "Engenharia";

SELECT * FROM livraria.area_conhecimento;

DELETE FROM area_conhecimento WHERE id_area_conhecimento = 6;

DELETE FROM area_conhecimento; 

SELECT * FROM livraria.area_conhecimento;

INSERT INTO area_conhecimento (dsc_area_conhecimento) VALUES ('Economia'), ('Medicina'), ('Romance');

TRUNCATE TABLE area_conhecimento;

DROP TABLE area_conhecimento;

-- Manipulação de views

CREATE VIEW `cidade_mg_vw` AS
	SELECT *
	FROM cidade
	WHERE codigo_estado_ibge = 31;
    
SELECT * FROM livraria.cidade_mg_vw;

INSERT INTO   livraria.cidade_mg_vw VALUES ("9999999","999","TESTE VIEW",31);

SELECT * FROM livraria.cidade_mg_vw;

SELECT * FROM livraria.cidade;

UPDATE livraria.cidade_mg_vw SET `nome_cidade` = "TESTE UPDATE VIEW" WHERE codigo_cidade_ibge = "999";

SELECT * FROM livraria.cidade_mg_vw;

SELECT * FROM livraria.cidade;

DELETE FROM livraria.cidade_mg_vw  WHERE codigo_cidade_ibge = "999";

SELECT * FROM livraria.cidade_mg_vw;

SELECT * FROM livraria.cidade;

DROP VIEW `cidade_MG_vw`;

SELECT * FROM livraria.cidade_mg_vw;
SELECT * FROM livraria.cidade;