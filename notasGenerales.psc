

// Se creo un SubProceso de menu
SubProceso menu
	Escribir ""
	Escribir "¿Que desea realizar?"
	Escribir "[1] Ingresar notas"
	Escribir "[2] Mostrar notas y categorias"
	Escribir "[3] Estadisticas"
	Escribir "[4] Puntos Extras"
	Escribir "[5] Salir"
FinSubProceso


// Se creo una Funcion de seleccion Si o No
Funcion r <- pedirSiNo(mensaje)
	Definir r Como Caracter
	Repetir
		Escribir mensaje, " (si/no)"
		Leer r
		r <- Minusculas(r)
		Si r <> "si" Y r <> "no" Entonces
			Escribir "Respuesta no valida, escriba si o no"
		FinSi
	Hasta Que r = "si" O r = "no"
FinFuncion


// Se creo una funcion para la validacion de nota 
Funcion nota <- pedirNota(num)
	Definir nota Como Real
	Repetir
		Escribir "Ingrese la nota ", num, " (0 a 100): "
		Leer nota
		Si nota < 0 O nota > 100 Entonces
			Escribir "Error: la nota debe estar entre 0 y 100"
		FinSi
	Hasta Que nota >= 0 Y nota <= 100
FinFuncion


// Se creo una funcion para la clasificacion de notas
Funcion texto <- clasificar(nota)
	Definir texto Como Caracter
	Si nota >= 90 Entonces
		texto <- "Sobresaliente"
	Sino
		Si nota >= 76 Entonces
			texto <- "Notable"
		Sino
			Si nota >= 61 Entonces
				texto <- "Satisfactorio"
			Sino
				texto <- "Insuficiente"
			FinSi
		FinSi
	FinSi
FinFuncion


// Se creo un SubProceso por si todas las notas ingresadas son 0
SubProceso ingresarNotas(notas, extraDado, hayNotas Por Referencia)
	Definir i Como Entero
	Definir suma Como Real
	Definir seguro Como Caracter
	Repetir
		suma <- 0
		Para i <- 1 Hasta 5 Con Paso 1 Hacer
			notas[i] <- pedirNota(i)
			extraDado[i] <- Falso
			suma <- suma + notas[i]
		FinPara
		seguro <- "si"
		Si suma = 0 Entonces
			seguro <- pedirSiNo("Todas las notas son 0, ¿esta seguro de que son correctas?")
		FinSi
	Hasta Que seguro = "si"
	hayNotas <- Verdadero
	Escribir "Notas guardadas."
FinSubProceso


// Se creo una funcion para notas extra 
SubProceso mostrarNotas(notas, extraDado)
	Definir i Como Entero
	Para i <- 1 Hasta 5 Con Paso 1 Hacer
		Si extraDado[i] Entonces
			Escribir "Nota ", i, ": ", notas[i], " -> ", clasificar(notas[i]), " (con puntos extra)"
		Sino
			Escribir "Nota ", i, ": ", notas[i], " -> ", clasificar(notas[i])
		FinSi
	FinPara
FinSubProceso


// Se realizo subproceso para identificar la nota mayor, menor y el promedio de todas
SubProceso estadisticas(notas)
	Definir i Como Entero
	Definir suma, mayors, menors Como Real
	suma <- 0
	mayors <- notas[1]
	menors <- notas[1]
	Para i <- 1 Hasta 5 Con Paso 1 Hacer
		suma <- suma + notas[i]
		Si notas[i] > mayors Entonces
			mayors <- notas[i]			
		FinSi
		Si notas[i] < menor Entonces
			menor <- notas[i]
		FinSi
	FinPara
	Escribir "Promedio: ", suma / 5
	Escribir "Nota Mayor: " mayors
	Escribir "Nota Menor: " menors
FinSubProceso

Algoritmo notasGenerales
	
FinAlgoritmo
