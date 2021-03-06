USE [ACMDistribuidores]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 05/01/2015 13:16:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [int] NOT NULL,
	[NombreCategoria] [nvarchar](255) NOT NULL,
	[DescripcionCategoria] [nvarchar](255) NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleEntrada]    Script Date: 05/01/2015 13:16:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleEntrada](
	[IdDetalleEntrada] [int] NOT NULL,
	[FK_IdEntrada] [int] NOT NULL,
	[FK_IdProducto] [int] NOT NULL,
	[PrecioProveedor] [money] NULL,
	[CantidadEntrada] [int] NOT NULL,
 CONSTRAINT [PK__DetalleE__B9C7D265ED9C8C2C] PRIMARY KEY CLUSTERED 
(
	[IdDetalleEntrada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleProveedor]    Script Date: 05/01/2015 13:16:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleProveedor](
	[IdDetalleProveedor] [int] IDENTITY(1,1) NOT NULL,
	[Fk_Id_Proveedor] [int] NOT NULL,
	[Fk_Id_Producto] [int] NOT NULL,
 CONSTRAINT [PK_DetalleProveedor] PRIMARY KEY CLUSTERED 
(
	[IdDetalleProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleSalida]    Script Date: 05/01/2015 13:16:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleSalida](
	[IdDetalleSalida] [int] NOT NULL,
	[Fk_IdSalida] [int] NOT NULL,
	[Fk_IdProducto] [int] NOT NULL,
	[CantidadSalida] [int] NOT NULL,
 CONSTRAINT [PK_DetalleSalida] PRIMARY KEY CLUSTERED 
(
	[IdDetalleSalida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DetalleUsuarios]    Script Date: 05/01/2015 13:16:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetalleUsuarios](
	[IdUsuario] [uniqueidentifier] NOT NULL,
	[PrimerNombre] [nvarchar](255) NOT NULL,
	[SegundoNombre] [nvarchar](255) NULL,
	[PrimerApellido] [nvarchar](255) NOT NULL,
	[SegundoApellido] [nvarchar](255) NULL,
	[Cedula] [nvarchar](50) NULL,
	[Telefono] [nvarchar](25) NULL,
	[Celular] [nvarchar](25) NULL,
	[Email] [nvarchar](255) NULL,
	[Estado] [int] NULL,
 CONSTRAINT [PK__DetalleU__5B65BF973B8C9132] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Entrada]    Script Date: 05/01/2015 13:16:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entrada](
	[IdEntrada] [int] NOT NULL,
	[FechaEntrada] [datetime] NOT NULL,
	[FkIdDeatalleUsuario] [uniqueidentifier] NULL,
 CONSTRAINT [PK__Entrada__BB164DEA5260F9E1] PRIMARY KEY CLUSTERED 
(
	[IdEntrada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Productos]    Script Date: 05/01/2015 13:16:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [int] NOT NULL,
	[Codigo] [nvarchar](256) NOT NULL,
	[NombreProducto] [nvarchar](256) NOT NULL,
	[Descripcion] [nvarchar](max) NULL,
	[Imagen] [varbinary](max) NULL,
	[UnidadPorCaja] [int] NULL,
	[PrecioProveedor] [money] NOT NULL,
	[PrecioVentaMayorista]  AS ([PrecioProveedor]*(0.1)+[PrecioProveedor]),
	[PrecioVentaMinorista]  AS ([PrecioProveedor]*(0.2)+[PrecioProveedor]),
	[Existencias] [int] NOT NULL,
	[FK_IdCategoria] [int] NOT NULL,
	[EstadoProducto] [bit] NOT NULL,
 CONSTRAINT [PK__Producto__09889210083E9EDA] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 05/01/2015 13:16:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[IdProveedor] [int] NOT NULL,
	[NombreProveedor] [nvarchar](256) NOT NULL,
	[NIT] [nvarchar](256) NULL,
	[Direccion] [nvarchar](256) NULL,
	[Telefono] [nvarchar](256) NULL,
	[Celular] [nvarchar](256) NULL,
	[NombreContacto] [nvarchar](256) NULL,
	[EMail] [nvarchar](256) NULL,
	[EstadoProveedor] [bit] NOT NULL,
 CONSTRAINT [PK__Proveedo__E8B631AF812ACC0A] PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Salida]    Script Date: 05/01/2015 13:16:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salida](
	[IdSalida] [int] NOT NULL,
	[FechaSalida] [datetime] NOT NULL,
	[FK_IdDetalleUsuario] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK__Salida__5D69EC7229BCA187] PRIMARY KEY CLUSTERED 
(
	[IdSalida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[DetalleEntrada]  WITH CHECK ADD  CONSTRAINT [FK__DetalleEn__FK_Id__4AB81AF0] FOREIGN KEY([FK_IdEntrada])
REFERENCES [dbo].[Entrada] ([IdEntrada])
GO
ALTER TABLE [dbo].[DetalleEntrada] CHECK CONSTRAINT [FK__DetalleEn__FK_Id__4AB81AF0]
GO
ALTER TABLE [dbo].[DetalleEntrada]  WITH CHECK ADD  CONSTRAINT [FK__DetalleEn__FK_Id__4BAC3F29] FOREIGN KEY([FK_IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[DetalleEntrada] CHECK CONSTRAINT [FK__DetalleEn__FK_Id__4BAC3F29]
GO
ALTER TABLE [dbo].[DetalleProveedor]  WITH CHECK ADD  CONSTRAINT [FK_DetalleProveedor_Productos] FOREIGN KEY([Fk_Id_Producto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[DetalleProveedor] CHECK CONSTRAINT [FK_DetalleProveedor_Productos]
GO
ALTER TABLE [dbo].[DetalleProveedor]  WITH CHECK ADD  CONSTRAINT [FK_DetalleProveedor_Proveedores] FOREIGN KEY([Fk_Id_Proveedor])
REFERENCES [dbo].[Proveedores] ([IdProveedor])
GO
ALTER TABLE [dbo].[DetalleProveedor] CHECK CONSTRAINT [FK_DetalleProveedor_Proveedores]
GO
ALTER TABLE [dbo].[DetalleSalida]  WITH CHECK ADD  CONSTRAINT [FK_DetalleSalida_Productos] FOREIGN KEY([Fk_IdProducto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[DetalleSalida] CHECK CONSTRAINT [FK_DetalleSalida_Productos]
GO
ALTER TABLE [dbo].[DetalleSalida]  WITH CHECK ADD  CONSTRAINT [FK_DetalleSalida_Salida] FOREIGN KEY([Fk_IdSalida])
REFERENCES [dbo].[Salida] ([IdSalida])
GO
ALTER TABLE [dbo].[DetalleSalida] CHECK CONSTRAINT [FK_DetalleSalida_Salida]
GO
ALTER TABLE [dbo].[Entrada]  WITH CHECK ADD  CONSTRAINT [FK_Entrada_DetalleUsuarios] FOREIGN KEY([FkIdDeatalleUsuario])
REFERENCES [dbo].[DetalleUsuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Entrada] CHECK CONSTRAINT [FK_Entrada_DetalleUsuarios]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [FK__Productos__FK_Id__45F365D3] FOREIGN KEY([FK_IdCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [FK__Productos__FK_Id__45F365D3]
GO
ALTER TABLE [dbo].[Salida]  WITH CHECK ADD  CONSTRAINT [FK_Salida_DetalleUsuarios] FOREIGN KEY([FK_IdDetalleUsuario])
REFERENCES [dbo].[DetalleUsuarios] ([IdUsuario])
GO
ALTER TABLE [dbo].[Salida] CHECK CONSTRAINT [FK_Salida_DetalleUsuarios]
GO
ALTER TABLE [dbo].[Categorias]  WITH CHECK ADD  CONSTRAINT [chkEstado] CHECK  (([Estado]=(1) OR [Estado]=(0)))
GO
ALTER TABLE [dbo].[Categorias] CHECK CONSTRAINT [chkEstado]
GO
ALTER TABLE [dbo].[DetalleUsuarios]  WITH CHECK ADD  CONSTRAINT [chkDetalleUsuario] CHECK  (([Estado]=(1) OR [Estado]=(0)))
GO
ALTER TABLE [dbo].[DetalleUsuarios] CHECK CONSTRAINT [chkDetalleUsuario]
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD  CONSTRAINT [CK__Productos__Estado] CHECK  (([EstadoProducto]=(1) OR [EstadoProducto]=(0)))
GO
ALTER TABLE [dbo].[Productos] CHECK CONSTRAINT [CK__Productos__Estado]
GO
ALTER TABLE [dbo].[Proveedores]  WITH CHECK ADD  CONSTRAINT [CK__Proveedor__Estado] CHECK  (([EstadoProveedor]=(0) OR [EstadoProveedor]=(1)))
GO
ALTER TABLE [dbo].[Proveedores] CHECK CONSTRAINT [CK__Proveedor__Estado]
GO
