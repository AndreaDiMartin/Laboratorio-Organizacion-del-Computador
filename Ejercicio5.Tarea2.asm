#Tarea 2:
#Ejercicio 5: Realice un programa que permita convertir un valor de temperatura en grados centígrados a grados
#Fahrenheit. Utilice operaciones de punto flotante cuando sea necesario. 

.data
centigrado: .float 23.5
fahrenheit: .float 0
constante: .float 1.8
constante2: .float 32

.text

#Realiza las conversiones pertinentes

main:
lwc1 $f0,centigrado
lwc1 $f1,constante
lwc1 $f2,constante2

mul.s $f0,$f0,$f1
add.s $f0,$f0,$f2

swc1  $f0, fahrenheit
	
#SYSCALL: PRINT_float
LI $v0 2
Lwc1 $f12 fahrenheit
SYSCALL 
