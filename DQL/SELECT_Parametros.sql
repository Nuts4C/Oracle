-- =====================================================
-- Version: 1.0.0.0
-- Archivo: SELECT_Parametros.sql
-- =====================================================
-- Autor: JAlberto-Coder
-- Fecha: 04-12-2019
-- Descripcion: SELECT O Funciones para consultar los parametros de nuestra Intancia en Oracle
-- Estos parametros muestran la configuracion que tiene nuestra instancia o base de datos que son almacenados en archivos especiales
-- Recuerda que estos parametros los puedes modificar conforme las necesidades del negocio
-- =====================================================
-- SELECT de Parametros con los valores actuales
-- =====================================================
SELECT * 
FROM V$SYSTEM_PARAMETER;
-- Muestra en lenguaje que se encuentra nuestra Instancia
SELECT * 
FROM V$SYSTEM_PARAMETER
WHERE UPPER(name) LIKE '%NLS_LANGUAGE%';
-- =====================================================
-- SELECT de Parametros con los valores que tiene el SPFILE
-- =====================================================
SELECT * 
FROM V$SPPARAMETER 
WHERE UPPER(name) LIKE '%OPEN_CURSORS%';
-- =====================================================
-- SELECT de Parametros con los valores tiene la instancia actual
-- =====================================================
SELECT * 
FROM V$SYSTEM_PARAMETER;
-- =====================================================
-- Funcion parametros referentes a nuestra actual sesion
-- =====================================================
SHOW PARAMETER DB_NAME;
-- =====================================================
-- Funcion para mostrar los valores almacenados en el SPFILE
-- =====================================================
SHOW SPPARAMETER DB_NAME;