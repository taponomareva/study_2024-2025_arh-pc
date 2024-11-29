%include 'in_out.asm'

SECTION .data
msg db "Результат: ",0

SECTION .text
global _start

_start:
    pop ecx     ; Извлекаем из стека в `ecx` количество аргументов
    pop edx     ; Извлекаем из стека имя программы
    sub ecx,1   ; Уменьшаем `ecx` на 1 (учитываем только аргументы)
    mov esi, 1  ; Инициализируем `esi` как 1 для корректного умножения

next:
    cmp ecx,0h  ; Проверяем, есть ли еще аргументы
    jz _end     ; Если аргументов нет, выходим из цикла
    pop eax     ; Извлекаем следующий аргумент из стека
    call atoi   ; Преобразуем символ в число
    imul esi,eax ; Умножаем `esi` на `eax` (`esi = esi * eax`)
    loop next   ; Переход к обработке следующего аргумента

_end:
    mov eax, msg  ; Вывод сообщения "Результат: "
    call sprint
    mov eax, esi  ; Передаем результат умножения в `eax`
    call iprintLF ; Печать результата
    call quit     ; Завершение программы

