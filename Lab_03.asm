;FIRST CODE
.MODEL SMALL
.DATA
     A DB 128D

     
     
ENDS
  .STACK 100H
  .CODE
  
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    MOV AL, A
    MOV CX, 7D
    
    L:
    ADD AX,2
    LOOP L 
    
    
    
    MAIN ENDP


END MAIN