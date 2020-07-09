--@Autor(es):       Alfonso Murrieta
--@Fecha creación: 26 y 28 /05/20
--@Descripción:  Ejercicio 5 tema 10 

set serveroutput on 

create or replace procedure sp_reporte_calificaciones(
	p_semestre_id in number, 
	p_num_registros out number
) is
v_estudiante_id estudiante.estudiante_id%type;
v_nombre varchar2(100);
v_asignatura asignatura.nombre%type;
v_antecedente asignatura.nombre%type;
v_calificacion estudiante_inscrito.calificacion%type;
v_promedio number(3,1);
cur_resultado sys_refcursor; --variable para crear un cursor
cursor cur_reporte is
	select e.estudiante_id, e.nombre 
		|| ' '
		|| e.apellido_paterno
		|| ' '
		|| e.apellido_materno as nombre_completo, 
		a.nombre as asignatura, ar.nombre as antecedente,
		ei.calificacion, (
			select round(avg(ei.calificacion),1)
			from estudiante_inscrito ei
			where ei.curso_id = c.curso_id
		) as promedio_global
	from estudiante e, estudiante_inscrito ei, curso c, asignatura a, asignatura ar
	where e.estudiante_id = ei.estudiante_id
	and ei.curso_id = c.curso_id
	and c.asignatura_id = a.asignatura_id
	and a.asignatura_requerida_id = ar.asignatura_id(+)
	and c.semestre_id = p_semestre_id
	and ei.calificacion > (
			select round(avg(ei.calificacion), 1)
			from estudiante_inscrito ei
			where ei.curso_id = c.curso_id
		);
v_count number;
begin
	---creando la tabla resultado_reporte
	---sql dinámico (las sentencias DML no necesitan ser dinámicas)
	begin
		execute immediate
		'create table resultado_reporte(
				estudiante_id number(2,0),
				nombre_completo varchar2(100),
				asignatura varchar2(50),
				antecedente varchar2(50),
				calificacion number(3,1),
				promedio_global number(3,1),
				semestre_id number(2,0)
		)';
	exception 
		when others then
			--código -995 indica tabla existente
			--sqlcode indica el codigo de excepcion que se generó
			if sqlcode = -995 then 
				dbms_output.put_line('La tabla ya existe, eliminando datos.');
				--La instrucción DELETE, a pesar de ser DML, debe ser dinámica ya que en 
				--tiempo de compilación la tabla puede no existir. El código sql dinámico
				--no se verifica en tiempo de compilación. 
				execute immediate 
				'	delete from resultado_reporte
					where semestre_id = 
				' || p_semestre_id;
			else --error no esperado
				raise;
			end if;
	end;
	--poblando la tabla
	v_count := 0;
	for r in cur_reporte loop
		--se requiere sql dinámico, nuevamente, ya que en tiempo de compilación
		--puede darse el caso que la tabla no exista.
		execute immediate
		--placeholders (variables de sustitución) -> :ph
		' insert into resultado_reporte(semestre_id, estudiante_id, nombre_completo,
				asignatura, antecedente, calificacion, promedio_global)
			values(:ph_semestre_id, :ph_estudiante_id, :ph_nombre_completo, 
				:ph_asignatura, :ph_antecedente, :ph_calificacion, :ph_promedio_global
			)
		' using p_semestre_id, r.estudiante_id, r.nombre_completo, r.asignatura,
			r.antecedente, r.calificacion, r.promedio_global;
		v_count := v_count + 1;
	end loop;
	p_num_registros := v_count;
	--mostrando el contenido de la tabla
	--forma alternativa de crear un cursor (con sql dinámico)
	open cur_resultado for 'select * from resultado_reporte';
	--regresa una tabla de valores para imprimirlo en consola
	dbms_sql.return_result(cur_resultado);
end;
/
show errors;


