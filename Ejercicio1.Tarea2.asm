#Tarea 2:
#Ejercicio 1: Dada una lista de numeros enteros almacenados de forma consecutiva en la memoria, calcular la suma de los elementos de la lista

	.data
	
	
lista: .word 1,2,8
	
	.text

main: 	
	lw $t0, lista
	lw $t1 lista + 4
	lw $t2 lista + 8

	add $t0, $t0, $t1
	add $t0, $t0, $t2
	sw  $t0, lista
	
#SYSCALL: PRINT_INT
LI $v0 1
LW $a0 lista
SYSCALL 
