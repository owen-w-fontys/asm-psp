bits 64                                             ; 64 bits asm
global memcpy:function                              ; precise que le symbol crée est une fonction
section .text                                       ; declare text section

memcpy:
    mov     rcx,                0                   ; set rcx to 0
    mov     r8b,                0                   ; set r8b to 0
    mov     rax,                rdi                 ; overwrite rax with value of first arg (ptr)

.loop:
    cmp     rcx,                rdx                 ; check if loop has reach the end (size arg3)
    je      .end                                    ; stop if it is the case
    mov     r8b,                byte[rsi + rcx]     ; set value of r8b to char from arg2
    mov     byte[rax + rcx],    r8b                 ; set char of arg1[x] to val of r8b (arg2[x])
    inc     rcx                                     ; increment counter
    jmp     .loop

.end:
    ret


; Compilation cmderror_exit
; nasm -f elf64 file.asmerror_exit
; ld -o <name_bin> *.o
