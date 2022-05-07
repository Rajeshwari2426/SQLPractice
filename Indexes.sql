CREATE SCHEMA production;
CREATE TABLE production.parts(
    part_id   INT NOT NULL, 
    part_name VARCHAR(100)
);
INSERT INTO 
    production.parts(part_id, part_name)
VALUES
    (1,'Frame'),
    (2,'Head Tube'),
    (3,'Handlebar Grip'),
    (4,'Shock Absorber'),
    (5,'Fork');
SELECT * FROM  production.parts WHERE part_id = 5;
CREATE TABLE production.part_prices(
    part_id int,
    valid_from date,
    price decimal(18,4) not null,
    PRIMARY KEY(part_id, valid_from) 
);
ALTER TABLE production.parts ADD PRIMARY KEY(part_id);
CREATE TABLE production.categories (
	category_id INT not null,
	category_name VARCHAR (255) NOT NULL
);

CREATE CLUSTERED INDEX ix_category_id ON production.categories (category_id);  
Insert into production.categories(category_id,category_name) values (1,'Engine'),(2,'SpareParts');
select * from production.categories;
select * from production.categories where category_id=1;