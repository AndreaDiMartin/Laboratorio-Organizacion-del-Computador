.data
A: .word 7
B: .word 8
C: .word 9
S: .asciiz "hola mundo"

.text
LI $t0 14
LW $t1 B
LW $t2 C
ADD $t3 $t1 $t2
SW  $t3 B

#SYSCALL: PRINT_INT
LI $v0 1
LW $a0 B
SYSCALL 

#SYSCALL: PRINT_STRING
LI $v0 4
LA $a0 S
SYSCALL

