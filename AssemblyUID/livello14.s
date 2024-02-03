.intel_syntax noprefix
.globl _start
.section .text
_start:
	pop %rax            #estraggo il top dello stack e lo metto in rax
	sub %rax, %rdi      
	push %rax           #dopo la somma, metto in cima allo stack il contenuto di rax