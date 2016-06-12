C***   VOCABX


       INTEGER FUNCTION VOCABX(ID,INIT)

C  LOOK UP ID IN THE VOCABULARY (ATAB) AND RETURN ITS "DEFINITION" (KTAB), OR
C  -1 IF NOT FOUND.  IF INIT IS POSITIVE, THIS IS AN INITIALISATION CALL SETTING
C  UP A KEYWORD VARIABLE, AND NOT FINDING IT CONSTITUTES A BUG.  IT ALSO MEANS
C  THAT ONLY KTAB VALUES WHICH TAKEN OVER 1000 EQUAL INIT MAY BE CONSIDERED.
C  (THUS "STEPS", WHICH IS A MOTION VERB AS WELL AS AN OBJECT, MAY BE LOCATED
C  AS AN OBJECT.)  AND IT ALSO MEANS THE KTAB VALUE IS TAKEN MOD 1000.

       IMPLICIT INTEGER(A-Z)
      REAL*8 ATAB,ID
       COMMON /VOCCOM/ KTAB(600),ATAB(600),TABSIZ

C       HASH=ID.XOR.'PHROG'             (DONE BY CALLER)
       WDCLAS=INIT
       IF(INIT.LT.0)WDCLAS=-INIT-1
       DO 1 I=1,TABSIZ
       IF(KTAB(I).EQ.-1)GOTO 2
       IF(ATAB(I).NE.ID)GOTO 1
       IF(CLASS(KTAB(I)).GE.WDCLAS)GOTO 3
1       CONTINUE
       CALL BUG(21)

2       VOCABX=-1
       IF(INIT.LT.0)RETURN
       PRINT 4,ID
4       FORMAT (' VOCAB ERROR: CAN''T FIND WORD ''',A5,''' IN TABLE.')
       CALL BUG(5)

3       VOCABX=KTAB(I)
       IF(INIT.GE.0)VOCABX=MOD(VOCABX,1000)
       RETURN
       END