using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml;

namespace CapaDatos
{
    [Serializable]
    public class Categoria
    {
        /// <summary>
        /// Constructor
        /// </summary>
        public Categoria()
        {
          
        }

      
        /// <summary>
        /// Propiedades autoimplementadas
        /// </summary>
        public int _intIdCategoria { get; set; }
        public string _strNombreCategoria { get; set; }
        public string _strDescripcionCategoria { get; set; }
        public int _intEstado { get; set; }

        /// <summary>
        /// Valida la existencia de categorias
        /// </summary>
        /// <param name="buscar"></param>
        /// <returns>1: Categoria NO existe 2: Categoria YA existe 3:Excepion</returns>
        private int ValidarCategoria(string nombre)
        {
            int Valido = 0;
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            try
            {
                var Respuesta = from Cat in objAccesoDatosDataContext.Categorias where Cat.NombreCategoria == nombre select Cat;
 
                if(Respuesta.Count<Categorias>() == 0)
                {
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
        /// Crear una categoria
        /// </summary>
        /// <returns>0: Categoria creada con exito 2: Categoria YA existe 3:Exception</returns>
        public int CrearCategoria() 
        {
            int filas=0;
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            try
            {
                filas = ValidarCategoria(this._strNombreCategoria);
                if (filas == 1)
                {
                    filas = objAccesoDatosDataContext.spCrearCategoria(this._strNombreCategoria,this._strDescripcionCategoria);

                 }
                else 
                {
                    filas = 1;
                }
            }
            catch (Exception)
            {
                
                filas=2;
            }
            return filas;
        }
        /// <summary>
        /// Crear una categoria apartir de un documento XML
        /// </summary>
        /// <returns>0: Categoria creada con exito 2: Categoria YA existe 3:Exception</returns>
        public int CrearCategoria(XmlDocument xmlDocumento)
        {
            int filas = 0;
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            int i = 0;
            try
            {
                 XmlNodeList xmlFilaCategoria = xmlDocumento.GetElementsByTagName("Categorias");
                 foreach (XmlElement item in xmlFilaCategoria)
                 {

                     XmlNodeList xmlId = item.GetElementsByTagName("IdCategoria");
                     XmlNodeList xmlNombreCategoria = item.GetElementsByTagName("Descripcion");

                     this._intIdCategoria = Convert.ToInt32(xmlId[i].InnerText);
                     this._strNombreCategoria = xmlNombreCategoria[i].InnerText;

                     filas = ValidarCategoria(this._strNombreCategoria);
                     if (filas == 1)
                     {
                         filas = objAccesoDatosDataContext.spCrearCategoriaXML(this._intIdCategoria, this._strNombreCategoria);

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
        /// Editar categorias
        /// </summary>
        /// <param name="IdCate"></param>
        /// <param name="NuevoNombre"></param>
        /// <returns>0: Edicion con exito 1:No se puede exitar Categoria 2: Exception</returns>
        public int EditarCategoria(int IdCate,string NuevoNombre,string NuevaDescripcion)
        {
            int filas=0;
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            try
            {
                filas = objAccesoDatosDataContext.spActualizarNombreCategoria(IdCate, NuevoNombre,NuevaDescripcion);
               
            }
            catch (Exception)
            {
                filas = 2;
            }
            return filas;
        }

        /// <summary>
        /// Eliminar una categoria
        /// </summary>
        /// <param name="IdCate"></param>
        /// <returns> 0: Eliminacion con exito 1:No se puede editar 2:Exception </returns>
        public int EliminarCategoria(int IdCate)
        {
            int filas=0;
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            try
            {
                filas = objAccesoDatosDataContext.spEliminarCategoria(IdCate);
            }
            catch (Exception)
            {
                filas = 2;
            }
            return filas;
        }

        /// <summary>
        /// Consultar una categoria
        /// </summary>
        /// <param name="buscar"></param>
        /// <returns>una objeto de categoria</returns>
        public Categoria ConsultarCategoria(string nbuscar)
        {
            Categoria objC = new Categoria();
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            try
            {
                var Query = from Cate in objAccesoDatosDataContext.Categorias where Cate.NombreCategoria == nbuscar && Cate.Estado == 1 select Cate;
                if (Query != null) 
                {
                    objC._intIdCategoria = Query.First().IdCategoria;
                    objC._strNombreCategoria = Query.First().NombreCategoria;
                    objC._intEstado = Query.First().Estado;
                }
            }
            catch (Exception )
            {
                objC = null;
            }
            return objC;
        }

        /// <summary>
        /// Consultar categorias
        /// </summary>
        /// <returns>retorna una lista de objetos de tipo categoria</returns>
        public List<Categoria> ConsultarCategorias() 
        {
            List<Categoria> objListaCategoria = new List<Categoria>();
            AccesoDatosDataContext objAccesoDatosDataContext = new AccesoDatosDataContext();
            Categoria objC = new Categoria();
            try
            {
                var Query = from Cat
                            in objAccesoDatosDataContext.Categorias 
                            where Cat.Estado == 1 
                            orderby Cat.NombreCategoria ascending 
                            select Cat;

                foreach (var Q in Query) 
                {
                        objC._intIdCategoria = Q.IdCategoria;
                        objC._strNombreCategoria = Q.NombreCategoria;
                        objC._intEstado = Q.Estado;
                        objListaCategoria.Add(objC);
                        objC = new Categoria();
                }
            }
            catch (Exception)
            {

                objListaCategoria = null;
            }
            return objListaCategoria;
        }
    }

}
