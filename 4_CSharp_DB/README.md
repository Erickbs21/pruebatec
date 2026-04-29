# Proyecto 4: CRUD en C# con Consola

## Descripción
Este proyecto consiste en una aplicación de consola desarrollada en C# que implementa las operaciones básicas de un CRUD (Crear, Leer, Actualizar, Eliminar) interactuando con una base de datos SQL Server. 

## Estructura
- **`CrudApp/`**: Carpeta que contiene el proyecto de consola .NET.
  - **`Program.cs`**: Punto de entrada con el menú interactivo.
  - **`DatabaseHelper.cs`**: Clase reutilizada que encapsula la lógica de conexión y ejecución de comandos SQL.
- **`init_db.sql`**: Script para la creación de la base de datos `CrudDemo` y la tabla `Usuarios`.

## Reutilización de Código
Se ha integrado la clase `DatabaseHelper` dentro del proyecto de consola para manejar todas las interacciones con la base de datos de manera genérica y segura mediante parámetros, evitando la inyección de SQL.

## Cómo Utilizar
1. **Base de Datos**: Ejecute el script `init_db.sql` en su instancia de SQL Server.
2. **Configuración**: Verifique el `connectionString` en `Program.cs` para asegurar que apunta a su servidor local.
3. **Ejecución**:
   - Navegue a la carpeta `CrudApp`.
   - Ejecute el comando `dotnet run`.

## Características
- Menú interactivo por consola.
- Uso de `DbProviderFactories` para flexibilidad de proveedores.
- Operaciones CRUD completas sobre la entidad de Usuarios.
