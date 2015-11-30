;
;       Author :        John Creagh 
;
;       This program illustrates how data
;       is stored in little endian
;       representation with the 80x86.
;

TITLE   DATASTOR.ASM - Storing of data


SSEG    SEGMENT PARA STACK 'STACK'
        DB      64 DUP('STACK   ')
SSEG    ENDS


DSEG    SEGMENT PARA PUBLIC 'DATA'

DATA1   DB      ?
DATA2   DW      ?
DATA3   DW      ?
DATA4   DW      ?

DSEG    ENDS


CSEG    SEGMENT PARA PUBLIC 'CODE'

        ASSUME CS:CSEG, DS:DSEG, SS:SSEG

MAIN    PROC    FAR

        PUSH    DS
        MOV     AX,0
        PUSH    AX
        MOV     AX,DSEG
        MOV     DS,AX

        MOV     AL,40
        MOV     DATA1,AL

        MOV     AX,40
        MOV     DATA2,AX
        MOV     AX,1111110001B
        MOV     DATA3,AX
        MOV     AX,29F4H
        MOV     DATA4,AX
        RET

MAIN    ENDP

CSEG    ENDS
        END     MAIN
