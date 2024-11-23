%include 'in_out.asm'

SECTION .data
msg1 db 'Введите B: ', 0h
msg2 db 'Наименьшее число: ', 0h
A dd 94           
C dd 58         

SECTION .bss
B resd 1          ; Переменная для хранения числа B
min resd 1        ; Переменная для хранения минимального числа

SECTION .text
GLOBAL _start
_start:

    ; Вывод сообщения "Введите B: "
    mov eax, msg1
    call sprint

    ; Чтение строки и преобразование в число
    mov ecx, B
    mov edx, 10
    call sread
    mov eax, B
    call atoi
    mov [B], eax  ; Сохраняем введенное число B

    ; Инициализируем min значением A
    mov eax, [A]
    mov [min], eax

    ; Сравнение с C
    mov eax, [min]
    cmp eax, [C]
    jg check_B
    mov eax, [C]
    mov [min], eax

check_B:
    ; Сравнение с B
    mov eax, [min]
    cmp eax, [B]
    jb fin
    mov eax, [B]
    mov [min], eax

fin:
    ; Вывод сообщения "Наименьшее число: "
    mov eax, msg2
    call sprint

    ; Вывод результата
    mov eax, [min]
    call iprintLF

    ; Завершение программы
    call quit

