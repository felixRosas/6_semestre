--@Autor: Alfonso Murrieta Villegas
--@Fecha creación: 19/04/2020
--@Descripción: Creación de objetos, caso de estudio - Control de Escolar

connect amv_p0701_admin/alfonso;
whenever sqlerror exit rollback;

create table ASIGNATURA(
	asignatura_id number(10,0) not null,
	nombre varchar2(40) not null,
	clave number(4,0) not null,
	creditos number(2,0) not null,
	asignatura_requerida_id number(10,0),
	constraint asignatura_pk primary key (asignatura_id),
	constraint asignatura_asignatura_requerida_fk 
	foreign key (asignatura_requerida_id)
	references asignatura(asignatura_id),
	constraint asignatura_clave_uk unique (clave)
);

create table ESTUDIANTE(
	estudiante_id number(10,0) not null,
	nombre varchar2(40) not null,
	ap_paterno varchar2(40) not null,
	ap_materno varchar2(40),
	num_cuenta number(9,0) not null,
	tipo char not null,
	constraint estudiante_pk primary key (estudiante_id),
	constraint estudiante_tipo_chk check (tipo in ('O','R')),
	constraint estudiante_tipo_num_cuente_chk check(
		(tipo='O' and (to_char(num_cuenta) like '30%'))
		or (tipo='R' and (to_char(num_cuenta) like '31%'))
	),
	constraint estudiante_num_cuenta_uk unique (num_cuenta)
);

-- Subtipos 

create table REGULAR(
	estudiante_id number(10,0) not null,
	semestre  number(2,0) not null,
	promedio_general number(4,2) not null,
	constraint regular_pk primary key (estudiante_id),
	constraint regular_estudiante_id_fk
	foreign key (estudiante_id) references estudiante (estudiante_id)
);

create table OYENTE(
	estudiante_id number(10,0) not null,
	num_recursamientos number(2,0) not null,
	num_extraordinarios number(2,0) not null,
	constraint oyente_pk primary key (estudiante_id),
	constraint oyente_estudiante_id_fk 
	foreign key (estudiante_id) references estudiante(estudiante_id),
	constraint oyente_num_recursamientos_num_extraordinarios_chk
	check ((num_recursamientos+num_extraordinarios)<11)
);

create table OYENTE_ASIGNATURA(
	estudiante_id number(10,0) not null,
	asignatura_id number(10,0) not null,
	fecha_aprobacion date default sysdate not null,
	calificacion number(2,0),
	constraint oyente_asignatura_id 
	primary key (estudiante_id,asignatura_id),
	constraint oyente_asignatura_estudiante_id_fk
	foreign key (estudiante_id) references oyente(estudiante_id),
	constraint oyente_asignatura_asignatura_id_fk
	foreign key (asignatura_id)	references asignatura(asignatura_id),
	constraint oyente_asignatura_calificacion_chk
	check (calificacion <11 and calificacion >4)
);



--Parte final -> Creación de indeces, vistas, secuencias y etc

create index asignatura_asignatura_requerida_idx
on asignatura(asignatura_requerida_id);
create index estudiante_num_cuenta_idx
on estudiante(substr(num_cuenta,3,6));


create or replace view V_ESTUDIANTE as 
	select e.estudiante_id, e.nombre, r.semestre, e.num_cuenta
	from estudiante e, regular r
	where e.estudiante_id=r.estudiante_id;

create sequence seq_estudiante
	start with 10
	increment by 3
	cache 5
	nocycle;

select seq_estudiante.nextval from dual;
select seq_estudiante.currval from dual;
