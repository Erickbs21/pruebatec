<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Prueba1ASPX.Home" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home - Web Forms</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            background: url('wwwroot/img/wolfgang_hasselmann-sunset-10128347_1920.jpg') no-repeat center center fixed;
            background-size: cover;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .navbar-custom {
            background: rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
            -webkit-backdrop-filter: blur(10px);
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .welcome-card {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(15px);
            -webkit-backdrop-filter: blur(15px);
            border: 1px solid rgba(255, 255, 255, 0.2);
            border-radius: 20px;
            padding: 3rem;
            margin-top: 5rem;
            box-shadow: 0 8px 32px 0 rgba(0, 0, 0, 0.37);
        }
        
        .btn-outline-light {
            border-color: rgba(255, 255, 255, 0.5);
            transition: all 0.3s ease;
        }
        
        .btn-outline-light:hover {
            background-color: rgba(255, 255, 255, 0.2);
            border-color: #fff;
            transform: translateY(-2px);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg navbar-dark navbar-custom py-3">
            <div class="container">
                <a class="navbar-brand fw-bold" href="#">Mi App</a>
                <div class="d-flex align-items-center">
                    <span class="text-white me-3">Hola, <asp:Label ID="lblUsernameNav" runat="server"></asp:Label></span>
                    <asp:Button ID="btnLogout" runat="server" Text="Cerrar Sesion" CssClass="btn btn-outline-light btn-sm rounded-pill px-4" OnClick="btnLogout_Click" />
                </div>
            </div>
        </nav>

        <div class="container flex-grow-1 d-flex justify-content-center align-items-start">
            <div class="welcome-card text-center w-100" style="max-width: 800px;">
                <h1 class="display-4 fw-bold text-white mb-4">Bienvenido al Sistema</h1>
                <p class="lead text-white-50 mb-5">
                    Has iniciado sesion exitosamente como <strong><asp:Label ID="lblUsernameBody" runat="server"></asp:Label></strong>.
                    Aqui puedes ver el contenido protegido de la aplicacion.
                </p>
            </div>
        </div>
    </form>
</body>
</html>
