-- =========================================
-- PROYECTO ETL - BASE DE DATOS JARDINERIA
-- =========================================

-- =========================================
-- 1. CREACIÓN DE BASE DE DATOS STAGING
-- =========================================
-- Se crea una base de datos temporal donde se almacenarán
-- los datos antes de ser usados para análisis

CREATE DATABASE Jardineria_Staging;
GO

-- =========================================
-- 2. USAR BASE DE DATOS STAGING
-- =========================================
-- Se selecciona la base de datos recién creada

USE Jardineria_Staging;
GO

-- =========================================
-- 3. CREACIÓN DE TABLA LIMPIA
-- =========================================
-- Se crea una tabla con los campos necesarios
-- para almacenar información simplificada de clientes

CREATE TABLE Clientes_Limpios (
    nombre VARCHAR(100),  -- Nombre del cliente
    ciudad VARCHAR(50)    -- Ciudad del cliente
);
GO

-- =========================================
-- 4. PROCESO ETL - CARGA DE DATOS
-- =========================================
-- Se insertan los datos desde la base original (Jardineria)
-- hacia la base Staging

INSERT INTO Jardineria_Staging.dbo.Clientes_Limpios (nombre, ciudad)
SELECT nombre_cliente, ciudad
FROM Jardineria.dbo.cliente;
GO

-- =========================================
-- 5. VERIFICACIÓN DE DATOS
-- =========================================
-- Se consulta la tabla para validar que los datos
-- fueron cargados correctamente

SELECT * FROM Jardineria_Staging.dbo.Clientes_Limpios;
GO
