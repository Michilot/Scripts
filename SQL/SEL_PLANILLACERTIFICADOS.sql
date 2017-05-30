use sgcprod
GO

DECLARE @POOL INT, @PLANILLA INT,@INTERMED INT,@IDPLANILLA INT
SET @POOL = 95
SET @PLANILLA = 163123				


-- 122102,121195,120910,120689
select @INTERMED = intermed,@IDPLANILLA = IdPlanilla from [LPGSLBDPRD01].BDSOATENLINEA.dbo.Planilla where numplanillaPositiva = @PLANILLA

select 'SEL PLANILLA',* from [LPGSLBDPRD01].BDSOATENLINEA.dbo.Planilla where numplanillaPositiva = @PLANILLA

select 'SEL DETALLEPLANILLA',* from [LPGSLBDPRD01].BDSOATENLINEA.dbo.DetallePlanilla where idPlanilla = @IDPLANILLA

select 'SEL PLANILLACERTIFICADO',* from [LPGSLBDPRD01].BDSOATENLINEA.dbo.Planilla_certificado where idPlanilla = @IDPLANILLA

select 'SEL',* from  [LPGSLBDPRD01].BDSOATENLINEA.dbo.USUARIO where intermed  in (@INTERMED) and cod_rol = 'A'

/*
update [LPGSLBDPRD01].BDSOATENLINEA.dbo.Planilla set idEstadoPlanilla =1 where idPlanilla = 133715
update [LPGSLBDPRD01].BDSOATENLINEA.dbo.DetallePlanilla set idcuentacorriente = 22 ,idBancoCheque = 148,Idmoneda = 1 where idPlanilla = 133715 and idTipLiquidacion = 7
*/

-- 122102,121195,120910,120689

--select * from [LPGSLBDPRD01].BDSOATENLINEA.dbo.Planilla_certificado where idPlanilla = (select idPlanilla from [LPGSLBDPRD01].BDSOATENLINEA.dbo.Planilla where numplanillaPositiva = @PLANILLA)

--SELECT C.idPlanilla ,a.certif ,a.emisdate,a.receipt ,A.premium ,a.num_form ,a.id_certificado,a.id_certificadoNC,c.numPlanillaPositiva ,c.fechaEmiPlanilla ,c.idEstadoPlanilla ,c.intermed ,
--c.montoDolaresPlanilla ,A.Cod_FormaPago,a.cod_proceso ,d.id_contratante ,d.Codigo_VT,d.id_tipopersona,CASE WHEN d.id_tipopersona = 'J' THEN d.cliename ELSE d.NomContratante + ' ' + d.ApeContratante END AS nombre,
--CASE WHEN d.id_tipopersona = 'J' THEN d.num_doc ELSE d.DNIContratante END AS Documento,cor.zipcode,cor.intermed,cor.descript,cor.INTERMPADRE, a.Cod_ZonaCirculacion,d.zipcode,d.UbigeoSOAT,
--v.regist,v.idClasevehiculo,cla.codClaseVehiculo,cla.nomClaseVehiculo,v.idUso,u.codUso,u.nomUso 
--FROM [LPGSLBDPRD01].BDSOATENLINEA.dbo.CERTIFICADO a
--INNER JOIN [LPGSLBDPRD01].BDSOATENLINEA.dbo.CORREDOR cor ON cor.intermed = a.intermed
--LEFT JOIN [LPGSLBDPRD01].BDSOATENLINEA.dbo.Planilla_Certificado b ON b.id_certificado = a.id_certificado
--LEFT JOIN [LPGSLBDPRD01].BDSOATENLINEA.dbo.Planilla c ON c.idPlanilla = b.idPlanilla
--LEFT JOIN [LPGSLBDPRD01].BDSOATENLINEA.dbo.CONTRATANTE d ON d.id_contratante = a.id_asegurado
--LEFT JOIN [LPGSLBDPRD01].BDSOATENLINEA.dbo.VEHICULO v ON v.id_vehiculo = a.id_vehiculo
--LEFT JOIN [LPGSLBDPRD01].BDSOATENLINEA.dbo.ClaseVehiculo cla ON v.idClaseVehiculo = cla.idClasevehiculo
--LEFT JOIN [LPGSLBDPRD01].BDSOATENLINEA.dbo.Uso u ON v.idUso = u.idUso
--WHERE c.idPlanilla = (select idPlanilla from [LPGSLBDPRD01].BDSOATENLINEA.dbo.Planilla where numplanillaPositiva = @PLANILLA)
--WHERE a.num_form in (84195590, 84195576)
--WHERE a.receipt = 796120374 
--WHERE a.certif IN (10580568)



----se verifica que esté en estado enviado
--select idPlanilla, intermed, idEstadoPlanilla from Planilla where numPlanillaPositiva in (154072)

----se obgtiene el idPlanilla y se verifica en DetallePlanilla
--select * from [LPGSLBDPRD01].BDSOATENLINEA.dbo.DetallePlanilla where idPlanilla = 131022

----se actualiza el estado de la planilla
--update Planilla set idEstadoPlanilla = 1 where numPlanillaPositiva in (154072)

----se actualiza los campos en detalle de planilla cuando la liquidacion es del tipo 7 
--update DetallePlanilla set idcuentacorriente = 22 ,idBancoCheque = 148 where idPlanilla in(131022) and idTipLiquidacion = 7

----se obtiene el administrador con el codigo de intermediario 
--select * from USUARIO where intermed  in (100051) and cod_rol = 'A'

----Enviar la planilla desde el SEL


--select * from tblplandescargodet where id_empr = '01' and id_sub_prod= '003' and id_codi_prod = '798204705'

--select certif,receipt,premium from [LPGSLBDPRD01].BDSOATENLINEA.dbo.CERTIFICADO where certif = 10627805

--select id_certificado, certif,receipt,premium from [LPGSLBDPRD01].BDSOATENLINEA.dbo.CERTIFICADO where certif = 10627805

--select * from [LPGSLBDPRD01].BDSOATENLINEA.dbo.Planilla_Certificado where id_certificado = 548325

select 'SGC',NU_plan_caja,* from tblplandescargo where id_pool = @POOL and nu_plan_desc= @PLANILLA  

select 'SGC',* from tblplandescargodet where id_pool = @POOL and nu_plan_desc= @PLANILLA  


	SELECT 'SGC',NSTATUS,CASE WHEN NSTATUS = 0 THEN 'EN ESPERA'WHEN NSTATUS = 1 THEN 'EN PROCESO'WHEN NSTATUS = 2 THEN 'TRANSFERIDA SAP'WHEN NSTATUS = 3 THEN 'CON ERROR'ELSE ''END 
	  SSTATUS, CASE NPRIORIDAD WHEN  '1' THEN 'MASIVO' WHEN  '3' THEN 'TRANSACCIONAL'  END  NPRIORIDAD , SERROR, SFILTRO1 ,SFILTRO2,DFECREG , *
	FROM WBSTBLJOBS001 WITH  (NOLOCK)
	-- update  WBSTBLJOBS001 set nstatus = 0, DFECREG = getdate(), serror = null
	--  update WBSTBLJOBS001 set nprioridad = 3
	-- delete from WBSTBLJOBS001  --where nsecuencia = 94504
	 --WHERE SFILTRO1 IN  ('1')   AND SFILTRO2 IN ('208948' ) 
	  -- AND NSECUENCIA = 125482
	  WHERE SFILTRO1 = @POOL   AND SFILTRO2 = @PLANILLA
 -- AND NSTATUS = 2

 select top 2 * from tblcobranzas WITH (NOLOCK) where id_codi_prod in ( '798206320','798234027')