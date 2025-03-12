CREATE TABLE vrsta_studija(
	vrsta_studija_id SERIAL CONSTRAINT vrsta_studija_pk PRIMARY KEY,
	naziv VARCHAR(20) NOT NULL,
	trajanje INTEGER NOT NULL
);

CREATE TABLE djelatnik(
	djelatnik_id SERIAL CONSTRAINT djelatnik_pk PRIMARY KEY,
	ime VARCHAR(20) NOT NULL,
	prezime VARCHAR(20) NOT NULL,
	spol CHAR(1) NOT NULL
);

CREATE TABLE kolegij(
	kolegij_id CHAR(4) CONSTRAINT kolegij_pk PRIMARY KEY,
	naziv VARCHAR(50) NOT NULL,
	p INTEGER NOT NULL,
	s INTEGER NOT NULL,
	v INTEGER NOT NULL,
	ects INTEGER NOT NULL
);
COMMIT;

CREATE TABLE studijski_program(
	st_prog_id SERIAL CONSTRAINT st_prog_pk PRIMARY KEY,
	godina INTEGER NOT NULL,
	obvezni BOOLEAN NOT NULL,
	vrsta_studija_id INTEGER CONSTRAINT st_prog_fk_vrsta_st REFERENCES vrsta_studija(vrsta_studija_id) NOT NULL,
	kolegij_id CHAR(4) CONSTRAINT st_prog_fk_kolegij REFERENCES kolegij(kolegij_id) NOT NULL
);

CREATE TABLE izvedbeni_plan(
	izvedbeni_id SERIAL CONSTRAINT izvedbeni_pk PRIMARY KEY,
	semestar CHAR(6) NOT NULL,
	broj_grupa INTEGER,
	akad_god VARCHAR(15) NOT NULL,
	st_prog_id INTEGER CONSTRAINT iz_plan_fk_st_prog REFERENCES studijski_program(st_prog_id)
);

CREATE TABLE djelatnik_izvedbeni(
	izvedbeni_id INTEGER CONSTRAINT d_i_fk_iz_plan REFERENCES izvedbeni_plan(izvedbeni_id),
	djelatnik_id INTEGER CONSTRAINT d_i_fk_djelatnik REFERENCES djelatnik(djelatnik_id),
	uloga VARCHAR(20) NOT NULL,
	CONSTRAINT d_i_pk PRIMARY KEY (izvedbeni_id, djelatnik_id, uloga)
);
COMMIT;

INSERT INTO vrsta_studija (naziv, trajanje)
VALUES
('pd matematika i racunarstvo', 3),
('pd matematika', 3),
('d matematika i racunarstvo', 2),
('d financijska matematika', 2),
('d nastavnicki mat i inf', 2);
SELECT * FROM vrsta_studija;

INSERT INTO djelatnik (ime, prezime, spol)
VALUES
('Luka', 'Borozan', 'M'),
('Dragana', 'Jankov Masirevic', 'F'),
('Ivan', 'Soldo', 'M'),
('Ivan', 'Matic', 'M'),
('Jelena', 'Jankov Pavlovic', 'F'),
('Snjezana', 'Majstorovic Ergotic', 'F');
SELECT * FROM djelatnik;

INSERT INTO kolegij (kolegij_id, naziv, p, v, s, ects)
VALUES
('M084', 'Diferencijalni racun', 4, 3, 0, 8),
('I044', 'Funkcijsko programiranje', 2, 2, 0, 6),
('M102', 'Kombinatorna i diskretna matematika', 2, 2, 0, 6);
SELECT * FROM kolegij;

SELECT * FROM vrsta_studija;

INSERT INTO studijski_program (godina, obvezni, vrsta_studija_id, kolegij_id)
VALUES
(1, TRUE, 1, 'M084'),
(1, TRUE, 2, 'M084'),
(1, TRUE, 1, 'I044'),
(1, TRUE, 2, 'M102');
SELECT * FROM studijski_program;

INSERT INTO izvedbeni_plan (semestar, broj_grupa, akad_god, st_prog_id)
VALUES
('zimski', 2, '2024./2025.', 1),
('zimski', 2, '2024./2025.', 2),
('zimski', 2, '2024./2025.', 3),
('ljetni', 1, '2024./2025.', 4);
SELECT * FROM izvedbeni_plan;

SELECT * FROM djelatnik;
SELECT * FROM izvedbeni_plan;

INSERT INTO djelatnik_izvedbeni (djelatnik_id, izvedbeni_id, uloga)
VALUES
(1, 3, 'predavac'),
(4, 2, 'predavac'),
(4, 1, 'predavac'),
(5, 2, 'asistent'),
(5, 1, 'asistent'),
(6, 4, 'predavac');
SELECT * FROM djelatnik_izvedbeni;
COMMIT;

UPDATE kolegij
SET ects = 9
WHERE kolegij_id = 'M084';

INSERT INTO kolegij (kolegij_id, naziv, p, v, s, ects)
VALUES
('M106', 'Teorija brojeva', 1, 1, 0, 3);
SELECT * FROM kolegij;

DELETE FROM kolegij
WHERE kolegij_id = 'M106';

SELECT * FROM kolegij;
COMMIT;