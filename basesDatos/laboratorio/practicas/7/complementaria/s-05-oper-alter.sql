--@Autor: Alfonso Murrieta Villegas
--@Fecha creación: 19/04/2020
--@Descripción: Modificación de la estructura de la BD - Caso Pizzas

connect amv_p0701_oper/alfonso;

prompt Creando atributo para subtipos
alter table pizzeria drop column tipo;
alter table pizzeria add ( es_almacen number (1,0) not null, es_sucursal number (1,0) not null);


prompt Modificacion agributo surtir
alter table pizzeria_almacen modify requiere_surtir number(1,0);
alter table pizzeria_almacen add constraint 
pizzeria_almacen_requiere_surtir_chk 
check( requiere_surtir=1 or requiere_surtir=0)


prompt Renombrar y modificar columnas apellidos
alter table empleado rename column ap_pat to ap_paterno;
alter table empleado rename column ap_mat to ap_materno;
alter table empleado modify ap_materno varchar2(40) null;


prompt Cambio en  pedido
alter table status_pedido rename column status_id to status_pedido_id;
alter table pedido rename column status_id to status_pedido_id;


prompt Eliminacion y agregar constrai nt
alter table pizzeria drop constraint pizzeria_empleado_id_fk;
alter table pizzeria drop column empleado_id;
alter table empleado add (pizzeria_id number(10,0) not null);
alter table empleado add constraint empleado_pizzeria_id_fk
foreign key (pizzeria_id) references pizzeria(pizzeria_id);


prompt Pedido cambio
alter table pedido modify importe_total number (10,2);
alter table empleado modify fecha_ing date;
alter table sucursal add (fecha_apertura date default sysdate not null);


prompt Modificación de la clave de la pizzeria_almacen
alter table pizzeria modify (clave varchar2(10));
alter table pizzeria add constraint pizzeria_clave_chk 
check (substr(clave,1,4)='PIZ-' and (substr(clave,5,2)='A-' or substr(clave,5,2)='S-'
or substr(clave,5,3)='AS-') and ((to_number(substr(clave,7,3 )))<999 or (to_number(substr(clave,8,3))<999))
);


prompt Modificaciones debidas para la PK artificial
alter table pedido drop constraint pedido_pk;
alter table pedido rename column num_pedido to pedido_id;
alter table pedido add constraint pedido_pk primary key(pedido_id);

create unique index pedido_pedido_id_idx on pedido(pedido_id,pizzeria_id);


prompt Longitud del numero y nombre de la columna
alter table empleado rename column fecha_ing to fecha_ingreso;
alter table pizzeria modify telefono number(10,0);


prompt Renombrar
rename pizzeria_almacen to almacen;


prompt Secuencia
alter sequence seq_pizzeria
	increment by 4
	minvalue 7
	cache 7
	nocycle
;



prompt PRUEBA MORTAL xd

--1
insert into pizzeria(pizzeria_id,clave,nombre,direccion,
telefono,num_empleados,es_almacen,es_sucursal)
values(1,'PIZ-AS-001','Pizzas Cachos','Av. Juarez 512',5510028938,
200,1,1);
--2
insert into pizzeria(pizzeria_id,clave,nombre,direccion,
telefono,num_empleados,es_almacen,es_sucursal)
values(2,'PIZ-S-002','Pizza Planeta','Av. Constitucion de 1917 10',5513523978,
400,0,1);
--3
insert into empleado(empleado_id,nombre,ap_paterno,ap_materno,
fecha_ingreso,pizzeria_id)
values(1,'Daniel','Lopez',null,sysdate,1);
--4
insert into almacen(pizzeria_id,descripcion,num_refrescos,
num_ingredientes,requiere_surtir)
values(1,'Almacen para pizza planeta',80,100,0);
--5
insert into sucursal(pizzeria_id,fecha_apertura,total_pedidos)
values(2,sysdate,500);
--6
insert into status_pedido(status_pedido_id,clave,descripcion)
values(1,'ACTIVO', 'SOLICITADO');
--7
insert into pedido(pedido_id,importe_total,total_pizzas,total_refrescos,
pizzeria_id,status_pedido_id)
values(1,145.50,1,2,2,1);