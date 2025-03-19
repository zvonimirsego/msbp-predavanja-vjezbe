-------------------------------------------------------------------------------
-- KREIRANJE TABLICA
-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- DROP
DROP TABLE IF EXISTS DJELATNIK_IZVEDBENI;

DROP TABLE IF EXISTS DJELATNIK;

DROP TABLE IF EXISTS IZVEDBENI_PLAN;

DROP TABLE IF EXISTS STUDIJSKI_PROGRAM;

DROP TABLE IF EXISTS KOLEGIJ;

DROP TABLE IF EXISTS VRSTA_STUDIJA;

-------------------------------------------------------------------------------
-- CREATE
CREATE TABLE VRSTA_STUDIJA (
    VRSTA_STUDIJA_ID INTEGER PRIMARY KEY,
    NAZIV VARCHAR (100) NOT NULL,
    TRAJANJE_STUDIJA INTEGER NOT NULL
);

CREATE TABLE KOLEGIJ (
    KOLEGIJ_ID VARCHAR (4) PRIMARY KEY,
    NAZIV VARCHAR (150) NOT NULL,
    P INTEGER NOT NULL,
    V INTEGER NOT NULL,
    S INTEGER NOT NULL,
    ECTS INTEGER NOT NULL
);

-- dodati imena na constraint stranog kljuca sa CONSTRAINT ime ukoliko zelite
CREATE TABLE STUDIJSKI_PROGRAM (
    ST_PRG_ID INTEGER PRIMARY KEY,
    VRSTA_STUDIJA_ID INTEGER NOT NULL REFERENCES VRSTA_STUDIJA (VRSTA_STUDIJA_ID),
    KOLEGIJ_ID VARCHAR (4) NOT NULL REFERENCES KOLEGIJ (KOLEGIJ_ID),
    GODINA INTEGER NOT NULL,
    OBVEZNI INTEGER NOT NULL
);

CREATE TABLE IZVEDBENI_PLAN (
    IZVEDBENI_ID INTEGER PRIMARY KEY,
    ST_PRG_ID INTEGER NOT NULL REFERENCES STUDIJSKI_PROGRAM (ST_PRG_ID),
    SEMESTAR VARCHAR (15) NOT NULL,
    BR_GRUPA INTEGER,
    AKADEMSKA_GODINA VARCHAR (9) NOT NULL
);

CREATE TABLE DJELATNIK (
    DJELATNIK_ID INTEGER PRIMARY KEY,
    IME VARCHAR (30) NOT NULL,
    PREZIME VARCHAR (30) NOT NULL,
    SPOL VARCHAR (1) NOT NULL
);

CREATE TABLE DJELATNIK_IZVEDBENI (
    IZVEDBENI_ID INTEGER NOT NULL REFERENCES IZVEDBENI_PLAN (IZVEDBENI_ID),
    DJELATNIK_ID INTEGER NOT NULL REFERENCES DJELATNIK (DJELATNIK_ID),
    ULOGA VARCHAR (30) NOT NULL,
    PRIMARY KEY (IZVEDBENI_ID, DJELATNIK_ID, ULOGA)
);

-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- UNOS PODATAKA
-------------------------------------------------------------------------------

-------------------------------------------------------------------------------
-- VRSTA_STUDIJA

INSERT INTO VRSTA_STUDIJA VALUES (
    1,
    'Preddiplomski studij Matematika i računarstvo',
    3
);

INSERT INTO VRSTA_STUDIJA VALUES (
    2,
    'Preddiplomski studij Matematika',
    3
);

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- KOLEGIJ

INSERT INTO KOLEGIJ VALUES (
    'M084',
    'Diferencijalni račun',
    4,
    3,
    0,
    8
);

INSERT INTO KOLEGIJ VALUES (
    'I044',
    'Funkcijsko programiranje',
    2,
    2,
    0,
    6
);

INSERT INTO KOLEGIJ VALUES (
    'M086',
    'Linearna algebra I',
    2,
    2,
    0,
    6
);

INSERT INTO KOLEGIJ VALUES (
    'Z011',
    'Strani jezik u struci I',
    0,
    0,
    2,
    3
);

INSERT INTO KOLEGIJ VALUES (
    'Z014',
    'Tjelesna i zdravstvena kultura I',
    0,
    4,
    0,
    2
);

INSERT INTO KOLEGIJ VALUES (
    'I056',
    'Uvod u računalnu znanost',
    2,
    2,
    0,
    6
);

INSERT INTO KOLEGIJ VALUES (
    'M085',
    'Integralni račun',
    2,
    3,
    0,
    7
);

INSERT INTO KOLEGIJ VALUES (
    'M087',
    'Linearna algebra II',
    3,
    3,
    0,
    7
);

INSERT INTO KOLEGIJ VALUES (
    'M088',
    'Matematička logika u računalnoj znanosti',
    2,
    2,
    0,
    6
);

INSERT INTO KOLEGIJ VALUES (
    'I048',
    'Objektno orijentirano programiranje',
    2,
    2,
    0,
    6
);

INSERT INTO KOLEGIJ VALUES (
    'Z012',
    'Strani jezik u struci II',
    0,
    0,
    2,
    3
);

INSERT INTO KOLEGIJ VALUES (
    'M100',
    'Elementarna matematika',
    2,
    2,
    0,
    6
);

INSERT INTO KOLEGIJ VALUES (
    'M101',
    'Elementarna geometrija',
    2,
    2,
    0,
    6
);

INSERT INTO KOLEGIJ VALUES (
    'M102',
    'Kombinatorna i diskretna matematika',
    2,
    2,
    0,
    6
);

INSERT INTO KOLEGIJ VALUES (
    'I045',
    'Moderni računalni sustavi',
    2,
    2,
    0,
    6
);

INSERT INTO KOLEGIJ VALUES (
    'M091',
    'Primjenjena matematika za računalnu znanost',
    4,
    3,
    0,
    9
);

INSERT INTO KOLEGIJ VALUES (
    'I053',
    'Strukture podataka i algoritmi I',
    3,
    2,
    0,
    7
);

INSERT INTO KOLEGIJ VALUES (
    'Z015',
    'Tjelesna i zdravstvena kultura II',
    0,
    4,
    0,
    2
);

INSERT INTO KOLEGIJ VALUES (
    'I046',
    'Moderni sustavi baza podataka',
    3,
    3,
    1,
    9
);

INSERT INTO KOLEGIJ VALUES (
    'I054',
    'Strukture podataka i algoritmi II',
    3,
    2,
    0,
    7
);

INSERT INTO KOLEGIJ VALUES (
    'M097',
    'Teorijske osnove računalne znanosti',
    2,
    2,
    0,
    6
);

INSERT INTO KOLEGIJ VALUES (
    'I051',
    'Računalno jezikoslovlje',
    2,
    2,
    0,
    6
);

INSERT INTO KOLEGIJ VALUES (
    'M098',
    'Uvod u vjerojatnost i statistiku',
    2,
    2,
    0,
    6
);

INSERT INTO KOLEGIJ VALUES (
    'M099',
    'Vektorski prostori',
    2,
    2,
    0,
    6
);

INSERT INTO KOLEGIJ VALUES (
    'I059',
    '3D računalna grafika',
    2,
    2,
    1,
    7
);

INSERT INTO KOLEGIJ VALUES (
    'M062',
    'Primjene diferencijalnog i integralnog računa I',
    1,
    2,
    0,
    4
);

INSERT INTO KOLEGIJ VALUES (
    'I055',
    'Ugrađeni sustavi',
    2,
    2,
    1,
    7
);

INSERT INTO KOLEGIJ VALUES (
    'M009',
    'Funkcije više varijabli',
    3,
    2,
    0,
    7
);

INSERT INTO KOLEGIJ VALUES (
    'I027',
    'Matematički alati',
    1,
    0,
    2,
    4
);

INSERT INTO KOLEGIJ VALUES (
    'M015',
    'Kompleksna analiza',
    2,
    2,
    0,
    6
);

INSERT INTO KOLEGIJ VALUES (
    'M089',
    'Numerička matematika',
    2,
    2,
    0,
    6
);

INSERT INTO KOLEGIJ VALUES (
    'M095',
    'Statistički praktikum',
    1,
    2,
    1,
    6
);

INSERT INTO KOLEGIJ VALUES (
    'M108',
    'Teorija brojeva',
    2,
    2,
    0,
    6
);

INSERT INTO KOLEGIJ VALUES (
    'F007',
    'Osnove fizike I',
    4,
    2,
    1,
    7
);

INSERT INTO KOLEGIJ VALUES (
    'M103',
    'Matematička natjecanja',
    0,
    3,
    0,
    4
);

INSERT INTO KOLEGIJ VALUES (
    'F008',
    'Osnove fizike II',
    4,
    2,
    1,
    7
);

INSERT INTO KOLEGIJ VALUES (
    'M090',
    'Obične diferencijalne jednadžbe',
    2,
    2,
    0,
    6
);

INSERT INTO KOLEGIJ VALUES (
    'I057',
    'Web programiranje',
    3,
    2,
    1,
    8
);

INSERT INTO KOLEGIJ VALUES (
    'M096',
    'Strojno učenje',
    3,
    2,
    0,
    7
);

INSERT INTO KOLEGIJ VALUES (
    'I058',
    'Završni praktični projekt',
    0,
    0,
    2,
    8
);

INSERT INTO KOLEGIJ VALUES (
    'Z007',
    'Završni rad',
    0,
    0,
    2,
    2
);

INSERT INTO KOLEGIJ VALUES (
    'M094',
    'Realna analiza',
    3,
    2,
    0,
    7
);

INSERT INTO KOLEGIJ VALUES (
    'Z013',
    'Stručna praksa',
    0,
    0,
    2,
    4
);

INSERT INTO KOLEGIJ VALUES (
    'M083',
    'Algebra',
    2,
    2,
    0,
    6
);

INSERT INTO KOLEGIJ VALUES (
    'M092',
    'Osnove teorije upravljanja s primjenama',
    2,
    2,
    1,
    7
);

INSERT INTO KOLEGIJ VALUES (
    'M063',
    'Primjene diferencijalnog i integralnog računa II',
    1,
    2,
    0,
    4
);

INSERT INTO KOLEGIJ VALUES (
    'M105',
    'Uvod u diferencijalnu geometriju',
    2,
    2,
    0,
    6
);

INSERT INTO KOLEGIJ VALUES (
    'M107',
    'Metode matematičke fizike',
    3,
    2,
    0,
    7
);

INSERT INTO KOLEGIJ VALUES (
    'M104',
    'Metode numeričke matematike',
    3,
    2,
    0,
    7
);

INSERT INTO KOLEGIJ VALUES (
    'M106',
    'Teorija skupova',
    1,
    1,
    0,
    4
);

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- DJELATNIK
-------------------------------------------------------------------------------

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    100,
    'Mihaela',
    'Ribičić Penava',
    'Z'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    200,
    'Ivan',
    'Soldo',
    'M'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    300,
    'Marija',
    'Miloloža Pandur',
    'Z'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    400,
    'Slobodan',
    'Jelić',
    'M'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    500,
    'Luka',
    'Borozan',
    'M'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    600,
    'Rudolf',
    'Scitovski',
    'M'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    700,
    'Darija',
    'Marković',
    'Z'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    800,
    'Darija',
    'Brajković Zorić',
    'Z'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    900,
    'Karmen',
    'Knežević',
    'Z'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    1000,
    'Josip',
    'Cvenić',
    'M'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    1100,
    'Domagoj',
    'Matijević',
    'M'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    1200,
    'Mateja',
    'Đumić',
    'Z'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    1300,
    'Suzana',
    'Miodragović',
    'Z'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    1400,
    'Matea',
    'Ugrica',
    'Z'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    1500,
    'Jurica',
    'Maltar',
    'M'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    1600,
    'Zdenka',
    'Kolar-Begović',
    'Z'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    1700,
    'Ljiljana',
    'Primorac Gajčić',
    'Z'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    1800,
    'Ivana',
    'Kuzmanović Ivičić',
    'Z'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    1900,
    'Ivan',
    'Kvolik',
    'M'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    2000,
    'Dragana',
    'Jankov Maširević',
    'Z'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    2100,
    'Mirela',
    'Jukić Bokun',
    'Z'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    2200,
    'Snježana',
    'Majstorović',
    'Z'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    2300,
    'Ena',
    'Pribisalić',
    'Z'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    2400,
    'Danijela',
    'Jaganjac',
    'Z'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    2500,
    'Zoran',
    'Tomljanović',
    'M'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    2600,
    'Domagoj',
    'Ševerdija',
    'M'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    2700,
    'Nenad',
    'Šuvak',
    'M'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    2800,
    'Ivan',
    'Papić',
    'M'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    2900,
    'Ivan',
    'Matić',
    'M'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    3000,
    'Alfonzo',
    'Baumgartner',
    'M'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    3100,
    'Krešimir',
    'Burazin',
    'M'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    3200,
    'Jelena',
    'Jankov',
    'Z'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    3300,
    'Kristian',
    'Sabo',
    'M'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    3400,
    'Ivana',
    'Crnjac',
    'Z'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    3500,
    'Danijel',
    'Grahovac',
    'M'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    3600,
    'Branko',
    'Vuković',
    'M'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    3700,
    'Danijela',
    'Kuveždić',
    'Z'
);

INSERT INTO DJELATNIK (
    DJELATNIK_ID,
    IME,
    PREZIME,
    SPOL
) VALUES (
    3800,
    'Dragan',
    'Jukić',
    'M'
);

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- STUDIJSKI_PROGRAM
-------------------------------------------------------------------------------
-- MATEMATIKA I RAčUNARSTVO
INSERT INTO STUDIJSKI_PROGRAM VALUES (
    1,
    1,
    'M084',
    1,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    2,
    1,
    'I044',
    1,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    3,
    1,
    'M086',
    1,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    4,
    1,
    'Z011',
    1,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    5,
    1,
    'Z014',
    1,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    6,
    1,
    'I056',
    1,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    7,
    1,
    'M085',
    1,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    8,
    1,
    'M087',
    1,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    9,
    1,
    'M088',
    1,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    10,
    1,
    'I048',
    1,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    11,
    1,
    'Z012',
    1,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    12,
    1,
    'I045',
    2,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    13,
    1,
    'M091',
    2,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    14,
    1,
    'I053',
    2,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    15,
    1,
    'Z015',
    2,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    16,
    1,
    'I046',
    2,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    17,
    1,
    'I054',
    2,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    18,
    1,
    'M097',
    2,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    19,
    1,
    'I051',
    2,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    20,
    1,
    'M098',
    2,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    21,
    1,
    'M099',
    2,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    22,
    1,
    'I059',
    2,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    23,
    1,
    'M062',
    2,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    24,
    1,
    'I055',
    2,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    25,
    1,
    'M090',
    3,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    26,
    1,
    'I057',
    3,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    27,
    1,
    'M089',
    3,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    28,
    1,
    'M096',
    3,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    29,
    1,
    'I058',
    3,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    30,
    1,
    'Z007',
    3,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    31,
    1,
    'I051',
    3,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    32,
    1,
    'M094',
    3,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    33,
    1,
    'M083',
    3,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    34,
    1,
    'M092',
    3,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    35,
    1,
    'M095',
    3,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    36,
    1,
    'Z013',
    3,
    0
);

-------------------------------------------------------
-- MATEMATIKA
INSERT INTO STUDIJSKI_PROGRAM VALUES (
    37,
    2,
    'M084',
    1,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    38,
    2,
    'M100',
    1,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    39,
    2,
    'M086',
    1,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    40,
    2,
    'Z011',
    1,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    41,
    2,
    'I056',
    1,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    42,
    2,
    'M101',
    1,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    43,
    2,
    'M085',
    1,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    44,
    2,
    'M102',
    1,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    45,
    2,
    'M087',
    1,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    46,
    2,
    'Z012',
    1,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    47,
    2,
    'Z014',
    1,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    48,
    2,
    'M009',
    2,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    49,
    2,
    'I027',
    2,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    50,
    2,
    'Z015',
    2,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    51,
    2,
    'M098',
    2,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    52,
    2,
    'M015',
    2,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    53,
    2,
    'M089',
    2,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    54,
    2,
    'M095',
    2,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    55,
    2,
    'M108',
    2,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    56,
    2,
    'F007',
    2,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    57,
    2,
    'I053',
    2,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    58,
    2,
    'M088',
    2,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    59,
    2,
    'M103',
    2,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    60,
    2,
    'I048',
    2,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    61,
    2,
    'F008',
    2,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    62,
    2,
    'M062',
    2,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    63,
    2,
    'M097',
    2,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    64,
    2,
    'M090',
    3,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    65,
    2,
    'M094',
    3,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    66,
    2,
    'M083',
    3,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    67,
    2,
    'Z007',
    3,
    1
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    68,
    2,
    'I045',
    3,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    69,
    2,
    'M063',
    3,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    70,
    2,
    'M105',
    3,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    71,
    2,
    'M099',
    3,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    72,
    2,
    'I057',
    3,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    73,
    2,
    'M103',
    3,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    74,
    2,
    'M107',
    3,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    75,
    2,
    'M104',
    3,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    76,
    2,
    'M096',
    3,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    77,
    2,
    'I054',
    3,
    0
);

INSERT INTO STUDIJSKI_PROGRAM VALUES (
    78,
    2,
    'M106',
    3,
    0
);

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- IZVEDBENI PLAN
-------------------------------------------------------------------------------
-- MATEMATIKA I RAčUNARSTVO
INSERT INTO IZVEDBENI_PLAN VALUES (
    1,
    1,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    2,
    2,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    3,
    3,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    4,
    4,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    5,
    5,
    'zimski i ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    6,
    6,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    7,
    7,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    8,
    8,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    9,
    9,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    10,
    10,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    11,
    11,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    12,
    12,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    13,
    13,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    14,
    14,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    15,
    15,
    'zimski i ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    16,
    16,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    17,
    17,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    18,
    18,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    19,
    19,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    20,
    20,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    21,
    21,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    22,
    22,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    23,
    23,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    24,
    24,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    25,
    25,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    26,
    26,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    27,
    27,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    28,
    28,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN (
    IZVEDBENI_ID,
    ST_PRG_ID,
    SEMESTAR,
    AKADEMSKA_GODINA
) VALUES (
    29,
    29,
    'ljetni',
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN (
    IZVEDBENI_ID,
    ST_PRG_ID,
    SEMESTAR,
    AKADEMSKA_GODINA
) VALUES (
    30,
    30,
    'ljetni',
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    31,
    31,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    32,
    32,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    33,
    33,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    34,
    34,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    35,
    35,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN (
    IZVEDBENI_ID,
    ST_PRG_ID,
    SEMESTAR,
    AKADEMSKA_GODINA
) VALUES (
    36,
    36,
    'ljetni',
    '2019/2020'
);

------------------------------------------------------------------
-- MATEMATIKA
INSERT INTO IZVEDBENI_PLAN VALUES (
    37,
    37,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    38,
    38,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    39,
    39,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    40,
    40,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    41,
    41,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    42,
    42,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    43,
    43,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    44,
    44,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    45,
    45,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    46,
    46,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    47,
    47,
    'zimski i ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    48,
    48,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    49,
    49,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    50,
    50,
    'zimski i ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    51,
    51,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    52,
    52,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    53,
    53,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    54,
    54,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    55,
    55,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    56,
    56,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    57,
    57,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    58,
    58,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    59,
    59,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    60,
    60,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    61,
    61,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    62,
    62,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    63,
    63,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    64,
    64,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    65,
    65,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    66,
    66,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN (
    IZVEDBENI_ID,
    ST_PRG_ID,
    SEMESTAR,
    AKADEMSKA_GODINA
) VALUES (
    67,
    67,
    'ljetni',
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    68,
    68,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    69,
    69,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    70,
    70,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    71,
    71,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    72,
    72,
    'zimski',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    73,
    73,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    74,
    74,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    75,
    75,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    76,
    76,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    77,
    77,
    'ljetni',
    1,
    '2019/2020'
);

INSERT INTO IZVEDBENI_PLAN VALUES (
    78,
    78,
    'ljetni',
    1,
    '2019/2020'
);

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
-- DJELATNIK_IZVEDBENI
-------------------------------------------------------------------------------
-- MATEMATIKA I RAčUNARSTVO
INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    1,
    100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    1,
    200,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    1,
    300,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    2,
    400,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    2,
    500,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    3,
    600,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    3,
    700,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    3,
    800,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    4,
    900,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    5,
    1000,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    6,
    1100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    6,
    1200,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    6,
    2300,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    7,
    100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    7,
    200,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    7,
    1300,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    8,
    700,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    8,
    800,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    9,
    400,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    9,
    500,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    9,
    1400,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    10,
    1100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    10,
    1500,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    11,
    900,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    12,
    1100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    12,
    1900,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    12,
    500,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    13,
    2000,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    13,
    2100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    13,
    2200,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    13,
    2000,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    13,
    2100,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    13,
    2200,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    14,
    400,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    14,
    500,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    14,
    2400,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    15,
    1000,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    16,
    400,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    16,
    1200,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    16,
    2300,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    17,
    400,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    17,
    2300,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    18,
    2500,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    18,
    2500,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    19,
    2600,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    19,
    2600,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    20,
    2700,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    20,
    2800,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    20,
    300,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    21,
    2900,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    21,
    800,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    22,
    3000,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    22,
    2600,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    23,
    3100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    23,
    3200,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    24,
    1100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    24,
    1900,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    24,
    1500,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    25,
    3100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    25,
    3200,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    26,
    1100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    26,
    1500,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    27,
    3300,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    27,
    700,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    27,
    1300,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    28,
    3300,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    28,
    1100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    28,
    2400,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    29,
    1100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    31,
    2600,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    31,
    2600,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    32,
    3800,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    32,
    2000,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    33,
    2900,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    33,
    800,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    34,
    2500,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    34,
    1400,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    34,
    2500,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    35,
    3500,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    35,
    3500,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    35,
    2800,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    36,
    1100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    36,
    2700,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    36,
    1500,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    36,
    2800,
    'asistent'
);

--------------------------------------------------------------

-- MATEMATIKA
INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    37,
    100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    37,
    200,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    37,
    300,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    38,
    100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    38,
    1800,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    39,
    600,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    39,
    700,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    39,
    800,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    40,
    900,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    41,
    1100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    41,
    1200,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    41,
    2300,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    42,
    1600,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    42,
    1700,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    43,
    100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    43,
    200,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    43,
    1300,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    44,
    2200,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    44,
    2200,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    45,
    700,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    45,
    800,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    46,
    900,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    47,
    1000,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    48,
    3100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    48,
    3200,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    49,
    1800,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    49,
    1800,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    50,
    1000,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    51,
    2700,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    51,
    2800,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    51,
    300,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    52,
    3100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    52,
    3400,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    53,
    3300,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    53,
    700,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    53,
    1300,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    54,
    3500,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    54,
    3500,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    54,
    2800,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    55,
    2100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    55,
    200,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    56,
    3600,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    56,
    3700,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    57,
    400,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    57,
    500,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    57,
    2400,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    58,
    400,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    58,
    500,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    58,
    1400,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    59,
    2200,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    59,
    1700,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    60,
    1100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    60,
    1500,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    61,
    3600,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    61,
    3700,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    62,
    3100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    62,
    3200,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    63,
    2500,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    63,
    2500,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    64,
    3100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    64,
    3400,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    65,
    3800,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    65,
    2000,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    66,
    2900,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    66,
    800,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    68,
    1100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    68,
    1900,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    68,
    500,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    69,
    2200,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    69,
    2200,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    70,
    1600,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    70,
    1700,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    71,
    2900,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    71,
    800,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    72,
    1100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    72,
    1500,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    73,
    2200,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    73,
    1700,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    74,
    3100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    74,
    3200,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    75,
    1300,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    75,
    1400,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    76,
    3300,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    76,
    1100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    76,
    2400,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    77,
    400,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    77,
    2300,
    'asistent'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    78,
    100,
    'nastavnik'
);

INSERT INTO DJELATNIK_IZVEDBENI VALUES (
    78,
    100,
    'asistent'
);

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------
COMMIT;

-------------------------------------------------------------------------------
-------------------------------------------------------------------------------