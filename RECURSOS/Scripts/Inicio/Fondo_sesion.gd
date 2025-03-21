extends ParallaxBackground


# Called when the node enters the scene tree for the first time.
@export var speed: float = 80.0  # Velocidad del fondo

func _process(delta: float) -> void:
	scroll_offset.x -= speed * delta  # Desplazamiento horizontal
