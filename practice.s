.data
n: 
.int 9  #1
.int 18 #2
.int 65 #3
.int 34 #4
.int 35 #5
.int 23 #6
.int 27 #7
.int 19 #8
.int 10 #9
.int -4 #10
.int 11 #11
.int 29 #12
.int 11 #13
.int 10 #14

.text
.global main
main:
mov n@GOTPCREL(%rip) , %r9
movl (%r9) ,%eax
movl $8 ,%r11d
movl (%r9,%r11) ,%eax
