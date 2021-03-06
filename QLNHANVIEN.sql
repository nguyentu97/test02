

--------------------------------------------------BAI TAP CHUONG 3-------------------------------------------------

--3.2)
CREATE TABLE HANG
( MaH char(10) not Null primary key,
TenH varchar(30),
SLTon int);
--
CREATE TABLE KHACH
(MaK char(10) not Null primary key ,
TenK varchar(30),
DiaChi char(10));
--
CREATE TABLE HOADON
(SoHD char(10) not Null primary key,
NgayHD date ,
MaK char(10)
FOREIGN KEY (MaK) REFERENCES KHACH(MaK));
--
CREATE TABLE CHITIETHD
(SoHD char(10) not Null,
MaH char(10)not Null,
SLBan int,
DGia int ,
PRIMARY KEY(SoHD,MaH),
FOREIGN KEY (SoHD) REFERENCES HOADON(SoHD));
--
INSERT INTO HANG VALUES ('M1','H1',3),('M2','H2',7),('M3','H3',1);
--
INSERT INTO KHACH VALUES('K1','A','HN'),('K2','B','HP'),('K3','C','QN');
--
INSERT INTO HOADON VALUES('HD1','1/1/2013','K1'),('HD2','3/5/2016','K2'),('HD3','5/3/2016','K3');
--
INSERT INTO CHITIETHD VALUES('HD1','M1',4,100),('HD2','M2',2,200),('HD3','M3',3,400);
--
DROP TABLE CHITIETHD;
--1)
SELECT TenK ,DiaChi FROM KHACH;
--2)
SELECT TenH ,SLTon FROM HANG;
--3)
SELECT TenH ,SLTon FROM HANG WHERE SLTon>5;
--4)
SELECT TenK ,DiaChi FROM KHACH WHERE DiaChi='HN';
--5)
SELECT KHACH.* FROM KHACH , HOADON WHERE (DAY(NgayHD)=1)and(MONTH(NgayHD)=1)and(YEAR(NgayHD)=2013) and (HOADON.MaK=KHACH.MaK);
--6)
SELECT HANG.MaH,TenH FROM HANG,CHITIETHD WHERE DGia>200 and(CHITIETHD.MaH=HANG.MaH);
--7)
SELECT KHACH.TenK,DiaChi FROM KHACH , HOADON WHERE DiaChi='HP'and(DAY(NgayHD)=5)and(MONTH(NgayHD)=3)and(YEAR(NgayHD)=2016) and (HOADON.MaK=KHACH.MaK);
--8)(ko thuc thi dc)
SELECT HANG.TenH FROM HANG, HOADON WHERE(DAY(NgayHD)=5)and(MONTH(NgayHD)=3)and(YEAR(NgayHD)=2016) and (HOADON.  =HANG.  );
--9)

--10)
SELECT KHACH.MaK FROM KHACH , HOADON WHERE (DAY(NgayHD)=5)and(MONTH(NgayHD)=3)and(YEAR(NgayHD)=2016) and (HOADON.MaK=KHACH.MaK);
                                      
                                      -------------------------------------------

----------------------------------------------BAI TAP THUC HANH CHUONG 4-----------------------------------------------------

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
INSERT INTO NHANVIEN VALUES('NV001','Pham Thi Nhàn','Thư Ký',500,'0001','NV0001'),
						   ('NV002','Hoàng Thanh Vân','Giáo Viên',600,'0001','NV0002'),
						   ('NV003','Hoàng Thi Lan','Giáo Viên',200,'0002','NV0003'),
						   ('NV004','Pham Thi Nhàn','Thư Ký',700,'0003','NV0004');
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
SELECT HoTen , Luong FROM NHANVIEN ORDER BY Luong ASC;
--
SELECT HoTen , Luong FROM NHANVIEN ORDER BY Luong DESC;
--11)Đưa ra HoTen , Luong của nhân viên co Luong<300
SELECT HoTen , Luong FROM NHANVIEN WHERE Luong>300;
--12)Đưa ra HoTen , Luong của nhân viên và làm công việc là Giáo Viên
SELECT HoTen , Luong , CongViec = 'Giáo Viên' FROM NHANVIEN WHERE Luong >300 ;
--13)Đưa ra những nhân viên có Luong hoac 200,300,600
SELECT HoTen , Luong FROM NHANVIEN WHERE Luong=200;
--
SELECT HoTen , Luong FROM NHANVIEN WHERE Luong=300;
--
SELECT HoTen , Luong FROM NHANVIEN WHERE Luong=600;
--14)Đưa ra những nhân viên có Luong trong khoảng 300 ->600
SELECT HoTen , Luong FROM NHANVIEN WHERE Luong>300 and Luong<600 ;
--15)Đưa ra HoTen,CongViec của nhân viên có Họ bắt đầu bằng chũ 'Hoàng'
SELECT HoTen, CongViec FROM NHANVIEN WHERE HoTen like 'L%' and HoTen like'V%';
--16)Đưa ra lương trung bình , lớn nhất , nhỏ nhất của tất cả nhân viên trong bảng nhân viên
SELECT Lương_LN=MAX(Luong),Luong_NN=MIN(Luong),Luong_TB=AVG(Luong) FROM NHANVIEN;
--17)Đưa ra công việc ,lương trung bình của từng loại công việc
SELECT CongViec , Luong=AVG(Luong) FROM NHANVIEN GROUP BY CongViec ;
--18)Đưa công việc , lương trung bình của tất cả nhân viên có Lương>200 theo tưng loại công việc
SELECT CongViec , Luong=AVG(Luong) FROM NHANVIEN GROUP BY CongViec HAVING AVG(Luong)>200;
--19)Đưa ra tổng lương của từng nhóm trong từng đon vị
SELECT MaDV, CongViec, Luong=SUM(Luong) FROM NHANVIEN GROUP BY CongViec, MaDV;
--20)Đua ra nhưng công việc và trung bình lương của các công việc có lương trung bình >=300
SELECT CongViec , Luong=AVG(Luong) FROM NHANVIEN GROUP BY CongViec HAVING AVG(Luong)>=300;
--21)Đưa ra những đơn vị và luong lớn nhất của  các đơn vị có lương lớn nhất >=300
SELECT MaDV , Luong=MAX(Luong) FROM NHANVIEN GROUP BY MaDV HAVING MAX(Luong)>=300;
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
SELECT MaDV , COUNT(*)CongViec FROM NHANVIEN GROUP BY MaDV HAVING COUNT (MaDV)<'0003';
SELECT CongViec , MaDV FROM NHANVIEN WHERE MaDV!='0003';--Hien thi cot o "CongViec" o bang "NHANVIEN"  ten ko trung nhau
--28)Đưa   ra  Hoten,  TenDV,  Congviec,  Luong  của  những  người  có  lương  lớn  hơn  lương trung bình của toàn bộ nhân viên.
SELECT HoTen , TenDV , CongViec , Luong FROM NHANVIEN NV, DONVI DV WHERE
(NV.MaDV=DV.MaDV) and (Luong > SELECT AVG(Luong) FROM NHANVIEN)--29) Đưa ra những nhân viên có lương lớn hơn người có lương lớn nhất trong đơn vị có tên là DHTLSelect HoTen from NHANVIEN where (Luong > select max(Luong) from NHANVIEN,DONVI
where (NHANVIEN.MaDV=DONVI.MaDV) and (DONVI,TenDV='DHTL'))
--
SELECT HoTen , MaDV ,MIN(Luong) FROM NHANVIEN GROUP BY HoTen,MaDV,Luong  ;
