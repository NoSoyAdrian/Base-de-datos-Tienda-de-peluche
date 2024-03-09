use empresaTELEMARKETINGS2

begin tran
EXEC SPI_INSERTAR_WEB 'Peluche Volador', 1, 'Activada';
SELECT * FROM EMPLEADO.PaginaWeb
rollback tran