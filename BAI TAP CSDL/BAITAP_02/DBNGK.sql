﻿CREATE DATABASE QLNGK --//TAO DATEBASE
	ON(NAME='NGK_DATA', FILENAME='C:\SQL\NGK.MDF')
	LOG ON(NAME='NGK_LOG', FILENAME='C:\SQL\NGK.LDF')

GO
USE QLNGK
GO
--//TAO BANG 
CREATE TABLE NHACC(
MANCC VARCHAR(3) PRIMARY KEY,
TENNCC NVARCHAR(100) unique NOT NULL,
DIACHINCC NVARCHAR(100) NOT NULL,
DTNCC INT
)
CREATE TABLE LOAINGK(
MALOAINGK VARCHAR(3) PRIMARY KEY,
TENLOAINGK NVARCHAR(100) unique NOT NULL,
MANCC VARCHAR(3),
FOREIGN KEY(MANCC) REFERENCES NHACC(MANCC) ON UPDATE CASCADE
)
CREATE TABLE NGK(
MANGK VARCHAR(3) PRIMARY KEY,
TENNGK NVARCHAR(100) NOT NULL,
QUYCACH NVARCHAR(30) CHECK(QUYCACH=N'Chai' or QUYCACH=N'Lon' or QUYCACH=N'Bịch') NOT NULL,
MALOAINGK VARCHAR(3),
FOREIGN KEY(MALOAINGK) REFERENCES LOAINGK(MALOAINGK) ON UPDATE CASCADE
)

CREATE TABLE KH(
MAKH VARCHAR(4) PRIMARY KEY,
TENKH NVARCHAR(100) NOT NULL,
DCKH NVARCHAR(100),
DTKH INT
)
CREATE TABLE DDH(
SODDH VARCHAR(5) PRIMARY KEY,
NGAYDH DATETIME,
MANCC VARCHAR(3),
FOREIGN KEY(MANCC) REFERENCES NHACC(MANCC) ON UPDATE CASCADE
)
CREATE TABLE CT_DDH(
SODDH VARCHAR(5),
MANGK VARCHAR(3),
SLDAT INT CHECK(SLDAT>0),
PRIMARY KEY(SODDH,MANGK),
FOREIGN KEY(SODDH) REFERENCES DDH(SODDH) ON UPDATE CASCADE,
FOREIGN KEY(MANGK) REFERENCES NGK(MANGK)
)
CREATE TABLE PHIEUGH(
SOPGH VARCHAR(5) PRIMARY KEY,
NGAYGH DATETIME,
SODDH VARCHAR(5),
FOREIGN KEY(SODDH) REFERENCES DDH(SODDH) ON UPDATE CASCADE
)
CREATE TABLE CT_PGH(
SOPGH VARCHAR(5),
MANGK VARCHAR(3),
SLGIAO INT CHECK(SLGIAO>0),
DGGIAO FLOAT,
PRIMARY KEY(SOPGH,MANGK),
FOREIGN KEY(SOPGH) REFERENCES PHIEUGH(SOPGH) ON UPDATE CASCADE,
FOREIGN KEY(MANGK) REFERENCES NGK(MANGK)
)
CREATE TABLE HOADON(
SOHD VARCHAR(4) PRIMARY KEY,
NGAYLAPHD DATETIME,
MAKH VARCHAR(4),
FOREIGN KEY(MAKH) REFERENCES KH(MAKH) ON UPDATE CASCADE
)
CREATE TABLE CT_HOADON(
SOHD VARCHAR(4),
MANGK VARCHAR(3),
SLKHMUA INT,
DGBAN FLOAT,
PRIMARY KEY(SOHD,MANGK),
FOREIGN KEY(SOHD) REFERENCES HOADON(SOHD) ON UPDATE CASCADE,
FOREIGN KEY(MANGK) REFERENCES NGK(MANGK)
)
CREATE TABLE PHIEUHEN(
SOPH VARCHAR(4) PRIMARY KEY,
NGAYLAPPH DATETIME,
NGAYHENGIAO DATETIME,
MAKH VARCHAR(4),
FOREIGN KEY(MAKH) REFERENCES KH(MAKH) ON UPDATE CASCADE
)
CREATE TABLE CT_PH(
SOPH VARCHAR(4),
MANGK VARCHAR(3),
SLHEN INT,
PRIMARY KEY(SOPH,MANGK),
FOREIGN KEY(SOPH) REFERENCES PHIEUHEN(SOPH) ON UPDATE CASCADE,
FOREIGN KEY(MANGK) REFERENCES NGK(MANGK)
)
CREATE TABLE PHIEUTRANO(
SOPTN VARCHAR(5) PRIMARY KEY,
NGAYTRA DATETIME,
SOTIENTRA FLOAT,
SOHD VARCHAR(4),
FOREIGN KEY(SOHD) REFERENCES HOADON(SOHD) ON UPDATE CASCADE
)
--//NHAP LIEU
---//NCC
INSERT INTO NHACC VALUES('NC1',N'Công ty NGK quốc tế CocaCola',N'Xa lộ Hà Nội, Thủ Đức, TP.HCM','088967908')
INSERT INTO NHACC VALUES('NC2',N'Công ty NGK quốc tế Pepsi',N'Bến Chương Dương, Quận 1, TP.HCM','083663366') 
INSERT INTO NHACC VALUES('NC3',N'Công ty NGK Bến Chương Dương',N'Hàm Tử, Q.5, TP.HCM','089456677')

--//LOAI NGK
INSERT INTO LOAINGK VALUES('NK1',N'Nước ngọt có gas','NC1')
INSERT INTO LOAINGK VALUES('NK2',N'Nước ngọt không gas','NC2')
INSERT INTO LOAINGK VALUES('NK3',N'Trà','NC1')
INSERT INTO LOAINGK VALUES('NK4',N'Sữa','NC2')

--//NGK
INSERT INTO NGK VALUES('CC1',N'Coca Cola',N'Chai','NK1')
INSERT INTO NGK VALUES('CC2',N'Coca Cola',N'Lon','NK1')
INSERT INTO NGK VALUES('PS1',N'Pepsi',N'Chai','NK1')
INSERT INTO NGK VALUES('PS2',N'Pepsi',N'Lon','NK1')
INSERT INTO NGK VALUES('SV1',N'Seven Up',N'Chai','NK1')
INSERT INTO NGK VALUES('SV2',N'Seven Up',N'Lon','NK1')
INSERT INTO NGK VALUES('NO1',N'Number One',N'Chai','NK1')
INSERT INTO NGK VALUES('NO2',N'Number One',N'Lon','NK1')
INSERT INTO NGK VALUES('ST1',N'Sting dâu',N'Chai','NK1')
INSERT INTO NGK VALUES('ST2',N'Sting dâu',N'Lon','NK1')
INSERT INTO NGK VALUES('C2',N'Trà C2',N'Chai','NK2')
INSERT INTO NGK VALUES('OD',N'Trà xanh 0 độ',N'Chai','NK2')
INSERT INTO NGK VALUES('ML1',N'Sữa tươi tiệt trùng',N'Bịch','NK1')
INSERT INTO NGK VALUES('WT1',N'Nước uống đóng chai',N'Chai','NK2')

--//KH
INSERT INTO KH VALUES('KH01',N'Cửa hàng BT','144 XVNT','088405996')
INSERT INTO KH VALUES('KH02',N'Cửa hàng Trà','198/42 NTT','085974572')
INSERT INTO KH VALUES('KH03',N'Siêu thị Coop','24 ĐTH,','086547888')

--/DDH
SET DATEFORMAT DMY
INSERT INTO DDH VALUES('DDH01','10/5/2011','NC1')
INSERT INTO DDH VALUES('DDH02','20/5/2011','NC1')
INSERT INTO DDH VALUES('DDH03','26/5/2011','NC2')
INSERT INTO DDH VALUES('DDH04','03/6/2011','NC2')

--//CT_DDH
INSERT INTO CT_DDH VALUES('DDH01','CC1','20')
INSERT INTO CT_DDH VALUES('DDH01','CC2','15')
INSERT INTO CT_DDH VALUES('DDH01','PS1','18')
INSERT INTO CT_DDH VALUES('DDH01','SV2','12')
INSERT INTO CT_DDH VALUES('DDH02','CC2','30')
INSERT INTO CT_DDH VALUES('DDH02','PS2','10')
INSERT INTO CT_DDH VALUES('DDH02','SV1','5')
INSERT INTO CT_DDH VALUES('DDH02','ST1','15')
INSERT INTO CT_DDH VALUES('DDH02','C2','10')
INSERT INTO CT_DDH VALUES('DDH03','OD','45')
INSERT INTO CT_DDH VALUES('DDH04','CC1','8')
INSERT INTO CT_DDH VALUES('DDH04','ST2','12')

--//PHIEUGH


INSERT INTO PHIEUGH VALUES('PGH01','12/5/2010','DDH01')
INSERT INTO PHIEUGH VALUES('PGH02','15/5/2010','DDH01')
INSERT INTO PHIEUGH VALUES('PGH03','21/5/2010','DDH02')
INSERT INTO PHIEUGH VALUES('PGH04','22/5/2010','DDH02')
INSERT INTO PHIEUGH VALUES('PGH05','28/5/2010','DDH03')

--//CT_PHIEUGH
INSERT INTO CT_PGH VALUES('PGH01','CC1','15','5000')
INSERT INTO CT_PGH VALUES('PGH01','CC2','15','4000')
INSERT INTO CT_PGH VALUES('PGH01','SV2','10','4000')
INSERT INTO CT_PGH VALUES('PGH02','SV2','2','4000')
INSERT INTO CT_PGH VALUES('PGH03','CC2','30','5000')
INSERT INTO CT_PGH VALUES('PGH03','PS2','10','4000')
INSERT INTO CT_PGH VALUES('PGH03','ST1','15','9000')
INSERT INTO CT_PGH VALUES('PGH03','C2','10','8000')

--//HOADON
INSERT INTO HOADON VALUES('HD01','10/5/2010','KH01')
INSERT INTO HOADON VALUES('HD02','20/5/2010','KH01')
INSERT INTO HOADON VALUES('HD03','05/6/2010','KH02')
INSERT INTO HOADON VALUES('HD04','16/6/2010','KH02')
INSERT INTO HOADON VALUES('HD05','22/6/2011','KH02')
INSERT INTO HOADON VALUES('HD06','08/7/2010','KH03')

--//CT_HOADON
INSERT INTO CT_HOADON VALUES('HD01','CC1','20','6000')
INSERT INTO CT_HOADON VALUES('HD01','CC2','50','5000')
INSERT INTO CT_HOADON VALUES('HD02','ST1','40','10000')
INSERT INTO CT_HOADON VALUES('HD03','SV2','60','5000')
INSERT INTO CT_HOADON VALUES('HD04','PS2','25','5000')
INSERT INTO CT_HOADON VALUES('HD05','CC1','100','6000')
INSERT INTO CT_HOADON VALUES('HD05','SV1','12','8000')
INSERT INTO CT_HOADON VALUES('HD05','C2','80','9000')
INSERT INTO CT_HOADON VALUES('HD06','OD','55','1000')
INSERT INTO CT_HOADON VALUES('HD06','ST2','50','11000')


--//PHIEUHEN
INSERT INTO PHIEUHEN VALUES('PH01','08/5/2010','09/6/2010','KH01')
INSERT INTO PHIEUHEN VALUES('PH02','25/5/2010','28/6/2010','KH02')
INSERT INTO PHIEUHEN VALUES('PH03','01/6/2010','02/6/2010','KH03')

--//CT_PHIEUHEN
INSERT INTO CT_PH VALUES('PH01','ST2','10')
INSERT INTO CT_PH VALUES('PH01','OD','8')
INSERT INTO CT_PH VALUES('PH02','CC1','20')
INSERT INTO CT_PH VALUES('PH03','ST1','7')
INSERT INTO CT_PH VALUES('PH03','SV2','12')
INSERT INTO CT_PH VALUES('PH03','CC2','9')


--//PHIEUTRANO
INSERT INTO PHIEUTRANO VALUES('PTN01','18/5/2010','500000','HD01')
INSERT INTO PHIEUTRANO VALUES('PTN02','01/6/2010','350000','HD01')
INSERT INTO PHIEUTRANO VALUES('PTN03','02/6/2010','650000','HD02')
INSERT INTO PHIEUTRANO VALUES('PTN04','15/6/2010','1020000','HD03')
INSERT INTO PHIEUTRANO VALUES('PTN05','01/7/2010','1080000','HD03')










