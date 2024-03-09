use empresaTELEMARKETINGS2

SELECT * FROM CLIENTE.Cliente
begin tran 
INSERT INTO CLIENTE.Cliente VALUES		--Ejemplo
(
1513341415161415,
'Brandon',
'brandon@gmail.com',
'Solis',
'Hernandez',
'2018-10-20',
'Peluche temporada 34',
20,
5582043815,
0
);
rollback tran
GO