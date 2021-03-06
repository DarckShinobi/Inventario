USE [ACMDistribuidores]
GO
/****** Object:  StoredProcedure [dbo].[spActualizarExistenciasEntrada]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarExistenciasEntrada](@IdProducto INT, @CantidadIngresada INT)
AS
UPDATE Productos SET Existencias = Existencias + @CantidadIngresada WHERE Productos.IdProducto = @IdProducto 

GO
/****** Object:  StoredProcedure [dbo].[spActualizarExistenciasPedido]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarExistenciasPedido](@IdProducto INT, @CantidadSolicitada INT)
AS
UPDATE Productos SET Existencias = Existencias - @CantidadSolicitada WHERE Productos.IdProducto = @IdProducto


GO
/****** Object:  StoredProcedure [dbo].[spActualizarImagenProducto]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarImagenProducto](@IdProducto INT,@NuevaImagen  VARBINARY)
AS
UPDATE Productos SET Imagen =@NuevaImagen WHERE IdProducto= @IdProducto



GO
/****** Object:  StoredProcedure [dbo].[spActualizarNombreCategoria]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarNombreCategoria] (@IdCategoria INT ,@NuevoNombre NVARCHAR(255),@NuevaDescripcion NVARCHAR(256))
AS
UPDATE Categorias SET DescripcionCategoria = @NuevaDescripcion, NombreCategoria  = @NuevoNombre  WHERE DBO.Categorias.IdCategoria = @IdCategoria

GO
/****** Object:  StoredProcedure [dbo].[spActualizarPrecioProveedor]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarPrecioProveedor](@idProducto INT ,@NuevoPrecio MONEY)
AS
UPDATE Productos SET PrecioProveedor = @NuevoPrecio WHERE Productos.IdProducto = @idProducto


GO
/****** Object:  StoredProcedure [dbo].[spActualizarProducto]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarProducto] (@IdProducto INT, @NuevoNombre NVARCHAR(256),@NuevaDescripcion NVARCHAR(256),@PrecioProveedor MONEY)
AS
UPDATE Productos SET  NombreProducto = @NuevoNombre, PrecioProveedor = @PrecioProveedor, Descripcion=@NuevaDescripcion WHERE IdProducto=@IdProducto



GO
/****** Object:  StoredProcedure [dbo].[spActualizarProveedor]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarProveedor] (@IdProveedor INT , 
											    @NuevoNombre NVARCHAR(256),
												@NuevoNit NVARCHAR(256),
												@NuevaDireccion NVARCHAR(256),
											    @NuevoTelefono NVARCHAR(256),
												@NuevaCelular NVARCHAR(256),
												@NuevoNombreContacto NVARCHAR(256),
												@NuevoEmail NVARCHAR(256)
											)
AS
UPDATE Proveedores SET NombreProveedor=@NuevoNombre , NIT= @NuevoNit, Direccion = @NuevaDireccion , Telefono = @NuevoTelefono, Celular = @NuevaCelular,
						NombreContacto= @NuevoNombreContacto,EMail = @NuevoEmail WHERE dbo.Proveedores.IdProveedor = @IdProveedor



GO
/****** Object:  StoredProcedure [dbo].[spActualizarUsuario]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spActualizarUsuario](@IdUser UNIQUEIDENTIFIER,@NuevoPrimerNombre NVARCHAR(256),@NuevoSegundoNombre NVARCHAR(256),@NuevoPrimerApellidos NVARCHAR(256),@NuevoSegundoApellidos NVARCHAR(256),@NuevaCedula NVARCHAR(50),
@NuevoTelefono NVARCHAR(25),@NuevoCelular NVARCHAR(25),@NuevoEmail NVARCHAR(256) )
AS
UPDATE DetalleUsuarios SET PrimerNombre= @NuevoPrimerNombre, SegundoNombre = @NuevoSegundoNombre,PrimerApellido = @NuevoPrimerApellidos,SegundoApellido = @NuevoSegundoApellidos,Cedula=@NuevaCedula,Telefono=@NuevoTelefono,Celular=@NuevoCelular , Email= @NuevoEmail  WHERE IdUsuario = @IdUser  

GO
/****** Object:  StoredProcedure [dbo].[spConsultarCategoria]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultarCategoria](@Buscar NVARCHAR(256))
AS
SELECT * FROM Categorias WHERE NombreCategoria LIKE @Buscar AND Estado LIKE 'Activo'


GO
/****** Object:  StoredProcedure [dbo].[spConsultarCategorias]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultarCategorias]
AS
SELECT * FROM Categorias


GO
/****** Object:  StoredProcedure [dbo].[spConsultarIdCategoria]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultarIdCategoria]
AS
SELECT MAX(IdCategoria) FROM Categorias

GO
/****** Object:  StoredProcedure [dbo].[spConsultarIdEntrada]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultarIdEntrada]
AS
SELECT MAX(IdEntrada) FROM Entrada

GO
/****** Object:  StoredProcedure [dbo].[spConsultarIdProveedores]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultarIdProveedores]
AS
SELECT MAX(IdProveedor) FROM Proveedores

GO
/****** Object:  StoredProcedure [dbo].[spConsultarIdSalida]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultarIdSalida]
AS
SELECT MAX(IdSalida) FROM Salida

GO
/****** Object:  StoredProcedure [dbo].[spConsultarProducto]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultarProducto] (@buscar NVARCHAR(256),@ItemFiltro INT)
AS
BEGIN
IF @ItemFiltro = 0
	BEGIN
		SELECT *  FROM [VistaProductos] WHERE	Codigo LIKE @buscar OR NombreProducto LIKE @buscar+'%'
	END
IF @ItemFiltro = 1
	BEGIN
		SELECT * FROM VistaReporteProductos WHERE IdCategoria = @buscar
	END
IF @ItemFiltro = 2
	BEGIN
		 SELECT * FROM VistaReporteProductos WHERE IdProveedor = @buscar
	END
END


GO
/****** Object:  StoredProcedure [dbo].[spConsultarProveedor]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultarProveedor](@NombreProveedor  NVARCHAR(256))
AS
SELECT * FROM Proveedores WHERE NombreProveedor LIKE @NombreProveedor+'%'


GO
/****** Object:  StoredProcedure [dbo].[spConsultarProveedores]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultarProveedores]
AS
SELECT * FROM Proveedores 


GO
/****** Object:  StoredProcedure [dbo].[spConsultarReporteEntradaFecha]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spConsultarReporteEntradaFecha](@FechaInicial DATE,@FechaFinal DATE )
AS
BEGIN
SELECT [IdEntrada]
      ,CAST([FechaEntrada] AS DATE ) AS FechaEntrada
      ,[FkIdDeatalleUsuario]
      ,[NombreUsuario]
      ,[FK_IdEntrada]
      ,[FK_IdProducto]
      ,[Codigo]
      ,[NombreProducto]
      ,[NombreCategoria]
      ,[PrecioProveedor]
      ,[PrecioEntrada]
      ,[CantidadEntrada]
  FROM [ACMDistribuidores].[dbo].[VistaReporteEntrada]
  WHERE FechaEntrada >= @FechaInicial  AND FechaEntrada <= @FechaFinal 
END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarReporteEntradaProveedor]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script para el comando SelectTopNRows de SSMS  ******/
CREATE PROCEDURE [dbo].[spConsultarReporteEntradaProveedor](@dato NVARCHAR(256))
AS
BEGIN
	SELECT [IdEntrada]
		  ,[FechaEntrada]
		  ,[FkIdDeatalleUsuario]
		  ,[NombreUsuario]
		  ,[FK_IdEntrada]
		  ,[FK_IdProducto]
		  ,[Codigo]
		  ,[NombreProducto]
		  ,[PrecioProveedor]
		  ,[PrecioEntrada]
		  ,[CantidadEntrada]
		  ,[NombreProveedor]
	  FROM [ACMDistribuidores].[dbo].[VistaReporteEntradaProveedores]
	  WHERE [NombreProveedor] LIKE @dato
  END
GO
/****** Object:  StoredProcedure [dbo].[spConsultarReporteEntradas]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Script para el comando SelectTopNRows de SSMS  ******/
CREATE PROCEDURE [dbo].[spConsultarReporteEntradas] (@Dato NVARCHAR(256))
AS
BEGIN

SELECT [IdEntrada]
      ,[FechaEntrada]
      ,[FkIdDeatalleUsuario]
      ,[NombreUsuario]
      ,[FK_IdEntrada]
      ,[FK_IdProducto]
      ,[Codigo]
      ,[NombreProducto]
      ,[NombreCategoria]
      ,[PrecioProveedor]
      ,[PrecioEntrada]
      ,[CantidadEntrada]
  FROM [ACMDistribuidores].[dbo].[VistaReporteEntrada]
  WHERE [Codigo] LIKE @Dato OR [NombreCategoria] LIKE @Dato
  
  END
GO
/****** Object:  StoredProcedure [dbo].[spCrearCategoria]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCrearCategoria](@Nombre NVARCHAR(255),@Descripcion NVARCHAR(256))
AS
BEGIN 

DECLARE @Estado BIT = 1
DECLARE @IdCategoria INT

EXEC @IdCategoria = spObtenerIdCategoria
IF ( EXISTS(SELECT NombreCategoria 
			FROM Categorias 
			WHERE Categorias.NombreCategoria LIKE UPPER(@Nombre)  )
	 )
BEGIN

 RETURN (-1)

END
 ELSE
  BEGIN
   INSERT INTO Categorias VALUES(@IdCategoria,@Nombre,@Descripcion,@Estado)
   RETURN (0)
  END
END
	
GO
/****** Object:  StoredProcedure [dbo].[spCrearCategoriaXML]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCrearCategoriaXML](@IdCategoria INT,@Nombre NVARCHAR(256),@Descripcion NVARCHAR(256))
AS
BEGIN

DECLARE @Estado BIT = 1

IF ( EXISTS ( SELECT IdCategoria 
			  FROM Categorias
			  WHERE Categorias.IdCategoria = @IdCategoria
			))
 BEGIN
 RETURN (-1)
 END
ELSE
 BEGIN
 	INSERT INTO Categorias VALUES (@IdCategoria,@Nombre,@Descripcion,@Estado)
	RETURN (0)
 END
END
GO
/****** Object:  StoredProcedure [dbo].[spCrearDetalleEntrada]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCrearDetalleEntrada](@IdEntrada INT,@IdProducto INT,@NuevoPrecioProveedor MONEY,@CantidadIngresada INT)
AS
DECLARE @IdDetalle INT 
EXEC @IdDetalle =  spObtenerIdDetalleEntrada

--Insertar datos en la tabla detalle entrada--
INSERT INTO DetalleEntrada VALUES(@IdDetalle,@IdEntrada,@IdProducto,@NuevoPrecioProveedor,@CantidadIngresada)
GO
/****** Object:  StoredProcedure [dbo].[spCrearDetalleProveedor]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCrearDetalleProveedor](@IdProducto INT, @IdProveedor INT)
AS
IF (EXISTS(SELECT Fk_Id_Producto,Fk_Id_Proveedor 
			FROM DetalleProveedor 
			WHERE DetalleProveedor.Fk_Id_Producto = @IdProducto AND DetalleProveedor.Fk_Id_Proveedor = @IdProveedor))
 BEGIN
	 RETURN (-1)
 END
 ELSE
 BEGIN
    INSERT INTO DetalleProveedor VALUES(@IdProveedor,@IdProducto)
	RETURN (0)
 END

GO
/****** Object:  StoredProcedure [dbo].[spCrearDetalleSalida]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCrearDetalleSalida](@IdSalida INT,@IdProducto INT,@CantidadIngresada INT)
AS
DECLARE @IdDetalle INT 
EXEC @IdDetalle = spObtenerIdDetalleSalida
INSERT INTO DetalleSalida VALUES(@IdDetalle,@IdSalida,@IdProducto,@CantidadIngresada)


GO
/****** Object:  StoredProcedure [dbo].[spCrearDetalleSalidaXML]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCrearDetalleSalidaXML](@IdSalida INT,@IdProducto INT,@CantidadIngresada INT)
AS
DECLARE @IdDetalle INT 
EXEC @IdDetalle = spObtenerIdDetalleSalida
INSERT INTO DetalleSalida VALUES(@IdDetalle,@IdSalida,@IdProducto,@CantidadIngresada)

GO
/****** Object:  StoredProcedure [dbo].[spCrearEntrada]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCrearEntrada](@FechaEntrada DATETIME,@IdUser UNIQUEIDENTIFIER)
AS
DECLARE @IdEntrada INT
EXEC @IdEntrada = spObtenerIdEntrada 


INSERT INTO Entrada VALUES(@IdEntrada,@FechaEntrada,@IdUser)

GO
/****** Object:  StoredProcedure [dbo].[spCrearEntradaXML]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCrearEntradaXML]( @IdEntrada INT,@FechaEntrada DATE,@IdUser UNIQUEIDENTIFIER)
AS



INSERT INTO Entrada VALUES(@IdEntrada,@FechaEntrada,@IdUser)
GO
/****** Object:  StoredProcedure [dbo].[spCrearProducto]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCrearProducto](@Codigo NVARCHAR(256),@NombreProducto NVARCHAR(256),@Descripcion NVARCHAR(256), @PrecioProveedor MONEY, @Existencias INT,@Categoria INT)
AS
BEGIN

DECLARE @Estado BIT  = 1;
DECLARE @IdProducto INT ;
EXEC @IdProducto = dbo.spObtenerIdProducto;

IF (EXISTS( SELECT Codigo 
			FROM Productos 
			WHERE Productos.Codigo LIKE (@Codigo) ))
BEGIN
	RETURN (-1)
END
 ELSE 
  BEGIN
	 INSERT INTO Productos VALUES(@IdProducto,@Codigo,@NombreProducto,@Descripcion,NULL,NULL,@PrecioProveedor,@Existencias,@Categoria,@Estado)
	 RETURN (0)
  END
END
GO
/****** Object:  StoredProcedure [dbo].[spCrearProductoXML]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCrearProductoXML](@IdProducto INT,@Codigo NVARCHAR(256),@NombreProducto NVARCHAR(256),@Descripcion NVARCHAR(256), @PrecioProveedor MONEY, @Existencias INT,@Categoria INT)
AS
BEGIN

DECLARE @Estado BIT  = 1;

IF (EXISTS( SELECT Codigo 
			FROM Productos 
			WHERE Productos.Codigo LIKE (@Codigo) ))
BEGIN
	RETURN (-1)
END
 ELSE 
  BEGIN
	
	INSERT INTO Productos VALUES(@IdProducto,@Codigo,@NombreProducto,@Descripcion,NULL,NULL,@PrecioProveedor,@Existencias,@Categoria,@Estado)
	RETURN (0)
  END
END




GO
/****** Object:  StoredProcedure [dbo].[spCrearProveedor]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCrearProveedor](@NombreProveedor NVARCHAR(256),@Ciudad NVARCHAR(256),@Direccion NVARCHAR(256),@Telefono NVARCHAR(256),@Celular NVARCHAR(256),@NombreContacto NVARCHAR(256),@Email NVARCHAR(256))
AS
DECLARE @Estado BIT = 1;
DECLARE @IdProveedor INT
EXEC @IdProveedor = spObtenerIdProveedor
IF(EXISTS(SELECT IdProveedor
		  FROM Proveedores 
		  WHERE @NombreProveedor LIKE (@NombreProveedor) ))
	BEGIN

     RETURN (-1)

    END
 ELSE
	BEGIN
		
		INSERT INTO Proveedores VALUES(@IdProveedor,@NombreProveedor,@Ciudad,@Direccion,@Telefono,@Celular,@NombreContacto,@Email,@Estado)
		RETURN (0)
	END



GO
/****** Object:  StoredProcedure [dbo].[spCrearProveedorXML]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCrearProveedorXML](@IdProveedor INT,@NombreProveedor NVARCHAR(256),@Ciudad NVARCHAR(256),@Direccion NVARCHAR(256),@Telefono NVARCHAR(256),@Celular NVARCHAR(256),@NombreContacto NVARCHAR(256),@Email NVARCHAR(256))
AS
BEGIN

DECLARE @Estado BIT = 1;

IF (EXISTS(SELECT IdProveedor 
		   FROM Proveedores 
		   WHERE Proveedores.NombreProveedor LIKE @NombreProveedor ))
 BEGIN
	RETURN (-1)
 END
 ELSE
  BEGIN
   INSERT INTO Proveedores VALUES(@IdProveedor,@NombreProveedor,@Ciudad,@Direccion,@Telefono,@Celular,@NombreContacto,@Email,@Estado)
  END
END
GO
/****** Object:  StoredProcedure [dbo].[spCrearSalida]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCrearSalida](@Fecha DATETIME,@IdUser UNIQUEIDENTIFIER)
AS
DECLARE @IdSalida INT 
EXEC @IdSalida = spObtenerIdSalida


INSERT INTO Salida VALUES(@IdSalida,@Fecha,@IdUser)
GO
/****** Object:  StoredProcedure [dbo].[spCrearSalidaXML]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCrearSalidaXML](@IdSalida INT ,@Fecha DATETIME,@IdUser UNIQUEIDENTIFIER)
AS
 
INSERT INTO Salida VALUES(@IdSalida,@Fecha,@IdUser)
GO
/****** Object:  StoredProcedure [dbo].[spCrearUsuario]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spCrearUsuario](@IdUser UNIQUEIDENTIFIER,@PrimerNombre NVARCHAR(256),@SegundoNombre NVARCHAR(256),@PrimerApellido NVARCHAR(256),@SegundoApellido NVARCHAR(256),@Cedula NVARCHAR(50),@Telefono NVARCHAR(256),@Email NVARCHAR(256),@Celular NVARCHAR(256))
AS
BEGIN

 DECLARE @Estado BIT = 1;
 IF(EXISTS(SELECT IdUsuario 
		   FROM DetalleUsuarios
		   WHERE DetalleUsuarios.IdUsuario = @IdUser ))
 BEGIN
 RETURN (-1)
 END
 ELSE
  BEGIN
   INSERT INTO DetalleUsuarios VALUES(@IdUser,@PrimerNombre,@SegundoNombre,@PrimerApellido,@SegundoApellido,@Cedula,@Telefono,@Email,@Celular,@Estado)
   RETURN (0)
  END

END


GO
/****** Object:  StoredProcedure [dbo].[spEliminarCategoria]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarCategoria](@IdCategoria INT)
AS
UPDATE Categorias SET Estado = 0 WHERE dbo.Categorias.IdCategoria= @IdCategoria



GO
/****** Object:  StoredProcedure [dbo].[spEliminarDetalleProveedor]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarDetalleProveedor](@IdProducto INT,@IdProveedor INT)
AS
BEGIN
IF(EXISTS(SELECT IdDetalleProveedor
			 FROM DetalleProveedor 
			WHERE Fk_Id_Producto=@IdProducto AND Fk_Id_Proveedor=@IdProveedor))
 BEGIN
	RETURN (-1)
 END
ELSE
BEGIN
 DELETE DetalleProveedor WHERE Fk_Id_Producto = 6 AND Fk_Id_Proveedor = 1010
 RETURN (0)
END

END

GO
/****** Object:  StoredProcedure [dbo].[spEliminarDetalleUsuario]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarDetalleUsuario] (@IdDetalleUsuario UNIQUEIDENTIFIER )
AS
UPDATE DetalleUsuarios SET Estado = 0 WHERE IdUsuario= @IdDetalleUsuario



GO
/****** Object:  StoredProcedure [dbo].[spEliminarProducto]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spEliminarProducto] (@IdProducto  INT)
AS
UPDATE Productos SET EstadoProducto = 0 WHERE IdProducto=@IdProducto



GO
/****** Object:  StoredProcedure [dbo].[spEliminarProveedor]    Script Date: 05/01/2015 13:20:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[spEliminarProveedor](@IdProveedor INT)
 AS
 UPDATE Proveedores SET EstadoProveedor = 0 WHERE dbo.Proveedores.IdProveedor= @IdProveedor


GO
