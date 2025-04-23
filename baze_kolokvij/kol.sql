-- a) Ispišite detalje o pjesmama (track) kojima je cijena (unit_price) veća od 0.55.

SELECT *
FROM track
WHERE unit_price > 0.55;

-- b)  Ispišite ime (first_name) i datum rođenja (birth_date) svih kupaca (customer) koji su se
-- rođeni prije 1980. godine ili poslije 1999. godine.
SELECT * FROM customer;

SELECT first_name, last_name
FROM customer
WHERE EXTRACT(YEAR FROM birth_date) < '1980' OR 
EXTRACT(YEAR FROM birth_date) > '1999';

-- c) Ispišite sve detalje o kupcima kojima ime (first_name) počinje slovom J ili prezime
-- (last_name) počinje slovom K  i završava slovom A te koji nisu izvršili nijednu kupnju.
SELECT customer_id, first_name, last_name, birth_date, customer.city
FROM customer LEFT JOIN invoice USING (customer_id)
WHERE (first_name LIKE 'J%' OR last_name LIKE 'K%a')
AND (invoice_id IS NULL);

-- d)  Ispišite ime (first_name) i prezime (last_name) svih kupaca čiji je račun izdan u Splitu,
-- Sisku ili Zadru. Spojite ime i prezime u jedan stupac s nazivom ‘Kupac’.
SELECT * FROM invoice;

SELECT DISTINCT c.first_name || ' ' || c.last_name as "Kupac"
FROM customer c INNER JOIN invoice i USING(customer_id)
WHERE i.city in ('Split', 'Sisak', 'Zadar');

-- e)  Ispišite naziv albuma (title) te ime pjesme (name) i cijenu (unit_price)  za sve pjesme koje
-- nisu dosad kupljene. Rezultate posložite po nazivu albuma pa po imenu pjesme. Isti redovi se
-- ne smiju ponavljati.
SELECT a.title, t.name, t.unit_price
FROM album a INNER JOIN track t USING (album_id)
WHERE t.track_id NOT IN (
	SELECT DISTINCT track_id
	FROM invoice_line
)
ORDER BY a.title, t.name;

-- f)  Prebrojite koliko je različitih žanrova za koje postoji barem jedna prodana pjesma u bazi.
SELECT * FROM invoice_line;

SELECT COUNT(DISTINCT genre_id)
FROM genre INNER JOIN track USING (genre_id)
WHERE track_id IN (
	SELECT DISTINCT track_id
	FROM invoice_line
);

-- g) Ispišite koliko se ukupno pjesama prodalo u svakom mjesecu prošle godine. Rezultate
-- posložite po mjesecu uzlazno. Ne ispisujete mjesece u kojima se prodalo 0 pjesama.
SELECT EXTRACT(MONTH FROM invoice_date), COUNT(*) 
FROM invoice
WHERE EXTRACT(YEAR FROM invoice_date) = 2023
GROUP BY EXTRACT(MONTH FROM invoice_date)
ORDER BY EXTRACT(MONTH FROM invoice_date);

-- SELECT EXTRACT (YEAR FROM CURRENT_DATE) - 1;

-- h) Ispišite id žanra (genre_id), id pjesama (track_id) i broj prodanih primjeraka za sve pjesme
-- koje su prodane u više od 2 primjerka.

SELECT genre_id, track_id, SUM(quantity)
FROM invoice_line INNER JOIN track USING(track_id)
GROUP BY genre_id, track_id
HAVING SUM(quantity) > 2;

-- i) Napišite naziv(e) albuma (title) čije pjesme imaju najmanju prosječnu cijenu
SELECT album.title
FROM album INNER JOIN track USING (album_id)
GROUP BY album.title
HAVING AVG(unit_price) = (
	SELECT MIN(avr)
	FROM (
		SELECT album_id, AVG(unit_price) avr
		FROM track
		GROUP BY album_id
	)
);
