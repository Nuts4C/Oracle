DECLARE
	-- ====================================================
	-- Version: 1.0.0.0
	-- Archivo: ExcepcionDivision.sql
	-- ====================================================
	-- Autor: JAlberto-Coder
	-- Fecha: 07-12-2019
	-- Descripcion: Se muestra el manejo de una excepcion en Oracle
	-- ====================================================
    l_resultado NUMBER(8,2);
BEGIN
    l_resultado := 10 / 0;
    
    EXCEPTION
        WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/