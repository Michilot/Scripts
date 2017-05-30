select idclase,idusoext,idlugar,monto,idtarifa,count(*)
from bdtarveh.tarifadetalle 
where fechaanulacion is null and idtarifa  = 443
group by idclase,idusoext,idlugar,monto,idtarifa
having count(*)>1
order by idclase,idusoext,idlugar,idtarifa

select idclase,idusoext,idlugar,monto,idtarifa,count(*)
from bdtarveh.tarifadetalle 
where fechaanulacion is null-- and idtarifa  in (select idtarifa from bdtarveh.tarifa where IDTIPOTARIFA = 102 )
group by idclase,idusoext,idlugar,monto,idtarifa
having count(*)>1
order by idclase,idusoext,idlugar,idtarifa

edit bdtarveh.tarifadetalle where idclase = 4502 and idusoext = 1 and idlugar = 25 and idtarifa  = 434 order by FECHAREGISTRO  
 SELECT * 
FROM BDTARVEH.TARIFA 
WHERE IDTARIFA = 467






PKG_TARIFARIOSOAT.USP_ACTUALIZAR_DETALLETARIFA

DELETE FROM BDTARVEH.TARIFADETALLE WHERE IDTARIFADETALLE IN (
SELECT XYZ.ID FROM (
SELECT MIN(ABC.idtarifadetalle) ID,ABC.idclase,ABC.idusoext,ABC.idlugar,ABC.monto FROM (
select PRI.idtarifadetalle,PRI.idclase,PRI.idusoext,PRI.idlugar,PRI.monto 
from bdtarveh.tarifadetalle PRI INNER JOIN
(
select idclase,idusoext,idlugar,monto,count(*)
from bdtarveh.tarifadetalle 
where fechaanulacion is null and idtarifa  = 467
group by idclase,idusoext,idlugar,monto
having count(*)>1
order by idclase,idusoext,idlugar
) DET ON PRI.idclase= DET.idclase AND PRI.idusoext= DET.idusoext AND PRI.idlugar = DET.idlugar AND PRI.MONTO = DET.MONTO
where PRI.idtarifa  = 467 and PRI.FECHAANULACION IS nULL
) ABC
GROUP BY ABC.idclase,ABC.idusoext,ABC.idlugar,ABC.monto 
) XYZ
)

select * from bdtarveh.tarifadetalle