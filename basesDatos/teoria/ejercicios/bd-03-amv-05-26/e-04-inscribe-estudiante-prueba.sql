--@Autor(es):       Alfonso Murrieta
--@Fecha creación: 26/05/20
--@Descripción:  Prueba script

set serveroutput on

Prompt =======================================
Prompt Prueba 1.
prompt Estudiante cursa materia
Prompt =======================================

declare
	v_estudiante_id estudiante_inscrito.estudiante_id%type;
	v_asignatura_id curso.asignatura_id%type;
	v_clave_grupo curso.clave_grupo%type;
	v_semestre_id curso.semestre_id%type;
	--Variables de salida
	v_curso_id curso.curso_id%type;
	v_resultado number(1,0);
begin
	--Cursando asignatura
	select ei.estudiante_id, c.asignatura_id, c.clave_grupo, c.semestre_id
	into v_estudiante_id, v_asignatura_id, v_clave_grupo,v_semestre_id
	from estudiante_inscrito ei
	join curso c
	on c.curso_id=ei.curso_id
	where ei.calificacion is null
	and rownum=1; --Delimitar

	sp_inscribe_estudiante(v_estudiante_id,v_semestre_id,v_asignatura_id,
		v_clave_grupo,v_curso_id,v_resultado);

	if v_resultado =-2 then 
		dbms_output.put_line('OK, prueba 1 exitosa');
	else
		raise_application_error(-20001,'ERROR: CÓDIGO NO ESPERADO'||v_resultado);
	end if;
end;
/

Prompt =======================================
Prompt Prueba 2.
prompt el estudiante ya cursó la materia
Prompt =======================================

declare
	v_estudiante_id estudiante_inscrito.estudiante_id%type;
	v_asignatura_id curso.asignatura_id%type;
	v_clave_grupo curso.clave_grupo%type;
	v_semestre_id curso.semestre_id%type;
	--Variables de salida
	v_curso_id curso.curso_id%type;
	v_resultado number(1,0);
begin
	--Cursando asignatura
	select ei.estudiante_id, c.asignatura_id, c.clave_grupo, c.semestre_id
	into v_estudiante_id, v_asignatura_id, v_clave_grupo,v_semestre_id
	from estudiante_inscrito ei
	join curso c
	on c.curso_id=ei.curso_id
	where ei.calificacion > 5
	and rownum=1; --Delimitar

	sp_inscribe_estudiante(v_estudiante_id,v_semestre_id,v_asignatura_id,
		v_clave_grupo,v_curso_id,v_resultado);

	if v_resultado =-1 then 
		dbms_output.put_line('OK, prueba 2 exitosa');
	else
		raise_application_error(-20001,'ERROR: CÓDIGO NO ESPERADO'||v_resultado);
	end if;
end;
/


Prompt =======================================
Prompt Prueba 3.
prompt estudiante tiene materia reprobada
Prompt =======================================

declare
	v_estudiante_id estudiante_inscrito.estudiante_id%type;
	v_asignatura_id curso.asignatura_id%type;
	v_clave_grupo curso.clave_grupo%type;
	v_semestre_id curso.semestre_id%type;
	--Variables de salida
	v_curso_id curso.curso_id%type;
	v_resultado number(1,0);
begin
	--Cursando asignatura
	select ei.estudiante_id, c.asignatura_id, c.clave_grupo, c.semestre_id
	into v_estudiante_id, v_asignatura_id, v_clave_grupo,v_semestre_id
	from estudiante_inscrito ei
	join curso c
	on c.curso_id=ei.curso_id
	where ei.calificacion = 5
	and rownum=1; --Delimitar

	sp_inscribe_estudiante(v_estudiante_id,v_semestre_id,v_asignatura_id,
		v_clave_grupo,v_curso_id,v_resultado);

	if v_resultado =0 then 
		dbms_output.put_line('OK, el estudiante fue inscrito');

	else
		raise_application_error(-20001,'ERROR: CÓDIGO NO ESPERADO'||v_resultado);
	end if;

    if v_curso_id =1 then 
		dbms_output.put_line('OK, el estudiante fue inscrito en el curso'|| v_curso_id);
        
	else
		raise_application_error(-20001,'ERROR: CÓDIGO NO ESPERADO'||v_resultado);
	end if;


end;
/


Prompt =======================================
Prompt Prueba 4.
prompt el estudiante nunca ha cursado la materia
Prompt =======================================



Prompt =======================================
Prompt Prueba 5.
prompt el estudiante se inscribe en el grupo
Prompt =======================================





Prompt =======================================
Prompt Prueba 6.
prompt NO hay cupo, no se inscribe
Prompt =======================================






rollback;