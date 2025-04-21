use videoverwaltung_fertig;
show tables;
explain film;
SHOW GLOBAL VARIABLES LIKE 'local_infile = 1';
LOAD DATA LOCAL INFILE 'C:\\Users\\Jan Speck\\Desktop\\2. Semester\\Modul 164\\Filme.csv'
INTO TABLE film
character set utf8
FIELDS TERMINATED BY ';' 
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(id_Film, Titel, Dauer, Kategorie, Jahr, Frei_ab, PreisProTag, Epreis, Lagerbestand);

select * from film;
