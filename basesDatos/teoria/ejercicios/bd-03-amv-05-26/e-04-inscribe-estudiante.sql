--@Autor(es):       Alfonso Murrieta
--@Fecha creación: 26/05/20
--@Descripción:  Triggers & PL - ejercicio 4

set serveroutput on

create or replace procedure sp_inscribe_estudiante( 
    p_estudiante_id in number, p_semestre_id in number,
    p_asignatura_id in number, p_grupo in varchar2,
    p_curso_id out number, p_resultado out number
) is 
v_clave_grupo curso.clave_grupo%type;
v_calificacion estudiante_inscrito.calificacion%type;
cursor cur_cursos is 
  select c.curso_id, c.clave_grupo, c.cupo_maximo, count(ei.curso_id) as num_inscritos
  from curso c 
  left join estudiante_inscrito ei 
  on c.curso_id = ei.curso_id
  where c.asignatura_id = p_asignatura_id
  and c.semestre_id = p_semestre_id 
  group by c.curso_id, c.clave_grupo, c.cupo_maximo 
  having count(ei.curso_id) < cupo_maximo;
begin 
  -- consulta que muestra situación académica estudiante
  begin
    select ei.calificacion into v_calificacion
    from estudiante_inscrito ei, curso c
    where ei.curso_id = c.curso_id 
    and ei.estudiante_id = p_estudiante_id
    and c.asignatura_id = p_asignatura_id;
    -- si no hay error -> se encontró calificación 

    if v_calificacion is null then --  La está cursando
      p_resultado := -2;
      dbms_output.put_line('El estudiante está cursando la asignatura ');
      return ;
    elsif v_calificacion > 5 then
      p_resultado := -1;
      dbms_output.put_line('El estudiante ya cursó la materia');
      return ;
    else
      dbms_output.put_line('El estudiante puede recursar la materia ');
    end if;
  exception
    when no_data_found then 
      dbms_output.put_line('El estudiante nunca ha cursado la materia, se puede inscribir ');
    when others then 
      dbms_output.put_line('Error no esperado');
      raise; -- se termina la ejecución y se lanza el error 
  end;
  -- Si se llega hasta aquí -> las validaciones fueron exitosas -> estudiante se inscribe
  -- Recorriendo cursor para verificar cupo en el grupo solicitado  

  dbms_output.put_line('Lista de cursos con cupo');
  p_resultado := -1;
  for r in cur_cursos loop
    dbms_output.put_line('Curso id:       ' || r.curso_id);
    dbms_output.put_line('Clave grupo:    ' || r.clave_grupo);
    dbms_output.put_line('Núm. Inscritos: ' || r.num_inscritos);
    if r.clave_grupo = p_grupo then --Hay cupo en el grupo solicitado
      p_curso_id := r.curso_id; -- asociando al curso solicitado
      p_resultado := 0;
      exit;  
    end if;    
  end loop;
  if p_resultado = -1 then 
    dbms_output.put_line('No hay cupo en el grupo solicitado, revisar otros grupos');
    p_resultado := -3;
    return; 
  end if;

  dbms_output.put_line('Inscribiendo al estudiante');
  insert into estudiante_inscrito(estudiante_inscrito_id,estudiante_id,curso_id) 
  values(estudiante_inscrito_seq.nextval, p_estudiante_id, p_curso_id );
  p_resultado:=0;--éxito del programa
end;
/
show errors 
--Ponerlo siempre para triggers 



