-- CREATE SCHEMA `quanlybanhang` ;

USE `quanlybanhang` ;

CREATE TABLE Customer(
cID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
cNAme VARCHAR(20) NOT NULL,
cAge INT 
);

CREATE TABLE Orderr (
oID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
cID INT NOT NULL,
oDate DATETIME NOT NULL,
oTotalPrice DOUBLE NOT NULL,
FOREIGN KEY(cID) REFERENCES Customer (cID)
);

CREATE TABLE Product(
pID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
pName VARCHAR(20) NOT NULL,
pPrice DOUBLE NOT NULL 
);

CREATE TABLE OrderDetail(
oID INT NOT NULL  PRIMARY KEY,
pID INT NOT NULL  PRIMARY KEY,
odQTY INT NOT NULL,
 FOREIGN KEY(pID) REFERENCES Product(pID),
FOREIGN KEY(oID) REFERENCES Orderr (oID)
);

