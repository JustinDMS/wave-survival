class_name Player
extends Node2D

signal points_changed(balance : int)
signal player_died

@export var hud : Control
@export var movement_component : CharacterBody2D
@export var balance_component : Node2D
@export var health_component : Node2D
@export var weapon_component : Node2D


func _physics_process(delta):
	if health_component.status == health_component.DEAD:
		return
	
	movement_component.handle_movement(delta)


func _unhandled_input(event):
	if not health_component.status == health_component.DEAD:
		weapon_component.handle_attack(event, movement_component)
	get_viewport().set_input_as_handled()


func pointsChanged(balance):
	emit_signal("points_changed", balance)


func playerDied():
	emit_signal("player_died")
