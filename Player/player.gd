class_name Player
extends Node2D

signal points_changed(balance : int)
signal ammo_changed(current_clip : int, current_ammo : int)
signal player_died

@export var hud : Control
@export var movement_component : CharacterBody2D
@export var balance_component : Node2D
@export var health_component : Node2D
@export var weapon_component : Weapon


func _physics_process(delta):
	if health_component.status == health_component.DEAD:
		return
	
	movement_component.handle_movement(delta)


func _unhandled_input(event):
	if not health_component.status == health_component.DEAD:
		weapon_component.handle_attack(event, movement_component)
	get_viewport().set_input_as_handled()


func addAmmo(amount : int) -> void:
	weapon_component.ammo_component.ammoReceived(amount)


func pointsChanged(balance):
	emit_signal("points_changed", balance)


func ammoChanged(current_clip : int, current_ammo : int) -> void:
	emit_signal("ammo_changed", current_clip, current_ammo)


func playerDied():
	emit_signal("player_died")
