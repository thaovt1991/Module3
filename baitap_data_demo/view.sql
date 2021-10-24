USE demo ;

CREATE VIEW viewInfomation AS 
SELECT productCode, productName ,  productPrice, productStatus FROM Products ;
SELECT * FROM viewInfomation ;

CREATE OR REPLACE VIEW viewInfomation AS 
SELECT * FROM Products ;
SELECT * FROM viewInfomation ;


ALTER VIEW viewInfomation AS SELECT productCode, productName ,productAmount , productPrice, productStatus FROM Products ;
SELECT * FROM viewInfomation ;

DROP VIEW viewInfomation ;