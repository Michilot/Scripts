SELECT 'Positiva' COMPANY, 
       T9.NOFFICE CODIGOOFICINA,
       T9.SDESCRIPT OFICINA, 
       C.NBRANCH CODIGORAMO,
       T10.SDESCRIPT RAMO,       
       P.NPRODUCT CODIGOPRODUCTO,
       REAGENERALPKG.REASPRODUCT(C.NBRANCH,P.NPRODUCT) PRODUCTO, 
       P.NPOLICY POLIZA,
       C.NCERTIF CERTIFICADO,  
       C.DEFFECDATE FECHAINICIOVIGENCIA,   
       C.DEFFECDATE FECHAEMISION, 
       C.NINTERMED CODIGOINTERMEDIARIO, 
       CL.SCLIENAME INTERMEDIARIO,                
       C.NINTERTYP CODIGOROL, 
       C.NPERCENT PORCENTAJECOMISION, 
       PR.NRECEIPT RECIBO,
       PR.DSTATDATE FECHAESTADORECIBO,
       CASE WHEN NDESTINYCOUPON IS NOT NULL THEN 2 ELSE PR.NSTATUS_PRE END CODIGORECIBO,       
       REAGENERALPKG.REACODIGINT('TABLE19', 'NSTATUS_PRE', CASE WHEN NDESTINYCOUPON IS NOT NULL THEN 2 ELSE PR.NSTATUS_PRE END) ESTADORECIBO,         
       PR.NCURRENCY CODIGOMONEDA,
       PR.NPREMIUM PRIMATOTAL, 
       PR.NPREMIUMN PRIMANETA,
       ROUND (((PR.NPREMIUMN * C.NPERCENT) / 100), 2) COMISIONXROL,
       R.SDESCRIPT ROL,
       T.CODRRHH CODRRHH,
       PT.UBICACION,       
       PT.DESCRIPT PUNTOVENTA,
       CLID.SCLINUMDOCU ELEC_BOOK ,
       PR.NSTATUS_PRE ESTADOORIGEN
       P.SCOLINVOT,
       'VTI' SISTEMA,
       PR.NEXCHANGE   
  FROM INSUDB.COMMISSION C,
       INSUDB.POLICY P  , 
       INSUDB.INTERMEDIA I,
       INSUDB.TABLE9 T9,
       INSUDB.TABLE10 T10,
       INSUDB.CLIENT CL,
       INSUDB.PREMIUM PR,
       INSUDB.INTERM_TYP R,
       INSUDB.TBL_PVINTERMED T,
       INSUDB.TBL_PUNTOVENTA PT,
       INSUDB.CLIDOCUMENTS CLID
 WHERE C.SCERTYPE = P.SCERTYPE
   AND C.NBRANCH = P.NBRANCH
   AND C.NPRODUCT = P.NPRODUCT
   AND C.NPOLICY = P.NPOLICY
   AND C.NINTERTYP IN (21, 22, 23, 27, 28, 29)
   AND I.NINTERMED = C.NINTERMED
   AND T9.NOFFICE = P.NOFFICE
   AND T10.NBRANCH = P.NBRANCH
   AND CL.SCLIENT = I.SCLIENT
   AND PR.SCERTYPE = C.SCERTYPE
   AND PR.NBRANCH = C.NBRANCH
   AND PR.NPRODUCT = C.NPRODUCT
   AND PR.NPOLICY = C.NPOLICY
   AND PR.NCERTIF = C.NCERTIF
   AND PR.NDIGIT    = 0 
   AND PR.NPAYNUMBE   = 0 
   AND PR.NORIGINCOUPON IS NULL
   AND R.NINTERTYP = C.NINTERTYP
   AND T.INTERMED = I.NINTERMED
   AND T.NULLDATE IS NULL 
   AND PT.IDPUNTOVENTA = T.IDPUNTOVENTA 
   AND CLID.SCLIENT = I.SCLIENT
   AND CLID.NTYPCLIENTDOC = 1
   AND P.SCOLINVOT IN (1,2)
   AND C.NPOLICY  = 2734951
   -- AND C.NCERTIF >  0
     
   
   
   
   
   
   SELECT * FROM POLICY WHERE  NPOLICY = 30000004
   
   select * from table50
   
   SELECT * FROM PREMIUM_CE WHERE NRECEIPT = 214783447
   
   SELECT * FROM CERTIFICAT WHERE NBRANCH = 6 AND NPOLICY = 30000004 AND NCERTIF = 57
   
   SELECT * FROM PREMIUM WHERE NBRANCH = 6 AND NPOLICY = 30000004 AND NCERTIF = 57

   SELECT * FROM PREMIUM_CE WHERE NBRANCH = 6 AND NPOLICY = 30000004 AND NCERTIF = 57
   
   
   NRECEIPT = 214783447
   
   
   NRECEIPT

214783449
214783444
214783448
214783451
214783450
214783447

   
   SELECT * FROM PREMIUM_CE WHERE NBRANCH = 6 AND NPOLICY = 30000004 AND  NRECEIPT  = 214783449