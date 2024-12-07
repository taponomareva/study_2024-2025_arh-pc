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

   call _solve_f

   add esi, eax
   loop next

_end: 
   mov eax, msg_res
   call sprint
   mov eax, esi
   call iprintLF
   call quit

_solve_f:
   mov ebx, 10        ; Загружаем множитель 10 в ebx
   mul ebx            ; Умножаем eax на 10, результат в eax (eax = eax * 10)
   sub eax, 5         ; Вычитаем 5 из eax (eax = eax - 5)
   ret                ; Возвращаемся из подпрограммы

