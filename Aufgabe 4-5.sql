use videoverwaltung_fertig;
-- Aufgabe 1
SELECT Film.Titel FROM Ausleihe JOIN Kunde ON Ausleihe.fs_Kunde = Kunde.id_Kunde JOIN Film ON Ausleihe.fs_Film = Film.id_Film WHERE Kunde.Vorname = 'Ueli' AND Kunde.Nachname = 'Schneider';

-- Aufgabe 2
SELECT DISTINCT Kunde.Vorname, Kunde.Nachname, Film.Titel
FROM Ausleihe
JOIN Kunde ON Ausleihe.fs_Kunde = Kunde.id_Kunde
JOIN Film ON Ausleihe.fs_Film = Film.id_Film
WHERE Film.Kategorie = 'SF';

-- Aufgabe 3
SELECT Regisseur.Vorname, Regisseur.Nachname
FROM Film
JOIN Film_Regisseur ON Film.id_Film = Film_Regisseur.fs_Film
JOIN Regisseur ON Film_Regisseur.fs_Regisseur = Regisseur.id_Regisseur
WHERE Film.Titel = 'Alien 3';

-- Aufgabe 4
SELECT DISTINCT Kunde.Vorname, Kunde.Nachname, Kunde.Telefon
FROM Ausleihe
JOIN Kunde ON Ausleihe.fs_Kunde = Kunde.id_Kunde
WHERE Ausleihe.Rueckgabe IS NULL OR Ausleihe.Rueckgabe = '';

-- Aufgabe 5
SELECT DISTINCT Kunde.Vorname, Kunde.Nachname
FROM Ausleihe
JOIN Kunde ON Ausleihe.fs_Kunde = Kunde.id_Kunde
JOIN Film ON Ausleihe.fs_Film = Film.id_Film
JOIN Film_Darsteller ON Film.id_Film = Film_Darsteller.fs_Film
JOIN Darsteller ON Film_Darsteller.fs_Darsteller = Darsteller.id_Darsteller
WHERE Darsteller.Vorname = 'Tom' AND Darsteller.Nachname = 'Cruise';
