  401864:       f3 0f 1e fa             endbr64 
  401868:       55                      push   %rbp
  401869:       48 89 e5                mov    %rsp,%rbp
  40186c:       48 81 ec c0 00 00 00    sub    $0xc0,%rsp
  401873:       89 bd 5c ff ff ff       mov    %edi,-0xa4(%rbp)
  401879:       48 89 b5 50 ff ff ff    mov    %rsi,-0xb0(%rbp)
  401880:       48 89 95 48 ff ff ff    mov    %rdx,-0xb8(%rbp)
  401887:       48 c7 85 70 ff ff ff    movq   $0x0,-0x90(%rbp)
  40188e:       00 00 00 00 
  401892:       48 c7 85 78 ff ff ff    movq   $0x0,-0x88(%rbp)
  401899:       00 00 00 00 
  40189d:       48 c7 45 80 00 00 00    movq   $0x0,-0x80(%rbp)
  4018a4:       00 
  4018a5:       48 c7 45 88 00 00 00    movq   $0x0,-0x78(%rbp)
  4018ac:       00 
  4018ad:       48 c7 45 90 00 00 00    movq   $0x0,-0x70(%rbp)
  4018b4:       00 
  4018b5:       48 c7 45 98 00 00 00    movq   $0x0,-0x68(%rbp)
  4018bc:       00 
  4018bd:       48 c7 45 a0 00 00 00    movq   $0x0,-0x60(%rbp)
  4018c4:       00 
  4018c5:       48 c7 45 a8 00 00 00    movq   $0x0,-0x58(%rbp)
  4018cc:       00 
  4018cd:       48 c7 45 b0 00 00 00    movq   $0x0,-0x50(%rbp)
  4018d4:       00 
  4018d5:       48 c7 45 b8 00 00 00    movq   $0x0,-0x48(%rbp)
  4018dc:       00 
  4018dd:       48 c7 45 c0 00 00 00    movq   $0x0,-0x40(%rbp)
  4018e4:       00 
  4018e5:       48 c7 45 c8 00 00 00    movq   $0x0,-0x38(%rbp)
  4018ec:       00 
  4018ed:       48 c7 45 d0 00 00 00    movq   $0x0,-0x30(%rbp)
  4018f4:       00 
  4018f5:       48 c7 45 d8 00 00 00    movq   $0x0,-0x28(%rbp)
  4018fc:       00 
  4018fd:       c7 45 e0 00 00 00 00    movl   $0x0,-0x20(%rbp)
  401904:       66 c7 45 e4 00 00       movw   $0x0,-0x1c(%rbp)
  40190a:       c6 45 e6 00             movb   $0x0,-0x1a(%rbp)
  40190e:       48 8d 85 70 ff ff ff    lea    -0x90(%rbp),%rax
  401915:       48 89 45 f8             mov    %rax,-0x8(%rbp)
  401919:       48 c7 45 f0 00 00 00    movq   $0x0,-0x10(%rbp)
  401920:       00 
  401921:       48 8d 3d d0 18 00 00    lea    0x18d0(%rip),%rdi        # 4031f8 <_IO_stdin_used+0x1f8>
  401928:       e8 f3 f7 ff ff          callq  401120 <puts@plt>
  40192d:       48 89 e0                mov    %rsp,%rax
  401930:       48 89 05 e1 48 00 00    mov    %rax,0x48e1(%rip)        # 406218 <sp_>
  401937:       48 89 e8                mov    %rbp,%rax
  40193a:       48 89 05 b7 48 00 00    mov    %rax,0x48b7(%rip)        # 4061f8 <bp_>
  401941:       48 8b 15 b0 48 00 00    mov    0x48b0(%rip),%rdx        # 4061f8 <bp_>
  401948:       48 8b 05 c9 48 00 00    mov    0x48c9(%rip),%rax        # 406218 <sp_>
  40194f:       48 29 c2                sub    %rax,%rdx
  401952:       48 89 d0                mov    %rdx,%rax
  401955:       48 c1 e8 03             shr    $0x3,%rax
  401959:       48 83 c0 02             add    $0x2,%rax
  40195d:       48 89 05 a4 48 00 00    mov    %rax,0x48a4(%rip)        # 406208 <sz_>
  401964:       48 8b 05 8d 48 00 00    mov    0x488d(%rip),%rax        # 4061f8 <bp_>
  40196b:       48 83 c0 08             add    $0x8,%rax
  40196f:       48 89 05 9a 48 00 00    mov    %rax,0x489a(%rip)        # 406210 <rp_>
  401976:       48 8d 3d b3 18 00 00    lea    0x18b3(%rip),%rdi        # 403230 <_IO_stdin_used+0x230>
  40197d:       e8 9e f7 ff ff          callq  401120 <puts@plt>
  401982:       48 8b 15 7f 48 00 00    mov    0x487f(%rip),%rdx        # 406208 <sz_>
  401989:       48 8b 05 88 48 00 00    mov    0x4888(%rip),%rax        # 406218 <sp_>
  401990:       48 89 d6                mov    %rdx,%rsi
  401993:       48 89 c7                mov    %rax,%rdi
  401996:       e8 1b f9 ff ff          callq  4012b6 <DUMP_STACK>
  40199b:       48 8b 15 56 48 00 00    mov    0x4856(%rip),%rdx        # 4061f8 <bp_>
  4019a2:       48 8b 05 6f 48 00 00    mov    0x486f(%rip),%rax        # 406218 <sp_>
  4019a9:       48 89 c6                mov    %rax,%rsi
  4019ac:       48 8d 3d c5 18 00 00    lea    0x18c5(%rip),%rdi        # 403278 <_IO_stdin_used+0x278>
  4019b3:       b8 00 00 00 00          mov    $0x0,%eax
  4019b8:       e8 83 f7 ff ff          callq  401140 <printf@plt>
  4019bd:       48 8b 05 44 48 00 00    mov    0x4844(%rip),%rax        # 406208 <sz_>
  4019c4:       48 89 c6                mov    %rax,%rsi
  4019c7:       48 8d 3d f2 18 00 00    lea    0x18f2(%rip),%rdi        # 4032c0 <_IO_stdin_used+0x2c0>
  4019ce:       b8 00 00 00 00          mov    $0x0,%eax
  4019d3:       e8 68 f7 ff ff          callq  401140 <printf@plt>
  4019d8:       48 8d 3d 29 19 00 00    lea    0x1929(%rip),%rdi        # 403308 <_IO_stdin_used+0x308>
  4019df:       e8 3c f7 ff ff          callq  401120 <puts@plt>
  4019e4:       48 8b 05 1d 48 00 00    mov    0x481d(%rip),%rax        # 406208 <sz_>
  4019eb:       48 c1 e0 03             shl    $0x3,%rax
  4019ef:       48 89 c6                mov    %rax,%rsi
  4019f2:       48 8d 3d 54 19 00 00    lea    0x1954(%rip),%rdi        # 40334d <_IO_stdin_used+0x34d>
  4019f9:       b8 00 00 00 00          mov    $0x0,%eax
  4019fe:       e8 3d f7 ff ff          callq  401140 <printf@plt>
  401a03:       48 8b 45 f8             mov    -0x8(%rbp),%rax
  401a07:       48 89 c6                mov    %rax,%rsi
  401a0a:       48 8d 3d 57 19 00 00    lea    0x1957(%rip),%rdi        # 403368 <_IO_stdin_used+0x368>
  401a11:       b8 00 00 00 00          mov    $0x0,%eax
  401a16:       e8 25 f7 ff ff          callq  401140 <printf@plt>
  401a1b:       48 8d 3d 8e 19 00 00    lea    0x198e(%rip),%rdi        # 4033b0 <_IO_stdin_used+0x3b0>
  401a22:       e8 f9 f6 ff ff          callq  401120 <puts@plt>
  401a27:       48 8d 3d d2 19 00 00    lea    0x19d2(%rip),%rdi        # 403400 <_IO_stdin_used+0x400>
  401a2e:       e8 ed f6 ff ff          callq  401120 <puts@plt>
  401a33:       be 77 00 00 00          mov    $0x77,%esi
  401a38:       48 8d 3d f1 19 00 00    lea    0x19f1(%rip),%rdi        # 403430 <_IO_stdin_used+0x430>
  401a3f:       b8 00 00 00 00          mov    $0x0,%eax
  401a44:       e8 f7 f6 ff ff          callq  401140 <printf@plt>
  401a49:       48 8d 3d 38 1a 00 00    lea    0x1a38(%rip),%rdi        # 403488 <_IO_stdin_used+0x488>
  401a50:       e8 cb f6 ff ff          callq  401120 <puts@plt>
  401a55:       48 8d 3d 64 1a 00 00    lea    0x1a64(%rip),%rdi        # 4034c0 <_IO_stdin_used+0x4c0>
  401a5c:       e8 bf f6 ff ff          callq  401120 <puts@plt>
  401a61:       48 8d 3d 88 1a 00 00    lea    0x1a88(%rip),%rdi        # 4034f0 <_IO_stdin_used+0x4f0>
  401a68:       e8 b3 f6 ff ff          callq  401120 <puts@plt>
  401a6d:       48 8d 3d c4 1a 00 00    lea    0x1ac4(%rip),%rdi        # 403538 <_IO_stdin_used+0x538>
  401a74:       e8 a7 f6 ff ff          callq  401120 <puts@plt>
  401a79:       48 8b 15 90 47 00 00    mov    0x4790(%rip),%rdx        # 406210 <rp_>
  401a80:       48 8b 45 f8             mov    -0x8(%rbp),%rax
  401a84:       48 29 c2                sub    %rax,%rdx
  401a87:       48 8b 05 82 47 00 00    mov    0x4782(%rip),%rax        # 406210 <rp_>
  401a8e:       48 89 c6                mov    %rax,%rsi
  401a91:       48 8d 3d e8 1a 00 00    lea    0x1ae8(%rip),%rdi        # 403580 <_IO_stdin_used+0x580>
  401a98:       b8 00 00 00 00          mov    $0x0,%eax
  401a9d:       e8 9e f6 ff ff          callq  401140 <printf@plt>
  401aa2:       48 8b 15 67 47 00 00    mov    0x4767(%rip),%rdx        # 406210 <rp_>
  401aa9:       48 8b 45 f8             mov    -0x8(%rbp),%rax
  401aad:       48 29 c2                sub    %rax,%rdx
  401ab0:       48 89 d0                mov    %rdx,%rax
  401ab3:       48 83 c0 08             add    $0x8,%rax
  401ab7:       ba 77 00 00 00          mov    $0x77,%edx
  401abc:       48 89 c6                mov    %rax,%rsi
  401abf:       48 8d 3d 02 1b 00 00    lea    0x1b02(%rip),%rdi        # 4035c8 <_IO_stdin_used+0x5c8>
  401ac6:       b8 00 00 00 00          mov    $0x0,%eax
  401acb:       e8 70 f6 ff ff          callq  401140 <printf@plt>
  401ad0:       48 8b 15 39 47 00 00    mov    0x4739(%rip),%rdx        # 406210 <rp_>
  401ad7:       48 8b 45 f8             mov    -0x8(%rbp),%rax
  401adb:       48 29 c2                sub    %rax,%rdx
  401ade:       48 89 d0                mov    %rdx,%rax
  401ae1:       48 83 e8 77             sub    $0x77,%rax
  401ae5:       48 89 c6                mov    %rax,%rsi
  401ae8:       48 8d 3d 31 1b 00 00    lea    0x1b31(%rip),%rdi        # 403620 <_IO_stdin_used+0x620>
  401aef:       b8 00 00 00 00          mov    $0x0,%eax
  401af4:       e8 47 f6 ff ff          callq  401140 <printf@plt>
  401af9:       48 8d 3d 70 1b 00 00    lea    0x1b70(%rip),%rdi        # 403670 <_IO_stdin_used+0x670>
  401b00:       e8 1b f6 ff ff          callq  401120 <puts@plt>
  401b05:       48 8d 3d 94 1b 00 00    lea    0x1b94(%rip),%rdi        # 4036a0 <_IO_stdin_used+0x6a0>
  401b0c:       e8 0f f6 ff ff          callq  401120 <puts@plt>
  401b11:       48 8d 3d e8 1b 00 00    lea    0x1be8(%rip),%rdi        # 403700 <_IO_stdin_used+0x700>
  401b18:       e8 03 f6 ff ff          callq  401120 <puts@plt>
  401b1d:       48 8d 3d 1c 1c 00 00    lea    0x1c1c(%rip),%rdi        # 403740 <_IO_stdin_used+0x740>
  401b24:       e8 f7 f5 ff ff          callq  401120 <puts@plt>
  401b29:       48 8d 3d 50 1c 00 00    lea    0x1c50(%rip),%rdi        # 403780 <_IO_stdin_used+0x780>
  401b30:       e8 eb f5 ff ff          callq  401120 <puts@plt>
  401b35:       48 8d 3d 8c 1c 00 00    lea    0x1c8c(%rip),%rdi        # 4037c8 <_IO_stdin_used+0x7c8>
  401b3c:       e8 df f5 ff ff          callq  401120 <puts@plt>
  401b41:       48 8d 3d c8 1c 00 00    lea    0x1cc8(%rip),%rdi        # 403810 <_IO_stdin_used+0x810>
  401b48:       e8 d3 f5 ff ff          callq  401120 <puts@plt>
  401b4d:       48 8d 3d 04 1d 00 00    lea    0x1d04(%rip),%rdi        # 403858 <_IO_stdin_used+0x858>
  401b54:       e8 c7 f5 ff ff          callq  401120 <puts@plt>
  401b59:       48 8d 3d 48 1d 00 00    lea    0x1d48(%rip),%rdi        # 4038a8 <_IO_stdin_used+0x8a8>
  401b60:       e8 bb f5 ff ff          callq  401120 <puts@plt>
  401b65:       48 8d 3d 94 1d 00 00    lea    0x1d94(%rip),%rdi        # 403900 <_IO_stdin_used+0x900>
  401b6c:       e8 af f5 ff ff          callq  401120 <puts@plt>
  401b71:       48 8d 3d d8 1d 00 00    lea    0x1dd8(%rip),%rdi        # 403950 <_IO_stdin_used+0x950>
  401b78:       e8 a3 f5 ff ff          callq  401120 <puts@plt>
  401b7d:       48 8d 3d 1c 1e 00 00    lea    0x1e1c(%rip),%rdi        # 4039a0 <_IO_stdin_used+0x9a0>
  401b84:       b8 00 00 00 00          mov    $0x0,%eax
  401b89:       e8 b2 f5 ff ff          callq  401140 <printf@plt>

  primo input
  401b8e:       48 8d 85 6c ff ff ff    lea    -0x94(%rbp),%rax
  401b95:       48 89 c6                mov    %rax,%rsi
  401b98:       48 8d 3d 25 1e 00 00    lea    0x1e25(%rip),%rdi        # 4039c4 <_IO_stdin_used+0x9c4>
  401b9f:       b8 00 00 00 00          mov    $0x0,%eax
  401ba4:       e8 f7 f5 ff ff          callq  4011a0 <__isoc99_scanf@plt>
  401ba9:       8b 85 6c ff ff ff       mov    -0x94(%rbp),%eax
  401baf:       85 c0                   test   %eax,%eax
  401bb1:       75 1f                   jne    401bd2 <challenge+0x36e>
  401bb3:       48 8d 0d 3e 24 00 00    lea    0x243e(%rip),%rcx        # 403ff8 <__PRETTY_FUNCTION__.5654>
  401bba:       ba 8b 00 00 00          mov    $0x8b,%edx
  401bbf:       48 8d 35 01 1e 00 00    lea    0x1e01(%rip),%rsi        # 4039c7 <_IO_stdin_used+0x9c7>
  401bc6:       48 8d 3d 02 1e 00 00    lea    0x1e02(%rip),%rdi        # 4039cf <_IO_stdin_used+0x9cf>
  401bcd:       e8 7e f5 ff ff          callq  401150 <__assert_fail@plt>

  secondo input
  401bd2:       48 8d 3d 05 1e 00 00    lea    0x1e05(%rip),%rdi        # 4039de <_IO_stdin_used+0x9de>
  401bd9:       b8 00 00 00 00          mov    $0x0,%eax
  401bde:       e8 5d f5 ff ff          callq  401140 <printf@plt>
  401be3:       48 8d 85 68 ff ff ff    lea    -0x98(%rbp),%rax
  401bea:       48 89 c6                mov    %rax,%rsi
  401bed:       48 8d 3d d0 1d 00 00    lea    0x1dd0(%rip),%rdi        # 4039c4 <_IO_stdin_used+0x9c4>
  401bf4:       b8 00 00 00 00          mov    $0x0,%eax
  401bf9:       e8 a2 f5 ff ff          callq  4011a0 <__isoc99_scanf@plt>
  401bfe:       8b 85 68 ff ff ff       mov    -0x98(%rbp),%eax
  401c04:       85 c0                   test   %eax,%eax
  401c06:       75 1f                   jne    401c27 <challenge+0x3c3>
  401c08:       48 8d 0d e9 23 00 00    lea    0x23e9(%rip),%rcx        # 403ff8 <__PRETTY_FUNCTION__.5654>
  401c0f:       ba 8e 00 00 00          mov    $0x8e,%edx
  401c14:       48 8d 35 ac 1d 00 00    lea    0x1dac(%rip),%rsi        # 4039c7 <_IO_stdin_used+0x9c7>
  401c1b:       48 8d 3d da 1d 00 00    lea    0x1dda(%rip),%rdi        # 4039fc <_IO_stdin_used+0x9fc>
  401c22:       e8 29 f5 ff ff          callq  401150 <__assert_fail@plt>


moltiplicazione
  401c27:       8b 95 68 ff ff ff       mov    -0x98(%rbp),%edx
  401c2d:       8b 85 6c ff ff ff       mov    -0x94(%rbp),%eax
  401c33:       0f af c2                imul   %edx,%eax
  401c36:       83 f8 07                cmp    $0x7,%eax
  401c39:       76 1f                   jbe    401c5a <challenge+0x3f6>
  401c3b:       48 8d 0d b6 23 00 00    lea    0x23b6(%rip),%rcx        # 403ff8 <__PRETTY_FUNCTION__.5654>
  401c42:       ba 8f 00 00 00          mov    $0x8f,%edx
  401c47:       48 8d 35 79 1d 00 00    lea    0x1d79(%rip),%rsi        # 4039c7 <_IO_stdin_used+0x9c7>
  401c4e:       48 8d 3d bb 1d 00 00    lea    0x1dbb(%rip),%rdi        # 403a10 <_IO_stdin_used+0xa10>
  401c55:       e8 f6 f4 ff ff          callq  401150 <__assert_fail@plt>

altre cose
  401c5a:       8b 85 6c ff ff ff       mov    -0x94(%rbp),%eax
  401c60:       89 c0                   mov    %eax,%eax
  401c62:       48 89 45 f0             mov    %rax,-0x10(%rbp)
  401c66:       8b 85 68 ff ff ff       mov    -0x98(%rbp),%eax
  401c6c:       89 c2                   mov    %eax,%edx
  401c6e:       48 8b 45 f0             mov    -0x10(%rbp),%rax
  401c72:       48 0f af c2             imul   %rdx,%rax
  401c76:       48 89 45 f0             mov    %rax,-0x10(%rbp)
  401c7a:       48 8b 45 f0             mov    -0x10(%rbp),%rax
  401c7e:       48 89 c6                mov    %rax,%rsi
  401c81:       48 8d 3d c0 1d 00 00    lea    0x1dc0(%rip),%rdi        # 403a48 <_IO_stdin_used+0xa48>
  401c88:       b8 00 00 00 00          mov    $0x0,%eax
  401c8d:       e8 ae f4 ff ff          callq  401140 <printf@plt>
  401c92:       48 8b 45 f0             mov    -0x10(%rbp),%rax
  401c96:       48 89 c6                mov    %rax,%rsi
  401c99:       48 8d 3d d0 1d 00 00    lea    0x1dd0(%rip),%rdi        # 403a70 <_IO_stdin_used+0xa70>
  401ca0:       b8 00 00 00 00          mov    $0x0,%eax
  401ca5:       e8 96 f4 ff ff          callq  401140 <printf@plt>
  401caa:       48 8b 45 f8             mov    -0x8(%rbp),%rax
  401cae:       48 89 c6                mov    %rax,%rsi
  401cb1:       48 8d 3d e8 1d 00 00    lea    0x1de8(%rip),%rdi        # 403aa0 <_IO_stdin_used+0xaa0>
  401cb8:       b8 00 00 00 00          mov    $0x0,%eax
  401cbd:       e8 7e f4 ff ff          callq  401140 <printf@plt>
  401cc2:       48 8b 45 f0             mov    -0x10(%rbp),%rax
  401cc6:       48 8d 50 89             lea    -0x77(%rax),%rdx
  401cca:       48 8b 4d f8             mov    -0x8(%rbp),%rcx
  401cce:       48 8b 45 f0             mov    -0x10(%rbp),%rax
  401cd2:       48 01 c8                add    %rcx,%rax
  401cd5:       48 89 c6                mov    %rax,%rsi
  401cd8:       48 8d 3d 09 1e 00 00    lea    0x1e09(%rip),%rdi        # 403ae8 <_IO_stdin_used+0xae8>
  401cdf:       b8 00 00 00 00          mov    $0x0,%eax
  401ce4:       e8 57 f4 ff ff          callq  401140 <printf@plt>
  401ce9:       48 8b 55 f8             mov    -0x8(%rbp),%rdx
  401ced:       48 8b 45 f0             mov    -0x10(%rbp),%rax
  401cf1:       48 01 c2                add    %rax,%rdx
  401cf4:       48 8b 05 15 45 00 00    mov    0x4515(%rip),%rax        # 406210 <rp_>
  401cfb:       48 29 c2                sub    %rax,%rdx
  401cfe:       48 89 d0                mov    %rdx,%rax
  401d01:       48 89 c6                mov    %rax,%rsi
  401d04:       48 8d 3d 35 1e 00 00    lea    0x1e35(%rip),%rdi        # 403b40 <_IO_stdin_used+0xb40>
  401d0b:       b8 00 00 00 00          mov    $0x0,%eax
  401d10:       e8 2b f4 ff ff          callq  401140 <printf@plt>
  401d15:       48 8d 3d 64 1e 00 00    lea    0x1e64(%rip),%rdi        # 403b80 <_IO_stdin_used+0xb80>
  401d1c:       e8 ff f3 ff ff          callq  401120 <puts@plt>
  401d21:       48 8d 3d b0 1e 00 00    lea    0x1eb0(%rip),%rdi        # 403bd8 <_IO_stdin_used+0xbd8>
  401d28:       e8 f3 f3 ff ff          callq  401120 <puts@plt>
  401d2d:       48 8b 15 dc 44 00 00    mov    0x44dc(%rip),%rdx        # 406210 <rp_>
  401d34:       48 8b 45 f8             mov    -0x8(%rbp),%rax
  401d38:       48 29 c2                sub    %rax,%rdx
  401d3b:       48 8b 05 ce 44 00 00    mov    0x44ce(%rip),%rax        # 406210 <rp_>
  401d42:       48 89 c6                mov    %rax,%rsi
  401d45:       48 8d 3d cc 1e 00 00    lea    0x1ecc(%rip),%rdi        # 403c18 <_IO_stdin_used+0xc18>
  401d4c:       b8 00 00 00 00          mov    $0x0,%eax
  401d51:       e8 ea f3 ff ff          callq  401140 <printf@plt>
  401d56:       48 8d 35 0a fa ff ff    lea    -0x5f6(%rip),%rsi        # 401767 <win>
  401d5d:       48 8d 3d f4 1e 00 00    lea    0x1ef4(%rip),%rdi        # 403c58 <_IO_stdin_used+0xc58>
  401d64:       b8 00 00 00 00          mov    $0x0,%eax
  401d69:       e8 d2 f3 ff ff          callq  401140 <printf@plt>
  401d6e:       48 8d 3d 1b 1f 00 00    lea    0x1f1b(%rip),%rdi        # 403c90 <_IO_stdin_used+0xc90>
  401d75:       e8 a6 f3 ff ff          callq  401120 <puts@plt>
  401d7a:       48 8d 3d 57 1f 00 00    lea    0x1f57(%rip),%rdi        # 403cd8 <_IO_stdin_used+0xcd8>
  401d81:       e8 9a f3 ff ff          callq  401120 <puts@plt>
  401d86:       48 8d 3d 73 1f 00 00    lea    0x1f73(%rip),%rdi        # 403d00 <_IO_stdin_used+0xd00>
  401d8d:       e8 8e f3 ff ff          callq  401120 <puts@plt>
  401d92:       48 8d 3d b7 1f 00 00    lea    0x1fb7(%rip),%rdi        # 403d50 <_IO_stdin_used+0xd50>
  401d99:       e8 82 f3 ff ff          callq  401120 <puts@plt>
  401d9e:       48 8b 45 f0             mov    -0x10(%rbp),%rax
  401da2:       48 89 c6                mov    %rax,%rsi
  401da5:       48 8d 3d ec 1f 00 00    lea    0x1fec(%rip),%rdi        # 403d98 <_IO_stdin_used+0xd98>
  401dac:       b8 00 00 00 00          mov    $0x0,%eax
  401db1:       e8 8a f3 ff ff          callq  401140 <printf@plt>
  401db6:       48 8b 55 f0             mov    -0x10(%rbp),%rdx
  401dba:       48 8b 45 f8             mov    -0x8(%rbp),%rax
  401dbe:       48 89 c6                mov    %rax,%rsi
  401dc1:       bf 00 00 00 00          mov    $0x0,%edi
  401dc6:       e8 a5 f3 ff ff          callq  401170 <read@plt>
  401dcb:       89 45 ec                mov    %eax,-0x14(%rbp)
  401dce:       83 7d ec 00             cmpl   $0x0,-0x14(%rbp)
  401dd2:       79 2c                   jns    401e00 <challenge+0x59c>
  401dd4:       e8 37 f3 ff ff          callq  401110 <__errno_location@plt>
  401dd9:       8b 00                   mov    (%rax),%eax
  401ddb:       89 c7                   mov    %eax,%edi
  401ddd:       e8 de f3 ff ff          callq  4011c0 <strerror@plt>
  401de2:       48 89 c6                mov    %rax,%rsi
  401de5:       48 8d 3d d4 1f 00 00    lea    0x1fd4(%rip),%rdi        # 403dc0 <_IO_stdin_used+0xdc0>
  401dec:       b8 00 00 00 00          mov    $0x0,%eax
  401df1:       e8 4a f3 ff ff          callq  401140 <printf@plt>
  401df6:       bf 01 00 00 00          mov    $0x1,%edi
  401dfb:       e8 b0 f3 ff ff          callq  4011b0 <exit@plt>
  401e00:       8b 45 ec                mov    -0x14(%rbp),%eax
  401e03:       89 c6                   mov    %eax,%esi
  401e05:       48 8d 3d d8 1f 00 00    lea    0x1fd8(%rip),%rdi        # 403de4 <_IO_stdin_used+0xde4>
  401e0c:       b8 00 00 00 00          mov    $0x0,%eax
  401e11:       e8 2a f3 ff ff          callq  401140 <printf@plt>
  401e16:       48 8d 3d db 1f 00 00    lea    0x1fdb(%rip),%rdi        # 403df8 <_IO_stdin_used+0xdf8>
  401e1d:       e8 fe f2 ff ff          callq  401120 <puts@plt>
  401e22:       48 8b 15 df 43 00 00    mov    0x43df(%rip),%rdx        # 406208 <sz_>
  401e29:       48 8b 05 e8 43 00 00    mov    0x43e8(%rip),%rax        # 406218 <sp_>
  401e30:       48 89 d6                mov    %rdx,%rsi
  401e33:       48 89 c7                mov    %rax,%rdi
  401e36:       e8 7b f4 ff ff          callq  4012b6 <DUMP_STACK>
  401e3b:       48 8d 3d df 1f 00 00    lea    0x1fdf(%rip),%rdi        # 403e21 <_IO_stdin_used+0xe21>
  401e42:       e8 d9 f2 ff ff          callq  401120 <puts@plt>
  401e47:       48 8b 45 f8             mov    -0x8(%rbp),%rax
  401e4b:       48 89 c6                mov    %rax,%rsi
  401e4e:       48 8d 3d eb 1f 00 00    lea    0x1feb(%rip),%rdi        # 403e40 <_IO_stdin_used+0xe40>
  401e55:       b8 00 00 00 00          mov    $0x0,%eax
  401e5a:       e8 e1 f2 ff ff          callq  401140 <printf@plt>
  401e5f:       48 8b 05 92 43 00 00    mov    0x4392(%rip),%rax        # 4061f8 <bp_>
  401e66:       48 89 c6                mov    %rax,%rsi
  401e69:       48 8d 3d f8 1f 00 00    lea    0x1ff8(%rip),%rdi        # 403e68 <_IO_stdin_used+0xe68>
  401e70:       b8 00 00 00 00          mov    $0x0,%eax
  401e75:       e8 c6 f2 ff ff          callq  401140 <printf@plt>
  401e7a:       48 8b 05 8f 43 00 00    mov    0x438f(%rip),%rax        # 406210 <rp_>
  401e81:       48 89 c6                mov    %rax,%rsi
  401e84:       48 8d 3d 0d 20 00 00    lea    0x200d(%rip),%rdi        # 403e98 <_IO_stdin_used+0xe98>
  401e8b:       b8 00 00 00 00          mov    $0x0,%eax
  401e90:       e8 ab f2 ff ff          callq  401140 <printf@plt>
  401e95:       48 8b 05 74 43 00 00    mov    0x4374(%rip),%rax        # 406210 <rp_>
  401e9c:       48 8b 00                mov    (%rax),%rax
  401e9f:       48 89 c6                mov    %rax,%rsi
  401ea2:       48 8d 3d 2f 20 00 00    lea    0x202f(%rip),%rdi        # 403ed8 <_IO_stdin_used+0xed8>
  401ea9:       b8 00 00 00 00          mov    $0x0,%eax
  401eae:       e8 8d f2 ff ff          callq  401140 <printf@plt>
  401eb3:       48 8d 35 ad f8 ff ff    lea    -0x753(%rip),%rsi        # 401767 <win>
  401eba:       48 8d 3d 4f 20 00 00    lea    0x204f(%rip),%rdi        # 403f10 <_IO_stdin_used+0xf10>
  401ec1:       b8 00 00 00 00          mov    $0x0,%eax
  401ec6:       e8 75 f2 ff ff          callq  401140 <printf@plt>
  401ecb:       bf 0a 00 00 00          mov    $0xa,%edi
  401ed0:       e8 2b f2 ff ff          callq  401100 <putchar@plt>
  401ed5:       48 8d 3d 54 20 00 00    lea    0x2054(%rip),%rdi        # 403f30 <_IO_stdin_used+0xf30>
  401edc:       e8 3f f2 ff ff          callq  401120 <puts@plt>
  401ee1:       48 8d 3d 98 20 00 00    lea    0x2098(%rip),%rdi        # 403f80 <_IO_stdin_used+0xf80>
  401ee8:       e8 33 f2 ff ff          callq  401120 <puts@plt>
  401eed:       be 00 00 00 00          mov    $0x0,%esi
  401ef2:       48 8d 3d c0 20 00 00    lea    0x20c0(%rip),%rdi        # 403fb9 <_IO_stdin_used+0xfb9>
  401ef9:       b8 00 00 00 00          mov    $0x0,%eax
  401efe:       e8 3d f2 ff ff          callq  401140 <printf@plt>
  401f03:       48 8d 3d c3 20 00 00    lea    0x20c3(%rip),%rdi        # 403fcd <_IO_stdin_used+0xfcd>
  401f0a:       e8 11 f2 ff ff          callq  401120 <puts@plt>
  401f0f:       b8 00 00 00 00          mov    $0x0,%eax
  401f14:       c9                      leaveq 
  401f15:       c3                      retq