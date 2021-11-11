;INOUT A NUMBER AND MULTIPLY BY 8 USING SHIFT OPERATION 

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
      
      MOV CL, 3H   ; WILL MULTIPLY BY 8 
      
      SHL A, CL    ; LEFT SHIFT BY 3(ADDING 000 IN LAST POSITION)
      
      ADD A,AL     ; ADD A AND SHIFTED A 
       
      MOV AH, 9H
      LEA DX, STR  ; DISPLAY STR
      INT 21H
      
      ADD A,30H   ; CONVERT
      
      MOV AH,2H    ; DISPLAY
      MOV DL,A
      INT 21H
    
    
    MAIN ENDP
END MAIN