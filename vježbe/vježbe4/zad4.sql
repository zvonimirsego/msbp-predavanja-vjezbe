-- Zadatak 4
-- Slozeni upiti
-- A
-- Za svaki uneseni smjer ispišite njegov naziv i nazive svih obveznih kolegija i godinu na kojoj se održavaju. 
-- Rezultate poredajte po nazivu smjera pa onda po nazivu kolegija. (Napomena: naziv studijskog programa se u 
-- rezultatima pojavljuje u svakom redu)

-- Sa =
SELECT vs.naziv, k.naziv, sp.godina
FROM vrsta_studija vs, studijski_program sp, kolegij k
WHERE vs.vrsta_studija_id = sp.vrsta_studija_id
AND k.kolegij_id = sp.kolegij_id
AND sp.obvezni = 1
ORDER BY vs.naziv, k.naziv;

-- Sa inner join
SELECT vs.naziv, k.naziv, sp.godina
FROM studijski_program sp INNER JOIN kolegij k
USING (kolegij_id)
INNER JOIN vrsta_studija vs
USING (vrsta_studija_id)
WHERE sp.obvezni = 1
ORDER BY vs.naziv, k.naziv;

-- B
-- Ispišite nazive svih kolegija koje se izvode u zimskom semestru na prvoj godini preddiplomskog studija Matematike i 
-- računarstva. Rezultate poredajte po nazivu.
SELECT k.naziv
FROM studijski_program sp INNER JOIN kolegij k
USING (kolegij_id)
INNER JOIN vrsta_studija vs
USING (vrsta_studija_id)
INNER JOIN izvedbeni_plan ip
USING (st_prg_id)
WHERE sp.godina = 1
AND vs.naziv = 'Preddiplomski studij Matematika i računarstvo'
AND ip.semestar LIKE 'zimski%'
ORDER BY k.naziv;

-- C
-- Ispišite sve kolegije koji se izvode na drugoj godini preddiplomskog studija Matematike zajedno s imenom, prezimenom
-- i ulogom djelatnika koji sudjeluju u njegovom izvodenju
SELECT k.naziv, d.ime, d.prezime, di.uloga
FROM studijski_program sp INNER JOIN kolegij k USING (kolegij_id)
INNER JOIN vrsta_studija vs USING (vrsta_studija_id)
INNER JOIN izvedbeni_plan ip USING (st_prg_id)
INNER JOIN djelatnik_izvedbeni di USING (izvedbeni_id)
INNER JOIN djelatnik d USING (djelatnik_id)
WHERE sp.godina = 2
AND vs.naziv = 'Preddiplomski studij Matematika'

-- D
-- Ispišite imena i prezimena svih djelatnika koji na barem jednom kolegiju imaju ulogu nastavnika. 
-- U rezultatima se ne smije pojavljivati više puta isto ime i prezime. Rezultate poredajte po prezimenu pa po imenu
SELECT DISTINCT d.ime, d.prezime
FROM djelatnik d INNER JOIN djelatnik_izvedbeni di
USING (djelatnik_id)
WHERE di.uloga = 'nastavnik'
ORDER BY d.prezime, d.ime;

-- E 
-- Ispišite sve nazive kolegija koji se održavaju i u zimskom i u ljetnom semestru (ne u samo jednom od njih) zajedno s 
-- ukupnim ECTS bodovima koji nose. Rezultate poredajte po ukupnom broju ECTS bodova 
-- (Napomena: u tablici kolegij ECTS -- bodovi sadrže broj bodova u jednom semestru.)
SELECT k.naziv, k.ects
FROM kolegij k 
INNER JOIN studijski_program sp USING (kolegij_id)
INNER JOIN izvedbeni_plan ip USING (st_prg_id)
WHERE ip.semestar = 'zimski i ljetni'
ORDER BY k.ects;

-- F
-- Ispišite sve nazive kolegija koji imaju više od 4 ECTS-a i za koje nije definiran broj grupa. Rezultate poredajte po nazivu kolegija. 
SELECT k.naziv
FROM kolegij k 
INNER JOIN studijski_program sp USING (kolegij_id)
INNER JOIN izvedbeni_plan ip USING (st_prg_id)
WHERE k.ects > 4 AND ip.br_grupa IS NULL;





