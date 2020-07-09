--@Autor(es):       Jorge Rodríguez
--@Fecha creación:  dd/mm/yyyy
--@Descripción:    Práctica 9 Complementaria - Validador, script inicial.

define p_archivo_validador_main='s-05-validador-fx-main.sql'
define p_archivo_validador ='s-05p-validador-fx-consultas.plb'

--Modificar las siguientes variables en caso de ser necesario.
--En scripts reales no debeń incluirse passwords. Solo se hace para
--propósitos de pruebas y evitar escribirlos cada vez que se quiera ejecutar 
--el proceso de validación de la práctica (propósitos académicos).

--
-- Nombre del usuario empleado en esta práctica
--
define p_usuario='muva_p0903_fx'

--
-- Password del usuario empleado en esta práctica
--
define p_usuario_pass='muva'

--
-- Password del usuario sys
--
define p_sys_password='system'

--
-- Nombre del archivo de respuestas
--
define p_archivo_respuestas='s-07-fx-respuestas.sql'

--Invocando validador
whenever sqlerror exit rollback
set serveroutput on
set verify off
set feedback off
--set echo off

@@&&p_archivo_validador

exit