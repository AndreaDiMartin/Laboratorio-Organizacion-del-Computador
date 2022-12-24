######################################
#CI3815 - Organizacion del Computador#
#            LED Displays            #
#        Ana Shek - 19-10096         #
#      Andrea Diaz - 18-10826        #
######################################
# Dado una cadena de texto introducido por el usuario
# este programa mostrara dicho texto en el formato que 
# aparecen las letras en un LED display
.data
space: .asciiz "      "
spacebtwletters: .asciiz " "

# FONT 6x6
a1: .asciiz "  ##  "
a2: .asciiz " #  # "
a3: .asciiz "#    #"
a4: .asciiz "######"
a5: .asciiz "######"
a6: .asciiz "#    #"

b1: .asciiz "##### "
b2: .asciiz "#    #"
b3: .asciiz "######"
b4: .asciiz "#    #"
b5: .asciiz "#    #"
b6: .asciiz "##### "

c1: .asciiz " #### "
c2: .asciiz "##   #"
c3: .asciiz "##    "
c4: .asciiz "##    "
c5: .asciiz "##   #"
c6: .asciiz " #### "

d1: .asciiz "##### "
d2: .asciiz "#    #"
d3: .asciiz "#    #"
d4: .asciiz "#    #"
d5: .asciiz "#    #"
d6: .asciiz "##### "

e1: .asciiz " #####"
e2: .asciiz "#     "
e3: .asciiz "######"
e4: .asciiz "#     "
e5: .asciiz "#     "
e6: .asciiz "######"

f1: .asciiz "######"
f2: .asciiz "#     "
f3: .asciiz "##### "
f4: .asciiz "#     "
f5: .asciiz "#     "
f6: .asciiz "#     "

g1: .asciiz " #### "
g2: .asciiz "#    #"
g3: .asciiz "#     "
g4: .asciiz "# ####"
g5: .asciiz "#    #"
g6: .asciiz " #### "

h1: .asciiz "#    #"
h2: .asciiz "#    #"
h3: .asciiz "######"
h4: .asciiz "######"
h5: .asciiz "#    #"
h6: .asciiz "#    #"

i1: .asciiz "######"
i2: .asciiz "  ##  "
i3: .asciiz "  ##  "
i4: .asciiz "  ##  "
i5: .asciiz "  ##  "
i6: .asciiz "######"

j1: .asciiz "######"
j2: .asciiz "#    #"
j3: .asciiz "     #"
j4: .asciiz "     #"
j5: .asciiz "#    #"
j6: .asciiz " #### "

k1: .asciiz "##  ##"
k2: .asciiz "## ## "
k3: .asciiz "####  "
k4: .asciiz "######"
k5: .asciiz "##   #"
k6: .asciiz "##   #"

l1: .asciiz "#     "
l2: .asciiz "#     "
l3: .asciiz "#     "
l4: .asciiz "#     "
l5: .asciiz "#     "
l6: .asciiz "######"

m1: .asciiz "#    #"
m2: .asciiz "##  ##"
m3: .asciiz "# ## #"
m4: .asciiz "#    #"
m5: .asciiz "#    #"
m6: .asciiz "#    #"

n1: .asciiz "#    #"
n2: .asciiz "##   #"
n3: .asciiz "# #  #"
n4: .asciiz "#  # #"
n5: .asciiz "#   ##"
n6: .asciiz "#    #"

o1: .asciiz " #### "
o2: .asciiz "#    #"
o3: .asciiz "#    #"
o4: .asciiz "#    #"
o5: .asciiz "#    #"
o6: .asciiz " #### "

p1: .asciiz "##### "
p2: .asciiz "#    #"
p3: .asciiz "######"
p4: .asciiz "##### "
p5: .asciiz "#     "
p6: .asciiz "#     "

q1: .asciiz " #### "
q2: .asciiz "#    #"
q3: .asciiz "#    #"
q4: .asciiz "#  # #"
q5: .asciiz "#   ##"
q6: .asciiz " #### "

r1: .asciiz "##### "
r2: .asciiz "#    #"
r3: .asciiz "##### "
r4: .asciiz "# ##  "
r5: .asciiz "#  ## " 
r6: .asciiz "#   ##" 

s1: .asciiz " #####"
s2: .asciiz "#     "
s3: .asciiz " #####"
s4: .asciiz " #####"
s5: .asciiz "     #"
s6: .asciiz "##### "

t1: .asciiz "######"
t2: .asciiz "  ##  "
t3: .asciiz "  ##  "
t4: .asciiz "  ##  "
t5: .asciiz "  ##  "
t6: .asciiz "  ##  "

u1: .asciiz "#    #"
u2: .asciiz "#    #"
u3: .asciiz "#    #"
u4: .asciiz "#    #"
u5: .asciiz "#    #"
u6: .asciiz " #### "

v1: .asciiz "#    #"
v2: .asciiz "#    #"
v3: .asciiz "#    #"
v4: .asciiz "#    #"
v5: .asciiz "#    #"
v6: .asciiz "  #   "

w1: .asciiz "#    #"
w2: .asciiz "#    #"
w3: .asciiz "# ## #"
w4: .asciiz "# ## #"
w5: .asciiz "# ## #"
w6: .asciiz " #  # "

x1: .asciiz "#    #"
x2: .asciiz "#    #"
x3: .asciiz " #  # "
x4: .asciiz "  ##  "
x5: .asciiz " #  # "
x6: .asciiz "#    #"

y1: .asciiz "#    #"
y2: .asciiz "#    #"
y3: .asciiz " #  # "
y4: .asciiz "  ##  "
y5: .asciiz "  #   "
y6: .asciiz "  #   "

z1: .asciiz "######"
z2: .asciiz "    # "
z3: .asciiz "   #  "
z4: .asciiz "  #   "
z5: .asciiz " #    "
z6: .asciiz "######"

# Guardamos las letras en un arreglo 2d
letters: .word a1,b1,c1,d1,e1,f1,g1,h1,i1,j1,k1,l1,m1,n1,o1,p1,q1,r1,s1,t1,u1,v1,w1,x1,y1,z1
	.word a2,b2,c2,d2,e2,f2,g2,h2,i2,j2,k2,l2,m2,n2,o2,p2,q2,r2,s2,t2,u2,v2,w2,x2,y2,z2
	.word a3,b3,c3,d3,e3,f3,g3,h3,i3,j3,k3,l3,m3,n3,o3,p3,q3,r3,s3,t3,u3,v3,w3,x3,y3,z3
	.word a4,b4,c4,d4,e4,f4,g4,h4,i4,j4,k4,l4,m4,n4,o4,p4,q4,r4,s4,t4,u4,v4,w4,x4,y4,z4
	.word a5,b5,c5,d5,e5,f5,g5,h5,i5,j5,k5,l5,m5,n5,o5,p5,q5,r5,s5,t5,u5,v5,w5,x5,y5,z5
	.word a6,b6,c6,d6,e6,f6,g6,h6,i6,j6,k6,l6,m6,n6,o6,p6,q6,r6,s6,t6,u6,v6,w6,x6,y6,z6
	
address :.space 24
newline :.asciiz "\n"

prompt:.asciiz "Introduzca una cadena de texto (max 100 caracteres): "
string: .space 101  # 101 ya que un byte pertenece al salto de linea 

.text
j main

# Funcion para dividir el string de modo que al mostrar el resultado en la pantalla
# cada linea no supere los 120 caracteres
separate: 
	# $a1 contiene la direccion del string 
	# $a2 contiene la direccion del arreglo donde se va a guardar cada parte del string dividido
	li $t0 0			# contador de cuantas veces es que va a dividirse el string
	# comienzo de un loop anidado
	# el loop externo o loop1 va a guardar en la memoria las direcciones de cada parte del string dividido
	# mientras que el loop interno o loop2 va a hacer la separacion del string
	loop1: 
		# queremos guardar en la memoria las direcciones de cada parte del string dividido
		# como cada letra ocupa 6 espacios mas un espacio adicional para el intermedio 
		# entre dos letras, entonces 120 / 7 = 17 
		# es decir cada linea va a tener solamente 17 caracteres
		
		# creamos un espacio para guardar las direcciones, 
		# el tamaño sera de 68 bytes, ya que 17x4 = 68
		li $v0 9
		la $a0 68
		syscall
		# guardamos la direccion del espacio creado a la memoria 
		sw $v0 0($a2)
		# y tambien lo vamos a copiar en %s1
		move $s1 $v0
		
		# aumentamos a 1 al contador $t0
		addi $t0 $t0 1
		
		# comenzamos a dividir el string
		li $t1 120
		loop2:
			# comprobar si aun hay espacio disponible para colocar las siguientes letras
			# si no hay espacio disponible, hara un break de este loop2 para colocar
			# las letras en otro espacio
			blt $t1, 6, endloop2
				# si aun hay espacio
				# leemos un caracter del string y lo almacenamos en el registro $t2
				lb $t2 ($a1)
		
				# comprobar si estamos en la pernultima letra
				# si es la pernultima letra, eso quiere decir, que nos encontramos
				# con el salto de linea o "\n"
				
				# cargamos tambien el siguiente caracter del string en %t3
				lb $t3 1($a1)
				beqz $t3, endloop1
					# en caso de que no sea un salto de linea:
					# lo guardamos en la direccion del espacio creado
					sb $t2, ($s1)
					# disminuimos $t1 en 7
					subi $t1 $t1 7
					# vamos al siguiente caracter
					addi $a1, $a1, 1
					# y tambien actualizamos la direccion del espacio creado
					addi $s1, $s1, 1
			# volvemos al loop 2
			j loop2
		endloop2:
		# si ya se cargo el caracter 17 en el espacio creado
		# aumentamos $a2 en 4 para crear el siguiente espacio 
		addi $a2 $a2 4
		# volvemos al loop1
		j loop1
	endloop1:
		# movemos el contador al registro $v1
		move $v1, $t0
		# retornamos al programa principal si ya hemos terminado de dividir el string
		jr $ra	

# Funcion para agregar nodos a una lista enlazada
add_node: 
	# $a1 contiene la direccion del nodo
	# $a2 contiene el dato que vamos a guardar en dicho nodo		
	sw $a2 0($a1)
	
	# creamos un nuevo nodo de 8 bytes
	li $v0 9
	li $a0 8
	syscall
	# ahora vamos a indicar que dicho nodo va a apuntar al nuevo nodo creado
	sw $v0 4($a1)
	
	# actualizamos el apuntador
	move $a1 $v0
	# retornamos al programa principal
	jr $ra

# Funcion para crear la tabla de hash donde cada elemento representa cada linea en que se va a mostrar 
# la cadena de texto en la pantalla
create_htable:
	# $a1 contiene la direccion de la tabla de hash 	
	# $a2 contiene la cantidad de veces en que se dividio el string
	# $a3 contiene la direccion donde se guardo el arreglo con elementos de las partes divididas del string
	move $s3 $a1
	move $s4 $a2
	move $s5 $a3
	
	li $t0 0	# iterador inicializado en 0 para loop3
	# comienzo de otro loop anidado
	# en el loop3 (el mas externo) itera sobre cada bloque del string dividido
	# en el loop4 (el interno) va a crear una raiz de una lista enlazada para cada una de las 6 filas 
	# ya que cada letra tiene un tamaño de 6x6 y posteriormente colocarlos en la tabla de hash
	# en el loop5 (del mismo nivel que el loop4) va a iterar por cada caracter que pertenezca al correspondiente
	# bloque del string dividido
	# dentro de este mismo loop5, va a tener un loop interno llamado loop6 que va a guardar las direcciones 
	# de las 6 filas de la letra en la lista enlazada correspondiente
	loop3:	bge $t0, $s4, endloop3
		# mientras $t0 sea menor a $s4 (el numero en que se dividio el string)
		# vamos a iterar por cada parte del string dividido
		
		# primero, se crea una raiz para cada una de las 6 filas
		# calculo la direccion para colocar cada raiz en la tabla de hash
		li $t1 0			
		loop4:	bge $t1, 6, endloop4
			# mientras $t1 sea menor a 6
			# creamos un nuevo nodo
			li $v0 9
			li $a0 8
			syscall
			# guardamos esta raiz en la tabla de hash
			sw $v0 ($s3)
			# actualizamos la tabla de hash
			addi $s3, $s3, 4
			
			# ahora necesitamos guardar estas raices en algunos de los registros del CPU
			beq $t1, 0, row1
			beq $t1, 1, row2
			beq $t1, 2, row3
			beq $t1, 3, row4
			beq $t1, 4, row5
				# si $t1 es 5 (es decir la fila 6), muevo la direccion de la raiz 
				# en el registro $t9
				move $t9 $v0
				j endifRow
				# en caso de que sea la fila 5, lo movemos al registro $t8
				row5:	
					move $t8 $v0
					j endifRow
				# si es la fila 4, lo movemos al registro $t7
				row4: 
					move $t7 $v0
					j endifRow
				# si es la fila 3, lo movemos al registro $t6
				row3: 
					move $t6 $v0
					j endifRow
				# si es la fila 2, lo movemos al registro $s7
				row2: 
					move $s7 $v0
					j endifRow
				# si es la fila 1, lo movemos al registro $s6
				row1: 
					move $s6 $v0
					j endifRow	
			endifRow:	
				# voy a la siguiente fila
				addi $t1, $t1, 1
				j loop4
		endloop4:
		
		# cargamos en $t1 la direccion de un bloque del string dividido
		lw $t1, 0($s5)
		loop5:
			# cargamos en $t2 la letra que se almaceno en la direccion $t1 
			lb $t2 0($t1)
			
			# comprobar si ya se termino de iterar las letras 
			beqz $t2, endloop5
				# si aun hay letras por iterar
				
				# comprobar ahora si esta en minusculas
				bge $t2, 97, lowercase
					# si esta en mayusculas, le restamos 65
					# para que por ejemplo: A = 0, B = 1, C = 2, ..., Z=25
					subi $t2, $t2, 65
					j endif
				lowercase:
					# y si es minusculas, le restamos 97
					subi $t2, $t2, 97 
				endif:
					
				li $t3 0
				# enlazar las 6 filas de la letra a la tabla de hash
				loop6:	bge $t3 6, endloop6
					#comprobar si la letra es un espacio
					#como el espacio es igual a 32, es menor a 97
					#esto quiere decir que se restó con 65, y $t2 = -33
					bgez $t2, itsno_space
						# en caso de que sea un espacio
						# cargamos en $a2 la direccion de la variable space = "      "
						la $a2 space
						j endif2
					itsno_space:
						# vamos a hacer estos calculos para buscar la direccion
						# de la letra en el arreglo 2d
						la $a2 letters

						mul $t4 $t3, 26
						add $t4, $t4, $t2
						
						mul $t4, $t4, 4
						add $t4, $a2, $t4
						lw $a2 ($t4)
					endif2: 
					
					# llamamos a la funcion agregarNodo
				    	# pero antes guardemos el return address en $t4
					move $t4 $ra
					
					beq $t3 0, fila1
					beq $t3, 1, fila2
					beq $t3, 2, fila3
					beq $t3, 3, fila4
					beq $t3, 4, fila5
						# si estamos en la fila 6
						move $a1 $t9
						jal add_node
						# actualizamos el apuntador
						move $t9 $v0
				    		j endif3
					fila5: 
				    		# si estamos en la fila 5
				    		move $a1 $t8
				    		jal add_node
				    		# actualizamos el apuntador
				    		move $t8 $v0
				    		j endif3
				   	fila4:
				    		# si estamos en la fila 4
				    		move $a1 $t7
				    		jal add_node
				    		# actualizamos el apuntador
				    		move $t7 $v0
				    		j endif3
				    	fila3:
				    		# si estamos en la fila 3
				    		move $a1 $t6
				    		jal add_node
				    		# actualizamos el apuntador
				    		move $t6 $v0
				    		j endif3
				    	fila2:
				    		# si estamos en la fila 2
				    		move $a1 $s7
				    		jal add_node
				    		# actualizamos el apuntador
				    		move $s7 $v0
				    		j endif3
				    	fila1:
				    		# si estamos en la fila 1
				    		move $a1 $s6
				    		jal add_node
				    		# actualizamos el apuntador
				    		move $s6 $v0
				    		j endif3
				    	endif3:
				    	
					# copiamos el contenido de $t4 en return address
					move $ra $t4
					
				    	# vamos a enlazar a la siguiente fila de la letra en la lista enlazada
				    	# correspondiente
				    	addi $t3, $t3, 1
		       			j loop6
				endloop6:
				# luego de enlazar las 6 filas de la letra correspondiente
				# vamos a la siguiente letra
				addi $t1, $t1, 1
				j loop5
		endloop5:
		# despues de terminar de enlazar las 6 filas de cada letra para el bloque del string dividido
		# nos movemos al siguiente bloque 
		addi $s5 $s5 4
		# y aumentamos $t0 a 1
		addi $t0 $t0 1	
		j loop3
	endloop3:
		jr $ra

#Funcion para imprimir la letras en la pantalla	
print_letters:
	# $a1 contiene las divisiones de las letras
	# $s3 contiene la direccion de la tabla de hash
	#Para la cantidad de divisiones de letras que necesita
	#El loop más exterior se encarga de las diviones del string y mueve lo que resta del string a la siguiente fila 
	#El loop dentro de el se encarga de mover la fila a imprimir, por lo tanto comienza en 0 y llega hasta 6, ya que cada letra cuenta con 6 lineas
	#El loop más interno se encarga de imprimir la fila de la letra correspondiente y se mueve por letras, se inicializa en 120 y se detiene cuando el indice es menor a 6 
	#pues no puede contener más caracteres
	li $t0,0 #Iterador inicializado en 0 
	#Loop para la impresión de las filas 
	loop9: beq $a1,$t0,endloop9
		li $t2,0
		#Loop para la impresion de las columnas 
		loop7: beq $t2,6,endloop7
			lw $t9, ($a3) #Carga la dirección del primer nodo a $t9
			li $t5,120
			loop8: blt $t5, 6,endloop8
				lw $a0, ($t9)      #Carga en a0 la direccion de la fila de la letra correspondiente
				beq $a0,0,endloop8 #Verfica que no sea la ultima la columna
				li $v0 4
				syscall        #Imprime la primera fila de la primera letra
				addi $t5,$t5,-6 #Le resta 6 al contador 
		
				la $a0 spacebtwletters  #Espacio entre las letras 
				syscall
				addi $t5,$t5,-1  #Le resta 1 al contador 
			
				addi $t9 $t9 4   #Carga en $t9 la dirección de la siguiente fila, es decir, la siguiente dirección del primer nodo
				lw $t9 ($t9)
				syscall
				j loop8
			endloop8:
			la $a0 newline  #Salto de linea
			syscall
			
			addi $t2,$t2,1 #Suma 1 al iterador 
			addi $a3,$a3,4 #Busca la siguiente letra 
			j loop7
		endloop7:
		addi $t0,$t0,1 #Suma 1 al iterador exterior
		
		la $a0 newline  #Salto de linea
		syscall
		j loop9
	endloop9:
	jr $ra
	

# Programa principal	
main: 
	# imprimimos el prompt que pide al usuario para que introduzca la cadena de texto
	li $v0 4
	la $a0 prompt
	syscall

	# leemos la cadena de texto
	li $v0 8
	la $a0 string
	li $a1 100
	syscall

	# vamos a separar el string primero
	# cargamos en $a1 la direccion del string
	la $a1 string	 	
	# luego cargamos en $a2 la direccion del arreglo "address"
	# este arreglo va a guardar las direcciones de cada parte del string dividido
	la $a2 address
	# vamos a copiar $a2 en $s0 para usarlo despues
	move $s0 $a2
	
	# llamamos a la funcion para separar el string y contar cuantas veces es que se dividio el string
	jal separate
	# movemos el $v1 a $s1
	move $s1 $v1
	
	# creamos una tabla de hash con listas enlazadas para almacenar cada linea en que se va a mostrar 
	# la cadena de texto en la pantalla
	# y cada nodo va a tener un tamaño de 8 bytes, ya que los datos que llevara son el tipo de la linea
	# segun su letra y numero de fila, y tambien llevara la direccion del siguiente nodo
	
	# para cada parte del string dividido necesitamos multiplicarlo por 6, ya que cada una tendra 6 lineas
	# y tenemos que multiplicarlo luego por 4, ya que esta tabla de hash va a almacenar direcciones
	li $v0 9
	mul $a0 $s1 6
	mul $a0 $a0 4
	syscall
	# guardamos la direccion de la tabla de hash en $s2
	move $s2 $v0
	
	# llamamos a la funcion para construir la tabla de hash
	move $a1 $s2	# direccion de la tabla de hash 	
	move $a2 $s1	# la cantidad de veces en que se dividio el string
	move $a3 $s0    # direccion donde se guardo el arreglo con elementos de las partes divididas del string
	jal create_htable
	
	# llamammos a la funcion para imprimir las letras en la pantalla
	move $a1 $s4 #la cantidad de veces que se separó el string
	move $a3 $s2 #la dirección de la tabla de hash
	jal print_letters
	
	
end: 	li $v0 10	#Fin del  programa principal 
        syscall
