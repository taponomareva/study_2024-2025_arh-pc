%include 'in_out.asm'

SECTION .data
msg_function db "Функция: f(x) = 10x - 5", 0
msg_res db "Результат: ", 0

SECTION .text
GLOBAL _start

_start:
   mov eax, msg_function
   call sprintLF

   pop ecx
   pop edx
   sub ecx, 1
   mov esi, 0

next:
   cmp ecx, 0h
   jz _end
   pop eax
   call atoi

   mov ebx, 10
   mul ebx
   sub eax, 5
   add esi, eax
   loop next

_end: 
   mov eax, msg_res
   call sprint
   mov eax, esi
   call iprintLF
   call quit
