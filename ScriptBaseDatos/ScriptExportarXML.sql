SELECT IdCategoria,Descripcion
	  FROM Categorias 
	  FOR XML RAW('Categorias'),
	  ELEMENTS,
	  ROOT('xml')
GO
SELECT Id_Productos,Codigo,Nombre_Productos,Existencias,Valor_Proveedor,Fk_Id_Categoria 
		FROM dbo.Productos 
		FOR XML raw('Productos'),
		elements,
		root('xml')
GO
SELECT IdProveedores,NombreProveedor,Direccion,Telefono,Celular 
		FROM dbo.Proveedores
		FOR XML RAW('Proveedores'),
		elements,
		root('xml')
GO
SELECT Id_Productos,FK_Id_Proveedor 
		FROM Productos
		FOR XML RAW('DetalleProveedor'),
		ELEMENTS,
		ROOT('XML')
GO
SELECT Id_Entrada_Producto,FechaEntrada 
	    FROM Entrada_Producto
		FOR XML RAW('Entrada'),
		ELEMENTS,
		ROOT('XML')
GO
SELECT FK_Id_Producto,Fk_Id_Entrada,Cantidad_Ingresada 
		FROM Detalle_Entrada
		FOR XML RAW('DetalleEntrada'),
		ELEMENTS,
		ROOT('XML')
		
GO
SELECT Id_Pedido ,Fecha,FK_Id_User
	   FROM Pedido 
	   FOR XML RAW('Pedido'),
	   ELEMENTS,
	   ROOT('XML')
GO
SELECT Cantidad_Pedido,FK_Id_Producto,FK_Id_Pedido
	   FROM Detalle_Pedido
	   FOR XML RAW('DetallePedido'),
	   ELEMENTS,
	   ROOT('XML')
GO
SELECT FK_IdUserProfile,Nombres,Apellidos
	   FROM UserProfile
	   FOR XML RAW('Usuario'),
	   ELEMENTS,
	   ROOT('XML')
GO
	   
	 
