--@Autor: Alfonso Murrieta Villegas
--@Fecha creación: 19/04/2020
--@Descripción: Creación de roles y usuarios

prompt Proporcionar el password del usuario sys:
connect sys as sysdba

prompt Creacion Usuarios
create user amv_p0701_admin identified by alfonso quota 1G on users;
create user amv_p0701_oper identified by alfonso quota 500m on users;
create user amv_p0701_invitado identified by alfonso quota 0 on users;


prompt Creacion de roles
create role p0701_admin_rol;
grant  create session, create table, create view, create procedure, create sequence to p0701_admin_rol;

create role p0701_basic_rol;
grant create session, create table,create procedure, create sequence  to p0701_basic_rol;

create role p0701_guest_rol;
grant create session, create synonym,create procedure, create sequence  to p0701_guest_rol;


prompt Asigancion de roles

grant p0701_admin_rol to amv_p0701_admin;
grant create sequence, create procedure to amv_p0701_admin;

grant p0701_basic_rol to amv_p0701_oper;
grant create sequence, create procedure to amv_p0701_invitado;

grant p0701_guest_rol to amv_p0701_invitado;
grant create sequence, create procedure to amv_p0701_oper;

prompt Listo!
disconnect;