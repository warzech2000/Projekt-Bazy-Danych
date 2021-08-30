CREATE DATABASE EleSklepDB; GO USE EleSklepDB; GO

CREATE TABLE magazyn_kategorie ( kategoria_id INT IDENTITY (1, 1) PRIMARY KEY, kategoria_nazwa VARCHAR (20) NOT NULL );

CREATE TABLE magazyn_firmy ( firma_id INT IDENTITY (1, 1) PRIMARY KEY, firma_nazwa VARCHAR (30) NOT NULL );

CREATE TABLE magazyn_produkty ( produkt_id INT IDENTITY (1, 1) PRIMARY KEY, produkt_nazwa VARCHAR (35) NOT NULL, firma_id INT NOT NULL, kategoria_id INT NOT NULL, model_rok VARCHAR(10) NOT NULL, cena DECIMAL (10, 2) NOT NULL, FOREIGN KEY (kategoria_id) REFERENCES magazyn_kategorie (kategoria_id)
ON DELETE CASCADE
ON UPDATE CASCADE, FOREIGN KEY (firma_id) REFERENCES magazyn_firmy (firma_id)
ON DELETE CASCADE
ON UPDATE CASCADE );

CREATE TABLE sprzedaz_klienci ( klient_id INT IDENTITY (1, 1) PRIMARY KEY, imie VARCHAR (15) NOT NULL, nazwisko VARCHAR (30) NOT NULL, telefon VARCHAR (12), email VARCHAR (35) NOT NULL, ulica VARCHAR (30), miasto VARCHAR (20), kod_pocztowy VARCHAR (5) );

CREATE TABLE sprzedaz_sklepy ( sklep_id INT IDENTITY (1, 1) PRIMARY KEY, sklep_nazwa VARCHAR (30) NOT NULL, telefon VARCHAR (12), email VARCHAR (35), ulica VARCHAR (30), miasto VARCHAR (20), kod_pocztowy VARCHAR (5) );

CREATE TABLE sprzedaz_pracownicy ( pracownik_id INT IDENTITY (1, 1) PRIMARY KEY, imie VARCHAR (15) NOT NULL, nazwisko VARCHAR (30) NOT NULL, email VARCHAR (35) NOT NULL UNIQUE, telefon VARCHAR (12), sklep_id INT NOT NULL, menadzer_id INT NOT NULL, FOREIGN KEY (sklep_id) REFERENCES sprzedaz_sklepy (sklep_id)
ON DELETE CASCADE
ON UPDATE CASCADE, );

CREATE TABLE sprzedaz_zamowienia ( zamowienie_id INT IDENTITY (1, 1) PRIMARY KEY, klient_id INT, zamowienie_status tinyint NOT NULL, zamowienia_data DATE NOT NULL, wysylka_data DATE, sklep_id INT NOT NULL, pracownik_id INT NOT NULL, FOREIGN KEY (klient_id) REFERENCES sprzedaz_klienci (klient_id)
ON DELETE CASCADE
ON UPDATE CASCADE, FOREIGN KEY (sklep_id) REFERENCES sprzedaz_sklepy (sklep_id)
ON DELETE CASCADE
ON UPDATE CASCADE, );

CREATE TABLE sprzedaz_zamowione_rzeczy ( zamowienie_id INT, produkt_id INT NOT NULL, ilosc INT NOT NULL, cena DECIMAL (10, 2) NOT NULL, przecena DECIMAL (4, 2) NOT NULL DEFAULT 0, PRIMARY KEY (zamowienie_id) , FOREIGN KEY (zamowienie_id) REFERENCES sprzedaz_zamowienia (zamowienie_id)
ON DELETE CASCADE
ON UPDATE CASCADE, FOREIGN KEY (produkt_id) REFERENCES magazyn_produkty (produkt_id)
ON DELETE CASCADE
ON UPDATE CASCADE );

CREATE TABLE magazyn_lista ( sklep_id INT, produkt_id INT, ilosc INT, PRIMARY KEY (sklep_id, produkt_id), FOREIGN KEY (sklep_id) REFERENCES sprzedaz_sklepy (sklep_id)
ON DELETE CASCADE
ON UPDATE CASCADE, FOREIGN KEY (produkt_id) REFERENCES magazyn_produkty (produkt_id)
ON DELETE CASCADE
ON UPDATE CASCADE );

SET IDENTITY_INSERT magazyn_firmy ON;

INSERT INTO magazyn_firmy(firma_id,firma_nazwa) VALUES(1,'Samsung')

INSERT INTO magazyn_firmy(firma_id,firma_nazwa) VALUES(2,'Apple')

INSERT INTO magazyn_firmy(firma_id,firma_nazwa) VALUES(3,'Nokia')

INSERT INTO magazyn_firmy(firma_id,firma_nazwa) VALUES(4,'Xiaomi')

INSERT INTO magazyn_firmy(firma_id,firma_nazwa) VALUES(5,'Philips')

SET IDENTITY_INSERT magazyn_firmy OFF;

SET IDENTITY_INSERT magazyn_kategorie ON;

INSERT INTO magazyn_kategorie(kategoria_id,kategoria_nazwa) VALUES(1,'Smartfon')

INSERT INTO magazyn_kategorie(kategoria_id,kategoria_nazwa) VALUES(2,'Tablet')

INSERT INTO magazyn_kategorie(kategoria_id,kategoria_nazwa) VALUES(3,'Laptop')

INSERT INTO magazyn_kategorie(kategoria_id,kategoria_nazwa) VALUES(4,'Komputer')

INSERT INTO magazyn_kategorie(kategoria_id,kategoria_nazwa) VALUES(5,'Sluchawki')

SET IDENTITY_INSERT magazyn_kategorie OFF;

SET IDENTITY_INSERT magazyn_produkty ON;

INSERT INTO magazyn_produkty(produkt_id, produkt_nazwa, firma_id, kategoria_id, model_rok, cena) VALUES(1,'Itelefon s18',1,1,2022,59999.99)

INSERT INTO magazyn_produkty(produkt_id, produkt_nazwa, firma_id, kategoria_id, model_rok, cena) VALUES(2,'Galaxy g20',2,2,2019,999.99)

INSERT INTO magazyn_produkty(produkt_id, produkt_nazwa, firma_id, kategoria_id, model_rok, cena) VALUES(3,'Ultrasucc 2000',3,3,2015,999.99)

INSERT INTO magazyn_produkty(produkt_id, produkt_nazwa, firma_id, kategoria_id, model_rok, cena) VALUES(4,'Ears Blaster 900',4,4,2015,420.99)

INSERT INTO magazyn_produkty(produkt_id, produkt_nazwa, firma_id, kategoria_id, model_rok, cena) VALUES(5,'Gaming Dream 2000',5,5,2021,9999.99)

SET IDENTITY_INSERT magazyn_produkty OFF;

INSERT INTO sprzedaz_klienci(imie, nazwisko, telefon, email, ulica, miasto, kod_pocztowy) VALUES('Bartek','Radzichowski','20 293964021','mail.example@gmail.com','przykladowa 1','Przykladowo',32500);

INSERT INTO sprzedaz_klienci(imie, nazwisko, telefon, email, ulica, miasto, kod_pocztowy) VALUES('Kasia','Gora',NULL,'mail.example2@gmail.com','przykladowa 2','Krakow',02999);

INSERT INTO sprzedaz_klienci(imie, nazwisko, telefon, email, ulica, miasto, kod_pocztowy) VALUES('Piotrek','Zawada',NULL,'mail.example3@gmail.com','przykladowa 3','Chrzanow',32000);

INSERT INTO sprzedaz_klienci(imie, nazwisko, telefon, email, ulica, miasto, kod_pocztowy) VALUES('Pawel','Piatek',NULL,'mail.example4@gmail.com','przykladowa 4','Krakow',36044);

INSERT INTO sprzedaz_klienci(imie, nazwisko, telefon, email, ulica, miasto, kod_pocztowy) VALUES('Wiktor','Starowicz','48 123023048','mail.example5@gmail.com','przykladowa 5','Przykladowo',00404);

INSERT INTO sprzedaz_sklepy(sklep_nazwa, telefon, email, ulica, miasto, kod_pocztowy) VALUES('Electromix','111111111','example1@gmail.com',NULL, 'Krakow',12352);;

INSERT INTO sprzedaz_sklepy(sklep_nazwa, telefon, email, ulica, miasto, kod_pocztowy) VALUES('Lombard Elektronika','2222222222','example2@gmail.com',NULL, 'Krakow',12353);

INSERT INTO sprzedaz_sklepy(sklep_nazwa, telefon, email, ulica, miasto, kod_pocztowy) VALUES('Elektronika u Tadzika','333333333','example3@gmail.com',NULL, 'Przykladowo',12353);

INSERT INTO sprzedaz_sklepy(sklep_nazwa, telefon, email, ulica, miasto, kod_pocztowy) VALUES('Kabelki u Marcinka','666666666','example6@gmail.com','Krakowska', 'Przykladowo',12378);

INSERT INTO sprzedaz_sklepy(sklep_nazwa, telefon, email, ulica, miasto, kod_pocztowy) VALUES('Apple Store','5555555555','example5@gmail.com',NULL, 'Alwernia',12343);

INSERT INTO magazyn_lista(sklep_id, produkt_id, ilosc) VALUES(1,1,4);

INSERT INTO magazyn_lista(sklep_id, produkt_id, ilosc) VALUES(2,2,5);

INSERT INTO magazyn_lista(sklep_id, produkt_id, ilosc) VALUES(3,3,6);

INSERT INTO magazyn_lista(sklep_id, produkt_id, ilosc) VALUES(4,4,3);

INSERT INTO magazyn_lista(sklep_id, produkt_id, ilosc) VALUES(5,5,22);

SET IDENTITY_INSERT sprzedaz_pracownicy ON;

INSERT INTO sprzedaz_pracownicy(pracownik_id, imie, nazwisko, email, telefon, sklep_id, menadzer_id) VALUES(1,'Pawel','Nowak','mail.example1@gmail.com','777777777',1,1);

INSERT INTO sprzedaz_pracownicy(pracownik_id, imie, nazwisko, email, telefon, sklep_id, menadzer_id) VALUES(2,'Gawel','Testowy','mail.example2@gmail.com','55555555555',2,1);

INSERT INTO sprzedaz_pracownicy(pracownik_id, imie, nazwisko, email, telefon, sklep_id, menadzer_id) VALUES(3,'Stas','Wysoki','mail.example3@gmail.com','7777777777',3,2);

INSERT INTO sprzedaz_pracownicy(pracownik_id, imie, nazwisko, email, telefon, sklep_id, menadzer_id) VALUES(4,'Jas','Niski','mail.example4@gmail.comm','37333333',4,2);

INSERT INTO sprzedaz_pracownicy(pracownik_id, imie, nazwisko, email, telefon, sklep_id, menadzer_id) VALUES(5,'Piotrek','Gora','mail.example5@gmail.com','111111111',5,1);

SET IDENTITY_INSERT sprzedaz_pracownicy OFF;

SET IDENTITY_INSERT sprzedaz_zamowienia ON;

INSERT INTO sprzedaz_zamowienia(zamowienie_id, klient_id, zamowienie_status, zamowienia_data, wysylka_data, sklep_id,pracownik_id) VALUES(1,1,1,'20201118','20201120',1,1);

INSERT INTO sprzedaz_zamowienia(zamowienie_id, klient_id, zamowienie_status, zamowienia_data, wysylka_data, sklep_id,pracownik_id) VALUES(2,2,2,'20201112','20201115',2,2);

INSERT INTO sprzedaz_zamowienia(zamowienie_id, klient_id, zamowienie_status, zamowienia_data, wysylka_data, sklep_id,pracownik_id) VALUES(3,3,3,'20201111','20201113',3,3);

INSERT INTO sprzedaz_zamowienia(zamowienie_id, klient_id, zamowienie_status, zamowienia_data, wysylka_data, sklep_id,pracownik_id) VALUES(4,4,4,'20201119','20201122',4,4);

INSERT INTO sprzedaz_zamowienia(zamowienie_id, klient_id, zamowienie_status, zamowienia_data, wysylka_data, sklep_id,pracownik_id) VALUES(5,5,1,'20201115','20201119',5,5);

SET IDENTITY_INSERT sprzedaz_zamowienia OFF;

INSERT INTO sprzedaz_zamowione_rzeczy(zamowienie_id, produkt_id, ilosc,cena,przecena) VALUES(1,1,2,599.99,0.2);

INSERT INTO sprzedaz_zamowione_rzeczy(zamowienie_id, produkt_id, ilosc,cena,przecena) VALUES(2,2,6,1799.99,0.07);

INSERT INTO sprzedaz_zamowione_rzeczy(zamowienie_id, produkt_id, ilosc,cena,przecena) VALUES(3,3,3,1549.00,0.05);

INSERT INTO sprzedaz_zamowione_rzeczy(zamowienie_id, produkt_id, ilosc,cena,przecena) VALUES(4,4,6,599.99,0.05);

INSERT INTO sprzedaz_zamowione_rzeczy(zamowienie_id, produkt_id, ilosc,cena,przecena) VALUES(5,5,4,2899.99,0.2); 