CREATE DATABASE QLSV;
--
CREATE TABLE KHOA
(Makh char(10) not Null primary key,
Vpkh char(10));
--
CREATE TABLE LOP
(Malop char(10) not Null primary key,
Makh char(10),
foreign key (Makh) references KHOA(Makh));
--
CREATE TABLE SINHVIEN
(Masv char(10)not Null Primary key,
Hosv varchar(30),
Tensv varchar(30),
Dcsv varchar(30),
Loptr varchar(30),
Malop char(10),
foreign key (Malop) references LOP(Malop));
--
CREATE TABLE MONHOC
(Mamh char(10) not Null primary key,
Tenmh varchar(30),
Lythuyet int,
Thuchanh int);
--
CREATE TABLE CTHOC
(Malop char(10)not Null,
Hocky char(10)not Null,
Mamh char(10),
primary key (Malop,Mamh),
foreign key(Mamh) References MONHOC(Mamh));
--
CREATE TABLE DIEMSV
(Masv char(10)not Null,
Mamh char(10) not Null,
Lanthi int,
Diem float ,
primary key (Masv,Mamh),
foreign key(Mamh) References MONHOC(Mamh));
)
--
--1)
SELECT *FROM SINHVIEN;
--2)
SELECT *FROM SINHVIEN WHERE Malop='TH1' ;
--3)
SELECT SINHVIEN.Hosv,SINHVIEN.Tensv , LOP.Makh FROM SINHVIEN,LOP WHERE(SINHVIEN.Malop=LOP.Malop)AND Makh='CNTT'
--4)
SELECT *FROM CTHOC WHERE Malop='TH1' ;
--5)
SELECT A.Diem,A.Lanthi,B.Tenmh,C.Malop 
FROM DIEMSV A,MONHOC B,SINHVIEN C 
WHERE (A.Mamh=B.Mamh)AND(A.Masv=C.Masv) AND Tenmh='CSDL' AND Lanthi=1 AND Malop='TH1';
--6)
SELECT C.Malop,Diem_TB=AVG(Diem),Lanthi,Tenmh 
FROM DIEMSV A,MONHOC B,SINHVIEN C 
WHERE (A.Mamh=B.Mamh)AND(A.Masv=C.Masv) AND Tenmh='CSDL' AND Lanthi=1 AND Malop='TH1' 
GROUP BY Lanthi,Malop,Tenmh
--7)
SELECT Malop , COUNT(Masv) as So_Luong_SV
FROM SINHVIEN
WHERE Malop='TH2'
GROUP BY Malop;
--8)



