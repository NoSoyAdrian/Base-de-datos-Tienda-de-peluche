use empresaTELEMARKETINGS2

--¿Cuántos clientes potenciales se han contactado en total?
SELECT COUNT(*)as 'Cliente' FROM [CLIENTE].[Cliente];

--¿Cuál es la tasa de éxito de las llamadas de venta?
SELECT COUNT(CASE WHEN [Resultado] = 'Vendida' THEN 1 END) / COUNT(*) FROM [VENTA].[Venta]


--¿Cuál es el producto más vendido?
SELECT [pelucheTemporada] as 'Peluche mas vendido' FROM [ALMACEN].[Almacen]
GROUP BY [pelucheTemporada]
ORDER BY COUNT([pelucheTemporada]) DESC

--¿Cuáles son los vendedores con más ventas?
SELECT [idEmpleado], SUM([ventasRealizadas]) as 'Ventas Totales'
FROM [EMPLEADO].[Vendedor]
GROUP BY [idEmpleado]
ORDER BY SUM([ventasRealizadas]) DESC