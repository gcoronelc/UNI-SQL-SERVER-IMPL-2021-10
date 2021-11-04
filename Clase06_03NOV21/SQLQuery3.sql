-- APLICANDO ROLLUP

SELECT iddepartamento, idcargo, SUM(SUELDO) PLANILLA
FROM RH.dbo.empleado
-- GROUP BY iddepartamento, idcargo
GROUP BY ROLLUP (iddepartamento, idcargo)
ORDER BY 1, 2
GO

/*
Desarrolle una sentencia SELECT para encontrar los ingresos 
por mes y los ingresos totales. 
Base de datos EDUCA.
*/


SELECT 
	MONTH(PAG_FECHA) MES,
	SUM(PAG_IMPORTE) INGRESOS
FROM EDUCA.DBO.PAGO 
GROUP BY ROLLUP (MONTH(PAG_FECHA));
GO


-- APLICANDO CUBE

select month(fecingreso)as mes, SUM(sueldo) as PLANILLA
from RH.dbo.empleado
--group by month(fecingreso)
group by cube (month(fecingreso))
go

SELECT iddepartamento, idcargo, SUM(SUELDO) PLANILLA
FROM RH.dbo.empleado
GROUP BY CUBE (iddepartamento, idcargo)
GO


-- APLICANDO GROUPING SETS

SELECT iddepartamento, idcargo, SUM(SUELDO) PLANILLA
FROM RH.dbo.empleado
GROUP BY GROUPING SETS ((iddepartamento, idcargo), iddepartamento,())
GO

SELECT iddepartamento, idcargo, SUM(SUELDO) PLANILLA
FROM RH.dbo.empleado
GROUP BY GROUPING SETS ((iddepartamento, idcargo), ())
GO

SELECT iddepartamento, idcargo, SUM(SUELDO) PLANILLA
FROM RH.dbo.empleado
GROUP BY GROUPING SETS ((iddepartamento, idcargo), iddepartamento, idcargo, ())
GO



SELECT iddepartamento, SUM(SUELDO) PLANILLA
FROM RH.dbo.empleado
GROUP BY GROUPING SETS (iddepartamento)
GO

SELECT iddepartamento, SUM(SUELDO) PLANIILA
FROM RH.dbo.empleado
GROUP BY  iddepartamento
GO

