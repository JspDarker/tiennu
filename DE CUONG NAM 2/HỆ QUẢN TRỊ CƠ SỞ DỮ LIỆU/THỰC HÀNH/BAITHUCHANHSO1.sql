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

--1.	Hie�n danh sa�ch ta�t ca� ca�c kha�ch ha�ng go�m ma� kha�ch ha�ng, te�n kha�ch ha�ng, ��a ch�, �ie�n thoa�i, va� ��a ch� E-mail.
create view v1
as
	select * from khachhang
go
	select * from v1
	
--2.	Hie�n danh sa�ch ca�c kha�ch ha�ng co� ��a ch� la� �TAN BINH� go�m ma� kha�ch ha�ng, te�n kha�ch ha�ng, ��a ch�, �ie�n thoa�i, 
--va� ��a ch� E-mail.
create view v2
as
	select * from khachhang
	where diachi='TAN BINH'
go
	select * from v2
	
--3.	Hie�n danh sa�ch ca�c kha�ch ha�ng co� ��a ch� la� �BINH CHANH� go�m ma� kha�ch ha�ng, te�n kha�ch ha�ng, ��a ch�, �ie�n thoa�i,
 --va� ��a ch� E-mail.
create view v3
as
	select * from khachhang
	where diachi='BINH CHANH'
go
	select * from v3
	
--4.	Hie�n danh sa�ch ca�c kha�ch ha�ng go�m ca�c tho�ng tin ma� kha�ch ha�ng, te�n kha�ch ha�ng, ��a ch� va� ��a ch� E-mail cu�a nh��ng 
--kha�ch ha�ng ch�a co� so� �ie�n thoa�i
create view v4
as
	select MAKH,TENKH,DIACHI,EMAIL
	from khachhang a
	where dt is null
go
	select * from v4
	
--5.	Hie�n danh sa�ch ca�c kha�ch ha�ng ch�a co� so� �ie�n thoa�i va� cu�ng ch�a co� ��a ch� Email go�m ma� kha�ch ha�ng, 
--te�n kha�ch ha�ng, ��a ch�.
create view v5
as
	select MAKH,TENKH,DIACHI
	from khachhang
	where dt is null and email is null
go
	select * from v5
	
--6.	Hie�n danh sa�ch ca�c kha�ch ha�ng �a� co� so� �ie�n thoa�i va� ��a ch� E-mail go�m ma� kha�ch ha�ng, te�n kha�ch ha�ng, 
--��a ch�, �ie�n thoa�i, va� ��a ch� E-mail.
create view v6
as
	select MAKH,TENKH,DIACHI
	from khachhang
	where not(dt is null) and not(email is null)
go
	select * from v6
	
--7.	Hie�n danh sa�ch ta�t ca� ca�c va�t t� go�m ma� va�t t�, te�n va�t t�, ��n v� t�nh va� gia� mua.
create view v7
as
	select * from vattu
go
	select * from v7
	
--8.	Hie�n danh sa�ch ca�c va�t t� co� ��n v� t�nh la� �CAI� go�m ma� va�t t�, te�n va�t t� va� gia� mua.
create view v8
as
	select * from vattu
	where dvt='CAI'
go
	select * from v8
	
--9.	Hie�n danh sa�ch ca�c va�t t� go�m ma� va�t t�, te�n va�t t�, ��n v� t�nh va� gia� mua ma� co� gia� mua tre�n 25000.
create view v9
as
	select MAVT,TENVT,DVT,GIAMUA from vattu
	where giamua>25000
go
	select * from v9
	
--10.	Hie�n danh sa�ch ca�c va�t t� la� �GA�CH� (bao go�m ca�c loa�i ga�ch) go�m ma� va�t t�, te�n va�t t�, ��n v� t�nh va� gia� mua . 
create view v10
as
	select MAVT,TENVT,DVT,GIAMUA from vattu
	where tenvt like 'GACH%'
go
	select * from v10
	
--11.	Hie�n danh sa�ch ca�c va�t t� go�m ma� va�t t�, te�n va�t t�, ��n v� t�nh va� gia� mua ma� co� gia� mua na�m trong khoa�ng 
--t�� 20000 �e�n 40000.
create view v11
as
	select MAVT,TENVT,DVT,GIAMUA
	from vattu
	where giamua>=20000 and giamua<=40000
go
	select * from v11
	
--12.	Ta�o query �e� la�y ra ca�c tho�ng tin go�m Ma� hoa� ��n, nga�y la�p hoa� ��n, te�n kha�ch ha�ng, ��a ch� kha�ch ha�ng va� so� �ie�n thoa�i.
create view v12
as
	select MAHD,NGAY,TENKH,DIACHI,DT
	from hoadon a,khachhang b
	where a.makh=b.makh
go
	select * from v12
	
--13.	Ta�o query �e� la�y ra ca�c tho�ng tin go�m Ma� hoa� ��n, te�n kha�ch ha�ng, ��a ch� kha�ch ha�ng va� so� �ie�n thoa�i cu�a nga�y 25/5/2000.
set dateformat DMY
create view v13
as
	select MAHD,TENKH,DIACHI,DT
	from khachhang a,hoadon b
	where a.makh=b.makh and ngay='25/5/2000'
go
	select * from v13
	
--14.	Ta�o query �e� la�y ra ca�c tho�ng tin go�m Ma� hoa� ��n, nga�y la�p hoa� ��n, te�n kha�ch ha�ng, ��a ch� kha�ch ha�ng va� so� �ie�n thoa�i
-- cu�a nh��ng hoa� ��n trong tha�ng 6/2000.
create view v14
as
	select MAHD,NGAY,TENKH,DIACHI,DT
	from khachhang a,hoadon b
	where a.makh=b.makh and month(ngay)=6 and year(ngay)=2000
go
	select * from v14
	
--15.	Ta�o query �e� la�y ra ca�c tho�ng tin go�m Ma� hoa� ��n, nga�y la�p hoa� ��n, te�n kha�ch ha�ng, ��a ch� kha�ch ha�ng va� so� �ie�n thoa�i.
create view v15
as
	select MAHD,NGAY,TENKH,DIACHI,DT
	from hoadon a,khachhang b
	where a.makh=b.makh
go
	select * from v15
	
--16.	La�y ra danh sa�ch nh��ng kha�ch ha�ng (te�n kha�ch ha�ng, ��a ch�, so� �ie�n thoa�i) �a� mua ha�ng trong tha�ng 6/2000.
create view v16
as
	select TENKH,DIACHI,DT
	from khachhang a,hoadon b
	where a.makh=b.makh and month(ngay)=6 and year(ngay)=2000
go
	select * from v16
	
--17.	La�y ra danh sa�ch nh��ng kha�ch ha�ng kho�ng mua ha�ng trong tha�ng 6/2000 go�m ca�c tho�ng tin te�n kha�ch ha�ng, ��a ch�, 
--so� �ie�n thoa�i.
create view v17
as
	select TENKH,DIACHI,DT
	from khachhang a,hoadon b
	where a.makh=b.makh and month(ngay)<>6 and year(ngay)=2000
go
	select * from v17
	
--18.	Ta�o query �e� la�y ra ca�c tho�ng tin go�m ca�c tho�ng tin ma� ho�a ��n, ,ma� va�t t�, te�n va�t t�, ��n v� t�nh, gia� ba�n, gia� mua, 
--so� l���ng , tr� gia� mua (gia� mua * so� l���ng), tr� gia� ba�n , ( gia� ba�n * so� l���ng).
create view v18
as
	select a.MAHD,b.MAVT,TENVT,DVT,GIABAN,GIAMUA,SL,TRIGIAMUA=SL*GIAMUA,TRIGIABAN=SL*GIABAN
	from hoadon a, chitiethoadon b, vattu c
	where a.mahd=b.mahd and b.mavt=c.mavt
go
	select * from v18
	
--19.	Ta�o query �e� la�y ra ca�c chi tie�t hoa� ��n go�m ca�c tho�ng tin ma� ho�a ��n, ,ma� va�t t�, te�n va�t t�, ��n v� t�nh, gia� ba�n, 
--gia� mua, so� l���ng , tr� gia� mua (gia� mua * so� l���ng), tr� gia� ba�n , ( gia� ba�n * so� l���ng) ma� co� gia� ba�n l��n h�n hoa�c ba�ng gia� mua.
create view v19
as
	select a.MAHD,b.MAVT,TENVT,DVT,GIABAN,GIAMUA,SL,TRIGIAMUA=SL*GIAMUA,TRIGIABAN=SL*GIABAN
	from hoadon a, chitiethoadon b, vattu c
	where a.mahd=b.mahd and b.mavt=c.mavt and giaban>=giamua
go
	select * from v19
	
--20.	Ta�o query �e� la�y ra ca�c tho�ng tin go�m ma� ho�a ��n, ,ma� va�t t�, te�n va�t t�, ��n v� t�nh, gia� ba�n, gia� mua, so� l���ng , 
--tr� gia� mua (gia� mua * so� l���ng), tr� gia� ba�n , ( gia� ba�n * so� l���ng) va� co�t khuye�n ma�i v��i khuye�n ma�i 10% cho nh��ng ma�t ha�ng 
--ba�n trong mo�t ho�a ��n l�n h�n 100.
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
	
--21.	T�m ra nh��ng ma�t ha�ng ch�a ba�n ����c.
create view v21
as
	select MAVT, TENVT
	from vattu 
	where mavt not in (select mavt from chitiethoadon)
go 
select * from V21

--22.	Ta�o ba�ng to�ng h��p go�m ca�c tho�ng tin: ma� ho�a ��n, nga�y hoa� ��n, te�n kha�ch ha�ng, ��a ch�, so� �ie�n thoa�i, te�n va�t t�, 
--��n v� t�nh, gia� mua, gia� ba�n, so� l���ng, tr� gia� mua, tr� gia� ba�n. 
create view v22
as
	select a.MAHD,NGAY,TENKH,DIACHI,DT,d.TENVT,DVT,GIAMUA,GIABAN,SL,TRIGIAMUA=SL*GIAMUA,
				TRIGIABAN=SL*GIABAN
	from hoadon a, chitiethoadon b, khachhang c, vattu d
	where a.mahd=b.mahd and a.makh=c.makh and b.mavt=d.mavt
go
	select * from v22
	
--23.	Ta�o ba�ng to�ng h��p cu�a tha�ng 5/2000 go�m ca�c tho�ng tin: ma� ho�a ��n, nga�y hoa� ��n, te�n kha�ch ha�ng, ��a ch�, so� �ie�n thoa�i, 
--te�n va�t t�, ��n v� t�nh, gia� mua, gia� ba�n, so� l���ng, tr� gia� mua, tr� gia� ba�n. 
create view v23
as
	select a.MAHD,NGAY,TENKH,DIACHI,DT,d.TENVT,DVT,GIAMUA,GIABAN,SL,TRIGIAMUA=SL*GIAMUA,
				TRIGIABAN=SL*GIABAN
	from hoadon a, chitiethoadon b, khachhang c, vattu d
	where a.mahd=b.mahd and a.makh=c.makh and b.mavt=d.mavt and month(ngay)=5 and year(ngay)=2000
go
	select * from v23
	
--24.	Ta�o ba�ng to�ng h��p cu�a tha�ng 6/2000 go�m ca�c tho�ng tin: ma� ho�a ��n, nga�y hoa� ��n, te�n kha�ch ha�ng, ��a ch�, so� �ie�n thoa�i, 
--te�n va�t t�, ��n v� t�nh, gia� mua, gia� ba�n, so� l���ng, tr� gia� mua, tr� gia� ba�n. 
create view v24
as
	select a.MAHD,NGAY,TENKH,DIACHI,DT,d.TENVT,DVT,GIAMUA,GIABAN,SL,TRIGIAMUA=SL*GIAMUA,
				TRIGIABAN=SL*GIABAN
	from hoadon a, chitiethoadon b, khachhang c, vattu d
	where a.mahd=b.mahd and a.makh=c.makh and b.mavt=d.mavt and month(ngay)=6 and year(ngay)=2000
go
	select * from v24
	
--25.	Ta�o ba�ng to�ng h��p cu�a quy� 1 na�m 2000 go�m ca�c tho�ng tin: ma� ho�a ��n, nga�y hoa� ��n, te�n kha�ch ha�ng, ��a ch�, 
--so� �ie�n thoa�i, te�n va�t t�, ��n v� t�nh, gia� mua, gia� ba�n, so� l���ng, tr� gia� mua, tr� gia� ba�n. 
create view v25
as
	select a.MAHD,NGAY,TENKH,DIACHI,DT,d.TENVT,DVT,GIAMUA,GIABAN,SL,TRIGIAMUA=SL*GIAMUA,
				TRIGIABAN=SL*GIABAN
	from hoadon a, chitiethoadon b, khachhang c, vattu d
	where a.mahd=b.mahd and a.makh=c.makh and b.mavt=d.mavt and month(ngay)=1 or month(ngay)=2 
				or month(ngay)=3 and year(ngay)=2000
go
	select * from v25
	
--26.	La�y ra danh sa�ch ca�c hoa� ��n go�m ca�c tho�ng tin: So� hoa� ��n, nga�y, te�n kha�ch ha�ng, ��a ch� kha�ch ha�ng, to�ng tr� gia� cu�a hoa� ��n.
create view v26
as
	select a.MAHD,NGAY,TENKH,DIACHI,TONGTRIGIA=sum(SL*GIABAN)
	from hoadon a, chitiethoadon b, khachhang c
	where a.mahd=b.mahd and a.makh=c.makh
	group by a.MAHD,NGAY,TENKH,DIACHI
go
	select * from v26
	
--27.	La�y ra hoa� ��n co� to�ng tr� gia� l��n nha�t go�m ca�c tho�ng tin: So� hoa� ��n, nga�y, te�n kha�ch ha�ng, ��a ch� kha�ch ha�ng, to�ng tr� gia� 
--cu�a hoa� ��n.
create view v27
as
	select top 1 a.MAHD,NGAY,TENKH,DIACHI,TONGTRIGIA=sum(SL*GIABAN)
	from hoadon a, chitiethoadon b, khachhang c
	where a.mahd=b.mahd and a.makh=c.makh
	group by a.MAHD,NGAY,TENKH,DIACHI
	order by sum(SL*GIABAN) desc
go
	select * from v27
	
--28.	La�y ra hoa� ��n co� to�ng tr� gia� l��n nha�t trong tha�ng 5/2000 go�m ca�c tho�ng tin: So� hoa� ��n, nga�y, te�n kha�ch ha�ng, 
--��a ch� kha�ch ha�ng, to�ng tr� gia� cu�a hoa� ��n.
create view v28
as
	select top 1 a.MAHD,NGAY,TENKH,DIACHI,TONGTRIGIA=sum(SL*GIABAN)
	from hoadon a, chitiethoadon b, khachhang c
	where a.mahd=b.mahd and a.makh=c.makh and month(ngay)=5
	group by a.MAHD,NGAY,TENKH,DIACHI
	order by sum(SL*GIABAN) desc
go
	select * from v28
	
--29.	La�y ra hoa� ��n co� to�ng tr� gia� nho� nha�t go�m ca�c tho�ng tin: So� hoa� ��n, nga�y, te�n kha�ch ha�ng, ��a ch� kha�ch ha�ng, 
--to�ng tr� gia� cu�a hoa� ��n.
create view v29
as
	select top 1 a.MAHD,NGAY,TENKH,DIACHI,TONGTRIGIA=sum(SL*GIABAN)
	from hoadon a, chitiethoadon b, khachhang c
	where a.mahd=b.mahd and a.makh=c.makh
	group by a.MAHD,NGAY,TENKH,DIACHI
	order by sum(SL*GIABAN) 
go
	select * from v29
	
--30.	�e�m xem mo�i kha�ch ha�ng co� bao nhie�u hoa� ��n.
create view v30
as
	select a.MAKH,TENKH,SOHOADON=count(mahd)
	from hoadon a,khachhang b
	where a.makh=b.makh
	group by a.makh,tenkh
go
	select * from v30
	
--31.	La�y ra ca�c tho�ng tin cu�a kha�ch ha�ng co� so� l���ng hoa� ��n mua ha�ng nhie�u nha�t.
create view v31
as
	select top 1 a.MAKH,TENKH,DIACHI,DT,EMAIL,SOHOADON=count(mahd)
	from hoadon a,khachhang b
	where a.makh=b.makh
	group by a.MAKH,TENKH,DIACHI,DT,EMAIL
	order by count(mahd) desc
go
	select * from v31
	
--32.	La�y ra ca�c tho�ng tin cu�a kha�ch ha�ng co� so� l���ng ha�ng mua nhie�u nha�t.
create view v32
as
	select top 1 a.MAKH,TENKH,DIACHI,DT,EMAIL,SOLUONGHANG=sum(sl)
	from hoadon a,khachhang b, chitiethoadon c
	where a.makh=b.makh and a.mahd=c.mahd
	group by a.MAKH,TENKH,DIACHI,DT,EMAIL
	order by sum(sl) desc
go
	select * from v32
	
--33.	La�y ra ca�c tho�ng tin ve� ca�c ma�t ha�ng ma� ����c ba�n trong nhie�u hoa� ��n nha�t.
create view v33
as
	select top 1 a.MAVT,TENVT,DVT,GIAMUA,SLTON
	from chitiethoadon a,vattu b
	where a.mavt=b.mavt
	group by a.MAVT,TENVT,DVT,GIAMUA,SLTON
	order by count(mahd) desc
go
	select * from v33
	
--34.	La�y ra ca�c tho�ng tin ve� ca�c ma�t ha�ng ma� ����c ba�n nhie�u nha�t.
create view v34
as
	select top 1 a.MAVT,TENVT,DVT,GIAMUA,SLTON
	from chitiethoadon a,vattu b
	where a.mavt=b.mavt
	group by a.MAVT,TENVT,DVT,GIAMUA,SLTON
	order by sum(sl) desc
go
	select * from v34
	
--35.	La�y ra danh sa�ch ta�t ca� ca�c kha�ch ha�ng go�m Ma� kha�ch ha�ng, te�n kha�ch ha�ng, ��a ch� , so� l���ng hoa� ��n �a� mua 
--(ne�u kha�ch ha�ng �o� ch�a mua ha�ng th� co�t so� l���ng hoa� ��n �e� tro�ng)
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

--1.	Vie�t  ha�m t�nh doanh thu cua� na�m.v��i na�m la� tham so� truye�n  va�o.
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

--2.	Vie�t  ha�m t�nh doanh thu cua� tha�ng .. v��i tha�ng la� tham so� truye�n  va�o.
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

--3.	Vie�t ha�m t�nh doanh thu cu�a kha�ch ha�ng v��i  ma� kha�ch ha�ng la� tham so� truye�n va�o.
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

--4.	Vie�t ha�m t�nh to�ng so� l���ng ba�n ����c cho t��ng ma�t ha�ng theo tha�ng v��i  ma� ha�ng va� tha�ng nha�p va�o,  
--ne�u tha�ng kho�ng nha�p va�o t��c la� t�nh ta�t ca� ca�c tha�ng.
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

--5.	Vie�t ha�m t�nh la�i ((gia� ba�n � tr�� gia� mua )* slo� l���ng ba�n ����c ) cho t��ng ma�t ha�ng, v��i ma� ma�t ha�ng la� tham
--so� truye�n va�o. Ne�u ma� ma�t ha�ng kho�ng truye�n va�o th� t�nh cho ta�t ca� ca�c ma�t ha�ng.
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
--1.	La�y ra danh ca�c kha�ch ha�ng �a� mua ha�ng trong nga�y [nga�y]�. V��i [nga�y] la� tham so� truye�n va�o.
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

--2.	La�y ra danh sa�ch 5 kha�ch ha�ng  co� to�ng tr� gia� ca�c ��n ha�ng l��n nha�t.
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

--3.	La�y ra danh sa�ch 10 ma�t ha�ng co� so� l���ng ba�n l��n nha�t.
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

--4.	La�y ra danh sa�ch 10 ma�t ha�ng ba�n ra co� la�i 1t nha�t.
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

--5.	T�nh gia� tr� cho co�t khuye�n ma�i nh� sau: Khuye�n ma�i 5% ne�u SL >100, 10% ne�u SL>500.

--6.	T�nh so� la�i so� l���ng to�n cho ta�t ca� ca�c ma�t ha�ng. (SLTON = SLTON � to�ng sl ba�n ����c)

--7.	T�nh tr� gia� cho mo�i hoa� ��n.

--8.	Ta�o ra table KH_VIP co� ca�u tru�c gio�ng v��i ca�u tru�c table KHACHHANG. L�u ca�c kha�ch ha�ng co
--� to�ng tr� gia� cu�a ta�t ca� ca�c ��n ha�ng >=10000000 va�o table KH_VIP.


--TRIGGER
--1.	Th��c hie�n vie�c kie�m tra ra�ng buo�c khoa� ngoa�i.
--2.	Kho�ng cho phe�p cascade delete trong ca�c ra�ng buo�c khoa� ngoa�i. V� du� kho�ng cho phe�p xoa� 
--ca�c CTHOADON na�o co� SOHD co�n trong table HOADON
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

--3.	kho�ng cho phe�p user nha�p va�o hai va�t t� co� cu�ng te�n.
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


--4.	Khi user �a�t ha�ng th� KHUYENMAI la� 5% ne�u SL >100, 10% ne�u SL >500.

--5.	Ch� cho phe�p mua ca�c ma�t  ha�ng co� so� l���ng to�n l��n h�n hoa�c ba�ng so� l���ng ca�n mua va� t�nh 
--la�i so� l���ng to�n mo�i khi co� ��n ha�ng.

--6.	Kho�ng cho phe�p user xoa� mo�t lu�c nhie�u h�n mo�t va�t t�.

--7.	Ch� ba�n ma�t ha�ng GA�CH (ca�c lao�i ga�cg) v��i so� l���ng la� bo�i so� cu�a 100.
