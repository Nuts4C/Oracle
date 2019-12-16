DECLARE
	-- ====================================================
	-- Version: 1.0.0.0
	-- Archivo: DeclaracionDeVariables.sql
	-- ====================================================
	-- Autor: JAlberto-Coder
	-- Fecha: 07-12-2019
	-- Descripcion: Demostracion para declarar variables y poner valores por defecto
	-- ====================================================
	-- ====================================================
	-- Sentencia PL/SQL
	-- Prefijo g_ <- Variable global
	-- Prefijo l_ <- Variable local
	-- Prefijo co_ <- Variable constante (No cambia el valor de la ejecucion)
	-- Prefijo c_ <- variable cursor
	-- Prefijo r_ <- variable de registro
	-- ====================================================
    l_numero PLS_INTEGER; -- Este tipo de dato es unico para PL/SQL y mas rapido que number
    l_number INTEGER NOT NULL DEFAULT 8;
    l_nombre VARCHAR2(255);
    l_numero_replica l_numero %TYPE; -- Se declara como tipo de datos decendiente de otra variable
    l_es_verdadedo BOOLEAN := TRUE;
    co_clave_moneda_mexico CONSTANT CHAR(3) DEFAULT 'MXN'; -- Si se intenta modificar una variable constante marcara error
    -- l_identificador customers.id %TYPE; -- Tipo de datos conforme la columna de una tabla
BEGIN
    l_Numero := 1 + 1;
    l_number := 9;
    DBMS_OUTPUT.PUT_LINE('Resultado Suma: ' || l_Numero);
    DBMS_OUTPUT.PUT_LINE('Valor entero: ' || l_Number);
    COMMIT;
    EXCEPTION
        WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE(SQLERRM);
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error Otros: ' || SQLERRM);
END;
/