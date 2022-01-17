use sys;

/*=========================================================================
TABLO OLUSTURMA (CRUD-Create)
============================================================================*/
drop table student; 
CREATE TABLE student 
(
	std_id VARCHAR(4),
	std_name VARCHAR(20),
	std_age int 
);

/*=================================================================
							VERİ GİRİSİ
===================================================================*/

INSERT INTO student VALUES('1001', 'MEHMET ALİ',  25);
INSERT INTO student VALUES('1002', 'AYSE YİLMAZ', 34);
INSERT INTO student VALUES('1003', 'JOHN STAR',   56);
INSERT INTO student VALUES('1004', 'MARY BRAWN',  17);

select * from urunler;



/*=========================================================================
TABLO SİLME (CRUD -DROP) ekstra JAVA--concat
  =========================================================================*/

DROP TABLE urunler;

create table customer (
musteri_no int,
ad VARCHAR(22),
soyad VARCHAR(25),
sehir varchar(45),
cinsiyet varchar(15),
puan int
);

INSERT INTO customer VALUES(111,'ebru', 'akar','denizli','kadin',78);
INSERT INTO customer VALUES(222,'ayse', 'kara','ankara','kadin',90);
INSERT INTO customer VALUES(333,'ali','gel','istanbul','erkek',66);
INSERT INTO customer VALUES(444, 'mehmet','okur','mus','erkek',98);

select concat('Adiniz Soyadiniz:', ad, ' ',soyad) ad_soyad from customer;
select concat(musteri_no, '.)', ad, ' ', soyad) ad_soyad, sehir, cinsiyet, puan from customer;