class_name Drop
extends Node2D

signal picked_ammo(amount : int)

@export var drop_type : type
@export var amount : int = 1
@export_range(0, 100, 1) var drop_chance = 0

enum type {AMMO, HEALTH}


func _on_hitbox_area_entered(area):
	if area.owner is Player:
		print("Picked up drop")
		emit_signal("picked_ammo", amount)
		queue_free()
