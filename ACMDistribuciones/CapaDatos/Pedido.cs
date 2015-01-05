using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace CapaDatos
{
    [Serializable]
    public class Pedido
    {
        /// <summary>
        /// Constructor
        /// </summary>
        public Pedido()
        {
            objUser = new Usuario();
            objListaDetallePedido = new List<DetallePedido>();
        }

        

        /// <summary>
        /// Propiedades autoimplementadas
        /// </summary>
        public int _intIdPedido { get; set; }
        public DateTime _dtFecha{ get; set; }
        
        public Usuario objUser { get; set; }
        public List<DetallePedido> objListaDetallePedido { get; set; }

        /// <summary>
        /// Agrega un detalle pedido a la ultima posicion 
        /// </summary>
        /// <param name="objDetalle"></param>
        public void AgregarDetallePedido(DetallePedido objDetalle)
        {
            try
            {
                objListaDetallePedido.Add(objDetalle);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        /// <summary>
        /// Elimina un objeto detalle pedido que pertenece a la lista 
        /// </summary>
        /// <param name="objDetalle"></param>
        /// <returns></returns>
        public bool EliminarDetallePedido(DetallePedido objDetalle)
        {
            bool estado;
            try
            {
                estado = objListaDetallePedido.Remove(objDetalle);
            }
            catch (Exception)
            {
                
                throw;
            }
            return estado;
        }

        /// <summary>
        /// Crea un pedido
        /// </summary>
        /// <returns></returns>
        public int CrearPedido() 
        {
            int filas;
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext(); 
            try
            {
                filas = objAccesoDatosDataContext.spCrearSalida(DateTime.Now, this.objUser._gdIdUser);
                
                var IdPedido=objAccesoDatosDataContext.spConsultarIdSalida();
                if(filas == 0)
                {
                    foreach (var P in objListaDetallePedido)
                    {
                        objAccesoDatosDataContext.spCrearDetalleSalida(P._intCantidadPedido,P._intIdProducto,IdPedido.First().Column1);
                        objAccesoDatosDataContext.spActualizarExistenciasPedido(P._intIdProducto,P._intCantidadPedido);
                    }
                }
            }
            catch (Exception )
            {
                filas = 2;
            }
            return filas;
        }
        /// <summary>
        /// Crea un pedido
        /// </summary>
        /// <param name="xmlDocumento">Representa un documento XML </param>
        /// <returns></returns>
        public int CrearPedido(XmlDocument xmlDocumento)
        {
            int filas=0;
            int i=0;
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            try
            {
                XmlNodeList xmlPedido = xmlDocumento.GetElementsByTagName("Pedido");
                foreach (XmlElement item in xmlPedido)
                {
                    XmlNodeList xmlIdPedido = item.GetElementsByTagName("Id_Pedido");
                    XmlNodeList xmlFecha = item.GetElementsByTagName("Fecha");
                    XmlNodeList xmlUser = item.GetElementsByTagName("FK_Id_User");

                    this._intIdPedido = Convert.ToInt32(xmlIdPedido[i].InnerText);
                    this._dtFecha = Convert.ToDateTime(xmlFecha[i].InnerText);
                    this.objUser._gdIdUser = System.Guid.Parse(xmlUser[i].InnerText);

                    filas = objAccesoDatosDataContext.spCrearSalidaXML(this._intIdPedido, this._dtFecha ,this.objUser._gdIdUser);

                }
                
            }
            catch (Exception ex)
            {
                filas = 2;
            }
            return filas;
        }
        /// <summary>
        /// Crea  detalle pedido
        /// </summary>
        /// <param name="xmlDocumento">Representa un documento XML</param>
        /// <returns></returns>
        public int CrearDetallePedido(XmlDocument xmlDocumento)
        {
            int filas= 0;
            int i = 0;
            DetallePedido objDetallePedido = new DetallePedido();
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            try
            {
                XmlNodeList xmlDetallePedido = xmlDocumento.GetElementsByTagName("DetallePedido");
                foreach (XmlElement item in xmlDetallePedido)
                {

                    XmlNodeList xmlIdProducto = xmlDocumento.GetElementsByTagName("FK_Id_Producto");
                    XmlNodeList xmlIdPedido = xmlDocumento.GetElementsByTagName("FK_Id_Pedido");
                    XmlNodeList xmlCantidadIngresada = xmlDocumento.GetElementsByTagName("Cantidad_Pedido");
                    objDetallePedido._intIdProducto = Convert.ToInt32(xmlIdProducto[i].InnerText);
                    objDetallePedido._intCantidadPedido = Convert.ToInt32(xmlCantidadIngresada[i].InnerText);
                    this._intIdPedido = Convert.ToInt32(xmlIdPedido[i].InnerText);
                    this.AgregarDetallePedido(objDetallePedido);

                }

                    foreach (var Detalle in objListaDetallePedido)
                    {
                        filas = objAccesoDatosDataContext.spCrearDetalleSalidaXML(this._intIdPedido, Detalle._intIdProducto, Detalle._intCantidadPedido);
          
                    }
                
            }
                catch (Exception ex)
            {
                filas = 2;
            }
            return filas;
        }

        /// <summary>
        /// Consultar pedidos
        /// </summary>
        /// <param name="Filtro">Tipo de busqueda</param>
        /// <param name="dato"></param>
        /// <returns></returns>
        public List<VistaPedido> ConsultarPedido(string Filtro,string dato) 
        {
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            List<VistaPedido> objListaPedido = new List<VistaPedido>();
            int intPosicionItem = 0;
            try
            {
                switch (Filtro)
                {
                    case "Producto":
                        var QueryProducto = from objPedido
                                            in objAccesoDatosDataContext.VistaPedido 
                                            where objPedido.Codigo == dato 
                                            select objPedido;
                        
                        foreach (var item in QueryProducto)
                        {
                            objListaPedido.Insert(intPosicionItem,item);
                            intPosicionItem++;
                        }

                        break;
                    case "Categoria":
                            var QueryCategoria = from objPedido
                                            in objAccesoDatosDataContext.VistaPedido 
                                            where objPedido.NombreCategoria == dato 
                                            select objPedido;

                        foreach (var item in QueryCategoria)
                        {
                            objListaPedido.Insert(intPosicionItem,item);
                            intPosicionItem++;
                        }
                        break;
                      
                   
                }
            }
            catch (Exception)
            {
                
                throw;
            }
            return objListaPedido;
        }
        /// <summary>
        /// Consulta un pedido
        /// </summary>
        /// <param name="fechaInicial">Fecha inicial</param>
        /// <param name="fechaFinal">Fecha final</param>
        /// <returns></returns>
        public List<VistaPedido> ConsultarPedido(DateTime fechaInicial,DateTime fechaFinal)
        {
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            List<VistaPedido> objListaPedido = new List<VistaPedido>();
            int intPosicionItem = 0;
            try
            {
                var QueryFecha = from objPedido
                                            in objAccesoDatosDataContext.VistaPedido
                                            where objPedido.FechaSalida >= fechaInicial && objPedido.FechaSalida <= fechaFinal
                                            select objPedido;

                        foreach (var item in QueryFecha)
                        {
                            objListaPedido.Insert(intPosicionItem, item);
                            intPosicionItem++;
                        }

                
            }
            catch (Exception)
            {

                throw;
            }
            return objListaPedido;
        }
    }
}
