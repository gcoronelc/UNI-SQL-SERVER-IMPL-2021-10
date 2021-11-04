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
	idCurso,
	sum(case when SUBSTRING(idciclo,6,2)='01' then Matriculados*PreCursoProg else 0 end) ENERO,
	sum(IIF(SUBSTRING(idciclo,6,2)='02',Matriculados*PreCursoProg,0)) FEBRERO,
	sum(IIF(SUBSTRING(idciclo,6,2)='03',Matriculados*PreCursoProg,0)) MARZO,
	sum(IIF(SUBSTRING(idciclo,6,2)='04',Matriculados*PreCursoProg,0)) ABRIL,
	sum(IIF(SUBSTRING(idciclo,6,2)='05',Matriculados*PreCursoProg,0)) MAYO,
	sum(IIF(SUBSTRING(idciclo,6,2)='06',Matriculados*PreCursoProg,0)) JUNIO,
	sum(IIF(SUBSTRING(idciclo,6,2)='07',Matriculados*PreCursoProg,0)) JULIO,
	sum(IIF(SUBSTRING(idciclo,6,2)='08',Matriculados*PreCursoProg,0)) AGOSTO,
	sum(IIF(SUBSTRING(idciclo,6,2)='09',Matriculados*PreCursoProg,0)) SETIEMBRE,
	sum(IIF(SUBSTRING(idciclo,6,2)='10',Matriculados*PreCursoProg,0)) OCTUBRE,
	sum(IIF(SUBSTRING(idciclo,6,2)='11',Matriculados*PreCursoProg,0)) NOVIEMBRE,
	sum(IIF(SUBSTRING(idciclo,6,2)='12',Matriculados*PreCursoProg,0)) DOCIEMBRE,
	sum(Matriculados*PreCursoProg)  IMPORTE_TOTAL
from edutec..CursoProgramado 
where SUBSTRING(idciclo,1,4) = 2020
group by idCurso;
go





