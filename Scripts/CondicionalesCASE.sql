DECLARE
	-- ====================================================
	-- Version: 1.0.0.0
	-- Archivo: CondicionalesCASE.sql
	-- ====================================================
	-- Autor: JAlberto-Coder
	-- Fecha: 07-12-2019
	-- Descripcion: Utilizacion de sentencias CASE
	-- ====================================================
    l_nivel_ingles CHAR(2) NOT NULL := 'A1';
    l_descripcion VARCHAR(250);
BEGIN
    CASE l_nivel_ingles
        WHEN 'A1' THEN l_descripcion := 'Nivel basico, aquellos capaces de comunicarse en situaciones cotidianas con expresiones de uso frecuente en ocasiones con apoyo';
        WHEN 'A2' THEN l_descripcion := 'Nivel basico, aquellos capaces de comunicarse en situaciones cotidianas con expresiones de uso frecuente sin apollo alguno';
        WHEN 'B1' THEN l_descripcion := 'Nivel independiente, cuentan con la fluidez necesaria para comunicarse sin esfuerzo';
        WHEN 'B2' THEN l_descripcion := 'Nivel independiente, cuentan con la fluidez necesaria para comunicarse sin esfuerzo con hablantes nativos';
        WHEN 'C1' THEN l_descripcion := 'Nivel competente, son capaces para manejar tareas complejas de trabajo y estudio';
        WHEN 'C2' THEN l_descripcion := 'Nivel competente, son capaces para manejar tareas complejas de trabajo y estudio';
        ELSE l_descripcion := 'No especificado';
    END CASE;
    DBMS_OUTPUT.PUT_LINE('Nivel de Ingles: ' || l_descripcion);
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error: ' || SQLERRM);
END;
/