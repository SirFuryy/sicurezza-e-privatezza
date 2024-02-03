.intel_syntax noprefix
.globl _start
.section .text
_start:
	OR %rdi, 0xfffffffffffffffe 	#setto rdi a 111... e l'ultimo valore al suo originale
	XOR %rdi, 0xfffffffffffffffe	#ore lo porto a 0000... e l'ultimo valore al suo originale
	AND %rax, 0						#pulisco rax mettendolo a 0
	OR %rax, 1						#ore lo metto a 1
	XOR %rax, %rdi 					#se LSB di rdi è pari (0), rax=1, se LSB di rdi è dispari (1), rax=0