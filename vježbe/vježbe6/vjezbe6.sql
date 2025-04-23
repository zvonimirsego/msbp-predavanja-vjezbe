--------------------------------------------------------------------------
-- Podupiti
-------------------------------------------------------------------------
-- Zadatak 1
-- Napišite upit koji će za svaki studij i godinu vratiti koliko 
-- prosječno različitih djelatnika sudjeluje u izvođenju kolegija 
-- (uloga djelatnika na kolegiju nije bitna). Rezultate poredajte po 
-- nazivu smjera, a zatim po godini. Zaglavlje tablice:
-- Naziv studija, Godina, Prosječan broj djelatnika

SELECT vs.naziv "Naziv studija", sp.godina "Godina", AVG(podupit.br) "Prosječan broj djelatnika"
FROM (SELECT ip.izvedbeni_id, ip.st_prog_id, COUNT(DISTINCT di.djelatnik_id) br
FROM izvedbeni_plan ip INNER JOIN djelatnik_izvedbeni di USING (izvedbeni_id)
GROUP BY ip.izvedbeni_id, ip.st_prog_id) podupit
INNER JOIN studijski_program sp USING (st_prog_id)
INNER JOIN kolegij k USING (kolegij_id)
INNER JOIN vrsta_studija vs USING (vrsta_studija_id)
GROUP BY vs.naziv, sp.godina
ORDER BY vs.naziv, sp.godina;

SELECT vs.naziv "Naziv studija", sp.godina "Godina", AVG(podupit.br_nast) "Prosječan broj djelatnika"
FROM
	     (SELECT st_prog_id, izvedbeni_id, COUNT(DISTINCT djelatnik_id) br_nast
	     FROM izvedbeni_plan ip
	     INNER JOIN djelatnik_izvedbeni di
	     USING (izvedbeni_id)
	     GROUP BY izvedbeni_id, st_prog_id) podupit
	INNER JOIN studijski_program sp
	USING (st_prog_id)
	INNER JOIN vrsta_studija vs
	USING (vrsta_studija_id)
GROUP BY vs.naziv, sp.godina
ORDER BY vs.naziv, sp.godina;

-- Zadatak 2
-- Napišite upit koji će vratiti nazive svih kolegija, 
-- zajedno s nazivom studija i godinom na kojoj se izvode, a 
-- koji na toj godini i na tom studiju imaju najveći broj ECTS bodova. 
-- Rezultate poredajte po nazivu smjera, godini i nazivu kolegija (tim redoslijedom)
--  Zaglavlje tablice: Naziv kolegija, Naziv studija, Godina

SELECT k.naziv "Naziv kolegija", vs.naziv "Naziv studija", sp.godina "Godina"
FROM kolegij k INNER JOIN studijski_program sp USING (kolegij_id)
INNER JOIN vrsta_studija vs USING (vrsta_studija_id) 
WHERE (vs.naziv, sp.godina, k.ects) IN (
	SELECT vs.naziv, sp.godina, MAX(k.ects)
	FROM kolegij k INNER JOIN studijski_program sp USING (kolegij_id)
	INNER JOIN vrsta_studija vs USING (vrsta_studija_id)
	GROUP BY vs.naziv, sp.godina
)
GROUP BY vs.naziv, sp.godina, k.naziv
ORDER BY vs.naziv, sp.godina, k.naziv;

SELECT k.naziv "Naziv kolegija", vs.naziv "Naziv studija", sp.godina "Godina"
FROM vrsta_studija vs
INNER JOIN studijski_program sp
ON vs.vrsta_studija_id=sp.vrsta_studija_id
INNER JOIN kolegij k
ON k.kolegij_id = sp.kolegij_id
WHERE k.ECTS =
    ( SELECT max_ECTS
      FROM 
        (SELECT MAX(k1.ECTS) max_ECTS, godina, vrsta_studija_id 
        FROM kolegij k1
        INNER JOIN studijski_program sp1
        ON k1.kolegij_id=sp1.kolegij_id
        GROUP BY sp1.godina, sp1.vrsta_studija_id) pod
     WHERE pod.godina=sp.godina 
        AND pod.vrsta_studija_id = sp.vrsta_studija_id)
ORDER BY vs.naziv, sp.godina, k.naziv;

-- Zadatak 3
-- Napišite upit koji će vratiti nazive kolegija koji se 
-- izvode na preddiplomskom studiju Matematika i računarstvo u
-- akademskoj godini 2019/2020, a ne izvode se na preddiplomskom studiju
--  Matematika. Rezultate poredajte po nazivu kolegija. 
-- Zaglavlje tablice: Naziv kolegija
SELECT * FROM izvedbeni_plan;
SELECT * FROM vrsta_studija;

SELECT DISTINCT k.naziv
FROM kolegij k INNER JOIN studijski_program sp USING (kolegij_id)
INNER JOIN vrsta_studija vs USING (vrsta_studija_id)
INNER JOIN izvedbeni_plan ip USING (st_prog_id)
WHERE ip.akademska_godina = '2019/2020'
AND vs.naziv = 'Preddiplomski studij Matematika i računarstvo'
EXCEPT
SELECT DISTINCT k.naziv
FROM kolegij k INNER JOIN studijski_program sp USING (kolegij_id)
INNER JOIN vrsta_studija vs USING (vrsta_studija_id)
INNER JOIN izvedbeni_plan ip USING (st_prog_id)
WHERE ip.akademska_godina = '2019/2020'
AND vs.naziv = 'Preddiplomski studij Matematika';

SELECT k.naziv
FROM kolegij k
WHERE k.naziv IN (
	SELECT DISTINCT k.naziv
	FROM kolegij k INNER JOIN studijski_program sp USING (kolegij_id)
	INNER JOIN vrsta_studija vs USING (vrsta_studija_id)
	INNER JOIN izvedbeni_plan ip USING (st_prog_id)
	WHERE ip.akademska_godina = '2019/2020'
	AND vs.naziv = 'Preddiplomski studij Matematika i računarstvo'
)
AND k.naziv NOT IN (
	SELECT DISTINCT k.naziv
	FROM kolegij k INNER JOIN studijski_program sp USING (kolegij_id)
	INNER JOIN vrsta_studija vs USING (vrsta_studija_id)
	INNER JOIN izvedbeni_plan ip USING (st_prog_id)
	WHERE ip.akademska_godina = '2019/2020'
	AND vs.naziv = 'Preddiplomski studij Matematika'
)

-- Zadatak 4
-- Napišite upit koji će vratiti naziv proizvoda(product name), cijenu(list price), 
-- i prosječne cijene proizvoda temeljene na njihovim kategorijama.
SELECT product_name, list_price, ROUND(
	(SELECT AVG(list_price)
	FROM products p1
	WHERE p1.category_id = p2.category_id),
2) avg_list_price
FROM products p2
ORDER BY product_name;

-- Zadatak 5
-- Napišite upit koji će vratiti sve mušterije (customers) koji nisu napravili narudžbu u 2017. godini.
SELECT DISTINCT c.name
FROM customers c
WHERE c.name NOT IN (
SELECT DISTINCT c.name
FROM customers c INNER JOIN orders USING (customer_id)
WHERE EXTRACT (year FROM order_date) = 2017
);

-- Zadatak 6
-- Napišite upit koji vraća sve mušterije (customers) koji nemaju niti jednu narudžbu (order).
SELECT c.name
FROM customers c LEFT JOIN orders o USING (customer_id)
where order_id IS NULL
ORDER BY name;

SELECT customer_id, name
FROM CUSTOMERS 
WHERE CUSTOMER_ID NOT IN (
	SELECT CUSTOMER_ID
	FROM ORDERS
)
ORDER BY name;

---------------------------------------------------------------
-- Skupovne operacije
---------------------------------------------------------------

-- Zadatak 7
-- Napišite upit koji će napraviti listu kontakata iz tablica zaposlenici (employees) i kontakti (contacts).
-- Potrebno je napisati ime, prezime, email i radi li se o kontaktu ili zaposleniku.
SELECT first_name, last_name, email, 'zaposlenik' tip
FROM employees
UNION
SELECT first_name, last_name, email, 'kontakt' tip
FROM contacts;

-- Zadatak 8
-- Napišite upit koji će vratiti prezimena svih zaposlenika i kontakata.
SELECT last_name
FROM employees
UNION
SELECT last_name
FROM contacts
ORDER BY last_name;

-- Zadatak 9
-- Napišite upit koji će vratiti samo ona prezimena koja se pojavljuju 
-- i u tablici kontakti i u tablici zaposlenici. 
SELECT last_name
FROM employees
INTERSECT
SELECT last_name
FROM contacts
ORDER BY last_name;

-- Zadatak 10
-- Napišite upit koji će vratiti id proizvoda (product\_id), naziv proizvoda (product\_name),
-- prodajnu cijenu (list\_price) za sve proizvode koji se ne nalaze u tablici inventara (inventories).
SELECT product_id, product_name, list_price
FROM products
WHERE product_id IN (
	SELECT product_id
	FROM products
	EXCEPT
	SELECT DISTINCT product_id
	FROM inventories
);