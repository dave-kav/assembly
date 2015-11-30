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

        MOV     AL,20H                     ;AL = 20H  (i.e. 20hex)
        MOV     BL,30H                     ;BL = 30H
        ADD     BL,AL                      ;BL = BL + AL (i.e. BL=50H)

        MOV     AH,66H                     ;AH = 66H
        SUB     AH,AL                      ;AH = AH - AL (i.e. AH=46H)

        MOV     AX,124H                    ;AX = 0124H (i.e. AH = 01H,
                                           ;                 AL = 24H)
        MOV     BX,33ABH                   ;BX = 33ABH (i.e. BH = 33H,
                                           ;                 BL = 0ABH)
        SUB     BX,AX                      ;BX = BX - AX (i.e. BX=3287H)

        RET                                ;The program ends here.

MAIN    ENDP

CSEG    ENDS
        END     MAIN

