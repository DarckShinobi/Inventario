using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace CapaDatos
{
    [Serializable]
    public class Proveedor
    {
        /// <summary>
        /// Constructor
        /// </summary>
        public Proveedor()
        {

        }

        

        /// <summary>
        /// Propiedades autoimplementadas
        /// </summary>
        public int _intIdProveedor { get; set; }
        public string _strNombreProveedor { get; set; }
        public string _strCiudad { get; set; }
        public string _strNit { get; set; }
        public string _strDireccion { get; set; }
        public string _strTelefono { get; set; }
        public string _strCelular { get; set; }
        public string _strContacto { get; set; }
        public string _strEmail { get; set; }
        public int _intEstado { get; set; }

        /// <summary>
        /// Validar la existencia de un proveedor
        /// </summary>
        /// <param name="nBuscar"></param>
        /// <returns></returns>
        public int ValidarProveedor(string nBuscar) 
        {
            int Valido = 0;
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            try
            {
                var Respuesta = from Prov in objAccesoDatosDataContext.Proveedores where Prov.NombreProveedor == nBuscar select Prov;

                if (Respuesta.Count<Proveedores>() == 0)
                {
                    Valido = 1;
                }
                else
                {
                    Valido = 2;
                }
            }
            catch (Exception)
            {

                Valido = 2;
            }
            return Valido;
        }
        /// <summary>
        ///  Asocia los productos a los proveedores existentes
        /// </summary>
        /// <param name="IdProveedor"></param>
        /// <param name="IdProducto"></param>
        /// <returns> </returns> 
        public int  AsociarProducto(int IdProveedor,int IdProducto) 
        {
            int fila = 0;
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            try
            {
                fila = objAccesoDatosDataContext.spCrearDetalleProveedor(IdProducto,IdProveedor);
            }
            catch (Exception)
            {

                fila = 2;
            }
            return fila;
        }
        
        /// <summary>
        /// Asociar los productos a los proveedores existentes
        /// </summary>
        /// <param name="xmlDocumento"></param>
        /// <returns></returns>
        public int AsociarProducto(XmlDocument xmlDocumento)
        {
            int fila = 0;
            int i = 0;
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            try
            {
                 XmlNodeList FilaDetalleProveedor = xmlDocumento.GetElementsByTagName("DetalleProveedor");
                 foreach (XmlElement item in FilaDetalleProveedor)
                 {
                     XmlNodeList xmlIdProducto = item.GetElementsByTagName("Id_Productos");
                     XmlNodeList xmlIdProveedor = item.GetElementsByTagName("FK_Id_Proveedor");
                     fila = objAccesoDatosDataContext.spCrearDetalleProveedor(Convert.ToInt32(xmlIdProveedor[i].InnerText), Convert.ToInt32(xmlIdProducto[i].InnerText));
                 }
                
               
            }
            catch (Exception)
            {

                fila = 2;
            }
            return fila;
        }


        /// <summary>
        /// Crear un proveedor
        /// </summary>
        /// <returns></returns>
        public int CrearProveedor()
        {
            int filas=0;
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            try
            {
                if (ValidarProveedor(this._strNombreProveedor) == 1)
                {
                    filas = objAccesoDatosDataContext.spCrearProveedor(this._strNombreProveedor, this._strCiudad, this._strDireccion, this._strTelefono, this._strCelular, this._strContacto, this._strEmail);
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
        /// Crea un Proveedor
        /// </summary>
        /// <param name="xmlDocumento">Representa un documento XML</param>
        /// <returns></returns>
        public int CrearProveedor(XmlDocument xmlDocumento)
        {
            int i = 0; int filas = 0;
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            try
            {
                XmlNodeList xmlFilaProveedor = xmlDocumento.GetElementsByTagName("Proveedores");
                foreach (XmlElement item in xmlFilaProveedor)
                {
                    XmlNodeList xmlIdProveedor = item.GetElementsByTagName("IdProveedores");
                    XmlNodeList xmlNombre = item.GetElementsByTagName("NombreProveedor");
                    XmlNodeList xmlDireccion = item.GetElementsByTagName("Direccion");
                    XmlNodeList xmlTelefono = item.GetElementsByTagName("Telefono");
                    XmlNodeList xmlCelular = item.GetElementsByTagName("Celular");

                    this._intIdProveedor = Convert.ToInt32(xmlIdProveedor[i].InnerText);
                    this._strNombreProveedor = xmlNombre[i].InnerText;
                    this._strDireccion = xmlDireccion[i].InnerText;
                    this._strTelefono = xmlTelefono[i].InnerText;
                    this._strCelular = xmlCelular[i].InnerText;



                    if (ValidarProveedor(this._strNombreProveedor) == 1)
                    {
                        filas = objAccesoDatosDataContext.spCrearProveedorXML(this._intIdProveedor, this._strNombreProveedor, this._strCiudad, this._strDireccion, this._strTelefono, this._strCelular, this._strContacto, this._strEmail);
                    }
                    else
                    {
                        filas = 1;
                    }
                }
             
            }
            catch (Exception)
            {
                filas = 3;
            }

            return filas;
        }
        /// <summary>
        /// Edita un proveedor
        /// </summary>
        /// <param name="Id"></param>
        /// <param name="nuevoNombre"></param>
        /// <param name="nuevaDireccion"></param>
        /// <param name="nuevoTelefono"></param>
        /// <param name="nuevoCelular"></param>
        /// <returns></returns>
        public int EditarProveedor(int Id, string nuevoNombre,string Nit, string nuevaDireccion, string nuevoTelefono,string nuevoCelular,string Email,string Contacto) 
        {
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            int filas = 0;
            try
            {
                filas = objAccesoDatosDataContext.spActualizarProveedor(Id, nuevoNombre,Nit, nuevaDireccion, nuevoTelefono, nuevoCelular, Contacto, Email);
            }
            catch (Exception)
            {

                filas = 2;
            }
            return filas;
        }

        /// <summary>
        ///  Elimina un proveedor
        /// </summary>
        /// <param name="IdProveedor"></param>
        /// <returns></returns>
        public int EliminarProveedor(int IdProveedor) 
        {
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            int filas = 0;
            try
            {
                filas = objAccesoDatosDataContext.spEliminarProveedor(IdProveedor);
            }
            catch (Exception)
            {

                filas = 2;
            }
            return filas;
        }

        /// <summary>
        /// Consultar un proveedor
        /// </summary>
        /// <param name="nbuscar"></param>
        /// <returns></returns>
        public Proveedor ConsultarProveedor(string nbuscar) 
        {
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            Proveedor objP = new Proveedor();
            try
            {
                var Query = from Prov in objAccesoDatosDataContext.Proveedores where (Prov.NombreProveedor == nbuscar || Prov.NIT == nbuscar) && Prov.EstadoProveedor == 1 select Prov;
                if (Query != null) 
                {
                    objP._intIdProveedor = Query.First().IdProveedor;
                    objP._strNombreProveedor = Query.First().NombreProveedor;
                    objP._strDireccion = Query.First().Direccion;
                    objP._strTelefono = Query.First().Telefono;
                    objP._strCelular = Query.First().Celular;
                    objP._intEstado = Query.First().EstadoProveedor;
                }
            }
            catch (Exception)
            {

                objP = null;
            }
            return objP;
        }

        /// <summary>
        /// Consulta proveedores
        /// </summary>
        /// <returns></returns>
        public List<Proveedor> ConsultarProveedores() 
        {
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            List<Proveedor> objListaProveedores = new List<Proveedor>();
            Proveedor objP = new Proveedor();
            try
            {
                var Query = from Prove in objAccesoDatosDataContext.Proveedores where Prove.EstadoProveedor == 1 select Prove;
                foreach(var Q in Query)
                {
                    objP._intIdProveedor = Q.IdProveedor;
                    objP._strNombreProveedor = Q.NombreProveedor;
                    objP._strDireccion = Q.Direccion;
                    objP._strTelefono = Q.Telefono;
                    objP._strCelular = Q.Celular;
                    objP._intEstado = Q.EstadoProveedor;
                    objListaProveedores.Add(objP);
                    objP = new Proveedor();
                }

            }
            catch (Exception)
            {

                objListaProveedores = null;
            }
            return objListaProveedores;
        }

    }
}
