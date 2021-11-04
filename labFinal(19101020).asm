;WRITE A CODE TO INPUT CHARACTERS AND FIND OUT 
;WEATHER THEY ARE DIGIT OR ALPHABET OR SPECIAL SYMBOLS
.MODEL SMALL
.DATA
      X DB '?'
      DIGIT DB "DIGIT VALUE $"
      SYMBOLS DB "SPECIAL SYMBOLS $"
      ALPHABET DB "ALPHABET $"
      INPUT DB "ENTER A CHARACTER: $"
ENDS
    .STACK 100H
    .CODE
    
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
        MOV AH,9H 
        LEA DX,INPUT  ; DISPLAY INPUT MESSAGE
        INT 21H
    
        
        MOV AH,1H ; INPUT VALUE
        INT 21H 
        
        MOV X,AL
        
        MOV AH,2H      ; NEW LINE
        MOV DL,0AH
        INT 21H
    
       MOV AL,0DH     ; CRRIAGE RETURN
       INT 21H 
       
;-------COMPARE &CONDITION --------
       
        CMP X,30H     ; 30H-39H  --  0-9(DIGIT)     
        JGE CHECK39H  ; X>30H | CHECK FOR 39H
        JL SYMB       ; X<30H | IT IS SYMBOL
        JMP EXIT
         
         
         
     CHECK39H:
            CMP X,39H 
            JLE DIG   ; X<39H WHICH IS DIGIT
            JGE CHECK41H ; NOT DIGIT CHECK FOR ALPHA
            JMP EXIT
        
        
     CHECK41H:
            CMP X,41H
            JGE CHECK5AH ; A-Z 41H-5AH   
            JL  SYMB     ; IT IS SYMBOL
            JMP EXIT
            
     CHECK5AH:
            CMP X,5AH
            JLE ALPHA   ; IT IS AN ALPHABET
            JG CHECK61H ; a-z  61H-7A
            JMP EXIT
            
     CHECK61H:
            CMP X,61H
            JGE CHECK7AH  ; CHECK IF UNDER 7AH
            JL SYMB       ; IT IS SYMBOL
            JMP EXIT
            
     CHECK7AH:
            CMP X,7AH
            JLE ALPHA    ; IT IS ALPHABET
            JG SYMB      ; IT IS SYMBOL
            JMP EXIT
        
        
;----------PRINT PART-------------

DIG:
    MOV AH,9H
    LEA DX,DIGIT     ;  DIGIT MESSAGE
    INT 21H
    JMP EXIT 
       

ALPHA:
      MOV AH,9H
      LEA DX,ALPHABET     ; ALPHABET  MESSAGE
      INT 21H
      JMP EXIT
      

SYMB:
     MOV AH,9H
     LEA DX,SYMBOLS     ; SYMBOL MESSAGE MESSAGE
     INT 21H
     JMP EXIT
            
      EXIT:
        MOV AH,4CH        ; EXIT PART
        INT 21H  
    
    MAIN ENDP
END MAIN