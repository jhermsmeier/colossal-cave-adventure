C***  DARK   .TRUE. IF THERE IS NO LIGHT HERE


       LOGICAL FUNCTION DARK(DUMMY)

C  TRUE IF LOCATION "LOC" IS DARK

       IMPLICIT INTEGER(A-Z)
      INTEGER*4 LOCCON,OBJCON
       COMMON /CONCOM/ LOCCON(250),OBJCON(150)
       COMMON /LOCCOM/ LOC,OLDLOC,OLDLC2,NEWLOC,MAXLOC
      INTEGER*4 POINTS
       COMMON /OBJCOM/ PLAC(150),FIXD(150),WEIGHT(150),PROP(150),
     1          POINTS(150)
      LOGICAL ATHAND
       DATA LAMP /2/

       DARK=MOD(LOCCON(LOC),2).EQ.0.AND.(PROP(LAMP).EQ.0.OR.
     1  .NOT.ATHAND(LAMP))
       RETURN
       END
