Title this program will input and display characters such as word/letter
dosseg                  ; dos segment 
.model small            
.stack 0100h            
.data                   ; data segment
str1 db "Enter a character: $" 
str2 db 13,10, "Char Output is $" 
Arr db 20 dup('$')

.CODE
Start:
    mov ax, @data       ; load starting address of data segment in ax
    mov ds,ax           ; initialization of data segment
;-------------------------------------------input char
    lea dx,str1         ; get offset address of Arr
    mov ah, 09h         ; string display 
    int 21h             ; DOS interrupt

    mov ah,10           ; string input 
    lea dx,Arr          ; get offset address of Arr
    mov Arr,16          ; set array size <=20
    int 21h             ; DOS interrupt 
;-------------------------------------------display
    lea dx,str2         ; get offset address of str2
    mov ah, 09h         ; sring display 
    int 21h             ; DOS interrupt

    lea dx, Arr+2       ; get offset address of Arr
    mov ah, 09h         ; string display 
    int 21h             ; DOS interrupt 

;-------------------------------------------exit
    mov ax, 4c00h       ; exit program
    int 21h 
end

end Start
