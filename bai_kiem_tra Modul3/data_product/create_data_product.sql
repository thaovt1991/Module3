-- CREATE DATABASE manager_products ;
USE manager_products ;

CREATE TABLE categorys(
id INT AUTO_INCREMENT PRIMARY KEY,
name_category VARCHAR(25) unique
);

CREATE TABLE products(
id INT auto_increment PRIMARY KEY,
name_product VARCHAR(45) NOT NULL,
price DOUBLE DEFAULT 0,
quantity INT DEFAULT 0 ,
color VARCHAR(45),
description_product LONGTEXT ,
category VARCHAR(25),
foreign key (category) references categorys(name_category) 
);