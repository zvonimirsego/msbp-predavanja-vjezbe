--SELECT p.naziv, sum(k.kolicina)
--FROM proizvod p INNER JOIN kupovina k USING (proizvod_id)
--HAVING sum(k.kolicina) = (
--	SELECT proizvod_id, sum(kolicina)
--	FROM kupovina
--	GROUP BY proizvod_id
--)
--GROUP BY p.naziv;

--SELECT naziv, br as kolicina
--FROM proizvod
--INNER JOIN (
--SELECT proizvod_id, sum(kolicina) br
--FROM kupovina
--GROUP by proizvod_id
--HAVING sum(kolicina) = (
--select max(br)
--	)
--)

SELECT proizvod_id, sum(kolicina)
FROM kupovina
GROUP BY proizvod_id;

CREATE TABLE status_narudzbe(
	status_narudzbe_id INTEGER CONSTRAINT status_narudzbe_pk PRIMARY KEY,
	status VARCHAR(20) DEFAULT 'kreirana' NOT NULL,
	zadnja_izmjena_u DATE DEFAULT CURRENT_DATE
);
COMMIT;

SELECT * FROM status_narudzbe;

INSERT INTO status_narudzbe(status_narudzbe_id) VALUES
(3);

INSERT INTO status_narudzbe VALUES
(4, 'poslana', '8.4.2025.');

UPDATE status_narudzbe
SET status = DEFAULT
WHERE status_narudzbe_id = 4;

CREATE TEMPORARY TABLE status_narudzbe_temp(
	id INTEGER,
	status varchar(10),
	zadnja_izmjena_u DATE DEFAULT CURRENT_DATE
)
ON COMMIT PRESERVE ROWS;
COMMIT;

SELECT * FROM status_narudzbe_temp; -- nalazi se samo u ovoj sesiji, ako se otvori nova sesija nece postojati

DROP TABLE IF EXISTS prosjecne_cijene;

CREATE TEMPORARY TABLE prosjecne_cijene
ON COMMIT DROP
AS
SELECT vp.naziv, round(avg(p.cijena), 2)
FROM vrsta_proizvoda vp INNER JOIN proizvod p USING (vrsta_proizvoda_id)
GROUP BY vp.vrsta_proizvoda_id;

SELECT * FROM prosjecne_cijene;
COMMIT;

INSERT INTO prosjecne_cijene
VALUES ('proba', 2.13);

SELECT * FROM information_schema.tables
WHERE table_schema = 'public';

SELECT * FROM pg_tables
WHERE schemaname LIKE 'pg_temp%';

ALTER TABLE kupac
RENAME to kupac2;
COMMIT;
ROLLBACK;

ALTER TABLE kupac2
RENAME to kupac;
COMMIT;

SELECT * FROM status_narudzbe;

ALTER TABLE status_narudzbe
ADD COLUMN placeno BOOLEAN DEFAULT false;

ALTER TABLE status_narudzbe
ADD COLUMN izmjenio INTEGER,
ADD COLUMN inicijalno_kreirao DATE DEFAULT CURRENT_DATE NOT NULL;

ALTER TABLE status_narudzbe
DROP COLUMN izmjenio,
DROP COLUMN inicijalno_kreirao;

ALTER TABLE status_narudzbe
ALTER COLUMN status TYPE VARCHAR(50);

--zadatci
ALTER TABLE kupovina
ADD CONSTRAINT min_kolicina CHECK (kolicina > 0);

ALTER TABLE kupac
ADD CONSTRAINT max_dat_rodj CHECK (dat_rodj <= CURRENT_DATE);

ALTER TABLE status_narudzbe
ADD CONSTRAINT status_ck CHECK (status IN ('kreirana', 'poslana', 'zavrsena'));
COMMIT;