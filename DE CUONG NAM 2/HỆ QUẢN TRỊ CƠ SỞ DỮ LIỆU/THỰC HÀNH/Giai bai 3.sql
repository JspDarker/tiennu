
--3.1 cho biết: “mã sản phẩm, tên sản phẩm, tổng số lượng xuất của từng sản phẩm trong năm 2006”. Lấy dữ liệu từ 
--View này sắp xếp tăng dần theo tên sản phẩm.
create View V1
as
   select a.masp, tensp, sum(soluong) [tong so luong xuat]
   from sanpham a, chitietphieuxuat b, phieuxuat c
   where a.masp=b.masp and b.mapx=c.mapx and year(ngaylap)=2006
   group by a.masp, tensp
   
select * from V1 order by tensp
--3.2 cho biết mã sp, tên sp, tên loại sp mà đã được bán từ ngày 1/1/2006 đến 30/6/2006
set dateformat dmy
   select a.masp, tensp, tenloai
   from sanpham a, chitietphieuxuat b, phieuxuat c, loai d
   where a.masp=b.masp and b.mapx=c.mapx and a.maloai=d.maloai and
         ngaylap between '1/1/2006' and '30/6/2006'
--3.3 cho biết số lượng sp trong từng loại sp gồm các thông tin: mã loại sp, tên loại sp, số lượng các sản phẩm 
--3.4 cho biết tổng số lượng phiếu xuất trong tháng 6 năm 2006.
select count(mapx) as soluongpx
from phieuxuat
where month(ngaylap)=6 and year(ngaylap)=2006
--3.5 cho biết thông tin về các phiếu xuất mà nhân viên có mã NV01 đã xuất
--3.6 cho biết danh sách nhân viên nam có tuổi trên 25 nhưng dưới 30.
select manv, hoten, convert(varchar(12),ngaysinh,103) [Ngay sinh], phai=case
                                                                  when phai=1 then 'nam'
                                                                  else 'nu'
                                                                  end
from nhanvien
where year(getdate())-year(ngaysinh)>=25 and year(getdate())-year(ngaysinh)<40 and
       phai=1
--3.7 thông kê số lượng phiếu xuất theo từng nhân viên.

3.8 Lấy ra tên của nhân viên có số lượng phiếu xuất lớn nhất
--3.9 Lấy ra tên sản phẩm được xuất nhiều nhất trong năm 2005 
   select top 1 with ties tensp, sum(soluong) as [so luong xuat trong nam 2005]
   from sanpham a, chitietphieuxuat b, phieuxuat c, loai d
   where a.masp=b.masp and b.mapx=c.mapx and year(ngaylap)=2005
   group by tensp
   order by sum(soluong) desc
Câu 4: Tạo các function sau:
--4.1 Function f1 có 2 tham số vào là: tên sản phẩm, năm. Function cho biết: số lượng xuất
-- kho của tên sản phẩm này trong năm này. (Chú ý: Nếu tên sản phẩm này không tồn tại 
--thì phải trả về 0)
drop function F1
create function F1 (@tensp varchar(30), @nam int)
returns bigint
as
begin
  declare @slx bigint
  if not exists (select * from SanPham a, chitietphieuxuat b where a.masp=b.masp and tensp=@tensp)
     set @slx=0
  else
     set @slx=(select sum(soluong) from chitietphieuxuat a, phieuxuat b, sanpham c
                 where a.mapx=b.mapx and a.masp=c.masp and tensp=@tensp and year(ngaylap)=@nam)
  return @slx  
end   

select [so luong san pham: Gach trong nam 2006] = str(dbo.F1('Gch',2006),5)
 
--4.2 Function F2 có 1 tham số nhận vào là mã nhân viên. Function trả về số lượng phiếu xuất của nhân viên
-- truyền vào. Nếu nhân viên này không tồn tại thì trả về 0.
4.3 Function F3 có 1 tham số vào là năm, trả về danh sách các sản phẩm được xuất trong năm truyền vào. 
--4.4 Function F4 có một tham số vào là mã NV để trả về danh sách các phiếu xuất của nhân viên đó.
-- Nếu mã nhân viên không truyền vào thì trả về tất cả các phiếu xuất.
create function F3 (@manv varchar(5)=null)
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

select * from dbo.F3(default)
     
--4.5 Function F5 để cho biết tên nhân viên của một phiếu xuất có mã phiếu xuất là tham số truyền vào.
--4.6 Function F6 để cho biết danh sách các phiếu xuất từ ngày t1 đến ngày t2. 
--(t1, t2 là tham số truyền vào). Chú ý t1 <= t2
create Function F6(@t1 datetime, @t2 datetime)
returns table
as
  return (select * from phieuxuat where ngaylap between @t1 and @t2)  
  
select * from dbo.F6('1/4/2006','30/6/2006')

--4.7 Function F7 để cho biết ngày xuất của một phiếu xuất với mã phiếu xuất là tham số truyền vào.

--Câu 5: Tạo stored procedure sau:
--5.1 Procedure tên là P1 cho có 2 tham số sau:
--+ 1 tham số nhận vào là: tên sản phẩm.
--+ 1 tham số trả về cho biết: tổng số lượng xuất kho của tên sản phẩm này trong năm 2006 
--(Không viết lại truy vấn, hãy sử dụng Function F1 ở 4.1 để thực hiện) 
create proc P1 @tensp varchar(30),@slx bigint output
as
  begin
    set @slx = dbo.F1(@tensp,2006)
  end  
  
declare @tslx bigint
exec P1 'Gach', @tslx output
print 'Tong so luong xuat Gach trong nam 2006 =' + str(@tslx,4)

--5.2 Stored Procedure tên là P2 có 2 tham số sau:
--+ 1 tham số nhận vào là: tên sản phẩm.
--+ 1 tham số trả về cho biết: tổng số lượng xuất kho của tên sản phẩm này trong khoảng thời gian từ đầu 
--tháng 4/2006 đến hết tháng 6/2006 (Chú ý: Nếu tên sản phẩm này không tồn tại thì trả về 0)
set dateformat dmy
alter proc P2 @tensp varchar(50),@tongslxk bigint output
as
begin
  if (not exists (select * from sanpham a, chitietphieuxuat b, phieuxuat c
                where a.masp=b.masp and tensp=@tensp and b.mapx=c.mapx
                 and ngaylap between '1/4/2006' and '30/6/2006'))
     set @tongslxk=0
  else
     set @tongslxk=(select sum(soluong) from sanpham a, chitietphieuxuat b, phieuxuat c
                where a.masp=b.masp and tensp=@tensp and b.mapx=c.mapx
                 and ngaylap between '1/4/2006' and '30/6/2006' )
end

declare @tslx bigint
exec P2 'Xi mang', @tslx output
print 'tong so luong xuat cua Ximang tu 4 -6 nam 2006 la : ' + str(@tslx,4)

5.3 Stored Procedure tên là  P3 chỉ có duy nhất 1 tham số nhận vào là tên sản phẩm. Trong Stored Procedure
này có khai báo 1 biến cục bộ được gán giá trị là: số lượng xuất kho của tên sản phẩm này trong khoảng thời 
gian từ đầu tháng 4/2006 đến hết tháng 6/2006. Việc gán trị này chỉ được thực hiện bằng cách gọi 
Stored Procedure P2.

--5.4 Procedure P4 để insert một record vào trong table Loai. Giá trị các field là tham số truyền vào
create proc P4 @maloai varchar(10), @tenloai varchar(50)
as
 begin
   insert into Loai values (@maloai,@tenloai)
 end
 
Exec P4 '4','procedure ' 

5.5 Procedure P5 để xoá một record trong table nhân viên theo mã nhân viên. Mã NV là tham số truyền vào.

Câu 6: Viết các trigger để thực hiện các ràng buộc sau:
6.1 Chỉ cho phép một phiếu xuất có tối đa 5 chi tiết phiếu xuất.
6.2 Chỉ cho phép một nhân viên lập tối đa 10 phiếu xuất trong một ngày
--6.3 Khi người dùng viết 1 câu truy vấn nhập 1 dòng cho bảng chi tiết xuất thì CSDL kiểm tra nếu mã phiếu xuất
 --mới đó chưa tồn tại trong  bảng phiếu xuất thì CSDL sẽ không cho phép nhập và thông báo lỗi 
 --“Phiếu xuất này không tồn tại” cho người dùng. Hãy viết 1 trigger đảm bảo điều này.
create trigger T3 on chitietphieuxuat
for insert
as
begin
  if not exists (select * from phieuxuat a, inserted b where b.mapx=a.mapx)
    begin
      print 'Phiếu xuất này không tồn tại '
      rollback Tran
    end
end

insert into chitietphieuxuat values ('1',2,20)