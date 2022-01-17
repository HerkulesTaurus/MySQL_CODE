use sys;

CREATE TABLE calisanlar
    (
        id CHAR(4),
        isim VARCHAR(50),
        maas int,
        CONSTRAINT id_pk PRIMARY KEY (id)
    );
    
    INSERT INTO calisanlar VALUES('1001', 'Ahmet Aslan', 7000);
    INSERT INTO calisanlar VALUES('1002', 'Mehmet Yılmaz', 12000);
    INSERT INTO calisanlar VALUES('1003', 'Meryem ', 7215);
    INSERT INTO calisanlar VALUES('1004', 'Veli Han', 5000);
    
    CREATE TABLE aileler
    (
        id CHAR(4),
        cocuk_sayisi VARCHAR(50),
        ek_gelir int,
        CONSTRAINT id_fk FOREIGN KEY (id) REFERENCES calisanlar(id)
    );
    
    INSERT INTO aileler VALUES('1001', 4, 2000);
    INSERT INTO aileler VALUES('1002', 2, 1500);
    INSERT INTO aileler VALUES('1003', 1, 2200);
    INSERT INTO aileler VALUES('1004', 3, 2400);
    
    -- 2) veli han ın maasına %20 zam yapınız
    
    UPDATE calisanlar 
    set maas = maas*1.2
    where isim='veli Han';
    
    select * from calisanlar;
    
    -- 3) maası ortalamanın altında olanlara %20 zam yapınız
    
    update calisanlar
    set maas=maas*1.2
    where maas< (select avg(maas) from (select maas from calisanlar) as liste);
    
    
    -- 4) calisanların isim ve cocuk_sayisi ni listeleyen sorgu 
    
    -- 1. yol cozum
    select isim, (select cocuk_sayisi from aileler where calisanlar.id=aileler.id) cocuk_sayisi
    from calisanlar;
    
    select * from calisanlar;
    
    -- 2. yol cozum
    select isim, cocuk_sayisi from calisanlar, aileler
    where calisanlar.id=aileler.id;
    
    -- 5) calisanlar' ın id, isim ve toplam_gelir'lerini gösteren bir sorgu yazınız.
    -- toplam_gelir = calisanlar.maas + aileler.ek_gelir
    
    -- 1. yol
    
    select id, isim, (select maas+ ek_gelir from aileler
    Where calisanlar.id=aileler.id) as toplam_gelir
    from calisanlar;
    
    
    -- 2. yol
    select isim, (maas+ek_gelir), calisanlar_id
    from calisanlar, aileler
    where calisanlar.id=aileler.id;
    
    select * from calisanlar;
    
-- 6) Eğer bir ailenin kişi başı geliri 2000 TL den daha az ise o çalışanın
-- maaşına ek %10 aile yardım zammı yapınız.
-- kisi_basi_gelir = toplam_gelir /  cocuk_sayisi + 2 (anne ve baba)

    update calisanlar
    set maas=maas*1.1
    where (select (maas+ek_gelir)/(cocuk_sayisi+2) from aileler where calisanlar.id=aileler.id) < 2000;
    
    