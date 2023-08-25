class_name Enemy
extends Node2D

signal killed

@export var player : Player
@export var ai_component : Node2D

@export var value : int = 10

@export_category("Sound")
@export var stream : AudioStream
@export var min_pitch : float = 1.0
@export var max_pitch : float = 1.0


func _ready():
	killed.connect(Callable(get_parent(), "incrementEnemiesKilled"))


func _physics_process(delta):
	ai_component.handle_movement(player, delta)


func death():
	AudioManager.playModified(stream, min_pitch, max_pitch)
	emit_signal("killed")
	player.balance_component.handle_transaction(value)
	queue_free()
