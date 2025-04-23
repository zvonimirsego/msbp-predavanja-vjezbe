-- Zadatak 1
--a)
-- Napišite upit koji će vratiti sve autore kojima nije pridružena niti jedna knjiga u bazi. 


--b)
-- Ispišite ISSN, naziv, godinu, volumen i broj časopisa za sve primjerke časopisa koji nikad nisu pročitani.


--c)
-- Ispišite godinu i sve parove imena i prezimena članova (ime i prezime neka budu jedan stupac s nazivom 
-- "član1" i "član2") koji imaju jednaku godinu rođenja. 


--d)
-- Ispišite ime, prezime i godina rođenja svih clanova koji nisu posudili niti jednu knjigu. 
-- Rezultate poslažite po prezimenu pa po imenu. 


--e)
-- Ispišite mjesto i nazive parova izdavača koji su iz istog mjesta. 
-- Rezultate poslažite po nazivu mjesta. 



-- Zadatak 2
--a)
-- Izračunajte i ispišite prosječnu dob članova knjižnice zaokruženu na dvije decimale.


--b)
-- Ispišite ukupan broj posudbi za svakog člana iz baze (ako član nije posudio niti jednu knjigu, treba pisati 0).
-- Rezultate poredajte  po prezimenu pa po imenu člana. 


--c)
-- Za svaki časopis (ISNN i naziv) ispišite koliko se njegovih primjeraka nalazi u knjižnici. 


--d)
-- Ispišite ISBN, naslov, godinu prvog izdanja i broj puta koliko je knjiga s tim naslovom posuđena 
-- (neovisno koji njen primjerak) za svaku knjigu u bazi koja je posuđena barem 2 puta. 
-- Rezultate poredajte po nazivu knjige. 


--e)
-- Izračunajte i ispišite ukupnu zaradu od prodaje knjiga.  



-- Zadatak 3
--a)
-- Ispišite ISBN, naslov i godinu izdanja knjige koja je zadnja posuđena 
-- (ako ima više knjiga posuđenih na taj isti datum, ispišite ih sve). 


--b
-- Ispišite ime, prezime i godinu rođenja za sve članove koji su posudili 
-- više knjiga od prosjeka posuđivanja po članu. 


--c)
-- Ispišite ISBN i naziv onih knjiga koje su jeftinije od prosječne cijene 
-- knjiga za prodaju iz baze, a nisu još prodane. 



--d
-- Ispišite sve izdavače knjiga koji pripadaju odjelu s 
-- kojeg je sveukupno napravljeno najmanje posudbi.  


--e
-- Ispišite ISNN, naziv te ID primjerka časopisa koji je najčešće čitan 
-- (ako ih ima više koji su čitani jednako puta, ispišite ih sve). 


--f
-- Ispišite minimalan i maksimalan broj čitanja časopisa, podijeljeno po odjelu. 



--------------------------------------------------------------------------------------------
-- DDL i DML
--------------------------------------------------------------------------------------------
-- Zadatak1
-- a)
-- predavanja umanjiti za 50%, vjezbe uvecati za 50% proizvoljnom kolegiju
UPDATE

-- ispis promijenjenih podataka
SELECT *
FROM kolegij;

-- b)
-- Dodajte CHECK uvjete za semestar (’zimski’,’ljetni’,’zimski i ljetni’) i
-- i ulogu djelatnika (’nastavnik’,’asistent’)

-- mozemo napraviti unos kolegija (da na njega mozemo dodati semestar i nastavnika)
select max(st_prog_id) from STUDIJSKI_PROGRAM;
INSERT INTO kolegij VALUES ('I111', 'Heuristički algoritmi', 4,2,2,1);
INSERT INTO studijski_program VALUES(79,1,'I111',2,0); 


-- dodajmo check uvjet na semestar
SELECT * FROM izvedbeni_plan;

ALTER TABLE izvedbeni_plan
ADD CONSTRAINT semestar_ck CHECK (semestar in ('zimski', 'ljetni', 'zimski i ljetni'));
commit;


-- provjera check uvjeta
INSERT INTO izvedbeni_plan VALUES (79, 79, 'zimski', 1, '2019/2020');
INSERT INTO izvedbeni_plan VALUES (79, 79, 'zimski2', 1, '2019/2020'); -- ne dopušta unos

-- dodajmo check uvjet na ulogu


-- provjera check uvjeta
INSERT INTO djelatnik_izvedbeni VALUES (79, 400, 'nastavnik'); 
INSERT INTO djelatnik_izvedbeni VALUES (79, 400, 'nastavnik2'); -- ne dopušta unos 
COMMIT;
ROLLBACK;

SELECT * FROM DJELATNIK_IZVEDBENI WHERE IZVEDBENI_ID = 79; --nece vratiti nista zbog rollbacka

-- c)
-- U tablicu kolegij dodajte stupac ukupna satnica, a koji će sadržavati zbroj stupaca
-- P, V i S. Ispišite vrijednosti spremljene u tablicu kolegij kako bi ste provjerili je li stupac uspješno dodan.
-- Na kraju dodani stupac obrišite. Na kraju dodani stupac obrišite.
ALTER TABLE kolegij
ADD COLUMN ukupna_satnica INTEGER GENERATED ALWAYS AS (P+V+S) STORED;

SELECT * FROM kolegij;
COMMIT;

ALTER TABLE kolegij
DELETE ukupna_satnica;

-------------------------------------------------------------------------------------------------------------
-- Zadatak 2
--------------------------------------------------------------------------------------------------------------
-- a)
-- Napravite tablicu sales koja ima atribute customer id i product id tipa integer,
-- order date tipa date koji je obvezan te total tipa numeric(9,2) koji je po defaultu
-- 0 i obvezan je. Primarni ključ su customer id, product id i order date. U tu novu
-- tablicu unesite podatke koje ćete dohvatiti upitom iz tablica orders i order items
-- za one narudzbe koje imaju status ‘Shipped’. Ispišite sve podatke iz tablice sales.
CREATE TABLE sales (
	customer_id INTEGER,
	product_id INTEGER,
	order_date DATE NOT NULL,
	total NUMERIC(9,2) DEFAULT 0 NOT NULL,
	CONSTRAINT sales_pk PRIMARY KEY (customer_id, product_id, order_date)
);

-- b)
-- Od tablice sales stvorite tablicu sales 2017 koja će imati sve iste atribute kao
-- tablica sales, ali neće kopirati njene podatke. U tu novu tablicu unesite podatke
-- koje ćete dohvatiti upitom iz tablica orders i order items za one narudzbe koje
-- imaju status ‘Shipped’ i koje su napravljene 2017. godine. Ispišite sve podatke iz
-- tablice sales 2017.

-- Kreiranje tablice sales_2017 s istom strukturom kao sales, ali bez podataka



			 
-- c)
-- Napravite tablicu customer lists sa atributima list id tipa integer koji je primarni
-- ključ, first name, last name i email tipa varchar(255) koji su obvezni te obveznim
-- atributom sent tipa boolean i opcionalnim atributom sent date tipa date. Stupac
-- sent će sadržavati false ako kupcu nije poslana informacija o novom proizvodu ili
-- true ako je kupcu poslana informacija. Tablicu customer lists popunite podacima
-- iz tablice customers te svima vrijednost atributa sent postavite na false
-- Kreiranje tablice


-- Unos podataka iz tablice contacts


-- Ispis svih podataka






-------------------------------------------------------------------------------------------------------------------
-- Zadatak 3
-------------------------------------------------------------------------------------------------------------------
-- a) Promjena jednog retka i jednog stupca
-- Proizvodu s ID-jem 144 promijenite cijenu na 250,00.

-- b) Promjena više stupaca u jednom retku
-- Kupcu s ID-jem 307 promijenite naziv u Kupac1, web stranicu 
-- u kupac1.kupac.com i credit limit mu postavite na 2000.

-- c) Promjena više redaka
-- Svim kupcima smanjite credit limit za 15\%.
-- Poništite sve napravljene promjene.

-------------------------------------------------------------------------------------------------------------------------
-- Zadatak 4
-------------------------------------------------------------------------------------------------------------------------
-- a) Brisanje jednog retka iz tablice
-- Iz tablice sales stvorene u 2. zadatku obrišite prodaju u kojoj je customer\_id = 4 i product\_id = 18.

-- b) Brisanje više redaka iz tablice
-- Iz tablice sales stvorene u 2. zadatku obrišite prodaju kojoj je customer\_id = 1. 

-- c) Brisanje svih podataka iz tablice
-- Obrišite sve unose iz tablice sales.

-------------------------------------------------------------------------------------------------------------------------
-- Zadatak 5
------------------------------------------------------------------------------------------------------------------------
select *
from customer_lists;

delete from customer_lists;

SELECT column_name, is_nullable
FROM information_schema.columns
WHERE table_name = 'customer_lists' AND table_schema = 'public';

-- a) Dodavanje stupca
-- U tablicu customer_lists dodajte obvezni atribut birthdate tipa date.


-- b) Dodavanje više stupaca
-- U tablicu customer_lists dodajte opcionalne atribute middle\_name tipa varchar(20) i website tipa varchar(100)


-- c) Promjena tipa stupca
-- Modificirajte atribut birthdate iz a) dijela zadatka tako da postane opcionalan.


-- d) Promjena više stupaca
-- Modificirajte atribute middle\_name i website tako da postanu obvezni.


-- e) Brisanje stupca
-- Obrišite atribut birthdate iz tablice customer_lists.


-- f) Brisanje više stupaca
-- Obrišite atribute middle\_name i website iz tablice customer_lists.


-- g) Preimenovanje stupca
-- Preimenujte atribut first\_name u ime u tablici customer_lists.


-- h) Preimenovanje tablice
-- Preimenujte tablicu customer_lists u kontakti



----------------------------------------------------------------------------------------------------------------
-- Zadatak 6
----------------------------------------------------------------------------------------------------------------
-- a) Kreiranje kopije tablice
-- Kreirajte tablicu customers\_copy i popunite ju podacima iz tablice customers. 
-- Iz tablice customers\_copy obrišite sve podatke.

-- b)  Obrišite sve podatke iz tablice customers (tablica na kojoj se redci iz drugih tablica referenciraju)
-- Poništite sve napravljene promjene.

-- Provjera podataka
SELECT * FROM customers;

SELECT * FROM contacts;

ROLLBACK;