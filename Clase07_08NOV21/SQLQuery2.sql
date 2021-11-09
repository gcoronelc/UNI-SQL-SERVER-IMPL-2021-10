
/*
Crear una tabla con la misma estructura.
Pero sin datos.
Se usa un where con una condición que no cumple ninguna fila.
*/

select * 
into alumno2
from Alumno
where alu_id=-1;
go

select * from alumno2;
go

-- planilla

with 
v1 as (
	select 
		iddepartamento, 
		sum(sueldo + ISNULL(comision,0)) planilla
	from rh..empleado
	group by iddepartamento 
)
select 
	d.iddepartamento, d.nombre, v1.planilla,
	v1.planilla * 1.15 planilla15
into rh..planilla
from v1 join rh..departamento d on v1.iddepartamento = d.iddepartamento;
go

select * from rh..planilla;
go


select 'curso' tipo, cur_id, cur_nombre from educa..CURSO
union
select 'alumno' tipo, alu_id, alu_nombre from educa..ALUMNO
go


select top 3 *
from rh..empleado;
go

select top 3 PERCENT *
from rh..empleado;
go

select top 2 with ties *
from rh..empleado
order by sueldo;
go

-- DISTINCT

SELECT COUNT(idcargo) "EMPLEADOS QUE TIENEN CARGO"
FROM RH..empleado;
GO

SELECT COUNT(DISTINCT idcargo) "CANTIDAD DE CARGO UTILIZADOS"
FROM RH..empleado;
GO

SELECT DISTINCT idcargo "CARGO UTILIZADOS"
FROM RH..empleado;
GO

SELECT * FROM RH..cargo;
GO


-------------------------------------------------

SELECT COUNT(JEFE) "CANTIDAD EMPLEADOS QUE TIENEN JEFE"
FROM RH..empleado;
GO

SELECT COUNT(DISTINCT JEFE) "CANTIDAD EMPLEADOS QUE SON JEFES"
FROM RH..empleado;
GO


SELECT DISTINCT JEFE "EMPLEADOS QUE SON JEFES"
FROM RH..empleado
WHERE JEFE IS NOT NULL;
GO




SELECT TOP 2 IDCARGO, SUM(SUELDO) PLANILLA
FROM RH..empleado
GROUP BY idcargo;
GO


/*
Mostrar por cada cargo el empleado que tiene mayor sueldo.
También se debe mostrar los empates.
*/


with 
v1 as (
	select idcargo, max(sueldo) sueldo_mayor
	from rh..empleado
	group by idcargo
)
select e.*
from rh..empleado e
join v1 on e.idcargo=v1.idcargo and e.sueldo=v1.sueldo_mayor
order by e.idcargo;
go






