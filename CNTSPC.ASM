;
;       Author : Dave Kavanagh
;
;       File   : CNTSPC.ASM

TITLE   COUNTSPACES

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
        CALL    COUNTSPACES
        MOV     RES1,DX

        MOV     BX,OFFSET STR2
        CALL    COUNTSPACES
        MOV     RES2,DX

        MOV     BX,OFFSET STR3
        CALL    COUNTSPACES
        MOV     RES3,DX

        RET                                ;The program ends here.

MAIN    ENDP

;--------------------------------------------------------------------------
;Name:                  COUNTSPACES
;
;Description:           Count spaces in a string
;
;Input Params:          BX = string
;
;Output Params:         DX = number of spaces
;
;Registers affected:    
;--------------------------------------------------------------------------

COUNTSPACES     PROC
        MOV     DX,0
        PUSH    AX
        PUSH    BX
AGAIN:
        MOV     AL,[BX]
        CMP     AL,00H
        JE      FINISH
        INC     BX

        CMP     AL,' '
        JE      SPC

SPC:    INC     DX
        JMP     AGAIN

NOTSPC: JMP    AGAIN

FINISH: POP     BX
        POP     AX

        RET

COUNTSPACES     ENDP

CSEG    ENDS
        END     MAIN
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       
