CREATE DATABASE cine;
USE cine;
CREATE TABLE cuentas (
id_cuenta INTEGER UNSIGNED PRIMARY KEY,
saldo DECIMAL(11,2) UNSIGNED CHECK (saldo >= 0)
);
CREATE TABLE entradas (
id_butaca INTEGER UNSIGNED PRIMARY KEY,
nif VARCHAR(9)
);
INSERT INTO cuentas VALUES(1, 300);
INSERT INTO cuentas VALUES(2, 200);
INSERT INTO cuentas VALUES(3, 350);
INSERT INTO cuentas VALUES(4, 450);
INSERT INTO cuentas VALUES(5, 250);
INSERT INTO cuentas VALUES(6, 400);
INSERT INTO cuentas VALUES(7, 240);