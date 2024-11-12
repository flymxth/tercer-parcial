-- EJERCICIO DE AYER --
USE NWIND;

DEIMITER $$

CREATE PROCEDURE productos_categoria(categoria INT)
BEGIN
    SELECT * FROM products WHERE categoryId=categoria;
END $$
DESCRIBE products$$
CALL productos_categoria(6, 20) $$




-- EJERCICIO DE HOY --
-- ELIMINAR UN PAIS CON UN PROCESO ALMACENADO --

-- 1. BORRAR LAS CIUDADES
-- 2. BORRAR LOS LEBGUAJES
-- 3. BORRAR EL PAIS

USE WORLD;

DELIMITER $$

DROP PROCEDURE spBorrarPais$$
CREATE PROCEDURE spBorrarPais(codigo CHAR(3))
BEGIN 
    DELETE FROM city WHERE countrycode = codigo;
    DELETE FROM CountryLanguage WHERE countrycode = codigo;
    DELETE FROM city WHERE code = codigo;
END $$

CALL spBorrarPais('AUT') $$
