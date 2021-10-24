;FIRST CODE
; PAGE-118
.MODEL SMALL
.DATA
     STR1 DB "ENTER THE VALUE OF N : $"
     STR2 DB "SUM OF EVEN NUMBERS : $"
      
     N DB '?'
     SUM DB 0H    ;
     COUNTER DB 0H ; USED FOR LOOP TRACK
     TEMP DB 0H   ;  FIND EVEN NUMBERS
     
     
ENDS
  .STACK 100H
  .CODE
  
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV AH,9H
    LEA DX,STR1    ; DISPLAY STR1
    INT 21H
    
    MOV AH,1H      ; INPUT N
    INT 21H 
    
    SUB AL,30H     ; CONVERT   ; LOOP WILL RUN FOR N TIMES
    MOV N,AL
    
    MOV AH,2H      ; NEW LINE
    MOV DL,0AH
    INT 21H
    
    MOV AL,0DH     ; CRRIAGE RETURN
    INT 21H
     
    MOV BL,0H 
     
    MOV CX,0       ; INFINITE LOOP
    
    L: 
       MOV AL,COUNTER  ; BREAK LOOP IF COUNTER==N
       CMP AL,N
       JE OVER
       
       ADD SUM,BL
       
       ADD BL,2H     ; 0 + 2 + 4 + 6 + 8 +..
       
       INC COUNTER
       
          
    LOOP L
    
      OVER:
    
           MOV AH,9H
           LEA DX,STR2    ;DISPLAY STR3
           INT 21H
           
           ADD SUM,30H     ; CONVERT
           
           MOV AH,2H
           MOV DL,SUM      ; DISPLAY
           INT 21H
    
    MAIN ENDP


END MAIN 
