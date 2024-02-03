.intel_syntax noprefix
.globl _start
.section .text
_start:
	
    #porco dio vaffanculo a pwn che non spiega che cazzo c'è che non vuole
	jmp jump_to_0x51 #jmp $+0x51	# 		#Jump to 0x51 bytes ahead
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
        nop
        nop
        nop
       	nop 
	
	#86-8 = 78
#Code at 0x51
jump_to_0x51:
	pop rdi               	#Place top value on the stack into register rdi
	mov rax, 0x403000
	jmp rax    		#Jump to the absolute address 0x403000
	