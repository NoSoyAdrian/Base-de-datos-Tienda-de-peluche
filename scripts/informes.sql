use empresaTELEMARKETINGS2

--�Cu�ntos clientes potenciales se han contactado en total?
SELECT COUNT(*)as 'Cliente' FROM [CLIENTE].[Cliente];

--�Cu�l es la tasa de �xito de las llamadas de venta?
SELECT COUNT(CASE WHEN [Resultado] = 'Vendida' THEN 1 END) / COUNT(*) FROM [VENTA].[Venta]


--�Cu�l es el producto m�s vendido?
SELECT [pelucheTemporada] as 'Peluche mas vendido' FROM [ALMACEN].[Almacen]
GROUP BY [pelucheTemporada]
ORDER BY COUNT([pelucheTemporada]) DESC

--�Cu�les son los vendedores con m�s ventas?
SELECT [idEmpleado], SUM([ventasRealizadas]) as 'Ventas Totales'
FROM [EMPLEADO].[Vendedor]
GROUP BY [idEmpleado]
ORDER BY SUM([ventasRealizadas]) DESC