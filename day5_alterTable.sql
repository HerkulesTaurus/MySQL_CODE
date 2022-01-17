use sys;
/*=============================== ALTER TABLE ==================================
    
    ALTER TABLE  tabloda ADD, MODIFY, veya DROP/DELETE COLUMNS islemleri icin kullanilir.
    
    ALTER TABLE ifadesi tablolari yeniden isimlendirmek (RENAME) icin de kullanilir.
   
==============================================================================*/

    CREATE TABLE personel
    (
        id int PRIMARY KEY , 
        isim VARCHAR(50), 
        sehir VARCHAR(50), 
        maas int, 
        sirket VARCHAR(20)
    );
    
    INSERT INTO personel VALUES(123456789, 'Ali Yilmaz',  'Istanbul', 5500, 'Honda');
    INSERT INTO personel VALUES(234567890, 'Veli Sahin',  'Istanbul', 4500, 'Toyota');
    INSERT INTO personel VALUES(345678901, 'Mehmet Ozturk', 'Ankara', 3500, 'Honda'); 
    INSERT INTO personel VALUES(456789012, 'Mehmet Ozturk',  'Izmir', 6000, 'Ford');
    INSERT INTO personel VALUES(567890123, 'Mehmet Ozturk', 'Ankara', 7000, 'Tofas');
    INSERT INTO personel VALUES(456715012, 'Veli Sahin',    'Ankara', 4500, 'Ford');
    select * from personel;
    
/*==============================================================================
  ORNEK1: personel tablosuna ulke_isim adinda ve default degeri 'Turkiye' olan 
  yeni bir sutun ekleyiniz.
  ==============================================================================*/ 
    alter table personel 
    add ulke_isim VARCHAR(20) default 'TURKIYE';
      
/* ==============================================================================
  ORNEK2: personel tablosuna cinsiyet Varchar(20) ve yas int(3) seklinde 
  yeni sutunlar ekleyiniz.
============================================================================== */  
    alter table personel
    add (cinsiyet VARCHAR(20), yas int);
    select * from personel;
    
/* ==============================================================================
  ORNEK3: personel tablosundan sirket sutununu siliniz. 
   ============================================================================== */ 
    ALTER TABLE personel 
    DROP column sirket;
   
/* ==============================================================================
  ORNEK4: personel tablosundaki ulke_isim sutununun adini ulke_adi olarak 
  degistiriniz. 
   ============================================================================== */  
 alter table personel
 rename column ulke_isim to ulke_adi;
    
/* ==============================================================================
  ORNEK5: personel tablosunun adini isciler olarak degistiriniz. 
============================================================================== */  
  alter table personel
  rename to isciler;
  select * from isciler; -- isim degıstıgı ıcın personel degıl ıscıler oldu ısmı sorgu bu sekılde yapılır
  
/* ==============================================================================
  ORNEK6: isciler tablosundaki ulke_adi sutununa NOT NULL kisitlamasi ekleyiniz
  ve veri tipini VARCHAR(30) olarak değiştiriniz. 
   ============================================================================== */
   
   alter table isciler
   modify ulke_adi varchar(30) not null;
   
   -- maas kısıtlaması ekle   
   
  -- alter table isciler add constraint check(maas>3500); bu oracle da gecerlı olabılır
  alter table isciler add constraint check(maas>3499);
  -- maas alt limit kisitlamasi atadik (maas=>3500 de yazılabılır)
  -- kisitlama atadiktan sonra maasin 3500 olmasi sebebiyle 
  -- alttaki veriyi giremeyiz 
   
   INSERT INTO isciler VALUE(123452310, 'Hatice Sahin', 'Bursa', null)
   
   
   
   
   