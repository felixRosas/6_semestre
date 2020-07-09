--@Autor(es):       Jorge Rodríguez
--@Fecha creación:  dd/mm/yyyy
--@Descripción:     Script principal para validar la Práctica 7.
set verify off
set feedback off
set serveroutput on
whenever sqlerror exit rollback

Prompt Cargando nombres de usuarios
@s-06-validador-variables-usuarios.sql

------------------------------------------------------------------------------
--Creando procedimientos para el usuario del previo

Prompt conectando como usuario &&p7_previo_usr
connect &&p7_previo_usr/&&p7_previo_usr_pwd

@s-00-funciones-validacion.plb
@s-06p-validador-crea-procedimientos-general.plb
@s-06p-validador-crea-procedimientos-previo.plb
------------------------------------------------------------------------------
--Creando procedimientos para el usuario  invitado

Prompt conectando como usuario &&p7_usr_invitado
connect &&p7_usr_invitado/&&p7_usr_invitado_pwd

@s-00-funciones-validacion.plb
@s-06p-validador-crea-procedimientos-general.plb
@s-06p-validador-crea-procedimientos-invitado.plb
------------------------------------------------------------------------------
--Creando procedimientos para el usuario admin

Prompt conectando como usuario  &&p7_usr_admin
connect &&p7_usr_admin/&&p7_usr_admin_pwd

@s-00-funciones-validacion.plb
@s-06p-validador-crea-procedimientos-general.plb
@s-06p-validador-crea-procedimientos-admin.plb
------------------------------------------------------------------------------
--Creando procedimientos para el usuario oper
Prompt conectando como usuario  &&p7_usr_oper
connect &&p7_usr_oper/&&p7_usr_oper_pwd

@s-00-funciones-validacion.plb
@s-06p-validador-crea-procedimientos-general.plb
@s-06p-validador-crea-procedimientos-oper.plb
------------------------------------------------------------------------------

Prompt Creación de procedimientos completa.

connect &&p7_previo_usr/&&p7_previo_usr_pwd
set serveroutput on

--header
exec spv_print_header

--valida datos del usuario previo
exec spv_valida_esquema_usr_previo

connect &&p7_usr_invitado/&&p7_usr_invitado_pwd
set serveroutput on

--valida datos del usuario invitado
exec spv_valida_esquema_usr_invitado('&&p7_usr_invitado');

connect &&p7_usr_admin/&&p7_usr_admin_pwd
set serveroutput on
--valida datos admin
exec spv_valida_esquema_usr_admin('&&p7_usr_admin');

connect &&p7_usr_oper/&&p7_usr_oper_pwd
set serveroutput on

--valida datos admin
exec spv_valida_esquema_usr_oper('&&p7_usr_oper');

exec spv_print_ok('Validación concluida');

exit;

