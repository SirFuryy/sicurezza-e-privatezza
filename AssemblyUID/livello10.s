.intel_syntax noprefix
.globl _start
.section .text
_start:
	mov %rax, [0x404000]    #sposto in rax cio che è puntato da 404000
	mov %rbx, %rax          #lo copio in rbx
	add %rbx, 0x1337        #sommo 0x1337
	mov [0x404000], %rbx    #metto il risultato nella posizione 404000