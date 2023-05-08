CREATE DATABASE demo_function;
USE demo_function;
-- Tạo bảng
CREATE TABLE product(
proID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
proName VARCHAR(60) NOT NULL,
price DOUBLE DEFAULT 500,
weigth DOUBLE 
);
INSERT INTO product(proID,proName,price,weigth)
VALUES(1,'Gạo hữu cơ',10000,15);
INSERT INTO product(proID,proName,price,weigth)
VALUES(2,'Gạo Tám Thái đỏ',15000,20);
INSERT INTO product(proID,proName,price,weigth)
VALUES(3,'Gạo lứt tím tham ',20000,15);
INSERT INTO product(proID,proName,price,weigth)
VALUES(4,'Gạo nếp cái hoa vàng ',50000,15);
INSERT INTO product(proID,proName,price,weigth)
VALUES(5,' Gạo tám xoan',25000,15);
-- Hàm trung bình cộng giá  AVG()
SELECT AVG(price) FROM demo_funtion.product; 
-- Hàm tính tổng giá  sản phâm
SELECT SUM(price) FROM demo_funtion.product; 
-- Hàm  COUNT đến số lượng sản phẩm 
SELECT COUNT(proID) FROM demo_funtion.product;  
-- Hàm tìm số kg nặng nhất 
SELECT MAX(weigth) FROM demo_funtion.product; 
-- Hàm tìm sản phẩm giá rẻ nhất 
SELECT MIN(price) FROM demo_funtion.product; 
-- Hàm chuyển các chữ thành chữ  hoa 
SELECT UCASE(proName) FROM demo_funtion.product;
-- Hàm chuyên các chữ thành  chữ thường  
SELECT LCASE(proName) FROM demo_funtion.product;
-- Tạo bảng 
CREATE TABLE students(
studentID INT NOT NULL AUTO_INCREMENT  PRIMARY KEY,
studentName VARCHAR(60) NOT NULL,
Age VARCHAR (10),
Addess VARCHAR(225) NOT NULL
);
INSERT INTO students(studentID,studentName,Age,Addess)
VALUES  (1,'Lê Thị Ngọc Ánh',21,'Yên Lập- Phú Thọ ');
INSERT INTO students(studentID,studentName,Age,Addess)
VALUES  (2,'Triệu Thị Chinh ',19 ,'Yên Lập- Phú Thọ ');
INSERT INTO students(studentID,studentName,Age,Addess)
VALUES  (3,'Nguyễn Tiến Công ',21,'Ba Bể- Bắc Kạn ');
INSERT INTO students(studentID,studentName,Age,Addess)
VALUES  (4,'Nguyễn Văn Thành ',31,'Ba Bể- Bắc Kạn ');
INSERT INTO students(studentID,studentName,Age,Addess)
VALUES  (5,'Nguyễn Hải Sơn ',29,'Ba Đình - Hà Nội  ');
CREATE TABLE subject(
subID INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
subName VARCHAR (30) NOT NULL,
program INT DEFAULT 2);
INSERT INTO subject (subID,subName,program)
VALUES (1,'Ngữ Văn',2);
INSERT INTO subject (subID,subName,program)
VALUES (2,'TOÁN',3);
INSERT INTO subject (subID,subName,program)
VALUES (3,'Tiếng Anh',4);
INSERT INTO subject (subID,subName,program)
VALUES (4 ,'Hóa Học',2);
INSERT INTO subject (subID,subName,program)
VALUES (5 ,'Vật lí',1);

CREATE TABLE scores(
scoreID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
className VARCHAR (60) NOT NULL,
studentID INT NOT NULL ,
FOREIGN KEY (studentID) REFERENCES students(studentID),
subID INT NOT NULL,
FOREIGN KEY(subID) REFERENCES subject(subID),
mark INT NOT NULL
);
INSERT INTO scores(scoreID,className,studentID,cubID,mark)
VALUES(1,'10A5',1,1,8),
(2,'10A5',2,1,5),
(3,'10A5',3,1,9),
(4,'10A5',4,1,9),
(5,'10A5',5,1,3),
(6,'10A5',1,2,10),
(7,'10A5',2,2,5),
(8,'10A5',3,2,9),
(9,'10A5',4,2,7),
(10,'10A2',5,3,6),
(11,'10A2',1,4,9);
-- Dùng câu lệnh GROUP BY
SELECT students.studentID,  students.studentName,subject.subName, scores.mark ,SUM(mark)
FROM students JOIN scores  ON students.studentID=scores.studentID
JOIN subject ON scores.subID=subject.subID
GROUP BY studentID,StudentName,subName,mark;

SELECT students.studentID, students.studentName,students.Addess, 
COUNT(Addess) FROM demo_funtion.students
GROUP BY studentID,studentName,Addess;

SELECT students.studentID, students.studentName,students.Addess, scores.mark,
COUNT(Addess)
FROM students JOIN scores ON students.studentID=scores.studentID
GROUP BY studentID,studentName,Addess,mark;

SELECT students.studentID,students.studentName,students.Age,subject.subName,scores.mark,
SUM(Age) AS "Tong"
FROM students JOIN scores ON students.studentID=scores.studentID
JOIN subject ON scores.subID=subject.subID
WHERE subName='Ngữ Văn'
GROUP BY studentID, studentName,Age, subName,mark
HAVING Age>25;

