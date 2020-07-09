--@Autor(es):       Jorge Rodríguez
--@Fecha creación:  dd/mm/yyyy
--@Descripción:     Creación de objetos

connect muva_p0802_cuentas/muva

create table banco(
    banco_id    number(10, 0)    not null,
    nombre      varchar2(40)     not null,
    constraint banco_fk primary key (banco_id)
)
;



-- 
-- table: cliente 
--

create table cliente(
    cliente_id          number(10, 0)    not null,
    nombre              varchar2(40)     not null,
    ap_paterno          varchar2(40)     not null,
    ap_materno          varchar2(40),
    curp                varchar2(18)     not null,
    fecha_nacimiento    date             not null,
    email               varchar2(200),
    cliente_aval_id     number(10, 0),
    constraint cliente_pk primary key (cliente_id),
    constraint cliente_curp_uk  unique (curp),
    constraint cliente_email_uk  unique (email), 
    constraint cliente_aval_id_fk foreign key (cliente_aval_id)
    references cliente(cliente_id)
)
;


-- 
-- table: cliente 
--

create table cliente_import(
    cliente_id          number(10, 0)    not null,
    nombre              varchar2(40)     not null,
    ap_paterno          varchar2(40)     not null,
    ap_materno          varchar2(40),
    curp                varchar2(18)     not null,
    fecha_nacimiento    date             not null,
    email               varchar2(200),
    cliente_aval_id     number(10, 0),
    constraint cliente_import_pk primary key (cliente_id),
    constraint cliente_import_curp_uk  unique (curp),
    constraint cliente_import_email_uk  unique (email), 
    constraint cliente_import_aval_id_fk foreign key (cliente_aval_id)
    references cliente_import(cliente_id)
)
;


-- 
-- table: estatus_cuenta 
--

create table estatus_cuenta(
    estatus_cuenta_id    number(2, 0)     not null,
    clave                varchar2(20)     not null,
    activo               number(1, 0)     not null,
    descripcion          varchar2(500)    not null,
    constraint estatus_cuenta_pk primary key (estatus_cuenta_id)
)
;



-- 
-- table: cuenta 
--

create table cuenta(
    cuenta_id            number(10, 0)    not null,
    num_cuenta           varchar2(12)     not null,
    tipo                 char(1)          not null,
    saldo                number(15, 2)    not null,
    fecha_estatus        date             not null,
    estatus_cuenta_id    number(2, 0)     not null,
    banco_id             number(10, 0)    not null,
    cliente_id           number(10,0) not null,
    constraint cuenta_pk primary key (cuenta_id),
    constraint cuenta_num_cuenta_uk  unique (num_cuenta), 
    constraint cuenta_banco_id_fk foreign key (banco_id)
    references banco(banco_id),
    constraint cuenta_estatus_cta_id_fk foreign key (estatus_cuenta_id)
    references estatus_cuenta(estatus_cuenta_id),
    constraint  cuenta_cliente_id_fk foreign key(cliente_id)
    references cliente(cliente_id),
    constraint cuenta_tipo_chk check (tipo in('A','I'))
)
;



-- 
-- table: cuenta_ahorro 
--

create table cuenta_ahorro(
    cuenta_id             number(10, 0)    not null,
    nip_cajero            number(4, 0)     not null,
    num_tarjeta_debito    varchar2(16)     not null,
    limite_retiro         number(7, 2)     not null,
    constraint cuenta_ahorro_pk primary key (cuenta_id),
    constraint cta_ahorro_tarjeta_uk  unique (num_tarjeta_debito), 
    constraint refcuenta6 foreign key (cuenta_id)
    references cuenta(cuenta_id)
)
;



-- 
-- table: cuenta_inversion 
--

create table cuenta_inversion(
    cuenta_id            number(10, 0)    not null,
    num_contrato         varchar2(13)     not null,
    fecha_contrato       date             not null,
    total_portafolios    number(2, 0)     not null,
    constraint cuenta_inversion_pk primary key (cuenta_id),
    constraint cta_inversion_contrato_uk  unique (num_contrato), 
    constraint cuenta_inversion_cta_id_fk foreign key (cuenta_id)
    references cuenta(cuenta_id)
)
;



-- 
-- table: historico_estatus_cuenta 
--

create table historico_estatus_cuenta(
    historico_estatus_cuenta_id    number(10, 0)    not null,
    fecha_estatus                   date             not null,
    cuenta_id                       number(10, 0)    not null,
    estatus_cuenta_id               number(2, 0)     not null,
    constraint historico_estatus_cta_pk primary key (historico_estatus_cuenta_id), 
    constraint historico_cta_cta_id_fk foreign key (cuenta_id)
    references cuenta(cuenta_id),
    constraint historico_cta_estatus_id_fk foreign key (estatus_cuenta_id)
    references estatus_cuenta(estatus_cuenta_id)
)
;



-- 
-- table: tipo_portafolio 
--

create table tipo_portafolio(
    tipo_portafolio_id    number(5, 0)     not null,
    clave                 varchar2(50)     not null,
    nombre                varchar2(500)    not null,
    activo                number(1, 0)     not null,
    constraint tipo_portafolio_pk primary key (tipo_portafolio_id)
)
;



-- 
-- table: portafolio_inversion 
--

create table portafolio_inversion(
    tipo_portafolio_id    number(5, 0)     not null,
    cuenta_id             number(10, 0)    not null,
    porcentaje            number(5, 2)     not null,
    plazo                 number(2, 0)     not null,
    constraint portafolio_inversion_pk primary key (tipo_portafolio_id, cuenta_id), 
    constraint portafolio_inv_cuenta_id_fk foreign key (cuenta_id)
    references cuenta_inversion(cuenta_id),
    constraint portafolio_inv_tipo_port_id_fk foreign key (tipo_portafolio_id)
    references tipo_portafolio(tipo_portafolio_id)
)
;


create sequence cliente_seq
    start with 1
    increment by 1
    nominvalue
    nomaxvalue
    cache 20
    noorder
;

-- 
-- sequence: cuenta_seq 
--

create sequence cuenta_seq
    start with 1
    increment by 1
    nominvalue
    nomaxvalue
    cache 20
    noorder
;

-- 
-- sequence: hist_estatus_cta_seq 
--

create sequence hist_estatus_cta_seq
    start with 1
    increment by 1
    nominvalue
    nomaxvalue
    cache 20
    noorder
;



