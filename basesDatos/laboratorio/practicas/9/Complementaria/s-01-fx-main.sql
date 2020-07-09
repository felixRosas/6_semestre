--@Autor: Alfonso Murrieta - Joaquin Valdespino
--@Fecha creacion: 1/05/2020
--@Descripción; Main de la parte complementaria

whenever sqlerror exit rollback;

Prompt conectando a sys
connect sys as sysdba

Prompt Crear usuario

declare 
	cursor cur_usuarios is
		select username from dba_users where username ='SRC_P0903_FX';
		begin
		for r in cur_usuarios loop
		execute immediate 'drop user ' ||r.username||' cascade';
	end loop;
end;
/

create user muva_p0903_fx identified by muva quota unlimited on users;


Prompt asignando privilegios
grant create session, create table, create sequence, 
	create view, create procedure to muva_p0903_fx;

connect muva_p0903_fx /muva

@s-02-fx-ddl.sql

set define off
@s-03-fx-carga-inicial.sql
set define on

commit;


