SELECT pol.NBRANCH,    pol.NPOLICY    ,    pol.NCERTIF    ,    pol.DEFFECDATE    ,    pol.NINTERTYP    ,    pol.NINTERMED    ,    pol.NPERCENT
  FROM COMMISSION POL
  where npolicy = 30000001
  and ncertif = 944
  
  
 Insert into COMMISSION (SCERTYPE, NBRANCH, NPRODUCT, NPOLICY, NINTERTYP, NINTERMED, DEFFECDATE, SCOMMITYP, DCOMPDATE, NSHARE, NUSERCODE, NCERTIF, NINSTALLCOM,NPERCENT) 
 Values ('2', 23, 0, 2734777, 29, 13982, TO_DATE('01/01/2017 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), '1', TO_DATE('12/23/2016 14:06:56', 'MM/DD/YYYY HH24:MI:SS'), 100, 9999, 312, 0, TO_NUMBER( 11));
 
  
  
  

SELECT *
  FROM PREMIUM_CE
  where npolicy = 30000001
  and ncertif = 922



Insert into COMMISSION (SCERTYPE, NBRANCH, NPRODUCT, NPOLICY, NINTERTYP, NINTERMED, DEFFECDATE, SCOMMITYP, DCOMPDATE, NSHARE, NUSERCODE, NCERTIF, NINSTALLCOM,NPERCENT)
 Values ('2', 6, 8, 250000531, 22, 19905, TO_DATE('12/04/2016 00:00:00', 'MM/DD/YYYY HH24:MI:SS'), '2', TO_DATE('12/05/2016 14:06:56', 'MM/DD/YYYY HH24:MI:SS'), 100, 9999, 8949, 0, TO_NUMBER(1.5));

SELECT TO_NUMBER(1.5) FROM DUAL;

SELECT pol.NBRANCH,	pol.NPOLICY	,	pol.NCERTIF	,	pol.DEFFECDATE	,	pol.NINTERTYP    ,    pol.NINTERMED    ,    pol.NPERCENT
  FROM COMMISSION POL
 WHERE pol.NINTERTYP = 23 AND NPOLICY IN
          (250000531,
           50005802,
           50017946,
           50017974,
           50017894,
           50017895,
           50018087,
           50018088,
           50018061,
           50018062,
           50018335,
           50018321,
           50005461,
           50018063,
           50018344,
           50018336,
           50005462,
           230106822,
           230106694,
           230106529,
           230106530,
           230106531,
           230106510,
           230106512,
           230106743,
           230106715,
           230106695,
           230106716,
           230106498,
           230106772,
           230106696,
           230106697,
           230106698,
           230106533,
           230106534,
           230106452,
           230106514,
           20000002,
           20000001,
           20000003,
           20000004,
           30000001,
           230075869,
           230076664
          )