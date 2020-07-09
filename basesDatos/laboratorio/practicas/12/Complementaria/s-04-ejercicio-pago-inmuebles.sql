--@Autor: Alfonso Murrieta - Joaquín Valdespino
--@Fecha creación: 30/05/2020
--@Descripción: Pago Inmuebles -Ejercicio 2
set serveroutput on
create or replace procedure sp_corrige_pago_inmuebles( p_inmueble_id number, p_actualiado out number) is
  v_pagos number;
  v_fecha_status date;
  v_plazo compra_inmueble.plazo%type;
  v_venta compra_inmueble.precio_venta%type;
  v_venta_Aux compra_inmueble.precio_venta%type;

begin

  select plazo into v_plazo
  from compra_inmueble
  where inmueble_id = p_inmueble_id;

  select count(*) into v_pagos
  from pago_inmueble
  where inmueble_id = p_inmueble_id;
  if v_plazo = v_pagos then
    p_actualiado := 0;
    return;
  end if;

  delete from pago_inmueble
  where inmueble_id = p_inmueble_id;

  select precio_venta into v_venta
  from compra_inmueble
  where inmueble_id = p_inmueble_id;

  select fecha_status into v_fecha_status
  from inmueble
  where inmueble_id = p_inmueble_id;
  
  v_pagos := 0;
  v_venta_Aux := trunc(v_venta / v_plazo, 2);

  for v_num_pago in 1 .. (v_plazo -1) loop
    insert into pago_inmueble (num_pago, inmueble_id, fecha_pago, importe)
    values (v_num_pago, p_inmueble_id, add_months(v_fecha_status,-(v_plazo - 1 - 1*(v_num_pago -1))), v_venta_Aux );
  end loop;

  v_venta_Aux := round(v_venta - (v_venta_Aux * (v_plazo -1)), 2);

  insert into pago_inmueble (num_pago, inmueble_id, fecha_pago, importe)
  values (v_plazo, p_inmueble_id, v_fecha_status, v_venta_Aux); 
  p_actualiado := 1;
end;
/
show errors