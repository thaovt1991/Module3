USE ManagerDrinksAndCoffee ;
 
 CREATE TABLE Drinks (
 id VARCHAR(6) NOT NULL PRIMARY KEY ,
 nameDrinks VARCHAR(45) NOT NULL ,
 quantity INT NOT NULL DEFAULT 0 ,
 price LONG NOT NULL,
 descriptionOther VARCHAR(255)
 );
 
  CREATE TABLE Staff (
 id VARCHAR(8) NOT NULL PRIMARY KEY ,
 fullname VARCHAR(45) NOT NULL ,
 gender VARCHAR(10)  ,
 dateOfBirth DATETIME ,
 phone VARCHAR(11),
 identityCArd VARCHAR(9) ,
 address VARCHAR(255),
 pay LONG NOT NULL ,
 descriptionOther VARCHAR(255)
 );
 
  CREATE TABLE Account (
  username VARCHAR(20) NOT NULL PRIMARY KEY,
  password VARCHAR(20) NOT NULL,
  idOwner VARCHAR(8) NOT NULL,
  decentralization VARCHAR(10),
  FOREIGN KEY (idOwner) REFERENCES Staff(id)
  );
  
  CREATE TABLE OrderTable(
  idTable VARCHAR(5) NOT NULL PRIMARY KEY,
  idDrins VARCHAR(6) ,
  quanityDrinksOrder INT DEFAULT 0,
  idStaffServing VARCHAR(8) NOT NULL,
  timeIn DATETIME ,
  timeOut DATETIME,
  totalMoney LONG ,
  FOREIGN KEY (idDrins) REFERENCES Drinks(id),
  FOREIGN KEY (idStaffServing) REFERENCES Staff(id)
  );
  
  CREATE TABLE OrderCarryAway(
  idCarryAway VARCHAR(5) NOT NULL PRIMARY KEY,
  idDrins VARCHAR(6) ,
  quanityDrinksOrder INT DEFAULT 0,
  idStaffServing VARCHAR(8) NOT NULL,
  timeIn DATETIME ,
  timeOut DATETIME,
  totalMoney LONG ,
  FOREIGN KEY (idDrins) REFERENCES Drinks(id),
   FOREIGN KEY (idStaffServing) REFERENCES Staff(id)
  );
  

  
 --  CREATE TABLE Bill(
--   idBill INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
--   dateBill DATE,
--   username VARCHAR(20) NOT NULL,
--   idOrder VARCHAR(6) NOT NULL,
--   FOREIGN KEY (username) REFERENCES Account(username),
--   FOREIGN KEY (idOrder) REFERENCES OrderTable(idTable),
--   FOREIGN KEY (idOrder) REFERENCES OrderCarryAway(idCarryAway)
--   ); bill dc tao ra tu table va caryrry away
  
  
  
  
  
  
  