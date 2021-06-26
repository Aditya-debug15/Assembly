.text
.global hamming

# i will get 2 numbers 
# will use quad so no need to worry about signed
# rdi -->a
# rsi -->b
hamming:
movq %rdi ,%rcx
# now rcx contains a
xorq %rsi ,%rcx
# now rcx contains a ^ b
movq $0 ,%rax


.check:
cmpq $0 ,%rcx
jg .perform
jle .exit

.perform:
movq %rcx, %r10
andq $1, %r10
addq %r10, %rax
shrq $1,%rcx
jmp .check

.exit:
ret

