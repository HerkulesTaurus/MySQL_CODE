use sys;
-- ============================== DELETE ===================================  
    -- DELETE FROM tablo_adı;  Tablonun tüm içerğini siler.
    -- Bu komut bir DML komutudur. Dolayısıyla devamında WHERE gibi cümlecikler
    -- kullanılabilir.
    
    -- DELETE FROM tablo_adı
    -- WHERE sutun_adi = veri;
    
    drop table ogrenciler;
    
    CREATE TABLE ogrenciler
    (
        id CHAR(3),
        isim VARCHAR(50),
        veli_isim VARCHAR(50),
        yazili_notu int       
    );
  
    INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
    INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
    INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
	    
-- savepoint sikintisi varsa -> SET autocommit=0; 
-- ayarlar sql execution auto commit tiki kaldir
--    DELETE FROM ogrenciler;     -- Tüm verileri sil.
--    ROLLBACK TO  ABC;  		  -- Silinen Verileri geri getir.
--    SELECT * FROM ogrenciler;
    
/* =============================================================================
         Seçerek silmek için WHERE Anahtar kelimesi kullanılabilir. 
===============================================================================*/     
/* -----------------------------------------------------------------------------
  ORNEK1: id'si 124 olan ogrenciyi siliniz.
 -----------------------------------------------------------------------------*/ 
  
    DELETE  FROM ogrenciler WHERE id='124';
    
    SELECT * FROM ogrenciler; -- silinip silinmedigini kontrol et 
    
/* -----------------------------------------------------------------------------
  ORNEK2: ismi Kemal Yasa olan satırını siliniz.
 -----------------------------------------------------------------------------*/   
     DELETE FROM ogrenciler WHERE isim='kemal yasa';
      
     SELECT * FROM ogrenciler; 
     
/* -----------------------------------------------------------------------------
  ORNEK3: ismi Nesibe Yilmaz veya Mustafa Bak olan kayıtları silelim.
 -----------------------------------------------------------------------------*/        
   DELETE FROM ogrenciler WHERE isim= 'Nesibe Yilmaz' or isim='Mustafa Bak';
   DELETE FROM ogrenciler WHERE isim in('Nesibe Yilmaz','Mustafa Bak'); -- ıkı farklı yontem
   
   select * from ogrenciler;
   
/* ----------------------------------------------------------------------------
  ORNEK4: İsmi Ali Can ve id'si 123 olan kaydı siliniz.
 -----------------------------------------------------------------------------*/    
delete from ogrenciler where isim ='Ali can' and id='123';

select * from ogrenciler;
   
/* ----------------------------------------------------------------------------
  ORNEK5: id 'si 126'dan büyük olan kayıtları silelim.
 -----------------------------------------------------------------------------*/  
  delete from ogrenciler where id>126;
  select * from ogrenciler;
 
 /* ----------------------------------------------------------------------------
  ORNEK6: id'si 123, 125 ve 126 olanları silelim.
 -----------------------------------------------------------------------------*/     
    
    delete from ogrenciler where id='123' or id='125' or id='126';
    delete from ogrenciler where id in('123','125','126'); -- farklı yazılım 
    select * from ogrenciler;
    
/* ----------------------------------------------------------------------------
  ORNEK7:  TABLODAKİ TÜM KAYITLARI SİLELİM..
 -----------------------------------------------------------------------------*/     
   
    delete from ogrenciler;
    select * from ogrenciler;
    
-- *************************************************    
-- SET autocommit=0; 
    
-- tablodaki kayitlari silmek ile tabloyu silmek farkli islemlerdir
-- silme komutlari da iki basamaklidir, biz genelde geri getirilebilecek sekilde sileriz 
-- ancak bazen guvenlik gibi sebeplerle geri getirilmeyecek sekilde silinmesi istenebilir 
-- drop la tum insaati yıkar delete le bazı kisimlarini siler 
/* ======================== DELETE - TRUNCATE - DROP ============================   
  
  1-) TRUNCATE komutu DELETE komutu gibi bir tablodaki verilerin tamamını siler.
    Ancak, seçmeli silme yapamaz. Çünkü Truncate komutu DML değil DDL komutudur.*/ 
         TRUNCATE TABLE ogrenciler;      -- doğru yazım-- asla gerı getırılemez tamamen siler
		 DROP TABLE ogrenciler;  -- ddl  --  seklınde kuklanılıyorlar
         DELETE FROM ogrenciler; -- dml
   /* 2-) DELETE komutu beraberinde WHERE cümleciği kullanılabilir. TRUNCATE ile kullanılmaz.
        TRUNCATE TABLE ogrenciler
        WHERE veli_isim='Hasan';  .....yanlış yazım
        
-- TRUNCATE komutu tablo yapısını değiştirmeden, 
-- tablo içinde yer alan tüm verileri tek komutla silmenizi sağlar.
        
    3-) Delete komutu ile silinen veriler ROLLBACK Komutu ile kolaylıkla geri 
    alınabilir.
    
    4-) TRUNCATE ile silinen veriler geri alınması daha zordur. 
    Ancak TRANSACTİON yöntemi ile geri alınması mümkün olabilir.
    
    5-) DROP komutu da bir DDL komutudur. Ancak DROP veriler ile tabloyu da 
    siler. 
==============================================================================*/ 
-- INSERT veri girişinden sonra SAVEPOİNT ABC; ile verileri buraya sakla
-- (yanlışlık yapma olasılığına karşın önlem gibi, AYNI İSİMDE BAŞKA TABLO VARSA)
-- sonra istediğini sil (ister tümü ister bir kısmı)
-- sonra savepoint yaptığın yerden alttaki gibi rollback ile verileri geri getir
    
    INSERT INTO ogrenciler VALUES(123, 'Ali Can', 'Hasan',75);
    INSERT INTO ogrenciler VALUES(124, 'Merve Gul', 'Ayse',85);
    INSERT INTO ogrenciler VALUES(125, 'Kemal Yasa', 'Hasan',85);
    INSERT INTO ogrenciler VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
    INSERT INTO ogrenciler VALUES(127, 'Mustafa Bak', 'Can',99);
	savepoint abc; 
    -- savepoint le veriler baska bıryere daha kaydedıldı, silinsede geri getirilmesi mumkun 
    
    select * from ogrenciler;
    
    delete from ogrenciler;
    rollback to abc; -- silinen ama savepoint abc ile farklı kaydedilen veriler rollback le geri getirildi