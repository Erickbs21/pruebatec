using System;
using System.Web.UI.WebControls;

namespace Prueba1ASPX
{
    public partial class Home : System.Web.UI.Page
    {
        protected Label lblUsernameNav;
        protected Label lblUsernameBody;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Username"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                string username = Session["Username"].ToString();
                lblUsernameNav.Text = username;
                lblUsernameBody.Text = username;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("Login.aspx");
        }
    }
}
