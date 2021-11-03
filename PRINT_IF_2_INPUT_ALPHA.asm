;input 2 character if they are alphabets print them serially

.MODEL SMALL
.DATA
      X DB '?'
      Y DB '?'
      STR DB "INVALID INPUT $"
ENDS

    .STACK 100H
    .CODE
    
MAIN PROC
    
    MOV AX, @DATA
    MOV DS, AX
    
    
    MOV AH,1H     ; INPUT X
    INT 21H
    
    MOV X,AL       ; 1ST INPUT STORED IN X 
    
    
        MOV AH,2H      ; NEW LINE
        MOV DL,0AH
        INT 21H
     
     
    MOV AH,1H     ; INPUT X
    INT 21H
    
    MOV Y,AL       ; 1ST INPUT STORED IN Y   
    
 
         MOV AH,2H      ; NEW LINE
        MOV DL,0AH
        INT 21H
 
    
;---------CHECK X-----------     
    
    CMP X,65
    JGE CHECK90X        ; IF X>=65 CHECK FOR 90
    JL INVALID
    JMP EXIT            ; IF X<65 NOT AN ALPHABET
       
    
    CHECK90X:
        CMP X,90
        JLE CHECKY      ; IF X<=90 X IS ALPHA CHECK Y
        JG CHECK97X     ; IF X>90 CHECK RANGE 97-122
        JMP EXIT
    
    CHECK97X:
         CMP X,97                             ; CHECK IF X IS AN ALPHABET
         JGE CHECK122X
         JL INVALID
         JMP EXIT
    
    CHECK122X:
         CMP X,122
         JLE CHECKY     ; IF X<=122 X IS ALPHA CHECK Y
         JG INVALID     ; IF X<122 NOT AN ALPHABET
         JMP EXIT
         
    
;---------CHECK Y-------------

     CHECKY:
          CMP Y,65
          JGE CHECK90Y
          JL INVALID    ; IF X<65 NOT AN ALPHABET
          JMP EXIT 
     
     CHECK90Y:
        CMP Y,90
        JLE COMPARE
        JG CHECK97Y                  ; CHECK IF Y IS AN ALPHABET
        JMP EXIT
    
    CHECK97Y:
         CMP Y,97
         JGE CHECK122Y
         JMP EXIT
    
    CHECK122Y:
         CMP Y,122
         JLE COMPARE
         JG INVALID      ; IF X<122 NOT AN ALPHABET
         JMP EXIT
     
        
;----------COMPARE------------
COMPARE:

    MOV BL,X
    
    CMP BL,Y              ; COMPARE X & Y
    JLE PRINTX
    JG PRINTY
    JMP EXIT
    
    
    
;-------PRINT X Y------------
PRINTX:
        MOV AH,2H
        MOV DL,X
        INT 21H              ; X<Y FIRST PRINT X THEN Y
         
        MOV AH,2H
        MOV DL,Y
        INT 21H 
        
        JMP EXIT
        

PRINTY:
        MOV AH,2H
        MOV DL,Y
        INT 21H
                             ; Y<X FIRST PRINT Y YHEN X
        MOV AH,2H
        MOV DL,X
        INT 21H
        
        JMP EXIT
        

;-------PRINT INVALID------
        
INVALID:
        MOV AH,9H
        LEA DX,STR
        INT 21H
        
            
     
     EXIT:
           MOV AH,4CH
           INT 21H
    
    MAIN ENDP

END MAIN