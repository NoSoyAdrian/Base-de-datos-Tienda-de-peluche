use empresaTELEMARKETINGS2

begin tran
EXEC SPI_INSERTAR_Pagos 25000, 3000, 1;
SELECT * FROM EMPLEADO.Pagos
rollback tran