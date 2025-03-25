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

SELECT round(avg(cijena), 2)
FROM proizvod;

SELECT avg(cijena) + 2, avg(distinct cijena)
FROM proizvod;

SELECT count(proizvod_id)
FROM proizvod;

SELECT count(distinct vrsta_proizvoda_id)
FROM proizvod;

SELECT max(naziv)
FROM proizvod;

SELECT max(dat_rodj)
FROM kupac;

SELECT stddev(cijena)
FROM proizvod;

SELECT round(avg(cijena), 2)
FROM proizvod
WHERE vrsta_proizvoda_id = 2;

SELECT round(avg(p.cijena), 2)
FROM proizvod p JOIN vrsta_proizvoda vp
USING (vrsta_proizvoda_id)
WHERE vp.naziv = 'voće';
COMMIT;

SELECT proizvod.vrsta_proizvoda_id, avg(cijena), count(*)
FROM proizvod INNER JOIN vrsta_proizvoda
USING (vrsta_proizvoda_id)
GROUP by vrsta_proizvoda_id;

SELECT vp.naziv, avg(p.cijena)
FROM proizvod p INNER JOIN vrsta_proizvoda vp
USING (vrsta_proizvoda_id)
WHERE p.cijena < 1.5
GROUP BY vp.naziv;

SELECT vp.naziv, avg(p.cijena)
FROM proizvod p INNER JOIN vrsta_proizvoda vp
USING (vrsta_proizvoda_id)
WHERE p.cijena < 3
GROUP BY vp.naziv
HAVING avg(p.cijena) > 1.3
ORDER BY avg(p.cijena);

SELECT kupac_id
FROM kupac
WHERE kupac_id = (
select kupac_id from kupac where prezime = 'Ivanov'
);

SELECT proizvod_id, naziv, cijena
FROM proizvod
WHERE cijena > (SELECT avg(cijena)
FROM proizvod);

SELECT avg(cijena)
FROM proizvod
WHERE