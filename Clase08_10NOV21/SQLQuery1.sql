
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
