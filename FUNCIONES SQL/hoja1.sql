-- CREACION DE FUNCIONES SQL --
USE WORLD;
DELIMITER $$

CREATE FUNCTION duplica (valor INT)
RETURNS INT 
DETERMINISTIC
BEGIN
	DECLARE resultado INT;
    SET resultado = valor * 2;
    RETURN resultado;
END $$

SELECT duplica(5) AS doble;


-- EJEMPLO 2 --
SELECT name, population, duplica(population) FROM City;

-- EJEMPLO 3 --
CREATE FUNCTION dolar_pesos (dolares DECIMAL (19,4), tipo DOUBLE)
RETURNS decimal (19,4)
DETERMINISTIC
BEGIN
	DECLARE r DECIMAL (19,4);
    SET r = dolares * tipo;
    RETURN r;
END;

SELECT dolar_pesos(2, 20.336);

-- SELECCIONAR EL NOMBRE DEL PAIS, EL
-- CONTINENTE, EL GNP EN DOLARES 
-- Y EL GNP EN PESOS.

SELECT name, continent, gnp, dolar_pesos(GNP, 20.336) AS GNP_pesos FROM country;