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


