extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0
@onready var Animated_Sprite_2d = $AnimatedSprite2D

var last_direction : Vector2 = Vector2.DOWN
var last_non_zero_direction : Vector2 = Vector2.DOWN
var joystick_direction : Vector2 = Vector2.ZERO # Declaración correcta

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var keyboard_direction : Vector2 = Input.get_vector("caminar_izquierda", "caminar_derecha", "caminar_arriba", "caminar_abajo")
	var combined_direction : Vector2 = keyboard_direction + joystick_direction

	if combined_direction != Vector2.ZERO:
		last_direction = combined_direction.normalized()
		last_non_zero_direction = last_direction

		if abs(last_direction.x) > abs(last_direction.y):
			if last_direction.x > 0:
				$AnimatedSprite2D.play("Caminar derecha")
			else:
				$AnimatedSprite2D.play("Caminar izquierda")
		else:
			if last_direction.y > 0:
				$AnimatedSprite2D.play("Caminar abajo")
			else:
				$AnimatedSprite2D.play("Caminar arriba")
	else:
		last_direction = Vector2.ZERO
		if abs(last_non_zero_direction.x) > abs(last_non_zero_direction.y):
			if last_non_zero_direction.x > 0:
				$AnimatedSprite2D.play("Estatico derecha")
			else:
				$AnimatedSprite2D.play("Estatico izquierda")
		else:
			if last_non_zero_direction.y > 0:
				$AnimatedSprite2D.play("Estatico abajo")
			else:
				$AnimatedSprite2D.play("Estatico arriba")

	velocity = last_direction * SPEED
	move_and_slide()

func _on_virtual_joystick_analogic_change(move : Vector2) -> void:
	joystick_direction = move
	if move.length() < 0.1:
		joystick_direction = Vector2.ZERO
