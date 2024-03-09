use empresaTELEMARKETINGS2

begin tran
INSERT INTO EMPLEADO.Empleado VALUES(		--Ejemplo
10,
'V',
'Felipe Sanches',
5551525354,
'Ingeniero',
12,
1,
'Vender',
'No',
25
);
rollback tran