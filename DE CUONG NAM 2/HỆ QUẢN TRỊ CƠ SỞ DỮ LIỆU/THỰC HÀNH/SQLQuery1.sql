create database QuanLyGiaoDuc
go 
use QuanLyGiaoDuc
go

create table KHOA
(
	MaKhoa varchar (10) primary key,
	TenKhoa nvarchar (50) not null,
)

create table MONHOC
(
	MaMon int primary key,
	TenMon nvarchar (30) not null,
	MaKhoa varchar (10) foreign key references KHOA (MaKhoa)
)

create table GIANGVIEN
(
	MaGV Int primary key,
	HoLot nvarchar(30),
	Ten nvarchar(10)not null,
	MaKhoa varchar(10) foreign key references KHOA (MaKhoa),
	LuongCB Bigint
)

create table GIANGDAY
(
	MaGV int foreign key references GIANGVIEN (MaGV),
	MaMon int foreign key references MONHOC (MaMon),
	primary key (MaGV,MaMon)
)

insert into KHOA values ('CNTT',N'Công Ngh? Thông Tin')
insert into KHOA values ('QTKD',N'Qu?n Tr? Kinh Doanh')
insert into MONHOC values ('1',N'C? S? D? Li?u','CNTT')
insert into MONHOC values ('2',N'K? Thu?t l?p Trình','CNTT')
insert into MONHOC values ('3',N'Qu?n Tr? Nhân L?c','QTKD')
insert into MONHOC values ('4',N'Marketting','QTKD')
insert into MONHOC values ('5',N'K? Thu?t L?p Trình','CNTT')
insert into GIANGVIEN values ('1',N'Nguy?n V?n','Thanh','CNTT','10000000')
insert into GIANGVIEN values ('2',N'Ph?m Tr?n Thái',N'Tu?n','CNTT','8000000')
insert into GIANGVIEN values ('3',N'Tr?n Nhân',N'Nh?','QTKD','12000000')
insert into GIANGDAY values ('1','1')
insert into GIANGDAY values ('1','2')
insert into GIANGDAY values ('2','1')
insert into GIANGDAY values ('3','3')
insert into GIANGDAY values ('3','4')
insert into GIANGDAY values ('1','5')
insert into GIANGDAY values ('2','5')
