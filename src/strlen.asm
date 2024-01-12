bits 64                         ; 64 bits asm
global strlen:function          ; let linker access to _start label
section .text                   ; declare text section

strlen:
    mov     rax,    0           ; reset rax
    mov     rcx,    0           ; create counter
    cmp     rdi,    0           ; check if arg nb equal to 0
    je      .exit                ; if arg nb = 0 -> exit with -1

.count:
    cmp     byte[rdi + rcx], 0   ; compare char to '\0'
    je      .exit                ; if char == '\0' -> leave
    inc     rcx                  ; increment counter
    jmp     .count               ; go back to begin of count function


.exit:
    mov     rax,    rcx          ; save value of counter
    ret

; Compilation cmderror_exit
; nasm -f elf64 file.asmerror_exit
; ld -o <name_bin> *.o
