--------------------------------------------------------
-- Version: 1.0.0.0
-- Archivo: SELECT_CTE_Fibonacci.sql
-------------------------------------------------------
-- Autor: JAlberto-Coder
-- Fecha: 20-12-2019
-- Descripcion: SELECT para generar la serie de Fibonacci con una Common Table Extension
--------------------------------------------------------
WITH CTE_Fibonacci (Nivel, Fibonacci, NivelSiguiente)
AS
(
    SELECT 0
        , 0
        , 1
    FROM DUAL
    UNION ALL
    SELECT Nivel + ROWNUM
        , NivelSiguiente
        , Fibonacci + NivelSiguiente
    FROM CTE_Fibonacci
    WHERE Nivel < 11
)
SELECT Fibonacci
FROM CTE_Fibonacci;