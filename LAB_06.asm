.MODEL SMALL
.DATA

X DB '?'
Y DB '?'
Z DB '?'

STR1 DB "ENTER VALUE OF X: $"
STR2 DB "ENTER VALUE OF Y: $"
STR3 DB "ENTER VALUE OF Z: $"

STR_ADD DB "X + Y =  $"
STR_SUB DB "X - Y =  $"

.CODE

MAIN PROC
    
        MOV AX,@DATA
        MOV DS, AX
         
         
        MOV AH,9H
        LEA DX,STR1    ; DISPLAY STR1
        INT 21H
        
        MOV AH,1H      ; INPUT X
        INT 21H
        
        SUB AL,30H     ; CONVERT NUMBER
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
        
        MOV AH,1H      ; INPUT Z
        INT 21H
        
        SUB AL,30H     ; CONVERT NUMBER
        MOV Z,AL
        
        
        
        MOV AH,2H      ; NEW LINE
        MOV DL,0AH
        INT 21H
        
        MOV DL,0DH     ; CARRTAGE RETURN
        INT 21H
        
        
        ;--------------INPUT DONE
        
        
        
        CMP Z,0H    ; if C==0 call- ADD()
        JE  SUM
        
        CMP Z,1H
        JE DIFF       ; if C==1 call- SUB()
        JMP EXIT
        
        
        SUM:
            
            MOV AH,9H    ; DISPLAY
            LEA DX,STR_ADD
            INT 21H
            
            MOV BL,X
            ADD BL,Y
            
            ADD BL,30H
            
            
            MOV AH,2H
            MOV DL,BL
            
            INT 21H
            JMP EXIT

        
        DIFF:
            
            MOV AH,9H    ; DISPLAY
            LEA DX,STR_SUB
            INT 21H
            
            MOV BL,X
            SUB BL,Y
            
            ADD BL,30H
            
            
            MOV AH,2H
            MOV DL,BL
            
            INT 21H
            JMP EXIT
         
       
            
       EXIT:
           MOV AH,4CH
           INT 21H
       
       
    MAIN ENDP
END MAIN       
            
            