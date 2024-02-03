.intel_syntax noprefix
.globl _start
.section .text
_start:
	mov %rbx, [%rdi]        #carico la prima quadword
	mov %rcx, [%rdi+8]      #carico la seconda quadword
	add %rcx, %rbx          
	mov [%rsi], %rcx
