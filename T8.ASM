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


DSEG    SEGMENT PARA PUBLIC 'DATA'         ;Data segment
NUMBER  DB      41H
DATA1   DB      ?
DATA2   DB      ?
DSEG    ENDS


CSEG    SEGMENT PARA PUBLIC 'CODE'
        ASSUME CS:CSEG, DS:DSEG, SS:SSEG

MAIN    PROC    FAR

        PUSH    DS                         ;These 5 lines are
        MOV     AX,0                       ;required for all .ASM
        PUSH    AX                         ;programs.
        MOV     AX,DSEG                    ;
        MOV     DS,AX                      ;


                                           ;The program begins here.
                
        MOV     AL,NUMBER
        SHR     AL,3
        ADD     AL,30
        MOV     DATA1,AL

        MOV     AL,NUMBER
        SHR     AL,7
        ADD     AL,30
        MOV     DATA2,AL

        RET                                ;The program ends here.

MAIN    ENDP

CSEG    ENDS
        END     MAIN

