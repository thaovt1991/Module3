USE MyBank ;

CREATE TABLE Customers (
idCustomer INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
nameCustomer VARCHAR(45) NOT NULL,
email VARCHAR(45) ,
phone VARCHAR(45) ,
blance INT 
);

CREATE TABLE Deposits(
idDeposits INT NOT NULL AUTO_INCREMENT PRIMARY KEY , 
idCustomer INT NOT NULL,
amount  INT NOT NULL,
dateDepoints DATETIME NOT NULL ,
FOREIGN KEY (idCustomer) REFERENCES Customers(idCustomer)
);

CREATE TABLE Withdraws(
idWithdraws INT NOT NULL AUTO_INCREMENT PRIMARY KEY , 
idCustomer INT NOT NULL,
amount  INT NOT NULL,
dateWithdraws DATETIME NOT NULL ,
FOREIGN KEY (idCustomer) REFERENCES Customers(idCustomer)) ;

CREATE TABLE Transfers(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
idSender INT NOT NULL,
idRecipient INT NOT NULL,
amount INT NOT NULL,
date_transfers DATETIME NOT NULL ,
FOREIGN KEY (idSender) REFERENCES Customers(idCustomer),
FOREIGN KEY (idRecipient) REFERENCES Customers(idCustomer)
);