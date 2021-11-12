USE QuanLySinhVien;

SELECT * FROM Student ;

SELECT * FROM Student
WHERE Status = true;

SELECT * FROM Subject
WHERE Credit < 10;

SELECT Student.StudentId, Student.StudentName, class.ClassID
FROM Student  
JOIN Class  on Student.ClassId = Class.ClassID;

SELECT S.StudentId, S.StudentName, C.ClassName
FROM Student S
JOIN Class C on S.ClassId = C.ClassID
WHERE C.ClassName = 'A1';

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S 
JOIN Mark M on S.StudentId = M.StudentId 
JOIN Subject Sub on M.SubId = Sub.SubId ;

SELECT S.StudentId, S.StudentName, Sub.SubName, M.Mark
FROM Student S 
JOIN Mark M on S.StudentId = M.StudentId 
JOIN Subject Sub on M.SubId = Sub.SubId
WHERE Sub.SubName = 'CF';