CREATE TABLE production.products (
	product_id INT IDENTITY (1, 1) PRIMARY KEY,
	product_name VARCHAR (255) NOT NULL,
	brand_id INT NOT NULL,	
	list_price DECIMAL (10, 2) NOT NULL,
	
);
insert into  production.products (product_name,brand_id,list_price) values('wands',1,200.0),('nimbus',2,2000),('fireworks',3,2500),('hoodie',4,700);
----------create stored procedure------------
CREATE PROCEDURE uspProductList AS 
BEGIN
    SELECT 
        product_name, 
        list_price
    FROM 
        production.products
    ORDER BY 
        product_name;
END;
EXEC uspProductList;
------------------Modify stored procedure-------------
 ALTER PROCEDURE uspProductList
    AS
    BEGIN
        SELECT 
            product_name, 
            list_price
        FROM 
            production.products
        ORDER BY 
            list_price 
			 END;
----delete stored procedure -------------
DROP PROCEDURE uspProductList;

