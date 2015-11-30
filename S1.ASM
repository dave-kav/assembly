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
STR1    DB      'Hello', 00H
LEN1    DB      ?
STR2    DB      'TEST STRING', 00H
LEN2    DB      ?
STR3    DB      'Another string.', 00H
LEN3    DB      ?
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
        MOV     BX,OFFSET STR1
        MOV     DL,0
AGAIN:
        MOV     AL,[BX]
        CMP     AL,00H
        JE      FINISH
        INC     BX
        INC     DL
        JMP     AGAIN  
FINISH:
        MOV     LEN1,DL

        MOV     BX,OFFSET STR2
        MOV     DL,0
AGAIN1:
        MOV     AL,[BX]
        CMP     AL,00H
        JE      FINISH1
        INC     BX
        INC     DL
        JMP     AGAIN1  
FINISH1:
        MOV     LEN2,DL

        RET                                ;The program ends here.

MAIN    ENDP

CSEG    ENDS
        END     MAIN
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
