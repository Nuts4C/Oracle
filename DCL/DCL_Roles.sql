-- ====================================================
-- Version: 1.0.0.0
-- Archivo: DCL_Roles.sql
-- ====================================================
-- Autor: JAlbert-Coder
-- Fecha: 06-12-2019
-- Descripcion: Sentencias para la administracion de Roles, recuerda que un Rol es un grupo de provilegios que puede ser asignado a uno o mas usuario
-- ====================================================
-- 1. CREATE ROLE
-- ====================================================
ALTER SESSION SET "_ORACLE_SCRIPT" = TRUE; -- Script para que no cause el error invalid common user or role name
CREATE ROLE MasterData;
-- ====================================================
-- 2. ASIGNACION DE PERMISOS AL ROL CREADO
-- ====================================================
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLA_EJEMPLO TO MasterData;
GRANT SELECT, INSERT, UPDATE, DELETE ON TABLA_EJEMPLO_2 TO MasterData;
-- ====================================================
-- 3. CREACION DE USUARIO Y ASIGNACION DE ROL
-- ====================================================
CREATE USER USR_ROL_DEFAULT IDENTIFIED BY Default123#;
GRANT CREATE SESSION TO USR_ROL_DEFAULT;
GRANT MasterData TO USR_ROL_DEFAULT;
-- ====================================================
-- HABILITAR Y DESHABILITAR ROLES
-- ====================================================
SET ROLE ALL; -- COMANDO PARA HABILIDAR TODOS LOS ROLES PREVIAMENTE OTORGADOS
SET ROLE ALL EXCEPT MasterData; -- COMANDO PARA HABILITAR TODOS LOS ROLES EXCEPTUANDO UNO
SET ROLE NONE; -- COMANDO PARA DESHABILITAR TODAS LAS FUNCIONES INCLUIDAS
-- ====================================================
-- CONSULTA QUE MUESTRA LOS ROLES HABILITADOS EN LA SESION ACTUAL
-- ====================================================
SELECT *
FROM SESSION_ROLES;
-- ====================================================
-- MODIFICAR ROL, PERMITE MODIFICAR LA AUTORIZACION NECESARIA PARA HABILITAR UN ROL
-- ====================================================
ALTER ROLE MasterData NOT IDENTIFIED;
-- ====================================================
-- ELIMINAR ROL
-- ====================================================
DROP ROLE MasterData;