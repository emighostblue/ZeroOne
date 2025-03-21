extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://RECURSOS/SCENAS/INICIO.tscn")
	pass # Replace with function body.


func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://RECURSOS/SCENAS/REGISTRO.tscn")
	pass # Replace with function body.
