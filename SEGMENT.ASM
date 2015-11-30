;
;       Author : John Creagh 
;       
;       This program is designed to 
;       illustrate the use of segments
;       in the 80x86 assembly language.
;

TITLE   SEGMENTS - Illustration of

SSEG    SEGMENT PARA STACK 'STACK'
        DB      64 DUP('STACK   ')
SSEG    ENDS


DSEG    SEGMENT PARA PUBLIC 'DATA'

D1      DB      41H
D2      DB      42H
D3      DB      43H

DSEG    ENDS


CSEG    SEGMENT PARA PUBLIC 'CODE'
        ASSUME CS:CSEG, DS:DSEG, SS:SSEG

MAIN    PROC    FAR

        PUSH    DS
        MOV     AX,0
        PUSH    AX
        MOV     AX,DSEG
        MOV     DS,AX

        MOV     AL,D1
        MOV     D2,AL
        MOV     AL,30H
        MOV     D3,AL
        RET

MAIN    ENDP

CSEG    ENDS
        END     MAIN

