use master
Create Database QLSX
go
use QLSX
go
Create table [Loai]
(
	[MaLoai] Varchar(5) NOT NULL,
	[TenLoai] Varchar(50) NULL,
Primary Key ([MaLoai])
) 
go

Create table [SanPham]
(
	[Masp] Varchar(5) NOT NULL,
	[Tensp] Varchar(50) NULL,
	[MaLoai] Varchar(5) NOT NULL,
Primary Key ([Masp])
) 
go

Create table [NhanVien]
(
	[Manv] Varchar(5) NOT NULL,
	[Hoten] Varchar(50) NULL,
	[Ngaysinh] Datetime NULL,
	[Phai] Tinyint Default -1 NULL,
Primary Key ([Manv])
) 
go

Create table [PhieuXuat]
(
	[Mapx] Smallint NOT NULL,
	[Manv] Varchar(5) NOT NULL,
	[Ngaylap] Datetime NULL,
Primary Key ([Mapx])
) 
go

Create table [ChiTietPhieuXuat]
(
	[Masp] Varchar(5) NOT NULL,
	[Mapx] Smallint NOT NULL,
	[SoLuong] Integer NULL,
Primary Key ([Masp],[Mapx])
) 
go

Alter table [SanPham] add  foreign key([MaLoai]) references [Loai] ([MaLoai])  
go

Alter table [ChiTietPhieuXuat] add  foreign key([Masp]) references [SanPham] ([Masp])  
go
Alter table [PhieuXuat] add  foreign key([Manv]) references [NhanVien] ([Manv])   
go
Alter table [ChiTietPhieuXuat] add  foreign key([Mapx]) references [PhieuXuat] ([Mapx])  
go

set dateformat dmy
--Nhanvien
insert into Nhanvien values ('NV01','Nguyen Mai Thi','15/5/82',1)
insert into Nhanvien values ('NV02','Tran Dinh Chien','2/12/80',0)
insert into Nhanvien values ('NV03','Le Thi Chi','23/1/79',1)
--Loai
insert into Loai values ('1','Vat lieu xay dung')
insert into Loai values ('2','Hang tieu dung')
insert into Loai values ('3','Ngu coc')
--Sanpham
insert into SanPham values ('1','Xi mang','1')
insert into SanPham values ('2','Gach','1')
insert into SanPham values ('3','Gao nang huong','3')
insert into SanPham values ('4','Bot mi','3')
insert into SanPham values ('5','Ke chen','2')
insert into SanPham values ('6','Dau Xanh','3')
--Phieuxuat
insert into PhieuXuat values (1,'NV01','12/3/2005')
insert into PhieuXuat values (2	,'NV02','3/2/2006')
insert into PhieuXuat values (3	,'NV03','1/6/2006')
insert into PhieuXuat values (4	,'NV01','16/6/2006')
--Chitietphieuxuat
insert into ChiTietPhieuXuat values ('1',1,10)
insert into ChiTietPhieuXuat values ('2',1,15)
insert into ChiTietPhieuXuat values ('3',1,	5)
insert into ChiTietPhieuXuat values ('2',2,	20)
insert into ChiTietPhieuXuat values ('1',3,	20)
insert into ChiTietPhieuXuat values ('3',3,	25)
insert into ChiTietPhieuXuat values ('5',4,12)

-------------------------------------------------
--VIEW
--3.1 cho biết: “mã sản phẩm, tên sản phẩm, tổng số lượng xuất của từng sản phẩm trong năm 2006”. 
--Lấy dữ liệu từ View này sắp xếp tăng dần theo tên sản phẩm.
create view V1
as
	select a.MASP,TENSP,TONGSLXUAT=sum(soluong)
	from sanpham a, phieuxuat b, chitietphieuxuat c
	where a.masp=c.masp and b.mapx=c.mapx and year(ngaylap)=2006
	group by a.masp,tensp
go
	select * from V1
	
--3.2 cho biết mã sp, tên sp, tên loại sp mà đã được bán từ ngày 1/1/2006 đến 30/6/2006
create view V2
as
	select b.MASP,TENSP,TENLOAI
	from loai a, sanpham b, phieuxuat c, chitietphieuxuat d
	where a.maloai=b.maloai and b.masp=d.masp and c.mapx=d.mapx
		and year(ngaylap)=2006 and month(ngaylap)<=6
go
	select * from v2
	
--3.3 cho biết số lượng sp trong từng loại sp gồm các thông tin: mã loại sp, tên loại sp, số lượng các sản phẩm 
create view V3
as
	select a.MALOAI,TENLOAI,SOLUONG=sum(soluong)
	from loai a,sanpham b,chitietphieuxuat c
	where a.maloai=b.maloai and b.masp=c.masp
	group by a.maloai,tenloai
go
	select * from V3
	
--3.4 cho biết tổng số lượng phiếu xuất trong tháng 6 năm 2006.
create view V4
as
	select [TONG SL PHIEU XUAT 06/2006]=count(mapx)
	from phieuxuat
	where month(ngaylap)=6 and year(ngaylap)=2006
go
	select * from V4
	
--3.5 cho biết thông tin về các phiếu xuất mà nhânl viên có mã NV01 đã xuất
create view V5
as
	select [SL HD NV01]=count(mapx)
	from phieuxuat
	where manv='NV01'
go
	select * from V5
	
--3.6 cho biết danh sách nhân viên nam có tuổi trên 25 nhưng dưới 30.
create view V6
as
	select *
	from nhanvien
	where phai=0 and (year(getdate())-year(ngaysinh))>25 and (year(getdate())-year(ngaysinh))<30
go
	select * from V6
	
--3.7 thông kê số lượng phiếu xuất theo từng nhân viên.
create view V7
as
	select a.MANV,HOTEN,[SL PX]=count(mapx)
	from nhanvien a,phieuxuat b
	where a.manv=b.manv
	group by a.manv,hoten
go
	select * from V7
	
--3.8 Lấy ra tên của nhân viên có số lượng phiếu xuất lớn nhất
create view V8
as
	select top 1 a.MANV,HOTEN,[SL PX]=count(mapx)
	from nhanvien a,phieuxuat b
	where a.manv=b.manv
	group by a.manv,hoten
	order by count(mapx) desc
go
	select * from V8
	
--3.9 Lấy ra tên sản phẫm được xuất nhiều nhất trong năm 2005 
create view V9
as
	select top 1 a.MASP,TENSP,SL=sum(soluong)
	from sanpham a,chitietphieuxuat b,phieuxuat c
	where a.masp=b.masp and b.mapx=c.mapx and year(ngaylap)=2005
	group by a.masp,tensp
	order by sum(soluong) desc
go
	select * from V9

-------------------------------------------
--FUNCTION
--4.1 Function f1 có 2 tham số vào là: tên sản phẩm, năm. Function cho biết: số lượng xuất kho của tên sản phẩm 
--này trong năm này. (Chú ý: Nếu tên sản phẩm này không tồn tại thì phải trả về 0)
create function F1(@tsp nvarchar(40),@nam int)
returns bigint
as
begin
	declare @sl bigint
	if (@tsp not in (select tensp from sanpham)) set @sl=0
	else set @sl=	(select sum(soluong)
				from sanpham a,chitietphieuxuat b,phieuxuat c
				where a.masp=b.masp and b.mapx=c.mapx and year(ngaylap)=@nam)
	return @sl
end
go
select 'Bot mi ban trong nam 2006'=dbo.F1('Bot mi',2006)
select 'May tinh ban trong nam 2006'=dbo.F1('May tinh',2006)

--4.2 Function F2 có 1 tham số nhận vào là mã nhân viên. Function trả về số lượng phiếu xuất của nhân viên 
--truyền vào. Nếu nhân viên này không tồn tại thì trả về 0.
create function F2(@mnv varchar(5))
returns int
as
begin
	declare @sl int
	if (@mnv not in (select manv from nhanvien)) set @sl=0
	else set @sl=(	select count(mapx)
					from phieuxuat
					where manv=@mnv )
	return @sl
end

select 'So luong phieu xuat cua NV01: '+str(dbo.F2('NV01'),4)
select 'So luong phieu xuat cua NV08: '+str(dbo.F2('NV08'),4)

--4.3 Function F3 có 1 tham số vào là năm, trả về danh sách các sản phẩm được xuất trong năm truyền vào. 
create function F3 (@nam int)
returns @abc table
		(
			masp varchar(5),
			tensp varchar(50),
			maloai varchar(5)
		)
begin
	insert into @abc	select a.masp,tensp,maloai from sanpham a,phieuxuat b,chitietphieuxuat c
						where a.masp=c.masp and b.mapx=c.mapx and year(ngaylap)=@nam
	return
end

select * from dbo.F3(2006)

--4.4 Function F4 có một tham số vào là mã NV để trả về danh sách các phiếu xuất của nhân viên đó. Nếu mã nhân viên
-- không truyền vào thì trả về tất cả các phiếu xuất.
create function F4(@manv varchar(5)=null)
returns @abc table
		(
			mapx smallint,
			manv varchar(5),
			ngaylap datetime
		)
begin
	if (@manv is not NULL)
		insert into @abc select * from phieuxuat where manv=@manv
	else
		insert into @abc select * from phieuxuat
	return
end

select * from dbo.F4('NV01')
select * from dbo.F4('')
select * from dbo.F4(default)

--4.5 Function F5 để cho biết tên nhân viên của một phiếu xuất có mã phiếu xuất là tham số truyền vào.

--4.6 Function F6 để cho biết danh sách các phiếu xuất từ ngày t1 đến ngày t2. (t1, t2 là tham số truyền vào). 
--Chú ý t1 <= t2

--4.7 Function F7 để cho biết ngày xuất của một phiếu xuất với mã phiếu xuất là tham số truyền vào.

-------------------------------------
--PROCEDURE
--5.1 Procedure tên là P1 cho có 2 tham số sau:
--+ 1 tham số nhận vào là: tên sản phẩm.
--+ 1 tham số trả về cho biết: tổng số lượng xuất kho của tên sản phẩm này trong năm 2006 
--(Không viết lại truy vấn, hãy sử dụng Function F1 ở 4.1 để thực hiện) 
create procedure P1 @tensp varchar(3),@slx bigint output
as
begin
	set @slx=dbo.F1(@tensp,2006)
end

declare @tslx bigint
exec P1 'Gach',@tslx output
print 'Tong so luong Gach xuat trong nam 2006 = '+str(@tslx,4)

--5.2 Stored Procedure tên là P2 có 2 tham số sau:
--+ 1 tham số nhận vào là: tên sản phẩm.
--+ 1 tham số trả về cho biết: tổng số lượng xuất kho của tên sản phẩm này trong khoảng thời gian 
--từ đầu tháng 4/2006 đến hết tháng 6/2006 (Chú ý: Nếu tên sản phẩm này không tồn tại thì trả về 0)
set dateformat dmy
create procedure P2 @tensp varchar(50),@tongslxk bigint output
as
begin
	if (not exists (select * from sanpham a, chitietphieuxuat b,phieuxuat c
					where a.masp=b.masp and b.mapx=c.mapx and tensp=@tensp
					and ngaylap between '1/4/2006' and '30/6/2006'))
		set @tongslxk=0
	else
	set @tongslxk=(	select sum(soluong) 
					from sanpham a,chitietphieuxuat b,phieuxuat c
					where a.masp=b.masp and b.mapx=c.mapx and tensp=@tensp
					and ngaylap between '1/4/2006' and '30/6/2006')
end

declare @tslx bigint
exec P2 'Xi mang',@tslx output
print 'Tong so luong xuat cua Xi mang tu thang 4 - 6 nam 2006 la: '+str(@tslx,4)

--5.3 Stored Procedure tên là  P3 chỉ có duy nhất 1 tham số nhận vào là tên sản phẩm. Trong Stored Procedure này 
--có khai báo 1 biến cục bộ được gán giá trị là: số lượng xuất kho của tên sản phẩm này trong khoảng thời gian từ 
--đầu tháng 4/2006 đến hết tháng 6/2006. Việc gán trị này chỉ được thực hiện bằng cách gọi Stored Procedure P2.

--5.4 Procedure P4 để insert một record vào trong table Loai. Giá trị các field là tham số truyền vào
create proc P4 @maloai varchar(10),@tenloai varchar(50)
as
begin
	insert into loai values (@maloai,@tenloai)
end

exec P4 '4','procedure'
select * from loai

--5.5 Procedure P5 để xoá một record trong table nhân viên theo mã nhân viên. Mã NV là tham số truyền vào.

-------------------------------------------
--TRIGGER
--6.1 Chỉ cho phép một phiếu xuất có tối đa 5 chi tiết phiếu xuất.

--6.2 Chỉ cho phép một nhân viên lập tối đa 10 phiếu xuất trong một ngày

--6.3 Khi người dùng viết 1 câu truy vấn nhập 1 dòng cho bảng chi tiết xuất thì CSDL kiểm tra nếu mã phiếu xuất 
--mới đó chưa tồn tại trong  bảng phiếu xuất thì CSDL sẽ không cho phép nhập và thông báo lỗi “Phiếu xuất này không 
--tồn tại” cho người dùng. Hãy viết 1 trigger đảm bảo điều này.
create trigger T3 on chitietphieuxuat
for insert
as
begin
	if not exists (	select * from phieuxuat a,inserted b
					where b.mapx=a.mapx)
	begin
		print 'Phieu xuat nay khong ton tai'
		rollback tran
	end
end

insert into chitietphieuxuat values ('1',8,20)