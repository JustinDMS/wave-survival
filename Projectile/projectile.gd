class_name Projectile
extends Node2D

@export var projectile_speed : float = 1000.0
@export var max_travel_distance : float = 1000.0

var distance_traveled : float = 0.0

func _physics_process(delta):
	var new_pos : Vector2 = transform.x * projectile_speed * delta
	global_position += new_pos
	
	distance_traveled += new_pos.length()
	if distance_traveled > max_travel_distance:
		queue_free()


func projectileHit(_area):
	queue_free()
