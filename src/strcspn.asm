bits 64                             ; 64 bits asm
global strcspn:function              ; let linker access to _start label
section .text                       ; declare text section

strcspn:
    mov     r8b,        0               ;
    mov     rcx,        0               ;

.prepare_loop:
    mov     al,         byte[rdi + rcx] ;
    cmp     al,         0               ;
    je      .exit
    inc     rcx                         ;
    mov     r9,         0               ;

.loop:
    mov     r8b,        byte[rsi + r9]  ; mov char to  8bit register for
	cmp     r8b,        0               ; cmp char of
	je	    .prepare_loop               ; if char not in rejected -> leave
	cmp 	al,         r8b             ;
	je	    .exit_found
	inc	    r9
	jmp	    .loop

.exit_found:
    sub     rcx,        1               ;
    mov     rax,        rcx             ;
    ret

.exit:
	mov rax, rcx
	ret

; Compilation cmderror_exit
; nasm -f elf64 file.asmerror_exit
; ld -o <name_bin> *.o
