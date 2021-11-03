;INOUT A NUMBER AND MULTIPLY BY 4 USING SHIFT OPERATION 

.MODEL SMALL
.DATA
      A DB '?'
      
      STR DB "ANS IS : $"
      
ENDS
    .STACK 100H
    .CODE
    
MAIN PROC
      MOV AX, @DATA
      MOV DS,AX
      
      MOV AH,1H  ; INPUT
      INT 21H
      
      SUB AL, 30H  ; CONVERT NUMBER
      MOV A,AL
      
      MOV AH,2H    ;  NEW LINE
      MOV DL,0AH
      INT 21H
      
      MOV CL, 2H   ; WILL MULTIPLY BY 4 
      
      SHL A, CL    ; LEFT SHIFT BY 2(ADDING 00 IN LAST POSITION)
      
      
      MOV AH, 9H
      LEA DX, STR  ; DISPLAY STR
      INT 21H
      
      ADD A,30H   ; CONVERT
      
      MOV AH,2H    ; DISPLAY
      MOV DL,A
      INT 21H
    
    
    MAIN ENDP
END MAIN