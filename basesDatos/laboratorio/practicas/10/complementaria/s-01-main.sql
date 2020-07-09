--@Autor(es):       Alfonso Murrieta - Joaquín Valdespino
--@Fecha creación:  01/05/2020
--@Descripción:  Creacion de usuarios y permisos   

whenever sqlerror exit rollback;

prompt Proporcionar el password del usuario sys:
connect sys as sysdba

set serveroutput on;

-- Para reiniciar TODO 
declare 
  cursor cur_usuarios is
    select username from dba_users where username like '%_P1001_SUBASTA';
begin
  for r in cur_usuarios loop
    execute immediate 'drop user ' ||r.username||' cascade';
  end loop;
end;
/

prompt Creacion Usuarios
create user muva_p1001_subasta identified by muva quota unlimited on users;


prompt Asignando privilegios
grant create table, create session, create procedure, create sequence to muva_p1001_subasta;


prompt Conectando al usuario y creando entorno
connect muva_p1001_subasta/muva

--tablas
@s-02-ddl.sql

--carga inicial
@s-03-carga-inicial.sql

commit;

prompt Listo!
disconnect;

whenever sqlerror continue none;
