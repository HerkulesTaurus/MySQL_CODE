use sys;

CREATE TABLE people 
(
    ssn CHAR (9),
    name VARCHAR(50),
    address VARCHAR(80)
);


DROP TABLE PEOPLE;

INSERT INTO PEOPLE VALUES (123456789, 'Mark Star', 'Florida');
INSERT INTO PEOPLE VALUES (234567890, 'Angie Way', 'Virginia');
INSERT INTO PEOPLE VALUES (345678901, 'Marry Tien', 'New Jersey');
INSERT INTO PEOPLE (ssn, address) VALUES (456789012, 'Michigan');
INSERT INTO PEOPLE (ssn, address) VALUES (567890123, 'California');
INSERT INTO PEOPLE (ssn, name) VALUES (567890123, 'California');


SELECT * FROM PEOPLE ;

-- Soru1: Boş adları "ad daha sonra eklenecek" olarak değiştirin

UPDATE PEOPLE
SET NAME='Adlar daha sonra eklenecek'
WHERE NAME IS NULL;

-- Soru2: Boş adresleri 'Adres daha sonra eklenecek' olarak değiştirin

UPDATE PEOPLE
SET ADDRESS='Adres daha sonra eklenecek'
WHERE ADDRESS IS NULL;


SELECT * FROM PEOPLE ;

-- Soru3: people tablosunda 'Daha sonra eklenecek' tüm boş değerleri değiştirin

UPDATE PEOPLE
SET  NAME = COALESCE (name, 'daha sonra eklenecek');


