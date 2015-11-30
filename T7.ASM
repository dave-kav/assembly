;
;       Author : John Creagh 
;
;       File   : Example1.asm
;       
;       This program is designed to illustrate simple 80x86
;       instructions : (i.e. that access registers).
;
;       Note to student  :  The comments in the following program
;                           are designed to assist you understand
;                           the program.  However, you should avoid
;                           such simplifications when you write
;                           comments in your programs.  Therefore,
;                           when you write comments for programs :
;                            ---- the comments should explain the logic
;                                 of a block of instructions, rather
;                                 than explaining the instructions.

TITLE   Example1

SSEG    SEGMENT PARA STACK 'STACK'         ;Stack segment
        DB      64 DUP('STACK   ')
SSEG    ENDS


DSEG    SEGMENT PARA PUBLIC 'DATA'         ;Code segment
S1      DB      30H
S2      DB      31H
S3      DB      32H
S4      DB      33H
S5      DB      34H
S6      DB      35H
S7      DB      36H
S8      DB      37H
S9      DB      38H
S10     DB      39H
DATA1   DW      1234H
DATA2   DW      5678H
DATA3   DW      9ABCH
DATA4   DW     0DEF0H
DSEG    ENDS

.286

CSEG    SEGMENT PARA PUBLIC 'CODE'
        ASSUME CS:CSEG, DS:DSEG, SS:SSEG

MAIN    PROC    FAR

        PUSH    DS                         ;These 5 lines are
        MOV     AX,0                       ;required for all .ASM
        PUSH    AX                         ;programs.
        MOV     AX,DSEG                    ;
        MOV     DS,AX                      ;


                                           ;The program begins here.

        MOV     AX,DATA1
        SHR     AX,4
        MOV     BX,DATA2        ; BX=5678H
        SHR     BX,4            ; BX=0567H

        MOV     CX,DATA3        ; CX=9ABCH
        AND     CX,00FFH        ; CX=00BCH
        SHR     BX,4            ; BX=0056H

        MOV     DX,DATA4        ; DX=DEF0H
        AND     DX,0F0FH        ; DX=0E00H

        RET                                ;The program ends here.

MAIN    ENDP

CSEG    ENDS
        END     MAIN

