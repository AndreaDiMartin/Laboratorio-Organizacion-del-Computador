#Tarea 2 
#Ejercicio 6: Dada una lista de números positivos y negativos, calcular cuantos números positivos y cuantos números
#negativos hay en la lista. : 

	.data
lista: .word 1,2,-3,-5

	.text

main:
	la $a0, lista
	li $t1, 0 #Contador de numeros positivos
	li $t2, 0 #Contador de numeros negativos
	li $s0, 1 #iterador
	li $s1, 5 #Condicion de parada

	add $a0,$a0,$t3
	lb $a1,($a0)
	
loop: beq $s0,$s1, endloop
	
	bgt $a1, $zero, positivo
	bgt $zero, $a1, negativo
	

positivo: addi $t1, $t1,1 
	b fin

negativo: addi $t2, $t2,1

fin:
	addi, $s0,$s0,1
	addi $a0,$a0,4
	lb $a1,($a0)

j loop

endloop:
	
#En el registro se puede ver que por $t1 hay 2 numeros positivos y por $t2 hay dos numeros negativos
