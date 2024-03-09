USE empresaTELEMARKETINGS1
go

/*
 * 
 * Company :      Equipo de Bases de Datos 
 * Project :      Proyecto.DM1
 * Author :       Rivera Morales Alan Adrian
 *
 * Date Created : 30/12/2022
  SD
 */


select * from EMPLEADO.Empleado

 begin tran 
 insert into [EMPLEADO].[Empleado] values 
 (1,'V', 'Aldo', 5534057290, 'Administracion', 5 , 1 , 'Venta', 'No',34 ),
 (2,'A', 'Carlos', 5529461048, 'Ventas', 2, 1, 'Almacenar', 'No', 24),
 (3,'AC', 'Gabriel', 5529103649, 'Administracion', 1, 0, 'RH', 'Si', 26),
 (4,'M', 'Marcos', 5573629327, 'Administracion', 6,1,'Checar WEB', 'No', 36),
 (5,'C', 'Sandra', 5537186189, 'Contador', 8,1,'Finanzas','Si',23)

commit tran
 --rollback tran
 select * from EMPLEADO.Empleado
 go

  begin tran 
 insert into [EMPLEADO].[Empleado] values 
 (6,'V', 'Davinia', 5511245976, 'Administracion', 7 , 1 , 'Venta', 'No',23 ),
 (7,'V', 'Dionisio', 556062909, 'Contaduria', 4 , 0 , 'Venta', 'Si',42 ),
 (8,'V', 'Sabina', 5572578559, 'Ventas', 2 , 1 , 'Venta', 'No',22 ),
 (9,'V', 'Ion', 5539472938, 'Administracion', 1 , 1 , 'Venta', 'No',24 ),
 (10,'V', 'Nora', 5520374018, 'Administracion', 1 , 1 , 'Venta', 'No',19 ),
 (11,'V', 'Sofia', 5573012534, 'Ventas', 5 , 1 , 'Venta', 'SI',23 ),
 (12,'V', 'Leo', 5534930264, 'Contaduria', 3 , 1 , 'Venta', 'No',26 ),
 (13,'V', 'Beatriz', 5584648421, 'Contaduria', 4 , 1 , 'Venta', 'No',32 ),
 (14,'V', 'Matias', 5583951213, 'Ventas', 2 , 1 , 'Venta', 'Si',42 )
 commit tran
 
 select * from EMPLEADO.Empleado
 go
 -------------------------------------------------------
 
 select * from [EMPLEADO].[Domicilio]
begin tran 
insert into [EMPLEADO].[Domicilio] values 
(1,'Mexico','Azcapotzalco',12,'Calle 3',1),
(2,'Mexico','Iztapalapa',76,'Filipina',3),
(3,'Mexico', 'Tlalpan',45,'Reforma',5)

commit tran
--rollback tran
 
 select * from [EMPLEADO].[Domicilio]
 go
-----------------------------------------------------------

 select * from [EMPLEADO].[Almacenador]
 select * from EMPLEADO.Empleado
 begin tran 
insert into [EMPLEADO].[Almacenador]  values 
(1,100),
(2,100 ),
(3,100)
commit tran
--rollback tran

 select * from [EMPLEADO].[Almacenador]
 go

 -------------------------------------------------------------

  select * from [EMPLEADO].[AtencionCliente]
 select * from EMPLEADO.Empleado
 begin tran 
insert into [EMPLEADO].[AtencionCliente]  values 
(3,'2022-01-01 23:59:59.997')
commit tran
--rollback tran
 select * from [EMPLEADO].[AtencionCliente]
go

---------------------------------------------------------------

 select * from [EMPLEADO].[Pagos]
 select * from EMPLEADO.Empleado
 begin tran 
insert into [EMPLEADO].[Pagos]  values 
(1,20000,100),
(2,30000,500),
(3,25000,300),
(4,20000,100),
(5,10000,100)
commit tran
--rollback tran
 select * from [EMPLEADO].[Pagos]
go

---------------------------------------------------------------


 select * from [EMPLEADO].[Contador]
 select * from EMPLEADO.Empleado
 begin tran 
insert into [EMPLEADO].[Contador] values 
(1,'Ventas realzadas',1),
(2,'Administracion de almacen',2),
(3,'Clientes atendidos',3),
(4,'Paginas web atendidas',4),
(5,'Finanzas atendidas',5)
commit tran
--rollback tran
 select * from [EMPLEADO].[Contador]
go

---------------------------------------------------------------

 select * from [EMPLEADO].[FINANZAS]
 select * from EMPLEADO.Empleado
 begin tran 
insert into [EMPLEADO].[FINANZAS] values 
(1,'Doc1','Pagos sobre el almacen',20000,'2022-06-08',1),
(2,'Doc 2','Pagos sobre atencion a clientes atedidos',10000,'1924-06-09',4),
(3,'Doc3','Pagos realizados a empleados',100000,'1924-06-09',5)
commit tran
--rollback tran
 select * from [EMPLEADO].[FINANZAS]
go

---------------------------------------------------------------
select * from [EMPLEADO].[PaginaWeb]
 select * from EMPLEADO.Empleado
 begin tran 
insert into [EMPLEADO].[PaginaWeb] values 
(1,'Peluches',1,'Activada'),
(2,'Suscripciones',1,'Activada'),
(3,'Atencion de compras',1,'Desactivada')
commit tran
--rollback tran
 select * from [EMPLEADO].[PaginaWeb]
go
-----------------------------------------------------------------

 select * from [EMPLEADO].[PaginaWeb]
 select * from EMPLEADO.Empleado
 begin tran 
insert into [EMPLEADO].[Marketing] values 
(4,1)
commit tran
--rollback tran
 select * from [EMPLEADO].[Marketing]
go

--------------------------------------------------------------
select * from [EMPLEADO].[Solicitud]
 select * from EMPLEADO.Empleado
 begin tran 
insert into [EMPLEADO].[Solicitud] values 
('2022-03-02','Maximo','kodeulaffegei-9185@yopmail.com', 'Rembolso','cancelar',5574330077,3)
commit tran
--rollback tran
 select * from [EMPLEADO].[Solicitud]
go
--------------------------------------------------------------

 select * from [VENTA].[DireccionVenta]
 select * from EMPLEADO.Empleado
 begin tran 
insert into [VENTA].[DireccionVenta] values 
(1,'Spain','A Jiménez',37848,'Travesía Blasco'),
(2,'South Korea','안산시',056,'역삼로'),
(3,'Italia','Primo ligure',96 ,'Strada Sala, Appartamento 57')

commit tran
--rollback tran
 select * from [VENTA].[DireccionVenta]
go
------------------------------------------------------------------

select * from [CLIENTE].[Cliente]
 begin tran 
insert into [CLIENTE].[Cliente] values 
(4011664960121897,'Patiño','qualesajoize-4912@yopmail.com','Sala','Muñiz','2022-12-25','Peluche de temporada 20',24,5573962850,1),
(4020086625254625,'Arsenio','ceiceiyoubra-7272@yopmail.com','Carbonell','Piedad','2022-11-01','Peluche de temporada 4',37,5528495317,0),
(4017575344866482,'Salvador','jiwegommuffu-8118@yopmail.com','Frutos','Mira','2022-11-25','Peluche de temporada 2',21,5518364965,1)
commit tran
--rollback tran
 select * from [CLIENTE].[Cliente]
go

-----------------------------------------------------------------
 select * from [CLIENTE].[DomicilioCliente]
 select * from [CLIENTE].[Cliente]
 begin tran 
insert into [CLIENTE].[DomicilioCliente] values 
(1,4011664960121897,'USA','North Tommouth',76312, 'Romaguera Landing'),
(2,4020086625254625,'USA','Terrellburgh',7570, 'Onie Divide'),
(3,4017575344866482,'Peru','Don Fernando Quezada',8,'Cl. Anthony Sosa' ),
(4,2937402819302193,'Spain','Ronda Soler', 766,' 40º 3º'),
commit tran
--rollback tran
 select * from [CLIENTE].[DomicilioCliente]
go

-----------------------------------------------------------------------

 select * from [CLIENTE].[Suscripcion]
 select * from [CLIENTE].[Cliente]
 begin tran 
insert into [CLIENTE].[Suscripcion] values 
('3 meses','Plata','Playpal',1,'2022-11-08',4011664960121897),
('1 año','Oro','Pago en efectivo',1,'2022-12-15',4020086625254625),
('2 meses','Platino','Pago en credito',0,'2022-11-21',4017575344866482)
commit tran
--rollback tran
 select * from [CLIENTE].[Suscripcion]
go

---------------------------------------------------------------------------
 select * from [EMPLEADO].[Empleado]
 begin tran 
insert into [EMPLEADO].[Vendedor] values 
(1,12,2),
(6,26,12),
(7,17,1),
(8,12,2),
(9,10,3),
(10,22,4),
(11,22,7),
(12,34,22),
(13,14,12),
(14,22,1)
commit tran
--rollback tran
 select * from [EMPLEADO].[Vendedor]
go
-----------------------------------------------------------------------------
 select * from [CLIENTE].[Cliente]
 select * from [EMPLEADO].[Almacenador]
 select * from [VENTA].[Venta]
 begin tran 
insert into [ALMACEN].[Almacen] values 
(1,'Temporada 10',291728,'Peluches Cariñoso','2022-12-12',4,'Si','No',1,'mexusumeimme-2259@yopmail.com','Mexico'),
(2,'Temporada 20',214914,'Peluche de animalitos','2022-11-07',9,'Si','No',2,'traubozuzauzo-9443@yopmail.com','EU'),
(3,'Temporada 3',193,'Peluches oro','2022-11-25',3,'No','Si',3,'feubanneigemei-6458@yopmail.com','Mexico')

commit tran
--rollback tran
 select * from [ALMACEN].[Almacen]
go
---------------------------------------------------------------------------
 select * from [CLIENTE].[Cliente]
 select * from [ALMACEN].[Almacen]
 select * from [VENTA].[DireccionVenta]
 select * from [VENTA].[Venta]
 begin tran 
insert into [VENTA].[Venta] values 
(1,'Venta de peluches','2022-11-29','01:23:02',0,0928352835,'2022-11-24','Osito cariñoso',4011664960121897,1,1),
(2,'Venta de peluches','2022-12-02','11:22:22',1,2187427428,'2022-11-17','Osito Rinoceronte',4017575344866482,2,2),
(3,'Venta de peluches','2022-11-22','12:34:23',1,8914272148,'2022-12-15','Osito Carro',4020086625254625,3,3)
commit tran
--rollback tran
 select * from [VENTA].[Venta]
go
---------------------------------------------------------------------------------
 select * from [CLIENTE].[Cliente]
 select * from [EMPLEADO].[Vendedor]
 select * from [VENTA].[Venta]
 select * from [dbo].[Atiende]
 begin tran 
insert into [dbo].[Atiende] values 
(4011664960121897,1,1),
(4017575344866482,6,2),
(4020086625254625,8,3)
commit tran
--rollback tran
 select * from [dbo].[Atiende]
go

------------------------------------------------------------------------------
 select * from [ALMACEN].[Almacen]
 begin tran 
insert into [ALMACEN].[Peluches] values 
(1,'Si',2347923498,'Grande','2022-11-05',1,100),
(2,'No',9914282184,'Mediano','2022-11-17',2,200),
(3,'Si',0241827487,'Pequeño','2022-11-19',3,500)
commit tran
--rollback tran
 select * from [ALMACEN].[Peluches]
go

----------------------------------------------------------------------
--------------------------------------------------------------------------
 select * from [VENTA].[Venta]
 begin tran 
insert into [VENTA].[VentaOnline] values 
(1,'Chat con ip 565674541991981'),
(2,'Chat con ip 545462427272527'),
(3,'Chat con ip 865645456766867')
commit tran
--rollback tran
 select * from [VENTA].[VentaOnline]
go

------------------------------------------------------------------------------
 select * from [VENTA].[Venta]
 begin tran 
insert into [VENTA].[VentaTelefono] values 
(1,'Linea telefonica 526522'),
(2,'Linea telefonica 252652'),
(3,'Linea telefonica 145145')
commit tran
--rollback tran
 select * from [VENTA].[VentaTelefono]
go
--------------------------------------------------------------------------------------

select * from [ALMACEN].[Almacen]

select * from [ALMACEN].[Peluches]

select * from [CLIENTE].[Cliente]

select * from [CLIENTE].[DomicilioCliente]

select * from [CLIENTE].[Suscripcion]

select * from [dbo].[Atiende]

select * from [EMPLEADO].[Almacenador]

select * from [EMPLEADO].[AtencionCliente]

select * from [EMPLEADO].[Contador]

select * from [EMPLEADO].[Domicilio]

select * from [EMPLEADO].[Empleado]

select * from [EMPLEADO].[FINANZAS]

select * from [EMPLEADO].[Marketing]

select * from [EMPLEADO].[PaginaWeb]

select * from [EMPLEADO].[Pagos]

select * from [EMPLEADO].[Solicitud]

select * from [EMPLEADO].[Vendedor]

select * from [VENTA].[DireccionVenta]

select * from [VENTA].[Venta]

select * from [VENTA].[VentaOnline]

select * from [VENTA].[VentaTelefono]
