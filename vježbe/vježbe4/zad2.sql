-- Zadatak 2
-- Baza izvedbeni

-- A
-- Iz tablice \code{kolegij} ispišite nazive kolegija koji ili počinju s 'M', 
-- a završavaju s 'a' ili sadrže u sebi dva slova 'm'.
SELECT naziv 
FROM kolegij
WHERE (naziv LIKE 'M%a') OR (naziv LIKE '%m%m%');

-- B
-- Iz tablice kolegij ispišite nazive svih kolegija zajedno s ukupnom tjednom satnicom i ECTS bodovima (napomena: ukupna satnica je jednaka zbroju tjednih sati predavanja, vjezbi i seminara)
SELECT naziv, p+v+s AS "tjedna satnica", ects
FROM KOLEGIJ;

-- C
-- Iz tablice djelatnik ispišite spojeno ime i prezime svih djelatnika, stupac nazovite Ime i prezime
SELECT ime || ' ' || prezime AS "Ime i prezime"
FROM djelatnik;

-- D
--Iz tablice djelatnik ispisite imena i prezimena svih djelatnika muskog spola
SELECT ime, prezime
FROM djelatnik
WHERE spol = 'M';

-- E
-- Iz tablice kolegij ispisite nazive svih kolegija koji imaju više od 5 ECTS bodova i barem 3 sata predavanja
SELECT naziv
FROM kolegij
WHERE ects > 5 AND (p >= 3);