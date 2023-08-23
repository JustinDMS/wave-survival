extends Node2D

@export_category("Config")
@export var use_time : float = 0 # Seconds
@export_enum("Single", "Scatter") var behavior : int
@export var scatter_count : int = 5
@export var scatter : float = 15.0 # Degrees
@export var projectile : PackedScene

var can_attack : bool = true

@onready var cooldown_timer = $Cooldown


func handle_attack(_event : InputEvent, movement_component) -> void:
	if not can_attack:
		return
	
	if _event.is_action("attack") and _event.is_pressed():
		match behavior:
			# Single
			0: fireSingle(movement_component)
			# Scatter
			1: fireScatter(movement_component)
		
		startCooldown()


func startCooldown():
	if use_time > 0.0:
		can_attack = false
		cooldown_timer.start(use_time)


func endCooldown():
	can_attack = true


func fireSingle(movement_component):
	var p = projectile.instantiate()
	owner.get_parent().add_child(p)
	p.transform = movement_component.global_transform


func fireScatter(movement_component):
	for i in range(0, scatter_count):
		var p = projectile.instantiate()
		owner.get_parent().add_child(p)
		p.transform = movement_component.global_transform
		
		# Set random rotation for projectile
		p.rotate(deg_to_rad(randf_range(-scatter/2, scatter/2)))
