-- -----------------------------------------------------------------------------------------------------------
-- MBA Engenheiro(a) de Dados
-- Módulo 1 - Fundamentos em Engenharia de Dados
-- Professora: Fernanda Farinelli
-- 
-- Exemplo de dimensão tempo
-- Dentre as diversas dimensões de um DW, a dimensão tempo é uma das mais relevantes pois ela que demarca
-- o histórico de dados. O ideal que ela tenha a granularidade de dia.
-- A Dimensão Tempo costuma ser complexa no mundo real, ou seja, com informações como: Data, Dia, Mês, Ano,
-- Trimestre, Semestre, nome do dia da semana, nome do mês, etc.
-- Diferente das outras dimensões, a tempo pode ser carregada antecipadamente, de uma só vez e não requer
-- fonte de dados. Assim, podemos criar a dimensão e carregar com todos os dias a partir do ano desejado.
-- ------------------------------------------------------------------------------------------------------------

-- -----------------------------------------------------
-- Create Schema 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS Modulo1_DW ;
-- -----------------------------------------------------
-- Use Schema 
-- -----------------------------------------------------
USE Modulo1_DW;

-- -----------------------------------------------------
-- Create Table 
-- -----------------------------------------------------
 
 CREATE TABLE Modulo1_DW.Dim_Tempo_Completa (
 PK_Dim_Tempo_Completa INTEGER NOT NULL AUTO_INCREMENT
 , DataCompleta DATE NOT NULL
 , Ano_Data INT
 , Mes_Data INT
 , Dia_Data INT
 , Num_Dia_Semana INT
 , Num_Dia_Ano INT
 , Nome_Mes VARCHAR(10)
 , Nome_Dia_semana VARCHAR(10)
 , Trimestre INT
 , Semestre INT
 , PRIMARY KEY (PK_DIM_Tempo_Completa)
); 	       

-- Antes de proceguir, execute a consulta abaixo:
SELECT @@lc_time_names; -- Verifica o valor da variável lc_time_names (exclusiva do MySQL)
-- A variável de sistema lc_time_names indica a localidade no qual seu SGBD esta utilizando.
-- Por padrão, na instalação é definada como 'en_US' ou seja, Inglês americano.
-- Este valor controla o idioma usado para exibir nomes e abreviações de dia e mês.
-- Assim, para garantir que esta variável vai retornar os valores para português (Brasil), 
-- execute o comando a seguir:
SET lc_time_names = 'pt_BR';

-- -----------------------------------------------------------------------------------------------
-- Create Procedure (sem parâmetro)
-- Neste caso, o ano esta fixo dentro da procedure, neste caso é o ano de 2022 
-- -----------------------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE Modulo1_DW.cargaDimTempoCompleta()
BEGIN

	DECLARE dataInicial DATE;
    DECLARE dataFinal DATE;
    
    -- Neste caso, a data inicial e final é fixa, defina a seguir
    SET dataInicial = '2022-01-01'; 
    SET dataFinal = '2022-12-31';    
    SET lc_time_names = 'pt_BR'; -- Altera o padrão de idioma para potuguês.
    
    WHILE dataInicial <= dataFinal DO
		INSERT INTO modulo1_dw.dim_tempo_completa(DataCompleta,Ano_Data,Mes_Data,Dia_Data,
        Num_Dia_Semana,Num_Dia_Ano,
        Nome_Mes,Nome_Dia_semana,Trimestre,
        Semestre)
        VALUES (dataInicial , YEAR(dataInicial),MONTH(dataInicial),DAY(dataInicial),
        DAYOFWEEK(dataInicial), DAYOFYEAR(dataInicial),
        MONTHNAME(dataInicial), DAYNAME(dataInicial),QUARTER(dataInicial),
        IF(QUARTER(dataInicial) < 3, 1, 2)
        );
	
		SET dataInicial = dataInicial + INTERVAL 1 Day;
        
    END WHILE;

END$$
DELIMITER ;

-- --------------------------------------------------------------------------------
-- Create Procedure (com parâmetro)
-- Quando acionar a procedure deve ser passado o número do ano que deseja carregar
-- --------------------------------------------------------------------------------
DELIMITER $$
CREATE PROCEDURE Modulo1_DW.cargaDimTempoCompletaParametro(ano char(4))
BEGIN

	DECLARE dataInicial DATE;
    DECLARE dataFinal DATE;
    

    SET dataInicial = CONCAT(ano,'-01-01');
    SET dataFinal = CONCAT(ano,'-12-31');
    SET lc_time_names = 'pt_BR'; -- Altera o padrão de idioma para potuguês.
    
    WHILE dataInicial <= dataFinal DO
		INSERT INTO modulo1_dw.dim_tempo_completa(DataCompleta,Ano_Data,Mes_Data,Dia_Data,
        Num_Dia_Semana,Num_Dia_Ano,
        Nome_Mes,Nome_Dia_semana,Trimestre,
        Semestre)
        VALUES (dataInicial , YEAR(dataInicial),MONTH(dataInicial),DAY(dataInicial),
        DAYOFWEEK(dataInicial), DAYOFYEAR(dataInicial),
        MONTHNAME(dataInicial), DAYNAME(dataInicial),QUARTER(dataInicial),
        IF(QUARTER(dataInicial) < 3, 1, 2)
        );
	
		SET dataInicial = dataInicial + INTERVAL 1 Day;
    END WHILE;

END$$
DELIMITER ;

-- -------------------------------------------------------------------------------------------------
-- Exemplo de chamada para executar as procedure criadas
-- -------------------------------------------------------------------------------------------------

