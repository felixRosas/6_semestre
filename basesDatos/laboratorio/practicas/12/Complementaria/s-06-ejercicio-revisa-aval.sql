--@Autor: Alfonso Murrieta - Joaquín Valdespino
--@Fecha creación: 30/05/2020
--@Descripción: Válida aval / trigger -Ejercicio 3
set serveroutput on

create or replace trigger tr_revisa_aval
before insert or update of cliente_id
on inmueble
for each row 

declare 
  v_status_pago status_inmueble.status_inmueble_id%type;
  v_count_pago_aval number;
begin
  case
    when inserting or updating('cliente_id') then

      if :new.cliente_id is null and :new.status_inmueble_id = 1 then
        dbms_output.put_line('El funcionamiento es correcto');

      elsif :new.cliente_id is null and :new.status_inmueble_id != 1 then
        raise_application_error(-20010, 'ERROR: El mueble no está disponible');

      elsif :new.cliente_id is not null and :new.status_inmueble_id = 1 then
        raise_application_error(-20011, 'ERROR: El inmueble no se puede asignar al cliente');

      elsif :new.cliente_id is not null and :new.status_inmueble_id != 1 then --caso para el aval

        select status_inmueble_id into v_status_pago
        from status_inmueble
        where clave = 'PAGADO';
        dbms_output.put_line('Estado del pago: '||v_status_pago);

        if :new.status_inmueble_id != v_status_pago then
          select count(*) into v_count_pago_avalfrom inmueble i, cliente c, cliente cr, inmueble ir
          where i.cliente_id = c.cliente_id
            and c.aval_cliente_id = cr.cliente_id
            and cr.cliente_id = ir.cliente_id
            and ir.status_inmueble_id = v_status_pago;

          if v_count_pago_aval = 0 then
            insert into asignacion_pendiente(asignacion_pendiente_id, descripcion, fecha_registro, inmueble_id, cliente_sin_aval_id, status_inmueble_id)
            values( seq_asignacion_pendiente.currval, 'El cliente cuenta con un aval no válido', sysdate, :new.inmueble_id, :new.cliente_id, :new.status_inmueble_id );
            raise_application_error(-20012, 'ERROR: El aval no es válido');

          end if;

        end if;

        
      end if;
  end case;
end;
/
show errors;