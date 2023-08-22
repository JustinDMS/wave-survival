class_name Enemy
extends Node2D

signal killed

@export var player : Player
@export var ai_component : Node2D

@export var value : int = 50


func _ready():
	killed.connect(Callable(get_parent(), "incrementEnemiesKilled"))


func _physics_process(delta):
	ai_component.handle_movement(player, delta)


func death():
	emit_signal("killed")
	player.balance_component.handle_transaction(value)
	queue_free()
