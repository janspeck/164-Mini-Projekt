show databases;
use videoverwaltung_fertig;

-- Aufgabe 1
Insert into Kunde (Anrede, Vorname, Nachname, Strasse, PLZ, Ort)
Values
('Herr', 'Arthur', 'Dent', '155 Country Lane', '1234', 'Cottington'
);

-- Aufgabe 2
SELECT kunde.Nachname, kunde.Vorname, COUNT(id_Ausleihe) AS Ausleihen
FROM Kunde
LEFT JOIN Ausleihe ON id_Kunde = fs_Kunde
GROUP BY id_Kunde, Nachname, Vorname
ORDER BY Ausleihen ASC, kunde.Nachname ASC, kunde.Vorname ASC;

-- Aufgabe 3
SELECT film.Titel
FROM Film
LEFT JOIN Ausleihe ON Film.id_Film = Ausleihe.fs_Film
WHERE Ausleihe.id_Ausleihe IS NULL
ORDER BY film.Titel ASC;

-- Aufgabe 4
SELECT kunde.Nachname, kunde.Vorname, COUNT(id_Ausleihe) AS Ausleihen
FROM Ausleihe
RIGHT JOIN Kunde ON id_Kunde = fs_Kunde
GROUP BY id_Kunde, kunde.Nachname, kunde.Vorname
ORDER BY Ausleihen ASC, kunde.Nachname ASC, kunde.Vorname ASC;

-- Aufgabe 5
SELECT film.Titel
FROM Ausleihe
RIGHT JOIN Film ON Film.id_Film = Ausleihe.fs_Film
WHERE Ausleihe.id_Ausleihe IS NULL
ORDER BY film.Titel ASC;