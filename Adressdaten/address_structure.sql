CREATE DATABASE videothek_neu;
USE videothek_neu;

CREATE TABLE Sprache (
    id_Sprache INT AUTO_INCREMENT PRIMARY KEY,
    Bezeichnung VARCHAR(50) NOT NULL
);


CREATE TABLE Kanton (
    id_Kanton INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL
);


CREATE TABLE Ort (
    id_Ort INT AUTO_INCREMENT PRIMARY KEY,
    PLZ INT NOT NULL,
    Ortsbezeichnung VARCHAR(100) NOT NULL,
    fs_Kanton INT,
    FOREIGN KEY (fs_Kanton) REFERENCES Kanton(id_Kanton)
);


CREATE TABLE Strasse (
    id_Strasse INT AUTO_INCREMENT PRIMARY KEY,
    Bezeichnung_Abkuerzung VARCHAR(100),
    Bezeichnung_Regulaer VARCHAR(100),
    Lokationstyp ENUM('Strasse', 'Gebaeude') NOT NULL
);


CREATE TABLE Adresse (
    id_Adresse INT AUTO_INCREMENT PRIMARY KEY,
    fs_Strasse INT,
    Hausnummer VARCHAR(10),
    fs_Ort INT,
    FOREIGN KEY (fs_Strasse) REFERENCES Strasse(id_Strasse),
    FOREIGN KEY (fs_Ort) REFERENCES Ort(id_Ort)
);


CREATE TABLE Kunde (
    id_Kunde INT AUTO_INCREMENT PRIMARY KEY,
    Anrede ENUM('Herr', 'Frau') NOT NULL,
    Vorname VARCHAR(50) NOT NULL,
    Nachname VARCHAR(50) NOT NULL,
    Geburtsdatum DATE,
    fs_Adresse INT,
    fs_Sprache INT,
    FOREIGN KEY (fs_Adresse) REFERENCES Adresse(id_Adresse),
    FOREIGN KEY (fs_Sprache) REFERENCES Sprache(id_Sprache)
);
