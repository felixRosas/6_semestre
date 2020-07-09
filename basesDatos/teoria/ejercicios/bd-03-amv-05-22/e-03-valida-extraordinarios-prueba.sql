--@Autor(es):       Jorge Rodríguez
--@Fecha creación:  
--@Descripción:     Script de prueba para validar el trigger tr_valida_extraordinarios
set serveroutput on


Prompt =======================================
Prompt Prueba 1.
prompt Insertando un registro valido (materia no aprobada)
Prompt ========================================

insert into estudiante_extraordinario(
	estudiante_id,num_examen,calificacion,asignatura_id)
values(23,7,null,19);

Prompt OK, prueba 1 exitosa.


Prompt =======================================
Prompt Prueba 2.
prompt Intentando insertar un extraordinario con asignatura aprobada
Prompt ========================================

declare
	v_codigo number;
	v_mensaje varchar2(1000);
begin

	insert into estudiante_extraordinario(estudiante_id,num_examen,calificacion,asignatura_id)
		values(1,1,null,1);
	-- Si se llega a este punto, significa que el trigger no está funcionando, se lanza
	--excepcion
	raise_application_error(-20001,
		' ERROR: Extraordinario con asignatura aprobada.'||
		' El trigger no está funcionando correctamente');
exception
	when others then
    v_codigo := sqlcode;
    v_mensaje := sqlerrm;
    dbms_output.put_line('Codigo:  ' || v_codigo);
    dbms_output.put_line('Mensaje: ' || v_mensaje);
    if v_codigo = -20010 then
    	dbms_output.put_line('OK, prueba 2 Exitosa.');
    else
    	dbms_output.put_line('ERROR, se obtuvo excepción no esperada');
    	raise;
    end if;
end;
/

Prompt =================================================
Prompt Prueba 3.
Prompt Modificando los examenes del estudiante 21
Prompt ==================================================

update estudiante_extraordinario
set calificacion = 10
where estudiante_id = 21
and asignatura_id = 3
and num_examen = 1;

Prompt Validando  inserción en auditoria_extraordinario

declare
	v_count number;
begin
	select count(*) into v_count
	from auditoria_extraordinario
	where estudiante_id = 21
	and asignatura_id = 3
	and  calificacion_nueva = 10
	and  calificacion_anterior = 5;
	if v_count = 0 then
		raise_application_error(-20001,
			'ERROR. No se encontró registro en auditoria_extraordinario');
	end if;
	dbms_output.put_line('OK, Prueba 3 Exitosa.');

end;
/

Prompt =================================================
Prompt Prueba 4.
Prompt intentando eliminar un extraordinario 
Prompt =================================================
declare
	v_codigo number;
	v_mensaje varchar2(1000);
begin 
	delete from estudiante_extraordinario
	where estudiante_id = 21
	and num_examen = 2
	and asignatura_id = 3;
	raise_application_error(-20001, 'ERROR: El trigger permite operaciones delete'); 
exception
	when others then
    v_codigo := sqlcode;
    v_mensaje := sqlerrm;
    dbms_output.put_line('Codigo:  ' || v_codigo);
    dbms_output.put_line('Mensaje: ' || v_mensaje);
    if v_codigo = -20011 then
    	dbms_output.put_line('OK, prueba 4 Exitosa.');
    else
    	dbms_output.put_line('ERROR, se obtuvo excepción no esperada');
    	raise;
    end if;
end;
/

Prompt Prueba concluida, Haciendo Rollback para limpiar la BD.
rollback;
