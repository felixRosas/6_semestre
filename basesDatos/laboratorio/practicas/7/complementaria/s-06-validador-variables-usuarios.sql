--@Autor(es):       Jorge Rodríguez
--@Fecha creación:  dd/mm/yyyy
--@Descripción:     Script empleado para configurar usuarios y passwords.
--                  En la práctica, no se deben guardar passwords en los
--                  scripts, pero para agilizar la prueba del validador
--                  se crea este archivo y asi evitar escribiros cada vez
--                  que se requiera. Se realiza esta técnica en esta práctica
--                  ya que se requiere la intervención de 4 usuarios.
--                  Cambiar los valores segun corresponda.
set verify off
set serveroutput on
set feedback off
whenever sqlerror exit rollback
--password del usuario SYS
define sys_pwd=system

--username del usuario del previo
define p7_previo_usr=amv_p07_previo
--password del usuario del previo
define p7_previo_usr_pwd=alfonso

--username del usuario admin
define p7_usr_admin=amv_p0701_admin
--password del usuario admin
define p7_usr_admin_pwd=alfonso

--username del usuario admin
define p7_usr_oper=amv_p0701_oper
--password del usuario admin
define p7_usr_oper_pwd=alfonso

--username del usuario invitado
define p7_usr_invitado=amv_p0701_invitado
--password del usuario invitado
define p7_usr_invitado_pwd=alfonso