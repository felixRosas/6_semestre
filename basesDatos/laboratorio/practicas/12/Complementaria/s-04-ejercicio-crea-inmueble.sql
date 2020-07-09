--@Autor: Alfonso Murrieta - Joaquín Valdespino
--@Fecha creación: 30/05/2020
--@Descripción: Registro de inmuebles -Ejercicio 1
set serveroutput on
create or replace procedure sp_crea_inmueble(
  p_inmueble_id in out number,p_direccion varchar2,
  p_latitud number,p_longitud number,
  p_tipo char,p_cliente_id number default null,
  p_dia_pago number default null,
  p_renta_mensual number default null,
  p_interes_mensual number default null,
  p_precio_venta number default null,
  p_plazo number default null,
  p_tasa_interes number default null
) is
begin

  if (p_tipo = 'C' and (p_precio_venta is null or p_plazo is null or p_tasa_interes is null)) then
    raise_application_error(-20010, 'El tipo de inmueble no es válido');
  elsif(p_tipo = 'R' and (p_dia_pago is null or p_renta_mensual is null or p_interes_mensual is null)) then
    raise_application_error(-20010, 'El tipo de inmueble no es válido');
  end if;  

  insert into inmueble(inmueble_id, direccion, latitud, longitud, tipo_inmueble, foto, fecha_status, status_inmueble_id)
  values(seq_inmueble.nextval, p_direccion, p_latitud, p_longitud, p_tipo, empty_blob(), sysdate,1);

  if p_tipo = 'C' then
    insert into compra_inmueble (inmueble_id, precio_venta, plazo, tasa_interes)
    values (seq_inmueble.currval, p_precio_venta, p_plazo, p_tasa_interes);
  elsif p_tipo = 'R' then
    insert into renta_inmueble (inmueble_id, dia_pago, renta_mensual, interes_mensual)
    values (seq_inmueble.currval, p_dia_pago, p_renta_mensual, p_interes_mensual);
  end if;
  
  insert into historico_status_inmueble (historico_status_inmueble_id, fecha_status, status_inmueble_id, inmueble_id)
  values (seq_hist_status_inmueble.nextval, sysdate, 1, seq_inmueble.currval);

  p_inmueble_id := seq_inmueble.currval;

end;
/
show errors;