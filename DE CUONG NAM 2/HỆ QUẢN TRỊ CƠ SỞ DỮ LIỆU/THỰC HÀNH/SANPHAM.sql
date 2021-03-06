--Drop database QLSX
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

--3.1 cho biết “mã sản phẩm, tên sản phẩm, tổng số lượng xuất của từng sản phẩm 
--trong năm 2006”.Lấy dữ liệu từ View này sắp xếp tăng dần theo tên sản phẩm.

create view v1
as
select a.masp, b.tensp, sum(soluong) Soluong
from chitietphieuxuat a, sanpham b, phieuxuat c
where  a.masp = b.masp and a.mapx = c.mapx and year(ngaylap)=2006
group by a.masp, b.tensp
go 
select *from v1 

--3.2 cho biết mã sp, tên sp, tên loại sp mà đã được bán từ ngày 1/1/2006 
--đến 30/6/2006

create view v2
as
select a.masp,tensp,tenloai
from chitietphieuxuat a, sanpham b, phieuxuat c, loai d
where a.masp = b.masp and a.mapx = c.mapx and b.maloai = d.maloai 
					and year(ngaylap)=2006 and month(ngaylap)<7
go
select *from v2

--3.3 cho biết số lượng sp trong từng loại sp gồm các thông tin mã loại sp, 
--tên loại sp, số lượng các sản phẩm

create view v3
as
select a.maloai,tenloai, sum(soluong) Soluong
from loai a,chitietphieuxuat b, sanpham c
where a.maloai = c.maloai and b.masp = c.masp
group by a.maloai,tenloai
go
select *from v3
 
--3.4 cho biết tổng số lượng phiếu xuất trong tháng 6 năm 2006.

create view v4
as
select count (mapx) tongsoluongphieuxuat
from phieuxuat
where month(ngaylap)=6
go
select *from v4

--3.5 cho biết thông tin về các phiếu xuất mà nhân viên có mã NV01 đã xuất

alter view v5
as
select a.mapx, c.masp,tensp, sum(soluong) Soluong
from phieuxuat a, chitietphieuxuat b, sanpham c
where c.masp = b.masp and a.mapx=b.mapx and manv='NV01'
group by a.mapx, c.masp,tensp
go
select *from v5

--3.6 cho biết danh sách nhân viên nam có tuổi trên 25 nhưng dưới 30.

create view v6
as
select 

3.7 thông kê số lượng phiếu xuất theo từng nhân viên.
3.8 Lấy ra tên của nhân viên có số lượng phiếu xuất lớn nhất
3.9 Lấy ra tên sản phẫm được xuất nhiều nhất trong năm 2005 


