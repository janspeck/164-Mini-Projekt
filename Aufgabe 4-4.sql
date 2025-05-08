/*
Autor: Jan Speck
Datum: 12.02.2025
DB. videothek
*/

/* Datenbank erstellen */
CREATE DATABASE videothek;
USE videothek;

CREATE DATABASE videothek;
USE videothek;

show tables;

/* Tabelle Film erstellen */
CREATE TABLE FILM (
    id_film INT AUTO_INCREMENT PRIMARY KEY,
    Titel VARCHAR(50) NOT NULL,
    Dauer TIME NOT NULL,
    Kategorie VARCHAR(3) NOT NULL,
    Jahr YEAR NOT NULL,
    Frei_ab INT NOT NULL,
    PreisProTag DECIMAL(4,2) NOT NULL,
    EPreis DECIMAL(4,2) NOT NULL,
    Lagerbestand INT NOT NULL
);

/* Tabelle Kunde erstellen */
CREATE TABLE KUNDE (
    id_Kundenummer INT AUTO_INCREMENT PRIMARY KEY,
    Anrede ENUM('Herr', 'Frau') NOT NULL,
    Vorname VARCHAR(50) NOT NULL,
    Nachname VARCHAR(50) NOT NULL,
    Strasse VARCHAR(50) NOT NULL,
    PLZ CHAR(4) NOT NULL,
    Ort VARCHAR(50) NOT NULL,
    Telefon VARCHAR(50) NOT NULL,
    Geburtsdatum DATE NOT NULL
);

/* Tabelle Ausleihe erstellen */
CREATE TABLE AUSLEIHE (
    id_Ausleihnr INT AUTO_INCREMENT PRIMARY KEY,
    fs_Kundennummer INT NOT NULL,
    fs_film INT NOT NULL,
    Ausleihe DATE NOT NULL,
    Rueckgabe DATE NOT NULL,
    FOREIGN KEY (fs_Kundennummer) REFERENCES KUNDE(id_Kundenummer),
    FOREIGN KEY (fs_film) REFERENCES FILM(id_film)
);

/* Tabelle Darsteller erstellen */
CREATE TABLE darsteller 
(
	id_darsteller INT AUTO_INCREMENT NOT NULL,
    vorname VARCHAR(20) NOT NULL,
    nachnamen VARCHAR(20) NOT NULL
);

/* Tabelle Regisseur erstellen */
CREATE TABLE regisseur
(
	id_regisseur INT AUTO_INCREMENT NOT NULL,
    vorname VARCHAR(20) NOT NULL,
    nachnamen VARCHAR(20) NOT NULL
);

/* Tabelle film_darsteller erstellen */
CREATE TABLE  film_darsteller
(
	fs_film INT NOT NULL,
    fs_darsteller INT NOT NULL,
    FOREIGN KEY (fs_film) REFERENCES film(id_film),
    FOREIGN KEY (fs_darsteller) REFERENCES darsteller(id_darsteller)
);

/* Tabelle film_Regisseur erstellen */
CREATE TABLE film_regisseur
(
	fs_film INT NOT NULL,
    fs_regisseur INT NOT NULL,
    FOREIGN KEY (fs_film) REFERENCES film(id_film),
    FOREIGN KEY (fs_regisseur) REFERENCES regisseur(id_regisseur)
);

select * from film;

CREATE TABLE only_film (
	id_film INT PRIMARY KEY,
    name VARCHAR(50)
);




select * from only_film;


INSERT INTO only_film (id_film, name)
SELECT id_film, Titel
FROM film;



SELECT Titel, PreisProTag
FROM film;


SELECT Titel, Jahr
FROM film
WHERE Jahr > '1970';




SELECT Titel, Jahr
FROM film
ORDER BY Jahr ASC;

SELECT Titel, Kategorie, Jahr
FROM film
where Kategorie = 'KRI'
ORDER BY Jahr DESC;


SELECT TITEL 
from film 
where jahr = (
	SELECT TITEL
    FROM film
    order by PreisProTag asc
    LIMIT 1
);

SELECT Titel, Jahr, PreisProtag
FROM film
where jahr >= 1970
AND PreisProTag > (
	SELECT titel
    FROM film
    ORDER BY PreisProTag ASC
    LIMIT 1
);


SELECT Titel, PreisProTag
FROM film
where PreisProTag = (
	select PreisProTag
    FROM film
    order by PreisProTag DESC
    LIMIT 1
);


SELECT titel
From film
where jahr = (
	select Jahr
    from film
    order by jahr DESC
);


show tables;
use videothek;


select * from film;


-- 1 --
SELECT SUM(lagerbestand) AS AnzLagerbestand, Frei_ab
from film
GROUP BY Frei_ab;



-- 2 --
SELECT SUM(Lagerbestand) AS Anzahl_kassetten
FROM Film;



-- 3 --

SELECT Ort, COUNT(*) AS Anzahl_kunden
FROM Film
GROUP BY Ort;


-- 4 --
SELECT MAX(Epreis) AS Teuerste_kassette
FROM Film;

-- 5 --
SELECT AVG(PreisProTag) AS DurchschnittspreisProTag
FROM Film
WHERE Kategorie = 'Krimi';
