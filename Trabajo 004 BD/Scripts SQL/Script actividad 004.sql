--- Procedimientos sin sentencias SQL ---

1. ---------------------------

DELIMITER $$
CREATE PROCEDURE hola_mundo()
BEGIN
SELECT 'Hola mundo!';
END; $$

CALL hola_mundo();

2. -------------------------

DELIMITER $$
CREATE PROCEDURE verificar_numero(IN numero FLOAT)
BEGIN
IF numero > 0 THEN
SELECT 'El número positivo';
ELSEIF numero < 0 THEN
SELECT 'El número es negativo';
ELSE
SELECT 'El número es 0';
END IF;
END $$

CALL verificar_numero(-1);
CALL verificar_numero(5);
CALL verificar_numero(0);

3. ----------------------------

DELIMITER $$
CREATE PROCEDURE verificar_numero2(IN numero FLOAT, OUT signo VARCHAR(25))
BEGIN
IF numero > 0 THEN
SET signo = 'El número es positivo';
ELSEIF numero < 0 THEN
SET  signo = 'El número es negativo';
ELSE
SET signo = 'El número es cero';
END IF;
END; $$

CALL verificar_numero2(0, @signo);
SELECT @signo;

CALL verificar_numero2(5, @signo);
SELECT @signo;

CALL verificar_numero2(-6, @signo);
SELECT @signo;


4. -----------------------------

DELIMITER $$
CREATE PROCEDURE valor_nota(IN nota FLOAT)
BEGIN
DECLARE calificacion VARCHAR(30);
IF nota >= 0 AND nota < 5 THEN
SET calificacion = 'Insuficiente';
ELSEIF nota >=5 AND nota < 6 THEN
SET calificacion = 'Aprobado';
ELSEIF nota >=6 AND nota < 7 THEN
SET calificacion = 'Bien';
ELSEIF nota >= 7 AND nota < 9 THEN
SET calificacion = 'Notable';
ELSEIF nota >=9 AND nota <= 10 THEN
SET calificacion = 'Sobresaliente';
ELSE
SET calificacion = 'La nota no es válida';
END IF;
SELECT calificacion;
END $$

CALL valor_nota(1);
CALL valor_nota(5);
CALL valor_nota(9);
CALL valor_nota(12);
CALL valor_nota(6);

5. ----------------------------

DELIMITER $$
CREATE PROCEDURE valor_nota2(IN nota FLOAT, OUT texto VARCHAR(20))
BEGIN
IF nota >= 0 AND nota < 5 THEN
SET texto = 'Insuficiente';
ELSEIF nota >= 5 AND nota < 6 THEN
SET texto = 'Aprobado';
ELSEIF nota >= 6 AND nota < 7 THEN
SET texto = 'Bien';
ELSEIF nota >= 7 AND nota < 9 THEN
SET texto = 'Notable';
ELSEIF nota >= 9 AND nota <= 10 THEN
SET texto = 'Sobresaliente';
ELSE
SET texto = 'La nota no es válida';
END IF;
END
$$

CALL valor_nota2(12, @texto);
SELECT @texto;
CALL valor_nota2(1, @texto);
SELECT @texto;
CALL valor_nota2(5, @texto);
SELECT @texto;


6. -----------------------------

DELIMITER $$
CREATE 	PROCEDURE valor_nota3(IN nota FLOAT, OUT texto VARCHAR(20))
BEGIN
CASE
WHEN nota >= 0 AND nota < 5 THEN
SET texto = 'Insuficiente';
WHEN nota >= 5 AND nota < 6  THEN
SET texto = 'Aprobado';
WHEN nota >= 6 AND nota < 7 THEN
SET texto = 'Bien';
WHEN nota >= 7 AND nota < 9 THEN
SET texto = 'Notable';
WHEN nota >= 9 AND nota <= 10 THEN
SET texto = 'Sobresaliente';
ELSE
SET texto = 'La nota no es válida';
END CASE;
END $$

CALL valor_nota3(12, @texto);
SELECT @texto;
CALL valor_nota3(1, @texto);
SELECT @texto;
CALL valor_nota3(5, @texto);
SELECT @texto;

7. ---------------------------------

DELIMITER $$
CREATE PROCEDURE dia_semana(IN dia INT)
BEGIN
DECLARE nombredia VARCHAR(30);
IF dia = 1 THEN
SET nombredia = 'Lunes';
ELSEIF dia = 2 THEN
SET nombredia = 'Martes';
ELSEIF dia = 3  THEN
SET nombredia = 'Miércoles';
ELSEIF dia = 4 THEN
SET nombredia = 'Jueves';
ELSEIF dia = 5 THEN
SET nombredia = 'Viernes';
ELSEIF dia = 6 THEN
SET nombredia = 'Sábado';
ELSEIF dia = 7 THEN
SET nombredia = 'Domingo';
ELSE
SET nombredia= 'Dia no valido';
END IF;
SELECT nombredia;
END $$

CALL dia_semana(2);
CALL dia_semana(1);
CALL dia_semana(6);
CALL dia_semana(0);

--- Procedimientos con sentencias SQL ---

1. ----------------------------------

DELIMITER $$
CREATE PROCEDURE cliente_pais(IN pais VARCHAR(30))
BEGIN
SELECT * FROM cliente WHERE cliente.pais = pais;
END
$$

CALL cliente_pais('colombia');


2. -------------------------------

DELIMITER $$
CREATE PROCEDURE Valormaximo_pago(IN forma_pago VARCHAR(40), OUT valormaximo FLOAT)
BEGIN
SET valormaximo = (
SELECT MAX(total)
FROM pago
WHERE pago.forma_pago = forma_pago);
END
$$

CALL Valormaximo_pago('Efectivo', @maximo);
SELECT @maximo;


3. --------------------------------------

DELIMITER $$
CREATE PROCEDURE calculo_pagos(IN forma_pago VARCHAR(30), OUT pago_maximo FLOAT, OUT pago_minimo FLOAT, OUT valor_medio FLOAT, OUT suma_pagos FLOAT, OUT numero_pagosRealizados INTEGER)
BEGIN
SET pago_maximo = (
SELECT MAX(total)
FROM pago
WHERE pago.forma_pago = forma_pago);
SET pago_minimo = (
SELECT MIN(total)
FROM pago
WHERE pago.forma_pago = forma_pago);
SET valor_medio = (
SELECT AVG(total)
FROM pago
WHERE pago.forma_pago = forma_pago);
SET suma_pagos = (
SELECT SUM(total)
FROM pago
WHERE pago.forma_pago = forma_pago);
SET numero_pagosRealizados = (
SELECT COUNT(total)
FROM pago
WHERE pago.forma_pago = forma_pago);
END
$$

CALL calculo_pagos('Efectivo', @pago_maximo, @pago_minimo, @valor_medio, @suma_pagos,
@numero_pagosRealizados);
SELECT @pago_maximo, @pago_minimo, @valor_medio, @suma_pagos, @numero_pagosRealizados;

4. ----------------------------

CREATE DATABASE procedimientos01;
USE procedimientos01;

CREATE TABLE operaciones (numero INT UNSIGNED, cuadrado INT UNSIGNED);

DELIMITER $$
CREATE PROCEDURE calcular_cuadrados(IN tope INT UNSIGNED)
BEGIN
DECLARE numero INT UNSIGNED;
DELETE FROM operaciones;
SET numero = 1;
WHILE numero <= tope DO
INSERT INTO operaciones VALUES (numero, numero*numero);
SET numero = numero + 1;
END WHILE;
END$$

CALL calcular_cuadrados(14);
SELECT * FROM operaciones;


5. ------------------------

DELIMITER $$
CREATE PROCEDURE calcular_cuadrados2(IN tope INT UNSIGNED)
BEGIN
DECLARE numero INT UNSIGNED;
DELETE FROM operaciones;
SET numero = 1;
REPEAT
INSERT INTO operaciones VALUES (numero, numero*numero);
SET numero = numero + 1;
UNTIL numero > tope
END REPEAT;
END$$

CALL calcular_cuadrados2(18);
SELECT * FROM operaciones;

6. ---------------------------

DELIMITER $$
CREATE PROCEDURE calcular_cuadrados3(IN tope INT UNSIGNED)
BEGIN
DECLARE numero INT UNSIGNED;
DELETE FROM operaciones;
SET numero = 1;
bloop: LOOP
IF numero <= tope THEN
INSERT INTO operaciones VALUES (numero, numero*numero);
SET numero = numero + 1;
ITERATE bloop;
END IF;
LEAVE bloop;
END LOOP;
END$$


CALL calcular_cuadrados3(6);
SELECT * FROM operaciones;

7. -------------------------

CREATE DATABASE procedimientos02;
USE procedimientos02;

CREATE TABLE ejercicio (numero INT UNSIGNED);

DELIMITER $$
CREATE PROCEDURE calcular_numeros(IN valor_inicial INT UNSIGNED)
BEGIN
DECLARE numero INT UNSIGNED;
DELETE FROM ejercicio;
SET numero = valor_inicial;
WHILE numero >= 1 DO
INSERT INTO ejercicio VALUES (numero);
SET numero = numero - 1;
END WHILE;
END$$

CALL calcular_numeros(19);
SELECT * FROM ejercicio;

8. ---------------------------

DELIMITER $$
CREATE PROCEDURE calcular_numeros2(IN valor_inicial INT UNSIGNED)
BEGIN
DECLARE numero INT UNSIGNED;
DELETE FROM ejercicio;
SET numero = valor_inicial;
REPEAT
INSERT INTO ejercicio VALUES (numero);
SET numero = numero - 1;
UNTIL numero < 1
END REPEAT;
END$$

CALL calcular_numeros2(10);
SELECT * FROM ejercicio;

9. -----------------------------

DELIMITER $$
CREATE PROCEDURE calcular_numeros3(IN valor_inicial INT UNSIGNED)
BEGIN
DECLARE numero INT UNSIGNED;
DELETE FROM ejercicio;
SET numero = valor_inicial;
bloop: LOOP
IF numero >= 1 THEN
INSERT INTO ejercicio VALUES (numero);
SET numero = numero - 1;
ITERATE bloop;
END IF;
LEAVE bloop;
END LOOP;
END$$

CALL calcular_numeros3(12);
SELECT * FROM ejercicio;

10. ---------------------------

CREATE DATABASE procedimientos;
USE procedimientos;

CREATE TABLE pares (numero INT UNSIGNED);
CREATE TABLE impares (numero INT UNSIGNED);

DELIMITER $$
CREATE PROCEDURE calcular_pares_impares(IN tope INT UNSIGNED)
BEGIN
DECLARE numero INT UNSIGNED;
DELETE FROM pares;
DELETE FROM impares;
SET numero = 0;
WHILE numero <= tope DO
IF numero % 2 = 0 THEN
INSERT INTO pares VALUES (numero);
ELSE
INSERT INTO impares VALUES (numero);
END IF;
SET numero = numero + 1;
END WHILE;
END$$

CALL calcular_pares_impares(15);
SELECT * FROM pares;
SELECT * FROM impares;

11. ------------------------

DELIMITER $$
CREATE PROCEDURE calcular_pares_impares2(IN tope INT UNSIGNED)
BEGIN
DECLARE numero INT UNSIGNED;
DELETE FROM pares;
DELETE FROM impares;
SET numero = 0;
REPEAT
IF numero % 2 = 0 THEN
INSERT INTO pares VALUES (numero);
ELSE
INSERT INTO impares VALUES (numero);
END IF;
SET numero = numero + 1;
UNTIL numero > tope
END REPEAT;
END$$

CALL calcular_pares_impares2(10);
SELECT * FROM pares;
SELECT * FROM impares;




