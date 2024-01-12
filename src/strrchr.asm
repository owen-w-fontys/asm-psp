bits 64                             ; 64 bits asm
global strrchr:function              ; let linker access to _start label
section .text                       ; declare text section

strrchr:
    mov     rax,    0               ; reset rax
    cmp     rdi,    0               ; check if function has at least one argument
    je      .exit                    ; if arg nb = 0 -> exit
    cmp     rsi,    0               ; check if function has a second argumnt
    je      .exit                    ; if there is no second argumnt -> exit

.go_end:
    cmp     byte[rdi + rcx], 0       ; compare char to '\0'
    je      .rem_one                  ; if char == '\0' -> go to rem_one
    inc     rcx                      ; increment counter
    jmp     .go_end                   ; go back to begin of count function

.rem_one:                             ; remove one from rcx value to target a last -1 char
    dec rcx
    jmp .count

.count:
    cmp     byte[rdi + rcx], sil    ; compare char to excepted (sil is 8bit register for rsi)
    je      .exit                    ; if char == excpected -> leave
    cmp     byte[rdi + rcx], 0      ; compare if char == '\0'
    je      .exit_null               ; if char == '\0' -> exit null
    dec     rcx                     ; increment counter
    jmp     .count                   ; go back to begin of count function

.exit_null:
    mov     rax,    0               ; set return value to 0
    ret

.exit:
    mov     rax,    rdi             ; save value of counter
    ret

; Compilation cmderror_exit
; nasm -f elf64 file.asmerror_exit
; ld -o <name_bin> *.o
