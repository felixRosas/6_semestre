--@Autor: Alfonso Murrieta Villegas
--@Fecha creación: 19/04/2020
--@Descripción: Creación de sinónimos

connect amv_p0701_admin/alfonso;
grant select on estudiante to amv_p0701_invitado;

connect amv_p0701_invitado/alfonso;
create or replace synonym S_Alumno for amv_p0701_admin.estudiante;
select * from S_Alumno;