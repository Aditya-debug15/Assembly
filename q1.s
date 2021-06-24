.data
n: 
.int 7   #0
.int 11  #1
.int 34  #2
.int 14  #3
.int 190  #4
.int 17  #5
.int 17  #6
.int -4  #7
.int 23  #8
.int 23  #9
.int 31  #10
.int 45  #11
.int 89  #12
.int 67  #13
.int 56  #14
.int 92  #15
.int 57  #16
.int 92  #17
.int 99  #18
.int 110 #19
.int 211 #20
.int 112 #21
.int 34 #22
.int 124 #23
.int 9 #24
.int -5 #25
.int 253 #26
.int 170 #27
.int 273 #28
.int 28 #29
.int 29 #30
.int 300 #31


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
movl (%r9,%r11,4) ,%r13d # array[i]
movl %r11d ,%ecx
inc %ecx
movl (%r9,%rcx,4) ,%r14d # array[i+1]
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
