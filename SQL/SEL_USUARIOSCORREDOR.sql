USE bdsoatenlinea
DECLARE @INTERMED INT,@LOGIN varchar(	20)

SET @LOGIN  = '99728JEA'

--SELECT * FROM dbo.USUARIO u  WHERE u.cod_rol	    = 'AI'

SELECT  @INTERMED = u.intermed  FROM dbo.USUARIO u  WHERE u.login  = @LOGIN


--SELECT   u.* FROM dbo.USUARIO u  WHERE u.login  = @LOGIN
--UPDATE CORREDOR SET CORREDOR.codigint	 = 24, CORREDOR.id_CanalVenta	   = 24 WHERE intermed	 = 102832

SELECT c.* FROM dbo.CORREDOR c   WHERE c.intermed	   = @INTERMED

SELECT   u.* FROM dbo.USUARIO u  WHERE u.intermed	   = @INTERMED