.intel_syntax noprefix
.globl _start
.section .text
_start: 
    imul %rdi, %rsi
    add %rdx, %rdi
    mov %rax, %rdx
