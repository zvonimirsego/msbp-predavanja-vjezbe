-- Zadatak 5
-- A
-- Ispišite model i cijenu svih laserskih printera kojima je proizvodač jednak E
SELECT pr.model_id, pr.cijena
FROM printer pr INNER JOIN proizvod po USING (model_id)
WHERE po.proizvodjac = 'E'
AND pr.tip = 'laser';

-- B
-- Ispišite model, brzinu procesora, veličinu tvrdog diska i cijenu za sva stolna računala kojima je proizvodač jednak B.
SELECT pc.model_id, pc.brzina, pc.hd, pc.cijena
FROM pc INNER JOIN proizvod po USING (model_id)
WHERE po.proizvodjac = 'B';

-- C
-- Ispišite model, proizvodača, veličinu zaslona i cijenu za sve prijenosnike koji imaju zaslon veći od 16 incha. Rezultate posložite po proizvodaču, pa po cijeni
SELECT * FROM prijenosnik;
SELECT pn.model_id, po.proizvodjac, pn.zaslon, pn.cijena
FROM prijenosnik pn INNER JOIN proizvod po USING (model_id)
WHERE zaslon > 16
ORDER BY po.proizvodjac, pn.cijena;
COMMIT;