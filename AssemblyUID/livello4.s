.intel_syntax noprefix
.globl _start
.section .text
_start:
	mov %rax, %rdi #carico in rax la distanza
	div %rsi #divido per il tempo