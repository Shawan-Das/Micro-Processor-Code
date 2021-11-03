; EVEN ODD CHECK

.MODEL SMALL
.DATA
    X DB '?'  ; VARIABLE
    ODDS DB "ODD NUMBER $"
    EVENS DB "EVEN NUMBER $"
    
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
      
     AND AL,00000001B   ; CLEAR MSB | UNCHANGE OTHER 7 BIT
     
     CMP AL,0
     JE EVEN
     JG ODD
     JMP EXIT
     
     
      ODD:
        MOV AH,9H
        LEA DX,ODDS
        INT 21H
        JMP EXIT
        
       EVEN:
        MOV AH, 9H
        LEA DX, EVENS
        INT 21H
        JMP EXIT
    
     MOV AH,2H    ; DISPPLAY
     LEA DL,AL
     INT 21H
        
        
        EXIT:
        MOV AH,4CH        ; EXIT PART
        INT 21H
       
       MAIN ENDP
END MAIN