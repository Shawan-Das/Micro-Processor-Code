;FIRST CODE
.MODEL SMALL
.DATA
     A DB "SHAWAN DAS 19101020 $"
     B DB "HOW ARE YOU? $"

     
     
ENDS
  .STACK 100H
  .CODE
  
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
     
     
    MOV AH,9H ;STR DISPLAY
    LEA DX,A
    INT 21H
      
      
    MOV AH,2H     ; new line
        
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H         ;------
      
      
    
    MOV AH,9H        ; str display
    LEA DX,B
    INT 21H
    
    
    MOV AH,2H         ; new line
        
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
         
         
    MOV AH,1H   ;;INPUT
    INT 21H 
    
         MOV BL,AL
     
    MOV AH,2H            ; new line
        
    MOV DL,0AH
    INT 21H
    MOV DL,0DH
    INT 21H
     
      
      
    MOV AH,2H  ; DISPLAY CHAR
    MOV DL, 0D
    INT 21H
    MOV DL,BL
    INT 21H
     
    
    
    MAIN ENDP


END MAIN