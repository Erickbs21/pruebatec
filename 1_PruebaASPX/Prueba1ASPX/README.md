# Proyecto 1: Login con ASP.NET Core Razor Pages

## Descripción General

Este proyecto implementa un sistema de autenticación utilizando ASP.NET.

## Archivos Clave

- **`Pages/Login.cshtml`**: Interfaz de usuario para la autenticación con efecto de "Glassmorphism" (cristal esmerilado).
- **`Pages/Home.cshtml`**: Página de bienvenida personalizada que se muestra tras un acceso exitoso.
- **`Program.cs`**: Archivo de configuración principal donde se habilita el soporte de sesiones y el enrutamiento.
- **`wwwroot/img/`**: Carpeta que contiene la imagen de fondo (`sunset`) utilizada para la estética visual.

## Credenciales de Prueba

Para probar el sistema, utilice los siguientes datos:

- **Usuario:** `admin`
- **Contraseña:** `admin123`

## Cómo Ejecutar el Proyecto

1. Abra la carpeta del proyecto en **Visual Studio 2022** o **VS Code**.
2. Asegúrese de tener instalado el **SDK de .NET 8**.
3. Presione **F5** o ejecute el comando `dotnet run` desde la terminal en la ruta del proyecto.
4. El sistema abrirá automáticamente el navegador en la página de Login.

## Características Visuales

- **Efecto Glassmorphism**: Interfaz translúcida y moderna.
- **Diseño Limpio**: Se han eliminado el header y footer predeterminados para una experiencia inmersiva.
- **Fondo Dinámico**: Uso de imagen de alta calidad ajustada a pantalla completa.
- **Validación Intuitiva**: Mensajes de error visuales tanto en cliente como en servidor.
