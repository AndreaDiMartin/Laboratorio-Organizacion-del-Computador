#Tarea 2
#Ejercicio 4(Complementario): Realizar un programa a que pida al usuario que introduzca dos números, y realice su multiplicación,
#empleando el algoritmo de sumas sucesivas.

.data

mensaje: .asciiz "Introduzca 2 numeros: "
resultado: .word 0

.text

main:
	la $a0,mensaje # Imprime el mensaje
	li $v0,4
	syscall
	
	li $v0, 5
	syscall
	add $s0, $v0, $zero #gruarda input1 en s0

	li $v0, 5 
	syscall
	add $s1, $v0, $zero #guarda input2 en s1
	
	li $t0, 0 
	li $t1,0  #sumas sucesivas
	
loop: 
	beq $s1, $t0, endloop
	add $t1,$t1,$s0
	add $s1,$s1,-1
	j loop
endloop:

sw  $t1, resultado
	
#SYSCALL: PRINT_INT
LI $v0 1
LW $a0 resultado
SYSCALL 

