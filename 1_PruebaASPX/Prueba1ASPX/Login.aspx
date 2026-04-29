<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Prueba1ASPX.Login" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login - Web Forms</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: url('wwwroot/img/wolfgang_hasselmann-sunset-10128347_1920.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        .login-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            width: 100%;
            max-width: 420px;
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
        }
        
        .form-floating > .form-control {
            border-radius: 10px;
        }
        
        .form-floating > .form-control:focus {
            background: rgba(255, 255, 255, 0.15);
            color: white;
            border-color: #fff;
            box-shadow: none;
        }
        
        .form-floating > label::after {
            background-color: transparent !important;
        }
        
        .btn-primary {
            background: linear-gradient(45deg, #4facfe 0%, #00f2fe 100%);
            border: none;
            transition: transform 0.2s, box-shadow 0.2s;
        }
        
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(79, 172, 254, 0.4);
            background: linear-gradient(45deg, #4facfe 0%, #00f2fe 100%);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="w-100 d-flex justify-content-center" onsubmit="return validate()">
        <div class="login-card p-5">
            <div class="text-center mb-4">
                <h2 class="fw-bold text-white">Bienvenido</h2>
                <p class="text-white-50">Ingresa tus credenciales para continuar</p>
            </div>
            
            <div class="form-floating mb-3">
                <asp:TextBox ID="txtUser" runat="server" CssClass="form-control bg-transparent text-white border-white-50" placeholder="Usuario"></asp:TextBox>
                <label class="text-white-50">Usuario</label>
            </div>
            
            <div class="form-floating mb-4">
                <asp:TextBox ID="txtPass" runat="server" TextMode="Password" CssClass="form-control bg-transparent text-white border-white-50" placeholder="Contraseña"></asp:TextBox>
                <label class="text-white-50">Contrasena</label>
            </div>
            
            <asp:Button ID="btnLogin" runat="server" Text="INGRESAR" CssClass="btn btn-primary btn-lg w-100 rounded-pill fw-bold shadow-lg" OnClick="btnLogin_Click" />
            
            <div id="msg" class="alert alert-danger mt-3 py-2 text-center" style="display:none; font-size: 0.9rem; background: rgba(220, 53, 69, 0.2); border-color: rgba(220, 53, 69, 0.3); color: #ffbaba;"></div>
            
            <asp:Label ID="lblError" runat="server" CssClass="alert alert-danger mt-3 py-2 text-center d-block" Visible="false" style="font-size: 0.9rem; background: rgba(220, 53, 69, 0.2); border-color: rgba(220, 53, 69, 0.3); color: #ffbaba;"></asp:Label>
        </div>
    </form>

    <script>
        function validate() {
            var u = document.getElementById('<%= txtUser.ClientID %>').value;
            var p = document.getElementById('<%= txtPass.ClientID %>').value;
            var e = document.getElementById('msg');
            if (u.trim() === "" || p.trim() === "") {
                e.innerText = "Por favor, completa todos los campos";
                e.style.display = "block";
                return false;
            }
            return true;
        }
    </script>
</body>
</html>
