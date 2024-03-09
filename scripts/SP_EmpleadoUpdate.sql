use empresaTELEMARKETINGS2

begin tran
UPDATE EMPLEADO.Empleado	--Ejemplo
SET asegurado = 0			--Actualizamos el dato del seguro
WHERE idEmpleado = 1		--Condicion	
rollback tran