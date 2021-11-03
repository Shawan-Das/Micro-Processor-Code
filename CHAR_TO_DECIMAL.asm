; INPUT A CHARACTER IF IT IS ASCII
; DIGIT MAKE IT DECIMAL

.MODEL SMALL
.DATA
    X DB '?'
    STR DB "NOT ASCII OF DIGIT $"
ENDS
    .STACK 100H
    .CODE 
    
MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
     MOV AH,1H ; INPUT
     INT 21H
     
     ;SUB AL,30H
     MOV X,AL   ; CONVERT
     
     MOV AH,2H
     MOV DL,0AH ; NEW LINE
     INT 21H 
     
      CMP X,30H   
      JGE CHECKL   ; CHECK IF >1
      JL INVALID   ; NUMBER IS NOT DIGIT
      JMP EXIT
      
      CHECKL:
           CMP X,39H
           JLE OUTPUT   ; NUMBER IS DIGIT | SHOW OUTPUT
           JG INVALID   ; NUMBER IS NOT A DIGIT
           JMP EXIT
           
      
      OUTPUT:
           
           ;ADD X,30H
           
           MOV AH,2H     ; OUTPUT X
           MOV DL,X
           INT 21H 
           JMP EXIT
      
      INVALID:
            MOV AH,9H
            LEA DX,STR     ; NOT A DIGIT MESSAGE
            INT 21H
            JMP EXIT
    
    
    EXIT:
        MOV AH,4CH        ; EXIT PART
        INT 21H
    
    MAIN ENDP
END MAIN