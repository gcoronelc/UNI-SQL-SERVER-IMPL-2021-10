
-- SUBCONSULTA QUE RETORNA UN CONJUNTO DE VALORES

-- Si se trata de una sola columna
/*

   <columna> [NOT] IN ( subconsulta ) 

*/

/*
EJEMPLO
Se necesita saber que profesores dictaron en el ciclo 2021-07.
Base de datos: EDUTEC
*/


select * FROM EDUTEC..Profesor
WHERE IdProfesor IN ( select distinct IdProfesor from edutec..CursoProgramado where IdCiclo='2021-07' );
GO


-- Como tabla derivada

select * 
FROM EDUTEC..Profesor p
JOIN ( 
	select distinct IdProfesor 
	from edutec..CursoProgramado 
	where IdCiclo='2021-07' ) t on p.IdProfesor = t.IdProfesor;
GO


select cp.*, 'B' tarifa 
from edutec..CursoProgramado cp
where cp.IdCiclo = '2021-10'
and cp.idcurso IN (select idcurso from edutec..curso where IdTarifa='B');
go

select cp.*, c.idtarifa 
from edutec..CursoProgramado cp
join (select idtarifa, idcurso from edutec..curso where IdTarifa='B') c
on cp.IdCurso = c.IdCurso
where cp.IdCiclo = '2021-10'
go


select IdProfesor,ApeProfesor,NomProfesor,EmailProfesor 
from edutec..Profesor
where IdProfesor in (select distinct IdProfesor from edutec..CursoProgramado where IdCiclo='2021-11');
go


select t1.IdProfesor,t1.ApeProfesor,t1.NomProfesor,t1.EmailProfesor 
from edutec..Profesor t1
inner join (select distinct IdProfesor,IdCiclo from edutec..CursoProgramado) t2
on t1.idprofesor=t2.IdProfesor
where t2.IdCiclo='2021-11';
go


Select *
from RH.dbo.empleado A
join (
	Select idcargo, min(sueldo) "sueldo"
	from RH.dbo.empleado
	group by idcargo
	) T on A.idcargo = T.idcargo and A.sueldo = T.sueldo
go


select cp.*, c.idtarifa 
from edutec..CursoProgramado cp
join edutec..curso c on cp.IdCurso = c.IdCurso
where cp.IdCiclo = '2021-10'
and c.IdTarifa = 'B';
go



with V1
as (
	Select IdCiclo, IdCurso, sum(Matriculados) "Matriculados"
	from EduTec.dbo.CursoProgramado
	where IdCiclo like '2021%'
	group by IdCiclo, IdCurso
)
Select A.*, C.NomCurso
from V1 A
join (
	select IdCiclo, min(Matriculados) "Matriculados"
	from V1
	group by IdCiclo
	) B on A.IdCiclo = B.IdCiclo and A.Matriculados = B.Matriculados
join EduTec.dbo.Curso C on A.IdCurso = C.IdCurso;
go


-- subconsultas correlacionadas

select 
	p.IdProfesor, p.NomProfesor, p.ApeProfesor,
	(
		select count(1) from edutec..CursoProgramado cp
		where cp.IdCiclo = '2021-11' and cp.IdProfesor = p.IdProfesor
	) cursos,
	(
		select sum(Matriculados) from edutec..CursoProgramado cp 
		where cp.IdCiclo = '2021-11' and cp.IdProfesor = p.IdProfesor
	) alumnos
from edutec..profesor p;
go


-- USO DE EXISTS Y NOT EXISTS
-- Ejemplo
-- Qué profesores no han dictado clases en el ciclo actual.

select * from edutec..Profesor p
where exists (
	select 1 from edutec..CursoProgramado cp
	where IdCiclo = '2021-11' and cp.IdProfesor = p.IdProfesor
);
go



-- insert con subconsultas
/* 

INSERT INTO TABLA(col1, col2, ... )
SELECT ......
GO

*/

SELECT * FROM EDUCA..ALUMNO;
GO

SELECT * FROM RH..empleado;
GO

INSERT INTO EDUCA..ALUMNO
SELECT 
	1000 + CAST(RIGHT(IDEMPLEADO,3) AS INT) codigo,
	CONCAT('Sr(ta). ', NOMBRE,', ',apellido) NOMBRE,
	'SU CASA' DIRECCION,
	telefono, CONCAT(email,',pe') email
FROM RH..empleado;
GO



-- UPDATE
DROP TABLE rh..PLANILLANOV2021;
GO

SELECT iddepartamento, nombre, 0 emps, 99999999990.11 planilla
into rh..PLANILLANOV2021
FROM RH..departamento;
GO

UPDATE rh..PLANILLANOV2021 SET PLANILLA = 0;
GO


SELECT * FROM RH..PLANILLANOV2021;
GO

UPDATE P
SET P.EMPS = T.EMPS, P.PLANILLA = T.PLANILLA
FROM RH..PLANILLANOV2021 P
JOIN (
	SELECT iddepartamento, COUNT(1) EMPS, SUM(SUELDO) PLANILLA
	FROM RH..empleado GROUP BY iddepartamento
) T
ON P.iddepartamento = T.iddepartamento;
GO



UPDATE RH..PLANILLANOV2021 
SET 
	EMPS = (SELECT COUNT(1) FROM RH..empleado E 
			WHERE PLANILLANOV2021.iddepartamento = E.iddepartamento ),
	PLANILLA = ISNULL((SELECT SUM(SUELDO) FROM RH..empleado E 
			WHERE PLANILLANOV2021.iddepartamento = E.iddepartamento),0.0);
GO	
	






