----------------------------------------------------------------------------------
-- POGLEDI
----------------------------------------------------------------------------------

------------
-- ZADATAK 1
------------
-- Kreirajte pogled na sve kolegije čija tjedna satnica predavanja
-- i vježbi (zajedno) je veća ili jednaka 4

-- pogled
CREATE VIEW kolegij_velika_satncia
AS
SELECT *
FROM kolegij
WHERE p + v >= 4;

-- a) podaci u pogledu
SELECT *
FROM kolegij_velika_satncia;

-- b) 
-- -- Može li se preko pogleda unijeti kolegij Bioinformatika?
-- unos kolegija Bioinformatika
INSERT INTO kolegij_velika_satncia
VALUES ('I043', 'Bioinformatika', 2, 2, 0, 6);

SELECT * FROM kolegij;

------------
-- ZADATAK 2
------------
-------------------------------------------------------------------------

-- a)
-- Napravite pogled koji će sadržavati ime, prezime, spol i ulogu svih djelatnika
-- koji sudjeluju u izvođenju nekog kolegija na prvoj godini preddiplomskog studija matematike.
CREATE VIEW predd_mat_1god_djelatnici
AS
SELECT DISTINCT ime, prezime, spol, uloga
FROM vrsta_studija vs INNER JOIN studijski_program sp USING (vrsta_studija_id)
INNER JOIN izvedbeni_plan ip USING (st_prog_id)
INNER JOIN djelatnik_izvedbeni di USING (izvedbeni_id)
INNER JOIN djelatnik d USING (djelatnik_id)
WHERE godina = 1 and vs.naziv = 'Preddiplomski studij Matematika';


-- b)
-- Napravite pogled koji će sadržavati nazive svih kolegija, satnice predavanja, vježbi
-- i seminara, ects bodove i ime i prezime (ime i prezime spojeno kao jedan atribut) nastavnika (uloga)
-- na tom kolegiju, a koji se izvode na drugoj godini preddiplomskog studija Matematika i računarstvo.
CREATE VIEW predd_mir_2god
AS
SELECT k.naziv, k.p, k.v, k.s, k.ects, d.ime || ' ' || d.prezime AS "Ime i prezime"
FROM kolegij k INNER JOIN studijski_program sp USING (kolegij_id)
INNER JOIN vrsta_studija vs USING (vrsta_studija_id)
INNER JOIN izvedbeni_plan ip USING (st_prog_id)
INNER JOIN djelatnik_izvedbeni di USING (izvedbeni_id)
INNER JOIN djelatnik d USING (djelatnik_id)
WHERE godina = 2 
AND vs.naziv = 'Preddiplomski studij Matematika i računarstvo' 
AND uloga = 'nastavnik';


-- c)
--  Napravite pogled koji će sadržavati nazive studija, godinu studija i broj
-- različitih djelatnika koji sudjeluju u izvođenju nastave na tom smjeru i godini
-- studija. Rezultate poredajte po nazivu smjera pa po godini studija.
CREATE VIEW djelatnici_studij
AS
SELECT vs.naziv, godina, COUNT(DISTINCT djelatnik_id)
FROM studijski_program sp INNER JOIN vrsta_studija vs USING (vrsta_studija_id)
INNER JOIN izvedbeni_plan ip USING (st_prog_id)
INNER JOIN djelatnik_izvedbeni di USING (izvedbeni_id)
GROUP BY vs.naziv, godina
ORDER BY vs.naziv, godina;
COMMIT;

------------------------------------------------------------------------------
------------
-- ZADATAK 3
------------
-- Kreirajte pogled koji će prikazati ime, opis i standardnu cijenu proizvoda čija je cijena veća od 1000.
CREATE VIEW proizvod_pogled
AS
SELECT product_name, description, standard_cost
FROM products
WHERE standard_cost > 1000;
COMMIT;


--------------------------------------------------------------------------------

------------
-- ZADATAK 4
------------
 -- Promijenite naziv proizvoda s Intel Xeon E5-2697 V4 u Intel Xeon E5-2697 V4 - snd edition . Opozovite tu promjenu
UPDATE proizvod_pogled
SET product_name = 'Intel Xeon E5-2697 V4 - snd edition'
WHERE product_name = 'Intel Xeon E5-2697 V4';

SELECT *
FROM products;

ROLLBACK;
--------------------------------------------------------------------------------

------------
-- ZADATAK 5
------------
-- Kreirajte promjenjivi pogled iz zadatka 4. tako da su promjene u stupcu cijena moguće samo u cijenu koja je veća od 1000.
-- Probajte ažurirati cijenu u manju od 1000. Što uočavate? 
SELECT * FROM proizvod_pogled;

UPDATE proizvod_pogled
SET standard_cost = 500
WHERE standard_cost > 2000;

ROLLBACK;

CREATE VIEW proizvodi_pogled
AS
SELECT product_name, description, standard_cost
FROM products
WHERE standard_cost > 1000
WITH LOCAL CHECK OPTION;

UPDATE proizvodi_pogled
SET standard_cost = 500
WHERE standard_cost > 2000;

------------
-- ZADATAK 6
------------
-- Kreirajte materijaliziran pogled koji za svakog kupca izračunava ukupan iznos svih poslanih narudžbi tog kupca. Ažurirajte podatke.
SELECT * FROM order_items;

CREATE MATERIALIZED VIEW proizvodi_dost_pogledi AS
SELECT customer_id, sum(quantity*unit_price)
FROM orders INNER JOIN order_items USING (order_id)
WHERE status = 'Shipped'
GROUP BY customer_id
ORDER BY customer_id
WITH NO DATA;

SELECT * FROM proizvodi_dost_pogledi;

REFRESH MATERIALIZED VIEW proizvodi_dost_pogledi;

CREATE UNIQUE INDEX proizvod_idx
ON proizvodi_dost_pogledi(customer_id);

REFRESH MATERIALIZED VIEW CONCURRENTLY proizvodi_dost_pogledi;

------------------------------------------------------------------------------------------------------------------
-- Ponavljanje za kolokvij
------------------------------------------------------------------------------------------------------------------

-- Kreiranje tablica
CREATE TABLE vrsta(
	vrsta_id SERIAL PRIMARY KEY,
	naziv VARCHAR(100) NOT NULL,
	OPIS VARCHAR(200) NOT NULL
);

CREATE TABLE posvojitelj(
	posvojitelj_id SERIAL PRIMARY KEY,
	ime VARCHAR(100) NOT NULL,
	prezime VARCHAR(100) NOT NULL,
	email VARCHAR(200) NOT NULL
);

CREATE TABLE zivotinja(
	zivotinja_id SERIAL PRIMARY KEY,
	ime VARCHAR(100) NOT NULL,
	TEZINA NUMERIC(6, 2) NOT NULL,
	datum_rodjenja DATE NOT NULL,
	vrsta_id INTEGER NOT NULL CONSTRAINT vrsta_zivotinja_fk REFERENCES vrsta(vrsta_id)
);

CREATE TABLE posvojitelj_zivotinja(
	posvojitelj_id INTEGER NOT NULL CONSTRAINT posvojitelj_fk REFERENCES posvojitelj(posvojitelj_id),
	zivotinja_id INTEGER NOT NULL CONSTRAINT zivotinja_fk REFERENCES zivotinja(zivotinja_id),
	PRIMARY KEY (posvojitelj_id, zivotinja_id)
);
COMMIT;

-- Unos podataka
ROLLBACK;
INSERT INTO vrsta(naziv, opis)
VALUES
('Lav', 'Veliki mesojed iz porodice mačaka');

SELECT * FROM vrsta;

INSERT INTO zivotinja(ime, datum_rodjenja, tezina, vrsta_id)
VALUES
('Lavi', '01.05.2020.', 190, 5);

INSERT INTO posvojitelj(ime, prezime, email)
VALUES
('Ivan', 'Ivic', 'ivanivic@gmail.com');

SELECT * FROM zivotinja;
SELECT * FROM posvojitelj;

INSERT INTO posvojitelj_zivotinja(posvojitelj_id, zivotinja_id)
VALUES
(3, 5);

COMMIT;

INSERT INTO Vrsta (naziv, opis) 
VALUES 
('Slon', 'Najveći kopneni sisavac'),
('Tigar', 'Veliki mesožder iz porodice mačaka'),
('Žirafa', 'Najviši kopneni sisavac'),
('Nosorog', 'Veliki kopneni sisavac s debelom kožom'),
('Zmija', 'Opasni gmaz');

SELECT * FROM vrsta;
commit;

INSERT INTO Zivotinja (ime, datum_rodjenja, tezina, vrsta_id) 
VALUES 
('Soni', '2019-03-15', 5400.0, 11), 
('Tigo', '2018-08-10', 520.0, 12),  
('Gira', '2021-07-05', 800.0, 13),  
('Rogi', '2017-06-20', 2300.0, 14);

SELECT * FROM ZIVOTINJA;
commit;

INSERT INTO Posvojitelj (ime, prezime, email) 
VALUES 
('Ana', 'Anić', 'ana.anic@example.com'),
('Marko', 'Markić', 'marko.markic@example.com'),
('Petra', 'Petrić', 'petra.petric@example.com'),
('Jure', 'Jurić', 'jure.juric@example.com');
commit;

SELECT * FROM posvojitelj;


INSERT INTO Posvojitelj_Zivotinja (posvojitelj_id, zivotinja_id) 
VALUES 
(3, 6),  
(4, 6),  
(5, 8),  
(6, 9),  
(5, 9),  
(4, 5);  
COMMIT;

-- Zadatak 
-- a)
-- Ispišite sve vrste životinja i životinje u zoološkom koje pripadaju tim vrstama 
-- (ako za neku vrstu životinje ne postoji životinja u zoološkom, treba ispisati NULL).
SELECT naziv, ime
FROM zivotinja RIGHT JOIN vrsta
USING (vrsta_id);

-- b)
-- Ispišite id, ime i prezime posvojitelja, naziv životinje koju je posvojio i kojoj vrsti ta životinja pripada.
-- (ime i prezime spojite u jedan atribut koji se zove ‘Ime i prezime’)
SELECT p.posvojitelj_id, p.ime || ' ' || p.prezime as "Ime i prezime", z.ime, v.naziv
FROM posvojitelj p INNER JOIN posvojitelj_zivotinja pz USING (posvojitelj_id)
INNER JOIN zivotinja z USING (zivotinja_id)
INNER JOIN vrsta v USING (vrsta_id);

-- c)
-- Ispišite imena životinja koje nema posvojitelja
SELECT ime 
FROM zivotinja LEFT JOIN posvojitelj_zivotinja USING (zivotinja_id)
WHERE posvojitelj_id IS NULL;

-- d)
-- Ispišite sve životinje čija je težina između 500 i 1000, a ime započinje slovom ‘G’.
SELECT *
FROM zivotinja
WHERE (tezina BETWEEN 500 AND 1000)
AND ime LIKE 'G%';

-- e)
-- Ispišite imena životinja koje imaju barem dva posvojitelja.  
SELECT ime
FROM zivotinja INNER JOIN posvojitelj_zivotinja USING (zivotinja_id)
GROUP BY ime
HAVING COUNT(posvojitelj_id) >= 2
ORDER BY ime;


-- Zadatak
-- a)
-- Svim životinjama smanjite težinu za 10%.
SELECT * FROM zivotinja;

UPDATE zivotinja
SET tezina = 0.9 * tezina;

-- b)
-- Posvojitelju s ID-jem 2 pridružite životinju s ID-jem 3, umjesto životinje s ID-jem 1.
SELECT * FROM posvojitelj_zivotinja;

UPDATE posvojitelj_zivotinja
SET zivotinja_id = 7
WHERE posvojitelj_id = 4 AND zivotinja_id = 5;

-- c)
-- Poništite promjene napravljene u zadacima a) i b).
ROLLBACK;

-- d)
-- Stupac ime u tablici zivotinja povećajte za 50 znakova.
SELECT * FROM zivotinja;

ALTER TABLE zivotinja
ALTER COLUMN ime TYPE VARCHAR(150);

-- e)
-- Obrišite sve podatke iz tablice posvojitelj_zivotinja.
TRUNCATE TABLE posvojitelj_zivotinja;
SELECT * FROM posvojitelj_zivotinja;

-- f)
-- Obrišite sve napravljene tablice.
DROP TABLE IF EXISTS posvojitelj_zivotinja;
DROP TABLE IF EXISTS zivotinja;
DROP TABLE IF EXISTS vrsta;
DROP TABLE IF EXISTS posvojitelj;

------------------------------------------------------------------------------------------------------------------
-- TRANSKACIJE I INDEKSI
------------------------------------------------------------------------------------------------------------------
-- Savepoint

SELECT * FROM KOLEGIJ
WHERE P = 1;

SAVEPOINT S1;
UPDATE KOLEGIJ
SET ECTS = 1
WHERE KOLEGIJ_ID='I027';

SAVEPOINT S2;
UPDATE KOLEGIJ
SET ECTS = 1
WHERE KOLEGIJ_ID='M095';

SAVEPOINT S3;
UPDATE KOLEGIJ
SET ECTS = 1
WHERE KOLEGIJ_ID='M063';

-- Vratimo se na S3

-- Vratimo se na S2

-- Vratimo se na S1

-- Neponavljajuća čitanja


----------------------------------------------------------------------------------
-- INDEKSI
----------------------------------------------------------------------------------
-- B-tree indeksi
---------------------
-- a) Napravite B-tree indeks i price na stupcu list price u tablici products

-- b) INDEKSE MOZEMO MODIFICIRATI
-- Primenujte indeks u index price

-- b) INDEKSE MOZEMO BRISATI
-- Obrisite napravljeni indeks


---------------------
-- Hash indeksi
---------------------
-- c) Napravite hash indeks na stupcu status u tablici orders.