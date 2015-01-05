using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace CapaDatos
{
    [Serializable]
    public class Producto
    {
        /// <summary>
        /// Constructor
        /// </summary>
        public Producto()
        {
          
            objProveedor = new Proveedor();
            objCategoria = new Categoria();
        }

        

        /// <summary>
        /// Propiedades autoimplementadas
        /// </summary>
        public int _intIdProductos { get; set; }
        public string _strCodigo { get; set; }
        public string _strNombreProducto { get; set; }
        public string _strDescripcion { get; set; }
        public int _intUnidadesCaja { get; set; }
        public int _intExistencias { get; set; }
        public string _strEstado { get; set; }
        public decimal _decValorProveedor { get; set; }
        public Proveedor objProveedor { get; set; }
        public Categoria objCategoria { get; set; }
        public decimal _decCostoUniMayorista { get; set; }
        public decimal _decCostoUniMinorista { get; set; }

        /// <summary>
        /// Crea el codigo de barras
        /// </summary>
        /// <param name="Codigo"></param>
        /// <returns></returns>
        public object CrearCodigoBarras(string Codigo) 
        {

            object Imagen = null;
            try
            {
                //Asigno el tipo de codigo
                BarcodeLib.TYPE tipo = BarcodeLib.TYPE.CODE39;
                //instancio un objeto Barcode
                BarcodeLib.Barcode CodigodeBarras = new BarcodeLib.Barcode();
                //Asigno valor para mostrar el valor(numero) en el codigo de barras
                CodigodeBarras.IncludeLabel = true;
                //Se crea el codigo de barras
                Imagen = (object)CodigodeBarras.Encode(tipo, Codigo.Trim(), 300, 150);
            }
            catch (Exception ex)
            {
                Imagen = ex;
            }

            return Imagen;
        }
        /// <summary>
        /// Crea un codigo para el producto
        /// </summary>
        /// <param name="IdCategoria"></param>
        /// <returns></returns>
        public int CrearCodigo(int IdCategoria)
        {
            int Codigo=0;
            int CodigoGenerado=0;
            int incremento = 0;
             AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
           try
            {
                var Cod = objAccesoDatosDataContext.spObtenerIdProductoCategoria(IdCategoria);

                Codigo = (int)Cod.First().Column1;
                Codigo += 1;
                if (Codigo <= 999)
                {
                    incremento = IdCategoria * 1000;
                    CodigoGenerado = incremento + Codigo;
                }
                if (Codigo >= 1000 && Codigo <= 9999)
                {
                    incremento = IdCategoria * 10000;
                    CodigoGenerado = incremento + Codigo;
                }
                if (Codigo >= 10000 && Codigo <= 99999)
                {
                    incremento = IdCategoria * 100000;
                    CodigoGenerado = incremento + Codigo;
                }
            }
            catch (Exception)
            {
                
                throw;
            }
            return Codigo;
                    
        }
        /// <summary>
        /// Validar la existencia de un producto
        /// </summary>
        /// <param name="nBuscar"></param>
        /// <returns>1: Producto NO existe 2: Producto YA existe 3:Excepion</returns>
        public int ValidarProducto(string nBuscar) 
        {
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            int Valido = 0;
            try
            {
                var Respuesta = from Pro in objAccesoDatosDataContext.VistaProductos where Pro.Codigo == nBuscar select Pro;
                if (Respuesta.Count<VistaProductos>() == 0)
                {
                    // No hay elementos similares
                    Valido = 1; 
                }
                else
                {
                    Valido = 2;
                }
            }
            catch (Exception )
            {

                Valido = 3;
            }
            return Valido;
        }

        /// <summary>
        /// Crear un producto
        /// </summary>
        /// <returns></returns>
        public int CrearProducto()
        {
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            int filas = 0;
            try
            {
                if (ValidarProducto(this._strCodigo) == 1)
                {
                    filas = objAccesoDatosDataContext.spCrearProducto(this._strCodigo,this._strNombreProducto,this._strDescripcion,this._decValorProveedor,this._intExistencias,this.objCategoria._intIdCategoria);
                }
                else
                {
                    filas = 1;
                }
            }
            catch (Exception)
            {
                filas = 2;
                
            }
            return filas;
        }
         /// <summary>
         /// Crear un producto
         /// </summary>
         /// <param name="xmlDocumento">representa un documento XML</param>
         /// <returns></returns>
        public int CrearProducto(XmlDocument xmlDocumento)
        {
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            int filas = 0;
            int i = 0;
            try
            {

                XmlNodeList xmlFilaProducto = xmlDocumento.GetElementsByTagName("Productos");
                foreach (XmlElement item in xmlFilaProducto)
                {
                    XmlNodeList xmlIdProducto = item.GetElementsByTagName("Id_Productos");
                    XmlNodeList xmlCodigo = item.GetElementsByTagName("Codigo");
                    XmlNodeList xmlNombre = item.GetElementsByTagName("Nombre_Productos");
                    XmlNodeList xmlExistencias = item.GetElementsByTagName("Existencias");
                    XmlNodeList xmlValorProveedor = item.GetElementsByTagName("Valor_Proveedor");
                    XmlNodeList xmlIdCategoria = item.GetElementsByTagName("Fk_Id_Categoria");

                    this._intIdProductos = Convert.ToInt32(xmlIdProducto[i].InnerText);
                    this._strCodigo = xmlCodigo[i].InnerText;
                    this._strNombreProducto = xmlNombre[i].InnerText;
                    this._intExistencias = Convert.ToInt32(xmlExistencias[i].InnerText);
                    string[] valProveedor = xmlValorProveedor[i].InnerText.Split('.');//Obtengo el valor sin 
                    this._decValorProveedor = Convert.ToDecimal(valProveedor[0]);
                    this.objCategoria._intIdCategoria = Convert.ToInt32(xmlIdCategoria[i].InnerText);

                    if (ValidarProducto(this._strCodigo) == 1)
                    {
                        filas = objAccesoDatosDataContext.spCrearProductoXML(this._intIdProductos, this._strCodigo, this._strNombreProducto, this._strDescripcion, this._decValorProveedor, this._intExistencias, this.objCategoria._intIdCategoria);
                    }
                    else
                    {
                        filas = 1;
                    }
                }
     

            }
            catch (Exception)
            {
                filas = 2;

            }
            return filas;
        }
        /// <summary>
        /// Edita un producto
        /// </summary>
        /// <param name="IdProducto"></param>
        /// <param name="nuevoCodigo"></param>
        /// <param name="nuevoNombre"></param>
        /// <param name="nuevasUniCaja"></param>
        /// <param name="nuevoValorProveedor"></param>
        /// <returns></returns>
        public int EditarProducto(int IdProducto,string nuevoNombre,string descipcion ,decimal nuevoValorProveedor) 
        {
            int filas = 0;
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            try
            {   
                filas = objAccesoDatosDataContext.spActualizarProducto(IdProducto,nuevoNombre, descipcion, nuevoValorProveedor);
            }
            catch (Exception)
            {
                filas = 2;

            }
            return filas;
        }
        /// <summary>
        /// Elimina un producto
        /// </summary>
        /// <param name="IdPro"></param>
        /// <returns></returns>
        public int EliminarProducto(int IdPro) 
        {
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            int filas = 0;
            try
            {
                filas = objAccesoDatosDataContext.spEliminarProducto(IdPro);
            }
            catch (Exception)
            {
                filas = 2;

            }
            return filas;
        }
        /// <summary>
        /// Consultar producto
        /// </summary>
        /// <param name="nBuscar"></param>
        /// <returns></returns>
        public Producto ConsultarProducto(string nBuscar)
        {
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            Producto objP= new Producto();
            try
            {
                var Respuesta = from Prod in objAccesoDatosDataContext.VistaProductos where Prod.Codigo == nBuscar  select Prod;
                if (Respuesta != null) 
                {
                    objP._intIdProductos = Respuesta.First().IdProducto;
                    objP._strNombreProducto = Respuesta.First().NombreProducto;
                    objP._strCodigo = Respuesta.First().Codigo;
                    objP._intExistencias = Respuesta.First().Existencias;
                    objP._decValorProveedor = Respuesta.First().PrecioProveedor;
                    //objP._strEstado = Respuesta.First().EstadoProducto;
                    objP._decCostoUniMayorista = (decimal)Respuesta.First().PrecioVentaMayorista;
                    objP._decCostoUniMinorista = (decimal)Respuesta.First().PrecioVentaMinorista;
                }
            }
            catch (Exception)
            {
                objP = null;

            }
            return objP;
        }
        /// <summary>
        /// Consultar producto
        /// </summary>
        /// <param name="nBuscar"></param>
        /// <returns></returns>
        public List<Producto> ConsultarProductoCategoria(string categoria)
        {
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            Producto objP = new Producto();
            List<Producto> objLista = new List<Producto>();
            try
            {
                var Respuesta = objAccesoDatosDataContext.spConsultarProductosCategoria(categoria);
                               
                            
                if (Respuesta != null)
                {
                    foreach (var item in Respuesta)
                    {
                        objP._intIdProductos = item.IdProducto;
                        objP._strNombreProducto = item.NombreProducto;
                        objP._strCodigo = item.Codigo;
                        objP._intExistencias = item.Existencias;
                        objP._decValorProveedor = item.PrecioProveedor;
                        //objP._strEstado = Respuesta.First().EstadoProducto;
                       
                        objP._decCostoUniMayorista = (decimal)item.PrecioVentaMayorista;
                        objP._decCostoUniMinorista = (decimal)item.PrecioVentaMinorista;
                        objLista.Add(objP);
                        objP = new Producto();
                    }
                }
            }
            catch (Exception)
            {
                objLista = null;

            }
            return objLista;
        }
        /// <summary>
        /// Consultar productos
        /// </summary>
        /// <returns></returns>
        public List<Producto> ConsultarProductos()
        {
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            List<Producto> objListaProducto = new List<Producto>();
            Producto objP = new Producto();
            try
            {
                var Query = from Prod in objAccesoDatosDataContext.VistaProductos select Prod;
                foreach (var Q in Query) 
                {
                    objP._intIdProductos = Q.IdProducto;
                    objP._strNombreProducto =Q.NombreProducto;
                    objP._strCodigo = Q.Codigo;
                    objP._intExistencias = Q.Existencias;
                    objP._decValorProveedor = Q.PrecioProveedor;
                    //objP._strEstado = Q.EstadoProducto;
                    objP._decCostoUniMayorista = (decimal)Q.PrecioVentaMayorista;
                    objP._decCostoUniMinorista = (decimal)Q.PrecioVentaMinorista;
                    objListaProducto.Add(objP);
                    objP = new Producto();
                }
            }
            catch (Exception)
            {
                objListaProducto = null;
            }
            return objListaProducto;
        }
        /// <summary>
        /// Consultar productos
        /// </summary>
        /// <returns></returns>
        public List<Producto> ConsultarProductos(string codigo)
        {
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            List<Producto> objListaProducto = new List<Producto>();
            Producto objP = new Producto();
            try
            {
                var Query = from Prod in objAccesoDatosDataContext.VistaProductos where Prod.Codigo == codigo  select Prod;
                foreach (var Q in Query)
                {
                    objP._intIdProductos = Q.IdProducto;
                    objP._strNombreProducto = Q.NombreProducto;
                    objP._strCodigo = Q.Codigo;
                    objP._intExistencias = Q.Existencias;
                    objP._decValorProveedor = Q.PrecioProveedor;
                    //objP._strEstado = Q.EstadoProducto;
                    objP._decCostoUniMayorista = (decimal)Q.PrecioVentaMayorista;
                    objP._decCostoUniMinorista = (decimal)Q.PrecioVentaMinorista;
                    objListaProducto.Add(objP);
                    objP = new Producto();

                }
            }
            catch (Exception)
            {
                objListaProducto = null;
            }
            return objListaProducto;
        }

        /// <summary>
        /// Consultar productos Reporte
        /// </summary>
        /// <param name="Filtro"></param>
        /// <param name="dato"></param>
        /// <returns></returns>
        public List<VistaReporteProductos> ConsultaReporte(string Filtro, string dato) {
            List<VistaReporteProductos> objListaReporte = new List<VistaReporteProductos>();
            AccesoDatosDataContext objAccesoDatosDataContext= new AccesoDatosDataContext();

            try
            {
                int intPosicionItem = 0;
                switch (Filtro)
                {
                    case "Proveedor":
                        var Query = from obj
                                    in objAccesoDatosDataContext.VistaReporteProductos 
                                    where obj.NombreProveedor == dato 
                                    select obj ;
                        foreach (var item in Query)
                        {
                            objListaReporte.Insert(intPosicionItem,item);
                            intPosicionItem++;
                        }

                        break;
                    case "Categoria":
                        
                        var QueryCategoria = from obj
                                             in objAccesoDatosDataContext.VistaReporteProductos 
                                             where obj.Descripcion == dato 
                                             select obj;

                        foreach (var item in QueryCategoria)
                        {
                            objListaReporte.Insert(intPosicionItem,item);
                            intPosicionItem++;
                        }

                        break;
                    
                    case "Producto":

                            var QueryProducto = from obj
                                    in objAccesoDatosDataContext.VistaReporteProductos 
                                    where obj.Codigo == dato
                                    select obj;
                        foreach (var item in QueryProducto)
                        {
                            objListaReporte.Insert(intPosicionItem,item);
                            intPosicionItem++;
                        }

                        break;
                }
            }
            catch (Exception )
            {
                
                throw;
            }

            return objListaReporte;
        
        }

    }
}
