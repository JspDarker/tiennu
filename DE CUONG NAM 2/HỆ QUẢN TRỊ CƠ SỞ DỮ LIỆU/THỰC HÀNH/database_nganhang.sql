use master

if exists(select name from sysdatabases where name = 'nganhang')
	drop database nganhang
create database nganhang
use nganhang

if exists(select name from sysobjects where name = 'KhachHang')
	drop table KhachHang
create table KhachHang
(
	SoCMND char(8) primary key,
	TenKhachHang char(20),
	DiaChi char(20),
	DienThoai char(10),
	NgheNghiep ntext,
)
=================
if exists(select name from sysobjects where name = 'ChiNhanh')
	drop table ChiNhanh
create table ChiNhanh
(
	MSChiNhanh char(8) primary key,
	ThanhPho char(20),
	Diachi char(50),
	DienThoai char(10)
)
======================
if exists(select name from sysobjects where name = 'NhanVien')
	drop table NhanVien
create table NhanVien
(
	MSNhanVien char(8) primary key,
	MSChiNhanh char(8),
	TenNhanVien char(20),
	DienThoai char(10),
	GioiTinh bit default 1 check (Gioitinh = 1 or Gioitinh =0)
)
alter table NhanVien
add constraint FK_NV_CN foreign key(MSChiNhanh) references ChiNhanh(MSChiNhanh)
=============================

if exists(select name from sysobjects where name = 'HopDongVay')
	drop table HopDongVay
create table HopDongVay
(
	MSHopDong char (8)primary key,
	SoCMND char (8),
	ThoiHanVay datetime,
	NgayLapHopDong datetime,
	SoTienVay float,
	MSNhanVien char(8)
)
alter table HopDongVay
add
	constraint FK_HD_KH foreign key (SoCMND) references KhachHang(SoCMND),
	constraint FK_HD_NV foreign key (MSNhanVien) references NhanVien (MSNhanVien)

========================================
if exists(select name from sysobjects where name = 'TaiKhoan')
	drop table TaiKhoan
create table Taikhoan
(
	MSTaiKhoan char(8) not null,
	SoCMND char(8),
	MSChiNhanh char(8),
	Password char(10),
	SoTienHienTai float,
)
alter table TaiKhoan
add
	constraint FK_TK_KH foreign key (SoCMND) references KhachHang (SoCMND),
	constraint FK_TK_CN foreign key (MSChiNhanh) references ChiNhanh(MSChiNhanh)
=============

insert into ChiNhanh values ('CN1','HA NOI','68,HAI BA TRUNG,F20,HOANG KIEM','04-3885546')
insert into ChiNhanh values ('CN2','SAI GON','20 DIEN BIEN PHU,F20,BINH THANH','08-3885547')
insert into ChiNhanh values ('CN3','CAN THO','58 HOA BINH,F7,NINH KIEU ','71-3885557')

------------ NHAN VIEN --------------------

insert into NhanVien values ('0001','CN1','THAI KIM NGAN','84567893',0)		
insert into NhanVien values ('0002','CN1','LU DINH PHUC', '84456789',1)		
insert into NhanVien values ('0003','CN1','LE VAN THIEN','84567893',1)		
insert into NhanVien values ('0004','CN1','CAO KIM TUNG','84567894',1)		
insert into NhanVien values ('0005','CN1','TONG PHUOC AN','84567895',1)
insert into NhanVien values ('0006','CN1','NGUYEN VAN DUNG','84567896',0)

insert into NhanVien values ('0007','CN2','TRAN HUYNH TIEN','84567897',1)
insert into NhanVien values ('0008','CN2','HA NGOC THANH','84567898',0)
insert into NhanVien values ('0009','CN2','NGUYEN THI VAN ','84567899',0)
insert into NhanVien values ('0010','CN2','TRAN THI THANG','84567861',0)
insert into NhanVien values ('0011','CN2','TRAN MINH HUNG','84567862',1)

insert into NhanVien values ('0012','CN3','TONG THANH TINH','84567863',1)
insert into NhanVien values ('0013','CN3','HOANG VAN TIENG','84567864',1)
insert into NhanVien values ('0014','CN3','VAN THANH CONG','84567865',1)
insert into NhanVien values ('0015','CN3','NGUYEN THI HONG','84562123',0)
insert into NhanVien values ('0016','CN3','NGUYEN THANH LONG','85567865',1)

------------ KHACH HANG --------------------

insert into KhachHang values ('12345689','NGO THI THANH','Sai Gon','34567865','Ky Su')
insert into KhachHang values ('12345789','HUYNH ANH HANG','Ha Noi','32456765','Cong Nhan')
insert into KhachHang values ('12345678','PHAM QUYNH THU','Can Tho','82736151','Nhan vien van phong')
insert into KhachHang values ('12345679','PHAN VAN THANH','Ha Noi','38567865','Cong Nhan')
insert into KhachHang values ('12346789','NGUYEN VAN CHINH','Sai Gon','38367865','Giao Vien')
insert into KhachHang values ('12356789','PHAN THI HONG','Can Tho','83456789','Cong Nhan')
insert into KhachHang values ('12456789','LY VAN THAI','Sai Gon','33816789','Nha Bao')
insert into KhachHang values ('13456789','LE THANH CONG','Can Tho','32267865','Giao Vien')
insert into KhachHang values ('23456789','NGUYEN THANH TAI','Sai Gon','89738211','Nhan Vien')

----------- Hop Dong----------------------

insert into HopDongVay values('HD01','12345689','1/1/2013','12/11/2011',3000000,'0016')
insert into HopDongVay values('HD02','12345789','1/1/2013','12/10/2011',5000000,'0016')
insert into HopDongVay values('HD03','12345678','1/1/2013','12/11/2011',2000000,'0004')
insert into HopDongVay values('HD04','12345679','1/1/2013','12/6/2011',8000000,'0010')
insert into HopDongVay values('HD05','23456789','1/1/2013','12/11/2011',2000000,'0001')
insert into HopDongVay values('HD06','12345679','1/1/2013','12/6/2011',8000000,'0003')
insert into HopDongVay values('HD07','13456789','1/1/2011','12/11/2010',9000000,'0001')
insert into HopDongVay values('HD08','12345679','1/1/2013','12/6/2011',6000000,'0016')
insert into HopDongVay values('HD09','13456789','1/1/2011','12/11/2010',9000000,'0006')
insert into HopDongVay values('HD10','13456789','1/1/2013','12/6/2011',6000000,'0003')

----------- Tai Khoan-------------------------

insert into TaiKhoan values('TK001','12345689','CN1','abc0123',1200000)
insert into TaiKhoan values('TK002','12345789','CN1','xyz0123',1000000)
insert into TaiKhoan values('TK003','12345678','CN3','kml123',600000)
insert into TaiKhoan values('TK004','12345679','CN2','mlg123',800000)
insert into TaiKhoan values('TK010','13456789','CN2','mlg143',100000)
insert into TaiKhoan values('TK005','12346789','CN3','kml153',1300000)
insert into TaiKhoan values('TK006','12356789','CN3','mlg173',1800000)
insert into TaiKhoan values('TK007','12456789','CN2','mlg163',800000)
insert into TaiKhoan values('TK008','13456789','CN3','kml193',1500000)
insert into TaiKhoan values('TK009','23456789','CN2','hee123',1400000)




