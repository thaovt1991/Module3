USE quanlybanhang ;

INSERT INTO Customer
VALUE (1,'Minh Quan', 10),
	(2,'Ngoc Oanh', 20),
    (3,'Hong Ha',50);
    
INSERT INTO Orderr(oID,cID,oDate)
VALUE(1,1,'2006-3-21'),
      (2,2,'2006-3-23'),
      (3,1,'2006-3-16');
 

INSERT INTO Product 
VALUE (1,'May Giat', 3),
(2,'Tu Lanh',5),
(3,'Dieu Hoa',7),
(4,'Quat',1),
(5,'Bep Dien',2) ;   

 INSERT INTO OrderDetail
 VALUE (1,1,3),
 (1,3,7),
 (1,4,2),
 (2,1,1),
 (3,1,8),
 (2,5,4),
 (2,3,3);
 
 
      
      
      
      


      
      
      