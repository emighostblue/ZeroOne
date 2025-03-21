extends StaticBody2D

@onready var puerta_shape = $CollisionShape2D

func abrir_puerta():
	# Cambia la animación a "abierta" y desactiva la colisión
	$AnimationPlayer.play("abierta")
	puerta_shape.disabled = true  # Desactiva la colisión de la puerta
