1. ---------------------------

DELIMITER $$
DROP PROCEDURE IF EXISTS comprar_entrada$$
CREATE PROCEDURE comprar_entrada(
    IN nif VARCHAR(9),
    IN id_cuenta INT UNSIGNED,
    IN id_butaca INT UNSIGNED,
    OUT ERROR TINYINT UNSIGNED
)
BEGIN
    DECLARE CONTINUE
HANDLER FOR
    1264,
    1062
BEGIN
    SET ERROR
        = 1;
END;
START TRANSACTION
    ;
SET ERROR
    = 0;
UPDATE
    cuentas
SET
    saldo = saldo - 5
WHERE
    cuentas.id_cuenta = id_cuenta;
INSERT INTO entradas
VALUES(id_butaca, nif);
IF ERROR = 0 THEN
COMMIT
    ; ELSE
ROLLBACK
    ;
END IF;
END;
DELIMITER ;
CALL comprar_entrada('106795455', 1, 1, @error);
CALL comprar_entrada('106795455', 1, 2, @error);
CALL comprar_entrada('106795455', 1, 3, @error);
CALL comprar_entrada('106795455', 1, 4, @error);
CALL comprar_entrada('106795455', 1, 5, @error);
CALL comprar_entrada('835362475', 2, 6, @error);
CALL comprar_entrada('835362475', 2, 7, @error);
CALL comprar_entrada('835362475', 2, 8, @error);
CALL comprar_entrada('835362475', 2, 9, @error);
CALL comprar_entrada('835362475', 2, 10, @error);
CALL comprar_entrada('774098859', 3, 11, @error);
CALL comprar_entrada('455840739', 8, 10, @error);
SELECT @error;
SELECT * FROM cuentas;
SELECT * FROM entradas;

