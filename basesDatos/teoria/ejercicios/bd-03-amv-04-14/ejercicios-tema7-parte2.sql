
--@Autor:          Jorge A. Rodríguez C
--@Fecha creación:  
--@Descripción:     Script de configuración inicial

--si ocurre un error, la ejecución se detiene.
whenever sqlerror exit;

undefine usuario
undefine password

Prompt Proporcione el Password del usuario  SYS
connect sys as sysdba

Prompt Creando un nuevo usuario Tema 7 - Parte 2
Prompt Proporcione usuario y password

create user &&usuario identified by &&password quota unlimited on users;    
grant create session, create table, create sequence to &usuario;

connect &usuario/&password

-- si ocurre un error, la ejecución se detiene.
-- whenever sqlerror exit rollback; --regresen a estado original

create table factura(
    factura_id       number(10, 0)    not null,
    fecha_factura    date             not null,
    monto_total      float(10)        not null,
    descuento        float(10),
    constraint factura_pk primary key (factura_id)
);

create table cliente(
    cliente_id          number(10, 0)    not null,
    nombre              varchar2(50)     not null,
    apellido_paterno    varchar2(50)     not null,
    apellido_materno    varchar2(50),
    ocupacion_id        number(10, 0)    not null,
    factura_id          number(10, 0)    not null,
    constraint cliente_pk primary key (cliente_id), 
    constraint cliente_factura_id_fk foreign key (factura_id)
    references factura(factura_id)
);

create table editorial(
    editorial_id    number(5, 0)    not null,
    clave           varchar2(50)    not null,
    activo          number(1, 0)    not null,
    constraint editorial_pk primary key (editorial_id)
);

create table estatus_libro(
    estatus_libro_id    number(2, 0)     not null,
    clave               varchar2(20)     not null,
    descripcion         varchar2(255),
    activo              number(1, 0)     not null,
    constraint estatus_libro_pk primary key (estatus_libro_id)
);

create table historico_estatus_libro(
    historico_id        number(2, 0)    not null,
    fecha_estatus       date            not null,
    estatus_libro_id    number(2, 0)    not null,
    constraint h_estatus_libro_pk primary key (historico_id), 
    constraint h_status_libro_status_fk foreign key (estatus_libro_id)
    references estatus_libro(estatus_libro_id)
);

create table tematica(
    tematica_id    number(3, 0)     not null,
    descripcion    varchar2(255),
    clave          varchar2(50)     not null,
    constraint tematica_pk primary key (tematica_id)
);

create table libro(
    libro_id            number(10, 0)    not null,
    precio              number(5, 2)     not null,
    nombre              varchar2(100)    not null,
    fecha_estatus       date             not null,
    editorial_id        number(5, 0)     not null,
    tematica_id         number(3, 0)     not null,
    estatus_libro_id    number(2, 0)     not null,
    constraint libro_pk primary key (nombre), 
    constraint libro_tematica_fk foreign key (tematica_id)
    references tematica(tematica_id),
    constraint libro_status_fk foreign key (estatus_libro_id)
    references estatus_libro(estatus_libro_id),
    constraint libro_editorial_fk foreign key (editorial_id)
    references editorial(editorial_id)
);

create sequence cliente_seq
    start with 1
    increment by 2    
    maxvalue 100000
    cycle    
    noorder
;

whenever sqlerror continue;

Prompt  Configuracion creada con exito.
Prompt  Continuar con los ejercicios del tema.
show user

