use empresaTELEMARKETINGS2

BEGIN TRAN
DELETE EMPLEADO.Empleado	--Ejemplo
WHERE idEmpleado = 10		--Borramos el empleado generado anteriormente
ROLLBACK TRAN