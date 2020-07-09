# CREACIÓN DE TABLAS con varios constraints

- Creación de tabla con la siguiente sintaxis y patrón :

name tipo  constraint tabla_nameCol_tipoconstraint tipoconstraint (parameters)

create table puesto(
puesto_id number(2,0) constraint puesto_pk primary key,
nivel char not null constraint  puesto_nivel_chk check (nivel in ('a','b','c')),
clave varchar2(3) not null constraint puesto_clave_uk unique,
sueldo number(8,2) not null constraint puesto_sueld_chk check (sueldo <100000)
);


- Alternativa sintáctica, cambiar el nombre del constraint 

create table puesto_tc(
puesto_id number(10,0),
nivel char(1) not null,
clave varchar2(3) not null,
sueldo number(8,2),
constraint puesto_tc_pk primary key (puesto_id),
constraint puesto_tc_nivel_chk check (nivel = 'a' or nivel = 'b' or nivel = 'c'),
constraint puesto_tc_clave_uk unique (clave),
constraint puesto_tc_sueldo_chk check (sueldo <100000),
constraint puesto_tc_sueldo_nn check (sueldo is not null)
);

- Pregunta: 

1) Realmente el not null en Oracle se maneja como constraint ya sea explictamente como implicitamente


- Diccionario de constraints donde confirmamos lo de la pregunta 

select CONSTRAINT_NAME, CONSTRAINT_TYPE, SEARCH_CONDITION
from USER_CONSTRAINTS
where TABLE_NAME = 'PUESTO_TC';

- Objetos creados 

desc USER_OBJECTS

select object_name, object_type, created, status
from USER_OBJECTS;



# CREACIÓN DE TABLAS con FK

- Tabla hija -> por ello el fk

create table empleado(
nombre varchar2(40),
empleado_id number(10,0) constraint empleado_pk primary key,
puesto_id constraint empleado_puesto_id_fk  references puesto(puesto_id)
);


- En esta versión podemos cambiar el nombre de la FK en la linea 4 y en la 5 en la que está en parentesis  -> sirve para recursivas

create table empleado_tc(
nombre varchar2(40),
empleado_id number(10,0) constraint empleado_tc_pk primary key,
puesto_id number (10,0) not null,
constraint empleado_tc_puesto_id_fk foreign key (puesto_id) references puesto(puesto_id)
);


# CREACIÓN DE TABLAS con llaves compuestas


- Previa para la compuesta

create table pensionada(
pensionada_id number(10,0) constraint pensionada_pk primary key,
nombre varchar2(40) not null
);


- Tabla intermedia con llaves compuestas

- El primero es column constraint y el segundo es table constraint 
- Tercero es para la compuesta

create table pensionada_empleado(
pensionada_id number(10,0) constraint pensionada_empleado_pensionada_id_fk references pensionada(pensionada_id),
empleado_id number(10,0),
porcentaje number(5,2) not null,
constraint pensionada_empleado_empleado_id_fk foreign key (empleado_id) references empleado(empleado_id),
constraint pensionada_empleado_pk primary key (pensionada_id, empleado_id)
);

# CREACIÓN DE TABLAS con llave artificial

create table pensionada_empleado_artificial(
pensionada_empleado_id number(10,0) constraint pensionada_empleado_a_pk primary key,
pensionada_id number(10,0) constraint pensionada_empleado_pensionada_id_a_fk references pensionada(pensionada_id),
empleado_id number(10,0),
porcentaje number(5,2) not null,
constraint pensionada_empleado_empleado_id_a_fk foreign key (empleado_id) references empleado(empleado_id),
constraint pensionada_empleado_uk unique (pensionada_id, empleado_id)
);


# CREACIÓN Restricciones de Integridad refrencial -> Sólo con llaves foraneas foreign keys 

- El "on delete" se pone en la hija debido a que tiene la FK

- Tabla padre

create table quincena(
quincena_id number(10,0) constraint quincena_pk primary key,
clave varchar2(3) not null
);

- Tabla hija

create table nomina(
nomina_id number(10,0) constraint nomina_id_pk primary key,
quincena_id constraint nomina_quincena_id_fk references quincena (quincena_id)
on delete cascade
);





