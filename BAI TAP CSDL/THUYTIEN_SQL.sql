USE DIALYVN

--1. Xuất ra tên tỉnh, TP cùng với dân số của tỉnh,TP:Có diện tích >= 5000 Km2
SELECT TEN_T_TP, DS
FROM TINH_TP
WHERE DT >= 5000

--2. Xuất ra tên tỉnh, TP cùng với diện tích của tỉnh,TP:Thuộc miền Bắc
SELECT TEN_T_TP, DT
FROM TINH_TP
WHERE MIEN = N'BẮC'

--3. Xuất ra các Tên tỉnh, TP biên giới thuộc miền [input] (SV cho một miền bất kỳ)
SELECT DISTINCT TEN_T_TP, NUOC
FROM TINH_TP, BIENGIOI
WHERE MIEN = N'NAM' AND TINH_TP.MA_T_TP = BIENGIOI.MA_T_TP

--4. Cho biết diện tích trung bình của các tỉnh, TP (Tổng DT/Tổng số tỉnh_TP).
SELECT TEN_T_TP, AVG (DT) AS DTTB
FROM TINH_TP
GROUP BY TEN_T_TP

--5. Cho biết dân số cùng với tên tỉnh của các tỉnh, TP có diện tích > 7000 Km2.
SELECT TEN_T_TP, DS
FROM TINH_TP
WHERE DT > 7000

--6. Cho biết dân số cùng với tên tỉnh của các tỉnh miền ‘Bắc’.
SELECT TEN_T_TP, DS
FROM TINH_TP
WHERE MIEN = N'BẮC'

--7. Cho biết mã các nước biên giới của các tỉnh miền ‘Nam’.
SELECT DISTINCT NUOC, TEN_T_TP
FROM BIENGIOI, TINH_TP
WHERE TINH_TP.MIEN = N'NAM' AND BIENGIOI.MA_T_TP = TINH_TP.MA_T_TP

--8. Cho biết diện tích trung bình của các tỉnh, TP. (Sử dụng hàm)
--GIỐNG CÂU SỐ 4

--9. Cho biết mật độ dân số (DS/DT) cùng với tên tỉnh, TP của tất cả các tỉnh, TP.
SELECT TEN_T_TP, (DS/DT)AS MDDS
FROM TINH_TP

--10. Cho biết tên các tỉnh,TP láng giềng của tỉnh ‘Long An’.
SELECT TEN_T_TP
FROM TINH_TP,LANGGIENG
WHERE TINH_TP.MA_T_TP = LANGGIENG.MA_T_TP AND LANGGIENG.LG = 'LA'

--11. Cho biết số lượng các tỉnh, TP giáp với ‘CPC’
SELECT COUNT (MA_T_TP)
FROM BIENGIOI
WHERE BIENGIOI.NUOC = 'CPC'

--12. Cho biết tên những tỉnh, TP có diện tích lớn nhất.
SELECT TOP 1 WITH TIES TEN_T_TP, DT
FROM TINH_TP
ORDER BY DT DESC

--13. Cho biết tỉnh, TP có mật độ DS đông nhất.
SELECT TOP 1 WITH TIES TEN_T_TP, (DS/DT)AS MDDS
FROM TINH_TP
ORDER BY MDDS DESC

--14. Cho biết tên những tỉnh, TP giáp với hai nước biên giới khác nhau.
SELECT TEN_T_TP
FROM TINH_TP, BIENGIOI
WHERE TINH_TP.MA_T_TP = BIENGIOI.MA_T_TP
GROUP BY TEN_T_TP
HAVING COUNT (*) = 2
