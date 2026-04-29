using System;
using System.Web.UI.WebControls;

namespace Prueba1ASPX
{
    public partial class Login : System.Web.UI.Page
    {
        protected TextBox txtUser;
        protected TextBox txtPass;
        protected Label lblError;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblError.Visible = false;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUser.Text.Trim();
            string password = txtPass.Text.Trim();

            if (username == "admin" && password == "admin123")
            {
                Session["Username"] = username;
                Response.Redirect("Home.aspx");
            }
            else
            {
                lblError.Text = "Credenciales incorrectas";
                lblError.Visible = true;
            }
        }
    }
}
