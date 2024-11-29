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
    
    SELECT * FROM ORDERS;
    UPDATE ORDERS SET FREIGHT = 99.10 WHERE OrderID = 10248;



DELIMITER $$
    CREATE TRIGGER trValidarInsertUpdate
    BEFORE UPDATE ON CITY
    FOR EACH ROW 
    BEGIN
        IF NEW.POPULATION < 0 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: Population no puede ser negativo.';
        END IF;
    END $$

    UPDATE CITY SET POPULATION = -10 WHERE ID = 1;




DELIMITER $$
    CREATE TRIGGER trg_check_district_before_insert
    BEFORE INSERT ON CITY
    FOR EACH ROW
    BEGIN
    IF LENGTH(NEW.DISTRICT) < 3 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: DISTRICT debe tener al menos tres letras y no puede ser nulo.';
    END IF;
END$$
DELIMITER ;


DELIMITER $$
    CREATE TRIGGER trRevisionDeTresLetras 
    BEFORE INSERT ON CITY 
    FOR EACH ROW 
    BEGIN
        IF LENGTH (NEW.DISTRICT) < 3 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: DISTRICT debe tener al menos tres letras.';
        END IF;
    END $$
DELIMITER ;

UPDATE CITY SET District = 'XY' WHERE Name = 'Valid City';



DELIMITER $$
    CREATE TRIGGER trEspectativaVida
    BEFORE INSERT ON COUNTRY
    FOR EACH ROW
    BEGIN
        IF NEW.LifeExpectancy < 30 OR NEW.LifeExpectancy > 105 THEN
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Error: LifeExpectancy debe estar entre 30 y 105.';
        END IF;
    END $$
DELIMITER ;

INSERT INTO COUNTRY (Code, Name, LifeExpectancy, Population) VALUES ('BMW', 'Mexico City', 100.10, 331002651);
INSERT INTO COUNTRY (Code, Name, LifeExpectancy, Population) VALUES ('POA', 'Paris', -90000, 331002651);




DELIMITER $$
	CREATE TRIGGER trEspectativaVidaUpdate
	BEFORE UPDATE ON COUNTRY
	FOR EACH ROW
	BEGIN
		IF NEW.LifeExpectancy < 30 OR NEW.LifeExpectancy > 105 THEN 
			 SIGNAL SQLSTATE '45000'
			SET MESSAGE_TEXT = 'Error: lifeExpectancy debe estar entre 30 y 105.';
		END IF;
	END $$
DELIMITER ; 

UPDATE COUNTRY SET LifeExpectancy = 34.90 WHERE CODE = 'ABW';
