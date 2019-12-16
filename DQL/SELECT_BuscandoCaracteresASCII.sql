--------------------------------------------------------
-- Version: 1.0.0.0
-- Archivo: SELECT_BuscandoCaracteresASCII.sql
-------------------------------------------------------
-- Autor: JAlberto-Coder
-- Fecha: 22-11-2019
-- Descripcion: SELECT con condicion WHERE que devuelve los registros con los caracteres ASCII buscandos
--------------------------------------------------------
SELECT *
FROM Cat_Productos
WHERE Descripcion LIKE '%' || CHR(1) || '%'; -- AQUI SE DEBE DE REEMPLAZAR EL CODIGO ASCII QUE SE DESEA BUSCAR