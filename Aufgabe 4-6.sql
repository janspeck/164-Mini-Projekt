use videoverwaltung_fertig;

-- Aufgabe 1
select Kunde.Ort, COUNT(*) as Anzahl_Kunden
from Kunde
group by Kunde.Ort
order by Anzahl_Kunden desc
limit 20;

-- Aufgabe 2
SELECT 
  Kunde.Nachname, 
  Kunde.Vorname, 
  COUNT(*) AS Anzahl_Ausleihen
FROM Ausleihe
JOIN Kunde ON Ausleihe.fs_Kunde = Kunde.id_Kunde
GROUP BY Kunde.id_Kunde
ORDER BY Anzahl_Ausleihen DESC
LIMIT 1;

-- Aufgabe 3
select distinct Kategorie
from Film;

-- Aufgabe 4
select 
Ausleihe.fs_Kunde as Kundennummer,Ausleihe.Ausleihe,
Ausleihe.Rueckgabe,
datediff(Ausleihe.Rueckgabe, Ausleihe.Ausleihe) + 1 as Dauer_in_Tagen
from Ausleihe
where Ausleihe.Rueckgabe is not null;
