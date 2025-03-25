drop table if exists visina_place;
drop table if exists zaposlenik;
drop table if exists kupovina;
drop table if exists proizvod;
drop table if exists vrsta_proizvoda;
drop table if exists kupac;

CREATE TABLE kupac(
    kupac_id SERIAL CONSTRAINT kupac_pk PRIMARY KEY,
    ime VARCHAR(10) NOT NULL,
    prezime VARCHAR(10) NOT NULL,
    dat_rodj DATE,
    tel VARCHAR(12)
);

CREATE TABLE vrsta_proizvoda(
    vrsta_proizvoda_id SERIAL CONSTRAINT vrsta_proizvoda_pk PRIMARY KEY,
    naziv VARCHAR(10) NOT NULL
);

CREATE TABLE proizvod(
    proizvod_id SERIAL CONSTRAINT proizvod_pk PRIMARY KEY,
    vrsta_proizvoda_id INTEGER CONSTRAINT proizvod_fk_vrsta_proizvoda
        REFERENCES vrsta_proizvoda(vrsta_proizvoda_id),
    naziv VARCHAR(30) NOT NULL,
    opis VARCHAR(50),
    cijena NUMERIC(5,2)
);

CREATE TABLE kupovina(
    proizvod_id INTEGER CONSTRAINT kupovina_fk_proizvod
        REFERENCES proizvod(proizvod_id),
    kupac_id INTEGER CONSTRAINT kupovina_fk_kupac
        REFERENCES kupac(kupac_id),
    kolicina INTEGER NOT NULL,
    CONSTRAINT kupovina_pk PRIMARY KEY (proizvod_id, kupac_id)
);

CREATE TABLE zaposlenik(
    zaposlenik_id SERIAL CONSTRAINT zaposlenik_pk PRIMARY KEY,
    manager_id INTEGER CONSTRAINT zaposlenik_fk_manager 
        REFERENCES zaposlenik(zaposlenik_id),
    ime VARCHAR(10) NOT NULL,
    prezime VARCHAR(10) NOT NULL,
    titula VARCHAR(20),
    placa NUMERIC(6,2)
);


CREATE TABLE visina_place(
    visina_place_id SERIAL CONSTRAINT visina_place_pk PRIMARY KEY,
    niska_placa NUMERIC(6,2),
    visoka_placa NUMERIC(6,2)
);

INSERT INTO kupac (ime, prezime, dat_rodj, tel)
VALUES 
('Ivan', 'Ivanov', '18.07.1974', '5421-0231'),
('Marija', 'Gregor', '08.02.1988','2321-15645'),
('Mirko', 'Marković', '11.03.1965','0981-7861'),
('Mario', 'Vuković', '12.05.1994','9821-1345'),
('Ivana', 'Knežević', '05.12.1998','3124-4131'),
('Lana', 'Kovačić', '12.04.1964','1451-1435'),
('Sanja', 'Novak', '05.06.1973','3145-0314'),
('Iva', 'Jurić', '19.08.1974','3141-1344'),
('Ante', 'Babić', '11.03.1978','1414-4151'),
('Marko', 'Kovač', '04.04.1964','3141-1415'),
('Miro', 'Ivančić', '08.03.1978','3151-1456'),
('Anita', 'Zlomislić', '23.04.1984','9874-9813'),
('Vanja', 'Rogan', '27.03.1981','6532-0971'),
('Matija', 'Sikirica', '28.11.1974','5371-1461'),
('Ana', 'Petrović', '12.02.1975','0981-9871'),
('Petra', 'Ivkić', '03.03.1976','4156-5342'),
('Petar', 'Martić', '08.08.1988','5161-5315'),
('Marta', 'Šimić', '21.05.1958','5156-2141'),
('Anja', 'Horvat', '13.12.1996','3141-3141'),
('Ivanka', 'Marković', '1.11.1986','3289-3467');

INSERT INTO vrsta_proizvoda (naziv)
VALUES
('njega'),
('voće'),
('povrće'),
('pića'),
('meso');

INSERT INTO proizvod (vrsta_proizvoda_id, naziv, opis, cijena)
VALUES
(1,'Nivea dezodorans','',3.45),
(1,'Dove tekući sapun','',1.85),
(1,'Colgate pasta za zube','',2.19),
(2,'Banana','cijena po kg',0.99),
(2,'Naranča','cijena po kg',0.65),
(2,'Borovnica','pakiranje 125g',1.10),
(3,'Luk crveni','cijena po kg',0.37),
(3,'Mrkva','cijena po kg',0.29),
(3,'Šampinjoni','pakiranje 500g',1.44),
(4,'Coca-Cola','2x2l',2.59),
(4,'Juicy sok 100%naranča','1l',1.20),
(4,'Cedevita okus limun','1000g',5.44),
(5,'Pileći file mini','pakiranje 400g',5.24),
(5,'Svinjski file','komad',2.76),
(5,'Miješano mlijeveno meso','pakiranje 400g',3.05);

INSERT INTO proizvod (naziv, opis, cijena)
VALUES
('Dnevni list','',1.25);

INSERT INTO zaposlenik (manager_id, ime, prezime, titula, placa) 
VALUES
(1, 'Marko', 'Perić', 'predsjednik uprave', 3200),
(1, 'Ivan', 'Blažević', 'izvršni direktor', 2550),
(2, 'Vanja', 'Martić', 'voditelj odjela 1', 1300),
(2, 'Mirko', 'Petrić', 'voditelj odjela 2', 1300),
(3, 'Valentina', 'Sinkopa', 'blagajnik', 900),
(4, 'Bartol', 'Barać', 'blagajnik', 800),
(4, 'Ivona', 'Brzić', 'blagajnik', 800);

INSERT INTO kupovina (proizvod_id, kupac_id, kolicina)
VALUES
(2,2,3),
(1,2,1),
(15,20,2),
(15,2,1),
(15,3,3),
(11,11,3),
(3,4,1),
(15,19,5),
(3,13,2),
(5,17,3),
(4,2,1),
(8,7,6),
(6,7,1),
(3,12,2),
(1,4,3),
(13,12,3),
(10,10,1),
(4,14,2),
(13,14,1),
(1,9,3),
(7,11,4),
(4,3,2),
(1,17,1),
(13,17,1);

INSERT INTO visina_place (niska_placa, visoka_placa) 
VALUES 
(1, 1000),
(1001, 1500),
(1501, 2500),
(2500, 5000);

COMMIT;

--do ovdje je kopirano, ostalo smo pisali
--dodajte tocke na kraj godine

SELECT * FROM kupac;
SELECT ime, prezime FROM kupac;
SELECT * FROM kupac WHERE kupac_id = 2;

SELECT dat_rodj, dat_rodj + 2 FROM kupac WHERE kupac_id = 2;
SELECT dat_rodj, dat_rodj - 3 FROM kupac WHERE kupac_id = 5;
SELECT '18.3.2025.' - dat_rodj FROM kupac WHERE kupac_id = 4;

SELECT * FROM proizvod;
SELECT cijena, cijena + 2 AS cijena_plus_2, 3*cijena + 1 TROSTRUKA_ZA_1 FROM proizvod;
--AS nije potreban

SELECT ime || prezime FROM kupac;
SELECT ime || ' ' || prezime "Ime i prezime" FROM kupac;

SELECT kupac_id, ime, prezime, dat_rodj FROM kupac WHERE dat_rodj IS NULL;
INSERT INTO kupac (ime, prezime)
VALUES 
('Ivan', 'Gregic');
SELECT kupac_id, ime, prezime, dat_rodj FROM kupac WHERE dat_rodj IS NULL;
COMMIT;

SELECT DISTINCT kupac_id FROM kupovina;
SELECT DISTINCT proizvod_id, kupac_id FROM kupovina;

SELECT * FROM kupac WHERE kupac_id <> 2;

SELECT *
FROM kupac
WHERE ime LIKE '_a%';

SELECT *
FROM kupac
WHERE ime NOT LIKE '_a%';

UPDATE kupac
SET ime = 'Iv%na'
WHERE kupac_id = 1;

SELECT * FROM kupac
WHERE ime LIKE '%\%%';

SELECT * FROM kupac
WHERE ime LIKE '%!%%' ESCAPE '!';

SELECT * FROM kupac 
WHERE kupac_id::text LIKE '%1%';

SELECT * FROM kupac
WHERE kupac_id IN (2, 3, 5);

SELECT * FROM kupac
WHERE kupac_id NOT BETWEEN 1 and 3;

SELECT * FROM kupac
WHERE kupac_id > 3 AND dat_rodj > '1.1.1983.';

SELECT * FROM kupac
WHERE kupac_id > 3 OR dat_rodj > '1.1.1983.';

SELECT * FROM kupac
WHERE dat_rodj < '1.1.1983.'
OR kupac_id < 2
AND tel LIKE '%1222';

SELECT ime, prezime FROM kupac ORDER BY ime; -- SELECT ime, prezime FROM kupac ORDER BY ime ASC;
SELECT ime, prezime FROM kupac ORDER BY ime DESC;

SELECT ime, prezime FROM kupac ORDER BY prezime, ime DESC; --sortira uzlazno po prezimenu, po imenu silazno.

SELECT * FROM kupac ORDER BY 3, 2; --sortira po 3. i 2. stupcu

SELECT *
FROM kupac
LIMIT 5;

SELECT *
FROM kupac
OFFSET 2
LIMIT 5;

SELECT *
FROM kupac
FETCH FIRST 5 ROW ONLY;

SELECT *
FROM kupac
OFFSET 2
FETCH FIRST 5 ROW ONLY;

SELECT * FROM proizvod
WHERE proizvod_id = 3;

SELECT * FROM vrsta_proizvoda
WHERE vrsta_proizvoda_id = 1;

SELECT proizvod.naziv, vrsta_proizvoda.naziv
FROM proizvod, vrsta_proizvoda
WHERE proizvod.vrsta_proizvoda_id = vrsta_proizvoda.vrsta_proizvoda_id and proizvod_id = 3
ORDER BY proizvod.naziv;

SELECT p.naziv, vp.naziv
FROM proizvod p, vrsta_proizvoda vp
WHERE p.vrsta_proizvoda_id = vp.vrsta_proizvoda_id
ORDER BY p.naziv;

SELECT * FROM proizvod
WHERE vrsta_proizvoda_id IS NULL;

SELECT p.naziv
FROM proizvod p;

SELECT vp.naziv
FROM vrsta_proizvoda vp;

SELECT p.naziv, vp.naziv
FROM proizvod p, vrsta_proizvoda vp; --kartezijev produkt

SELECT k.ime, k.prezime, p.naziv, vp.naziv
FROM kupac k, proizvod p, vrsta_proizvoda vp, kupovina kp
WHERE k.kupac_id = kp.kupac_id
AND p.proizvod_id = kp.proizvod_id
AND p.vrsta_proizvoda_id = vp.vrsta_proizvoda_id
ORDER BY k.prezime, k.ime; --ovaj red je estetski

SELECT * FROM visina_place;
SELECT * FROM zaposlenik;

SELECT z.ime, z.prezime, z.placa, vp.niska_placa, vp.visoka_placa, vp.visina_place_id
FROM visina_place vp, zaposlenik z
WHERE z.placa BETWEEN vp.niska_placa AND vp.visoka_placa;

SELECT p.naziv, vp.naziv
FROM proizvod p INNER JOIN vrsta_proizvoda vp
ON p.vrsta_proizvoda_id = vp.vrsta_proizvoda_id
ORDER BY p.naziv;

SELECT p.naziv, vp.naziv, vrsta_proizvoda_id --tu se moze i specificarti u kojoj je tablici, dok se u oracle ne moze
FROM proizvod p INNER JOIN vrsta_proizvoda vp
USING (vrsta_proizvoda_id);

SELECT k.ime, k.prezime, p.naziv, vp.naziv
FROM kupac k INNER JOIN kupovina kp
USING (kupac_id)
INNER JOIN proizvod p
USING (proizvod_id)
INNER JOIN vrsta_proizvoda vp
USING (vrsta_proizvoda_id)
ORDER BY k.prezime, k.ime; --ovaj red je estetski