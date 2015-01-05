using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDatos;
using System.Web.Security;

namespace ACMDistribuciones
{
    public partial class Formulario_web2 : System.Web.UI.Page
    {
        ////////////////////// VARIABLE GLOBAL////////////////////////

        /// <summary>
        /// Variable global Lista de tipo DetalleFactura
        /// </summary>
        List<DetallePedido> objListaDetallePedido;

        /// <summary>
        /// Variable que almacena el nombre del usuario
        /// </summary>
        string user;
        ////////////////////// FIN VARIABLE GLOBAL////////////////////////


        ////////////////////// METODOS LA PAGINA////////////////////////

        private void limpiaControlesPedido(){
            hfIdProductoPedido.Value="";
            hfExistencias.Value = "";
            hfPrecioProveedor.Value = "";
            txbCodigoPedido.Text = "";
            lblNombreProductoPedido.Text = "Nombre producto";
            txbCantidadPedido.Text = "";
        } 

        private void CargarDDL() {
            try
            {
                Categoria objCategoria = new Categoria();
                Proveedor objProveedor= new Proveedor();
                ListItem item = new ListItem();
                item.Text="--Seleccione una categoria--";
                ddlCategoria.Items.Insert(0, item);
                ddlCategoria.DataSource = objCategoria.ConsultarCategorias();                
                ddlCategoria.DataValueField = "_intIdCategoria";
                ddlCategoria.DataTextField = "_strNombreCategoria";
                ddlCategoria.DataBind();

                ListItem itemP = new ListItem();
                itemP.Text = "--Seleccione un proveedor--";
                ddlProveedorEntrada.Items.Insert(0, itemP);
                ddlProveedorEntrada.DataSource = objProveedor.ConsultarProveedores();
                ddlProveedorEntrada.DataValueField = "_intIdProveedor";
                ddlProveedorEntrada.DataTextField = "_strNombreProveedor";
                ddlProveedorEntrada.DataBind();
            }
            catch (Exception )
            {
                
                throw;
            }
        
        }

        /// <summary>
        /// Valida la existencia de un producto en la lista de pedido
        /// </summary>
        /// <param name="objDetalle"></param>
        protected void ValidarProductoPedido(DetallePedido objDetalle) {
            
            try
            {
                int intCuenta = ViewState.Count;
                bool eval=false;
                int CantidadSolicitada = 0;
                string Key = intCuenta.ToString();
           
                int validarCantidad=0;
                    for (int i = 0; i < ViewState.Count; i++)
                    {
                        var varDetalle = (DetallePedido)ViewState["P" + i.ToString()];
                        //Valido la existencioa de un producto con el mismo ID
                        if (varDetalle._intIdProducto == objDetalle._intIdProducto)
                        {
                            eval = true;
                            CantidadSolicitada = varDetalle._intCantidadPedido;
                           //Valido que las existencias del producto no se han menor a la cantidada solicitada
                            if (varDetalle._intExistencias >= (CantidadSolicitada+objDetalle._intCantidadPedido))
                            {
                                objDetalle._intCantidadPedido = objDetalle._intCantidadPedido + CantidadSolicitada;
                                Key = i.ToString();
                                validarCantidad = 1;
                                break;
                                //upCrearProducto
                            }
                            else
                            {
                                validarCantidad = 2;
                            }
                        }
                    }
                //Evaluo el resultado de la validacion de elementos repetidos
                if(eval == false)
                {
                    ViewState.Add("P" + Key, objDetalle);

                    CargarGrillaPedido();

                    limpiaControlesPedido();
                }
               else
               {
                   if (validarCantidad == 1)
                   {
                       ViewState.Remove("P" + Key);
                       ViewState.Add("P"+Key , objDetalle);

                       CargarGrillaPedido();

                       limpiaControlesPedido();

                   }
                   else
                   {
                       string strMensaje = "No hay suficientes existencias para asignar al pedido";
                       txbCantidadPedido.Text = strMensaje;
                   }
                    
               }
            }
            catch (Exception ex)
            {
                
                throw;
            }

        }

        /// <summary>
        /// Enlaza datos al control GridView para los pedidos
        /// </summary>
        private void CargarGrillaPedido() {
            try
            {
              ;
                DetallePedido objDetallePedido = new DetallePedido();
                objListaDetallePedido = new List<DetallePedido>();
                if (ViewState["P0"]!= null)
                {
                    for (int i = 0; i < ViewState.Count; i++)
                    {

                        objDetallePedido = (DetallePedido)ViewState["P" + i.ToString()];

                        objListaDetallePedido.Add(objDetallePedido);
                        
                    }

                    gvPedido.DataSource = objListaDetallePedido;
                    gvPedido.DataBind();

                }
            }
            catch (Exception ex)
            {
                
                throw;
            }
        
        }
        ////////////////////// METODOS DE LA PAGINA////////////////////////

        ////////////////////// EVENTOS DE LA PAGINA////////////////////////

        /// <summary>
        /// Evento previo al Page_Load
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Init(object sender,EventArgs e) 
        {
              CargarDDL();
              if (Session["NombreUsuario"] != null)
              {
                  user = Session["NombreUsuario"].ToString();
              }
              
        }
        /// <summary>
        /// Evento que se desencadena al cargar la pagina
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["NombreUsuario"] == null)
            {
                //Response.Redirect("Formularioweb1.aspx");
  //              Server.Transfer("Formularioweb1.aspx");
            }
        }

        ////////////////////// FIN EVENTOS DE LA PAGINA////////////////////////

        ////////////////////// CRUD CATEGORIA ////////////////////////

        /// <summary>
        /// Evento que busca categorias
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnBuscarCategoria_Click(object sender, EventArgs e)
        {
            
        }

        /// <summary>
        /// Evento para registrar/crear una  categoria
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCrearCategoria_Click(object sender, EventArgs e)
        {
            int filasAfectas=0;
            try
            {

                Categoria objCategoria = new Categoria();
                objCategoria._strNombreCategoria = txbNombreCategoria.Text.Trim();
                objCategoria._strDescripcionCategoria = txbDescripCategoria.Text.Trim();
                filasAfectas = objCategoria.CrearCategoria();
                if (filasAfectas == 0) {

                    txbNombreCategoria.Text = "Categoria creada con exito";
                    txbDescripCategoria.Text = "";
                    ddlCategoria.Items.Clear();
                    ddlProveedorEntrada.Items.Clear();
                    CargarDDL();

                }
                else if (filasAfectas == 1)
                {
                    txbNombreCategoria.Text = "Categoria ya existe";
                    txbDescripCategoria.Text = "";

                }
                else {
                    txbNombreCategoria.Text = "Exception en clase Categoria";
                    txbDescripCategoria.Text = "";
                }

            }
            catch (Exception ex)
            {

                txbNombreCategoria.Text = ex.Message;
                txbDescripCategoria.Text = "";
            }
        }

        /// <summary>
        /// Evento para buscar una categoria que para edicion
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnBuscarEditar_Click(object sender, EventArgs e)
        {
            
            try
            {
                Categoria objCategoria = new Categoria();
                objCategoria = objCategoria.ConsultarCategoria(txbBuscarEdicionCategoria.Text.Trim());
                if (objCategoria != null)
                {
                    txbNuevoNombreCategoria.Text = objCategoria._strNombreCategoria;
                    txbNuevaDescripcion.Text = objCategoria._strDescripcionCategoria;
                    hfIdCategoria.Value = objCategoria._intIdCategoria.ToString();
                }
                else {
                    txbNuevoNombreCategoria.Text = "NO HAY COINCIDENCIAS EN SU BUSQUEDA";
                }
               
            }
            catch (Exception ex)
            {

                txbNuevoNombreCategoria.Text = ex.Message;
            }
        }

        /// <summary>
        /// Evento para editar una categoria
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEditarCategoria_Click(object sender, EventArgs e)
        {

            try
            {
                
                if (hfIdCategoria.Value != "")
                {
                    int filasAfectadas = 0;
                    Categoria objCategoria = new Categoria();
                    filasAfectadas = objCategoria.EditarCategoria(Convert.ToInt32(hfIdCategoria.Value), txbNuevoNombreCategoria.Text, txbNuevaDescripcion.Text);

                    if (filasAfectadas == 0)
                    {
                        txbNuevoNombreCategoria.Text = "Edicion exitosa";
                        txbNuevaDescripcion.Text = "";
                        txbBuscarEdicionCategoria.Text = "";
                        hfIdCategoria.Value = null;

                    }
                    else if (filasAfectadas == 2)
                    {
                        txbNuevoNombreCategoria.Text = "Excepion en clae categoria";
                        txbNuevaDescripcion.Text = "";
                    }
                    
                }
               
                
            }
            catch (Exception ex)
            {
                txbNuevoNombreCategoria.Text = ex.Message;
            }
        }

        /// <summary>
        /// Evento para elimina una categoria
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnBuscarEiminarCategoria_Click(object sender, EventArgs e)
        {
            try
            {
                Categoria objcategoria = new Categoria();
                objcategoria =objcategoria.ConsultarCategoria(txbBuscarCateEliminar.Text.Trim());
                hfIdCategoriaEliminar.Value = objcategoria._intIdCategoria.ToString();
                lblNombreCategoria.Text = objcategoria._strNombreCategoria;
                lblDescripcion.Text = objcategoria._strDescripcionCategoria;
            }
            catch (Exception ex)
            {
                lblNombreCategoria.Text=ex.Message;
                
            }
        }


        /// <summary>
        /// Evento para eliminar una categoria
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEliminarCategoria_Click(object sender, EventArgs e)
        {
            try
            {
                int filasAfectadas = 0;
                Categoria objCategoria = new Categoria();

                filasAfectadas = objCategoria.EliminarCategoria(Convert.ToInt32(hfIdCategoriaEliminar.Value));
                if (filasAfectadas == 2)
                {
                    lblNombreCategoria.Text = "Exception clase categoria";
                    lblDescripcion.Text = "";
                }
                else {
                    lblNombreCategoria.Text = "Se elimino la categoria exitosamente";
                    lblDescripcion.Text = "";
                }

            }
            catch (Exception ex)
            {
                lblNombreCategoria.Text = ex.Message;
            }
        }

        ////////////////////// FIN CRUD CATEGORIA ////////////////////////

        ////////////////////// CRUD PRODUCTOS ////////////////////////

        /// <summary>
        /// Evento para crear producto
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCrearProducto_Click(object sender, EventArgs e)
        {
            try
            {
                int filasAfectadas = 0;
                Producto objProducto = new Producto();

                objProducto._strCodigo = txbCrearCodigoProducto.Text.Trim();
                objProducto._strNombreProducto = txbCrearNombreProd.Text.Trim();
                objProducto._strDescripcion = txbCrearDescriProducto.Text.Trim();
                objProducto._decValorProveedor = Convert.ToDecimal(txbCrearPrecioProvee.Text.Trim());
                objProducto.objCategoria._intIdCategoria = Convert.ToInt32(ddlCategoria.SelectedValue);
                filasAfectadas = objProducto.CrearProducto();
                if (filasAfectadas == 1) {
                    txbCrearCodigoProducto.Text = "Este codigo ya existe en la base de datos";

                }
                else if (filasAfectadas == 2)
                {

                    txbCrearCodigoProducto.Text = "Exception en la clase producto";

                }
                else {
                    txbCrearCodigoProducto.Text = "";
                    txbCrearNombreProd.Text = "";
                    txbCrearDescriProducto.Text = "";
                    txbCrearPrecioProvee.Text = "";
                    
                }
            }
            catch (Exception ex)
            {

                txbCrearCodigoProducto.Text = ex.Message;
            }
        }

        /// <summary>
        /// Evento para buscar un producto que se va a editar 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEditarBuscarProducto_Click(object sender, EventArgs e)
        {
            try
            {
                Producto objProducto = new Producto();
                objProducto = objProducto.ConsultarProducto(txbEditarCodigo.Text.Trim());

                hfIdEditarProducto.Value = objProducto._intIdProductos.ToString();
                txbEditarNombreProducto.Text = objProducto._strNombreProducto;
                txbEditarDescripcionProd.Text = objProducto._strDescripcion.ToString();
                txbEditarPrecio.Text = objProducto._decValorProveedor.ToString("F0");

            }
            catch (Exception ex)
            {

                txbEditarNombreProducto.Text = ex.Message;
            }

        }

        /// <summary>
        /// Evento para editar un  producto
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEditarProducto_Click(object sender, EventArgs e)
        {
            try
            {
                if (hfIdEditarProducto.Value != "")
                {
                    int filasAfectadas = 0;
                    Producto objProducto = new Producto();

                    filasAfectadas = objProducto.EditarProducto(Convert.ToInt32(hfIdEditarProducto.Value), txbEditarNombreProducto.Text.Trim(), txbEditarDescripcionProd.Text.Trim(), Convert.ToDecimal(txbEditarPrecio.Text.Trim()));
                    if (filasAfectadas == 2)
                    {
                        txbEditarNombreProducto.Text = "Exception en clase producto";
                    }
                    else if (filasAfectadas == 0)
                    {
                        txbEditarNombreProducto.Text = "Edicion realizada con exito";
                        txbEditarDescripcionProd.Text = "";
                        txbEditarPrecio.Text = "";
                        hfIdEditarProducto.Value = "";
                    }
                }
            }
            catch (Exception ex)
            {
                txbEditarNombreProducto.Text = ex.Message;
            }
        }

        /// <summary>
        /// Evento para buscar un producto que se desea eliminar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnBuscarEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                Producto objProducto = new Producto();
                objProducto = objProducto.ConsultarProducto(txbEliminaCodigo.Text.Trim());
                lblCodigo.Text = objProducto._strCodigo;
                lblNombreProducto.Text = objProducto._strNombreProducto;
                hfIdEliminarProducto.Value = objProducto._intIdProductos.ToString();
            }
            catch (Exception ex)
            {
                lblCodigo.Text = ex.Message;
            }
        }
        /// <summary>
        /// Evento para eliminar  producto
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEliminarProducto_Click(object sender, EventArgs e)
        {
            try
            {
                int filasAfectadas = 0;
                Producto objProducto = new Producto();

                filasAfectadas = objProducto.EliminarProducto(Convert.ToInt32(hfIdEliminarProducto.Value));
                if (filasAfectadas == 2) 
                {
                    lblCodigo.Text = "Exception en clase producto";
                }else
                {
                    lblCodigo.Text = "Producto eliminado exitosamente";
                    lblNombreProducto.Text = "";
                    lblCodigo.Text = "";

                }
            }
            catch (Exception ex)
            {

                lblCodigo.Text = ex.Message;
            }
        }
        
        /// <summary>
        /// Evento para buscar productos por proveedor
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnBuscarProveedorProducto_Click(object sender, EventArgs e)
        {
            try
            {
                ///Aqui codigo busvar producto por proveedor
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }

        ////////////////////// FIN CRUD PRODUCTOS ////////////////////////

        ////////////////////// CRUD PROVEEDORES ////////////////////////
        
        /// <summary>
        /// Evento para crear un producto
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCrearProveedor_Click(object sender, EventArgs e)
        {
            try
            {
                int filasAfectadas = 0;
                Proveedor objProveedor = new Proveedor();
                objProveedor._strNombreProveedor = txbNombreProveedor.Text.Trim();
                objProveedor._strNit = txbNitProveedor.Text.Trim();
                objProveedor._strDireccion = txbDireccion.Text.Trim();
                objProveedor._strTelefono = txbTelefonoProveedor.Text.Trim();
                objProveedor._strEmail = txbEmailContacto.Text.Trim();
                filasAfectadas = objProveedor.CrearProveedor();
                if(filasAfectadas == 1)
                {
                    txbNombreProveedor.Text="Proveedor ya existe";
                }
                else if (filasAfectadas == 2)
                {
                    txbNombreProveedor.Text = "Exception en clase proveedor";
                }
                else {
                    txbNombreProveedor.Text = "Proveedor creado exitosamente";
                    txbNitProveedor.Text = "";
                    txbDireccion.Text = "";
                    txbTelefonoProveedor.Text = "";
                    txbEmailContacto.Text = "";
                }

            }
            catch (Exception ex)
            {

                txbNombreProveedor.Text = ex.Message;
            }
        }

        /// <summary>
        /// Evento para buscar un proveedor que se va editar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnBuscarEditarProveedor_Click(object sender, EventArgs e)
        {
            try
            {
                Proveedor objProveedor = new Proveedor();
                objProveedor = objProveedor.ConsultarProveedor(txbBuscarProveedor.Text.Trim());
               if(objProveedor != null){
                   hfEditarIdProveedor.Value = objProveedor._intIdProveedor.ToString();
                   txbEditarNit.Text = objProveedor._strNit;
                   txbEditarNombreProveedor.Text = objProveedor._strNombreProveedor;
                   txbEditarDirProveedor.Text = objProveedor._strDireccion;
                   txbEditarTelProveedor.Text = objProveedor._strTelefono;
                   txbEditarEmailProveedor.Text = objProveedor._strEmail;
               }



            }
            catch (Exception ex)
            {

                txbEditarNombreProveedor.Text = ex.Message;
            }
                    
        }

        /// <summary>
        /// Evento para  editar un proveedor
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEditarProveedor_Click(object sender, EventArgs e)
        {
            try
            {
                if (hfEditarIdProveedor.Value != "")
                {
                    Proveedor objProveedor = new Proveedor();
                    int filasAfectadas = 0;
                    filasAfectadas = objProveedor.EditarProveedor(Convert.ToInt32(hfEditarIdProveedor.Value), txbEditarNombreProveedor.Text, txbEditarNit.Text, txbEditarDirProveedor.Text, txbEditarTelProveedor.Text, "", txbEditarEmailProveedor.Text,"");
                    if (filasAfectadas == 2)
                    {
                        txbEditarNombreProveedor.Text = "Exception en clase proveedores";

                    }
                    else {
                            txbEditarNombreProveedor.Text = "Proveedor Editado con exito";
                            txbEditarNit.Text = "";
                            txbEditarDirProveedor.Text = "";
                            txbEditarTelProveedor.Text = "";
                            txbEditarEmailProveedor.Text = "";
                            hfEditarIdProveedor.Value = "";
                     }
                }
            }
            catch (Exception ex)
            {

                txbEditarNombreProveedor.Text = ex.Message;
            }
        }

        /// <summary>
        /// Evento para buscar un proveedor que se va a eliminar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnBuscarEliminarProveedor_Click(object sender, EventArgs e)
        {
            try
            {
                Proveedor objProveedor = new Proveedor();
                objProveedor = objProveedor.ConsultarProveedor(txbEliminarNIT.Text.Trim());

                if (objProveedor != null)
                {
                    lblNombreProveedor.Text = objProveedor._strNombreProveedor;
                    lblNIT.Text = objProveedor._strNit;
                    hfIdEliminarProveedor.Value = objProveedor._intIdProveedor.ToString();
                }                

            }
            catch (Exception ex)
            {

                lblNombreProveedor.Text = ex.Message;
            }
        }

        /// <summary>
        /// Evento para eliminar un proveedor
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEliminarProveedor_Click(object sender, EventArgs e)
        {
            try
            {
                int filasAfectadas = 0;
                Proveedor objProveedor = new Proveedor();
                filasAfectadas = objProveedor.EliminarProveedor(Convert.ToInt32(hfIdEliminarProveedor.Value));
                if (filasAfectadas == 2)
                {
                    lblNombreProveedor.Text = "Exception en clase proveedor";
                }
                else 
                {
                    lblNombreProveedor.Text = "";
                    lblNIT.Text = "";
                    hfIdEliminarProveedor.Value = "";
                }
            }
            catch (Exception ex)
            {
                lblNombreProveedor.Text = ex.Message;
             
            }
                
        }

  

        ////////////////////// FIN CRUD PROVEEDORES ////////////////////////

        ////////////////////// ENTRADAS ////////////////////////

        /// <summary>
        /// Evento para buscar un producto que se va a registar en una entrada
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            try
            {
                Producto objProducto = new Producto();
                objProducto = objProducto.ConsultarProducto(txbBuscarCodigoEntrada.Text.Trim());

                if (objProducto != null)
                {
                    lblNombreProductoEntrada.Text = objProducto._strNombreProducto;
                    hfIdProductoEntrada.Value = objProducto._intIdProductos.ToString();
                    txbPrecioProveedorEntrada.Text = objProducto._decValorProveedor.ToString();

                }

            }
            catch (Exception ex)
            {

                lblNombreProductoEntrada.Text = ex.Message;
            }
        }

        /// <summary>
        /// Evento para registrar/crear una entrada
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCrearEntrada_Click(object sender, EventArgs e)
        {
            try
            {
                DetalleEntrada objDetalleEntrada = new DetalleEntrada();
                Entrada objEntrada = new Entrada();
                MembershipUser objUser = Membership.GetUser(user);
                int filasAfectadas = 0;
                if ( Convert.ToInt32(txbCantidadEntrada.Text.Trim()) > 0)
                {
                 
                    objDetalleEntrada._intProducto =Convert.ToInt32( hfIdProductoEntrada.Value );
                    objDetalleEntrada._intCantidadIngresada = Convert.ToInt32(txbCantidadEntrada.Text.Trim());
                    objDetalleEntrada._decNuevoPrecio = Convert.ToDecimal(txbPrecioProveedorEntrada.Text.Trim());

                    objEntrada.AgregarDetalleEntrada(objDetalleEntrada);
                    objEntrada.objUser._gdIdUser = (System.Guid)objUser.ProviderUserKey;
                    filasAfectadas = objEntrada.CrearEntrada();
                    if (filasAfectadas == 0)
                    {
                        hfIdProductoEntrada.Value = "";
                        txbCantidadEntrada.Text = "Cantidad";
                        txbPrecioProveedorEntrada.Text = "";
                        lblNombreProductoEntrada.Text = "Nombre producto";
                    }
                    else
                    {
                        string msn = "No se pudo crear la entrada";
                    }

                }
                else
                {
                    string msn = "Por favor ingrese una cantidad mayor a cero";
                }

                
            }
            catch (Exception ex)
            {

                lblNombreProductoEntrada.Text = ex.Message;
            }
        }

        ////////////////////// FIN ENTRADAS ////////////////////////


        ////////////////////// PEDIDOS ////////////////////////


        /// <summary>
        /// Evento para buscar un producto que se va a agregar al pedido
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnBuscarProdPedido_Click(object sender, EventArgs e)
        {
            try
            {
                Producto objProducto = new Producto();
                DetallePedido objDetallePedido = new DetallePedido();

                objProducto = objProducto.ConsultarProducto(txbCodigoPedido.Text.Trim());
                if (objProducto != null )
                {

                    hfExistencias.Value = objProducto._intExistencias.ToString();
                    hfIdProductoPedido.Value = objProducto._intIdProductos.ToString();
                    lblNombreProductoPedido.Text = objProducto._strNombreProducto;
                    hfPrecioProveedor.Value = objProducto._decValorProveedor.ToString();
                }
                else
                {

                    lblNombreProductoPedido.Text = "No hay coincidencias";

                }

            }
            catch (Exception ex)
            {
                lblNombreProductoPedido.Text = ex.Message;
            }
        }

        /// <summary>
        /// Evento para agregar un producto a la lista del pedido
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAgregarPedido_Click(object sender, EventArgs e)
        {
            try
            {
                Producto objProducto = new Producto();
                DetallePedido objDetallePedido = new DetallePedido();
                if (Convert.ToInt32(txbCantidadPedido.Text.Trim()) > 0)
                {

                    if (Convert.ToInt32(hfExistencias.Value) >= Convert.ToInt32(txbCantidadPedido.Text.Trim()))
                    {
                        objDetallePedido._strCodigo = txbCodigoPedido.Text.Trim();
                        objDetallePedido._strNombreProducto = lblNombreProductoPedido.Text;
                        objDetallePedido._intExistencias = Convert.ToInt32(hfExistencias.Value);
                        objDetallePedido._intIdProducto = Convert.ToInt32(hfIdProductoPedido.Value);
                        objDetallePedido._intCantidadPedido = Convert.ToInt32(txbCantidadPedido.Text.Trim());
                        objDetallePedido._decValorProveedor = Convert.ToDecimal(hfPrecioProveedor.Value);


                        ValidarProductoPedido(objDetallePedido);


                    }
                    else
                    {
                        string strMensaje = "No hay suficientes existencias para asignar ala pedido";
                    }
                }
                else
                {
                    string strMensaje = "Digite una cantidad mayor a 0";
                }

            }
            catch (Exception ex)
            {

                lblNombreProductoPedido.Text = ex.Message;
            }
        }

        /// <summary>
        /// Evento para registrar/crear un pedido
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnRegistrarPedido_Click(object sender, EventArgs e)
        {
            try
            {
                Pedido objPedido = new Pedido();
                DetallePedido objDetallePedido = new DetallePedido();
                int filasAfectas = 0;
                MembershipUser objUser = Membership.GetUser(user);

                for (int i = 0; i < ViewState.Count; i++)
                {
                    objDetallePedido = (DetallePedido)ViewState["P" + i.ToString()];
                    objPedido.AgregarDetallePedido(objDetallePedido);
                }

             
                objPedido.objUser._gdIdUser = (System.Guid)objUser.ProviderUserKey;

                filasAfectas = objPedido.CrearPedido();

                if (filasAfectas == 2)
                {
                    string msn = "Exception en clase";
                }
                else
                {
                    ViewState.Clear();
                    gvPedido.DataSource = null;
                    gvPedido.DataBind();

                    string msn = "Pedido creado con exito";
                }

             
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }

        protected void gvPedido_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            decimal decValor = 0;

            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                int celda = 6;     
                decimal.TryParse(e.Row.Cells[celda].Text, out decValor);
                e.Row.Cells[celda].Text = decValor.ToString("F0");
            }
        }


        ////////////////////// FIN PEDIDOS ////////////////////////

        ////////////////////// REPORTES ////////////////////////

























        ////////////////////// FIN REPORTES ////////////////////////

    }
}