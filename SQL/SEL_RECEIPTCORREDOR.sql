SELECT c.receipt, c.* FROM dbo.CERTIFICADO c	ORDER BY 1 DESC 

SELECT c.receipt, c.* FROM dbo.CERTIFICADO c	  WHERE c.receipt	 in (796106507,796106536,796107015,796107029,800086634)

SELECT * FROM dbo.Planilla_Certificado pc    WHERE  pc.id_certificado	 IN (447446,
447463,
447823,
447831)

SELECT c.* FROM dbo.CERTIFICADO c WHERE c.num_form	  = 84326526

--UPDATE CERTIFICADO  SET CERTIFICADO.cod_proceso  = 17 WHERE num_form	  = 84326526

--UPDATE CERTIFICADO  SET CERTIFICADO.emisdate  ='2017-02-02 18:36:33.740' WHERE num_form	  = 84326526


SELECT * FROM dbo.CORREDOR c	   WHERE c.idintermedSC	  = 12604

SELECT * FROM dbo.Planilla_Certificado pc    WHERE pc.idPlanilla	    = 107102

SELECT  u.* FROM dbo.USUARIO u   WHERE u.agent   = 4573

SELECT dbo.CERTIFICADO.receipt, * FROM dbo.CERTIFICADO  WHERE agent   = 11409

