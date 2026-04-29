-- 1. Crear la base de datos
CREATE DATABASE CrudDemo;
GO

USE CrudDemo;
GO

-- 2. Crear tabla de Usuarios
CREATE TABLE Usuarios (
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
    Correo VARCHAR(100) NOT NULL UNIQUE,
    FechaRegistro DATETIME DEFAULT GETDATE()
);
GO

-- 3. Insertar datos iniciales
INSERT INTO Usuarios (Nombre, Correo) VALUES 
('Administrador', 'admin@sistema.com'),
('Juan Perez', 'juan.perez@correo.com'),
('Maria Lopez', 'm.lopez@ejemplo.com');
GO
