with
v1 as (
	select *
	from edutec..CursoProgramado 
	where idciclo = '2020-02'
)
select *
from edutec..Curso C
LEFT JOIN v1 CP on C.IdCurso = CP.IdCurso
ORDER BY 1
go


with
v1 as (
	select distinct IdCurso
	from edutec..CursoProgramado 
	where idciclo = '2020-02'
)
select *
from edutec..Curso C
where IdCurso not in (select idcurso from v1);
go


/*
EJERCICIO
BASE DE DATOS: EDUCA
REPORTE

NOMBRE CURSO       MATRICULADOS      PROYECTADO      RECAUDADO      FALTA COBRAR
-----------------------------------------------------------------------------------------
SQL SERVER 2            40           10,000.00       5,300.00          4,700.00
JAVA OO           .....
PUTHON            .....

-----------------------------------------------------------------------------------------
*/

-- CONSULTA MALA
WITH
V1 AS (
	SELECT 
		c.cur_id, c.cur_nombre, c.cur_matriculados,
		sum(m.mat_precio) "IMPORTE PROYECTADO",
		SUM(p.pag_importe) "IMPORTE COBRADO"
	FROM EDUCA..CURSO C
	JOIN EDUCA..MATRICULA M ON C.cur_id = M.cur_id
	JOIN EDUCA..PAGO P ON M.cur_id = P.cur_id AND M.alu_id = P.alu_id
	GROUP BY c.cur_id, c.cur_nombre, c.cur_matriculados
)
SELECT V1.*, (V1.[IMPORTE PROYECTADO] - V1.[IMPORTE COBRADO]) "FALTA COBRAR"
FROM V1;
GO


select sum(cur_matriculados)
from educa..CURSO;
go


select sum(mat_precio) "PROYECTADO"
from educa..MATRICULA;
go


SELECT *
FROM EDUCA..CURSO C
JOIN EDUCA..MATRICULA M ON C.cur_id = M.cur_id;
GO


SELECT 
	C.cur_id, C.cur_nombre, 
	COUNT(C.cur_matriculados) MATRICULADOS,
	SUM(M.mat_precio) PROYECTADO
FROM EDUCA..CURSO C
JOIN EDUCA..MATRICULA M ON C.cur_id = M.cur_id
GROUP BY C.cur_id, C.cur_nombre;
GO


-- CONSULTA CHEVERE

WITH
V1 AS (
	SELECT cur_id, SUM(mat_precio) PROYECTO
	FROM EDUCA..MATRICULA
	GROUP BY cur_id
),
V2 AS (
	SELECT cur_id, SUM(pag_importe) RECAUDADO
	FROM EDUCA..PAGO
	GROUP BY cur_id
)
SELECT 
	C.cur_id, C.cur_nombre, C.cur_matriculados,
	V1.PROYECTO, ISNULL(V2.RECAUDADO,0) RECAUDADO,
	V1.PROYECTO -  ISNULL(V2.RECAUDADO,0) "FALTA COBRAR"
FROM EDUCA..CURSO C 
JOIN V1 ON C.cur_id = V1.cur_id
LEFT JOIN V2 ON C.cur_id = V2.cur_id;
GO


