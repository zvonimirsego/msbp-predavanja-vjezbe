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
INSERT INTO PALETA1 (boja_id, boja) VALUES
	(1, 'crvena'),
  	(2, 'zelena'),
  	(3, 'plava'),
  	(4, 'ljubičasta');
INSERT INTO PALETA2 (boja_id, boja) VALUES
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
SELECT p1.boja_id, p1.boja, p2.boja_id, p2.boja
FROM paleta1 p1 INNER JOIN paleta2 p2
USING (boja);

-- b
-- left (outer) join
SELECT p1.boja_id, p1.boja, p2.boja_id, p2.boja
FROM paleta1 p1 LEFT OUTER JOIN paleta2 p2
USING (boja);

-- c
-- left (outer) join u kojemu  ́ce biti iskljuceni retci koji se nalaze u desnoj tablici
SELECT p1.boja_id, p1.boja, p2.boja_id, p2.boja
FROM paleta1 p1 LEFT OUTER JOIN paleta2 p2
USING (boja)
WHERE p2.boja_id IS NULL;

-- d
-- right (outer) join
SELECT p1.boja_id, p1.boja, p2.boja_id, p2.boja
FROM paleta1 p1 RIGHT OUTER JOIN paleta2 p2
USING (boja);

-- e
-- right (outer) join u kojemu  ́ce biti iskljuceni retci koji se nalaze u lijevoj tablici
SELECT p1.boja_id, p1.boja, p2.boja_id, p2.boja
FROM paleta1 p1 RIGHT OUTER JOIN paleta2 p2
USING (boja)
WHERE p1.boja_id IS NULL;


-- f
-- full (outer) join
SELECT p1.boja_id, p1.boja, p2.boja_id, p2.boja
FROM paleta1 p1 FULL OUTER JOIN paleta2 p2
USING (boja);

-- g
-- full (outer) join koji  ́ce sadrzavati samo retke koji se nalaze ili u jednoj ili u drugoj tablici
SELECT p1.boja_id, p1.boja, p2.boja_id, p2.boja
FROM paleta1 p1 FULL OUTER JOIN paleta2 p2
USING (boja)
WHERE p1.boja_id IS NULL OR p2.boja_id IS NULL;