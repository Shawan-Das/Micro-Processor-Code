.MODEL SMALL 



.DATA
A DW 0002H
B DW 0007H
STR1 DB "THE FIRST NUMBER IS GREATER NUMBER $"
STR2 DB "THE FIRST NUMBER IS LOWER   NUMBER $"


ENDS
.STACK 100H
.CODE 

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    MOV BX,A
    
    CMP BX,B    ; BX-B, BX REMAINS UNCHANGED,  ONLY FLAG SET
    
    
    JG  L       ; BX>B
    JL  X       
    
        L:
        
        
        MOV AH, 9H   ; TO DISPLAY
        LEA DX, STR1
        INT 21H
    
        JMP EXIT
        
           
         X:
           MOV AH, 9H   ; TO DISPLAY
           LEA DX, STR2
           INT 21H
           
        
        EXIT:
        MOV AH,4CH
        INT 21H
        
    
    
    MAIN ENDP

END MAIN