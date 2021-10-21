-- SELECT


-- Ejemplo basico de SELECT
-- El * indica todas las columnas

SELECT * FROM RH.dbo.empleado
WHERE idcargo = 'C02';
GO


-- INSERT

select * from RH.dbo.cargo;
go

-- Esta sentencia genera un error 
-- por que falta el dato para una columna.
INSERT INTO RH.dbo.cargo VALUES('C15','Jefe',7500.0)
go

-- Esta sentencia si se ejecuta correctamente.
-- La cantidad de columnas y datos es la misma, 
-- y son compatibles.
INSERT INTO RH.dbo.cargo VALUES('C15','Jefe',7500.0,9000.0)
go

-- Se recomienda siempre indicar las columnas.
INSERT INTO RH.dbo.cargo(idcargo,nombre,sueldo_min,sueldo_max)
VALUES('C77','Asesor',30000.0,60000.0)
go


-- INSERT con SELECT

SELECT * FROM EDUCA.DBO.ALUMNO;
GO

SELECT ROW_NUMBER ( ) OVER(ORDER BY idempleado ASC) + 100 AS Row,
	CONCAT(nombre,', ',apellido),
	'Falta', telefono, email
FROM RH.DBO.empleado;
GO

insert into EDUCA.DBO.ALUMNO
(alu_id,alu_nombre, alu_direccion,alu_telefono,alu_email)
SELECT  ROW_NUMBER ( ) OVER(ORDER BY idempleado ASC) + 100 AS Row,
	CONCAT(nombre,', ',apellido),
	'Falta', telefono, email
FROM RH.DBO.empleado;
GO




