;FIRST CODE
.MODEL SMALL
.DATA
     A DB 7H
     B DB 9H
     C DB 8H
     D DB 2H
     
     
ENDS
  .STACK 100H
  .CODE
  
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    MOV AL,A
    ADD AL,B
    DEC AL
    DEC AL
    
    
    MAIN ENDP


END MAIN