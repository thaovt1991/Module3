USE demo ;
EXPLAIN SELECT * FROM Products WHERE productCode = 'IP6'; 
CREATE UNIQUE INDEX idCode_productCode ON Products(productCode);
EXPLAIN SELECT * FROM Products WHERE productCode = 'IP6'; 


EXPLAIN SELECT * FROM Products WHERE productName = 'Iphone 6' AND productPrice = 5000000 ; 
CREATE INDEX compositeIndex_product
ON Products (productName, productPrice);
EXPLAIN SELECT * FROM Products WHERE productName = 'Iphone 6' AND productPrice = 5000000 ; 

ALTER TABLE Products DROP INDEX idCode_productCode ;
ALTER TABLE Products DROP INDEX compositeIndex_product;

