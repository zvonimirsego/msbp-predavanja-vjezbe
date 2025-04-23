CREATE VIEW jeftinjara
AS
SELECT * 
FROM proizvod
WHERE cijena < 2.5;

SELECT * FROM jeftinjara;

SELECT naziv, cijena FROM jeftinjara;

DROP VIEW jeftinjara;

ROLLBACK;

SELECT j.naziv, vp.naziv, cijena
FROM jeftinjara j INNER JOIN vrsta_proizvoda vp USING (vrsta_proizvoda_id);
COMMIT;

INSERT INTO jeftinjara(vrsta_proizvoda_id, naziv, cijena)
VALUES
(2, 'Kupine', 1.25);

SELECT * FROM jeftinjara;
SELECT * FROM proizvod;

INSERT INTO jeftinjara(vrsta_proizvoda_id, naziv, cijena)
VALUES
(4, 'Cedevita', 6.49);

SELECT * FROM jeftinjara;
SELECT * FROM proizvod;

CREATE VIEW jeftinjara_2 AS
SELECT naziv, cijena
FROM jeftinjara
WHERE cijena > 0.5
WITH CASCADED CHECK OPTION;

INSERT INTO jeftinjara_2
VALUES
('šampon', 4.2);

DROP VIEW jeftinjara_2;


CREATE VIEW pogled AS
SELECT p.proizvod_id "Id proizvoda", p.naziv "Naziv proizvoda", vp.naziv "Vrsta proizvoda", p.cijena "Cijena"
FROM proizvod p FULL JOIN vrsta_proizvoda vp USING (vrsta_proizvoda_id);

SELECT * FROM pogled;

--CREATE OR REPLACE VIEW
COMMIT;