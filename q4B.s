.text
.global frequency
# rdi count array
# rsi input array
# Ascii value of A is 65 in decimal
# Ascii value of Z is 90
frequency:
movl $26 ,%r11d
movl $32 ,%r12d
movl $0 ,%r9d # so %r9d will store the position
# initialize count array to 0
movl $0 ,%r10d 
.work:
movl $0 ,(%rdi,%r10,4)
inc %r10d
cmpl %r10d ,%r11d
jg .work

.start:
cmpl %r9d ,%r12d
jg .check # if 32> the position where i am in the string i will have to do check
jle .exit

.check:
cmpb $90 ,(%rsi,%r9,1)
jle .check2
jg .back

.check2:
cmpb $65 ,(%rsi,%r9,1)
jge .action
jl .back
.action:
movzbl (%rsi,%r9,1) ,%r13d
sub $65 ,%r13b
movl (%rdi,%r13,4) ,%r10d
inc %r10d
movl %r10d ,(%rdi,%r13,4)
jmp .back

.back:
inc %r9d
jmp .start
.exit:
ret
