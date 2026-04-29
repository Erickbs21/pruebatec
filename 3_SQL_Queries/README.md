# Proyecto 3: Consultas SQL Avanzadas

## Descripción
Este proyecto contiene scripts SQL para la gestión de proyectos, productos y sus mensajes asociados. Se incluyen consultas para reportes específicos y un script de inicialización de datos.

## Archivos
- **`Queries.sql`**: Contiene las consultas principales solicitadas (A, B y C).
- **`creacion_insersion.sql`**: Script para crear la estructura de tablas e insertar datos de prueba para validar las consultas.

## Explicación de las Consultas

### Consulta 3.A y 3.B
Utilizan `INNER JOIN` para relacionar las tablas de proyectos con sus productos y mensajes, permitiendo obtener nombres descriptivos en lugar de solo IDs.

### Consulta 3.C (Uso de `WITH` / CTE)
En esta consulta se utiliza la cláusula **`WITH`** (Common Table Expression o Expresión de Tabla Común) por las siguientes razones:
1. **Modularidad**: Permite definir "vistas temporales" (como `TotalProductosPorProyecto`) que hacen que la consulta final sea mucho más fácil de leer y mantener.
2. **Consolidación**: Se utiliza para contar cuántos productos tiene un proyecto y compararlo con cuántos productos están asociados a un mensaje específico. 
3. **Lógica "TODOS"**: Gracias al `WITH`, podemos determinar si un mensaje aplica a la totalidad de productos de un proyecto. Si el conteo coincide, la consulta devuelve la palabra **"TODOS"** en lugar de listar los productos individualmente, simplificando los reportes.

## Cómo Probar
1. Ejecute primero el archivo `creacion_insersion.sql` en su gestor de base de datos (SQL Server recomendado).
2. Una vez creada la estructura y los datos, ejecute `Queries.sql` para ver los resultados de los reportes.
