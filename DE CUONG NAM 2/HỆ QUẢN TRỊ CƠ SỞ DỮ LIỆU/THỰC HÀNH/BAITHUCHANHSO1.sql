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
Insert into HOADON(MAHD,NGAY,MAKH,TONGTG) values('HD010',convert(DateTime,'30/09/2000',103),'KH01',null)
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

--VIEW

--1.	Hieån danh saùch taát caû caùc khaùch haøng goàm maõ khaùch haøng, teân khaùch haøng, ñòa chæ, ñieän thoaïi, vaø ñòa chæ E-mail.
create view v1
as
	select * from khachhang
go
	select * from v1
	
--2.	Hieån danh saùch caùc khaùch haøng coù ñòa chæ laø “TAN BINH” goàm maõ khaùch haøng, teân khaùch haøng, ñòa chæ, ñieän thoaïi, 
--vaø ñòa chæ E-mail.
create view v2
as
	select * from khachhang
	where diachi='TAN BINH'
go
	select * from v2
	
--3.	Hieån danh saùch caùc khaùch haøng coù ñòa chæ laø “BINH CHANH” goàm maõ khaùch haøng, teân khaùch haøng, ñòa chæ, ñieän thoaïi,
 --vaø ñòa chæ E-mail.
create view v3
as
	select * from khachhang
	where diachi='BINH CHANH'
go
	select * from v3
	
--4.	Hieån danh saùch caùc khaùch haøng goàm caùc thoâng tin maõ khaùch haøng, teân khaùch haøng, ñòa chæ vaø ñòa chæ E-mail cuûa nhöõng 
--khaùch haøng chöa coù soá ñieän thoaïi
create view v4
as
	select MAKH,TENKH,DIACHI,EMAIL
	from khachhang a
	where dt is null
go
	select * from v4
	
--5.	Hieån danh saùch caùc khaùch haøng chöa coù soá ñieän thoaïi vaø cuõng chöa coù ñòa chæ Email goàm maõ khaùch haøng, 
--teân khaùch haøng, ñòa chæ.
create view v5
as
	select MAKH,TENKH,DIACHI
	from khachhang
	where dt is null and email is null
go
	select * from v5
	
--6.	Hieån danh saùch caùc khaùch haøng ñaõ coù soá ñieän thoaïi vaø ñòa chæ E-mail goàm maõ khaùch haøng, teân khaùch haøng, 
--ñòa chæ, ñieän thoaïi, vaø ñòa chæ E-mail.
create view v6
as
	select MAKH,TENKH,DIACHI
	from khachhang
	where not(dt is null) and not(email is null)
go
	select * from v6
	
--7.	Hieån danh saùch taát caû caùc vaät tö goàm maõ vaät tö, teân vaät tö, ñôn vò tính vaø giaù mua.
create view v7
as
	select * from vattu
go
	select * from v7
	
--8.	Hieån danh saùch caùc vaät tö coù ñôn vò tính laø “CAI” goàm maõ vaät tö, teân vaät tö vaø giaù mua.
create view v8
as
	select * from vattu
	where dvt='CAI'
go
	select * from v8
	
--9.	Hieån danh saùch caùc vaät tö goàm maõ vaät tö, teân vaät tö, ñôn vò tính vaø giaù mua maø coù giaù mua treân 25000.
create view v9
as
	select MAVT,TENVT,DVT,GIAMUA from vattu
	where giamua>25000
go
	select * from v9
	
--10.	Hieån danh saùch caùc vaät tö laø “GAÏCH” (bao goàm caùc loaïi gaïch) goàm maõ vaät tö, teân vaät tö, ñôn vò tính vaø giaù mua . 
create view v10
as
	select MAVT,TENVT,DVT,GIAMUA from vattu
	where tenvt like 'GACH%'
go
	select * from v10
	
--11.	Hieån danh saùch caùc vaät tö goàm maõ vaät tö, teân vaät tö, ñôn vò tính vaø giaù mua maø coù giaù mua naèm trong khoaûng 
--töø 20000 ñeán 40000.
create view v11
as
	select MAVT,TENVT,DVT,GIAMUA
	from vattu
	where giamua>=20000 and giamua<=40000
go
	select * from v11
	
--12.	Taïo query ñeå laáy ra caùc thoâng tin goàm Maõ hoaù ñôn, ngaøy laäp hoaù ñôn, teân khaùch haøng, ñòa chæ khaùch haøng vaø soá ñieän thoaïi.
create view v12
as
	select MAHD,NGAY,TENKH,DIACHI,DT
	from hoadon a,khachhang b
	where a.makh=b.makh
go
	select * from v12
	
--13.	Taïo query ñeå laáy ra caùc thoâng tin goàm Maõ hoaù ñôn, teân khaùch haøng, ñòa chæ khaùch haøng vaø soá ñieän thoaïi cuûa ngaøy 25/5/2000.
set dateformat DMY
create view v13
as
	select MAHD,TENKH,DIACHI,DT
	from khachhang a,hoadon b
	where a.makh=b.makh and ngay='25/5/2000'
go
	select * from v13
	
--14.	Taïo query ñeå laáy ra caùc thoâng tin goàm Maõ hoaù ñôn, ngaøy laäp hoaù ñôn, teân khaùch haøng, ñòa chæ khaùch haøng vaø soá ñieän thoaïi
-- cuûa nhöõng hoaù ñôn trong thaùng 6/2000.
create view v14
as
	select MAHD,NGAY,TENKH,DIACHI,DT
	from khachhang a,hoadon b
	where a.makh=b.makh and month(ngay)=6 and year(ngay)=2000
go
	select * from v14
	
--15.	Taïo query ñeå laáy ra caùc thoâng tin goàm Maõ hoaù ñôn, ngaøy laäp hoaù ñôn, teân khaùch haøng, ñòa chæ khaùch haøng vaø soá ñieän thoaïi.
create view v15
as
	select MAHD,NGAY,TENKH,DIACHI,DT
	from hoadon a,khachhang b
	where a.makh=b.makh
go
	select * from v15
	
--16.	Laáy ra danh saùch nhöõng khaùch haøng (teân khaùch haøng, ñòa chæ, soá ñieän thoaïi) ñaõ mua haøng trong thaùng 6/2000.
create view v16
as
	select TENKH,DIACHI,DT
	from khachhang a,hoadon b
	where a.makh=b.makh and month(ngay)=6 and year(ngay)=2000
go
	select * from v16
	
--17.	Laáy ra danh saùch nhöõng khaùch haøng khoâng mua haøng trong thaùng 6/2000 goàm caùc thoâng tin teân khaùch haøng, ñòa chæ, 
--soá ñieän thoaïi.
create view v17
as
	select TENKH,DIACHI,DT
	from khachhang a,hoadon b
	where a.makh=b.makh and month(ngay)<>6 and year(ngay)=2000
go
	select * from v17
	
--18.	Taïo query ñeå laáy ra caùc thoâng tin goàm caùc thoâng tin maõ hoùa ñôn, ,maõ vaät tö, teân vaät tö, ñôn vò tính, giaù baùn, giaù mua, 
--soá löôïng , trò giaù mua (giaù mua * soá löôïng), trò giaù baùn , ( giaù baùn * soá löôïng).
create view v18
as
	select a.MAHD,b.MAVT,TENVT,DVT,GIABAN,GIAMUA,SL,TRIGIAMUA=SL*GIAMUA,TRIGIABAN=SL*GIABAN
	from hoadon a, chitiethoadon b, vattu c
	where a.mahd=b.mahd and b.mavt=c.mavt
go
	select * from v18
	
--19.	Taïo query ñeå laáy ra caùc chi tieát hoaù ñôn goàm caùc thoâng tin maõ hoùa ñôn, ,maõ vaät tö, teân vaät tö, ñôn vò tính, giaù baùn, 
--giaù mua, soá löôïng , trò giaù mua (giaù mua * soá löôïng), trò giaù baùn , ( giaù baùn * soá löôïng) maø coù giaù baùn lôùn hôn hoaëc baèng giaù mua.
create view v19
as
	select a.MAHD,b.MAVT,TENVT,DVT,GIABAN,GIAMUA,SL,TRIGIAMUA=SL*GIAMUA,TRIGIABAN=SL*GIABAN
	from hoadon a, chitiethoadon b, vattu c
	where a.mahd=b.mahd and b.mavt=c.mavt and giaban>=giamua
go
	select * from v19
	
--20.	Taïo query ñeå laáy ra caùc thoâng tin goàm maõ hoùa ñôn, ,maõ vaät tö, teân vaät tö, ñôn vò tính, giaù baùn, giaù mua, soá löôïng , 
--trò giaù mua (giaù mua * soá löôïng), trò giaù baùn , ( giaù baùn * soá löôïng) vaø coät khuyeán maõi vôùi khuyeán maõi 10% cho nhöõng maët haøng 
--baùn trong moät hoùa ñôn lôn hôn 100.
create view v20
as
	select a.MAHD,b.MAVT,TENVT,DVT,GIABAN,GIAMUA,SL,TRIGIAMUA=SL*GIAMUA,TRIGIABAN=SL*GIABAN,
				KHUYENMAI=case
												when sl>100 then 0.1*sl*giaban
												else 0
											end
	from hoadon a, chitiethoadon b, vattu c
	where a.mahd=b.mahd and b.mavt=c.mavt and giaban>=giamua
go
	select * from v20
	
--21.	Tìm ra nhöõng maët haøng chöa baùn ñöôïc.
create view v21
as
	select MAVT, TENVT
	from vattu 
	where mavt not in (select mavt from chitiethoadon)
go 
select * from V21

--22.	Taïo baûng toång hôïp goàm caùc thoâng tin: maõ hoùa ñôn, ngaøy hoaù ñôn, teân khaùch haøng, ñòa chæ, soá ñieän thoaïi, teân vaät tö, 
--ñôn vò tính, giaù mua, giaù baùn, soá löôïng, trò giaù mua, trò giaù baùn. 
create view v22
as
	select a.MAHD,NGAY,TENKH,DIACHI,DT,d.TENVT,DVT,GIAMUA,GIABAN,SL,TRIGIAMUA=SL*GIAMUA,
				TRIGIABAN=SL*GIABAN
	from hoadon a, chitiethoadon b, khachhang c, vattu d
	where a.mahd=b.mahd and a.makh=c.makh and b.mavt=d.mavt
go
	select * from v22
	
--23.	Taïo baûng toång hôïp cuûa thaùng 5/2000 goàm caùc thoâng tin: maõ hoùa ñôn, ngaøy hoaù ñôn, teân khaùch haøng, ñòa chæ, soá ñieän thoaïi, 
--teân vaät tö, ñôn vò tính, giaù mua, giaù baùn, soá löôïng, trò giaù mua, trò giaù baùn. 
create view v23
as
	select a.MAHD,NGAY,TENKH,DIACHI,DT,d.TENVT,DVT,GIAMUA,GIABAN,SL,TRIGIAMUA=SL*GIAMUA,
				TRIGIABAN=SL*GIABAN
	from hoadon a, chitiethoadon b, khachhang c, vattu d
	where a.mahd=b.mahd and a.makh=c.makh and b.mavt=d.mavt and month(ngay)=5 and year(ngay)=2000
go
	select * from v23
	
--24.	Taïo baûng toång hôïp cuûa thaùng 6/2000 goàm caùc thoâng tin: maõ hoùa ñôn, ngaøy hoaù ñôn, teân khaùch haøng, ñòa chæ, soá ñieän thoaïi, 
--teân vaät tö, ñôn vò tính, giaù mua, giaù baùn, soá löôïng, trò giaù mua, trò giaù baùn. 
create view v24
as
	select a.MAHD,NGAY,TENKH,DIACHI,DT,d.TENVT,DVT,GIAMUA,GIABAN,SL,TRIGIAMUA=SL*GIAMUA,
				TRIGIABAN=SL*GIABAN
	from hoadon a, chitiethoadon b, khachhang c, vattu d
	where a.mahd=b.mahd and a.makh=c.makh and b.mavt=d.mavt and month(ngay)=6 and year(ngay)=2000
go
	select * from v24
	
--25.	Taïo baûng toång hôïp cuûa quyù 1 naêm 2000 goàm caùc thoâng tin: maõ hoùa ñôn, ngaøy hoaù ñôn, teân khaùch haøng, ñòa chæ, 
--soá ñieän thoaïi, teân vaät tö, ñôn vò tính, giaù mua, giaù baùn, soá löôïng, trò giaù mua, trò giaù baùn. 
create view v25
as
	select a.MAHD,NGAY,TENKH,DIACHI,DT,d.TENVT,DVT,GIAMUA,GIABAN,SL,TRIGIAMUA=SL*GIAMUA,
				TRIGIABAN=SL*GIABAN
	from hoadon a, chitiethoadon b, khachhang c, vattu d
	where a.mahd=b.mahd and a.makh=c.makh and b.mavt=d.mavt and month(ngay)=1 or month(ngay)=2 
				or month(ngay)=3 and year(ngay)=2000
go
	select * from v25
	
--26.	Laáy ra danh saùch caùc hoaù ñôn goàm caùc thoâng tin: Soá hoaù ñôn, ngaøy, teân khaùch haøng, ñòa chæ khaùch haøng, toång trò giaù cuûa hoaù ñôn.
create view v26
as
	select a.MAHD,NGAY,TENKH,DIACHI,TONGTRIGIA=sum(SL*GIABAN)
	from hoadon a, chitiethoadon b, khachhang c
	where a.mahd=b.mahd and a.makh=c.makh
	group by a.MAHD,NGAY,TENKH,DIACHI
go
	select * from v26
	
--27.	Laáy ra hoaù ñôn coù toång trò giaù lôùn nhaát goàm caùc thoâng tin: Soá hoaù ñôn, ngaøy, teân khaùch haøng, ñòa chæ khaùch haøng, toång trò giaù 
--cuûa hoaù ñôn.
create view v27
as
	select top 1 a.MAHD,NGAY,TENKH,DIACHI,TONGTRIGIA=sum(SL*GIABAN)
	from hoadon a, chitiethoadon b, khachhang c
	where a.mahd=b.mahd and a.makh=c.makh
	group by a.MAHD,NGAY,TENKH,DIACHI
	order by sum(SL*GIABAN) desc
go
	select * from v27
	
--28.	Laáy ra hoaù ñôn coù toång trò giaù lôùn nhaát trong thaùng 5/2000 goàm caùc thoâng tin: Soá hoaù ñôn, ngaøy, teân khaùch haøng, 
--ñòa chæ khaùch haøng, toång trò giaù cuûa hoaù ñôn.
create view v28
as
	select top 1 a.MAHD,NGAY,TENKH,DIACHI,TONGTRIGIA=sum(SL*GIABAN)
	from hoadon a, chitiethoadon b, khachhang c
	where a.mahd=b.mahd and a.makh=c.makh and month(ngay)=5
	group by a.MAHD,NGAY,TENKH,DIACHI
	order by sum(SL*GIABAN) desc
go
	select * from v28
	
--29.	Laáy ra hoaù ñôn coù toång trò giaù nhoû nhaát goàm caùc thoâng tin: Soá hoaù ñôn, ngaøy, teân khaùch haøng, ñòa chæ khaùch haøng, 
--toång trò giaù cuûa hoaù ñôn.
create view v29
as
	select top 1 a.MAHD,NGAY,TENKH,DIACHI,TONGTRIGIA=sum(SL*GIABAN)
	from hoadon a, chitiethoadon b, khachhang c
	where a.mahd=b.mahd and a.makh=c.makh
	group by a.MAHD,NGAY,TENKH,DIACHI
	order by sum(SL*GIABAN) 
go
	select * from v29
	
--30.	Ñeám xem moãi khaùch haøng coù bao nhieâu hoaù ñôn.
create view v30
as
	select a.MAKH,TENKH,SOHOADON=count(mahd)
	from hoadon a,khachhang b
	where a.makh=b.makh
	group by a.makh,tenkh
go
	select * from v30
	
--31.	Laáy ra caùc thoâng tin cuûa khaùch haøng coù soá löôïng hoaù ñôn mua haøng nhieàu nhaát.
create view v31
as
	select top 1 a.MAKH,TENKH,DIACHI,DT,EMAIL,SOHOADON=count(mahd)
	from hoadon a,khachhang b
	where a.makh=b.makh
	group by a.MAKH,TENKH,DIACHI,DT,EMAIL
	order by count(mahd) desc
go
	select * from v31
	
--32.	Laáy ra caùc thoâng tin cuûa khaùch haøng coù soá löôïng haøng mua nhieàu nhaát.
create view v32
as
	select top 1 a.MAKH,TENKH,DIACHI,DT,EMAIL,SOLUONGHANG=sum(sl)
	from hoadon a,khachhang b, chitiethoadon c
	where a.makh=b.makh and a.mahd=c.mahd
	group by a.MAKH,TENKH,DIACHI,DT,EMAIL
	order by sum(sl) desc
go
	select * from v32
	
--33.	Laáy ra caùc thoâng tin veà caùc maët haøng maø ñöôïc baùn trong nhieàu hoaù ñôn nhaát.
create view v33
as
	select top 1 a.MAVT,TENVT,DVT,GIAMUA,SLTON
	from chitiethoadon a,vattu b
	where a.mavt=b.mavt
	group by a.MAVT,TENVT,DVT,GIAMUA,SLTON
	order by count(mahd) desc
go
	select * from v33
	
--34.	Laáy ra caùc thoâng tin veà caùc maët haøng maø ñöôïc baùn nhieàu nhaát.
create view v34
as
	select top 1 a.MAVT,TENVT,DVT,GIAMUA,SLTON
	from chitiethoadon a,vattu b
	where a.mavt=b.mavt
	group by a.MAVT,TENVT,DVT,GIAMUA,SLTON
	order by sum(sl) desc
go
	select * from v34
	
--35.	Laáy ra danh saùch taát caû caùc khaùch haøng goàm Maõ khaùch haøng, teân khaùch haøng, ñòa chæ , soá löôïng hoaù ñôn ñaõ mua 
--(neáu khaùch haøng ñoù chöa mua haøng thì coät soá löôïng hoaù ñôn ñeå troáng)
create view v35
as
	select a.MAKH,TENKH,DIACHI,
				SOLUONGHD=case
												when count(mahd) <>0 then count(mahd)
												else null
											end
	from khachhang a left join hoadon b on (a.makh=b.makh)
	group by a.MAKH,TENKH,DIACHI
go
	select * from v35

--FUNCTION

--1.	Vieát  haøm tính doanh thu cuaû naêm.vôùi naêm laø tham soá truyeàn  vaøo.
create function f1(@nam int)
returns bigint
as
begin
	declare @dt bigint
	set @dt=(	select sum(sl*giaban)
						from chitiethoadon a,hoadon b
						where a.mahd=b.mahd and year(ngay)=@nam )
	return @dt
end
select 'DOANH THU NAM 2000'=dbo.f1(2000)

--2.	Vieát  haøm tính doanh thu cuaû thaùng .. vôùi thaùng laø tham soá truyeàn  vaøo.
create function f2(@thang int)
returns bigint
as
begin
	declare @dt bigint
	set @dt=(	select sum(sl*giaban)
						from chitiethoadon a,hoadon b
						where a.mahd=b.mahd and month(ngay)=@thang )
	return @dt
end
select 'DOANH THU THANG 5'=dbo.f2(5)

--3.	Vieát haøm tính doanh thu cuûa khaùch haøng vôùi  maõ khaùch haøng laø tham soá truyeàn vaøo.
create function f3(@mkh nvarchar(5))
returns bigint
as
begin
	declare @dt bigint
	set @dt=(	select sum(sl*giaban)
						from chitiethoadon a,hoadon b, khachhang c
						where a.mahd=b.mahd and b.makh=c.makh and c.makh=@mkh )
	return @dt
end
select 'DOANH THU KH01'=dbo.f3('KH01')

--4.	Vieát haøm tính toång soá löôïng baùn ñöôïc cho töøng maët haøng theo thaùng vôùi  maõ haøng vaø thaøng nhaäp vaøo,  
--neáu thaùng khoâng nhaäp vaøo töùc laø tính taát caû caùc thaùng.
create function f4(@mvt nvarchar(5), @thang int)
returns @mathang table
								(MAVT nvarchar(5) primary key not null,
								TENVT nvarchar(30) not null,
								TONGLUONG bigint not null)
as
begin
	if (@thang is null)
		insert into @mathang	select a.mavt,tenvt,sum(sl)
											from vattu a,chitiethoadon b
											where a.mavt=@mvt and a.mavt=b.mavt
											group by a.mavt,tenvt
	else
		insert into @mathang	select a.mavt,tenvt,sum(sl)
											from vattu a,chitiethoadon b,hoadon c
											where a.mavt=@mvt and a.mavt=b.mavt and b.mahd=c.mahd and month(ngay)=@thang
											group by a.mavt,tenvt
	return
end
select * from dbo.f4('VT01',5)

--5.	Vieát haøm tính laõi ((giaù baùn – tröø giaù mua )* sloá löôïng baùn ñöôïc ) cho töøng maët haøng, vôùi maõ maët haøng laø tham
--soá truyeàn vaøo. Neáu maõ maët haøng khoâng truyeàn vaøo thì tính cho taát caû caùc maët haøng.
create function f5(@mvt nvarchar(5))
returns @mathang table
								(MAVT nvarchar(5) primary key not null,
								TENVT nvarchar(30) not null,
								LAI bigint not null)
as
begin
	if (@mvt is null)
		insert into @mathang	select a.mavt,tenvt,sum((giaban-giamua)*sl)
											from vattu a,chitiethoadon b
											where a.mavt=b.mavt
											group by a.mavt,tenvt
	else
		insert into @mathang	select a.mavt,tenvt,sum((giaban-giamua)*sl)
											from vattu a,chitiethoadon b,hoadon c
											where a.mavt=@mvt and a.mavt=b.mavt and b.mahd=c.mahd
											group by a.mavt,tenvt
	return
end
select * from dbo.f5(null)

--PROCEDURE
--1.	Laáy ra danh caùc khaùch haøng ñaõ mua haøng trong ngaøy [ngaøy]…. Vôùi [ngaøy] laø tham soá truyeàn vaøo.
create proc P1 @ngay int,@mcr cursor varying output
as
begin
	set @mcr=cursor scroll static
	for
		select a.MAKH,TENKH,NGAY
		from khachhang a,hoadon b
		where a.makh=b.makh and day(ngay)=@ngay
	open @mcr
end

declare @mr cursor
exec P1 25,@mcr=@mr output
fetch first from @mr
while (@@FETCH_STATUS=0)
begin
	fetch next from @mr
end
close @mr
deallocate @mr

--2.	Laáy ra danh saùch 5 khaùch haøng  coù toång trò giaù caùc ñôn haøng lôùn nhaát.
create proc P2
as
begin
	select top 5 a.MAKH,TENKH,TONGTRIGIA=sum(sl*giaban)
	from khachhang a,hoadon b, chitiethoadon c
	where a.makh=b.makh and b.mahd=c.mahd
	group by a.makh,tenkh
	order by tongtrigia desc
end
go
exec P2

--3.	Laáy ra danh saùch 10 maët haøng coù soá löôïng baùn lôùn nhaát.
create proc P3
as
begin
	select top 10 a.MAVT,TENVT,SOLUONG=sum(sl)
	from vattu a,chitiethoadon b
	where a.mavt=b.mavt
	group by a.mavt,tenvt
	order by soluong desc
end
go
exec P3

--4.	Laáy ra danh saùch 10 maët haøng baùn ra coù laõi 1t nhaát.
create proc P4
as
begin
	select top 10 a.MAVT,TENVT,LAI=sum((giaban-giamua)*sl)
	from vattu a,chitiethoadon b
	where a.mavt=b.mavt
	group by a.mavt,tenvt
	order by lai
end
go
exec P4

--5.	Tính giaù trò cho coät khuyeán maõi nhö sau: Khuyeán maõi 5% neáu SL >100, 10% neáu SL>500.

--6.	Tính soá laïi soá löôïng toàn cho taát caû caùc maët haøng. (SLTON = SLTON – toång sl baùn ñöôïc)

--7.	Tính trò giaù cho moãi hoaù ñôn.

--8.	Taïo ra table KH_VIP coù caáu truùc gioáng vôùi caáu truùc table KHACHHANG. Löu caùc khaùch haøng co
--ù toång trò giaù cuûa taát caû caùc ñôn haøng >=10000000 vaøo table KH_VIP.


--TRIGGER
--1.	Thöïc hieän vieäc kieåm tra raèng buoäc khoaù ngoaïi.
--2.	Khoâng cho pheùp cascade delete trong caùc raèng buoäc khoaù ngoaïi. Ví duï khoâng cho pheùp xoaù 
--caùc CTHOADON naøo coù SOHD coøn trong table HOADON
create trigger T1 on chitiethoadon
for delete
as
begin
	if (select count(*) from deleted a,hoadon b where a.mahd=b.mahd)>0
	begin
		print N'Khong xoa duoc'
		rollback tran
	end
end

delete from chitiethoadon where mahd='HD001'

--3.	khoâng cho pheùp user nhaäp vaøo hai vaät tö coù cuøng teân.
create trigger T2 on vattu
for insert,update
as
begin
	if (count (tenvt) from inserted a,vattu b where a.mavt=b.mavt)>=2
	begin
		print N'Khong cho phep them'
		rollback tran
	end
end


--4.	Khi user ñaët haøng thì KHUYENMAI laø 5% neáu SL >100, 10% neáu SL >500.

--5.	Chæ cho pheùp mua caùc maët  haøng coù soá löôïng toàn lôùn hôn hoaëc baèng soá löôïng caàn mua vaø tính 
--laïi soá löôïng toàn moãi khi coù ñôn haøng.

--6.	Khoâng cho pheùp user xoaù moät luùc nhieàu hôn moät vaät tö.

--7.	Chæ baùn maët haøng GAÏCH (caùc laoïi gaïcg) vôùi soá löôïng laø boäi soá cuûa 100.
