;
;       Author : Dave Kavanagh
;
;       File   : COUNTWORDS.ASM

TITLE   COUNTWORDS

SSEG    SEGMENT PARA STACK 'STACK'         ;Stack segment
        DB      64 DUP('STACK   ')
SSEG    ENDS


DSEG    SEGMENT PARA PUBLIC 'DATA'         ;Data segment
STR1    DB      'This test has eight words in it. Number = 2486,831'
RES1    DW      ?
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
        CALL    COUNTWORDS
        MOV     RES1,DX

        RET                                ;The program ends here.

MAIN    ENDP

;--------------------------------------------------------------------------
;Name:                  COUNTWORDS
;
;Description:           Count words in a string
;
;Input Params:          BX = string
;
;Output Params:         DX = number of words
;
;Registers affected:    
;--------------------------------------------------------------------------

COUNTWORDS      PROC
        MOV     DX,0
        PUSH    AX
        PUSH    BX
AGAIN:
        MOV     AL,[BX]
        CMP     AL,00H
        JE      FINISH
        INC     BX

        CMP     AL,'A'
        JB      NOTLET
        CMP     AL,'Z'
        JBE     LET
        CMP     AL,'a'
        JB      NOTLET
        CMP     AL,'z'
        JA      NOTLET

LET:    JMP     AGAIN

NOTLET: JMP    AGAIN

FINISH: POP     BX
        POP     AX

        RET

COUNTLETTERS    ENDP


CSEG    ENDS
        END     MAIN
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
