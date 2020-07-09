# Inserción de datos en la tabla

create table nomina(
nomina_id number(10,0) constraint nomina_id_pk primary key,
quincena_id constraint nomina_quincena_id_fk references quincena (quincena_id)
on delete cascade
);

insert into quincena(quincena_id,clave) values (1,'Q01');

insert into nomina(nomina_id, quincena_id) values (100,1);


- Debido a que tenemos on delete cascade -> eliminará todos

delete from quincena where quincena_id=1;

select * from nomina; // este no tendrá nada debido a que se eliminó en cascada



# Caso para visualizar si no tuviera el on cascade


create table nomina(
nomina_id number (10,0) constraint nomina_pk primary key,
quincena_id constraint nomina_quincena_id_fk references quincena(quincena_id)
);


- Al momento de tratar de eliminar el elemento de la quincena, observamos que no se puede debido a la integridad del constraint 
- NOTA: Es importante visualizar el constrait explicitamente 


delete from quincena where quincena_id=1
*
ERROR at line 1:
ORA-02292: integrity constraint (ALFONSO0307.NOMINA_QUINCENA_ID_FK) violated -
child record found

- Recuerda que sí puedes eliminar el del hijo 

delete from nomina where nomina_id = 100;


- NOTA: Para hacer los cambios permanente -> commit;
- NOTA: Para deshacer los cambios -> rollback;