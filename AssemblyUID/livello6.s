.intel_syntax noprefix
.globl _start
.section .text
_start:
	mov %al, %dl #prendo i primi 8 bit
	mov %bx, %si #prendo i primi 16 bit