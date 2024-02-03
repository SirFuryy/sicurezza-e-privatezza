.intel_syntax noprefix
.globl _start
.section .text
_start:
	AND %rdi, %rsi 			#calcolo AND tra rdi e rsi
	AND %rax, 0x00000000 	#setto rax a 0000000000...
	OR %rax, %rdi 			#carico in rax usando un or, in quanto andrà ad inserire gli 1 dove li ha rdi