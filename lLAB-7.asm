; CLEAR - SET - RESET

.MODEL SMALL
.DATA
      A DB 12H
      B DB 24H
      C DB 33H
      
      EVEN DB "EVEN $"
      ODD  DB "ODD $"
      
ENDS
    .STACK 100H
    .CODE
    
MAIN PROC
      MOV AX, @DATA
      MOV DS,AX
      
      XOR AX,AX  ; CLEAR AX
      ;AND AX,00H ; CLEAR AX
      
      MOV AL,A
      AND AL,0FH    ; URRER 4-BIT RESET, LOWER 4-BIT UNCHANGE
      
      
      OR AL, 0F0H   ; UPPER 4-BIT SET, LOWER 4-BIT UNCHANGE
      
      XOR AL, 0FFH  ; REVERSE
      
      NOT AL        ; NOT OPERATION
    
    
    MAIN ENDP
END MAIN