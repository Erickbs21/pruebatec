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

1. Abre el archivo **`Prueba1ASPX.csproj`** o la carpeta del proyecto en **Visual Studio 2022**.
2. Asegúrate de que tu proyecto cargue correctamente (ahora utiliza .NET Framework 4.8).
3. Presiona **F5** (o haz clic en el botón de Iniciar "IIS Express") para ejecutar el proyecto.
4. El sistema abrirá automáticamente el navegador en la página `Login.aspx`.

## Características Visuales

- **Efecto Glassmorphism**: Interfaz translúcida y moderna.
- **Diseño Limpio**: Se han eliminado el header y footer predeterminados para una experiencia inmersiva.
- **Fondo Dinámico**: Uso de imagen de alta calidad ajustada a pantalla completa.
- **Validación Intuitiva**: Mensajes de error visuales tanto en cliente como en servidor.
