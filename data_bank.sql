Use  Bank ;

CREATE TABLE customer (
id INT NOT NULL PRIMARY KEY,
nameCur VARCHAR(20) NOT NULL,
email VARCHAR(20) NOT NULL,
phone_number VARCHAR(20) NOT NULL,
blance INT 
);

CREATE TABLE transfer(
id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
sender_id INT NOT NULL,
recipient_id INT NOT NULL,
amount INT NOT NULL,
date_transfers DATETIME NOT NULL ,
FOREIGN KEY (sender_id) REFERENCES customer(id),
FOREIGN KEY (recipient_id) REFERENCES customer(id)
);