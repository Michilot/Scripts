SET NOCOUNT ON;  
DECLARE @certif integer, @valida integer, @query NVARCHAR(max), @cantidad_tmp CHAR(1), @ParmDefinition NVARCHAR(max),
@Error   smallint         ,
@Execut   NVARCHAR(max)
PRINT '-------- Poliza no existe --------';  
DECLARE policy_cursor CURSOR FOR   
SELECT * FROM OPENQUERY(LPGSLBDPRD01, 'select p_certif from tbldatainsunix where flag_estado = 1');
OPEN policy_cursor  
FETCH NEXT FROM policy_cursor   
INTO @certif
WHILE @@FETCH_STATUS = 0  
BEGIN  
	SET @query =  ' SELECT @cantidad_tmp = cant      
       FROM OPENQUERY(INSUNIX_LPG, ''SELECT count(*) as cant      
                    FROM POLICY WHERE USERCOMP = 1 AND COMPANY = 1 AND CERTYPE = ''''2'''' AND BRANCH = 66 AND POLICY = ' + CAST(@certif AS CHAR(10)) + ''')'                    
   SET @ParmDefinition = N'@cantidad_tmp CHAR(1) OUTPUT'        
   EXEC @Error = sp_executesql @query, @ParmDefinition, @cantidad_tmp = @cantidad_tmp OUTPUT 

   if @cantidad_tmp = '0'
   begin 
     print @query
   end
   FETCH NEXT FROM policy_cursor   
   INTO @certif
END   
CLOSE policy_cursor;  
DEALLOCATE policy_cursor;  


SELECT * FROM OPENQUERY(INSUNIX_LPG, 'SELECT * FROM PAT_COVER')