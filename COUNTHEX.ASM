;
;       Author : Dave Kavanagh
;
;       File   : COUNTHEX.asm

TITLE   Example1

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
        CALL    COUNTHEXCHARS
        MOV     RES1,DX

        MOV     BX,OFFSET STR2
        CALL    COUNTHEXCHARS
        MOV     RES2,DX

        MOV     BX,OFFSET STR3
        CALL    COUNTHEXCHARS
        MOV     RES3,DX

        RET                                ;The program ends here.

MAIN    ENDP

;--------------------------------------------------------------------------
;Name:                  COUNTHEXCHARS
;
;Description:           Count hex characters in a string
;
;Input Params:          BX = string
;
;Output Params:         DX = number of spaces
;
;REgisters affected:    
;--------------------------------------------------------------------------

COUNTHEXCHARS   PROC
        MOV     DX,0
        PUSH    AX
        PUSH    BX
AGAIN:
        MOV     AL,[BX]
        CMP     AL,00H
        JE      FINISH
        INC     BX

        CMP     AL,'0'
        JB      NOTHEX
        CMP     AL,'9'
        JBE     HEX
        CMP     AL,'A'
        JB      NOTHEX
        CMP     AL,'F'
        JBE     HEX
        CMP     AL,'a'
        JBE     NOTHEX
        CMP     AL,'f'
        JA      NOTHEX

HEX:    INC     DX
        JMP    AGAIN

NOTHEX: JMP    AGAIN

FINISH: POP     BX
        POP     AX

        RET

COUNTHEXCHARS   ENDP

CSEG    ENDS
        END     MAIN
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
