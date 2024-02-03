.intel_syntax noprefix
.globl _start
.section .text
_start:
	push %rdi       #inserisco uno, inserisco due, tolgo due, toglo uno -->swap avvenuto
	push %rsi
	pop %rdi
	pop %rsi