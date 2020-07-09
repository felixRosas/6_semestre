--@Autor: Alfonso Murrieta Villegas
--@Fecha creación: 19/04/2020
--@Descripción: Archivo Principal

whenever sqlerror exit rollback;
prompt conectando como sys para eliminar/crear al usuario 
connect sys as sysdba

prompt eliminando al usuario amv_p07_previo en caso de existir 
@s-00-asignaturas-elimina-usuario.sql

prompt creando usuario amv_p07_previo 
@s-01-asignaturas-crea-usuario.sql

prompt conectando como usuario amv_p07_previo
connect amv_p07_previo/alfonso;

prompt creando tablas 
@s-02-asignaturas-ddl.sql


prompt cargando datos 
@s-03-asignaturas-carga-inicial.sql

prompt Listo!



-- Para llamar a los scripts se emplea @