1. ---------------------------
USE tienda;
DELIMITER $$
DROP FUNCTION IF EXISTS total_productos$$
CREATE FUNCTION total_productos()
RETURNS INT
BEGIN
DECLARE total INT;
SET total = (SELECT COUNT(*) FROM producto);
RETURN total;
END

DELIMITER ;
SELECT total_productos();

2. ---------------------------

USE tienda;
DELIMITER $$
DROP FUNCTION IF EXISTS precio_medio$$
CREATE FUNCTION precio_medio(nombre_fabricante VARCHAR(50))
RETURNS FLOAT
BEGIN
DECLARE media FLOAT;
SET media = (SELECT AVG(precio)
FROM producto
WHERE codigo_fabricante = (
SELECT codigo
FROM fabricante
WHERE fabricante.nombre = nombre_fabricante));
RETURN media;
END

DELIMITER ;
SELECT precio_medio('Unilever');

3. ---------------------------

USE tienda;
DELIMITER $$
DROP FUNCTION IF EXISTS precio_maximo_fabricante$$
CREATE FUNCTION precio_maximo_fabricante(nombre_fabricante VARCHAR(50))
RETURNS FLOAT
BEGIN
DECLARE media FLOAT;
SET media = (SELECT MAX(precio)
FROM producto
WHERE codigo_fabricante = (
SELECT codigo
FROM fabricante
WHERE fabricante.nombre = nombre_fabricante));
RETURN media;
END

DELIMITER ;
SELECT precio_maximo_fabricante('Johnson & Johnson');

4. ---------------------------
USE tienda;
DELIMITER $$
DROP FUNCTION IF EXISTS precio_minimo_fabricante$$
CREATE FUNCTION precio_minimo_fabricante(nombre_fabricante VARCHAR(50))
RETURNS FLOAT
BEGIN
DECLARE media FLOAT;
SET media = (SELECT MIN(precio)
FROM producto
WHERE codigo_fabricante = (
SELECT codigo
FROM fabricante
WHERE fabricante.nombre = nombre_fabricante));
RETURN media;
END
DELIMITER ;
SELECT precio_minimo_fabricante('Johnson & Johnson');
