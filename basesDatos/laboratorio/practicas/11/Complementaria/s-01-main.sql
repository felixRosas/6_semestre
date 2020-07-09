--@Autor(es):       Jorge Rodríguez
--@Fecha creación:  dd/mm/yyyy
--@Descripción:    Creación usuario  practica 11

whenever sqlerror exit rollback
set serveroutput on

Prompt conectando como usuario sys
connect sys as sysdba

--Elimina al usuario en caso de existir
-- se emplea el cursor para evitar excepcion
--en caso de no existir
declare
  cursor cur_usuario is
    select username 
    from dba_users
    where username ='MUVA_P1101_SUBASTAS';
begin
  for u in cur_usuario loop
    dbms_output.put_line('eliminando usuario ');
    execute immediate 'drop user '|| u.username ||' cascade'; 
  end loop;
end;
/

Prompt creando usuario muva_p1101_subastas

create user muva_p1101_subastas identified by muva quota unlimited on users;
grant create session, create table, create procedure, create sequence, create synonym
to muva_p1101_subastas;

Prompt conectando con usuario muva_p1001_subasta (practica 10)
Prompt Otorgando permisos de lectura para el usuario muva_p1101_subastas

connect muva_p1001_subasta/muva

grant select on articulo to muva_p1101_subastas;
grant select on articulo_arqueologico to muva_p1101_subastas;
grant select on articulo_donado to muva_p1101_subastas;
grant select on articulo_famoso to muva_p1101_subastas;
grant select on cliente to muva_p1101_subastas;
grant select on entidad to muva_p1101_subastas;
grant select on factura_cliente to muva_p1101_subastas;
grant select on historico_status_articulo to muva_p1101_subastas;
grant select on pais to muva_p1101_subastas;
grant select on status_articulo to muva_p1101_subastas;
grant select on subasta to muva_p1101_subastas;
grant select on subasta_venta to muva_p1101_subastas;
grant select on tarjeta_cliente to muva_p1101_subastas;

Prompt conectando como muva_p1101_subastas
connect muva_p1101_subastas/muva

Prompt Creando sinónimos

create or replace synonym articulo for muva_p1001_subasta.articulo;
create or replace synonym articulo_arqueologico for muva_p1001_subasta.articulo_arqueologico;
create or replace synonym articulo_donado for muva_p1001_subasta.articulo_donado;
create or replace synonym articulo_famoso for muva_p1001_subasta.articulo_famoso;
create or replace synonym cliente for muva_p1001_subasta.cliente;
create or replace synonym entidad for muva_p1001_subasta.entidad;
create or replace synonym factura_cliente for muva_p1001_subasta.factura_cliente;
create or replace synonym historico_status_articulo for muva_p1001_subasta.historico_status_articulo;
create or replace synonym pais for muva_p1001_subasta.pais;
create or replace synonym status_articulo for muva_p1001_subasta.status_articulo;
create or replace synonym subasta for muva_p1001_subasta.subasta;
create or replace synonym subasta_venta for muva_p1001_subasta.subasta_venta;
create or replace synonym tarjeta_cliente for muva_p1001_subasta.tarjeta_cliente; 

Prompt Listo!.






