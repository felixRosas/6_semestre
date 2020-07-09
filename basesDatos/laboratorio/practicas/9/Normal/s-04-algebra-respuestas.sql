--@Autor: Alfonso Murrieta - Joaquin Valdespino
--@Fecha creacion: 1/05/2020
--@Descripción: Consultas y algebra relacional



--Ejercicio 1
--connect muva_p09_algebra/muva

Prompt Ejercicios 

create table consulta_1 as
  select nombre, creditos, asignatura_requerida_id
  from (
      select * 
      from asignatura 
      where creditos >=9
  );

--Ejercicio 2 
create table consulta_2 as
  select * from plan_estudios
  where fecha_fin < sysdate;

--EJercicio 3
create table consulta_3 as
  select clave_grupo,asignatura_id
  from (
    select *
    from curso
    where cupo_maximo=30
    intersect(
      select *
      from curso
      where asignatura_id=13
      union
      select *
      from curso
      where asignatura_id=11
    )
);

--Ejercicio 4
create table consulta_4 as
  select * from
  (
    select * from profesor
    where apellido_paterno='FLORES'
    union all
    select * from profesor
    where apellido_materno='GUTIERREZ'
    union all
    select * from profesor
    where nombre='HUGO'
  );
select * from consulta_4;


--Ejercicio 5
create table consulta_5 as 
  select estudiante_id
  from(
      select *
      from ESTUDIANTE_INSCRITO
      where calificacion=10   
  )
  minus
  select estudiante_id
  from estudiante
  where plan_estudios_id=2;
select * from consulta_5;


--Ejercicio 6
create table consulta_6 as
select lower(nombre) as "Nombre de la asignatura", creditos as "créditos actuales", (creditos+2) as "Créditos propuestos"
from(
  select * from asignatura
  where ASIGNATURA_REQUERIDA_ID is not null
  intersect 
  select * from asignatura
  where CREDITOS<=8
)order by "Créditos propuestos" desc;

select * from consulta_6;

--Ejercicio 7
create table consulta_7 as
  select curso_id, cupo_maximo, nombre from
  (select *
    from curso c, asignatura a 
    where c.ASIGNATURA_ID=a.ASIGNATURA_ID
    )where CLAVE_GRUPO='001';

select * from consulta_7;



select count(*) from consulta_1;
select count(*) from consulta_2;
select count(*) from consulta_3;
select count(*) from consulta_4;
select count(*) from consulta_5;
select count(*) from consulta_6;
select count(*) from consulta_7;
select * from consulta_1;
select * from consulta_2;
select * from consulta_3;
select * from consulta_4;
select * from consulta_5;
select * from consulta_6;
select * from consulta_7;

commit;
