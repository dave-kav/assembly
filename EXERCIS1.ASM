;
;       Author : John Creagh 
;
;       File   : Exercis1.asm
;       
;       Draw the memory area.
;            (1)  Show the value of memory area before the program
;                 executes.
;            (2)  Show the value of memory after the program executes.
;            (3)  Record how the registers change during the execution
;                 of the instructions.
;

TITLE   Exercis1
                                      
SSEG    SEGMENT PARA STACK 'STACK'    ;Stack segment
        DB      64 DUP('STACK   ')    
SSEG    ENDS                          


DSEG    SEGMENT PARA PUBLIC 'DATA'    ;Data segment

MEM1    DB      20H                   
MEM2    DB      22H                   
SUM     DW       0H
MEM3    DB      24H                   
CHAR    DB      50H
NUMBER  DW    1120H                   
C1      DB      20H
COUNT   DW   0ABCDH                   
MEM4    DB     0AAH                   
                                      
DSEG    ENDS                          


CSEG    SEGMENT PARA PUBLIC 'CODE'    ;Code Segment
        ASSUME CS:CSEG, DS:DSEG, SS:SSEG

MAIN    PROC    FAR

        PUSH    DS
        MOV     AX,0
        PUSH    AX
        MOV     AX,DSEG
        MOV     DS,AX


        INC     COUNT
        INC     C1
        DEC     NUMBER
        MOV     AH,MEM2
        ADD     C1,AH
        MOV     MEM3,AH
        MOV     AL,MEM4
        MOV     C1,AL
        MOV     AL,CHAR
        MOV     MEM1,AL
        MOV     DX,COUNT
        MOV     NUMBER,DX
        MOV     C1,DL
        MOV     CHAR,DH
        RET

MAIN    ENDP

CSEG    ENDS                          ;---------------------------
        END     MAIN





;------------------------------------------------------------------
;       S O L U T I O N
;       ---------------
;
; Memory Before execution :
;          20 22 00 00 24 50 20 11 20 CD AB AA
;
; Memory After execution :
;          50 22 00 00 22 AB CE AB CE CE AB AA
;------------------------------------------------------------------


