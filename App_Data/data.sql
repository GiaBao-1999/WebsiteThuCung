USE [PetShop]
GO
/****** Object:  Table [dbo].[NguoiQuanTri]    Script Date: 11/26/2019 17:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NguoiQuanTri](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [varchar](100) NULL,
	[QuyenQuanTri] [int] NULL,
 CONSTRAINT [PK_NguoiQuanTri] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[NguoiQuanTri] ON
INSERT [dbo].[NguoiQuanTri] ([ID], [Username], [Password], [QuyenQuanTri]) VALUES (1, N'admin', N'A906449D5769FA7361D7ECC6AA3F6D28', 1)
SET IDENTITY_INSERT [dbo].[NguoiQuanTri] OFF
/****** Object:  Table [dbo].[Loai]    Script Date: 11/26/2019 17:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Loai](
	[MaLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenLoai] [nvarchar](20) NULL,
 CONSTRAINT [PK_Loai] PRIMARY KEY CLUSTERED 
(
	[MaLoai] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Loai] ON
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (1, N'Chó')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (2, N'Mèo')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (3, N'Chim')
INSERT [dbo].[Loai] ([MaLoai], [TenLoai]) VALUES (4, N'Phụ kiện')
SET IDENTITY_INSERT [dbo].[Loai] OFF
/****** Object:  Table [dbo].[KhachHang]    Script Date: 11/26/2019 17:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[SoDienThoai] [varchar](10) NULL,
	[MatKhau] [varchar](100) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[KhachHang] ON
INSERT [dbo].[KhachHang] ([MaKhachHang], [HoTen], [Email], [SoDienThoai], [MatKhau]) VALUES (1, N'Nguyễn Công Đăng', N'congdang151099@gmail.com', N'0123678123', N'88FCEA40C1913C8EBACAB3A582C4914B')
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 11/26/2019 17:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDon] [int] IDENTITY(1,1) NOT NULL,
	[NgayDat] [datetime] NULL,
	[DiaChi] [nvarchar](200) NULL,
	[MaKhachHang] [int] NULL,
	[TrangThai] [bit] NULL,
 CONSTRAINT [PK_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDon] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DonDatHang] ON
INSERT [dbo].[DonDatHang] ([MaDon], [NgayDat], [DiaChi], [MaKhachHang], [TrangThai]) VALUES (1, CAST(0x0000AB09016C34E7 AS DateTime), N'134/45 Lý Chính Thắng', 1, 0)
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
/****** Object:  Table [dbo].[ChungLoai]    Script Date: 11/26/2019 17:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChungLoai](
	[MaChungLoai] [int] IDENTITY(1,1) NOT NULL,
	[TenChungLoai] [nvarchar](50) NULL,
	[MaLoai] [int] NULL,
 CONSTRAINT [PK_ChungLoai] PRIMARY KEY CLUSTERED 
(
	[MaChungLoai] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChungLoai] ON
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (1, N'Alaska', 1)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (2, N'Bull Pháp', 1)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (3, N'Corgi', 1)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (4, N'Siberian Husky', 1)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (5, N'Poodle', 1)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (6, N'Shiba Inu', 1)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (7, N'Mèo mướp', 2)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (8, N'Mèo vàng', 2)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (9, N'Mèo xiêm', 2)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (10, N'Anh lông dài', 2)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (11, N'Anh lông ngắn', 2)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (12, N'Mèo Ba Tư - Ba Tư mặt tịt', 2)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (13, N'Ragdoll', 2)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (14, N'Manie Coon', 2)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (15, N'Nga mắt xanh', 2)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (16, N'Munchkin chân ngắn', 2)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (17, N'PitBull', 1)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (18, N'Bulldog Anh', 1)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (19, N'Vẹt yến phụng', 3)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (20, N'Vẹt ngực hồng', 3)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (21, N'Vẹt mào', 3)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (22, N'Vẹt mẫu đơn', 3)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (23, N'Vẹt xám Châu Phi', 3)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (24, N'Vẹt lùn', 3)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (25, N'Thức ăn cho chó', 4)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (26, N'Thức ăn cho mèo', 4)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (27, N'Vòng đeo cổ', 4)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (28, N'Lồng vận chuyển hàng không', 4)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (29, N'Đồ chơi', 4)
INSERT [dbo].[ChungLoai] ([MaChungLoai], [TenChungLoai], [MaLoai]) VALUES (30, N'Chó Phú Quốc', 1)
SET IDENTITY_INSERT [dbo].[ChungLoai] OFF
/****** Object:  Table [dbo].[TinTuc]    Script Date: 11/26/2019 17:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TinTuc](
	[IDTinTuc] [int] IDENTITY(1,1) NOT NULL,
	[NoiDung] [nvarchar](max) NULL,
	[ID] [int] NULL,
	[AnHien] [bit] NULL,
	[Image] [varchar](100) NULL,
 CONSTRAINT [PK_TinTuc] PRIMARY KEY CLUSTERED 
(
	[IDTinTuc] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ThuCung]    Script Date: 11/26/2019 17:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ThuCung](
	[MaThuCung] [int] IDENTITY(1,1) NOT NULL,
	[TenThuCung] [nvarchar](50) NULL,
	[MauLong] [nvarchar](50) NULL,
	[CanNang] [float] NULL,
	[Tuoi] [int] NULL,
	[MaLoai] [int] NULL,
	[MaChungLoai] [int] NULL,
	[HinhAnh] [varchar](100) NULL,
	[Gia] [bigint] NULL,
	[MoTa] [nvarchar](max) NULL,
	[SoLuong] [int] NULL,
 CONSTRAINT [PK_ThuCung] PRIMARY KEY CLUSTERED 
(
	[MaThuCung] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ThuCung] ON
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (1, N'Chó Alaska 1', N'Trắng-Đen', 50, 12, 1, 1, N'alaska1.jpg', 10000000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (2, N'Chó Alaska 2', N'Trắng-Nâu', 45, 9, 1, 1, N'alaska2.jpg', 9500000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (3, N'Chó Alaska 3', N'Trắng-Đen', 55, 13, 1, 1, N'alaska3.jpg', 11500000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (4, N'Chó Alaska 4', N'Trắng-Vàng', 50, 10, 1, 1, N'alaska4.jpg', 20000000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (5, N'Chó Alaska 5', N'Tráng-Nâu', 48, 10, 1, 1, N'alaska5.jpg', 15000000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (6, N'Chó Bull Pháp 1', N'Trắng-Vàng', 40, 9, 1, 2, N'bullphap1.jpg', 9000000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (7, N'Chó Bull Pháp 2', N'Trắng-Đen', 35, 12, 1, 2, N'bullphap2.jpg', 9500000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (8, N'Chó Bull Pháp 3', N'Nâu', 25, 6, 1, 2, N'bullphap3.jpg', 8500000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (9, N'Chó Bull Pháp 4', N'Vàng', 15, 3, 1, 2, N'bullphap4.jpg', 9000000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (10, N'Chó Bull Pháp 5', N'Trắng-Đen', 33, 9, 1, 2, N'bullphap5.jpg', 11000000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (11, N'Chó Corgi 1', N'Trắng-Vàng', 28, 8, 1, 3, N'corgi1.jpg', 9000000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (12, N'Chó Corgi 2', N'Tráng-Đen', 25, 9, 1, 3, N'corgi2.jpg', 9500000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (13, N'Chó Corgi 3', N'Trắng-Vàng', 28, 6, 1, 3, N'corgi3.jpg', 7500000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (14, N'Chó Corgi 4', N'Trắng-Vàng', 26, 5, 1, 3, N'corgi4.jpg', 6500000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (15, N'Chó Corgi 5', N'Trắng-Đen', 27, 7, 1, 3, N'corgi5.jpg', 7000000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (16, N'Chó Poodle 1', N'Nâu', 20, 9, 1, 5, N'poodle1.jpg', 8000000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (17, N'Chó Poodle 2', N'Vàng', 27, 11, 1, 5, N'poodle2.jpg', 8500000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (18, N'Chó Poodel 3', N'Trắng', 23, 7, 1, 5, N'poodle3.jpg', 9400000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (19, N'Chó Poodel 4', N'Nâu', 24, 8, 1, 5, N'poodle4.jpg', 9300000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (20, N'Chó Poodel 5', N'Vàng', 21, 7, 1, 5, N'poodle5.jpg', 9200000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (21, N'Chó Husky 1', N'Trắng-Đen', 45, 8, 1, 4, N'husky1.jpg', 15000000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (22, N'Chó Husky 2', N'Trăng-Đen', 37, 11, 1, 4, N'husky2.jpg', 19500000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (23, N'Chó Husky 3', N'Trắng-Đen', 32, 7, 1, 4, N'husky3.jpg', 18300000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (24, N'Chó Husky 4', N'Trắng-Đen', 33, 8, 1, 4, N'husky4.jpg', 17000000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (25, N'Chó Husky 5', N'Trắng-Đen', 34, 6, 1, 4, N'husky5.jpg', 18000000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (26, N'Chó Pitbull 1', N'Nâu ', 38, 9, 1, 17, N'pitbull1.jpg', 20000000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (27, N'Chó Pitbull 2', N'Nâu', 37, 9, 1, 17, N'pitbull2.jpg', 19500000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (28, N'Chó Pitbull 3', N'Đen', 34, 6, 1, 17, N'pitbull3.jpg', 14500000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (29, N'Chó Pitbull 4', N'Đen', 35, 7, 1, 17, N'pitbull4.jpg', 15500000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (30, N'Chó Pitbull 5', N'Nâu', 30, 5, 1, 17, N'pitbull5.jpg', 12000000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (31, N'Chó Bulldog Anh 1', N' Trắng', 31, 5, 1, 18, N'bullanh1.jpg', 1300000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (32, N'Chó Bulldog Anh 2', N'Trắng-Vàng', 33, 7, 1, 18, N'bullanh2.jpg', 1600000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (33, N'Chó Bulldog Anh 3', N'Trắng-Đen', 45, 10, 1, 18, N'bullanh3.jpg', 20000000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (34, N'Chó Bulldog Anh 4', N'Nâu', 40, 8, 1, 18, N'bullanh4.jpg', 19500000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (35, N'Chó Bulldog Anh 5', N'Đen', 38, 7, 1, 18, N'bullanh5.jpg', 18500000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (36, N'Chó Shiba Inu 1', N'Vàng', 27, 8, 1, 6, N'shiba1.jpg', 10000000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (37, N'Chó Shiba Inu 2', N'Vàng ', 25, 7, 1, 6, N'shiba2.jpg', 8500000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
INSERT [dbo].[ThuCung] ([MaThuCung], [TenThuCung], [MauLong], [CanNang], [Tuoi], [MaLoai], [MaChungLoai], [HinhAnh], [Gia], [MoTa], [SoLuong]) VALUES (38, N'Chó Shiba Inu 3', N'Vàng', 28, 10, 1, 6, N'shiba3.jpg', 12500000, N'Chó đã được tim ngừa đầy đủ, thông minh và được huấn luyện bài bản', 1)
SET IDENTITY_INSERT [dbo].[ThuCung] OFF
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 11/26/2019 17:20:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaChiTiet] [int] IDENTITY(1,1) NOT NULL,
	[MaDon] [int] NULL,
	[MaThuCung] [int] NULL,
	[SoLuong] [int] NULL,
	[Gia] [bigint] NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaChiTiet] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] ON
INSERT [dbo].[ChiTietDonHang] ([MaChiTiet], [MaDon], [MaThuCung], [SoLuong], [Gia]) VALUES (1, 1, 13, 2, 7500000)
INSERT [dbo].[ChiTietDonHang] ([MaChiTiet], [MaDon], [MaThuCung], [SoLuong], [Gia]) VALUES (2, 1, 9, 1, 9000000)
SET IDENTITY_INSERT [dbo].[ChiTietDonHang] OFF
/****** Object:  ForeignKey [FK_ChiTietDonHang_DonDatHang]    Script Date: 11/26/2019 17:20:42 ******/
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonDatHang] FOREIGN KEY([MaDon])
REFERENCES [dbo].[DonDatHang] ([MaDon])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonDatHang]
GO
/****** Object:  ForeignKey [FK_ChiTietDonHang_ThuCung]    Script Date: 11/26/2019 17:20:42 ******/
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_ThuCung] FOREIGN KEY([MaThuCung])
REFERENCES [dbo].[ThuCung] ([MaThuCung])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_ThuCung]
GO
/****** Object:  ForeignKey [FK_ChungLoai_Loai]    Script Date: 11/26/2019 17:20:42 ******/
ALTER TABLE [dbo].[ChungLoai]  WITH CHECK ADD  CONSTRAINT [FK_ChungLoai_Loai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
GO
ALTER TABLE [dbo].[ChungLoai] CHECK CONSTRAINT [FK_ChungLoai_Loai]
GO
/****** Object:  ForeignKey [FK_DonDatHang_KhachHang]    Script Date: 11/26/2019 17:20:42 ******/
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_KhachHang] FOREIGN KEY([MaKhachHang])
REFERENCES [dbo].[KhachHang] ([MaKhachHang])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_KhachHang]
GO
/****** Object:  ForeignKey [FK_ThuCung_ChungLoai]    Script Date: 11/26/2019 17:20:42 ******/
ALTER TABLE [dbo].[ThuCung]  WITH CHECK ADD  CONSTRAINT [FK_ThuCung_ChungLoai] FOREIGN KEY([MaChungLoai])
REFERENCES [dbo].[ChungLoai] ([MaChungLoai])
GO
ALTER TABLE [dbo].[ThuCung] CHECK CONSTRAINT [FK_ThuCung_ChungLoai]
GO
/****** Object:  ForeignKey [FK_ThuCung_Loai]    Script Date: 11/26/2019 17:20:42 ******/
ALTER TABLE [dbo].[ThuCung]  WITH CHECK ADD  CONSTRAINT [FK_ThuCung_Loai] FOREIGN KEY([MaLoai])
REFERENCES [dbo].[Loai] ([MaLoai])
GO
ALTER TABLE [dbo].[ThuCung] CHECK CONSTRAINT [FK_ThuCung_Loai]
GO
/****** Object:  ForeignKey [FK_TinTuc_NguoiQuanTri]    Script Date: 11/26/2019 17:20:42 ******/
ALTER TABLE [dbo].[TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_TinTuc_NguoiQuanTri] FOREIGN KEY([ID])
REFERENCES [dbo].[NguoiQuanTri] ([ID])
GO
ALTER TABLE [dbo].[TinTuc] CHECK CONSTRAINT [FK_TinTuc_NguoiQuanTri]
GO
