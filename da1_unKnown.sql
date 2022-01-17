/*=========================================================================
TABLO OLUSTURMA (CRUD-Create)
  =========================================================================*/
drop table student;
use sys; 
CREATE TABLE student 
(
	id VARCHAR(4),
	name VARCHAR(20),
	age int 
);

/*=================================================================
							VERİ GİRİSİ
 ==================================================================*/
INSERT INTO student VALUES('1001', 'MEHMET ALİ',  25);
INSERT INTO student VALUES('1002', 'AYSE YİLMAZ', 34);
INSERT INTO student VALUES('1003', 'JOHN STAR',   56);
INSERT INTO student VALUES('1004', 'MARY BRAWN',  17);

/*=================================================================
						PARCALI	VERİ GİRİSİ
 ==================================================================*/
insert into student(name, age ) VALUES('SAMET AY', 44);


/*=================================================================
					   TABLODAN VERİ SORGULAMA 
 ==================================================================*/
select * from student;

/*=================================================================
					   TABLO SİLME (CRUD-Drop)
 ==================================================================*/
 DROP TABLE urunler; 
 
 