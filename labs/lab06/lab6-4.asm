%include 'in_out.asm'

SECTION .data
msg: DB 'Введите значение x: ', 0
rem: DB 'Вывод: ', 0

SECTION .bss
x: RESB 80

SECTION .text
GLOBAL _start

_start:
    mov eax, msg
    call sprintLF

    mov ecx, x
    mov edx, 80
    call sread

    mov eax, x
    call atoi 

    xor edx, edx        ; Обнуляем edx перед умножением
    add eax, 2          ; eax = x + 2
    imul eax, eax       ; eax = (x + 2) * (x + 2)

    mov ebx, eax       
    mov eax, rem
    call sprint         
    mov eax, ebx        
    call iprintLF     
    
    call quit





