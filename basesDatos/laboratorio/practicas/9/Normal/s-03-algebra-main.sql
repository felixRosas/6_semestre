--@Autor: Alfonso Murrieta Villegas
--@Fecha creación: 124/04/2020
--@Descripción: Main del previo

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

prompt creando usuario 

create user muva_P09_algebra identified by muva quota unlimited on users;

grant create table, create session,create sequence, create procedure to muva_P09_algebra;


prompt conectando al usuario: 

connect muva_P09_algebra/muva

start s-01-algebra-ddl.sql

prompt Segundo script

start s-02-algebra-carga-inicial.sql

prompt Listo

disconnect; 

