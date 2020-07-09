--@Autor(es):       Alfonso Murrieta
--@Fecha creación: 12/05/20
--@Descripción:  Script clase- Subconsultas 15/05/20

/*========================[EJERCICIO-8]========================================
Se desea generar un reporte que contenga a los alumnos que obtuvieron la mayor 
calificación POR cada curso impartido en el semestre 2008-1 (id=1). Genere una 
sentencia SQL que muestre: nombre, apellidos del estudiante, clave de su grupo, 
nombre de la asignatura y la calificación. Considerar los siguientes casos:

A. Escribir la sentencia empleando una subconsulta correlacional empleando 
    sintaxis anterior.
    
B. Escribir la sentencia sin emplear subconsultas correlacionales empleando 
    sintaxis estándar.

*/
-- A
select c.curso_id, c.clave_grupo, a.nombre, e.nombre, e.apellido_paterno,
e.apellido_materno, ei.calificacion
from asignatura a, curso c, estudiante e, ESTUDIANTE_INSCRITO ei
where  a.asignatura_id = c.asignatura_id
and c.curso_id = ei.curso_id
and ei.estudiante_id = e.estudiante_id
and ei.calificacion=(
    select max(ei.calificacion) 
    from estudiante_inscrito ei
    where ei.curso_id=c.curso_id
)
and c.semestre_id = 1
order by a.nombre, c.clave_grupo asc;

--B

select e.nombre, c.clave_grupo, a.nombre, q1.max_calificacion
from (
    select c.curso_id, max(ei.calificacion) as max_calificacion
    from curso c
    join estudiante_inscrito ei
    on c.curso_id = ei.curso_id
    where c.semestre_id=1
    group by c.curso_id
) q1
join curso c 
on c.curso_id = q1.curso_id 
join asignatura a
on c.asignatura_id = a.asignatura_id
join estudiante_inscrito ei
on c.curso_id = ei.curso_id
join 
on




/*RESULTADO
1	001	ALGEBRA	ANTONIO ALEJANDRO	GUZMAN	NIETO	10
10	001	ALGEBRA LINEAL	MARICELA	SANROMAN	PEÑA	8
32	001	BASES DE DATOS ESPACIALES	MONSERRAT	LANDEROS	LUJAN	7
33	002	BASES DE DATOS ESPACIALES	ALFREDO	FLORES	LUNA	9
6	001	CALCULO 1	JUAN	JUAREZ	MENDOZA	10
3	001	GEOMETRIA ANALITICA	VIRIDIANA	AGUIRRE	MONTES	10

*/








