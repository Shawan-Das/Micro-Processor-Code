;FIRST CODE
.MODEL SMALL
.DATA
     A DB 08H
     B DB 40H
     C DB 1FH
     ans DB ?
     
ENDS
  .STACK 100H
  .CODE
  
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX 
    
    MOV AL,A
    ADD AL,B
    MOV BL,B
    XCHG BL,C
    NEG C
   

    
    MAIN ENDP


END MAIN
