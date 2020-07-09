
--@Autor: Alfonso Murrieta Villegas
--@Fecha creación: 11/05/2020
--@Descripción: Ejercicios de Joins - Práctica 10


-- Ejercicio 1
create table consulta_1 as
select a.nombre, a.clave_articulo, s.clave
from articulo_famoso a_f
join articulo a
on a.articulo_id = a_f.articulo_id
join status_articulo s
on a.status_articulo_id = s.status_articulo_id
where a_f. nombre_completo = 'William Harvey';


-- Ejercicio 2
create table consulta_2 as
select articulo_id, nombre, clave_articulo
from status_articulo s_a
join articulo a using(status_articulo_id)
natural join articulo_donado a_d
join pais p using(pais_id)
where s_a.clave = 'ENTREGADO' 
and p.descripcion = 'BELGICA';


-- Ejercicio 3
create table consulta_3 as
select articulo_id, a.nombre, precio_inicial, precio_venta, 
tipo_articulo, s.nombre nombre_subasta, to_char(s.fecha_inicio,'yyyy/mm/dd hh12:mi:ss AM')
as fecha_inicio
from articulo a
join subasta s using (subasta_id)
natural join subasta_venta sv
join cliente c using (cliente_id)
where c.nombre='MARICELA' and c.apellido_paterno='PAEZ' 
and c.apellido_materno='MARTINEZ' 
and to_char(s.fecha_inicio,'yyyy')='2010'
and to_char(s.fecha_fin,'yyyy')='2010';


--Ejercicio 4
create table consulta_4 as
select c.cliente_id, c.nombre, c.apellido_paterno, c.apellido_materno,
tc.numero_tarjeta, tc.tipo_tarjeta, tc.anio_vigencia, tc.mes_vigencia
from cliente c, tarjeta_cliente tc
where c.cliente_id = tc.cliente_id
and (anio_vigencia < '11'or (anio_vigencia = '11' and mes_vigencia < '11'));


--Ejercicio 5
create table consulta_5 as
select a.articulo_id, a.nombre, a.clave_articulo, a.tipo_articulo, 
aq.anio_hallazgo, a.precio_inicial, sv.precio_venta 
from articulo a 
join articulo_arqueologico aq
on a.articulo_id = aq.articulo_id
left outer join subasta_venta sv
on sv.articulo_id = a.articulo_id
where a.tipo_articulo = 'A' 
and a.precio_inicial > 800000;


--Ejercicio 6
create table consulta_6 as
select c.nombre, c.apellido_paterno, c.apellido_materno, c.email, 
c.ocupacion,tc.tipo_tarjeta
from cliente c, tarjeta_cliente tc
where c.cliente_id=tc.cliente_id(+)
and c.ocupacion='ABOGADO';


--/////////////////////////////////////////////////////////////////////////////////////
-- Ejercicio 7 - Joaquín 
create table consulta_7 as
select articulo_id, nombre, clave_articulo, precio_inicial, status_articulo_id
from(
  select * from articulo
  where precio_inicial > 900000
  minus
  (
    select *
    from articulo
    where status_articulo_id = (
      select status_articulo_id
      from status_articulo
      where clave = 'EN SUBASTA'
    )
    union
    select *
    from articulo
    where status_articulo_id = (
      select status_articulo_id
      from status_articulo
      where clave = 'ENTREGADO'
    )
    union -- No olvidar la union
    select *
    from articulo
    where status_articulo_id = (
      select status_articulo_id
      from status_articulo
      where clave = 'VENDIDO'
    )
  )
);


--Ejercicio 8


create table consulta_8 as
  select a.articulo_id, a.clave_articulo, a.nombre, sa.status_articulo_id,
  ar.anio_hallazgo, (to_number(to_char(sysdate,'yyyy') - anio_hallazgo)) 
  as Antiguedad
  from articulo a
  join articulo_arqueologico ar
  on a.articulo_id=ar.articulo_id
  join status_articulo sa
  on a.STATUS_ARTICULO_ID=sa.STATUS_ARTICULO_ID
  where (to_number(to_char(sysdate,'yyyy') - anio_hallazgo))  >150
  and sa.clave = 'REGISTRADO';


--Ejercicio 9
create table consulta_9 as
select a.nombre, a.tipo_articulo
from articulo a
join status_articulo sa
on a.status_articulo_id = sa.STATUS_ARTICULO_ID
where sa.clave='EN SUBASTA' and ((a.descripcion like '%Colonial%' or a.nombre like '%Colonial%') 
and sa.clave<>'VENDIDO') ;

--Ejercicio 10
create table consulta_10 as
select to_char(fccl.fecha_factura,'dd/mm/yyyy') as fecha_factura,
trcl.numero_tarjeta, c.nombre as nameClient, 
c.apellido_paterno, c.apellido_materno,
sbvn.precio_venta, a.precio_inicial, 
(sbvn.precio_venta-a.precio_inicial) as finalPrize, 
a.nombre as nombre_articulo, 
a.clave_articulo,a.tipo_articulo, 
af.nombre_completo, ar.anio_hallazgo, p.clave
from cliente c
  join tarjeta_cliente trcl
  on trcl.CLIENTE_ID=c.CLIENTE_ID
  join factura_cliente fccl
  on fccl.TARJETA_CLIENTE_ID=trcl.TARJETA_CLIENTE_ID
  join subasta_venta sbvn
  on sbvn.FACTURA_CLIENTE_ID=fccl.FACTURA_CLIENTE_ID
  join articulo a
  on sbvn.articulo_id=a.articulo_id
  left outer join articulo_famoso af
  on a.ARTICULO_ID=af.ARTICULO_ID
  left outer join ARTICULO_ARQUEOLOGICO ar
  on a.ARTICULO_ID=ar.articulo_id
  left outer join ARTICULO_DONADO ad
  on a.articulo_id=ad.ARTICULO_ID
  left outer join pais p
  on ad.PAIS_ID=p.PAIS_ID
where trcl.NUMERO_TARJETA='5681375824866375';


-- Ejercicio 11
create table consulta_11 as
select to_char(fccl.fecha_factura, 'dd/mm/yyyy') fecha_factura,
  tc.numero_tarjeta, 
  c.nombre nombre_cliente, 
  c.apellido_paterno, 
  c.apellido_materno,
  sbvn.precio_venta, 
  a.precio_inicial,
  sbvn.precio_venta - a.precio_inicial diferencia,
  a.nombre nombre_subasta, 
  a.clave_articulo, 
  a.tipo_articulo, 
  af.nombre_completo,
  aa.anio_hallazgo, 
  to_char(ad.pais_id) clave
from factura_cliente fccl, tarjeta_cliente tc, cliente c, subasta_venta sbvn,
articulo a, articulo_famoso af, articulo_arqueologico aa, articulo_donado ad
where fccl.tarjeta_cliente_id = tc.tarjeta_cliente_id
  and tc.cliente_id = c.cliente_id
  and c.cliente_id = sbvn.cliente_id
  and sbvn.articulo_id = a.articulo_id
  and a.articulo_id = af.articulo_id(+) 
  and a.articulo_id = aa.articulo_id(+)
  and a.articulo_id = ad.articulo_id(+)
  and tc.numero_tarjeta = '5681375824866375';














































