--@Autor: Alfonso Murrieta - Joaquín Valdespino
--@Fecha creación: 2 de junio de 2020
--@Descripción: Ejercicio 1 - Corrige status

set serveroutput on

create or replace procedure p_corrige_status(p_num_expirados out number, p_num_multados out number, 
  p_num_curso out number) is 
  cursor cur_prestamos is 
  select prestamo_id, fecha_status, status_prestamo_id
  from prestamo;
  v_count number; 
begin 
  p_num_expirados := 0;
  p_num_multados := 0;
  p_num_curso := 0;
  
  for r in cur_prestamos loop
    insert into t_detalle_prestamo
      select detalle_prestamo_id, num_dias, fecha_vencimiento, multa_por_pagar, prestamo_id, libro_id
      from detalle_prestamo
      where prestamo_id = r.prestamo_id;
      --Validaciones  
      --Si alguno de los libros del préstamo tiene un importe de multa mayor a cero 
      select count(*) into v_count
      from t_detalle_prestamo 
      where multa_por_pagar > 0;
      if v_count > 0 then --Cambiando a status 5 -> Con multa
        update prestamo set status_prestamo_id = 5, fecha_status = sysdate
        where prestamo_id = r.prestamo_id;
        p_num_multados:= p_num_multados + 1;
      else--Caso de no contar con multas asignadas, se considera la fecha de vencimiento con respecto a la fecha actual.
        select count(*) into v_count
        from t_detalle_prestamo
        where  fecha_vencimiento < sysdate; 
        if v_count >0 then --Cambiando expirado
          update prestamo set status_prestamo_id = 4, fecha_status = sysdate
          where prestamo_id = r.prestamo_id;
          p_num_expirados := p_num_expirados +1;
        else  --Cambiando en curso
          update prestamo set status_prestamo_id = 2, fecha_status = sysdate
          where prestamo_id = r.prestamo_id;
          p_num_curso := p_num_curso + 1;
        end if;
      end if ;
      -- Eliminando registro 
      delete from t_detalle_prestamo 
      where prestamo_id = r.prestamo_id;
  end loop;
end;
/
show errors;

--Bloque de prueba

declare
  v_num_expirados number; 
  v_num_multados number;
  v_num_en_curso number;
begin
  p_corrige_status(
    p_num_expirados => v_num_expirados, 
    p_num_multados  => v_num_multados, 
    p_num_curso     => v_num_en_curso ); 
    dbms_output.put_line('Resultado del análisis');
    dbms_output.put_line('Expirado ' || v_num_expirados);
    dbms_output.put_line('Multados ' || v_num_multados);
    dbms_output.put_line('En curso ' || v_num_en_curso);
end;
/
show errors;


/*CREAR TABLA TEMPORAL

create global temporary table t_detalle_prestamo(
detalle_prestamo_id varchar2(40) not null,
num_dias number(2, 0) not null,
fecha_vencimiento timestamp(6) not null,
multa_por_pagar number(8, 2),
prestamo_id number(10, 0) not null,
libro_id number(10, 0) not null,
constraint t_detalle_prestamo_pk primary key (detalle_prestamo_id)
) on commit preserve rows;


*/


