/*
 * 
 * Company :      Equipo de Bases de Datos 
 * Project :      Proyecto.DM1
 * Author :       Román Cruz Hugo
 *
 * Date Created : 1/1/2023
  SD
 */

 --Creacion de usuarios

-----	Hace de todo	-----

CREATE LOGIN propietario WITH PASSWORD = 'p123456'
GO

CREATE USER prop FOR LOGIN propietario
GO

ALTER ROLE db_ddladmin ADD MEMBER prop
GO

ALTER ROLE db_owner ADD MEMBER prop
GO


-----	No crea usuarios	-----


CREATE LOGIN administrador WITH PASSWORD = 'admin1'
GO

CREATE USER admi FOR LOGIN administrador
GO

ALTER ROLE db_ddladmin ADD MEMBER admi
GO

-----	Solo lectura	-----

CREATE LOGIN lector WITH PASSWORD = 'lector123'
GO

CREATE USER usuario FOR LOGIN lector
GO

ALTER ROLE db_datareader ADD MEMBER usuario 
GO
