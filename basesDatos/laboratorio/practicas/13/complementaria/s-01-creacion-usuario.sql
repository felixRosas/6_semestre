--@Autor(es):       Alfonso Murrieta - Joaquín Valdespino
--@Fecha creación:  22/05/2020
--@Descripción:  Creacion de usuarios y permisos   

whenever sqlerror exit rollback;

prompt Proporcionar el password del usuario sys:
--connect sys as sysdba

set serveroutput on;

-- Para reiniciar TODO 
declare
  v_count number(1,0);
begin
  select count(*) into v_count
  from dba_users
  where username = 'MUVA_P1302_BIBLIO';
  if v_count > 0 then
    dbms_output.put_line('Eliminando usuario existente');
    execute immediate 'drop user muva_p1302_biblio cascade';
  end if;
end;
/

prompt Creacion Usuarios
create user muva_p1302_biblio identified by muva quota unlimited on users;

prompt Asignando privilegios
grant create session, create table, create procedure, create sequence, create trigger to muva_p1302_biblio;

whenever sqlerror continue none;
