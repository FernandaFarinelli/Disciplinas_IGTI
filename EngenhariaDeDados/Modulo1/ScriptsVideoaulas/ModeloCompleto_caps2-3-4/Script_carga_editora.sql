/*
Script prática linguagem DML
Curso bootcamp de Engenheiro de Dados IGTI
Professora: Fernanda Farinelli
*/

-- Inserir e Update dados

INSERT INTO `livraria`.`editora`(`codigo_editora`,`nome_editora`,`telefone`,`codigo_cidade`) 
VALUES (1,"Casa dos Espiritos",NULL,3550308);

INSERT INTO `livraria`.`editora`(`nome_editora`,`telefone`,`codigo_cidade`) 
VALUES ("Editora Lê","3145678952",3106200);

INSERT INTO `livraria`.`editora`(`nome_editora`,`telefone`,`codigo_cidade`) 
VALUES ("Id Editora",NULL,3550308),("Objetiva","3199684562",3106200),("Manole","1124537859",4314902);

INSERT INTO `livraria`.`editora` VALUES (6,"Novo Conceito",NULL,1302603);

INSERT INTO `livraria`.`editora`(`nome_editora`,`codigo_cidade`) VALUES ("Benvirá",5300108);

INSERT INTO `livraria`.`editora` VALUES (DEFAULT,"Scipione",NULL,5300108);

INSERT INTO `livraria`.`editora`(`nome_editora`,`telefone`,`codigo_cidade`) VALUES ("Atica",NULL,3550308);
INSERT INTO `livraria`.`editora`(`nome_editora`,`telefone`,`codigo_cidade`) VALUES ("Campus",NULL,3304557);
INSERT INTO `livraria`.`editora`(`nome_editora`,`telefone`,`codigo_cidade`) VALUES ("Objetiva","145263987",3304557);
INSERT INTO `livraria`.`editora`(`nome_editora`,`telefone`,`codigo_cidade`) VALUES ("Bookman","214578963",3304557);

INSERT INTO `livraria`.`editora` (`codigo_editora`,`nome_editora`, `telefone`, `codigo_cidade`) VALUES (13,'Record', '124578256', '3550308');

SELECT * FROM editora;
