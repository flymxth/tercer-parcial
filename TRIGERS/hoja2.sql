DELIMITER $$
    CREATE TRIGGER trActualizaciones
    BEFORE UPDATE ON ORDERS
    FOR EACH ROW
    BEGIN
        IF NEW.FREIGHT < 5 OR NEW.FREIGHT > 100 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: FREIGHT debe estar entre 5 y 100.';
        END IF;
    END $$