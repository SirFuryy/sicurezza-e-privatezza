# sicurezza-e-privatezza
Alcuni funzionano, altri no

Per lo shellcode, creare il file .s ed eseguire il seguente comando (si possono fare anche separati, senza i ;, questi servono per velocizzarli)

'gcc -static -nostdlib file.s -o file.elf ; objcopy --dump-section .text=file.bin file.elf ; hd file.bin'
