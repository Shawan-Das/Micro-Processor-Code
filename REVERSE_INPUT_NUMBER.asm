; INPUT A NUMBER AND REVERSE THE BITS

.MODEL SMALL
.DATA
    X DB '?'  ; VARIABLE
ENDS
    .STACK 100H
    .CODE
    
MAIN PROC
    MOV AX, @DATA
    MOV DS,AX
    
     MOV AH,1H ; INPUT
     INT 21H
        
     SUB AL,30H  ;CONVERT
     MOV X,AL    ;STORE DATA INTO X
     
     MOV AH,2H      ; NEW LINE
     MOV DL,0AH
     INT 21H
     
     MOV AL,X     
     
     XOR AL,0FFH  ; REVERSE ALL BIT
     AND AL,0FH   ; RESET UPPER BIT | UNCHANGE LOWER BIT
     
     ADD AL,30H   ; CONVERT
     
     
      
     
     MOV AH,2H    ; DISPPLAY
     LEA DL,AL
     INT 21H
       
       
       MAIN ENDP
END MAIN