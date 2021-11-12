USE  demo ;

CREATE TABLE Products(
Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
productCode VARCHAR(20) NOT NULL ,
productName VARCHAR(20) NOT NULL ,
productPrice INT ,
productAmount INT ,
productDescription VARCHAR(255),
productStatus VARCHAR(20)
);
