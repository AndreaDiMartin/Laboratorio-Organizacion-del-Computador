.data
n:	.byte	'#'
s:	.byte	' '

shipU:	.byte 	'A'
shipD:	.byte 	'V'
shipL:	.byte	'<'
shipR:	.byte 	'>'

life:	.word 3
life_pos: .space 4

field:	.word 	n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n
	.word	n,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,n
	.word	n,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,n
	.word	n,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,n
	.word	n,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,n
	.word	n,s,s,s,s,s,s,s,s,s,s,s,shipU,s,s,s,s,s,s,s,s,s,s,s,n
	.word	n,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,n
	.word	n,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,n
	.word	n,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,n
	.word 	n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n
	
newline:	.asciiz "\n"

Fila1:	.asciiz		"#########################\n"
Fila2:	.asciiz 	"#                       #/n"
Fila3:	.asciiz 	"#                       #/n"
Fila4:	.asciiz 	"#                       #/n"
Fila5:	.asciiz 	"#                       #/n"
Fila6:	.asciiz 	"#                       #/n"
Fila7:	.asciiz 	"#                       #/n"
Fila8:	.asciiz 	"#                       #/n"
Fila9:	.asciiz 	"#                       #/n"
Fila10:	.asciiz 	"#########################/n"
		
.text 
j main

# Funcion para conocer la posicion de la nave dentro del campo
calc_pos:
	# direccion del campo en $a0
	# indice de la fila en $a1
	# indice de la columna en $a2
	
	# addr = baseAddr + (rowIndex*colSize + colIndex )*dataSize
	
	mul $t1 $a1, 25
	add $t1, $t1, $a2
	mul $t1 $t1 4
	
	# sumo con la direccion del campo y pongo el resultado en $v0
	add $v0 $a0 $t1
	# retorno
	jr $ra

# Funcion para girar la nave 90 grados a la derecha
turn_right:
	# $a0 tiene la posicion de la nave mediante la direccion del campo
	lw $a0 ($a0)
	lb $a1 ($a0)
	
	beq $a1 'A', turnR
	beq $a1 '>', turnV
	beq $a1 'V', turnL
	beq $a1 '<', turnA
	turnR:
		li $t1, '>'
		j endif
	turnV:
		li $t1, 'V'
		j endif
	turnL:
		li $t1, '<'
		j endif
	turnA:
		li $t1, 'A'
		j endif
	endif:
	# actualizo la posicion de la nave
	sb $t1 ($a0)
	# retorno
	jr $ra

# Funcion para girar la nave 90 grados a la izquierda
turn_left:
	# $a0 tiene la posicion de la nave mediante la direccion del campo
	lw $a0 ($a0)
	lb $a1 ($a0)
	
	beq $a1 'A', turnInL
	beq $a1 '<', turnInV
	beq $a1 'V', turnInR
	beq $a1 '>', turnInA
	turnInR:
		li $t1, '>'
		j endif1
	turnInV:
		li $t1, 'V'
		j endif1
	turnInL:
		li $t1, '<'
		j endif1
	turnInA:
		li $t1, 'A'
		j endif1
	endif1:
	# actualizo la posicion de la nave
	sb $t1 ($a0)
	# retorno
	jr $ra
	
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
			
# Funcion para imprimir el status del juego
print_status:
	# $a0 contiene la cantidad de vidas
	move $t1 $a0	# lo copiamos en %t1
	
	# A su vez, guardemos el contenido del registro $ra en otro registro
	move $s0 $ra
	# Ahora, mostremos en la consola el siguiente string: "Pts:1024"
	li $a0 'P'
	jal print_char
	li $a0 't'
	jal print_char
	li $a0 's'
	jal print_char
	li $a0 ':'
	jal print_char
	li $a0 '0'
	jal print_char
	
	# despues, imprimimos 10 espacios seguidos 
	li $t2 0
	# comienzo de un loop
	# este loop imprimira 10 espacios seguidos en la consola MMIO
	loop: beq $t2 12, endloop # mientras $t2 no llegue a 10
		# imprimo un espacio
		li $a0 ' '
		jal print_char
		# aumento el contador a 1
		addi $t2 $t2 1 	
		j loop
	endloop:
	
	# finalmente, imprimimos la cantidad de vidas
	li $a0 'V'
	jal print_char
	li $a0 'i'
	jal print_char
	li $a0 'd'
	jal print_char
	li $a0 'a'
	jal print_char
	li $a0 ':'
	jal print_char
	li $a0 '0'
	jal print_char
	addi $t1, $t1, 48	# convertimos el numero en un caracter
	move $a0 $t1
	jal print_char
	
	# imprimir un salto de linea
	li $a0,10 
	jal print_char
	
	# retorno 
	move $ra $s0
	jr $ra

# Funcion para mostrar el campo en la consola de MMIO
print_field:
	# %a0 tiene la direccion del campo que se va a mostrar en la consola MMIO
	move $s0 $a0	# copio esa direccion en el registro $s0
	li $s1 10	# coloco 10 en el registro $s1
	li $s2 25	# y coloco 25 en el registro $s2
	
	# copio el contenido del registro $ra en $t9
	move $t9 $ra
	
	li $t1 0 	# inicializo el contador en 0
	# comienzo de un loop anidado
	# el loop1 itera sobre las filas de la matriz field
	# el loop2 itera sobre las columnas de la matriz field
	loop1:	beq $t1, $s1, endloop1
		# si el contador $t1 aun no ha llegado a 10
		li $t2 0	# inicializo otro contador en 0
		loop2:	beq $t2 $s2, endloop2	
			# si el contador $t2 no ha llegado a 25
			# cargo el caracter en $a0
			lw $t3 ($s0)
			lb $a0 ($t3)
			# llamo a la funcion de print_char
			jal print_char
	
			# aumento el contador a 1
			addi $t2, $t2, 1
			# voy al siguiente caracter
			addi $s0, $s0, 4
			j loop2
		endloop2:
		# si ya se termino de imprimir todos los caracteres de una fila
		# imprimo una nueva linea
		li $a0,10 
		jal print_char
		# voy a la siguiente fila y aumento el contador a 1
		addi $t1, $t1, 1
		j loop1
	endloop1:
		# retorno
		move $ra $t9
		jr $ra

#Funcion para generar una vida extra
xtrlifegen:
	#Hallamos un numero pseudoaleatorio para la columna en la que estara la vida extra
	li $v0,42
	li $a0,1
	li $a3, 24
	syscall #random it range
	move $s3,$a0 #La columna se guarda en $s1 
	#Hallamos un numero pseudoaleatorio para la fila en la que estara la vida extra
	li $v0,42
	li $a0,1
	li $a3, 8 #La columna se guarda en $s2
	syscall #random it range
	move $s4,$a0
	#Movemos la columna a $a2 y fila a $a1 para calcular la posicion de la vida extra en el campo
	move $a2,$s3
	move $a1,$s4
	jal calc_pos
	sw $v0,life_pos
	#Retornamos al programa main
	jr $ra
	
	

main:
	#Numeros pseudoaleatorios
	li $v0,30
	syscall #time
	move $a3, $a0
	li $a0,1
	li $v0, 40
	syscall #Set seed
	
	# posicion inicial de la nave (5x12)
	la $a0 field
	li $a1 5
	li $a2 12
	jal calc_pos
	move $s7 $v0   # en el registro $s7 tiene la posicion de la nave segun la direccion del campo
	
	#imprimir el caracter
	#lw $a0 ($s7)
	#lb $a0 ($a0)
	#li $v0 11
	#syscall
	
	# generar la vida y guardarlo en el campo
	
	# generar asteroides
	
	# guardar los asteroides en el campo
	
	# imprimir el status inicial del juego
	li $a0 3 	# vida inicial = 3
	jal print_status
	
	# imprimo el campo inicial del juego
	la $a0 field
	jal print_field

	# velocidad inicial del jugador
	li $s1 1 
	
	# inicio del juego
	continue: li $t0, 0xffff0000	# cargo en $t0 la direccion del Receiver control
		# verifico si esta listo para imprimir
		waiting: lw $t1, 0($t0)		
			# aplico la mascara de bit
			andi $t1, $t1, 0x01	
			# si no esta listo, vuelvo a verificar
			beqz $t1, waiting  
			# si esta listo, leo la entrada por teclado
			# y  guardo el caracter en el registro %s0
			lw $s0 4($t0) 
			
			# si el caracter introducido es un P o un p entonces se detiene el juego
			beq $s0 'P', pause
			beq $s0 'p', pause
			
			# si el caracter es un W o un w, entonces se aumenta la velocidad a 1
			beq $s0 'W', verify
			beq $s0 'w', verify
			j endverify
			verify:
				# verifico que la velocidad actual no sea la velocidad maxima
				blt $s1 3, change_speed
				# si es menor o igual a 0, no hago ningun cambio 
				j no_change
				# si no es la velocidad maxima, incremento la velocidad a 1
				change_speed:	move $a0 $s1
				      		addi $s1, $s1, 1
				  		# luego de incrementar la velocidad, leo el siguiente caracter
				  		# que va a introducir el usuario
						j continue
			endverify:			
			# si el caracter es un S o un s, disminuyo la velocidad a 1
			beq $s0 'S', verify2
			beq $s0, 's', verify2
			j endverify2
			verify2:
				# verifico que $s1 no sea un 0, ya que de alli no se puede disminuir 
				# mas la velocidad actual
				bgtz $s1, change_speed2
				# si es menor o igual a 0, no hago ningun cambio 
				j no_change
				# si es mayor a 0, disminuyo la velocidad a 1
				change_speed2:
						move $a0 $s1
						subi $s1, $s1, 1
						# leo el siguiente caracter que introduce el usuario
						j continue
			endverify2:
			# si el caracter es un A o un a, giro la nave a la izquierda 90 grados
			beq $s0 'A', turnLeft
			beq $s0 'a', turnLeft
			# si el caracter es un D o un d, giro la nave a la derecha 90 grados
			beq $s0 'D', turnRight
			beq $s0 'd', turnRight
			# si el caracter introducido no es ninguna de estas opciones
			# no hago ningun cambio
			j no_change
			
			turnRight: 	# llamo a la funcion turn_right
					move $a0 $s7
					jal turn_right
					# luego imprimo el nuevo campo del juego 
					la $a0 field
					jal print_field
					# leo el siguiente caracter por teclado
					j continue
					
			turnLeft: 	# llamo a la funcion turn_left
					move $a0 $s7
					jal turn_left
					# imprimo el nuevo campo del juego
					la $a0 field
					jal print_field
					# leo el siguiente caracter por teclado
					j continue
				
		no_change:	
		j continue
	pause:
end:
	li $v0 10
	syscall
	
	
	
