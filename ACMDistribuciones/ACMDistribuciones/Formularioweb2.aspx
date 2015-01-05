<%@ Page Title="" Language="C#" MasterPageFile="~/Inicio.Master" AutoEventWireup="true" CodeBehind="Formularioweb2.aspx.cs" Inherits="ACMDistribuciones.Formulario_web2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <a href="#">
            <div class="color"></div>
        </a>
        <div class="color"></div>
        <div class="color"></div>
    </div>

    <%--Navegador principal usuario logueado--%>

    <nav id="navUsuario">
        <ul>
            <li>
                <a href="#" id="Categoria">Categoria</a>
            </li>
            <li>
                <a href="#" id="Producto">Producto</a>
            </li>
            <li>
                <a href="#" id="Proveedor">Proveedores</a>
            </li>
            <li>
                <a href="#" id="Inventario">Inventario</a>
            </li>
            <li>
                <a href="#">Reportes</a>
            </li>
        </ul>
    </nav>

    <%------------------------------------------------------------------------------------------------------------------%>
    <%--Division del navegador de categoria--%>
    <div class="divSubNav" id="navCat">
        <div class="subNav">
            <%--Sub-navegador--%>
            <nav>
                <ul>
                    <li>
                        <a href="#" id="crearCat">Crear</a>
                    </li>
                    <li>
                        <a href="#" id="editarCat">Editar</a>
                    </li>
                    <li>
                        <a href="#" id="eliminarCat">Eliminar</a>
                    </li>
                </ul>
            </nav>
        </div>
        <%--Fin Subnavegador--%>

        <%--Buscador de Categorias--%>
        <div class="busNav">
            <%--Division del buscador del navegador de categoria--%>

            <asp:TextBox ID="txbBuscarCategoria" runat="server" CssClass="txbSubNav"></asp:TextBox>

            <asp:Button ID="btnBuscarCategoria" runat="server" Text="Buscar" OnClick="btnBuscarCategoria_Click" class="btnSubNav" />

        </div>
    </div>

    <%--Formulario Crear Categoria--------------------------------------------%>
    <div id="forCrearCat">
        <asp:UpdatePanel ID="upCrearCategoria" runat="server">
            <ContentTemplate>
                <div class="cabezeraFor">
                    <%--Cabezera del formulario--%>
                    <div class="titulo">
                        Crear Categoria
                    </div>
                    <div class="salir">
                        <a href="#" class="A1">X </a>
                    </div>
                </div>
                <div class="cuerpoFor">
                    <%--Cuerpo del Formulario--%>
                    <br />
                    <div class="filaFor">
                        <%--Fila del Formulario--%>
                        <asp:Label ID="Label1" runat="server" Text="Nombre Categoria" CssClass="lblFilaFor"></asp:Label>
                        <asp:TextBox ID="txbNombreCategoria" runat="server" CssClass="txbFilaFor"></asp:TextBox>
                    </div>
                    <div class="filaFor">
                        <%--Fila del Formulario--%>
                        <asp:Label ID="Label2" runat="server" Text="Descripcion Categoria" CssClass="lblFilaFor"></asp:Label>
                        <asp:TextBox ID="txbDescripCategoria" runat="server" CssClass="txbFilaFor"></asp:TextBox>
                    </div>
                    <br />
                    <div class="filaFor">
                        <asp:Button ID="btnCrearCategoria" runat="server" Text="Crear" OnClick="btnCrearCategoria_Click" class="btnCrear" />
                    </div>
                    <br />
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <%--Formulario Editar Categoria-------------------------------------------%>
    <div class="forEditar">
        <asp:UpdatePanel ID="upEditarCategoria" runat="server">
            <ContentTemplate>
                <div class="cabezeraFor">
                    <%--Cabezera del formulario--%>
                    <div class="titulo">
                        Editar Categoria
                    </div>
                    <div class="salir">
                        <a href="#" class="A1">X </a>
                    </div>
                </div>
                <div class="cuerpoFor">
                    <%--Cuerpo del Formulario--%>
                    <br />
                    <div class="busFor">
                        Nombre de la Categoria
                <asp:TextBox ID="txbBuscarEdicionCategoria" runat="server" CssClass="txbBusEdi"></asp:TextBox>
                        <asp:Button ID="btnBuscarEditar" runat="server" Text="Buscar" OnClick="btnBuscarEditar_Click" class="btnBusEdi" />
                    </div>
                    <br />
                    <div class="divEdicion">
                        <br />
                        <asp:HiddenField runat="server" ID="hfIdCategoria" />
                        <asp:TextBox ID="txbNuevoNombreCategoria" runat="server" CssClass="txbNomCat">Nombre</asp:TextBox>
                        <asp:TextBox ID="txbNuevaDescripcion" runat="server" CssClass="txbDesCat">Descripcion</asp:TextBox>
                        <asp:Button ID="btnEditarCategoria" runat="server" Text="Editar" OnClick="btnEditarCategoria_Click" class="btnEditar" />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>

    </div>

    <%--Formulario Eliminar Categoria-----------------------------------------%>
    <div class="forEliminar">
        <asp:UpdatePanel ID="upEliminarCategoria" runat="server">
            <ContentTemplate>
                <div class="cabezeraFor">
                    <%--Cabezera del formulario--%>
                    <div class="titulo">
                        Eliminar Categoria
                    </div>
                    <div class="salir">
                        <a href="#" class="A1">X </a>
                    </div>
                </div>
                <div class="cuerpoFor">
                    <%--Cuerpo del Formulario--%>
                    <br />
                    <div class="busFor">
                        Nombre de la Categoria
                <asp:TextBox ID="txbBuscarCateEliminar" runat="server" CssClass="txbBusEdi"></asp:TextBox>
                        <asp:Button ID="btnBuscarEiminarCategoria" runat="server" Text="Buscar" OnClick="btnBuscarEiminarCategoria_Click" class="btnBusEdi" />
                    </div>
                    <br />
                    <div class="divEdicion">
                        <br />
                        <asp:HiddenField ID="hfIdCategoriaEliminar" runat="server" />
                        <asp:Label ID="lblNombreCategoria" runat="server" CssClass="txbNomCat">Nombre</asp:Label>
                        <asp:Label ID="lblDescripcion" runat="server" CssClass="txbDesCat">Descripcion</asp:Label>
                        <asp:Button ID="btnEliminarCategoria" runat="server" Text="Eliminar" OnClick="btnEliminarCategoria_Click" class="btnEditar" />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <%------------------------------------------------------------------------------------------------------------------%>

    <%--Division del navegador de Productos-----------------------------------%>
    <div class="divSubNav" id="navProd">
        <div class="navPro">
            <nav>
                <ul>
                    <li>
                        <a href="#" id="crearProd">Crear</a>
                    </li>
                    <li>
                        <a href="#" id="editarProd">Editar</a>
                    </li>
                    <li>
                        <a href="#" id="eliminarProd">Eliminar</a>
                    </li>
                    <li>
                        <a href="#" id="proveedoresProd">Proveedores</a>
                        <div id="acor">
                            <h5 class="menu">Consulta de Proveedores de un producto</h5>
                            <div>
                                <p>Codigo del Producto</p>
                                <asp:TextBox ID="txbBuscarProveedorProducto" runat="server"></asp:TextBox>
                                <asp:Button ID="btnBuscarProveedorProducto" runat="server" OnClick="btnBuscarProveedorProducto_Click" Text="Button" />
                            </div>

                        </div>
                    </li>
                </ul>
            </nav>
        </div>
    </div>

    <%--Formulario Creacion de Producto---------------------------------------%>
    <div id="forCrearProd">
        <asp:UpdatePanel ID="upCrearProducto" runat="server">
            <ContentTemplate>
                <div class="cabezeraFor">
                    <div class="titulo">
                        Crear Productos
                    </div>
                    <div class="salir">
                        <a href="#" class="A1">X </a>
                    </div>
                </div>
                <div id="cuerpoForCrearProd">
                    <br />
                    <div class="filaFor">
                        <asp:Label ID="Label3" runat="server" Text="Codigo del Producto" CssClass="lblFilaFor"></asp:Label>
                        <asp:TextBox ID="txbCrearCodigoProducto" runat="server" CssClass="txbFilaFor"></asp:TextBox>
                    </div>
                    <div class="filaFor">
                        <asp:Label ID="Label4" runat="server" Text="Nombre del Producto" CssClass="lblFilaFor"></asp:Label>
                        <asp:TextBox ID="txbCrearNombreProd" runat="server" CssClass="txbFilaFor"></asp:TextBox>
                    </div>
                    <div class="filaFor">
                        <asp:Label ID="Label5" runat="server" Text="Descripcion del produto" CssClass="lblFilaFor"></asp:Label>
                        <asp:TextBox ID="txbCrearDescriProducto" runat="server" CssClass="txbFilaFor"></asp:TextBox>
                    </div>
                    <div class="filaFor">
                        <asp:Label ID="Label6" runat="server" Text="Precio Proveedor" CssClass="lblFilaFor"></asp:Label>
                        <asp:TextBox ID="txbCrearPrecioProvee" runat="server" CssClass="txbFilaFor"></asp:TextBox>
                    </div>
                    <div class="filaFor">
                        <asp:Label ID="Label7" runat="server" Text="Categoria del Producto" CssClass="lblFilaFor"></asp:Label>
                        <asp:DropDownList ID="ddlCategoria" runat="server" AppendDataBoundItems="true"></asp:DropDownList>
                    </div>
                    <br />
                    <div class="filaFor">
                        <asp:Button ID="btnCrearProducto" runat="server" Text="Crear" OnClick="btnCrearProducto_Click" class="btnCrear" />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <%--Formulario Edicion de Productos---------------------------------------%>
    <div id="forEdiProd">
        <asp:UpdatePanel ID="upEditarProducto" runat="server">
            <ContentTemplate>
                <div class="cabezeraFor">
                    <%--Cabezera del Formulario--%>
                    <div class="titulo">
                        <%--Titulo--%>
                Editar Productos
                    </div>
                    <div class="salir">
                        <%--Salir del Formulario--%>
                        <a href="#" class="A1">X </a>
                    </div>
                </div>
                <div id="cuerpoEdiProd">
                    <%-- Cuerpo del Formulario--%>
                    <br />
                    <div class="busFor">
                        <%--Buscador del Producto para la edicion--%>
               Codigo del Producto
                <asp:TextBox ID="txbEditarCodigo" runat="server" CssClass="txbBusEdi"></asp:TextBox>
                        <asp:Button ID="btnEditarBuscarProducto" runat="server" Text="Buscar" OnClick="btnEditarBuscarProducto_Click" class="btnBusEdi" />

                    </div>
                    <br />

                    <div class="filaFor">
                        <asp:HiddenField ID="hfIdEditarProducto" runat="server" />
                        <asp:Label ID="Label9" runat="server" Text="Nombre del Producto" CssClass="lblFilaFor"></asp:Label>
                        <asp:TextBox ID="txbEditarNombreProducto" runat="server" CssClass="txbFilaFor"></asp:TextBox>
                    </div>
                    <div class="filaFor">
                        <asp:Label ID="Label10" runat="server" Text="Descripcion del produto" CssClass="lblFilaFor"></asp:Label>
                        <asp:TextBox ID="txbEditarDescripcionProd" runat="server" CssClass="txbFilaFor"></asp:TextBox>
                    </div>
                    <div class="filaFor">
                        <asp:Label ID="Label11" runat="server" Text="Precio Proveedor" CssClass="lblFilaFor"></asp:Label>
                        <asp:TextBox ID="txbEditarPrecio" runat="server" CssClass="txbFilaFor"></asp:TextBox>
                    </div>
                    <div class="filaFor">
                        <asp:Label ID="Label12" runat="server" Text="Categoria del Producto" CssClass="lblFilaFor"></asp:Label>
                        <asp:DropDownList ID="ddlEditarCategoria" runat="server"></asp:DropDownList>
                    </div>
                    <br />
                    <div class="filaFor">
                        <%--Boton par editar la informacion del Producto--%>
                        <asp:Button ID="btnEditarProducto" runat="server" Text="Editar" OnClick="btnEditarProducto_Click" class="btnCrear" />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <%--Formulario Eliminar Productos-----------------------------------------%>
    <div id="forEliProd">
        <asp:UpdatePanel ID="upEliminarProductos" runat="server">
            <ContentTemplate>
                <div class="cabezeraFor">
                    <%--Cabezera del Formulario--%>
                    <div class="titulo">
                        <%--Titulo--%>
                           Eliminar Productos
                    </div>
                    <div class="salir">
                        <%--Salir del Formulario--%>
                        <a href="#" class="A1">X </a>
                    </div>
                </div>
                <div id="cuerpoEliProd">
                    <%-- Cuerpo del Formulario--%>
                    <br />
                    <div class="busFor">
                        <%--Buscador del Producto para la edicion--%>
                           Codigo del Producto
                <asp:TextBox ID="txbEliminaCodigo" runat="server" CssClass="txbBusEdi"></asp:TextBox>
                        <asp:Button ID="btnBuscarEliminar" runat="server" Text="Buscar" OnClick="btnBuscarEliminar_Click" class="btnBusEdi" />

                    </div>
                    <br />
                    <div class="filaFor">
                        <asp:HiddenField ID="hfIdEliminarProducto" runat="server" />
                        <asp:Label ID="Label13" runat="server" Text="Codigo del Producto" CssClass="lblFilaFor"></asp:Label>
                        <asp:Label ID="lblCodigo" runat="server" CssClass="txbFilaFor"></asp:Label>
                    </div>
                    <div class="filaFor">
                        <asp:Label ID="Label14" runat="server" Text="Nombre del Producto" CssClass="lblFilaFor"></asp:Label>
                        <asp:Label ID="lblNombreProducto" runat="server" CssClass="txbFilaFor"></asp:Label>
                    </div>
                    <br />
                    <div class="filaFor">
                        <%--Boton par editar la informacion del Producto--%>
                        <asp:Button ID="btnEliminarProducto" runat="server" Text="Eliminar" OnClick="btnEliminarProducto_Click" class="btnCrear" />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>



    <%------------------------------------------------------------------------------------------------------------------%>
    <%--Division del navegador para proveedores--%>
    <div class="divSubNav" id="navProv">
        <div id="subProv">
            <%--Sub-navegador--%>
            <nav>
                <ul>
                    <li>
                        <a href="#" id="crearProv">Crear</a>
                    </li>
                    <li>
                        <a href="#" id="editarProv">Editar</a>
                    </li>
                    <li>
                        <a href="#" id="eliminarProv">Eliminar</a>
                    </li>
                    <li>
                        <a href="#">Productos</a>
                    </li>
                </ul>
            </nav>
        </div>
        <%--Fin Subnavegador--%>

        <%--Buscador de Navegador--%>
        <div id="busProv">
            <%--Division del buscador del navegador de categoria--%>

            <asp:TextBox ID="TextBox15" runat="server" CssClass="txbSubNav"></asp:TextBox>

            <asp:Button ID="Button13" runat="server" Text="Buscar" class="btnSubNav" />

        </div>
    </div>

    <%--Formulario Crear Proveedores-----------------------------------------%>
    <div id="forCrearProv">
        <asp:UpdatePanel ID="upCrearProveedor" runat="server">
            <ContentTemplate>
                <div class="cabezeraFor">
                    <div class="titulo">
                        Crear Proveedor
                    </div>
                    <div class="salir">
                        <a href="#" class="A1">X </a>
                    </div>
                </div>
                <div id="cuerpoForCrearProv">
                    <br />
                    <div class="filaFor">
                        <asp:Label ID="Label8" runat="server" Text="Nombre del Proveedor" CssClass="lblFilaFor"></asp:Label>
                        <asp:TextBox ID="txbNombreProveedor" runat="server" CssClass="txbFilaFor"></asp:TextBox>
                    </div>
                    <div class="filaFor">
                        <asp:Label ID="Label15" runat="server" Text="Nit del Poveedor" CssClass="lblFilaFor"></asp:Label>
                        <asp:TextBox ID="txbNitProveedor" runat="server" CssClass="txbFilaFor"></asp:TextBox>
                    </div>
                    <div class="filaFor">
                        <asp:Label ID="Label16" runat="server" Text="Direccion del Proveedor" CssClass="lblFilaFor"></asp:Label>
                        <asp:TextBox ID="txbDireccion" runat="server" CssClass="txbFilaFor"></asp:TextBox>
                    </div>
                    <div class="filaFor">
                        <asp:Label ID="Label17" runat="server" Text="telefono del Proveedor" CssClass="lblFilaFor"></asp:Label>
                        <asp:TextBox ID="txbTelefonoProveedor" runat="server" CssClass="txbFilaFor"></asp:TextBox>
                    </div>
                    <div class="filaFor">
                        <asp:Label ID="Label18" runat="server" Text="e-mail de Contacto" CssClass="lblFilaFor"></asp:Label>
                        <asp:TextBox ID="txbEmailContacto" runat="server" CssClass="txbFilaFor" TextMode="Email"></asp:TextBox>
                    </div>
                    <br />
                    <div class="filaFor">
                        <asp:Button ID="btnCrearProveedor" runat="server" Text="Crear" OnClick="btnCrearProveedor_Click" class="btnCrear" />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <%--Formulario para la edicion de los Proveedores------------------------%>
    <div id="forEdiProv">
        <asp:UpdatePanel ID="upEditarProveedor" runat="server">
            <ContentTemplate>
                <div class="cabezeraFor">
                    <%--Cabezera del Formulario--%>
                    <div class="titulo">
                        <%--Titulo--%>
                Editar Productos
                    </div>
                    <div class="salir">
                        <%--Salir del Formulario--%>
                        <a href="#" class="A1">X </a>
                    </div>
                </div>
                <div id="cuerpoEdiProv">
                    <%-- Cuerpo del Formulario--%>
                    <br />
                    <div class="busFor">
                        <%--Buscador del Producto para la edicion--%>
               Nit o Nombre del Proveedor
                <br />
                        <asp:TextBox ID="txbBuscarProveedor" runat="server" CssClass="txbBusEdi"></asp:TextBox>
                        <asp:Button ID="btnBuscarEditarProveedor" runat="server" Text="Buscar" OnClick="btnBuscarEditarProveedor_Click" class="btnBusEdi" />
                        <br />
                    </div>
                    <br />

                    <div class="filaFor">
                        <asp:HiddenField ID="hfEditarIdProveedor" runat="server" />
                        <asp:Label ID="Label19" runat="server" Text="Nit del Proveedor" CssClass="lblFilaFor"></asp:Label>
                        <asp:TextBox ID="txbEditarNit" runat="server" CssClass="txbFilaFor"></asp:TextBox>
                    </div>
                    <div class="filaFor">
                        <asp:Label ID="Label20" runat="server" Text="Nombre del Proveedor" CssClass="lblFilaFor"></asp:Label>
                        <asp:TextBox ID="txbEditarNombreProveedor" runat="server" CssClass="txbFilaFor"></asp:TextBox>
                    </div>
                    <div class="filaFor">
                        <asp:Label ID="Label21" runat="server" Text="Direccion del Proveedor" CssClass="lblFilaFor"></asp:Label>
                        <asp:TextBox ID="txbEditarDirProveedor" runat="server" CssClass="txbFilaFor"></asp:TextBox>
                    </div>
                    <div class="filaFor">
                        <asp:Label ID="Label23" runat="server" Text="Telefono del Proveedor" CssClass="lblFilaFor"></asp:Label>
                        <asp:TextBox ID="txbEditarTelProveedor" runat="server" CssClass="txbFilaFor"></asp:TextBox>
                    </div>
                    <div class="filaFor">
                        <asp:Label ID="Label22" runat="server" Text="e-mail de contacto" CssClass="lblFilaFor"></asp:Label>
                        <asp:TextBox ID="txbEditarEmailProveedor" runat="server" CssClass="txbFilaFor"></asp:TextBox>
                    </div>
                    <br />
                    <div class="filaFor">
                        <%--Boton par editar la informacion del Producto--%>
                        <asp:Button ID="btnEditarProveedor" runat="server" Text="Editar" OnClick="btnEditarProveedor_Click" class="btnCrear" />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <%--Formulario para eliminar Proveedores---------------------------------%>
    <div id="forEliProv">
        <asp:UpdatePanel ID="upEliminarProveedor" runat="server">
            <ContentTemplate>
                <div class="cabezeraFor">
                    <%--Cabezera del Formulario--%>
                    <div class="titulo">
                        <%--Titulo--%>
                Eliminar Proveedores
                    </div>
                    <div class="salir">
                        <%--Salir del Formulario--%>
                        <a href="#" class="A1">X </a>
                    </div>
                </div>
                <div id="cuerpoEliProv">
                    <%-- Cuerpo del Formulario--%>
                    <br />
                    <div class="busFor">
                        <%--Buscador del Producto para la edicion--%>
               Nit del Proveedor
                <asp:TextBox ID="txbEliminarNIT" runat="server" CssClass="txbBusEdi"></asp:TextBox>
                        <asp:Button ID="btnBuscarEliminarProveedor" runat="server" Text="Buscar" OnClick="btnBuscarEliminarProveedor_Click" class="btnBusEdi" />

                    </div>
                    <br />
                    <div class="filaFor">
                        <asp:HiddenField ID="hfIdEliminarProveedor" runat="server" />
                        <asp:Label ID="Label24" runat="server" Text="Nombre del Proveedor" CssClass="lblFilaFor"></asp:Label>
                        <asp:Label ID="lblNombreProveedor" runat="server" CssClass="txbFilaFor"></asp:Label>
                    </div>
                    <div class="filaFor">
                        <asp:Label ID="Label25" runat="server" Text="Nit del proveedor" CssClass="lblFilaFor"></asp:Label>
                        <asp:Label ID="lblNIT" runat="server" CssClass="txbFilaFor"></asp:Label>
                    </div>
                    <br />
                    <div class="filaFor">
                        <%--Boton par editar la informacion del Producto--%>
                        <asp:Button ID="btnEliminarProveedor" runat="server" Text="Eliminar" OnClick="btnEliminarProveedor_Click" class="btnCrear" />
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <%------------------------------------------------------------------------------------------------------------------------%>
    <div class="divSubNav" id="navInv">
        <%--Navegador del Inventario--%>
        <div id="subNavInv">
            <%--Sub-navegador--%>
            <nav>
                <ul>
                    <li>
                        <a href="#" id="entrada">Entradas</a>
                    </li>
                    <li>
                        <a href="#" id="pedido">Pedidos</a>
                    </li>
                    <li>
                        <a href="#" id="A3">Consultar</a>
                    </li>
                </ul>
            </nav>
        </div>
        <%--Fin Subnavegador--%>
        <div id="busInv">
            <%--Division del buscador del navegador de categoria--%>

            <asp:TextBox ID="TextBox36" runat="server" CssClass="txbSubNav"></asp:TextBox>

            <asp:Button ID="Button19" runat="server" Text="Buscar" class="btnSubNav" />

        </div>
    </div>

    <%--Formulario Para crear las entradas-----------------------------------%>
    <div class="forInv" id="forEntrada">
        <asp:UpdatePanel ID="upEntrada" runat="server">
            <ContentTemplate>
                <div class="cabezeraFor">
                    <%--Cabezera del Formulario--%>
                    <div class="titulo">
                        <%--Titulo--%>
                Entrada de mercancia
                    </div>
                    <div class="salir">
                        <%--Salir del Formulario--%>
                        <a href="#" class="A1">X </a>
                    </div>
                </div>
                <div class="cuerpoInv">
                    <br />
                     Proveedor             
               
                    <asp:DropDownList ID="ddlProveedorEntrada" runat="server" AppendDataBoundItems="true"></asp:DropDownList>
                    <%--<asp:Label ID="lblProveedorEntrada" runat="server" Text="Label"></asp:Label>--%>
                    
                    <br />
                    <br />
                    codigo del Producto 
             <br />
                    <asp:TextBox ID="txbBuscarCodigoEntrada" runat="server"></asp:TextBox>
                    <asp:HiddenField ID="hfIdProductoEntrada" runat="server" />
                    <asp:Button ID="btnBuscar" runat="server"  Text="Buscar" OnClick="btnBuscar_Click" />
                    
                    <asp:Label ID="lblNombreProductoEntrada" runat="server" Text="Nombre del producto"></asp:Label>
                    
                    <asp:TextBox ID="txbCantidadEntrada" runat="server">Cantidad</asp:TextBox>
                    
                    <label>Precio Proveedor</label>
                    
                    <asp:TextBox ID="txbPrecioProveedorEntrada" runat="server"></asp:TextBox>
                   <%-- <asp:Button ID="btnAgregar" runat="server"  Text="Agregar" />--%>
                    
                     <asp:Button ID="btnCrearEntrada" runat="server" OnClick="btnCrearEntrada_Click" Text="Registar entrada" />
                    
                    <div class="listaFor">
                    </div>
                   
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>

    <%--Formulario para crear Pedidos-------------------------------------%>
    <div class="forInv" id="forPedido">
        <asp:UpdatePanel ID="upPedidos" runat="server">
            <ContentTemplate>
                <div class="cabezeraFor">
                    <%--Cabezera del Formulario--%>
                    <div class="titulo">
                        <%--Titulo--%>
                Pedido de mercancia
                    </div>
                    <div class="salir">
                        <%--Salir del Formulario--%>
                        <a href="#" class="A1">X </a>
                    </div>
                </div>
                <div class="cuerpoInv">
                    <br />

                    codigo del Producto 
             <br />
                    <asp:HiddenField ID="hfIdProductoPedido" runat="server" />
                    <asp:HiddenField ID="hfExistencias" runat="server" />
                    <asp:HiddenField ID="hfPrecioProveedor" runat="server" />
                    <asp:TextBox ID="txbCodigoPedido" runat="server"></asp:TextBox>
                    <asp:Button ID="btnBuscarProdPedido" runat="server" Text="buscar" OnClick="btnBuscarProdPedido_Click" />
                     <asp:Label ID="lblNombreProductoPedido" runat="server" Text="Nombre del producto"></asp:Label>
                    <asp:TextBox ID="txbCantidadPedido" runat="server">Cantidad</asp:TextBox>
                    <asp:Button ID="btnAgregarPedido" runat="server" Text="Agregar" OnClick="btnAgregarPedido_Click" />
                    <div class="listaFor">
                        <asp:GridView ID="gvPedido" runat="server" OnRowDataBound="gvPedido_RowDataBound"></asp:GridView>
                    </div>
                    <br />
                   <center><asp:Button ID="btnRegistrarPedido" runat="server" OnClick="btnRegistrarPedido_Click" Text="Aceptar" /></center>

                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div id="reportes">
            <div class="cabezeraFor">
                <%--Cabezera del Formulario--%>
                <div class="titulo">
                    <%--Titulo--%>
                    Reportes del Sistema
                </div>
                <div class="salir">
                    <%--Salir del Formulario--%>
                    <a href="#" class="A1">X </a>
                </div>
            </div>
            <div>
                <div class="divInv">
                    <p>Productos</p>
                </div>
                <div class="divInv">
                    <p>Proveedores</p>
                </div>
            </div>
        <div>
            <div class="divInv">
                <p>Entradas</p>
            </div>
            <div class="divInv">
                <p>Salidas</p>
            </div>
        </div>
    </div>
   
</asp:Content>
