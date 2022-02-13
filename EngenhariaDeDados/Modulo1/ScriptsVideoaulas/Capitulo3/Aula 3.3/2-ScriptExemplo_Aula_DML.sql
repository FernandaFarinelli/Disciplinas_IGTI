/*
Script prática linguagem DML
Curso bootcamp de Engenheiro de Dados IGTI
Professora: Fernanda Farinelli
*/

-- Todos os comandos foram alterados para se adaptarem ao modelo criado na aula 2.8.2
-- As principais alteraçòes referem-se aos nomes de colunas

use livraria;

/*
Para garantir que os dados seja criados corretamente execute os comando abaixo para definir o auto-incremento para 1
*/
ALTER TABLE editora AUTO_INCREMENT = 1;
ALTER TABLE autor AUTO_INCREMENT = 1;
ALTER TABLE cliente AUTO_INCREMENT = 1;
ALTER TABLE genero AUTO_INCREMENT = 1;
ALTER TABLE livro AUTO_INCREMENT = 1;


-- Inserir uma cidade localizada em um estado inexistente
-- O valor da chave estrangeira (codigo_estado_ibge) não existe na tabela cidade como chave primária
-- Observação: Este comando abaixo foi modificado apenas para servir de demonstração, não esta exatamente igual à videoaula 3.3
INSERT INTO cidade(codigoIBGE,codigocidadeIBGE,nomecidade,codigoestadoIBGE)
VALUES ('11100015','00015','Alta Floresta D''Oeste',54);

-- Veja que ocorre o erro
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (cidade, CONSTRAINT fk_cidade_estado FOREIGN KEY (codigo_estado_ibge) REFERENCES estado (codigo_estado_ibge) ON DELETE RESTRICT ON UPDATE CASCADE)
-- Isto significa que não pode inserir um filho sem pai. Veja na tabela estado que não existe o estado de código 54
SELECT * FROM estado;

-- Observação: Este comando abaixo foi modificado apenas para servir de demonstração, não esta exatamente igual à videoaula 3.3
-- Inserir o estado onde codigo_estado_ibge = 54
INSERT INTO estado(codigoestadoibge,nomeestado,siglaestado,regiao) VALUES (54,'Estado de Teste','ET','Nenhuma');

SELECT * FROM estado;

-- Inserir cidade para este estado
INSERT INTO cidade(codigoIBGE,codigocidadeIBGE,nomecidade,codigoestadoIBGE)
VALUES ('11100015','00015','Alta Floresta D''Oeste',54);

-- O comando foi adaptado para correponder ao modelo da aula 2.8.2
-- Inserir e Update dados
INSERT INTO editora(codigoeditora,nomeeditora,telefone_editora,cnpj,codigoIBGE)
VALUES (1,"Casa dos Espiritos",NULL,NULL,3550308);

INSERT INTO editora(nomeeditora,telefone_editora,codigoIBGE)
VALUES ("Editora Lê","3145678952",3106200);

-- Note que as colunas telefone_editora e cnpj aceitam nulo, por isso podem ser omitidas
-- Já a coluna codigoeditora é auto incremento, por isso podem ser omitida

INSERT INTO editora(nomeeditora,telefone_editora,codigoIBGE)
VALUES ("Moderna",NULL,3550308),("Objetiva","3199684562",3106200),("Manole","1124537859",4314902);

-- Com Erro
INSERT INTO editora VALUES ("Novo Conceito",NULL,1302603); -- Faltou informar o valor do ID

-- Sem Erro

INSERT INTO editora VALUES (6,"Novo Conceito",NULL,NULL,1302603);

INSERT INTO editora(nomeeditora,codigoIBGE) VALUES ("Benvirá",5300108);

INSERT INTO editora VALUES (DEFAULT,"Scipione",NULL,NULL,5300108);

INSERT INTO editora(nomeeditora,codigoIBGE) VALUES ("Atica",3550308);
INSERT INTO editora(nomeeditora,telefone_editora,codigoIBGE) VALUES ("Campus",NULL,3304557);
INSERT INTO editora(nomeeditora,telefone_editora,codigoIBGE)VALUES ("Objetiva","145263987",3304557);
INSERT INTO editora(nomeeditora,telefone_editora,codigoIBGE) VALUES ("Bookman","214578963",3304557);

INSERT INTO editora (codigoeditora,nomeeditora,telefone_editora,cnpj,codigoIBGE) VALUES (13,'Record', '124578256', '147852369','3550308');

SELECT * FROM editora; -- Veja que temos 13 editoras inseridas

-- Alteração de dados
UPDATE editora SET nomeeditora = "Novatec" WHERE codigoeditora = 11;

UPDATE editora SET nomeeditora = "Novatec ltda", telefone_editora = NULL
WHERE codigoeditora = 11;

UPDATE editora SET telefone_editora = "Não informado" WHERE telefone_editora IS NULL;

-- Com erro pq cnpj deve ser único, assim, não pode repetir 'Não informado'
UPDATE editora SET cnpj = "Não informado" WHERE cnpj IS NULL;

-- Excluir editora de código 11
DELETE FROM editora WHERE  codigoeditora = 11;

-- Excluir cidade e estado inserido
-- INSERT INTO estado(codigoestadoibge,nomeestado,siglaestado,regiao) VALUES (54,'Estado de Teste','ET','Nenhuma');
-- INSERT INTO cidade(codigoIBGE,codigocidadeIBGE,nomecidade,codigoestadoIBGE) VALUES ('11100015','00015','Alta Floresta D''Oeste',54);

DELETE FROM estado WHERE  codigoestadoIBGE = 54; -- Vai dar erro pq não pode excluir um estado que tem cidade cadastrada nele

-- Precisa excluir a cidade (filho) primeiro e só depois o estado (pai)
DELETE FROM cidade WHERE  codigoestadoIBGE = 54;
DELETE FROM estado WHERE  codigoestadoIBGE = 54;

-- Comandos adaptados e inseridos apenas para você praticar
-- Inserir clientes 
INSERT INTO cliente (nomecliente,datacadastro) VALUES ('José Maria',current_date());
INSERT INTO cliente (nomecliente,datacadastro) VALUES ('José Luiz',current_date() - INTERVAL 1 DAY );
INSERT INTO cliente (nomecliente,dddtelefone,telefone,datacadastro) VALUES ('Maria Amélia','31','123654',current_date() - INTERVAL 1 MONTH );
INSERT INTO cliente (nomecliente,dddtelefone,telefone,datacadastro) VALUES ('Luciana Alves','41','985632147',current_date() - INTERVAL 10 MONTH );

UPDATE cliente SET telefone = "Não informado" WHERE telefone IS NULL; -- Update com Condição
UPDATE cliente SET endereco = "Não informado" WHERE idcliente = 2; -- Update com Condição
UPDATE cliente SET endereco = "Não informado" WHERE nomecliente LIKE 'Luciana%'; -- Update com Condição

-- Consulta clientes 
SELECT * FROM cliente;

-- Update e Delete dados sem informar a condição (WHERE)

UPDATE cliente SET telefone = "Não informado"; -- Update sem Condição

-- Consulta clientes 
SELECT * FROM cliente;

DELETE FROM cliente WHERE idcliente = 1; -- Delete com Condição

-- Consulta clientes 
SELECT * FROM cliente;

DELETE FROM cliente; -- Delete sem Condição

-- Consulta clientes 
SELECT * FROM cliente; 

-- Criar tabela area_conhecimento conforme aula 3.3
CREATE TABLE area_conhecimento (
  id_area_conhecimento int NOT NULL AUTO_INCREMENT,
  dsc_area_conhecimento varchar(100) NOT NULL,
  PRIMARY KEY (id_area_conhecimento)
);

INSERT INTO area_conhecimento (dsc_area_conhecimento) VALUES ('Espiritualismo'),('Infanto-Juvenil'),('Economia'), ('Medicina'), ('Romance');
INSERT INTO area_conhecimento (id_area_conhecimento, dsc_area_conhecimento) 
VALUES ('6', 'História'),('7', 'Ficção'),('8', 'Humor'),('9', 'Física'),(11,'História');


SELECT * FROM area_conhecimento;

UPDATE area_conhecimento SET dsc_area_conhecimento = "Engenharia"; -- Sem condição

SELECT * FROM area_conhecimento;

DELETE FROM area_conhecimento WHERE id_area_conhecimento = 6;

DELETE FROM area_conhecimento; -- Sem condição

SELECT * FROM area_conhecimento;

INSERT INTO area_conhecimento (dsc_area_conhecimento) VALUES ('Economia'), ('Medicina'), ('Romance');

SELECT * FROM area_conhecimento;

COMMIT; -- Confirmar comandos DML

-- Apagar todos os dados da tabelas
TRUNCATE TABLE area_conhecimento;

DROP TABLE area_conhecimento;

-- Manipulação de views
-- Se a view não estiver criada, criar

CREATE VIEW cidade_mg_vw AS
	SELECT *
	FROM cidade
	WHERE codigo_estado_ibge = 31;
    
SELECT * FROM cidade_mg_vw ORDER BY codigoIBGE DESC;

INSERT INTO   cidade_mg_vw VALUES ("9999999","999","TESTE VIEW",31); -- Inseri dado na view

SELECT * FROM cidade_mg_vw ORDER BY codigoIBGE DESC;

SELECT * FROM cidade ORDER BY codigoIBGE DESC;

UPDATE cidade_mg_vw SET nomecidade = "TESTE UPDATE VIEW" WHERE codigocidadeIBGE = "999";

SELECT * FROM cidade_mg_vw ORDER BY codigoIBGE DESC;

SELECT * FROM cidade ORDER BY codigoIBGE DESC;

DELETE FROM cidade_mg_vw  WHERE codigocidadeIBGE = "999";

SELECT * FROM cidade_mg_vw ORDER BY codigoIBGE DESC;

SELECT * FROM cidade ORDER BY codigoIBGE DESC;

DROP VIEW cidade_MG_vw;

SELECT * FROM cidade_mg_vw;
SELECT * FROM cidade;