DECLARE
	-- ====================================================
	-- Version: 1.0.0.0
	-- Archivo: CondicionalesIF.sql
	-- ====================================================
	-- Autor: JAlberto-Coder
	-- Fecha: 07-12-2019
	-- Descripcion: Utilizacion de sentencias IF
	-- ====================================================
    l_edad PLS_INTEGER DEFAULT 29;
    l_es_mayor_de_edad BOOLEAN := NULL;
BEGIN
    IF (l_edad > 17) THEN
        l_es_mayor_de_edad := TRUE;
    ELSIF (l_edad = NULL) THEN
        l_es_mayor_de_edad := null;
    ELSE
        l_es_mayor_de_edad := FALSE;
    END IF;
    
    IF l_es_mayor_de_edad THEN
        DBMS_OUTPUT.PUT_LINE('Es mayor de edad');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Aun no es mayor de edad');
    END IF;
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error Otros: ' || SQLERRM);
END;
/