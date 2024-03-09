use empresaTELEMARKETINGS2

---SP_GENERAR_VENTA 
select * from [VENTA].[Venta]
EXEC SP_GENERAR_VENTA   @p_idCliente = 2;