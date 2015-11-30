;
;       Author : John Creagh
;
;       File   : Example2.asm 
;       
;       This program is designed to illustrate simple 80x86
;       instructions (i.e. that access memory locations).
;

TITLE   Example2
                                      ;---------------------------
SSEG    SEGMENT PARA STACK 'STACK'    ;Stack segment
        DB      64 DUP('STACK   ')    ;
SSEG    ENDS                          ;---------------------------


                                      ;---------------------------
DSEG    SEGMENT PARA PUBLIC 'DATA'    ;Data segment
                                      ;
                                      ;5 memory locations are defined.
MEM1    DB      41H                   ;MEM1 is a byte initially 41H.
MEM2    DB      42H                   ;MEM2 ................... 42H.
MEM3    DB      43H                   ;MEM3 ................... 43H.
                                      ;
NUMBER  DW    1120H                   ;NUMBER is a word initially 1120H.
COUNT   DW       0H                   ;COUNT  ................... 0000H.
                                      ;
DSEG    ENDS                          ;---------------------------


                                      ;---------------------------
CSEG    SEGMENT PARA PUBLIC 'CODE'    ;Code Segment
        ASSUME CS:CSEG, DS:DSEG, SS:SSEG

MAIN    PROC    FAR

        PUSH    DS
        MOV     AX,0
        PUSH    AX
        MOV     AX,DSEG
        MOV     DS,AX


                                      ;The program begins here.
        MOV     AL,MEM1               ;AL <- MEM1     (i.e. AL <- 41H)
        MOV     AH,MEM2               ;AH <- MEM2     (i.e. AH <- 42H)
        ADD     AH,AL                 ;AH <- AH + AL  (i.e. AH <- 83H)
        ADD     MEM1,AL               ;MEM1 <- MEM1 + AL    
                                      ;               (i.e. MEM1 = 82H)
        MOV     MEM2,AL               ;MEM2 <- AL     (i.e. MEM2 = 41H)
        MOV     MEM3,AH               ;MEM3 <- AH     (i.e. MEM3 = 83H)

        INC     COUNT                 ;COUNT = COUNT + 1 
                                      ;               (i.e. COUNT = 1)
        INC     COUNT                 ;COUNT = COUNT + 1
                                      ;               (i.e. COUNT = 2)
        MOV     DX,NUMBER             ;DX = 1120H
        DEC     DX                    ;DX = DX - 1    (i.e. DX = 111FH)
        MOV     COUNT,DX              ;COUNT = 111FH
        RET

MAIN    ENDP

CSEG    ENDS                          ;---------------------------
        END     MAIN

