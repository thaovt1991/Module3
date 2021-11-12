USE QuanLySinhVien ;

SELECT * FROM Student 
WHERE Student.StudentName LIKE 'H%' ;

SELECT * FROM Class 
WHERE StartDate LIKE '%-12-%';

SELECT * FROM SubjectSv ;

SELECT * FROM SubjectSv 
WHERE SubjectSv.Credit <= 5 AND SubjectSv.Credit >= 3 ;
-- WHERE SubjectSv.Credit BETWEEN 3 AND 5;


UPDATE Student 
SET Student.ClassID = 2 
WHERE  Student.StudentName = 'Hung';

SELECT * FROM
(SELECT S.StudentName , temp.SbName, temp.Mark AS mark
FROM Student S
INNER JOIN
(SELECT SB.SubName AS SbName , 
         M.StudentId AS StudentId,
         M.Mark AS Mark
FROM Mark M
INNER JOIN SubjectSv SB
ON SB.SubId = M.SubId ) AS temp
ON temp.StudentId = S.StudentId 
ORDER BY S.StudentName 
)AS search
ORDER BY  search.mark DESC;


SELECT * FROM
(SELECT S.StudentName , Sb.SubName, M.Mark AS Mark
FROM Mark M 
INNER JOIN Student S ON M.StudentId = S.StudentId 
INNER JOIN SubjectSv Sb ON Sb.SubId = M.SubId 
ORDER BY S.StudentName ) AS toName
ORDER BY toName.Mark DESC 
;










