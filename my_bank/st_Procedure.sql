USE MyBank ; 

-- Gui tien--
DELIMITER //
CREATE PROCEDURE st_deposits(
IN 
idCustomerDeposits INT,
amountDeposits INT ,
date_Deposits DATETIME
)
BEGIN
INSERT INTO Deposits(idCustomer , amount, dateDepoints)
VALUES(idCustomerDeposits,amountDeposits, date_Deposits);
UPDATE Customers C
SET C.blance = C.blance + amountDeposits 
WHERE C.idCustomer = idCustomerDeposits ;
END //
DELIMITER ;

CALL st_deposits(1,2000000,'2021-10-29');
SELECT * FROM Customers ;
SELECT* FROM Deposits ;


-- Rut tien---
DELIMITER //
CREATE PROCEDURE st_withdraws(
IN 
idCustomerWithdraws INT,
amountWithdraws INT ,
date_Withdraws DATETIME
)
BEGIN
    DECLARE blance_current INT DEFAULT 0;
    SELECT Customers.blance INTO blance_current
    FROM Customers
    WHERE idCustomerWithdraws =  Customers.idCustomer ;
	IF amountWithdraws <= blance_current 
      THEN
		  INSERT INTO Withdraws(idCustomer , amount, dateWithdraws)
		  VALUES(idCustomerWithdraws,amountWithdraws, date_Withdraws);
		  UPDATE Customers C
          SET C.blance = C.blance - amountWithdraws 
	      WHERE C.idCustomer = idCustomerWithdraws ;
	END IF; 
END //
DELIMITER ;

CALL st_withdraws(1,300000,'2021-10-29') ;
SELECT * FROM Customers ;
SELECT* FROM Withdraws ;

-- Chuyen tien--
DELIMITER //
CREATE PROCEDURE st_transfers(
IN
idSenderNew INT,
idRecipientNew INT ,
amount_transfer INT ,
date_transfersNew DATETIME )
BEGIN
    DECLARE blance_current INT DEFAULT 0;
    SELECT Customers.blance INTO blance_current
    FROM Customers
    WHERE idSenderNew =  Customers.idCustomer ;
    IF  (amount_transfer*110/100) <= blance_current 
       THEN 
          UPDATE Customers Sender 
          SET Sender.blance = Sender.blance - (amount_transfer*110/100)
	      WHERE Sender.idCustomer = idSenderNew ;
          UPDATE Customers Recipient 
          SET Recipient.blance = Recipient.blance + amount_transfer 
	      WHERE Recipient.idCustomer = idRecipientNew ;
          INSERT INTO Transfers(idSender, idRecipient,amount,date_transfers)
          VALUE(idSenderNew,idRecipientNew,amount_transfer,date_transfersNew);
    END IF ;
END //
DELIMITER ;

CALL st_transfers(2,1,3000000,'2021-10-29') ;
CALL st_transfers(1,3,5000000,'2021-10-29') ;
SELECT * FROM Customers ;
SELECT* FROM Transfers ;


-- Hien thi lich su giao dich--
SELECT 
      ts.id ,
	  ts.idSender ,
      sd.nameCustomer,
      ts.idRecipient,
      rp.nameCustomer,
      ts.amount,
      ts.date_transfers
FROM Transfers ts
INNER JOIN Customers sd 
ON ts.idSender = sd.idCustomer 
INNER JOIN Customers rp 
ON ts.idRecipient = rp.idCustomer ;

















