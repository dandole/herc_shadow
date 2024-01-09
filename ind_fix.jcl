//IBMUSERI JOB (1),DAN,CLASS=A,MSGCLASS=A,MSGLEVEL=(1,1),
//             USER=IBMUSER,PASSWORD=SYS1
//* USING IEBGENER TO FIX IND$FILE BUFFER
//FIX      EXEC PGM=IEBGENER
//SYSPRINT DD SYSOUT=A
//SYSIN    DD DUMMY
//SYSUT1   DD *
CONFIG=00,                         /*CONFIG LIST SUFFIX              */+0000010
SSCPID=01,                         /*THIS VTAMS ID IN NETWORK        */+0000020
NETSOL=YES,                        /*NETWORK SOLICITOR OPTION        */+0000030
MAXSUBA=31,                        /*MAXIMUM SUBAREAS IN NETWORK     */+0000040
NOPROMPT,                          /*OPERATOR PROMPT OPTION          */+0000050
SUPP=NOSUP,                        /*MESSAGE SUPPRESSION OPTION      */+0000060
COLD,                              /*RESTART OPTION   - COLD/WARM    */+0000070
APBUF=(129,,116),                  /*ACE STORAGE POOL                */+0000080
CRPLBUF=(1024,,768),               /*RPL COPY POOL                   */+0000090
IOBUF=(50,4016,40,F),              /*FIXED IO (GP-5/2009)            */+0000100
LFBUF=(104,,104,F),                /*LARGE FIXED BUFFER POOL         */+0000110
LPBUF=(064,,64,F),                 /*LARGE PAGEBLE BUFFER POOL       */+0000120
NPBUF=(192,,176,F),                /*NON WS FMCB                     */+0000130
PPBUF=(90,4016,80,F),              /*PAGEBLE IO (GP-5/2009)          */+0000140
SFBUF=(163,,163,F),                /*SMALL FIXED BUFFER POOL         */+0000150
SPBUF=(064,,64,F),                 /*SMALL PGBL BUFFER POOL          */+0000160
UECBUF=(34,,30,F),                 /*USER EXIT CB                    */+0000170
WPBUF=(78,,78,F)                   /*MESSAGE CONTROL BUFFER POOL     */ 0000180
/*
//SYSUT2 DD DSN=SYS1.VTAMLST(ATCSTR00),DISP=SHR
//
