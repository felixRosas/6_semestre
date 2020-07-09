--@Autor:           Jorge Rodriguez
--@Fecha creación:  dd/mm/yyyy
--@Descripción:    carga de datos via sql

Prompt cargando historicos
declare
  v_fecha date;
  v_num_inmuebles number := 250;
  v_index number;
  v_random number;
begin

  --disponibles
  for r in (select inmueble_id,fecha_status from inmueble) loop 
    insert into historico_status_inmueble(
      historico_status_inmueble_id,fecha_status,status_inmueble_id,inmueble_id)
    values(seq_hist_status_inmueble.nextval, r.fecha_status,1,r.inmueble_id);
  end loop;

  --rentados
  for r in (select inmueble_id,fecha_status from inmueble where status_inmueble_id = 2) loop
     v_random := dbms_random.value(1,365);
     v_fecha := r.fecha_status +v_random;
    insert into historico_status_inmueble(
      historico_status_inmueble_id,fecha_status,status_inmueble_id,inmueble_id)
    values(seq_hist_status_inmueble.nextval,v_fecha,2,r.inmueble_id);     
  end loop;

  --en credito
   for r in (select inmueble_id,fecha_status from inmueble where status_inmueble_id = 3) loop
     v_random := dbms_random.value(1,365);
     v_fecha := r.fecha_status +v_random;
    insert into historico_status_inmueble(
      historico_status_inmueble_id,fecha_status,status_inmueble_id,inmueble_id)
    values(seq_hist_status_inmueble.nextval,v_fecha,3,r.inmueble_id);     
  end loop;

  -- con adeudo
   for r in (select inmueble_id,fecha_status from inmueble where status_inmueble_id = 4) loop
     v_random := dbms_random.value(1,365);
     v_fecha := r.fecha_status +v_random;
    insert into historico_status_inmueble(
      historico_status_inmueble_id,fecha_status,status_inmueble_id,inmueble_id)
    values(seq_hist_status_inmueble.nextval,v_fecha,4,r.inmueble_id);     
  end loop;

  --pagado
   for r in (select inmueble_id,fecha_status from inmueble where status_inmueble_id = 5) loop
     v_random := dbms_random.value(1,365);
     v_fecha := r.fecha_status +v_random;
    insert into historico_status_inmueble(
      historico_status_inmueble_id,fecha_status,status_inmueble_id,inmueble_id)
    values(seq_hist_status_inmueble.nextval,v_fecha,5,r.inmueble_id);     
  end loop;
end;
/