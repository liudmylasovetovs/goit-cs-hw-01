org  0x100               ; Вказуємо, що це програма .COM
section .data
    a db 5               ; a = 5
    b db 3               ; b = 3
    c db 2               ; c = 2
    resultMsg db 'Result: $' ; Рядок для виводу

section .text
_start:
    mov al, [b]          ; AL = b
    sub al, [c]          ; AL = b - c
    add al, [a]          ; AL = b - c + a

    add al, 30h          ; Перетворюємо в ASCII (однозначне число)

    ; Вивід "Result: "
    mov ah, 09h
    lea dx, resultMsg
    int 21h

    ; Вивід результату
    mov dl, al
    mov ah, 02h
    int 21h

    ; Завершення
    mov ax, 4c00h
    int 21h
