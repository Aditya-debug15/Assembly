.data
n: 
.int 18  #1
.int 15 #2
.int 46 #3
.int 24 #4
.int 35 #5
.int -4 #6

.text
.global main
main:
mov n@GOTPCREL(%rip) , %r9
movl $0 ,%r10d
# so %r10d = 0 impiles not sorted whereas %r10d =1 implies sorted

.check:
cmpl $0 ,%r10d
je .function
jne .exit

.function:
movl $1 ,%r10d
# start odd sort
movl $1 ,%r11d
.check_odd:
cmpl $30 ,%r11d
jle .odd
jg .even_set

.odd:
movl (%r9d,%r11d,4) ,%r13d # array[i]
movl %r11d ,%ecx
inc %ecx
movl (%r9d,%ecx,4) ,%r14d # array[i+1]
cmpl %r14d ,%r13d
jg .swap
jle .back_to_odd_sort

.swap:
movl %r14d ,(%r9,%r11,4)
movl %r13d ,(%r9,%rcx,4)
movl $0 ,%r10d
jmp .back_to_odd_sort

.back_to_odd_sort:
addl $2 ,%r11d
jmp .check_odd

.even_set:
movl $0 ,%r11d
jmp .check_even

.check_even:
cmpl $30 ,%r11d
jle .even
jg .check

.even:
movl (%r9,%r11,4) ,%r13d # array[i]
movl %r11d ,%ecx
inc %ecx
movl (%r9,%rcx,4) ,%r14d # array[i+1]
cmpl %r14d ,%r13d
jg .swap_even
jle .back_to_even_sort

.swap_even:
movl %r14d ,(%r9,%r11,4)
movl %r13d ,(%r9,%rcx,4)
movl $0 ,%r10d
jmp .back_to_even_sort

.back_to_even_sort:
addl $2 ,%r11d
jmp .check_even

.exit:
ret
