bits 64                                             ; 64 bits asm
global memset:function                              ; precise que le symbol crée est une fonction
section .text                                       ; declare text section

memset:
    mov     rcx,                0                   ; set rcx to 0
    mov     rax,                rdi                 ; overwrite rax with value of first arg (ptr)

.loop:
    cmp     rcx,                rdx                 ; check if loop has reach the end (size arg3)
    je      .end                                    ; stop if it is the case
    mov     byte[rax + rcx],    sil                 ; convert val of 2nd arg into 8b register and set the value of current mem space to it
    inc     rcx                                     ; increment counter
    jmp     .loop

.end:
    ret


; Compilation cmderror_exit
; nasm -f elf64 file.asmerror_exit
; ld -o <name_bin> *.o
