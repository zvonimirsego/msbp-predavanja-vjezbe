SELECT ime, prezime
FROM kupac
WHERE kupac_id = (
	SELECT kupac_id
	FROM kupac
	WHERE prezime = 'Ivanov'
);

SELECT proizvod_id, naziv, cijena
FROM proizvod
WHERE cijena > (
	SELECT avg(cijena)
	FROM proizvod
);

SELECT vrsta_proizvoda_id, avg(cijena)
FROM proizvod
GROUP BY vrsta_proizvoda_id
HAVING avg(cijena) < (
	SELECT max(cijena) * 0.5
	FROM proizvod
)
ORDER BY vrsta_proizvoda_id;

SELECT naziv, cijena
FROM proizvod;

SELECT * FROM kupovina;

SELECT proizvod_id, count(proizvod_id) br_proizvoda
FROM kupovina
GROUP BY proizvod_id;

SELECT naziv, cijena, br_proizvoda
FROM proizvod INNER JOIN (SELECT proizvod_id, count(proizvod_id) br_proizvoda
				FROM kupovina
				GROUP BY proizvod_id
			) pod_k
USING (proizvod_id);
COMMIT;

SELECT naziv, cijena, coalesce(br_proizvoda, 0)
FROM proizvod FULL JOIN (SELECT proizvod_id, count(proizvod_id) br_proizvoda
				FROM kupovina
				GROUP BY proizvod_id
			) pod_k
USING (proizvod_id);

SELECT proizvod_id, naziv
FROM proizvod
WHERE proizvod_id IN (
	SELECT proizvod_id
	FROM proizvod
	WHERE naziv LIKE
)