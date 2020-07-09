--@Autor: Alfonso Murrieta Villegas
--@Fecha creación: 19/04/2020
--@Descripción: Elimina al usuario sga_p07_previo en caso de existir.

set serveroutput on
declare
 v_count number(1,0);
begin
 select count(*) into v_count
 from dba_users
 where username ='AMV_P07_PREVIO';

 if v_count > 0 then
   execute immediate 'drop user AMV_P07_PREVIO cascade'; 
   dbms_output.put_line('Usuario eliminado');
 else
   dbms_output.put_line('El usuario no existe, no se requiere eliminar'); 
 end if;
end; 
/