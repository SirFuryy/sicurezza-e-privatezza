# Assembly UID

## Spiegazione come risolvere i livelli di assembly, che richiedono la scrittura di specifici programmini

## Come eseguire il codice scritto

1. Starto la challenge.
2. Creo un file assembly (.s) che contenga la funzione richiesta. Nello specifico, nella testa del file devo scrivere le seguenti tre righe:  
    + .intel_syntax noprefix
    + .globl _start
    + .section .text

    Per poi passare alla parte vera e propria di scrittura del codice, inizializzata dalla funzione _start:
3. Creo un eseguibile dell'assembly scrivendo su riga di comando

    ```sh
    gcc -nostdlib -static -o nome_eseguibile programma.s
    ```

4. (opzionale) eseguo objdump per controllare che sia tutto a posto

     ```sh
    objdump -M intel -d nome_eseguibile
    ```

5. Ottengo i byte del corpo eseguibile della funzione usando objcopy

     ```sh
    objcopy --dump-section .text=nome_nuovo_file nome_eseguibile
    ```

6. Eseguo la challenge passandogli in input il file estratto da objcopy

     ```sh
    ./nome_challenge < nome_file_objcopy
    ```

## Elenco dei livelli

+ Livello 1 richiede di scrivere nel registro rdi il valore 0x1337

    ```s
    mov %rdi, 0x1337
    ```

+ Livello 2 richiede di sommare a rdi il valore 0x331337

    ```s
    add %rdi, 0x331337
    ```

+ Livello 3 richiede di scrivere del codice che esegua la funzione f(x)= mx+q, con degli specifici registri assegnati a m, x e q. Infine salva tutto in rax.

    ```s
    imul %rdi, %rsi
    add %rdx, %rdi
    mov %rax, %rdx
    ```

+ Livello 4 richiede di scrivere del codice che calcoli la velocità come spazio/tempo.  
La divisione si fa mettendo precedentemente in rax il valore che vogliamo dividere e dando come parametro a div il registro in cui è presente il valore per cui vogliamo dividere.  
Il quoziente poi sarà in rax e il resto in rdx

    ```s
    mov %rax, %rdi
    div %rsi
    ```

+ Livello 5 richiede di fare sempre la divisione ma vuole che il resto si trovi in rax invece che in rdx

    ```s
    mov %rax, %rdi
    div %rsi
    mov %rax, %rdx
    ```

+ Livello 6 spiega come funziona l'accesso ai regitri e richiede di calcolare due moduli usando soltanto mov.  
Nello specifico spiega che i registri in x86 sono tutti grandi 64 bit e che porzioni minori di essi possono essere ottenute mediante comando speciali che prendono i primi 32, 16 o 8 bit, come mostra questo schema  

    ```s
    MSB                                    LSB
    +----------------------------------------+
    |                   rax                  |
    +--------------------+-------------------+
                         |        eax        |
                         +---------+---------+
                                   |   ax    |
                                   +----+----+
                                   | ah | al |
                                   +----+----+
   64                    32       16    8    0
    ```

    Ovviamente i calcoli richiesti rientrano nel calcolo delle suddivisioni dei registri, quindi ad esempio un registro modulo 65536 equivale ad usare il registro ax.

    ```s
    mov %al, %dl
    mov %bx, %si
    ```

+ Livello 7 spiega come funziona lo shift a destra e a sinistra di un registro e richiede di passare un valore shiftato a rax

    ```s
    shl %rdi, 24 #pulisco i 24 bit a sinistra shiftando a sinistra, ovvero scambio i primi 24 bit con 0
    shr %rdi, 56 #ora shifto di 56 bit a destra così che rimanga solo il quinto bit iniziale
    mov %rax, %rdi
    ```

+ Livello 8 spiega il funzionamento della logica attraverso gli operatori AND, XOR e OR, che si usano ad esempio OR dest, source e richie di fare delle operazioni, tra cui dei movimenti, con essi.  
Tip: per pulire un registro, ovvero impostarlo tutto a 0, basta fare xor reg, reg

    ```s
    AND %rdi, %rsi #calcolo AND tra rdi e rsi
    XOR %rax, %rax #setto rax a 0000000000...
    OR %rax, %rdi #carico in rax usando un or, in quanto andrà ad inserire gli 1 dove li ha rdi
    ```

+ Livello 9 richiede di lavorare sempre con gli operatori logici e di implementare una funzione che riconosca se un valore pari o dispari

    ```s
    OR %rdi, 0xfffffffffffffffe #setto rdi a 111... e l'ultimo valore al suo originale
    XOR %rdi, 0xfffffffffffffffe #ora lo porto a 0000... e l'ultimo valore al suo originale
    AND %rax, 0
    OR %rax, 1
    XOR %rax, %rdi
    ```

+ Livello 10 spiega la defernziazione e chiede di modificare dei valori senza modificare i puntatori.

    ```s
    mov %rax, [0x404000]    #sposto in rax cio che è puntato da 404000
    mov %rbx, %rax          #lo copio in rbx
    add %rbx, 0x1337        #sommo 0x1337
    mov [0x404000], %rbx    #metto il risultato nella posizione 404000
    ```

+ Livello 11 richiede di usare sempre la deferenziazione, ma spostando anche halfword e quantità minori.

    ```s
    mov %al, [0x404000]     #prendo solo il byte lsb
    mov %bx, [0x404000]     #prendo solo la prima word
    mov %ecx, [0x404000]    #prendo solo la prima double-word
    mov %rdx, [0x404000]    #prendo tutta la quad-word
    ```

+ Livello 12 spiega cosa è il little endian e che non posso inserire direttamente indirizzi troppo grandi nei registri deferenziati. Per farlo devo prima scrivere l'indirizzo in un registro e poi passarlo al registro deferenziato.

    ```s
    mov %rbx, 0xdeadbeef00001337    #carico in una variabile d'appoggio il contenuto
    mov %rcx, 0xc0ffee0000          
    mov [%rdi], %rbx                #nella posizione puntata dal valore contenuto nel registro rdi inserisco il valore
    mov [%rsi], %rcx                #che ho preso dalla variabile d'appoggio
    ```

+ Livello 13 spiega come sono salvati effettivamente i dati in memoria, ovvero byte per byte.  
Il puntatore punta al primo byte, i successivi sono raggiunti mediante offset, ovvero puntatore + 1, 2, ecc.... In questo modo possiamo accedere a quadword, halfword eccetera in maniera semplice. L'esercizio richiede di fare questo.

    ```s
    mov %rbx, [%rdi]        #carico la prima quadword
    mov %rcx, [%rdi+8]      #carico la seconda quadword
    add %rcx, %rbx          
    mov [%rsi], %rcx
    ```

+ Livello 14 introduce l'uso dello stack, che è una memoria di tipo LIFO accessibile al top e alla base usando due appositi registri che fanno da puntatori. L'esercizio richiede di modificare il valore al top dello stack.

    ```s
    pop %rax            #estraggo il top dello stack e lo metto in rax
    sub %rax, %rdi      
    push %rax           #dopo la somma, metto in cima allo stack il contenuto di rax
    ```

+ Livello 15 continua gli esercizi sullo stack e richiede di scambiare due valori presenti usando solo pop e push.

    ```s
    push %rdi       #inserisco uno, inserisco due, tolgo due, toglo uno -->swap avvenuto
    push %rsi
    pop %rdi
    pop %rsi
    ```

+ Livello 16 spiega l'uso di rsp, ovvero il registro che punta sempre al top dello stack.

    ```s
    mov %rax, [rsp]
    mov %rbx, [rsp+8]
    add %rax, %rbx
    mov %rcx, [rsp+16]
    add %rax, %rcx
    mov %rdx, [rsp+24]
    add %rax, %rdx
    mov %rcx, 4
    cqo         #cqo è un comando per dire al sistema di dividere rax in rax e rdx per permettere una divisione più sicura e con segno. Senza non funziona questa challenge
    idiv %rcx
    mov [rsp-8], %rax
    ```

+ Livello 17 spiega le tipologie di salto incondizionato relativo (usando delle label nel codice) e assoluto (passando la posizione di dove saltare direttamente o tramite registro per salti molto grandi).  
L'esercizio chiede di eseguire un doppio salto inserendo una serie di nop nel codice per renderlo largo abbastanza.

    ```s
    jmp jump_to_0x51 #jmp $+0x51    #Jump to 0x51 bytes ahead
    nop
    nop x 51
    ...
    nop
    #Code at 0x51, etichetta richiesta
    jump_to_0x51:
    pop rdi               #Place top value on the stack into register rdi
    mov rax, 0x403000
    jmp rax                #Jump to the absolute address 0x403000
    ```

+ Livello 18 richiede di implementare una struttura if () else if () else () con cmp (compare) e je (jump if equals).  
Prima si fa il compare e poi si piazzano i salti che accettano però solo etichette

    ```s
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
    ```

+ Livello 19 richiede di implementare uno switch statement con una tabella dei salti, ovvero le posizioni di dove saltare sono posizionate in posizioni contigue in memoria così che ci si possa acceder usando il punto 0 + offset.  
In questo caso prima controlliamo il caso di default (if greater then) e poi calcolando gli offset in maniera automatica facciamo gli altri salti.

    ```s
    cmp %rdi, 3     #comparo rdi con 3 e salto con jg se è maggiore di 3
    jg default
    imul %rdi, 8
    add %rdi, %rsi  #calcolo l'offset con il valore %rdi * 8, ovvero vado alla posizione successiva in memoria
    jmp [rdi]

    default:
    mov %rbx, %rsi
    add %rbx, 32    #calcolo la posizione del default
    jmp [rbx]
    ```

+ Livello 20 richiede di fare un for-loop. Non mi funziona. Mi sono rotto anche di fare il 21, 22 e 23 (quelli che mancano).

    ```s
    xor %rbx, %rbx      #rbx = i
    xor %rax, %rax      #rax = somma delle quadword    

    inizio_loop:
    cmp %rbx, %rsi      #comparo se i>n(rsi)
    jg fine_loop
    add %rax, [%rdi]
    add %rdi, 8         #posizione quadword calcoalta come puntatore_alla_prima+8*i
    add %rbx, 8         #aumento 
    jmp inizio_loop

    fine_loop:
    cqo
    idiv %rsi
    ```
