DECLARE 
	--------------------------------------------------------
	-- Version: 1.0.0.0
	-- Archivo: CREATE_Table_ConPLSQL_2
	--------------------------------------------------------
	-- Autor: JAlberto-Coder
	-- Fecha: 24-09-2019
	-- Descripcion: Creacion de objetos con PL/SQL, validando la existencia de la tabla con USER_TABLES, ademas de agregan comentarios a las columnas
	--------------------------------------------------------
    --------------------------------------------------------
    --  DECLARACION DE VARIABLES
    --------------------------------------------------------
	l_existe BOOLEAN := false;
	l_tabla VARCHAR(30) := 'CAT_ESTADOS';
	l_query VARCHAR(1500);
BEGIN
	--------------------------------------------------------
    --  DDL for Table: CAT_ESTADOS
    --------------------------------------------------------
    FOR H IN (SELECT TABLE_NAME FROM USER_TABLES WHERE UPPER(TABLE_NAME) = l_tabla) LOOP
        l_existe := true;
    END LOOP;
    IF (l_existe = false) THEN
        l_query :=
        '
            CREATE TABLE DEVELOPER.CAT_ESTADOS(
                CLAVE_ESTADO varchar(3) NOT NULL,
                ESTADO varchar(100) NOT NULL,
				CLAVE_PAIS varchar(3) NOT NULL
                FECHA_GENERACION date DEFAULT SYSDATE NOT NULL,
                USUARIO_GENERACION varchar(30) DEFAULT ''SYSTEM'' NOT NULL,
                CONSTRAINT PK_CAT_ESTADOS_CLAVE_ESTADO PRIMARY KEY(CLAVE_ESTADO)
            )
        ';
		DBMS_OUTPUT.PUT_LINE('TABLA DEVELOPER.CAT_ESTADOS, CREADA');
        EXECUTE IMMEDIATE l_query;
        l_query := 'COMMENT ON TABLE DEVELOPER.CAT_ESTADOS.CLAVE_ESTADO IS ''Control de monedas permitidas por area para el proceso de transofrmacion asientos manuales'' ';
        EXECUTE IMMEDIATE l_query;
        l_query := 'COMMENT ON COLUMN DEVELOPER.CAT_ESTADOS.ESTADO IS ''Identificador de la moneda, tambien llave primaria'' ';
        EXECUTE IMMEDIATE l_query;
        l_query := 'COMMENT ON COLUMN DEVELOPER.CAT_ESTADOS.CLAVE_PAIS IS ''Clave del pais que tiene el estado'' ';
        EXECUTE IMMEDIATE l_query;
        l_query := 'COMMENT ON COLUMN DEVELOPER.CAT_ESTADOS.FECHA_GENERACION IS ''Fecha en la cual se genera el registro en BD'' ';
        EXECUTE IMMEDIATE l_query;
        l_query := 'COMMENT ON COLUMN DEVELOPER.CAT_ESTADOS.USUARIO_GENERACION IS ''Usuario el cual se genera el registro en BD'' ';
        EXECUTE IMMEDIATE l_query;
        DBMS_OUTPUT.PUT_LINE('COMENTARIOS CREADOS, FIN DEL SCRIPT');
        COMMIT;
    ELSE
        DBMS_OUTPUT.PUT_LINE('VALIDACION: TABLA DEVELOPER.CAT_ESTADOS, EXISTENTE');
    END IF;
    EXCEPTION WHEN OTHERS THEN 
        DBMS_OUTPUT.PUT_LINE('ERROR: TABLA DEVELOPER.CAT_ESTADOS, NO CREADA');
    NULL;
END;
/