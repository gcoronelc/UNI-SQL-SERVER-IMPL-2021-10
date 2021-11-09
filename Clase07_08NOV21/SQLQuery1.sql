
select * from educa..CURSO;
go

select * from educa..ALUMNO;
go

select * 
from educa..CURSO cross join educa..ALUMNO;
go

select * from RH..empleado;
go


SELECT E.idempleado, E.nombre, E.apellido, CONCAT(J.nombre,' ',J.apellido) JEFE
FROM RH..empleado E
LEFT JOIN RH..empleado J ON E.jefe = J.idempleado;
GO








