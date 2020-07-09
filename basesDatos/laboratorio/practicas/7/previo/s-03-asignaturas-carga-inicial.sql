--@Autor: Alfonso Murrieta Villegas
--@Fecha creación: 19/04/2020
--@Descripción: Script de carga inicial

prompt realizando la carga de planes de estudios y asignaturas.

insert into plan_estudios(plan_estudios_id,clave,fecha_aprobacion,fecha_inicio,fecha_fin)
values (1,'PL-001',sysdate,sysdate,sysdate+365);

insert into asignatura(asignatura_id,nombre,creditos,plan_estudios_id)
values (1,'algebra',10,1);

insert into asignatura(asignatura_id,nombre,creditos,asignatura_requerida_id,plan_estudios_id) 
values (2,'algebra lineal',10,1,1);
commit;