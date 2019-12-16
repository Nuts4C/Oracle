BEGIN
    -- ====================================================
    -- Version: 1.0.0.0
    -- Archivo: Cursores.sql
    -- ====================================================
    -- Autor: JAlberto-Coder
    -- Fecha: 12-12-2019
    -- Descripcion: Ejemplos y demostraciones de uso de Cursores en PL/SQL
    -- ====================================================
    -- TIPOS DE CURSORES
    -- * Implicitos: Se utilizan en SELECT INTO, INSERT, UPDATE y DELETE.
    -- * Explicitos: Se utilizan en instruccion SELECT y llevan un ciclo de ejecucion OPEN, FETCH y CLOSE.
    -- ====================================================
    DECLARE
        -- Declaracion de un cursor explicito
        CURSOR c_usr_registro
        IS
            SELECT *
            FROM USUARIOS_REGISTRO;
        r_usr_registro USUARIOS_REGISTRO %ROWTYPE;
    BEGIN
        -- Apertura de Cursor
        OPEN c_usr_registro;
        LOOP
            -- Operacion por cada registro
            FETCH c_usr_registro
            INTO r_usr_registro;
            -- Sentencia para salir del bucle
            EXIT WHEN c_usr_registro% NOTFOUND;
            
            DBMS_OUTPUT.PUT_LINE('Nombre del Usuario: ' || r_usr_registro.NOMBRE);
        END LOOP;
        -- Cierre de Cursor
        CLOSE c_usr_registro;
        EXCEPTION
            WHEN OTHERS THEN
                NULL;
    
    END;
    -- Ejemplo CURSOR EN CICLO FOR
    BEGIN
        FOR r_usr_registro IN
        (
            SELECT *
            FROM USUARIOS_REGISTRO
        )
        LOOP
            -- RECUERDA QUE TAMBIEN PUEDES AGREGAR SENTENCIAS COMO INSERT, UPDATE y DELETE
            DBMS_OUTPUT.PUT_LINE('Correo del Usuario: ' || r_usr_registro.CORREO_ELECTRONICO);
        END LOOP;
    END;
    -- Ejemplo cursor con Parametros
    DECLARE
        CURSOR c_usr_registro(ID_USUARIO_IN USUARIOS_REGISTRO.ID_USUARIO %TYPE) 
        IS
            SELECT * 
            FROM USUARIOS_REGISTRO WHERE ID_USUARIO = ID_USUARIO_IN;
        r_usr_registro USUARIOS_REGISTRO %ROWTYPE;
        l_id_usuario PLS_INTEGER DEFAULT 1;
    BEGIN
        -- Al abrir el cursor se especifica el valor del parametro para generar una condicion
        OPEN c_usr_registro(l_id_usuario);
        LOOP
            FETCH c_usr_registro
            INTO r_usr_registro;
            EXIT WHEN c_usr_registro% NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('El nombre y correo del usuario son: ' || r_usr_registro.NOMBRE || ' ' || r_usr_registro.CORREO_ELECTRONICO);
        END LOOP;
        -- Parametros para generar validacion cuando se ejecuta un cursor
        -- SQL%ROWCOUNT , SQL%ISOPEN , SQL%FOUND y SQL%NOTFOUND
        CLOSE c_usr_registro;
        EXCEPTION
            WHEN OTHERS THEN
                IF (SQL%ISOPEN) THEN
                    CLOSE c_usr_registro;
                END IF;
    END;
END;
/