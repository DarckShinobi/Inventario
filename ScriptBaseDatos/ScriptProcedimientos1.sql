USE [ACMDistribuidores]
GO
/****** Object:  StoredProcedure [dbo].[spObtenerIdCategoria]    Script Date: 05/01/2015 13:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerIdCategoria]
AS
BEGIN 
	
DECLARE @Id INT

SELECT @Id= MAX(IdCategoria) FROM Categorias

IF @Id IS NULL 
	
	BEGIN
	
		RETURN (1)
	
	END
ELSE
		BEGIN
	
			RETURN (@Id + 1)
	
	END
END

GO
/****** Object:  StoredProcedure [dbo].[spObtenerIdDetalleEntrada]    Script Date: 05/01/2015 13:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[spObtenerIdDetalleEntrada]
 AS
BEGIN
	 DECLARE @Id INT 

 SELECT @Id = MAX(IdDetalleEntrada) FROM DetalleEntrada

	IF @Id IS NULL
	BEGIN
		RETURN (1)
	END 
	ELSE
	BEGIN
		RETURN (@Id + 1)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerIdDetalleProveedor]    Script Date: 05/01/2015 13:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerIdDetalleProveedor]
AS
BEGIN

DECLARE @Id INT = 0
SET @Id = ( SELECT  MAX(IdDetalleProveedor) FROM DetalleProveedor)

IF @Id IS NULL 
	BEGIN
		RETURN 1 
	END
 ELSE
 BEGIN
	RETURN (@Id + 1) 
 END

END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerIdDetalleSalida]    Script Date: 05/01/2015 13:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerIdDetalleSalida]
AS
BEGIN
DECLARE @Id INT
SELECT    @Id = MAX(IdDetalleSalida) FROM DetalleSalida
IF @Id IS NULL
	BEGIN
		RETURN (1)
	END
 ELSE
  BEGIN
	RETURN (@Id + 1)
  END
END


GO
/****** Object:  StoredProcedure [dbo].[spObtenerIdEntrada]    Script Date: 05/01/2015 13:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerIdEntrada]
AS
BEGIN

DECLARE @Id INT
SELECT @Id = MAX(IdEntrada) FROM Entrada
IF @Id IS NULL
	BEGIN
		RETURN (1)
	END
 ELSE
	BEGIN
		RETURN (@Id + 1)
	END
	
END




 


GO
/****** Object:  StoredProcedure [dbo].[spObtenerIdProducto]    Script Date: 05/01/2015 13:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE PROCEDURE [dbo].[spObtenerIdProducto] 
AS
BEGIN
DECLARE @Id INT
SELECT @Id = MAX(IdProducto) FROM Productos 

IF @Id IS NULL
	BEGIN
		RETURN (1)
	END
 ELSE 
 BEGIN
	RETURN (@Id + 1)
 END
END


GO
/****** Object:  StoredProcedure [dbo].[spObtenerIdProductoCategoria]    Script Date: 05/01/2015 13:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerIdProductoCategoria] (@FK_IdCategoria INT)
AS
BEGIN

DECLARE @Id INT
SELECT @Id = MAX(IdProducto) FROM Productos WHERE FK_IdCategoria = @FK_IdCategoria

IF @Id IS NULL
	BEGIN
		RETURN -1
	END
 ELSE
 BEGIN
	RETURN @Id
 END

END
GO
/****** Object:  StoredProcedure [dbo].[spObtenerIdProveedor]    Script Date: 05/01/2015 13:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerIdProveedor]
AS
BEGIN

DECLARE @Id INT
SELECT @Id = MAX(IdProveedor) FROM Proveedores

IF  @Id IS NULL 
  BEGIN
	RETURN (1)
  END
 ELSE
  BEGIN
	 RETURN (@Id + 1)
  END
END


GO
/****** Object:  StoredProcedure [dbo].[spObtenerIdSalida]    Script Date: 05/01/2015 13:19:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spObtenerIdSalida]
AS
BEGIN
DECLARE @Id INT
SELECT @Id = MAX(IdSalida) FROM dbo.Salida

IF @Id IS NULL
	BEGIN
		RETURN (1)
	END
 ELSE
  BEGIN
	RETURN (@Id + 1)
  END
END





GO
