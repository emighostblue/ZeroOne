extends Area2D

@export var boton_id: int  
var game_controller : Node
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D  

func _ready():
	animated_sprite = $AnimatedSprite2D
	game_controller = get_node("/root/NIVEL1")  # Asegúrate de que apunta al GameController

	print("GameController encontrado:", game_controller)

func cambiar_animacion(animacion: String):
	animated_sprite.play(animacion)  # Ahora se puede llamar desde el controlador de juego

func _on_body_entered(body):
	if body.is_in_group("Personaje"):
		print("✅ ¡Personaje entró en el botón!", self)
		cambiar_animacion("presionado")  
		game_controller.presionar_boton(self)  # Llamar a GameController

#func _on_body_exited(body):
	#if body.is_in_group("Personaje"):
		#cambiar_animacion("sin_presionar")
