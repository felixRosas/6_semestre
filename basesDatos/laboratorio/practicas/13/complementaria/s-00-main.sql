--@Autor(es):       Alfonso Murrieta - Joaquín Valdespino
--@Fecha creación:  22/05/2020
--@Descripción:  Datos y etc 

whenever sqlerror exit rollback
Prompt creando usuario muva_p1302_biblio
@s-01-creacion-usuario.sql
Prompt conectando como usuario muva_p1302_biblio
connect muva_p1302_biblio
Prompt creando objetos
@s-02-biblio-ddl.sql

set define off
/*
!curl "https://api.mockaroo.com/api/94e76f80?count=1000&key=b71bb7e0" > "s-03-lector.sql"
!curl "https://api.mockaroo.com/api/dc41b390?count=56&key=b71bb7e0" > "s-03-biblioteca.sql"
!curl "https://api.mockaroo.com/api/aae7bd80?count=100&key=b71bb7e0" > "s-03-libro.sql"
!curl "https://api.mockaroo.com/api/6dc64cd0?count=80&key=b71bb7e0" > "s-03-libro-comprado.sql"
!curl "https://api.mockaroo.com/api/4272bff0?count=20&key=b71bb7e0" > "s-03-libro-donado.sql"
!curl "https://api.mockaroo.com/api/75dc3b20?count=1000&key=b71bb7e0" > "s-03-asignacion-libro.sql"
!curl "https://api.mockaroo.com/api/eb68dec0?count=6&key=b71bb7e0" > "s-03-status-prestamo.sql"
!curl "https://api.mockaroo.com/api/b97f9cb0?count=1000&key=b71bb7e0" > "s-03-prestamo.sql"
!curl"https://api.mockaroo.com/api/fa0d7e80?count=1000&key=b71bb7e0" > "s-03-detalle-prestamo.sql"
*/
Prompt realizando la carga de datos
@s-03-lector.sql
@s-03-biblioteca.sql
@s-03-libro.sql
@s-03-libro-comprado.sql
@s-03-libro-donado.sql
@s-03-asignacion-libro.sql
@s-03-status-prestamo.sql
@s-03-prestamo.sql
@s-03-detalle-prestamo.sql
set define on
Prompt confirmando cambios
commit;

whenever sqlerror continue none
Prompt Listo!