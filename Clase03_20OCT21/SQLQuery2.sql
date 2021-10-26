
-- SQL Server por defecto funciona en modo
-- confirmación automática de transacciones.
-- Toda operación es confirmada de manera automática.

select * from rh.dbo.emp_c02;
go

delete from rh.dbo.emp_c02;
go

select * from rh.dbo.emp_c02;
go

rollback;
go

-- Carga de datos

insert into rh.dbo.emp_c02
SELECT *  
FROM rh.dbo.empleado
WHERE idcargo = 'C02';
go

select * from rh.dbo.emp_c02;
go

-- Delete con Where

select * from educa.dbo.alumno;
go


DELETE FROM educa.dbo.alumno
WHERE alu_direccion = 'Falta';
GO


-- UPDATE

SELECT * FROM EDUCA.DBO.MATRICULA;
GO

BEGIN TRAN;
GO

select @@TRANCOUNT;
go

UPDATE EDUCA.dbo.MATRICULA 
SET mat_nota = 18;
GO

SELECT * FROM EDUCA.dbo.MATRICULA;
GO

ROLLBACK;
GO

SELECT * FROM EDUCA.dbo.MATRICULA;
GO


-- UPDATE - WHERE

SELECT * FROM EDUCA.DBO.MATRICULA;
GO

BEGIN TRAN;
GO

SELECT @@TRANCOUNT;
GO

UPDATE EDUCA.dbo.MATRICULA 
SET mat_nota = 18
WHERE cur_id = 2 AND alu_id = 2;
GO

SELECT * FROM EDUCA.dbo.MATRICULA;
GO

COMMIT;
GO

SELECT * FROM EDUCA.dbo.MATRICULA;
GO


-- Atualizando el ID - Integriddad Referencial

select * from RH.dbo.cargo;
go

update RH.dbo.cargo
set idcargo = 'C88'
where idcargo = 'C03';
go

-- Aquí hay un error de integridad referencial.


-- DELETE - Problema de Integridad Referencial


delete from RH.dbo.cargo
where idcargo = 'C03';
go


SET DATEFORMAT DMY
GO


INSERT INTO rh.dbo.empleado ( idempleado , apellido, 
nombre, fecingreso , idcargo , iddepartamento , sueldo ) 
VALUES ( 'E8899', 'Ramos', 'Enrique', '30/05/2011', 'C03', 104, 4000.0 );
go


-- TRANSACCION IMPLICITA
/*
Si se habilita, deshabilita las otras dos.
El inicio de la transacción la activa una de las siguientes
sencias:
   - insert
   - update
   - delete
   - select
Cualquiera de ellas que se ejecute primero, activa la transacción.
*/

SET IMPLICIT_TRANSACTIONS ON;
go

select @@TRANCOUNT;
go


select * from rh.dbo.cargo;
go

insert into rh.dbo.cargo values('K03', 'Jefe de todos', 30000, 60000);
go


rollback;
go

commit;
go


SET IMPLICIT_TRANSACTIONS OFF;
go

