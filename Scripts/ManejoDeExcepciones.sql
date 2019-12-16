DECLARE
	-- ====================================================
	-- Version: 1.0.0.0
	-- Archivo: ManejoDeExcepciones.sql
	-- ====================================================
	-- Autor: JAlberto-Coder
	-- Fecha: 07-12-2019
	-- Descripcion: Se muestra el manejo de excepciones en Oracle
	-- ====================================================
	-- Categorias Excepciones
	-- 1. Excepciones Definidas (Codigo de error ORA-27102)
	-- 2. Excepciones Predefinidas
	-- 3. Excepciones Definidas por el usuario
	-- ====================================================
    l_resultado_division PLS_INTEGER := 0;
    l_monto NUMBER(18,2) := 10000000.00;
    l_Hora DATE;
    -- Generacion de una Excepcion definida por un usuario
    e_monto_invalido EXCEPTION;
    PRAGMA EXCEPTION_INIT(e_monto_invalido, -20999); -- El numero de error va entre -20,999 y -20,000
BEGIN
    -- Bloque de ejecucion BEGIN-END, excepcion definida
    BEGIN
        l_resultado_division := 10 / 0;
        EXCEPTION WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE(SQLCODE || ' ' || SQLERRM);
    END;
    -- Bloque de ejecucion BEGIN-END, excepcion definida
    BEGIN
        SELECT SYSDATE
        INTO l_hora
        FROM DUAL;
        
        EXCEPTION WHEN NO_DATA_FOUND THEN
            l_hora := '2019-12-12';
    END;
    -- Bloque de ejecucion BEGIN-END, excepcion definida por el usuario
    BEGIN
        IF (l_monto >= 10000000.00) THEN
            -- Sentencia para enviar el mensaje de error en caso de que suceda, y detener bloque de ejecucion
            RAISE_APPLICATION_ERROR(-20999, 'El monto es demasiado alto. Operacion invalido');
        END IF;
    END;
    -- Otras excepciones y control de estas
    EXCEPTION
		WHEN TOO_MANY_ROWS THEN
			DBMS_OUTPUT.PUT_LINE(SQLCODE || ' ' || SQLERRM);
        WHEN OTHERS THEN
            DECLARE
                l_error PLS_INTEGER := SQLCODE;
                l_mensaje VARCHAR2(255) := SQLERRM;
            BEGIN
                CASE l_error
                WHEN -1 THEN
                    DBMS_OUTPUT.PUT_LINE(SQLCODE || ' ' || SQLERRM);
                ELSE
                    DBMS_OUTPUT.PUT_LINE(SQLCODE || ' ' || SQLERRM);
                END CASE;
                -- RAISE; -- Sentencia para atrapar excepciones y mostrarlas
            END;
END;
/