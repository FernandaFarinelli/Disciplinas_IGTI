/*
Script prática linguagem DML
Curso bootcamp de Engenheiro de Dados IGTI
Professora: Fernanda Farinelli
*/

USE livraria;

-- Quais são os generos  cadastrados?
SELECT genero.descricao FROM livraria.genero;
SELECT genero.descricao, UPPER(genero.descricao),LOWER(genero.descricao) FROM livraria.genero;

-- Quais são os distintos (diferentes) generos cadastrados?
SELECT DISTINCT genero.descricao FROM livraria.genero;

-- Qual o nome dos autores cadastrados? Listar por ordem alfabética. TEstar a diferença de ASC e DESC
SELECT nome FROM autor;
SELECT nome FROM autor ORDER BY nome;
SELECT nome FROM autor ORDER BY nome DESC;

-- Operadores aritméticos
-- Se aumentarmos o preco do livro em 10%, qual seria o novo valor? Liste o titulo do livro, valor atual e novo valor.
SELECT titulo_livro,preco as preco_atual, preco+(preco*0.1) as novo_preco, preco*0.1 as valor_aumento
FROM livro;

SELECT titulo_livro,preco as preco_atual, ROUND(preco+(preco*0.1),2) as novo_preco, ROUND(preco*0.1,2) as valor_aumento
FROM livro
GROUP BY titulo_livro;

-- Qual o nome e preço de cada livro?
SELECT titulo_livro, preco FROM livro;
SELECT DISTINCT titulo_livro, preco FROM livro;

-- Filtro por valores nulos
SELECT * FROM autor;
SELECT nome FROM autor WHERE email IS NULL;
SELECT nome FROM autor WHERE email IS NOT NULL;

-- Combinação de múltiplos filtros (condições)

SELECT nome FROM autor WHERE email IS NOT NULL AND paisnascimento = "Brasil";

SELECT nome FROM autor WHERE email IS NOT NULL AND NOT paisnascimento = "Brasil";
SELECT nome FROM autor WHERE email IS NOT NULL AND paisnascimento <> "Brasil";
SELECT nome,email,paisnascimento FROM autor ;

SELECT nome FROM autor WHERE email IS  NULL AND paisnascimento = "Brasil";
SELECT nome FROM autor WHERE email IS  NULL AND paisnascimento <> "Brasil";
SELECT nome FROM autor WHERE email IS  NULL AND NOT paisnascimento = "Brasil";

SELECT nome, email, paisnascimento FROM autor WHERE email IS  NOT NULL OR paisnascimento = "Brasil";

-- Operador LIKE
SELECT * FROM autor;
SELECT nome FROM autor WHERE nome LIKE 'M%';

SELECT nome FROM autor WHERE nome LIKE 'M%' OR nome LIKE 'H%';
SELECT nome FROM autor WHERE nome LIKE 'M%';
SELECT nome FROM autor WHERE nome LIKE '_a%';
SELECT nome FROM autor WHERE nome LIKE '%s';
SELECT nome FROM autor WHERE nome LIKE '%de%';
SELECT nome FROM autor WHERE nome LIKE '% de %';

-- OPERADOR BETWEEN
SELECT titulo_livro, preco FROM livro;

SELECT titulo_livro, preco FROM livro WHERE preco BETWEEN 20 AND 50;


-- FUNÇÕES DE AGREGAÇÃO
-- Qual a quantidade de editoras cadastradas?
SELECT count(*) FROM editora;

-- Qual o valor máximo, mínimo e a média do preço dos livros?
SELECT max(preco),min(preco),avg(preco) FROM livro;
SELECT max(preco), min(preco), avg(preco), ROUND(avg(preco),2) FROM livro;

-- Qual o valor máximo, mínimo e a média do preço de cada livro?
SELECT titulo_livro,max(preco),min(preco),ROUND(avg(preco),2)
FROM livro
GROUP BY titulo_livro;

SELECT titulo_livro, count(*)
FROM livro
GROUP BY titulo_livro
HAVING count(*) > 1;

SELECT titulo_livro,max(preco),min(preco),ROUND(avg(preco),2)
FROM livro
GROUP BY titulo_livro
HAVING avg(preco) > 50;

SELECT titulo_livro,max(preco),min(preco),ROUND(avg(preco),2)
FROM livro
GROUP BY titulo_livro
HAVING min(preco) < avg(preco);

SELECT titulo_livro,max(preco),min(preco),ROUND(avg(preco),2)
FROM livro 
GROUP BY titulo_livro
HAVING min(preco) > 50;

-- CONSULTAS COM JUNÇÕES

SELECT DISTINCT titulo_livro as Titulo, nome as Autor
FROM livro, autoria, autor
WHERE livro.id_livro = autoria.id_livro
AND autoria.idautor = autor.idautor;

SELECT titulo_livro as Titulo, nome as Autor
FROM livro JOIN autoria ON livro.id_livro = autoria.id_livro
	JOIN autor ON autoria.idautor = autor.idautor;
	
SELECT DISTINCT titulo_livro as Titulo, nome as Autor
FROM livro JOIN autoria ON livro.id_livro = autoria.id_livro
	JOIN autor ON autoria.idautor = autor.idautor;

SELECT DISTINCT titulo_livro as Titulo, nome as Autor, descricao as Genero
FROM livro JOIN autoria ON livro.id_livro = autoria.id_livro
	JOIN autor ON autoria.idautor = autor.idautor
    JOIN genero ON livro.idgenero = genero.idgenero;

SELECT *
FROM livro INNER JOIN genero ON livro.idgenero = genero.idgenero;

SELECT *
FROM livro LEFT JOIN genero ON livro.idgenero = genero.idgenero;

SELECT *
FROM livro RIGHT JOIN genero ON livro.idgenero = genero.idgenero;

SELECT *
FROM livro RIGHT JOIN genero ON livro.idgenero = genero.idgenero
ORDER BY id_livro;

SELECT DISTINCT titulo_livro as Titulo, nome as Autor, descricao as Genero
FROM livro JOIN autoria ON livro.id_livro = autoria.id_livro
	JOIN autor ON autoria.idautor = autor.idautor
    JOIN genero ON livro.idgenero = genero.idgenero
WHERE ano_edicao >= 2000 ;

SELECT DISTINCT titulo_livro as Titulo, nome as Autor, descricao as Genero, preco
FROM livro JOIN autoria ON livro.id_livro = autoria.id_livro
	JOIN autor ON autoria.idautor = autor.idautor
    JOIN genero ON livro.idgenero = genero.idgenero
WHERE ano_edicao >= 2000 
ORDER BY preco DESC;

-- 
SELECT DISTINCT titulo_livro as Titulo, nome as Autor
FROM livro RIGHT JOIN autoria ON livro.id_livro = autoria.id_livro
	RIGHT JOIN autor ON autoria.idautor = autor.idautor
ORDER BY livro.id_livro;
	
SELECT DISTINCT titulo_livro as Titulo, nome as Autor
FROM livro LEFT JOIN autoria ON livro.id_livro = autoria.id_livro
	LEFT JOIN autor ON autoria.idautor = autor.idautor
ORDER BY autor.idautor;	

SELECT *
FROM livro INNER JOIN editora ON livro.codigo_editora = editora.codigo_editora
ORDER BY  livro.id_livro;

SELECT *
FROM livro LEFT JOIN editora ON livro.codigo_editora = editora.codigo_editora
ORDER BY  livro.id_livro;

SELECT *
FROM livro RIGHT JOIN editora ON livro.codigo_editora = editora.codigo_editora
ORDER BY  livro.id_livro;

-- Tabelas aninhadas
-- Quais os editoras que possuem livros cadastrados? E as que não possuem?

-- Editoras que possuem livros editados
SELECT DISTINCT codigo_editora
FROM livro ORDER BY 1;
-- Todas as Editoras
SELECT DISTINCT codigo_editora
FROM editora
ORDER BY 1;
-- Editoras que possuem livros editados
SELECT * FROM editora
WHERE codigo_editora IN (1,4,5,8,10,12,13)
ORDER BY 1;

SELECT *
FROM editora
WHERE codigo_editora IN (SELECT DISTINCT codigo_editora FROM livro)
ORDER BY 1;
-- Editoras que não possuem livros editados
SELECT *
FROM editora
WHERE codigo_editora NOT IN (SELECT DISTINCT codigo_editora FROM livro)
ORDER BY 1;

-- Quais os autores possuem mais livros escritos?
-- SELECT autor.nome
SELECT *
FROM (SELECT autoria.idautor as codigo_autor, count(autoria.idautor) as qtde
			FROM autoria GROUP BY autoria.idautor) as q2,
            autor
WHERE autor.idautor = q2.codigo_autor
AND q2.qtde = (SELECT max(q1.qtde)
						  FROM (SELECT autoria.idautor as codigo_autor, count(autoria.idautor) as qtde
									  FROM autoria GROUP BY autoria.idautor) as q1)
									  
									  
									  
									  