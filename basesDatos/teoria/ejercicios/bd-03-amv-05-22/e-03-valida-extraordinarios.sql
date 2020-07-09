--@Autor(es):       Alfonso Murrieta
--@Fecha creación: 12/05/20
--@Descripción:  Trigger - ejercicio 3


set serveroutput on

create or replace trigger tr_valida_extraordinario
    before insert
    or update of  calificacion
    or delete 
    on estudiante_extraordinario-- tablas a las que se aplica
    for each row 
declare
    v_count number;
begin 
    case 
        when inserting then
            select count(*) into v_count -- select sin cursor regresa un registro sino usar cursor y asignarlo a una variable
            from estudiante_inscrito ei --como asignatura está en curso -> join (alias)
            join curso c 
            on ei.curso_id = c.curso_id
            where ei.calificacion > 5
            and c.asignatura_id = :new.asignatura_id --como no hay registro viejo usamos el nuevo que se creará
            and ei.estudiante_id = :new.estudiante_id;
            if v_count > 0 then 
                raise_application_error(-20010,'Estudiate ' 
                    || :new.estudiante_id
                    || ' ya acreditó la asignatura '
                    || :new.asignatura_id
                );
            end if;
        when updating('calificacion') then 
            insert into auditoria_extraordinario(auditoria_extraordinario_id,
                fecha_cambio,usuario,
                calificacion_anterior,
                calificacion_nueva,
                estudiante_id,
                asignatura_id
            )
            values(auditoria_extraordinario_seq.nextval,
                sysdate,sys_context('USERENV','SESSION_USER'), --para saber el usuario con el que se cambia
                :old.calificacion,
                :new.calificacion,
                :new.estudiante_id,
                :new.asignatura_id
            );
        when deleting then 
            raise_application_error(-20011,'Las calificaciones no se pueden eliminar');
            --Excepciones propias, además de que van del -20000 al  -21000
    end case;
end;
/
show errors 
--Ponerlo siempre para triggers 



