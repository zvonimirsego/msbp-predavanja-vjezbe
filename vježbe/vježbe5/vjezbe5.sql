DROP TABLE IF EXISTS PALETA1;

DROP TABLE IF EXISTS PALETA2;

-- Kreiranje tablica

CREATE TABLE PALETA1 (
    boja_id INTEGER PRIMARY KEY,
	boja VARCHAR(100) NOT NULL
);

CREATE TABLE PALETA2 (
	boja_id INTEGER PRIMARY KEY,
	boja VARCHAR(100) NOT NULL
);

-- Unos vrijednosti 
INSERT INTO PALETA1 VALUES
(1, 'crvena'),
(2, 'zelena'),
(3, 'plava'),
(4, 'ljubičasta');

INSERT INTO PALETA2 VALUES
(1, 'crvena'),
(2, 'zelena'),
(3, 'narančasta'),
(4, 'smeđa');

COMMIT;


SELECT
    *
FROM
    PALETA1;

SELECT
    *
FROM
    PALETA2;


-- a
-- inner join
SELECT *
FROM paleta1 INNER JOIN paleta2 USING(boja);


-- b
-- left (outer) join
SELECT *
FROM paleta1 LEFT JOIN paleta2 USING(boja);

-- c
-- left (outer) join u kojemu  ́ce biti iskljuceni retci koji se nalaze u desnoj tablici
SELECT *
FROM paleta1 LEFT JOIN paleta2 USING(boja)
WHERE paleta2.boja_id IS NULL;


-- d
-- right (outer) join
SELECT *
FROM paleta1 RIGHT JOIN paleta2 USING(boja);

-- e
-- right (outer) join u kojemu  ́ce biti iskljuceni retci koji se nalaze u lijevoj tablici
SELECT *
FROM paleta1 RIGHT JOIN paleta2 USING(boja)
WHERE paleta1.boja_id IS NULL;

-- f
-- full (outer) join
SELECT *
FROM paleta1 FULL JOIN paleta2 USING(boja);

-- g
-- full (outer) join koji  ́ce sadrzavati samo retke koji se nalaze ili u jednoj ili u drugoj tablici
SELECT *
FROM paleta1 FULL JOIN paleta2 USING(boja)
WHERE NOT((paleta1.boja_id IS NOT NULL) AND (paleta2.boja_id IS NOT NULL));

-- Zadatak 2
-- U bazi podataka za nastavu pronadite sve djelatnike koji nisu u izvedbenom planu

INSERT INTO djelatnik VALUES (3900, 'Bartol', 'Borozan', 'M');
INSERT INTO djelatnik VALUES (4000, 'Tomisav', 'Prusina', 'M');

SELECT d.ime, d.prezime
FROM djelatnik d LEFT JOIN djelatnik_izvedbeni di USING (djelatnik_id)
WHERE di.izvedbeni_id IS NULL;

-- Zadatak 3
-- U bazi podataka za nastavu pronadite sve kolegije koji se ne nalaze u izvedbenom planu

INSERT INTO kolegij VALUES('I049', 'Programiranje mobilnih aplikacija', 2, 2, 1, 7);
INSERT INTO kolegij VALUES('I043', 'Bioinformatika', 2, 2, 0, 6);

SELECT k.naziv
FROM kolegij k LEFT JOIN studijski_program sp USING (kolegij_id)
LEFT JOIN izvedbeni_plan ip USING (st_prog_id)
WHERE sp.st_prog_id IS NULL;

-- Zadatak 4
-- U bazi podataka za tvrtku koristeći upit pronađite 
-- kategoriju proizvoda (tablica product_categories) koja se ne nalazi u tablici proizvod (products).
SELECT pc.category_name
FROM product_categories pc LEFT JOIN products p USING (category_id)
WHERE p.product_id IS NULL;

-- Zadatak 5
-- U bazi podataka za tvrtku pronađite sve lokacije u kojima se ne nalazi skladište.
SELECT l.city
FROM warehouses w RIGHT JOIN locations l USING (location_id)
WHERE w.warehouse_id IS NULL;

-- Zadatak 6
-- U bazi podataka za prodavaonicu elektroničke opreme pronadite sve proizvodače koji proizvode i pc i prijenosnike. Rezultate posložite po proizvodačima abecedno.  
SELECT DISTINCT p1.proizvodjac
FROM proizvod p1 INNER JOIN proizvod p2 USING (proizvodjac)
WHERE (p1.tip = 'pc' AND p2.tip = 'prijenosnik') 
OR (p2.tip = 'pc' AND p1.tip = 'prijenosnik');

-- Zadatak 7
-- U bazi podataka za tvrtku ispišite ime i prezime zaposlenika (stupac nazovite zaposlenik), 
-- pokraj njega ime i prezime njegovog menadžera (stupac nazovite menadžer) te radno mjesto 
-- zaposlenika. Podatke poslažite po imenima menadžera.
SELECT
    (z.first_name || '  ' || z.last_name) zaposlenik,
    (m.first_name || '  ' || m.last_name) menadžer,
    z.job_title
FROM employees z
LEFT JOIN employees m 
ON m.employee_id = z.manager_id
ORDER BY menadžer;


-- Zadatak 8
--  Ispišite duljinu imena svakog djelatnika iz baze za nastavu.
SELECT LENGTH(ime)
FROM djelatnik;


-- Zadatak 9
-- U bazi za nastavu ispišite ime i prezime svih djelatnika malim slovima
SELECT lower(ime), lower(prezime)
FROM djelatnik;

-- zadatak 10
-- U bazi za nastavu ispišite broj predavanja, vježbi i seminara iz kolegija kao znakove



-- Zadatak 11
-- Iz baze podataka za nastavu ispišite prosječan broj ECTS-a na kolegijima
SELECT avg(ects)
FROM kolegij;

-- Zadatak 12
-- Iz baze podataka za nastavu ispišite najveći i najmanji broj sati predavanja na kolegijima.
select min(p), max(p)
from kolegij;

-- Zadatak 13
-- Iz baze podataka za nastavu ispišite prosječan broj ECTS-a po kolegijima s obzirom koliko sati predavanja imaju
select p, round(avg(ects), 2)
from kolegij
group by p
order by p;

-- Zadatak 14
-- Za unesene smjerove napišite upit koji će vratiti naziv smjera, te posebno broj kolegija koji su obvezni 
-- i broj onih koji nisu obvezni (dva retka za svaki studij, jedan obvezni drugi izborni, i u rezultatima umjesto vrijednosti u stupcu obvezni treba 
-- pisati obvezni ili izborni) te maksimalni i minimalni broj ECTS bodova (po smjeru i po tome je li izborni ili ne). Rezultate poredajte po nazivu studija.
SELECT vs.naziv, CASE WHEN 
sp.obvezni = 0 THEN 'izborni'
ELSE 'obvezni' END AS tip, 
COUNT(*) broj, MAX(k.ects), MIN(k.ects)
FROM vrsta_studija vs INNER JOIN studijski_program sp USING (vrsta_studija_id)
INNER JOIN kolegij k USING (kolegij_id)
INNER JOIN izvedbeni_plan USING (st_prog_id)
GROUP BY vs.naziv, tip
ORDER BY vs.naziv;

-- Zadatak 15
-- Napišite upit koji će vratiti naziv studija, godinu studija i semestar za sve one semestre na odredenoj godini studija kod kojih obvezni kolegiji imaju 
-- ukupan broj ECTS bodova (u semestru) veći ili jednak 20. Rezultate poredajte po nazivu studija, a zatim po godini.
SELECT vs.naziv, sp.godina, ip.semestar, SUM(k.ects)
FROM vrsta_studija vs INNER JOIN studijski_program sp USING (vrsta_studija_id)
INNER JOIN kolegij k USING (kolegij_id)
INNER JOIN izvedbeni_plan ip USING (st_prog_id)
WHERE sp.obvezni = 1
GROUP BY vs.naziv, sp.godina, ip.semestar
HAVING SUM(k.ects) >= 20
ORDER BY vs.naziv, sp.godina;


-- Zadatak 16
-- Ispišite nazive smjera i kolegija, za sve one izborne kolegije na kojima radi dvoje ili više nastavnika. Rezultate poredajte po nazivu smjera, 
-- a zatim po nazivu kolegija.
SELECT vs.naziv, k.naziv
FROM vrsta_studija vs INNER JOIN studijski_program sp USING (vrsta_studija_id)
INNER JOIN kolegij k USING (kolegij_id)
INNER JOIN izvedbeni_plan ip USING (st_prog_id)
INNER JOIN djelatnik_izvedbeni di USING (izvedbeni_id)
WHERE sp.obvezni = 0 AND di.uloga = 'nastavnik'
GROUP BY vs.naziv, k.naziv
HAVING count(*) >= 2
ORDER BY vs.naziv, k.naziv;


-- Zadatak 17
-- Za svakog djelatnika ispišite njegovo ime, prezime i broj kolegija na
-- kojima je nastavnik, te broj kolegija na kojima je asistent. Rezultate poredajte po
-- prezimenu djelatnika, a zatim po imenu.  (Napomena: svaki djelatnik u rezultatu se može pojaviti najviše dva puta ).
SELECT d.ime, d.prezime, di.uloga, COUNT(*)
FROM djelatnik d INNER JOIN djelatnik_izvedbeni di USING (djelatnik_id)
INNER JOIN izvedbeni_plan ip USING (izvedbeni_id)
INNER JOIN studijski_program sp USING (st_prog_id)
INNER JOIN kolegij k USING (kolegij_id)
GROUP BY d.ime, d.prezime, di.uloga
ORDER BY d.prezime, d.ime;

COMMIT;
-- Zadatak 18
-- Napišite upit koji će vratiti broj poslanih (shipped) narudžbi za svakog kupca (customer).
SELECT * FROM orders;

SELECT c.name, COUNT(*)
FROM customers c INNER JOIN orders o USING (customer_id)
WHERE o.status = 'Shipped'
GROUP BY c.name;

-- Zadatak 19
-- Napišite upit koji će vratiti broj narudžbi (order) za svaku godinu u kojoj je napravljena neka narudžba.
SELECT EXTRACT(YEAR FROM order_date) as "YEAR", COUNT( order_id )
FROM orders
GROUP BY EXTRACT(YEAR FROM order_date)
ORDER BY "YEAR";


-- Zadatak 20
-- Napišite upit koji će vratiti id i iznose za svaku narudžbu kojoj je iznos veći od 1000000.
SELECT order_id, sum(quantity * unit_price) AS "iznos"
FROM order_items
GROUP BY order_id
HAVING sum(quantity * unit_price) > 1000000;

-- Zadatak 21
-- Napišite upit koji će vratiti id, broj stavki (items) i ukupan iznos narudžbe 
-- za one narudžbe koje imaju između 10 i 12 stavki te kojima je ukupan iznos veći od 500000.
SELECT order_id, COUNT(item_id),  sum(quantity * unit_price) AS "iznos"
FROM order_items
GROUP BY order_id
HAVING sum(quantity * unit_price) > 500000 AND
COUNT(item_id) BETWEEN 10 AND 12;

