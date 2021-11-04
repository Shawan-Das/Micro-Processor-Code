.MODEL SMALL
.STACK 100H 
.DATA

X DB '?'
Y DB '?' 


STR1 DB "ENTER NUMBER : $"
STR2 DB "ENTER NUMBER : $" 
STR3 DB "MAXIMUM NUMBER : $"
 
.CODE
 
 
MAIN PROC
    MOV AX,@DATA   
    MOV DS,AX
    
    MOV AH,9H
    LEA DX,STR1   ;DISPLAY 
    INT 21H
    
    MOV AH,1H     ; INPUT
    INT 21H 
    
    
    SUB AL,30H   ;CONVERTION 
    MOV X,AL
    
    MOV AH,2H
    MOV DL,0AH    ; NEW LINE
    INT 21H
    MOV DL,0DH    ;CARRIAGE RETURN 
    INT 21H
         
         
         
    MOV AH,9H
    LEA DX,STR2   ; DISPLAY 
    INT 21H 
    
    
    MOV AH,1H     ;  INPUT
    INT 21H
    
    SUB AL, 30H   ; CONVERTION 
    MOV Y,AL
    
    MOV AH,2H
    MOV DL,0AH    ; NEW LINE
    INT 21H
    MOV DL,0DH    ;CARRIAGE RETURN
    INT 21H         
         
         
    MOV CL,X    ;USED FOR LOOP
                                
                                
    CMP CL,Y     ;COMPARE X & Y
    JG PRINTX    ;IF X>Y PRINT X
                 
    CMP CL,Y     ;IF X<Y PRINT Y
    JL PRINTY
      
      
    
     
 PRINTX:     
    MOV AH,2H     
    MOV DL,0AH    ; NEW LINE
    INT 21H
    MOV DL,0DH    ;CARRIAGE RETURN
    INT 21H
    
    MOV AH,9H                       ; PRINT X
    LEA DX,STR3    ; DISPLAY
    INT 21H
    
    MOV AH,2H
    ADD X, 30H
    MOV DL,X
    INT 21H
    
    
    JMP EXIT    ;JMP EXIT HERE FOR JG
     
     
     
 PRINTY:
    MOV AH,2H
    MOV DL,0AH    ; NEW LINE
    INT 21H
    MOV DL,0DH    ;CARRIAGE RETURN
    INT 21H
    
    MOV AH,9H
    LEA DX,STR3 ; DISPLAY STRING 3
    INT 21H                              ; PRINT Y
    
    MOV AH,2H    ; DISPLAY THE RESULT
    ADD Y,30H
    MOV DL,Y 
    INT 21H
    
    
    JMP EXIT  ;JMP EXIT
            
    
    
    EXIT:
         
    MOV AH, 4CH  ; RETURN 0
    INT 21H   
   MAIN ENDP
 END MAIN  