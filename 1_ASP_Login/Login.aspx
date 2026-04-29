<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="PruebaTecnica.Login" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Inicio de Sesión</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body { 
            background-color: #f4f6f9; 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            height: 100vh; 
            margin: 0; 
        }
        .login-card { 
            background: white; 
            padding: 2.5rem; 
            border-radius: 12px; 
            box-shadow: 0 10px 25px rgba(0,0,0,0.05); 
            width: 100%; 
            max-width: 420px; 
        }
        .login-card h3 {
            font-weight: 600;
            color: #333;
        }
    </style>
    <script>
        function validarFormulario(event) {
            var usuario = document.getElementById('<%= txtUsuario.ClientID %>').value.trim();
            var password = document.getElementById('<%= txtPassword.ClientID %>').value.trim();
            var mensajeError = document.getElementById('mensaje-error');
            
            if (usuario === "" || password === "") {
                mensajeError.style.display = 'block';
                mensajeError.innerText = "Por favor, complete todos los campos requeridos.";
                event.preventDefault(); 
                return false;
            }
            mensajeError.style.display = 'none';
            return true; 
        }
    </script>
</head>
<body>
    <form id="frmLogin" runat="server" class="login-card" onsubmit="validarFormulario(event)">
        <h3 class="text-center mb-4">Acceso al Sistema</h3>
        
        <div id="mensaje-error" class="alert alert-danger" style="display:none;" role="alert"></div>
        
        <asp:Label ID="lblMensajeServidor" runat="server" Visible="false" style="display:block;"></asp:Label>

        <div class="mb-3">
            <label for="txtUsuario" class="form-label">Usuario</label>
            <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" placeholder="Ingrese su usuario" AutoCompleteType="Disabled"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtUsuario" 
                ErrorMessage="El usuario es obligatorio." ForeColor="#dc3545" Display="Dynamic" EnableClientScript="true"></asp:RequiredFieldValidator>
        </div>
        
        <div class="mb-4">
            <label for="txtPassword" class="form-label">Contraseña</label>
            <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="••••••••"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtPassword" 
                ErrorMessage="La contraseña es obligatoria." ForeColor="#dc3545" Display="Dynamic" EnableClientScript="true"></asp:RequiredFieldValidator>
        </div>
        
        <asp:Button ID="btnLogin" runat="server" Text="Iniciar Sesión" CssClass="btn btn-primary w-100 py-2" 
            OnClick="btnLogin_Click" OnClientClick="return validarFormulario(event);" />
    </form>
</body>
</html>
