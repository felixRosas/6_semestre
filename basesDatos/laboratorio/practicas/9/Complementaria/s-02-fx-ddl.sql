--@Autor(es):       Jorge Rodríguez
--@Fecha creación:  dd/mm/yyyy
--@Descripción:    Práctica 09 complementaria - DDL


create table aeropuerto(
    id                  number(8, 0)      not null,
    clave               varchar2(10)      not null,
    nombre              varchar2(500)     not null,
    tipo                varchar2(50)      null,
    latitud             number(10, 7)     not null,
    longitud            number(10, 7)     not null,
    elevacion           number(6, 0)      null,
    pais_iso            varchar2(4)       not null,
    region_iso          varchar2(6)       not null,
    municipio           varchar2(100)     null,
    con_programacion    varchar2(3)       not null,
    codigo_gps          varchar2(5),
    codigo_iata         varchar2(5),
    codigo_local        varchar2(5),
    pagina_web          varchar2(4000),
    wikipedia_link      varchar2(4000),
    descripcion         varchar2(4000),
    ultima_revision     date       not null,
    constraint aeropuerto_pk primary key (id)
)
;



