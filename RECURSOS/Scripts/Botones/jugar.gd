extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_pressed() -> void:
# Cargar la escena "NIVEL_1"
	get_tree().change_scene_to_file("res://RECURSOS/SCENAS/NIVEL_1.tscn")
