
insert into ExceptionlogsSELBK
select * from ExceptionlogsSEL

select * from ExceptionlogsSEL order by 1  desc 

SW_SP_EliminarPlanilla 139501

select * from DetallePlanilla where idPlanilla = 139501

delete from DetallePlanilla where idPlanilla = 139501

---------------/////////////////////////////////////////////////////////////////-------------
select * from CORREDOR where descript like '%BIF%'

select id_usu, '[' + CONVERT(varchar, cod_rol) + '] ' +  ApeUsuario + ' ' +  NomUsuario +  ' -- [ ' + login + ' ] -- [' + CASE flag_activo  WHEN 1 THEN 'ACTIVO' ELSE 'INACTIVO' END + '] ' from USUARIO

select * from CORREDOR where flagTarifario = 1

select * from CORREDOR where intermed = 102804 

--update CORREDOR set id_canalventa =codigint  where intermed in (102849,102849,102850,102851,102852,102853,102854,102855,102856,102857 )

--update CORREDOR set id_canalventa = 77,codigint = 77 where intermed = 102847  

--update CORREDOR set flagTarifario = 0,canal = NULL where intermed = 102229  

select INTERMED, CORR.descript,CORR.intermed,CORR.flagTarifario,CORR.idintermedSC ,CORR.canal,zipcode,CORR.est_reg,(select  nomRegion from Region_Ubigeo DEP where DEP.codRegion = LEFT(zipcode,2)) zona , id_CanalVenta, codigint
from CORREDOR CORR where intermed in (102847,
102849,
102850,
102851,
102852,
102853,
102854,
102855,
102856,
102857,
102858
)

update CORREDOR SET id_canalventa = 77, codigint= 77 where intermed in (102847,
102849,
102850,
102851,
102852,
102853,
102854,
102855,
102856,
102857,
102858
)  


select CORR.id_corredor
CORR.descript,CORR.intermed,CORR.flagTarifario,CORR.idintermedSC ,CORR.canal,
(select  nomRegion from Region_Ubigeo DEP where DEP.codRegion = LEFT(zipcode,2)) zona
from CORREDOR CORR where CORR.descript like '%' + '' + '%' and CORR.est_reg = 1

select CORR.id_corredor,CORR.descript from CORREDOR CORR where CORR.descript like '%' + '' + '%' order by descript 


select id_corredor,codigint,id_CanalVenta, descript, grupo, intermed, idintermedSC, zipcode, INTERMPADRE,  est_reg,flagTarifario, canal
from CORREDOR where intermed = 102229
---------------/////////////////////////////////////////////////////////////////-------------

select * from USUARIO where ApeUsuario like '%REYES SIL%' order by ApeUsuario,NomUsuario

select * from USUARIO where NomUsuario like '%SARAI%' order by ApeUsuario,NomUsuario

select intermed,id_usu, cod_rol,agent,login,password,flag_activo,ApeUsuario,NomUsuario from USUARIO where intermed in (102850)



select id_usu, '[' + CONVERT(varchar, cod_rol) + '] ' +  ApeUsuario + ' ' +  NomUsuario  +  ' -- [' + CASE flag_activo  WHEN 1 THEN 'ACTIVO' ELSE 'INACTIVO' END + '] ' from USUARIO where intermed = 102847


Select  id_usu, '[' + CONVERT(varchar, cod_rol) + '] ' +  ApeUsuario + ' ' +  NomUsuario  +  ' -- (' + CASE flag_activo  WHEN 1 THEN 'ACTIVO' ELSE 'INACTIVO' END + ') ' +  '[' + LTRIM(RTRIM(CORR.descript))  +  ' -- ' +  CONVERT(varchar, CORR.intermed)  +  ' -- ' +  CONVERT(varchar, CORR.est_reg)+ ']' from USUARIO USU Inner join CORREDOR CORR on USU.intermed = CORR.intermed where ApeUsuario like '%' +'ABAD'+ '%' AND NomUsuario like '%' + ''+ '%' order by ApeUsuario, NomUsuario

SELECT * FROM USUARIO where ApeUsuario like '%' +''+ '%' oR NomUsuario like '%' +''+ '%'


SELECT  u.* FROM dbo.USUARIO u	WHERE u.flag_activo	 = '1'

select * from certificado order by 1 desc

SELECT  u.* FROM dbo.USUARIO u	WHERE u.login	 = 'scajica'

SELECT  u.* FROM dbo.USUARIO u	WHERE u.login	 = 'CMACSULL125'

update USUARIO  set flag_activo = 1 WHERE login	 = 'admmaqui01'

SELECT * FROM USUARIO where login in ( 'admcoopahorro01','admcoopahorro02','admcoopahorro03','admcoopahorro04','admcoopahorro05','admcoopahorro06','admcoopahorro07','admcoopahorro08','admcoopahorro09','admcoopahorro10','admcoopahorro11')

select * from USUARIO where agent = 99941

SELECT  * FROM dbo.Rol_Usuario_Menu where id_usu = 18048

-- UPDATE USUARIO SET flag_activo = 1 WHERE login	 = 'cmacmetrolarc01'
-- UPDATE USUARIO SET flag_activo = 1,cod_rol= 'AI' WHERE login	 = 'caymac0'
-- UPDATE Rol_Usuario_Menu SET cod_rol= 'AI'  where id_usu = 24377
-------------------------------------------------------------------------------------------
SELECT * from ADMINISTRADOR_INTERMEDIARIO where id_usu = 24377 and intermed = 200040

SELECT * from ADMINISTRADOR_INTERMEDIARIO where intermed = 99736

INSERT INTO ADMINISTRADOR_INTERMEDIARIO (id_usu,intermed) VALUES (24370,200040)

--UPDATE ADMINISTRADOR_INTERMEDIARIO SET id_usu = 24377 where id_usu = 22080

--UPDATE ADMINISTRADOR_INTERMEDIARIO SET fec_crea = '2017-03-24 18:56:42.473' where id_usu = 24370 and intermed = 200040

---------------------------------------
select * from planilla where idPlanilla in (
select  idPlanilla from Planilla_Certificado where id_certificado in (
select id_certificado from CERTIFICADO where intermed = 101322
)
) and intermed<>8680

select top 15 * from CERTIFICADO order by 1 desc

select * from CERTIFICADO where appcode is not null

select * from CERTIFICADO where FlagEnvioInx is null

select * from Numerator




update Numerator set ninicial = 15585242 , nfinal = 17585241, lastnumb = 15585242  where typenume = 0 

--delete from CERTIFICADO where id_certificado = 583004

update CERTIFICADO set appcode = 10

select * from CERTIFICADO where intermed in (SELECT  intermed from ADMINISTRADOR_INTERMEDIARIO where id_usu = 24070)

select * from Planilla_Certificado where id_certificado in (524718,
528239,
536715,
536734,
539153,
542886,
530971,
532057,
557252)
--------------------------------------------------------------------------------------------
select * from usuario where id_usu in (
SELECT id_usu from ADMINISTRADOR_INTERMEDIARIO where intermed = 99784
)


select * from Rol_Usuario_Menu



select * from CERTIFICADO order by 1 desc 


select * from CERTIFICADO where certif = 15587542

update CERTIFICADO set num_form = 84962945 where certif = 15587542

select * from CERTIFICADO where num_form = 15587542
select * from VEHICULO where id_vehiculo = 694614

select * from USUARIO where agent = 9865

select * from Planilla_Certificado where id_certificado = 565325

select * from Planilla where idPlanilla = 134126

update Planilla set intermed = 100407 , id_usu = 20187 where idPlanilla = 134126



-----------------------------------
select * from UsoClaseVehiculo

select * from Soat_Tar_Intermed  where intermed = 100484 

update Soat_Tar_Intermed  set nulldate = null where intermed = 102858 

--insert into Soat_Tar_Intermed (tariff_type,intermed,effecdate,nulldate,statregt,CodImportacion) values (1,102752,getdate()-1,null,1,1)
-----------------------------------



select '[' + LTRIM(RTRIM(descript)) + '] - idintermedSC:' + CONVERT(VARCHAR,idintermedSC) + ' - ' + CONVERT(VARCHAR,intermed)  from CORREDOR where ruc = '20382036655' and est_reg = 1

