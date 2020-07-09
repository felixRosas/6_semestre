-- 
-- table: libro 
--

create table libro(
    libro_id            number(10, 0)     not null,
    titulo              varchar2(500)     not null,
    autores             varchar2(1000)    not null,
    isbn                varchar2(40)      not null,
    anio_publicacion    number(4, 0)      not null,
    num_revisiones      number(8, 0)      not null,
    imagen_url          varchar2(4000)    not null,
    tipo                char(1)           not null,
    constraint pk1 primary key (libro_id)
)
;


-- 
-- table: biblioteca 
--

create table biblioteca(
    biblioteca_id    number(2, 0)      not null,
    clave            varchar2(10)      not null,
    nombre           varchar2(100)     not null,
    direccion        varchar2(4000)    not null,
    constraint pk7 primary key (biblioteca_id)
)
;



-- 
-- table: asignacion_libro 
--

create table asignacion_libro(
    asignacion_libro_id    number(10, 0)    not null,
    num_copias             number(3, 0)     not null,
    clave_sala             varchar2(4)      not null,
    num_anaquel            number(2, 0)     not null,
    libro_id               number(10, 0)    not null,
    biblioteca_id          number(2, 0)     not null,
    constraint pk8 primary key (asignacion_libro_id), 
    constraint reflibro1 foreign key (libro_id)
    references libro(libro_id),
    constraint refbiblioteca2 foreign key (biblioteca_id)
    references biblioteca(biblioteca_id)
)
;



-- 
-- table: lector 
--

create table lector(
    lector_id     number(10, 0)    not null,
    nombre        varchar2(40)     not null,
    ap_paterno    varchar2(40)     not null,
    ap_materno    varchar2(40)     not null,
    num_cuenta    varchar2(18)     not null,
    constraint pk2 primary key (lector_id)
)
;



-- 
-- table: status_prestamo 
--

create table status_prestamo(
    status_prestamo_id    number(2, 0)    not null,
    clave                 varchar2(30)    not null,
    descripcion           varchar2(100)    not null,
    constraint pk9 primary key (status_prestamo_id)
)
;



-- 
-- table: prestamo 
--

create table prestamo(
    prestamo_id           number(10, 0)    not null,
    fecha_status          timestamp(6)     not null,
    lector_id             number(10, 0)    not null,
    status_prestamo_id    number(2, 0)     not null,
    biblioteca_id         number(10,0)     not null,
    constraint pk3 primary key (prestamo_id), 
    constraint reflector5 foreign key (lector_id)
    references lector(lector_id),
    constraint refstatus_prestamo8 foreign key (status_prestamo_id)
    references status_prestamo(status_prestamo_id),
    constraint refbiblioteca_prestamo foreign key (biblioteca_id)
    references biblioteca(biblioteca_id)
)
;



-- 
-- table: detalle_prestamo 
--

create table detalle_prestamo(
    detalle_prestamo_id    varchar2(40)     not null,
    num_dias               number(2, 0)     not null,
    fecha_vencimiento      timestamp(6)     not null,
    multa_por_pagar        number(8, 2),
    prestamo_id            number(10, 0)    not null,
    libro_id               number(10, 0)    not null,
    constraint pk4 primary key (detalle_prestamo_id), 
    constraint refprestamo6 foreign key (prestamo_id)
    references prestamo(prestamo_id),
    constraint reflibro7 foreign key (libro_id)
    references libro(libro_id)
)
;



-- 
-- table: libro_comprado 
--

create table libro_comprado(
    libro_id            number(10, 0)    not null,
    fecha_compra        timestamp(6)     not null,
    num_factura         varchar2(18)     not null,
    precio_unitario     number(8, 2)     not null,
    copias_compradas    number(2, 0)     not null,
    constraint pk5 primary key (libro_id), 
    constraint reflibro3 foreign key (libro_id)
    references libro(libro_id)
)
;



-- 
-- table: libro_donado 
--

create table libro_donado(
    libro_id            number(10, 0)    not null,
    nombre_donante      varchar2(200)    not null,
    email_donante       varchar2(200)    not null,
    telefono_donante    varchar2(40)     not null,
    fecha_donacion      timestamp(6)     not null,
    constraint pk6 primary key (libro_id), 
    constraint reflibro4 foreign key (libro_id)
    references libro(libro_id)
)
;



