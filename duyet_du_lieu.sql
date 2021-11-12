USE quanlybanhang ;

SELECT oID,oDate,oTotalPrice FROM Orderr ;

SELECT Customer.cID, Customer.cNAme,Customer.cAge, Orderr.oID, Orderr.oDate, Orderr.oTotalPrice 
FROM Customer
INNER JOIN Orderr ON Customer.cID = Orderr.cID ;

SELECT  Product.pName 
FROM Product
INNER JOIN OrderDetail ON Product.pID = OrderDetail.pID
GROUP BY  Product.pName ;

SELECT Customer.cID, Customer.cNAme,Customer.cAge
FROM Customer WHERE Customer.cID NOT IN (SELECT Orderr.cID FROM Orderr);


SELECT displayBill.oID, displayBill.oDate,SUM(displayBill.Total) 
FROM
(SELECT Orderr.oID, Orderr.oDate, tableTotalMoney.totalMoney AS Total
FROM Orderr
INNER JOIN (
          SELECT oID,(OrderDetail.odQTY*Product.pPrice) AS totalMoney
          FROM OrderDetail 
          INNER JOIN Product 
          ON Product.pID=OrderDetail.pID) AS tableTotalMoney
ON Orderr.oID = tableTotalMoney.oID) AS displayBill
GROUP BY displayBill.oID, displayBill.oDate
ORDER BY displayBill.oID;



