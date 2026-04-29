# Proyecto 2: Intercambio de Datos XML (Tarjetas de Crédito)

## Descripción

Este proyecto define una estructura XML estandarizada en español para el intercambio de información financiera entre sistemas bancarios y plataformas de canje. La estructura incluye datos del sistema de origen/destino, información detallada del cliente y datos encriptados de sus tarjetas.

## Estructura del Archivo XML

### 1. Encabezado (`Encabezado`)

Contiene metadatos de la transmisión:

- **ID_Referencia**: Identificador único de referencia para el rastreo de la operación.
- **SistemaOrigen / SistemaDestino**: Identificación de los sistemas involucrados y su ubicación física o lógica.
- **ID_Mensaje**: Código único del mensaje.
- **FechaHora**: Marca de tiempo del intercambio en formato ISO 8601.

### 2. Carga Útil (`CargaUtil`)

Contiene la información de negocio segmentada por clientes:

- **DatosPersonales**:
  - `NombreCompleto`: Nombre legal del cliente.
  - `CorreoElectronico`: Dirección de contacto digital.
  - `Direccion`: Ubicación física para envío de correspondencia o productos.
  - `Telefono`: Estructurado con Código de País, Código de Área y Número local.
- **Tarjetas**:
  - `DatosEncriptados`: Bloque que cumple con el estándar `xmlenc` para proteger el número de tarjeta (PAN).
  - `TipoTarjeta / Marca / CodigoProducto`: Detalles comerciales de la tarjeta.
  - `Estado`: Estado actual (ej. ACTIVO).

## Seguridad

Los datos sensibles de las tarjetas se encuentran dentro de etiquetas `<DatosEncriptados>`, asegurando que la información crítica no viaje en texto plano durante el intercambio.
