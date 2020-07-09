# Ejercicio General 

- Llaves foraneas
- Indices basadas en funciones

create table salon(
salon_id number(10,0) constraint salon_pk primary key
); 

create table cliente(
cliente_id number(10,0) constraint cliente_pk primary key,
nombre varchar2(40) not null   
); 


create table boleto(
boleto_id number(10,0) constraint boleto_pk primary key,
num_asiento number(5,0) not null,
seccion varchar2(5),
salon_id not null constraint boleto_salon_id_fk references 
salon(salon_id),
cliente_id not null constraint boleto_cliente_id_fk references 
cliente(cliente_id)
); 


- La columna de mayor frecuencia en consultas -> 

create unique index boleto_uk on boleto(num_asiento, seccion, salon_id);

create index boleto_cliente_id_ix on boleto(cliente_id);



- BUsqueda e,pleando función y obvio la asginación de la búsqueda es en minúsculas

select * from cliente where lower(nombre) = 'juan';


- Índice basado en funciones 

create index cliente_nombre_ix on 
cliente(lower(nombre));


- Agregar una columna -> modificarla

alter table boleto add fecha_compra date  not null ;


- Formato de fechas 

select sysdate from dual;

select to_date(sysdate,'YYYY/MM/DD') from dual; 

select to_char(sysdate,'YYYY/MM/DD') from dual; 



select * from boleto where to_char(fecha_compra,'YYYY/MM') = '2020/01';

create index boleto_fecha_compra_ix on boleto(to_char(fecha_compra,'YYYY/MM'));


# VISTAS 

- Comúnmente  llamadas tablas virtuales -> simplifican consultas
- Pueden ser utilizadas para tablas muy normalizadas 
- Por seguridad


create or replace view v_empleado as 
select e.empleado_id, e.nombre, pe.porcentaje
from empleado e, pensionada_empleado pe 
where e.empleado_id = pe.empleado_id;

desc v_empleado;




# Sinónimos 

- sirve para identificar objetos sin cambiar el nombre del mismo
- sirve para simplificar por ejemplo ligas cliente -> cliente@liga_bd1

- Sinónimos públicos o privados


24 -> Número de lista 

