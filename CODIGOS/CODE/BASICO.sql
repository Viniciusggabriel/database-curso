--Tem que trocar o delimitador
DELIMITER $

CREATE PROCEDURE NOME(
) --É tipo uma função
BEGIN
 -- Cria um bloco de programação
    SELECT
        *
    FROM
        CLIENTE;
END $
 -- Chamando a PROCEDURE
CALL NOME()$
 -- Com parametros
CREATE PROCEDURE CALC(N1 INT, N2 INT) BEGIN SELECT N1 + N2 FROM SOMA;
END $ CALL CALC(1, 10)$