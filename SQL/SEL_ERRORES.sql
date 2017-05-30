DECLARE @FECHA datetime = GETDATE()

SELECT 
(select count(*) from certificado NOLOCK where year(fec_reg) = year(@FECHA) and month(fec_reg) = month(@FECHA) and day(fec_reg) = day(@FECHA) and certif > 0) OK ,
(select count(DISTINCT num_form) from certificado NOLOCK where year(fec_reg) = year(@FECHA) and month(fec_reg) =  month(@FECHA) and day(fec_reg) =  day(@FECHA) and certif = 0)	   CANTIDADERROR,
(select count(*) from certificado NOLOCK where year(fec_reg) = year(@FECHA) and month(fec_reg) = month(@FECHA) and day(fec_reg) = day(@FECHA) and certif = 0)  INTENTOSERROR

select  DISTINCT es.Comentario ,es.Aplicacion,es.Mensaje ,count(*) Cantidad,min(FechaCreacion) HoraInicio,max(FechaCreacion) HoraUltimoError
from   dbo.ExceptionlogsSEL es
where year(FechaCreacion) = year(@FECHA) and month(FechaCreacion) = month(@FECHA) and day(FechaCreacion) = day(@FECHA)
GROUP BY es.Comentario ,es.Aplicacion,es.Mensaje
order by HoraUltimoError DESC
	
--select top 100 * from exceptionlogssel order by 1 DESC
select top 50 * from certificado NOLOCK order by 1 desc 

select * from TblDataInsunix where flag_estado = 0

--select * from certificado where  intermed = 13292

--select * from certificado where certif = 15606702

select * from certificado where num_form = 84415190 

select * from certificado where num_form = 84415190 

--update certificado set emisdate = '2017-05-29 16:38:59.030' where num_form = 84415190 



select * from Formulario_Anulado where num_form = 84869241

--update certificado set FlagEnvioInx = 1 where certif = 10673593

--select * from CORREDOR where intermed = 102819
--23042716

--select * from USUARIO where login = 'admmarjlt0'

--select * from CERTIFICADO where certif	in (10669410,
--10669389,
--15587381,
--15587388)

--select * from VEHICULO where id_vehiculo in (
--718837,
--718847,
--722656,
--722661
--)


--select * from BRANDMODEL..TAB_AU_VER where SVERSION = 10010152

--select * from CONTRATANTE where id_contratante = 580226

--update CONTRATANTE set num_doc = '70454916', cliename = 'LEON CASUSOL	GUILLERMO LEONIDAS' where id_contratante = 580226

--select * from CORREDOR where intermed = 99956

--select * from VEHICULO where id_vehiculo = 722383

--update CERTIFICADO set FlagEnvioInx = 1 where certif	= 23042716

--select * from certificado where  id_vehiculo = 721320

--select * from VEHICULO where id_vehiculo = 721320


--select * from BRANDMODEL..TAB_AU_VER where SVERSION = 10001259

--select * from BRANDMODEL..TAB_AU_MOD where SVEHCODE = 1000711

--select * from BRANDMODEL..TAB_AU_BRA where NVEHBRAND = 6029





--DELETE FROM ExceptionlogsSEL where Mensaje = 'Error al Emitir la Póliza, graba_polcertrec_nc: -535|                                                                                                    '

--select num_form,* from certificado NOLOCK where year(fec_reg) = year(@FECHA) and month(fec_reg) =  month(@FECHA) and day(fec_reg) =  day(@FECHA) and certif = 0 
--ORDER BY num_form

--SELECT * FROM dbo.CERTIFICADO c  WHERE c.num_form	   = 10583561
 
 --SELECT * FROM dbo.CERTIFICADO c  WHERE c.certif	  IN (10582873, 10583561)
 
 
-- select  DISTINCT num_form  from certificado NOLOCK where year(fec_reg) = 2017 and month(fec_reg) = 2 and day(fec_reg) = 1 and certif = 0
--select * from dbo.CERTIFICADO c  where agent = 8437 AND certif >0 ORDER BY 1 desc
--select * from dbo.CERTIFICADO c  where num_form = 84314739  

--select num_form,* from dbo.CERTIFICADO c  where  certif = 10588686
--select * from dbo.CERTIFICADO c  where num_form = 84195465 
/*FORMULARIO : 84896662 */
--DELETE FROM certificado WHERE certificado.certif	   = 10588686

--SELECT c.* FROM dbo.CERTIFICADO c	  WHERE c.receipt	  = 796094894
--DELETE FROM certificado WHERE certificado.certif	   = 10588686
--select * from usuario where agent = 8437

--SELECT   c.* FROM dbo.CORREDOR c	  WHERE c.id_corredor = 3628
--SELECT TOP 50 fechagraba, * FROM dbo.Planilla p	  ORDER BY 2 desc
 --select * from numerator
--select  * from certificado where fgemitido = 2 
--select * from numerator
--select * from vehiculo where regist = 'D7M-145'
--select * from certificado where id_vehiculo = 544961
--select * from certificado where num_form = 84315757
----update certificado set cod_proceso = 16 where num_form = 84315757
----84324498

----delete from certificado where certif = 0
/*
INSERT dbo.ExceptionlogsSELBK(UsuarioSistemaId,    Aplicacion,    StackTrace,    Metodo,    Mensaje,    CodigoFuente,    TipoExcepcion,    Comentario,    NombreProyecto,    NombreClase,    ResumenError,    FechaCreacion)
SELECT UsuarioSistemaId,Aplicacion,    StackTrace,    Metodo,    Mensaje,    CodigoFuente,    TipoExcepcion,    Comentario,    NombreProyecto,    NombreClase,    ResumenError,    FechaCreacion 
FROM dbo.ExceptionlogsSEL es
DELETE FROM ExceptionlogsSEL
*/


--192.168.118.110

--SELECT   u.* FROM dbo.USUARIO u  WHERE u.login   = 'cattyg'

--SELECT   c.* FROM dbo.CORREDOR c	  WHERE c.intermed	  = 200055
 