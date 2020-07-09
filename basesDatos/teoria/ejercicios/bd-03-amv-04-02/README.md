# Valores Incrementales

- "Always" obliga el uso de valores auto incrementales.

- "by default on" permite la generación de un valor en caso que la columna se esté referenciando con un valor nulo 


# Creación de Secuencias 

grant create sequence to user

create sequence my_seq
start with 100
increment by 10
maxvalue 200
minvalue 50
cycle
cache 5


- Tarea boleto identity -> 1.14



create table ejemplo_identity(
    id number generated always as identity
);

- Por defento el max value da el valor permitido la BD


