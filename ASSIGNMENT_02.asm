.MODEL SMALL
.DATA

X DB '?'
Y DB '?'


STR1 DB "ENTER VALUE OF X: $"
STR2 DB "ENTER VALUE OF Y: $"
STR3 DB " INVALID INPUT $"


STR_f1 DB "X + 0 =  $"
STR_f2 DB "X + 2 =  $"
STR_f3 DB "X + 4 =  $"
STR_f4 DB "X + 6 =  $"


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
        
        
        MOV DL,0DH     ; CARRIAGE RETURN
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
        
        
        ;--------------INPUT DONE
        
        
        CMP Y,1H    ; if Y==1 --F1 
        JE  F1
        
        CMP Y,2H    ; if Y==2 --F2
        JE F2
        
        CMP Y,3H    ; if Y==3 --F3
        JE F3
        
        CMP Y,4H    ; if Y==4 --F4
        JE F4
        
        CMP Y,4H    ; if Y>4 --INVALID
        JG INVALID
        
        JMP EXIT
        
        F1:
            
            MOV AH,9H    ; DISPLAY X+0
            LEA DX,STR_f1
            INT 21H
            
            MOV BL,X     ; DO X+0
            ADD BL,0H
            
            ADD BL,30H   ; CONVERT
            
            
            MOV AH,2H    ; SHOW X+0
            MOV DL,BL
            
            INT 21H
            JMP EXIT

        
        F2:
            
            MOV AH,9H    ; DISPLAY X+2
            LEA DX,STR_f2
            INT 21H
            
            MOV BL,X     ; DO X+2
            ADD BL,2H
            
            ADD BL,30H   ; CONVERT
            
            
            MOV AH,2H    ; SHOW X+2
            MOV DL,BL
            
            INT 21H
            JMP EXIT
         
         
         F3:
            
            MOV AH,9H    ; DISPLAY X+4
            LEA DX,STR_f3
            INT 21H
            
            MOV BL,X     ; DO X+4
            ADD BL,4H
            
            ADD BL,30H   ; CONVERT
            
            
            MOV AH,2H    ; SHOW X+4
            MOV DL,BL
            
            INT 21H
            JMP EXIT
            
         F4:
            
            MOV AH,9H    ; DISPLAY X+6
            LEA DX,STR_f4
            INT 21H
            
            MOV BL,X     ; DO X+6
            ADD BL,6H
            
            ADD BL,30H   ; CONVERT
            
            
            MOV AH,2H    ; SHOW X+6
            MOV DL,BL
            
            INT 21H
            
            JMP EXIT
            
         
         INVALID:
         
                 MOV AH,2H      ; NEW LINE
                 MOV DL,0AH
                 INT 21H
        
                 MOV DL,0DH     ; CARRTAGE RETURN
                 INT 21H
                 
                 MOV AH,9H
                 LEA DX,STR3   ; DISPLAY INVALID IF X>3
                 INT 21H
                 
                 JMP EXIT  
            
       EXIT:
           MOV AH,4CH
           INT 21H
       
       
    MAIN ENDP
END MAIN       
            
            