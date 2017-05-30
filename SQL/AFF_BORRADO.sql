SET NOCOUNT OFF ; 
   
CREATE TABLE #Temporal
(
 [ItemTem] [bigint] IDENTITY(1, 1)
                    NOT NULL
,IdProcesoCarga BIGINT
,IdProceso CHAR(2)
,IdUsuario VARCHAR(15)
,RazonSocial VARCHAR(150)
)
  ON
[PRIMARY]                                                    
CREATE CLUSTERED INDEX idx_TemporalDetalleRecauda ON #Temporal ([ItemTem]) WITH FILLFACTOR = 100     

DECLARE
  @RowCount BIGINT
, @RowIndex BIGINT
, @IdProcesoCarga BIGINT
, @IdProceso CHAR(2)
, @IdUsuario VARCHAR(15)
, @RazonSocial VARCHAR(150)
, @IdPlanillaAfiliacion INT
, @idplanillageneradora INT
, @IdPlanillaDeclaracion INT

SET @RowIndex = 1
 
INSERT  INTO #Temporal
        (IdProcesoCarga, IdProceso, IdUsuario, RazonSocial)
        SELECT -- TOP 5
          PC.IdProcesoCarga, AR.IdProceso, IdUsuario, PE.RazonSocial
        FROM
          dbo.ProcesoCarga PC
        INNER JOIN dbo.Patrocinador PA ON PC.IdPatrocinador = PA.IdPatrocinador
        INNER JOIN dbo.Persona PE ON PE.IdPersona = PA.IdPersona
        INNER JOIN dbo.Archivo AR ON PA.IdPatrocinador = AR.IdPatrocinador
                                     AND PC.IdArchivo = AR.IdArchivo
        WHERE
		-- idprocesocarga = 215525
		 idProducto = 'MARVEH'
        ORDER BY
          IdProceso 

		 -- DELETE FROM ProcesoCarga where idprocesocarga = 74633
		 -- DELETE FROM ProcesoCarga where idpatrocinador = 8

               
SET @RowCount = @@ROWCOUNT   
     
 
          
WHILE @RowIndex <= @RowCount 
  BEGIN 
   
    SELECT
      @IdProcesoCarga = IdProcesoCarga, @IdProceso = IdProceso, @IdUsuario = IdUsuario, @RazonSocial = RazonSocial
    FROM
      #Temporal nolock
    WHERE
      ItemTem = @RowIndex
         
    PRINT 'Inicio: ' + dbo.ToCadena(GETDATE()) + '@IdProcesoCarga: ' + dbo.ToCadena(@IdProcesoCarga) + ' / @IdProceso: ' + dbo.ToCadena(@IdProceso)
      + ' / @IdUsuario: ' + dbo.ToCadena(@IdUsuario) + ' / @IdUsuario: ' + dbo.ToCadena(@RazonSocial)
      ---  
    DELETE FROM
      dbo.Exceptionlogs
    WHERE
      IDPROCESOCARGA = @IdProcesoCarga
    
    DELETE FROM
      dbo.LogValidacion
    WHERE
      IDPROCESOCARGA = @IdProcesoCarga
      ----
    IF @IdProceso = 'CA' 
      BEGIN
         
        SELECT
          @idplanillageneradora = IdPlanillaDeclaracion
        FROM
          dbo.ArchivoPlanillaDeclaracion WITH (NOLOCK)
        WHERE
          IdProcesoCarga = @IdProcesoCarga
         
        SELECT
          @IdPlanillaDeclaracion = IdPlanillaDeclaracion
        FROM
          dbo.PlanillaDeclaracion WITH (NOLOCK)
        WHERE
          IdPlanillaGeneradora = @idplanillageneradora
         
        DELETE FROM
          dbo.AFFTBLPLL002
        WHERE
          NSECUENCIA = @IdPlanillaDeclaracion
                
        DELETE FROM
          dbo.AFFTBLPLL003
        WHERE
          NSECUENCIA = @IdPlanillaDeclaracion
	       
        DELETE FROM
          dbo.AFFTBLPLL001_out
        WHERE
          NSECUENCIA = @IdPlanillaDeclaracion
                
        DELETE FROM
          dbo.AFFTBLPLL002_out
        WHERE
          NSECUENCIA = @IdPlanillaDeclaracion
                
        DELETE FROM
          dbo.AFFTBLPLL003_out
        WHERE
          NSECUENCIA = @IdPlanillaDeclaracion
         
        DELETE FROM
          dbo.Declaracion
        WHERE
          IdPlanillaDeclaracion = @IdPlanillaDeclaracion
             
        DELETE FROM
          dbo.CabeceraCargo
        WHERE
          IdPlanillaDeclaracion = @idplanillageneradora
	    
        DELETE FROM
          dbo.CabeceraExtorno
        WHERE
          IdPlanillaDeclaracion = @idplanillageneradora
                
        DELETE FROM
          dbo.DetalleCargo
        WHERE
          IdPlanillaDeclaracion = @idplanillageneradora
         
        DELETE FROM
          dbo.DetalleExtorno
        WHERE
          IdPlanillaDeclaracion = @idplanillageneradora
              
        DELETE FROM
          dbo.ArchivoCargados
        WHERE
          IdProcesoCarga = @IdProcesoCarga
         
        DELETE FROM
          dbo.Tabla4ps
        WHERE
          IdProcesoCarga = @IdProcesoCarga
                              
        DELETE FROM
          dbo.DebitoBancarioCarga
        WHERE
          IdPlanillaAfiliacion = @IdPlanillaAfiliacion 
                              
                
        DELETE FROM
          dbo.AFFTBLPLLPPD
        WHERE
          NSECUENCIA = @IdPlanillaDeclaracion
                
        DELETE FROM
          dbo.AFFTBLPLL001_EXC
        WHERE
          NSECUENCIA = @IdPlanillaDeclaracion
                 
        DELETE FROM
          dbo.CultivoCarga
        WHERE
          IdPlanillaAfiliacion = @IdPlanillaDeclaracion
            
        DELETE FROM
          dbo.AFFTBLPLL001
        WHERE
          NSECUENCIA = @IdPlanillaDeclaracion
                
                
        DELETE FROM
          dbo.PlanillaDeclaracion
        WHERE
          IdPlanillaGeneradora = @idplanillageneradora
               
        DELETE FROM
          dbo.ArchivoPlanillaDeclaracion
        WHERE
          IdProcesoCarga = @IdProcesoCarga   
  
        DELETE FROM
          dbo.ProcesoCarga
        WHERE
          IdProcesoCarga = @IdProcesoCarga
      END
    ELSE 
      BEGIN

	  --delete from procesocarga where idpatrocinador = 8
	  --select * from tabla4ps where idusuario = 'userftp' and idpatrocinador = 94

	  --select * from procesocarga where idpatrocinador = 94

            ---
        SELECT
          @IdPlanillaAfiliacion = IdPlanillaAfiliacion
        FROM
          dbo.ArchivoPlanillaAfiliacion WITH (NOLOCK)
        WHERE
          IdProcesoCarga = @IdProcesoCarga

        DELETE FROM
          dbo.Certificado
        WHERE
          IdPlanilla = @IdPlanillaAfiliacion

        DELETE FROM
          dbo.CertificadoNoValidado
        WHERE
          IdPlanilla = @IdPlanillaAfiliacion
        
        DELETE FROM
          dbo.ArchivoCargados
        WHERE
          IdProcesoCarga = @IdProcesoCarga
       

  
        DELETE FROM
          dbo.Tabla4ps
        WHERE
          IdProcesoCarga = @IdProcesoCarga
        
        DELETE FROM
          dbo.GarantiaCarga
        WHERE
          IdPlanillaAfiliacion = @IdPlanillaAfiliacion 
        
        DELETE FROM
          dbo.ConyugeCarga
        WHERE
          IdPlanillaAfiliacion = @IdPlanillaAfiliacion 
        
        DELETE FROM
          dbo.AseguradoCarga
        WHERE
          IdPlanillaAfiliacion = @IdPlanillaAfiliacion 
        
        DELETE FROM
          dbo.AseguradoCargaAdicional
        WHERE
          IdPlanillaAfiliacion = @IdPlanillaAfiliacion 
        
        DELETE FROM
          dbo.ContratanteCarga
        WHERE
          IdPlanillaAfiliacion = @IdPlanillaAfiliacion 
        
        DELETE FROM
          dbo.BeneficiarioCarga
        WHERE
          IdPlanillaAfiliacion = @IdPlanillaAfiliacion 
        
        DELETE FROM
          dbo.EmpresaCarga
        WHERE
          IdPlanillaAfiliacion = @IdPlanillaAfiliacion 
        
        DELETE FROM
          dbo.MateriaAseguradaCarga
        WHERE
          IdPlanillaAfiliacion = @IdPlanillaAfiliacion
        
        DELETE FROM
          dbo.DeclaracionJuradaCarga
        WHERE
          IdPlanillaAfiliacion = @IdPlanillaAfiliacion 
        
        DELETE FROM
          dbo.DebitoBancarioCarga
        WHERE
          IdPlanillaAfiliacion = @IdPlanillaAfiliacion 
                              
        DELETE FROM
          dbo.VehiculoCarga
        WHERE
          IdPlanillaAfiliacion = @IdPlanillaAfiliacion 
        
        DELETE FROM
          dbo.CertificadoCarga
        WHERE
          IdPlanillaAfiliacion = @IdPlanillaAfiliacion 
        
        DELETE FROM
          dbo.CultivoCarga
        WHERE
          IdPlanillaAfiliacion = @IdPlanillaAfiliacion 
            
        DELETE FROM
          dbo.ArchivoPlanillaAfiliacion
        WHERE
          IdProcesoCarga = @IdProcesoCarga

         DELETE FROM
          dbo.ArchivoFTPCargados
        WHERE
          IdProcesoCarga = @IdProcesoCarga

	     DELETE FROM
          dbo.TramaRespuestaVehiculoDetalleError
         WHERE IdTrama IN (SELECT IdTrama FROM dbo.TramaRespuestaVehiculo  WHERE IdProcesoCarga = @IdProcesoCarga)  

	    DELETE FROM
          dbo.TramaRespuestaVehiculo
        WHERE
          IdProcesoCarga = @IdProcesoCarga

		DELETE FROM
          dbo.HostFTPDetalleConfiguracionTrabajo
        WHERE
          IdProcesoCarga = @IdProcesoCarga

        DELETE FROM
          dbo.ProcesoCarga
        WHERE
          IdProcesoCarga = @IdProcesoCarga
                          
        PRINT 'Se borró: ' + dbo.ToCadena(@IdProcesoCarga)
            
      END 
      -----
    SET @RowIndex = @RowIndex + 1 
  END
 
DROP TABLE #Temporal
 
--CHECKPOINT ;
--DBCC SHRINKFILE(AffinityMAC_log, 10);
--BACKUP LOG  AffinityMac WITH TRUNCATE_ONLY ;
--DBCC SHRINKFILE(AffinityMAC_log, 10);
 
 
 
 
 
 --DELETE FROM dbo.ProcesoCarga WHERE IdProcesoCarga = 79284 
 --UPDATE dbo.ArchivoPlanillaAfiliacion SET IdProcesoCarga = 13592 WHERE IdPlanillaAfiliacion = 38994
 --SELECT * FROM  dbo.ArchivoPlanillaAfiliacion WHERE IdProcesoCarga = 79284 
 
 --SELECT * FROM  dbo.ArchivoPlanillaAfiliacion
 --WHERE IdPatrocinador = 78