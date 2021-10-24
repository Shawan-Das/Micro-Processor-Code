;FIRST CODE
.MODEL SMALL
.DATA
     A DB 5H
     
ENDS
  .STACK 100H
  .CODE
  
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    MOV AL,A
    INC AL
    DEC AL
    DEC AL
    NEG AL
    
    MAIN ENDP


END MAIN