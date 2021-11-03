;WRITE A CODE TO INOUT A CHARACTER, IF IT IS ASCII
; OF AN ALPHABET THEN CONVERT INTO OPPOSIT CASE

.MODEL SMALL
.DATA
    X DB '?'
    STR DB 'INVALID $'
ENDS
    .STACK 100H
    .CODE
    
    
MAIN PROC
        MOV AX, @DATA
        MOV DS,AX
        
        MOV AH,1H    ; INPUT DATA
        INT 21H
       
        MOV X,AL
        
        MOV AH,2H     ; NEW LINE
        MOV DL,0AH
        INT 21H
        
        CMP X,96
        JG CHECK123   ; IX X>96 | CHECK IF X<123
        JL CHECK64    ; IF X<64 | CHECK IF X IN RANGE 65-90
        JMP EXIT
        
        
        
        CHECK123:
                CMP X,123
                JL SUB32     ; IF X<123 SUB 32
                JGE INVALID  ; IF X>=123 IT IS NOT A ALPHABET
                JMP EXIT
        
        CHECK64:
                CMP X,64
                JG CHECK91   ; IF X>64 CHECK IF X<91
                JLE INVALID  ; IF X<64 | IT IS NOT A ALPHABET
                JMP EXIT
        
        CHECK91:
                CMP X,91      ; IF X<91 | ADD 32
                JL ADD32      ; IF X>91 | NOT A ALPHABET
                JGE INVALID
                JMP EXIT
        
        ADD32:
                ADD X,32
                ;ADD X,30H
                MOV AH,2H    ; ADD 32 AND MAKE IT LOWER CASE
                MOV DL,X
                INT 21H
                JMP EXIT
                              
        
        SUB32:
                SUB X,32
                ;ADD X,30H
                MOV AH,2H    ; SUB 32 AND MAKE IT UPPER CASE
                MOV DL,X
                INT 21H
                JMP EXIT
        
        INVALID:
                 MOV AH, 9H   ; TO DISPLAY
                  LEA DX, STR                ; IT IS NOT AN ALPHABET
                  INT 21H  
       
               EXIT:
                    MOV AH,4CH
                    INT 21H 
        
    MAIN ENDP
END MAIN