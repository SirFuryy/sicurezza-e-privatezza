.intel_syntax noprefix
.globl _start
.section .text
_start:
	mov %rax, [rsp]
    mov %rbx, [rsp+8]
    add %rax, %rbx
    mov %rcx, [rsp+16]
    add %rax, %rcx
    mov %rdx, [rsp+24]
    add %rax, %rdx
    mov %rcx, 4
    cqo         #cqo è un comando per dire al sistema di dividere rax in rax e rdx per permettere una divisione più sicura e con segno. Senza non funziona questa challenge
    idiv %rcx
    mov [rsp-8], %rax