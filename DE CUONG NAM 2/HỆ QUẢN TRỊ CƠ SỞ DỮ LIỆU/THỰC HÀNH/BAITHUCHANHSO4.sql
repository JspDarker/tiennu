use master
create database QLGD
go
use QLGD
go

create table KHOA
(
	makhoa varchar(10),
	tenkhoa nvarchar(50) not null,
	primary key(makhoa)
)

create table MONHOC
(
	mamon integer,
	tenmon nvarchar(30) not null,
	makhoa varchar(10),
	primary key(mamon)
)

create table GIANGVIEN
(
	magv integer,
	holot nvarchar(30),
	ten nvarchar(10) not null,
	makhoa varchar(10),
	luongcb bigint default 10000000,
	primary key(magv)
)

create table GIANGDAY
(
	magv integer,
	mamon integer,
	primary key (magv,mamon)
)

alter table MONHOC add foreign key (makhoa) references KHOA(makhoa)
alter table GIANGVIEN add foreign key (makhoa) references KHOA(makhoa)
alter table GIANGDAY add foreign key (magv) references GIANGVIEN(magv)
alter table GIANGDAY add foreign key (mamon) references MONHOC(mamon)

insert into KHOA values('CNTT','Công Nghệ Thông Tin')
insert into KHOA values('QTKD','Quản Trị Kinh Doanh')

insert into MONHOC values('1','Cơ Sở Dữ Liệu','CNTT')
insert into MONHOC values('2','Kỹ Thuật Lập Trình','CNTT')
insert into MONHOC values('3','Quản Trị Nhân Sự','QTKD')
insert into MONHOC values('4','Marketting','QTKD')
insert into MONHOC values('5','Kỹ Thuật Lập Trình','CNTT')

insert into GIANGVIEN values('1','Nguyễn văn','Thanh','CNTT','10000000')
insert into GIANGVIEN values('2','Phạm Trần Thái','Tuấn','CNTT','8000000')
insert into GIANGVIEN values('3','Trần Nhân','Nhị','QTKD','12000000')

insert into GIANGDAY values('1','1')
insert into GIANGDAY values('1','2')
insert into GIANGDAY values('2','1')
insert into GIANGDAY values('3','3')
insert into GIANGDAY values('3','4')
insert into GIANGDAY values('1','5')
insert into GIANGDAY values('2','5')

--------------------------------------
--2. Tạo view tên V_GV, cho biết các thông tin về giảng viên và số lượng môn học 
--mà GV đó đang giảng dạy, gồm các thông tin sau: MaGV, HoTenGV, TenKhoa, LuongCB, 
--SoMonGD. 
create view V_GV
as
	select a.magv,holot+' '+ten as [hotengv],tenkhoa,luongcb,count(*) as [so mon]
	from giangvien a,giangday b,khoa c
	where a.magv=b.magv and a.makhoa=c.makhoa
	group by a.magv,holot,ten,tenkhoa,luongcb
go
select * from V_GV

--3. Tạo view tên V_MH, cho biết các thông tin về môn học và số lượng giảng viên có 
--giảng dạy môn học đó, gồm các thông tin sau: MaMon, TenMon, TenKhoa, SoLuongGV.
create view V_MH
as
	select a.mamon,tenmon,tenkhoa,count(*) as [so gv]
	from monhoc a,khoa b,giangday c
	where a.makhoa=b.makhoa and a.mamon=c.mamon
	group by a.mamon,tenmon,tenkhoa
go
select * from V_MH

--4. Tạo view có tên MH_Khoa, gồm các field: MaKhoa, TenKhoa, SLMH để thống kê số 
--lượng môn học của Khoa đang quản lý. 
create view MH_Khoa
as
	select a.makhoa,tenkhoa,count(*) as [so mon hoc]
	from khoa a,monhoc b
	where a.makhoa=b.makhoa
	group by a.makhoa,tenkhoa
go
select * from MH_Khoa

--5. Tạo view có tên GV_Khoa, gồm các thông tin: MaKhoa, TenKhoa, SLGV để thống kê 
--số lượng GV của Khoa đang có. 
create view GV_Khoa
as
	select a.makhoa,tenkhoa,count(*) as [so gv]
	from khoa a,giangvien b
	where a.makhoa=b.makhoa
	group by a.makhoa,tenkhoa
go
select * from GV_Khoa

--6. Tạo stored procedure P1 để cho biết danh sách các môn học của một khoa với mã 
--khoa là tham số truyền vào.
create proc P1 @makhoa varchar(10),@mcr cursor varying output
as
begin
	set @mcr=cursor scroll static
	for
		select *
		from monhoc a
		where a.makhoa=@makhoa
	open @mcr
end

declare @mr cursor
exec P1 'CNTT',@mcr=@mr output
fetch first from @mr
while (@@FETCH_STATUS=0)
begin
	fetch next from @mr
end
close @mr
deallocate @mr

--7. Tạo stored procedure P2 với mã GV là tham số truyền vào, tham số trả về là danh
-- sách GV cùng tham gia giảng dạy các môn học với GV có tham số truyền vào.
--Viết đoạn mã lệnh để gọi procedure P2 với tham số truyền vào cho MAGV là GV012. 
--Sau đó in ra màn hình họ tên của các giảng viên của danh sách các GV được trả về.
alter proc P2 @magv varchar(10), @cr cursor varying output
as
begin
  set @cr = cursor scroll static
  for
    select a.magv, ten, mamon
    from giangvien a, giangday b
    where a.magv=b.magv and a.magv <> @magv and
         mamon in (select mamon from giangday where magv=@magv)
  open @cr
end
 
declare @mcr cursor
exec P2 1, @cr=@mcr output  
fetch first from @mcr
while (@@fetch_status=0)
   fetch next from @mcr
close @mcr
deallocate @mcr
   
--8. Tạo function F1 để cho biết tên khoa phụ trách một môn học với mã môn học là 
--tham số truyền vào.
create function f1(@mamon int)
returns nvarchar(50)
as
begin
	declare @tk nvarchar(50)
	set @tk=(	select tenkhoa
				from monhoc a,khoa b
				where a.makhoa=b.makhoa and a.mamon=@mamon )
	return @tk
end
select 'Phu trach mon Cơ Sở Dữ Liệu la khoa: '+dbo.f1(1)

--9. Tạo function F2 để trả về danh sách GV cùng khoa với GV có mã là tham số 
--truyền vào.
alter function f2(@magv int)
returns @danhsach table
			(
				magv integer,
				holot nvarchar(30),
				ten nvarchar(10) not null,
				makhoa varchar(10)
			)
as
begin
	declare @tmp varchar(10)
	set @tmp= (select makhoa from giangvien a where a.magv=@magv)
	insert into @danhsach	
		select magv,holot,ten,makhoa
		from giangvien a
		where a.makhoa=@tmp and a.magv<>@magv
	return
end
select * from dbo.f2(1)

--10. Tạo trigger T1 để cho phép mỗi GV chỉ dạy tối đa là 5 môn học.

--11. Tạo trigger T2 để kiểm tra qui tắc ràng buộc sau: giảng viên chỉ giảng dạy 
--những môn do khoa của họ phụ trách. 
