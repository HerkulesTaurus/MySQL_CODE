use sys; 

-- Create işçi tablosu alanları worker_id,work_name,work_salary şeklindedir.
-- worker_id, worker_id_pk adında primary key sahip olacak
-- İşçiler tablosuna 4 kayıt ekleyin
-- Konsoldaki tabloya bakın

CREATE TABLE worker 
(
    worker_id char(3),
    worker_name VARCHAR(50),
    worker_salary int not null,
	CONSTRAINT worker_id_pk PRIMARY KEY (worker_id)
);

DROP TABLE worker;

INSERT INTO WORKER VALUES ('100', 'oli can', 1200);
INSERT INTO WORKER VALUES ('102', 'Veli Han', 2000);
INSERT INTO WORKER VALUES ('103', 'Ayse Kan', 7000);
INSERT INTO WORKER VALUES ('104', 'Angie Ocean', 8500);

SELECT * FROM WORKER ;

-- Soru1: Veli Han'ın maaşını tablodaki en yüksek maaşın yüzde 20 daha azına kadar artırin

UPDATE WORKER
SET worker_salary = (SELECT MAX(worker_salary) FROM (SELECT * FROM WORKER) AS W )-((SELECT MAX(worker_salary) FROM (SELECT * FROM WORKER)AS V )*0.20)
WHERE worker_name='Veli Han';

-- Soru2: oli Can'ın maaşını en düşük maaştan yüzde 30 daha fazla düşürun

UPDATE WORKER
SET worker_salary = (SELECT MIN(worker_salary)*1.30 FROM (SELECT * FROM WORKER) AS M)
WHERE worker_name='oli Can';

SELECT * FROM WORKER ;

-- Soru3: Maaş ortalama maaştan düşükse maaşları 1000 artırın

UPDATE WORKER
SET worker_salary = worker_salary + 1000
WHERE worker_salary < (SELECT AVG(worker_salary) FROM (SELECT worker_salary FROM WORKER) AS B);

-- Soru4: Maaşın ortalama maaştan az olması durumunda maaşları ortalama maaşa eşitle

UPDATE WORKER
SET worker_salary =  (SELECT AVG(worker_salary) FROM (SELECT * FROM WORKER) AS S)
WHERE worker_salary < (SELECT AVG(worker_salary) FROM (SELECT * FROM WORKER) AS S);




