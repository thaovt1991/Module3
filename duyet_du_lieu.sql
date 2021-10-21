USE quanlybanhang ;

SELECT oID,oDate,oTotalPrice FROM orderr ;

SELECT customer.cID, customer.cNAme,customer.cAge, orderr.oID, orderr.oDate, orderr.oTotalPrice 
FROM customer
INNER JOIN orderr ON customer.cID = orderr.cID 
GROUP BY (customer.cID) ; 

SELECT  product.pName 
FROM product
INNER JOIN orderdetail ON product.pID = orderdetail.pID
GROUP BY  product.pName ;

SELECT customer.cID, customer.cNAme,customer.cAge
FROM customer WHERE customer.cID NOT IN (SELECT orderr.cID FROM orderr);





(SELECT displayBill.oID, displayBill.oDate,SUM(displayBill.Total) 
FROM
(SELECT orderr.oID, orderr.oDate, tableTotalMoney.totalMoney AS Total
FROM orderr
INNER JOIN (SELECT oID,(orderdetail.odQTY*product.pPrice) AS totalMoney
FROM orderdetail 
INNER JOIN product on product.pID=orderdetail.pID) AS tableTotalMoney
ON orderr.oID = tableTotalMoney.oID) AS displayBill
GROUP BY displayBill.oID, displayBill.oDate)



