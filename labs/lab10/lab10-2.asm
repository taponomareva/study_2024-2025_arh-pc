%include 'in_out.asm'

SECTION .data
filename db 'name.txt', 0
starter db 'Как Вас зовут?', 0
firstline db 'Меня зовут ', 0

SECTION .bss
name resb 512

SECTION .text
global _start
_start:
  mov eax, starter
  call sprint

  mov ecx, name
  mov edx, 512
  call sread

  mov eax, 8
  mov ebx, filename
  mov ecx, 0744o
  int 80h

  mov esi, eax

  mov eax, firstline
  call slen
  mov edx, eax
  mov ecx, firstline
  mov ebx, esi
  mov eax, 4
  int 80h

  mov eax, name
  call slen
  mov edx, eax
  mov ecx, name
  mov ebx, esi
  mov eax, 4
  int 80h

  mov ebx, esi
  mov eax, 6
  int 80h

  call quit
