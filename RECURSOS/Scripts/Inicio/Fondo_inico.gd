extends ParallaxBackground

@export var speed: float = 80.0  # Velocidad del fondo

func _process(delta: float) -> void:
	scroll_offset.x -= speed * delta  # Desplazamiento horizontal


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://RECURSOS/SCENAS/INICIO.tscn")
	pass # Replace with function body.
