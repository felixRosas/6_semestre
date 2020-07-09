--@Autor(es):       Alfonso Murrieta
--@Fecha creación: 07/05/20
--@Descripción:  Script clase- Join's 07/05/20


/*=====================[EJERCICIO-18]=========================================
Generar una sentencia SQL que muestre el identificador del profesor, su nombre, 
sus apellidos, y la clave del grupo de todos los cursos que se imparten en el 
semestre_id = 1 de la asignatura BASES DE DATOS. Emplear:

-Sintaxis anterior.
- Natural Join.

*/


--SINTAXIS PASADA
select p.profesor_id, p.nombre, p.apellido_paterno, p.apellido_materno,
    c.clave_grupo
from asignatura a, profesor p, curso c
where p.profesor_id=c.profesor_id
and c.asignatura_id=a.asignatura_id
and c.semestre_id = 1
and a.nombre='BASES DE DATOS';

--NATURAL JOIN

select profesor_id, p.nombre, apellido_paterno, apellido_materno,
    clave_grupo
from profesor p natural join curso c
join asignatura a using(asignatura_id)
where semestre_id=1 
and a.nombre='BASES DE DATOS';


/*SALIDA
19	JAVIER	BARRERA	MUÑOZ	001
20	ELSA	PEDROZA	SOLANO	002
21	MARIANELA	FLORES	OLVERA	003
22	AXEL	SOLANO	RUBIO	004
23	SAMANTA	MIRANDA	ORTEGA	005
*/



/*=====================[EJERCICIO-20]=========================================

Se desea generar un reporte de todos los estudiantes que pertenecen al plan de 
estudios con id = 2, así como de los posibles exámenes extraordinarios que han 
presentado. El reporte debe contener las siguientes columnas:
*/

select e.nombre, e.apellido_paterno, e.apellido_materno, a.nombre,ex.calificacion
from estudiante e
left join estudiante_extraordinario ex
on e.estudiante_id=ex.estudiante_id
 join asignatura a
on ex.asignatura_id= a.asignatura_id
where e.plan_estudios_id=2;

/*SALIDA

MARTHA	RODRIGUEZ	GOMEZ	ANALISIS DE CIRCUITOS ELECTRICOS	5
MARTHA	RODRIGUEZ	GOMEZ	ANALISIS DE CIRCUITOS ELECTRICOS	5
LAURA ELENA	FONSECA	PEREZ	PROGRAMACION AVANZADA MET.NUM.	5
LAURA ELENA	FONSECA	PEREZ	PROGRAMACION AVANZADA MET.NUM.	5
LAURA ELENA	FONSECA	PEREZ	ELECTRICIDAD Y MAGNETISMO	6
LAURA ELENA	FONSECA	PEREZ	ALGORITMOS Y ESTRUCTURA DE DATOS	7
LAURA ELENA	FONSECA	PEREZ	ANALISIS DE SISTEMAS Y SEÑALES	7
LAURA ELENA	FONSECA	PEREZ	BASES DE DATOS ESPACIALES	5

*/

/*=====================[EJERCICIO-AUX]=========================================

Mostrar el nombre del estudiante, el nombre de la asginatura, el nombre del 
profesor, la clave del plan de estudios y sus calificaciones para el semestre 
2008-1, para todos aquellos estudiantes y profesores que tengan el mismo 
appellido paterno. NATURAL JOIN
7 tablas = 6 joins
// n-1 joins 
    n   n   n   
pl<--e<--ei<--c-->a //using
              |-->s //using ya que hay problema con columna fech_ini y fin de pl
              |-->p //using ya que hay problema con columna nombre de ei

*/

select e.nombre,a.nombre,p.nombre,clave,calificacion,
e.apellido_paterno,p.apellido_paterno, -- no lleva alias el paterno por el using
e.apellido_materno,p.apellido_materno
from plan_estudios pl natural join estudiante e
natural join estudiante_inscrito ei
natural join curso c
join profesor p using(profesor_id)
join semestre s using(semestre_id)
join asignatura a using(asignatura_id)
where s.anio=2008 and periodo=1
order by 1,3;

/* SALIDA

ALBERTO	BASES DE DATOS ESPACIALES	ELSA	PL-2OO4	5	TOLEDO	PEDROZA	MARQUEZ	SOLANO
ALBERTO	CALCULO 1	JULIAN	PL-2OO9	7	LOPEZ	VALDEZ	MENDOZA	SANCHEZ
ALBERTO	GEOMETRIA ANALITICA	OMAR	PL-2OO9	5	LOPEZ	KRAUCE	MENDOZA	LOPEZ
ALFREDO	BASES DE DATOS ESPACIALES	AXEL	PL-2OO7	9	FLORES	SOLANO	LUNA	RUBIO
ALONSO	BASES DE DATOS ESPACIALES	ELSA	PL-2OO4	6	NOGUERA	PEDROZA	AGUILAR	SOLANO
ANTONIO ALEJANDRO	CALCULO 1	JULIAN	PL-2OO7	9	GUZMAN	VALDEZ	NIETO	SANCHEZ
ANTONIO ALEJANDRO	ALGEBRA	OMAR	PL-2OO7	10	GUZMAN	KRAUCE	NIETO	LOPEZ
ANTONIO ALEJANDRO	GEOMETRIA ANALITICA	OMAR	PL-2OO7	6	GUZMAN	KRAUCE	NIETO	LOPEZ
ARTURO	ALGEBRA LINEAL	HUGO	PL-2OO7	5	JIMENEZ	FLORES	SANCHEZ	LINARES
CARLA	BASES DE DATOS ESPACIALES	AXEL	PL-2OO9	5	LOPEZ	SOLANO	VILLAREAL	RUBIO
HERNAN	CALCULO 1	JULIAN	PL-2OO7	7	MARTINEZ	VALDEZ	PAEZ	SANCHEZ
HERNAN	ALGEBRA	OMAR	PL-2OO7		MARTINEZ	KRAUCE	PAEZ	LOPEZ
HERNAN	GEOMETRIA ANALITICA	OMAR	PL-2OO7	5	MARTINEZ	KRAUCE	PAEZ	LOPEZ
HILARIO DE JESUS	BASES DE DATOS ESPACIALES	AXEL	PL-2OO7	8	DURAN	SOLANO	LARA	RUBIO
HUGO	CALCULO 1	JULIAN	PL-2OO7	8	MONROY	VALDEZ	ZUÑIGA	SANCHEZ
HUGO	ALGEBRA	OMAR	PL-2OO7	6	MONROY	KRAUCE	ZUÑIGA	LOPEZ
HUGO	GEOMETRIA ANALITICA	OMAR	PL-2OO7	8	MONROY	KRAUCE	ZUÑIGA	LOPEZ
JUAN	CALCULO 1	JULIAN	PL-2OO4	10	JUAREZ	VALDEZ	MENDOZA	SANCHEZ
JUAN	ALGEBRA	OMAR	PL-2OO4	7	JUAREZ	KRAUCE	MENDOZA	LOPEZ
JUAN	GEOMETRIA ANALITICA	OMAR	PL-2OO4	9	JUAREZ	KRAUCE	MENDOZA	LOPEZ
LISETTE	BASES DE DATOS ESPACIALES	ELSA	PL-2OO9	6	CASARES	PEDROZA	ORTEGA	SOLANO
MARIANA	CALCULO 1	JULIAN	PL-2OO9	9	AGUIRRE	VALDEZ	PEREZ	SANCHEZ
MARICELA	BASES DE DATOS ESPACIALES	AXEL	PL-2OO9	7	GUTIERREZ	SOLANO	DURAN	RUBIO
MARICELA	ALGEBRA LINEAL	HUGO	PL-2OO4	8	SANROMAN	FLORES	PEÑA	LINARES
MONSERRAT	BASES DE DATOS ESPACIALES	ELSA	PL-2OO9	7	LANDEROS	PEDROZA	LUJAN	SOLANO
VIRIDIANA	CALCULO 1	JULIAN	PL-2OO4	9	AGUIRRE	VALDEZ	MONTES	SANCHEZ
VIRIDIANA	GEOMETRIA ANALITICA	OMAR	PL-2OO4	10	AGUIRRE	KRAUCE	MONTES	LOPEZ
VIRIDIANA	ALGEBRA	OMAR	PL-2OO4	5	AGUIRRE	KRAUCE	MONTES	LOPEZ

*/



/*=====================[EJERCICIO-AUX]=========================================

Mostrar un reporte de los profesores existentes en la escuela. Los datos del reporte son:
• Nombre y apellidos del profesor
• Identificador del semestre
• DE EXISTIR, clave del grupo, identificador de la asignatura, clave del grup,
indentificar de la asignatura e identificador del semestre de los curos que han impartidoo.
• Emplea: Sintaxis estanar y anterior 

//MOLECULA

p-->c--A

*/

select p.nombre, p.apellido_paterno, p.apellido_materno,c.semestre_id, 
a.nombre, c.clave_grupo
from profesor p 
left join curso c 
on p.profesor_id=c.profesor_id
left join asignatura a
on c.asignatura_id= a.asignatura_id;

/*
OMAR	KRAUCE	LOPEZ	1	ALGEBRA	001
MARIA GUADALUPE	GUTIERREZ	OLVERA	1	ALGEBRA	002
OMAR	KRAUCE	LOPEZ	1	GEOMETRIA ANALITICA	001
JULIAN	VALDEZ	SANCHEZ	1	GEOMETRIA ANALITICA	002
MARGARITA	LUJAN	HURTADO	1	GEOMETRIA ANALITICA	003
JULIAN	VALDEZ	SANCHEZ	1	CALCULO 1	001
JULIAN	VALDEZ	SANCHEZ	1	CALCULO 1	004
MARGARITA	LUJAN	HURTADO	1	CALCULO 1	002
HUGO	FLORES	LINARES	1	CALCULO 1	003
HUGO	FLORES	LINARES	1	ALGEBRA LINEAL	001
OMAR	KRAUCE	LOPEZ	1	CALCULO 2	001
MARIA GUADALUPE	GUTIERREZ	OLVERA	1	CALCULO 2	002
JULIAN	VALDEZ	SANCHEZ	1	CALCULO 2	003
MARGARITA	LUJAN	HURTADO	1	CALCULO 2	004
HUGO	FLORES	LINARES	1	CALCULO 2	005
SOCORRO	ZUÑIGA	GUTIERREZ	1	COMPUTO PARA INGENIEROS	001
SOCORRO	ZUÑIGA	GUTIERREZ	1	COMPUTO PARA INGENIEROS	005
LENIN	RUIZ	SUAREZ	1	COMPUTO PARA INGENIEROS	002
LENIN	RUIZ	SUAREZ	1	COMPUTO PARA INGENIEROS	006
ELIASAR	HUERTA	AGUILAR	1	COMPUTO PARA INGENIEROS	003
FELIPE	LIMA	RODRIGUEZ	1	COMPUTO PARA INGENIEROS	004
FELIPE	LIMA	RODRIGUEZ	1	ALGORITMOS Y ESTRUCTURA DE DATOS	001
JAVIER	BARRERA	MUÑOZ	1	ALGORITMOS Y ESTRUCTURA DE DATOS	002
ELSA	PEDROZA	SOLANO	1	ALGORITMOS Y ESTRUCTURA DE DATOS	003
JAVIER	BARRERA	MUÑOZ	1	BASES DE DATOS	001
ELSA	PEDROZA	SOLANO	1	BASES DE DATOS	002
MARIANELA	FLORES	OLVERA	1	BASES DE DATOS	003
AXEL	SOLANO	RUBIO	1	BASES DE DATOS	004
SAMANTA	MIRANDA	ORTEGA	1	BASES DE DATOS	005
SAMANTA	MIRANDA	ORTEGA	1	BASES DE DATOS AVANZADAS	001
JAVIER	BARRERA	MUÑOZ	1	BASES DE DATOS DISTRIBUIDAS	001
ELSA	PEDROZA	SOLANO	1	BASES DE DATOS ESPACIALES	001
AXEL	SOLANO	RUBIO	1	BASES DE DATOS ESPACIALES	002
JUAN	MEJIA	OSORIO			
LUISA	VALDEZ	SALAZAR			
ARMANDO	LOZANO	ESCOBAR			
HILARIO	JIMENEZ	DE LA LUNA			
ALEJANDRO	CANALES	BORIS			
LILIAN	ACOSTA	PORTALES			
RUBEN	UBALDO	SORIANO			
SOFIA	YEBRA	ACEVEDO			
GERARDO	FERNANDEZ	HERNANDEZ			
SANTIAGO	DE LA PEÑA	GUZMAN			
MARIA GUADALUPE	GUTIERREZ	OLVERA			


*/




