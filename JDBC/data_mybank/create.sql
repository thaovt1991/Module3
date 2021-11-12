-- CREATE DATABASE MyBankManager;
USE MyBankManager;

CREATE TABLE customers (
 id  INT NOT NULL AUTO_INCREMENT,
 full_name VARCHAR(45) NOT NULL,
 email VARCHAR(220) NOT NULL,
 phone VARCHAR(45),sp_transfers
 address VARCHAR(255),
 balance LONG ,
 PRIMARY KEY (id)
);

CREATE TABLE transfers(
id_transfer INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
id_sender  INT NOT NULL ,
name_sender VARCHAR(45) NOT NULL,
id_recipient INT NOT NULL ,
name_recipient VARCHAR(45) NOT NULL,
transfer_amount LONG NOT NULL ,
fees INT NOT NULL ,
FOREIGN KEY (id_sender) REFERENCES customers(id) ,
FOREIGN KEY (id_recipient) REFERENCES customers(id) 
);





