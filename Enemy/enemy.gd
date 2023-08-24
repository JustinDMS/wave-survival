class_name Enemy
extends Node2D

signal killed

@export var player : Player
@export var ai_component : Node2D

@export var value : int = 10

@export_category("Sound")
@export var stream : AudioStream


func _ready():
	killed.connect(Callable(get_parent(), "incrementEnemiesKilled"))


func _physics_process(delta):
	ai_component.handle_movement(player, delta)


func death():
	AudioManager.playRandomPitch(stream, 0.9, 1.0)
	emit_signal("killed")
	player.balance_component.handle_transaction(value)
	queue_free()
