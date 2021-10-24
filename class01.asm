
 ; FIRST CODE
.MODEL SMALL

.DATA
    A DB 5H
    B DB 4H
    
    DIFF DB '?'

ENDS

.STACK 100H

.CODE

           
           
MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AL,A
    SUB AL,B
    MOV DIFF,AL
       
    MAIN ENDP



END MAIN