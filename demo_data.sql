USE Bank ;


SELECT ts.id, ts.name_sender,ts.email_sender, numberPhone_sender,money_sender ,date_transfer,
customer.nameCur,customer.email,customer.phone_number
FROM customer
INNER JOIN 
(SELECT transfer.id AS id , 
customer.nameCur AS name_sender  , 
customer.email AS email_sender ,
customer.phone_number AS numberPhone_sender,
transfer.amount AS money_sender ,
transfer.date_transfers AS date_transfer,
transfer.recipient_id AS id_recipient
FROM (customer 
INNER JOIN transfer ON customer.id = transfer.sender_id) ) AS ts
ON customer.id = ts.id_recipient 
ORDER BY ts.id;



SELECT customer.id , customer.nameCur , customer.blance - SUM(temp.money_sender) FROM customer
INNER JOIN 
(SELECT ts.id, ts.name_sender AS name_sender ,ts.email_sender, numberPhone_sender,money_sender ,date_transfer,
customer.nameCur,customer.email,customer.phone_number
FROM customer
INNER JOIN 
(SELECT transfer.id AS id , 
customer.nameCur AS name_sender  , 
customer.email AS email_sender ,
customer.phone_number AS numberPhone_sender,
transfer.amount AS money_sender ,
transfer.date_transfers AS date_transfer,
transfer.recipient_id AS id_recipient
FROM (customer 
INNER JOIN transfer ON customer.id = transfer.sender_id) ) AS ts
ON customer.id = ts.id_recipient 
ORDER BY ts.id) AS temp
ON customer.nameCur = temp.name_sender
GROUP BY customer.id;

