
SELECT * 
FROM RH..empleado
WHERE sueldo = (SELECT MIN(SUELDO) FROM RH..empleado);
GO

SELECT 
	E.*, (SELECT AVG(SUELDO) FROM RH..empleado) "SUELDO PROMEDIO",
	E.sueldo - (SELECT AVG(SUELDO) FROM RH..empleado) "DIFERENCIA"
FROM RH..empleado E
GO

SELECT C.idcargo, C.nombre, (SELECT COUNT(1) FROM RH..empleado E WHERE C.idcargo=E.idcargo) EMPLEADOS
FROM RH..cargo C;
GO

SELECT C.idcargo, C.nombre, COUNT(1) EMPLEADOS
FROM RH..cargo C 
JOIN RH..empleado E ON C.idcargo=E.idcargo
GROUP BY C.idcargo, C.nombre;
GO

