--@Autor(es):       Jorge Rodríguez
--@Modificado:      Alfonso Murrita Villegas
--@Fecha modificación:  19/04/2020
--@Descripción:    Modificación de la estructura de la BD - Caso Pizzas

connect amv_p0701_oper/alfonso

create sequence seq_pizzeria
    start with 10
    increment by 3
    minvalue 5
    maxvalue 10000000
    cache 3
    noorder
    cycle
;

create table empleado(
    empleado_id number(10, 0) not null,
    nombre varchar2(40) not null,
    ap_pat varchar2(40) not null,
    ap_mat varchar2(40) not null,
    fecha_ing number(10, 2) not null,
    constraint empleado_pk primary key (empleado_id)
);

create table pizzeria(
    pizzeria_id      number(10, 0)    not null,
    clave            varchar2(7)      not null,
    nombre           varchar2(40)     not null,
    direccion        varchar2(100)    not null,
    telefono         number(10, 0)    not null,
    num_empleados    number(10, 0)    not null,
    tipo             varchar2(1)      not null,
    empleado_id      number(10, 0)    not null,
    constraint pizzeria_pk primary key (pizzeria_id), 
    constraint pizzeria_empleado_id_fk foreign key (empleado_id)
    references empleado(empleado_id)
);

create table pizzeria_almacen(
    pizzeria_id         number(10, 0)    not null,
    descripcion         varchar2(100)    not null,
    num_refrescos       number(10, 0)    not null,
    num_ingredientes    number(10, 0)    not null,
    requiere_surtir     varchar2(40)     not null,
    constraint almacen_pk primary key (pizzeria_id), 
    constraint almacen_pizzeria_id_fk foreign key (pizzeria_id)
    references pizzeria(pizzeria_id)
);

create table sucursal(
    pizzeria_id      number(10, 0)    not null,
    total_pedidos    number(10, 0)    not null,
    constraint sucursal_pk primary key (pizzeria_id), 
    constraint sucursal_pizzeria_id_fk foreign key (pizzeria_id)
    references pizzeria(pizzeria_id)
);

create table status_pedido(
    status_id      number(10, 0)    not null,
    clave          varchar2(10)     not null,
    descripcion    varchar2(40)     not null,
    constraint status_pedido_pk primary key (status_id)
);

create table pedido(
    num_pedido         number(10, 0)    not null,
    pizzeria_id        number(10, 0)    not null,
    importe_total      date             not null,
    total_pizzas       number(10, 0)    not null,
    total_refrescos    number(10, 0)    not null,
    status_id          number(10, 0)    not null,
    constraint pedido_pk primary key (num_pedido, pizzeria_id),
    constraint pedido_pizzeria_id_fk foreign key (pizzeria_id)
    references sucursal(pizzeria_id),
    constraint pedido_status_id_fk foreign key (status_id)
    references status_pedido(status_id)
);
        
Prompt Done :D!

disconnect





