extends Node2D
var botones_correctos = []  # Lista que tendrá los botones en el orden correcto
var botones_presionados = []  # Lista para ir almacenando los botones presionados por el jugador
var puerta : Node  # La puerta que se abrirá cuando el jugador complete correctamente el camino
var personaje : Node  # Tu personaje, si es necesario, para comprobar su posición
# Variables para los botones
@onready var boton = $boton  # Aquí asumimos que "Boton" es el nodo del botón en la escena.
@onready var boton2 = $boton2  # Asigna los nodos correspondientes para los botones 2 y 3
@onready var boton3 = $boton3
@onready var boton4 = $boton4
@onready var boton5 = $boton5
@onready var boton6 = $boton6
@onready var boton7 = $boton7
@onready var boton8 = $boton8
@onready var boton9 = $boton9
@onready var boton10 = $boton10
@onready var boton11 = $boton11

func _ready():
	# Método más seguro para asignar los botones correctos
	botones_correctos = []
	
	# Busca cada botón por su path
	var boton_node = get_node_or_null("boton")
	var boton2_node = get_node_or_null("boton2")
	var boton3_node = get_node_or_null("boton3")
	var boton4_node = get_node_or_null("boton4")
	var boton5_node = get_node_or_null("boton5")
	var boton6_node = get_node_or_null("boton6")
	var boton7_node = get_node_or_null("boton7")
	var boton8_node = get_node_or_null("boton8")
	var boton9_node = get_node_or_null("boton9")
	var boton10_node = get_node_or_null("boton10")
	var boton11_node = get_node_or_null("boton11")
	
	# Solo agrega los nodos que existan
	if boton_node:
		botones_correctos.append(boton_node)
		print("Botón 1 agregado:", boton_node)
	
	if boton2_node:
		botones_correctos.append(boton2_node)
		print("Botón 2 agregado:", boton2_node)
	
	if boton3_node:
		botones_correctos.append(boton3_node)
		print("Botón 3 agregado:", boton3_node)
		
	if boton4_node:
		botones_correctos.append(boton4_node)
		print("Botón 4 agregado:", boton4_node)
	
	if boton5_node:
		botones_correctos.append(boton5_node)
		print("Botón 5 agregado:", boton5_node)
		
	if boton6_node:
		botones_correctos.append(boton6_node)
		print("Botón 6 agregado:", boton6_node)
		
	if boton7_node:
		botones_correctos.append(boton7_node)
		print("Botón 47 agregado:", boton7_node)
		
	if boton8_node:
		botones_correctos.append(boton8_node)
		print("Botón 8 agregado:", boton8_node)
		
	if boton9_node:
		botones_correctos.append(boton9_node)
		print("Botón 9 agregado:", boton9_node)
		
	if boton10_node:
		botones_correctos.append(boton10_node)
		print("Botón 10 agregado:", boton10_node)
		
	if boton11_node:
		botones_correctos.append(boton11_node)
		print("Botón 11 agregado:", boton11_node)
	
	print("Total de botones correctos:", botones_correctos.size())
	
	# Si tienes la puerta como nodo, asigna su referencia
	puerta = get_node_or_null("Puerta")
	if puerta:
		puerta.set_collision_layer(1)
		print("Puerta configurada correctamente")
	else:
		print("ERROR: No se encontró el nodo Puerta")

func presionar_boton(boton_presionado):
	print("Botón presionado:", boton_presionado)
	
	# Verificación de seguridad - IMPORTANTE
	if botones_correctos.size() == 0:
		print("ERROR: La lista de botones correctos está vacía")
		return
	
	# Imprime el estado actual
	print("Botones presionados hasta ahora:", botones_presionados.size())
	print("Total de botones correctos:", botones_correctos.size())
	
	# Verifica que el índice no exceda el tamaño del array
	if botones_presionados.size() < botones_correctos.size():
		print("Comparando:", boton_presionado, "con", botones_correctos[botones_presionados.size()])
		
		if botones_correctos[botones_presionados.size()] == boton_presionado:
			# Si es correcto, se agrega a la lista de botones presionados
			botones_presionados.append(boton_presionado)
			print("¡Botón correcto!")
			
			# Si el jugador ha presionado todos los botones en orden correcto
			if botones_presionados.size() == botones_correctos.size():
				print("¡Todos los botones correctos! Abriendo puerta...")
				abrir_puerta()
		else:
			print("Botón incorrecto, reiniciando puzzle")
			reiniciar_puzzle()
	else:
		print("Ya se presionaron todos los botones correctos")

func reiniciar_puzzle():
	print("Reiniciando puzzle...")
	
	# Limpia la lista de botones presionados
	botones_presionados.clear()
	
	# Reinicia cada botón
	for boton in botones_correctos:
		if boton.has_method("cambiar_animacion"):
			print("Cambiando animación del botón a sin_presionar")
			boton.cambiar_animacion("sin_presionar")
		elif boton.has_node("AnimatedSprite2D"):
			print("Reproduciendo animación sin_presionar en AnimatedSprite2D")
			boton.get_node("AnimatedSprite2D").play("sin_presionar")
		else:
			print("ADVERTENCIA: No se pudo reiniciar visualmente el botón:", boton)

func abrir_puerta():
	if puerta == null:
		print("ERROR: Puerta no está asignada")
		return
		
	print("Abriendo puerta")
	puerta.set_collision_layer(0)
	
	# Verifica si puerta tiene una función cambiar_animacion
	if puerta.has_method("cambiar_animacion"):
		puerta.cambiar_animacion("abierta")
	# O si tiene un AnimatedSprite como hijo
	elif puerta.has_node("AnimatedSprite2D"):
		puerta.get_node("AnimatedSprite2D").play("abierta")
	else:
		print("ERROR: La puerta no tiene método para cambiar animación")
