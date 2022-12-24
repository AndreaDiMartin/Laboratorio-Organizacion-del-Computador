#Tarea 2
#Ejercicio 3: Dado un entero positivo, imprima su representación en base 2.

.data
numero: .word 13
#El binario de 13 es 1101
binario : .space 16

.text
main:
	lw $t2, numero
	li, $t3, 1   #numero de parada cuando el numero dé 1
	li, $t4, 2   #division por 2
	li, $t5, 0   #resto
	la, $a2, binario   #Carga el arreglo
	li, $s0, 1
	li, $s1, 1
	li, $s2, 2
	li, $s3, 3
	li, $s4, 4
	
loop:
	beq $t2,$t3,endloop
#Operacion de division
	div $t2, $t4
	mflo $t2
	mfhi $t5
#Escoge dónde poner el concionete de la division
	beq $s0, $s1, True1
	beq $s0, $s2, True2
	beq $s0, $s3, True3
	beq $t5, $t3, True4
	
True1:
	sw $t5, 12($a2)
	b 	fin

True2:
	sw $t5, 8($a2)
	b 	fin
True3:
	sw $t5, 4($a2)
	
True4:
	sw $t5, 0($a2)
	b 	fin

fin: 
addi $s0,$s0,1 #suma al apuntador del numero

j loop


endloop:

	
#SYSCALL: PRINT_INT
LI $v0 1
LW $a0 0($a2)
SYSCALL

LI $v0 1
LW $a0 4($a2)
SYSCALL  

LI $v0 1
LW $a0 8($a2)
SYSCALL 

LI $v0 1
LW $a0 12($a2)
SYSCALL 
