USE [ACMDistribuidores]
GO
/****** Object:  View [dbo].[VistaPedido]    Script Date: 05/01/2015 13:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaPedido]
AS
SELECT        dbo.Salida.IdSalida, dbo.Salida.FechaSalida, dbo.Productos.IdProducto, dbo.Productos.Codigo, dbo.Productos.NombreProducto, 
                         dbo.DetalleUsuarios.PrimerNombre + dbo.DetalleUsuarios.PrimerApellido AS NombreUsuario, dbo.DetalleSalida.CantidadSalida, dbo.Categorias.NombreCategoria
FROM            dbo.Salida INNER JOIN
                         dbo.DetalleSalida ON dbo.Salida.IdSalida = dbo.DetalleSalida.Fk_IdSalida INNER JOIN
                         dbo.Productos ON dbo.DetalleSalida.Fk_IdProducto = dbo.Productos.IdProducto INNER JOIN
                         dbo.Categorias ON dbo.Productos.FK_IdCategoria = dbo.Categorias.IdCategoria INNER JOIN
                         dbo.DetalleUsuarios ON dbo.Salida.FK_IdDetalleUsuario = dbo.DetalleUsuarios.IdUsuario

GO
/****** Object:  View [dbo].[VistaProductos]    Script Date: 05/01/2015 13:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaProductos]
AS
SELECT        dbo.Productos.IdProducto, dbo.Productos.Codigo, dbo.Productos.NombreProducto, dbo.Productos.Descripcion, dbo.Productos.PrecioProveedor, dbo.Productos.PrecioVentaMayorista, 
                         dbo.Productos.PrecioVentaMinorista, dbo.Productos.Existencias, dbo.Categorias.NombreCategoria, dbo.Proveedores.NombreProveedor
FROM            dbo.Productos INNER JOIN
                         dbo.Categorias ON dbo.Productos.FK_IdCategoria = dbo.Categorias.IdCategoria INNER JOIN
                         dbo.DetalleProveedor ON dbo.Productos.IdProducto = dbo.DetalleProveedor.Fk_Id_Producto INNER JOIN
                         dbo.Proveedores ON dbo.DetalleProveedor.Fk_Id_Proveedor = dbo.Proveedores.IdProveedor
WHERE        (dbo.Productos.EstadoProducto = 1)

GO
/****** Object:  View [dbo].[VistaReporteEntrada]    Script Date: 05/01/2015 13:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaReporteEntrada]
AS
SELECT        dbo.Entrada.IdEntrada, dbo.Entrada.FechaEntrada, dbo.Entrada.FkIdDeatalleUsuario, dbo.DetalleUsuarios.PrimerNombre + ' ' + dbo.DetalleUsuarios.PrimerApellido AS NombreUsuario, 
                         dbo.DetalleEntrada.FK_IdEntrada, dbo.DetalleEntrada.FK_IdProducto, dbo.Productos.Codigo, dbo.Productos.NombreProducto, dbo.Categorias.NombreCategoria, dbo.Productos.PrecioProveedor, 
                         dbo.DetalleEntrada.PrecioProveedor AS PrecioEntrada, dbo.DetalleEntrada.CantidadEntrada
FROM            dbo.Productos INNER JOIN
                         dbo.DetalleEntrada ON dbo.Productos.IdProducto = dbo.DetalleEntrada.FK_IdProducto INNER JOIN
                         dbo.Entrada ON dbo.DetalleEntrada.FK_IdEntrada = dbo.Entrada.IdEntrada INNER JOIN
                         dbo.Categorias ON dbo.Productos.FK_IdCategoria = dbo.Categorias.IdCategoria INNER JOIN
                         dbo.DetalleUsuarios ON dbo.Entrada.FkIdDeatalleUsuario = dbo.DetalleUsuarios.IdUsuario

GO
/****** Object:  View [dbo].[VistaReporteEntradaProveedores]    Script Date: 05/01/2015 13:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaReporteEntradaProveedores]
AS
SELECT        dbo.Entrada.IdEntrada, dbo.Entrada.FechaEntrada, dbo.Entrada.FkIdDeatalleUsuario, dbo.DetalleUsuarios.PrimerNombre + ' ' + dbo.DetalleUsuarios.SegundoNombre AS NombreUsuario, 
                         dbo.DetalleEntrada.FK_IdEntrada, dbo.DetalleEntrada.FK_IdProducto, dbo.Productos.Codigo, dbo.Productos.NombreProducto, dbo.Productos.PrecioProveedor, 
                         dbo.DetalleEntrada.PrecioProveedor AS PrecioEntrada, dbo.DetalleEntrada.CantidadEntrada, dbo.Proveedores.NombreProveedor
FROM            dbo.DetalleEntrada INNER JOIN
                         dbo.Entrada ON dbo.DetalleEntrada.FK_IdEntrada = dbo.Entrada.IdEntrada INNER JOIN
                         dbo.Productos ON dbo.DetalleEntrada.FK_IdProducto = dbo.Productos.IdProducto INNER JOIN
                         dbo.DetalleProveedor ON dbo.Productos.IdProducto = dbo.DetalleProveedor.Fk_Id_Producto INNER JOIN
                         dbo.Proveedores ON dbo.DetalleProveedor.Fk_Id_Proveedor = dbo.Proveedores.IdProveedor INNER JOIN
                         dbo.DetalleUsuarios ON dbo.Entrada.FkIdDeatalleUsuario = dbo.DetalleUsuarios.IdUsuario

GO
/****** Object:  View [dbo].[VistaReporteProductos]    Script Date: 05/01/2015 13:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaReporteProductos]
AS
SELECT        dbo.Productos.IdProducto, dbo.Productos.Codigo, dbo.Productos.NombreProducto, dbo.Productos.Descripcion, dbo.Productos.Imagen, dbo.Productos.UnidadPorCaja, dbo.Productos.PrecioProveedor, 
                         dbo.Productos.PrecioVentaMayorista, dbo.Productos.PrecioVentaMinorista, dbo.Productos.Existencias, dbo.Productos.FK_IdCategoria, dbo.Productos.EstadoProducto, dbo.Categorias.IdCategoria, 
                         dbo.Categorias.NombreCategoria AS Categoria, dbo.Categorias.Estado, dbo.DetalleProveedor.IdDetalleProveedor, dbo.DetalleProveedor.Fk_Id_Proveedor, dbo.DetalleProveedor.Fk_Id_Producto, 
                         dbo.Proveedores.IdProveedor, dbo.Proveedores.NombreProveedor, dbo.Proveedores.NIT, dbo.Proveedores.Direccion, dbo.Proveedores.Telefono, dbo.Proveedores.Celular, dbo.Proveedores.NombreContacto, 
                         dbo.Proveedores.EMail, dbo.Proveedores.EstadoProveedor
FROM            dbo.Categorias INNER JOIN
                         dbo.Productos ON dbo.Categorias.IdCategoria = dbo.Productos.FK_IdCategoria INNER JOIN
                         dbo.DetalleProveedor ON dbo.Productos.IdProducto = dbo.DetalleProveedor.Fk_Id_Producto INNER JOIN
                         dbo.Proveedores ON dbo.DetalleProveedor.Fk_Id_Proveedor = dbo.Proveedores.IdProveedor

GO
/****** Object:  View [dbo].[VistaReporteSalida]    Script Date: 05/01/2015 13:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaReporteSalida]
AS
SELECT        dbo.Salida.IdSalida, dbo.Salida.FechaSalida, dbo.DetalleSalida.IdDetalleSalida, dbo.Productos.IdProducto, dbo.Productos.Codigo, dbo.Productos.NombreProducto, dbo.Productos.Descripcion, 
                         dbo.DetalleSalida.CantidadSalida, dbo.Productos.PrecioProveedor, dbo.Productos.PrecioVentaMayorista, dbo.Productos.PrecioVentaMinorista, dbo.Productos.Existencias, dbo.Categorias.NombreCategoria, 
                         dbo.DetalleUsuarios.IdUsuario, dbo.DetalleUsuarios.PrimerNombre, dbo.DetalleUsuarios.SegundoNombre, dbo.DetalleUsuarios.PrimerApellido, dbo.DetalleUsuarios.SegundoApellido, 
                         dbo.DetalleUsuarios.Cedula, dbo.DetalleUsuarios.Telefono, dbo.DetalleUsuarios.Celular, dbo.DetalleUsuarios.Email
FROM            dbo.DetalleSalida INNER JOIN
                         dbo.Salida ON dbo.DetalleSalida.Fk_IdSalida = dbo.Salida.IdSalida INNER JOIN
                         dbo.Productos ON dbo.DetalleSalida.Fk_IdProducto = dbo.Productos.IdProducto INNER JOIN
                         dbo.Categorias ON dbo.Productos.FK_IdCategoria = dbo.Categorias.IdCategoria CROSS JOIN
                         dbo.DetalleUsuarios CROSS JOIN
                         dbo.Proveedores

GO
/****** Object:  View [dbo].[VistaSalidas]    Script Date: 05/01/2015 13:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaSalidas]
AS
SELECT        dbo.Salida.IdSalida, dbo.Salida.FechaSalida, dbo.DetalleSalida.Fk_IdProducto, dbo.Productos.NombreProducto, dbo.DetalleSalida.CantidadSalida, dbo.Productos.PrecioVentaMayorista, 
                         dbo.DetalleSalida.CantidadSalida * dbo.Productos.PrecioVentaMayorista AS Precio
FROM            dbo.Productos INNER JOIN
                         dbo.DetalleSalida ON dbo.Productos.IdProducto = dbo.DetalleSalida.Fk_IdProducto INNER JOIN
                         dbo.Salida ON dbo.DetalleSalida.Fk_IdSalida = dbo.Salida.IdSalida


GO
/****** Object:  View [dbo].[VistaUsuarios]    Script Date: 05/01/2015 13:18:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VistaUsuarios]
AS
SELECT        dbo.DetalleUsuarios.*
FROM            dbo.DetalleUsuarios

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Salida"
            Begin Extent = 
               Top = 0
               Left = 19
               Bottom = 130
               Right = 228
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DetalleSalida"
            Begin Extent = 
               Top = 6
               Left = 532
               Bottom = 188
               Right = 741
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Productos"
            Begin Extent = 
               Top = 6
               Left = 285
               Bottom = 136
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Categorias"
            Begin Extent = 
               Top = 55
               Left = 757
               Bottom = 168
               Right = 966
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DetalleUsuarios"
            Begin Extent = 
               Top = 77
               Left = 50
               Bottom = 207
               Right = 259
            End
            DisplayFlags = 280
            TopColumn = 2
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
   ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaPedido'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'      Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaPedido'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaPedido'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Productos"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Categorias"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DetalleProveedor"
            Begin Extent = 
               Top = 270
               Left = 38
               Bottom = 383
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Proveedores"
            Begin Extent = 
               Top = 384
               Left = 38
               Bottom = 514
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaProductos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaProductos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[52] 4[12] 2[19] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Productos"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 5
         End
         Begin Table = "Entrada"
            Begin Extent = 
               Top = 6
               Left = 285
               Bottom = 120
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DetalleEntrada"
            Begin Extent = 
               Top = 6
               Left = 532
               Bottom = 136
               Right = 741
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Categorias"
            Begin Extent = 
               Top = 120
               Left = 285
               Bottom = 250
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DetalleUsuarios"
            Begin Extent = 
               Top = 138
               Left = 38
               Bottom = 268
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaReporteEntrada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaReporteEntrada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaReporteEntrada'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DetalleEntrada"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 144
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "Entrada"
            Begin Extent = 
               Top = 0
               Left = 524
               Bottom = 139
               Right = 733
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Productos"
            Begin Extent = 
               Top = 120
               Left = 285
               Bottom = 250
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "DetalleProveedor"
            Begin Extent = 
               Top = 6
               Left = 285
               Bottom = 132
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Proveedores"
            Begin Extent = 
               Top = 120
               Left = 532
               Bottom = 250
               Right = 741
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "DetalleUsuarios"
            Begin Extent = 
               Top = 80
               Left = 44
               Bottom = 210
               Right = 253
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Co' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaReporteEntradaProveedores'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'lumn = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaReporteEntradaProveedores'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaReporteEntradaProveedores'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Categorias"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 119
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Productos"
            Begin Extent = 
               Top = 6
               Left = 285
               Bottom = 136
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "DetalleProveedor"
            Begin Extent = 
               Top = 6
               Left = 779
               Bottom = 119
               Right = 988
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Proveedores"
            Begin Extent = 
               Top = 6
               Left = 532
               Bottom = 136
               Right = 741
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaReporteProductos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaReporteProductos'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DetalleSalida"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Salida"
            Begin Extent = 
               Top = 6
               Left = 532
               Bottom = 136
               Right = 741
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Productos"
            Begin Extent = 
               Top = 6
               Left = 779
               Bottom = 136
               Right = 988
            End
            DisplayFlags = 280
            TopColumn = 8
         End
         Begin Table = "Categorias"
            Begin Extent = 
               Top = 115
               Left = 45
               Bottom = 228
               Right = 254
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "DetalleUsuarios"
            Begin Extent = 
               Top = 6
               Left = 285
               Bottom = 136
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 6
         End
         Begin Table = "Proveedores"
            Begin Extent = 
               Top = 138
               Left = 285
               Bottom = 268
               Right = 494
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 14' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaReporteSalida'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'40
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaReporteSalida'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaReporteSalida'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Productos"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 188
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "Salida"
            Begin Extent = 
               Top = 8
               Left = 283
               Bottom = 138
               Right = 492
            End
            DisplayFlags = 280
            TopColumn = 1
         End
         Begin Table = "DetalleSalida"
            Begin Extent = 
               Top = 6
               Left = 532
               Bottom = 188
               Right = 741
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaSalidas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaSalidas'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "DetalleUsuarios"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 247
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaUsuarios'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VistaUsuarios'
GO
