-- ====================================================
-- Version: 1.0.0.0
-- Archivo: .sql
-- ====================================================
-- Autor: JAlbert-Coder
-- Fecha: 05-12-2019
-- Descripcion: 
-- ====================================================
-- SELECT Para encontrar el espacio de tabla temporal predeterminado actual
-- ====================================================
SELECT property_name
    , property_value
FROM database_properties 
WHERE property_name= 'DEFAULT_TEMP_TABLESPACE';
-- ====================================================
--  SELECT Para ver la asignación de espacio en un espacio de tabla temporal
-- ====================================================
SELECT *
FROM dba_temp_free_space;
-- ====================================================
-- CREATE Para crear un espacio de tabla temporal
-- ====================================================
CREATE GLOBAL TEMPORARY TABLE ORA$Registro_Usuarios
(
    uuid_Usuario NUMBER NOT NULL,
    Nombre_Usuario VARCHAR(150) NOT NULL,
    Llave_Compuesta VARCHAR(13) NULL
) ON COMMIT PRESERVE ROWS; -- Comit para borrar datos al cerrar sesion

CREATE GLOBAL TEMPORARY TABLE ORA$Registro_Usuarios_2
(
    uuid_Usuario NUMBER NOT NULL,
    Nombre_Usuario VARCHAR(150) NOT NULL,
    Llave_Compuesta VARCHAR(13) NULL
) ON COMMIT DELETE ROWS; -- Comit para borrar dat
-- ====================================================
-- CREATE Para crear una tabla temporal a partir de una tabla
-- ====================================================
CREATE GLOBAL TEMPORARY TABLE TablaTemp
ON COMMIT PRESERVE ROWS
AS
SELECT GUID()
FROM DUAL;
-- ====================================================
-- TRUNCATE y DELETE, para una tabla temporal
-- ====================================================
TRUNCATE TABLE TablaTemp;
DROP TABLE TablaTemp;