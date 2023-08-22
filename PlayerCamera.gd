extends Camera2D

@export var player : Player

var player_body : CharacterBody2D


func _ready():
	player_body = player.movement_component

func _physics_process(_delta):
	global_position = player_body.global_position
