-- Cambiar el delimitador para permitir el uso de ; dentro del procedimiento
DELIMITER $$

-- Crear el procedimiento almacenado llamado 'productos_categoria'
-- Este procedimiento recibe un parámetro de entrada 'categoria' (un número entero)
CREATE PROCEDURE productos_categoria(IN categoria INT)
BEGIN
    -- Consulta los productos cuya categoría sea igual al valor de 'categoria'
    SELECT * FROM products WHERE categoryId = categoria;
END $$

-- Restaurar el delimitador al valor por defecto (;)
DELIMITER ;

