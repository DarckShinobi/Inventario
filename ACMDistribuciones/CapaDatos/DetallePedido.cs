using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    [Serializable]
    public class DetallePedido
    {
        /// <summary>
        /// Constructor
        /// </summary>
        public DetallePedido()
        {
           
        }

        /// <summary>
        /// Propiedaes autoimplementadas
        /// </summary>
        
        public int _intIdDetallePedido { get; set; }
        public int _intCantidadPedido { get; set; }
        public int _intIdProducto { get; set; }
        public int _intExistencias { get; set; }
        public string _strNombreProducto { get; set; }
        public string _strCodigo { get; set; }
        public decimal _decValorProveedor { get; set; }



    }
}
