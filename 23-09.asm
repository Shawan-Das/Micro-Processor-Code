.MODEL SMALL
.DATA

X DB '?'
Y DB '?'
C DB '?'

STR1 DB "ENTER VALUE OF X: $"
STR2 DB "ENTER VALUE OF Y: $"
STR3 DB "ENTER VALUE OF C: $"

STR_MAX DB "THE MAXIMUM NUMBER IS: $"
STR_MIN DB "THE MINIMUM NUMBER IS: $"

.CODE

MAIN PROC
    
        MOV AX,@DATA
        MOV DS, AX
         
         
        MOV AH,9H
        LEA DX,STR1    ; DISPLAY STR1
        INT 21H
        
        MOV AH,1H      ; INPUT X
        INT 21H
        
        SUB AL,30H     ; CONVERT INTO NUMBER
        MOV X,AL
        
          
        
        MOV AH,2H      ; NEW LINE
        MOV DL,0AH
        INT 21H
        
        MOV DL,0DH     ; CARRTAGE RETURN
        INT 21H
          
        MOV AH,9H
        LEA DX,STR2    ; DISPLAY STR2
        INT 21H
        
        MOV AH,1H      ; INPUT Y
        INT 21H
        
        SUB AL,30H     ; CONVERT NUMBER
        MOV Y,AL
        
         
         
        MOV AH,2H      ; NEW LINE
        MOV DL,0AH
        INT 21H
        
        MOV DL,0DH     ; CARRTAGE RETURN
        INT 21H
          
          
        MOV AH,9H
        LEA DX,STR3    ; DISPLAY STR3
        INT 21H
        
        MOV AH,1H      ; INPUT Y
        INT 21H
        
        SUB AL,30H     ; CONVERT NUMBER
        MOV C,AL
        
        MOV BL,C
        
        
        MOV AH,2H      ; NEW LINE
        MOV DL,0AH
        INT 21H
        
        MOV DL,0DH     ; CARRTAGE RETURN
        INT 21H
        
        ;--------------INPUT DONE
        
        
        
        CMP BL,0H    ; if C==0 call- MIN()
        JE  MIN
        
        CMP BL,1H
        JE MAX       ; if C==1 call-MAX()
        JMP EXIT
        
        
        MAX:
            
            MOV AH,9H    ; DISPLAY
            LEA DX,STR_MAX
            INT 21H
            
            MOV CL,X
            CMP CL,Y
            
            JG PRINTX ; IF X>Y CALL- PRINT_MAX_X
            CMP CL,Y
            JL PRINTY ; IF Y>X CALL- PRINT_MAX_Y
            
            
            JMP EXIT
        
        MIN:
            
            MOV AH,9H    ; DISPLAY
            LEA DX,STR_MIN
            INT 21H
            
            MOV CL,X        
            CMP CL,Y
            
            JL PRINTX ; IF X<Y CALL- PRINT_MIN_X
            CMP CL,Y
            JG PRINTY ; IF Y<X CALL- PRINT_MIN_Y
            JMP EXIT
         
        
        PRINTX:

            MOV AH,2H
            ADD X,30H
            MOV DL,X
            
            INT 21H
            JMP EXIT
            
            
        PRINTY:
            
            MOV AH,2H
            ADD Y,30H
            MOV DL,Y
            
            INT 21H
            JMP EXIT
            
       EXIT:
       MOV AH,4CH
       INT 21H
       
       
    MAIN ENDP
END MAIN       
            
            