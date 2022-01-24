-- Carga direta na DIM_Estado

INSERT INTO `livrariadw`.`dim_estado` (`codigo_estado_ibge`,`nome_estado`,`sigla_estado`)
SELECT `estado`.`codigo_estado_ibge`,
    `estado`.`nome_estado`,
    `estado`.`sigla_estado`
FROM `livraria`.`estado`;

-- Carga direta na DIM_Cidade

INSERT INTO `livrariadw`.`dim_cidade`(`codigo_cidade`,`nome_cidade`,`codigo_estado_ibge`)
SELECT `cidade`.`codigo_cidade`,
        `cidade`.`nome_cidade`,
    `cidade`.`codigo_estado_ibge`
FROM `livraria`.`cidade`;

UPDATE livrariadw.dim_cidade
INNER JOIN livrariadw.dim_estado ON dim_cidade.codigo_estado_ibge = dim_estado.codigo_estado_IBGE
SET dim_cidade.id_dim_estado = dim_estado.id_dim_estado;


-- Carga direta na DIM_Editora
INSERT INTO `livrariadw`.`dim_editora`(`codigo_editora`,`nome_editora`)
SELECT `editora`.`codigo_editora`,    `editora`.`nome_editora`
FROM `livraria`.`editora`;

-- Carga direta na DIM_Livro
INSERT INTO `livrariadw`.`dim_livro`(`id_livro`,`titulo_livro`)
SELECT `livro`.`id_livro`,    `livro`.`titulo_livro`
FROM `livraria`.`livro`;

-- Carga DIM_tempo
CALL `livrariadw`.`CargaDimTempo`();
