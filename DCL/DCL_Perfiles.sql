-- ====================================================
-- Version: 1.0.0.0
-- Archivo: DCL_Perfiles.sql
-- ====================================================
-- Autor: JAlbert-Coder
-- Fecha: 06-12-2019
-- Descripcion: Un Perfil permite poner un limite a los usuarios para los recursos que tiene la base de datos
-- ====================================================
-- CONSUTLA QUE DEVUELVE LOS PERFILES DEFAULT
-- ====================================================
SELECT *
FROM DBA_PROFILES; -- AQUI PODRAS VER LOS RECURSOS ASI COMO SU TIPO PARA PODER CREAR NUEVOS
-- ====================================================
-- 1. CREATE PROFILE
-- ====================================================
CREATE PROFILE OPERACIONES LIMIT
    SESSIONS_PER_USER UNLIMITED
    CPU_PER_SESSION UNLIMITED
    CPU_PER_CALL 3000
    CONNECT_TIME 15;
-- ====================================================
-- 2. CREAREMOS UN USUARIO Y LE ASIGNAREMOS EL PERFIL CREADO
-- ====================================================
CREATE USER OPER_1 IDENTIFIED BY Demo123#
PROFILE OPERACIONES;
-- ====================================================
-- PERFIL PARA ESTABLECER LIMITE DE UNA CONTRASENIA
-- ====================================================
CREATE PROFILE ERP LIMIT
    FAILED_LOGIN_ATTEMPTS 3
    PASSWORD_LIFE_TIME 90;
CREATE USER EJEMPLO1 IDENTIFIED BY ABCDE12345
PROFILE ERP;
-- ====================================================
-- ELIMINAR PERFIL
-- ====================================================
DROP PROFILE ERP CASCADE;