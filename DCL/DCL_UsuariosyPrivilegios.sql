-- ====================================================
-- Version: 1.0.0.0
-- Archivo: DCL_UsuariosyPrivilegios.sql
-- ====================================================
-- Autor: JAlbert-Coder
-- Fecha: 05-12-2019
-- Descripcion: Sentencias para la administracion de Usuarios Y Privilegios
-- ====================================================
-- SELECT DONDE SE ENCUENTRAN LOS USUARIOS
-- ====================================================
SELECT USERNAME
    , USER_ID
    , PASSWORD
    , ACCOUNT_STATUS
    , DEFAULT_TABLESPACE
    , PROFILE
    , AUTHENTICATION_TYPE
    , CREATED
FROM DBA_USERS;
SELECT * FROM ALL_USERS; -- SELECT PARA VER TODOS LOS USUARIOS QUE SON VISIBLES PARA EL USUARIO ACTUAL
SELECT * FROM user_users; -- SELECT PARA MOSTRAR LA INFORMACION DEL USUARIO ACTUAL
-- ====================================================
-- CREATE USER
-- Nota: Cuando crea un nuevo usuario sin especificar un perfil, Oracle asignara el perfil DEFAULT al usuario
-- ====================================================
ALTER SESSION SET "_ORACLE_SCRIPT" = true; -- Sentencia a ejecutar en caso de error: invalid common user or role name
CREATE USER USR_DEMO IDENTIFIED BY Developer123#;
-- ====================================================
-- CREATE SESSION, Esta sentencia permitira que el usuario pueda acceder a la base de datos
-- ====================================================
GRANT CREATE SESSION TO USR_DEMO;
-- ====================================================
-- GRANT (PRIVILEGIOS)
-- Estos se dividen en dos:
--      * Privilegios del Sistema (CREATE TABLE, CREATE VIEW, CREATE SESSION, CREATE PROCESUDRE, SYSDBA, SYSOPER)
--      * Privilegios por Objeto (INSERT, UPDATE, DELETE, INDEX, EXECUTE)
-- ====================================================
GRANT CREATE TABLE TO USR_DEMO;
-- ====================================================
-- SELECT PARA VISUALIZAR LOS PRIVILEGIOS DEL USUARIO ACTUAL
-- ====================================================
SELECT *
FROM SESSION_PRIVS;
-- ====================================================
-- SENTENCIA PARA CAMBIAR LA CUOTA DEL USUARIO EN EL ESPACIO DE ALGUA TABA
-- ====================================================
ALTER USER USR_DEMO QUOTA UNLIMITED ON TABLA_EJEMPLO;
-- ====================================================
-- COMANDO WITH ADMIN OPTION
-- Este comando permite que al asignar un permiso con GRANT este permiso también lo pueda asignar el usuario
-- ====================================================
GRANT CREATE VIEW TO USR_DEMO WITH ADMIN OPTION;
-- ====================================================
-- COMANDO ANY
-- El comando ANY permite que el permiso pueda ejecutarse en cualquier objeto
-- ====================================================
GRANT SELECT ANY TABLE TO USR_DEMO;
-- ====================================================
-- PERMISOS A OBJETOS
-- ====================================================
GRANT SELECT ON TABLA_EJEMPLO TO USR_DEMO;
-- ====================================================
-- REVOKE
-- Para revocar un permisos a un usuario se utiliza la sentencia REVOKE
-- ====================================================
REVOKE UPDATE, DELETE ON TABLA_EJEMPLO FROM USR_DEMO;
REVOKE CREATE TABLE FROM USR_DEMO;
REVOKE ALL PRIVILEGES FROM USR_DEMO; -- En caso de remover todos los privilegios
-- ====================================================
-- ALTER USER, Modificar contrasenia
-- ====================================================
ALTER USER USR_DEMO IDENTIFIED BY Dev123#; -- Se modifica el contrasenia de este
-- ====================================================
-- ALTER USER, Bloquear o desbloquear usuario
-- ====================================================
ALTER USER USR_DEMO ACCOUNT LOCK; -- Bloquear
ALTER USER USR_DEMO ACCOUNT UNLOCK; -- Desbloquear
-- ====================================================
-- ALTER USER, para que la contrasenia expire
-- ====================================================
ALTER USER USR_DEMO PASSWORD EXPIRE;
-- ====================================================
-- PERFILES
-- Un perfil puede englobar una serie de permisos que pueden ir por defecto a los usuarios creados, ademas de los roles
-- ====================================================
-- CREATE PROFILE
-- ====================================================
CREATE PROFILE Escritura LIMIT
    SESSIONS_PER_USER UNLIMITED
    CPU_PER_SESSION UNLIMITED
    CPU_PER_CALL 2000
    CONNECT_TIME 60;
-- ====================================================
-- ALTER USER, para asignarle un Perfil
-- ====================================================
ALTER USER USR_DEMO PROFILE Escritura;
-- ====================================================
-- ROLES
-- Los roles son utilizados para reducir la creacion de permisos en nuestra base de datos
-- Estos pueden ser asignados a uno o mas usuarios
-- ====================================================
-- SELECT Para visualizar los roles que tenemos creados en nuestra BD
-- ====================================================
SELECT *
FROM SESSION_ROLES;
-- ====================================================
-- CREATE ROLES, Crearemos un nuevo rol
-- ====================================================
CREATE ROLES ROL_DEMO;
-- ====================================================
-- CREAMOS los permisos que tendra el ROL
-- ====================================================
GRANT CREATE TABLE, CREATE VIEW TO ROL_DEMO;
-- ====================================================
-- CREAMOS permisos GRANT con el ROl para el usuario USR_DEMO
-- ====================================================
GRANT ROL_DEMO TO USR_DEMO;
-- ====================================================
-- CONCEDER TODOS LOS PRIVILEGIOS A UN USUARIO
-- ====================================================
GRANT ALL PRIVILEGES TO USR_DEMO;
-- ====================================================
-- Le ponemos el rol predeterminado al usuario
-- ====================================================
ALTER USER USR_DEMO DEFAULT ROLE ROL_DEMO;
-- ====================================================
-- DROP USER
-- Si el usuario contiene objetos como vistas y tablas, primero debe eliminar todos los objetos de esquema del usuario
-- ====================================================
DROP USER USR_DEMO; -- EN CASO DE QUE EL USUARIO SE ENCUENTRE CONECTADO NO SE PODRA ELIMINAR
DROP USER USR_DEMO CASCADE; -- ELIMNA TODOS LOS OBJETOS DE ESQUEMA DEL USUARIO ANTES DE ELIMINARLO