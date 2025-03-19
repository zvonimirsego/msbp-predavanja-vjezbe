DROP TABLE IF EXISTS PROIZVOD CASCADE;
DROP TABLE IF EXISTS PC CASCADE;
DROP TABLE IF EXISTS PRIJENOSNIK CASCADE;
DROP TABLE IF EXISTS PRINTER CASCADE;

CREATE TABLE PROIZVOD(
	MODEL_ID integer CONSTRAINT model_pk PRIMARY KEY,
	PROIZVODJAC character(1)  NOT NULL,
	TIP varchar(20) NOT NULL
);

CREATE TABLE PC(
	MODEL_ID integer CONSTRAINT pc_model_fk REFERENCES PROIZVOD(MODEL_ID),
	BRZINA numeric(2,1)  NOT NULL,
	RAM integer NOT NULL,
	HD integer NULL,
	CIJENA numeric(6,2) NOT NULL,
	CONSTRAINT pc_pk PRIMARY KEY (MODEL_ID)
);

CREATE TABLE PRIJENOSNIK(
	MODEL_ID integer CONSTRAINT prijenosnik_model_fk REFERENCES PROIZVOD(MODEL_ID),
	BRZINA numeric(2,1)  NOT NULL,
	RAM integer NOT NULL,
	ZASLON numeric(4,2) NOT NULL,
	HD integer NULL,
	CIJENA numeric(6,2) NOT NULL,
	CONSTRAINT prijenosnik_pk PRIMARY KEY (MODEL_ID)
);

CREATE TABLE PRINTER(
	MODEL_ID integer CONSTRAINT printer_model_fk REFERENCES PROIZVOD(MODEL_ID),
	BOJA varchar(5) NOT NULL,
	TIP varchar(10) NOT NULL,
	CIJENA numeric(6,2) NOT NULL,
	CONSTRAINT printer_pk PRIMARY KEY (MODEL_ID)
);

INSERT INTO PROIZVOD(proizvodjac, model_id, tip) VALUES (
  'A',
  1001,
  'pc'
);

INSERT INTO PROIZVOD(proizvodjac, model_id, tip) VALUES (
  'A',
  1002,
  'pc'
);

INSERT INTO PROIZVOD(proizvodjac, model_id, tip)  VALUES (
  'A',
  1003,
  'pc'
);

INSERT INTO PROIZVOD(proizvodjac, model_id, tip)  VALUES (
  'A',
  2004,
  'prijenosnik'
);

INSERT INTO PROIZVOD(proizvodjac, model_id, tip)  VALUES (
  'A',
  2005,
  'prijenosnik'
);

INSERT INTO PROIZVOD(proizvodjac, model_id, tip)  VALUES (
  'B',
  1004,
  'pc'
);

INSERT INTO PROIZVOD(proizvodjac, model_id, tip)  VALUES (
  'B',
  1005,
  'pc'
);

INSERT INTO PROIZVOD(proizvodjac, model_id, tip)  VALUES (
  'B',
  2006,
  'prijenosnik'
);

INSERT INTO PROIZVOD(proizvodjac, model_id, tip)  VALUES (
  'C',
  1006,
  'pc'
);

INSERT INTO PROIZVOD(proizvodjac, model_id, tip)  VALUES (
  'D',
  1007,
  'pc'
);

INSERT INTO PROIZVOD(proizvodjac, model_id, tip)  VALUES (
  'D',
  3004,
  'printer'
);

INSERT INTO PROIZVOD(proizvodjac, model_id, tip)  VALUES (
  'D',
  3005,
  'printer'
);

INSERT INTO PROIZVOD(proizvodjac, model_id, tip)  VALUES (
  'E',
  1008,
  'pc'
);

INSERT INTO PROIZVOD(proizvodjac, model_id, tip)  VALUES (
  'E',
  1009,
  'pc'
);

INSERT INTO PROIZVOD(proizvodjac, model_id, tip)  VALUES (
  'E',
  2001,
  'prijenosnik'
);

INSERT INTO PROIZVOD(proizvodjac, model_id, tip)  VALUES (
  'E',
  2002,
  'prijenosnik'
);

INSERT INTO PROIZVOD(proizvodjac, model_id, tip)  VALUES (
  'E',
  2003,
  'prijenosnik'
);

INSERT INTO PROIZVOD(proizvodjac, model_id, tip)  VALUES (
  'E',
  3001,
  'printer'
);

INSERT INTO PROIZVOD(proizvodjac, model_id, tip)  VALUES (
  'E',
  3002,
  'printer'
);

INSERT INTO PROIZVOD(proizvodjac, model_id, tip)  VALUES (
  'E',
  3003,
  'printer'
);

INSERT INTO PC(model_id, brzina, ram, hd, cijena)  VALUES (
  1001,
  2.66,
  1024,
  250,
  2114
);

INSERT INTO PC(model_id, brzina, ram, hd, cijena)  VALUES (
  1002,
  2.10,
  512,
  250,
  995
);

INSERT INTO PC(model_id, brzina, ram, hd, cijena)  VALUES (
  1003,
  1.42,
  512,
  80,
  478
);

INSERT INTO PC(model_id, brzina, ram, hd, cijena) VALUES (
  1004,
  2.80,
  1024,
  250,
  649
);

INSERT INTO PC(model_id, brzina, ram, hd, cijena) VALUES (
  1005,
  3.20,
  512,
  250,
  630
);

INSERT INTO PC(model_id, brzina, ram, hd, cijena) VALUES (
  1006,
  2.20,
  1024,
  200,
  510
);

INSERT INTO PC(model_id, brzina, ram, hd, cijena) VALUES (
  1007,
  2.20,
  2048,
  250,
  770
);

INSERT INTO PC(model_id, brzina, ram, hd, cijena) VALUES (
  1008,
  1.86,
  2048,
  160,
  959
);

INSERT INTO PC(model_id, brzina, ram, hd, cijena) VALUES (
  1009,
  2.80,
  1024,
  160,
  649
);

INSERT INTO PRIJENOSNIK(model_id, brzina, ram, hd, zaslon, cijena) VALUES (
  2001,
  2.00,
  2048,
  240,
  20.1,
  3673
);

INSERT INTO PRIJENOSNIK(model_id, brzina, ram, hd, zaslon, cijena) VALUES (
  2002,
  1.73,
  1024,
  80,
  17.0,
  949
);

INSERT INTO PRIJENOSNIK(model_id, brzina, ram, hd, zaslon, cijena) VALUES (
  2003,
  1.80,
  512,
  60,
  15.4,
  549
);

INSERT INTO PRIJENOSNIK(model_id, brzina, ram, hd, zaslon, cijena) VALUES (
  2004,
  2.00,
  512,
  60,
  13.3,
  1150
);

INSERT INTO PRIJENOSNIK(model_id, brzina, ram, hd, zaslon, cijena) VALUES (
  2005,
  2.16,
  1024,
  120,
  17.0,
  2500
);

INSERT INTO PRIJENOSNIK(model_id, brzina, ram, hd, zaslon, cijena) VALUES (
  2006,
  1.83,
  1024,
  120,
  13.3,
  1429
);

INSERT INTO PRINTER(model_id, boja, tip, cijena) VALUES (
  3001,
  'true',
  'ink-jet',
  99
);

INSERT INTO PRINTER(model_id, boja, tip, cijena) VALUES (
  3002,
  'false',
  'laser',
  239
);

INSERT INTO PRINTER(model_id, boja, tip, cijena) VALUES (
  3003,
  'true',
  'laser',
  899
);

INSERT INTO PRINTER(model_id, boja, tip, cijena) VALUES (
  3004,
  'true',
  'ink-jet',
  120
);

INSERT INTO PRINTER(model_id, boja, tip, cijena) VALUES (
  3005,
  'false',
  'laser',
  120
);
COMMIT;