--@Autor(es):       Alfonso Murrieta - Joaquín Valdespino
--@Fecha creación:  22/05/2020
--@Descripción:  Datos y etc 

--connect sys as sysdba
whenever sqlerror exit rollback

Prompt creando usuario jrc_p1203_inmuebles
@s-01-creacion-usuario.sql

Prompt conectando como usuario jrc_p1203_inmuebles
connect muva_p1203_inmuebles/muva

Prompt creando objetos
@s-02-inmuebles-ddl.sql

set define off

!curl "https://api.mockaroo.com/api/6ff13690?count=500&key=b71bb7e0" > s-03-carga-cliente.sql
!curl "https://api.mockaroo.com/api/b97d2aa0?count=5&key=b71bb7e0"   > s-03-carga-status-inmueble.sql
!curl "https://api.mockaroo.com/api/c929d5a0?count=250&key=b71bb7e0" > s-03-carga-inmueble.sql
!curl "https://api.mockaroo.com/api/ecad28c0?count=125&key=b71bb7e0" > s-03-carga-renta-inmueble.sql
!curl "https://api.mockaroo.com/api/de641a50?count=125&key=b71bb7e0" > s-03-carga-compra-inmueble.sql


-- Se modifica el formato por default de la fecha para realizar la carga de datos.
alter session set nls_date_format="yyyy-mm-dd hh24:mi:ss";

Prompt realizando la carga de datos
@s-03-carga-cliente.sql
@s-03-carga-status-inmueble.sql
@s-03-carga-inmueble.sql
@s-03-carga-renta-inmueble.sql
@s-03-carga-compra-inmueble.sql

@s-03-carga-pagos.sql
@s-03-carga-historico.sql

set define on

Prompt confirmando cambios
commit;

--Si se encuentra un error, no se sale de SQL *Plus
--no se hace commit ni rollback, es decir, se
--regresa al estado original.

whenever sqlerror continue none
Prompt Listo!