--@Autor(es):       Alfonso Murrieta
--@Fecha creación:  30/04/2020
--@Descripción:  Script clase 30/04/20

--#############################################################################
-- EJERCICIO 4 
select trunc((sysdate - fecha_nacimiento)/365) as "Edad Profesor"
from profesor
where nombre = 'FELIPE'
and APELLIDO_PATERNO = 'LIMA'
and APELLIDO_MATERNO = 'RODRIGUEZ';

/*RESULTADO

"Edad profesor"
 67

*/


--#############################################################################
/*
-- EJERCICIO 10 - Algebra Relacional

Suponga que la universidad desea cancelar a todos aquellos cursos que tengan un cupo máximo de 30 estudiantes excepto aquellos cursos que
tengan clave 001. Empleando operadores del álgebra relacional, generar una sentencia SQL que obtenga el identificador del curso y su clave de los
cursos que se eliminarán.


P (curso_id,calve_grupo)(S cupo_maximo=30(curso)) - P (curso_id,calve_grupo)(S clave=001(curso))
*/

select curso_id,clave_grupo
from curso 
where cupo_maximo = 30
minus
select curso_id,clave_grupo
from curso 
where clave_grupo='001';

select curso_id , clave_grupo from(
    select * from curso 
    where cupo_maximo = 30
    minus
    select * from curso 
    where clave_grupo='001'   
);

/*RESULTADO

CURSO_ID , CLAVE_GRUPO
17	002
18	003
19	004
20	005
21	006
23	002
24	003
26	002
27	003
28	004
29	005

*/

--#############################################################################
/* EJERCICIO 11 - Algebra Relacional

Para el próximo semestre, la universidad tiene planeado reducir el número de cursos para las asignaturas que cumplan con las siguientes reglas: 
La asignatura debe pertenecer a los planes de estudios con id 1 o 2, aunque,    <- Selecion , UNION
si existen materias con 9 o más créditos, estas no se consideran.               <- MINUS ( Diferencia)
Emplear alguno de los operadores relacionales determine el id de la asignatura, el nombre, su plan de estudios y el número de créditos. <- Proyeccion

NOTA: OR = UNION 
P(asignatura_id,nombre,creditos,plan_estudios_id)
( 
S( plan_estudios_id = 1)(asignatura) U S( plan_estudios_id = 2)(asignatura)  -  
S(creditos >= 9)(asignatura) 
)
*/


select asignatura_id,nombre,creditos,plan_estudios_id from (
    select * from ASIGNATURA
    where PLAN_ESTUDIOS_ID = 1
    UNION
    select * from ASIGNATURA
    where PLAN_ESTUDIOS_ID = 2
    
    MINUS
    
    select * from ASIGNATURA
    where CREDITOS >= 9
);

/*RESULTADO


1	ALGEBRA	                            8	1
4	ALGEBRA LINEAL	                    7	1
7	CALCULO 3	                        8	1
10	ELECTRICIDAD Y MAGNETISMO	        8	1
11	ALGORITMOS Y ESTRUCTURA DE DATOS	6	2
13	BASES DE DATOS	                    8	1
14	ANALISIS DE SISTEMAS Y SEÑALES	    7	1
16	DINAMICA DE SISTEMAS FISICOS	    6	1
20	TEMAS SELECTOS DE BD	            5	1


*/

/*#############################################################################
EJERCICIO 12 - ALGEBRA RELACIONAL -INNER JOIN

Se desea generar un reporte que muestre los datos de los exámenes extraordinarios que ha realizado la alumna con id 21. El reporte debe incluir
su nombre completo, el número de examen, su calificación y el identificador de la asignatura.

-- ligaremos mediante estudiante_id

colocamos el predicado en el join

P(nombre,apt_mat,apt_mat,num_exam) (S(estudiante_id=21)(estudiante) J (estudiante_id)(estudiante_extraordinario) )

*/

select e.nombre, e.apellido_paterno, e.apellido_materno, 
ex.num_examen, ex.calificacion, ex.asignatura_id
from estudiante e
join ESTUDIANTE_extraordinario ex
on e.ESTUDIANTE_ID=ex.estudiante_id
where e.estudiante_id=21;


/*RESULTADO

LILIANA	BURGOS	VALDOVINOS	1	5	3
LILIANA	BURGOS	VALDOVINOS	2	6	3
LILIANA	BURGOS	VALDOVINOS	3	6	7
LILIANA	BURGOS	VALDOVINOS	4	7	8


*/



/*#############################################################################
EJERCICIO 14 

Generar una sentencia SQL que muestre nombre de la asignatura, clave del plan de estudios, clave del grupo y día de la semana de todos los cursos
que imparte el profesor JULIAN VALDEZ SANCHEZ en el semestre 2008-1, emplear notación anterior. Ordenar por nombre de la asignatura y después
por la clave del grupo.

tablas
- Asignatura a
- plan_estudios pl
- cursos c
- horarios hr
- profesor pf
- semestre sm
- curso_horario ch

*/

select a.nombre, pl.clave,c.clave_grupo, h.dia_semana
from asignatura a, plan_estudios pl, curso c, profesor p,
  semestre s, curso_horario ch, horario h
where
pl.PLAN_ESTUDIOS_ID=a.plan_estudios_id
and a.ASIGNATURA_ID=c.ASIGNATURA_ID
and c.PROFESOR_ID=p.PROFESOR_ID
and c.SEMESTRE_ID=s.semestre_id
and c.CURSO_ID=ch.CURSO_ID
and ch.HORARIO_ID=h.HORARIO_ID
and p.nombre='JULIAN'
and p.APELLIDO_PATERNO='VALDEZ'
and p.APELLIDO_MATERNO='SANCHEZ'
and s.ANIO=2008
and s.PERIODO=1;

/*RESULTADO

GEOMETRIA ANALITICA	PL-2OO4	002	1
CALCULO 1	PL-2OO4	001	1
GEOMETRIA ANALITICA	PL-2OO4	002	3
CALCULO 1	PL-2OO4	001	3
GEOMETRIA ANALITICA	PL-2OO4	002	5
CALCULO 1	PL-2OO4	001	5
CALCULO 1	PL-2OO4	004	1
CALCULO 1	PL-2OO4	004	3
CALCULO 1	PL-2OO4	004	5
CALCULO 2	PL-2OO4	003	2
CALCULO 2	PL-2OO4	003	4

*/
     
     
     
     
     
     
     
     
     
     
     
     













