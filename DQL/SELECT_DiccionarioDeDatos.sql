-- =====================================================
-- Version: 1.0.0.0
-- Archivo: SELECT_DiccionarioDeDatos.sql
-- =====================================================
-- Autor: JAlberto-Coder
-- Fecha: 03-12-2019
-- Descripcion: SELECT O Funciones para consultar los parametros de nuestra Intancia en Oracle
-- =====================================================
-- DEFINICIONES
-- Para poder visualizar y generar un diccionario de datos dependera del ROL.
-- Oracle utiliza los siguientes terminos para la descripcion de los objetos en la BD, y son:
--      * USER_ (Muestra los objetos que pertenecen al usuario de la sesion)
--      * ALL_  (Muestra los objetos a los que tiene acceso el usuario de la sesion)
--      * DBA_  (Muestra todos los objetos de la base de datos)
-- =====================================================
-- ALGUNAS VISTAS CON USER_ O ALL_
-- =====================================================
SELECT *
FROM USER_TABLES;

SELECT *
FROM USER_TAB_COLUMNS;

SELECT *
FROM ALL_VIEWS;

SELECT *
FROM USER_SEQUENCES;

SELECT *
FROM USER_SYNONYMS;

SELECT *
FROM USER_CATALOG;

SELECT *
FROM ALL_OBJECTS;

SELECT *
FROM USER_TABLESPACES;

SELECT *
FROM USER_SEGMENTS;

SELECT *
FROM USER_INDEXES;

SELECT *
FROM ALL_TRIGGERS;
-- =====================================================
-- ALGUNAS VISTAS CON DBA_
-- =====================================================
SELECT *
FROM DICTIONARY;

SELECT *
FROM DBA_USERS;

SELECT *
FROM DBA_ROLES;

SELECT *
FROM DBA_DIRECTORIES;

SELECT *
FROM DBA_TABLESPACE_GROUPS;

SELECT *
FROM DBA_BLOCKERS;

SELECT *
FROM DBA_LOCKS;

SELECT *
FROM DBA_ERRORS;

SELECT *
FROM DBA_RULES;

SELECT *
FROM DBA_SERVICES;
-- =====================================================
-- SELECT DICCIONARIO DE DATOS (MUY GENERAL)
-- =====================================================
SELECT AT.TABLE_NAME AS Nombre_Tabla
    , ATC.COLUMN_NAME AS Nombre_Columna
    , ATC.DATA_TYPE AS Tipo_de_Dato
    , ATC.DATA_LENGTH AS Longitud
    , ATC.DATA_DEFAULT AS Valor_por_Defecto
    , DECODE(ATC.NULLABLE, 'Y', 'Si', 'No') AS Permite_Nulos
FROM ALL_TABLES AT
INNER JOIN ALL_TAB_COLUMNS ATC ON AT.TABLE_NAME = ATC.TABLE_NAME
ORDER BY AT.TABLE_NAME, ATC.COLUMN_ID;