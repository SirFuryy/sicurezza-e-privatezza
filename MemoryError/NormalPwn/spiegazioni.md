# Qui inseriro le spiegazioni degli esercizi di memory error del pwn normale

## Esercizio 1

+ Il primo esercizio è molto semplice e richiede di andare a sovrascrivere il valore 00 della variabile win con qualunque valore. Basta inserire un valore di offset maggiore o uguale della distanza tra l'inizio del buffer e la posizione della variabile win (che ci viene detta dalla challenge) e poi inserire una sequenza di caratteri a caso. Anche se triggheriamo la guardia del canarino la challenge sarà risolta uguale.

## Esercizio 1.1

+ Il procedimento è lo stesso dell'esercizio 1 normale, semplicemente non vengono date istruzioni

## Esercizio 2.0

+ In questa challenge è richiesto modificare il valore della variabile win in 0x40f266ff. Per l'offset si può fare come prima, quindi dare almeno un valore maggiore rispetto alla distanza fino alla variabile. In ogni caso il valore richiesto deve essere posizionato esattamente dopo x valori, se no non funziona. Inoltre, siccome 0xff e 0xf2 non può essere inserito in maniera diretta come valore String nella richiesta del problema (banalmente 0x66 può essere ottenuto digitando f, che in ascii viene rappresentato con 0x66 appunto), ma deve essere inserito mediante pipe input dalla bash o come programma di python sempre passato come pipe input

```sh
echo -ne "30AAAAAAAAAAAAAAAAAAAAAAAAA\xff\x66\xf2\x40" | ./babymem_level2.0
```

oppure (notifico anche che sarebbe meglio usare printf piuttosto che echo)

```sh
printf "30AAAAAAAAAAAAAAAAAAAAAAAAA\xff\x66\xf2\x40" > payload.bin
./nome_programma < payload.bin
```


