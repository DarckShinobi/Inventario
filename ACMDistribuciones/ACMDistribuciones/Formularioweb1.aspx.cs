using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security;
using System.Web.Security;

namespace ACMDistribuciones
{
    public partial class Formulario_web1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Evento que responde al inicio de sesion
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnInicioSesion_Click(object sender, EventArgs e)
        {
            try
            {
                
                bool ValidarUser = false;
                MembershipUser objUser = Membership.GetUser(txbNombreUsuario.Text.Trim());

                ValidarUser = Membership.ValidateUser(txbNombreUsuario.Text.Trim(), txbPassword.Text.Trim());
                if (ValidarUser)
                {
                    Session["NombreUsuario"] = objUser.UserName;

                    if (Roles.IsUserInRole(txbNombreUsuario.Text.Trim(), "Administrador"))
                    {
                     //   Response.Redirect("Formularioweb2.aspx");
                        //Realiza una redireccion asincrona desde el servidor 
                        Server.Transfer("Formularioweb2.aspx");
                    }
                }
                else
                {
                    lblMsn.Text = "Datos no validos";
                }
            
            
            }
            catch (Exception ex)
            {

                lblMsn.Text = ex.Message;
            }
        }
    }
}