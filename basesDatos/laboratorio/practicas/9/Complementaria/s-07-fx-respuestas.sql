--@Autor: Alfonso Murrieta - Valdespino Mendieta
--@Fecha creacion: 1/05/2020
--@Descripción; Ejercicios práctica complementaria



--EJERCICIO 1
create table consulta_1 as 
  select id,nombre, clave,municipio,
  to_char(ultima_revision, 'DD/MM/YYYY HH24:MI:SS "hrs."') as ultima_revision
  from aeropuerto where TIPO='closed' 
  and ultima_revision > to_date('01/10/2012','DD/MM/YYYY') 
  and ultima_revision < to_date('31/03/2015','DD/MM/YYYY');


--EJERCICIO 2
create table consulta_2 as
  select id, nombre, municipio, region_iso, round((elevacion*3.281),3) as 
  "ELEVACION_METROS" from aeropuerto
  where tipo='large_airport'; 


--EJERCICIO 3
create table consulta_3 as
  select nombre,
    TRUNC(ABS((latitud*10002.29)/90),4) as "LAT_CARTESIANA",
    TRUNC(ABS((longitud*10002.29)/90),4) as "LONG_CARTESIANA",
    TRUNC(latitud,4) as "LATITUD_GRADOS",
    TRUNC(longitud,4) as "LONGITUD_GRADOS"
    from AEROPUERTO
    where region_iso='MX-OAX';


--EJERCICIO 4
create table consulta_4 as
  select
  a2.nombre, a2.tipo, 
  a1.latitud as "LATITUD_BENITO", 
  a1.longitud as "LONGITUD_BENITO",
  a2.latitud as "LATITUD_OTRO",
  a2.longitud as "LONGITUD_OTRO",
    ROUND(sqrt(
    power(((a1.latitud*10002.29)/90)- ((a2.latitud*10002.29)/90),2)+
    power(((a1.longitud*10002.29)/90)-((a2.longitud*10002.29)/90),2)
    ),5) as "DISTANCIA"
    from aeropuerto a1, aeropuerto a2
    where a1.id =4731
    and a2.region_iso='MX-DIF'
    and a2.id <> 4731 
    and a2.tipo <>'closed' 
    order by "DISTANCIA" asc;


--EJERCICIO 5
create table consulta_5 as
  select id , clave, nombre,
    municipio, codigo_gps,
    codigo_iata, 
    to_char(ultima_revision,'FMday", "month DD "of" yyyy "at" hh24:mi:ss') 
    as "ULTIMA_REVISION"
    from aeropuerto
    where region_iso='MX-CHP';
    

-- EJERCICIO 6
alter session set nls_language=spanish;
create table consulta_6 as
select id, 
to_char(ultima_revision,'DD/FMmonth/YYYY') AS "ULTIMA_REVISION",
trunc(((to_date('01/01/2018','DD/MM/YYYY'))-to_date(to_char(ultima_revision,'DD/MM/YYYY'),'DD/MM/YYYY')),0) as "FALTAN" 
from aeropuerto
where to_char(ultima_revision,'DD/MM')='10/12' 
or to_char(ultima_revision,'DD/MM')='15/12'
ORDER BY "FALTAN" DESC;
alter session set nls_language=american;


-- EJERCICIO 7
create table consulta_7 as
select distinct decode(tipo,'seaplane_base','B',
  'medium_airport','M',
  'small_airport','S',
  'closed','C',
  'large_airport','L',
  'heliport','H') as "CLAVE_TIPO", upper(tipo) as tipo
from aeropuerto;


-- EJERCICIO 8
create table consulta_8 as
  select 
  lpad(id,'6','0')||'-'||substr(region_iso,4)||'-'||upper(substr(municipio,-2)) as "FOLIO",
  region_iso,municipio, wikipedia_link
  from aeropuerto
  where wikipedia_link is not null;


-- EJERCICIO 9
create table consulta_9 as select lpad(id,6,'0')||'-'||substr(region_iso,4)||'-'||upper(nvl(substr(municipio,-2),'NN')) 
as folio,region_iso,municipio,wikipedia_link 
from aeropuerto where wikipedia_link is not null;


-- EJERCICIO 10
create table consulta_10 as
  select nombre,pagina_web,
  nullif(substr(pagina_web,instr(pagina_web,'?')+1,length(pagina_web)),pagina_web)
  as "PARAMETROS"
  from aeropuerto
  where pagina_web is not null;


-- EJERCICIO 11
create table consulta_11 as
  select nombre, municipio,
  substr(wikipedia_link,regexp_instr(wikipedia_link,'/',1,4),length(wikipedia_link)) as "PATH",
  nvl(length(nombre),0)+nvl(length(municipio),0)+
  nvl(length(substr(wikipedia_link,regexp_instr(wikipedia_link,'/',1,4),
  length(wikipedia_link))),0) as "TOTAL_LONGITUD"
  from aeropuerto 
  where tipo='small_airport' and region_iso='MX-BCS';
    
 commit; 










