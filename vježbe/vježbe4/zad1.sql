-- Zadatak 1
-- A
-- Sve proizvode za koje je model veći od 2002.
SELECT * FROM proizvod WHERE model_id > 2002;


-- B
-- Prva 3 retka u tablici PROIZVOD
SELECT * FROM proizvod LIMIT 3;


-- C
-- Svi proizvodi za koje broj modela nije u listi vrijednosti (1008, 2003, 3002)
SELECT * FROM proizvod WHERE model_id NOT IN (1008, 2003, 3002);


-- D
-- Svi proizvodi čiji je broj modela veći od 2005 i kojima je tip oblika '_r%'
SELECT * FROM proizvod WHERE model_id > 2005 AND tip LIKE '_r%';


-- E
-- Proizvođači svih printera
SELECT DISTINCT proizvodjac FROM proizvod WHERE tip = 'printer';

-- F
-- Brojevi modela i veličine tvrdih diskova osobnih računala čija brzina
-- procesora iznosi 3.2 GHz i jeftiniji su od 2000 $.
SELECT model_id, hd
FROM pc
WHERE brzina = 3.2 AND cijena < 2000;


-- G
-- Ispis svih PC-jeva s brzinom između 2.0 i 3.5 GHz  te minimalno 1024 GB RAM-a. 
SELECT *
FROM pc
WHERE (brzina BETWEEN 2.0 AND 3.5) AND (ram >= 1024);