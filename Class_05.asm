; compare to characters

.MODEL SMALL
.DATA
   X DB 'B'
   Y DB 'C'
   
   STR1 DB "X IS HIGHER ASCII VALUE..$"
   STR2 DB "Y IS HIGHER ASCII VALUE..$ "

ENDS
    .STACK 100H
    .CODE
    

MAIN PROC
        MOV AX,@DATA
        MOV DS,AX
        
          ;IF(X>Y)
          
          MOV BL,X
          CMP BL,Y      ;BL>Y
          
            JG L
            JL K
               
               
            L:
            
              MOV AH, 9H   ; TO DISPLAY
              LEA DX, STR1
              INT 21H
              
              JMP EXIT
              
              K:
              MOV AH, 9H   ; TO DISPLAY
              LEA DX, STR2
              INT 21H
              
        EXIT:
        MOV AH,4CH
        INT 21H
              
              
    
    MAIN ENDP

END MAIN

