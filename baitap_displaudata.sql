USE quanlysinhvien ;

SELECT * FROM Student 
WHERE Student.StudentName LIKE 'H%' ;

SELECT * FROM Class 
WHERE StartDate LIKE '%-12-%';

SELECT * FROM Subject ;

SELECT * FROM Subject 
WHERE Subject.Credit <= 5 AND Subject.Credit >= 3 ;


UPDATE student 
SET student.ClassID = 2 
WHERE  student.StudentName = 'Hung';

