--@Autor(es):       Jorge Rodríguez
--@Fecha creación:  dd/mm/yyyy
--@Descripción:    Práctica 12 Complementaria - Validador, script inicial.

define p_archivo_validador_main='s-07-validador-main.sql'

--Modificar las siguientes variables en caso de ser necesario.
--En scripts reales no debeń incluirse passwords. Solo se hace para
--propósitos de pruebas y evitar escribirlos cada vez que se quiera ejecutar 
--el proceso de validación de la práctica (propósitos académicos).

--
-- Nombre del usuario empleado en esta práctica
--
define p_usuario='muva_p1203_inmuebles'

--
-- Password del usuario empleado en esta práctica
--
define p_usuario_pass='muva'


-- ==============La siguiente configuracion no requiere cambios ===========

--Invocando validador

whenever sqlerror exit rollback
set serveroutput on
set verify off
set feedback off

Prompt =========================================================
Prompt Iniciando validador - Práctica 12 complementaria
Prompt Presionar Enter si los valores configurados son correctos.
Prompt De lo contario editar el archvo &&p_archivo_validador_main 
Prompt O en su defecto proporcionar nuevos valores
Prompt =========================================================

accept p_usuario default &&p_usuario  prompt '* Nombre de usuario de la práctica [&&p_usuario]: '
accept p_usuario_pass default  &&p_usuario_pass  prompt '* Password para &p_usuario [configurado en script]: ' hide

connect &&p_usuario/&&p_usuario_pass

set serveroutput on
@@s-00-funciones-validacion.plb
exec spv_print_header
define p_archivo_validador='s-07p-validador-crea-inmueble.plb'
@@&&p_archivo_validador
define p_archivo_validador='s-07p-validador-actualiza-pagos.plb'
@@&&p_archivo_validador
define p_archivo_validador='s-07p-validador-aval.plb'
@@&&p_archivo_validador

exit