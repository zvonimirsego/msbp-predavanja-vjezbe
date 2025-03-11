CREATE TABLE kupac(
	kupac_id SERIAL CONSTRAINT kupac_pk PRIMARY KEY,
	ime VARCHAR(10) NOT NULL,
	prezime VARCHAR(10) NOT NULL,
	dat_rodj DATE,
	tel VARCHAR(12)
);
COMMIT;
SELECT * FROM kupac;
 
CREATE TABLE vrsta_proizvoda(
	vrsta_proizvoda_id SERIAL CONSTRAINT vrsta_proizvoda_pk PRIMARY KEY,
	naziv VARCHAR(20) NOT NULL
);
SELECT * FROM vrsta_proizvoda;
 
CREATE TABLE proizvod(
	proizvod_id SERIAL CONSTRAINT proizvod_pk PRIMARY KEY,
	vrsta_proizvoda_id INTEGER CONSTRAINT proizvod_fk_vrsta_proizvoda
		REFERENCES vrsta_proizvoda(vrsta_proizvoda_id),
	naziv VARCHAR(30) NOT NULL,
	opis VARCHAR(50),
	cijena NUMERIC(5, 2)
);
SELECT * FROM proizvod;
COMMIT;
 
CREATE TABLE kupovina(
	proizvod_id INTEGER CONSTRAINT kupovina_fk_proizvod REFERENCES proizvod(proizvod_id),
	kupac_id INTEGER CONSTRAINT kupovina_fk_kupac REFERENCES kupac(kupac_id),
	kolicina INTEGER NOT NULL,
	CONSTRAINT kupovina_pk PRIMARY KEY (proizvod_id, kupac_id)
);
SELECT * FROM kupovina;
COMMIT;
 
CREATE TABLE zaposlenik(
	zaposlenik_id SERIAL CONSTRAINT zaposlenik_pk PRIMARY KEY,
	manager_id INTEGER CONSTRAINT zaposlenik_fk_zaposlenik REFERENCES zaposlenik(zaposlenik_id),
	ime VARCHAR(10) NOT NULL,
	prezime VARCHAR(10) NOT NULL,
	titula VARCHAR(20),
	placa NUMERIC(6,2)
);
COMMIT;
 
CREATE TABLE visina_place(
	visina_place_id SERIAL CONSTRAINT visina_place_pk PRIMARY KEY,
	niska_placa NUMERIC(6,2),
	visoka_placa NUMERIC(6,2)
);
COMMIT;
 
SELECT * FROM information_schema.tables
	WHERE table_schema='public';
COMMIT;
SELECT * FROM information_schema.columns;
COMMIT;
 
INSERT INTO kupac (ime, prezime, dat_rodj, tel)
VALUES
('Ivan', 'Ivanov', '18.07.1974.', '1234-5678'),
('Zvonimir', 'Sego', '11.06.2004.', '74832');
SELECT * FROM kupac;
 
INSERT INTO kupac (ime, prezime, dat_rodj, tel)
VALUES
('Marko', 'Kovacic', '17.01.2005.', '3271239'),
('Tin', 'Ficok', '13.04.2004.', '447238');
SELECT * FROM kupac;
COMMIT;
 
UPDATE kupac SET prezime = 'Sakcinski' where kupac_id = 3;
UPDATE kupac SET kupac_id = 100 where kupac_id = 4;
SELECT * FROM kupac;
 
DELETE FROM kupac where kupac_id = 3;
SELECT * FROM kupac;
COMMIT;
 
drop table visina_place;