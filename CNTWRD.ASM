;
;       Author : Dave Kavanagh
;
;       File   : COUNTWORDS.ASM

TITLE   COUNTWORDS

SSEG    SEGMENT PARA STACK 'STACK'         ;Stack segment
        DB      64 DUP('STACK   ')
SSEG    ENDS


DSEG    SEGMENT PARA PUBLIC 'DATA'         ;Data segment
STR1    DB      'This test has eight words in it. Number = 2486,831',00H
STR2    DB      'TEST STRING TWO',00H
RES1    DW      ?
RES2    DW      ?
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

        MOV     BX,OFFSET STR2
        CALL    COUNTWORDS
        MOV     RES2,DX

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
;Registers affected:    none
;--------------------------------------------------------------------------

COUNTWORDS      PROC
        PUSH    AX
        PUSH    BX
        XOR     DX,DX   ;clears DX
AGAIN:
        MOV     AL,[BX] ;FIRST PART - FIND FIRST LETTER
        CMP     AL,00H
        JE      FINISH
        INC     BX
        CMP     AL,'A'
        JB      AGAIN
        CMP     AL,'Z'
        JBE     FOUND
        CMP     AL,'a'
        JB      AGAIN
        CMP     AL,'z'
        JA      AGAIN

FOUND:
        INC     DX

SKIP:                           ;SKIP REMAINING LETTERS
        MOV     AL,[BX]
        CMP     AL,00H
        JE      FINISH
        INC     BX
        CMP     AL,'A'
        JB      AGAIN
        CMP     AL,'Z'
        JBE     SKIP
        CMP     AL,'a'
        JB      AGAIN
        CMP     AL,'z'
        JBE     SKIP
        JMP     AGAIN

FINISH:
        POP     BX
        POP     AX
        RET

COUNTWORDS      ENDP
       
CSEG    ENDS
        END     MAIN
