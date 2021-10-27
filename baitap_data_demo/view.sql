USE demo ;
SELECT * FROM Products ;

CREATE VIEW vw_infomation_products AS 
SELECT 
	productCode AS 'Ma SP', 
	productName AS 'Ten' ,
	productPrice AS 'Gia', 
	productStatus AS 'Trang Thai' 
FROM Products ;

SELECT * FROM vw_infomation_products ;

 UPDATE vw_infomation_products 
 SET Ten = 'Iphone 6' 
 WHERE  Ma SP = 'IP6';


CREATE OR REPLACE VIEW viewInfomationProducts AS 
SELECT * FROM Products ;
SELECT * FROM viewInfomation ;


ALTER VIEW viewInfomation AS SELECT productCode, productName ,productAmount , productPrice, productStatus FROM Products ;
SELECT * FROM viewInfomation ;

DROP VIEW vw_infomation_products ;