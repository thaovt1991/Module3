USE demo ;

DELIMITER // 
CREATE PROCEDURE displayProducts()
BEGIN
  SELECT * FROM Products ;
END//
DELIMITER ;

CALL displayProducts() ;
SELECT * FROM Products ;

DELIMITER // 
CREATE PROCEDURE addProducts(
IN 
productCodeNewP VARCHAR(20),
productNameNewP VARCHAR(20),
productPriceNewP INT ,
 productAmountNewP INT ,
productDescriptionNewP VARCHAR(255),
productStatusNewP VARCHAR(20) 
)
BEGIN
  INSERT INTO Products(productCode , productName, productPrice, productAmount, productDescription,productStatus)
  VALUES (productCodeNewP ,productNameNewP, productPriceNewP,productAmountNewP, productDescriptionNewP, productStatusNewP) ;
END// 
DELIMITER ;

CALL addProducts('IP7','Iphone 7',7000000,15,'Iphone dung on dinh, do Apple san xuat','new 100%');
SELECT * FROM Products ;


DELIMITER // 
CREATE PROCEDURE editProducts(
IN idEdit INT,
productCodeNew VARCHAR(20),
productNameNew VARCHAR(20),
productPriceNew INT ,
productAmountNew INT ,
productDescriptionNew VARCHAR(255),
productStatusNew VARCHAR(20) 
)
BEGIN
  UPDATE Products
  SET 
  productCode = productCodeNew ,
  productName = productNameNew ,
  productPrice = productPriceNew,
  productAmount = productAmountNew ,
  productDescription = productDescriptionNew ,
  productStatus = productStatusNew
  WHERE id = idEdit ;
END// 
DELIMITER ;

CALL editProducts(5,'IP7S','Iphone 7S',7000000,15,'Iphone dung on dinh, do Apple san xuat','new 99%') ;
SELECT * FROM Products;

DELIMITER // 
CREATE PROCEDURE deleteProducts(IN idDelete INT) 
BEGIN
  DELETE FROM Products WHERE id = idDelete ;
END//
DELIMITER ;
CALL deleteProducts(5) ;
SELECT * FROM Products;

















