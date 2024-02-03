.intel_syntax noprefix
.globl _start
.section .text
_start:
	mov %al, [0x404000]		#prendo solo il byte lsb
	mov %bx, [0x404000]		#prendo solo la prima word
	mov %ecx, [0x404000]	#prendo solo la prima double-word
	mov %rdx, [0x404000]	#prendo tutta la quad-word