extends CharacterBody2D

@export var move_speed : float = 200.0

func handle_movement(_delta):
	
	var direction : Vector2 = Vector2.ZERO
	
	if Input.is_action_pressed("move_up"):
		direction.y -= 1.0
	if Input.is_action_pressed("move_down"):
		direction.y += 1.0
	if Input.is_action_pressed("move_left"):
		direction.x -= 1.0
	if Input.is_action_pressed("move_right"):
		direction.x += 1.0
	
	look_at(get_global_mouse_position())
	direction = direction.normalized()
	velocity = direction * move_speed
	
	move_and_slide()
