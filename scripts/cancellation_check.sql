use empresaTELEMARKETINGS2

--cancellation_check

begin tran 

insert into [VENTA].[Venta] values 
(6,'Venta de peluches', '2022-12-02', '2022-12-02 09:02:14.000',1,842231545,'2022-11-21','Peluche de Princesa',4011664960121897,1,1)

rollback tran
GO