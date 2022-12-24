#Proyecto 2 

.data

A: .asciiz "LLLL"
newline :.asciiz "\n"
space: .asciiz "  "
viAd: .asciiz "#"


.text
j main

# Funcion para imprimir un caracter en la consola de MMIO
print_char: 
	#$a0 tiene el caracter que se va a imprimir en la consola MMIO
	li $t0, 0xffff0008	# cargo en $t0 la direccion del Transmitter control
	wait:	# verifico si esta listo para imprimir
		lw $v0, 0($t0)		
		# aplico la mascara de bit
		andi $v0, $v0, 0x01	
		beqz $v0, wait	# si no esta listo, vuelvo a verificar
			# si esta listo, muestro el caracter
			sw $a0, 4($t0)	# guardo el caracter en 0xffff000c (Transmitter data)
			jr $ra # retorno el programa


#Funcion para generar la velocidad mediante un numero aleatorio en el rango 0;25
velocidad:	
	#Numeros pseudoaleatorios
	li $v0,30
	syscall #time
	move $a3, $a0
	li $a0,1
	li $v0, 40
	syscall #Set seed
	li $v0,42
	li $a0,1
	li $a3, 4
	syscall #random it range
	move $s0,$a0 #La velocidad se guarda en $s0
	jr $ra # retorno el programa

# Funcion para generar la posicion mediante un numero aleatorio en el rango 0;25
posicion:
	#Numeros pseudoaleatorios
	li $v0,30
	syscall #time
	move $a3, $a0
	li $a0,1
	li $v0, 40
	li $v0,42
	li $a0,1
	li $a3, 25
	syscall #random it range
	move $s1,$a0 #La columna se guarda en $s1
	
	#Fila 
	#Numeros pseudoaleatorios
	li $v0,30
	syscall #time
	move $a3, $a0
	li $a0,1
	li $v0, 40
	li $v0,42
	li $a0,1
	li $a3, 8 #La columna se guarda en $s2
	syscall #random it range
	move $s2,$a0
	
	jr $ra # retorno el programa
#Funcion para mover el asteroide

asteroidMove:
	li $t9,1    #Inicializa el iterador en $t9
	loop1: 	beq $t9,$a3, endloop1
		
		#addi $t0,1
		j loop1
	endloop1:
	li $t9,1
	loop2: beq $t9,$a3, endloop2
		
		j loop2
	endloop2:
	LI $v0 4
	la $a0, A
	SYSCALL
	jr $ra # retorno el programa

#Funcion para general el asteroide

asteroidGenerate:
	jal posicion
	move $s6,$s1 #La columna se guarda en $s6
	move $s7,$s2 #La fila se guarda en $s7
	li $t9,1    #Inicializa el iterador en $t0
	#Loop segun la posicion en la fila
	#Primera fila del asteroide
	loop3: 	beq $t9,$6, endloop3
		li $a0, ' '
		jal print_char
		addi $t9,$t9,1
		j loop3
	endloop3:
	li $t9,1
	loop4: beq $t9,$s7, endloop4
		li $a0, '\n'
		jal print_char
		addi $t9,$t9,1
		j loop4
	endloop4:
	#Imprime el asteroide
	lb $a0, A
	jal print_char
	lb $a0, A
	jal print_char
	lb $a0, A
	jal print_char
	lb $a0, A
	jal print_char
	li $a0, '\n'
	jal print_char
	#Segunda fila del asteroide
	li $t9,1
	loop5: beq $t9,$s7, endloop5
		li $a0, '\n'
		jal print_char
		addi $t9,$t9,1
		j loop5
	endloop5:
	#Imprime el asteroide
	lb $a0, A
	jal print_char
	lb $a0, A
	jal print_char
	lb $a0, A
	jal print_char
	lb $a0, A
	jal print_char
	li $a0, '\n'
	jal print_char
	#Tercera fila del asteroide
	li $t9,1
	loop6: beq $t9,$s7, endloop6
		li $a0, '\n'
		jal print_char
		addi $t9,$t9,1
		j loop6
	endloop6:
	#Imprime el asteroide
	lb $a0, A
	jal print_char
	lb $a0, A
	jal print_char
	lb $a0, A
	jal print_char
	lb $a0, A
	jal print_char
	SYSCALL
	jr $ra # retorno el programa

#Funcion para calcular la posiicon de un caracter en el campo
calc_pos:
	# direccion del campo en $a0
	# indice de la fila en $a3
	# indice de la columna en $a2
	
	# addr = baseAddr + (rowIndex*colSize + colIndex )*dataSize
	
	mul $t1 $a1, 25
	add $t1, $t1, $a2
	mul $t1 $t1 4
	
	# sumo con la direccion del campo y pongo el resultado en $v0
	add $v0 $a0 $t1
	# retorno
	jr $ra
	
#Funcion para generar vidas adicionales
xtraLifeGen:
	jal posicion #Genera una poscion aleatoria
	move $s3,$s1 #La columna se guarda en $s3
	move $s4,$s2 #La fila se guarda en $s4
	#move $a3,$s3
	#move $a2,$s4
	#jal calc_pos
	#move $s7 $v0   # en el registro $s7 tiene la posicion de la vida extra segun la direccion del campo
	
	# A su vez, guardemos el contenido del registro $ra en otro registro
	move $s0 $ra
	#Movemos a la fila en la que debe estar
	li $t9,1
	loop7: 	beq $t9,$s4, endloop7
		li $a0, '\n'
		jal print_char
		addi $t9,$t9,1
		j loop7
	endloop7:
	#Movemos a la columna en la que debe estar
	li $t9,1
	loop8: beq $t9,$s3, endloop8
		li $a0,' '
		jal print_char
		addi $t9,$t9,1
		j loop8
	endloop8:

	li $a0,'@'
	jal print_char
	#move $ra $s0
	jr $ra # retorno el programa

#Funcion para mover la vida extra
xtraLifeMove:
	#Le añade el valor de la velocidad a la posicion 
	add $s4,$s4,$s5
	add $s3, $s3, $s5
	li $t9,100
	mul $9,$t9,$s5
	# A su vez, guardemos el contenido del registro $ra en otro registro
	#move $s0 $ra
	#Movemos a la fila en la que debe estar
	ble $s4, 4, upxtrlf
	bge $s4, 4, downxtrlf
	upxtrlf:
		ble $s3,17, upleftxtrlf
		bge $s3,17, uprightxtrlf
	downxtrlf:
		ble $s3,17, downleftxtrlf
		bge $s3,17, downrightxtrlf
		upleftxtrlf:
			sub $t2 $t1 $t9
			sub $t2 $t2 $t0
			blt $t2, 104, last_rowxtrlf
			sub $t2 $t1 $t9
			li $t3 $t9
			sub $t2 $t1 $t0
			subi $t2 $t2 4
			div $t2 $t3
			mfhi $t2
			beqz $t2, last_columnxtrlf
				subi $t2 $t1 4
				j endconditionxtrlf
			last_column:
				addi $t2 $t1 88
				j endconditionxtrlf
			last_row:
				addi $t2 $t1 700
				j endconditionxtrlf
			
		
		uprightxtrlf;
			sub $t2 $t1 $t9
			sub $t2 $t2 $t0
			blt $t2, 104, last_rowxtrlf
			sub $t2 $t1 $t9
			li $t3 100 
			sub $t2 $t1 $t0
			addi $t2 $t2 8
			div $t2 $t3
			mfhi $t2
			beqz $t2, first_columnxtrlf
				addi $t2 $t1 4
				j endconditionxtrlf
			first_columnxtrlf:
				subi $t2 $t1 88
				j endconditionxtrlf
			
		downleftxtrlf:
			add $t2 $t1 $t9
			addi $t0, $t0, 900
			bge $t2 $t0, first_rowxtrlf
				j endconditionxtrlf
			first_rowxtrlf:
				subi $t2 $t1 700
				j endconditionxtrlf
			# mover la nave una casilla hacia la izquierda
			li $t3 100
			sub $t2 $t1 $t0
			subi $t2 $t2 4
			div $t2 $t3
			mfhi $t2
			beqz $t2, last_columnxtrlf
				subi $t2 $t1 4
				j endconditionxtrlf
			last_columnxtrlf:
				addi $t2 $t1 88
				j endconditionxtrlf
			
		downrightxtrlf
			add $t2 $t1 $t9
			addi $t0, $t0, 900
			bge $t2 $t0, first_rowxtrlf
				j endconditionxtrlf
			first_rowxtrlf:
				subi $t2 $t1 700
				j endconditionxtrlf
			li $t3 100 
			sub $t2 $t1 $t0
			addi $t2 $t2 8
			div $t2 $t3
			mfhi $t2
			beqz $t2, first_columnxtrlf
				addi $t2 $t1 4
				j endconditionxtrlf
		first_columnxtrlf:
			subi $t2 $t1 88
			j endconditionxtrlf
	endconditionxtrlf: 
		#almaceno el caracter de la posicion inicial en la posicion de llegada
		lw $t3 ($t1)
		sw $t3 ($t2)
	
		# y la posicion inicial se deja vacia
		la $t3 s
		sw $t3 ($t1)
		jr $ra
	#li $t9,1
	#loop9: 	beq $t9,$s4, endloop9
	#	li $a0, '@'
	#	jal print_char
	#	addi $t9,$t9,1
#		j loop9
#	endloop9:
#	#Movemos a la columna en la que debe estar
#	li $t9,1
#	loop10: beq $t9,$s3, endloop10
#		li $a0,' '
#		jal print_char
#		addi $t9,$t9,1
#		j loop10
#	endloop10:
	
#	li $a0,'@'
#	jal print_char
#	move $ra $s0
#	jr $ra # retorno el programa
	
	

main:

#jal xtraLifeGen #Genera un vida extra

#jal velocidad #Calcula una velocidad aleatoria para la vida extra
#move $s5, $s0 #La guarda en $s5

#jal xtraLifeMove

jal asteroidGenerate
