bits 64                             ; 64 bits asm
global strchr:function              ; let linker access to _start label
section .text                       ; declare text section

strchr:
    cmp     byte[rdi + rcx], sil    ; compare char to excepted (sil is 8bit register for rsi)
    je      .exit                    ; if char == excpected -> leave
    cmp     byte[rdi + rcx], 0      ; compare if char == '\0'
    je      .exit_null               ; if char == '\0' -> exit null
    inc     rcx                     ; increment counter
    jmp     strchr                   ; go back to begin of count function

.exit_null:
    mov     rax,    0               ; set return value to 0
    ret

.exit:
    mov     rax,    rdi             ; save value of counter
    add     rax,    rcx             ; add val
    ret

; Compilation cmderror_exit
; nasm -f elf64 file.asmerror_exit
; ld -o <name_bin> *.o
