-- ====================================================
-- Version: 1.0.0.0
-- Archivo: CREATE_TablasExternas.sql
-- ====================================================
-- Autor: JAlbert-Coder
-- Fecha: 06-12-2019
-- Descripcion: Sentencias CREATE para la creacion de tablas externas... recuerda que estas deben de contener informacion que no solemos modificar, sino que es mas fija
-- Infortunadamente el catalogo si se desea ver tal cual, se tiene que evitar que tenga espacios entre cada separador, ademas de que si hay algun caracter especial sera dificil de manipularlo
-- ====================================================
-- 1. Deposita el archivo en el directorio final
-- En este caso lo tendremos en la siguiente ruta: C:\Catalogos\Catalogo_Paises.csv
-- Datos ejemplo:
-- AFG,Afganistán
-- ALA,Islas Åland
-- ALB,Albania
-- DEU,Alemania
-- AND,Andorra
-- AGO,Angola
-- ...
-- ====================================================
-- 2. Creacion de un Objeto de Directorio
-- ====================================================
CREATE DIRECTORY TABLAS_EXTERNAS AS 'C:\Catalogos';
-- ====================================================
-- 3. Asignacion de permisos al directorio
-- ====================================================
GRANT READ, WRITE ON DIRECTORY TABLAS_EXTERNAS TO PUBLIC;
-- ====================================================
-- 4. Creacion de Tabla Externa
-- Recuerda que al ser una tabla Externa... no podra manejar propiedades de una tabla comun como llaves primaria, llaves foranear ETC.
-- ====================================================
CREATE TABLE Catalogo_Paises
(
    Clave_Pais VARCHAR2(3),
    Pais VARCHAR2(100)
)
ORGANIZATION EXTERNAL
(
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY TABLAS_EXTERNAS
    ACCESS PARAMETERS
    (
        FIELDS TERMINATED BY ','
    )
    LOCATION('Catalogo_Paises.csv')
);
-- ====================================================
-- SELECT, Recuerda que no puedes aplicar sentencias DELETE, INSERT O UPDATE
-- ====================================================
SELECT Clave_Pais, Pais
FROM Catalogo_Paises;
-- ====================================================
-- CREATE VIEW
-- ====================================================
CREATE VIEW View_Catalogo_Paises
AS
SELECT *
FROM Catalogo_Paises;

SELECT * 
FROM View_Catalogo_Paises;