format PE Console
entry start

include 'includes\win32a.inc' ; Включает файл с определениями для Win32 API

section '.data' data readable writeable
    ; Объявление переменных, используемых в программе
    gg dd 0 ; Переменная для первого введенного числа
    kk dd 0 ; Переменная для второго введенного числа
    ff db "%d",0 ; Формат для функции scanf для первого числа
    hh db " %d",0 ; Формат для функции scanf для второго числа
    kdk dd 0 ; Вспомогательная переменная для деления
    result dd 0 ; Переменная для хранения результата
    temp db "%d ",0 ; Формат для функции printf для вывода результата
    prom dd 0 ; Вспомогательная переменная для хранения остатка от деления
    prom2 dd 0 ; Вспомогательная переменная для хранения промежуточного результата

section '.text' code readable executable
    start:
        ; Чтение первого числа
        push gg
        push ff
        call [scanf]
        mov eax, [gg]
        cmp eax, 0
        jz start3 ; Если первое число равно 0, переход к start3

    start2:
        ; Чтение второго числа
        push kk
        push hh
        call [scanf]
        mov eax, [gg]
        sub eax, 1 ; Уменьшаем количество свободных чисел на 1
        mov [gg], eax

    delim:
        ; Разделение второго числа на цифры и суммирование их
        mov eax, [kk]
        mov ecx, 10
        xor edx, edx
        div ecx ; Деление на 10 с сохранением остатка в edx
        mov [kdk], eax ; Сохранение результата деления
        mov eax, [result]
        mov [prom], edx ; Сохранение остатка от деления
        xor edx, edx
        mul ecx
        mov [prom2], eax ; Сохранение промежуточного результата
        add eax, [prom] ; Суммирование остатка от деления
        mov [result], eax ; Сохранение результата
        mov eax, [kdk]
        cmp eax, 0
        mov [kk], eax ; Обновление второго числа
        jnz delim ; Если второе число не равно 0, повторяем цикл

        ; Вывод результата
        push [result]
        push temp
        call [printf]
        mov [result], 0 ; Обнуление результата

        mov eax, [gg]
        cmp eax, 0
        jnz start2 ; Если есть еще числа для обработки, повторяем цикл

    start3:
        ; Завершение программы
        call [ExitProcess]

section '.idata' data import readable
    ; Объявление библиотек и функций, которые будут использованы
    library kernel, 'kernel32.dll',\
            msvcrt, 'msvcrt.dll'

    import kernel, ExitProcess, 'ExitProcess' ; Импорт функции ExitProcess из kernel32.dll

    import msvcrt, printf, 'printf', scanf,'scanf', getch, '_getch' ; Импорт функций printf, scanf и _getch из msvcrt.dll
