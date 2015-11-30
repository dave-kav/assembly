;
;       Author :        Dave Kavanagh
;                       R00013469                
;
;       File   :        PROJECT.ASM
;
;                       DCOM3 - Semester 1
;                       Computer Systems Project

TITLE   PROJECT

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
                                           ;The main program begins here.
        ;initialise graphics mode
        MOV     AL,18
        MOV     AH,00H
        INT     10H

        ;set pixels and colour for grass
        MOV     DX,480
        MOV     CX,0
        MOV     AL,2
        MOV     SI,640
        MOV     DI,20
        CALL    COLORBOX
        SUB     CX,640
        
        MOV     AL,0
        CALL    DRAWBOX

        ;set pixels and colour for road       
        SUB     DX,DI
        MOV     CX,0
        MOV     AL,8
        MOV     SI,640
        MOV     DI,100
        CALL    COLORBOX

        ;set pixels and colour for markings
        ;parking lines - near side
        SUB     DX,2
        MOV     CX,0
        MOV     AL,14
        MOV     SI,640
        MOV     DI,1
        CALL    COLORBOX
        SUB     DX,2
        MOV     CX,0
        MOV     AL,14
        MOV     SI,640
        MOV     DI,1
        CALL    COLORBOX

        ;middle line
        SUB     DX,46
        MOV     CX,0
        MOV     AL,15
        MOV     SI,10
        MOV     DI,2
        CALL    DRAWSTRIPE

        ;parking lines - far side
        SUB     DX,44
        MOV     CX,0
        MOV     AL,14
        MOV     SI,640
        MOV     DI,1
        CALL    COLORBOX
        SUB     DX,2
        MOV     CX,0
        MOV     AL,14
        MOV     SI,640
        MOV     DI,1
        CALL    COLORBOX

        ;set pixels and colour for sky
        SUB     DX,4
        MOV     CX,0
        MOV     AL,9
        MOV     SI,640
        MOV     DI,480
        CALL    COLORBOX     

        ;draw building 1
        MOV     CX,10
        MOV     AL,7
        MOV     SI,80
        MOV     DI,220
        CALL    COLORBOX
        SUB     DX,220
        MOV     AL,0
        CALL    DRAWBOX
        ;draw roof
        MOV     AL,0
        CALL    TRIANGLE
        ;roof outline
        SUB     SI,4
        SUB     DX,1
        ADD     CX,2
        MOV     AL,7
        CALL    TRIANGLE
        ;draw windows
        MOV     DI,10
        MOV     BL,7
        MOV     BH,14
        ADD     CX,5
        ADD     DX,20
        MOV     AL,15
        MOV     SI,8
        CALL    WINDOW
        ;draw door
        ADD     CX,19
        ADD     DX,200
        CALL    DOOR
        
        ;draw building 2
        ADD     CX,50
        ADD     CX,SI
        ADD     DX,1
        MOV     AL,7
        MOV     SI,80
        MOV     DI,250
        CALL    COLORBOX
        SUB     DX, 250
        MOV     AL,0
        CALL    DRAWBOX
        ;draw roof
        MOV     AL,0
        CALL    TRIANGLE
        ;roof outline
        SUB     SI,4
        SUB     DX,1
        ADD     CX,2
        MOV     AL,7
        CALL    TRIANGLE
        ;draw windows
        MOV     DI,10
        MOV     BL,7
        MOV     BH,16
        ADD     CX,5
        ADD     DX,20
        MOV     AL,15
        MOV     SI,8
        CALL    WINDOW
        ;draw door
        ADD     CX,19
        ADD     DX,230
        CALL    DOOR
        
        ;draw building 3
        ADD     CX,48
        ADD     CX,SI
        ADD     DX,1
        MOV     AL,7
        MOV     SI,80
        MOV     DI,280
        CALL    COLORBOX
        SUB     DX,280
        MOV     AL,0
        ;draw spine on roof
        CALL    DRAWBOX
        ADD     CX,40
        MOV     AL,7
        MOV     SI,3
        MOV     DI,60
        CALL    COLORBOX
        SUB     DX,60
        MOV     AL,0
        CALL    DRAWBOX
        ;draw windows
        MOV     DI,10
        MOV     BL,7
        MOV     BH,18
        SUB     CX,33
        ADD     DX,80
        MOV     AL,15
        MOV     SI,8
        CALL    WINDOW
        ;draw door
        ADD     CX,19
        ADD     DX,260
        CALL    DOOR
                
        ;draw building 4
        ADD     CX,SI
        ADD     CX,50
        MOV     AL,7
        MOV     SI,80
        MOV     DI,250
        CALL    COLORBOX
        SUB     DX,250
        MOV     AL,0
        CALL    DRAWBOX
        ;draw roof
        MOV     AL,0
        CALL    TRIANGLE
        ;roof outline
        SUB     SI,4
        SUB     DX,1
        ADD     CX,2
        MOV     AL,7
        CALL    TRIANGLE
        ;draw windows
        MOV     DI,10
        MOV     BL,7
        MOV     BH,16
        ADD     CX,5
        ADD     DX,20
        MOV     AL,15
        MOV     SI,8
        CALL    WINDOW
        ;draw door
        ADD     CX,19
        ADD     DX,230
        CALL    DOOR
        
        ;draw building 5
        ADD     CX,SI
        ADD     CX,46
        ADD     DX,1
        MOV     AL,7
        MOV     SI,80
        MOV     DI,190
        CALL    COLORBOX
        SUB     DX,190
        MOV     AL,0
        CALL    DRAWBOX
        ;draw roof
        MOV     AL,0
        INC     CX
        CALL    SKEWTRI
        ;roof outline
        SUB     SI,4
        SUB     DX,1
        ADD     CX,1
        MOV     AL,7
        CALL    SKEWTRI
        ;draw windows
        MOV     DI,10
        MOV     BL,7
        MOV     BH,12
        ADD     CX,5
        ADD     DX,20
        MOV     AL,15
        MOV     SI,8
        CALL    WINDOW
        ;draw door
        ADD     CX,19
        ADD     DX,170
        CALL    DOOR
        
        ;draw building 6
        ADD     CX,50
        ADD     CX,SI
        ADD     DX,1
        MOV     AL,7
        MOV     SI,154
        MOV     DI,160
        CALL    COLORBOX
        SUB     DX,160
        MOV     AL,0
        CALL    DRAWBOX
        ;draw roof
        MOV     AL,0
        CALL    TRIANGLE
        ;roof outline
        SUB     SI,4
        SUB     DX,1
        ADD     CX,2
        MOV     AL,7
        CALL    TRIANGLE
        ;draw windows
        MOV     DI,10
        MOV     BL,7
        MOV     BH,10
        ADD     CX,5
        ADD     DX,20
        MOV     AL,15
        MOV     SI,8
        CALL    WINDOW
        ADD     CX,74
        MOV     DI,10
        MOV     BL,7
        MOV     BH,10
        MOV     AL,15
        MOV     SI,8
        CALL    WINDOW
        ;draw door 1
        SUB     CX,55
        ADD     DX,140
        CALL    DOOR
        ;draw door 2
        MOV     AL,15
        ADD     CX,74
        CALL    DOOR
  
        ;draw trees
        ADD     CX,SI
        ADD     CX,67
        ADD     DX,1
        CALL    TREE
        MOV     DX,470
        MOV     CX,10
        MOV     BX,50
        CALL    WOODS

	CALL	MOUSE
		
        ;revert to text input        
        MOV     AL,2
        MOV     AH,00H
        INT     10H

        RET                             
MAIN    ENDP

;====================================================================
;Name:                  WritePixel
;
;Description:           Write a pixel to the screen
;
;Input params:          None
;
;Output params:         None
;
;Registers affected:    None
;====================================================================
WRITEPIXEL      PROC
        PUSH    AX
        PUSH    BX

        MOV     AH,0CH
        MOV     BH,0
        INT     10H

        POP     BX
        POP     AX

                RET
WRITEPIXEL      ENDP

;====================================================================
;Name:                  DrawHzLine
;
;Description:           Draw a horizontal line on the screen
;
;Input params:          SI: Length
;
;Output params:         None
;
;Registers affected:    None
;====================================================================
DRAWHZLINE      PROC
        PUSH    CX
        PUSH    SI

AGAINH: CMP     SI,0
        JBE     FINISHH
        CALL    WRITEPIXEL
        INC     CX
        DEC     SI
        JMP     AGAINH

FINISHH:POP     SI
        POP     CX
                RET
DRAWHZLINE      ENDP

;====================================================================
;Name:                  DrawVtLine
;
;Description:           Draw a vertical line on the screen
;
;Input params:          DI: Height
;
;Output params:         None
;
;Registers affected:    None
;====================================================================
DRAWVTLINE      PROC
        PUSH    DX
        PUSH    DI

AGAINV: CMP     DI,0
        JE      FINISHV
        CALL    WRITEPIXEL
        INC     DX
        DEC     DI
        JMP     AGAINV

FINISHV:POP     DI
        POP     DX
                RET
DRAWVTLINE      ENDP

;====================================================================
;Name:                  DrawBox 
;
;Description:           Draw a box on the screen
;
;Input params:          DI: Height
;                       SI: Length      
;
;Output params:         None
;
;Registers affected:    None
;====================================================================
DRAWBOX         PROC
        PUSH    CX
        PUSH    DX
        PUSH    DI
        PUSH    SI

        CALL    DRAWHZLINE
        CALL    DRAWVTLINE
        ADD     DX,DI
        CALL    DRAWHZLINE
        ADD     CX,SI
        SUB     DX,DI
        ADD     DX,1
        CALL    DRAWVTLINE
        
        POP     SI
        POP     DI
        POP     DX
        POP     CX
                RET
DRAWBOX         ENDP

;====================================================================
;Name:                  ColorBox 
;
;Description:           Draw a colored box on the screen
;
;Input params:          DI: Height
;                       SI: Length      
;
;Output params:         None
;
;Registers affected:    None
;====================================================================
COLORBOX        PROC
        PUSH    DX
        PUSH    DI

AGAINCB:CMP     DI, 0
        JE      FINISHCB
        CALL    DRAWHZLINE
        DEC     DI
        DEC     DX
        JMP     AGAINCB        

FINISHCB:       
        POP     DI
        POP     DX
                RET
COLORBOX        ENDP

;====================================================================
;Name:                  DrawStripe 
;
;Description:           Draw a striped line on the screen
;
;Input params:          DI: Height
;                       SI: Length      
;
;Output params:         None
;
;Registers affected:    None
;====================================================================
DRAWSTRIPE      PROC
        PUSH    CX
        PUSH    SI

AGAIN:  CALL    DRAWHZLINE
        INC     CX
        DEC     SI
        CMP     CX,640
        JE      FINISH
        CMP     SI,0
        JE      BLANK
        JMP     AGAIN

BLANK:  CMP     SI,20
        JE      AGAIN
        INC     SI
        INC     CX
        JMP     BLANK

FINISH: POP     SI
        POP     CX
                RET
DRAWSTRIPE      ENDP
                          
;====================================================================
;Name:                  Triangle
;
;Description:           Draw a triangle on the screen
;
;Input params:          DI: Height
;                       SI: Length      
;
;Output params:         None
;
;Registers affected:    None
;====================================================================
TRIANGLE        PROC
        PUSH    CX
        PUSH    SI
        PUSH    DI
        PUSH    AX
        PUSH    DX

AGAINT: CALL    DRAWHZLINE
        CMP     SI,0
        JBE     FINISHT
        INC     CX
        DEC     DX
        SUB     SI,2
        JMP     AGAINT
        
FINISHT:POP     DX
        POP     AX
        POP     DI
        POP     SI
        POP     CX
                RET
TRIANGLE        ENDP

;====================================================================
;Name:                  SkewTri
;
;Description:           Draw a triangle on the screen
;
;Input params:          DI: Height
;                       SI: Length      
;
;Output params:         None
;
;Registers affected:    None
;====================================================================
SKEWTRI          PROC
        PUSH    CX
        PUSH    SI
        PUSH    DI
        PUSH    AX
        PUSH    DX

        
AGAINS: DEC     CX
        CALL    DRAWHZLINE
        CMP     SI,0
        JBE     FINISHS
        INC     CX
        DEC     DX
        SUB     SI,2
        JMP     AGAINS
        
FINISHS:POP     DX
        POP     AX
        POP     DI
        POP     SI
        POP     CX
                RET
SKEWTRI         ENDP

;====================================================================
;Name:                  Window 
;
;Description:           Draw a buildings windows
;
;Input params:          DI: Height
;                       SI: Length      
;
;Output params:         None
;
;Registers affected:    None
;====================================================================
WINDOW          PROC
        PUSH    CX
        PUSH    DX
        PUSH    DI
        PUSH    SI
        PUSH    AX
        PUSH    BX
        
RIGHT:  CALL    COLORBOX
        ADD     CX,5
        DEC     BL
        CMP     BL,0
        JE      DOWN
        JMP     NOWIND
        JMP     RIGHT        

NOWIND: ADD     CX,5
        JMP     RIGHT
        
DOWN:   POP     BX
        DEC     BH
        PUSH    BX
        CMP     BH,0
        JE      FINISHW
        ADD     DX,15
        SUB     CX,65
        JMP     RIGHT
        
FINISHW:POP     BX
        POP     AX
        POP     SI      
        POP     DI
        POP     DX
        POP     CX
                RET
WINDOW          ENDP

;====================================================================
;Name:                  Door 
;
;Description:           Draw a buildings doors
;
;Input params:          DI: Height
;                       SI: Length      
;
;Output params:         None
;
;Registers affected:    None
;====================================================================
DOOR            PROC
        PUSH    SI
        PUSH    DI
        PUSH    DX
        PUSH    CX
        
        MOV     SI,30
        MOV     DI,16
        CALL    COLORBOX
        SUB     DX,16
        SHR     SI,1
        MOV     AL,0
        CALL    DRAWBOX
        ADD     CX,15
        CALL    DRAWBOX
        
        POP     CX
        POP     DX
        POP     DI
        POP     SI
                RET
DOOR            ENDP

;====================================================================
;Name:                  Tree 
;
;Description:           Draw a tree
;
;Input params:          DI: Height
;                       SI: Length      
;
;Output params:         None
;
;Registers affected:    None
;====================================================================
TREE            PROC
        PUSH    AX
        PUSH    SI
        PUSH    DI
        PUSH    DX
        PUSH    CX 
        ;trunk
        MOV     AL,6
        MOV     SI,3
        MOV     DI,18
        CALL    COLORBOX
        ;leaves
        SUB     DX,18
        SUB     CX,1
        MOV     AL,2
        MOV     SI,6
        MOV     DI,2
        CALL    COLORBOX
        SUB     DX,2
        SUB     CX,3
        MOV     SI,12
        MOV     DI,3
        CALL    COLORBOX
        SUB     DX,2
        SUB     CX,6
        MOV     SI,24
        MOV     DI,3
        CALL    COLORBOX
        SUB     DX,2
        MOV     SI,24
        MOV     DI,3
        CALL    COLORBOX
        SUB     DX,2
        MOV     SI,24
        MOV     DI,3
        CALL    COLORBOX
        SUB     DX,2
        ADD     CX,6     
        MOV     SI,12
        MOV     DI,3
        CALL    COLORBOX
        POP     CX
        POP     DX
        POP     DI
        POP     SI
        POP     AX 
                RET
TREE            ENDP

;====================================================================
;Name:                  Woods 
;
;Description:           Draw a group of tree
;
;Input params:          DI: Height
;                       SI: Length      
;
;Output params:         None
;
;Registers affected:    None
;====================================================================
WOODS               PROC
            PUSH    BX
        
AGAINWOOD:  CALL    TREE
            ADD     CX,30
            DEC     BX
            CMP     BX,0
            JE      FINWOOD
            JMP     AGAINWOOD    
            
FINWOOD:    POP     BX            
                    RET
WOODS               ENDP

;====================================================================
;Name:                  Bird 
;
;Description:           Draw a bird on the screen
;
;Input params:          
;
;Output params:         None
;
;Registers affected:    None
;====================================================================
BIRD            PROC
        PUSH    CX
        PUSH    DX
	PUSH	BX
	PUSH	AX
	MOV	BX,2

FLAPUP:	CMP	BX,0
	JE	FLAPDOWN
	CALL	WRITEPIXEL
	INC	CX
	CALL	WRITEPIXEL
	INC	DX
	INC	CX
	CALL	WRITEPIXEL
	INC	CX
	INC	DX
	CALL    WRITEPIXEL
	INC	CX
	DEC	DX
	CALL	WRITEPIXEL
	INC	CX
	DEC	DX
	CALL 	WRITEPIXEL
	INC	CX
	CALL 	WRITEPIXEL
	CALL	DELAY
	MOV	AL,9
	DEC	BX
	SUB	CX,6
	JMP	FLAPUP
				
FLAPDOWN:MOV	BX,2
	ADD	DX,3
	MOV	AL,0

FLAPDAGAIN:CMP	BX,0
	JE	FINFLAP
	CALL	WRITEPIXEL
	INC	CX
	CALL	WRITEPIXEL
	INC	CX
	DEC	DX
	CALL	WRITEPIXEL
	INC	CX
	DEC	DX
	CALL	WRITEPIXEL
	INC	CX
	INC	DX
	CALL	WRITEPIXEL
	INC	CX
	INC	DX
	CALL	WRITEPIXEL
	INC	CX
	CALL	WRITEPIXEL
	CALL	DELAY
	MOV	AL,9
	DEC	BX
	SUB	CX,6
	JMP	FLAPDAGAIN
				
FINFLAP:POP	AX
	POP	BX
	POP	DX
	POP	CX
                RET
BIRD            ENDP

;====================================================================
;Name:                  Animate 
;
;Description:           Animates a bird
;
;Input params:          
;
;Output params:         None
;
;Registers affected:    None
;====================================================================
ANIMATE PROC
        PUSH    SI
	PUSH	DI
	PUSH	DX
	PUSH	CX
	PUSH	AX
		
	MOV     AL,0
        MOV     DX,325
        MOV     CX,590
	MOV	DI,15
	MOV	SI,20
		
FLYUP:	CMP	SI,0
	JE	FLYOVER
	CALL	BIRD
	CALL	DELAY
	DEC	SI
	SUB	DX,3
	JMP	FLYUP
	CALL	DELAY

FLYOVER:CMP	DI,0
	JE	FINFLY
	CALL	BIRD
	CALL	DELAY
	DEC	DI
	ADD	CX,3
	JMP	FLYOVER
	CALL	DELAY
		
FINFLY: POP	AX
	POP	CX
	POP	DX
	POP	DI
	POP	SI
		RET
ANIMATE	ENDP

;====================================================================
;Name:                  Animate2 
;
;Description:           Change lights of building 1
;
;Input params:          
;
;Output params:         None
;
;Registers affected:    None
;====================================================================
ANIMATE2 PROC
        PUSH    BX
	PUSH	DI
	PUSH	DX
	PUSH	CX
	PUSH	AX
	PUSH	SI
	
	MOV     DI,10
        MOV     BL,7
        MOV     BH,14
        MOV     CX,17
        MOV     DX,159
        MOV     AL,14
        MOV     SI,8
        CALL    WINDOW
	MOV	AL,15
	ADD     CX,19
        ADD     DX,200
        CALL    DOOR
		
		
FINANI2:POP	SI
	POP	AX
	POP	CX
	POP	DX
	POP	DI
	POP	BX
		
		RET
ANIMATE2	ENDP

;====================================================================
;Name:                  Delay 
;
;Description:           Cause a delay for animation
;
;Input params:          CX:Time
;                       DX:Time      
;
;Output params:         None
;
;Registers affected:    None
;====================================================================
DELA	        PROC
	PUSH    CX
        PUSH    DX
        MOV     CX,100
        
OUTERLOOP:DEC	CX
        CMP     CX,0
	JE      FINDELAY
	MOV     DX,0FFFH
INNERLOOP:DEC   DX
       	CMP     DX,0
       	JE      OUTERLOOP
	JMP     INNERLOOP
               
FINDELAY:POP	DX
	POP     CX
	RET
DELAY	ENDP

;====================================================================
;Name:                  Mouse 
;
;Description:           Provide mouse functions
;
;Input params:          BX:Time
;                       DX:Time      
;
;Output params:         None
;
;Registers affected:    None
;====================================================================
MOUSE	PROC
	PUSH	AX
	PUSH	BX
	
	MOV	AX,01H
	INT	33H
	MOV	BX,0H

AGAINMS:MOV	AX,05H
	INT	33H
	CMP	BX,1
	JNE	AGAINMS
		
	CMP	DX,325
	JL	NOCLICK1
	CMP	DX,335
	JG	NOCLICK1
	
	CMP	CX,590
	JL	NOCLICK1
	CMP	CX,600
	JG	NOCLICK1
	
	CALL	ANIMATE
	JMP	AGAINMS
		
NOCLICK1:CMP	DX,339
	JL	NOCLICK2
	CMP	DX,395
	JG	NOCLICK2
		
	CMP	CX,36
	JL	NOCLICK2
	CMP	CX,96
	JG	NOCLICK2
		
	CALL	ANIMATE2
	JMP	AGAINMS

NOCLICK2:CMP	DX,339
	JL	NOCLICK3
	CMP	DX,355
	JG	NOCLICK3
	
	CMP	CX,36
	JL	NOCLICK3
	CMP	CX,66
	JG	NOCLICK3
	
NOCLICK3:CMP	DX,109
	JL	AGAINMS
	CMP	DX,139
	JG	AGAINMS
	
	CMP	CX,36
	JL	AGAINMS
	CMP	CX,66
	JG	AGAINMS
	
	JMP	FINISHMS
		
FINISHMS:POP	BX
	 POP	AX
     
	RET
MOUSE	ENDP

CSEG    ENDS
        END     MAIN
