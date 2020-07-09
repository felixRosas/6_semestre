# Lunes - Semana 4

## Synonym 

Se crea o reemplaza indicando usuario o esquema y posteriormente la tabla

- create or replace synonym emp1 for alfonso0307.empleado;

NOTA: Hay publicos y privados, para hacerlo público

- create or replace public synonym emp1 for alfonso0307.empleado;

## Alter Generalización

    Ejemplo: Agregar columnas:
    - alter table empleado add (comision number(4,2));

    Ejemplo: Modificar columnas:
    - alter table empleado modify (comision number(10,2) default 0.05);

    Ejemplo: Eliminar columnas.
    - alter table empleado drop column comision;

    Ejemplo: Marcar una columna como “unused”
    - alter table puesto set unused column clave;

    Tiempo después:
    - alter table puesto drop unused columns;

    Ejemplo: Renombrar columnas
    - alter table empleado rename column fecha_inicial to fecha_contrato;

    Ejemplo: Marcar una tabla como tabla de solo lectura
    - alter table puesto read only;

    Ejemplo: Agregando constraints
    - alter table empleado add constraint rfc_uk unique(rfc);

    Ejemplo: Deshabilitar constraints
    - alter table empleado disable constraint rfc_uk;

    Ejemplo: Habilitar constraints
    - alter table empleado enable constraint rfc_uk;

    Ejemplo: Eliminando constraints
    - alter table empleado drop constraint rfc_uk;

    Ejemplo: Renombrar una tabla
    - alter table empleado rename to trabajador;

    Ejemplo: Renombrar una tabla
    - alter table empleado rename to trabajador;

## Drop Generalización

Ejemplo: Eliminar una tabla
- drop table puesto; -- ¿por qué Oracle marca error?: Por existir dependencias.

Ejemplo: Eliminar una tabla y sus referencias. -> Las referencias en otras tablas 
- drop table puesto cascade constraints;

Ejemplo: Eliminar una tabla sin posibilidad de recuperar posteriormente.
- drop table trabajador purge;

## Corrigiendo errores de scrip SQL

Eliminar el constraint 
- alter table libro drop constraint libro_pk;

Agregar el constraint
- alter table libro add constraint libro_pk primary key(libro_id); 

Agregar atributo que a su vez es FK / Forma column constraint 
- alter table historico_estatus_libro add libro_id not null
  constraint historico_estatus_libro_libro_id_fk references libro(libro_id);  

Modificando nombre de constraint 
- alter table historico_estatus_libro rename constraint 
  historico_estatus_libro_libro_fk to historico_estatus_libro_libro_id_fk;

Agregar columna
- alter table libro add clave varchar2(10) not null constraint libro_clave_uk unique;

Modificar rango de una columna
- alter table libro modify precio number(6,2);

Quitar constraint Not Null
- alter table libro modify tematica_id null;

La FK está incorrecta, está al revés -> Necesita PL-SQL para iterar sobre cada cliente
mientras podemos eliminar columna (Sólo para cuando no hay datos)

- alter table cliente drop column factura_id; 

Cuando se eimina la columna, también se elimina el constraint FK.

Creando columna y constraint
- alter table factura add cliente_id not null constraint factura_cliente_id_fk 
  references cliente(cliente_id);  

## Ejercicio 2 de tarea 







# TEMA 8 - insert, update, delete, merge 

insert - Agregar datos
update - Actualizar o modificar datos
merge - actualizar o sincronizar tablas 
truncate - similar a delete pero sin condición, directamente sobre toda la tabla 











