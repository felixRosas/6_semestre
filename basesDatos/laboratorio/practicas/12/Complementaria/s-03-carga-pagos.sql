--@Autor:           Jorge Rodriguez
--@Fecha creación:  dd/mm/yyyy
--@Descripción:    carga de datos via sql

Prompt cargando pagos.
declare
  v_renta  number;
  v_precio number;
  v_fecha_status date;
  v_num_pago number;
begin
  -- rentadas
  for r in (select inmueble_id, fecha_status 
    from inmueble where status_inmueble_id = 2) loop
    
    select renta_mensual  into v_renta
    from renta_inmueble
    where inmueble_id = r.inmueble_id;
    v_num_pago:= 1;
    v_fecha_status := r.fecha_status + 30; 
    loop
      exit when v_fecha_status + 30 > sysdate;
      insert into pago_inmueble(num_pago,inmueble_id,fecha_pago,importe)
      values(v_num_pago,r.inmueble_id,v_fecha_status,v_renta);
      v_num_pago := v_num_pago + 1;
      v_fecha_status := v_fecha_status +30;
    end loop;
  end loop;

  --pagadas
  for r in (select inmueble_id, fecha_status 
    from inmueble where status_inmueble_id = 5) loop
      select precio_venta into v_precio
      from compra_inmueble
      where inmueble_id = r.inmueble_id;
      insert into pago_inmueble(num_pago,inmueble_id,fecha_pago,importe)
      values(1,r.inmueble_id,r.fecha_status,v_precio);
  end loop;

  --con adeudo
  for r in (select inmueble_id, fecha_status 
    from inmueble where status_inmueble_id = 4) loop
      insert into pago_inmueble(num_pago,inmueble_id,fecha_pago,importe)
      values(1,r.inmueble_id,r.fecha_status,dbms_random.value(3000,10000));
  end loop;
end;
/