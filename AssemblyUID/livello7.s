.intel_syntax noprefix
.globl _start
.section .text
_start:
	shl %rdi, 24 #pulisco i 24 bit a sinistra shiftando a sinistra, ovvero scambio i primi 24 bit con 0
	shr %rdi, 56 #ora shifto di 56 bit a destra così che rimanga solo il quinto byte iniziale
	mov %rax, %rdi