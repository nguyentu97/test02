
------------------------------------------------------BAI TAP CHUONG 4----------------------------------------------------

--BAI 4.2)

CREATE DATABASE CONGCHUCVIENCHUC;
--
CREATE TABLE DONVI
(MaDV char(10) not Null primary key ,
TenDV char(10),
Loai char (10));
--
CREATE TABLE LOAIDONVI
(Loai char (10),
TenLoaiHinh char (10));
--
CREATE TABLE NGACHCBVC
(Ngach char(10),
TenNgach char(10));
--
CREATE TABLE NGACHBACLUONG 
(Ngach char(10),
Bac int,
HeSoLuong int);
--
DROP TABLE NGACHBACLUONG;
--
CREATE TABLE CBVC
(MaDV char (10),
MaCC char(10)not Null PRIMARY KEY,
HoTen char(10),
GioiTinh char(10),
NgaySinh date,
Ngach char(10),
Bac int,
NgayXep date,
FOREIGN KEY (MaDV) REFERENCES DONVI(MaDV));
--
DROP TABLE CBVC;
--
--1) Cho danh sách CBVC theo thứ tự Alphabet của tên của các CBVC.

SELECT*FROM CBVC 
ORDER BY HoTen;

--2) Cho danh sách CBVC có hệ số lương từ 3.0 trở lên

SELECT HoTen,HeSoLuong  
FROM CBVC CB,NGACHBACLUONG NG
WHERE(CB.Ngach=NG.Ngach) AND (CB.Bac=NG.Bac) AND HeSoLuong>3;
 
--3) Cho biết tổng hệ số lương của từng đơn vị

SELECT MaDV,TongHeSoLuong=SUM(HeSoLuong)
FROM CBVC CB,NGACHBACLUONG NG
WHERE(CB.Ngach=NG.Ngach) AND (CB.Bac=NG.Bac)
GROUP BY MaDV;

--4) Cho danh sách CBVC thuộc các đơn vị mà tên có chữ "phòng"

SELECT * FROM CBVC 
WHERE MaDV='PHÒNG%';

--5) Cho danh sách CBVC thuộc các đơn vị có tên loại hình tổ chức là "hành chinh"

SELECT HoTen ,TenLoaiHinh 
FROM CBVC A , DONVI B ,LOAIDONVI C
WHERE(A.MaDV=B.MaDV) AND (B.Loai=C.Loai) AND TenLoaiHinh ='HÀNH CHÍNH' ;

--6) Cho danh sách CBVC thuộc ngạch "cán sự" có bậc 7 trở lên, hoặc những người có hệ số lương lơn hơn 3.06

SELECT A.HoTen , A.Ngach , A.Bac ,B.HeSoLuong  
FROM CBVC A,NGACHBACLUONG B
WHERE(A.Ngach=B.Ngach)AND(A.Bac=B.Bac)AND A.Ngach ='CÁN SỰ' AND A.Bac>7 OR HeSoLuong > 3.06;

--7) Cho danh sách CBVC (mà) có thời hạn xếp lương tính đến cuối năm 1998 là 3 năm trở lên đối với các ngạch chuyên viên và chuyên viên chính; hoặc 2 năm trở  lên đối với các ngạch còn lại.  (Đây là danh sách CBVC đến hạn nâng lương trong năm 1998).

--8) Cho danh sách các CBVC có hệ  số  lương cao hơn hệ  số  lương của những người thuộc ngạch "cán sự".

SELECT HoTen , HeSoLuong
FROM CBVC A,NGACHBACLUONG B
WHERE(A.Ngach=B.Ngach) AND (A.Bac=B.Bac) AND HeSoLuong>(SELECT HeSoLuong FROM NGACHBACLUONG WHERE Ngach='CÁN SỰ' );

											-----------------------------------