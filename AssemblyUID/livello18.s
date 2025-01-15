.intel_syntax noprefix
.globl _start
.section .text
_start: 
    mov %ecx, 0x7f454c46
    cmp [rdi], %ecx
    je first_even
    mov %ecx, 0x00005A4D
    cmp [rdi], %ecx
    je second_even
    jmp else

first_even:
    xor %eax, %eax
    add %eax, [rdi+4]
    add %eax, [rdi+8]
    add %eax, [rdi+12]
    jmp fine

second_even:
    xor %eax, %eax
    add %eax, [rdi+4]
    sub %eax, [rdi+8]
    sub %eax, [rdi+12]
    jmp fine

else:
    xor %eax, %eax
    add %eax, [rdi+4]
    imul %eax, [rdi+8]
    imul %eax, [rdi+12]
    jmp fine

fine:
    xor %rcx, %rcx