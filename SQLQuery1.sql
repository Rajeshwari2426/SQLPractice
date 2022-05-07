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
----Full Joins----
SELECT  c.id candidate_id,c.fullname candidate_name,e.id employee_id,e.fullname employee_name FROM  hr.candidates c  full JOIN hr.employees e  ON e.fullname = c.fullname;
SELECT  c.id candidate_id,c.fullname candidate_name,e.id employee_id,e.fullname employee_name FROM  hr.candidates c  full JOIN hr.employees e  ON e.fullname = c.fullname where c.id is null or e.id is null;
alter table HR.Employees add Basic_Pay float not null default 0.00;
update HR.Employees set Basic_Pay=70000.00 where Id=1; 
update HR.Employees set Basic_Pay=75000.00 where Id=2; 
update HR.Employees set Basic_Pay=60000.00 where Id=3; 
update HR.Employees set Basic_Pay=80000.00 where Id=4; 
SELECT  c.id candidate_id,c.fullname candidate_name,c.e.id employee_id,e.fullname employee_name FROM  hr.candidates c  full JOIN hr.employees e  ON e.fullname = c.fullname where c.id is null or e.id is null;
alter table HR.Candidates add Basic_Pay float not null default 0.00;
update HR.Candidates set Basic_Pay=60000.00 where Id=1; 
update HR.Candidates set Basic_Pay=55000.00 where Id=2; 
update HR.Candidates set Basic_Pay=40000.00 where Id=3; 
update HR.Candidates set Basic_Pay=30000.00 where Id=4; 

-----VIEWS----------
SELECT  c.id candidate_id,c.fullname candidate_name,e.id employee_id,e.fullname employee_name FROM  hr.candidates c Left JOIN hr.employees e  ON e.fullname = c.fullname;
---------Create view-----------
CREATE VIEW leftjoin_info as SELECT  c.id candidate_id,c.fullname candidate_name,e.id employee_id,e.fullname employee_name FROM  hr.candidates c left JOIN hr.employees e  ON e.fullname = c.fullname;
----------Display View Result--------------
select * from leftjoin_info;
CREATE VIEW rightjoin_info as SELECT  c.id candidate_id,c.fullname candidate_name,e.id employee_id,e.fullname employee_name FROM  hr.candidates c right JOIN hr.employees e  ON e.fullname = c.fullname;
select * from rightjoin_info;
------------REMOVE VIEW--------------
Drop View if exists HR.leftjoin_info;
-----------VIEW LIST-----------
SELECT 
	OBJECT_SCHEMA_NAME(v.object_id) schema_name,
	v.name
FROM 
	sys.views as v;
CREATE VIEW HR.rightjoin_info as SELECT  c.id candidate_id,c.fullname candidate_name,e.id employee_id,e.fullname employee_name FROM  hr.candidates c right JOIN hr.employees e  ON e.fullname = c.fullname;
Drop View if exists HR.rightjoin_info;
