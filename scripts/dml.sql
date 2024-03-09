
use empresaTELEMARKETINGS2

/*
 * 
 * Company :      Equipo de Bases de Datos 
 * Project :      Proyecto.DM1
 * Author :       Rivera Morales Alan Adrian
 *
 * Date Created : 30/12/2022
  SD
 */
---1---

--cracion de Procedure sobre cliente,peluche, destino, fecha salida, fecha llegada, numero de la coleccion y el total

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE SP_GENERAR_VENTA 
	@p_idCliente INT
AS
BEGIN
	SET NOCOUNT ON;

	SELECT CONCAT(p.nombre,' ',p.apellidoPaterno,' ',ISNULL(p.apellidoMaterno, ' ')) AS Nombre,
		   a.[numeroColeccion] AS Peluche,
		   d.[pais] AS Destino,
		   h.[fechaSalidaProducto] AS 'Fecha de Salida',
		   h.[horario] AS 'Hora de Salida',
		   h.[fechaPedido] AS 'Fecha de Llegada',
		   a.[numeroColeccion] AS 'Numero de Coleccion',
		   a.[costo] AS total

	FROM VENTA.Venta r
	LEFT JOIN CLIENTE.Cliente c ON c.tarjetaPago = r.tarjetaPago
	INNER JOIN CLIENTE.Cliente p ON p.tarjetaPago = c.tarjetaPago
	INNER JOIN VENTA.Venta v ON v.tarjetaPago = r.tarjetaPago
	INNER JOIN [VENTA].[DireccionVenta]d ON d.[idDireccionVenta] = v.[idDireccionVenta]
	INNER JOIN [VENTA].[Venta] h ON h.[idAlmacen]= v.[idAlmacen]
	INNER JOIN [ALMACEN].[Peluches] a ON a.[idAlmacen] = h.[idAlmacen]
	WHERE r.[idVenta] = @p_idCliente
END
GO

/*
select * from [VENTA].[Venta]
EXEC SP_GENERAR_VENTA   @p_idCliente = 2;
-----------------------------------------------------------------------------------------------------
go
*/


--Creacion de procedure que muestra el destino de un producto que vendimos buscando el destino
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE SP_BUSQUEDA_DESTINIO 
		@p_destino VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	SELECT h.[pais] AS 'Destino',
		a.[modelosPeluches] AS 'Tipo de Peluches',
		v.[fechaSalidaProducto] AS 'Fecha de Salida',
		v.[horario] AS 'Hora de Salida',
		v.[fechaPedido] AS 'Fecha de Llegada'
		
		FROM [VENTA].[Venta] v
		RIGHT JOIN [ALMACEN].[Almacen] a ON v.[idAlmacen] = a.[idAlmacen]
		INNER JOIN [VENTA].[DireccionVenta] h ON v.[idDireccionVenta] = h.[idDireccionVenta]
		WHERE h.[pais] = @p_destino

END
GO

--EXEC SP_BUSQUEDA_DESTINIO  @p_destino = 'Spain';

---------------------------------------------------------------------------

---3---

--creacion de trigger que verifica si se realizo la cancelacion de un producto y manda el mensaje de ello
CREATE TRIGGER cancellation_check
ON venta.venta
AFTER INSERT
AS
BEGIN
    -- trigger body
    SET NOCOUNT ON;

    -- verificar si se ha ingresado un 1 en la columna "cancelación"
    IF EXISTS (SELECT 1 FROM inserted WHERE [cancelacion] = 1)
    BEGIN
        -- enviar mensaje de alerta
        PRINT 'Producto cancelado, Realizar una solicitud de cancelacion Por favor'
    END

	else 
	begin
		Print 'Producto correctamente'
	end
END

go

/*
select * from [VENTA].[Venta]
select * from [CLIENTE].[Suscripcion]

begin tran 

insert into venta.venta values 
(6,'Venta de peluches', '2022-12-02', '2022-12-02 09:02:14.000',1,842231545,'2022-11-21','Peluche de Princesa',4011664960121897,1,1)

rollback tran
GO
*/
----------------------------------------------------------------------

/*
 * 
 * Company :      Equipo de Bases de Datos 
 * Project :      Proyecto.DM1
 * Author :       Román Cruz Hugo
 *
 * Date Created : 1/1/2023
  SD
 */

  -- Obtener los tipos de los productos de la tienda.

     SELECT tipo FROM ALMACEN.PELUCHES


--2.    Obtener los productos mas vendidos y los menos vendidos de los productos de la tienda.

     SELECT [pelucheTemporada],[productoMaVendido], [productoMenosVendido] FROM [ALMACEN].[Almacen]



--3.    Obtener el nombre de los empleados cuyo sueldo sea mayor a 10000

     SELECT sueldo FROM EMPLEADO.PAGOS WHERE sueldo > 10000



--4.    Listar todos los clientes que tengan apellido paterno empiece con C

    SELECT * FROM [CLIENTE].[Cliente] WHERE apellidoPaterno LIKE 'M%'



--5.    Obtener todos los datos de los datos de las compras que están entre los $600  y $1500 (dos formas para resolver)

     SELECT * FROM [ALMACEN].[Almacen] WHERE compras >600 AND compras < 300000

    -----

     SELECT * FROM [ALMACEN].[Almacen] WHERE compras BETWEEN 600 AND 300000


	 ---------------------------------------------------------------
/*
 * 
 * Company :      Equipo de Bases de Datos 
 * Project :      Proyecto.DM1
 * Author :       Hernandez Solis Brandon
 *
 * Date Created : 05/01/2023
  SD
 */

USE empresaTELEMARKETINGS1

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE SP_INSERTAR_CLIENTE

	----	Cliente		----
	@pTarjetaPago		NUMERIC(16,0),
	@pNombre			VARCHAR(40),	
	@pParterno			VARCHAR(20),	
	@pMaterno			VARCHAR(20),	
	@pCorreo			VARCHAR(30),	-- NULL
	@pFechaPago			DATE,
	@pProductoFavorito	VARCHAR(50),
	@pEdad				INT,
	----	Domicilio	----
	@pPais				VARCHAR(50),
	@pDelegacion		VARCHAR(40),
	@pNumeroCasa		INT,
	@pCalle				VARCHAR(50)

AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRAN
	INSERT INTO CLIENTE.Cliente VALUES(
		@pTarjetaPago,
		@pNombre,
		ISNULL(@pCorreo, ' '),
		@pMaterno,
		@pParterno,
		@pFechaPago,
		@pProductoFavorito,
		@pEdad
	)

	--	ID del domicilio
	DECLARE @pIDDomicilio INT;
	SET @pIDDomicilio = (SELECT MAX(idDomicilioCliente) FROM CLIENTE.DomicilioCliente);

	INSERT INTO CLIENTE.DomicilioCliente VALUES(
		@pIDDomicilio,
		@pTarjetaPago,
		@pPais,
		@pDelegacion,
		@pNumeroCasa,
		@pCalle
	)

	COMMIT TRAN
END
GO


CREATE OR ALTER PROCEDURE SP_INSERTAR_SOLICITUD

	@pFechaProblema		DATE,
	@pNombreCliente		VARCHAR(50),
	@pCorreo			VARCHAR(100),
	@pInforme			VARCHAR(100),
	@pSolucion			VARCHAR(150),
	@pTelefono			NUMERIC(10,0),
	@pIDEmpleado		INT

AS
BEGIN
	SET NOCOUNT ON;

	--	ID de la solicitud
	DECLARE @pIDSolicitud	INT;
	SET @pIDSolicitud = (SELECT MAX(idSolicitud) FROM EMPLEADO.Solicitud);

	BEGIN TRAN

	INSERT INTO EMPLEADO.Solicitud VALUES(
		@pIDSolicitud,
		@pFechaProblema,
		@pNombreCliente,
		@pCorreo,
		@pInforme,
		@pSolucion,
		ISNULL(@pTelefono, ' '),
		@pIDEmpleado
	)

	COMMIT TRAN
END
GO

CREATE OR ALTER PROCEDURE SP_INSERTAR_WEB

	@pProducto			VARCHAR(30),
	@pVerificacion		BIT,
	@pEstadoPagina		VARCHAR(20)

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @pIDPaginaWeb	INT;
	SET @pIDPaginaWeb = (SELECT MAX(idPaginaWeb) FROM EMPLEADO.PaginaWeb);

	BEGIN TRAN

	INSERT INTO EMPLEADO.PaginaWeb VALUES(
		@pIDPaginaWeb,
		@pProducto,
		@pVerificacion,
		@pEstadoPagina
	)

	COMMIT TRAN
END
GO

CREATE OR ALTER PROCEDURE SP_INSERTAR_Pagos

	@pSueldo			MONEY,
	@pDescuento			MONEY,
	@pIDEmpleado		INT

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @pIDPagos	INT;
	SET @pIDPagos = (SELECT MAX(idPagos) FROM EMPLEADO.Pagos);

	BEGIN TRAN

	INSERT INTO EMPLEADO.Pagos (idPagos,sueldo,descuentoPagos,idEmpleado) VALUES
	(@pIDPagos, @pSueldo, @pDescuento, @pIDEmpleado)

	COMMIT TRAN
END
GO

CREATE OR ALTER PROCEDURE SP_INSERTAR_Suscripcion

	@pHistorial			VARCHAR(50),
	@pTipoSuscripcion	VARCHAR(20),
	@pFormaPago			VARCHAR(20),
	@pEstadoSub			BIT,
	@pFechaSolicitud	DATE,
	@pTarjetaPago		NUMERIC(16,0)

AS
BEGIN
	SET NOCOUNT ON;

	DECLARE	@pIDSuscripcion		INT;
	SET @pIDSuscripcion = (SELECT MAX(idSuscripcion) FROM CLIENTE.Suscripcion);

	BEGIN TRAN

	INSERT INTO CLIENTE.Suscripcion VALUES(
	@pIDSuscripcion,
	@pHistorial,
	@pTipoSuscripcion,
	@pFormaPago,
	@pEstadoSub,
	@pFechaSolicitud,
	@pTarjetaPago
	)

	COMMIT TRAN
END
GO

CREATE OR ALTER PROCEDURE SP_MODIFICAR_CLIENTE_DOMICILIO

	@pIDTarjetaPago		NUMERIC(16,0),
	@pPais				VARCHAR(50),
	@pDelegacion		VARCHAR(40),
	@pNumeroCasa		INT,
	@pCalle				VARCHAR(50)

AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRAN

	UPDATE CLIENTE.DomicilioCliente
		SET
		pais = @pPais,
		delegacion = @pDelegacion,
		numeroCasa = @pNumeroCasa,
		calle = @pCalle

		WHERE tarjetaPago = @pIDTarjetaPago

	COMMIT TRAN
END
GO

CREATE OR ALTER PROCEDURE SP_MODIFICAR_EMPLEADO_DOMICILIO

	@pIDEmpleado		INT,
	@pPais				VARCHAR(20),
	@pDelegacion		VARCHAR(20),
	@pNumeroCasa		INT,
	@pCalle				VARCHAR(40)

AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRAN

	UPDATE EMPLEADO.Domicilio
		SET
		pais = @pPais,
		delegacion = @pDelegacion,
		numeroCasa = @pNumeroCasa,
		calle = @pCalle

		WHERE idEmpleado = @pIDEmpleado

	COMMIT TRAN
END



	 ---------------------------------------------------------------
	 /*
 * 
 * Company :      Equipo de Bases de Datos 
 * Project :      Proyecto.DM1
 * Author :       Hernandez Solis Brandon
 *
 * Date Created : 05/01/2023
  SD
 */

USE empresaTELEMARKETINGS2
GO
-----	CREAMOS TRIGGERS	-----
--Informa que los datos del nuevo cliente fueron agregados 
CREATE TRIGGER CLIENTE.ClienteActualizacion
ON CLIENTE.Cliente
FOR INSERT, UPDATE, DELETE		--Se ejecuta con modificaciones a los registros
AS
PRINT 'Actualización de los registros de Cliente'

/*
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
*/

GO

CREATE TRIGGER CLIENTE.DomicilioClienteInsert
ON CLIENTE.DomicilioCliente
FOR INSERT			--Solo se ejecuta cuando haya un insert
AS
PRINT 'Nuevo registro de Domicilio Cliente'

/*
select * from CLIEnte.Cliente
begin tran
INSERT INTO CLIENTE.DomicilioCliente VALUES(		--Ejemplo
4,
1513341415161415,
'Mexico',
'Tlalpan',
7,
'Del Trabajo'
);
rollback tran
GO
*/
go

CREATE TRIGGER CLIENTE.DomicilioClienteUpdate
ON CLIENTE.DomicilioCliente
FOR Update			--Solo se ejecuta cuando haya un insert
AS
PRINT 'Actualizacion de Domicilio Cliente'
/*
begin tran
UPDATE CLIENTE.DomicilioCliente
SET pais = 'Estados Unidos'
WHERE idDomicilioCliente = 1
rollback tran
*/
GO

CREATE TRIGGER EMPLEADO.EmpleadoInsert
ON EMPLEADO.Empleado
FOR INSERT				--Solo se ejecuta cuando haya un insert
AS
PRINT 'Nuevo registro de Empleado'		

/*
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
GO
*/
go

CREATE TRIGGER EMPLEADO.EmpleadoDelete
ON EMPLEADO.Empleado
FOR DELETE				--Solo se ejecuta cuando haya un delete
AS
PRINT 'Datos de empleado eliminados'	

/*
BEGIN TRAN
DELETE EMPLEADO.Empleado	--Ejemplo
WHERE idEmpleado = 10		--Borramos el empleado generado anteriormente
ROLLBACK TRAN
*/
GO

CREATE TRIGGER EMPLEADO.EmpleadoUpdate
ON EMPLEADO.Empleado
FOR UPDATE				--Solo se ejecuta cuando haya un delete
AS
PRINT 'Datos de empleado actualizados'

/*
begin tran
UPDATE EMPLEADO.Empleado	--Ejemplo
SET asegurado = 0			--Actualizamos el dato del seguro
WHERE idEmpleado = 1		--Condicion	
rollback tran
*/

-----	Creamos Procedimientos Almacenados		-----


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE SPI_INSERTAR_CLIENTE

	----	Cliente		----
	@pTarjetaPago		NUMERIC(16,0),
	@pNombre			VARCHAR(40),	
	@pParterno			VARCHAR(20),	
	@pMaterno			VARCHAR(20),	
	@pCorreo			VARCHAR(30),	-- NULL
	@pFechaPago			DATE,
	@pProductoFavorito	VARCHAR(50),
	@pEdad				INT,
	@ptelefono          NUMERIC(10,0),
	@pSoliSub           bit,
	----	Domicilio	----
	@pPais				VARCHAR(50),
	@pDelegacion		VARCHAR(40),
	@pNumeroCasa		INT,
	@pCalle				VARCHAR(50)

AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRAN
	INSERT INTO CLIENTE.Cliente VALUES(		--Inserta datos
		@pTarjetaPago,
		@pNombre,
		ISNULL(@pCorreo, ' '),		--Para no dejar null
		@pMaterno,
		@pParterno,
		@pFechaPago,
		@pProductoFavorito,
		@pEdad,
		@ptelefono ,
		@pSoliSub 
		
	)

	--	ID del domicilio
	DECLARE @pIDDomicilio INT;
	SET @pIDDomicilio = (SELECT MAX(idDomicilioCliente) FROM CLIENTE.DomicilioCliente) + 1;

	IF @pIDDomicilio is null	--Por si no hay registros
		SET @pIDDomicilio = 1;

	INSERT INTO CLIENTE.DomicilioCliente VALUES(	--Inserta datos
		@pIDDomicilio,
		@pTarjetaPago,
		@pPais,
		@pDelegacion,
		@pNumeroCasa,
		@pCalle
	)

	COMMIT TRAN
END
GO


CREATE OR ALTER PROCEDURE SPI_INSERTAR_WEB

	@pProducto			VARCHAR(30),
	@pVerificacion		BIT,
	@pEstadoPagina		VARCHAR(20)

AS
BEGIN
	SET NOCOUNT ON;

	--Id de la pagina web
	DECLARE @pIDPaginaWeb	INT;
	SET @pIDPaginaWeb = (SELECT MAX(idPaginaWeb) FROM EMPLEADO.PaginaWeb) + 1;

	IF @pIDPaginaWeb is null	--Por si no hay registros
		SET @pIDPaginaWeb = 1;

	BEGIN TRAN

	INSERT INTO EMPLEADO.PaginaWeb VALUES(		--Inserta datos
		@pIDPaginaWeb,
		@pProducto,
		@pVerificacion,
		@pEstadoPagina
	)

	COMMIT TRAN
END
GO

CREATE OR ALTER PROCEDURE SPI_INSERTAR_Pagos

	@pSueldo			MONEY,
	@pDescuento			MONEY,
	@pIDEmpleado		INT

AS
BEGIN
	SET NOCOUNT ON;

	--ID de los pagos
	DECLARE @pIDPagos	INT;
	SET @pIDPagos = (SELECT MAX(idPagos) FROM EMPLEADO.Pagos) + 1;

	IF @pIDPagos is null	--Por si no hay registros
		SET @pIDPagos = 1;

	BEGIN TRAN

	--Se hace un insert con los datos que tenemos
	INSERT INTO EMPLEADO.Pagos (idPagos,sueldo,descuentoPagos) VALUES
	(@pIDPagos, @pSueldo, @pDescuento)

	COMMIT TRAN
END
GO





----	Pruebas de procedimientos almacenados	-----
/*
begin tran
EXEC SPI_INSERTAR_CLIENTE 1234123412341234, 'Juanito', 'Barranquilla', 'Meza', 'JuanMecanico@gmail.com', '12-01-2022', 'Peluche Temporada 29', 24,5529430149,0, 'Mexico', 'Coyoacan', 847, 'Insurgentes';
SELECT * FROM CLIENTE.Cliente
rollback tran
*/
/*
begin tran
EXEC SPI_INSERTAR_Pagos 25000, 3000, 1;
SELECT * FROM EMPLEADO.Pagos
rollback tran
*/
/*
begin tran
EXEC SPI_INSERTAR_WEB 'Peluche Volador', 1, 'Activada';
SELECT * FROM EMPLEADO.PaginaWeb
rollback tran
*/

/*
 * 
 * Company :      Equipo de Bases de Datos 
 * Project :      Proyecto.DM1
 * Author :       Rivera Morales Alan Adrian
 *
 * Date Created : 9/1/2023
  SD
 */

--Este código crea una tabla artificial llamada clientes_nuevos que almacena todos los datos de la tabla clientes.
SELECT *
INTO clientes_nuevos
FROM [CLIENTE].[Cliente];
go

select * from clientes_nuevos
go

--Añadimos dos columnas mas a la tabla artificial clientes_nuevos
alter table clientes_nuevos 
add hablar_con_cliente bit null
go

-- y agregamos valores nuevos a la tabla clientes_nuevos
UPDATE clientes_nuevos 
set  hablar_con_cliente =1
where [tarjetaPago] = 4020086625254625
go

UPDATE clientes_nuevos 
set  hablar_con_cliente =1
where [tarjetaPago] = 4017575344866482
go

--------------------------------------------------------------------------

--Este código crea un cursor llamado cur_clientes que selecciona todos los clientes que deben ser contactados de la tabla clientes.
--Luego, el cursor se recorre fila por fila y se procesa cada fila imprimiendo un mens
begin tran 
DECLARE @nombre VARCHAR(50);
DECLARE @telefono VARCHAR(50);

DECLARE cur_clientes CURSOR FOR
SELECT nombre, telefono FROM clientes_nuevos WHERE hablar_con_cliente = 1;

OPEN cur_clientes;

FETCH NEXT FROM cur_clientes INTO @nombre, @telefono;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Procesar la fila actual
    PRINT 'Llamando a: ' + @nombre + ' al número ' + @telefono;

    FETCH NEXT FROM cur_clientes INTO @nombre, @telefono;
END

CLOSE cur_clientes;
DEALLOCATE cur_clientes;
rollback tran

----------------------------------------------------------------------------------
--Este código crea una tabla temporal llamada clientes_temp y luego inserta algunos datos en ella.
--Luego, selecciona todos los datos de la tabla temporal y los muestra.
CREATE TABLE #Ventas_temp (
    id INT identity(1,1) PRIMARY KEY,
    cliente VARCHAR(50),
    producto VARCHAR(50),
    cantidad int,
	fecha date
);


INSERT INTO #Ventas_temp ( cliente, producto, cantidad,fecha)
VALUES ( 'Juan', 'Peluche de coleccion 23',20,'2022-11-25'),
       ( 'María', 'Peluche de coleccion 19',10,'2022-11-21'),
       ( 'Pedro', 'Peluches de coleccion 2',15,'2022-12-25');

SELECT * FROM #Ventas_temp;



--------------
--Este código crea un cursor llamado cur_ventas que selecciona todas las ventas que se realizaron y muestra el cliente que
--la realizo, el producto que compro y la cantiad que compro con la fecha del dia del pedido
begin tran 
DECLARE @id INT;
DECLARE @cliente VARCHAR(50);
DECLARE @producto VARCHAR(50);
DECLARE @cantidad INT;
DECLARE @fecha DATE;

DECLARE cur_ventas CURSOR FOR
SELECT id, cliente, producto, cantidad, fecha FROM #Ventas_temp;

OPEN cur_ventas;

FETCH NEXT FROM cur_ventas INTO @id, @cliente, @producto, @cantidad, @fecha;

WHILE @@FETCH_STATUS = 0
BEGIN
    -- Procesar la fila actual
    PRINT 'Venta: ' + CAST(@id AS VARCHAR) + ', Cliente: ' + @cliente + ', Producto: ' + @producto + ', Cantidad: ' + CAST(@cantidad AS VARCHAR) + ', Fecha: ' + CAST(@fecha AS VARCHAR);

    FETCH NEXT FROM cur_ventas INTO @id, @cliente, @producto, @cantidad, @fecha;
END

CLOSE cur_ventas;
DEALLOCATE cur_ventas;
rollback tran

-------------------------------------------------------------------

