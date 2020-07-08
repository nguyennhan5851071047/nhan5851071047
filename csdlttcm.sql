create database QLCHDT
go
use QLCHDT
go

create table NhanVien (
MaNV nvarchar(100) primary key,
TenNV nvarchar(100),
ChucVu nvarchar(100),
NgayVaoLam date,
Luong int,
Gmail nvarchar(20),
SDT varchar(20),
)
go
insert into NhanVien values(N'NV01',N'Nhan',N'QuanLy','2/2/2020',676887,'',6775)
insert into NhanVien values(N'NV02',N'Minh',N'Thu Ngan','2/2/2020',676887,'',6775)

Create table TaiKhoan (
TenTaiKhoan nvarchar(100) primary key,
MatKhau nvarchar(100),
MaNV nvarchar(100),
foreign key(MaNV) references NhanVien(MaNV)
)
go
insert into TaiKhoan values(N'Admin',N'1234',N'NV01')
insert into TaiKhoan values(N'NhanVien',N'12345',N'NV02')


create table KhachHang
 (
  MaKH int identity(1,1) primary key,
  tenKH nvarchar(100),
  Ngaysinh date,
  SDT varchar(11) NULL,
  GmailKH nvarchar(50)
  )
  go
  insert into KhachHang values(N'Ha','3/3/1999','66466','') 

create table HoaDon
 (
  MaHD int identity(1,1) primary key,
  NgayLap date,
  MaNV nvarchar(100),
  MaKH int,
  TongTien int,
  TinhTrang bit,
  foreign key (MaNV) references NhanVien(MaNV),
  foreign key (MaKH) references KhachHang(MaKH),
  )
  go
  insert into HoaDon values ('7/7/2020',N'NV02',1,0,1)

create table LoaiDT
  (
   MaNhom nvarchar(100) primary key,
   TenNhom nvarchar(100)
  )
 go
 insert into LoaiDT values(N'Nhom1','SamSung')
create table SanPham
  (
   MaSP nvarchar(100) primary key,
   TenSP nvarchar(100),
   MaNhom nvarchar(100),
   HinhSP nvarchar(100)
   foreign key (MaNhom) references LoaiDT (MaNhom)
  )
  go
  insert into SanPham values (N'SP01','Note 9',N'Nhom1',N'')
 create table CTSP
  (
   MaSP nvarchar(100),
   MauSac nvarchar(100),
   
   GiaBan int,
   SoLuongTon int,
   primary key (MaSP,MauSac),
   foreign key (MaSP) references SanPham(MaSP)
   )
   go
   insert into CTSP values (N'SP01',N'Xám',775775,0)
 create table CTHoaDon
  (
   --MaCTHD nvarchar (100) primary key,

   MaHD int,
   MaSP nvarchar(100),
   MauSac nvarchar(100),
  
   SoLuongBan int,
   ThanhTien int

   primary key (MaHD, MaSP, MauSac )

   foreign key (MaHD) references HoaDon (MaHD),
   foreign key (MaSP) references SanPham (MaSP),
   )
   go
   insert into CTHoaDon values(1,N'SP01','Xám',2,0)
   SELECT *FROM PhieuNhap
 create table NhaCungCap
  (
   MaNCC nvarchar(100),
   TenNCC nvarchar(100),
   DiaChiNCC nvarchar(100),
   SDTNCC int,
   GmailNCC nvarchar(20),
   primary key (MaNCC)
   )
   go
   insert into NhaCungCap values(N'ncc1',N'Hoa Mai','ha noi',3636536,N'')
 create table PhieuNhap
  (
   MaPN int identity(1,1),
   NgayLapPN date,
   TongTienNhap int,
   TinhTrang bit,
   MaNCC nvarchar(100),
   MaNV nvarchar(100)
   primary key (MaPN),
   foreign key(MaNCC) references NhaCungCap(MaNCC),
   foreign key(MaNV) references NhanVien(MaNV)
   )
   go
   insert into PhieuNhap values ('2/2/2020',0,0,N'ncc1',N'NV02')
 create table CTNSP
  (
   MaPN int,
   MaSP nvarchar(100),
   MauSac nvarchar(100),
   GiaNhap int,
   SLNhap int,
   ThanhTien int
   
   primary key(MaPN, MaSP, MauSac),
   foreign key (MaPN) references PhieuNhap(MaPN),
   foreign key (MaSP) references SanPham(MaSP)
   )
   go
	insert into CTNSP values(1,N'SP01',N'Xám',20000,20,0)



