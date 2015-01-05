using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    [Serializable]
    public class DetalleEntrada
    {
        /// <summary>
        /// Constructor
        /// </summary>
        public DetalleEntrada()
        {
          
           
        }

        /// <summary>
        /// Propiedades autoimplementadas
        /// </summary>
        public int _intIdDetalleEntrada { get; set; }
        public int _intProducto { get; set; }
        public int _intCantidadIngresada { get; set; }
        public int _intExistencias { get; set; }
        public decimal _decNuevoPrecio { get; set; }

    }
}
