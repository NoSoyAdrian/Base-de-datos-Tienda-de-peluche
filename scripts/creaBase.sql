--Fecha Creacion :  21/12/2022
--Descripcion : Script para crear la base de datos telemarketing 
--semestre : 2023-1	Grupo : 2
--Equipo: telemarketing


--Creacion de la base de datos 
CREATE DATABASE empresaTELEMARKETINGS1
go

USE empresaTELEMARKETINGS2
GO

--Creación de esquemas (subcarpetas)
--Contendra	: EMPLEADO,DOMICILIOEMPLEADO,PAGOS,ALMACEDADOR,ATENCIONCLIENTE,CONTADOR,MARKETING,VENDEDOR,SOLICITUDES,FINANZAS,PAGINAWEB
CREATE SCHEMA EMPLEADO
GO
--Contendra : ALMACEN,PELUCHES
CREATE SCHEMA ALMACEN
GO
--Contendra: CLIENTE,DOICILIOCLIENTE,SUSCRIPCION
CREATE SCHEMA CLIENTE
GO
--Contendra : VENTA,DIRECCIONVENTA,VENTAONLINE,VENTATELEFONO 
CREATE SCHEMA VENTA
GO


--Creacion de tablas 

--Tabla Empleado
--Tendremos idEmpleado, tipoEmpleado,nombre,telefono,estudio,tiempoEmpleado,asegurado,tarea,empleadoMes,puesto
CREATE TABLE EMPLEADO.Empleado(
	idEmpleado int not null,
	tipoEmpleado varchar(20) NOT NULL,
	nombre varchar(20) NOT NULL,
	telefono integer NOT NULL,
	estudios varchar(20) NOT NULL,
	tiempoEmpleado numeric(15,0) NOT NULL,
	asegurado BIT NOT NULL,
	tareas varchar(10) NOT NULL,
	empleadoMes varchar(10) NOT NULL,
	puesto varchar(15) NOT NULL,
	edad numeric(10,0) NOT NULL,
	CONSTRAINT pk_idEmpleado PRIMARY KEY CLUSTERED (idEmpleado)
)
go

--Verificamos si la creacion de la tabla fue realizada correctamente 
IF OBJECT_ID('Empleado') IS NOT NULL
	PRINT '<<< CREATED TABLE Empleado >>>'
ELSE
	PRINT '<<< Tabla creada Empleado >>>'
go



--Tabla domicilio
--Tendremos idDomicilio,pais,municipio,delegacion,numeroCasa,calle,idEmpleado
CREATE TABLE EMPLEADO.Domicilio(
	idDomicilioEmpleado int not null,
	pais varchar(20) NOT NULL,
	municipio varchar(20) NOT NULL,
	delegacion varchar(20) NOT NULL,
	numeroCasa integer NOT NULL,
	calle varchar(40) NOT NULL,
	idEmpleado int not null,
	CONSTRAINT pk_idDomicilio PRIMARY KEY CLUSTERED (idDomicilioEmpleado),
	CONSTRAINT fk_idEmpleadoDomicilio FOREIGN KEY (idEmpleado) REFERENCES EMPLEADO.Empleado(idEmpleado)
)
go


--Verificamos si la creacion de la tabla fue realizada correctamente 
IF OBJECT_ID('Domicilio') IS NOT NULL
	PRINT '<<< CREATED TABLE Domicilio >>>'
ELSE
	PRINT '<<< Tabla creada Domicilio >>>'
go

--Tabla pagos
--Tendremos idPagos,sueldo,descuentoPagis,bonos
CREATE TABLE EMPLEADO.Pagos(
	idPagos int not null,
	sueldo money NOT NULL,
	descuentoPagos money NOT NULL,
	bonos money NOT NULL,	
	CONSTRAINT pk_idPagos PRIMARY KEY CLUSTERED (idPagos),
	CONSTRAINT fk_idPagos FOREIGN KEY (idPagos) REFERENCES EMPLEADO.Empleado(idEmpleado)
)
go


--Verificamos si la creacion de la tabla fue realizada correctamente 
IF OBJECT_ID('Pagos') IS NOT NULL
	PRINT '<<< CREATED TABLE Pagos >>>'
ELSE
	PRINT '<<< Tabla creada Pagos >>>'
go

--Tablas Almacenador 
--Tendremos idEmpleado,rembolso
CREATE TABLE EMPLEADO.Almacenador(
	idEmpleado int not null,
	rembolso money NOT NULL,
	CONSTRAINT pk_ideEmpleadoAlmacenador PRIMARY KEY CLUSTERED (idEmpleado),
	CONSTRAINT fk_idEmpleadoAlmacenador FOREIGN KEY (idEmpleado) REFERENCES EMPLEADO.Empleado(idEmpleado)
)
go


--Verificamos si la creacion de la tabla fue realizada correctamente 
IF OBJECT_ID('Almacenador') IS NOT NULL
	PRINT '<<< CREATED TABLE Almacenador >>>'
ELSE
	PRINT '<<< Tabla creada Almacenador >>>'
go

--Tabla Atencion Cliente
--idEmpleado,horario
CREATE TABLE EMPLEADO.AtencionCliente(
	idEmpleado int not null,
	horario datetime NOT NULL,
	CONSTRAINT pk_ideEmpleado PRIMARY KEY CLUSTERED (idEmpleado),
	CONSTRAINT fk_idEmpleadoAC FOREIGN KEY (idEmpleado) REFERENCES EMPLEADO.Empleado(idEmpleado)

)
go


--Verificamos si la creacion de la tabla fue realizada correctamente 
IF OBJECT_ID('AtencionCliente') IS NOT NULL
	PRINT '<<< CREATED TABLE AtencionCliente >>>'
ELSE
	PRINT '<<< Tabla creada AtencionCliente >>>'
go

--Creacion de tabla Empleado.contador
--tendremo idEmpleado,finanzas,idPagos
CREATE TABLE EMPLEADO.Contador(
	idEmpleado int not null,
	finanzas varchar(40) NOT NULL,
	idPagos int NOT NULL,
	CONSTRAINT pk_ideEmpleadoC PRIMARY KEY CLUSTERED (idEmpleado),
	CONSTRAINT fk_idEmpleadoC FOREIGN KEY (idEmpleado) REFERENCES EMPLEADO.Empleado(idEmpleado),
	CONSTRAINT fk_idPagosC FOREIGN KEY (idPagos) REFERENCES EMPLEADO.Pagos(idPagos)
)
go


--Verificamos si la creacion de la tabla fue realizada correctamente 
IF OBJECT_ID('Contador') IS NOT NULL
	PRINT '<<< CREATED TABLE Contador >>>'
ELSE
	PRINT '<<< Tabla creada Contador >>>'
go

--Creacion de tabla Empleado.PaginaWeb
--tendremos idPaginaWeb,Producto,verificacion,estadoPagina,urlPagina
CREATE TABLE EMPLEADO.PaginaWeb(
	idPaginaWeb int not null,
	producto varchar(30) NOT NULL,
	verificacion BIT NOT NULL,
	estadoPagina varchar(20) NOT NULL,
	urlPagina varchar(100) NOT NULL,
	CONSTRAINT idFinanzasPW PRIMARY KEY CLUSTERED (idPaginaWeb)
)
go


--Verificamos si la creacion de la tabla fue realizada correctamente 
IF OBJECT_ID('PaginaWeb') IS NOT NULL
	PRINT '<<< CREATED TABLE PaginaWeb >>>'
ELSE
	PRINT '<<< Tabla creada PaginaWeb >>>'
go

--Creacion de tabla Empleado.Marketing
--tendremos idEmpleado y idPaginaWeb
CREATE TABLE EMPLEADO.Marketing(
	idEmpleado int not null,
	idPaginaWeb int NOT NULL,
	CONSTRAINT pk_ideEmpleadoM PRIMARY KEY CLUSTERED (idEmpleado),
	CONSTRAINT fk_idEmpleadoM FOREIGN KEY (idEmpleado) REFERENCES EMPLEADO.Empleado(idEmpleado),
	CONSTRAINT fk_idPaginaWebM FOREIGN KEY (idPaginaWeb) REFERENCES EMPLEADO.PaginaWeb(idPaginaWeb)
)
go


--Verificamos si la creacion de la tabla fue realizada correctamente 
IF OBJECT_ID('Marketing') IS NOT NULL
	PRINT '<<< CREATED TABLE Marketing >>>'
ELSE
	PRINT '<<< Tabla creada Marketing >>>'
go

--Creacion de tabla Empleado.Venddor
--tendremos idEmpleado,ventasRealizadas,ventasNoRealizadas
CREATE TABLE EMPLEADO.Vendedor(
	idEmpleado int not null,
	ventasRealizadas integer NOT NULL,
	ventasNoRealizadas integer NOT NULL,
	CONSTRAINT pk_ideEmpleadoV PRIMARY KEY CLUSTERED (idEmpleado),
	CONSTRAINT fk_idEmpleadoV FOREIGN KEY (idEmpleado) REFERENCES EMPLEADO.Empleado(idEmpleado)
)
go


--Verificamos si la creacion de la tabla fue realizada correctamente 
IF OBJECT_ID('Vendedor') IS NOT NULL
	PRINT '<<< CREATED TABLE Vendedor >>>'
ELSE
	PRINT '<<< Tabla creada Vendedor >>>'
go

--Creacion de tabla Empleado.solicitud
--tendremos idSolicitud,fechaProblema,nomreCliente,correo,informe,solucion,telefono,idEmpleado
CREATE TABLE EMPLEADO.Solicitud(
	idSolicitud int identity(1,1),
	fechaProblema date NOT NULL,
	nombreCliente varchar(50) NOT NULL,
	correo varchar(100) NOT NULL,
	informe varchar(100) NOT NULL,
	solucion varchar(150) NOT NULL,
	telefono integer NOT NULL,
	idEmpleado int NOT NULL,

	CONSTRAINT pk_idSolicitudS PRIMARY KEY CLUSTERED (idSolicitud),
	CONSTRAINT fk_idEmpleadoS FOREIGN KEY (idEmpleado) REFERENCES EMPLEADO.AtencionCliente(idEmpleado),
)
go


--Verificamos si la creacion de la tabla fue realizada correctamente 
IF OBJECT_ID('Solicitud') IS NOT NULL
	PRINT '<<< CREATED TABLE Solicitud >>>'
ELSE
	PRINT '<<< Tabla creada Solicitud >>>'
go

--cracion de tabla empleado.finanzas
--tendremos idFinanzas,balances,descripcionPagos,costos,fechaCorte,idEmpleado
CREATE TABLE EMPLEADO.FINANZAS (
	idFinanzas int not null,
	balances varchar(100) NOT NULL,
	descripcionPagos varchar(100) NOT NULL,
	costos money NOT NULL,
	fechaCorte date NOT NULL,
	idEmpleado int NOT NULL,
	CONSTRAINT idFinanzasF PRIMARY KEY CLUSTERED (idFinanzas),
	CONSTRAINT fk_idEmpleadoF FOREIGN KEY (idEmpleado) REFERENCES EMPLEADO.Contador(idEmpleado)
)
go


--Verificamos si la creacion de la tabla fue realizada correctamente 
IF OBJECT_ID('FINANZAS') IS NOT NULL
	PRINT '<<< CREATED TABLE FINANZAS >>>'
ELSE
	PRINT '<<< Tabla creada FINANZAS >>>'
go

--Creacion de tabla cliente.cliente
--tendremos tarjetaPago,nombre,correo,apellidoMaterno,apellidoPaterno,fechaPago,productoFavorito,edad
CREATE TABLE CLIENTE.Cliente(
	tarjetaPago numeric(16,0) NOT NULL,
	nombre varchar(40) NOT NULL,
	correro varchar(10) NOT NULL,
	apellidoMaterno varchar(20) NOT NULL,
	apellidoPaterno varchar(20) NOT NULL,
	fechaPago date NOT NULL,
	productoFavorito varchar(50) NOT NULL,
	edad integer NOT NULL,
	CONSTRAINT tarjetaPagoCL PRIMARY KEY CLUSTERED (tarjetaPago),
)
go


--Verificamos si la creacion de la tabla fue realizada correctamente 
IF OBJECT_ID('Cliente') IS NOT NULL
	PRINT '<<< CREATED TABLE Cliente>>>'
ELSE
	PRINT '<<< Tabla creada Cliente >>>'
go


--Creacion de cliente.domicilio
--tendremos idDomicilio,tarjetaPago,pais,municipio,delegacion,numeroCasa,calle
Create table CLIENTE.DomicilioCliente(
	idDomicilioCliente int not null,
	tarjetaPago numeric(16,0) NOT NULL,
	pais varchar(50) NOT NULL,
	municipio varchar(10) NOT NULL,
	delegacion varchar(40) NOT NULL,
	numeroCasa integer NOT NULL,
	calle varchar(50) NOT NULL,
	CONSTRAINT pk_idDomicilioCliente PRIMARY KEY CLUSTERED (idDomicilioCliente),
	CONSTRAINT fk_tarjetaPagoCL FOREIGN KEY (tarjetaPago) REFERENCES CLIENTE.Cliente(tarjetaPago)
)
go


--Verificamos si la creacion de la tabla fue realizada correctamente 
IF OBJECT_ID('DomicilioCliente') IS NOT NULL
	PRINT '<<< CREATED TABLE DomicilioCliente>>>'
ELSE
	PRINT '<<< Tabla creada DomicilioCliente >>>'
go

--creacion de cliente.suscripcion
--tendremos idSuscripcion,historial,tipoSuscripcion,formaPago,estadosub,fechaSolicitud,tarjetaPago
CREATE TABLE CLIENTE.Suscripcion(
	idSuscripcion INT PRIMARY KEY IDENTITY, ---llave artificial y se generará automáticamente con un valor incremental cada vez que se inserte una nueva fila en la tabla.
	historial varchar(50) NOT NULL,
	tipoSuscripcion varchar(20) NOT NULL,
	formaPago varchar(20) NOT NULL,
	estadoSub BIT NOT NULL,
	fechaSolicitud DATE NOT NULL,
	tarjetaPago numeric(16,0) NOT NULL,
	CONSTRAINT fk_tarjetaPagoS FOREIGN KEY (tarjetaPago) REFERENCES CLIENTE.Cliente(tarjetaPago)
)
go


--Verificamos si la creacion de la tabla fue realizada correctamente 
IF OBJECT_ID('Suscripcion') IS NOT NULL
	PRINT '<<< CREATED TABLE Suscripcion>>>'
ELSE
	PRINT '<<< Tabla creada Suscripcion >>>'
go




----------------------------------------------------------------------------------------------------------
--Tablas Almacen
--tendremos idAlmacen,pelucheTemporada,compras,modeloPeluches,fechaIngreso,numPeluches,productoMaVendido,productoMenosVnedido,idEmpleado
CREATE TABLE ALMACEN.Almacen(
	idAlmacen int not null,
	pelucheTemporada varchar(40) NOT NULL,
	compras integer NOT NULL,
	modelosPeluches varchar(30) NOT NULL,
	fechaIngreso DATE NOT NULL,
	numPeluches integer NOT NULL,
	productoMaVendido VARCHAR(30) NOT NULL,
	productoMenosVendido varchar(40) NOT NULL,
	idEmpleado int NOT NULL,
	CONSTRAINT pk_idAlmacenA PRIMARY KEY CLUSTERED (idAlmacen),
	CONSTRAINT fk_idEmpleadoA FOREIGN KEY (idEmpleado) REFERENCES EMPLEADO.Almacenador(idEmpleado)

)
go


--Verificamos si la creacion de la tabla fue realizada correctamente 
IF OBJECT_ID('Almacen') IS NOT NULL
	PRINT '<<< CREATED TABLE Almacen >>>'
ELSE
	PRINT '<<< Tabla creada Almacen >>>'
go

--Creacion de almacen.peluches
--tendremos idPeluches,peluchesExclusivos,numeroColeccion,tipo,fehcaCreacion,idAlmacen
CREATE TABLE ALMACEN.Peluches(
	idPeluches int not null,
	peluchesExclusivos varchar(20) NOT NULL,
	numeroColeccion numeric(10,0) NOT NULL,
	tipo varchar(30) NOT NULL,
	fechaCreacion DATE NOT NULL,
	idAlmacen int NOT NULL,
	CONSTRAINT pk_idPeluchesP PRIMARY KEY CLUSTERED (idPeluches),
	CONSTRAINT fk_idAlmacenP FOREIGN KEY (idAlmacen) REFERENCES ALMACEN.Almacen(idAlmacen)

)
go


--Verificamos si la creacion de la tabla fue realizada correctamente 
IF OBJECT_ID('Peluches') IS NOT NULL
	PRINT '<<< CREATED TABLE Peluches >>>'
ELSE
	PRINT '<<< Tabla creada Peluches >>>'
go

--creacion de venta.direccion
--tendremos idDireccionVenta,pais,municipio,delegacion,numeroCasa,calle
CREATE TABLE VENTA.DireccionVenta(
	idDireccionVenta int not null,
	pais varchar(50) NOT NULL,
	municipio varchar(30) NOT NULL,
	delegacion varchar(50) NOT NULL,
	numeroCasa integer NOT NULL,
	calle varchar(50) NOT NULL,
	CONSTRAINT pk_idDireccionVentaD PRIMARY KEY CLUSTERED (idDireccionVenta)
)
go


--Verificamos si la creacion de la tabla fue realizada correctamente 
IF OBJECT_ID('DireccionVenta') IS NOT NULL
	PRINT '<<< CREATED TABLE DireccionVenta >>>'
ELSE
	PRINT '<<< Tabla creada DireccionVenta >>>'
go

--creacion de venta.venta
--tendremos idVenta,tipoVeta,fechaSalidaProducto,horario,cancelacion,fechaPedido,nombreProducto,tarjetaPago,idAlmacen,idDireccionVneta
CREATE TABLE VENTA.Venta(
	idVenta int not null,
	tipoVenta varchar(100) NOT NULL,
	fechaSalidaProducto date NOT NULL,
	horario datetime NOT NULL,
	cancelacion bit NOT NULL,
	codigoProducto varchar(10) NOT NULL,
	fechaPedido date NOT NULL,
	nombreProducto varchar(30) NOT NULL,
	tarjetaPago numeric(16,0) NOT NULL,
	idAlmacen int NOT NULL,
	idDireccionVenta int NOT NULL,
	CONSTRAINT pk_idVentaVE PRIMARY KEY CLUSTERED (idVenta),
	CONSTRAINT fk_tarjetaPagoVE FOREIGN KEY (tarjetaPago) REFERENCES CLIENTE.Cliente(tarjetaPago),
	CONSTRAINT fk_idAlmacenVE FOREIGN KEY (idAlmacen) REFERENCES ALMACEN.Almacen(idAlmacen),
	CONSTRAINT fk_idDireccionVentaVE FOREIGN KEY (idDireccionVenta) REFERENCES VENTA.DireccionVenta(idDireccionVenta)
)
go


--Verificamos si la creacion de la tabla fue realizada correctamente 
IF OBJECT_ID('Venta') IS NOT NULL
	PRINT '<<< CREATED TABLE Venta>>>'
ELSE
	PRINT '<<< Tabla creada Venta >>>'
go

--creacion de atiende
--tendra tarjetaPago,idEmpleado,idVenta
CREATE TABLE Atiende (
	tarjetaPago numeric(16,0) NOT NULL,
	idEmpleado int NOT NULL,
	idVenta int NOT NULL,
	CONSTRAINT pk_tarjetaPago_idEmpleadoAT PRIMARY KEY CLUSTERED (tarjetaPago,idEmpleado),
	CONSTRAINT fk_tarjetaPagoAT FOREIGN KEY (tarjetaPago) REFERENCES CLIENTE.Cliente(tarjetaPago),
	CONSTRAINT fk_idEmpleadoAT FOREIGN KEY (idEmpleado) REFERENCES EMPLEADO.Vendedor(idEmpleado),
	CONSTRAINT fk_idVentaAT FOREIGN KEY (idVenta) REFERENCES VENTA.Venta(idVenta)
)
go


--Verificamos si la creacion de la tabla fue realizada correctamente 
IF OBJECT_ID('Atiende') IS NOT NULL
	PRINT '<<< CREATED TABLE Atiende>>>'
ELSE
	PRINT '<<< Tabla creada Atiende >>>'
go

--creacion de ventaOnline
--tendremos idVenta,chat
CREATE TABLE VENTA.VentaOnline (
	idVenta int not null,
	chat varchar(50) NOT NULL,
	CONSTRAINT pk_idVentaO PRIMARY KEY CLUSTERED (idVenta),
	CONSTRAINT fk_idVentaO FOREIGN KEY (idVenta) REFERENCES VENTA.Venta(idVenta)
)
go


--Verificamos si la creacion de la tabla fue realizada correctamente 
IF OBJECT_ID('VentaOnline') IS NOT NULL
	PRINT '<<< CREATED TABLE VentaOnline>>>'
ELSE
	PRINT '<<< Tabla creada VentaOnline >>>'
go

--creacion de venta.ventatelefono
--tendremos idVenta, linea
CREATE TABLE VENTA.VentaTelefono (
	idVenta int not null,
	linea varchar(50) NOT NULL,
	CONSTRAINT pk_idVentaVEN PRIMARY KEY CLUSTERED (idVenta),
	CONSTRAINT fk_idVentaVEN FOREIGN KEY (idVenta) REFERENCES VENTA.Venta(idVenta)
)
go


--Verificamos si la creacion de la tabla fue realizada correctamente 
IF OBJECT_ID('VentaTelefono') IS NOT NULL
	PRINT '<<< CREATED TABLE VentaTelefono>>>'
ELSE
	PRINT '<<< Tabla creada VentaTelefono >>>'
go

-------------------------------------------------------------------------
--Agregaciones para terminar la creacion de las tablas 

ALTER TABLE [VENTA].[Venta]
ADD Resultado VARCHAR(10) NULL ;
go 

ALTER TABLE ALMACEN.almacen 
ADD correo VARCHAR(70) NOT NULL, pais VARCHAR(30) NOT NULL  ;
go 

ALTER TABLE CLIENTE.Cliente ALTER COLUMN correro VARCHAR(30);  
GO  

--ALTER TABLE [VENTA].[Venta] ALTER COLUMN correro VARCHAR(30);  
--GO  

ALTER TABLE EMPLEADO.PaginaWeb DROP COLUMN urlpagina;
GO

ALTER TABLE [EMPLEADO].[Pagos] DROP COLUMN bono;
GO

ALTER TABLE EMPLEADO.pagos ADD bono AS (sueldo-300);
go


Alter table [CLIENTE].[Cliente]
ADD telefono numeric(10,0) null

ALTER TABLE [EMPLEADO].[Empleado] DROP COLUMN [puesto];
GO

ALTER TABLE [EMPLEADO].[Empleado] ALTER COLUMN [telefono] numeric(10,0);  
GO  


ALTER TABLE [EMPLEADO].[Domicilio] DROP COLUMN [municipio];
GO

ALTER TABLE [EMPLEADO].[Almacenador] ALTER COLUMN [rembolso] money not null;  
GO 

ALTER TABLE [CLIENTE].[Cliente]
add SoliSub bit null
go 

ALTER TABLE [ALMACEN].[Peluches]
add costo money not null
go 

ALTER TABLE [EMPLEADO].[Pagos]
ADD CONSTRAINT fk_idEmpleadoPagos FOREIGN KEY (idEmpleado) REFERENCES EMPLEADO.Empleado(idEmpleado)
go 
	

ALTER TABLE [EMPLEADO].[Solicitud] ALTER COLUMN [telefono] numeric(10,0);  
GO  

ALTER TABLE [VENTA].[DireccionVenta] DROP COLUMN [municipio];
GO

ALTER TABLE [CLIENTE].[DomicilioCliente] DROP COLUMN [municipio];
GO

----------------------------------------------------------
--ck
--Facilitacion de agragar tipo de empleado
ALTER TABLE [EMPLEADO].[Empleado]
ADD CONSTRAINT ck_tipoEmpleado check ([tipoEmpleado] in ('V','A','AC','M','C'))
go 
--ck
--tipo de la sub
ALTER TABLE [CLIENTE].[Suscripcion]
ADD CONSTRAINT ck_tipoSuscripcion check ([tipoSuscripcion] in ('Plata','Oro','Platino'))
go 
--ck
--tipo de peluche
ALTER TABLE [ALMACEN].[Peluches]
ADD CONSTRAINT ck_tipoPeluche check ([tipo] in ('Grande','Mediano','Pequeño'))
go 
--ck
--estado de la pagina web
ALTER TABLE [EMPLEADO].[PaginaWeb]
ADD CONSTRAINT ck_estadoPagina check ([estadoPagina] in ('Limpieza','Desactivada','Activada'))
go 

----------------------------------------------------------------------------------

------------------------------------------------------------------

/* 
 * INDEX: Almacen
 */
CREATE UNIQUE INDEX ak_Almacen ON ALMACEN.Almacen(idAlmacen)
go

/* 
 * INDEX: Peluches 
 */
 CREATE UNIQUE INDEX ak_Peluches ON ALMACEN.Peluches(idPeluches)
go

/* 
 * INDEX: Cliente
 */
CREATE UNIQUE INDEX ak_cliente ON CLIENTE.Cliente(tarjetaPago)
go

/* 
 * INDEX: Suscripcion
 */
CREATE UNIQUE INDEX ak_suscripcion ON [CLIENTE].[Suscripcion](idSuscripcion)
go

/* 
 * INDEX: Atiende
 */
 CREATE UNIQUE INDEX ak_Atiende ON Atiende([tarjetaPago])
go

/* 
 * INDEX: Almacenador
 */
 CREATE UNIQUE INDEX ak_Almacenador ON [EMPLEADO].[Almacenador]([idEmpleado])
go

/* 
 * INDEX: AtencionCliente
 */
  CREATE UNIQUE INDEX ak_AtencionCliente ON [EMPLEADO].[AtencionCliente]([idEmpleado])
go

/* 
 * INDEX: Contador
 */
  CREATE UNIQUE INDEX ak_Contador ON [EMPLEADO].[Contador]([idEmpleado])
go

/* 
 * INDEX: Domicilio
 */
  CREATE UNIQUE INDEX ak_Domicilio ON [EMPLEADO].[Domicilio]([idDomicilioEmpleado])
go

/* 
 * INDEX: Empleado
 */
  CREATE UNIQUE INDEX ak_Empleado ON [EMPLEADO].[Empleado]([idEmpleado])
go

/* 
 * INDEX: FINANZAS
 */
  CREATE UNIQUE INDEX ak_FINANZAS ON [EMPLEADO].[FINANZAS]([idFinanzas])
go

/* 
 * INDEX: Marketing
 */
  CREATE UNIQUE INDEX ak_Marketing ON [EMPLEADO].[Marketing]([idEmpleado])
go

/* 
 * INDEX: PaginaWeb
 */
  CREATE UNIQUE INDEX ak_PaginaWeb ON [EMPLEADO].[PaginaWeb]([idPaginaWeb])
go

/* 
 * INDEX: Pagos
 */
  CREATE UNIQUE INDEX ak_Pagos ON [EMPLEADO].[Pagos]([idPagos])
go

/* 
 * INDEX: Solicitud
 */
  CREATE UNIQUE INDEX ak_Solicitud ON [EMPLEADO].[Solicitud]([idSolicitud])
go

/* 
 * INDEX: Vendedor
 */
  CREATE UNIQUE INDEX ak_Vendedor ON [EMPLEADO].[Vendedor]([idEmpleado])
go

/* 
 * INDEX: DireccionVenta
 */
  CREATE UNIQUE INDEX ak_DireccionVenta ON [VENTA].[DireccionVenta]([idDireccionVenta])
go

/* 
 * INDEX: Venta
 */
  CREATE UNIQUE INDEX ak_Venta ON [VENTA].[Venta]([idVenta])
go

/* 
 * INDEX: VentaOnline
 */
  CREATE UNIQUE INDEX ak_VentaOnline ON [VENTA].[VentaOnline]([idVenta])
go

/* 
 * INDEX: VentaTelefono
 */
  CREATE UNIQUE INDEX ak_VentaTelefono ON [VENTA].[VentaTelefono]([idVenta])
go

---------------------------------------------------------------------------------------------------------


UPDATE [ALMACEN].[Peluches]
SET [tipo] = 'Pequeño'
where [idPeluches] = 3


UPDATE [CLIENTE].[Cliente] 
SET telefono = 5529301640
where tarjetaPago = 4011664960121897

UPDATE [CLIENTE].[Cliente] 
SET telefono = 5525937402
where tarjetaPago = 4017575344866482

UPDATE [VENTA].[Venta]
SET Resultado = 'Vendida'
where idVenta = 1

UPDATE [VENTA].[Venta]
SET Resultado = 'Vendida'
where idVenta = 2

UPDATE [VENTA].[Venta]
SET Resultado = 'Vendida'
where idVenta = 3
