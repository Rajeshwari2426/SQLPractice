-----------creating table for logging info---
CREATE TABLE production.product_audits(
    change_id INT IDENTITY PRIMARY KEY,
    product_id INT NOT NULL,
    product_name VARCHAR(255) NOT NULL,
    brand_id INT NOT NULL,
    list_price DEC(10,2) NOT NULL,
    updated_at DATETIME NOT NULL,
    operation CHAR(3) NOT NULL,
    CHECK(operation = 'INS' or operation='DEL')
);
-----------Creating an after DML trigger----------
CREATE TRIGGER production.trg_product_audit
ON production.products
AFTER INSERT, DELETE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO production.product_audits(
        product_id, 
        product_name,
        brand_id,        
        list_price, 
        updated_at, 
        operation
    )
    SELECT
        i.product_id,
        product_name,
        brand_id,       
        i.list_price,
        GETDATE(),
        'INS'
    FROM
        inserted i
    UNION ALL
    SELECT
        d.product_id,
        product_name,
        brand_id,       
        d.list_price,
        GETDATE(),
        'DEL'
    FROM
        deleted d;
END
-----------testing trigger+-----
INSERT INTO production.products(
    product_name, 
    brand_id,     
    list_price
)
VALUES (
    'cloak',
    1,   
    7000
);
select* from production.products
select* from production.product_audits
-------------remove row----
DELETE FROM production.products WHERE product_id = 5;

