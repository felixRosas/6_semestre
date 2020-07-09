--@Autor: Alfonso Murrieta - Joaquín Valdespino
--@Fecha creación: 2 de junio de 2020
--@Descripción: Ejercicio 3 - actualizar imágenes 

set serveroutput on
connect sys as sysdba

Prompt creando objeto DATA_DIR
create or replace directory data_dir as '/tmp/bd'; 
-- es porque todos los usuarios pueden acceder en este caso lo hará Oracle
grant read,write on directory data_dir to muva_p1302_biblio;

Prompt conectando como usuario muva_p1302_biblio
connect muva_p1302_biblio

Prompt creando procedimiento para actualizar imagenes.
create or replace procedure p_actualiza_imagen is
    v_bfile bfile;
    v_src_offset number := 1;
    v_dest_offset number := 1;
    v_dest_blob blob;
    v_src_length number;
    v_dest_length number;
    v_nombre_archivo varchar2(1000);


cursor cur_libro_imagen is
    select libro_id,imagen,nombre_archivo
    from libro_imagen;

begin
    for r in cur_libro_imagen loop
        v_src_offset := 1;
        v_dest_offset := 1;
        dbms_output.put_line('cargando imagen para '||r.nombre_archivo);
        v_bfile := bfilename('DATA_DIR', r.nombre_archivo);
        if dbms_lob.fileexists(v_bfile) = 1 and not dbms_lob.isopen(v_bfile) = 1 then 
            dbms_lob.open(v_bfile, dbms_lob.lob_readonly);
        else 
            raise_application_error(-20001, 'El archivo ' || r.nombre_archivo ||' no existe en el directorio DATA_DIR'|| ' o el archivo esta abierto');
        end if;

        select imagen into v_dest_blob
        from libro_imagen
        where libro_id = r.libro_id
        for update; -- bloquea el registro para que nada más acceda a la transaction

        dbms_lob.loadblobfromfile(
            dest_lob => v_dest_blob,
            src_bfile => v_bfile,
            amount => dbms_lob.getlength(v_bfile),
            dest_offset => v_dest_offset,
            src_offset => v_src_offset
        );

        dbms_lob.close(v_bfile);

        --Validacion datos
        v_src_length := dbms_lob.getlength(v_bfile);
        v_dest_length := dbms_lob.getlength(v_dest_blob);

        if v_src_length = v_dest_length then
            dbms_output.put_line('Escritura correcta, bytes escritos: ' || v_src_length);
        else raise_application_error(-20002, 'Error al escribir datos.\n'
            || ' Se esperaba escribir '
            || v_src_length
            || ' Pero solo se escribio '
            || v_dest_length);
        end if;
    end loop;
end;
/

show errors

Prompt copiando imagenes
!rm -rf /tmp/bd
!mkdir -p /tmp/bd
!chmod 777 /tmp/bd
!cp imagenes/img-* /tmp/bd
!chmod 755 /tmp/bd/img-*

Prompt invocando procedimiento
exec p_actualiza_imagen
commit;

Prompt Mostrando resultados
col nombre_archivo format a30

select libro_id,nombre_archivo,dbms_lob.getlength(imagen) as longitud_imagen
from libro_imagen;

Prompt Listo!