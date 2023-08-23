class_name Hitbox
extends Area2D

@export var health_component : Node2D


func _on_area_entered(area):
	if area is Hurtbox:
		health_component.takeDamage(area.damage)
