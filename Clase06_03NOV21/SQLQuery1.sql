-- EJERCICIO
/*
BASE DE DATOS: EDUTECT
Ingresos por mes de un determinado año.
Esto es por curso.

CURSO             ENERO   FEBRERO   MARZO  .... DICIEMBRE    TOTAL
----------------------------------------------------------------------
JAVA  .....
SQL SERVER ....


----------------------------------------------------------------------
Se podria aplicar CASE o IIF
*/

select 
	sum(Matriculados*PreCursoProg)  IMPORTE_TOTAL
from edutec..CursoProgramado 
where SUBSTRING(idciclo,1,4) = 2020




