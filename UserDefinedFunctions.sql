create schema sales
CREATE TABLE sales.order_items(
	order_id INT,
	item_id INT,
	product_id INT NOT NULL,
	quantity INT NOT NULL,
	list_price DECIMAL (10, 2) NOT NULL,
	discount DECIMAL (4, 2) NOT NULL DEFAULT 0,	
);

INSERT INTO 
    sales.order_items(product_id, quantity, list_price, discount)
VALUES
    (7,46,36,0.20);
	---create function-------------

CREATE FUNCTION sales.udfNetSale(
    @quantity INT,
    @list_price DEC(10,2),
    @discount DEC(4,2)
)
RETURNS DEC(10,2)
AS 
BEGIN
    RETURN @quantity * @list_price * (1 - @discount);
END;

SELECT sales.udfNetSale(10,100,0.1) net_sale;

SELECT order_id,SUM(sales.udfNetSale(quantity, list_price, discount)) net_amount FROM sales.order_items GROUP BY order_id ORDER BY net_amount DESC;
-----modify function---
ALTER FUNCTION  sales.udfNetSale(
    @quantity INT,
    @list_price DEC(10,2),
    @discount DEC(4,2)
)
   RETURNS DEC(10,2)
AS 
BEGIN
    RETURN @quantity * @list_price * (2 - @discount);
END;
-------remove function------
DROP FUNCTION sales.udfNetSale;


