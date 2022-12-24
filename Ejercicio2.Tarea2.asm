#Tarea 2
#Ejercicio 2: Indique el número de vocales que hay en un texto dado.

.data

palabra: .ascii "hola"
suma: .word 0

.text


main:	
#cargar vocales 
	li $s1, 97 #a
	li $s2, 101 #e
	li $s3, 105 #i
	li $s4, 111 #o
	li $s5, 117 #u
#Cargar palabra al registro y contadores
	la $a1, palabra
	li $s0, 0
	li $t2, 0
	li $t3, 3

loop:
	beq $t2,$t3, endloop
	addi $a1,$a1,1
	lbu $a0,($a1)
#Condicional
	beq $a0, $s1, True1
	
	beq $a0, $s2, True1
	
	beq $a0, $s3, True1
	
	beq $a0, $s4, True1
	
	beq $a0, $s5, True1
	b 	Fin  
		
	
True1:
	addi $s0,$s0, 1   
	sw $s0, suma  
	 

Fin:
	addi $t2, $t2,1

j loop

endloop:

	
#SYSCALL: PRINT_INT
LI $v0 1
LW $a0 suma
SYSCALL 
	
	

