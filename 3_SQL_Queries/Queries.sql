-- 3.A Consulta que devuelve el nombre del proyecto y sus productos correspondientes
SELECT 
    pry.NOMBRE AS NombreProyecto,
    prd.DESCRIPCION AS NombreProducto
FROM PROYECTO pry
INNER JOIN PRODUCTO_PROYECTO pp ON pry.PROYECTO = pp.PROYECTO
INNER JOIN PRODUCTO prd ON pp.PRODUCTO = prd.PRODUCTO
WHERE pry.PROYECTO = 1;

-- 3.B Consulta que devuelve los distintos mensajes, indicando a qué proyecto y producto pertenecen
SELECT DISTINCT
    fm.NOMBRE AS NombreMensaje,
    pry.NOMBRE AS NombreProyecto,
    prd.DESCRIPCION AS NombreProducto
FROM MENSAJE m
INNER JOIN FORMATO_MENSAJE fm ON m.COD_FORMATO = fm.COD_FORMATO
INNER JOIN PROYECTO pry ON m.PROYECTO = pry.PROYECTO
INNER JOIN PRODUCTO prd ON m.PRODUCTO = prd.PRODUCTO;

-- 3.C Consulta que consolida en "TODOS" cuando el mensaje aplica a todos los productos del proyecto
WITH TotalProductosPorProyecto AS (
    SELECT 
        PROYECTO, 
        COUNT(PRODUCTO) AS CantidadTotalProductos
    FROM PRODUCTO_PROYECTO
    GROUP BY PROYECTO
),
MensajesConConteo AS (
    SELECT 
        m.COD_FORMATO,
        m.PROYECTO,
        m.PRODUCTO,
        COUNT(m.PRODUCTO) OVER(PARTITION BY m.COD_FORMATO, m.PROYECTO) AS CantidadProductosAplica
    FROM MENSAJE m
)
SELECT DISTINCT
    fm.NOMBRE AS NombreMensaje,
    pry.NOMBRE AS NombreProyecto,
    CASE 
        WHEN mc.CantidadProductosAplica = tpp.CantidadTotalProductos THEN 'TODOS'
        ELSE prd.DESCRIPCION
    END AS NombreProducto
FROM MensajesConConteo mc
INNER JOIN FORMATO_MENSAJE fm ON mc.COD_FORMATO = fm.COD_FORMATO
INNER JOIN PROYECTO pry ON mc.PROYECTO = pry.PROYECTO
INNER JOIN PRODUCTO prd ON mc.PRODUCTO = prd.PRODUCTO
INNER JOIN TotalProductosPorProyecto tpp ON mc.PROYECTO = tpp.PROYECTO
ORDER BY NombreProyecto, NombreMensaje, NombreProducto;
