--@Autor: Alfonso Murrieta Villegas
--@Fecha creación: 19/04/2020
--@Descripción: Creación de usuarios

create user amv_p07_previo identified by alfonso quota unlimited on users;
grant create table, create session, create sequence, create procedure to amv_p07_previo;