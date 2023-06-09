USE [master]
GO
/****** Object:  Database [QLBH]    Script Date: 4/5/2023 11:17:32 AM ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'QLBH')
BEGIN
CREATE DATABASE [QLBH]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLBH', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLBH.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QLBH_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLBH_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
END
GO
ALTER DATABASE [QLBH] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLBH].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLBH] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLBH] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLBH] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLBH] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLBH] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLBH] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLBH] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLBH] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLBH] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLBH] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLBH] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLBH] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLBH] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLBH] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLBH] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLBH] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLBH] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLBH] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLBH] SET RECOVERY FULL 
GO
ALTER DATABASE [QLBH] SET  MULTI_USER 
GO
ALTER DATABASE [QLBH] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLBH] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLBH] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLBH] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QLBH] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QLBH', N'ON'
GO
USE [QLBH]
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDDDH]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AUTO_IDDDH]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[AUTO_IDDDH]()
RETURNS NCHAR(10)
AS
BEGIN
	DECLARE @ID NCHAR(10)
	IF (SELECT COUNT(MSDDH)
	FROM DONDATHANG) = 0
		SET @ID = ''0''
	ELSE
		SELECT @ID = MAX(RIGHT(MSDDH, 8))
	FROM DONDATHANG
	SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN ''DH0000000'' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN ''DH000000'' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDHD]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AUTO_IDHD]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[AUTO_IDHD]()
RETURNS NCHAR(10)
AS
BEGIN
	DECLARE @ID NCHAR(10)
	IF (SELECT COUNT(SOHD)
	FROM HOADON) = 0
		SET @ID = ''0''
	ELSE
		SELECT @ID = MAX(RIGHT(SOHD, 8))
	FROM HOADON
	SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN ''HD0000000'' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN ''HD000000'' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END
' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDKH]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AUTO_IDKH]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[AUTO_IDKH]()
RETURNS NCHAR(10)
AS
BEGIN
	DECLARE @ID NCHAR(10)
	IF (SELECT COUNT(MAKH)
	FROM KHACHHANG) = 0
		SET @ID = ''0''
	ELSE
		SELECT @ID = MAX(RIGHT(MAKH, 8))
	FROM KHACHHANG
	SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN ''KH0000000'' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN ''KH000000'' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDNV]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AUTO_IDNV]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[AUTO_IDNV]()
RETURNS NCHAR(10)
AS
BEGIN
	DECLARE @ID NCHAR(10)
	IF (SELECT COUNT(MANV)
	FROM NHANVIEN) = 0
		SET @ID = ''0''
	ELSE
		SELECT @ID = MAX(RIGHT(MANV, 8))
	FROM NHANVIEN
	SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN ''NV0000000'' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN ''NV000000'' + CONVERT(NCHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END' 
END
GO
/****** Object:  UserDefinedFunction [dbo].[AUTO_IDSP]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AUTO_IDSP]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'CREATE FUNCTION [dbo].[AUTO_IDSP]()
RETURNS NCHAR(10)
AS
BEGIN
	DECLARE @ID NCHAR(10)
	IF (SELECT COUNT(MASP)
	FROM SANPHAM) = 0
		SET @ID = ''0''
	ELSE
		SELECT @ID = MAX(RIGHT(MASP, 8))
	FROM SANPHAM
	SELECT @ID = CASE
			WHEN @ID >= 0 and @ID < 9 THEN ''SP0000000'' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
			WHEN @ID >= 9 THEN ''SP000000'' + CONVERT(CHAR, CONVERT(INT, @ID) + 1)
		END
	RETURN @ID
END' 
END
GO
/****** Object:  Table [dbo].[CTDDH]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CTDDH]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CTDDH](
	[MSDDH] [nchar](10) NOT NULL,
	[MASP] [nchar](10) NOT NULL,
	[SL] [int] NOT NULL,
	[ID] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_CTDDH_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DONDATHANG]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DONDATHANG]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DONDATHANG](
	[MSDDH] [nchar](10) NOT NULL,
	[DIACHI] [nvarchar](100) NOT NULL,
	[SDT] [nchar](10) NOT NULL,
	[TRANGTHAI] [nchar](10) NOT NULL,
	[MAKH] [nchar](10) NULL,
	[EMAIL] [nchar](100) NOT NULL,
 CONSTRAINT [PK_DONDATHANG] PRIMARY KEY CLUSTERED 
(
	[MSDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[DSTAIKHOAN]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DSTAIKHOAN]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DSTAIKHOAN](
	[TAIKHOAN] [nchar](200) NOT NULL,
	[MATKHAU] [nvarchar](200) NOT NULL,
	[CHUCVU] [nchar](10) NOT NULL,
 CONSTRAINT [PK_DSTAIKHOAN] PRIMARY KEY CLUSTERED 
(
	[TAIKHOAN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HOADON]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HOADON]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HOADON](
	[SOHD] [nchar](10) NOT NULL,
	[NGAYLAPHD] [date] NOT NULL,
	[MANV] [nchar](10) NOT NULL,
	[TONGGIA] [float] NOT NULL,
	[MSDDH] [nchar](10) NOT NULL,
 CONSTRAINT [PK_HOADON] PRIMARY KEY CLUSTERED 
(
	[SOHD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[KHACHHANG]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[KHACHHANG]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[KHACHHANG](
	[MAKH] [nchar](10) NOT NULL,
	[HOTEN] [nvarchar](100) NOT NULL,
	[DIACHI] [nvarchar](100) NOT NULL,
	[SDT] [nchar](10) NOT NULL,
	[EMAIL] [nchar](200) NOT NULL,
	[NGAYSINH] [date] NULL,
	[GIOITINH] [bit] NOT NULL,
 CONSTRAINT [PK_KHACHHANG] PRIMARY KEY CLUSTERED 
(
	[MAKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[NHANVIEN]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[NHANVIEN]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[NHANVIEN](
	[MANV] [nchar](10) NOT NULL,
	[HOTEN] [nvarchar](100) NOT NULL,
	[SDT] [nchar](10) NOT NULL,
	[NGAYVAOLAM] [date] NOT NULL,
	[HINHANH] [nchar](100) NULL,
	[EMAIL] [nchar](200) NOT NULL,
	[DIACHI] [nvarchar](100) NULL,
	[NGAYSINH] [date] NOT NULL,
	[TRANGTHAI] [bit] NOT NULL,
	[GIOITINH] [bit] NOT NULL,
 CONSTRAINT [PK_NHANVIEN] PRIMARY KEY CLUSTERED 
(
	[MANV] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[SANPHAM]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SANPHAM]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SANPHAM](
	[MASP] [nchar](10) NOT NULL,
	[TENSP] [nvarchar](50) NOT NULL,
	[LOAISP] [nvarchar](50) NOT NULL,
	[NUOCSX] [nvarchar](50) NOT NULL,
	[NGAYTHEM] [date] NOT NULL,
	[DONGIA] [float] NOT NULL,
	[MOTA] [ntext] NOT NULL,
	[SOLUONGTON] [int] NOT NULL,
	[HINHANH] [nchar](500) NOT NULL,
	[SALE] [float] NOT NULL,
	[TRANGTHAIXOA] [bit] NOT NULL,
 CONSTRAINT [PK_SANPHAM] PRIMARY KEY CLUSTERED 
(
	[MASP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  View [dbo].[V_GETLIST_KH]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_GETLIST_KH]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[V_GETLIST_KH]
as
      SELECT MAKH, HOTEN, SDT, DIACHI, EMAIL, GIOITINH
            ,CONVERT(VARCHAR(10), NGAYSINH , 103) NGAYSINH
      FROM KHACHHANG
' 
GO
/****** Object:  View [dbo].[V_GETLIST_NV]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_GETLIST_NV]'))
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[V_GETLIST_NV]
as
      SELECT MANV, HOTEN, SDT, DIACHI, EMAIL, TRANGTHAI, HINHANH, GIOITINH
            ,CONVERT(VARCHAR(10), NGAYSINH , 103) NGAYSINH,
			CONVERT(VARCHAR(10), NGAYVAOLAM , 103) NGAYVAOLAM
      FROM NHANVIEN' 
GO
/****** Object:  View [dbo].[V_GETLIST_SP]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_GETLIST_SP]'))
EXEC dbo.sp_executesql @statement = N'

CREATE VIEW [dbo].[V_GETLIST_SP]
as
      SELECT MASP, TENSP, LOAISP, NUOCSX, CONVERT(VARCHAR(10), NGAYTHEM , 103) NGAYTHEM, DONGIA, MOTA, SOLUONGTON, HINHANH, SALE, TRANGTHAIXOA
            
      FROM SANPHAM
' 
GO
/****** Object:  View [dbo].[V_GETLIST_TYPE]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[V_GETLIST_TYPE]'))
EXEC dbo.sp_executesql @statement = N'
CREATE VIEW [dbo].[V_GETLIST_TYPE]
as
      SELECT distinct LOAISP
      FROM SANPHAM
' 
GO
INSERT [dbo].[DSTAIKHOAN] ([TAIKHOAN], [MATKHAU], [CHUCVU]) VALUES (N'bao@gmail.com                                                                                                                                                                                           ', N'$2b$10$rL.x1TLBJ0rFfc3fMM8xoOpsYJ5MXlTLvm6nrE1d2qOIkP7tOyFLq', N'khachhang ')
INSERT [dbo].[DSTAIKHOAN] ([TAIKHOAN], [MATKHAU], [CHUCVU]) VALUES (N'ha@gmail.com                                                                                                                                                                                            ', N'$2b$10$EVQ.wE0J0giatFO7.tMTCeccygF2VsbPutDTIrpjWVikzVve3HZNG', N'khachhang ')
INSERT [dbo].[DSTAIKHOAN] ([TAIKHOAN], [MATKHAU], [CHUCVU]) VALUES (N'kh1@gmail.com                                                                                                                                                                                           ', N'$2b$10$1ea/ul/B83joAlbbs9JWrOpdJ19/quZV8nfFzrAgoTQM8w.LC91Gm', N'khachhang ')
INSERT [dbo].[DSTAIKHOAN] ([TAIKHOAN], [MATKHAU], [CHUCVU]) VALUES (N'kh2@gmail.com                                                                                                                                                                                           ', N'$2b$10$XIRq7px7Ni5O8noZ9CDgrOn0zAhxFVR20OioXw1FBBzgYqUuNU.9q', N'khachhang ')
INSERT [dbo].[DSTAIKHOAN] ([TAIKHOAN], [MATKHAU], [CHUCVU]) VALUES (N'kh3@gmail.com                                                                                                                                                                                           ', N'$2b$10$JhV6OXOFH2a0tEFiPgFoz.vpICNcWd9jQ34tI2sNeMrLiNP/U9gla', N'khachhang ')
INSERT [dbo].[DSTAIKHOAN] ([TAIKHOAN], [MATKHAU], [CHUCVU]) VALUES (N'minh@gmail.com                                                                                                                                                                                          ', N'$2b$10$Wgvp6cL2UEvhKfM0mCBKJ.k7qkYj9UGrZ.FiC9Q1RyANi3DQGUOEK', N'khachhang ')
INSERT [dbo].[DSTAIKHOAN] ([TAIKHOAN], [MATKHAU], [CHUCVU]) VALUES (N'nv1@gmail.com                                                                                                                                                                                           ', N'$2b$10$LgMqDzB6Y3cRTcy/af7VZe5.viaN2q/FE.GWH0wcAsWBmZ5TRln1K', N'nhanvien  ')
INSERT [dbo].[DSTAIKHOAN] ([TAIKHOAN], [MATKHAU], [CHUCVU]) VALUES (N'nv2@gmail.com                                                                                                                                                                                           ', N'$2b$10$1vMMp/oMOAnx5Sy445FpGuRa13OCBD/iMNXzUrp/PzsfDvo2nZCi.', N'nhanvien  ')
INSERT [dbo].[DSTAIKHOAN] ([TAIKHOAN], [MATKHAU], [CHUCVU]) VALUES (N'phu@gmail.com                                                                                                                                                                                           ', N'$2b$10$mIkHE3OD4ZZwb2DCUqwi7.V.edxHcQcgT4qnkda647GGPBpo4oECm', N'khachhang ')
INSERT [dbo].[DSTAIKHOAN] ([TAIKHOAN], [MATKHAU], [CHUCVU]) VALUES (N'vy279.thpt@gmail.com                                                                                                                                                                                    ', N'$2b$10$wU61l62pBPdU.gLM3sHcYe67gDa7dSZSjLtXDRzqg4VmIRSGtyAbK', N'khachhang ')
GO
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [DIACHI], [SDT], [EMAIL], [NGAYSINH], [GIOITINH]) VALUES (N'KH00000001', N'Tuấn', N'quận 9', N'0945826358', N'kh1@gmail.com                                                                                                                                                                                           ', CAST(N'1999-12-20' AS Date), 1)
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [DIACHI], [SDT], [EMAIL], [NGAYSINH], [GIOITINH]) VALUES (N'KH00000002', N'Hòa', N'quận 9', N'0945826358', N'kh2@gmail.com                                                                                                                                                                                           ', CAST(N'1999-12-20' AS Date), 1)
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [DIACHI], [SDT], [EMAIL], [NGAYSINH], [GIOITINH]) VALUES (N'KH00000003', N'Chi', N'quận 9', N'0945826358', N'kh3@gmail.com                                                                                                                                                                                           ', CAST(N'1999-12-20' AS Date), 1)
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [DIACHI], [SDT], [EMAIL], [NGAYSINH], [GIOITINH]) VALUES (N'KH00000004', N'Minh', N'quận cam', N'0945826358', N'minh@gmail.com                                                                                                                                                                                          ', CAST(N'1999-12-20' AS Date), 1)
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [DIACHI], [SDT], [EMAIL], [NGAYSINH], [GIOITINH]) VALUES (N'KH00000005', N'ha', N'quận 8', N'091185    ', N'ha@gmail.com                                                                                                                                                                                            ', CAST(N'1995-01-01' AS Date), 0)
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [DIACHI], [SDT], [EMAIL], [NGAYSINH], [GIOITINH]) VALUES (N'KH00000006', N'Phú', N'quận 12', N'0158632555', N'phu@gmail.com                                                                                                                                                                                           ', CAST(N'1995-01-01' AS Date), 1)
INSERT [dbo].[KHACHHANG] ([MAKH], [HOTEN], [DIACHI], [SDT], [EMAIL], [NGAYSINH], [GIOITINH]) VALUES (N'KH00000007', N'bao', N'quận 8', N'091185    ', N'bao@gmail.com                                                                                                                                                                                           ', CAST(N'2023-04-28' AS Date), 1)
GO
INSERT [dbo].[NHANVIEN] ([MANV], [HOTEN], [SDT], [NGAYVAOLAM], [HINHANH], [EMAIL], [DIACHI], [NGAYSINH], [TRANGTHAI], [GIOITINH]) VALUES (N'NV00000001', N'AN', N'09990     ', CAST(N'2022-12-02' AS Date), N'DDD.JPG                                                                                             ', N'nv1@gmail.com                                                                                                                                                                                           ', N'QUAN 9', CAST(N'2000-12-02' AS Date), 1, 1)
INSERT [dbo].[NHANVIEN] ([MANV], [HOTEN], [SDT], [NGAYVAOLAM], [HINHANH], [EMAIL], [DIACHI], [NGAYSINH], [TRANGTHAI], [GIOITINH]) VALUES (N'NV00000002', N'LINH', N'09990     ', CAST(N'2022-12-02' AS Date), N'DDD.JPG                                                                                             ', N'nv2@gmail.com                                                                                                                                                                                           ', N'QUAN 9', CAST(N'2000-12-02' AS Date), 1, 1)
GO
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [LOAISP], [NUOCSX], [NGAYTHEM], [DONGIA], [MOTA], [SOLUONGTON], [HINHANH], [SALE], [TRANGTHAIXOA]) VALUES (N'SP00000001', N'ht', N'Học tập', N'VN', CAST(N'2023-03-20' AS Date), 100, N'mmm', 10, N'https://i.ibb.co/q0XRdQW/No-data-rafiki.png                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', 0.5, 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [LOAISP], [NUOCSX], [NGAYTHEM], [DONGIA], [MOTA], [SOLUONGTON], [HINHANH], [SALE], [TRANGTHAIXOA]) VALUES (N'SP00000002', N'mh', N'Mô hình', N'VN', CAST(N'2023-04-04' AS Date), 100, N'mmm', 5, N'https://i.ibb.co/q0XRdQW/No-data-rafiki.png                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', 0.1, 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [LOAISP], [NUOCSX], [NGAYTHEM], [DONGIA], [MOTA], [SOLUONGTON], [HINHANH], [SALE], [TRANGTHAIXOA]) VALUES (N'SP00000003', N'lr', N'Lắp ráp', N'USA', CAST(N'2023-02-10' AS Date), 500000, N'', 0, N'https://i.ibb.co/q0XRdQW/No-data-rafiki.png                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', 0, 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [LOAISP], [NUOCSX], [NGAYTHEM], [DONGIA], [MOTA], [SOLUONGTON], [HINHANH], [SALE], [TRANGTHAIXOA]) VALUES (N'SP00000004', N'xh', N'Xếp hình', N'ISA', CAST(N'2023-01-10' AS Date), 550000, N'', 5, N'https://i.ibb.co/q0XRdQW/No-data-rafiki.png                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', 0, 0)
INSERT [dbo].[SANPHAM] ([MASP], [TENSP], [LOAISP], [NUOCSX], [NGAYTHEM], [DONGIA], [MOTA], [SOLUONGTON], [HINHANH], [SALE], [TRANGTHAIXOA]) VALUES (N'SP00000005', N'nt', N'Ngoài trời', N'update', CAST(N'2023-04-01' AS Date), 500000, N'update', 5, N'https://i.ibb.co/q0XRdQW/No-data-rafiki.png                                                                                                                                                                                                                                                                                                                                                                                                                                                                         ', 0.3, 0)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_HOADON]    Script Date: 4/5/2023 11:17:32 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[HOADON]') AND name = N'IX_HOADON')
ALTER TABLE [dbo].[HOADON] ADD  CONSTRAINT [IX_HOADON] UNIQUE NONCLUSTERED 
(
	[MSDDH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_KHACHHANG]    Script Date: 4/5/2023 11:17:32 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[KHACHHANG]') AND name = N'UK_KHACHHANG')
ALTER TABLE [dbo].[KHACHHANG] ADD  CONSTRAINT [UK_KHACHHANG] UNIQUE NONCLUSTERED 
(
	[EMAIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_EMAIL]    Script Date: 4/5/2023 11:17:32 AM ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[NHANVIEN]') AND name = N'UK_EMAIL')
ALTER TABLE [dbo].[NHANVIEN] ADD  CONSTRAINT [UK_EMAIL] UNIQUE NONCLUSTERED 
(
	[EMAIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_DONDATHANG_MSDDH]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DONDATHANG] ADD  CONSTRAINT [DF_DONDATHANG_MSDDH]  DEFAULT ([dbo].[AUTO_IDDDH]()) FOR [MSDDH]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_HOADON_SOHD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[HOADON] ADD  CONSTRAINT [DF_HOADON_SOHD]  DEFAULT ([dbo].[AUTO_IDHD]()) FOR [SOHD]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_KHACHHANG_MAKH]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[KHACHHANG] ADD  CONSTRAINT [DF_KHACHHANG_MAKH]  DEFAULT ([dbo].[AUTO_IDKH]()) FOR [MAKH]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_NHANVIEN_MANV]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[NHANVIEN] ADD  CONSTRAINT [DF_NHANVIEN_MANV]  DEFAULT ([dbo].[AUTO_IDNV]()) FOR [MANV]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SANPHAM_MASP]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SANPHAM] ADD  CONSTRAINT [DF_SANPHAM_MASP]  DEFAULT ([dbo].[AUTO_IDSP]()) FOR [MASP]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SANPHAM_NUOCSX]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SANPHAM] ADD  CONSTRAINT [DF_SANPHAM_NUOCSX]  DEFAULT ([dbo].[AUTO_IDSP]()) FOR [NUOCSX]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SANPHAM_NGAYTHEM]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SANPHAM] ADD  CONSTRAINT [DF_SANPHAM_NGAYTHEM]  DEFAULT (getdate()) FOR [NGAYTHEM]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SANPHAM_SALE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SANPHAM] ADD  CONSTRAINT [DF_SANPHAM_SALE]  DEFAULT ((0)) FOR [SALE]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CTDDH_DONDATHANG]') AND parent_object_id = OBJECT_ID(N'[dbo].[CTDDH]'))
ALTER TABLE [dbo].[CTDDH]  WITH CHECK ADD  CONSTRAINT [FK_CTDDH_DONDATHANG] FOREIGN KEY([MSDDH])
REFERENCES [dbo].[DONDATHANG] ([MSDDH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CTDDH_DONDATHANG]') AND parent_object_id = OBJECT_ID(N'[dbo].[CTDDH]'))
ALTER TABLE [dbo].[CTDDH] CHECK CONSTRAINT [FK_CTDDH_DONDATHANG]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CTDDH_SANPHAM]') AND parent_object_id = OBJECT_ID(N'[dbo].[CTDDH]'))
ALTER TABLE [dbo].[CTDDH]  WITH CHECK ADD  CONSTRAINT [FK_CTDDH_SANPHAM] FOREIGN KEY([MASP])
REFERENCES [dbo].[SANPHAM] ([MASP])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CTDDH_SANPHAM]') AND parent_object_id = OBJECT_ID(N'[dbo].[CTDDH]'))
ALTER TABLE [dbo].[CTDDH] CHECK CONSTRAINT [FK_CTDDH_SANPHAM]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DONDATHANG_KHACHHANG]') AND parent_object_id = OBJECT_ID(N'[dbo].[DONDATHANG]'))
ALTER TABLE [dbo].[DONDATHANG]  WITH CHECK ADD  CONSTRAINT [FK_DONDATHANG_KHACHHANG] FOREIGN KEY([MAKH])
REFERENCES [dbo].[KHACHHANG] ([MAKH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_DONDATHANG_KHACHHANG]') AND parent_object_id = OBJECT_ID(N'[dbo].[DONDATHANG]'))
ALTER TABLE [dbo].[DONDATHANG] CHECK CONSTRAINT [FK_DONDATHANG_KHACHHANG]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HOADON_DONDATHANG]') AND parent_object_id = OBJECT_ID(N'[dbo].[HOADON]'))
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HOADON_DONDATHANG] FOREIGN KEY([MSDDH])
REFERENCES [dbo].[DONDATHANG] ([MSDDH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HOADON_DONDATHANG]') AND parent_object_id = OBJECT_ID(N'[dbo].[HOADON]'))
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HOADON_DONDATHANG]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HOADON_NHANVIEN]') AND parent_object_id = OBJECT_ID(N'[dbo].[HOADON]'))
ALTER TABLE [dbo].[HOADON]  WITH CHECK ADD  CONSTRAINT [FK_HOADON_NHANVIEN] FOREIGN KEY([MANV])
REFERENCES [dbo].[NHANVIEN] ([MANV])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HOADON_NHANVIEN]') AND parent_object_id = OBJECT_ID(N'[dbo].[HOADON]'))
ALTER TABLE [dbo].[HOADON] CHECK CONSTRAINT [FK_HOADON_NHANVIEN]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_KHACHHANG_DSTAIKHOAN]') AND parent_object_id = OBJECT_ID(N'[dbo].[KHACHHANG]'))
ALTER TABLE [dbo].[KHACHHANG]  WITH CHECK ADD  CONSTRAINT [FK_KHACHHANG_DSTAIKHOAN] FOREIGN KEY([EMAIL])
REFERENCES [dbo].[DSTAIKHOAN] ([TAIKHOAN])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_KHACHHANG_DSTAIKHOAN]') AND parent_object_id = OBJECT_ID(N'[dbo].[KHACHHANG]'))
ALTER TABLE [dbo].[KHACHHANG] CHECK CONSTRAINT [FK_KHACHHANG_DSTAIKHOAN]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NHANVIEN_DSTAIKHOAN]') AND parent_object_id = OBJECT_ID(N'[dbo].[NHANVIEN]'))
ALTER TABLE [dbo].[NHANVIEN]  WITH CHECK ADD  CONSTRAINT [FK_NHANVIEN_DSTAIKHOAN] FOREIGN KEY([EMAIL])
REFERENCES [dbo].[DSTAIKHOAN] ([TAIKHOAN])
ON UPDATE CASCADE
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_NHANVIEN_DSTAIKHOAN]') AND parent_object_id = OBJECT_ID(N'[dbo].[NHANVIEN]'))
ALTER TABLE [dbo].[NHANVIEN] CHECK CONSTRAINT [FK_NHANVIEN_DSTAIKHOAN]
GO
/****** Object:  StoredProcedure [dbo].[SP_CAP_NHAT_KHACH_HANG]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_CAP_NHAT_KHACH_HANG]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_CAP_NHAT_KHACH_HANG] AS' 
END
GO
ALTER PROC [dbo].[SP_CAP_NHAT_KHACH_HANG]
    @MAKH Nchar(10),
	@HOTEN Nvarchar(100),
	@SDT Nchar(10),
	@TAIKHOAN Nvarchar(50),
	@DOANHSO Float,
	@EMAIL Nchar(100),
	@DIACHI Nvarchar(100),
	@NGAYSINH Date,
	@GIOITINH Bit
AS
BEGIN
	UPDATE KHACHHANG
	SET HOTEN = @HOTEN, SDT = @SDT, TAIKHOAN = @TAIKHOAN, DOANHSO = @DOANHSO, EMAIL = @EMAIL
	, DIACHI = @DIACHI, NGAYSINH = @NGAYSINH, GIOITINH = @GIOITINH WHERE MAKH = @MAKH
	RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CAP_NHAT_NHAN_VIEN]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_CAP_NHAT_NHAN_VIEN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_CAP_NHAT_NHAN_VIEN] AS' 
END
GO
ALTER PROC [dbo].[SP_CAP_NHAT_NHAN_VIEN]
    @MANV Nchar(10),
	@HOTEN Nvarchar(100),
	@SDT Nchar(10),
	@NGAYVAOLAM Date,
	@TRANGTHAI Bit,
	@HINHANH Nchar(100),
	@EMAIL Nchar(100),
	@DIACHI Nvarchar(100),
	@NGAYSINH Date,
	@GIOITINH Bit
AS
BEGIN
	UPDATE NHANVIEN
	SET HOTEN = @HOTEN, SDT = @SDT, NGAYVAOLAM = @NGAYVAOLAM, TRANGTHAI = @TRANGTHAI, HINHANH = @HINHANH
	, EMAIL = @EMAIL, DIACHI = @DIACHI, NGAYSINH = @NGAYSINH, GIOITINH = @GIOITINH WHERE MANV = @MANV
	RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CAP_NHAT_SAN_PHAM]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_CAP_NHAT_SAN_PHAM]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_CAP_NHAT_SAN_PHAM] AS' 
END
GO
ALTER PROC [dbo].[SP_CAP_NHAT_SAN_PHAM]
    @MASP Nchar(10),
	@TENSP Nvarchar(50),
	@LOAISP Nvarchar(50),
	@NUOCSX Nvarchar(50),
	@DONGIA Money,
	@MOTA ntext,
	@SOLUONGTON  Int,
	@HINHANH Nchar(200),
	@SALE Float,
	@TRANGTHAIXOA Bit
AS
BEGIN
	UPDATE SANPHAM
	SET TENSP = @TENSP, LOAISP = @LOAISP, NUOCSX = @NUOCSX, DONGIA = @DONGIA, MOTA = @MOTA
	, SOLUONGTON = @SOLUONGTON, HINHANH = @HINHANH, SALE = @SALE, TRANGTHAIXOA = @TRANGTHAIXOA WHERE MASP = @MASP
	RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_DANG_KY]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_DANG_KY]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_DANG_KY] AS' 
END
GO

ALTER PROC [dbo].[SP_DANG_KY]
	@HOTEN Nvarchar(100),
	@SDT Nchar(10),
	@MATKHAU Nvarchar(50),
	@EMAIL Nchar(100),
	@DIACHI Nvarchar(100),
	@NGAYSINH Date,
	@GIOITINH Bit
AS
BEGIN
IF EXISTS (SELECT MAKH FROM KHACHHANG WHERE EMAIL = @EMAIL)
		RETURN 0
ELSE
SET XACT_ABORT ON;

BEGIN TRANSACTION

   INSERT INTO DSTAIKHOAN (TAIKHOAN, MATKHAU, CHUCVU) 
     VALUES (@EMAIL, @MATKHAU, 'khachhang');

   INSERT INTO KHACHHANG
		(HOTEN, DIACHI, SDT, EMAIL, NGAYSINH, GIOITINH)
	VALUES
		(@HOTEN, @DIACHI, @SDT, @EMAIL, @NGAYSINH, @GIOITINH)
COMMIT
		return 1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_LOC_SP]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_LOC_SP]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_LOC_SP] AS' 
END
GO

ALTER PROC [dbo].[SP_LOC_SP]
	@LOAISP NVARCHAR(50),
	@GIA int,
	@TYPE NVARCHAR(50)
AS
BEGIN
if(@TYPE=N'Sale' AND @GIA=0)
CREATE TABLE #Tmp
(   TENSP Nvarchar(50),
	LOAISP Nvarchar(50),
	NUOCSX Nvarchar(50),
	NGAYTHEM Date,
	DONGIA MOney,
	MOTA ntext,
	SOLUONGTON  Int,
	HINHANH Nchar(100),
	SALE Float,
	TRANGTHAIXOA Int)
INSERT INTO #Tmp

  EXEC SP_SAN_PHAM_SALE 0
SELECT * FROM #Tmp
WHERE LOAISP = @LOAISP ORDER BY DONGIA ASC

DROP TABLE #Tmp
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SAN_PHAM_BAN_CHAY]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_SAN_PHAM_BAN_CHAY]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_SAN_PHAM_BAN_CHAY] AS' 
END
GO
ALTER PROC [dbo].[SP_SAN_PHAM_BAN_CHAY]
	@KEY Int
AS
BEGIN
  IF @KEY > 0
      select TOP(@KEY) * from SANPHAM
 WHERE MASP IN ( SELECT MASP FROM CTDDH GROUP BY MASP ORDER BY SUM(SL) DESC OFFSET 0 ROWS) AND TRANGTHAIXOA = 'false' AND SOLUONGTON > 0
  ELSE 
     select * from SANPHAM
 WHERE MASP IN ( SELECT MASP FROM CTDDH GROUP BY MASP ORDER BY SUM(SL) DESC OFFSET 0 ROWS) AND TRANGTHAIXOA = 'false' AND SOLUONGTON > 0
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SAN_PHAM_NEW]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_SAN_PHAM_NEW]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_SAN_PHAM_NEW] AS' 
END
GO

ALTER PROC [dbo].[SP_SAN_PHAM_NEW]
	@KEY Int
AS
BEGIN
  IF @KEY > 0
     SELECT TOP(@KEY) * FROM SANPHAM WHERE TRANGTHAIXOA = 'false' AND SOLUONGTON > 0 ORDER BY NGAYTHEM DESC
  ELSE 
     SELECT * FROM SANPHAM WHERE TRANGTHAIXOA = 'false' AND SOLUONGTON > 0 ORDER BY NGAYTHEM DESC
END
GO
/****** Object:  StoredProcedure [dbo].[SP_SAN_PHAM_SALE]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_SAN_PHAM_SALE]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_SAN_PHAM_SALE] AS' 
END
GO
ALTER PROC [dbo].[SP_SAN_PHAM_SALE]
	@KEY Int
AS
BEGIN
  IF @KEY > 0
     SELECT TOP(@KEY) * FROM SANPHAM WHERE SALE > 0 AND TRANGTHAIXOA = 'false' AND SOLUONGTON > 0 ORDER BY SALE DESC
  ELSE 
     SELECT * FROM SANPHAM WHERE SALE > 0 AND TRANGTHAIXOA = 'false' AND SOLUONGTON > 0 ORDER BY SALE DESC
END
GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_KHACH_HANG]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_THEM_KHACH_HANG]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_THEM_KHACH_HANG] AS' 
END
GO
ALTER PROC [dbo].[SP_THEM_KHACH_HANG]
	@HOTEN Nvarchar(100),
	@SDT Nchar(10),
	@EMAIL Nchar(100),
	@DIACHI Nvarchar(100),
	@NGAYSINH Date,
	@GIOITINH Bit
AS
BEGIN
	INSERT INTO KHACHHANG
		(HOTEN, DIACHI, SDT, EMAIL, NGAYSINH, GIOITINH)
	VALUES
		(@HOTEN, @DIACHI, @SDT, @EMAIL, @NGAYSINH, @GIOITINH)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_NHAN_VIEN]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_THEM_NHAN_VIEN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_THEM_NHAN_VIEN] AS' 
END
GO
ALTER PROC [dbo].[SP_THEM_NHAN_VIEN]
	@HOTEN Nvarchar(100),
	@SDT Nchar(10),
	@NGAYVAOLAM Date,
	@TRANGTHAI Bit,
	@HINHANH Nvarchar(100),
	@Email Nchar(100),
	@DIACHI Nvarchar(100),
	@NGAYSINH Date,
	@GIOITINH Bit
AS
BEGIN
	INSERT INTO NHANVIEN
		(HOTEN, SDT, NGAYVAOLAM, HINHANH, EMAIL, DIACHI, NGAYSINH, TRANGTHAI, GIOITINH)
	VALUES
		(@HOTEN, @SDT, @NGAYVAOLAM, @HINHANH, @EMAIL, @DIACHI, @NGAYSINH, @TRANGTHAI, @GIOITINH)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_THEM_SAN_PHAM]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_THEM_SAN_PHAM]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_THEM_SAN_PHAM] AS' 
END
GO
ALTER PROC [dbo].[SP_THEM_SAN_PHAM]
	@TENSP Nvarchar(50),
	@LOAISP Nvarchar(50),
	@NUOCSX Nvarchar(50),
	@DONGIA MOney,
	@MOTA ntext,
	@SOLUONGTON  Int,
	@HINHANH Nchar(100),
	@SALE Float,
	@TRANGTHAIXOA Int
AS
BEGIN
	INSERT INTO SANPHAM
		(TENSP, LOAISP, NUOCSX, DONGIA, MOTA, SOLUONGTON, HINHANH, SALE, TRANGTHAIXOA)
	VALUES
		(@TENSP, @LOAISP, @NUOCSX, @DONGIA, @MOTA, @SOLUONGTON, @HINHANH, @SALE, @TRANGTHAIXOA)
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TIM_KIEM_KHACH_HANG]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_TIM_KIEM_KHACH_HANG]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_TIM_KIEM_KHACH_HANG] AS' 
END
GO
ALTER PROC [dbo].[SP_TIM_KIEM_KHACH_HANG]
	@KEY NVARCHAR(50)
AS
BEGIN
	SELECT MAKH, HOTEN, DIACHI, SDT, EMAIL, CONVERT(VARCHAR(10), NGAYSINH , 103) NGAYSINH, DOANHSO, GIOITINH
	FROM KHACHHANG
	WHERE HOTEN LIKE '%' + @KEY + '%' OR MAKH LIKE '%' + @KEY + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TIM_KIEM_NHAN_VIEN]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_TIM_KIEM_NHAN_VIEN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_TIM_KIEM_NHAN_VIEN] AS' 
END
GO
ALTER PROC [dbo].[SP_TIM_KIEM_NHAN_VIEN]
	@KEY NVARCHAR(50)
AS
BEGIN
	SELECT MANV, HOTEN, SDT, CONVERT(VARCHAR(10), NGAYVAOLAM, 103) NGAYVAOLAM, HINHANH, EMAIL, DIACHI, CONVERT(VARCHAR(10), NGAYSINH , 103) NGAYSINH, TRANGTHAI, GIOITINH
	FROM NHANVIEN
	WHERE HOTEN LIKE '%' + @KEY + '%' OR MANV LIKE '%' + @KEY + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_TIM_KIEM_SAN_PHAM]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_TIM_KIEM_SAN_PHAM]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_TIM_KIEM_SAN_PHAM] AS' 
END
GO
ALTER PROC [dbo].[SP_TIM_KIEM_SAN_PHAM]
	@KEY NVARCHAR(50)
AS
BEGIN
	SELECT *
	FROM SANPHAM
	WHERE TENSP LIKE '%' + @KEY + '%' OR MASP LIKE '%' + @KEY + '%'
END
GO
/****** Object:  StoredProcedure [dbo].[SP_XOA_KHACH_HANG]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_XOA_KHACH_HANG]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_XOA_KHACH_HANG] AS' 
END
GO
ALTER PROC [dbo].[SP_XOA_KHACH_HANG]
	@MAKH NCHAR(10)
AS
BEGIN
	IF EXISTS (SELECT MAKH
	FROM DONDATHANG
	WHERE MAKH = @MAKH)
		RETURN 0 
	
	ELSE
	  DELETE KHACHHANG WHERE MAKH = @MAKH
	RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_XOA_NHAN_VIEN]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_XOA_NHAN_VIEN]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_XOA_NHAN_VIEN] AS' 
END
GO
ALTER PROC [dbo].[SP_XOA_NHAN_VIEN]
	@MANV NCHAR(10)
AS
BEGIN
	IF EXISTS (SELECT MANV
	FROM HOADON
	WHERE MANV = @MANV)
		RETURN 0 
	
	ELSE
	  DELETE NHANVIEN WHERE MANV = @MANV
	RETURN 1
END
GO
/****** Object:  StoredProcedure [dbo].[SP_XOA_SAN_PHAM]    Script Date: 4/5/2023 11:17:32 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SP_XOA_SAN_PHAM]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SP_XOA_SAN_PHAM] AS' 
END
GO
ALTER PROC [dbo].[SP_XOA_SAN_PHAM]
	@MASP NCHAR(10)
AS
BEGIN
	IF EXISTS (SELECT MASP
	FROM CTDDH
	WHERE MASP = @MASP)
		RETURN 0 
	
	ELSE
	  DELETE SANPHAM WHERE MASP = @MASP
	RETURN 1
END
GO
USE [master]
GO
ALTER DATABASE [QLBH] SET  READ_WRITE 
GO
