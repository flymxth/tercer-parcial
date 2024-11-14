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

-----------------------------------------------------------------------

CREATE PROCEDURE CalcularIngresosTotales (
    @fecha_inicio DATE,
    @fecha_fin DATE,
    @ingresos_totales DECIMAL(18, 2) OUTPUT
)
AS
BEGIN
    -- Calcula los ingresos totales para el rango de fechas especificado
    SELECT @ingresos_totales = SUM((UnitPrice * Quantity) * (1 - Discount))
    FROM [ORDER DETAILS] AS od
    INNER JOIN Orders AS o ON od.OrderID = o.OrderID
    WHERE o.OrderDate BETWEEN @fecha_inicio AND @fecha_fin;
END;

