use sys;

CREATE TABLE hastaneler 
    (
        id VARCHAR(4) PRIMARY KEY, 
        isim VARCHAR(50), 
        sehir VARCHAR(50),
        ozel CHAR(3)
   );
   
   INSERT INTO hastaneler VALUES ('H101', 'ACIMADEM HASTANESI', 'ISTANBUL', 'YES');
   INSERT INTO hastaneler VALUES ('H102', 'HASZEKİ HASTANESI', 'ISTANBUL', 'NO');
   INSERT INTO hastaneler VALUES ('H103', 'MEDİKOL HASTANESI', 'IZMIR', 'YES');
   INSERT INTO hastaneler VALUES ('H104', 'NEMORYIL HASTANESI', 'ANKARA', 'YES');

   CREATE TABLE hastalar 
    (
        kimlik_no VARCHAR(11) PRIMARY KEY, 
        ISIM VARCHAR(50), 
        TESHIS VARCHAR(50)
    );
    
INSERT INTO hastalar VALUES ('12345678901','Ali Can','Gizli Seker');    
INSERT INTO hastalar VALUES ('22345678901','Ayse Yilmaz','Hipertansiyon');
INSERT INTO hastalar VALUES ('32345678901','Steve Jop','Pankreatit');
INSERT INTO hastalar VALUES ('42345678901','Tom Hanks','Covid19');    

CREATE TABLE bolumler 
    
    (
        bolum_id VARCHAR(4) PRIMARY KEY, 
        bolum_adi VARCHAR(50)
    );
    
    INSERT INTO bolumler VALUES ('DHL','Dahiliye'); 
    INSERT INTO bolumler VALUES ('KBB','Kulak-Burun-Bogaz'); 
    INSERT INTO bolumler VALUES ('NRJ','Noroloji'); 
    INSERT INTO bolumler VALUES ('GAST','Gastroloji'); 
    INSERT INTO bolumler VALUES ('KARD','Kardioloji'); 
    INSERT INTO bolumler VALUES ('PSK','Psikiyatri'); 
    INSERT INTO bolumler VALUES ('GOZ','Goz Hastaliklari'); 
    
    CREATE TABLE Hasta_Kayitlar
    
    (
        kimlik_no VARCHAR(50) PRIMARY KEY, 
        hasta_isim VARCHAR(50),
        hastane_adi VARCHAR(50),
        bolum_adi VARCHAR(50),
        teshis VARCHAR(50)
    );
    
    INSERT INTO Hasta_Kayitlar VALUES('1111', 'NONAME', null, null, null);
	INSERT INTO Hasta_Kayitlar VALUES('2222', 'NONAME', null, null, null);
    INSERT INTO Hasta_Kayitlar VALUES('3333', 'NONAME', null, null, null);

   select * from Hasta_Kayitlar;
    
   UPDATE Hasta_Kayitlar SET hasta_isim  = 'Salvadore Dali' WHERE kimlik_no = '3333';
   UPDATE Hasta_Kayitlar SET hastane_adi = 'John Hopkins' WHERE kimlik_no = '3333';
   UPDATE Hasta_Kayitlar SET bolum_adi = 'Noroloji' WHERE kimlik_no = '3333'; 
   UPDATE Hasta_Kayitlar SET teshis = 'Parkinson' WHERE kimlik_no = '3333'; 
   UPDATE Hasta_Kayitlar SET kimlik_no ='99991111222' WHERE kimlik_no = '3333'; 
    
   select * from hasta_kayitlar;
    
   UPDATE Hasta_Kayitlar SET hasta_isim = (SELECT isim from hastalar WHERE isim='Ali can') WHERE kimlik_no='1111';
   UPDATE Hasta_Kayitlar SET hastane_adi = (SELECT isim from hastaneler WHERE id='H104') WHERE kimlik_no='1111';
   UPDATE Hasta_Kayitlar SET bolum_adi = (SELECT bolum_adi from bolumler WHERE bolum_id='dhl') WHERE kimlik_no='1111';
   UPDATE Hasta_Kayitlar SET teshis = (SELECT teshis from hastalar WHERE isim='Ali can') WHERE kimlik_no='1111';
   UPDATE Hasta_Kayitlar SET kimlik_no = (SELECT kimlik_no from hastalar WHERE isim='Ali can') WHERE kimlik_no='1111';
    
    select * from hasta_kayitlar;
    
   UPDATE hasta_kayitlar SET hasta_isim= (SELECT isim from hastalar WHERE isim='Ayse Yılmaz') WHERE kimlik_no='2222';
   UPDATE hasta_kayitlar SET hastane_adi= (SELECT isim from hastaneler WHERE id='H103') WHERE kimlik_no='2222';
   UPDATE hasta_kayitlar SET bolum_adi= (SELECT bolum_adi from bolumler WHERE bolum_id='kbb') WHERE kimlik_no='2222'; 
   UPDATE hasta_kayitlar SET teshis= (SELECT teshis from hastalar WHERE isim='Tom Hanks') WHERE kimlik_no='2222'; 
   UPDATE hasta_kayitlar SET kimlik_no = (SELECT kimlik_no from hastalar WHERE isim='Steve Jop') WHERE kimlik_no='2222';
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    