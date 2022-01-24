/*
Script prática linguagem DML
Curso bootcamp de Engenheiro de Dados IGTI
Professora: Fernanda Farinelli

Carga na tabela livro.
Deve ser executado somente após inserir os dados nas tabelas de Editora e Genero
*/

USE livraria;

INSERT INTO `livraria`.`livro`(`id_livro`,`titulo_livro`,`numero_edicao`,`ano_edicao`,`codigo_editora`,`idioma`,`idgenero`,`preco`)
VALUES(1,"Pelas Ruas de Calcutá",1,1990,5,"Português",1,36.1);
INSERT INTO `livraria`.`livro`(`id_livro`,`titulo_livro`,`numero_edicao`,`ano_edicao`,`codigo_editora`,`idioma`,`idgenero`,`preco`)
VALUES(2,"Devoted - Devoção",1,2000,4,"Português",1,27.2);
INSERT INTO `livraria`.`livro`(`id_livro`,`titulo_livro`,`numero_edicao`,`ano_edicao`,`codigo_editora`,`idioma`,`idgenero`,`preco`)
VALUES(3,"Rápido e Devagar - Duas Formas de Pensar",3,2015,8,"Inglês",3,43.9);
INSERT INTO `livraria`.`livro`(`id_livro`,`titulo_livro`,`numero_edicao`,`ano_edicao`,`codigo_editora`,`idioma`,`idgenero`,`preco`)
VALUES(4,"Xô, Bactéria! Tire Suas Dúvidas Com Dr. Bactéria",10,2019,4,"Português",NULL,32.7);
INSERT INTO `livraria`.`livro`(`id_livro`,`titulo_livro`,`numero_edicao`,`ano_edicao`,`codigo_editora`,`idioma`,`idgenero`,`preco`)
VALUES(5,"P.s. - Eu Te Amo ",4,2010,4,"Português",4,23.5);
INSERT INTO `livraria`.`livro`(`id_livro`,`titulo_livro`,`numero_edicao`,`ano_edicao`,`codigo_editora`,`idioma`,`idgenero`,`preco`)
VALUES(6,"O Que Esperar Quando Você Está Esperando",3,2000,4,"Português",NULL,37.8);
INSERT INTO `livraria`.`livro`(`id_livro`,`titulo_livro`,`numero_edicao`,`ano_edicao`,`codigo_editora`,`idioma`,`idgenero`,`preco`)
VALUES(7,"As Melhores Frases Em Veja",1,2017,4,"Português",7,23.9);
INSERT INTO `livraria`.`livro`(`id_livro`,`titulo_livro`,`numero_edicao`,`ano_edicao`,`codigo_editora`,`idioma`,`idgenero`,`preco`)
VALUES(8,"Bichos Monstruosos",1,2015,12,"Português",6,24.9);
INSERT INTO `livraria`.`livro`(`id_livro`,`titulo_livro`,`numero_edicao`,`ano_edicao`,`codigo_editora`,`idioma`,`idgenero`,`preco`)
VALUES(9,"Casas Mal Assombradas",1,1995,10,"Português",6,27.9);
INSERT INTO `livraria`.`livro`(`id_livro`,`titulo_livro`,`numero_edicao`,`ano_edicao`,`codigo_editora`,`idioma`,`idgenero`,`preco`)
VALUES(10,"Colapso",12,2005,13,"Português",6,92.9);
INSERT INTO `livraria`.`livro`(`id_livro`,`titulo_livro`,`numero_edicao`,`ano_edicao`,`codigo_editora`,`idioma`,`idgenero`,`preco`)
VALUES(11,"Colapso",12,2005,13,"Inglês",6,92.9);
INSERT INTO `livraria`.`livro`(`id_livro`,`titulo_livro`,`numero_edicao`,`ano_edicao`,`codigo_editora`,`idioma`,`idgenero`,`preco`)
VALUES(12,"Armas, germes e aço",23,2017,13,"Português",6,100.99);
INSERT INTO `livraria`.`livro`(`id_livro`,`titulo_livro`,`numero_edicao`,`ano_edicao`,`codigo_editora`,`idioma`,`idgenero`,`preco`)
VALUES(13,"Memórias Póstumas de Brás Cubas",1,1881,1,"Português",5,22.50);
INSERT INTO `livraria`.`livro`(`id_livro`,`titulo_livro`,`numero_edicao`,`ano_edicao`,`codigo_editora`,`idioma`,`idgenero`,`preco`)
VALUES(14,"Memórias Póstumas de Brás Cubas",1,1881,1,"Espanhol",9,22.50);
INSERT INTO `livraria`.`livro`(`id_livro`,`titulo_livro`,`numero_edicao`,`ano_edicao`,`codigo_editora`,`idioma`,`idgenero`,`preco`)
VALUES(15,"Memórias Póstumas de Brás Cubas",1,1881,12,"Inglês",5,22.50);
INSERT INTO `livraria`.`livro`(`id_livro`,`titulo_livro`,`numero_edicao`,`ano_edicao`,`codigo_editora`,`idioma`,`idgenero`,`preco`)
VALUES(16,"Dom Casmurro",1,1899,1,"Português",5,25.90);
INSERT INTO `livraria`.`livro`(`id_livro`,`titulo_livro`,`numero_edicao`,`ano_edicao`,`codigo_editora`,`idioma`,`idgenero`,`preco`)
VALUES(17,"Dom Casmurro",1,1899,12,"Inglês",5,35.90);
INSERT INTO `livraria`.`livro`(`id_livro`,`titulo_livro`,`numero_edicao`,`ano_edicao`,`codigo_editora`,`idioma`,`idgenero`,`preco`)
VALUES(18,"Dom Casmurro",1,1899,1,"Espanhol",5,25.90);
INSERT INTO `livraria`.`livro`(`id_livro`,`titulo_livro`,`numero_edicao`,`ano_edicao`,`codigo_editora`,`idioma`,`idgenero`,`preco`)
VALUES(19,"Quincas Borba",1,1891,5,"Português",5,35.90);
INSERT INTO `livraria`.`livro`(`id_livro`,`titulo_livro`,`numero_edicao`,`ano_edicao`,`codigo_editora`,`idioma`,`idgenero`,`preco`)
VALUES(20,"Quincas Borba",1,1891,5,"Inglês",5,46.90);
INSERT INTO `livraria`.`livro`(`id_livro`,`titulo_livro`,`numero_edicao`,`ano_edicao`,`codigo_editora`,`idioma`,`idgenero`,`preco`)
VALUES(21,"Quincas Borba",1,1891,5,"Espanhol",5,35.90);
INSERT INTO `livraria`.`livro`(`id_livro`,`titulo_livro`,`numero_edicao`,`ano_edicao`,`codigo_editora`,`idioma`,`idgenero`,`preco`)
VALUES(22,"Sapiens: Uma breve história da humanidade",1,2018,5,"Português",6,50.00);
INSERT INTO `livraria`.`livro`(`id_livro`,`titulo_livro`,`numero_edicao`,`ano_edicao`,`codigo_editora`,`idioma`,`idgenero`,`preco`)
VALUES(23,"Sapiens: Uma breve história da humanidade",1,2018,5,"Alemão",6,50.00);
