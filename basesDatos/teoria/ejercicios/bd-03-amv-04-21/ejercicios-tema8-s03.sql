--Creacion de la tabla PROD para revisar el concepto
-- de control transaccional.
--
Prompt creando tabla PROD
create table prod(
	prod_id number(10,0) constraint prod_pk primary key,
	cantidad number(5,0)
);

Prompt realizando  carga inicial
insert into prod(prod_id,cantidad) values(1001,30);
insert into prod(prod_id,cantidad) values(1002,20);
insert into prod(prod_id,cantidad) values(1003,15);
insert into prod(prod_id,cantidad) values(1004,5);
insert into prod(prod_id,cantidad) values(1005,12);

Prompt creando tabla concierto
create table  concierto (
	num_asiento number(3,0) not null,
	ocupado number(1,0) not null,
	nombre varchar2(20)
);

insert into concierto(num_asiento,ocupado) values(1,0);
insert into concierto(num_asiento,ocupado) values(2,0);
insert into concierto(num_asiento,ocupado) values(3,0);
commit;

Prompt Listo!.

