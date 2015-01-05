using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace CapaDatos
{
    [Serializable]
    public class Usuario
    {
        /// <summary>
        /// Constructor de la clase
        /// </summary>
        public Usuario()
        {
  
        }

       
        /// <summary>
        /// Propiedades autoimplementadas
        /// </summary>
        public Guid _gdIdUser { get; set; }
        public string _strPrimerNombre { get; set; }
        public string _strSegundoNombre { get; set; }
        public string _strPrimerApellido { get; set; }
        public string _strSegundoApellido { get; set; }
        public int _intEstado { get; set; }
        public string _strUserName { get; set; }
        public string _strEmail { get; set; }
        public string _strRole { get; set; }
        public string _strTelefono { get; set; }
        public string _strCelular { get; set; }
        public string _strCedula { get; set; }
        public bool _bolIsApproved { get; set; }

        /// <summary>
        /// Crea/registra un usuario 
        /// </summary>
        /// <returns></returns>
        public int CrearDetalleUsuario()
        {
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            int Filas=0;
            try
            {
                Filas = objAccesoDatosDataContext.spCrearUsuario(this._gdIdUser,this._strPrimerNombre,this._strSegundoNombre,this._strPrimerApellido,this._strSegundoApellido,this._strCedula,this._strTelefono,this._strEmail,this._strCelular);
            }
            catch (Exception)
            {
                
                throw;
            }
            return Filas;
        }
        /// <summary>
        /// Crear/registrar un usuario
        /// </summary>
        /// <param name="xmlDocumento">Representacion de un documento xml</param>
        /// <returns> </returns>
        public int CrearDetalleUsuario(XmlDocument xmlDocumento)
        {
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            int Filas = 0;
            int i = 0;
            try
            {
                XmlNodeList xmlUsuario = xmlDocumento.GetElementsByTagName("Usuario");
                foreach (XmlElement item in xmlUsuario)
                {
                    XmlNodeList xmlIdUser = item.GetElementsByTagName("FK_IdUserProfile");
                    XmlNodeList xmlNombre = item.GetElementsByTagName("Nombres");
                    XmlNodeList xmlApellidos = item.GetElementsByTagName("Apellidos");

                    this._gdIdUser = System.Guid.Parse(xmlIdUser[i].InnerText);
                    this._strPrimerNombre = xmlNombre[i].InnerText;
                    this._strPrimerApellido = xmlApellidos[i].InnerText;
                    Filas = objAccesoDatosDataContext.spCrearUsuario(this._gdIdUser, this._strPrimerNombre, this._strSegundoNombre, this._strPrimerApellido, this._strSegundoApellido, this._strCedula, this._strTelefono, this._strEmail, this._strCelular);
        
                }

            }
            catch (Exception)
            {
                Filas = 3;
            }
            return Filas;
        }

        /// <summary>
        /// Edita un usuario
        /// </summary>
        /// <param name="IdUser">Id usuario</param>
        /// <param name="nuevoprimerNombre"> Primer nombre</param>
        /// <param name="nuevosegundoNombre"> Segundo nombre</param>
        /// <param name="nuevoPrimerApellidos"> Primer apellido</param>
        /// <param name="nuevoSegundoApellido"> Segundo apellido</param>
        /// <param name="nuevaCedula"> Cedula</param>
        /// <param name="nuevoTelefono">Telefono</param>
        /// <param name="nuevoCelular">Celular</param>
        /// <param name="nuevoEmail">Email</param>
        /// <returns></returns>
        public int EditarDetalleUsuario(Guid IdUser, string nuevoprimerNombre, string nuevosegundoNombre, string nuevoPrimerApellidos, string nuevoSegundoApellido, string nuevaCedula, string nuevoTelefono, string nuevoCelular, string nuevoEmail) 
        {
            int filas = 0;
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            try
            {
                filas = objAccesoDatosDataContext.spActualizarUsuario(IdUser,nuevoprimerNombre,nuevosegundoNombre,nuevoPrimerApellidos,nuevoSegundoApellido,nuevaCedula,nuevoTelefono,nuevoCelular,nuevoEmail);
            }
            catch (Exception)
            {
                
                throw;
            }
            return filas;
        }
        /// <summary>
        /// Elimina un usuario
        /// </summary>
        /// <param name="IdUser">Id del usuario tipo GUID</param>
        /// <returns></returns>
        public int EliminarDetalleUsuario(Guid IdUser)
        {
            int filas;
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            try
            {
                filas = objAccesoDatosDataContext.spEliminarDetalleUsuario(IdUser);
            }
            catch (Exception)
            {
                
                throw;
            }
            return filas;
        }

        /// <summary>
        /// Obtiene un usuario 
        /// </summary>
        /// <param name="Buscar"></param>
        /// <returns></returns>
        public Usuario  ConsultarDetalleUsuario( string Buscar) 
        {
            Usuario objUsuario = new Usuario();
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            try
            {
                var Query = from User in objAccesoDatosDataContext.VistaUsuarios where User.Cedula == Buscar  && User.Estado == 1 select User;
                if (Query != null) 
                {
                    objUsuario._gdIdUser = Query.First().IdUsuario;
                 //   objUsuario._strNombres = Query.First().Nombres;
                 //   objUsuario._strApellidos = Query.First().Apellidos;
                    objUsuario._strEmail = Query.First().Email;
                    //objUsuario._strUserName = Query.First().UserName;
                    objUsuario._intEstado =(int) Query.First().Estado;
           //         objUsuario._strRole = Query.First().RoleName;
            //        objUsuario._bolIsApproved = Query.First().IsApproved;
                }
            }
            catch (Exception)
            {
                objUsuario = null;
            }
            return objUsuario;
        }

        /// <summary>
        /// Obtiene una lista de usuarios
        /// </summary>
        /// <returns></returns>
        public List<Usuario> ConsultarDetalleUsuarios() 
        {
            List<Usuario> objListaUsuarios = new List<Usuario>();
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            Usuario objUsuario = new Usuario();
            try
            {
                var Query = from User in objAccesoDatosDataContext.VistaUsuarios select User;

                foreach (var item in Query)
                {
                    objUsuario._gdIdUser = Query.First().IdUsuario;
                    //   objUsuario._strNombres = Query.First().Nombres;
                    //   objUsuario._strApellidos = Query.First().Apellidos;
                    objUsuario._strEmail = Query.First().Email;
                    //objUsuario._strUserName = Query.First().UserName;
                    objUsuario._intEstado = (int)Query.First().Estado;
                    //         objUsuario._strRole = Query.First().RoleName;
                    //        objUsuario._bolIsApproved = Query.First().IsApproved;
                    objListaUsuarios.Add(objUsuario);
                    objUsuario = new Usuario();
                }

            }
            catch (Exception)
            {
                objListaUsuarios = null;
            }
            return objListaUsuarios;
        }
    }
}
