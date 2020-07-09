--@Autor(es):       Alfonso Murrieta | Joaquin Valdespino
--@Fecha creación:  18/05/2020
--@Descripción:    Ejercicios de la práctica 11

--Profesor
Prompt Tabla1
create table consulta_1 as
select count(*) as num_articulos, sum(precio_venta) as ingresos
from subasta_venta sv
  right join articulo a
    on sv.articulo_id = a.articulo_id
  join subasta s
    on a.subasta_id = s.subasta_id
where to_char(fecha_inicio, 'yyyy') = '2010';

--Profesor
Prompt Tabla2
create table consulta_2 as
select count(*) as articulos_no_vendidos
from subasta s, articulo a, subasta_venta sv
where s.subasta_id = a.subasta_id
  and a.articulo_id = sv.articulo_id (+)
  and sv.articulo_id is null
  and to_char(fecha_inicio, 'yyyy') = '2010';

--Profesor
Prompt Tabla3
create table consulta_3 as
select min(a.precio_inicial) pi_mas_barato, max(precio_inicial) pi_mas_caro,
  min(precio_venta) as pv_mas_barato, max(precio_venta) pv_mas_caro
from subasta s
  join articulo a
    on s.subasta_id = a.subasta_id
  join subasta_venta sv
    on a.articulo_id = sv.articulo_id
where s.nombre = 'EXPO-MAZATLAN';


Prompt Tabla4
create table consulta_4 as
select c.cliente_id, c.email, tc.numero_tarjeta
from tarjeta_cliente tc, cliente c, subasta_venta sv
where tc.cliente_id = c.cliente_id
  and c.cliente_id = sv.cliente_id (+)
  and sv.subasta_venta_id is null
  and to_number(to_char(c.fecha_nacimiento, 'yyyy')) between 1970 and 1975;


--Profesor
Prompt Tabla5
create table consulta_5 as
select count(*) as num_articulos, a.tipo_articulo, s.clave
from articulo a, status_articulo s
where a.status_articulo_id = s.status_articulo_id
  and s.clave in ('ENTREGADO', 'VENDIDO')
group by a.tipo_articulo, s.clave;


Prompt Tabla6
create table consulta_6 as
select s.nombre, s.fecha_inicio, s.lugar, a.tipo_articulo, 
  sum(sv.precio_venta) as total_recaudado
from subasta_venta sv
  join articulo a
    on sv.articulo_id = a.articulo_id
  join subasta s
    on a.subasta_id = s.subasta_id
where to_char(s.fecha_inicio, 'yyyy') = '2009'
group by s.nombre, s.fecha_inicio, s.lugar, a.tipo_articulo;


--Profesor
Prompt Tabla7
create table consulta_7 as
select c.cliente_id, c.nombre, c.apellido_paterno, c.apellido_materno,
  count(*) as articulos_comprados, sum(sv.precio_venta) as monto_total
from cliente c
  join subasta_venta sv
    on c.cliente_id = sv.cliente_id
group by c.cliente_id, c.nombre, c.apellido_paterno, c.apellido_materno
having count(*) > 5
union
select c.cliente_id, c.nombre, c.apellido_paterno, c.apellido_materno,
  count(*) as articulos_comprados, sum(sv.precio_venta) as monto_total
from cliente c
  join subasta_venta sv
    on c.cliente_id = sv.cliente_id
group by c.cliente_id, c.nombre, c.apellido_paterno, c.apellido_materno
having sum(sv.precio_venta) > 3000000;



Prompt Tabla8
create table consulta_8 as
select q.subasta_id, q.nombre, q.fecha_inicio, a.nombre as nombre_articulo,
  a.clave_articulo, q.mas_caro
from subasta_venta sv, articulo a, (
  select s.subasta_id, s.nombre, s.fecha_inicio,
    max(sv.precio_venta) as mas_caro
  from subasta_venta sv, articulo a, subasta s
  where sv.articulo_id = a.articulo_id
    and a.subasta_id = s.subasta_id
    and to_char(s.fecha_inicio, 'mm') in ('01', '03', '06')
    and to_char(s.fecha_inicio , 'yyyy') = '2010'
  group by s.subasta_id, s.nombre, s.fecha_inicio
) q
where sv.articulo_id = a.articulo_id
  and a.subasta_id = q.subasta_id
  and sv.precio_venta = q.mas_caro;

--Alfonso
Prompt Tabla9
create table consulta_9 as
select sum(sv.precio_venta) as total
from factura_cliente fc, subasta_venta sv,
(
select c.cliente_id, max(fecha_factura) as fecha_factura
from cliente c, subasta_venta sv, factura_cliente fc
where c.cliente_id = sv.cliente_id
and sv.factura_cliente_id = fc.factura_cliente_id
and nombre = 'GALILEA'
and apellido_paterno = 'GOMEZ'
and apellido_materno = 'GONZALEZ'
group by c.cliente_id
) q
where fc.factura_cliente_id = sv.factura_cliente_id
and sv.cliente_id = q.cliente_id
and fc.fecha_factura = q.fecha_factura;


Prompt Tabla10
create table consulta_10 as
select s.subasta_id, s.nombre, count(*) as num_articulos_vendidos
from subasta s, articulo a, subasta_venta sv
where s.subasta_id = a.subasta_id
  and a.articulo_id = sv.articulo_id
  and to_char(s.fecha_fin, 'yyyy') = '2010'
  group by s.subasta_id, s.nombre
  having count(*) > 3
  order by s.subasta_id;


--Alfonso
Prompt Tabla11
create table consulta_11 as
select s.subasta_id, fecha_inicio, a.articulo_id, a.nombre, precio_inicial,
(
select avg(precio_inicial) as promedio
from articulo a
join subasta s
on a.subasta_id = s.subasta_id
where a.nombre like '%Motocicleta%'
and to_char(fecha_inicio, 'YYYY')='2010'
) as promedio
from subasta s
join articulo a
on s.subasta_id = a.subasta_id
where fecha_inicio between to_date('01/07/2010','dd/mm/yyyy')
and to_date('31/07/2010','dd/mm/yyyy')
and a.nombre like '%Motocicleta%'
and ( status_articulo_id=3
or status_articulo_id=4
)
order by a.articulo_id desc;



Prompt Tabla12
create table consulta_12 as
select p.pais_id, p.clave, p.descripcion
from pais p, articulo_donado ad, articulo a
where p.pais_id = ad.pais_id
  and ad.articulo_id = a.articulo_id
  and a.precio_inicial > 300000
group by p.pais_id, p.clave, p.descripcion
having count(*) >= 3;


Prompt Tabla13
create table consulta_13 as
select s.subasta_id, s.nombre, s.fecha_inicio, 
  sum(sv.precio_venta) as total_ventas
from subasta s, articulo a, subasta_venta sv
where s.subasta_id = a.subasta_id
  and a.articulo_id = sv.articulo_id
  and to_char(s.fecha_inicio, 'yyyy') = '2010'
group by s.subasta_id, s.nombre, s.fecha_inicio
having sum(sv.precio_venta) >= 3000000;



Prompt Tabla14
create table consulta_14 as
select c.nombre, c.apellido_paterno, c.apellido_materno, 
  sum(sv.precio_venta) as total_venta
from cliente c, subasta_venta sv
where c.cliente_id = sv.cliente_id
  and sv.factura_cliente_id is null
group by c.nombre, c.apellido_paterno, c.apellido_materno
having sum(sv.precio_venta) >= 1000000;




--Profesor
Prompt Tabla15
create table consulta_15 as
select s.* 
from subasta s,(
  select s.subasta_id, count(*) as maximo
  from subasta s, articulo a, subasta_venta sv
  where s.subasta_id = a.subasta_id
    and a.articulo_id = sv.articulo_id
  group by s.subasta_id
  having count(*) = (
      select max(count(*)) as maximo
      from subasta s, articulo a, subasta_venta sv
      where s.subasta_id = a.subasta_id
        and a.articulo_id = sv.articulo_id
      group by s.subasta_id
  )
) q
where s.subasta_id = q.subasta_id;