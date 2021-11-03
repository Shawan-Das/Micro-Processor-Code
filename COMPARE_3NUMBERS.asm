;TAKE 3 ROLL AS INPUT 0<X,Y,Z<=9 AND SORT THEM

.MODEL SMALL
.DATA  
    X DB '?'
    Y DB '?'
    Z DB '?'
    STR DB " $"
ENDS
   .STACK 100H
   .CODE

MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
;------------INPUT----------
    
    MOV AH,1H       ; INPUT
    INT 21H
                    ; CONVERT
    SUB AL,30H
    MOV X,AL        ; MOVE TO X
    
    MOV AH,2H
    MOV DL,0AH      ; NEW LINE
    INT 21H
    
    MOV DL,0DH      ; CARRIAGE RETURN
    INT 21H
    
    
    
    MOV AH,1H       ; INPUT
    INT 21H
                    ; CONVERT
    SUB AL,30H
    MOV Y,AL        ; MOVE TO Y
    
    MOV AH,2H
    MOV DL,0AH      ; NEW LINE
    INT 21H
    
    MOV DL,0DH      ; CARRIAGE RETURN
    INT 21H
    
    
    MOV AH,1H       ; INPUT
    INT 21H
                    ; CONVERT
    SUB AL,30H
    MOV Z,AL        ; MOVE TO Z
    
    MOV AH,2H
    MOV DL,0AH      ; NEW LINE
    INT 21H
    
    MOV DL,0DH      ; CARRIAGE RETURN
    INT 21H
    


;-------------COMPARE--------------

MOV AL,X
CMP AL,Y
JLE  XY ; X<Y
JG YX   ; Y<X
JMP EXIT


XY: 
MOV AL,X
    CMP AL,Z
    JLE XZ_XY ; COMPARE Y-Z
    JG ZXY    ; Z<X<Y
    JMP EXIT 

XZ_XY:
    MOV AL,Y
    CMP AL,Z
    JLE XYZ   ;X<Y<Z
    JG XZY    ; X<Z<Y
    JMP EXIT
    
YX: 
    MOV AL,Y
    CMP AL,Z
    JLE YX_YZ  ; COMPARE X-Z
    JG ZYX     ; Z<Y<X
    JMP EXIT

YX_YZ:
    MOV AL,X
    CMP AL,Z
    JLE YXZ    ; Y<X<Z
    JG YZX     ; Y<Z<X
    JMP EXIT
    
;--------PRINT VALUES-----------
    XYZ:
        
        ADD X,30H
        MOV AH,2H
        MOV DL,X           ; PRINT X
        INT 21H
        
        MOV AH,9H
        LEA DX,STR
        INT 21H 
        
        
        ADD Y,30H
        MOV AH,2H          ; PRINT Y
        MOV DL,Y
        INT 21H
        
        MOV AH,9H
        LEA DX,STR
        INT 21H 
        
        
        ADD Z,30H
        MOV AH,2H       ;PRINT Z
        MOV DL,Z
        INT 21H
        
        MOV AH,9H
        LEA DX,STR
        INT 21H
        
        JMP EXIT  
    
      
      XZY:
      
        ADD X,30H
        MOV AH,2H
        MOV DL,,X        ; PRINT X
        INT 21H
        
        MOV AH,9H
        LEA DX,STR
        INT 21H
        
        
        ADD Z,30H         ; PRINTZ
        MOV AH,2H
        MOV DL,Z
        INT 21H
        
        MOV AH,9H
        LEA DX,STR
        INT 21H
        
        
        ADD Y,30H
        MOV AH,2H          ; PRINT Y
        MOV DL,,Y
        INT 21H
        
        MOV AH,9H
        LEA DX,STR
        INT 21H
        
        JMP EXIT
        
      YXZ:
      
        ADD Y,30H
        MOV AH,2H       ; PRINT Y
        MOV DL,Y
        INT 21H
        
        MOV AH,9H
        LEA DX,STR
        INT 21H
        
        
        ADD X,30H       ; PRINT X
        MOV AH,2H
        MOV DL,X
        INT 21H
        
        MOV AH,9H
        LEA DX,STR
        INT 21H
        
        
        ADD Z,30H
        MOV AH,2H       ; PRINT Z
        MOV DL,,Z
        INT 21H
        
        MOV AH,9H
        LEA DX,STR
        INT 21H
        
        JMP EXIT
       
      YZX:
      
        ADD Y,30H
        MOV AH,2H        ; PRINT Y
        MOV DL,Y
        INT 21H
        
        MOV AH,9H
        LEA DX,STR
        INT 21H
        
        
        ADD Z,30H
        MOV AH,2H        ;PRINT Z
        MOV DL,Z
        INT 21H
        
        MOV AH,9H
        LEA DX,STR
        INT 21H
        
        
        ADD X,30H
        MOV AH,2H          ;PRINT X
        MOV DL,X
        INT 21H
        
        MOV AH,9H
        LEA DX,STR
        INT 21H
        
        JMP EXIT
        
        
     ZXY:
      
        ADD Z,30H
        MOV AH,2H           ; PRINT Z
       MOV DL,Z
        INT 21H
        
        MOV AH,9H
        LEA DX,STR
        INT 21H
        
        
        ADD X,30H
        MOV AH,2H        ; PRINT X
        MOV DL,X
        INT 21H
        
        MOV AH,9H
        LEA DX,STR
        INT 21H
        
        
        ADD Y,30H
        MOV AH,2H        ; PRINT Y
        MOV DL,Y
        INT 21H
        
        MOV AH,9H
        LEA DX,STR
        INT 21H
        
        
        JMP EXIT
      
      ZYX:
      
        ADD Z,30H
        MOV AH,2H
        MOV DL,Z            ; PRINT Z
        INT 21H
        
        MOV AH,9H
        LEA DX,STR
        INT 21H
        
        
        ADD Y,30H
        MOV AH,2H          ; PRINT Y
        MOV DL,Y
        INT 21H
        
        MOV AH,9H
        LEA DX,STR
        INT 21H
        
        
        ADD X,30H
        MOV AH,2H        ; PRINT X
        MOV DL,X
        INT 21H
        
        MOV AH,9H
        LEA DX,STR
        INT 21H 
        
        
        JMP EXIT
        
        
    EXIT:
        MOV AH,4CH
        INT 21H
        
    MAIN ENDP
END MAIN