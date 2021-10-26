
/*
SELECCION DE COLUMNAS
*/

select * from rh.dbo.empleado;
go

select idempleado, nombre, apellido 
from rh.dbo.empleado;
go

/*
CAMPOS CALCULADOS EN UNA TABLA
*/

CREATE TABLE dbo.Notas
(
	ID int IDENTITY (1,1) NOT NULL,
	NOMBRE VARCHAR(50) NOT NULL,
	NOTA1 INT NOT NULL,
	NOTA2 INT NOT NULL,
	PROMEDIO AS (NOTA1 + NOTA2) / 2
);

INSERT INTO NOTAS VALUES('Gustavo', 15, 16);
go

SELECT * FROM dbo.Notas;
GO

-- Error, PROMEDIO es una columna calculada.
UPDATE NOTAS SET PROMEDIO = 20;
GO


UPDATE NOTAS SET NOTA1 = 20;
GO

INSERT INTO NOTAS(nombre,nota1,nota2)
VALUES('Ricardo', 18, 20);
go

SELECT * FROM dbo.Notas;
GO


/*
CAMPOS CALCULADOS EN EL SELECT
*/

/*
Desarrollar una consulta que permita mostrar las vacantes programadas, 
los matriculados y las vacantes disponibles de cada curso programado
de la base de datos EDUTEC.
*/

select 
	IdCursoProg, IdCiclo, IdCurso, Horario,
	(Vacantes + Matriculados) "Vacantes Programadas",
	Matriculados, Vacantes "Vacantes Disponibles",
	CAST(Matriculados * 100.0 / (Vacantes + Matriculados) AS NUMERIC(10,0)) "Rendimiento"
from EduTec.dbo.CursoProgramado
order by IdCiclo desc, IdCurso
go


/*
El área de recursos humanos necesita una consulta que permita 
mostrar de cada empleado su sueldo actual y cuanto sería su 
incremento si se proyecta un aumento del 20% a cada uno 
respectivamente.
*/

select 
	idempleado, apellido, nombre, sueldo, 
	CAST(sueldo*1.20 AS NUMERIC(12,2)) "Sueldo Proyectado"
from rh.dbo.empleado;
go

select 
	idempleado, apellido, nombre, sueldo, 
	CONVERT( VARCHAR(50), CAST(sueldo*1.20 AS MONEY),1) "Sueldo Proyectado"
from rh.dbo.empleado;
go

SELECT CONVERT(VARCHAR(50), CAST( 123456789.1 AS MONEY ),1);
GO


/*
CONCATENACION
*/

select 
	idempleado, apellido + ', ' + nombre "Nombre Completo", 
	sueldo, 
	CAST(sueldo*1.20 AS NUMERIC(12,2)) "Sueldo Proyectado"
from rh.dbo.empleado;
go


select 
	idempleado, concat(apellido, ', ', nombre) "Nombre Completo", 
	sueldo, 
	CAST(sueldo*1.20 AS NUMERIC(12,2)) "Sueldo Proyectado"
from rh.dbo.empleado;
go


SELECT IDCURSOPROG "CODIGO"
,CONCAT(IDCICLO, '/', IDCURSO) "CURSO"
,CONCAT(MATRICULADOS, '/', (VACANTES+MATRICULADOS))"VACANTES"
FROM edutec.dbo.CURSOPROGRAMADO;
go


/*

SELECT <columnas>
FROM <tabla>
WHERE <condicion>
ORDER BY <columnas>

*/



SELECT IDCURSOPROG "CODIGO"
,CONCAT(IDCICLO, '/', IDCURSO) "CURSO"
,CONCAT(MATRICULADOS, '/', (VACANTES+MATRICULADOS))"VACANTES"
FROM edutec.dbo.CURSOPROGRAMADO
where IdCiclo = '2021-12';
go


SELECT IDCURSOPROG "CODIGO"
,CONCAT(IDCICLO, '/', IDCURSO) "CURSO"
,CONCAT(MATRICULADOS, '/', (VACANTES+MATRICULADOS))"VACANTES"
FROM edutec.dbo.CURSOPROGRAMADO
where IdCiclo = '2021-10' OR IdCiclo = '2021-11';
go


SELECT IDCURSOPROG "CODIGO"
,CONCAT(IDCICLO, '/', IDCURSO) "CURSO"
,CONCAT(MATRICULADOS, '/', (VACANTES+MATRICULADOS))"VACANTES"
FROM edutec.dbo.CURSOPROGRAMADO
where IdCiclo = '2021-10'
UNION
SELECT IDCURSOPROG "CODIGO"
,CONCAT(IDCICLO, '/', IDCURSO) "CURSO"
,CONCAT(MATRICULADOS, '/', (VACANTES+MATRICULADOS))"VACANTES"
FROM edutec.dbo.CURSOPROGRAMADO
where IdCiclo = '2021-11';
go


SELECT IDCURSOPROG "CODIGO"
,CONCAT(IDCICLO, '/', IDCURSO) "CURSO"
,CONCAT(MATRICULADOS, '/', (VACANTES+MATRICULADOS))"VACANTES"
FROM edutec.dbo.CURSOPROGRAMADO
where IdCiclo IN ('2021-10','2021-11');
go


SELECT IDCURSOPROG "CODIGO"
,CONCAT(IDCICLO, '/', IDCURSO) "CURSO"
,CONCAT(MATRICULADOS, '/', (VACANTES+MATRICULADOS))"VACANTES"
FROM edutec.dbo.CURSOPROGRAMADO
where IdCiclo LIKE '2021-1[01]';
go


SELECT IDCURSOPROG "CODIGO"
,CONCAT(IDCICLO, '/', IDCURSO) "CURSO"
,CONCAT(MATRICULADOS, '/', (VACANTES+MATRICULADOS))"VACANTES"
FROM edutec.dbo.CURSOPROGRAMADO
where IdCiclo BETWEEN '2021-10' AND '2021-11';
go


SELECT * 
FROM RH.DBO.empleado  
where sueldo BETWEEN 3000 AND 8000;
go

SELECT * 
FROM RH.DBO.empleado  
ORDER BY nombre;
GO


SELECT * 
FROM RH.DBO.empleado  
WHERE SUBSTRING(NOMBRE,1,1) BETWEEN 'G' AND 'M'
ORDER BY nombre;
GO



