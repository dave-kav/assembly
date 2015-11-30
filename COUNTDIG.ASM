;
;       Author : Dave Kavanagh
;
;       File   : COUNTDIGITS.ASM

TITLE   COUNTDIGITS

SSEG    SEGMENT PARA STACK 'STACK'         ;Stack segment
        DB      64 DUP('STACK   ')
SSEG    ENDS


DSEG    SEGMENT PARA PUBLIC 'DATA'         ;Data segment
STR1    DB      '... 123 ABC123 RST', 00H
STR2    DB      '47AB THIS', 00H
STR3    DB      'Another string.', 00H
RES1    DW      ?
RES2    DW      ?
RES3    DW      ?
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
        CALL    COUNTDIGITS
        MOV     RES1,DX

        MOV     BX,OFFSET STR2
        CALL    COUNTDIGITS
        MOV     RES2,DX

        MOV     BX,OFFSET STR3
        CALL    COUNTDIGITS
        MOV     RES3,DX

        RET                                ;The program ends here.

MAIN    ENDP

;--------------------------------------------------------------------------
;Name:                  COUNTDIGITS
;
;Description:           Count digits in a string
;
;Input Params:          BX = string
;
;Output Params:         DX = number of digits
;
;Registers affected:    
;--------------------------------------------------------------------------

COUNTDIGITS     PROC
        MOV     DX,0
        PUSH    AX
        PUSH    BX
AGAIN:
        MOV     AL,[BX]
        CMP     AL,00H
        JE      FINISH
        INC     BX

        CMP     AL,'0'
        JB      NOTDIG
        CMP     AL,'9'
        JA      NOTDIG

DIG:    INC     DX
        JMP     AGAIN

NOTDIG: JMP    AGAIN

FINISH: POP     BX
        POP     AX

        RET

COUNTDIGITS     ENDP

CSEG    ENDS
        END     MAIN
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
