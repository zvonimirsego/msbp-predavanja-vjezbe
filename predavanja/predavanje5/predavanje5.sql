SELECT * FROM proizvod;
SELECT * FROM vrsta_proizvoda;

SELECT * FROM proizvod
WHERE vrsta_proizvoda_id IS NULL;

SELECT p.naziv "Naziv proizvoda", vp.naziv "Vrsta proizvoda"
FROM proizvod p, vrsta_proizvoda vp
WHERE p.vrsta_proizvoda_id = vp.vrsta_proizvoda_id;

SELECT p.naziv "Naziv proizvoda", vp.naziv "Vrsta proizvoda"
FROM proizvod p INNER JOIN vrsta_proizvoda vp
USING (vrsta_proizvoda_id);
COMMIT;

SELECT p.naziv "Naziv proizvoda", vp.naziv "Vrsta proizvoda"
FROM proizvod p LEFT OUTER JOIN vrsta_proizvoda vp
USING (vrsta_proizvoda_id);

INSERT INTO vrsta_proizvoda (naziv)
VALUES ('ostalo');

SELECT p.naziv "Naziv proizvoda", vp.naziv "Vrsta proizvoda"
FROM proizvod p RIGHT OUTER JOIN vrsta_proizvoda vp
USING (vrsta_proizvoda_id);
COMMIT;

SELECT p.naziv "Naziv proizvoda", vp.naziv "Vrsta proizvoda"
FROM proizvod p FULL OUTER JOIN vrsta_proizvoda vp
USING (vrsta_proizvoda_id);

-- JOIN bez INNER se podrazumjeva da je INNER
-- ako ostavimo OUTER, podrazumjeva se da je OUTER

SELECT * FROM zaposlenik;

SELECT z.ime || ' ' || z.prezime AS "Ime i prezime zaposlenika", m.ime || ' ' || m.prezime AS "Manager"
FROM zaposlenik z INNER JOIN zaposlenik m
ON (z.manager_id = m.zaposlenik_id);

SELECT z.ime || ' ' || z.prezime AS "Ime i prezime zaposlenika", m.ime || ' ' || m.prezime AS "Manager"
FROM zaposlenik z LEFT JOIN zaposlenik m
ON (z.manager_id = m.zaposlenik_id);

SELECT z.ime || ' ' || z.prezime AS "Ime i prezime zaposlenika", m.ime || ' ' || m.prezime AS "Manager"
FROM zaposlenik z RIGHT JOIN zaposlenik m
ON (z.manager_id = m.zaposlenik_id);

--CROSS JOIN je kartezijev produkt

SELECT * FROM kupac;

SELECT ime, prezime, dat_rodj, extract(year from dat_rodj) "Godina rođenja"
FROM kupac
WHERE extract(year from dat_rodj)::text ~ '197[5-8]';

SELECT ime, prezime, dat_rodj
FROM kupac
WHERE ime::text ~ '^Iv';

SELECT ime, prezime, dat_rodj
FROM kupac
WHERE ime::text ~* '^Iv';

SELECT ime, prezime, dat_rodj
FROM kupac
WHERE ime::text ~ 'na$';

SELECT ime, prezime, dat_rodj
FROM kupac
WHERE ime::text ~* 'na$';
COMMIT;

SELECT * FROM kupac;