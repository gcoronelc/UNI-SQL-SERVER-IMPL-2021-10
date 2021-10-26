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

SP_HELP cargo;
GO

SELECT * FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='CARGO';


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


-- TRUNCATE

-- Se crea una tabla con la sentencia SELECT

SELECT * INTO rh.dbo.emp_c02 
FROM rh.dbo.empleado
WHERE idcargo = 'C02';
go

select * from rh.dbo.emp_c02;
go

truncate table rh.dbo.emp_c02;
go

insert into rh.dbo.emp_c02
SELECT *  
FROM rh.dbo.empleado
WHERE idcargo = 'C02';
go


-- DELETE es transaccional

begin tran;
go

delete from rh.dbo.emp_c02;
go

select * from rh.dbo.emp_c02;
go

rollback;
go

select * from rh.dbo.emp_c02;
go

-- Y que pasa con TRUNCATE

begin tran;
go

select @@TRANCOUNT;
go

truncate table rh.dbo.emp_c02;
go

select * from rh.dbo.emp_c02;
go

rollback;
go

select * from rh.dbo.emp_c02;
go


-- Y el drop table

begin tran;
go

-- Número de transacciones activas
select @@TRANCOUNT;
go

select * from rh.dbo.emp_c02;
go

drop table rh.dbo.emp_c02;
go

rollback; -- COMMIT;
go

select * from rh.dbo.emp_c02;
go


