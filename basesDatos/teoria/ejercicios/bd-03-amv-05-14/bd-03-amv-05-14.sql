--@Autor(es):       Alfonso Murrieta
--@Fecha creación: 12/05/20
--@Descripción:  Script clase- Subconsultas 14/05/20

/*========================[EJERCICIO-8]========================================
Se desea generar un reporte que muestre la distribución de las edades de los 
alumnos de la universidad. El reporte debe contener: nombre, apellido paterno, 
apellido materno, fecha_nacimiento, edad_promedio y edad. La columna EDAD_PROMEDIO 
corresponde con la edad promedio de todos los estudiantes para mostrarse como 
referencia, y la columna EDAD, contiene la edad en años que tiene el alumno. 
Genere una sentencia SQL que obtenga los datos del reporte.

*/

select nombre, apellido_paterno, apellido_materno, 
  trunc((sysdate-fecha_nacimiento)/365) as edad ,(
    select trunc(avg((sysdate-fecha_nacimiento)/365)) 
    from estudiante
  ) as edad_promedio
from estudiante;


/*
JUAN	JUAREZ	MENDOZA	41	39
VIRIDIANA	AGUIRRE	MONTES	39	39
HUGO	MONROY	ZUÑIGA	37	39
ANTONIO ALEJANDRO	GUZMAN	NIETO	37	39
HERNAN	MARTINEZ	PAEZ	40	39
ALBERTO	LOPEZ	MENDOZA	41	39
MARIANA	AGUIRRE	PEREZ	39	39
HUGO	MONROY	ZUÑIGA	40	39
MARICELA	SANROMAN	PEÑA	37	39
ARTURO	JIMENEZ	SANCHEZ	41	39
SOFIA	HURTADO	CORONA	41	39
MONSERRAT	LANDEROS	LUJAN	39	39
LISETTE	CASARES	ORTEGA	37	39
ALONSO	NOGUERA	AGUILAR	37	39
ALBERTO	TOLEDO	MARQUEZ	40	39
HILARIO DE JESUS	DURAN	LARA	41	39
ALFREDO	FLORES	LUNA	39	39
MARICELA	GUTIERREZ	DURAN	40	39
CARLA	LOPEZ	VILLAREAL	37	39
ARACELI	ESQUIVEL	GONZALEZ	40	39
LILIANA	BURGOS	VALDOVINOS	42	39
MARTHA	RODRIGUEZ	GOMEZ	41	39
LAURA ELENA	FONSECA	PEREZ	42	39

*/


/*========================[EJERCICIO-10]========================================

Determinar el nombre de las asignaturas, la clave del grupo, nombre, apellidos y
fecha de nacimiento del profesor más joven que imparte cursos en la universidad.

*/

select a.nombre, c.clave_grupo, p.nombre, p.apellido_paterno, 
p.apellido_materno,p.fecha_nacimiento
from profesor p
join curso c
on p.profesor_id = c.profesor_id
join asignatura a
on c.asignatura_id = a.asignatura_id

where p.fecha_nacimiento = (
  select max(fecha_nacimiento) 
  from profesor p, curso c
  where p.profesor_id = c.profesor_id
);

-- funciones de agrecacion solo puede aparecer en select o having

/*
BASES DE DATOS	005	SAMANTA	MIRANDA	ORTEGA	22-FEB-75
BASES DE DATOS AVANZADAS	001	SAMANTA	MIRANDA	ORTEGA	22-FEB-75
*/


/*========================[EJERCICIO-13]========================================
Se desea generar un reporte que muestre todos los datos de las asignaturas, y 
número de cursos que se crearon para todas aquellas asignaturas impartidas durante 
el semestre 2008-1 (ID =1). En caso que solo se hayan creado 3 o menos cursos, 
estos no deben mostrarse en el resultado. Considerar los siguientes 2 escenarios:

A. Generar una consulta empleando una subconsulta en la cláusula select. 
   Emplear sintaxis anterior.

B. ¿Será posible generar la consulta sin emplear subconsultas? 
   En caso afirmativo, generar la consulta empleando sintaxis estándar.

*/
-- A

select a.*, q.num_cursos
from asignatura a, (
    select asignatura_id, count(*) as num_cursos
    from curso 
    where  semestre_id = 1
    group by asignatura_id
    having count(*) >3
) q
where a.asignatura_id = q.asignatura_id;
--and num_cursos>3;


-- B

select a.*, count(*) as num_cursos
from curso c, asignatura a
where semestre_id=1
and c.asignatura_id = a.asignatura_id
group by a.asignatura_id,a.nombre,a.creditos,
a.ASIGNATURA_REQUERIDA_ID, a.PLAN_ESTUDIOS_ID --no se puede el *
having count(*) >3;

/*
3	CALCULO 1	9		1	4
5	CALCULO 2	9	3	1	5
6	COMPUTO PARA INGENIEROS	6		3	6
13	BASES DE DATOS	8	12	1	5
*/


/*========================[EJERCICIO-14]========================================

Para cada asignatura impartida en el semestre 2008-1 (id =1) seleccionar el 
nombre de la asignatura, el nombre, apellidos y la calificación del
estudiante que obtuvo el mayor valor. Considerar los siguientes escenarios:

A. Generar una sentencia SQL que haga uso de una subconsulta en la cláusula 
from, emplear sintaxis anterior

B. ¿Será posible generar una sentencia SQL que no haga uso de subconsultas? 
De ser posible, crear la sentencia con sintaxis estándar.

R: No se podria, debido a que traeria a nivel de asignatura sino alumno

e -> ei -> c -> a
*/

select q1.nombre, e.nombre, e.apellido_paterno, e.apellido_materno,
q1.max_calf
from (
    select a.asignatura_id, a.nombre, MAX(ei.calificacion) as max_calf
    from asignatura a
    join curso c
    on c.asignatura_id = a.asignatura_id
    join ESTUDIANTE_INSCRITO ei
    on ei.CURSO_ID = c.CURSO_ID
    where c.semestre_id=1 
    group by a.ASIGNATURA_ID, a.NOMBRE
) q1
join curso c
on c.asignatura_id = q1.asignatura_id
join estudiante_inscrito ei 
on ei.curso_id = c.curso_id
join estudiante e
on e.estudiante_id = ei.estudiante_id
where c.semestre_id=1
and ei.calificacion = q1.max_calf;



/*
CALCULO 1	JUAN	JUAREZ	MENDOZA	10
GEOMETRIA ANALITICA	VIRIDIANA	AGUIRRE	MONTES	10
ALGEBRA	ANTONIO ALEJANDRO	GUZMAN	NIETO	10
ALGEBRA LINEAL	MARICELA	SANROMAN	PEÑA	8
BASES DE DATOS ESPACIALES	ALFREDO	FLORES	LUNA	9
*/

