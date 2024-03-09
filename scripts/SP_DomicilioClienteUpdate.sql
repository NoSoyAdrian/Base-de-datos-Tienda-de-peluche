use empresaTELEMARKETINGS2

begin tran
UPDATE CLIENTE.DomicilioCliente
SET pais = 'Estados Unidos'
WHERE idDomicilioCliente = 1
rollback tran