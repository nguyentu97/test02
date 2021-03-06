
------------------------------------------------------BAI TAP CHUONG 4----------------------------------------------------
--BAI 4.1)

--1)Tạo tất cả các bảng 

CREATE DATABASE QLChuyenDi
--
CREATE TABLE DIADIEM
(MaDD int primary key,
TenDD nvarchar(50))
--
CREATE TABLE XE
(BienSoXe nvarchar(50) primary key, 
KhachToiDa int )
--
CREATE TABLE HUONGDV
(MaHDV int primary key ,
TenHDV nvarchar(50),
DiaChiHDV nvarchar(50))
--
CREATE TABLE CHUYENDI
(MaCD int primary key,
TenCD nvarchar(50),
NgayDi date ,
NgayVe date,
SoKhachDuKien int) 
--
CREATE TABLE CHITIETCD
(MaCD int,
MaDD int,
SoNgayLuuLai int,
primary key(MaCD,MaDD))
--
CREATE TABLE HUONGDAN
(MaCD int ,
MaHDV int,
primary key (MaCD,MaHDV))
--
CREATE TABLE KHACH
(MaCD int,
TenK nvarchar(50),
Tuoi int,
DiaChiK nvarchar(50),
SDTK nvarchar(15),
primary key(MaCD,SDTK))
--
CREATE TABLE XEPHUCVU
(MaCD int ,
BienSoXe nvarchar(50),
primary key(MaCD,BienSoXe))

--2)Cho biết danh sách các hướng dẫn viên của công ty

SELECT * FROM HUONGDV

--3)Liệt kê đầy đủ thông tin về các điểm du lịch liên kết với công ty.

SELECT * FROM DIADIEM,CHITIETCD 
WHERE (DIADIEM.MaDD=CHITIETCD.MaDD)

--4)Cho biết đầy đủ thông tin về các địa điểm mà chuyến đi mã số CD2000 đi qua

SELECT * FROM DIADIEM,CHITIETCD 
WHERE (DIADIEM.MaDD=CHITIETCD.MaDD)AND CHITIETCD.MaCD=1

--5)Liệt kê các lữ khách của chuyến đi CD2000

SELECT KHACH.TenK 
FROM KHACH 
WHERE KHACH.MaCD=1
--
SELECT KHACH.TenK 
FROM KHACH,CHUYENDI 
WHERE KHACH.MaCD=CHUYENDI.MaCD AND KHACH.MaCD=1
--
SELECT DISTINCT KHACH.TenK 
FROM KHACH,CHITIETCD 
WHERE KHACH.MaCD=CHITIETCD.MaCD AND KHACH.MaCD=1

--6)Cho biết số lượng khách của chuyến đi CD1999.

SELECT count(*) AS SLK 
FROM KHACH 
WHERE KHACH.MaCD=5

--7)Chuyến đi nào có số lượng khách lớn hơn số lượng dự kiến.

SELECT KHACH.MaCD,CHUYENDI.SoKhachDuKien,count(*) AS SLK  
FROM KHACH,CHUYENDI WHERE (KHACH.MaCD=CHUYENDI.MaCD) 
GROUP BY KHACH.MaCD,CHUYENDI.SoKhachDuKien
HAVING SoKhachDuKien<count(*)

--8)Cho biết tổng số lượng khách của tất cả các chuyến đi có ngày khởi hành trong tháng 12/2001

SELECT count(*) AS TongKhach 
FROM KHACH,CHUYENDI 
WHERE (KHACH.MaCD=CHUYENDI.MaCD)AND(month(NgayDi)=2) and (year(NgayDi)=2013)

--9)Cho biết số  ngày lưu lại trung bình, số  ngày lưu lại lớn nhất, nhỏ  nhất qua các điểm du lịch của chuyến đi CD2000

SELECT MIN(CHITIETCD.SoNgayLuuLai)AS NhoNhat ,MAX(CHITIETCD.SoNgayLuuLai) AS LonNhat, AVG(CHITIETCD.SoNgayLuuLai) AS TB
FROM CHITIETCD 
WHERE CHITIETCD.MaCD=1

--10)Cho biết số lượng xe phục vụ cho chuyến đi CD2000

SELECT count(*) AS SoXePV 
FROM XEPHUCVU 
WHERE XEPHUCVU.MaCD=2

--11)Điểm du lịch nào(Mã số, tên) có số ngày lưu lại lớn nhất của chuyến đi CD2000

SELECT * FROM DIADIEM 
WHERE DIADIEM.MaDD in(SELECT CHITIETCD.MaCD FROM CHITIETCD WHERE CHITIETCD.SoNgayLuuLai=(SELECT MAX(CHITIETCD.SoNgayLuuLai) FROM CHITIETCD WHERE CHITIETCD.MaCD=1) AND CHITIETCD.MaCD=1)
--
SELECT TOP 1 DIADIEM.MaDD,DIADIEM.TenDD  
FROM DIADIEM,CHITIETCD 
WHERE DIADIEM.MaDD=CHITIETCD.MaDD AND CHITIETCD.MaCD=1 
ORDER BY SoNgayLuuLai DESC

--12)Điểm du lịch nào(Mã số, tên) có số  ngày lưu lại lớn hơn số  ngày lưu lại trung bình qua các  điểm của chuyến đi CD2000

SELECT * FROM DIADIEM 
WHERE DIADIEM.MaDD in (SELECT CHITIETCD.MaDD FROM CHITIETCD WHERE CHITIETCD.SoNgayLuuLai > (select AVG(CHITIETCD.SoNgayLuuLai) FROM CHITIETCD where CHITIETCD.MaCD=1))

--13)Điểm du lịch SaPa(mã số  SP) có bao nhiêu chuyến đi ghé qua và khai thác được bao nhiêu ngày(tổng số ngày phục vụ)

SELECT count(*) AS SCD ,SUM(CHITIETCD.SoNgayLuuLai) AS TongNLL 
FROM CHITIETCD 
WHERE CHITIETCD.MaCD=1

--14)Liệt kê 3 điểm du lịch đầu tiên của chuyến đi CD2000 có số ngày lưu lại lớn nhất

SELECT TOP 3 TenDD 
FROM DIADIEM 
WHERE DIADIEM.MaDD in(SELECT C1.MaDD FROM CHITIETCD C1 where (SELECT count(*) FROM CHITIETCD where C1.SoNgayLuuLai<SoNgayLuuLai )<3 AND C1.MaCD=1)

--15)Liệt kê 3 điểm du lịch đầu tiên của chuyến đi CD2000 có số ngày lưu lại ít nhất.

SELECT * FROM DIADIEM where DIADIEM.MaDD in(
SELECT C1.MaDD FROM CHITIETCD C1 WHERE (SELECT count(*) FROM CHITIETCD WHERE C1.SoNgayLuuLai>SoNgayLuuLai )<3 AND C1.MaCD=1)

--16)Liệt kê các điểm du lịch của chuyến đi CD2000 ngoại trừ điểm có số ngày lưu ít nhất

SELECT * FROM CHITIETCD
--
SELECT * FROM DIADIEM where DIADIEM.MaDD  in (select CHITIETCD.MaDD FROM CHITIETCD WHERE CHITIETCD.MaCD=2 AND CHITIETCD.SoNgayLuuLai !=(SELECT MIN(CHITIETCD.SoNgayLuuLai) FROM CHITIETCD WHERE  CHITIETCD.MaCD=2) )

--17)Cho biết số  lượng các điểm du lịch, tổng  số  ngày lưu lại tại các địa điểm, số lượng các hướng dẫn viên, số lượng xe phụ vụ cho từng chuyến đi có ngày khởi hành trong tháng 12/2000

SELECT count(*) AS SoDD,SUM(CHITIETCD.SoNgayLuuLai) AS TongNgayLL ,count(*) AS SLHDV,count(*) SLXe
FROM ((CHITIETCD inner join CHUYENDI on CHUYENDI.MaCD=CHITIETCD.MaCD) inner join HUONGDAN on HUONGDAN.MaCD=CHUYENDI.MaCD)
inner join XEPHUCVU on XEPHUCVU.MaCD=HUONGDAN.MaCD
WHERE (month(NgayDi)=2) and (year(NgayDi)=2013)

--18)Chuyến đi nào (đầy đủ thông tin) có số lượng khách nhiều nhất.

SELECT TOP 1 KHACH.MaCD AS ma,count(*) AS SL FROM KHACH
GROUP BY KHACH.MaCD
ORDER BY count(*) DESC

--19) liệt kê các chuyến đi, ngoại trừ chuyến đi điều động xe ít nhất.

SELECT * FROM (DIADIEM inner join CHITIETCD on CHITIETCD.MaDD=DIADIEM.MaDD)
inner join CHUYENDI on CHUYENDI.MaCD=CHITIETCD.MaCD WHERE CHITIETCD.MaCD in (SELECT K1.MaCD FROM KHACH  K1 
GROUP BY K1.MaCD 
HAVING COUNT(*) >= ALL(SELECT COUNT(*) FROM KHACH GROUP BY KHACH.MaCD ))

--20)Hướng dẫn viên nào chưa từng tham gia hướng dẫn

SELECT * FROM HUONGDV
SELECT * FROM HUONGDV WHERE HUONGDV.MaHDV in (SELECT HUONGDV.MaHDV FROM HUONGDV
EXCEPT 
SELECT HUONGDAN.MaHDV FROM	 HUONGDAN )
SELECT* FROM HUONGDV WHERE HUONGDV.MaHDV in (SELECT HUONGDV.MaHDV FROM HUONGDV 
WHERE HUONGDV.MaHDV not in (SELECT HUONGDAN.MaHDV FROM HUONGDAN)  )

											-----------------------------------