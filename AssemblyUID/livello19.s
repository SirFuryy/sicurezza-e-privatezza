.intel_syntax noprefix
.globl _start
.section .text
_start: 
    mov %rbx, %rsi
    add %rbx, 32
    cmp %rdi, 3
    jg default
    imul %rdi, 8
    add %rdi, %rsi
    jmp [rdi]

default:
    jmp [rbx]