Create DATABASE CompanyDetails
CREATE SCHEMA HR;
GO
Create table HR.Candidates(
    id INT PRIMARY KEY IDENTITY,
    fullname VARCHAR(100) NOT NULL
);
create table HR.Employees(
    id INT PRIMARY KEY IDENTITY,
    fullname VARCHAR(100) NOT NULL
);
INSERT INTO HR.Candidates(fullname)VALUES('Johnny Debb'),('Elon Musk'),('Jung kook'),('Lilly James');
INSERT INTO HR.Employees(fullname)VALUES('Scarlet Jhonson'),('Hermoine Granger'),('Ron Weasely'),('Harry Potter');
INSERT INTO HR.Candidates(fullname)VALUES('Scarlet Jhonson'),('Hermoine Granger'),('Ron Weasely'),('Harry Potter');
----INNER JOINS-------
SELECT  c.id candidate_id,c.fullname candidate_name,e.id employee_id,e.fullname employee_name FROM  hr.candidates c INNER JOIN hr.employees e  ON e.fullname = c.fullname;
----LEFT JOIN------
SELECT  c.id candidate_id,c.fullname candidate_name,e.id employee_id,e.fullname employee_name FROM  hr.candidates c Left JOIN hr.employees e  ON e.fullname = c.fullname;
SELECT  c.id candidate_id,c.fullname candidate_name,e.id employee_id,e.fullname employee_name FROM  hr.candidates c Left JOIN hr.employees e  ON e.fullname = c.fullname where e.id is null;
-----RIGHT JOIN-----
SELECT  c.id candidate_id,c.fullname candidate_name,e.id employee_id,e.fullname employee_name FROM  hr.candidates c right JOIN hr.employees e  ON e.fullname = c.fullname;
INSERT INTO HR.Employees(fullname)VALUES('Draco Malfoy '),('Lord Voldmort'),('Bellatrix Lestrange'),('Doleres Umbridge');
SELECT  c.id candidate_id,c.fullname candidate_name,e.id employee_id,e.fullname employee_name FROM  hr.candidates c right JOIN hr.employees e  ON e.fullname = c.fullname where c.id is null;
