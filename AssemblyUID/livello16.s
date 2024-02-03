.intel_syntax noprefix
.globl _start
.section .text
_start:
	mov %rax, [rsp]
	mov %rbx, [rsp+8]
	add %rax, %rbx
	mov %rcx, [rsp+16]
	add %rax, %rcx
	mov %rdx, [rsp+24]
	add %rax, %rdx
	mov %rcx, 4
	mov %rbx, %rax
	idiv %rcx
	push %rbx     #non venuto