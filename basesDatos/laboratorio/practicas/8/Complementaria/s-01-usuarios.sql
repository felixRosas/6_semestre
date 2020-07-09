--@Autor(es):       Alfonso Murrieta - Joaquín Valdespino
--@Fecha creación:  26/04/2020
--@Descripción:  Creacion de usuarios y permisos   

prompt Proporcionar el password del usuario sys:
connect sys as sysdba

-- Para reiniciar TODO 
declare 
  cursor cur_usuarios is
    select username from dba_users where username like '%_P0802_CUENTAS';
begin
  for r in cur_usuarios loop
    execute immediate 'drop user ' ||r.username||' cascade';
  end loop;
end;
/

prompt Creacion Usuarios
create user muva_p0802_cuentas identified by muva quota unlimited on users;
grant create table, create session, create procedure, create sequence to muva_p0802_cuentas;

prompt Listo!
disconnect;

