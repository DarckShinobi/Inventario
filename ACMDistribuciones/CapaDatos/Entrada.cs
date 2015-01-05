using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace CapaDatos
{
    [Serializable]
    public class Entrada
    {
        /// <summary>
        /// Constructor
        /// </summary>
        public Entrada()
        {
        
            objUser = new Usuario();
            objListaDetalleEntrada = new List<DetalleEntrada>();

        }

        
        /// <summary>
        /// Propiedades autoimplementadas
        /// </summary>
        public int _intIdEntrada { get; set; }
        public DateTime FechaEntrada { get; set; }
        public Usuario  objUser { get; set; }
        public List<DetalleEntrada> objListaDetalleEntrada { get; set; }

        /// <summary>
        /// Agrega un detalle entrada al final de la lista
        /// </summary>
        /// <param name="objDetalle"></param>
        public void AgregarDetalleEntrada(DetalleEntrada objDetalle) 
        {
            try
            {
                objListaDetalleEntrada.Add(objDetalle);
            }
            catch (Exception)
            {
                
                throw;
            }
        }

        /// <summary>
        /// Elimina un objeto detalle entrada que pertenezca a la lista
        /// </summary>
        /// <param name="objDetalleEntrada"></param>
        /// <returns></returns>
        public bool EliminarDetalleEntrada(DetalleEntrada objDetalleEntrada) 
        {
            bool estado;
            try
            {
                estado = objListaDetalleEntrada.Remove(objDetalleEntrada);
            }
            catch (Exception)
            {
                
                throw;
            }
            return estado;
        }

        /// <summary>
        /// Crea entrada
        /// </summary>
        /// <returns></returns>
        public int CrearEntrada()
        {
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            int Filas = 0;
            try
            {
                
                Filas = objAccesoDatosDataContext.spCrearEntrada(DateTime.Now, this.objUser._gdIdUser);
                
                var IdEntrada = objAccesoDatosDataContext.spConsultarIdEntrada();
                if(Filas == 0)
                {
                    foreach(var E in objListaDetalleEntrada)
                    {
                        Filas = objAccesoDatosDataContext.spCrearDetalleEntrada(IdEntrada.First().Column1, E._intProducto, E._decNuevoPrecio, E._intCantidadIngresada);
                        objAccesoDatosDataContext.spActualizarExistenciasEntrada(E._intProducto,E._intCantidadIngresada);
                    }
                }

            }
            catch (Exception)
            {
                
                throw;
            }
            return Filas;
        }
        /// <summary>
        /// Crea entrada a partir de un documento XML
        /// </summary>
        /// <param name="xmlDocumento">Representa un documento XML</param>
        /// <returns></returns>
        public int CrearEntrada(XmlDocument xmlDocumento )
        {
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            int Filas = 0;
            int i=0;
            try
            {
                 XmlNodeList xmlEntrada = xmlDocumento.GetElementsByTagName("Entrada");
                 foreach (XmlElement item in xmlEntrada)
                 {
                     XmlNodeList xmlIdEntrada = item.GetElementsByTagName("Id_Entrada_Producto");
                     XmlNodeList xmlFechaEntrada = item.GetElementsByTagName("FechaEntrada");
                     XmlNodeList xmlUserId = item.GetElementsByTagName("FK_Id_User");

                     this._intIdEntrada = Convert.ToInt32(xmlIdEntrada[i].InnerText);
                     this.FechaEntrada = Convert.ToDateTime(xmlFechaEntrada[i].InnerText);
                     this.objUser._gdIdUser = System.Guid.Parse(xmlUserId[i].InnerText);
                     Filas = objAccesoDatosDataContext.spCrearEntradaXML(this._intIdEntrada, this.FechaEntrada, this.objUser._gdIdUser);
                 }

                
               
               
            }
            catch (Exception)
            {

                throw;
            }
            return Filas;
        }
        /// <summary>
        /// Crea un detalle entrada a partir de un documento XML
        /// </summary>
        /// <param name="xmlDocumento">Representa un documento XML</param>
        /// <returns></returns>
        public int CrearDetalleEntrada(XmlDocument xmlDocumento)
        {
            DetalleEntrada objDetalleEntrada = new DetalleEntrada();
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            int Filas = 0;
            int i = 0;
            try
            { XmlNodeList xmlDetalleEntrada = xmlDocumento.GetElementsByTagName("DetalleEntrada");

            foreach (XmlElement item in xmlDetalleEntrada)
            {
                XmlNodeList xmlIdEntrada = item.GetElementsByTagName("Fk_Id_Entrada");
                XmlNodeList xmlIdProd = item.GetElementsByTagName("FK_Id_Producto");
                XmlNodeList xmlCantidadIngresada = item.GetElementsByTagName("Cantidad_Ingresada");

                objDetalleEntrada._intProducto = Convert.ToInt32(xmlIdProd[i].InnerText);
                objDetalleEntrada._intCantidadIngresada = Convert.ToInt32(xmlCantidadIngresada[i].InnerText);
                this._intIdEntrada = Convert.ToInt32(xmlIdEntrada[i].InnerText);
                this.AgregarDetalleEntrada(objDetalleEntrada);

            }
              
                    foreach (var Detalle in objListaDetalleEntrada)
                    {
                        Filas = objAccesoDatosDataContext.spCrearDetalleEntrada(this._intIdEntrada, Detalle._intProducto, Detalle._decNuevoPrecio, Detalle._intCantidadIngresada);
                     
                    }
              

            }
            catch (Exception)
            {

                throw;
            }
            return Filas;
        }
        /// <summary>
        /// Consulta entradas
        /// </summary>
        /// <param name="Filtro"></param>
        /// <param name="dato"></param>
        /// <returns></returns>
        public List<VistaReporteEntrada> ConsultarEntradas(string Filtro, string dato) 
        {
            List<VistaReporteEntrada> objListEntrada = new List<VistaReporteEntrada>();
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            int intPosicionItem = 0;
            try
            {
                switch (Filtro)
                {
                    case  "Categoria":
                        var QueryCategoria = from entrada
                            in objAccesoDatosDataContext.VistaReporteEntrada
                            where entrada.Descripcion == dato
                            select entrada;
                        foreach (var item in QueryCategoria)
                        {
                            objListEntrada.Insert(intPosicionItem,item);
                            intPosicionItem++;
                        }
                        break;
                    case "Producto":
                            
                            var QueryProducto = from entrada
                            in objAccesoDatosDataContext.VistaReporteEntrada
                            where entrada.Descripcion == dato
                            select entrada;
                            foreach (var item in QueryProducto)
                            {
                                objListEntrada.Insert(intPosicionItem,item);
                                intPosicionItem++;
                            }
                        break;
                    case "Proveedor":

                        var QueryProveedor = from entrada
                        in objAccesoDatosDataContext.VistaReporteEntrada
                                            where entrada.NombreProveedor == dato
                                            select entrada;
                        foreach (var item in QueryProveedor)
                        {
                            objListEntrada.Insert(intPosicionItem, item);
                            intPosicionItem++;
                        }
                        break;
                }

            }
            catch (Exception)
            {
                
                throw;

            }
            return objListEntrada;
        }

        /// <summary>
        /// Consulta entrada a partir de dos fechas establecidas
        /// </summary>
        /// <param name="FechaInicial"></param>
        /// <param name="FechaFinal"></param>
        /// <returns></returns>
        public List<VistaReporteEntrada> ConsultarEntradas(DateTime FechaInicial, DateTime FechaFinal)
        {
            List<VistaReporteEntrada> objListEntrada = new List<VistaReporteEntrada>();
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            int intPosicioItem = 0;
            try
            {
                var QueryFecha= from entradaFecha
                                in objAccesoDatosDataContext.VistaReporteEntrada 
                                where entradaFecha.FechaEntrada >= FechaInicial && entradaFecha.FechaEntrada <= FechaFinal 
                                select entradaFecha;

                foreach (var item in QueryFecha)
                {
                    objListEntrada.Insert(intPosicioItem,item);
                    intPosicioItem++;
                }
            }
            catch (Exception)
            {

                throw;
            }
            return objListEntrada;
        }

    }
}
