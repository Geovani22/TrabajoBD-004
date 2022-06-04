DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO `fabricante`(`codigo`, `nombre`) VALUES ('1','Palmolive');
INSERT INTO `fabricante`(`codigo`, `nombre`) VALUES ('2','Unilever');
INSERT INTO `fabricante`(`codigo`, `nombre`) VALUES ('3','Johnson & Johnson');
INSERT INTO `fabricante`(`codigo`, `nombre`) VALUES ('4','Tecnoquimicas');
INSERT INTO `fabricante`(`codigo`, `nombre`) VALUES ('5','Procter & gamble');
INSERT INTO `fabricante`(`codigo`, `nombre`) VALUES ('6','Bayer s.a.');
INSERT INTO `fabricante`(`codigo`, `nombre`) VALUES ('7','Beiersdorf s.a.');

INSERT INTO `producto`(`codigo`, `nombre`, `precio`, `codigo_fabricante`) VALUES ('11','Colgate','5500','1');
INSERT INTO `producto`(`codigo`, `nombre`, `precio`, `codigo_fabricante`) VALUES ('21','Rexona desodorante barra','18500','2');
INSERT INTO `producto`(`codigo`, `nombre`, `precio`, `codigo_fabricante`) VALUES ('22','Savital','12500','2');
INSERT INTO `producto`(`codigo`, `nombre`, `precio`, `codigo_fabricante`) VALUES ('31','Jabon johnson x3','7700','3');
INSERT INTO `producto`(`codigo`, `nombre`, `precio`, `codigo_fabricante`) VALUES ('32','Gel Ego','9950','3');
INSERT INTO `producto`(`codigo`, `nombre`, `precio`, `codigo_fabricante`) VALUES ('41','Yodora','5800','4');
INSERT INTO `producto`(`codigo`, `nombre`, `precio`, `codigo_fabricante`) VALUES ('51','Prestobarba gillete','3900','5');
INSERT INTO `producto`(`codigo`, `nombre`, `precio`, `codigo_fabricante`) VALUES ('61','Talco mexana','3600','6');
INSERT INTO `producto`(`codigo`, `nombre`, `precio`, `codigo_fabricante`) VALUES ('71','Crema de afeitar nivea','25100','7');