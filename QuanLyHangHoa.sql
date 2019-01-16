CREATE TABLE HANG    -- Tao Bang HANG
(Mah char(5)not Null primary key,--Khoa Chinh
Tenh varchar(30),
Slton int);
--
CREATE TABLE KHACH   -- Tao Bang KHACH
(Mak char(10) not Null
primary key,--Khoa Chinh
Tenk varchar(30),
Diachi varchar(50),
Dienthoai varchar(12)
default '0',-- Gia Tri Mac Dinh
constraint UN_Ten_DC -- DK Rang Buoc
unique(TenK,Diachi));
--
CREATE TABLE HOADON	 -- Tao Bang HOADON
(Sohd char(5) not Null primary key,--Khoa chinh
ngayhd date,
mak char(10),
foreign Key (mak)References khach(mak)); -- Khoa Ngoai
--
CREATE TABLE CHITIETHD -- Tao Bang CHITIETHD
(Sohd char(5) not Null,
mah char(5) not Null,
slban int,
Primary Key (sohd,mah), -- Khoa chinh
foreign Key(sohd)References hoadon(sohd), -- Khoa Ngoai 
check(slban>=0));
--
Insert  Into HANG Values('M1','H1',1),('M2','H2',2),('M3','H3',3);--Dua gia tri vao bang "HANG"
--
Select * From HANG; -- Hien Thi Bang "HANG"
--
DROP TABLE HANG; -- Xoa Bang "HANG"
--
Insert Into KHACH Values('k1','A','HN','0246779'),-- Dua gia tri vao bang "KHACH" 
						('k2','B','HP','7116413'),('k3','A','QN','956123');
--
Select * From KHACH ; -- Hien thi Bang "KHACH"
--
SELECT Diachi FROM KHACH ORDER BY 1  ASC ;
--
DROP TABLE KHACH; -- Xoa bang "KHACH"
--
Insert Into HOADON Values('HD1','1/12/2017','K1'),--("Mak" phai giong o bang "KHACH")
						('HD2','2/12/2017','K2'),('HD3','3/12/2017','K3');--(ngay phai viet dang "month/day/year")
--
Select * From HOADON;--Hien thi bang "HOADON"
--
DROP TABLE HOADON;-- Xoa bang "HOADON"
--
Insert Into CHITIETHD Values('HD1','H1',1),('HD2','H2',2),
							('HD3','H3',3);--("Sohd","mah" phai giong voi"HOADON","HANG")
--
Select *From CHITIETHD; --Hien thi bang "CHITIETHD"
--
DROP TABLE CHITIETHD;-- Xoa Bang "CHITIETHD"
--
ALTER TABLE KHACH ADD Gioitinh char (10);--Them cot "Gioitinh" vao bang "KHACH"
--
ALTER TABLE KHACH DROP COLUMN Gioitinh;-- Xoa cot "Gioi Tinh" o Bang "KHACH"
--
ALTER TABLE HANG ALTER COLUMN Slton char(10);-- Sua kieu du lieu o cot "Slton" thanh kieu "char"
--
SELECT Mak , Tenk , Diachi , Dienthoai INTO KHDC3 FROM KHACH WHERE Diachi = 'QN';--Tao mot bang moi "KHDC3" lay nhung khach hang o "DC3" ra 1 bang moi
--
SELECT * FROM KHDC3;--Hien thi Bang Moi "KHDC3" voi cac khah o "DC3"
--
DROP TABLE KHDC3;
--
UPDATE HANG SET Slton=Slton+2;-- sua cac gia tri o cot "Slton" cong(+) them 2 don vi
--
DELETE FROM HANG WHERE Slton = '3';--Xoa 1 bo trong "Mah" voi  Slton=3"
--
SELECT Slton FROM HANG ;-- Chi hien thi cot "Slton" o bang "HANG"
--
SELECT DISTINCT Tenh FROM HANG;--Hien thi cot o "Tenh" o bang "HANG"  ten ko trung nhau
--
SELECT Mah,So_luong_ton=Slton*10 FROM HANG;--(??ko hien ten cot)Moi gia tri trong cot "Slton" nhan (*) them voi 10
--
SELECT Tenh AS Ten_hang_hoa FROM HANG ;-- Doi ten cua cac cot trong "BANG"
--
SELECT TOP 2 Mah FROM HANG;-- Dua ra 2 "Mah" dau tien trong bang"HANG"(chi dua ra cot "Mah")
--
SELECT * FROM HANG WHERE Slton>=2; -- Hien Thi bang "HANG" voi "Slton>=2"(nho hon 2 thi ko hien thi)
--
SELECT * FROM KHACH WHERE Diachi = 'Q%';
--
SELECT*FROM KHACH , HOADON WHERE (month(ngayhd)=3)and (year(ngayhd)=2017)
and (HOADON.mak=KHACH.Mak);--hien thi thong tin khach "KHACH" và "HOADON" hang mua hang 3/2017 (thang 3 nam 2017)(khoa chinh cua "KHACH" la khoa ngoai cua "HOADON")
--
SELECT KHACH.* FROM KHACH , HOADON WHERE (month(ngayhd)=3)and (year(ngayhd)=2017)
and (HOADON.mak=KHACH.Mak);--hien thi thong tin khach "KHACH" hang mua hang 3/2017 (thang 3 nam 2017)(khoa chinh cua "KHACH" la khoa ngoai cua "HOADON")
--
SELECT Diachi as Tinh ,COUNT(*) AS SL_KHACH FROM KHACH GROUP by Diachi;
--
SELECT mak , COUNT(mak) as so_lan_mua FROM HOADON group by Mak having COUNT(Mak)>2;
--
SELECT Mak,COUNT(mak) as So_Lan_Mua from HOADON where (MONTH(ngayhd)=2)and year(ngayhd)=2010
group by Mak 
Having count(Mak)>10;
--
SELECT Sohd , SUM(Slban)as so_luong_ban from CHITIETHD group by Sohd;
--
select * from KHACH left outer join HOADON on KHACH.Mak=HOADON.Mak;
--




