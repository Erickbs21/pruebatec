# Proyecto 5: Modelo Entidad-Relación y Esquema

## Descripción
Este proyecto contiene el diseño lógico y físico de la base de datos para el sistema de Canje de Puntos. Incluye la documentación del modelo ER y el script DDL para la creación de las tablas.

<p align="center">
  <a href="./ER_Model.md">
    <img src="https://img.shields.io/badge/Ver%20Modelo%20ER-ER_Model.md-blue?style=for-the-badge" alt="Ver Modelo ER">
  </a>
</p>

## Contenido
- **`ER_Model.md`**: Diagrama Mermaid y descripción detallada de entidades y relaciones.
- **`Schema.sql`**: Script SQL compatible con SQL Server para generar la estructura completa.

## Entidades Principales
- **Sucursales y Artículos**: Gestión de ubicaciones y productos.
- **Inventario**: Relación de existencias por sucursal.
- **Promociones**: Definición de ofertas, incluyendo a qué artículos aplican y en qué **sucursales específicas** están vigentes (tabla `PROMOCION_SUCURSAL`).
- **Canjes**: Registro de transacciones realizadas por clientes, incluyendo el detalle de artículos y puntos utilizados.

## Cómo Utilizar
1. Consulte `ER_Model.md` para comprender las reglas de negocio y la integridad referencial.
2. Ejecute el script `Schema.sql` en su instancia de base de datos para inicializar el sistema.

## Acceso Rápido
**[Abrir Modelo Entidad-Relación](./ER_Model.md)**  
**[Abrir Script SQL](./Schema.sql)**