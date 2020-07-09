--@Autor: Alfonso Murrieta - Joaquín Valdespino
--@Fecha creación: 2 de junio de 2020
--@Descripción: Ejercicio 3 - Script imágenes

--connect muva_p1302_biblio
set serveroutput on
Prompt generando shell script para descargar imagenes de libros.
declare
    cursor cur_muestra_imagenes is
    select libro_id, imagen_url
    from libro sample(10);
    v_comando varchar2(4000);
    v_nombre_archivo varchar2(1000);
begin
delete from libro_imagen;

for r in cur_muestra_imagenes loop
    v_nombre_archivo := 'img-'||substr(r.imagen_url,instr(r.imagen_url,'/',-1,1)+1);

    --esta variable contiene el comando a ejecutar para obtener la imagen
    -- Ejemplo: curl https://images.gr-assets.com/books/1361039443m/41865.jpg > imagenes/img-41865.jpg
    -- las imagenes serán almacenadas en un directorio llamado imagenes.

    v_comando := 'curl ' ||r.imagen_url||' > imagenes/'||v_nombre_archivo;

    insert into libro_imagen(libro_id,imagen_url,nombre_archivo,comando,imagen)
    values(r.libro_id,r.imagen_url,v_nombre_archivo,v_comando,empty_blob());

end loop;
end;
/
Prompt haciendo commit

commit;

set pagesize 100
set linesize 1000

-- Sirve para que no lleve basura al shell-script 
set echo off;
set feedback off;
set heading off;

!mkdir imagenes

--en este archivo se guardará el contenido de la columna comando que contiene las instrucciones
-- para descargar las imágenes. Se hace uso de un spool.
spool "s-06-ejercicio-descarga_imagenes.sh"
select comando from libro_imagen;
spool off;
set echo on
set feedback on
set heading on
Prompt Shell script generado, obteniendo las imagenes
!rm -rf imagenes
!mkdir -p imagenes
!sh s-06-ejercicio-descarga_imagenes.sh
Prompt Listo!
exit