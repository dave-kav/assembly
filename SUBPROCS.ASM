;
;       Author : Dave Kavanagh
;
;       File   : SUBPROCS.ASM

TITLE   SUBPROCS

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
        CALL    COUNTUPPER
        MOV     RES1,DX

        MOV     BX,OFFSET STR2
        CALL    COUNTUPPER
        MOV     RES2,DX

        MOV     BX,OFFSET STR3
        CALL    COUNTUPPER
        MOV     RES3,DX

        RET                                ;The program ends here.

MAIN    ENDP

;--------------------------------------------------------------------------
;Name:                  COUNTUPPER
;
;Description:           Count uppercase letters in a string
;
;Input Params:          BX = string
;
;Output Params:         DX = number of uppercase letters
;
;Registers affected:    
;--------------------------------------------------------------------------

COUNTUPPER      PROC
        MOV     DX,0
        PUSH    AX
        PUSH    BX
AGAIN:
        MOV     AL,[BX]
        CMP     AL,00H
        JE      FINISH
        INC     BX

        CMP     AL,'A'
        JB      NOTUP
        CMP     AL,'Z'
        JA      NOTUP

UP:     INC     DX
        JMP     AGAIN

NOTUP:  JMP    AGAIN

FINISH: POP     BX
        POP     AX

        RET

COUNTUPPER      ENDP


CSEG    ENDS
        END     MAIN
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
