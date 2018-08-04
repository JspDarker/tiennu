drop  database qlvt
go
create database QLVT
go
use QLVT
go
create table KHACHHANG
(
	MAKH	Nvarchar(5)	primary key,
	TENKH	Nvarchar(30)not null,
	DIACHI	Nvarchar(50),
	DT	Nvarchar(15),
	EMAIL	Nvarchar(30)
)
go
create table VATTU
(
	MAVT	Nvarchar(5)	primary key,
	TENVT	Nvarchar(30)not null,
	DVT	Nvarchar(20),
	GIAMUA	Numeric check(GIAMUA>0),
	SLTON	Numeric check(SLTON>=0)
)
go
create table HOADON
(
	MAHD	Nvarchar(10)	primary key,
	NGAY	DateTime check(NGAY<Getdate()),
	MAKH	Nvarchar(5),
	TONGTG	Numeric
)
go
create table CHITIETHOADON
(
	MAHD	Nvarchar(10)foreign key references HOADON,
	MAVT	Nvarchar(5)foreign key references VATTU,
	SL	Numeric check(SL>0),
	KHUYENMAI	Numeric,
	GIABAN	Numeric,
	primary key (MAHD,MAVT)
)
go

Insert into VATTU(MAVT,TENVT,DVT,GIAMUA,SLTON) values('VT01','XI MANG','BAO',50000,5000)
Insert into VATTU(MAVT,TENVT,DVT,GIAMUA,SLTON) values('VT02','CAT','KHOI',45000,50000)
Insert into VATTU(MAVT,TENVT,DVT,GIAMUA,SLTON) values('VT03','GACH ONG','VIEN',120,800000)
Insert into VATTU(MAVT,TENVT,DVT,GIAMUA,SLTON) values('VT04','GACH THE','VIEN',110,800000)
Insert into VATTU(MAVT,TENVT,DVT,GIAMUA,SLTON) values('VT05','DA LON','KHOI',25000,100000)
Insert into VATTU(MAVT,TENVT,DVT,GIAMUA,SLTON) values('VT06','DA NHO','KHOI',33000,100000)
Insert into VATTU(MAVT,TENVT,DVT,GIAMUA,SLTON) values('VT07','LAM GIO','CAI',15000,50000)

Insert into KHACHHANG(MAKH,TENKH,DIACHI,DT,EMAIL) values('KH01','NGUYEN THI BE','TAN BINH','8457895','bnt@yahoo.com')
Insert into KHACHHANG(MAKH,TENKH,DIACHI,DT,EMAIL) values('KH02','LE HOANG NAM','BINH CHANH','9878987','namlehoang@abc.com.vn')
Insert into KHACHHANG(MAKH,TENKH,DIACHI,DT,EMAIL) values('KH03','TRAN THI CHIEU','TAN BINH','8457895',null)
Insert into KHACHHANG(MAKH,TENKH,DIACHI,DT,EMAIL) values('KH04','MAI THI QUE ANH','BINH CHANH',null,null)
Insert into KHACHHANG(MAKH,TENKH,DIACHI,DT,EMAIL) values('KH05','LE VAN SANG','QUAN 10',null,'sanglv@hcm.vnn.vn')
Insert into KHACHHANG(MAKH,TENKH,DIACHI,DT,EMAIL) values('KH06','TRAN HOANG KHAI','TAN BINH','8457897',null)

Insert into HOADON(MAHD,NGAY,MAKH,TONGTG) values('HD001',convert(DateTime,'12/05/2000',103),'KH01',null)
Insert into HOADON(MAHD,NGAY,MAKH,TONGTG) values('HD002',convert(DateTime,'25/05/2000',103),'KH02',null)
Insert into HOADON(MAHD,NGAY,MAKH,TONGTG) values('HD003',convert(DateTime,'25/05/2000',103),'KH01',null)
Insert into HOADON(MAHD,NGAY,MAKH,TONGTG) values('HD004',convert(DateTime,'25/05/2000',103),'KH04',null)
Insert into HOADON(MAHD,NGAY,MAKH,TONGTG) values('HD005',convert(DateTime,'26/05/2000',103),'KH04',null)
Insert into HOADON(MAHD,NGAY,MAKH,TONGTG) values('HD006',convert(DateTime,'02/06/2000',103),'KH03',null)
Insert into HOADON(MAHD,NGAY,MAKH,TONGTG) values('HD007',convert(DateTime,'22/06/2000',103),'KH04',null)
Insert into HOADON(MAHD,NGAY,MAKH,TONGTG) values('HD008',convert(DateTime,'25/06/2000',103),'KH03',null)
Insert into HOADON(MAHD,NGAY,MAKH,TONGTG) values('HD009',convert(DateTime,'15/08/2000',103),'KH04',null)
--Insert into HOADON(MAHD,NGAY,MAKH,TONGTG) values('HD010',convert(DateTime,'30/09/2000',103),'KH01',null)
Insert into HOADON(MAHD,NGAY,MAKH,TONGTG) values('HD011',convert(DateTime,'27/12/2000',103),'KH06',null)
Insert into HOADON(MAHD,NGAY,MAKH,TONGTG) values('HD012',convert(DateTime,'27/12/2000',103),'KH01',null)

Insert into CHITIETHOADON(MAHD,MAVT,SL,KHUYENMAI,GIABAN) values('HD001','VT01',5,null,52000)
Insert into CHITIETHOADON(MAHD,MAVT,SL,KHUYENMAI,GIABAN) values('HD001','VT05',10,null,30000)
Insert into CHITIETHOADON(MAHD,MAVT,SL,KHUYENMAI,GIABAN) values('HD002','VT03',10000,null,150)
Insert into CHITIETHOADON(MAHD,MAVT,SL,KHUYENMAI,GIABAN) values('HD003','VT02',20,null,55000)
Insert into CHITIETHOADON(MAHD,MAVT,SL,KHUYENMAI,GIABAN) values('HD004','VT03',50000,null,150)
Insert into CHITIETHOADON(MAHD,MAVT,SL,KHUYENMAI,GIABAN) values('HD004','VT04',20000,null,120)
Insert into CHITIETHOADON(MAHD,MAVT,SL,KHUYENMAI,GIABAN) values('HD005','VT05',10,null,30000)
Insert into CHITIETHOADON(MAHD,MAVT,SL,KHUYENMAI,GIABAN) values('HD005','VT06',15,null,35000)
Insert into CHITIETHOADON(MAHD,MAVT,SL,KHUYENMAI,GIABAN) values('HD005','VT07',20,null,17000)
Insert into CHITIETHOADON(MAHD,MAVT,SL,KHUYENMAI,GIABAN) values('HD006','VT04',10000,null,120)
Insert into CHITIETHOADON(MAHD,MAVT,SL,KHUYENMAI,GIABAN) values('HD007','VT04',20000,null,125)
Insert into CHITIETHOADON(MAHD,MAVT,SL,KHUYENMAI,GIABAN) values('HD008','VT01',100,null,55000)
Insert into CHITIETHOADON(MAHD,MAVT,SL,KHUYENMAI,GIABAN) values('HD008','VT02',20,null,47000)
Insert into CHITIETHOADON(MAHD,MAVT,SL,KHUYENMAI,GIABAN) values('HD009','VT02',25,null,48000)
Insert into CHITIETHOADON(MAHD,MAVT,SL,KHUYENMAI,GIABAN) values('HD010','VT01',25,null,57000)
Insert into CHITIETHOADON(MAHD,MAVT,SL,KHUYENMAI,GIABAN) values('HD011','VT01',20,null,55000)
Insert into CHITIETHOADON(MAHD,MAVT,SL,KHUYENMAI,GIABAN) values('HD011','VT02',20,null,45000)
Insert into CHITIETHOADON(MAHD,MAVT,SL,KHUYENMAI,GIABAN) values('HD012','VT01',20,null,55000)
Insert into CHITIETHOADON(MAHD,MAVT,SL,KHUYENMAI,GIABAN) values('HD012','VT02',10,null,48000)
Insert into CHITIETHOADON(MAHD,MAVT,SL,KHUYENMAI,GIABAN) values('HD012','VT03',10000,null,150)


--1.	Hieån danh saùch taát caû caùc khaùch haøng goàm maõ khaùch haøng, teân khaùch haøng, ñòa chæ, ñieän thoaïi, 
--vaø ñòa chæ E-mail.

create view v1
as
select *
from KHACHHANG
go
select * from v1


--2.	Hieån danh saùch caùc khaùch haøng coù ñòa chæ laø “TAN BINH” goàm maõ khaùch haøng, teân khaùch haøng, 
--ñòa chæ, ñieän thoaïi, vaø ñòa chæ E-mail.

create view v2
as
select *
from KHACHHANG
where DIACHI = 'TAN BINH'
go
select * from v2

--3.	Hieån danh saùch caùc khaùch haøng coù ñòa chæ laø “BINH CHANH” goàm maõ khaùch haøng, teân khaùch haøng,
-- ñòa chæ, ñieän thoaïi, vaø ñòa chæ E-mail.

create view v3
as
select *
from KHACHHANG
where DIACHI = 'BINH CHANH'
go
select * from v3

--4.	Hieån danh saùch caùc khaùch haøng goàm caùc thoâng tin maõ khaùch haøng, teân khaùch haøng, ñòa chæ vaø
-- ñòa chæ E-mail cuûa nhöõng khaùch haøng chöa coù soá ñieän thoaïi

create view v4
as
select *
from KHACHHANG
where DT is null
go 
select * from v4


--5.	Hieån danh saùch caùc khaùch haøng chöa coù soá ñieän thoaïi vaø cuõng chöa coù ñòa chæ Email goàm 
--maõ khaùch haøng, teân khaùch haøng, ñòa chæ.

create view v5
as
select *
from KHACHHANG
where DT is null and EMAIL is null
go 
select * from v5

--6.	Hieån danh saùch caùc khaùch haøng ñaõ coù soá ñieän thoaïi vaø ñòa chæ E-mail goàm maõ khaùch haøng,
-- teân khaùch haøng, ñòa chæ, ñieän thoaïi, vaø ñòa chæ E-mail.

create view v6
as
select *
from KHACHHANG
where DT is not null and EMAIL is not null
go
select * from v6

--7.	Hieån danh saùch taát caû caùc vaät tö goàm maõ vaät tö, teân vaät tö, ñôn vò tính vaø giaù mua.

create view v7
as
select *
from VATTU
go
select * from v7

--8.	Hieån danh saùch caùc vaät tö coù ñôn vò tính laø “CAI” goàm maõ vaät tö, teân vaät tö vaø giaù mua.

create view v8
as
select *
from VATTU
where DVT = 'CAI'
go
select * from v8

--9.	Hieån danh saùch caùc vaät tö goàm maõ vaät tö, teân vaät tö, ñôn vò tính vaø giaù mua maø coù giaù mua treân 25000.

create view v9
as
select *
from VATTU
where GIAMUA > 25000
go
select * from v9

--10.	Hieån danh saùch caùc vaät tö laø “GAÏCH” (bao goàm caùc loaïi gaïch) goàm maõ vaät tö, teân vaät tö,
-- ñôn vò tính vaø giaù mua . 

create view v10
as
select *
from VATTU
where TENVT like 'GACH%'
go
select * from v10

--11.	Hieån danh saùch caùc vaät tö goàm maõ vaät tö, teân vaät tö, ñôn vò tính vaø giaù mua maø coù giaù mua 
--naèm trong khoaûng töø 20000 ñeán 40000.

create view v11
as
select *
from VATTU
where GIAMUA between 20000 and 40000
go
select * from v11

--12.	Taïo query ñeå laáy ra caùc thoâng tin goàm 
--Maõ hoaù ñôn, ngaøy laäp hoaù ñôn, teân khaùch haøng, ñòa chæ khaùch haøng vaø soá ñieän thoaïi.

create view v12
as
select a.MAHD, a.NGAY, b.TENKH, b.DIACHI, b.DT
from HOADON a, KHACHHANG b 
go
select * from v12

--13.	Taïo query ñeå laáy ra caùc thoâng tin goàm 
--Maõ hoaù ñôn, teân khaùch haøng, ñòa chæ khaùch haøng vaø soá ñieän thoaïi cuûa ngaøy 25/5/2000.
set DATEFORMAT DMY
alter view v13
as
select a.MAHD, a.NGAY, b.TENKH, b.DIACHI, b.DT
from HOADON a, KHACHHANG b 
where a.MAKH= b.MAKH and NGAY = '25/5/2000'
go
select * from v13

--14.	Taïo query ñeå laáy ra caùc thoâng tin goàm 
--Maõ hoaù ñôn, ngaøy laäp hoaù ñôn, teân khaùch haøng, ñòa chæ khaùch haøng vaø soá ñieän thoaïi cuûa
-- nhöõng hoaù ñôn trong thaùng 6/2000.

create view v14
as
select a.MAHD, a.NGAY, b.TENKH, b.DIACHI, b.DT
from HOADON a, KHACHHANG b
where a.MAKH = b.MAKH and month(NGAY)= 6 and year(NGAY)=2000
go  
select * from v14

--15.	Taïo query ñeå laáy ra caùc thoâng tin goàm 
--Maõ hoaù ñôn, ngaøy laäp hoaù ñôn, teân khaùch haøng, ñòa chæ khaùch haøng vaø soá ñieän thoaïi.

create view v15
as
select a.MAHD, a.NGAY, b.TENKH, b.DIACHI, b.DT
from HOADON a, KHACHHANG b 
go
select * from v15

--16.	Laáy ra danh saùch nhöõng khaùch haøng (teân khaùch haøng, ñòa chæ, soá ñieän thoaïi) 
--ñaõ mua haøng trong thaùng 6/2000.

alter  view v16
as
select a.NGAY, b.TENKH, b.DIACHI, b.DT
from HOADON a, KHACHHANG b
where a.MAKH = b.MAKH and month(NGAY)= 6 and year(NGAY)=2000
go  
select * from v16


--17.	Laáy ra danh saùch nhöõng khaùch haøng khoâng mua haøng trong thaùng 6/2000 
--goàm caùc thoâng tin teân khaùch haøng, ñòa chæ, soá ñieän thoaïi.

alter  view v17
as
select * 
from KHACHHANG
where TENKH not in
(select b.TENKH
from HOADON a, KHACHHANG b
where a.MAKH = b.MAKH and month(NGAY)= 6 and year(NGAY)=2000)
go  
select * from v17

--18.	Taïo query ñeå laáy ra caùc thoâng tin goàm 
--caùc thoâng tin maõ hoùa ñôn, ,maõ vaät tö, teân vaät tö, ñôn vò tính, giaù baùn, giaù mua, soá löôïng , 
--trò giaù mua (giaù mua * soá löôïng), trò giaù baùn , ( giaù baùn * soá löôïng).

create view v18
as
select a.MAHD, b.MAVT, b.TENVT, b.DVT,a.GIABAN,b.GIAMUA,a.SL,a.SL * b.GIAMUA as trigiamua, a.GIABAN * a.SL as trigiaban 
from CHITIETHOADON a, VATTU b
where a.MAVT = b.MAVT
go
select * from v18

--19.	Taïo query ñeå laáy ra caùc chi tieát hoaù ñôn goàm 
--caùc thoâng tin maõ hoùa ñôn, ,maõ vaät tö, teân vaät tö, ñôn vò tính, giaù baùn, giaù mua, soá löôïng , 
--trò giaù mua (giaù mua * soá löôïng), trò giaù baùn , ( giaù baùn * soá löôïng) maø coù giaù baùn lôùn hôn hoaëc baèng giaù mua.

create view v19
as
select a.MAHD, b.MAVT, b.TENVT, b.DVT,a.GIABAN,b.GIAMUA,a.SL,a.SL * b.GIAMUA as trigiamua, a.GIABAN * a.SL as trigiaban,
from CHITIETHOADON a, VATTU b
where a.MAVT = b.MAVT and a.GIABAN >= b.GIAMUA
go
select * from v19

--20.	Taïo query ñeå laáy ra caùc thoâng tin goàm 
--maõ hoùa ñôn, ,maõ vaät tö, teân vaät tö, ñôn vò tính, giaù baùn, giaù mua, soá löôïng , trò giaù mua (giaù mua * soá löôïng),
--trò giaù baùn , ( giaù baùn * soá löôïng) vaø 
--coät khuyeán maõi vôùi khuyeán maõi 10% cho nhöõng maët haøng baùn trong moät hoùa ñôn lôn hôn 100.

create view v20
as
select a.MAHD, b.MAVT, b.TENVT, b.DVT,a.GIABAN,b.GIAMUA,a.SL,a.SL * b.GIAMUA as trigiamua, a.GIABAN * a.SL as trigiaban,  'KHUYENMAI'=
case 
	when (a.SL > 100) then '10%'
	else '0%'
end
from CHITIETHOADON a, VATTU b
where a.MAVT = b.MAVT
go
select * from v20

--21.	Tìm ra nhöõng maët haøng chöa baùn ñöôïc.

alter view v21
as
select MAVT, TENVT
from VATTU
where MAVT not in (select MAVT from CHITIETHOADON)
go
select * from v21

--22.	Taïo baûng toång hôïp goàm caùc thoâng tin: 
--maõ hoùa ñôn, ngaøy hoaù ñôn, teân khaùch haøng, ñòa chæ, soá ñieän thoaïi, teân vaät tö, ñôn vò tính, giaù mua, giaù baùn, 
--soá löôïng, trò giaù mua, trò giaù baùn. 

create view v22
as
select a.MAHD, a.NGAY, b.TENKH, b.DIACHI, b.DT,c.TENVT,c.DVT, c.GIAMUA,
d.GIABAN,d.SL,d.SL * c.GIAMUA as trigiamua, d.GIABAN * d.SL as trigiaban
from HOADON a, KHACHHANG b, VATTU c, CHITIETHOADON d
where d.MAHD=a.MAHD and b.MAKH=a.MAKH and c.MAVT=d.MAVT
go
select * from v22
--23.	Taïo baûng toång hôïp cuûa thaùng 5/2000 goàm caùc thoâng tin:
-- maõ hoùa ñôn, ngaøy hoaù ñôn, teân khaùch haøng, ñòa chæ, soá ñieän thoaïi, teân vaät tö, ñôn vò tính, giaù mua, giaù baùn, 
 --soá löôïng, trò giaù mua, trò giaù baùn. 

create view v23
as
select a.MAHD, a.NGAY, b.TENKH, b.DIACHI, b.DT,c.TENVT,c.DVT, c.GIAMUA,
d.GIABAN,d.SL,d.SL * c.GIAMUA as trigiamua, d.GIABAN * d.SL as trigiaban
from HOADON a, KHACHHANG b, VATTU c, CHITIETHOADON d
where d.MAHD=a.MAHD and b.MAKH=a.MAKH and c.MAVT=d.MAVT and month(NGAY)= 5 and year(NGAY)=2000
go
select * from v23
 
--24.	Taïo baûng toång hôïp cuûa thaùng 6/2000 goàm caùc thoâng tin: 
--maõ hoùa ñôn, ngaøy hoaù ñôn, teân khaùch haøng, ñòa chæ, soá ñieän thoaïi, teân vaät tö, ñôn vò tính, giaù mua, giaù baùn, 
--soá löôïng, trò giaù mua, trò giaù baùn. 

create view v24
as
select a.MAHD, a.NGAY, b.TENKH, b.DIACHI, b.DT,c.TENVT,c.DVT, c.GIAMUA,
d.GIABAN,d.SL,d.SL * c.GIAMUA as trigiamua, d.GIABAN * d.SL as trigiaban
from HOADON a, KHACHHANG b, VATTU c, CHITIETHOADON d
where d.MAHD=a.MAHD and b.MAKH=a.MAKH and c.MAVT=d.MAVT and month(NGAY)= 6 and year(NGAY)=2000
go
select * from v24

--25.	Taïo baûng toång hôïp cuûa quyù 1 naêm 2000 goàm caùc thoâng tin: 
--maõ hoùa ñôn, ngaøy hoaù ñôn, teân khaùch haøng, ñòa chæ, soá ñieän thoaïi, teân vaät tö, ñôn vò tính, giaù mua, giaù baùn, 
--soá löôïng, trò giaù mua, trò giaù baùn. 

alter view v25
as
select a.MAHD, a.NGAY, b.TENKH, b.DIACHI, b.DT,c.TENVT,c.DVT, c.GIAMUA,
d.GIABAN,d.SL,d.SL * c.GIAMUA as trigiamua, d.GIABAN * d.SL as trigiaban
from HOADON a, KHACHHANG b, VATTU c, CHITIETHOADON d
where d.MAHD=a.MAHD and b.MAKH=a.MAKH and c.MAVT=d.MAVT and month(NGAY)<=3 and year(NGAY)=2000
go
select * from v25

--26.	Laáy ra danh saùch caùc hoaù ñôn goàm caùc thoâng tin: 
--Soá hoaù ñôn, ngaøy, teân khaùch haøng, ñòa chæ khaùch haøng, toång trò giaù cuûa hoaù ñôn.

create view v26
as
select a.MAHD, a.NGAY, b.TENKH, b.DIACHI, TONGTG = SUM(SL * GIABAN)
from HOADON a, KHACHHANG b, CHITIETHOADON c
where c.MAHD=a.MAHD and b.MAKH=a.MAKH
group by a.MAHD, NGAY, TENKH, DIACHI
go
select * from v26

--27.	Laáy ra hoaù ñôn coù toång trò giaù lôùn nhaát goàm caùc thoâng tin: 
--Soá hoaù ñôn, ngaøy, teân khaùch haøng, ñòa chæ khaùch haøng, toång trò giaù cuûa hoaù ñôn.

create view v027
as
select top 1 a.MAHD, a.NGAY, b.TENKH, b.DIACHI, TONGTG = sum(SL * c.GIABAN)
from HOADON a, KHACHHANG b, CHITIETHOADON c
where c.MAHD=a.MAHD and b.MAKH=a.MAKH
group by a.MAHD, NGAY, TENKH, DIACHI
order by sum(SL* GIABAN)desc
go
select * from v027

--28.	Laáy ra hoaù ñôn coù toång trò giaù lôùn nhaát trong thaùng 5/2000 goàm caùc thoâng tin: 
--Soá hoaù ñôn, ngaøy, teân khaùch haøng, ñòa chæ khaùch haøng, toång trò giaù cuûa hoaù ñôn.

create view v28
as
select top 1 a.MAHD, a.NGAY, b.TENKH, b.DIACHI, TONGTG = sum(SL * c.GIABAN)
from HOADON a, KHACHHANG b, CHITIETHOADON c
where c.MAHD=a.MAHD and b.MAKH=a.MAKH and month(NGAY)= 5 and year(NGAY)=2000
group by a.MAHD, NGAY, TENKH, DIACHI
order by sum(SL* GIABAN)desc
go
select * from v28

--29.	Laáy ra hoaù ñôn coù toång trò giaù nhoû nhaát goàm caùc thoâng tin: 
--Soá hoaù ñôn, ngaøy, teân khaùch haøng, ñòa chæ khaùch haøng, toång trò giaù cuûa hoaù ñôn.

create view v29
as
select top 1 a.MAHD, a.NGAY, b.TENKH, b.DIACHI, TONGTG = sum(SL * c.GIABAN)
from HOADON a, KHACHHANG b, CHITIETHOADON c
where c.MAHD=a.MAHD and b.MAKH=a.MAKH
group by a.MAHD, NGAY, TENKH, DIACHI
order by sum(SL* GIABAN)
go
select * from v29

--30.	Ñeám xem moãi khaùch haøng coù bao nhieâu hoaù ñôn.

create view v30
as
select a.MAKH,TENKH,SOHOADON = count(MAHD)
from HOADON a, KHACHHANG b
where a.MAKH=b.MAKH
group by a.MAKH, TENKH
go
select * from v30

--31.	Laáy ra caùc thoâng tin cuûa khaùch haøng coù soá löôïng hoaù ñôn mua haøng nhieàu nhaát.

create view v31
as
select top 1 a.MAKH,TENKH,DIACHI,DT,EMAIL,SOHOADON = count(MAHD)
from HOADON a, KHACHHANG b
where a.MAKH=b.MAKH
group by a.MAKH, TENKH,DIACHI,DT,EMAIL
order by count(MAHD) desc
go
select * from v31


--32.	Laáy ra caùc thoâng tin cuûa khaùch haøng coù soá löôïng haøng mua nhieàu nhaát.
alter view v32
as
select top 1 a.MAKH,TENKH,DIACHI,DT,EMAIL,SOLUONGHANG = sum(SL)
from HOADON a, KHACHHANG b,CHITIETHOADON c
where a.MAKH=b.MAKH and a.MAHD=c.MAHD
group by a.MAKH, TENKH,DIACHI,DT,EMAIL
order by sum(SL) desc
go
select * from v32

--33.	Laáy ra caùc thoâng tin veà caùc maët haøng maø ñöôïc baùn trong nhieàu hoaù ñôn nhaát.

create view v33
as
select top 1 a.MAVT,TENVT,DVT,GIAMUA,SLTON
from CHITIETHOADON a, VATTU b
where a.MAVT=b.MAVT
group by a.MAVT,TENVT,DVT,GIAMUA,SLTON
order by count(MAHD) desc
go
select * from v33

--34.	Laáy ra caùc thoâng tin veà caùc maët haøng maø ñöôïc baùn nhieàu nhaát.

create view v34
as
select top 1 a.MAVT,TENVT,DVT,GIAMUA,SLTON
from CHITIETHOADON a, VATTU b
where a.MAVT=b.MAVT
group by a.MAVT,TENVT,DVT,GIAMUA,SLTON
order by count(SL) desc
go
select * from v34

--35.	Laáy ra danh saùch taát caû caùc khaùch haøng goàm Maõ khaùch haøng, teân khaùch haøng, ñòa chæ , soá löôïng hoaù ñôn ñaõ mua (neáu khaùch haøng ñoù chöa mua haøng thì coät soá löôïng hoaù ñôn ñeå troáng)

create view v035
as
select a.MAKH,TENKH,DIACHI,SOLUONGHD=case
when count(MAHD)<>0 then count(MAHD)
else null
end
from KHACHHANG a left join HOADON  b on (a.MAKH=b.MAKH)
group by a.MAKH,TENKH,DIACHI
go
select * from v035

--Function
--1.	Vieát  haøm tính doanh thu cuaû naêm.. vôùi naêm laø tham soá truyeàn  vaøo.

create function f1(@nam int)
returns bigint
as
begin 
	declare @dt bigint
	set @dt= (select sum(sl*giaban) from hoadon a, chitiethoadon b
	where a.mahd=b.mahd and year(ngay)=@nam)
	return @dt
	end
	go
	select 'doanh thu cua nam 2000' =dbo.f1(2000)

--2.	Vieát  haøm tính doanh thu cuaû thaùng .. vôùi thaùng laø tham soá truyeàn  vaøo.

create function f002(@thang int)
returns bigint
as
begin 
	declare @dt bigint
	set @dt= (select sum(sl*giaban) from hoadon a, chitiethoadon b
	where a.mahd=b.mahd and month(ngay)=@thang)
	return @dt
	end
	go
	select 'doanh thu cua thang 5' =dbo.f002(5)

--3.	Vieát haøm tính doanh thu cuûa khaùch haøng vôùi  maõ khaùch haøng laø tham soá truyeàn vaøo.

create function f03(@makh1 nvarchar(10))
returns bigint 
as
	begin
		declare @dt bigint
		set @dt= (select sum(sl*giaban) from hoadon a, chitiethoadon b, khachhang d
		where a.mahd=b.mahd and a.makh=@makh1)
		return @dt
		end
		go
		select 'doanh thu KH04' =dbo.f03 ('KH04')

--4.	Vieát haøm tính toång soá löôïng baùn ñöôïc cho töøng maët haøng theo thaùng vôùi  maõ haøng vaø thaøng nhaäp vaøo,
--  neáu thaùng khoâng nhaäp vaøo töùc laø tính taát caû caùc thaùng.

create function f4(@thang int, @mamh nvarchar(10))
returns @mathang table (mavt nvarchar(20)primary key, tenvt nvarchar(20),tongluong bigint)
as
	begin
		if(@thang is null)
		insert into @mathang select a.mavt,tenvt,sum(sl)
											from vattu a, chitiethoadon b
											where a.mavt=@mamh and a.mavt=b.mavt
											group by a.mavt, tenvt
		
		else
		insert into @mathang select a.mavt, tenvt,sum(sl)
											from vattu a, chitiethoadon b,hoadon c
											where a.mavt=@mamh and a.mavt=b.mavt and b.mahd=c.mahd and month(ngay)=@thang
											group by a.mavt, tenvt
		return
		end
		go
		select * from dbo.f4 (5,'VT04')


--5.	Vieát haøm tính laõi ((giaù baùn – tröø giaù mua )* sloá löôïng baùn ñöôïc ) cho töøng maët haøng, vôùi maõ maët haøng laø tham soá truyeàn vaøo. Neáu maõ maët haøng khoâng truyeàn vaøo thì tính cho taát caû caùc maët haøng.

--Procedure
--1.	Laáy ra danh caùc khaùch haøng ñaõ mua haøng trong ngaøy [ngaøy]…. Vôùi [ngaøy] laø tham soá truyeàn vaøo.



--2.	Laáy ra danh saùch 5 khaùch haøng  coù toång trò giaù caùc ñôn haøng lôùn nhaát.

--create proc p2
--as
--begin
	--select top 5 a.makh=

--3.	Laáy ra danh saùch 10 maët haøng coù soá löôïng baùn lôùn nhaát.
--4.	Laáy ra danh saùch 10 maët haøng baùn ra coù laõi 1t nhaát.
--5.	Tính giaù trò cho coät khuyeán maõi nhö sau: Khuyeán maõi 5% neáu SL >100, 10% neáu SL>500.

create proc p3 @ngay int, @mcr cursor varying output
as
	begin
		set @mcr=cursor scroll static
		for
			select a.makh,tenkh,ngay
				from khachhang a, hoadon b
				where a.makh=b.makh and day(ngay)=@ngay
		open @mcr
	end
	
declare @mr cursor
exec p3 25, @mcr=@mr output
fetch first from @mr
while (@@FETCH_STATUS=0)
begin
	fetch next from @mr
end
close @mr
deallocate @mr
--6.	Tính soá laïi soá löôïng toàn cho taát caû caùc maët haøng. (SLTON = SLTON – toång sl baùn ñöôïc)
--7.	Tính trò giaù cho moãi hoaù ñôn.
--8.	Taïo ra table KH_VIP coù caáu truùc gioáng vôùi caáu truùc table KHACHHANG. Löu caùc khaùch haøng coù toång trò giaù cuûa taát caû caùc ñôn haøng >=10000000 vaøo table KH_VIP.

--Trigger


--2.	Khoâng cho pheùp cascade delete trong caùc raèng buoäc khoaù ngoaïi. Ví duï khoâng cho pheùp xoaù caùc CTHOADON naøo coù SOHD coøn trong table HOADON
--3.	khoâng cho pheùp user nhaäp vaøo hai vaät tö coù cuøng teân.

create  Trigger T3 on vattu
for insert,update
as
begin
	if(count(mavt) from vattu group by tenvt)>=2
	inserted i where i.tenvt=v.tenvt)
	begin
		print'Khong cho phep trung ten'
		rollback tran
	end
end

--4.	Khi user ñaët haøng thì KHUYENMAI laø 5% neáu SL >100, 10% neáu SL >500.
--5.	Chæ cho pheùp mua caùc maët  haøng coù soá löôïng toàn lôùn hôn hoaëc baèng soá löôïng caàn mua vaø tính laïi soá löôïng toàn moãi khi coù ñôn haøng.
--6.	Khoâng cho pheùp user xoaù moät luùc nhieàu hôn moät vaät tö.
create trigger t6 on khachhang
for delete
as
	if(select count(*)from delete)>=2
	begin print'Khong cho xoa nhieu hon 1 vat tu'
--7.	Chæ baùn maët haøng GAÏCH (caùc laoïi gaïcg) vôùi soá löôïng laø boäi soá cuûa 100.
