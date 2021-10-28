

SELECT 45 + 90 + NULL AS "RESULTADO"
GO


SELECT 
	idempleado, nombre, apellido,
	sueldo, comision, 
	sueldo + comision "total"
FROM RH.DBO.empleado;
GO


SELECT 
	ISNULL(10,20) CASO1,
	ISNULL(NULL,20) CASO2;
GO

SELECT 
	idempleado, nombre, apellido,
	sueldo, comision, 
	sueldo + ISNULL(comision,0) "total"
FROM RH.DBO.empleado;
GO


select 
	COALESCE ( 10,20,30 ) caso1,
	COALESCE ( null,20,30 ) caso2,
	COALESCE ( 10,null,30 ) caso3,
	COALESCE ( null,null,30 ) caso4;
go


SELECT 
	idempleado, nombre, apellido,
	sueldo, comision, 
	sueldo + COALESCE(comision,0) "total"
FROM RH.DBO.empleado;
GO


/*
Desarrollar una sentencia SELECT para consultar los 
empleados que ingresaron a la empresa un mes de enero.
Base de datos RH.
*/

select * 
from rh.dbo.empleado
where MONTH(fecingreso) = 1;
go

select * 
from rh.dbo.empleado
where DATEPART (month,fecingreso) = 1;
go


/*
Desarrollar una sentencia SELECT para consultar las matrículas 
del último mes. 
Base de datos EDUCA.
*/








