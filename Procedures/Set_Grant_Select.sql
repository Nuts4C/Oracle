CREATE OR REPLACE PROCEDURE Set_Grant_Select
(
    l_propietario ALL_TABLES.OWNER %TYPE,
    l_usuario ALL_TABLES.TABLE_NAME %TYPE
)
AS
-- =============================================
-- Version: 1.0.0.0
-- =============================================
-- Autor: JAlberto-Coder
-- Fecha: 12-12-2019
-- Objetivo: Procedimiento que otorga permisos SELECT a usuario ingresado, basandose en los objetos tabla que tiene un propietario
-- =============================================
BEGIN
    FOR r IN
    (
        SELECT OWNER, TABLE_NAME
        FROM ALL_TABLES
        WHERE OWNER = l_propietario
    )
    LOOP
        EXECUTE IMMEDIATE 'GRANT SELECT ON ' || r.OWNER || '.' || r.TABLE_NAME || ' TO ' || l_usuario;
    END LOOP;
 END;