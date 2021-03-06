﻿CREATE DATABASE QUANLICHUYENBAY

USE QUANLICHUYENBAY

CREATE TABLE KHACHHANG(
	MAKH NVARCHAR(15)NOT NULL,
	TENKH NVARCHAR(30) NOT NULL,
	DCHI NVARCHAR(50) NOT NULL,
	DTHOAI VARCHAR(12) NOT NULL
)

CREATE TABLE NHANVIEN(
	MANV VARCHAR(20) NOT NULL,
	TENNV NVARCHAR(30) NOT NULL,
	DCHI NVARCHAR(50) NOT NULL,
	DTHOAT VARCHAR(12) NOT NULL,
	LUONG FLOAT(2) NOT NULL,
	LOAINV BIT NOT NULL,
)

CREATE TABLE LOAIMB(
	MALOAI VARCHAR(15) NOT NULL,
	HANGSX NVARCHAR(15) NOT NULL
)

CREATE TABLE MAYBAY(
	SOHIEU INT NOT NULL,
	MALOAI VARCHAR(15) NOT NULL
)
CREATE TABLE CHUYENBAY(
	MACB VARCHAR(4) NOT NULL,
	SBDI NVARCHAR(3) NOT NULL,
	SBDEN NVARCHAR(3) NOT NULL,
	GIODI TIME(0) NOT NULL,
	GIODEN TIME(0) NOT NULL
)
CREATE TABLE LICHBAY(
	NGAYDI DATE NOT NULL,
	MACB VARCHAR(4) NOT NULL,
	SOHIEU INT NOT NULL,
	MALOAI VARCHAR(15) NOT NULL
)
CREATE TABLE DATCHO(
	MAKH NVARCHAR(15) NOT NULL,
	NGAYDI DATE NOT NULL,
	MACB VARCHAR(4) NOT NULL
)

CREATE TABLE KHANANG(
	MANV VARCHAR(20) NOT NULL,
	MALOAI VARCHAR(15) NOT NULL
)
CREATE TABLE PHANCONG(
	MANV VARCHAR(20) NOT NULL,
	NGAYDI DATE NOT NULL,
	MACB VARCHAR(4) NOT NULL
)

/* Thêm khóa chính */
ALTER TABLE dbo.KHACHHANG ADD CONSTRAINT pk_makh PRIMARY KEY (MAKH)
ALTER TABLE dbo.NHANVIEN ADD CONSTRAINT pk_manv PRIMARY KEY (MANV)
ALTER TABLE dbo.LOAIMB ADD CONSTRAINT pk_maloai PRIMARY KEY (MALOAI)
ALTER TABLE dbo.CHUYENBAY ADD CONSTRAINT pk_macb PRIMARY KEY (MACB)
ALTER TABLE dbo.LICHBAY ADD CONSTRAINT pk_ngaydi PRIMARY KEY (NGAYDI)
ALTER TABLE dbo.MAYBAY ADD CONSTRAINT pk_sohieu PRIMARY KEY (SOHIEU)

/* Thêm khóa ngoại */
ALTER TABLE dbo.DATCHO ADD CONSTRAINT fk_datcho_makh FOREIGN KEY (MAKH) REFERENCES dbo.KHACHHANG(MAKH)
ALTER TABLE dbo.DATCHO ADD CONSTRAINT fk_datcho_ngaydi FOREIGN KEY (NGAYDI) REFERENCES dbo.LICHBAY (NGAYDI)
ALTER TABLE dbo.DATCHO ADD CONSTRAINT fk_datcho_macb FOREIGN KEY (MACB) REFERENCES dbo.CHUYENBAY(MACB)
ALTER TABLE dbo.LICHBAY ADD CONSTRAINT fk_lichbay_macb FOREIGN KEY (MACB) REFERENCES dbo.CHUYENBAY(MACB) 

ALTER TABLE dbo.LICHBAY ADD CONSTRAINT fk_lichbay_sohieu FOREIGN KEY (SOHIEU) REFERENCES dbo.MAYBAY(SOHIEU) 
ALTER TABLE dbo.LICHBAY ADD CONSTRAINT fk_lichbay_maloai FOREIGN KEY (MALOAI) REFERENCES dbo.LOAIMB(MALOAI) 

ALTER TABLE dbo.MAYBAY ADD CONSTRAINT fk_maybay_maloai FOREIGN KEY (MALOAI) REFERENCES dbo.LOAIMB (MALOAI)
ALTER TABLE dbo.KHANANG ADD CONSTRAINT fk_khanang_manv FOREIGN KEY (MANV) REFERENCES dbo.NHANVIEN (MANV)
ALTER TABLE dbo.KHANANG ADD CONSTRAINT fk_khanang_maloai FOREIGN KEY (MALOAI) REFERENCES dbo.LOAIMB(MALOAI)
ALTER TABLE dbo.PHANCONG ADD CONSTRAINT fk_phancong_manv FOREIGN KEY (MANV) REFERENCES dbo.NHANVIEN(MANV)
ALTER TABLE dbo.PHANCONG ADD CONSTRAINT fk_phancong_ngaydi FOREIGN KEY (NGAYDI) REFERENCES dbo.LICHBAY(NGAYDI)
ALTER TABLE dbo.PHANCONG ADD CONSTRAINT fk_phancong_macb FOREIGN KEY (MACB) REFERENCES dbo.CHUYENBAY(MACB)

/* Insert thông tin Của nhân viên*/
INSERT INTO NHANVIEN VALUES('1006','Chi','12/6 Nguyen Kim','8120012',150000,0)
INSERT INTO NHANVIEN VALUES('1005','Giao','65 Nguyen Thai Son','8324467',500000,0)
INSERT INTO NHANVIEN VALUES('1001','Huong','8 Dien Bien Phu','8330733',500000,1)
INSERT INTO NHANVIEN VALUES('1002','Phong','1 Ly Thuong Kiet','8308117',450000,1)
INSERT INTO NHANVIEN VALUES('1004','Phuong','351 Lac Long Quan','8308155',250000,0)
INSERT INTO NHANVIEN VALUES('1003','Quan','78 Truong Dinh','8324461',350000,1)
INSERT INTO NHANVIEN VALUES('1007','Tam','36 Nguyen Van Cu','8458188',500000,0)
/* INSERT THÔNG TIN CỦA KHÁCH HÀNG*/
INSERT INTO KHACHHANG VALUES('0009','Nga','223 Nguyen Trai','8932320')
INSERT INTO KHACHHANG VALUES('0101','Anh','567 Tran Phu','8826729')
INSERT INTO KHACHHANG VALUES('0045','Thu','339 Nguyen Lu','8932203')
INSERT INTO KHACHHANG VALUES('0012','Ha','456 Quang Trung','8933232')
INSERT INTO KHACHHANG VALUES('0238','Hung','789 Cong Hoa','9812101')
INSERT INTO KHACHHANG VALUES('0397','Cuong','500 Xa Lo Ha Noi','8952943')
INSERT INTO KHACHHANG VALUES('0582','Tin','12 Nguyen Kim','')
INSERT INTO KHACHHANG VALUES('0934','Huy','44 Nguyen Nhac','')
INSERT INTO KHACHHANG VALUES('0091','Dung','55 Hoang Van Thu','8893223')
INSERT INTO KHACHHANG VALUES('0314','Chuong','66 Li Thuong Kiet','8232320')
INSERT INTO KHACHHANG VALUES('0613','Tai','123 Pham The Hien','8343232')
INSERT INTO KHACHHANG VALUES('0586','Duc','59 Truong Dinh','8556223')
INSERT INTO KHACHHANG VALUES('0422','Quynh','30 Nguyen Hue','8332222')

/* Thêm thông tin của Loại máy bay*/
INSERT INTO LOAIMB VALUES('A310','Aribus')
INSERT INTO LOAIMB VALUES('A320','Aribus')
INSERT INTO LOAIMB VALUES('A330','Aribus')
INSERT INTO LOAIMB VALUES('A340','Aribus')
INSERT INTO LOAIMB VALUES('B727','Boeing')
INSERT INTO LOAIMB VALUES('B747','Boeing')
INSERT INTO LOAIMB VALUES('B757','Boeing')
INSERT INTO LOAIMB VALUES('DC10','MD')
INSERT INTO LOAIMB VALUES('DC9','MD')

/* Thêm thông tin của Khả năng nhân viên*/
INSERT INTO KHANANG VALUES('1001','B727')
INSERT INTO KHANANG VALUES('1001','B747')
INSERT INTO KHANANG VALUES('1001','DC10')
INSERT INTO KHANANG VALUES('1001','DC10')
INSERT INTO KHANANG VALUES('1002','A320')
INSERT INTO KHANANG VALUES('1002','A340')
INSERT INTO KHANANG VALUES('1002','B757')
INSERT INTO KHANANG VALUES('1002','DC9')
INSERT INTO KHANANG VALUES('1003','A310')
INSERT INTO KHANANG VALUES('1003','DC9')
/* Thêm thông tin cho máy bay*/
INSERT INTO MAYBAY VALUES('10','B747')
INSERT INTO MAYBAY VALUES('11','B727')
INSERT INTO MAYBAY VALUES('12','B727')
INSERT INTO MAYBAY VALUES('13','B747')
INSERT INTO MAYBAY VALUES('21','DC10')
INSERT INTO MAYBAY VALUES('20','DC9')
INSERT INTO MAYBAY VALUES('22','B757')
INSERT INTO MAYBAY VALUES('25','DC9')
INSERT INTO MAYBAY VALUES('23','DC9')
INSERT INTO MAYBAY VALUES('24','DC9')
INSERT INTO MAYBAY VALUES('70','A310')
INSERT INTO MAYBAY VALUES('80','A310')
INSERT INTO MAYBAY VALUES('93','B757')
/* Thêm dữ liệu cho chuyến bay*/
INSERT INTO CHUYENBAY VALUES('100','SLC','BOS','08:00','17:50')
INSERT INTO CHUYENBAY VALUES('112','DCA','DEN','14:00','18:07')
INSERT INTO CHUYENBAY VALUES('121','STL','SLC','07:00','09:13')
INSERT INTO CHUYENBAY VALUES('122','STL','YYV','08:30','10:19')
INSERT INTO CHUYENBAY VALUES('206','DFW','STL','09:00','11:40')
INSERT INTO CHUYENBAY VALUES('330','JFK','YYV','16:00','18:53')
INSERT INTO CHUYENBAY VALUES('334','ORD','MIA','12:00','14:14')
INSERT INTO CHUYENBAY VALUES('335','MIA','ORD','15:00','17:14')
INSERT INTO CHUYENBAY VALUES('336','ORD','MIA','18:00','20:14')
INSERT INTO CHUYENBAY VALUES('337','MIA','ORD','20:30','23:53')
INSERT INTO CHUYENBAY VALUES('394','DFW','MIA','19:00','21:30')
INSERT INTO CHUYENBAY VALUES('395','MIA','DFW','21:00','23:43')
INSERT INTO CHUYENBAY VALUES('449','CDG','DEN','10:00','19:29')
INSERT INTO CHUYENBAY VALUES('930','YYV','DCA','13:00','16:10')
INSERT INTO CHUYENBAY VALUES('931','DCA','YYV','17:00','18:10')
INSERT INTO CHUYENBAY VALUES('932','DCA','YYV','18:00','19:10')
INSERT INTO CHUYENBAY VALUES('991','BOS','ORD','17:00','18:22')

/* Thêm dữ liệu cho lịch bay*/
INSERT INTO LICHBAY VALUES('2000/1/11','100','80','A310')
INSERT INTO LICHBAY VALUES('2000/1/12','112','21','DC10')
INSERT INTO LICHBAY VALUES('2000/1/13','206','22','DC9')
INSERT INTO LICHBAY VALUES('2000/1/14','334','10','B747')
INSERT INTO LICHBAY VALUES('2000/1/15','395','23','DC9')
INSERT INTO LICHBAY VALUES('2000/1/16','991','22','B757')
INSERT INTO LICHBAY VALUES('2000/01/17','337','10','B747')
INSERT INTO LICHBAY VALUES('2000/10/31','100','11','B727')
INSERT INTO LICHBAY VALUES('2000/10/29','112','11','B727')
INSERT INTO LICHBAY VALUES('2000/10/28','206','13','B727')
INSERT INTO LICHBAY VALUES('2000/10/27','334','10','B747')
INSERT INTO LICHBAY VALUES('2000/10/26','335','10','B747')
INSERT INTO LICHBAY VALUES('2000/10/25','337','24','DC9')
INSERT INTO LICHBAY VALUES('2000/10/23','449','70','A310')
/* Thêm thông tin của đặt chỗ*/
INSERT INTO DATCHO VALUES('0009','2000/1/11','100')
INSERT INTO DATCHO VALUES('0009','2000/10/31','449')
INSERT INTO DATCHO VALUES('0045','2000/1/11','991')
INSERT INTO DATCHO VALUES('0012','2000/10/31','206')
INSERT INTO DATCHO VALUES('0238','2000/1/11','334')
INSERT INTO DATCHO VALUES('0582','2000/1/11','991')
INSERT INTO DATCHO VALUES('0091','2000/1/11','100')
INSERT INTO DATCHO VALUES('0314','2000/10/31','449')
INSERT INTO DATCHO VALUES('0613','2000/1/11','100')
INSERT INTO DATCHO VALUES('0586','2000/1/11','991')
INSERT INTO DATCHO VALUES('0586','2000/10/31','100')
INSERT INTO DATCHO VALUES('0422','2000/10/31','449')
/* Thêm thông tin của phân công*/
INSERT INTO PHANCONG VALUES('1001','2000/01/11','100')
INSERT INTO PHANCONG VALUES('1001','2000/10/31','100')
INSERT INTO PHANCONG VALUES('1002','2000/01/11','100')
INSERT INTO PHANCONG VALUES('1002','2000/10/31','100')
INSERT INTO PHANCONG VALUES('1003','2000/10/31','100')
INSERT INTO PHANCONG VALUES('1003','2000/10/31','337')
INSERT INTO PHANCONG VALUES('1004','2000/10/31','100')
INSERT INTO PHANCONG VALUES('1004','2000/10/31','337')
INSERT INTO PHANCONG VALUES('1005','2000/10/31','337')
INSERT INTO PHANCONG VALUES('1006','2000/01/11','991')
INSERT INTO PHANCONG VALUES('1006','2000/10/31','337')
INSERT INTO PHANCONG VALUES('1007','2000/01/11','112')
INSERT INTO PHANCONG VALUES('1007','2000/01/11','991')
INSERT INTO PHANCONG VALUES('1007','2000/10/31','206')

SELECT * FROM dbo.KHACHHANG

SELECT * FROM dbo.CHUYENBAY

/*1. Cho biết mã số, tên phi công, địa chỉ, 
điện thoại của các phi công đã từng lái máy bay loại B747.*/

SELECT nv.MANV,nv.TENNV,nv.DCHI,nv.DTHOAT FROM dbo.NHANVIEN nv,dbo.LICHBAY lb, dbo.PHANCONG pc
WHERE lb.MALOAI = 'B747' AND pc.MACB = lb.MACB AND  nv.LOAINV = 1 AND nv.MANV = pc.MANV

/*2. Cho biết mã số và ngày đi của các chuyến bay xuất phát từ sân bay DCA 
trong khoảng thời gian từ 14 giờ đến 18 giờ.*/

SELECT cb.MACB, lb.NGAYDI FROM dbo.CHUYENBAY cb,dbo.LICHBAY lb
WHERE cb.SBDI = 'DCA' AND cb.MACB = lb.MACB AND cb.GIODI >= '14:00:00' AND cb.GIODI <= '18:00:00'

/*3. Cho biết tên những nhân viên được phân công trên chuyến bay có mã số 100 xuất phát tại sân bay SLC.
 Các dòng dữ liệu xuất ra không được phép trùng lắp(DISTINCT).*/

SELECT DISTINCT nv.TENNV FROM dbo.NHANVIEN nv,dbo.PHANCONG pc, dbo.CHUYENBAY cb
WHERE nv.MANV = pc.MANV AND cb.MACB = pc.MACB AND cb.MACB = '100' AND cb.SBDI = 'SLC'

/*4. Cho biết mã loại và số hiệu máy bay đã từng xuất phát tại sân bay MIA.
Các dòng dữ liệu xuất ra không được phép trùng lắp.*/

SELECT DISTINCT mb.MALOAI, mb.SOHIEU FROM dbo.MAYBAY mb, dbo.CHUYENBAY cb, dbo.LICHBAY lb
WHERE mb.MALOAI = lb.MALOAI AND cb.MACB = lb.MACB AND mb.SOHIEU = lb.SOHIEU AND cb.SBDI = 'MIA'

/*5. Cho biết mã chuyến bay, ngày đi, cùng với tên, địa chỉ, điện thoại của
tất cả các hành khách đi trên chuyến bay đó. Sắp xếp theo thứ tự tăng
dần của mã chuyến bay và theo ngày đi giảm dần.*/

SELECT DISTINCT cb.MACB, lb.NGAYDI, kh.TENKH, kh.DCHI, kh.DTHOAI FROM dbo.CHUYENBAY cb, dbo.KHACHHANG kh, dbo.LICHBAY lb
ORDER BY cb.MACB ASC, lb.NGAYDI DESC 

/*6.Cho biết mã chuyến bay, ngày đi, cùng với tên, địa chỉ, điện thoại của
tất cả những nhân viên được phân công trong chuyến bay đó. Sắp xếp
theo thứ tự tăng dần của mã chuyến bay và theo ngày đi giảm dần.*/

SELECT DISTINCT cb.MACB, lb.NGAYDI, nv.TENNV, nv.DCHI, nv.DTHOAT FROM dbo.CHUYENBAY cb, dbo.LICHBAY lb, dbo.NHANVIEN nv
ORDER BY cb.MACB ASC, lb.NGAYDI DESC 

/*7. Cho biết mã chuyến bay, ngày đi, mã số và tên của những phi công
được phân công vào chuyến bay hạ cánh xuống sân bay ORD.*/

SELECT cb.MACB, pc.NGAYDI, nv.MANV, nv.TENNV FROM dbo.CHUYENBAY cb, dbo.PHANCONG pc, dbo.NHANVIEN nv
WHERE nv.LOAINV = 1 AND cb.SBDEN = 'ORD' AND pc.MANv = nv.MANV AND pc.MACB = cb.MACB

/*8. Cho biết các chuyến bay (mã số chuyến bay, ngày đi và tên của phi
công) trong đó phi công có mã 1001 được phân công lái.*/

SELECT cb.MACB, pc.NGAYDI, nv.TENNV FROM dbo.CHUYENBAY cb, dbo.PHANCONG pc, dbo.NHANVIEN nv
WHERE nv.LOAINV = 1 AND nv.MANV = '1001' AND pc.MANv = nv.MANV AND pc.MACB = cb.MACB

/*9. Cho biết thông tin (mã chuyến bay, sân bay đi, giờ đi, giờ đến,
ngày đi) của những chuyến bay hạ cánh xuống DEN. Các chuyến bay
được liệt kê theo ngày đi giảm dần và sân bay xuất phát (SBDI) tăng
dần .*/

SELECT cb.MACB, cb.SBDI, cb.GIODI, cb.GIODEN, lb.NGAYDI FROM dbo.CHUYENBAY cb, dbo.LICHBAY lb
WHERE cb.SBDEN = 'DEN' AND cb.MACB = lb.MACB 
ORDER BY lb.NGAYDI DESC, cb.SBDI ASC 

/*10. Với mỗi phi công, cho biết hãng sản xuất và mã loại máy bay mà phi
công này có khả năng bay được. Xuất ra tên phi công, hãng sản xuất
và mã loại máy bay.*/

SELECT nv.TENNV, lmb.HANGSX, lmb.MALOAI FROM dbo.KHANANG kn, dbo.LOAIMB lmb, dbo.NHANVIEN nv
WHERE nv.MANV = kn.MANV AND lmb.MALOAI = kn.MALOAI

/*11. Cho biết mã phi công, tên phi công đã lái máy bay trong chuyến bay
mã số 100 vào ngày 11/01/2000.*/

SELECT nv.MANV, nv.TENNV FROM dbo.NHANVIEN nv, dbo.LICHBAY lb, dbo.PHANCONG pc
WHERE nv.LOAINV = 1 AND nv.MANV = pc.MANV AND pc.MACB = lb.MACB AND lb.NGAYDI = '2000/01/11' AND pc.MACB = '100' AND pc.NGAYDI = lb.NGAYDI


/*Cho biết mã chuyến bay, mã nhân viên, tên nhân viên được phân công vào chuyến bay xuất phát 
ngày 10/31/2000 tại sân bay MIA vào lúc 20:30*/

SELECT pc.MACB,nv.MANV,nv.TENNV FROM dbo.NHANVIEN nv, dbo.PHANCONG pc, dbo.CHUYENBAY cb, dbo.LICHBAY lb
WHERE lb.NGAYDI = '2000/10/31' AND cb.SBDI = 'MIA' 
AND cb.GIODI = '20:30'
AND pc.MACB = cb.MACB
AND pc.NGAYDI = lb.NGAYDI
AND pc.MANV = nv.MANV

