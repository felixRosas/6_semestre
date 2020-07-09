# CREACIÓN DE TABLAS TEMPORALES

- Se crean sólamente en sesión y en memoria

NOTAS:
- rollback sirve para deshacer todos los cambios
- commit es para terminar la transacción
- La tabla la pueden ver todos pero los datos son privados y sólo en la instancia o sesión donde se insertaron* 


create global temporary table empleado_temp( 
empleado_id number(10,0) not null, 
nombre varchar2(20) 
) on commit preserve rows;


//Tarea 

usar on commit delete rows

1 create global temporary table empleado_temp( empleado_id number(10,0) not null, nombre varchar2(20) ) on commit delete rows;

2 insert ...

3 select ...

4 commit ...

5 select -> no deberían existir datos

############################
# CREACIÓN DE COLUMNAS VIRTUALES

- Sirven para atributos derivados  -> Sólo sirven para calcular pero no se guardan en la BD

create table calculo_sueldo(
fecha_calculo date not null,
sueldo_mensual number(10,2) not null,
sueldo_quincenal number(10,2) generated always as (sueldo_mensual/2) virtual,
iva number(10,0) as (sueldo_mensual*0.16)
);

############################
# USO DE DEFAULT

- Asignar valores por defecto

create table incidencia (
descripcion varchar2(20) not null,
fecha_registro date default sysdate,
tipo char default 'N',
descuento number(5,2) default 5
);








