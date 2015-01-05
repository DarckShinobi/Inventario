using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaDatos;

namespace ACMDistribuciones
{
    public partial class Inicio : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            MenuCategorias();
        }

        private void MenuCategorias() {
            
            try
            {
                TableRow objFila = new TableRow();
                TableCell objCelda = new TableCell();
                Categoria objCategoria = new Categoria();
                Button btnCategorias = new Button();
                int iteraciones = 0;
                List<Categoria> objListaCategoria = objCategoria.ConsultarCategorias();
                foreach (Categoria item in objListaCategoria)
                {
                    btnCategorias = new Button();
                    btnCategorias.ID = item._strNombreCategoria;
                    btnCategorias.Text = item._strNombreCategoria;
                    btnCategorias.ClientIDMode = System.Web.UI.ClientIDMode.AutoID;
                    btnCategorias.Attributes.Add("onClick","ClickLinkButton()");
                    btnCategorias.Click += new EventHandler(this.ClickInLinkButton);
                    if (iteraciones <= 3) {
                        objCelda = new TableCell();
                        objCelda.Controls.Add(btnCategorias);
                        objFila.Controls.Add(objCelda);
                        tblCategorias.Controls.Add(objFila);
                        iteraciones++;
                    
                    }else{

                        objCelda = new TableCell();
                        objFila = new TableRow();
                        objCelda.Controls.Add(btnCategorias);
                        objFila.Controls.Add(objCelda);
                        tblCategorias.Controls.Add(objFila);
                        iteraciones = 0;
                        iteraciones++;

                    }

                }
                objCategoria.ConsultarCategorias();

            }
            catch (Exception ex)
            {
                
                
            }
        
        
        }

        private void ClickInLinkButton(object sender, EventArgs e)
        {
            try
            {
                System.Web.UI.Control ControlIN = new Control();
                ControlIN = (Control)sender;
                string btn = ControlIN.ID;
                CargarGridView(btn.Trim());
                
            }
            catch (Exception )
            {
                
            }
        }

        private void CargarGridView(string boton) {
          
            try
            {
                Producto objProducto = new Producto();
                if (objProducto != null)
                {
               //     gvProductos.DataSource = objProducto.ConsultarProductoCategoria(boton);
                 //   gvProductos.DataBind();
                }
                else
                {
                    string msn = "No hay coincidencias";
                }
               
            }
            catch (Exception)
            {
                
                throw;
            }
        
        
        
        }

        //protected void gvProductos_RowDataBound(object sender, GridViewRowEventArgs e)
        //{
        //    decimal decValor = 0;

        //    if (e.Row.RowType == DataControlRowType.DataRow) 
        //    {
                
        //        decimal.TryParse(e.Row.Cells[7].Text, out decValor);
        //        e.Row.Cells[7].Text = decValor.ToString("F0");
        //        decValor = 0;
        //        decimal.TryParse(e.Row.Cells[8].Text, out decValor);
        //        e.Row.Cells[8].Text = decValor.ToString("F0");
        //        decValor = 0;
        //        decimal.TryParse(e.Row.Cells[9].Text, out decValor);
        //        e.Row.Cells[9].Text = decValor.ToString("F0");
        //        decValor = 0;
        //    }
        //}

        /// <summary>
        /// Evento que se desencadena al hacer click en el buscadorn principal
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnBuscadorPrincipal_Click(object sender, EventArgs e)
        {
            try
            {

                Producto objProducto = new Producto();
                if (objProducto != null)
                {
              ///      gvProductos.DataSource = objProducto.ConsultarProductos(txbBuscadorPrincipal.Text.Trim());
                 //   gvProductos.DataBind();
                }
                else
                {
                    string msn = "No hay coincidencias";
                }
            }
            catch (Exception ex)
            {
                
                throw;
            }
        }
        
    }
}