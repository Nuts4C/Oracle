DECLARE
	-- ====================================================
	-- Version: 1.0.0.0
	-- Archivo: ManejoBucles.sql
	-- ====================================================
	-- Autor: JAlberto-Coder
	-- Fecha: 08-12-2019
	-- Descripcion: Manejo de bucles los distintos tipos de bucles disponibles en Oracle, recuerda que estos bucles tambien los puedes utilizar generando sentencias DML para la manipulacion de tablas
	-- ====================================================
    l_contador PLS_INTEGER := 0;
    l_bucle1 PLS_INTEGER := 0;
    l_bucle2 PLS_INTEGER := 0;
BEGIN
    -- ====================================================
    -- SENTENCIAS LOOP
    -- ====================================================
    -- Ciclo infinito, pero con condicion para poder salir
    LOOP
        l_contador := l_contador + 1;
        DBMS_OUTPUT.PUT_LINE('Ciclo: ' || l_contador);
        IF l_contador > 4 THEN
            EXIT;
        END IF;
    END LOOP;
    -- Ciclo infinito con condicion natural del bucle
    LOOP
        l_contador := l_contador + 1;
        DBMS_OUTPUT.PUT_LINE('Ciclo: ' || l_contador);
        EXIT WHEN l_contador > 4;
    END LOOP;
    -- Bucle anidado
    << ciclo_padre >>
    LOOP
        l_bucle1 := l_bucle1 + 1;
        EXIT ciclo_padre WHEN l_bucle1 >= 3;
        DBMS_OUTPUT.PUT_LINE('Bucle Padre: ' || l_bucle1);
        l_bucle2 := 0;
        << ciclo_hijo >>
        LOOP
            l_bucle2 := l_bucle2 + 1;
            EXIT ciclo_hijo WHEN l_bucle2 >= 5;
            DBMS_OUTPUT.PUT_LINE('  Bucle Hijo: ' || l_bucle2);
        END LOOP;
    END LOOP;
    -- ====================================================
    -- SENTENCIAS FOR LOOP
    -- ====================================================
    -- Ejemplo de FOR LOOP
    l_contador := 0;
    FOR l_contador IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('Ciclo FOR: ' || l_contador);
    END LOOP;
    -- Ejemplo de FOR LOOP REVERSE
    l_contador := 0;
    FOR l_contador IN reverse 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('Ciclo FOR REVERSE: ' || l_contador);
    END LOOP;
    -- ====================================================
    -- SENTENCIAS WHILE
    -- ====================================================
    l_contador := 0;
    WHILE l_contador < 5 LOOP
        DBMS_OUTPUT.PUT_LINE('Ciclo WHILE: ' || l_contador);
        l_contador := l_contador + 1;
        EXIT WHEN l_contador = 4; -- Parametro opcional si se desea salir antes del LOOP
        CONTINUE WHEN l_contador = 5; -- Parametro opcional con condicion si se desea seguir con el ciclo
    END LOOP;
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Ha ocurrido un error: ' || SQLERRM);
END;
/