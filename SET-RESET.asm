; INPUT A NUMBER AND SET LSB | CLEAR MSB

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
        
     MOV X,AL    ;STORE DATA INTO X
     
     MOV AH,2H      ; NEW LINE
     MOV DL,0AH
     INT 21H
     
     MOV AL,X     
      
     AND AL,01111111B   ; CLEAR MSB | UNCHANGE OTHER 7 BIT
     OR  AL,00000001B   ; LSB SET | MSB UNCHANGED

    
     MOV AH,2H    ; DISPPLAY
     LEA DL,AL
     INT 21H
       
       
       MAIN ENDP
END MAIN