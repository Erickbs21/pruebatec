CREATE TABLE SUCURSAL (
    ID_Sucursal INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(255)
);

CREATE TABLE ARTICULO (
    ID_Articulo INT IDENTITY(1,1) PRIMARY KEY,
    Codigo VARCHAR(50) NOT NULL UNIQUE,
    Nombre VARCHAR(150) NOT NULL,
    Tipo VARCHAR(50),
    Subtipo VARCHAR(50)
);

CREATE TABLE INVENTARIO_SUCURSAL (
    ID_Sucursal INT,
    ID_Articulo INT,
    Cantidad_Existencia INT DEFAULT 0 NOT NULL,
    CONSTRAINT PK_Inventario PRIMARY KEY (ID_Sucursal, ID_Articulo),
    CONSTRAINT FK_Inventario_Sucursal FOREIGN KEY (ID_Sucursal) REFERENCES SUCURSAL(ID_Sucursal),
    CONSTRAINT FK_Inventario_Articulo FOREIGN KEY (ID_Articulo) REFERENCES ARTICULO(ID_Articulo)
);

CREATE TABLE PROMOCION (
    ID_Promocion INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(150) NOT NULL,
    Fecha_Inicio DATETIME NOT NULL,
    Fecha_Fin DATETIME NOT NULL
);

CREATE TABLE PROMOCION_ARTICULO (
    ID_Promocion INT,
    ID_Articulo INT,
    Costo_Puntos INT NOT NULL,
    Precio_Articulo DECIMAL(10, 2) NOT NULL,
    CONSTRAINT PK_PromoArticulo PRIMARY KEY (ID_Promocion, ID_Articulo),
    CONSTRAINT FK_PromoArticulo_Promo FOREIGN KEY (ID_Promocion) REFERENCES PROMOCION(ID_Promocion),
    CONSTRAINT FK_PromoArticulo_Articulo FOREIGN KEY (ID_Articulo) REFERENCES ARTICULO(ID_Articulo)
);

CREATE TABLE CLIENTE (
    ID_Cliente INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(150) NOT NULL,
    Puntos_Disponibles INT DEFAULT 0
);

CREATE TABLE CANJE (
    ID_Canje INT IDENTITY(1,1) PRIMARY KEY,
    ID_Cliente INT NOT NULL,
    ID_Sucursal INT NOT NULL,
    Fecha_Canje DATETIME DEFAULT GETDATE() NOT NULL,
    Observaciones_Generales VARCHAR(500),
    CONSTRAINT FK_Canje_Cliente FOREIGN KEY (ID_Cliente) REFERENCES CLIENTE(ID_Cliente),
    CONSTRAINT FK_Canje_Sucursal FOREIGN KEY (ID_Sucursal) REFERENCES SUCURSAL(ID_Sucursal)
);

CREATE TABLE DETALLE_CANJE (
    ID_Detalle INT IDENTITY(1,1) PRIMARY KEY,
    ID_Canje INT NOT NULL,
    ID_Articulo INT NOT NULL,
    ID_Promocion INT NULL,
    Cantidad_Canjeada INT NOT NULL,
    Puntos_Cobrados_Unitario INT NOT NULL, 
    Precio_Articulo DECIMAL(10, 2) NOT NULL, 
    Observaciones_Item VARCHAR(500),
    CONSTRAINT FK_Detalle_Canje FOREIGN KEY (ID_Canje) REFERENCES CANJE(ID_Canje),
    CONSTRAINT FK_Detalle_Articulo FOREIGN KEY (ID_Articulo) REFERENCES ARTICULO(ID_Articulo),
    CONSTRAINT FK_Detalle_Promocion FOREIGN KEY (ID_Promocion) REFERENCES PROMOCION(ID_Promocion)
);
