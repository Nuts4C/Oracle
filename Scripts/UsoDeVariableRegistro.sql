DECLARE
    -- ====================================================
    -- Version: 1.0.0.0
    -- Archivo: UsoDeVariableRegistro.sql
    -- ====================================================
    -- Autor: JAlberto-Coder
    -- Fecha: 08-12-2019
    -- Descripcion: Ejemplo practico del uso de Registros en PL/SQL
    -- ====================================================
    -- DEFINICIONES
    -- Un registro en PL/SQL simple y sencillamente es una linea de varios campos que conformar un solo registro de alguna tabla, es decir, estos son definidos como tablas pero solo pueden ocupar un solo registro
    -- ====================================================
    l_contador_tabla PLS_INTEGER DEFAULT 0;
    l_query VARCHAR(1000);
BEGIN
    -- ====================================================
    -- PRECONDICIONES
    -- * Tener una tabla creada llamada USUARIOS
    -- ====================================================
    SELECT COUNT(1)
    INTO l_contador_tabla
    FROM USER_TABLES
    WHERE UPPER(TABLE_NAME) = 'USUARIOS_REGISTRO';

    IF (l_contador_tabla = 0) THEN
        l_query := 
        '
            CREATE TABLE USUARIOS_REGISTRO
            (
                ID_USUARIO NUMBER(4),
                NOMBRE VARCHAR(150),
                CORREO_ELECTRONICO VARCHAR2(60)
            )
        ';
        EXECUTE IMMEDIATE l_query;
    END IF;
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            DBMS_OUTPUT.PUT_LINE('Error al crear la tabla');
END;
/
DECLARE
    -- ====================================================
    -- EJEMPLO PARA DECLARACION Y USO DE REGISTROS
    -- ===================================================
    -- Declaracion de un registro basandose en una tabla
    r_usr_registro USUARIOS_REGISTRO %ROWTYPE;
    -- Declaracion de un registro definido por el desarrollador
    TYPE r_type_usr_registro IS RECORD
    (
        ID_USUARIO NUMBER(4),
        NOMBRE VARCHAR(150),
        CORREO_ELECTRONICO VARCHAR2(60)
    );
BEGIN
    -- SET de valores
    r_usr_registro.ID_USUARIO := 1;
    r_usr_registro.NOMBRE := 'Aldous Huxley';
    r_usr_registro.CORREO_ELECTRONICO := 'UnMundoFeliz@dominio.com';
    -- INSERT de registros en tabla
    INSERT INTO USUARIOS_REGISTRO VALUES r_usr_registro;
    COMMIT;
    EXCEPTION 
    WHEN OTHERS THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE(SQLCODE || ' ' || SQLERRM);
END;
/
SELECT * 
FROM USUARIOS_REGISTRO;