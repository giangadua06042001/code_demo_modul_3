CREATE DATABASE demo_funtion;
USE demo_funtion;
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
cubID INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
subnName VARCHAR (30) NOT NULL,
program INT DEFAULT 2);
INSERT INTO subject (cubID,subnName,program)
VALUES (1,'Ngữ Văn',2);
INSERT INTO subject (cubID,subnName,program)
VALUES (2,'TOÁN',3);
INSERT INTO subject (cubID,subnName,program)
VALUES (3,'Tiếng Anh',4);
INSERT INTO subject (cubID,subnName,program)
VALUES (4 ,'Hóa Học',2);
INSERT INTO subject (cubID,subnName,program)
VALUES (5 ,'Vật lí',1);

CREATE TABLE sroces(
sroceID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
className VARCHAR (60) NOT NULL,
studentID INT NOT NULL ,
FOREIGN KEY (studentID) REFERENCES students(studentID),
cubID INT NOT NULL,
FOREIGN KEY(cubID) REFERENCES subject(cubID),
mark INT NOT NULL
);
INSERT INTO sroces(sroceID,className,studentID,cubID,mark)
VALUES(1,'10A5',1,1,8);
INSERT INTO sroces(sroceID,className,studentID,cubID,mark)
VALUES(2,'10A5',2,1,5);
INSERT INTO sroces(sroceID,className,studentID,cubID,mark)
VALUES(3,'10A5',3,1,9);
INSERT INTO sroces(sroceID,className,studentID,cubID,mark)
VALUES(4,'10A5',4,1,9);
INSERT INTO sroces(sroceID,className,studentID,cubID,mark)
VALUES(5,'10A5',5,1,3);
INSERT INTO sroces(sroceID,className,studentID,cubID,mark)
VALUES(6,'10A5',1,2,10);
INSERT INTO sroces(sroceID,className,studentID,cubID,mark)
VALUES(7,'10A5',2,2,5);
INSERT INTO sroces(sroceID,className,studentID,cubID,mark)
VALUES(8,'10A5',3,2,9);
INSERT INTO sroces(sroceID,className,studentID,cubID,mark)
VALUES(9,'10A5',4,2,7);
INSERT INTO sroces(sroceID,className,studentID,cubID,mark)
VALUES(10,'10A2',5,3,6);
INSERT INTO sroces(sroceID,className,studentID,cubID,mark)
VALUES(11,'10A2',1,4,9);
SELECT students.studentID,  students.studentName,subject.subnName, sroces.mark ,SUM(mark)
FROM students JOIN sroces  ON students.studentID=sroces.studentID
JOIN subject ON sroces.cubID=subject.cubID
GROUP BY studentID,StudentName,subnName,mark;
SELECT students.studentID, students.studentName,students.Addess, sroces.mark,
COUNT(Addess)
FROM students JOIN sroces ON students.studentID=sroces.studentID
GROUP BY studentID,studentName,Addess,mark;



