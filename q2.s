.data
n:
.int 7   #0
.int 11  #1
.int 12  #2
.int 14  #3
.int 15  #4
.int 17  #5
.int 17  #6
.int 19  #7
.int 23  #8
.int 23  #9
.int 31  #10
.int 45  #11
.int 65  #12
.int 67  #13
.int 89  #14
.int 92  #15
.int 92  #16
.int 92  #17
.int 99  #18
.int 110 #19
.int 111 #20
.int 112 #21
.int 123 #22
.int 124 #23
.int 129 #24
.int 225 #25
.int 253 #26
.int 263 #27
.int 273 #28
.int 287 #29
.int 290 #30
.int 300 #31
# n is the array

m:
.int 11
# m is the element to be searched

.text
.global main
main:
# %eax contains the position
# %ebx contains the total iteration
mov n@GOTPCREL(%rip) , %r9
mov m@GOTPCREL(%rip) , %r10
movl (%r10) ,%r10d
movl $0 ,%r11d
movl $31 ,%r12d
movl $0, %ebx

# r9-> base address of array
# r10-> element to be searched
# r11-> 0 low and r12-> n-1 / high

.check: #begin the while loop(low<=high)
cmpl %r11d, %r12d
jge .perform
jl .exit

.perform:
incl %ebx
movl %r12d, %r13d
subl %r11d, %r13d
shrl $1, %r13d
addl %r11d, %r13d
cmpl (%r9,%r13,4), %r10d
je .equal
jl .less
jg .great

.equal:
movl %r13d, %eax
ret

.less:
decl %r13d
movl %r13d, %r12d
jmp .check

.great:
incl %r13d
movl %r13d, %r11d
jmp .check

.exit:
movl $-1, %eax
ret
