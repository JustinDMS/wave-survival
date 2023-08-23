extends Node

@export var wave_manager : Node2D
@export var hud : Control
@export var game_over : Control


func _ready():
	startGame()


func startGame():
	wave_manager.startWave()


func showGameOver():
	hud.visible = false
	game_over.visible = true


func hideGameOver():
	hud.visible = true
	game_over.visible = false


func newGame():
	get_tree().reload_current_scene()
