.text
.global rotate
# rdi is the base address of array

rotate:
movl $0, %r9d

.outerloop:
movl %r9d, %r10d
movl $7, %r11d
subl %r9d, %r11d
cmpl $4, %r9d
jl .innerloop
jge .exit

.innerloop:
cmpl %r11d, %r10d
jl .swap
jge .inc_i

.swap:
movl $7, %r12d
subl %r10d, %r12d

movl $32, %r8d
imull %r9d, %r8d
leaq (%rdi,%r8), %r13
leaq (%r13,%r10,4), %r13 # address of A[i][j]
movl (%r13), %ecx #value of A[i][j]
movl $32, %r8d
imull %r10d, %r8d
leaq (%rdi,%r8), %r14
leaq (%r14,%r11,4), %r14 # address of A[j][N-1-i]
movl (%r14), %edx # value of A[j][N-1-i]
movl %edx, (%r13)
movl $32, %r8d
imull %r11d, %r8d
leaq (%rdi,%r8), %r13
leaq (%r13,%r12,4), %r13 # address of A[N-1-i][N-1-j]
movl (%r13), %r15d # value of A[N-1-i][N-1-j]
movl %r15d, (%r14)
movl $32, %r8d
imull %r12d, %r8d
leaq (%rdi,%r8), %r14
leaq (%r14,%r9,4), %r14 # address of A[N-1-j][i]
movl (%r14), %edx # value of A[N-1-j][i]
movl %edx, (%r13)
movl %ecx, (%r14)
incl %r10d
jmp .innerloop

.inc_i:
incl %r9d
jmp .outerloop

.exit:
ret
