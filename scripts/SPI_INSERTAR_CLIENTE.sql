use empresaTELEMARKETINGS2

begin tran
EXEC SPI_INSERTAR_CLIENTE 1234123412341234, 'Juanito', 'Barranquilla', 'Meza', 'JuanMecanico@gmail.com', '12-01-2022', 'Peluche Temporada 29', 24,5529430149,0, 'Mexico', 'Coyoacan', 847, 'Insurgentes';
SELECT * FROM CLIENTE.Cliente
rollback tran