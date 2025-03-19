DROP TABLE IF EXISTS DEPARTMENT;
DROP TABLE IF EXISTS EMPLOYEE;

-- Kreiranje tablice DEPARTMENT
CREATE TABLE DEPARTMENT (
    DEPTNO INT CONSTRAINT DEPARTMENT_PK PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL,
    LOC VARCHAR(50) NOT NULL
);

-- Unos podataka u DEPARTMENT tablicu
INSERT INTO DEPARTMENT (DEPTNO, NAME, LOC) VALUES
(10, 'Sales', 'London'),
(20, 'HR', 'Barcelona'),
(30, 'Production', 'Mumbai'),
(40, 'Accounts', 'Berlin');

-- Kreiranje tablice EMPLOYEE
CREATE TABLE EMPLOYEE (
    EMPLOYEE_ID INT CONSTRAINT EMPLOYEE_PK PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL,
    EMAIL VARCHAR(100) NOT NULL,
    SALARY INT NOT NULL,
    DEPTNO INT CONSTRAINT EMPLOYEE_FK_DEPARTMENT  REFERENCES DEPARTMENT(DEPTNO)
);

-- Unos podataka u EMPLOYEE tablicu
INSERT INTO EMPLOYEE (EMPLOYEE_ID, NAME, EMAIL, SALARY, DEPTNO) VALUES
(1, 'John Johnson', 'john@gmail.com', 2030, 20),
(2, 'Mary Truman', 'mary@gmail.com', 3000, 40),
(3, 'John McJohn', 'johnjohn@gmail.com', 5000, 40),
(4, 'Sarah Philips', 'sarah@gmail.com', 2133, 30),
(5, 'Petra Parks', 'petra@gmail.com', 2311, 30),
(6, 'Sarah Clarkson', 'sarah33@gmail.com', 3400, 10),
(7, 'Emanuel Oz', 'emanuel@gmail.com', 2000, 20);
COMMIT;

-- Ispišite imena zaposlenika, nazive odjela i lokaciju odjela na kojima rade koristeći
-- kartezijev produkt i unutarnji spoj (inner join).

-- kartezijev
SELECT e.name, d.name, d.loc
FROM department d, employee e
WHERE d.deptno = e.deptno;

-- inner join
SELECT e.name, d.name, d.loc
FROM department d INNER JOIN employee e
USING (deptno);
COMMIT;





