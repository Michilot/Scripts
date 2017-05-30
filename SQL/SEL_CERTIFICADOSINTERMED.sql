select * from (
select 
(select  descript from corredor where intermed = CE.intermed) AGENCIA,
CE.certif,Ce.premium, CE.effecdate,intermed, num_form formulario, VE.idUso,
(select  A.nomUso from Uso A WHERE A.idUso = VE.idUso) USO,
(select  A.codUso from Uso A WHERE A.idUso = VE.idUso) USOCORE,
(select B.nomClaseVehiculo from ClaseVehiculo B WHERE B.idClaseVehiculo = VE.idClasevehiculo) CLASE,
(select B.codClaseVehiculo from ClaseVehiculo B WHERE B.idClaseVehiculo = VE.idClasevehiculo) CLASECORE
, agent
 from CERTIFICADO CE inner join VEHICULO VE on VE.id_vehiculo = CE.id_vehiculo
where CE.intermed in (SELECT  u.intermed FROM dbo.ADMINISTRADOR_INTERMEDIARIO u WHERE id_usu = 19377)
and dbo.trunc_date(CE.Emisdate) BETWEEN CONVERT(DATETIME, '01/03/2017' , 103)                    
                                AND CONVERT(DATETIME, '28/03/2017' , 103) 
--and year(CE.emisdate) = 2017 and MONTH(CE.emisdate) = 2 
and CE.certif_impreso = 1 and CE.fgEmitido = 1 and certif>0
) A
order by agencia,USO,CLASE

 

 --SELECt * FROM CORREDOR where idintermedSC in (5856,6044,7012,9724)

 --select * from planilla where numPlanillaPositiva = 138411  

 --select * from CERTIFICADO where num_form in (84337809 ,84337818)

 --select * from USUARIO where agent in (11842)

 --select * from CORREDOR where intermed = 12605