;FIRST CODE
; PAGE-118
.MODEL SMALL
.DATA
     STR1 DB "ENTER THE VALUE OF N : $"
     STR2 DB "ENTER NUMBER : $"
     STR3 DB "ANS IS : $" 
     N DB '?'
     value DB '?'
     TEMP DB 0H   ; USED FOR LOOP TRACK
     
     
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
     
     
    MOV CX,0       ; INFINITE LOOP
    
    L: 
       MOV AL,TEMP  ; BREAK LOOP IF TEMP==N
       CMP AL,N
       JE OVER
       
       
       INC TEMP 
    
       MOV AH,9H
       LEA DX,STR2   ;DISPLAY STR2
       INT 21H
       
       MOV AH,1H     ; INPUT VALUE
       INT 21H
       
       SUB AL,30H
       MOV value,AL  ; CONVERT NUMBER
       
       
       ADD BL,value 
       
       MOV AH,2H     ; NEW LINE
       MOV DL,0AH
       INT 21H
       
       MOV DL,0DH    ; CARRIAGE RETURN
       INT 21H 
       
    LOOP L
    
      OVER:
    
           MOV AH,9H
           LEA DX,STR3    ;DISPLAY STR3
           INT 21H
           
           ADD BL,30H     ; CONVERT
           
           MOV AH,2H
           MOV DL,BL      ; DISPLAY
           INT 21H
    
    MAIN ENDP


END MAIN 
