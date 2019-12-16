DECLARE
	--------------------------------------------------------
	-- Version: 1.0.0.0
	-- Archivo: CREATE_TableConValidacion
	-------------------------------------------------------
	-- Autor: JAlbert-Coder
	-- Fecha: 09-07-2019
	-- Descripcion: Creacion de tablas validando su existencia, en caso de que exista ya no se crea. Para esto utilizamos un script PL/SQL aplicando un cursor de la tabla all_tables
	--------------------------------------------------------
    --------------------------------------------------------
    --  DECLARACION DE VARIABLES
    --------------------------------------------------------
    CURSOR c_existe_tabla(AT_Owner VARCHAR, AT_NombreTabla VARCHAR)
    IS
        SELECT COUNT(1)
        FROM ALL_TABLES
        WHERE OWNER = UPPER(AT_Owner) AND TABLE_NAME = UPPER(AT_NombreTabla);
    l_contador number := 0;
    l_id_cursor number;
    l_filas number;
BEGIN
    --------------------------------------------------------
    --  DDL for Table: CAT_PAISES
    --------------------------------------------------------
    OPEN c_existe_tabla('DEVELOPER','CAT_PAISES');
    FETCH c_existe_tabla INTO l_contador;
    CLOSE c_existe_tabla;
    IF NVL(l_contador, 0) = 0 THEN
        BEGIN
		
            l_id_cursor := DBMS_SQL.OPEN_CURSOR;
            DBMS_SQL.PARSE(l_id_cursor, '
                            CREATE TABLE DEVELOPER.CAT_PAISES(
                                CLAVE_PAIS varchar(3) NOT NULL,
                                PAIS varchar(100) NOT NULL,
								AGRUPACION varchar(50) NULL,
                                FECHA_GENERACION date DEFAULT SYSDATE NOT NULL,
                                USUARIO_GENERACION varchar(60) DEFAULT ''SYSTEM'' NOT NULL,
                                CONSTRAINT PK_CAT_PAISES PRIMARY KEY(CLAVE_PAIS)',1);
            l_filas := DBMS_SQL.EXECUTE(l_id_cursor);
            DBMS_SQL.CLOSE_CURSOR(l_id_cursor);
            DBMS_OUTPUT.PUT_LINE('TABLA CREADA: DEVELOPER.CAT_PAISES');
            EXCEPTION 
                WHEN OTHERS THEN 
                    DBMS_OUTPUT.PUT_LINE('TABLA NO CREADA: DEVELOPER.CAT_PAISES');
                    NULL;
        END;
    END IF;
    COMMIT;
END;
/