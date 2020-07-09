# Martes - Semana 4

## Synonym 
# TEMA 8 - insert, update, delete, merge 

insert - Agregar datos
update - Actualizar o modificar datos
merge - actualizar o sincronizar tablas 
truncate - similar a delete pero sin condición, directamente sobre toda la tabla 

## Inserción en jerarquía

Primero en supertipo y después en subtipo

- Haremos uso de secuencias para el id 

insert into dvd(dvd_id, titulo,precio,tipo,fecha_recepcion, fecha_registro)
values(seq_dvd.nextval,'Cars',89.34,'P',to_date('10/10/2016','dd/mm/yyyy'),default);

insert into pelicula(dvd_id,sinopsis)
values(seq_dvd.currval,'Crros con vida ');


## Copiar datos de una tabla e incluso la estructura de la tabla

create table cliente as  
select cliente_id, nombre,ap_paterno, ap_materno, email,fecha_nacimiento
from cliente_import;


## Modificar datos de la tabla 

- Tenemos que pasar los nombres de los usuarios con correos de gmail donde sus nombres de minúsculas a mayúsculas

update cliente 
set nombre=upper(nombre)
where email like '%gmail.com';

- fecha de nacimiento de los clientes de julio 

update cliente
set fecha_nacimiento=fecha_nacimiento+1
where to_char(fecha_nacimiento,'mm')='07';


- Modifcar los datos como N/A a los nulos en ap_materno

update cliente
set ap_materno='N/A'
where ap_materno is null;

## Sincronizar datos

- Insert para que una tabla tenga aparte de la estructura distinta, también los datos

insert into cliente(cliente_id, nombre,ap_paterno, ap_materno, email,fecha_nacimiento)
values (seq_cliente.nextval,'Alfonso','Murrieta','Villegas','alfonso@gmail.com',sysdate);


- Syncronizar mediante MERGE
  - ci es la destino

merge into cliente_import ci 
using cliente c
on (c.cliente_id = ci.cliente_id)
when matched then 
update set ci.nombre = c.nombre,ci.ap_paterno=c.ap_paterno,
ci.ap_materno=c.ap_materno,ci.email=c.email,ci.fecha_nacimiento=c.fecha_nacimiento
when not matched then 
insert(ci.cliente_id, ci.nombre,ci.ap_paterno, ci.ap_materno, ci.email,ci.fecha_nacimiento)
values(c.cliente_id, c.nombre,c.ap_paterno, c.ap_materno, c.email,c.fecha_nacimiento);



- Registro no era pelicula sino musical -> subconsulta

delete from pelicula
where dvd_id=(select dvd_id from dvd where titulo='Cars');

insert into musical(dvd_id,artista) values((select dvd_id from dvd where titulo='Cars'),'David');

## Truncate

create table cliente_export as select * from cliente where l=0;

- Genera sobre la copia viejita 

- Transacción viva 

create table test (id number,nombre varchar2(20));
insert into test values(1,'Alfonso');

- Para que termine hacemos explicitamente mediante commit o rollback

update test set nombre='Eduardo' where id = '1';
alter table test add ap_paterno varchar2(20);

- Las instrucciones dll finaliza implicitamente cualquier movimiento (Es como si hicieramos commit )











