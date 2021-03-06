
----------------------------------------------BAI TAP THUC HANH CHUONG 4-----------------------------------------------------

--BAI 1:

CREATE DATABASE QLNHANVIEN ;
--
CREATE TABLE NHANVIEN
(MaNV char(8) not Null primary key , 
HoTen varchar(30),
Congviec varchar(50),
Luong int ,
MaDV char(4),
MaPT char(8));
--
CREATE TABLE DONVI
(MaDV char(4) not Null primary key ,
TenDV varchar(50));
--
CREATE TABLE BACLUONG
(MaBac varchar(50) not Null primary key,
BacCao int,
BacThap int);
--
INSERT INTO NHANVIEN (MaNV,HoTen,Congviec,Luong,MaDV) 
			   VALUES('NV001','Pham Thi Nhàn','Thư Ký',500,'0001'),
					 ('NV002','Hoàng Thanh Vân','Giáo Viên',600,'0001'),
					 ('NV003','Hoàng Thi Lan','Giáo Viên',200,'0002'),
					 ('NV004','Pham Thi Nhàn','Thư Ký',700,'0003');
--6)Dùng câu lệnh truy vấn dữ liệu , đưa ra tất cả thông tin về nhân viên
SELECT * FROM NHANVIEN;
--
DROP TABLE NHANVIEN ;
--
INSERT INTO DONVI VALUES('0001','KHTN'),('0002','DHTL'),('0003','DHQG'); 
--
SELECT * FROM DONVI;
--
DROP TABLE DONVI;
--
INSERT INTO BACLUONG VALUES('1',400,500),('2',501,600),('3',601,800);
--
SELECT * FROM BACLUONG;
--
DROP TABLE BACLUONG;
--7)Đưa ra HoTen , CongViec , Luong của tất cả sinh viên 

SELECT HoTen,CongViec,Luong FROM NHANVIEN;

--8)Đưa ra toàn bộ công việc của nhân viên

SELECT DISTINCT CongViec FROM NHANVIEN;--Hien thi cot o "CongViec" o bang "NHANVIEN"  ten ko trung nhau

--9)Đưa ra HoTen , Luong của tất cả nhân viên , với Luong=Luong*3

SELECT HoTen , Luong = Luong*3 FROM NHANVIEN ;

--10)Đua ra HoTen,Luong sắp sếp theo thứ tự tăng dần/giảm dần cua Luong

SELECT HoTen , Luong 
FROM NHANVIEN 
ORDER BY Luong ASC;
--
SELECT HoTen , Luong 
FROM NHANVIEN 
ORDER BY Luong DESC;

--11)Đưa ra HoTen , Luong của nhân viên co Luong<300

SELECT HoTen , Luong 
FROM NHANVIEN 
WHERE Luong>300;

--12)Đưa ra HoTen , Luong của nhân viên và làm công việc là Giáo Viên

SELECT HoTen , Luong , CongViec = 'Giáo Viên' 
FROM NHANVIEN 
WHERE Luong >300 ;

--13)Đưa ra những nhân viên có Luong hoac 200,300,600

SELECT HoTen , Luong 
FROM NHANVIEN 
WHERE Luong=200;
--
SELECT HoTen , Luong 
FROM NHANVIEN 
WHERE Luong=300;
--
SELECT HoTen , Luong 
FROM NHANVIEN
WHERE Luong=600;

--14)Đưa ra những nhân viên có Luong trong khoảng 300 ->600

SELECT HoTen , Luong 
FROM NHANVIEN 
WHERE Luong>300 and Luong<600 ;

--15)Đưa ra HoTen,CongViec của nhân viên có Họ bắt đầu bằng chũ 'Hoàng'

SELECT HoTen,CongViec 
FROM NHANVIEN 
WHERE HoTen like 'H%'; 

--16)Đưa ra lương trung bình , lớn nhất , nhỏ nhất của tất cả nhân viên trong bảng nhân viên

SELECT Lương_LN=MAX(Luong),Luong_NN=MIN(Luong),Luong_TB=AVG(Luong) FROM NHANVIEN;

--17)Đưa ra công việc ,lương trung bình của từng loại công việc

SELECT CongViec , Luong=AVG(Luong) 
FROM NHANVIEN 
GROUP BY CongViec ;

--18)Đưa công việc , lương trung bình của tất cả nhân viên có Lương>200 theo tưng loại công việc

SELECT CongViec , Luong=AVG(Luong) 
FROM NHANVIEN 
GROUP BY CongViec 
HAVING AVG(Luong)>200;

--19)Đưa ra tổng lương của từng nhóm trong từng đon vị

SELECT MaDV, CongViec, Luong=SUM(Luong) 
FROM NHANVIEN 
GROUP BY CongViec, MaDV;

--20)Đua ra nhưng công việc và trung bình lương của các công việc có lương trung bình >=300

SELECT CongViec , Luong=AVG(Luong) 
FROM NHANVIEN 
GROUP BY CongViec 
HAVING AVG(Luong)>=300;

--21)Đưa ra những đơn vị và luong lớn nhất của  các đơn vị có lương lớn nhất >=300

SELECT MaDV , Luong=MAX(Luong) 
FROM NHANVIEN 
GROUP BY MaDV 
HAVING MAX(Luong)>=300;

--22)Đưa ra Hoten, Congviec, TenDV của tất cả nhân viên

SELECT HoTen, CongViec, TenDV
FROM NHANVIEN NV, DONVI DV
WHERE NV.MaDV= DV.MaDV;

--23)Câu lệnh sau cho kết quả như thế nào

SELECT HoTen, CongViec, TenDV
FROM NHANVIEN NV, DONVI DV
WHERE NV.MaDV= DV.MaDV;

--24) Đưa ra HoTen, Congviec, TenDV, Luong của những nhân viên có Luong>=500

SELECT HoTen, CongViec, TenDV,Luong
FROM NHANVIEN NV, DONVI DV
WHERE NV.MaDV= DV.MaDV and Luong>=500;

--25)Câu lệnh sau cho kết quả như thế nào

SELECT NV.MaNV, NV.Hoten, PT.MaNV, PT.Hoten
FROM NHANVIEN NV, NHANVIEN PT
WHERE (NV.MaNV=PT.MaPT) AND (NV.Luong>PT.Luong);

--27)Đưa  ra  những  công  việc  trong  đơn  vị  1  có  MaDV  là  0001  và  đơn  vị  2  có  MaDV  là 0002

SELECT CongViec , MaDV 
FROM NHANVIEN 
WHERE MaDV!='0003';

--28)Đưa   ra  Hoten,  TenDV,  Congviec,  Luong  của  những  người  có  lương  lớn  hơn  lương trung bình của toàn bộ nhân viên.

SELECT HoTen , TenDV , CongViec , Luong 
FROM NHANVIEN NV, DONVI DV 
WHERE(NV.MaDV=DV.MaDV) and Luong > (SELECT AVG(Luong) FROM NHANVIEN);--29) Đưa ra những nhân viên có lương lớn hơn người có lương lớn nhất trong đơn vị có tên là DHTLSELECT HoTen,CongViec,TenDV,Luong 
FROM  NHANVIEN , DONVI 
WHERE (NHANVIEN.MaDV=DONVI.MaDV)and Luong > (SELECT MAX(Luong) FROM NHANVIEN);

--30)  Đưa ra Hoten, MaDV, Luong của các nhân viên có Luong=Luong thấp nhất trong đơn vị của họ

SELECT HoTen,Luong,MaDV 
FROM NHANVIEN 
WHERE Luong =(SELECT MIN(Luong)FROM NHANVIEN) ;

--31)Đưa ra Hoten, MaDV, Luong của các nhân viên có Luong=Luong thấp nhất trong một đơn vị nào đó

SELECT HoTen, MaDV, Luong
FROM NHANVIEN
WHERE(Luong = (SELECT MIN(Luong) FROM NHANVIEN));

--32) Đưa ra Hoten, Luong của các nhân viên có Luong lớn nhất của đơn vị  có mã đơn vị là 0002

SELECT HoTen, Luong
FROM NHANVIEN
WHERE Luong = (SELECT MAX(Luong) FROM NHANVIEN WHERE MaDV = '0002'); 

--33)  Đưa ra MaDV, AVG(Luong) của đơn vị có trung bình lương lớn hơn lương nhỏ nhất của đơn vị có mã đơn vị là 0003

SELECT MaDV, LuongAVG=AVG(Luong)
FROM NHANVIEN
GROUP BY MaDV
HAVING AVG(Luong) > (SELECT MIN(Luong) FROM NHANVIEN WHERE MaDV = '0001');

                                          ------------------------------------------
                                          
                                          