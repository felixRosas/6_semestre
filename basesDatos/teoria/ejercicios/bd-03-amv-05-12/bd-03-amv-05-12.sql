--@Autor(es):       Alfonso Murrieta
--@Fecha creación: 12/05/20
--@Descripción:  Script clase- Subconsultas 12/05/20


/*========================[EJERCICIO-21]========================================

JOIN recursivo, tabla padre PK, y tabla hija FK

Generar un reporte de todas las asignaturas que tengan 8 créditos. Los datos que 
debe mostrar es la siguiente:
- Nombre de la asignatura
- Créditos
- Clave del plan de estudios
- Nombre de la asignatura requerida (si existe)

// Sintaxis SQL estandar
*/


select a.nombre, a.creditos, p.clave, ar.nombre
from plan_estudios p
join ASIGNATURA a
on p.PLAN_ESTUDIOS_ID = a.PLAN_ESTUDIOS_ID
left join ASIGNATURA ar 
-- QUiero que aparezcan los registros de la izquierda que no aparecen
on ar.ASIGNATURA_ID = a.ASIGNATURA_REQUERIDA_ID
where a.CREDITOS=8;

/*RESULTADOS
CALCULO 3	8	PL-2OO4	CALCULO 2
ELECTRICIDAD Y MAGNETISMO	8	PL-2OO4	CALCULO 3
BASES DE DATOS	8	PL-2OO4	INGENIERIA DE SOFTWARE
ALGEBRA	8	PL-2OO4	
BASES DE DATOS DISTRIBUIDAS	8	PL-2OO9	
*/


/*========================[EJERCICIO-22]========================================

Mostrar las asignaturas dependientes, que no pueden cursarse sin antes acreditar 
calculo 2, incluir en la consulta el identificador y en nombre de Cálculo 2 así 
como el identificador y el nombre de las asignaturas dependientes. 

-Emplear sintaxis anterior. La consulta deberá tener los siguientes
nombres de columnas:

ANTECEDENTE_ID | ANTECEDENTE_NOMBRE | DEPENDIENTE_ID  |DEPENDIENTE_NOMBRE
*/

select ar.asignatura_id as antecedente_id, 
    ar.nombre as antecedente_nombre,
    a.asignatura_id as dependiente_id,
    a.nombre as dependiente_nombre
from asignatura a, asignatura ar
where a.asignatura_requerida_id = ar.ASIGNATURA_ID
and ar.nombre = 'CALCULO 2';


/*RESULTADOS
ANTECEDENTE_ID | ANTECEDENTE_NOMBRE | DEPENDIENTE_ID  |DEPENDIENTE_NOMBRE

5	            CALCULO 2	         7	               CALCULO 3
5	            CALCULO 2	         8	               ECUACIONES DIFERENCIALES

*/

--==========================[SERIE-2]========================================

/*========================[EJERCICIO-1]========================================
Generar una sentencia SQL que calcule el número de registros que regresaría el 
producto cartesiano entre las tablas ESTUDIANTE y PLAN_ESTUDIOS.
R: Se debe obtener 69 como resultado.

*/

--consulta numero de registros

select (select count(*) from ESTUDIANTE) * (select count(*) from PLAN_ESTUDIOS)
as "numero de registros"
from dual;

-- RESULTADO = 69


/*========================[EJERCICIO-4]========================================
Generar un reporte que muestre los siguientes datos para cada plan de estudios 
existente en la base de datos: id del plan de estudio, clave del plande 
estudios, y el número de alumnos que pertenecen a cada plan.

*/

select p.plan_estudios_id, p.clave, count(*)
  from ESTUDIANTE e
join PLAN_ESTUDIOS p
on e.PLAN_ESTUDIOS_ID = p.PLAN_ESTUDIOS_ID
group by p.PLAN_ESTUDIOS_ID, p.clave; -- si tenemos funcion de agregacion, agregar group


/*RESULTADO
1	PL-2OO4	8
2	PL-2OO7	9
3	PL-2OO9	6
*/

/*-- con id estudiante -> Problema separaria debido al id_estudiante
select e.estudiante_id, p.plan_estudios_id, p.clave, count(*)
  from ESTUDIANTE e
join PLAN_ESTUDIOS p
on e.PLAN_ESTUDIOS_ID = p.PLAN_ESTUDIOS_ID
group by p.PLAN_ESTUDIOS_ID, p.clave,e.estudiante_id;
*/








