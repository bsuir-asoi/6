.686
.MODEL FLAT, C
.STACK
.DATA
;-----------Local data------------------------------
messageFormat BYTE "Moisiuk-Dranko Pavel Alekseevich, 520601!", 10, 13, 0
.CODE
;-----------External usage--------------------------
EXTRN  printf : proc ; we'll use printf
;-----------Function definitions--------------------
sayID PROC

lea ebx, messageFormat ; ebx = &messageFormat

push ebx
call printf
add esp, 4 

retn

sayID ENDP

END
