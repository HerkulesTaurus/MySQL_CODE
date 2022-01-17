use sys;
-- =========SELECT-WHERE========
 -- bırkac tane database olunca use sys; yi run etmek lazım 
create table ogrenciler(
id int, 
isim VARCHAR(45),
adres varchar(100),
sinav_notu int  -- sonuncudan sonra virgul koymaya gerek yok
);

 INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Ankara', 75);
 INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ankara', 85);
 INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Istanbul', 85);
 
 select * from ogrenciler;
 
 /*Verileri SELECT komutu ile veritabanından çekerken filtreleme yapmak için
   Syntax
   --------
    SELECT ile birlikte WHERE komutu kullanılabilir.
    SELECT sutün1, sutün2
        ...
    FROM  tablo_adı WHERE koşul;
==============================================================================*/
/*----------------------------------------------------------------------------
 ORNEK1: Sınav notu 80'den büyük olan öğrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/
 select * from ogrenciler where sinav_notu > 80;
 
/*----------------------------------------------------------------------------
 ORNEK2: Adresi Ankara olan öğrencilerin isim ve adres bilgilerini listele
 -----------------------------------------------------------------------------*/ 
 select isim,adres  from ogrenciler where adres = 'Ankara';
 
 /*---------------------------------------------------------------------------
 ORNEK3: id’si 124 olan öğrencilerin tüm bilgilerini listele
 -----------------------------------------------------------------------------*/
 select * from ogrenciler where id=124;
 /*======================= SELECT - BETWEEN ==================================*/ 
    
    CREATE TABLE personel
    (   
        id CHAR(5),
        isim VARCHAR(50),
        maas int
    );
    
    INSERT INTO personel VALUES('10001', 'Ahmet Aslan', 7000);
    INSERT INTO personel VALUES('10002', 'Mehmet Yilmaz', 12000);
    INSERT INTO personel VALUES('10003', 'Meryem', 7215);
    INSERT INTO personel VALUES('10004', 'Veli Han', 5000);
    INSERT INTO personel VALUES('10005', 'Mustafa Ali', 5500);
    INSERT INTO personel VALUES('10006', 'Ayşe Can', 4000);
    
    -- note: BETWEEN iki matıksal ifade ile tanimlayabilecegınız durumları tek komutla
    -- yazabılme ımkanı verır.
    -- yazdıgımız 2 sınır da aralıga dahıldır.
    
/*===========================================================================
=====And (Ve) Operatörü Kullanımı=====&
And ile belirtilen şartların tamamı gerçekleşiyorsa o kayıt listelenir, şartlardan
bir tanesi bile tutmazsa listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50 AND sinav2 < 50
Bu örnekte hem sınav1 hem de sınav2 alanı 50'den küçük olan kayıtlar listelenecektir.
=====Or (Veya) Operatörü Kullanımı=====||
Or ile belirtilen şartlardan en az biri gerçekleşiyorsa o kayıt listelenir,
şartlardan hiçbiri gerçekleşmiyorsa o kayıt listelenmez.
SELECT * FROM matematik WHERE sinav1 < 50 OR sinav2 < 50
Bu örnekte sınav1 veya sınav2 alanı 50'den küçük olan kayıtlar listelenecektir. 
================================================================================*/
-- not: BETWEEN iki mantiksal ifade ile tanimlayabileceğimiz durumlari tek komutla
-- yazabilme imkani verir.alter yazdiğimiz 2 sinir da araliğa dahildir
 
 /*---------------------------------------------------------------------------
   ORNEK4: id’si 10002 ile 10005 arasında olan personelin bilgilerini listele
 -----------------------------------------------------------------------------*/
-- 1. yol:
select * from personel where id between '10002' and '10005';
-- 2. yol:
select * from personel where id >= '10002' and id <= '10005';

 /*---------------------------------------------------------------------------
   ORNEK5: ismi Mehmet Yılmaz ile Veli Han arasındaki olan personel bilgilerini
   listeleyiniz. personelin bilgilerini listele
 -----------------------------------------------------------------------------*/
 
 select * from personel where isim between 'Mehmet Yilmaz' and 'Veli Han';
 
 /*---------------------------------------------------------------------------
   ORNEK6: ismi Mehmet Yılmaz ile Veli Han arasındaki olan personel bilgilerini
   listeleyiniz. personelin bilgilerini listele
 -----------------------------------------------------------------------------*/
 
 
 /* ======================= SELECT - IN ======================================
    IN birden fazla mantıksal ifade ile tanımlayabileceğimiz durumları 
    tek komutla yazabilme imkânı verir
    SYNTAX:
    -------
    SELECT sutun1,sutun2, ...
    FROM tablo_adı
    WHERE sutun_adı IN (deger1, deger2, ...);
/*  ============================================================================ */
    
/* -----------------------------------------------------------------------------
  ORNEK7: id’si 10001,10002 ve 10004 olan personelin bilgilerini listele
   -----------------------------------------------------------------------------*/   
 -- 1. yol 
 select * from personel where id='10001' or id='10002' or id='10004'; 
 
 -- 2. yol 
 select * from personel where id in (10001,10002,10004);
 
 /*-----------------------------------------------------------------------------
  ORNEK8: Maaşı sadece 7000  veya 12000 olan personelin bilgilerini listele
-----------------------------------------------------------------------------*/ 
 select * from personel where maas in (7000, 12000);
 -- in burda kısayol normalde or la da yapılabılır
 
 select * from personel where maas=7000 or isim='meryem';
 -- select * from personel where maas in(7000,'meryem'); bu sekılde olmaz
 
 /* ======================= SELECT - LIKE ======================================
    NOT:LIKE anahtar kelimesi, sorgulama yaparken belirli patternleri 
    kullanabilmemize olanak sağlar.
    SYNTAX:
    -------
    SELECT sutün1, sutün2,…
    FROM  tablo_adı WHERE sütunN LIKE pattern
    
    PATTERN İÇİN
    -------------
    %    ---> 0 veya daha fazla karakteri belirtir. 
    _    ---> Tek bir karakteri temsil eder.
        
  ========================================================================== */
 
 /*-----------------------------------------------------------------------------
  ORNEK9:ismi A harfi ile baslayanları listeleyiniz
   -----------------------------------------------------------------------------*/   
 select * from personel where isim like 'a%';       -- a ile baslayıp devamında sınırsız harf 
 select * from personel where isim like 'a_______'; -- a dan sonra kac harf gereklı ıse o kadar alt tire
 
 /* -----------------------------------------------------------------------------
  ORNEK10:ismi n harfi ile bitenleri listeleyiniz
 -----------------------------------------------------------------------------*/
 select * from personel where isim like '%n';  -- basında sonsuz harf sonu n ile bıten 
 
 /* -----------------------------------------------------------------------------
  ORNEK11:isminin 2. harfi e olanları listeleyiniz
 -----------------------------------------------------------------------------*/
 select * from personel where isim like '_e%';
 
 /* -----------------------------------------------------------------------------
  ORNEK12:isminin 2. harfi e olup diger harflerinde y olanları listeleyiniz
 -----------------------------------------------------------------------------*/
 select * from personel where isim like '_e%y%';
 
  /* -----------------------------------------------------------------------------
  ORNEK13:isminde hic a harfi olmayanları listeleyiniz
 -----------------------------------------------------------------------------*/
 select * from personel where isim not like '%a%';
 
 /* -----------------------------------------------------------------------------
  ORNEK14: maaşı 5 haneli olanları listeleyiniz
 -----------------------------------------------------------------------------*/  
 
 select * from personel where maas like '_____';
 
 /* -----------------------------------------------------------------------------
  ORNEK15: 1. harfi A ve 7. harfi A olan personeli listeleyiniz.
 -----------------------------------------------------------------------------*/  
 
 SELECT * FROM personel WHERE isim LIKE 'A_____A%';
 
 /* ====================== SELECT - REGEXP_LIKE ================================
    Daha karmaşık pattern ile sorgulama işlemi için REGEXP_LIKE kullanılabilir.  
     -- 'c' => case-sentisitive demektir 
     -- 'i' => incase-sentisitive demektir ve default incase-sensitive aktiftir..
    Syntax:
    --------
    REGEXP_LIKE(sutun_adı, ‘pattern[] ‘, ‘c’ ] ) 
            
/* ========================================================================== */
    use sys;
    CREATE TABLE kelimeler
    
    (
        id int UNIQUE,
        kelime VARCHAR(50) NOT NULL,
        harf_sayisi int
    );
    
    INSERT INTO kelimeler VALUES (1001, 'hot', 3);
    INSERT INTO kelimeler VALUES (1002, 'hat', 3);
    INSERT INTO kelimeler VALUES (1003, 'hit', 3);
    INSERT INTO kelimeler VALUES (1004, 'hbt', 3);
    INSERT INTO kelimeler VALUES (1005, 'hct', 3);
    INSERT INTO kelimeler VALUES (1006, 'adem', 4);
    INSERT INTO kelimeler VALUES (1007, 'selim', 5);
    INSERT INTO kelimeler VALUES (1008, 'yusuf', 5);
    INSERT INTO kelimeler VALUES (1009, 'hip', 3);
    INSERT INTO kelimeler VALUES (1010, 'HOT', 3);
    INSERT INTO kelimeler VALUES (1011, 'hOt', 3);
    INSERT INTO kelimeler VALUES (1012, 'h9t', 3);
    INSERT INTO kelimeler VALUES (1013, 'hoot', 4);
    INSERT INTO kelimeler VALUES (1015, 'hooooooot', 5);
    
   -- DROP TABLE kelimeler;
   
    
/* -----------------------------------------------------------------------------
  ORNEK22: İçerisinde 'ot' veya 'at' bulunan kelimeleri küçük harfe dikkat
  ederek listeleyiniz 
 -----------------------------------------------------------------------------*/ 
    -- VEYA işlemi için | karakteri kullanılır.
    
   SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime, 'at|ot','c') ;
   
/* -----------------------------------------------------------------------------
  ORNEK23: İçerisinde 'ot' veya 'at' bulunan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/ 
    
   SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime, 'at|ot') ; 
      
   
 /* -----------------------------------------------------------------------------
  ORNEK24: 'ho' veya 'hi' ile başlayan kelimeleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz
 -----------------------------------------------------------------------------*/   
     -- Başlangıcı göstermek için ^ karakteri kullanılır.
    
    SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime, '^ho|^hi');
    
/* -----------------------------------------------------------------------------
  ORNEK25: Sonu 't' veya 'm' ile bitenleri büyük-küçük harfe dikkat
  etmeksizin listeleyeniz. (i yazmaya gerek yok)
 -----------------------------------------------------------------------------*/   
     -- Bitişi göstermek için $ karakteri kullanılır.
    
    SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime, 't$|m$');
    
/* -----------------------------------------------------------------------------
  ORNEK26: h ile başlayıp t ile biten 3 harfli kelimeleri (h ile t küçük harfli 
  olanlari) listeleyeniz
 -----------------------------------------------------------------------------*/ 

-- SELECT * FROM kelimeler WHERE kelime like 'h_t' YADA ^h t$;
-- [] icine ne koyarsak onu alır 1 karakter sadece
-- SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime,'h[a-zA-Z0-9][a-zA-Z0-9]t','c');
   SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime,'h[a-zA-Z0-9]t','c');

/* -----------------------------------------------------------------------------
  ORNEK27: İlk harfi h, son harfi t olup 2.harfi a veya i olan 3 harfli 
  kelimelerin tüm bilgilerini sorgulayalım.
 -----------------------------------------------------------------------------*/ 
	SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime,'h[ai]t');
 -- SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime,'h[a|i]t'); 
/* -----------------------------------------------------------------------------
  ORNEK28: İçinde m veya i veya e olan kelimelerin tüm bilgilerini listeleyiniz.
 -----------------------------------------------------------------------------*/     
   
	SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime,'[mie]');
  -- SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime,'m|i|e');
 
/* -----------------------------------------------------------------------------
  ORNEK29: a veya s ile başlayan kelimelerin tüm bilgilerini listeleyiniz.
-----------------------------------------------------------------------------*/ 
 
  -- SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime,'^a|^s');
	SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime,'^[as]');

/* -----------------------------------------------------------------------------
  ORNEK30: içerisinde en az 2 adet oo barıdıran kelimelerin tüm bilgilerini 
  listeleyiniz.
-----------------------------------------------------------------------------*/ 
 -- {} icine yazdıgımız kadar harf sayısı getırır
	
    SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime,'[o]{2}');	
    SELECT * FROM kelimeler WHERE REGEXP_LIKE(kelime,'[o][o]');
	
 
 
 