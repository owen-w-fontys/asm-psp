bits 64                              ; 64 bits asm
global strncmp:function              ; let linker access to _start label
section .text                        ; declare text section

strncmp:
    mov     rcx,        0            ; set rcx to 0
    mov     r8b,        0            ;
    mov     r9b,        0            ;

.count:
    mov     r8b,        byte[rdi]
    mov     r9b,        byte[rsi]
    cmp     r8b,  0                  ; cmp char of
    je      .exit
    cmp     r9b,  0                  ; cmp char of
    je      .exit
    cmp     r8b,        r9b          ; compare char to excepted (sil is 8bit register for rsi)
    jne      .exit                   ; if char == excpected -> leave
    inc     rdi                      ; increment counter and move in memomy
    inc     rsi                      ; increment counter and move in memomy
    inc     rcx                      ; increment counter and move in memomy
    cmp     rdx,        rcx          ; cmp if end of value
    jle     .exit                    ; cmp valid if rdx <= rcx (complete loop)
    jmp     .count                   ; go back to begin of count function

.exit:
    movzx rax, r8b
	movzx rbx, r9b
	sub rax, rbx
	ret

; Compilation cmderror_exit
; nasm -f elf64 file.asmerror_exit
; ld -o <name_bin> *.o
