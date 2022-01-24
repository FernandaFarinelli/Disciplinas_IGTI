DELIMITER $$
CREATE PROCEDURE livrariadw.CargaDimTempo()
BEGIN
    DECLARE ano, min, max INT;
	
	SELECT MIN(ano_edicao) FROM livraria.livro INTO min;
    SELECT MAX(ano_edicao) FROM livraria.livro INTO max;
	
    SET ano = min;
	WHILE ano <= max DO
		INSERT INTO livrariadw.dim_tempo(ano) VALUES(ano);
		SET ano = ano + 1;
    END WHILE;
	
END
$$
DELIMITER ;