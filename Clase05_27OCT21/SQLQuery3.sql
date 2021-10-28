/*
Desarrolle una sentencia SELECT para encontrar el salario 
promedio en la empresa. 
Base de datos RH.
*/

select avg(sueldo) "salario promedio"
from rh.dbo.empleado;
go


/*
Desarrollar una sentencia SELECT que permita obtener el 
importe de lo recaudado hasta el momento por los cursos vendidos. 
Base de datos EDUCA.
*/

select sum(pag_importe) "importe recaudado" 
from educa.dbo.PAGO;
go

/*
Desarrollar una sentencia SELECT que permita consultar el importe 
de lo que se tiene comprometido (cobrado y no cobrado) por los 
cursos vendidos hasta el momento. 
Base de datos EDUCA.
*/

select sum(mat_precio) "importe comprometido" 
from educa.dbo.MATRICULA;
go


select iddepartamento, sum(sueldo) planilla
from rh.dbo.empleado
group by iddepartamento;
go

select 
	idcargo, iddepartamento, 
	count(1) empleados,
	sum(sueldo) planilla
from rh.dbo.empleado
group by iddepartamento, idcargo;
go


select 1 "row", e.* 
from rh.dbo.empleado e
go


/*
Desarrolle una sentencia SELECT para encontrar los departamentos 
que tienen más de 5 trabajadores. 
Base de datos RH.
*/

select 
	iddepartamento,
	count(1) empleados
from rh.dbo.empleado
group by iddepartamento
having count(1) > 5;
go


/*
Desarrollar una sentencia SELECT para encontrar la 
cantidad de veces que se ha programado cada curso 
en cada ciclo en el presente año. 
Solo se debe mostrar los cursos que se han programado 
mas de 2 veces. 
Base de datos EDUTEC.
*/

select  
	IdCurso,
	count(1) "programacion"
from edutec.dbo.CursoProgramado
where SUBSTRING(IdCiclo,1,4) = YEAR(GETDATE())
group by IdCurso
having count(1) > 15
order by 1;
go

SELECT SUBSTRING('123456',2,1);
GO



