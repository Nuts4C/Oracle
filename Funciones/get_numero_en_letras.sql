CREATE OR REPLACE FUNCTION get_numero_en_letras
(
    in_numero NUMBER
)
-- ==============================================
-- Version: 1.0.0.0
-- ==============================================
-- Autor: JAlberto-Coder
-- Fecha: 17-12-2019
-- Descripcion: Se genera una funcion que recibe un numero con digitos maximo 9999 y lo describe con palabras
-- ==============================================
RETURN VARCHAR2
IS
    l_numero_entero VARCHAR2(30);
    l_numero_decimal VARCHAR2(30);
    l_numero_en_letra VARCHAR(1000) := ' ';
    l_lugar_punto PLS_INTEGER;
    l_contador_procesado PLS_INTEGER := 0;
    l_decenas_de_millar PLS_INTEGER;
    l_unidades_de_millar PLS_INTEGER;
    l_centenas PLS_INTEGER;
    l_decenas PLS_INTEGER;
    l_unidades PLS_INTEGER;
BEGIN
    IF (in_numero <= 0 OR in_numero >= 10000) THEN
        l_numero_en_letra := 'Validacion. Numero no permitido';
        GOTO NUMERO_INVALIDO;
    END IF;
    l_lugar_punto := INSTR(in_numero, '.');
    IF (l_lugar_punto > 0) THEN
        l_numero_entero := SUBSTR(in_numero, 0, l_lugar_punto - 1);
        l_numero_decimal := SUBSTR(in_numero, l_lugar_punto + 1, LENGTH(in_numero));
    ELSE
        l_numero_entero := SUBSTR(in_numero, 0, LENGTH(in_numero));
        l_numero_decimal := 0;
    END IF;
    
    l_decenas_de_millar := TRUNC(l_numero_entero / 10000,0);
    l_unidades_de_millar := TRUNC((l_numero_entero MOD 10000) / 1000,0);
    l_centenas := TRUNC((l_numero_entero MOD 1000) / 100,0);
    l_decenas := TRUNC((l_numero_entero MOD 100) / 10,0);
    l_unidades := l_numero_entero MOD 10;
    
    << CONVERSION_A_LETRAS >>
    -- ==============================================
    -- DECENAS DE MILLAR
    -- ==============================================
    CASE l_decenas_de_millar
        WHEN 1 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'ONCE MIL ');
        WHEN 2 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'DOS MIL ');
        WHEN 3 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'TRES MIL ');
        WHEN 4 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'CUATRO MIL ');
        WHEN 5 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'CINCO MIL ');
        WHEN 6 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'SEIS MIL ');
        WHEN 7 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'SIETE MIL ');
        WHEN 8 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'OCHO MIL ');
        WHEN 9 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'NUEVE MIL ');
        ELSE l_numero_en_letra := l_numero_en_letra;
    END CASE;
    -- ==============================================
    -- UNIDADES DE MILLAR
    -- ==============================================
    CASE l_unidades_de_millar
        WHEN 1 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'MIL ');
        WHEN 2 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'DOSMIL ');
        WHEN 3 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'TRESMIL ');
        WHEN 4 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'CUATROMIL ');
        WHEN 5 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'CINCOMIL ');
        WHEN 6 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'SEISMIL ');
        WHEN 7 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'SIETEMIL ');
        WHEN 8 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'OCHOMIL ');
        WHEN 9 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'NUEVEMIL ');
        ELSE l_numero_en_letra := l_numero_en_letra;
    END CASE;
    -- ==============================================
    -- CENTENAS
    -- ==============================================
    CASE l_centenas
        WHEN 1 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'CIENTO ');
        WHEN 2 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'DOCIENTOS ');
        WHEN 3 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'TRESCIENTOS ');
        WHEN 4 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'CUATROCIENTOS ');
        WHEN 5 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'QUINIENTOS ');
        WHEN 6 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'SEISCIENTOS ');
        WHEN 7 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'SETECIENTOS ');
        WHEN 8 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'OCHOCIENTOS ');
        WHEN 9 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'NOVECIENTOS ');
        ELSE l_numero_en_letra := l_numero_en_letra;
    END CASE;
    -- ==============================================
    -- DECENAS
    -- ==============================================
    CASE l_decenas
        WHEN 1 THEN 
            IF (l_unidades < 6) THEN
                CASE l_unidades
                    WHEN 0 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'DIEZ ');
                    WHEN 1 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'ONCE ');
                    WHEN 2 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'DOCE ');
                    WHEN 3 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'TRECE ');
                    WHEN 4 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'CATORCE ');
                    WHEN 5 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'QUINCE ');
                    ELSE l_numero_en_letra := l_numero_en_letra;
                END CASE;
            ELSE
                CASE l_unidades
                    WHEN 6 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'DIECISEIS ');
                    WHEN 7 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'DIECISIETE ');
                    WHEN 8 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'DIECIOCHO ');
                    WHEN 9 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'DIECINUEVE ');
                    ELSE l_numero_en_letra := l_numero_en_letra;
                END CASE;
            END IF;
        WHEN 2 THEN 
            IF (l_unidades = 0) THEN
                l_numero_en_letra := CONCAT(l_numero_en_letra, 'VEINTE ');
            ELSE
                l_numero_en_letra := CONCAT(l_numero_en_letra, 'VEINTI');
            END IF;
        WHEN 3 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'TREINTA ');
        WHEN 4 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'CUARENTA ');
        WHEN 5 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'CINCUENTA ');
        WHEN 6 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'SESENTA ');
        WHEN 7 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'SETENTA ');
        WHEN 8 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'OCHENTA ');
        WHEN 9 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'NOVENTA ');
        ELSE l_numero_en_letra := l_numero_en_letra;
    END CASE;
    -- ==============================================
    -- UNIDADES
    -- ==============================================
    IF (l_decenas <> 1) THEN
        IF (l_decenas IN(1,2,3,4,5,6,7,8,9) AND l_unidades <> 0) THEN
            l_numero_en_letra := CONCAT(l_numero_en_letra, 'Y ');
        END IF;
        CASE l_unidades
            WHEN 1 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'UNO ');
            WHEN 2 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'DOS ');
            WHEN 3 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'TRES ');
            WHEN 4 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'CUATRO ');
            WHEN 5 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'CINCO ');
            WHEN 6 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'SEIS ');
            WHEN 7 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'SIETE ');
            WHEN 8 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'OCHO ');
            WHEN 9 THEN l_numero_en_letra := CONCAT(l_numero_en_letra, 'NUEVE ');
            ELSE l_numero_en_letra := l_numero_en_letra;
        END CASE;
    END IF;
    l_contador_procesado := l_contador_procesado + 1;
    
    IF (l_contador_procesado < 2) THEN
        IF (l_numero_decimal > 0) THEN 
            l_numero_en_letra := CONCAT(l_numero_en_letra, 'CON ');
            l_decenas_de_millar := TRUNC(l_numero_decimal / 10000,0);
            l_unidades_de_millar := TRUNC((l_numero_decimal MOD 100000) / 1000,0);
            l_centenas := TRUNC((l_numero_decimal MOD 1000) / 100,0);
            l_decenas := TRUNC((l_numero_decimal MOD 100) / 10,0);
            l_unidades := l_numero_decimal MOD 10;
            GOTO CONVERSION_A_LETRAS;
        END IF;
    END IF;
        
    << TERMINAR >>
    IF (l_numero_decimal > 0) THEN
        l_numero_en_letra := CONCAT(l_numero_en_letra, 'CENTAVOS ');
    END IF;
    
    << NUMERO_INVALIDO >>
    RETURN l_numero_en_letra;
    
    COMMIT;
    
    EXCEPTION
        WHEN OTHERS THEN
            RETURN 'Error. Al momento de realizar la conversion';
END;
/
-- ==============================================
-- EJECUCION DE LA FUNCION
-- ==============================================
SELECT get_numero_en_letras(9090.19) AS Numero_en_Letra
FROM DUAL;