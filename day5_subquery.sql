use sys;
/* ============================= SUBQUERIES ====================================
    SORGU içinde çalişan SORGUYA SUBQUERY (ALT SORGU) denilir.
   =============================================================================*/
   CREATE TABLE calisanlar 
    (
        id int, 
        isim VARCHAR(50), 
        sehir VARCHAR(50), 
        maas int, 
        isyeri VARCHAR(20)
    );
    INSERT INTO calisanlar VALUES(123456789, 'Ali Seker', 'Istanbul', 2500, 'Vakko');
    INSERT INTO calisanlar VALUES(234567890, 'Ayse Gul', 'Istanbul', 1500, 'LCWaikiki');
    INSERT INTO calisanlar VALUES(345678901, 'Veli Yilmaz', 'Ankara', 3000, 'Vakko');
    INSERT INTO calisanlar VALUES(456789012, 'Veli Yilmaz', 'Izmir', 1000, 'Pierre Cardin');
    INSERT INTO calisanlar VALUES(567890123, 'Veli Yilmaz', 'Ankara', 7000, 'Adidas');
    INSERT INTO calisanlar VALUES(456789012, 'Ayse Gul', 'Ankara', 1500, 'Pierre Cardin');
    INSERT INTO calisanlar VALUES(123456710, 'Fatma Yasa', 'Bursa', 2500, 'Vakko');
    
    CREATE TABLE markalar
    (
        marka_id int, 
        marka_isim VARCHAR(20), 
        calisan_sayisi int
    );
    
    INSERT INTO markalar VALUES(100, 'Vakko', 12000);
    INSERT INTO markalar VALUES(101, 'Pierre Cardin', 18000);
    INSERT INTO markalar VALUES(102, 'Adidas', 10000);
    INSERT INTO markalar VALUES(103, 'LCWaikiki', 21000);
    
    select * from calisanlar;
    select * from markalar;
    
/* =============================================================================
	ORNEK1: calisan sayisi 15.000’den cok olan markalarin isimlerini ve bu 
	markada  calisanlarin isimlerini ve maaşlarini listeleyin
   =============================================================================*/
       
	SELECT isim, maas, isyeri 
    FROM calisanlar
    WHERE isyeri in(select marka_isim FROM markalar 
				        WHERE calisan_sayisi>15000);   
       -- in burda isyeri= parantez icindeki hersey demek oluyor = olmaz cunku = bir veri icin Kullanilir
/*=============================================================================
  ORNEK2: marka_id’si 101’den büyük olan marka çalişanlarinin isim, maaş ve 
  şehirlerini listeleyiniz. 
  =============================================================================*/
  
  SELECT isim, maas, sehir
  FROM calisanlar
  WHERE isyeri in(select marka_isim FROM markalar WHERE marka_id>101);
  
    select * from calisanlar;
    select * from markalar;
  
/*=============================================================================
    ORNEK3: Ankara’da calisani olan markalarin marka id'lerini ve calisan
    sayilarini listeleyiniz.
  =============================================================================*/ 
  
  SELECT marka_id, calisan_sayisi
  FROM markalar
  WHERE marka_isim in(SELECT isyeri FROM calisanlar WHERE sehir='Ankara');
  
/*===================== AGGREGATE METOT KULLANIMI ===========================
	Aggregate Metotlari(SUM, COUNT, MIN, MAX, AVG) Subquery içinde kullanilabilir.
    Ancak, Sorgu tek bir değer döndürüyor olmalidir.
  ==============================================================================*/   
      
/*=============================================================================
    ORNEK4: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin
    toplam maaşini listeleyen bir Sorgu yaziniz.
  =============================================================================*/
  
  SELECT marka_isim, calisan_sayisi, (select SUM(maas) from calisanlar 
  WHERE marka_isim=isyeri) as toplam_maas FROM markalar;
  -- markalar.marka_isim=calisanlar.isyeri gibi yazilabilir
  -- as toplam_maas yazarsak parantez sonuna o zaman sutun ismi degismis olur
  
  /*=============================================================================
  ORNEK5: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin
  ortalama maaşini listeleyen bir Sorgu yaziniz.
    =============================================================================*/
  SELECT marka_isim, calisan_sayisi, (SELECT round(AVG(maas)) FROM calisanlar 
												WHERE marka_isim=isyeri) as ort_maas
  FROM markalar;    -- round AVG(ortalamayı) yuvarla demek
                                                
                                                
/*=============================================================================
  ORNEK6: Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin
  maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
  =============================================================================*/                                                
	
    SELECT marka_isim, calisan_sayisi, (SELECT (max(maas)) FROM calisanlar 
												WHERE marka_isim=isyeri) as max_maas,
									   (SELECT (min(maas)) FROM calisanlar 
												WHERE marka_isim=isyeri) as min_maas
  FROM markalar;                    
  
  /* -----------------------------------------------------------------------------
  ORNEK7: Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu 
  listeleyen bir SORGU yaziniz.
 -----------------------------------------------------------------------------*/
	SELECT marka_id, marka_isim, (select COUNT(sehir) from calisanlar
									where marka_isim=isyeri ) sehir_sayisi
    from markalar;