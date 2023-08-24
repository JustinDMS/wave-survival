extends CharacterBody2D

@export var move_speed : float = 100.0
@export var type : ai = ai.BASE

enum ai {BASE}

const MAX_MOVE_SPEED_VARIANCE : float = 100.0

func handle_movement(player : Player, _delta : float) -> void:
	match type:
		
		# Moves towards player at a constant rate
		ai.BASE:
			var direction : Vector2 = (player.movement_component.global_position - global_position).normalized()
			velocity = direction * (move_speed + randf_range(0.0, MAX_MOVE_SPEED_VARIANCE))
			look_at(player.movement_component.global_position)
	
	
	move_and_slide()
