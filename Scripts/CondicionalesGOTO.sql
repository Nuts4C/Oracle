BEGIN
	-- ====================================================
	-- Version: 1.0.0.0
	-- Archivo: CondicionalesGOTO.sql
	-- ====================================================
	-- Autor: JAlberto-Coder
	-- Fecha: 07-12-2019
	-- Descripcion: Utilizacion de sentencias GOTO
	-- ====================================================
    GOTO set_mensaje_2;
    
    << set_mensaje_1 >> -- Parametros para poder encontrar el bloque a ejecutar
    DBMS_OUTPUT.PUT_LINE('Primer mensaje');
    GOTO fin;
    
    << set_mensaje_2 >>
    DBMS_OUTPUT.PUT_LINE('Segundo mensaje');
    GOTO fin;
    
    << fin >>
    DBMS_OUTPUT.PUT_LINE('Fin de la ejecucion');
    
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error: ' || SQLERRM);
END;
/