using System;

namespace PruebaTecnica
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMensajeServidor.Visible = false;
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtUsuario.Text) || string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                MostrarMensaje("Error: Existen campos vacíos. Por favor verifique.", esError: true);
                return;
            }

            try
            {
                // TODO: Implementar lógica de autenticación
                MostrarMensaje($"Validación exitosa. Bienvenido, {txtUsuario.Text}.", esError: false);
            }
            catch (Exception)
            {
                MostrarMensaje("Ocurrió un error inesperado al procesar su solicitud.", esError: true);
            }
        }

        private void MostrarMensaje(string mensaje, bool esError)
        {
            lblMensajeServidor.Text = mensaje;
            lblMensajeServidor.CssClass = esError ? "alert alert-danger" : "alert alert-success";
            lblMensajeServidor.Visible = true;
        }
    }
}
