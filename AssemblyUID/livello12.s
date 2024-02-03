.intel_syntax noprefix
.globl _start
.section .text
_start:
	mov %rbx, 0xdeadbeef00001337    #carico in una variabile d'appoggio il contenuto
	mov %rcx, 0xc0ffee0000          
	mov [%rdi], %rbx                #nella posizione puntata dal valore contenuto nel registro rdi inserisco il valore
	mov [%rsi], %rcx                #che ho preso dalla variabile d'appoggio