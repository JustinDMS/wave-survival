class_name Player
extends Node2D

signal points_changed(balance : int)
signal player_died

@export var hud : Control
@export var movement_component : CharacterBody2D
@export var balance_component : Node2D
@export var health_component : Node2D

@onready var projectile : PackedScene = preload("res://Projectile/projectile.tscn")


func _physics_process(delta):
	if health_component.status == health_component.DEAD:
		return
	
	movement_component.handle_movement(delta)


# Come up with a "Weapon Component" or something to move this to
# Weapon should have:
# - Type
# - Projectile
# - Ammo
func _unhandled_input(_event):
	if Input.is_action_just_pressed("attack") and not health_component.status == health_component.DEAD:
		var p = projectile.instantiate()
		owner.add_child(p)
		p.transform = movement_component.global_transform


func pointsChanged(balance):
	emit_signal("points_changed", balance)


func playerDied():
	emit_signal("player_died")
