USE QuanLySinhVien ;

SELECT Address, COUNT(StudentId) AS 'Số lượng học viên'
FROM Student
GROUP BY Address;

SELECT S.StudentId,S.StudentName, AVG(Mark)
FROM Student S 
JOIN Mark M ON S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName ;


SELECT S.StudentId,S.StudentName, AVG(Mark)
FROM Student S JOIN Mark M ON S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) > 11;


SELECT S.StudentId, S.StudentName, AVG(Mark)
FROM Student S 
JOIN Mark M ON S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName
HAVING AVG(Mark) >= ALL (SELECT AVG(Mark) FROM Mark GROUP BY Mark.StudentId);

SELECT s.SubId, s.SubName, s.Credit, s.Status 
FROM SubjectSv s
INNER JOIN 
(SELECT MAX(Credit) AS maxCr FROM SubjectSv ) AS max
ON s.Credit = max.maxCr ;


SELECT s.SubId, s.SubName, s.Credit, s.Status , tempTableM.maxP
FROM SubjectSv s
INNER JOIN
(SELECT m.SubId AS SubId, maxM.maxMark AS maxP
FROM Mark m
INNER JOIN 
(SELECT MAX(Mark) AS maxMark FROM Mark ) AS maxM
ON m.Mark = maxM.maxMark 
) AS tempTableM
ON tempTableM.SubId = s.SubId;

SELECT S.StudentId,S.StudentName, AVG(Mark) 
FROM Student S 
JOIN Mark M ON S.StudentId = M.StudentId
GROUP BY S.StudentId, S.StudentName 
ORDER BY AVG(Mark) DESC;



